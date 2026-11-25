package app.bin0culars.patches.reddit.layout.statusbar

import app.bin0culars.patches.reddit.layout.glassnav.BottomNavBarFingerprint
import app.bin0culars.patches.reddit.layout.glassnav.fillBridge
import app.bin0culars.patches.reddit.layout.glassnav.findDrawBehind
import app.bin0culars.patches.reddit.layout.glassnav.glassNavigationPatch
import app.bin0culars.patches.reddit.layout.glassnav.orThrow
import app.bin0culars.patches.reddit.layout.glassnav.toSmali
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.NAVIGATION
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val seeThroughStatusBarPatch =
    patch(
        name = "See-through status bar",
        description = "Lets the home feed scroll up under the status bar, fading into it. Turn it on in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch, glassNavigationPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "see_through_status_bar",
                    section = NAVIGATION,
                    title = "See-through status bar",
                    summary = "The home feed scrolls up under the status bar and fades into it. Phone layout only; other screens keep the solid bar.",
                    default = false,
                ),
            )

            val scaffoldMethod = HomeScaffoldFingerprint.method
            hookSideLayout(scaffoldMethod)

            val sites = findPaddingSites(scaffoldMethod)
            val site1 = sites[0]
            val site2 = sites[1]

            hookAppBarBody(scaffoldMethod, site2)
            hookAppBarColor(scaffoldMethod, site2)
            hookFeedBox(scaffoldMethod, site1)

            fillDrawWithContentBridge()

            hookTopBarHeight(HomeTopBarHeightFingerprint.method)
        }
    }

private fun fillDrawWithContentBridge() {
    val bottomNavBarMethod = BottomNavBarFingerprint.method
    val bottomNavIndex = BottomNavBarFingerprint.instructionMatches.first().index
    val (_, drawBehindRef) = findDrawBehind(bottomNavBarMethod, bottomNavIndex)

    val bridgeSmali = """
        check-cast p0, ${drawBehindRef.parameterTypes[0]}
        invoke-static { p0, p1 }, ${drawBehindRef.toSmali()}
        move-result-object p0
        return-object p0
    """.trimIndent()
    fillBridge("drawWithContent", bridgeSmali, extensionClass = EXTENSION_CLASS)
}

private fun topBarHeightSmali(vR: Int): String = if (vR > 15) {
    """
        invoke-static/range { v$vR .. v$vR }, $EXTENSION_CLASS->topBarHeight(F)F
        move-result v$vR
    """.trimIndent()
} else {
    """
        invoke-static { v$vR }, $EXTENSION_CLASS->topBarHeight(F)F
        move-result v$vR
    """.trimIndent()
}

private fun hookTopBarHeight(method: MutableMethod) {
    val returnIndices = method.instructions.indices.filter { i ->
        method.instructions[i].opcode == Opcode.RETURN
    }
    if (returnIndices.isEmpty()) {
        throw PatchException("No RETURN instruction found in HomeTopBarHeightFingerprint.method")
    }
    for (i in returnIndices.reversed()) {
        val vR = (method.instructions[i] as? OneRegisterInstruction)?.registerA
            .orThrow("RETURN instruction at $i is not OneRegisterInstruction")
        method.addInstructions(i, topBarHeightSmali(vR))
    }
}

private fun isSideLayoutCall(inst: Instruction, composerType: String): Boolean {
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
    val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    val match = isStatic && ref.parameterTypes.size == 1 && ref.parameterTypes[0] == composerType
    return match && ref.returnType == "Z"
}

private fun hookSideLayout(method: MutableMethod) {
    val composerType = method.parameterTypes.getOrNull(18)?.toString()
        .orThrow("Method does not have at least 19 parameters")
    val matches = method.instructions.indices.filter { i ->
        isSideLayoutCall(method.instructions[i], composerType)
    }
    if (matches.size != 1) {
        throw PatchException("Expected exactly 1 sideLayout call, found ${matches.size}")
    }
    val mrIndex = matches[0] + 1
    val mrInst = method.instructions.getOrNull(mrIndex)
        .orThrow("Missing instruction after sideLayout invoke")
    if (mrInst.opcode != Opcode.MOVE_RESULT) {
        throw PatchException("Expected MOVE_RESULT after sideLayout invoke, found ${mrInst.opcode}")
    }
    val vZ = (mrInst as? OneRegisterInstruction)?.registerA
        .orThrow("sideLayout move-result is not OneRegisterInstruction")
    val smali = if (vZ > 15) {
        "invoke-static/range { v$vZ .. v$vZ }, $EXTENSION_CLASS->sideLayout(Z)V"
    } else {
        "invoke-static { v$vZ }, $EXTENSION_CLASS->sideLayout(Z)V"
    }
    method.addInstructions(mrIndex + 1, smali)
}
