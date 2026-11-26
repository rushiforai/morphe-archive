package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FEED_COMPOSABLES_CLASS = "Lcom/reddit/feeds/ui/composables/feed/b;"
private const val TRACKER_LAMBDA_CLASS =
    "Lcom/reddit/feeds/ui/composables/NestedListTrackerKt\$NestedListTracker\$1\$1;"
private const val FUNCTION1_TYPE = "Lkotlin/jvm/functions/Function1;"
private const val FEED_CACHE_WINDOW_SURFACE_TYPE =
    "Lcom/reddit/feeds/ui/composables/feed/FeedCacheWindowSurface;"
private const val MAX_4BIT_REGISTER = 15
private val TAIL_INT_PARAMS = listOf("I", "I", "I")

private data class FeedCallSite(
    val classDef: ClassDef,
    val methodName: String,
    val paramTypes: List<String>,
    val returnType: String,
    val hooks: List<Pair<Int, String>>,
)

private fun isFeedListStateMethod(method: Method): Boolean {
    val headerOk = (method.accessFlags and AccessFlags.STATIC.value) != 0 &&
        method.returnType == LAZY_LIST_STATE_TYPE
    val params = method.parameterTypes.map { it.toString() }
    val shapeOk = params.size >= 7 &&
        params[0].startsWith("L") &&
        params.subList(1, 3) == listOf("Z", "Z")
    val tailAndRequiredOk = params.takeLast(3) == TAIL_INT_PARAMS &&
        FUNCTION1_TYPE in params &&
        FEED_CACHE_WINDOW_SURFACE_TYPE in params
    return headerOk && shapeOk && tailAndRequiredOk
}

private fun buildRegisterFeedSmali(vL: Int, vS: Int): String? = when {
    vL <= MAX_4BIT_REGISTER && vS <= MAX_4BIT_REGISTER ->
        "invoke-static { v$vL, v$vS }, $SEARCH_EXTENSION_CLASS->registerFeed(Ljava/lang/Object;Ljava/lang/Object;)V"

    vS == vL + 1 ->
        "invoke-static/range { v$vL .. v$vS }, $SEARCH_EXTENSION_CLASS->registerFeed(Ljava/lang/Object;Ljava/lang/Object;)V"

    vL == vS + 1 ->
        "invoke-static/range { v$vS .. v$vL }, $SEARCH_EXTENSION_CLASS->registerFeedSwapped(Ljava/lang/Object;Ljava/lang/Object;)V"

    else -> null
}

private fun isFeedListCall(inst: Instruction, targetParams: List<String>, targetMethod: Method): Boolean {
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
    val ref = if (isStatic) (inst as? ReferenceInstruction)?.reference as? MethodReference else null
    return if (ref == null || ref.definingClass != FEED_COMPOSABLES_CLASS || ref.name != targetMethod.name) {
        false
    } else {
        ref.returnType == targetMethod.returnType && ref.parameterTypes.map { it.toString() } == targetParams
    }
}

private fun collectHooksInMethod(
    method: Method,
    targetParams: List<String>,
    targetMethod: Method,
): List<Pair<Int, String>> {
    val instructions = method.implementation?.instructions?.toList() ?: return emptyList()
    return (0 until instructions.size - 1).mapNotNull { i ->
        val callInst = instructions[i]
        val moveInst = instructions[i + 1]
        val isTarget = isFeedListCall(callInst, targetParams, targetMethod) &&
            moveInst.opcode == Opcode.MOVE_RESULT_OBJECT
        val vL = (moveInst as? OneRegisterInstruction)?.registerA
        val vS = callInst.registersUsed.firstOrNull()
        if (isTarget && vL != null && vS != null) {
            buildRegisterFeedSmali(vL, vS)?.let { (i + 2) to it }
        } else {
            null
        }
    }.sortedByDescending { it.first }
}

internal fun hookGlassFeedRegistry() {
    val feedListMethod = classDefByOrNull(FEED_COMPOSABLES_CLASS)
        ?.methods
        ?.singleOrNull(::isFeedListStateMethod)
    val feedStateType = feedListMethod?.parameterTypes?.firstOrNull()?.toString()
    val visibleField = feedStateType?.let(::findFeedVisibleField)
    val scrolledSite = classDefByOrNull(TRACKER_LAMBDA_CLASS)
        ?.methods
        ?.firstNotNullOfOrNull(::findScrolledCheckInMethod)
    if (feedListMethod == null || feedStateType == null) {
        return
    }
    if (visibleField == null || scrolledSite == null) {
        return
    }

    fillFeedBridges(feedStateType, visibleField, scrolledSite)

    val targetParams = feedListMethod.parameterTypes.map { it.toString() }
    val sites = mutableListOf<FeedCallSite>()
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Lapp/bin0culars/")) {
            collectClassSites(classDef, targetParams, feedListMethod, sites)
        }
    }
    for (site in sites) {
        val method = resolveMutableMethod(site.classDef, site.methodName, site.returnType, site.paramTypes)
            ?: continue
        for ((insertIndex, smali) in site.hooks) {
            method.addInstructions(insertIndex, smali)
        }
    }
}

private fun collectClassSites(
    classDef: ClassDef,
    targetParams: List<String>,
    feedListMethod: Method,
    sites: MutableList<FeedCallSite>,
) {
    for (method in classDef.methods) {
        val hooks = collectHooksInMethod(method, targetParams, feedListMethod)
        if (hooks.isNotEmpty()) {
            sites += FeedCallSite(
                classDef = classDef,
                methodName = method.name,
                paramTypes = method.parameterTypes.map { it.toString() },
                returnType = method.returnType,
                hooks = hooks,
            )
        }
    }
}
