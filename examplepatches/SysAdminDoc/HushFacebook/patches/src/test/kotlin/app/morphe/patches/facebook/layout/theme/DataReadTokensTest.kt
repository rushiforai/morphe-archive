/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * dataReadTokens over stand-in classes: the shapes a look back up a method can miss (a branch, a
 * token constant handed to a helper, a helper's helper) and the calls it can't decide, which it
 * hands on for a person to look at instead of dropping.
 */
class DataReadTokensTest {
    private val tokenType = "Lfixture/Token;"
    private val attributeField = "$tokenType->attr:I"
    private val theme = "Landroid/content/res/Resources\$Theme;"
    private val resolve = "$theme->resolveAttribute(ILandroid/util/TypedValue;Z)Z"
    private val constants = TokenConstants(
        tokenType,
        mapOf("ACCENT" to 0x7f040001, "WASH" to 0x7f040002, "DIVIDER" to 0x7f040003, "PRIMARY_TEXT" to 0x7f040004,
            "SURFACE_BACKGROUND" to 0x7f040005, "DISABLED_TEXT" to 0x7f040006),
        mapOf("A" to "ACCENT", "B" to "WASH", "C" to "DIVIDER", "D" to "PRIMARY_TEXT", "E" to "SURFACE_BACKGROUND",
            "F" to "DISABLED_TEXT"),
    )

    private fun method(type: String, name: String, parameters: List<String>, returns: String, smali: String): MutableMethod {
        val flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
        return MutableMethod(
            ImmutableMethod(
                type, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
                ImmutableMethodImplementation(8 + parameters.size, emptyList(), null, null),
            ),
        ).apply { addInstructionsWithLabels(0, smali) }
    }

    private fun scan(vararg methods: Method): DataReadScan {
        val classes: List<ClassDef> = methods.groupBy { it.definingClass }.map { (type, members) ->
            ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, emptyList(), members)
        }
        return dataReadTokens({ visit -> classes.forEach(visit) }, constants, attributeField)
    }

    /** Resolves the attribute in v0 into a new TypedValue and returns its data, never its type. */
    private val readData = """
        new-instance v1, Landroid/util/TypedValue;
        invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V
        const/4 v2, 0x1
        invoke-virtual {p0, v0, v1, v2}, $resolve
        iget v3, v1, Landroid/util/TypedValue;->data:I
        return v3
    """

    @Test
    fun `both arms of a branch count`() {
        val found = scan(method("Lfixture/Branch;", "colour", listOf(theme, "Z"), "I", """
            if-eqz p1, :wash
            const v0, 0x7f040001
            goto :read
            :wash
            const v0, 0x7f040002
            :read
            $readData
        """))
        assertEquals(setOf("ACCENT", "WASH"), found.tokens)
    }

    @Test
    fun `a value written over, or written on a path that leaves before the call, doesn't count`() {
        val overwritten = scan(method("Lfixture/Over;", "colour", listOf(theme), "I", """
            const v0, 0x7f040001
            const v0, 0x7f040002
            $readData
        """))
        assertEquals(setOf("WASH"), overwritten.tokens)
        val early = scan(method("Lfixture/Early;", "colour", listOf(theme, "Z"), "I", """
            if-eqz p1, :read
            const v0, 0x7f040003
            return v0
            :read
            const v0, 0x7f040004
            $readData
        """))
        assertEquals(setOf("PRIMARY_TEXT"), early.tokens)
    }

    @Test
    fun `a write that comes back round a loop counts`() {
        val found = scan(method("Lfixture/Loop;", "colour", listOf(theme, "Z"), "I", """
            const v0, 0x7f040001
            :again
            new-instance v1, Landroid/util/TypedValue;
            invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V
            const/4 v2, 0x1
            invoke-virtual {p0, v0, v1, v2}, $resolve
            iget v3, v1, Landroid/util/TypedValue;->data:I
            const v0, 0x7f040002
            if-nez p1, :again
            return v3
        """))
        assertEquals(setOf("ACCENT", "WASH"), found.tokens)
    }

    @Test
    fun `a switch case, and a catch handler from what can throw, bring the values from before them`() {
        val switched = scan(method("Lfixture/Switch;", "colour", listOf(theme, "I"), "I", """
            const v0, 0x7f040001
            packed-switch p1, :cases
            const v0, 0x7f040002
            :case
            $readData
            :cases
            .packed-switch 0x0
                :case
            .end packed-switch
        """))
        assertEquals(setOf("ACCENT", "WASH"), switched.tokens)
        // addInstructionsWithLabels leaves .catch out, so the try block covering 1 and 2 is added by hand.
        // A const can't throw, so the DIVIDER it writes over never reaches the handler; the call after it can.
        val caught = scan(method("Lfixture/Catch;", "colour", listOf(theme), "I", """
            const v0, 0x7f040003
            const v0, 0x7f040004
            invoke-static {}, Lfixture/Attrs;->next()I
            return v0
            move-exception v4
            $readData
        """).apply {
            val code = implementation!!
            code.addCatch("Ljava/lang/Exception;", code.newLabelForIndex(1), code.newLabelForIndex(3), code.newLabelForIndex(4))
        })
        assertEquals(setOf("PRIMARY_TEXT"), caught.tokens)
        // A call that can throw before the write over it hands DIVIDER to the handler too (try block 1 to 3).
        val thrownFirst = scan(method("Lfixture/CatchFirst;", "colour", listOf(theme), "I", """
            const v0, 0x7f040003
            invoke-static {}, Lfixture/Attrs;->next()I
            const v0, 0x7f040004
            invoke-static {}, Lfixture/Attrs;->next()I
            return v0
            move-exception v4
            $readData
        """).apply {
            val code = implementation!!
            code.addCatch("Ljava/lang/Exception;", code.newLabelForIndex(1), code.newLabelForIndex(4), code.newLabelForIndex(5))
        })
        assertEquals(setOf("DIVIDER", "PRIMARY_TEXT"), thrownFirst.tokens)
    }

    @Test
    fun `a token constant handed to a helper counts`() {
        val helper = method("Lfixture/Helper;", "colour", listOf(theme, tokenType), "I", """
            iget v0, p1, $attributeField
            $readData
        """)
        val caller = method("Lfixture/Caller;", "draw", listOf(theme), "I", """
            sget-object v4, $tokenType->C:$tokenType
            invoke-static {p0, v4}, Lfixture/Helper;->colour(${theme}$tokenType)I
            move-result v5
            return v5
        """)
        assertEquals(setOf("DIVIDER"), scan(helper, caller).tokens)
    }

    @Test
    fun `a helper's helper counts`() {
        val inner = method("Lfixture/Inner;", "colour", listOf(theme, "I"), "I", """
            move v0, p1
            $readData
        """)
        val outer = method("Lfixture/Outer;", "colour", listOf(theme, "I"), "I", """
            invoke-static {p0, p1}, Lfixture/Inner;->colour(${theme}I)I
            move-result v5
            return v5
        """)
        val caller = method("Lfixture/Caller;", "draw", listOf(theme), "I", """
            const v4, 0x7f040004
            invoke-static {p0, v4}, Lfixture/Outer;->colour(${theme}I)I
            move-result v5
            return v5
        """)
        assertEquals(setOf("PRIMARY_TEXT"), scan(inner, outer, caller).tokens)
    }

    @Test
    fun `a method that hands the value on, or checks type, isn't counted, and the hand-on is listed`() {
        val handsOn = method("Lfixture/Wrapper;", "resolve", listOf(theme), "Landroid/util/TypedValue;", """
            const v0, 0x7f040005
            new-instance v1, Landroid/util/TypedValue;
            invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V
            const/4 v2, 0x1
            invoke-virtual {p0, v0, v1, v2}, $resolve
            return-object v1
        """)
        val checks = method("Lfixture/Checked;", "colour", listOf(theme), "I", """
            const v0, 0x7f040006
            new-instance v1, Landroid/util/TypedValue;
            invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V
            const/4 v2, 0x1
            invoke-virtual {p0, v0, v1, v2}, $resolve
            iget v3, v1, Landroid/util/TypedValue;->type:I
            iget v3, v1, Landroid/util/TypedValue;->data:I
            return v3
        """)
        val found = scan(handsOn, checks)
        assertEquals(emptySet<String>(), found.tokens)
        assertEquals(mapOf("SURFACE_BACKGROUND" to setOf("Lfixture/Wrapper;->resolve($theme)Landroid/util/TypedValue;")),
            found.unchecked)
        assertEquals(emptySet<String>(), found.unresolved)
    }

    @Test
    fun `a data read the scan can't follow is listed`() {
        val found = scan(method("Lfixture/Lookup;", "colour", listOf(theme), "I", """
            invoke-static {}, Lfixture/Attrs;->next()I
            move-result v0
            $readData
        """))
        assertEquals(emptySet<String>(), found.tokens)
        assertEquals(1, found.unresolved.size)
        assertTrue(found.unresolved.single(), found.unresolved.single().startsWith("Lfixture/Lookup;->colour("))
    }

    /** A method reading type for only one of its two calls can still read the other as data. */
    @Test
    fun `a call it can't follow in a partly checked method is listed`() {
        val found = scan(method("Lfixture/Partly;", "colour", listOf(theme), "I", """
            const v0, 0x7f040001
            new-instance v1, Landroid/util/TypedValue;
            invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V
            const/4 v2, 0x1
            invoke-virtual {p0, v0, v1, v2}, $resolve
            iget v3, v1, Landroid/util/TypedValue;->type:I
            invoke-static {}, Lfixture/Attrs;->next()I
            move-result v0
            invoke-virtual {p0, v0, v1, v2}, $resolve
            iget v3, v1, Landroid/util/TypedValue;->data:I
            return v3
        """))
        assertEquals(emptySet<String>(), found.tokens)
        assertEquals(mapOf("ACCENT" to setOf("Lfixture/Partly;->colour($theme)I")), found.unchecked)
        assertEquals(listOf("Lfixture/Partly;->colour($theme)I@8"), found.unresolved.toList())
    }

    /** A helper reached only through another class's name, a subclass's or an interface's, has no caller the scan sees. */
    @Test
    fun `a helper no call reaches is listed`() {
        val helper = method("Lfixture/Helper;", "colour", listOf(theme, "I"), "I", """
            move v0, p1
            $readData
        """)
        val caller = method("Lfixture/Caller;", "draw", listOf(theme), "I", """
            const v4, 0x7f040004
            invoke-static {p0, v4}, Lfixture/SubHelper;->colour(${theme}I)I
            move-result v5
            return v5
        """)
        val found = scan(helper, caller)
        assertEquals(emptySet<String>(), found.tokens)
        assertEquals(setOf("Lfixture/Helper;->colour(${theme}I)I: no caller"), found.unresolved)
    }
}
