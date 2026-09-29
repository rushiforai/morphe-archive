/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.hook

import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.shared.AddNewEdgeToCollectionFingerprint
import app.morphe.patches.facebook.shared.FEED_STORY_CATEGORY
import app.morphe.patches.facebook.shared.FEED_UNIT_EDGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

/**
 * The feed guard's patch run over a few classes, for what the shape tests can't see: which method
 * the patch itself takes. The patcher's own lookup hands back the first method that fits, so a
 * patch that went back to it would put the guard on whichever the class walk met first. The swap
 * runnable is there too, since the patch guards both ways an edge gets into the feed.
 */
class FeedFilterHookPatchTest {
    private val builder = "Lcom/google/common/collect/ImmutableList\$Builder;"
    private val collection = "Lfixture/FeedUnitCollection;"
    private val hideEdge = "Lapp/morphe/extension/facebook/feed/FeedFilter;->hideEdge(Ljava/lang/Object;Ljava/lang/Object;)Z"

    /** The fingerprint keeps its last match, and each test here brings a context of its own. */
    @Before
    fun forgetTheLastMatch() = AddNewEdgeToCollectionFingerprint.clearMatch()

    private fun method(type: String, name: String, returnType: String, parameters: List<String>, registers: Int, vararg instructions: Instruction): Method =
        ImmutableMethod(
            type, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
            ImmutableMethodImplementation(registers, instructions.toList(), null, null),
        )

