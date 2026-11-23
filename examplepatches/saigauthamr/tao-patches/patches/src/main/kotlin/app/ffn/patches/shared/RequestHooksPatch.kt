package app.ffn.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val REQUEST_HOOKS_CLASS = "Lapp/ffn/extension/RequestHooks;"

// Added to the request class: runs the base class callback pipeline. The request class overrides
// that method to send the request instead, so only code inside the class can reach it (invoke-super).
private const val RUN_CALLBACKS_METHOD = "ffnRunCallbacks"

/**
 * Hooks the app's API request class for [REQUEST_HOOKS_CLASS]: before sending, on success and on
 * failure. Feature patches depend on this and switch their feature on with [enableRequestFeature].
 */
internal val requestHooksPatch = patch {
    extendWith("extensions/extension.mpe")

    execute {
        val requestClass = RequestFailureFingerprint.classDef
        val requestType = requestClass.type
        val resultMatch = RequestResultFingerprint.instructionMatches
        val resultField = resultMatch[0].fieldReference
        val baseRunCallbacks = resultMatch[1].methodReference
        val executeMethod = RequestExecuteFingerprint.method

        requestClass.methods.add(
            ImmutableMethod(
                requestType,
                RUN_CALLBACKS_METHOD,
                listOf(),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                null,
                null,
                MutableMethodImplementation(1),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-super { p0 }, $baseRunCallbacks
                        return-void
                    """,
                )
            },
        )

        // Fill in the extension's placeholders.
        val hooks = mutableClassDefBy(REQUEST_HOOKS_CLASS)
        fun placeholder(name: String, body: String) =
            hooks.methods.first { it.name == name }.addInstructions(0, body)

        placeholder(
            "getResult",
            """
                check-cast p0, $requestType
                iget-object p0, p0, $resultField
                return-object p0
            """,
        )
        placeholder(
            "setResult",
            """
                check-cast p0, $requestType
                iput-object p1, p0, $resultField
                return-void
            """,
        )
        placeholder(
            "runCallbacks",
            """
                check-cast p0, $requestType
                invoke-virtual { p0 }, $requestType->$RUN_CALLBACKS_METHOD()V
                return-void
            """,
        )
        placeholder(
            "execute",
            """
                check-cast p0, $requestType
                invoke-virtual { p0 }, $requestType->${executeMethod.name}()V
                return-void
            """,
        )

        // A request answered another way (cache, merged duplicate) is not sent.
        executeMethod.addInstructions(
            0,
            """
                invoke-static { p0 }, $REQUEST_HOOKS_CLASS->beforeSend(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :send
                return-void
                :send
                nop
            """,
        )

        // The result is stored and its callbacks are about to run.
        // Several branches jump to this call, so the hook must take over its label.
        resultMatch[1].let { superCall ->
            val request = superCall.getInstruction<FiveRegisterInstruction>().registerC
            RequestResultFingerprint.method.addInstructionsAtControlFlowLabel(
                superCall.index,
                "invoke-static { v$request }, $REQUEST_HOOKS_CLASS->onSuccess(Ljava/lang/Object;)V",
            )
        }

        // Every failure and cancellation of any request passes through the base class failure method.
        Fingerprint(
            definingClass = requestClass.superclass!!,
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V",
            parameters = listOf("Ljava/lang/Throwable;"),
            filters = listOf(string("e")),
        ).method.addInstructions(
            0,
            "invoke-static { p0, p1 }, $REQUEST_HOOKS_CLASS->onFailure(Ljava/lang/Object;Ljava/lang/Throwable;)V",
        )
    }
}

/** Switches on a [REQUEST_HOOKS_CLASS] feature by making its `is...Enabled()` method return true. */
internal fun enableRequestFeature(switchMethod: String) {
    mutableClassDefBy(REQUEST_HOOKS_CLASS).methods.first { it.name == switchMethod }.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """,
    )
}
