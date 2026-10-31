package gcam.clone

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element
import java.util.logging.Logger

private const val STOCK_PACKAGE = "com.google.android.GoogleCamera"
private const val CLONE_PACKAGE = "com.google.android.GoogleCameraEng"

private val PACKAGE_NAME_REGEX = Regex("^[a-zA-Z]\\w*(\\.[a-zA-Z]\\w*)+$")

/** Manifest tags whose class-name attributes must keep pointing at the original classes. */
private val COMPONENT_TAGS = setOf(
    "application", "activity", "activity-alias", "service", "receiver", "provider", "instrumentation"
)
private val CLASS_ATTRIBUTES = setOf(
    "android:name", "android:targetActivity", "android:backupAgent",
    "android:manageSpaceActivity", "android:parentActivityName", "android:appComponentFactory"
)

private val logger = Logger.getLogger("gcam.clone")

/**
 * What the resource step renamed, so the bytecode step can update matching strings in code.
 */
private class RenamePlan(val oldPackage: String, val newPackage: String) {
    /** Declared permission names (old -> new). */
    val permissions = mutableMapOf<String, String>()

    /** Provider authorities (old -> new). */
    val authorities = mutableMapOf<String, String>()

    /**
     * Names under the old package keep their suffix (`old.fileprovider` -> `new.fileprovider`).
     * Anything else gets a `new_` prefix so it can't clash with the stock app on install.
     */
    fun rename(name: String) =
        if (name == oldPackage || name.startsWith("$oldPackage.")) newPackage + name.removePrefix(oldPackage)
        else "${newPackage}_$name"

    /** Rename an arbitrary attribute value, or return it unchanged. */
    fun renameValue(value: String) = permissions[value] ?: authorities[value] ?: when {
        value == oldPackage -> newPackage
        value.startsWith("$oldPackage:") -> newPackage + value.removePrefix(oldPackage) // process names
        else -> value
    }
}

private var renamePlan: RenamePlan? = null

/** Visit this element and all descendants, skipping subtrees where [skip] is true. */
private fun Element.walk(skip: (Element) -> Boolean = { false }, action: (Element) -> Unit) {
    if (skip(this)) return
    action(this)
    val children = childNodes
    for (i in 0 until children.length) {
        (children.item(i) as? Element)?.walk(skip, action)
    }
}

private fun Element.attributePairs(): List<Pair<String, String>> {
    val attrs = attributes
    return (0 until attrs.length).map { attrs.item(it).nodeName to attrs.item(it).nodeValue }
}

private fun Element.isLauncherComponent(): Boolean {
    var launcher = false
    walk { el ->
        if (el.tagName == "category" && el.getAttribute("android:name") == "android.intent.category.LAUNCHER") {
            launcher = true
        }
    }
    return launcher
}

