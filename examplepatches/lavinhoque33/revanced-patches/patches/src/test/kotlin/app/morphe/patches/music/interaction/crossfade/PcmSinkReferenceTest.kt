/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.patches.music.interaction.crossfade

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Test

class PcmSinkReferenceTest {
    private fun method(body: String): MutableMethod = ImmutableMethod(
        "LTestSink;", "configure", listOf(ImmutableMethodParameter("LTestConfig;", null, null)), "V",
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(5)
    ).toMutable().apply { addInstructions(0, body) }

    @Test
    fun parameterReusedForBooleanDoesNotReplaceSourceFormatReference() {
        val native = method(
            """
                iget-object v2, p1, LTestConfig;->format:LTestFormat;
                const/4 p1, 0x1
                return-void
            """
        )
        assertEquals(2, native.requireStableReferenceAtReturns(0))
    }

    @Test(expected = IllegalStateException::class)
    fun rejectsAReusedFormatRegister() {
        method(
            """
                iget-object v2, p1, LTestConfig;->format:LTestFormat;
                const/4 v2, 0x1
                return-void
            """
        ).requireStableReferenceAtReturns(0)
    }

    @Test(expected = IllegalStateException::class)
    fun rejectsAWideWriteOverlappingTheFormatRegister() {
        method(
            """
                iget-object v2, p1, LTestConfig;->format:LTestFormat;
                const-wide/16 v1, 0x1
                return-void
            """
        ).requireStableReferenceAtReturns(0)
    }

    @Test(expected = IllegalStateException::class)
    fun rejectsBranchThatBypassesTheOnlyFormatRead() {
        method(
            """
                if-eqz p1, :done
                iget-object v2, p1, LTestConfig;->format:LTestFormat;
                :done
                return-void
            """
        ).requireStableReferenceAtReturns(1)
    }

    @Test
    fun acceptsConditionalPrefixThatStillPassesTheFormatRead() {
        val native = method(
            """
                if-eqz p1, :read
                const/4 v0, 0x0
                :read
                iget-object v2, p1, LTestConfig;->format:LTestFormat;
                return-void
            """
        )
        assertEquals(2, native.requireStableReferenceAtReturns(2))
    }

    @Test(expected = IllegalStateException::class)
    fun rejectsSuccessfulExitBeforeFormatRead() {
        method(
            """
                return-void
                iget-object v2, p1, LTestConfig;->format:LTestFormat;
                return-void
            """
        ).requireStableReferenceAtReturns(1)
    }

    @Test
    fun acceptsFormatRegisterReuseOnAThrowingOnlyBranch() {
        val native = method(
            """
                iget-object v2, p1, LTestConfig;->format:LTestFormat;
                if-eqz p1, :failure
                return-void
                :failure
                const-string v2, "Invalid output channel config"
                new-instance v0, Ljava/lang/RuntimeException;
                invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V
                throw v0
            """
        )
        assertEquals(2, native.requireStableReferenceAtReturns(0))
    }

    @Test(expected = IllegalStateException::class)
    fun rejectsReusedFormatOnABranchThatRejoinsASuccessfulExit() {
        method(
            """
                iget-object v2, p1, LTestConfig;->format:LTestFormat;
                if-eqz p1, :done
                const/4 v2, 0x1
                :done
                return-void
            """
        ).requireStableReferenceAtReturns(0)
    }

    @Test(expected = IllegalStateException::class)
    fun exceptionHandlersArePartOfTheSuccessfulExitGraph() {
        val native = method(
            """
                iget-object v2, p1, LTestConfig;->format:LTestFormat;
                const/4 v2, 0x1
                new-instance v0, Ljava/lang/RuntimeException;
                invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V
                throw v0
                move-exception v0
                return-void
            """
        )
        native.implementation!!.apply {
            addCatch(
                "Ljava/lang/RuntimeException;",
                newLabelForIndex(4), newLabelForIndex(5), newLabelForIndex(5),
            )
        }
        native.requireStableReferenceAtReturns(0)
    }

    @Test
    fun acceptsEarlierScratchUseBeforeTheDominatingFormatRead() {
        val native = method(
            """
                const/4 v2, 0x1
                iget-object v2, p1, LTestConfig;->format:LTestFormat;
                return-void
            """
        )
        assertEquals(2, native.requireStableReferenceAtReturns(1))
    }
}
