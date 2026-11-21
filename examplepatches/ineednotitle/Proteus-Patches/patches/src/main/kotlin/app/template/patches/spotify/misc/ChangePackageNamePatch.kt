package app.template.patches.spotify.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.SPOTIFY_COMPATIBILITY
import app.template.patches.shared.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element
import org.w3c.dom.NodeList

private const val DEFAULT_PACKAGE_NAME = "com.spotify.music.morphe"
private const val DEFAULT_APP_NAME = "Spotify Morphe"

private val PACKAGE_NAME_REGEX = Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$")

// Install a cloned Spotify beside the official app.
//
// The manifest package, custom permissions, provider authorities and launcher
// label are rewritten in finalize{}, so every other patch still sees the
// original package name. DEX component class names are left alone (renaming
// android:name on components would produce ClassNotFoundException at startup).
//
// Four Spotify-specific details:
//   • Provider authorities are device-unique: keeping them causes
//     INSTALL_FAILED_CONFLICTING_PROVIDER. Authorities that are not derived
//     from the package name (e.g. com.spotify.mobile.android.mediaapi) are
//     prefixed with the new package name instead.
//   • Some authorities are given as @string/ references and are read through
//     R.string too, so the string resources are rewritten alongside.
//   • Custom permissions are device-unique as well: keeping them causes
//     INSTALL_FAILED_DUPLICATE_PERMISSION.
//   • The DEX itself references the authorities (content:// strings, IPC),
//     the custom permission names and its own package name as string
//     constants. Those constants are rewritten to the cloned values in
//     execute{}; without that pass the clone talks to the stock app's
//     providers or fails its IPC — the app "doesn't work" even though the
//     install succeeded (issue #51).
//
// Known limitations: the clone is re-signed, so Play Billing, Cast and Google
// sign-in may reject it — those flows are signature-bound and cannot be fixed
// in the manifest. Use the clone for side-by-side installs and testing.

