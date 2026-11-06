package app.xiondigital.patches.tandem.clone

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.xiondigital.patches.tandem.shared.Constants.COMPATIBILITY_TANDEM_APK
import app.xiondigital.patches.tandem.shared.Constants.COMPATIBILITY_TANDEM_APKM
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

/** Application id of the build these patches are written against. */
private const val ORIGINAL_PACKAGE = "net.tandem"

/**
 * Default application id for the clone.
 *
 * It lives under the patch author's own namespace rather than under `net.tandem`, so a patched
 * build never looks like a Tandem-owned package to the store, to Play services or to the user.
 */
private const val DEFAULT_CLONE_PACKAGE = "app.xiondigital.tandem"

/** A legal Android application id: at least two segments, each starting with a lowercase letter. */
private val PACKAGE_ID_PATTERN = Regex("^[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+$")

/**
 * The option is declared by [clonePackagePatch] but read by its hidden bytecode dependency, which
 * runs before the resource patch itself. Options are resolved before any patch executes, so the
 * value is already final by the time either block reads it.
 */
private lateinit var clonePackageNameOption: Option<String>

private fun clonePackageName(): String = clonePackageNameOption.value!!

/**
 * Literals in Tandem's own dex that carry the package name and are resolved by value at runtime.
 *
 * Everything else that looks package-like in the dex is a type descriptor (`Lnet/tandem/...;`),
 * a kotlinx.serialization class name, a notification channel/group id (both of which Android scopes
 * to the package already), an MQTT topic or a navigation route key. None of those are matched
 * against the installed package name, and rewriting them would break serialization, channel history
 * or the server-side topic.
 *
 * The literals below are different: the framework, or the broadcast system, matches them against
 * something that is device-wide.
 *
 * - `net.tandem.fileprovider` is passed to `FileProvider.getUriForFile`, and the framework rejects
 *   an authority the calling package does not own.
 * - The two `android.resource://net.tandem/raw/...` URIs are the notification sounds installed with
 *   the chat and incoming-call channels; a renamed build can only resolve them by its own id.
 * - `net.tandem.call.ACTION_*` are the actions the in-call screen's dynamically registered receiver
 *   dispatches on (hang up, toggle mic, toggle camera). `sendBroadcast` is system-wide, so leaving
 *   them would let a call running in the clone toggle the microphone of a call running in the
 *   official app, and vice versa.
 * - `net.tandem.chat_ui.AUDIO_PLAYER_*` are the actions the chat audio player's receiver dispatches
 *   on. Same reasoning: the same broadcast reaches both installs.
 */
private val PACKAGE_AUTHORITY_AND_RESOURCE_LITERALS = listOf(
    "$ORIGINAL_PACKAGE.fileprovider",
    "android.resource://$ORIGINAL_PACKAGE/raw/sound_chat_received",
    "android.resource://$ORIGINAL_PACKAGE/raw/sound_call_incoming",
)

/** Broadcast actions Tandem's own receivers dispatch on, renamed so the two installs stay separate. */
private val PACKAGE_BROADCAST_ACTION_LITERALS = listOf(
    "$ORIGINAL_PACKAGE.call.ACTION_HANG_UP",
    "$ORIGINAL_PACKAGE.call.ACTION_TOGGLE_MIC",
    "$ORIGINAL_PACKAGE.call.ACTION_TOGGLE_CAM",
    "$ORIGINAL_PACKAGE.chat_ui.AUDIO_PLAYER_START",
    "$ORIGINAL_PACKAGE.chat_ui.AUDIO_PLAYER_STOP",
    "$ORIGINAL_PACKAGE.chat_ui.AUDIO_PLAYER_PAUSE",
    "$ORIGINAL_PACKAGE.chat_ui.AUDIO_PLAYER_RESUME",
)

/** Every dex literal the clone has to rewrite; each one is also an anchor that must still exist. */
private val PACKAGE_SCOPED_LITERALS =
    PACKAGE_AUTHORITY_AND_RESOURCE_LITERALS + PACKAGE_BROADCAST_ACTION_LITERALS

