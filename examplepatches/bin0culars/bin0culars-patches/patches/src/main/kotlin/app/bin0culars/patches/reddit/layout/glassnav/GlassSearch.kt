package app.bin0culars.patches.reddit.layout.glassnav

import app.bin0culars.patches.reddit.layout.autoscroll.ScreenAttachFingerprint
import app.bin0culars.patches.reddit.layout.autoscroll.ScreenDetachFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val SEARCH_EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/GlassSearch;"

internal fun hookGlassSearch() {
    val topBarMethod = HomeTopBarFingerprint.methodOrNull ?: return
    val modifierType = topBarMethod.parameterTypes.firstOrNull()?.toString() ?: return
    val topBarSites = findTopBarSites(topBarMethod, modifierType)
    val bgSites = findHomeScreenTopBarSites(topBarMethod.definingClass, modifierType)
    val navSites = findNavVisibilitySites()

    if (topBarSites != null && bgSites != null && navSites != null) {
        val topTabsSites = findTopTabsSites(topBarMethod, modifierType, topBarSites.searchIndex)
        hookHomeTopBar(topBarMethod, modifierType, topBarSites, topTabsSites)
        hookHomeScreenTopBar(bgSites)
        hookHeaderBlur(bgSites)
        topTabsSites?.let { hookTopTabs(modifierType, it) }
        hookGlassTopBarAtTop()
        navSites.constructorMethod?.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $SEARCH_EXTENSION_CLASS->onShowBottomNav(Z)V",
        )
        navSites.attachMethod.addInstructions(
            0,
            "invoke-static/range { p0 .. p1 }, $SEARCH_EXTENSION_CLASS->onScreenAttached(Ljava/lang/Object;Landroid/view/View;)V",
        )
        navSites.detachMethod.addInstructions(
            0,
            "invoke-static/range { p0 .. p1 }, $SEARCH_EXTENSION_CLASS->onScreenDetached(Ljava/lang/Object;Landroid/view/View;)V",
        )
        BottomNavBarFingerprint.method.addInstructions(
            0,
            "invoke-static {}, $SEARCH_EXTENSION_CLASS->setHooksApplied()V",
        )
    }
}

private fun isLeadingSlotCall(
    instructions: List<Instruction>,
    index: Int,
    slotType: String,
    modifierType: String,
): Boolean {
    val inst = instructions[index]
    val isInterface = inst.opcode == Opcode.INVOKE_INTERFACE || inst.opcode == Opcode.INVOKE_INTERFACE_RANGE
    val ref = ((inst as? ReferenceInstruction)?.reference as? MethodReference)
        ?.takeIf { isInterface && it.definingClass.toString() == slotType }
    val isSlotInvoke = ref != null && ref.name == "invoke" && ref.parameterTypes.size == 3
    val modReg = if (isSlotInvoke) inst.registersUsed.getOrNull(1) else null
    val writerIndex = if (modReg != null) {
        ((index - 1) downTo 0).firstOrNull {
            val w = instructions[it]
            w is OneRegisterInstruction && w.opcode.setsRegister() && w.registerA == modReg
        }
    } else {
        null
    }
    val prevInvoke = if (writerIndex != null && instructions[writerIndex].opcode == Opcode.MOVE_RESULT_OBJECT) {
        instructions.getOrNull(writerIndex - 1)
    } else {
        null
    }
    val prevRef = (prevInvoke as? ReferenceInstruction)?.reference as? MethodReference
    return prevRef?.returnType?.toString() == modifierType
}

private fun isSearchFieldCall(inst: Instruction, modifierType: String, composerType: String): Boolean {
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
    val ref = ((inst as? ReferenceInstruction)?.reference as? MethodReference)
        ?.takeIf { isStatic && it.returnType.toString() == "V" && it.parameterTypes.size == 7 }
        ?: return false
    val expected = listOf(
        modifierType,
        composerType,
        "Lkotlin/jvm/functions/Function0;",
        "Ljava/lang/String;",
        "I",
        "Z",
        "Z",
    ).sorted()
    return ref.parameterTypes.map { it.toString() }.sorted() == expected
}

