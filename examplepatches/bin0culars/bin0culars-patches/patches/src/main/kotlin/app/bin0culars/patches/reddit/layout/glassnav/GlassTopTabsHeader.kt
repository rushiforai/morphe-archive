package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HOME_PAGER_SCREEN_CLASS =
    "Lcom/reddit/feedslegacy/switcher/impl/homepager/compose/HomePagerScreen;"
private const val FUNCTION0_TYPE = "Lkotlin/jvm/functions/Function0;"

internal data class HeaderTabCallSite(
    val classDef: ClassDef,
    val methodName: String,
    val paramTypes: List<String>,
    val returnType: String,
    val callIndices: List<Int>,
)

internal data class HeaderTabsSites(
    val callers: List<HeaderTabCallSite>,
)

private fun staticMethodRef(inst: Instruction): MethodReference? {
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
    return if (isStatic) (inst as? ReferenceInstruction)?.reference as? MethodReference else null
}

private fun findTabHeightRef(tabBarMethod: MutableMethod, composerType: String): MethodReference? =
    tabBarMethod.instructions.firstNotNullOfOrNull { inst ->
        staticMethodRef(inst)?.takeIf { ref ->
            val p = ref.parameterTypes
            ref.returnType.toString() == "F" &&
                p.size == 2 &&
                p[0].toString() == "Z" &&
                p[1].toString() == composerType
        }
    }

private fun findTabHeightCallIndices(method: Method, nSmali: String): List<Int> =
    method.implementation?.instructions?.toList()?.let { instructions ->
        (0 until instructions.size - 1).filter { i ->
            staticMethodRef(instructions[i])?.toSmali() == nSmali &&
                instructions[i + 1].opcode == Opcode.MOVE_RESULT
        }
    }.orEmpty()

private fun isPagerComposableSignature(method: Method): Boolean {
    if ((method.accessFlags and AccessFlags.STATIC.value) == 0 || method.returnType != "V") {
        return false
    }
    val params = method.parameterTypes.map { it.toString() }
    return params.contains(SORT_TYPE) && params.contains(FUNCTION0_TYPE)
}

private fun findScreenCaller(nSmali: String): HeaderTabCallSite? =
    classDefByOrNull(HOME_PAGER_SCREEN_CLASS)?.let { screenClass ->
        screenClass.methods.firstNotNullOfOrNull { method ->
            val indices = findTabHeightCallIndices(method, nSmali)
            if (indices.isEmpty()) {
                null
            } else {
                HeaderTabCallSite(
                    classDef = screenClass,
                    methodName = method.name,
                    paramTypes = method.parameterTypes.map { it.toString() },
                    returnType = method.returnType,
                    callIndices = indices,
                )
            }
        }
    }

private fun findPagerMethodInClass(
    classDef: ClassDef,
    nSmali: String,
    screenCaller: HeaderTabCallSite,
): HeaderTabCallSite? = classDef.methods.firstNotNullOfOrNull { method ->
    if (!isPagerComposableSignature(method)) {
        null
    } else {
        val params = method.parameterTypes.map { it.toString() }
        val isSameAsScreen = classDef.type == HOME_PAGER_SCREEN_CLASS &&
            method.name == screenCaller.methodName &&
            params == screenCaller.paramTypes
        val indices = if (isSameAsScreen) emptyList() else findTabHeightCallIndices(method, nSmali)
        if (indices.isEmpty()) null else HeaderTabCallSite(classDef, method.name, params, method.returnType, indices)
    }
}

private fun findPagerCaller(
    nRef: MethodReference,
    nSmali: String,
    screenCaller: HeaderTabCallSite,
): HeaderTabCallSite? {
    var found: HeaderTabCallSite? = null
    classDefForEach { classDef ->
        if (found == null && classDef.type != nRef.definingClass) {
            found = findPagerMethodInClass(classDef, nSmali, screenCaller)
        }
    }
    return found
}

internal fun findHeaderTabsSites(tabBarMethod: MutableMethod, composerType: String): HeaderTabsSites? =
    findTabHeightRef(tabBarMethod, composerType)?.let { nRef ->
        val nSmali = nRef.toSmali()
        findScreenCaller(nSmali)?.let { screenCaller ->
            findPagerCaller(nRef, nSmali, screenCaller)?.let { pagerCaller ->
                HeaderTabsSites(listOf(screenCaller, pagerCaller))
            }
        }
    }

internal fun hookHeaderTabsHeight(sites: HeaderTabsSites) {
    for (site in sites.callers) {
        val mutableClass = mutableClassDefBy(site.classDef)
        val method = mutableClass.methods.firstOrNull { m ->
            m.name == site.methodName &&
                m.returnType == site.returnType &&
                m.parameterTypes.map { it.toString() } == site.paramTypes
        } ?: continue
        for (callIndex in site.callIndices.reversed()) {
            val moveResultIndex = callIndex + 1
            val moveResultInst = method.instructions.getOrNull(moveResultIndex)
            if (moveResultInst?.opcode == Opcode.MOVE_RESULT && moveResultInst is OneRegisterInstruction) {
                val vX = moveResultInst.registerA
                method.addInstructions(
                    moveResultIndex + 1,
                    """
                        invoke-static/range { v$vX .. v$vX }, $SEARCH_EXTENSION_CLASS->headerTabsHeight(F)F
                        move-result v$vX
                    """.trimIndent(),
                )
            }
        }
    }
}
