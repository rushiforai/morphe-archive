package app.template.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_HELAKURU_LITE
import org.w3c.dom.Element
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val PHOTO_EXTENSION = "Lapp/template/extension/extension/HelakuruLitePersonalPhotoExtension;"

private val helakuruLitePersonalPhotoResourcesPatch = resourcePatch {
    execute {
        val picker = HelakuruLitePersonalPhotoPickerFingerprint.method
        val permissionChecks = picker.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            if ((instruction as? ReferenceInstruction)?.reference?.toString() ==
                "LE/j;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I") index else null
        }
        check(permissionChecks.size == 1) { "Expected one personal photo permission check" }
        val index = permissionChecks.single()
        val call = picker.implementation!!.instructions.elementAt(index) as FiveRegisterInstruction
        check(call.registerCount == 2) { "Unexpected personal photo permission check arguments" }
        picker.replaceInstruction(index,
            "invoke-static {v${call.registerC}, v${call.registerD}}, $PHOTO_EXTENSION->checkPickerPermission(Landroid/content/Context;Ljava/lang/String;)I")

        document("res/layout/activity_themes.xml").use { layout ->
            val androidNamespace = "http://schemas.android.com/apk/res/android"
            val root = layout.documentElement
            fun containsId(element: Element, id: String): Boolean {
                if (element.getAttributeNS(androidNamespace, "id").substringAfterLast("/") == id) return true
                return (0 until element.childNodes.length)
                    .mapNotNull { element.childNodes.item(it) as? Element }
                    .any { containsId(it, id) }
            }

            fun findSection(element: Element, id: String): Element? {
                val children = (0 until element.childNodes.length)
                    .mapNotNull { element.childNodes.item(it) as? Element }
                for (child in children) {
                    findSection(child, id)?.let { return it }
                }
                return if (element.tagName == "RelativeLayout" && containsId(element, id)) element else null
            }

            // The gallery has separate sections for Image Themes, Popular Themes, and
            // Personal Themes. Remove the first two while retaining the local photo flow.
            listOf("themes_list2", "themes_list4").forEach { id ->
                findSection(root, id)?.let { section ->
                    section.setAttributeNS(androidNamespace, "android:visibility", "gone")
                    section.setAttributeNS(androidNamespace, "android:layout_height", "0dp")
                }
            }
            // Personal themes are local now; remove their decorative PRO badge as well.
            findSection(root, "themes_list3")?.let { personalSection ->
                val badge = (0 until personalSection.childNodes.length)
                    .mapNotNull { personalSection.childNodes.item(it) as? Element }
                    .flatMap { child ->
                        listOf(child) + (0 until child.childNodes.length)
                            .mapNotNull { child.childNodes.item(it) as? Element }
                    }
                    .firstOrNull { it.getAttributeNS(androidNamespace, "text") == "PRO" }
                badge?.let {
                    it.setAttributeNS(androidNamespace, "android:visibility", "gone")
                    it.setAttributeNS(androidNamespace, "android:layout_width", "0dp")
                    it.setAttributeNS(androidNamespace, "android:layout_height", "0dp")
                }
            }
        }
    }
}

@Suppress("unused")
val helakuruLitePersonalPhotoThemesPatch = patch(
    name = "Personal Photo Themes (Helakuru Lite)",
    description = "Adds independent local photo backgrounds and hides the Pro image and Popular Themes catalogs.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HELAKURU_LITE)
    dependsOn(helakuruLitePersonalPhotoResourcesPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // Launch directly: resolveActivity() can hide installed picker providers.
        HelakuruLitePersonalPhotoLaunchFingerprint.method.addInstructions(
            0,
            "invoke-static {p0}, $PHOTO_EXTENSION->openPhotoPicker(Ljava/lang/Object;)V\nreturn-void"
        )

        // Intercept the URI before Lite creates or saves a Pro-gated photo model.
        HelakuruLitePersonalPhotoResultFingerprint.method.addInstructions(
            0,
            "invoke-static {p0, p1, p2, p3}, $PHOTO_EXTENSION->onPhotoResult(Ljava/lang/Object;IILandroid/content/Intent;)Z\n" +
                "move-result v0\n" +
                "if-eqz v0, :stock_photo_result\n" +
                "return-void\n" +
                ":stock_photo_result"
        )

        // Render after every root theme update, including keyboard recreation.
        val rootMethod = HelakuruLitePhotoRootThemeFingerprint.method
        val returns = rootMethod.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_VOID) index else null
        }
        returns.reversed().forEach { index ->
            rootMethod.addInstructions(index,
                "invoke-static {p0}, $PHOTO_EXTENSION->bindPhotoBackground(Ljava/lang/Object;)V")
        }

        HelakuruLiteThemeConfirmationFingerprint.method.addInstructions(
            0,
            "invoke-static {p0}, $PHOTO_EXTENSION->onThemeConfirmed(Ljava/lang/Object;)V"
        )
    }
}