private fun isTrailingAvatarCall(inst: Instruction, definingClass: String): Boolean {
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
    val ref = ((inst as? ReferenceInstruction)?.reference as? MethodReference)
        ?.takeIf { isStatic && it.definingClass.toString() == definingClass && it.returnType.toString() == "V" }
        ?: return false
    val p = ref.parameterTypes.map { it.toString() }
    val headOk = p.size == 5 && p[0] == "I" && p[1] == "I"
    val tailOk = headOk && p[2].startsWith("L") && p[3].startsWith("L")
    return tailOk && p[4] == "Landroidx/compose/runtime/internal/a;"
}

private fun hookCircleModifier(
    method: MutableMethod,
    index: Int,
    modifierType: String,
    vMod: Int,
    origSmali: String,
) {
    method.replaceInstruction(
        index,
        "invoke-static/range { v$vMod .. v$vMod }, $SEARCH_EXTENSION_CLASS->circleModifier(Ljava/lang/Object;)Ljava/lang/Object;",
    )
    method.addInstructions(
        index + 1,
        """
            move-result-object v$vMod
            check-cast v$vMod, $modifierType
            $origSmali
        """.trimIndent(),
    )
}

private fun hookSearchField(
    method: MutableMethod,
    modifierType: String,
    sites: TopBarSites,
    vComposer: Int?,
) {
    val inlineTabsLine = if (vComposer != null) {
        "\ninvoke-static/range { v$vComposer .. v$vComposer }, $SEARCH_EXTENSION_CLASS->inlineTabs(Ljava/lang/Object;)V"
    } else {
        ""
    }
    method.replaceInstruction(
        sites.searchIndex,
        "invoke-static/range { v${sites.vSearchMod} .. v${sites.vSearchMod} }, $SEARCH_EXTENSION_CLASS->searchFieldModifier(Ljava/lang/Object;)Ljava/lang/Object;",
    )
    method.addInstructions(
        sites.searchIndex + 1,
        """
            move-result-object v${sites.vSearchMod}
            check-cast v${sites.vSearchMod}, $modifierType
            invoke-static/range { v${sites.vSearchClick} .. v${sites.vSearchClick} }, $SEARCH_EXTENSION_CLASS->searchFieldClick(Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;
            move-result-object v${sites.vSearchClick}
            ${sites.searchSmali}$inlineTabsLine
        """.trimIndent(),
    )
}

private data class TopBarSites(
    val leadingIndex: Int,
    val leadingSmali: String,
    val vLeadingMod: Int,
    val searchIndex: Int,
    val searchSmali: String,
    val vSearchMod: Int,
    val vSearchClick: Int,
    val trailingIndex: Int,
    val trailingSmali: String,
    val vTrailingMod: Int,
)

private fun buildTopBarSites(
    instructions: List<Instruction>,
    modifierType: String,
    leadingIndex: Int,
    searchIndex: Int,
    trailingIndex: Int,
): TopBarSites? {
    val leadingInst = instructions[leadingIndex]
    val leadingRef = (leadingInst as ReferenceInstruction).reference as MethodReference
    val searchInst = instructions[searchIndex]
    val searchRef = (searchInst as ReferenceInstruction).reference as MethodReference
    val searchParams = searchRef.parameterTypes.map { it.toString() }
    val trailingInst = instructions[trailingIndex]
    val trailingRef = (trailingInst as ReferenceInstruction).reference as MethodReference

    val regs = listOfNotNull(
        leadingInst.registersUsed.getOrNull(1),
        searchInst.registersUsed.getOrNull(searchParams.indexOf(modifierType)),
        searchInst.registersUsed.getOrNull(searchParams.indexOf("Lkotlin/jvm/functions/Function0;")),
        trailingInst.registersUsed.getOrNull(3),
    )
    if (regs.size != 4) return null

    return TopBarSites(
        leadingIndex = leadingIndex,
        leadingSmali = invokeToSmali(leadingInst, leadingRef),
        vLeadingMod = regs[0],
        searchIndex = searchIndex,
        searchSmali = invokeToSmali(searchInst, searchRef),
        vSearchMod = regs[1],
        vSearchClick = regs[2],
        trailingIndex = trailingIndex,
        trailingSmali = invokeToSmali(trailingInst, trailingRef),
        vTrailingMod = regs[3],
    )
}

