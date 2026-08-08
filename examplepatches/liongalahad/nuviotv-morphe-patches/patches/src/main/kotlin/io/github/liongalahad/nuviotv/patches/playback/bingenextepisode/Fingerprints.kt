package io.github.liongalahad.nuviotv.patches.playback.bingenextepisode

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val STREAM = "Lcom/nuvio/tv/domain/model/Stream;"
private const val ADDON_STREAMS = "Lcom/nuvio/tv/domain/model/AddonStreams;"
private const val LIST = "Ljava/util/List;"
private const val SET = "Ljava/util/Set;"
private const val STRING = "Ljava/lang/String;"
private const val SUSPEND_LAMBDA = "Lkotlin/coroutines/jvm/internal/SuspendLambda;"

private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)

private fun Method.calls(predicate: (MethodReference) -> Boolean): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@any false
        predicate(reference)
    } == true

/**
 * The static helper local to PlayerRuntimeController.playNextEpisode that
 * flattens next-episode addon results and forwards Nuvio's bingeGroupOnly flag
 * to the shared stream selector.
 */
internal object NextEpisodeStreamSelectionFingerprint : Fingerprint(
    returnType = STREAM,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    custom = { method, classDef ->
        val p = method.parameterNames()
        classDef.superclass == SUSPEND_LAMBDA &&
            p.size == 10 && p[0] == LIST && p[2] == STRING &&
            p[4] == SET && p[5] == SET && p[8] == "Z" && p[9] == LIST &&
            method.calls {
                it.definingClass == ADDON_STREAMS && it.name == "getStreams" &&
                    it.returnType == LIST
            } &&
            method.calls { reference ->
                val called = reference.parameterTypes.map(CharSequence::toString)
                reference.returnType == STREAM && called.size == 10 &&
                    called[0] == LIST && called[2] == STRING &&
                    called[4] == SET && called[5] == SET && called[6] == SET &&
                    called[7] == STRING && called[8] == "Z" && called[9] == "Z"
            }
    }
)
