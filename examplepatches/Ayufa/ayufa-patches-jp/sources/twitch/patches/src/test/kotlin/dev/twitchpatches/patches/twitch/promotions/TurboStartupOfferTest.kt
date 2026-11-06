package dev.twitchpatches.patches.twitch.promotions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.assertEquals
import org.junit.Test

class TurboStartupOfferTest {
    private fun coroutine(modelArgument: String = "v2") = ImmutableMethod("Lsynthetic/Coroutine;", "invokeSuspend",
        listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)), "Ljava/lang/Object;",
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(6)).toMutable().apply {
        addInstructionsWithLabels(0, """
            const-string v0, "turboAppStartUpsellHelper"
            sget-object v2, Lsynthetic/Turbo;->INSTANCE:Lsynthetic/Turbo;
            iget-object v1, v0, Lsynthetic/Navigation;->fragment:Lsynthetic/Fragment;
            invoke-virtual {v0, v1, $modelArgument}, Lsynthetic/Navigation;->show(Lsynthetic/Fragment;Lsynthetic/Event;)V
            return-object p1
        """)
    }

    @Test fun resolvesOnlyTheTurboNavigationCallWithoutChangingCoroutineState() {
        val method = coroutine()
        assertEquals(3, turboStartupDispatch(method, "Lsynthetic/Turbo;"))
        assertEquals(Opcode.RETURN_OBJECT, method.code()[4].opcode)
        assertEquals(6, method.implementation?.registerCount)
    }

    @Test(expected = PatchException::class) fun rejectsAChangedNavigationArgument() {
        turboStartupDispatch(coroutine("v3"), "Lsynthetic/Turbo;")
    }

    @Test(expected = PatchException::class) fun rejectsAnUnrelatedPromotionModel() {
        turboStartupDispatch(coroutine(), "Lsynthetic/OtherOffer;")
    }
}
