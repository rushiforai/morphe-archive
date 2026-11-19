package app.smartlife.patches.smartlife.layout.scene

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.smartlife.patches.smartlife.misc.fix.signature.spoofSignaturePatch
import app.smartlife.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import app.smartlife.patches.smartlife.shared.logInfo
import app.smartlife.patches.smartlife.shared.logWarning
import app.smartlife.patches.smartlife.shared.matchAllLogged
import app.smartlife.patches.smartlife.shared.signature
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION_CLASS = "Lapp/smartlife/extension/SmartLifeSettings;"

/** Smart App tab type in 7.12.0 / 7.12.6, used only if it cannot be read from the app. */
private const val DEFAULT_SMART_APP_TAB_TYPE = 3

@Suppress("unused")
val hideSmartAppTabPatch = bytecodePatch(
    name = "Hide Smart App tab",
    description = "Hides the \"Smart App\" tab (AI app builder) at the top of the smart tab. " +
        "This is a runtime toggle in the in-app \"SmartLife Patches\" settings screen. " +
        "Hidden by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE)

    // Provides the extension and the captured app context.
    dependsOn(spoofSignaturePatch)

    execute {
        val tabType = smartAppTabType()

        // Every class implementing the (unobfuscated) ISceneTabContainer interface: filter the
        // tab map (tab type -> tab config) right before each Map -> Map method returns it.
        val containers = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (SCENE_TAB_CONTAINER in classDef.interfaces) containers += classDef
        }

        var hooked = 0
        containers.forEach { container ->
            mutableClassDefBy(container).methods
                .filter {
                    it.implementation != null && it.returnType == "Ljava/util/Map;" &&
                        it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/util/Map;")
                }
                .forEach { method ->
                    val registerCount = method.implementation!!.registerCount
                    // Walk backwards so inserting does not shift the indices still to visit.
                    method.instructions.withIndex()
                        .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                        .map { it.index }
                        .reversed()
                        .forEach { index ->
                            val mapRegister = (method.instructions[index] as OneRegisterInstruction).registerA
                            // Every register except the returned one is dead at a return.
                            val typeRegister = if (mapRegister == 0) 1 else 0
                            if (registerCount < 2 || mapRegister > 15) {
                                logWarning("Scene tab container ${method.signature}: no free register at return")
                                return@forEach
                            }
                            method.addInstructions(
                                index,
                                """
                                    const/16 v$typeRegister, $tabType
                                    invoke-static { v$mapRegister, v$typeRegister }, $EXTENSION_CLASS->filterSceneTabs(Ljava/util/Map;I)Ljava/util/Map;
                                    move-result-object v$mapRegister
                                """,
                            )
                            hooked++
                        }
                    logInfo("Scene tab container hooked: ${method.signature}")
                }
        }

        if (hooked == 0) {
            throw PatchException(
                "Hide Smart App tab: no ISceneTabContainer Map -> Map method found " +
                    "(containers: ${containers.map { it.type }})"
            )
        }
    }
}

/**
 * Read the Smart App tab type from the code around "scene_smart_app_tab_dot_dismissed": the
 * nearest integer constant before that string is the tab type the app compares against
 * (either `indexOf(Integer.valueOf(3))` or `if (selectedType != 3)`).
 */
private fun BytecodePatchContext.smartAppTabType(): Int {
    val found = matchAllLogged(SmartAppTabDotFingerprint, "Smart App tab dot").mapNotNull { match ->
        val instructions = match.originalMethod.implementation?.instructions?.toList()
            ?: return@mapNotNull null
        val stringIndex = instructions.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string ==
                "scene_smart_app_tab_dot_dismissed"
        }
        (stringIndex - 1 downTo maxOf(0, stringIndex - 8))
            .map { instructions[it] }
            .firstOrNull { it is NarrowLiteralInstruction && it.opcode.name.startsWith("const") }
            ?.let { (it as NarrowLiteralInstruction).narrowLiteral }
            ?.takeIf { it in 1..0x7fff }
    }

    val tabType = found.groupingBy { it }.eachCount().maxByOrNull { it.value }?.key
    if (tabType == null) {
        logWarning("Smart App tab type not found in the app; using $DEFAULT_SMART_APP_TAB_TYPE")
        return DEFAULT_SMART_APP_TAB_TYPE
    }
    if (found.toSet().size > 1) {
        logWarning("Smart App tab type is ambiguous: $found; using $tabType")
    }
    logInfo("Smart App tab type: $tabType")
    return tabType
}
