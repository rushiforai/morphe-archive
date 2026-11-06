package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.assertEquals
import org.junit.Test

class NativeTokenContractTest {
    private fun observerMethod(name: String, parameter: String) = ImmutableMethod("Lsynthetic/Observer;", name,
        listOf(ImmutableMethodParameter(parameter, null, null)), "V", AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value,
        null, null, null)

    @Test fun observerCallbacksResolveAfterIndependentMethodRenaming() {
        val callbacks = resolveTokenObserver(listOf(observerMethod("success", "Ljava/lang/Object;"),
            observerMethod("failure", "Ljava/lang/Throwable;"), observerMethod("cancel", "Lsynthetic/Disposable;")))
        assertEquals("success", callbacks.success.name)
        assertEquals("failure", callbacks.error.name)
        assertEquals("cancel", callbacks.subscribed.name)
    }

    @Test(expected = PatchException::class) fun ambiguousObserverErrorsAreRejected() {
        resolveTokenObserver(listOf(observerMethod("success", "Ljava/lang/Object;"),
            observerMethod("failure", "Ljava/lang/Throwable;"), observerMethod("other", "Ljava/lang/Throwable;"),
            observerMethod("cancel", "Lsynthetic/Disposable;")))
    }

    private fun method(body: String) = ImmutableMethod("Lsynthetic/Token;", "request",
        listOf(ImmutableMethodParameter("J", null, null), ImmutableMethodParameter("Z", null, null)), "V",
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(6)).toMutable().apply {
            addInstructionsWithLabels(0, body)
        }

    @Test fun parameterWordIncludesReceiverAndWideArguments() { assertEquals(3, parameterWord(method("return-void"), 1)) }

    @Test fun literalResolutionUsesTheLastRealRegisterWrite() {
        val method = method("""
            const/16 v0, 335
            const/16 v0, 24
            invoke-static/range {v0 .. v0}, Lsynthetic/Query;->flags(I)V
            return-void
        """)
        assertEquals(24, method.literalBefore(2, 0))
        assertEquals(listOf(0), invokeRegisters(method.code()[2]))
    }

    @Test(expected = PatchException::class) fun overwrittenLiteralCannotBeReused() {
        method("""
            const/16 v0, 335
            move-object v0, p0
            invoke-static/range {v0 .. v0}, Lsynthetic/Query;->value(Ljava/lang/Object;)V
            return-void
        """).literalBefore(2, 0)
    }
}
