package app.vantage.patches.claude

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val ORIGINAL_PACKAGE = "com.anthropic.claude"
private const val EXT = "Lapp/vantage/extension/claude"
private const val BADGE_CLASS = "$EXT/CloneBadge;"
private const val BUILD_VALUES_TYPE = "$EXT/BuildValues;"
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

private val hexColor = Regex("^#[0-9A-Fa-f]{6}([0-9A-Fa-f]{2})?$")
private val packageNameRule = Regex("^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+$")

/** Application.onCreate; the badge registers its lifecycle callback from there. */
private object ApplicationOnCreateFingerprint : Fingerprint(
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
    custom = { _, classDef ->
        classDef.superclass?.contains("Landroid/app/Application;") == true
    },
)

/**
 * Bytecode half: start the badge from Application.onCreate and bake the label
 * into BuildValues. Anonymous; it runs as a dependency of the named patch and
 * reads that patch's options at execution time.
 */
private val cloneBadgeBytecodePatch =
    bytecodePatch {
        // Merges the compiled extension (extensions/claude) into the app's dex.
        extendWith("extensions/claude.mpe")

        execute {
          try {
            val label = (cloneWithBadgePatch.options["badgeNumber"]?.value as? Int)?.toString() ?: ""

            val onCreate = try {
                ApplicationOnCreateFingerprint.method
            } catch (e: Exception) {
                throw PatchException("Application.onCreate not found: $e")
            }
            onCreate.apply {
                // Right after the mandatory invoke-super in onCreate.
                val superIndex = implementation!!.instructions.indexOfFirst {
                    it.opcode.name == "invoke-super"
                }
                if (superIndex < 0) throw PatchException("Application.onCreate has no invoke-super")
                // Reuse whatever register the app passed `this` in for invoke-super.
                val selfRegister = (implementation!!.instructions.elementAt(superIndex) as FiveRegisterInstruction).registerC
                addInstruction(
                    superIndex + 1,
                    "invoke-static { v$selfRegister }, $BADGE_CLASS->init(Landroid/app/Application;)V",
                )
            }

            val buildValues = try {
                mutableClassDefBy(BUILD_VALUES_TYPE)
            } catch (e: Exception) {
                throw PatchException("extension class $BUILD_VALUES_TYPE not merged: $e")
            }
            val getter = buildValues.methods.firstOrNull { it.name == "badgeLabel" }
                ?: throw PatchException("BuildValues.badgeLabel not found in the extension")
            val count = getter.implementation?.instructions?.count() ?: 0
            if (count != 2) throw PatchException("BuildValues.badgeLabel has $count instructions, expected 2")
            val escaped = label.replace("\\", "\\\\").replace("\"", "\\\"")
            getter.replaceInstruction(0, "const-string v0, \"$escaped\"")
          } catch (e: Throwable) {
            throw PatchException("badge bytecode step failed: " + e.stackTraceToString().lines().take(12).joinToString(" | "))
          }
        }
    }

/**
 * Renames the app so several copies can be installed side by side, relabels it,
 * recolors and numbers its launcher icon, and pins a small pill with the same
 * number to the top corner of every screen so the copies can be told apart
 * while in use.
 */
@Suppress("unused")
val cloneWithBadgePatch: ResourcePatch =
    resourcePatch(
        name = "Clone with badge",
        description = "Installable copy of the app under a new package name, with its own label, " +
            "a recolored and numbered icon, and a corner pill showing the number in-app.",
    ) {
        compatibleWith(ORIGINAL_PACKAGE)
        dependsOn(cloneBadgeBytecodePatch)

        val packageName by stringOption(
            key = "packageName",
            default = "$ORIGINAL_PACKAGE.two",
            title = "Package name",
            description = "Package name of the copy. Must differ from the original and from every other copy.",
            required = true,
        ) { it != null && packageNameRule.matches(it) && it != ORIGINAL_PACKAGE }

        val appLabel by stringOption(
            key = "appLabel",
            default = "Claude 2",
            title = "App label",
            description = "Launcher name of the copy.",
            required = true,
        ) { !it.isNullOrBlank() }

        // An integer on purpose: morphe-cli parses a bare digit on the command
        // line as a number and silently ignores it for a string option.
        val badgeNumber by intOption(
            key = "badgeNumber",
            default = 2,
            title = "Badge number",
            description = "Number shown in the corner pill and stamped on the icon (1-9).",
            required = true,
        ) { it != null && it in 1..9 }

        val iconColor by stringOption(
            key = "iconColor",
            default = "#0E7C7B",
            title = "Icon color",
            description = "Launcher icon background color (#RRGGBB), also used for the digit on the icon.",
            required = true,
        ) { it != null && hexColor.matches(it) }

        execute {
            val newPackage = packageName!!
            renamePackage(newPackage)
            setAppLabel(appLabel!!)
            replaceLauncherIcon(iconColor!!, badgeNumber!!.toString())
        }
    }

// ---- manifest -------------------------------------------------------------