@Suppress("unused")
val spotifyChangePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Changes the package name and app name so the patched app can be installed " +
        "alongside the original Spotify app.",
    default = false,
) {
    compatibleWith(SPOTIFY_COMPATIBILITY)

    val packageNameOption by stringOption(
        key = "spotifyPackageName",
        default = DEFAULT_PACKAGE_NAME,
        values = mapOf("Default" to DEFAULT_PACKAGE_NAME),
        title = "Package name",
        description = "The package name of the patched app. It must differ from the original one.",
        required = true,
    ) { it != null && PACKAGE_NAME_REGEX.matches(it) }

    val appNameOption by stringOption(
        key = "spotifyAppName",
        default = DEFAULT_APP_NAME,
        values = mapOf("Default" to DEFAULT_APP_NAME),
        title = "App name",
        description = "The name shown in the launcher.",
        required = true,
    ) { !it.isNullOrBlank() }

    // Captured so the DEX string pass below can run from execute{} (the same
    // pattern as the Instagram clone patch).
    var bytecodePatchContext: BytecodePatchContext? = null
    dependsOn(
        bytecodePatch {
            execute {
                bytecodePatchContext = this
            }
        },
    )

    // Old → new values for every device-unique identifier the manifest rewrite
    // renames, computed in execute{} and consumed by both the DEX pass and the
    // finalize{} manifest write.
    val stringRewrites = mutableListOf<Pair<String, String>>()
    var oldPackageName = ""

    execute {
        val newPackageName = packageNameOption ?: DEFAULT_PACKAGE_NAME

        // Read-only pass: collect every identifier that finalize{} renames.
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element
            oldPackageName = manifest.getAttribute("package")

            if (newPackageName == oldPackageName) {
                throw PatchException("The new package name must differ from \"$oldPackageName\"")
            }

            stringRewrites += oldPackageName to newPackageName

            val application = document.getElementsByTagName("application").item(0) as Element
            application.getElementsByTagName("provider").forEachElement { provider ->
                val authorities = provider.getAttribute("android:authorities")
                if (authorities.isEmpty()) return@forEachElement
                if (authorities.startsWith("@string/")) {
                    // Resolved from strings.xml below.
                    stringRewrites += "@string/${authorities.removePrefix("@string/")}" to "STRING_REF"
                } else {
                    authorities.split(';').forEach { authority ->
                        stringRewrites += authority to spotifyRenamedAuthority(oldPackageName, newPackageName, authority)
                    }
                }
            }
        }

        // Resolve @string/ authorities from their resource values.
        val stringRefs = stringRewrites.filter { it.second == "STRING_REF" }.map { it.first }
        if (stringRefs.isNotEmpty()) {
            stringRewrites.removeAll { it.second == "STRING_REF" }
            document("res/values/strings.xml").use { strings ->
                strings.getElementsByTagName("string").forEachElement { string ->
                    val name = string.getAttribute("name")
                    if ("@string/$name" !in stringRefs) return@forEachElement
                    string.textContent.split(';').forEach { authority ->
                        stringRewrites += authority to spotifyRenamedAuthority(oldPackageName, newPackageName, authority)
                    }
                }
            }
        }

        // Custom permissions are renamed in finalize{} once the declared set
        // is known; collect them here with the same predicate.
        document("AndroidManifest.xml").use { document ->
            document.getElementsByTagName("permission").forEachElement { permission ->
                val name = permission.getAttribute("android:name")
                if (name.startsWith(oldPackageName)) {
                    stringRewrites += name to spotifyRenamed(oldPackageName, newPackageName, name)
                }
            }
        }

        // DEX string pass: authorities (bare and content:// forms), permission
        // names and the bare package name.
        val context = checkNotNull(bytecodePatchContext) {
            "BytecodePatchContext was not initialized before Change package name execute block"
        }
        try {
            transformStringReferences(context, stringRewrites, oldPackageName)
        } finally {
            bytecodePatchContext = null
        }
    }

    // Finalize so other patches still see the original package name.
    finalize {
        val newPackageName = packageNameOption ?: DEFAULT_PACKAGE_NAME
        val appName = appNameOption ?: DEFAULT_APP_NAME

        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element
            val originalPackageName = manifest.getAttribute("package")

            if (newPackageName == originalPackageName) {
                throw PatchException("The new package name must differ from \"$originalPackageName\"")
            }

            fun renamed(value: String) = spotifyRenamed(originalPackageName, newPackageName, value)

            // Authorities not based on the package name (e.g.
            // com.spotify.mobile.android.mediaapi) still collide with the
            // original app, so they get the new package name as prefix.
            fun renamedAuthority(value: String) =
                spotifyRenamedAuthority(originalPackageName, newPackageName, value)

            manifest.setAttribute("package", newPackageName)

            // Custom permissions are unique per device: keeping them causes
            // INSTALL_FAILED_DUPLICATE_PERMISSION.
            val declaredPermissions = mutableSetOf<String>()
            document.getElementsByTagName("permission").forEachElement { permission ->
                val name = permission.getAttribute("android:name")
                if (name.startsWith("$originalPackageName.")) declaredPermissions += name
            }

            // Provider authorities are unique per device: keeping them causes
            // INSTALL_FAILED_CONFLICTING_PROVIDER. Only the app's own providers
            // are rewritten, not the <queries> entries that point at other apps.
            val application = document.getElementsByTagName("application").item(0) as Element
            val authorityStrings = mutableSetOf<String>()
            application.getElementsByTagName("provider").forEachElement { provider ->
                val authorities = provider.getAttribute("android:authorities")
                when {
                    authorities.isEmpty() -> Unit
                    // The app reads these through R.string too, so the string
                    // itself is renamed below.
                    authorities.startsWith("@string/") -> authorityStrings += authorities.removePrefix("@string/")
                    else -> provider.setAttribute(
                        "android:authorities",
                        authorities.split(';').joinToString(";") { renamedAuthority(it) },
                    )
                }
            }

            if (authorityStrings.isNotEmpty()) {
                document("res/values/strings.xml").use { strings ->
                    val found = mutableSetOf<String>()
                    strings.getElementsByTagName("string").forEachElement { string ->
                        val name = string.getAttribute("name")
                        if (name in authorityStrings) {
                            string.textContent = string.textContent.split(';')
                                .joinToString(";") { renamedAuthority(it) }
                            found += name
                        }
                    }
                    val missing = authorityStrings - found
                    if (missing.isNotEmpty()) {
                        throw PatchException("Provider authority strings not found: $missing")
                    }
                }
            }

            val permissionAttributes = listOf(
                "android:name",
                "android:permission",
                "android:readPermission",
                "android:writePermission",
            )
            document.getElementsByTagName("*").forEachElement { element ->
                permissionAttributes.forEach { attribute ->
                    val value = element.getAttribute(attribute)
                    if (value in declaredPermissions) element.setAttribute(attribute, renamed(value))
                }
            }

            // Launcher name: the application and every component that inherits
            // its label.
            val appLabel = application.getAttribute("android:label")
            application.setAttribute("android:label", appName)
            if (appLabel.isNotEmpty()) {
                listOf("activity", "activity-alias").forEach { tag ->
                    application.getElementsByTagName(tag).forEachElement { component ->
                        if (component.getAttribute("android:label") == appLabel) {
                            component.setAttribute("android:label", appName)
                        }
                    }
                }
            }
        }
    }
}

