package app.saketh.patches.webnovel.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel

private const val SETTINGS = "Lapp/saketh/extension/controls/PatchSettings;"

internal val patchControlsRuntime = patch {
    extendWith("extensions/extension.mpe")

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.root.children.single { it.tag == "application" }.appendChild("activity") {
                setAttribute("android:name", "app.saketh.extension.controls.PatchControlsActivity")
                setAttribute("android:exported", "false")
                setAttribute("android:label", "Patch controls")
            }
        }
        resourceXml("res/layout/activity_setting.xml").use { layout ->
            layout.elementByAttribute("android:id", "@id/content_layout").insertChild(0, "TextView") {
                setAttribute("android:id", "@+id/saketh_patch_controls")
                setAttribute("android:layout_width", "match_parent")
                setAttribute("android:layout_height", "wrap_content")
                setAttribute("android:minHeight", "56dp")
                setAttribute("android:paddingStart", "16dp")
                setAttribute("android:paddingEnd", "16dp")
                setAttribute("android:gravity", "center_vertical")
                setAttribute("android:text", "Patch controls")
                setAttribute("android:textSize", "16sp")
                setAttribute("android:textColor", "@color/neutral_content")
                setAttribute("android:background", "@drawable/item_bg_transparent")
            }
        }
        mutableClassDefBy("Lcom/qidian/Int/reader/MainApplication;").methods.single {
            it.name == "onCreate" && it.parameterTypes.isEmpty()
        }.addInstructions(0, "invoke-static/range { p0 .. p0 }, $SETTINGS->initialize(Landroid/content/Context;)V")
        mutableClassDefBy("Lcom/qidian/Int/reader/SettingActivity;").methods.single {
            it.name == "onResume" && it.parameterTypes.isEmpty()
        }.addInstructions(0, "invoke-static/range { p0 .. p0 }, $SETTINGS->bindSettings(Landroid/app/Activity;)V")
    }
}

internal fun registerFeature(name: String) {
    resourceXml("AndroidManifest.xml").use { manifest ->
        manifest.root.children.single { it.tag == "application" }.appendChild("meta-data") {
            setAttribute("android:name", "saketh.patch.$name")
            setAttribute("android:value", "true")
        }
    }
}

internal fun MutableMethod.whenEnabled(setting: String, body: String, index: Int = 0) {
    val register = findFreeRegister(index)
    addInstructionsWithLabels(
        index,
        """
            invoke-static {}, $SETTINGS->$setting()Z
            move-result v$register
            if-eqz v$register, :original
            $body
        """,
        ExternalLabel("original", index),
    )
}

internal fun MutableMethod.hookAt(index: Int, code: String) {
    val original = implementation!!.instructions[index]
    val labels = original.location.labels.toList()
    addInstructions(index, code)
    val first = implementation!!.instructions[index].location
    // Existing branches must run the hook rather than skip it.
    labels.forEach { label ->
        original.location.labels.remove(label)
        first.labels.add(label)
    }
}