/**
 * Gives the patched build its own application id, so it installs next to the official Tandem app
 * instead of replacing it.
 *
 * Android identifies an installed app by the `package` attribute of its manifest. Every other
 * identifier the manifest derives from it has to move with it, or the clone either cannot be
 * installed next to the original or cannot use its own files:
 *
 * - **Declared permissions.** `net.tandem.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION` is a
 *   signature-level permission the app declares itself. A second app that declares that name with
 *   a different certificate is refused at install time, so the declaration and its
 *   `<uses-permission>` are both renamed. AndroidX derives the same name from
 *   `Context.getPackageName()` at runtime, so the rename stays consistent on both sides.
 * - **Provider authorities.** A provider authority is a device-wide name. Leaving
 *   `net.tandem.fileprovider` on both builds makes `getUriForFile` resolve the other app's
 *   provider — or fail — whichever was installed first, so the authorities are renamed with the
 *   package.
 * - **Task affinities.** `net.tandem.wxapi.WXEntryActivity` declares
 *   `android:taskAffinity="net.tandem"`. Task affinity is matched across packages, so a clone that
 *   kept the name could be handed the other install's task; it is renamed with the package.
 * - **Package-name literals in the dex.** Tandem compiles its FileProvider authority, its
 *   notification sound URIs and the actions its own receiver dispatches on in as strings instead of
 *   deriving them from the context, so the hidden bytecode dependency renames those literals.
 *
 * `android:process` names are deliberately left alone: there are none, and a process name is scoped
 * to the app's own uid anyway.
 *
 * What a renamed application id cannot carry over, because the platform binds it to the original
 * package and signing certificate: Google and Facebook sign-in, Firebase Cloud Messaging tokens,
 * Play Billing purchases and verified App Links. Tandem's own backend and its MQTT session are
 * package-agnostic and keep working.
 *
 * This patch is off by default: enabling it changes which app the user is installing, and existing
 * Tandem data cannot be migrated into it.
 */
@Suppress("unused")
val clonePackagePatch = resourcePatch(
    name = "Clone package",
    description = "Installs the patched build under its own application id (app.xiondigital.tandem " +
        "by default), so it can sit next to the official Tandem app instead of replacing and " +
        "conflicting with it. Off by default: a clone starts empty, and Google/Facebook sign-in, " +
        "push tokens, Play purchases and verified App Links stay bound to the original package.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TANDEM_APK, COMPATIBILITY_TANDEM_APKM)

    clonePackageNameOption = stringOption(
        key = "packageName",
        default = DEFAULT_CLONE_PACKAGE,
        title = "Package name",
        description = "Application id the patched build installs as. Must not be $ORIGINAL_PACKAGE.",
        required = true,
    ) { packageName ->
        packageName != null && packageName != ORIGINAL_PACKAGE && PACKAGE_ID_PATTERN.matches(packageName)
    }

    // Hidden: it has no name in the patch list, it only runs to keep the dex literals in step with
    // the manifest this patch is about to rewrite. It declares no `compatibleWith` of its own
    // because its parent has already matched the bundle, which makes it universal, and the patcher
    // refuses a universal patch that defaults to enabled.
    dependsOn(
        bytecodePatch(
            name = "Clone package (literals)",
            description = "Renames the package-name literals in Tandem's dex.",
            default = false,
        ) {
            execute {
                renamePackageScopedLiterals(clonePackageName())
            }
        },
    )

    // The manifest is rewritten last: the resources have been decoded by then, and the dependency
    // above has already edited the dex.
    finalize {
        val newPackageName = clonePackageName()
        document("AndroidManifest.xml").use { document ->
            document.renamePackage(newPackageName)
        }
    }
}

/**
 * Renames the application id and every manifest identifier that has to move with it.
 *
 * A split APK inside an APKM bundle carries a manifest without a `package` attribute — the base
 * APK owns it — so those are left untouched.
 */
private fun org.w3c.dom.Document.renamePackage(newPackageName: String) {
    val manifest = documentElement ?: error("AndroidManifest.xml has no <manifest> element.")
    val currentPackage = manifest.getAttribute("package")

    if (currentPackage.isEmpty()) return

    require(currentPackage == ORIGINAL_PACKAGE) {
        "AndroidManifest.xml declares '$currentPackage', not $ORIGINAL_PACKAGE; refusing to rename it."
    }

    manifest.setAttribute("package", newPackageName)

    // Custom permissions the app declares. A permission name that does not belong to the package
    // would collide with the original install, so an unexpected one is a hard failure instead of a
    // clone that cannot be installed next to Tandem.
    getElementsByTagName("permission").forEachElement { permission ->
        val name = permission.getAttribute("android:name")
        require(name.startsWith("$ORIGINAL_PACKAGE.")) {
            "Tandem declares the permission '$name', which is not namespaced under $ORIGINAL_PACKAGE. " +
                "A clone cannot redeclare it, so this build needs inspecting before it can be renamed."
        }
        permission.setAttribute("android:name", name.replacePackage(newPackageName))
    }

    getElementsByTagName("uses-permission").forEachElement { usesPermission ->
        val name = usesPermission.getAttribute("android:name")
        if (name.startsWith("$ORIGINAL_PACKAGE.")) {
            usesPermission.setAttribute("android:name", name.replacePackage(newPackageName))
        }
    }

    // Provider authorities are a device-wide namespace, and one element may declare several.
    getElementsByTagName("provider").forEachElement { provider ->
        val authorities = provider.getAttribute("android:authorities")
        if (authorities.isEmpty()) return@forEachElement

        provider.setAttribute(
            "android:authorities",
            authorities.split(';').joinToString(";") { authority ->
                authority.trim().replacePackage(newPackageName)
            },
        )
    }

    // Task affinity is matched across packages, so an activity that keeps Tandem's affinity can be
    // routed into the other install's task. Every activity that declares one is renamed; the empty
    // affinity some of them use means "no affinity" and is left as is.
    getElementsByTagName("activity").forEachElement { activity ->
        val affinity = activity.getAttribute("android:taskAffinity")
        if (affinity.isEmpty()) return@forEachElement

        activity.setAttribute("android:taskAffinity", affinity.replacePackage(newPackageName))
    }

    getElementsByTagName("activity-alias").forEachElement { alias ->
        val affinity = alias.getAttribute("android:taskAffinity")
        if (affinity.isEmpty()) return@forEachElement

        alias.setAttribute("android:taskAffinity", affinity.replacePackage(newPackageName))
    }
}

