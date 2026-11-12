/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10
 */

package app.morphe.patches.youtube.general.navigation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Test

class NavigationFeatureFlagOverrideTest {
    private val flag = 45632194L
    private val hook = "LExtension;->override(Z)Z"

    private fun method(smali: String): MutableMethod = ImmutableMethod(
        "LTest;", "test", emptyList(), "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null, null, MutableMethodImplementation(8)
    ).toMutable().apply { addInstructions(0, smali) }

    private fun MutableMethod.hookCount() = implementation!!.instructions.count {
        it.getReference<MethodReference>()?.toString() == hook
    }

    @Test
    fun reusedLiteralOverridesBothReads() {
        val method = method("""
            const-wide/32 v2, 45632194
            invoke-static {v2, v3}, LTest;->flag(J)Z
            move-result v0
            invoke-static {v2, v3}, LTest;->flag(J)Z
            move-result v0
            return-void
        """)

        assertEquals(2, method.overrideNavigationFeatureFlag(flag, hook))
        assertEquals(2, method.hookCount())
        assertEquals(0, method.overrideNavigationFeatureFlag(flag, hook))
    }

    @Test
    fun branchSharedReadIsOverriddenOnce() {
        val method = method("""
            const/4 v0, 0x0
            if-eqz v0, :other
            const-wide/32 v2, 45632194
            goto :read
            :other
            const-wide/32 v2, 45632194
            :read
            invoke-static {v2, v3}, LTest;->flag(J)Z
            move-result v0
            return-void
        """)

        assertEquals(1, method.overrideNavigationFeatureFlag(flag, hook))
        assertEquals(1, method.hookCount())
    }

    @Test
    fun unrelatedMoveResultIsNotOverridden() {
        val method = method("""
            const-wide/32 v2, 45632194
            invoke-static {}, LTest;->unrelated()Z
            move-result v0
            invoke-static {v2, v3}, LTest;->flag(J)Z
            move-result v0
            return-void
        """)

        assertEquals(1, method.overrideNavigationFeatureFlag(flag, hook))
        val instructions = method.implementation!!.instructions.toList()
        assertEquals("LTest;->flag(J)Z", instructions[3].getReference<MethodReference>().toString())
    }

    @Test
    fun overlappingWideWriteStopsTracking() {
        val method = method("""
            const-wide/32 v2, 45632194
            const-wide/16 v1, 0x0
            invoke-static {v2, v3}, LTest;->flag(J)Z
            move-result v0
            return-void
        """)

        assertEquals(0, method.overrideNavigationFeatureFlag(flag, hook))
        assertEquals(0, method.hookCount())
    }

    @Test
    fun bothConditionalPathsAndRangeReadsAreOverridden() {
        val method = method("""
            const-wide/32 v2, 45632194
            const/4 v0, 0x0
            if-eqz v0, :other
            invoke-static/range {v2 .. v3}, LTest;->flag(J)Z
            move-result v0
            return-void
            :other
            invoke-static {v2, v3}, LTest;->flag(J)Z
            move-result v0
            return-void
        """)

        assertEquals(2, method.overrideNavigationFeatureFlag(flag, hook))
        assertEquals(2, method.hookCount())
    }
}
