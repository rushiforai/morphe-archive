package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HOME_TAB_MODEL_TYPE =
    "Lcom/reddit/feedslegacy/switcher/homepager/model/HomePagerScreenTabUiModel;"
private const val TEXT_MIN_PARAMS = 20
private const val TEXT_FONT_SIZE_PARAM_INDEX = 3
private const val TEXT_LINE_HEIGHT_PARAM_INDEX = 10

private data class TabLabelSite(
    val classDef: ClassDef,
    val methodName: String,
    val paramTypes: List<String>,
    val returnType: String,
    val textIndices: List<Int>,
)

private fun isLabelLambdaInit(inst: Instruction): MethodReference? {
    val isDirect = inst.opcode == Opcode.INVOKE_DIRECT || inst.opcode == Opcode.INVOKE_DIRECT_RANGE
    val ref = if (isDirect) (inst as? ReferenceInstruction)?.reference as? MethodReference else null
    val p = ref?.parameterTypes
    return ref?.takeIf {
        it.name == "<init>" &&
            it.returnType == "V" &&
            p != null &&
            p.size == 2 &&
            p[0].toString() == "Ljava/lang/Object;" &&
            p[1].toString() == "I"
    }
}

private fun isTabModelStringGet(inst: Instruction): Boolean {
    val ref = if (inst.opcode == Opcode.IGET_OBJECT) {
        (inst as? ReferenceInstruction)?.reference as? FieldReference
    } else {
        null
    }
    return ref != null && ref.definingClass == HOME_TAB_MODEL_TYPE && ref.type == "Ljava/lang/String;"
}

private fun isComposeTextCall(inst: Instruction): Boolean {
    val ref = if (inst.opcode == Opcode.INVOKE_STATIC_RANGE) {
        (inst as? ReferenceInstruction)?.reference as? MethodReference
    } else {
        null
    }
    val p = ref?.parameterTypes
    return ref != null &&
        p != null &&
        ref.returnType == "V" &&
        p.size >= TEXT_MIN_PARAMS &&
        p[0].toString() == "Ljava/lang/String;" &&
        p.getOrNull(TEXT_FONT_SIZE_PARAM_INDEX)?.toString() == "J" &&
        p.getOrNull(TEXT_LINE_HEIGHT_PARAM_INDEX)?.toString() == "J" &&
        p.last().toString() == "I"
}

private fun findTabLabelInMethod(labelClass: ClassDef, method: Method): TabLabelSite? {
    val instructions = method.implementation?.instructions?.toList() ?: return null
    val textIndices = instructions.indices
        .filter { isTabModelStringGet(instructions[it]) }
        .mapNotNull { igetIdx ->
            ((igetIdx + 1) until instructions.size)
                .takeWhile { !isReturnOrThrow(instructions[it].opcode) }
                .firstOrNull { isComposeTextCall(instructions[it]) }
        }
        .distinct()
    return if (textIndices.isEmpty()) {
        null
    } else {
        TabLabelSite(
            classDef = labelClass,
            methodName = method.name,
            paramTypes = method.parameterTypes.map { it.toString() },
            returnType = method.returnType,
            textIndices = textIndices,
        )
    }
}

private fun findTabLabelSite(tabItemSite: TabItemSite): TabLabelSite? =
    tabItemSite.classDef.methods.firstOrNull { m ->
        m.implementation != null &&
            m.name == tabItemSite.methodName &&
            m.returnType == tabItemSite.returnType &&
            m.parameterTypes.map { it.toString() } == tabItemSite.paramTypes
    }?.implementation?.instructions?.toList()?.let { tabInstructions ->
        (tabItemSite.tabItemIndex - 1 downTo 0)
            .takeWhile { !isControlFlowBoundary(tabInstructions[it].opcode) }
            .firstNotNullOfOrNull { isLabelLambdaInit(tabInstructions[it]) }
    }?.let { initRef ->
        classDefByOrNull(initRef.definingClass)
    }?.let { labelClass ->
        labelClass.methods.firstNotNullOfOrNull { findTabLabelInMethod(labelClass, it) }
    }

private fun injectTextLabelHooks(method: MutableMethod, textIndex: Int) {
    val textInst = method.instructions.getOrNull(textIndex) as? RegisterRangeInstruction ?: return
    val textRef = (textInst as? ReferenceInstruction)?.reference as? MethodReference ?: return
    val paramTypes = textRef.parameterTypes
    val startReg = textInst.startRegister
    val fontSizeReg = startReg + registerOffsetForParam(paramTypes, TEXT_FONT_SIZE_PARAM_INDEX)
    val lineHeightReg = startReg + registerOffsetForParam(paramTypes, TEXT_LINE_HEIGHT_PARAM_INDEX)
    val maskReg = startReg + textInst.registerCount - 1
    val origTextSmali = invokeToSmali(textInst, textRef)
    method.replaceInstruction(
        textIndex,
        "invoke-static {}, $SEARCH_EXTENSION_CLASS->tabLabelFontSize()J",
    )
    method.addInstructions(
        textIndex + 1,
        """
            move-result-wide v$fontSizeReg
            invoke-static {}, $SEARCH_EXTENSION_CLASS->tabLabelLineHeight()J
            move-result-wide v$lineHeightReg
            invoke-static/range { v$maskReg .. v$maskReg }, $SEARCH_EXTENSION_CLASS->tabLabelMask(I)I
            move-result v$maskReg
            $origTextSmali
        """.trimIndent(),
    )
}

private fun hookTabLabel(site: TabLabelSite) {
    val method = resolveMutableMethod(
        site.classDef,
        site.methodName,
        site.returnType,
        site.paramTypes,
    ) ?: return
    for (textIndex in site.textIndices.sortedDescending()) {
        injectTextLabelHooks(method, textIndex)
    }
}

internal fun hookTopTabsLabel(
    modifierType: String,
    sites: TopTabsSites,
) {
    val hasShapeBridge = hookTopTabsShape(sites)
    val tabItemSite = findAndHookTabItem(modifierType, hookModifier = hasShapeBridge) ?: return
    findTabLabelSite(tabItemSite)?.let(::hookTabLabel)
}
