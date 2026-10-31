/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed

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
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * How the "Stories you might like" flag is held to Facebook's own reading of it: a method of
 * DiscoverUnitComponent loads the flag's key and hands it to `TreeJNI.getBooleanValue`, and the
 * component is the parameter of its kept layout manager's constructor that does. Each rule has a
 * control that must fail it.
 */
class DiscoverUnitsShapesTest {
    private val component = "Lcom/example/Component;"
    private val reader = "Lcom/facebook/graphservice/tree/TreeJNI;->getBooleanValue(I)Z"
    private fun hex(value: Int) = if (value < 0) "-0x" + Integer.toHexString(-value) else "0x" + Integer.toHexString(value)
    private val key = hex(treeFieldKey(UNCONNECTED_STORIES_FLAG))

    @Test
    fun `the key is the one Facebook's builds load`() {
        assertEquals(0xaff56b7b.toInt(), treeFieldKey(UNCONNECTED_STORIES_FLAG))
    }

    private fun method(body: String, definingClass: String = component): Method = MutableMethod(
        ImmutableMethod(
            definingClass, "render", listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)), "Z",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
            ImmutableMethodImplementation(4, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, body.trimIndent()) }

    private fun reads(call: String = "invoke-virtual {v0, v1}, $reader", between: String = "") = method(
        """
            check-cast p1, Lcom/facebook/graphservice/tree/TreeJNI;
            move-object v0, p1
            const v1, $key
            $between
            $call
            move-result v0
            return v0
        """,
    )

    @Test
    fun `the flag's key handed to the tree's boolean reader is a read of it`() {
        assertTrue(readsUnconnectedStoriesFlag(reads()))
        assertTrue(readsUnconnectedStoriesFlag(reads(between = "const/4 v2, 0x0")))
    }

    @Test
    fun `the key alone, or read any other way, isn't`() {
        // Another reader of the tree.
        assertFalse(readsUnconnectedStoriesFlag(reads(call = "invoke-virtual {v0, v1}, Lcom/facebook/graphservice/tree/TreeJNI;->getIntValue(I)I")))
        // The reader, asked for another register's key.
        assertFalse(readsUnconnectedStoriesFlag(reads(call = "invoke-virtual {v0, v2}, $reader", between = "const/4 v2, 0x0")))
        // Too far from the key to be its read.
        assertFalse(readsUnconnectedStoriesFlag(reads(between = "const/4 v2, 0x0\nconst/4 v3, 0x0\nconst/4 v2, 0x1")))
        // Another key.
        val other = method(
            """
                check-cast p1, Lcom/facebook/graphservice/tree/TreeJNI;
                const v1, ${hex(treeFieldKey("is_mbsu"))}
                invoke-virtual {p1, v1}, $reader
                move-result v0
                return v0
            """,
        )
        assertFalse(readsUnconnectedStoriesFlag(other))
    }

    private fun classDef(type: String, vararg methods: Method, interfaces: List<String>? = null): ClassDef = ImmutableClassDef(
        type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", interfaces, null, null, null, methods.toList(),
    )

    private fun layout(vararg parameters: String): ClassDef = classDef(
        DISCOVER_UNIT_LAYOUT,
        ImmutableMethod(
            DISCOVER_UNIT_LAYOUT, "<init>", parameters.map { ImmutableMethodParameter(it, null, null) }, "V",
            AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value, null, null, null,
        ),
    )

    @Test
    fun `the component is the layout's constructor parameter that reads the flag`() {
        val classes = mapOf(
            component to classDef(component, reads()),
            "Lcom/example/Other;" to classDef("Lcom/example/Other;", reads(call = "invoke-virtual {v0, v1}, Lcom/facebook/graphservice/tree/TreeJNI;->getIntValue(I)I")),
        )
        val found = unconnectedStoriesReaders(layout("Landroid/content/Context;", component, "Lcom/example/Other;", "I")) { classes[it] }
        assertEquals(listOf(component), found.map { it.type })
        // The control: a layout that doesn't take the component finds nothing.
        assertEquals(emptyList<String>(), unconnectedStoriesReaders(layout("Lcom/example/Other;")) { classes[it] }.map { it.type })
    }

    private val unitModel = "Lcom/example/UnitModel;"
    private val treeUnitModel = "Lcom/example/TreeUnitModel;"

    /** 585's accessor implementation: `isUnconnected()Z` loads [readKey] into the tree's boolean reader. */
    private fun accessor(readKey: String = key): Method = MutableMethod(
        ImmutableMethod(
            treeUnitModel, "isUnconnected", emptyList(), "Z",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
            ImmutableMethodImplementation(2, emptyList(), null, null),
        ),
    ).apply {
        addInstructionsWithLabels(
            0,
            """
                const v0, $readKey
                invoke-virtual {p0, v0}, $reader
                move-result v0
                return v0
            """.trimIndent(),
        )
    }

    /** 585's component: asks the unit model's [name] accessor instead of the tree. */
    private fun asks(name: String = "isUnconnected") = method(
        """
            invoke-interface {p1}, $unitModel->$name()Z
            move-result v0
            return v0
        """,
    )

    @Test
    fun `585's component asking the unit model's accessor that reads the flag is the reader`() {
        val implementation = classDef(treeUnitModel, accessor(), interfaces = listOf(unitModel))
        assertEquals(setOf("$unitModel->isUnconnected"), unconnectedStoriesAccessors(implementation, setOf(unitModel)))
        val flagAccessors = { owners: Set<String> -> unconnectedStoriesAccessors(implementation, owners) }
        val classes = mapOf(component to classDef(component, asks()))
        assertEquals(listOf(component), unconnectedStoriesReaders(layout(component), flagAccessors) { classes[it] }.map { it.type })
        // Controls: no accessor walk, another accessor of the model, an implementation of another
        // key, and one that doesn't declare the model's interface.
        assertEquals(emptyList<String>(), unconnectedStoriesReaders(layout(component)) { classes[it] }.map { it.type })
        val asksOther = mapOf(component to classDef(component, asks("isSeen")))
        assertEquals(emptyList<String>(), unconnectedStoriesReaders(layout(component), flagAccessors) { asksOther[it] }.map { it.type })
        val otherKey = classDef(treeUnitModel, accessor(hex(treeFieldKey("is_mbsu"))), interfaces = listOf(unitModel))
        assertEquals(emptySet<String>(), unconnectedStoriesAccessors(otherKey, setOf(unitModel)))
        assertEquals(emptySet<String>(), unconnectedStoriesAccessors(classDef(treeUnitModel, accessor()), setOf(unitModel)))
    }
}
