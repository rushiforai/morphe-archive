package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PAGER_STATE_TYPE = "Landroidx/compose/foundation/pager/d;"
private const val TABS_ARRANGEMENT_TYPE = "Lcom/reddit/ui/compose/ds/TabsArrangement;"
private const val MAX_SUPER_HOPS = 5

internal data class TabIndicatorSites(
    val classDef: ClassDef,
    val methodName: String,
    val paramTypes: List<String>,
    val pagerReg: Int,
)

private fun isTabsComponentCall(ref: MethodReference): Boolean {
    val p = ref.parameterTypes.map { it.toString() }
    return p.contains(PAGER_STATE_TYPE) && p.contains(TABS_ARRANGEMENT_TYPE)
}

private fun isIndicatorMethod(method: Method, expectedParams: List<String>): Boolean {
    val isStatic = (method.accessFlags and AccessFlags.STATIC.value) != 0
    val matchesSig = method.returnType == "V" && method.parameterTypes.map { it.toString() } == expectedParams
    return isStatic && method.implementation != null && matchesSig
}

private fun isPagerStateType(type: String): Boolean =
    generateSequence(type) { classDefByOrNull(it)?.superclass }
        .take(MAX_SUPER_HOPS)
        .takeWhile { it.startsWith("L") && it != "Ljava/lang/Object;" }
        .any { it == PAGER_STATE_TYPE }

private fun findPagerParamReg(tabBarMethod: MutableMethod): Int? {
    val params = tabBarMethod.parameterTypes.map { it.toString() }
    val typedIdx = params.indexOfFirst(::isPagerStateType)
    val idx = if (typedIdx >= 0) {
        typedIdx
    } else if (params.getOrNull(1)?.startsWith("L") == true) {
        1
    } else {
        -1
    }
    return if (idx >= 0) paramRegisterIndex(tabBarMethod, idx) else null
}

private fun findTabsComponentClass(tabBarMethod: MutableMethod): String? =
    tabBarMethod.instructions.firstNotNullOfOrNull { inst ->
        val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        ref?.takeIf { isStatic && isTabsComponentCall(it) }?.definingClass?.toString()
    }

internal fun findTabIndicatorSites(
    tabBarMethod: MutableMethod,
    composerType: String,
    modifierType: String,
): TabIndicatorSites? {
    val pagerReg = findPagerParamReg(tabBarMethod)
    val tabsClass = findTabsComponentClass(tabBarMethod)
    val classDef = tabsClass?.let(::classDefByOrNull)
    val expectedParams = listOf("I", composerType, modifierType, "Z")
    val indicator = classDef?.methods?.singleOrNull { isIndicatorMethod(it, expectedParams) }
    return if (pagerReg != null && classDef != null && indicator != null) {
        TabIndicatorSites(
            classDef = classDef,
            methodName = indicator.name,
            paramTypes = expectedParams,
            pagerReg = pagerReg,
        )
    } else {
        null
    }
}

internal fun hookTabIndicator(
    modifierType: String,
    site: TabIndicatorSites,
) {
    val mutableClass = mutableClassDefBy(site.classDef)
    val method = mutableClass.methods.firstOrNull { m ->
        m.name == site.methodName && isIndicatorMethod(m, site.paramTypes)
    } ?: return
    val modReg = paramRegisterIndex(method, 2)
    method.addInstructions(
        0,
        """
            invoke-static/range { p$modReg .. p$modReg }, $SEARCH_EXTENSION_CLASS->tabIndicatorModifier(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p$modReg
            check-cast p$modReg, $modifierType
        """.trimIndent(),
    )
}
