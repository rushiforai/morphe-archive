package app.fblite.patches.coexist

import app.fblite.patches.settings.morpheSettingsPatch
import app.fblite.patches.shared.Constants.COMPATIBILITY_FACEBOOK_LITE
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Attr
import org.w3c.dom.Element
import java.util.logging.Logger

private const val ORIGINAL_PACKAGE = "com.facebook.lite"
private const val SHARED_RENAME_PREFIX = "app.morphefblite."
private const val FACEBOOK_PREFIX = "com.facebook."

private val logger = Logger.getLogger("CloneInstallPatch")

/** Original provider authority to the clone's; filled by the resource patch. */
private val originalAuthorities = mutableMapOf<String, String>()
private val PACKAGE_NAME_REGEX = Regex("^[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+$")

private val DECLARATION_TAGS = setOf("permission", "permission-tree", "permission-group")
private val CLASS_TAGS = setOf("application", "activity", "activity-alias", "service", "receiver", "provider")
private val CLASS_ATTRIBUTES = listOf(
    "android:targetActivity",
    "android:parentActivityName",
    "android:backupAgent",
    "android:manageSpaceActivity",
)

/** Attributes whose value is a name owned by the package; renamed when it starts with the original package. */
private val OWNED_NAME_ATTRIBUTES = setOf(
    "android:permission",
    "android:readPermission",
    "android:writePermission",
    "android:taskAffinity",
    "android:process",
)

private val clonePackageOption = stringOption(
    key = "Clone package name",
    default = "com.facebook.litd",
    title = "Clone package name",
    description = "Package name of the second copy. It must have exactly ${ORIGINAL_PACKAGE.length} characters (the " +
        "same as com.facebook.lite) so names hardcoded in the app can be rewritten in place, and it should differ " +
        "from com.facebook.lite only in the last character, which keeps the rewritten code valid. Lowercase letters, " +
        "digits and underscores in parts split by dots, and not com.facebook.lite.",
    required = true,
    validator = {
        it != null && it != ORIGINAL_PACKAGE && it.length == ORIGINAL_PACKAGE.length && PACKAGE_NAME_REGEX.matches(it)
    },
)

private val cloneNameOption = stringOption(
    key = "Clone app name",
    default = "Facebook Lite 2",
    title = "Clone app name",
    description = "Name shown under the clone's icon and in the system settings.",
    required = true,
    validator = { !it.isNullOrBlank() },
)

private fun absoluteClassName(name: String) = when {
    name.startsWith(".") -> ORIGINAL_PACKAGE + name
    !name.contains('.') -> "$ORIGINAL_PACKAGE.$name"
    else -> name
}

/**
 * Permission names are unique across all installed apps, and Android refuses an install whose manifest
 * declares a name another app already declares. So every permission the app declares gets a name of
 * the clone's own, wherever it came from (including the names "Install beside Meta's apps" chose).
 */
private fun clonePermissionName(name: String, newPackage: String) = when {
    name.startsWith("$ORIGINAL_PACKAGE.") -> newPackage + name.removePrefix(ORIGINAL_PACKAGE)
    name.startsWith(SHARED_RENAME_PREFIX) -> "$newPackage.${name.removePrefix(SHARED_RENAME_PREFIX)}"
    name.startsWith(FACEBOOK_PREFIX) -> "$newPackage.${name.removePrefix(FACEBOOK_PREFIX)}"
    else -> "$newPackage.$name"
}

/**
 * An authority of the clone: the original with its last character moved on (a to b, z to a, 0 to 1, 9 to 0). Only the
 * last character changes so the dex's sorted string table stays sorted when the extension rewrites the names at run
 * time; the extension undoes this with the inverse.
 */
