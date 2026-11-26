package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val SORT_TYPE = "Lcom/reddit/listing/model/sort/SortType;"
private const val FUNCTION2_TYPE = "Lkotlin/jvm/functions/Function2;"
private val BELOW_PARAM_TAIL = listOf("Z", "Z")

internal data class TopTabsSites(
    val belowParamReg: Int,
    val vSearchComposer: Int,
    val weightType: String,
    val thenRef: MethodReference,
    val wrapperMethod: MutableMethod,
    val wrapperModReg: Int,
    val tabBarMethod: MutableMethod,
    val evenlyReg: Int,
    val headerTabsSites: HeaderTabsSites?,
    val indicatorSites: TabIndicatorSites?,
)

internal fun paramRegisterIndex(method: Method, targetIndex: Int): Int {
    var reg = if ((method.accessFlags and AccessFlags.STATIC.value) != 0) 0 else 1
    for (i in 0 until targetIndex) {
        val t = method.parameterTypes[i].toString()
        reg += if (t == "J" || t == "D") 2 else 1
    }
    return reg
}

private fun isBelowSlotCall(inst: Instruction): Boolean {
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
    val ref = ((inst as? ReferenceInstruction)?.reference as? MethodReference)
        ?.takeIf { isStatic && it.returnType.toString() == "V" }
    val p = ref?.parameterTypes?.map { it.toString() } ?: return false
    val headOk = p.size == 5 && p[0] == "I" && p[1] == FUNCTION2_TYPE && p[2].startsWith("L")
    return headOk && p.subList(3, 5) == BELOW_PARAM_TAIL
}

private fun findWeightType(topBarMethod: MutableMethod): String? =
    topBarMethod.instructions.firstNotNullOfOrNull { inst ->
        val isDirect = inst.opcode == Opcode.INVOKE_DIRECT || inst.opcode == Opcode.INVOKE_DIRECT_RANGE
        val ref = ((inst as? ReferenceInstruction)?.reference as? MethodReference)
            ?.takeIf { isDirect && it.name == "<init>" && it.returnType.toString() == "V" }
        val p = ref?.parameterTypes?.map { it.toString() }
        if (p == listOf("F", "Z")) ref.definingClass.toString() else null
    }

private fun isWrapperMethod(method: Method, modifierType: String): Boolean {
    if ((method.accessFlags and AccessFlags.STATIC.value) == 0 || method.implementation == null) {
        return false
    }
    val p = method.parameterTypes.map { it.toString() }
    val signatureOk = method.returnType == "V" && p.size == 10
    return signatureOk && p.contains(SORT_TYPE) && p.contains(modifierType)
}

private fun findSearchComposerReg(
    topBarMethod: MutableMethod,
    searchIndex: Int,
): Int? {
    val params = topBarMethod.parameterTypes
    val composerType = params.getOrNull(params.size - 2)?.toString()
    val searchInst = topBarMethod.instructions[searchIndex]
    val searchRef = (searchInst as? ReferenceInstruction)?.reference as? MethodReference
    val composerIdx = if (composerType != null && searchRef != null) {
        searchRef.parameterTypes.map { it.toString() }.indexOf(composerType)
    } else {
        -1
    }
    return if (composerIdx >= 0) searchInst.registersUsed.getOrNull(composerIdx) else null
}

internal fun findTopTabsSites(
    topBarMethod: MutableMethod,
    modifierType: String,
    searchIndex: Int,
): TopTabsSites? {
    val belowIdx = topBarMethod.parameterTypes.indexOfFirst { it.toString() == FUNCTION2_TYPE }
        .takeIf { it >= 0 && topBarMethod.instructions.any(::isBelowSlotCall) }
        ?: return null
    val vSearchComposer = findSearchComposerReg(topBarMethod, searchIndex)
    val weightType = findWeightType(topBarMethod)
    val tabBarMethod = HomeTabBarFingerprint.methodOrNull
    return vSearchComposer?.let { composerReg ->
        weightType?.let { weight ->
            tabBarMethod?.let { tabBar ->
                buildTopTabsSites(topBarMethod, modifierType, belowIdx, composerReg, weight, tabBar)
            }
        }
    }
}

private fun buildTopTabsSites(
    topBarMethod: MutableMethod,
    modifierType: String,
    belowIdx: Int,
    vSearchComposer: Int,
    weightType: String,
    tabBarMethod: MutableMethod,
): TopTabsSites? {
    val evenlyIdx = tabBarMethod.parameterTypes.indexOfFirst { it.toString() == "Z" }
    val origWrapper = HomeTabBarFingerprint.originalClassDef.methods
        .firstOrNull { isWrapperMethod(it, modifierType) }
    val modIdx = origWrapper?.parameterTypes?.indexOfFirst { it.toString() == modifierType } ?: -1
    val thenRef = origWrapper?.let { findThenRef(topBarMethod, it, modifierType) }
    val wrapperMethod = origWrapper?.let { orig ->
        HomeTabBarFingerprint.classDef.methods
            .firstOrNull { it.name == orig.name && it.parameterTypes == orig.parameterTypes }
    }
    val validIndices = evenlyIdx >= 0 && modIdx >= 0
    return if (validIndices && thenRef != null && wrapperMethod != null) {
        val composerType = topBarMethod.parameterTypes
            .getOrNull(topBarMethod.parameterTypes.size - 2)
            ?.toString()
        TopTabsSites(
            belowParamReg = paramRegisterIndex(topBarMethod, belowIdx),
            vSearchComposer = vSearchComposer,
            weightType = weightType,
            thenRef = thenRef,
            wrapperMethod = wrapperMethod,
            wrapperModReg = paramRegisterIndex(wrapperMethod, modIdx),
            tabBarMethod = tabBarMethod,
            evenlyReg = paramRegisterIndex(tabBarMethod, evenlyIdx),
            headerTabsSites = composerType?.let { findHeaderTabsSites(tabBarMethod, it) },
            indicatorSites = composerType?.let { findTabIndicatorSites(tabBarMethod, it, modifierType) },
        )
    } else {
        null
    }
}