/**
 * Prefix-renames a package-owned identifier, leaving anything else (system permissions, URLs) as is.
 *
 * A bare `net.tandem` matches too: that is what the WXEntryActivity's task affinity is, and an
 * affinity has no dotted suffix to key on.
 */
private fun String.replacePackage(newPackageName: String): String = when {
    this == ORIGINAL_PACKAGE -> newPackageName
    startsWith("$ORIGINAL_PACKAGE.") -> newPackageName + removePrefix(ORIGINAL_PACKAGE)
    else -> this
}

/**
 * Rewrites [PACKAGE_SCOPED_LITERALS] in the dex to the clone's package name.
 *
 * The literal strings are the anchor: each one is expected to be present, so an app update that
 * changes them fails the patch here instead of silently shipping a clone whose FileProvider
 * authority or notification sounds point at the app it was cloned from.
 */
private fun BytecodePatchContext.renamePackageScopedLiterals(newPackageName: String) {
    var replacements = 0

    PACKAGE_SCOPED_LITERALS.forEach { literal ->
        val classes = classDefByStrings(literal, StringComparisonType.EQUALS)
        check(classes.isNotEmpty()) {
            "'$literal' is no longer in the dex; Tandem changed how it references its package " +
                "name, so the clone's literals need re-checking before this patch can be used."
        }

        classes.forEach { classDef ->
            replacements += replacePackageLiterals(classDef, newPackageName)
        }
    }

    check(replacements > 0) {
        "No package-name literal was rewritten; the clone would not be able to resolve its own " +
            "provider authority or notification sounds."
    }
}

/** Replaces every `const-string` in [classDef] that points at the package, returning how many. */
private fun BytecodePatchContext.replacePackageLiterals(
    classDef: ClassDef,
    newPackageName: String,
): Int {
    var replacements = 0

    mutableClassDefBy(classDef).methods.forEach { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@forEach

        instructions.forEachIndexed { index, instruction ->
            if (instruction.opcode != Opcode.CONST_STRING &&
                instruction.opcode != Opcode.CONST_STRING_JUMBO
            ) return@forEachIndexed

            val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                ?.string ?: return@forEachIndexed
            val renamed = renamedLiteral(value, newPackageName) ?: return@forEachIndexed

            val register = (instruction as OneRegisterInstruction).registerA
            // The opcode is repeated rather than picked freely: a jumbo reference stays jumbo, so
            // rewriting a literal never pushes a normal const-string past its 16-bit string index.
            val opcode = if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                "const-string/jumbo"
            } else {
                "const-string"
            }
            method.replaceInstruction(index, "$opcode v$register, \"${renamed.escapeForSmali()}\"")

            replacements++
        }
    }

    return replacements
}

/** The clone's form of a package-owned literal, or null when [value] is something else. */
private fun renamedLiteral(value: String, newPackageName: String): String? = when {
    value == "$ORIGINAL_PACKAGE.fileprovider" -> "$newPackageName.fileprovider"
    value.startsWith("android.resource://$ORIGINAL_PACKAGE/") ->
        "android.resource://$newPackageName/" + value.removePrefix("android.resource://$ORIGINAL_PACKAGE/")
    value in PACKAGE_BROADCAST_ACTION_LITERALS ->
        newPackageName + value.removePrefix(ORIGINAL_PACKAGE)
    else -> null
}

/** Escapes a string for a smali literal; these values are plain ASCII but stay correct if that changes. */
private fun String.escapeForSmali(): String = replace("\\", "\\\\").replace("\"", "\\\"")

/** Iterates a [org.w3c.dom.NodeList] of manifest elements as [Element]s. */
private inline fun org.w3c.dom.NodeList.forEachElement(action: (Element) -> Unit) {
    for (index in 0 until length) {
        (item(index) as? Element)?.let(action)
    }
}