private fun clonedAuthority(authority: String): String? {
    if (!authority.startsWith("$ORIGINAL_PACKAGE.")) return null
    val last = when (val c = authority.last()) {
        in 'a'..'y', in 'A'..'Y', in '0'..'8' -> c + 1
        'z' -> 'a'
        'Z' -> 'A'
        '9' -> '0'
        else -> return null
    }
    return authority.dropLast(1) + last
}

private fun swapPrefix(value: String, newPackage: String) =
    if (value == ORIGINAL_PACKAGE || value.startsWith("$ORIGINAL_PACKAGE.")) newPackage + value.removePrefix(ORIGINAL_PACKAGE)
    else value

private fun isLauncher(element: Element): Boolean {
    val categories = element.getElementsByTagName("category")
    return (0 until categories.length).any {
        (categories.item(it) as Element).getAttribute("android:name") == "android.intent.category.LAUNCHER"
    }
}

private fun renamedString(value: String, newPackage: String): String? {
    if (value == ORIGINAL_PACKAGE) return newPackage
    originalAuthorities[value]?.let { return it }
    if (value.startsWith("content://")) {
        val rest = value.removePrefix("content://")
        val authority = rest.substringBefore('/')
        val renamed = originalAuthorities[authority]
        if (renamed != null) return "content://" + renamed + rest.removePrefix(authority)
    }
    return null
}

/**
 * The app's own (primary) dex hardcodes the original package name, its provider authorities and content URIs
 * (for example the phone id store keeps `device_id` in a settings file named after the package). Rewrite them
 * to the clone's. The big secondary dex cannot be patched here; the extension rewrites it at run time.
 */
private fun BytecodePatchContext.rewriteHardcodedNames(newPackage: String) {
    val classes = LinkedHashSet<ClassDef>()
    (originalAuthorities.keys + ORIGINAL_PACKAGE).forEach { classes += classDefByStrings(it) }
    classes += classDefByStrings("content://$ORIGINAL_PACKAGE", StringComparisonType.STARTS_WITH)

    var changed = 0
    for (classDef in classes) {
        if (classDef.type.startsWith("Lapp/fblite/extension/")) continue
        for (method in mutableClassDefBy(classDef).methods) {
            val implementation = method.implementation ?: continue
            val instructions = implementation.instructions
            for (index in instructions.indices) {
                val instruction = instructions[index]
                if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) continue
                val value = ((instruction as ReferenceInstruction).reference as StringReference).string
                val replacement = renamedString(value, newPackage) ?: continue
                val register = (instruction as OneRegisterInstruction).registerA
                val escaped = replacement.replace("\\", "\\\\").replace("\"", "\\\"")
                method.replaceInstruction(index, "const-string v$register, \"$escaped\"")
                changed++
            }
        }
    }
    logger.info("Rewrote $changed hardcoded package names in the app's own dex")
}