    private fun classDef(type: String, methods: List<Method>): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, methods)

    /** The edge, with the two getters the guard reads: its category, and its unit behind "inflateFeedUnit". */
    private fun edge(): ClassDef = classDef(
        FEED_UNIT_EDGE,
        listOf(
            method(
                FEED_UNIT_EDGE, "category", FEED_STORY_CATEGORY, emptyList(), 2,
                ImmutableInstruction11n(Opcode.CONST_4, 0, 0), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
            ),
            method(
                FEED_UNIT_EDGE, "unit", "Lfixture/FeedUnit;", emptyList(), 2,
                ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("inflateFeedUnit")),
                ImmutableInstruction11n(Opcode.CONST_4, 0, 0), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
            ),
        ),
    )

    /** The collection's addNewEdgeToCollection taking [parameters]: two locals, this and the parameters. */
    private fun funnel(vararg parameters: String): Method = method(
        collection, "addNewEdgeToCollection", "Z", parameters.toList(), 3 + parameters.size,
        ImmutableInstruction11n(Opcode.CONST_4, 0, 1), ImmutableInstruction11x(Opcode.RETURN, 0),
    )

    private fun Method.shape() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Method.guarded() = implementation?.instructions?.any {
        (it as? ReferenceInstruction)?.reference?.toString() == hideEdge
    } == true

    private fun Method.calls(callee: String) = implementation?.instructions?.count {
        (it as? ReferenceInstruction)?.reference?.toString() == callee
    } ?: 0

    private val swapType = "Lfixture/SwapRunnable;"

    /**
     * FeedUnitCollectionManager's swap runnable, cut down: its run() takes the edge, casts it, has
     * the collection replace the old edge with it, and holds the log line's three literals.
     */
    private fun swapRunnable(type: String = swapType): ClassDef {
        val run = MutableMethod(
            ImmutableMethod(type, "run", emptyList(), "V", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
                ImmutableMethodImplementation(8, emptyList(), null, null)),
        ).apply {
            addInstructionsWithLabels(0, """
                iget-object v5, v7, $type->holder:Lfixture/Holder;
                invoke-interface {v5}, Lfixture/Holder;->edge()Ljava/lang/Object;
                move-result-object v0
                check-cast v0, $FEED_UNIT_EDGE
                iget-object v4, v7, $type->collection:$collection
                iget-object v3, v7, $type->key:Ljava/lang/String;
                invoke-interface {v4, v0, v3}, $collection->replace(${FEED_UNIT_EDGE}Ljava/lang/String;)V
                const-string v1, "$EDGE_SWAP_DROPPED"
                const-string v2, "$SIZE_BEFORE"
                const-string v6, "$SIZE_AFTER"
                return-void
            """)
        }
        return ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf("Ljava/lang/Runnable;"),
            null, null, null, listOf(run))
    }

    /**
     * The collection's first method of the name is an overload in another shape. The guard goes on
     * the funnel anyway, first thing, so the extension is asked before the funnel does anything.
     */
    @Test
    fun `the guard goes on the one funnel in the pinned shape`() {
        val overload = funnel(builder, FEED_UNIT_EDGE)
        val funnel = funnel(builder, FEED_UNIT_EDGE, "Lfixture/Options;")
        val context = PatchContexts.of(listOf(edge(), classDef(collection, listOf(overload, funnel)), swapRunnable()))

        feedFilterHookPatch.execute(context)

        val methods = context.mutableClassDefBy(collection).methods
        assertEquals(listOf(funnel.shape()), methods.filter { it.guarded() }.map { it.shape() })
        val first = methods.single { it.shape() == funnel.shape() }.implementation!!.instructions.first()
        assertEquals("the guard's first instruction copies the edge down", Opcode.MOVE_OBJECT_FROM16, first.opcode)
    }

    /**
     * An edge swapped in over another never reaches the funnel, so the swap runnable asks the
     * extension too, once, with the same two getters, and the funnel still carries one guard.
     */
    @Test
    fun `the swap runnable asks the extension about the edge it swaps in`() {
        val funnel = funnel(builder, FEED_UNIT_EDGE, "Lfixture/Options;")
        val context = PatchContexts.of(listOf(edge(), classDef(collection, listOf(funnel)), swapRunnable()))

        feedFilterHookPatch.execute(context)

        val run = context.mutableClassDefBy(swapType).methods.single { it.name == "run" }
        assertEquals(1, run.calls(HIDE_SWAPPED_EDGE))
        assertEquals(1, run.calls("$FEED_UNIT_EDGE->category()$FEED_STORY_CATEGORY"))
        assertEquals(1, run.calls("$FEED_UNIT_EDGE->unit()Lfixture/FeedUnit;"))
        assertEquals("the swap runnable has no funnel guard", 0, run.calls(hideEdge))
        assertEquals(1, context.mutableClassDefBy(collection).methods.single().calls(hideEdge))
    }

    /**
     * A build without the swap runnable, or with two, stops the patch naming what it looked for,
     * and the funnel is left as it was: applying would claim a guard on a way in that has none.
     */
    @Test
    fun `no swap runnable, or two, stops the patch and changes nothing`() {
        for (swaps in listOf(emptyList(), listOf(swapRunnable(), swapRunnable("Lfixture/OtherSwapRunnable;")))) {
            val funnel = funnel(builder, FEED_UNIT_EDGE, "Lfixture/Options;")
            val context = PatchContexts.of(listOf(edge(), classDef(collection, listOf(funnel))) + swaps)

            val refused = assertThrows(PatchException::class.java) { feedFilterHookPatch.execute(context) }

            val message = refused.message.orEmpty()
            assertTrue(message, message.contains("\"$EDGE_SWAP_DROPPED\"") && message.contains("found ${swaps.size}"))
            assertEquals("methods given the guard", 0, context.mutableClassDefBy(collection).methods.single().calls(hideEdge))
        }
    }

    /**
     * Two methods in the pinned shape, and the one the class walk meets first is the wrong one: a
     * batch overload taking another options class. The patcher's own lookup takes it, which would
     * guard that one and let every edge through the real funnel pass unchecked. The patch stops
     * instead, naming both, and leaves each as it was.
     */
    @Test
    fun `a second funnel in the pinned shape stops the patch though the walk meets the wrong one first`() {
        val batch = funnel(builder, FEED_UNIT_EDGE, "Lfixture/Batch;")
        val funnel = funnel(builder, FEED_UNIT_EDGE, "Lfixture/Options;")
        val context = PatchContexts.of(listOf(edge(), classDef(collection, listOf(batch, funnel)), swapRunnable()))
        val firstMatch = with(context) { AddNewEdgeToCollectionFingerprint.originalMethod }
        assertEquals("the patcher's own lookup takes the batch overload", batch.shape(), firstMatch.shape())
        AddNewEdgeToCollectionFingerprint.clearMatch()

        val refused = assertThrows(PatchException::class.java) { feedFilterHookPatch.execute(context) }

        val message = refused.message.orEmpty()
        assertTrue(message, message.contains("expected exactly one addNewEdgeToCollection(ImmutableList\$Builder, GraphQLFeedUnitEdge, object)Z, found 2"))
        assertTrue(message, message.contains(batch.shape()))
        assertTrue(message, message.contains(funnel.shape()))
        assertEquals(
            "methods given the guard",
            emptyList<String>(),
            context.mutableClassDefBy(collection).methods.filter { it.guarded() }.map { it.shape() },
        )
        assertEquals("swap runnable given the guard", 0,
            context.mutableClassDefBy(swapType).methods.single().calls(HIDE_SWAPPED_EDGE))
    }
}
