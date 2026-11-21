package app.template.patches.spotify.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.p0Register
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Run by the testSpotifyHooks Gradle task; no Android device is needed. */
object SpotifyHooksTest {
    @JvmStatic
    fun main(args: Array<String>) {
        parameterRegistersSkipThisAndWideTypes()
        parameterRegistersWorkOnStaticMethods()
        replaceReturnedObjectsWrapsAndCasts()
        replaceReturnedObjectsRequiresAReturnObject()
        inspectReturnedObjectsOnlyAddsTheCall()
        inspectReturnedObjectsRequiresAReturnObject()

        println("Spotify hook plumbing passed")
    }

    private fun parameterRegistersSkipThisAndWideTypes() {
        // void target(String, long, int), instance method, 10 registers.
        // p0 = v5 (10 - (this + String + wide long + int) = 5).
        val method = method(
            accessFlags = AccessFlags.PUBLIC.value,
            parameters = listOf("Ljava/lang/String;", "J", "I"),
            returnType = "V",
            registerCount = 10,
        )
        check(method.p0Register == 5) { "expected p0 at v5, got v${method.p0Register}" }
        check(method.parameterRegister(0) == 6) { "String must be at v6" }
        check(method.parameterRegister(1) == 7) { "long must be at v7" }
        check(method.parameterRegister(2) == 9) { "int after the wide long must be at v9" }
    }

    private fun parameterRegistersWorkOnStaticMethods() {
        // static void target(int, double, String), 8 registers.
        // No `this`: p0 = v4 (8 - (int + wide double + String) = 4).
        val method = method(
            accessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            parameters = listOf("I", "D", "Ljava/lang/String;"),
            returnType = "V",
            registerCount = 8,
        )
        check(method.p0Register == 4) { "expected p0 at v4, got v${method.p0Register}" }
        check(method.parameterRegister(0) == 4) { "int must be at v4" }
        check(method.parameterRegister(1) == 5) { "double must be at v5" }
        check(method.parameterRegister(2) == 7) { "String after the wide double must be at v7" }
    }

    private fun replaceReturnedObjectsWrapsAndCasts() {
        val method = returningObjectMethod()
        method.replaceReturnedObjects("Lhook;->wrap(Ljava/lang/Object;)Ljava/lang/Object;")
        val opcodes = method.implementation!!.instructions.map { it.opcode }
        check(opcodes == listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT)) {
            "the wrapped value must be returned, got $opcodes"
        }

        // A differently-typed hook result is cast back to the method return type.
        val casted = returningObjectMethod()
        casted.replaceReturnedObjects("Lhook;->wrap(Ljava/lang/Object;)Ljava/util/List;")
        val castOpcodes = casted.implementation!!.instructions.map { it.opcode }
        check(castOpcodes == listOf(
            Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.RETURN_OBJECT,
        )) {
            "a mismatched hook return type must be cast back, got $castOpcodes"
        }
    }

    private fun replaceReturnedObjectsRequiresAReturnObject() {
        val voidMethod = method(
            accessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            parameters = emptyList(),
            returnType = "V",
            registerCount = 1,
            returnVoid = true,
        )
        val failure = runCatching {
            voidMethod.replaceReturnedObjects("Lhook;->wrap(Ljava/lang/Object;)Ljava/lang/Object;")
        }.exceptionOrNull()
        check(failure is PatchException) { "a method without return-object must fail loudly, got $failure" }
    }

    private fun inspectReturnedObjectsOnlyAddsTheCall() {
        val method = returningObjectMethod()
        method.inspectReturnedObjects("Lhook;->inspect(Ljava/lang/Object;)V")
        val opcodes = method.implementation!!.instructions.map { it.opcode }
        check(opcodes == listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.RETURN_OBJECT)) {
            "the original return register must be untouched, got $opcodes"
        }
    }

    private fun inspectReturnedObjectsRequiresAReturnObject() {
        val voidMethod = method(
            accessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            parameters = emptyList(),
            returnType = "V",
            registerCount = 1,
            returnVoid = true,
        )
        val failure = runCatching {
            voidMethod.inspectReturnedObjects("Lhook;->inspect(Ljava/lang/Object;)V")
        }.exceptionOrNull()
        check(failure is PatchException) { "a method without return-object must fail loudly, got $failure" }
    }

    private fun returningObjectMethod() = method(
        accessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        parameters = emptyList(),
        returnType = "Ljava/lang/Object;",
        registerCount = 2,
        returnObjectRegister = 1,
    )

    private fun method(
        accessFlags: Int,
        parameters: List<String>,
        returnType: String,
        registerCount: Int,
        returnVoid: Boolean = false,
        returnObjectRegister: Int = 0,
    ) = ImmutableMethod(
        "Ltest/Subject;",
        "target",
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        accessFlags,
        null,
        null,
        MutableMethodImplementation(registerCount).apply {
            if (returnVoid) {
                addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
            } else {
                addInstruction(BuilderInstruction11x(Opcode.RETURN_OBJECT, returnObjectRegister))
            }
        },
    ).toMutable()
}
