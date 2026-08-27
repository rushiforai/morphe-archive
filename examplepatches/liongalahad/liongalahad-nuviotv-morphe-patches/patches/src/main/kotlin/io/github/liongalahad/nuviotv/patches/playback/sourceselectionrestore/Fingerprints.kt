package io.github.liongalahad.nuviotv.patches.playback.sourceselectionrestore

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val STREAM = "Lcom/nuvio/tv/domain/model/Stream;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val FUNCTION4 = "Lkotlin/jvm/functions/Function4;"
private const val FUNCTION5 = "Lkotlin/jvm/functions/Function5;"
private const val LIST = "Ljava/util/List;"

private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)

private fun Method.calls(predicate: (MethodReference) -> Boolean): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@any false
        predicate(reference)
    } == true

/** Nuvio's source-picker screen, whose saved clicked index is scoped to its back-stack entry. */
internal object StreamScreenFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterNames().let { parameters ->
            parameters.size == 6 && parameters[0].startsWith("L") &&
                parameters.drop(1) == listOf(
                    FUNCTION0, FUNCTION1, FUNCTION1, "Le1/m0;", "I"
                )
        }
    }
)

/** Nuvio's fullscreen player composable and its normal/error exit callbacks. */
internal object PlayerScreenFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val parameters = method.parameterNames()
        parameters.size == 6 && parameters[0].startsWith("L") &&
            parameters.drop(1) == listOf(FUNCTION5, FUNCTION0, FUNCTION4, "Le1/m0;", "I")
    }
)

/**
 * Nuvio's stream LazyColumn. The structural signature includes the saved focused index,
 * native restore flag, completion action, and stable Stream identity accessors.
 */
internal object StreamsListFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val parameters = method.parameterNames()
        parameters.size == 19 &&
            parameters[0] == LIST && parameters[1] == FUNCTION1 &&
            parameters[2] == "I" && parameters[3] == "Z" &&
            parameters[4] == FUNCTION0 && parameters[5] == "I" &&
            parameters[6] == LIST && parameters[7] == "Ljava/lang/String;" &&
            parameters[8] == "Z" && parameters[9] == "Z" &&
            parameters[11] == "Z" && parameters[12] == FUNCTION1 &&
            parameters[13] == LIST && parameters[14] == FUNCTION1 &&
            parameters[15] == FUNCTION0 && parameters[16] == FUNCTION1 &&
            parameters[17] == "Le1/m0;" &&
            parameters[18] == "I" &&
            method.calls { reference ->
                reference.definingClass == STREAM && reference.returnType == "Ljava/lang/String;" &&
                    reference.parameterTypes.map(CharSequence::toString) == listOf("I")
            }
    }
)