@Suppress("unused")
val cloneGoogleCameraPatch = bytecodePatch(
    name = "Clone Google Camera",
    description = "Changes the package name (default com.google.android.GoogleCameraEng) so the patched app " +
            "installs next to the stock Google Camera. Renames provider authorities and custom permissions " +
            "in the manifest and the matching strings in code.",
    default = true
) {
    compatibleWith(STOCK_PACKAGE, CLONE_PACKAGE)

    val packageName by stringOption(
        key = "packageName",
        default = CLONE_PACKAGE,
        title = "Package name",
        description = "Package name for the cloned app. Must differ from any Google Camera already installed.",
        required = true
    ) { it != null && PACKAGE_NAME_REGEX.matches(it) }

    val appLabel by stringOption(
        key = "appLabel",
        default = null,
        title = "App name",
        description = "Optional launcher name for the clone, for example \"Camera Eng\". " +
                "Leave empty to keep the original name."
    )

    val renameCodeReferences by booleanOption(
        key = "renameCodeReferences",
        default = true,
        title = "Rename package name in code",
        description = "Replaces hard-coded references to the old package name in code, so internal intents " +
                "open the clone instead of the stock app."
    )

    dependsOn(resourcePatch {
        execute {
            val oldPackage = packageMetadata.packageName
            val newPackage = packageName!!

            if (oldPackage == newPackage) {
                logger.info("Package is already $newPackage, nothing to rename.")
                renamePlan = null
                return@execute
            }

            val plan = RenamePlan(oldPackage, newPackage)
            val stringAuthorityNames = mutableSetOf<String>()

            document("AndroidManifest.xml").use { document ->
                val root = document.documentElement

                // Pass 1: collect what this app declares.
                root.walk { el ->
                    when (el.tagName) {
                        "permission", "permission-group", "permission-tree" -> {
                            val name = el.getAttribute("android:name")
                            if (name.isNotEmpty() && !name.startsWith(".")) plan.permissions[name] = plan.rename(name)
                        }

                        "provider" -> el.getAttribute("android:authorities")
                            .split(';').map { it.trim() }.filter { it.isNotEmpty() }
                            .forEach { authority ->
                                if (authority.startsWith("@string/")) {
                                    stringAuthorityNames += authority.removePrefix("@string/")
                                } else {
                                    plan.authorities[authority] = plan.rename(authority)
                                }
                            }
                    }
                }

                // Authorities stored as string resources are renamed in strings.xml.
                if (stringAuthorityNames.isNotEmpty() && get("res/values/strings.xml").exists()) {
                    document("res/values/strings.xml").use { strings ->
                        strings.documentElement.walk { el ->
                            if (el.tagName == "string" && el.getAttribute("name") in stringAuthorityNames) {
                                val authority = el.textContent.trim()
                                val renamed = plan.rename(authority)
                                plan.authorities[authority] = renamed
                                el.textContent = renamed
                            }
                        }
                    }
                }

                // Pass 2: rewrite. <queries> lists other apps, so it is left alone.
                root.setAttribute("package", newPackage)
                root.walk(skip = { it.tagName == "queries" }) { el ->
                    val isComponent = el.tagName in COMPONENT_TAGS

                    el.attributePairs().forEach { (name, value) ->
                        when {
                            // Relative class names (".Foo" or "Foo") resolve against the manifest
                            // package, so expand them to keep pointing at the original classes.
                            isComponent && name in CLASS_ATTRIBUTES -> when {
                                value.startsWith(".") -> el.setAttribute(name, oldPackage + value)
                                value.isNotEmpty() && !value.contains('.') -> el.setAttribute(name, "$oldPackage.$value")
                            }

                            name == "android:authorities" -> el.setAttribute(
                                name,
                                value.split(';').joinToString(";") { plan.authorities[it.trim()] ?: it }
                            )

                            name != "package" -> {
                                val renamed = plan.renameValue(value)
                                if (renamed != value) el.setAttribute(name, renamed)
                            }
                        }
                    }
                }

                // Optional launcher name, so the two cameras can be told apart.
                val label = appLabel?.trim()
                if (!label.isNullOrEmpty()) {
                    root.walk { el ->
                        val isLauncher = (el.tagName == "activity" || el.tagName == "activity-alias") &&
                                el.hasAttribute("android:label") && el.isLauncherComponent()
                        if (el.tagName == "application" || isLauncher) el.setAttribute("android:label", label)
                    }
                }
            }

            // res/xml*: shortcuts (android:targetPackage), searchable configs, etc.
            val keys = listOf(oldPackage) + plan.permissions.keys + plan.authorities.keys
            get("res").listFiles { dir -> dir.isDirectory && (dir.name == "xml" || dir.name.startsWith("xml-")) }
                ?.forEach { dir ->
                    dir.listFiles { file -> file.isFile && file.extension == "xml" }?.forEach { file ->
                        val text = file.readText()
                        if (keys.none { text.contains(it) }) return@forEach

                        document("res/${dir.name}/${file.name}").use { document ->
                            document.documentElement.walk { el ->
                                el.attributePairs().forEach { (name, value) ->
                                    val renamed = plan.renameValue(value)
                                    if (renamed != value) el.setAttribute(name, renamed)
                                }
                            }
                        }
                    }
                }

            logger.info(
                "Renamed $oldPackage -> $newPackage " +
                        "(${plan.authorities.size} authorities, ${plan.permissions.size} permissions)"
            )
            renamePlan = plan
        }
    })

    execute {
        val plan = renamePlan ?: return@execute

        val exact = buildMap {
            putAll(plan.permissions)
            putAll(plan.authorities)
            if (renameCodeReferences != false) put(plan.oldPackage, plan.newPackage)
        }
        val uriPrefixes = plan.authorities.map { (from, to) -> "content://$from" to "content://$to" }

        fun transform(value: String): String? {
            exact[value]?.let { return it }
            for ((from, to) in uriPrefixes) {
                if (value.startsWith(from) && (value.length == from.length || value[from.length] == '/')) {
                    return to + value.substring(from.length)
                }
            }
            return null
        }

        val candidates = LinkedHashMap<String, ClassDef>()
        exact.keys.forEach { key ->
            getAllClassesWithString(key).forEach { candidates[it.type] = it }
        }
        uriPrefixes.forEach { (from, _) ->
            classDefByStrings(from, StringComparisonType.STARTS_WITH).forEach { candidates[it.type] = it }
        }

        var replaced = 0
        candidates.values.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach

                val edits = method.instructions.mapIndexedNotNull { index, instruction ->
                    if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) {
                        return@mapIndexedNotNull null
                    }
                    val value = ((instruction as ReferenceInstruction).reference as StringReference).string
                    val renamed = transform(value) ?: return@mapIndexedNotNull null
                    Triple(index, instruction, renamed)
                }

                edits.forEach { (index, instruction, renamed) ->
                    val register = (instruction as OneRegisterInstruction).registerA
                    val reference = ImmutableStringReference(renamed)
                    method.replaceInstruction(
                        index,
                        if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                            BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, reference)
                        } else {
                            BuilderInstruction21c(Opcode.CONST_STRING, register, reference)
                        }
                    )
                    replaced++
                }
            }
        }

        logger.info("Updated $replaced string constants in ${candidates.size} classes")
    }
}
