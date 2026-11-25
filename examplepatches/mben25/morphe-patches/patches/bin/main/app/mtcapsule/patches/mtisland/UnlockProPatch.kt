package app.mtcapsule.patches.mtisland

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.mtcapsule.patches.shared.Constants.COMPATIBILITY_MT_CAPSULE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * MT Capsule stores its pro status as an AES encrypted `"yes"` / `"no"` string in a
 * DataStore preference (`SECURE_DATA`), and reads it back in exactly one class
 * (`Lfo1;` in 15.7). That class exposes three entry points:
 *
 * 1. a suspend one shot getter, `Object getProStatus(Continuation)` (`c()`),
 * 2. a `Flow<Boolean>` (`d()`), which is what every view model actually collects,
 * 3. a suspend setter, `Object setProStatus(boolean, Continuation)` (`e()`).
 *
 * Patching only 1. and 2. leaves the billing manager free to write "no" back to disk on
 * every launch, so 3. is forced to `true` as well. That also means the unlock survives
 * on its own once the app has written the preference at least once.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks all pro features without a purchase.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MT_CAPSULE)

    execute {
        GetOrCreateSecretKeyFingerprint.match()

        val proClass = GetOrCreateSecretKeyFingerprint.originalClassDef
        val decryptMatch = DecryptProStatusFingerprint.match(proClass)

        // region Force the suspend getter to return Boolean.TRUE.

        Fingerprint(
            // Obfuscated continuation parameter, declared only as an object type.
            parameters = listOf("L"),
            returnType = "Ljava/lang/Object;",
            filters = listOf(
                methodCall(reference = GetOrCreateSecretKeyFingerprint.originalMethod),
                // move-result-object sits between the two calls.
                methodCall(reference = decryptMatch.originalMethod, location = MatchAfterWithin(2)),
                string("yes"),
                methodCall(smali = "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;")
            )
        ).match(proClass).method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """
        )

        // endregion

        // region Force the suspend setter to always store "yes".

        Fingerprint(
            parameters = listOf("Z", "L"),
            returnType = "Ljava/lang/Object;",
            filters = listOf(
                methodCall(reference = GetOrCreateSecretKeyFingerprint.originalMethod),
                methodCall(
                    smali = "Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;"
                )
            )
        ).match(proClass).method.addInstruction(0, "const/4 p1, 0x1")

        // endregion

        // region Force the flow to emit true.

        // proStatusFlow() wraps a lambda class that adapts the DataStore flow.
        val lambdaClass = ProStatusFlowFingerprint.match(proClass)
            .instructionMatches[2]
            .getMethodCalled()
            .definingClass

        // That lambda constructs the actual FlowCollector, which is where the
        // decrypt-and-compare-to-"yes" happens and where the Boolean is boxed.
        val collectorClass = Fingerprint(
            definingClass = lambdaClass,
            parameters = listOf("L", "L"),
            returnType = "Ljava/lang/Object;",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            filters = listOf(
                methodCall(
                    name = "<init>",
                    parameters = listOf("L", decryptMatch.classDef.type, "I"),
                    returnType = "V",
                    opcodes = listOf(Opcode.INVOKE_DIRECT)
                )
            )
        ).match()
            .instructionMatches[0]
            .getMethodCalled()
            .definingClass

        // The collector is patched at the `FlowCollector.emit(value, continuation)` call and
        // not at the `Boolean.valueOf(z)` boxing call, because the boxing call is the target
        // of the branches taken when nothing is stored yet or when decryption throws. Anything
        // inserted before it is jumped over on exactly the paths that matter for a user who
        // never bought pro, which is what makes forcing the boxed register ineffective.
        //
        // R8 merges both users of this flow into a single collector method, and the merged
        // variant emits null instead of false when nothing is stored, so every emit call in
        // the method is overridden.
        val emitFilter = methodCall(
            opcodes = listOf(Opcode.INVOKE_INTERFACE),
            parameters = listOf("Ljava/lang/Object;", "L"),
            returnType = "Ljava/lang/Object;"
        )

        val emitMethod = Fingerprint(
            definingClass = collectorClass,
            parameters = listOf("Ljava/lang/Object;", "L"),
            returnType = "Ljava/lang/Object;",
            filters = listOf(emitFilter)
        ).match().method

        emitMethod.implementation!!.instructions
            .withIndex()
            .filter { (_, instruction) ->
                instruction.opcode == Opcode.INVOKE_INTERFACE &&
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.parameterTypes.size == 2 &&
                            it.parameterTypes[0] == "Ljava/lang/Object;" &&
                            it.returnType == "Ljava/lang/Object;"
                    } == true
            }
            .map { it.index }
            // Reversed, so that inserting does not shift the indexes still to be patched.
            .reversed()
            .forEach { index ->
                val register = emitMethod.getInstruction<BuilderInstruction35c>(index).registerD
                emitMethod.addInstruction(
                    index,
                    "sget-object v$register, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"
                )
            }

        // endregion
    }
}
