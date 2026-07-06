package app.bigyank.patches.shealth

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x

internal fun BytecodePatchContext.stubReturnFalse(fingerprint: Fingerprint) {
    stubZeroReturn(fingerprint, returnObject = false)
}

/** Stub when present; skip silently when the target APK uses a different Health version layout. */
internal fun BytecodePatchContext.stubReturnFalseIfPresent(fingerprint: Fingerprint) {
    runCatching { stubReturnFalse(fingerprint) }
}

internal fun BytecodePatchContext.replaceMethodBodyIfPresent(fingerprint: Fingerprint, stubBody: String) {
    runCatching { replaceMethodBody(fingerprint, stubBody) }
}

internal fun BytecodePatchContext.stubZeroReturnIfPresent(fingerprint: Fingerprint, returnObject: Boolean) {
    runCatching { stubZeroReturn(fingerprint, returnObject) }
}

internal fun BytecodePatchContext.stubReturnVoid(fingerprint: Fingerprint) {
    replaceMethodBody(fingerprint, "return-void")
}

internal fun BytecodePatchContext.stubZeroReturn(fingerprint: Fingerprint, returnObject: Boolean) {
    fingerprint.method.apply {
        fun replaceBodyInPlace(body: String) {
            val impl = implementation as? MutableMethodImplementation
                ?: throw PatchException("Failed to replace $name: no method implementation")
            impl.clearExceptionHandlers()
            removeInstructions(0, impl.instructions.count())
            addInstructions(0, body)
        }

        val registerCount = if (AccessFlags.STATIC.isSet(accessFlags)) {
            maxOf(1, parameters.size)
        } else {
            maxOf(1, parameters.size + 1)
        }
        val returnInsn = if (returnObject) "return-object v0" else "return v0"
        val stubBody = "const/4 v0, 0x0\n$returnInsn"
        val freshImpl = MutableMethodImplementation(registerCount).apply {
            addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 0))
            addInstruction(
                BuilderInstruction11x(
                    if (returnObject) Opcode.RETURN_OBJECT else Opcode.RETURN,
                    0,
                ),
            )
        }

        val replaced = runCatching {
            val field = javaClass.getDeclaredField("implementation")
            field.isAccessible = true
            field.set(this@apply, freshImpl)
            true
        }.getOrDefault(false)

        if (!replaced) {
            replaceBodyInPlace(stubBody)
        }
    }
}

internal fun BytecodePatchContext.replaceMethodBody(fingerprint: Fingerprint, stubBody: String) {
    fingerprint.method.apply {
        val impl = implementation as? MutableMethodImplementation
            ?: throw PatchException("Failed to replace $name: no method implementation")
        impl.clearExceptionHandlers()
        removeInstructions(0, impl.instructions.count())
        addInstructions(0, stubBody)
    }
}

private fun MutableMethodImplementation.clearExceptionHandlers() {
    val tryBlocksField = MutableMethodImplementation::class.java.getDeclaredField("tryBlocks")
    tryBlocksField.isAccessible = true
    @Suppress("UNCHECKED_CAST")
    (tryBlocksField.get(this) as java.util.ArrayList<*>).clear()
}
