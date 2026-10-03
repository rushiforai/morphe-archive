/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.suggested.GROUPS_YOU_SHOULD_JOIN_TYPE
import app.morphe.patches.facebook.feed.suggested.PEOPLE_YOU_MAY_KNOW_TYPE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * How the suggested groups type name is found: a tree model's `getTypeName()` that switches on the
 * type tag and answers the tag of "GroupsYouShouldJoinFeedUnit" through a string table, the way
 * the People you may know model does in 577 and 580. Each rule has a control that must fail it.
 */
class TaggedTypeNameShapesTest {
    private val friends = "FriendRequestsFeedUnit"
    private val tableOwner = "Lcom/example/Strings;"

    @Test
    fun `the tags are the ones Facebook's builds switch on`() {
        assertEquals(0x363babe0, treeTypeTag(GROUPS_YOU_SHOULD_JOIN_TYPE))
        assertEquals(0x7d6af151, treeTypeTag(friends))
        assertEquals(0xeb260fdc.toInt(), treeTypeTag(PEOPLE_YOU_MAY_KNOW_TYPE))
    }

    private fun hex(value: Int) = if (value < 0) "-0x" + Integer.toHexString(-value) else "0x" + Integer.toHexString(value)

    private fun method(
        body: String,
        name: String = "getTypeName",
        returnType: String = "Ljava/lang/String;",
        parameters: List<String> = emptyList(),
        flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        definingClass: String = "Lcom/example/Model;",
    ): Method = MutableMethod(
        ImmutableMethod(
            definingClass, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType, flags,
            null, null, ImmutableMethodImplementation(3, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, body.trimIndent()) }

    /** A string table like the one Redex outlines literals into: index 0x107 and 0x108. */
    private fun table(first: String = friends, second: String = GROUPS_YOU_SHOULD_JOIN_TYPE) = method(
        name = "name",
        parameters = listOf("I"),
        flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        definingClass = tableOwner,
        body = """
            packed-switch p0, :cases
            const-string v0, "unused"
            return-object v0
            :first
            const-string v0, "$first"
            return-object v0
            :second
            const-string v0, "$second"
            return-object v0
            :cases
            .packed-switch 0x107
                :first
                :second
            .end packed-switch
        """,
    )

    /**
     * The shared model's `getTypeName()`: a literal for People you may know, and table entries for
     * friend requests and suggested groups. [tags] picks which tags have a case, [tagField] what
     * the switch reads, and [call] the table it asks.
     */
    private fun model(
        tags: List<String> = listOf(PEOPLE_YOU_MAY_KNOW_TYPE, friends, GROUPS_YOU_SHOULD_JOIN_TYPE),
        tagField: String = "Lcom/facebook/graphservice/tree/TreeJNI;->mTypeTag:I",
        call: String = "invoke-static {v0}, $tableOwner->name(I)Ljava/lang/String;",
        name: String = "getTypeName",
        flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
    ): Method {
        val labels = mapOf(PEOPLE_YOU_MAY_KNOW_TYPE to ":pymk", friends to ":friends", GROUPS_YOU_SHOULD_JOIN_TYPE to ":groups")
        val cases = tags.sortedBy { treeTypeTag(it) }.joinToString("\n") { "${hex(treeTypeTag(it))} -> ${labels.getValue(it)}" }
        return method(
            name = name,
            flags = flags,
            body = """
                iget v0, v2, $tagField
                sparse-switch v0, :tags
                invoke-super {v2}, Lcom/facebook/graphql/modelutil/BaseModel;->getTypeName()Ljava/lang/String;
                move-result-object v0
                return-object v0
                :friends
                const/16 v0, 0x107
                goto :lookup
                :groups
                const/16 v0, 0x108
                :lookup
                $call
                move-result-object v0
                return-object v0
                :pymk
                const-string v0, "$PEOPLE_YOU_MAY_KNOW_TYPE"
                return-object v0
                :tags
                .sparse-switch
                $cases
                .end sparse-switch
            """,
        )
    }

    private fun resolving(table: Method?): (MethodReference) -> Method? =
        { call -> table?.takeIf { call.definingClass == tableOwner && call.name == it.name } }

    @Test
    fun `a tag's case that asks a string table answers the table's literal`() {
        val model = model()
        val resolve = resolving(table())
        assertTrue(answersTaggedTypeName(model, GROUPS_YOU_SHOULD_JOIN_TYPE, resolve))
        // The case before it takes a goto to the same call with its own index.
        assertEquals(friends, taggedTypeName(model, treeTypeTag(friends), resolve))
        // A literal of the model's own answers too.
        assertEquals(PEOPLE_YOU_MAY_KNOW_TYPE, taggedTypeName(model, treeTypeTag(PEOPLE_YOU_MAY_KNOW_TYPE), resolve))
        assertTrue(answersTaggedTypeName(model, PEOPLE_YOU_MAY_KNOW_TYPE, resolve))
    }

    @Test
    fun `the name has to be the table's answer for that tag's index`() {
        // The table's entries swapped: the groups tag's index now answers friend requests.
        val swapped = resolving(table(first = GROUPS_YOU_SHOULD_JOIN_TYPE, second = friends))
        assertFalse(answersTaggedTypeName(model(), GROUPS_YOU_SHOULD_JOIN_TYPE, swapped))
        assertEquals(friends, taggedTypeName(model(), treeTypeTag(GROUPS_YOU_SHOULD_JOIN_TYPE), swapped))
        // A table that can't be found answers nothing.
        assertNull(taggedTypeName(model(), treeTypeTag(GROUPS_YOU_SHOULD_JOIN_TYPE), resolving(null)))
    }

    @Test
    fun `a model without a case for the tag doesn't answer it`() {
        val model = model(tags = listOf(PEOPLE_YOU_MAY_KNOW_TYPE, friends))
        assertFalse(answersTaggedTypeName(model, GROUPS_YOU_SHOULD_JOIN_TYPE, resolving(table())))
        assertEquals(friends, taggedTypeName(model, treeTypeTag(friends), resolving(table())))
    }

    @Test
    fun `the switch has to be on the tree's type tag`() {
        val model = model(tagField = "Lcom/facebook/graphservice/tree/TreeJNI;->mOtherInt:I")
        assertFalse(answersTaggedTypeName(model, GROUPS_YOU_SHOULD_JOIN_TYPE, resolving(table())))
    }

    @Test
    fun `the table has to be a static int to String call`() {
        val virtual = model(call = "invoke-virtual {v0}, $tableOwner->name(I)Ljava/lang/String;")
        assertFalse(answersTaggedTypeName(virtual, GROUPS_YOU_SHOULD_JOIN_TYPE, resolving(table())))
        val otherShape = model(call = "invoke-static {v0}, $tableOwner->name(I)Ljava/lang/Object;")
        assertFalse(answersTaggedTypeName(otherShape, GROUPS_YOU_SHOULD_JOIN_TYPE, resolving(table())))
    }

    /** A method naming a literal the way 581 does: an index loaded straight into a string table call. */
    private fun asking(call: String, load: String = "const/16 v0, 0x108", between: String = "") = method(
        name = "report",
        returnType = "V",
        body = """
            $load
            $between
            $call
            move-result-object v0
            return-void
        """,
    )

    private val tableCall = "invoke-static {v0}, $tableOwner->name(I)Ljava/lang/String;"

    @Test
    fun `a method names a literal it holds or asks a string table for`() {
        val holds = method(name = "report", returnType = "V", body = """
            const-string v0, "$GROUPS_YOU_SHOULD_JOIN_TYPE"
            return-void
        """)
        assertTrue(namesString(holds, GROUPS_YOU_SHOULD_JOIN_TYPE, resolving(null)))
        assertTrue(namesString(asking(tableCall), GROUPS_YOU_SHOULD_JOIN_TYPE, resolving(table())))
        assertTrue(namesString(asking("invoke-static/range {v0 .. v0}, $tableOwner->name(I)Ljava/lang/String;"),
            GROUPS_YOU_SHOULD_JOIN_TYPE, resolving(table())))
        // The control: the same call with the other index names the other entry.
        assertFalse(namesString(asking(tableCall, load = "const/16 v0, 0x107"), GROUPS_YOU_SHOULD_JOIN_TYPE, resolving(table())))
        assertTrue(namesString(asking(tableCall, load = "const/16 v0, 0x107"), friends, resolving(table())))
    }

    @Test
    fun `a string table call names nothing without its index loaded right before it, or a table to read`() {
        assertFalse(namesString(asking(tableCall), GROUPS_YOU_SHOULD_JOIN_TYPE, resolving(null)))
        assertFalse(namesString(asking(tableCall, between = "const/4 v1, 0x0"), GROUPS_YOU_SHOULD_JOIN_TYPE, resolving(table())))
        assertFalse(namesString(asking(tableCall, load = "const/16 v1, 0x108"), GROUPS_YOU_SHOULD_JOIN_TYPE, resolving(table())))
        assertFalse(namesString(asking("invoke-virtual {v0}, $tableOwner->name(I)Ljava/lang/String;"),
            GROUPS_YOU_SHOULD_JOIN_TYPE, resolving(table())))
    }

    @Test
    fun `only a public instance getTypeName counts`() {
        val resolve = resolving(table())
        assertFalse(answersTaggedTypeName(model(name = "getDebugInfo"), GROUPS_YOU_SHOULD_JOIN_TYPE, resolve))
        val static = model(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        assertFalse(answersTaggedTypeName(static, GROUPS_YOU_SHOULD_JOIN_TYPE, resolve))
        val private = model(flags = AccessFlags.PRIVATE.value)
        assertFalse(answersTaggedTypeName(private, GROUPS_YOU_SHOULD_JOIN_TYPE, resolve))
    }
}
