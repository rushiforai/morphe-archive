package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.findFieldFromToString
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** Keep an existing fullscreen watch player when the device rotates to portrait. */
internal val portraitFullscreenHookPatch = bytecodePatch {
    dependsOn(fullscreenHookPatch)
    execute {
        val state = Fingerprint(name = "toString", returnType = "Ljava/lang/String;", strings = listOf(
            "\n      FullscreenOrientationPolicyStateHolder {\n        initialConfigOrientation: ",
            ",\n        maintainWatchState: "
        )).method
        val maintain = state.findFieldFromToString(",\n        maintainWatchState: ")
        val configuration = Fingerprint(parameters = listOf("Landroid/content/res/Configuration;"),
            returnType = "V", filters = listOf(fieldAccess(opcode = Opcode.IGET_BOOLEAN, smali = maintain.smali))).method
        val sites = configuration.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.IGET_BOOLEAN &&
                (instruction as ReferenceInstruction).reference == maintain) index else null
        }
        require(sites.size == 2) { "Expected both native orientation transition guards" }
        sites.asReversed().forEach { index ->
            val register = (configuration.implementation!!.instructions[index] as TwoRegisterInstruction).registerA
            configuration.addInstructions(index + 1, """
                invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/playback/Fullscreen;->maintainFullscreenOnRotation(Z)Z
                move-result v$register
            """)
        }
        println("Afterglow portrait fullscreen: ${configuration.smali}, ${maintain.smali}")
    }
}
