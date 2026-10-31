/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.hook

import app.morphe.PatchContexts
import app.morphe.RepoFiles
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.shared.AddNewEdgeToCollectionFingerprint
import app.morphe.patches.facebook.shared.FEED_STORY_CATEGORY
import app.morphe.patches.facebook.shared.FEED_UNIT_EDGE
import app.morphe.patches.facebook.shared.outlinedFunnelBody
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
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

    /** The collection's addNewEdgeToCollection taking [parameters]: one local, as 583 has, this and the parameters. */
    private fun funnel(vararg parameters: String): Method = method(
        collection, "addNewEdgeToCollection", "Z", parameters.toList(), 2 + parameters.size,
        ImmutableInstruction11n(Opcode.CONST_4, 0, 1), ImmutableInstruction11x(Opcode.RETURN, 0),
    )

    private fun Method.shape() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Method.guarded() = implementation?.instructions?.any {
        (it as? ReferenceInstruction)?.reference?.toString() == HIDES_EDGE
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
        assertEquals("the guard's first instruction calls the helper", HIDES_EDGE,
            (first as ReferenceInstruction).reference.toString())
        assertEquals("the guard reaches the edge by a range call", Opcode.INVOKE_STATIC_RANGE, first.opcode)
    }

    /**
     * The helper the patch adds to the edge class reads both getters, hands them to the extension
     * once and returns its answer, and it's the only method that asks.
     */
    @Test
    fun `the edge helper reads both getters and asks the extension once`() {
        val funnel = funnel(builder, FEED_UNIT_EDGE, "Lfixture/Options;")
        val context = PatchContexts.of(listOf(edge(), classDef(collection, listOf(funnel)), swapRunnable()))

        feedFilterHookPatch.execute(context)

        val helper = context.mutableClassDefBy(FEED_UNIT_EDGE).methods.single { it.name == HIDES_EDGE_HELPER }
        assertTrue(AccessFlags.STATIC.isSet(helper.accessFlags))
        assertEquals(HIDES_EDGE, "${helper.definingClass}->${helper.name}(${helper.parameterTypes.joinToString("")})${helper.returnType}")
        assertEquals(1, helper.calls(hideEdge))
        assertEquals(1, helper.calls("$FEED_UNIT_EDGE->category()$FEED_STORY_CATEGORY"))
        assertEquals(1, helper.calls("$FEED_UNIT_EDGE->unit()Lfixture/FeedUnit;"))
        assertEquals("the funnel calls the helper, not the extension", 0,
            context.mutableClassDefBy(collection).methods.single().calls(hideEdge))
    }

    /**
     * The receipt holds a patched build to one helper call, first thing, in the one method logging
     * both of the funnel body's literals, and to one extension call, in the helper, by rules in
     * scripts/injected-mutation-contracts.txt.
     */
    @Test
    fun `the contract file holds the funnel guard and its helper`() {
        val rules = File(RepoFiles.root, "scripts/injected-mutation-contracts.txt").readLines()
            .map { it.trim() }
            .filter { !it.startsWith("#") && (it.contains(HIDES_EDGE) || it.contains(hideEdge)) }
        assertEquals(
            listOf(
                "start-call $HIDES_EDGE holding eof_edge_added_to_ui FeedEdgeAddedToUi",
                "once-call $HIDES_EDGE holding eof_edge_added_to_ui FeedEdgeAddedToUi",
                "single-call $hideEdge in $HIDES_EDGE_HELPER",
            ),
            rules,
        )
    }

    /**
     * 583's funnel only hands its edge to a static method of its class, which the feed's batch add
     * calls too, so the guard goes on that method. A funnel doing anything more keeps the guard.
     */
    @Test
    fun `a funnel that only wraps its body hands the guard to the body`() {
        val bodyShape = listOf("Lfixture/Options;", collection, FEED_UNIT_EDGE, builder, "Ljava/lang/Long;")
        val body = ImmutableMethod(
            collection, "A06", bodyShape.map { ImmutableMethodParameter(it, null, null) }, "Z",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value, null, null,
            ImmutableMethodImplementation(7, listOf(
                ImmutableInstruction11n(Opcode.CONST_4, 0, 1), ImmutableInstruction11x(Opcode.RETURN, 0)), null, null),
        )
        val bodyCall = ImmutableMethodReference(collection, "A06", bodyShape, "Z")
        // this v1, the builder v2, the edge v3, the options v4: the body takes options, this, edge, builder, null.
        val wrapper = method(collection, "addNewEdgeToCollection", "Z", listOf(builder, FEED_UNIT_EDGE, "Lfixture/Options;"), 5,
            ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
            ImmutableInstruction35c(Opcode.INVOKE_STATIC, 5, 4, 1, 3, 2, 0, bodyCall),
            ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
            ImmutableInstruction11x(Opcode.RETURN, 0))
        val context = PatchContexts.of(listOf(edge(), classDef(collection, listOf(wrapper, body)), swapRunnable()))

        feedFilterHookPatch.execute(context)

        val methods = context.mutableClassDefBy(collection).methods
        assertEquals(listOf("A06"), methods.filter { it.guarded() }.map { it.name })
        val first = methods.single { it.name == "A06" }.implementation!!.instructions.first() as RegisterRangeInstruction
        assertEquals("the guard reads the body's edge, p2", 7 - 5 + 2, first.startRegister)

        // The edge handed on from another register, or a wrapper that branches, isn't only a wrapper.
        val swapped = method(collection, "addNewEdgeToCollection", "Z", listOf(builder, FEED_UNIT_EDGE, "Lfixture/Options;"), 5,
            ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
            ImmutableInstruction35c(Opcode.INVOKE_STATIC, 5, 4, 1, 2, 2, 0, bodyCall),
            ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
            ImmutableInstruction11x(Opcode.RETURN, 0))
        assertNull(outlinedFunnelBody(swapped))
        assertEquals("A06", outlinedFunnelBody(wrapper)?.name)
    }

    /**
     * 585's funnel hands its edge to a private instance method of its class, called on `this` with
     * invoke-direct, and the feed's batch add calls that method too. The guard goes there as well, and
     * the wrapper stays a branch-free hand-off, which Hide Reels in the feed reads after the guard.
     */
    @Test
    fun `a funnel that wraps a private instance body hands the guard to the body`() {
        val bodyShape = listOf("Lfixture/Options;", FEED_UNIT_EDGE, builder)
        val body = ImmutableMethod(
            collection, "A0D", bodyShape.map { ImmutableMethodParameter(it, null, null) }, "Z",
            AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, null, null,
            ImmutableMethodImplementation(5, listOf(
                ImmutableInstruction11n(Opcode.CONST_4, 0, 1), ImmutableInstruction11x(Opcode.RETURN, 0)), null, null),
        )
        val bodyCall = ImmutableMethodReference(collection, "A0D", bodyShape, "Z")
        // this v1, the builder v2, the edge v3, the options v4: the body takes this, options, edge, builder.
        fun wrapperCalling(receiver: Int, edge: Int) = method(
            collection, "addNewEdgeToCollection", "Z", listOf(builder, FEED_UNIT_EDGE, "Lfixture/Options;"), 5,
            ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 4, receiver, 4, edge, 2, 0, bodyCall),
            ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
            ImmutableInstruction11x(Opcode.RETURN, 0),
        )
        val wrapper = wrapperCalling(1, 3)
        val context = PatchContexts.of(listOf(edge(), classDef(collection, listOf(wrapper, body)), swapRunnable()))

        feedFilterHookPatch.execute(context)

        val methods = context.mutableClassDefBy(collection).methods
        assertEquals(listOf("A0D"), methods.filter { it.guarded() }.map { it.name })
        assertEquals("the wrapper keeps no guard", 0, methods.single { it.name == "addNewEdgeToCollection" }.calls(HIDES_EDGE))
        val first = methods.single { it.name == "A0D" }.implementation!!.instructions.first() as RegisterRangeInstruction
        assertEquals("the guard reads the body's edge, p2 (p0 is this)", 5 - 4 + 2, first.startRegister)

        // The edge handed on from another register, or the call not made on this, isn't only a wrapper.
        assertNull(outlinedFunnelBody(wrapperCalling(1, 2)))
        assertNull(outlinedFunnelBody(wrapperCalling(2, 3)))
        assertEquals("A0D", outlinedFunnelBody(wrapper)?.name)
    }

    /** A funnel with no local at all can't hold the helper's answer, so the patch stops naming it. */
    @Test
    fun `a funnel without a local stops the patch`() {
        val bare = method(
            collection, "addNewEdgeToCollection", "Z", listOf(builder, FEED_UNIT_EDGE, "Lfixture/Options;"), 4,
            ImmutableInstruction11n(Opcode.CONST_4, 1, 1), ImmutableInstruction11x(Opcode.RETURN, 1),
        )
        val context = PatchContexts.of(listOf(edge(), classDef(collection, listOf(bare)), swapRunnable()))

        val refused = assertThrows(PatchException::class.java) { feedFilterHookPatch.execute(context) }

        assertTrue(refused.message.orEmpty(), refused.message.orEmpty().contains("has 0 local register(s), needs 1"))
        assertEquals("helpers added", 0,
            context.mutableClassDefBy(FEED_UNIT_EDGE).methods.count { it.name == HIDES_EDGE_HELPER })
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
        assertEquals("the swap runnable has no funnel guard", 0, run.calls(hideEdge) + run.calls(HIDES_EDGE))
        assertEquals(1, context.mutableClassDefBy(collection).methods.single().calls(HIDES_EDGE))
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
            assertEquals("methods given the guard", 0, context.mutableClassDefBy(collection).methods.single().calls(HIDES_EDGE))
            assertEquals("helpers added", 0,
                context.mutableClassDefBy(FEED_UNIT_EDGE).methods.count { it.name == HIDES_EDGE_HELPER })
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