private val clonePackagePatch = resourcePatch {
    dependsOn(installBesideMetaAppsPatch)

    val packageOption by clonePackageOption()
    val nameOption by cloneNameOption()

    execute {
        val newPackage = packageOption ?: throw PatchException("No clone package name")
        val newName = nameOption ?: throw PatchException("No clone app name")
        val labelStrings = mutableSetOf<String>()
        originalAuthorities.clear()

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val oldPackage = manifest.getAttribute("package")
            if (oldPackage != ORIGINAL_PACKAGE) {
                throw PatchException("Expected the manifest package $ORIGINAL_PACKAGE, found $oldPackage")
            }

            val nodes = document.getElementsByTagName("*")
            val elements = (0 until nodes.length).map { nodes.item(it) as Element }

            // Class names written relative to the package would resolve against the new package.
            for (element in elements) {
                if (element.tagName in CLASS_TAGS) {
                    val name = element.getAttribute("android:name")
                    if (name.isNotEmpty() && absoluteClassName(name) != name) element.setAttribute("android:name", absoluteClassName(name))
                }
                for (attribute in CLASS_ATTRIBUTES) {
                    val value = element.getAttribute(attribute)
                    if (value.isNotEmpty() && absoluteClassName(value) != value) element.setAttribute(attribute, absoluteClassName(value))
                }
            }

            val permissionRenames = elements
                .filter { it.tagName in DECLARATION_TAGS }
                .map { it.getAttribute("android:name") }
                .filter { it.isNotEmpty() }
                .associateWith { clonePermissionName(it, newPackage) }

            var authorities = 0
            for (element in elements) {
                val attributes = element.attributes
                for (index in 0 until attributes.length) {
                    val attribute = attributes.item(index) as? Attr ?: continue
                    val value = attribute.value
                    val renamed = permissionRenames[value]
                    when {
                        renamed != null -> attribute.value = renamed
                        attribute.name == "android:authorities" && element.tagName == "provider" -> {
                            attribute.value = value.split(';').joinToString(";") { authority ->
                                val renamed = clonedAuthority(authority)
                                if (renamed != null) {
                                    authorities++
                                    originalAuthorities[authority] = renamed
                                    renamed
                                } else {
                                    logger.warning("Provider authority kept as is: $authority")
                                    authority
                                }
                            }
                        }
                        attribute.name in OWNED_NAME_ATTRIBUTES -> attribute.value = swapPrefix(value, newPackage)
                        element.tagName.startsWith("uses-permission") && attribute.name == "android:name" ->
                            attribute.value = swapPrefix(value, newPackage)
                    }
                }
            }
            logger.info("Renamed ${permissionRenames.size} permission declarations and $authorities authorities")

            val application = document.getElementsByTagName("application").item(0) as Element
            fun relabel(element: Element) {
                val label = element.getAttribute("android:label")
                if (label.isEmpty()) return
                if (label.startsWith("@string/")) labelStrings += label.removePrefix("@string/")
                element.setAttribute("android:label", newName)
            }
            relabel(application)
            for (element in elements) {
                if ((element.tagName == "activity" || element.tagName == "activity-alias") && isLauncher(element)) relabel(element)
            }

            // The patcher renames the resource package from this attribute.
            manifest.setAttribute("package", newPackage)
        }

        if (labelStrings.isNotEmpty()) {
            get("res", false).listFiles { file -> file.isDirectory && (file.name == "values" || file.name.startsWith("values-")) }
                ?.forEach { folder ->
                    if (!folder.resolve("strings.xml").isFile) return@forEach
                    document("res/${folder.name}/strings.xml").use { strings ->
                        val list = strings.getElementsByTagName("string")
                        for (index in 0 until list.length) {
                            val string = list.item(index) as Element
                            if (string.getAttribute("name") in labelStrings) string.textContent = newName
                        }
                    }
                }
        }
    }

    finalize {
        // The shortcut file of "Morphe settings" names the package it targets; patches run in either order.
        val newPackage = packageOption ?: return@finalize
        val shortcuts = get("res/xml/morphe_shortcuts.xml", false)
        if (shortcuts.isFile) {
            shortcuts.writeText(
                shortcuts.readText().replace("android:targetPackage=\"$ORIGINAL_PACKAGE\"", "android:targetPackage=\"$newPackage\"")
            )
        }
    }
}

@Suppress("unused")
val cloneInstallPatch = bytecodePatch(
    name = "Clone install",
    description = "Installs the patched app as a second copy next to the first, under an app name and package name " +
        "you choose. The first start after installing only sets up; names hardcoded in the app's code are fixed " +
        "from the second start.",
    default = false
) {
    compatibleWith(COMPATIBILITY_FACEBOOK_LITE)

    dependsOn(installBesideMetaAppsPatch, clonePackagePatch, morpheSettingsPatch)

    extendWith("extensions/extension.mpe")

    // Shown here; the resource patch above reads the same options.
    val packageOption by clonePackageOption()
    cloneNameOption()

    execute {
        rewriteHardcodedNames(packageOption ?: throw PatchException("No clone package name"))
    }
}
