package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.AMAZON_IN_COMPATIBILITY
import app.template.patches.shared.Constants.AMAZON_SHOPPING_COMPATIBILITY
import app.template.patches.shared.Constants.FLIPKART_COMPATIBILITY
import app.template.patches.shared.Constants.MEESHO_COMPATIBILITY
import app.template.patches.shared.Constants.MYNTRA_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element
import org.w3c.dom.NodeList

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/** Display name used for the renamed app, by original package name. */
private val APP_NAMES = mapOf(
    AMAZON_IN_COMPATIBILITY.packageName to "Amazon",
    AMAZON_SHOPPING_COMPATIBILITY.packageName to "Amazon",
    FLIPKART_COMPATIBILITY.packageName to "Flipkart",
    MYNTRA_COMPATIBILITY.packageName to "Myntra",
    MEESHO_COMPATIBILITY.packageName to "Meesho",
)

private lateinit var suffixOption: Option<String>
private lateinit var appNameOption: Option<String>

/** Authorities renamed by the manifest step (old -> new), used by the bytecode step. */
private val renamedAuthorities = LinkedHashMap<String, String>()

private fun NodeList.elements(): List<Element> =
    (0 until length).mapNotNull { item(it) as? Element }

/** Attribute lookup that works whether or not the decoded manifest is namespace aware. */
private fun Element.androidAttr(name: String): String =
    getAttributeNS(ANDROID_NS, name).ifEmpty { getAttribute("android:$name") }

private fun Element.setAndroidAttr(name: String, value: String) {
    if (hasAttribute("android:$name") || !hasAttributeNS(ANDROID_NS, name)) {
        setAttribute("android:$name", value)
    } else {
        setAttributeNS(ANDROID_NS, "android:$name", value)
    }
}

private fun isLauncherEntry(component: Element): Boolean {
    for (filter in component.getElementsByTagName("intent-filter").elements()) {
        val actions = filter.getElementsByTagName("action").elements().map { it.androidAttr("name") }
        val categories = filter.getElementsByTagName("category").elements().map { it.androidAttr("name") }
        if ("android.intent.action.MAIN" in actions && "android.intent.category.LAUNCHER" in categories) {
            return true
        }
    }
    return false
}

/**
 * Manifest step: new package name, unique provider authorities and permissions, and a
 * launcher label. Runs before the bytecode step below, which fixes up code that
 * hard-codes the old authorities.
 */
private val renameManifestPatch = resourcePatch {
    execute {
        val original = packageMetadata.packageName
        val newPackage = "$original.${suffixOption.value!!}"
        val label = appNameOption.value!!.takeIf { it != "Default" }
            ?: "${APP_NAMES[original] ?: original.substringAfterLast('.')} Sorted"

        val renamedPermissions = LinkedHashMap<String, String>()
        val authorityStrings = mutableSetOf<String>()

        fun renamePermission(old: String): String = when {
            old.startsWith(".") -> old
            old.startsWith("$original.") -> old.replaceFirst(original, newPackage)
            else -> "${newPackage}_$old"
        }

        fun renameAuthority(old: String): String = when {
            old.startsWith("$original.") -> old.replaceFirst(original, newPackage)
            else -> "${newPackage}_$old"
        }

        document("AndroidManifest.xml").use { doc ->
            doc.documentElement.setAttribute("package", newPackage)

            // Custom permissions declared by the app.
            for (tag in listOf("permission", "permission-tree", "permission-group")) {
                for (element in doc.getElementsByTagName(tag).elements()) {
                    val old = element.androidAttr("name")
                    if (old.isEmpty()) continue
                    val renamed = renamePermission(old)
                    renamedPermissions[old] = renamed
                    element.setAndroidAttr("name", renamed)
                }
            }

            // Everything that refers to one of those permissions.
            for (tag in listOf("uses-permission", "uses-permission-sdk-23")) {
                for (element in doc.getElementsByTagName(tag).elements()) {
                    renamedPermissions[element.androidAttr("name")]
                        ?.let { element.setAndroidAttr("name", it) }
                }
            }
            for (tag in listOf("activity", "activity-alias", "service", "receiver", "provider")) {
                for (element in doc.getElementsByTagName(tag).elements()) {
                    for (attr in listOf("permission", "readPermission", "writePermission")) {
                        renamedPermissions[element.androidAttr(attr)]
                            ?.let { element.setAndroidAttr(attr, it) }
                    }
                }
            }

            // Content provider authorities must be unique on the device.
            for (provider in doc.getElementsByTagName("provider").elements()) {
                val authorities = provider.androidAttr("authorities").split(';').filter { it.isNotEmpty() }
                if (authorities.isEmpty()) continue
                provider.setAndroidAttr(
                    "authorities",
                    authorities.joinToString(";") {
                        if (it.startsWith("@")) {
                            authorityStrings.add(it.removePrefix("@string/"))
                            it
                        } else {
                            renameAuthority(it).also { renamed -> renamedAuthorities[it] = renamed }
                        }
                    },
                )
            }

            // Launcher label: the application and every launcher entry point.
            doc.getElementsByTagName("application").elements().firstOrNull()?.setAndroidAttr("label", label)
            for (tag in listOf("activity", "activity-alias")) {
                for (element in doc.getElementsByTagName(tag).elements()) {
                    if (isLauncherEntry(element)) element.setAndroidAttr("label", label)
                }
            }
        }

        // Downloadable-font resources (res/font/*.xml) name the provider authority and its
        // package directly; point them at the renamed provider.
        val fontDir = get("res/font")
        if (fontDir.isDirectory) {
            fontDir.listFiles { file -> file.extension == "xml" }?.forEach { file ->
                document("res/font/${file.name}").use { doc ->
                    for (element in doc.getElementsByTagName("font-family").elements()) {
                        val attributes = element.attributes
                        for (i in 0 until attributes.length) {
                            val attr = attributes.item(i)
                            val value = attr.nodeValue
                            when {
                                attr.nodeName.endsWith("fontProviderAuthority") ->
                                    renamedAuthorities[value]?.let { attr.nodeValue = it }
                                attr.nodeName.endsWith("fontProviderPackage") && value == original ->
                                    attr.nodeValue = newPackage
                            }
                        }
                    }
                }
            }
        }

        // Authorities that live in string resources.
        if (authorityStrings.isNotEmpty()) {
            document("res/values/strings.xml").use { doc ->
                for (node in doc.getElementsByTagName("string").elements()) {
                    if (node.getAttribute("name") !in authorityStrings) continue
                    val old = node.textContent
                    val renamed = renameAuthority(old)
                    renamedAuthorities[old] = renamed
                    node.textContent = renamed
                }
            }
        }
    }
}