/** Pure: package-prefixed rename ("com.spotify.music.x" → "<new>.x"). */
internal fun spotifyRenamed(oldPackageName: String, newPackageName: String, value: String): String =
    if (value.startsWith("$oldPackageName.")) newPackageName + value.removePrefix(oldPackageName) else value

/** Pure: authority rename — package-derived values move with the package, all others get it as prefix. */
internal fun spotifyRenamedAuthority(oldPackageName: String, newPackageName: String, value: String): String =
    if (value.startsWith("$oldPackageName.")) {
        spotifyRenamed(oldPackageName, newPackageName, value)
    } else {
        "$newPackageName.$value"
    }

/** Pure: the rewritten form of a DEX string constant, or null to leave it alone. */
internal fun spotifyStringTransform(
    value: String,
    rewrites: List<Pair<String, String>>,
    oldPackageName: String,
): String? {
    if (value == oldPackageName) return rewrites.firstOrNull { it.first == oldPackageName }?.second
    for ((old, new) in rewrites) {
        if (value == old) return new
        if (value.startsWith("content://$old")) return value.replaceFirst(old, new)
    }
    return null
}

private fun transformStringReferences(
    patchContext: BytecodePatchContext,
    rewrites: List<Pair<String, String>>,
    oldPackageName: String,
) {
    patchContext.getAllClassesWithStrings().forEach { classDef ->
        if (classDef.type.startsWith("Lapp/template/extension/")) return@forEach

        val mutableClass by lazy {
            patchContext.mutableClassDefBy(classDef)
        }

        for (method in classDef.methods) {
            val impl = method.implementation ?: continue
            val replacements = mutableListOf<Pair<Int, BuilderInstruction>>()
            impl.instructions.forEachIndexed { index, instruction ->
                val string = instruction.getReference<StringReference>()?.string ?: return@forEachIndexed
                val transformed = spotifyStringTransform(string, rewrites, oldPackageName) ?: return@forEachIndexed
                val register = (instruction as? OneRegisterInstruction)?.registerA ?: return@forEachIndexed
                val replacement = when (instruction.opcode) {
                    Opcode.CONST_STRING -> BuilderInstruction21c(
                        Opcode.CONST_STRING,
                        register,
                        ImmutableStringReference(transformed),
                    )
                    Opcode.CONST_STRING_JUMBO -> BuilderInstruction31c(
                        Opcode.CONST_STRING_JUMBO,
                        register,
                        ImmutableStringReference(transformed),
                    )
                    else -> return@forEachIndexed
                }
                replacements += index to replacement
            }
            if (replacements.isEmpty()) continue
            val mutableMethod = mutableClass.methods.first {
                it.name == method.name &&
                    it.parameterTypes.map { p -> p.toString() } == method.parameterTypes.map { p -> p.toString() } &&
                    it.returnType == method.returnType
            }
            replacements.forEach { (index, replacement) ->
                mutableMethod.replaceInstruction(index, replacement)
            }
        }
    }
}

private inline fun NodeList.forEachElement(block: (Element) -> Unit) {
    for (index in 0 until length) {
        (item(index) as? Element)?.let(block)
    }
}
