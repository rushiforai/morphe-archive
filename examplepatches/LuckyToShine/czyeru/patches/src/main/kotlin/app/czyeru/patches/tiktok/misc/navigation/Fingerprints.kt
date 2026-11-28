package app.czyeru.patches.tiktok.misc.navigation

import app.czyeru.util.getReference
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val COPY_ON_WRITE = "Ljava/util/concurrent/CopyOnWriteArrayList;"
private const val BOTTOM_TAB_SCENE = "scene_get_bottom_tab"
private val LIST_QUESTIONS = setOf("isEmpty", "size")

private fun Method.isBottomTabModelList(classDef: ClassDef): Boolean {
    val instructions = implementation?.instructions?.toList() ?: return false
    fun ownListRead(index: Int) = instructions.getOrNull(index)?.let { instruction ->
        instruction.opcode == Opcode.IGET_OBJECT && instruction.getReference<FieldReference>()?.let { field ->
            field.definingClass == classDef.type && field.type == COPY_ON_WRITE
        } == true
    } == true
    val lastReturn = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
    if (!ownListRead(lastReturn - 1)) return false
    val handedBack = instructions.indices
        .filter { instructions[it].opcode == Opcode.RETURN_OBJECT && ownListRead(it - 1) }
        .map { instructions[it - 1].getReference<FieldReference>()!!.name }
        .distinct()
    if (handedBack.size != 1) return false
    val readsStayPut = instructions.indices.filter(::ownListRead).all { index ->
        val list = (instructions[index] as TwoRegisterInstruction).registerA
        val next = instructions.getOrNull(index + 1) ?: return@all false
        when (next.opcode) {
            Opcode.RETURN_OBJECT -> (next as OneRegisterInstruction).registerA == list
            Opcode.INVOKE_VIRTUAL -> next.getReference<MethodReference>()?.let { call ->
                call.definingClass == COPY_ON_WRITE && call.name in LIST_QUESTIONS && call.parameterTypes.isEmpty()
            } == true && (next as FiveRegisterInstruction).registerCount == 1 && next.registerC == list
            else -> false
        }
    }
    if (!readsStayPut) return false
    val fillers = instructions.mapNotNull { it.getReference<MethodReference>() }
        .filter { it.definingClass == classDef.type && it.returnType == "V" && it.parameterTypes.isEmpty() }
        .map { it.name }.distinct()
    return fillers.any { classDef.fillerReportsScene(it, BOTTOM_TAB_SCENE, hops = 1) }
}

private fun ClassDef.fillerReportsScene(name: String, scene: String, hops: Int): Boolean {
    val filler = methods.firstOrNull {
        it.name == name && it.returnType == "V" && it.parameterTypes.none()
    } ?: return false
    val instructions = filler.implementation?.instructions?.toList() ?: return false
    if (instructions.any { it.getReference<StringReference>()?.string == scene }) return true
    if (hops == 0) return false
    return instructions.mapNotNull { it.getReference<MethodReference>() }
        .filter { it.definingClass == type && it.returnType == "V" && it.parameterTypes.isEmpty() && it.name != name }
        .any { fillerReportsScene(it.name, scene, hops - 1) }
}

/**
 * Static writer that stores the top tab node list (used by the tab strip and the
 * home ViewPager through HomeTabAbility.Yd2()) and the parallel TopTabProtocol
 * list (HomeTabAbility.K9()). Both lists are built in the same order and each
 * node's tag() returns its protocol's getTag().
 */
internal object TopTabListsWriterFingerprint : Fingerprint(
    definingClass = "/TabAbilityAssem;",
    // `fp` on 47.2.41, `Ip` on 47.4.3: the only static writer that takes the assem and both lists.
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Lcom/ss/android/ugc/aweme/main/assems/tabs/TabAbilityAssem;",
        "L",
        "Ljava/util/List;",
        "Ljava/util/List;",
    ),
)

/**
 * The bottom tab list getter (`OB` on 47.2.41, `EB` on 47.4.3, `Ao1` on 48.0.2).
 * Uses the `scene_get_bottom_tab` + `CopyOnWriteArrayList` structure so 48.0.2's cold-start
 * seeding getter matches uniquely alongside earlier builds.
 */
internal object BottomTabModelListFingerprint : Fingerprint(
    definingClass = "/TabAbilityAssem;",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    custom = { method, classDef ->
        method.isBottomTabModelList(classDef) &&
            classDef.methods.count { it.isBottomTabModelList(classDef) } == 1
    },
)