/** The new authority for a string constant, or null if the string is unrelated. */
private fun mapAuthorityString(value: String): String? {
    renamedAuthorities[value]?.let { return it }
    for (scheme in listOf("content://")) {
        if (!value.startsWith(scheme)) continue
        val rest = value.removePrefix(scheme)
        for ((old, new) in renamedAuthorities) {
            if (rest == old || rest.startsWith("$old/") || rest.startsWith("$old?")) {
                return scheme + new + rest.removePrefix(old)
            }
        }
    }
    return null
}

/**
 * Gives the patched app its own package name and launcher label so it installs next
 * to the original (unpatched) app instead of replacing it - like the YouTube and
 * YouTube Music builds. The same idea as the "Clone app" patch in the main Morphe
 * source (itself derived from ReVanced's "Change package name"), but it also renames
 * the app so the two icons are easy to tell apart.
 *
 * Besides the package, anything that has to be unique per install is renamed too:
 * provider authorities and custom permissions (Android refuses to install a second app
 * that declares the same ones). Apps that hard-code their authorities in code would
 * otherwise talk to the original app's providers, so those constants are rewritten.
 */
@Suppress("unused")
val installAlongsidePatch = bytecodePatch(
    name = "Install alongside original",
    description = "Installs the patched app under its own package name and app name, " +
        "so the original app stays installed. Push notifications and some " +
        "sign-in options may not work in the separate copy. Disable it to replace the original app instead.",
    default = true,
) {
    compatibleWith(
        AMAZON_IN_COMPATIBILITY,
        AMAZON_SHOPPING_COMPATIBILITY,
        FLIPKART_COMPATIBILITY,
        MYNTRA_COMPATIBILITY,
        MEESHO_COMPATIBILITY,
    )

    suffixOption = stringOption(
        key = "packageSuffix",
        default = "sorted",
        title = "Package name suffix",
        description = "Appended to the original package name, e.g. com.meesho.supply.sorted. " +
            "Every copy installed on a device needs a different suffix.",
        required = true,
    ) {
        it != null && it.matches(Regex("^[a-z][a-z0-9_]*$"))
    }

    appNameOption = stringOption(
        key = "appName",
        default = "Default",
        title = "App name",
        description = "Name shown under the launcher icon. \"Default\" adds \" Sorted\" to the original name.",
        required = true,
    )

    // Resource step first: it fills renamedAuthorities.
    dependsOn(renameManifestPatch)

    execute {
        if (renamedAuthorities.isEmpty()) return@execute

        classDefForEach { classDef ->
            var mutableClass: app.morphe.patcher.util.proxy.mutableTypes.MutableClass? = null

            for (method in classDef.methods) {
                val implementation = method.implementation ?: continue
                val edits = mutableListOf<Triple<Int, Int, String>>()

                implementation.instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.CONST_STRING &&
                        instruction.opcode != Opcode.CONST_STRING_JUMBO
                    ) {
                        return@forEachIndexed
                    }
                    val value = ((instruction as ReferenceInstruction).reference as? StringReference)?.string
                        ?: return@forEachIndexed
                    val replacement = mapAuthorityString(value) ?: return@forEachIndexed
                    edits += Triple(index, (instruction as OneRegisterInstruction).registerA, replacement)
                }
                if (edits.isEmpty()) continue

                val mutable = mutableClass ?: mutableClassDefBy(classDef).also { mutableClass = it }
                val signature = method.parameterTypes.map { it.toString() }
                val mutableMethod = mutable.methods.first {
                    it.name == method.name && it.returnType == method.returnType &&
                        it.parameterTypes.map { type -> type.toString() } == signature
                }
                for ((index, register, replacement) in edits) {
                    mutableMethod.replaceInstruction(index, "const-string v$register, \"$replacement\"")
                }
            }
        }
    }
}