private fun app.morphe.patcher.patch.ResourcePatchContext.renamePackage(newPackage: String) {
    document("AndroidManifest.xml").use { doc ->
        val manifest = doc.documentElement
        val oldPackage = manifest.getAttribute("package")
        if (oldPackage.isEmpty()) throw PatchException("manifest has no package attribute")
        if (oldPackage == newPackage) throw PatchException("packageName must differ from $oldPackage")
        manifest.setAttribute("package", newPackage)

        fun rebase(value: String): String? = when {
            value == oldPackage -> newPackage
            value.startsWith("$oldPackage.") -> newPackage + value.substring(oldPackage.length)
            value.startsWith("${oldPackage}_") -> newPackage + value.substring(oldPackage.length)
            else -> null
        }

        val permissionElements = setOf("permission", "uses-permission", "uses-permission-sdk-23", "permission-group")
        val prefixedAttributes = listOf("permission", "readPermission", "writePermission", "taskAffinity", "process", "sharedUserId")

        fun walk(node: Node) {
            if (node is Element) {
                // Content provider authorities must be unique per device. Ones
                // derived from the package move with it; foreign ones (library
                // defaults such as androidx.car.app.connection) get a package prefix.
                if (node.hasAttribute("android:authorities")) {
                    val authorities = node.getAttribute("android:authorities")
                    val rewritten = authorities.split(";").joinToString(";") { auth ->
                        rebase(auth) ?: "${newPackage}_$auth"
                    }
                    node.setAttribute("android:authorities", rewritten)
                }
                // Custom permissions declared by the app carry its package name;
                // component class names also start with it and must stay untouched,
                // so android:name is only rebased inside permission elements.
                if (node.tagName in permissionElements && node.hasAttribute("android:name")) {
                    rebase(node.getAttribute("android:name"))?.let {
                        node.setAttribute("android:name", it)
                    }
                }
                for (attr in prefixedAttributes) {
                    if (node.hasAttribute("android:$attr")) {
                        rebase(node.getAttribute("android:$attr"))?.let {
                            node.setAttribute("android:$attr", it)
                        }
                    }
                }
            }
            var child = node.firstChild
            while (child != null) {
                walk(child)
                child = child.nextSibling
            }
        }
        walk(manifest)
    }
}

// ---- label ----------------------------------------------------------------

private fun app.morphe.patcher.patch.ResourcePatchContext.setAppLabel(label: String) {
    document("res/values/strings.xml").use { doc ->
        val strings = doc.getElementsByTagName("string")
        var found = false
        for (i in 0 until strings.length) {
            val el = strings.item(i) as Element
            if (el.getAttribute("name") == "app_name") {
                el.textContent = label
                found = true
            }
        }
        if (!found) throw PatchException("res/values/strings.xml has no app_name string")
    }
}

// ---- icon -----------------------------------------------------------------

private fun app.morphe.patcher.patch.ResourcePatchContext.replaceLauncherIcon(color: String, badgeLabel: String) {
    val colorName = "vantage_clone_bg"
    val fgName = "vantage_clone_fg"
    val badgeName = "vantage_clone_badge"

    // Background color as a resource so the adaptive icon can reference it.
    val colorsFile = get("res/values/colors.xml", false)
    if (!colorsFile.exists()) {
        colorsFile.parentFile.mkdirs()
        colorsFile.writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n</resources>\n")
    }
    document("res/values/colors.xml").use { doc ->
        val root = doc.documentElement
        val existing = doc.getElementsByTagName("color")
        for (i in 0 until existing.length) {
            val el = existing.item(i) as Element
            if (el.getAttribute("name") == colorName) root.removeChild(el)
        }
        val el = doc.createElement("color")
        el.setAttribute("name", colorName)
        el.textContent = color
        root.appendChild(el)
    }

    // Badge: a white circle with the digit in the icon color, bottom-right of
    // the safe zone. Labels that are not a single digit 1-9 get no badge on the
    // icon (the in-app pill still shows them).
    val digit = DigitPaths.forLabel(badgeLabel)
    val badgeXml = buildString {
        append("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n")
        append("<vector xmlns:android=\"$ANDROID_NS\" android:width=\"108dp\" android:height=\"108dp\" ")
        append("android:viewportWidth=\"108\" android:viewportHeight=\"108\">\n")
        if (digit != null) {
            append("    <path android:fillColor=\"#FFFFFFFF\" android:pathData=\"M69,69 m-13,0 a13,13 0 1,0 26,0 a13,13 0 1,0 -26,0\"/>\n")
            append("    <path android:fillColor=\"$color\" android:pathData=\"$digit\"/>\n")
        }
        append("</vector>\n")
    }
    get("res/drawable/$badgeName.xml", false).writeText(badgeXml)

    // Foreground: the original mark with the badge layered on top.
    get("res/drawable/$fgName.xml", false).writeText(
        """
        <?xml version="1.0" encoding="utf-8"?>
        <layer-list xmlns:android="$ANDROID_NS">
            <item android:drawable="@drawable/ic_launcher_foreground"/>
            <item android:drawable="@drawable/$badgeName"/>
        </layer-list>
        """.trimIndent() + "\n",
    )

    val adaptive = """
        <?xml version="1.0" encoding="utf-8"?>
        <adaptive-icon xmlns:android="$ANDROID_NS">
            <background android:drawable="@color/$colorName"/>
            <foreground android:drawable="@drawable/$fgName"/>
        </adaptive-icon>
    """.trimIndent() + "\n"
    val iconDir = get("res/mipmap-anydpi", false)
    val launcher = iconDir.resolve("ic_launcher.xml")
    if (!launcher.exists()) throw PatchException("res/mipmap-anydpi/ic_launcher.xml not found; the app no longer uses an adaptive icon")
    launcher.writeText(adaptive)
    val round = iconDir.resolve("ic_launcher_round.xml")
    if (round.exists()) round.writeText(adaptive)
    val foreground = get("res/drawable/ic_launcher_foreground.xml", false)
    if (!foreground.exists()) throw PatchException("res/drawable/ic_launcher_foreground.xml not found")
}
