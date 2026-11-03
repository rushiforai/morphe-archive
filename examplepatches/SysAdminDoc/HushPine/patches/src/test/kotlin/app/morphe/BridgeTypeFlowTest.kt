/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.addInstructionsWithLabels
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Test

/** Dex literals are untyped, so the checker takes them as whatever reads them, the way ART does. */
class BridgeTypeFlowTest {
    private fun method(registers: Int, smali: String) = MutableMethod(ImmutableMethod("Lapp/morphe/Example;", "example",
        emptyList(), "V", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, null, null,
        ImmutableMethodImplementation(registers, emptyList(), null, null))).apply {
        addInstructionsWithLabels(0, smali)
    }

    @Test fun `a literal reads as an int or a float, whichever takes it`() {
        // TikTok's ranking tab strip hands const/high16 14.0f to setTextSize(F) on 47.4.3.
        val sizes = method(2, """
            const/high16 v0, 0x41600000
            invoke-static { v0 }, Lapp/morphe/Example;->size(F)V
            const/16 v0, 0xe
            invoke-static { v0 }, Lapp/morphe/Example;->count(I)V
            const-wide v0, 0x402c000000000000L
            invoke-static { v0, v1 }, Lapp/morphe/Example;->scale(D)V
            return-void
        """)
        assertEquals(emptyList<BridgeTypeFlow.Problem>(), BridgeTypeFlow.check(sizes))
    }

    @Test fun `a literal other than zero still isn't a reference`() {
        val wrong = method(1, """
            const/16 v0, 0xe
            invoke-static { v0 }, Lapp/morphe/Example;->name(Ljava/lang/String;)V
            return-void
        """)
        assertEquals(BridgeTypeFlow.check(wrong).toString(), 1, BridgeTypeFlow.check(wrong).size)
    }

    /** v0 is [first] on one path and [second] on the other when it reaches [use]. */
    private fun merged(first: String, second: String, use: String) = method(2, """
        invoke-static { }, Lapp/morphe/Example;->flag()Z
        move-result v1
        $first
        if-eqz v1, :use
        $second
        :use
        $use
        return-void
    """)

    @Test fun `a null that met a number is a number`() {
        val wrong = merged("const/4 v0, 0x0", "const/16 v0, 0xe",
            "invoke-static { v0 }, Lapp/morphe/Example;->name(Ljava/lang/String;)V")
        assertEquals(BridgeTypeFlow.check(wrong).toString(), 1, BridgeTypeFlow.check(wrong).size)
    }

    @Test fun `a literal that met an int is an int`() {
        val count = "invoke-static { }, Lapp/morphe/Example;->count()I\n        move-result v0"
        assertEquals(emptyList<BridgeTypeFlow.Problem>(), BridgeTypeFlow.check(merged("const/16 v0, 0xe", count,
            "invoke-static { v0 }, Lapp/morphe/Example;->count(I)V")))
        val wrong = merged("const/16 v0, 0xe", count, "invoke-static { v0 }, Lapp/morphe/Example;->size(F)V")
        assertEquals(BridgeTypeFlow.check(wrong).toString(), 1, BridgeTypeFlow.check(wrong).size)
    }

    @Test fun `an interface parameter takes the Object two references met as`() {
        // TikTok's ranking row on 47.4.3 hands a TextView's text, or "" when that's null, to
        // SpannableStringBuilder(CharSequence). ART lets any reference into an interface.
        val text = "invoke-static { }, Lapp/morphe/Example;->text()Ljava/lang/CharSequence;\n        move-result-object v0"
        assertEquals(emptyList<BridgeTypeFlow.Problem>(), BridgeTypeFlow.check(merged(text, "const-string v0, \"\"",
            "invoke-static { v0 }, Lapp/morphe/Example;->show(Ljava/lang/CharSequence;)V")))
        val wrong = merged(text, "const-string v0, \"\"", "invoke-static { v0 }, Lapp/morphe/Example;->name(Ljava/lang/String;)V")
        assertEquals(BridgeTypeFlow.check(wrong).toString(), 1, BridgeTypeFlow.check(wrong).size)
    }

    @Test fun `an Object parameter takes references only`() {
        val wrong = method(1, """
            const/16 v0, 0xe
            invoke-static { v0 }, Lapp/morphe/Example;->any(Ljava/lang/Object;)V
            invoke-static { }, Lapp/morphe/Example;->count()I
            move-result v0
            invoke-static { v0 }, Lapp/morphe/Example;->any(Ljava/lang/Object;)V
            const-string v0, "fine"
            invoke-static { v0 }, Lapp/morphe/Example;->any(Ljava/lang/Object;)V
            const/4 v0, 0x0
            invoke-static { v0 }, Lapp/morphe/Example;->any(Ljava/lang/Object;)V
            return-void
        """)
        assertEquals(BridgeTypeFlow.check(wrong).toString(), 2, BridgeTypeFlow.check(wrong).size)
    }

    @Test fun `a wide zero fills both halves of a long`() {
        val zero = method(2, """
            const-wide/16 v0, 0x0
            invoke-static { v0, v1 }, Lapp/morphe/Example;->delay(J)V
            return-void
        """)
        assertEquals(emptyList<BridgeTypeFlow.Problem>(), BridgeTypeFlow.check(zero))
    }
}
