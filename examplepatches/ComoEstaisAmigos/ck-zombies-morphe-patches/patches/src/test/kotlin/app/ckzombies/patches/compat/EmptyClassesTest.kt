package app.ckzombies.patches.compat

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.AnnotationVisibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotation
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull
import kotlin.test.assertSame
import kotlin.test.assertTrue

class EmptyClassesTest {
    private val public = AccessFlags.PUBLIC.value
    private val abstract = AccessFlags.ABSTRACT.value
    private val static = AccessFlags.STATIC.value

    private fun method(owner: String, name: String, flags: Int, vararg params: String) = ImmutableMethod(
        owner, name, params.map { ImmutableMethodParameter(it, null, null) }, "V", flags, null, null,
        if (flags and abstract != 0) null else MutableMethodImplementation(1 + params.size),
    )

    /** A class with something of every kind the patch has to take out. */
    private fun sdkClass(
        type: String,
        superclass: String = "Ljava/lang/Object;",
        flags: Int = public,
        interfaces: List<String> = emptyList(),
    ): MutableClass = ImmutableClassDef(
        type, flags, superclass, interfaces, "Source.java",
        setOf(ImmutableAnnotation(AnnotationVisibility.SYSTEM, "Ldalvik/annotation/MemberClasses;", emptySet())),
        listOf(
            ImmutableField(type, "instance", type, public or static, null, null, null),
            ImmutableField(type, "name", "Ljava/lang/String;", public, null, null, null),
        ),
        listOf(
            method(type, "<init>", public or AccessFlags.CONSTRUCTOR.value, "Ljava/lang/String;"),
            method(type, "<clinit>", static or AccessFlags.CONSTRUCTOR.value),
            method(type, "login", public),
        ),
    ).toMutable().apply {
        // MutableClass derives the split sets from methods and fields the first time they are
        // read. Reading them now, as a fingerprint or another patch may have, keeps a missed
        // clear of one of them from going unnoticed.
        directMethods.size + virtualMethods.size + staticFields.size + instanceFields.size
    }

    private fun MutableClass.constructorCall(): MethodReference {
        val constructor = directMethods.single()
        assertEquals("<init>", constructor.name)
        assertEquals(emptyList(), constructor.parameterTypes)
        assertEquals(public or AccessFlags.CONSTRUCTOR.value, constructor.accessFlags)
        val instructions = constructor.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.INVOKE_DIRECT, Opcode.RETURN_VOID), instructions.map { it.opcode })
        return (instructions[0] as ReferenceInstruction).reference as MethodReference
    }

    @Test
    fun `every member, annotation and the source file go`() {
        val c = sdkClass("Lcom/openfeint/api/Notification;")
        emptyClasses(listOf(c))

        assertTrue(c.fields.isEmpty() && c.staticFields.isEmpty() && c.instanceFields.isEmpty())
        assertTrue(c.virtualMethods.isEmpty())
        assertEquals(listOf("<init>"), c.methods.map { it.name })
        assertTrue(c.annotations.isEmpty())
        assertNull(c.sourceFile)
    }

    @Test
    fun `name, flags, superclass and interfaces stay`() {
        val c = sdkClass(
            "Lcom/openfeint/internal/ui/WebNav;", "Landroid/app/Activity;", public or abstract,
            listOf("Lcom/openfeint/internal/Callback;"),
        )
        emptyClasses(listOf(c))

        assertEquals("Lcom/openfeint/internal/ui/WebNav;", c.type)
        assertEquals(public or abstract, c.accessFlags)
        assertEquals("Landroid/app/Activity;", c.superclass)
        assertEquals(listOf("Lcom/openfeint/internal/Callback;"), c.interfaces)
    }

    @Test
    fun `the classes the game extends keep a constructor that only calls super`() {
        // Glu's GluOpenFeint extends the delegate and GluOpenFeint$1 the list callback, and both
        // of their constructors call super(). The callback reaches Object through another class.
        val delegate = sdkClass("Lcom/openfeint/api/OpenFeintDelegate;", flags = public or abstract)
        val callback = sdkClass("Lcom/openfeint/internal/APICallback;", flags = public or abstract)
        val listCallback = sdkClass(
            "Lcom/openfeint/api/resource/Achievement\$ListCB;", callback.type, public or abstract,
        )
        // Listed before its superclass, so the answer cannot depend on the order.
        emptyClasses(listOf(listCallback, delegate, callback))

        for ((c, superclass) in listOf(
            delegate to "Ljava/lang/Object;",
            callback to "Ljava/lang/Object;",
            listCallback to callback.type,
        )) {
            val call = c.constructorCall()
            assertEquals(superclass, call.definingClass)
            assertEquals("<init>", call.name)
            assertEquals(emptyList(), call.parameterTypes)
            assertEquals(1, c.directMethods.single().implementation!!.registerCount)
            assertSame(c.directMethods.single(), c.methods.single())
        }
    }

    @Test
    fun `no constructor where super() could not reach Object through the shells`() {
        val activity = sdkClass("Lcom/openfeint/internal/ui/NativeBrowser;", "Landroid/app/Activity;")
        val subActivity = sdkClass("Lcom/openfeint/internal/ui/Settings;", activity.type)
        val outsider = sdkClass("Lcom/openfeint/internal/request/Request;", "Lcom/example/NotInTheSet;")
        val listener = sdkClass(
            "Lcom/openfeint/api/Notification\$Delegate;",
            flags = public or abstract or AccessFlags.INTERFACE.value,
        )
        val category = sdkClass(
            "Lcom/openfeint/api/Notification\$Category;", "Ljava/lang/Enum;",
            public or AccessFlags.FINAL.value or AccessFlags.ENUM.value,
        )
        val classes = listOf(activity, subActivity, outsider, listener, category)
        emptyClasses(classes)

        for (c in classes) {
            assertTrue(c.methods.isEmpty() && c.directMethods.isEmpty(), "${c.type} has no methods left")
        }
    }
}
