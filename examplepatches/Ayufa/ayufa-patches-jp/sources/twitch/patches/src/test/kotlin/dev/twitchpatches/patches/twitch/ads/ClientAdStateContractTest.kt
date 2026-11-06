package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Test

class ClientAdStateContractTest {
    private fun constructor(condition: String = "if-eqz p3, :disabled", clobber: String = "") =
        ImmutableMethod("Lsynthetic/Presenter;", "<init>",
            listOf("J", "Z").map { ImmutableMethodParameter(it, null, null) }, "V",
            AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value, null, null,
            MutableMethodImplementation(12)).toMutable().apply {
            addInstructionsWithLabels(0, """
                invoke-direct {p0}, Ljava/lang/Object;-><init>()V
                $condition
                new-instance v7, Lsynthetic/Active;
                invoke-direct {v7}, Lsynthetic/Active;-><init>()V
                :merge
                move-object v1, v7
                goto :machine
                :disabled
                sget-object v7, Lsynthetic/Disabled;->INSTANCE:Lsynthetic/Disabled;
                goto :merge
                :machine
                new-instance v0, Ltv/twitch/android/core/mvp/presenter/StateMachine;
                $clobber
                invoke-direct/range {v0 .. v6}, Ltv/twitch/android/core/mvp/presenter/StateMachine;-><init>(Ltv/twitch/android/core/mvp/presenter/PresenterState;Ltv/twitch/android/core/mvp/viewdelegate/EventDispatcher;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Ljava/lang/String;I)V
                return-void
            """)
        }

    @Test fun provesDisabledStateThroughMergeAndWideParameterRegisters() {
        assertEquals("Lsynthetic/Disabled;", disabledClientAdState(constructor()).type)
    }

    @Test(expected = PatchException::class) fun reversedBooleanCannotSelectActiveStateWhenBlocking() {
        disabledClientAdState(constructor("if-nez p3, :disabled"))
    }

    @Test(expected = PatchException::class) fun clobberedInitialStateStopsPatching() {
        disabledClientAdState(constructor(clobber = "const/4 v1, 0"))
    }
}
