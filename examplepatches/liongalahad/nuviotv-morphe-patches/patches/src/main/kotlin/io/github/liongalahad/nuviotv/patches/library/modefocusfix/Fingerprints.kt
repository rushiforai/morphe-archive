package io.github.liongalahad.nuviotv.patches.library.modefocusfix

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val FUNCTION2 = "Lkotlin/jvm/functions/Function2;"
private const val FUNCTION3 = "Lkotlin/jvm/functions/Function3;"

private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)

private fun Method.calls(predicate: (MethodReference) -> Boolean): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@any false
        predicate(reference)
    } == true

/** Nuvio's native Saved/Cloud selector row. */
internal object LibraryModeSelectorFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val parameters = method.parameterNames()
        parameters.size == 6 && parameters[1] == "Lz1/y;" &&
            parameters[2] == FUNCTION1 && parameters[3] == FUNCTION2 &&
            parameters[5] == "I" &&
            method.implementation?.instructions?.any { instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                field?.type == "Lkotlin/enums/EnumEntries;"
            } == true &&
            method.calls { reference ->
                val callParameters = reference.parameterTypes.map(CharSequence::toString)
                reference.returnType == "V" && callParameters.size == 13 &&
                    callParameters[0] == FUNCTION0 && callParameters[8] == FUNCTION3 &&
                    callParameters.takeLast(3) == listOf("I", "I", "I")
            }
    }
)

/** Nuvio's native Saved/Cloud filter row directly below the selector. */
internal object LibraryFilterRowFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val parameters = method.parameterNames()
        parameters.size == 21 && parameters.firstOrNull() ==
            "Lcom/nuvio/tv/domain/model/LibrarySourceMode;" &&
            parameters.subList(1, 6).all { it == "Ljava/util/List;" } &&
            parameters[11] == "Lz1/y;" && parameters[13] == FUNCTION2 &&
            parameters.subList(14, 19).all { it == FUNCTION1 } &&
            parameters[19] == "Le1/m0;" && parameters[20] == "I" &&
            method.implementation?.instructions?.count { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Lz1/d;" && reference.name == "d" &&
                    reference.parameterTypes.map(CharSequence::toString) ==
                    listOf("Lu1/q;", "Lz1/y;")
            } == 2
    }
)

/** Nuvio's Cloud-only provider/type filter row. */
internal object CloudLibraryFilterRowFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val parameters = method.parameterNames()
        parameters == listOf(
            "Ljava/util/List;", "Ljava/util/List;", "Ljava/lang/String;", "Ly8/c;",
            "Ljava/lang/String;", FUNCTION2, FUNCTION1, FUNCTION1, "Le1/m0;", "I"
        ) && method.implementation?.instructions?.count { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Lc0/w1;" && reference.name == "a" &&
                reference.parameterTypes.map(CharSequence::toString) == listOf("Lu1/q;", "F") &&
                reference.returnType == "Lu1/q;"
        } == 2
    }
)