private fun findTopBarSites(method: MutableMethod, modifierType: String): TopBarSites? {
    val params = method.parameterTypes
    val slotType = params.getOrNull(4)?.toString()
    val composerType = params.getOrNull(params.size - 2)?.toString()
        ?.takeIf { it.startsWith("L") && params.getOrNull(1)?.toString() == "Lkotlin/jvm/functions/Function0;" }
    val match0Index = HomeTopBarFingerprint.instructionMatches.firstOrNull()?.index
    val match1Index = HomeTopBarFingerprint.instructionMatches.getOrNull(1)?.index
    val instructions = method.instructions

    val leadingIndex = if (slotType != null && match0Index != null) {
        ((match0Index + 1) until instructions.size).firstOrNull {
            isLeadingSlotCall(instructions, it, slotType, modifierType)
        }
    } else {
        null
    }
    val searchIndex = if (composerType != null && match1Index != null) {
        ((match1Index + 1) until instructions.size).firstOrNull {
            isSearchFieldCall(instructions[it], modifierType, composerType)
        }
    } else {
        null
    }
    val trailingIndex = searchIndex?.let { start ->
        ((start + 1) until instructions.size).firstOrNull { isTrailingAvatarCall(instructions[it], method.definingClass) }
    }
    if (leadingIndex == null || searchIndex == null || trailingIndex == null) return null
    return buildTopBarSites(instructions, modifierType, leadingIndex, searchIndex, trailingIndex)
}

private fun hookHomeTopBar(
    method: MutableMethod,
    modifierType: String,
    sites: TopBarSites,
    topTabsSites: TopTabsSites?,
) {
    // Inject bottom-to-top using replaceInstruction so branch labels stay on the hook.
    hookCircleModifier(method, sites.trailingIndex, modifierType, sites.vTrailingMod, sites.trailingSmali)
    hookSearchField(
        method,
        modifierType,
        sites,
        topTabsSites?.vSearchComposer,
    )
    hookCircleModifier(method, sites.leadingIndex, modifierType, sites.vLeadingMod, sites.leadingSmali)

    val index0Smali = buildString {
        append("invoke-static/range { p1 .. p1 }, $SEARCH_EXTENSION_CLASS->setSearchAction(Lkotlin/jvm/functions/Function0;)V")
        if (topTabsSites != null) {
            val belowReg = topTabsSites.belowParamReg
            append("\ninvoke-static {}, $SEARCH_EXTENSION_CLASS->setTabsHooksApplied()V")
            append(
                "\ninvoke-static/range { p$belowReg .. p$belowReg }, " +
                    "$SEARCH_EXTENSION_CLASS->wrapBelow(Lkotlin/jvm/functions/Function2;)Lkotlin/jvm/functions/Function2;",
            )
            append("\nmove-result-object p$belowReg")
        }
    }
    method.addInstructions(0, index0Smali)
}

private data class NavVisibilitySites(
    val constructorMethod: MutableMethod?,
    val attachMethod: MutableMethod,
    val detachMethod: MutableMethod,
)

private fun findNavVisibilitySites(): NavVisibilitySites? {
    val constructorMethod = NavScreenContentStateToStringFingerprint.classDefOrNull
        ?.methods
        ?.firstOrNull { method ->
            method.name == "<init>" &&
                method.parameterTypes.map { it.toString() } == EXPECTED_CONSTRUCTOR_PARAMS
        }
    val attachMethod = ScreenAttachFingerprint.methodOrNull
    val detachMethod = ScreenDetachFingerprint.methodOrNull
    return if (attachMethod != null && detachMethod != null) {
        NavVisibilitySites(constructorMethod, attachMethod, detachMethod)
    } else {
        null
    }
}
