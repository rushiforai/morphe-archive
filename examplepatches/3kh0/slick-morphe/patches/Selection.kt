package slick.android

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal val SLACK =
    Compatibility(
        name = "Slack",
        packageName = "com.Slack",
        targets = listOf(AppTarget(version = "26.11.30.0")),
    )

// Only the aggregate is recommended. Named dependencies remain selectable in Expert mode.
internal fun slackPatch(
    name: String,
    description: String,
    vararg settings: String,
    block: BytecodePatchBuilder.() -> Unit,
) = bytecodePatch(name = name, description = description, default = false) {
    compatibleWith(SLACK)
    dependsOn(modMenu)
    block()
    finalize {
        // Keep availability in this APK, rather than in preferences left by an older install.
        method("Lslick/android/Settings;", "patched").run {
            val previous = code.mapNotNull { (it.ref as? StringReference)?.string }.single()
            val value = previous + settings.joinToString("") { "$it|" }
            removeInstructions(0, code.size)
            addInstructions(0, "const-string v0, \"$value\"\nreturn-object v0")
        }
    }
}
