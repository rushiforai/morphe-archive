package app.spicetify.patches.spotify.settings

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotation
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotationElement
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction23x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction51l
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableArrayPayload
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutablePackedSwitchPayload
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableSwitchElement
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableIntEncodedValue
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNotEquals
import org.junit.jupiter.api.Test

class NativeSettingsAbiTest {
    private fun method(name: String, value: Int) = ImmutableMethod(
        "Lfixture/Settings;", name, emptyList(), "I", 9, emptySet(), emptySet(),
        ImmutableMethodImplementation(1, listOf(
            ImmutableInstruction11n(Opcode.CONST_4, 0, value),
            ImmutableInstruction11x(Opcode.RETURN, 0),
        ), emptyList(), emptyList()),
    )

    private fun definition(methods: List<ImmutableMethod>, flags: Int = 17) = ImmutableClassDef(
        "Lfixture/Settings;", flags, "Ljava/lang/Object;", emptyList(), null,
        emptySet(), emptyList(), methods,
    )

    @Test
    fun `snapshot ignores input method iteration order`() {
        val methods = listOf(method("first", 1), method("second", 2))
        assertEquals(NativeSettingsAbi.digest(definition(methods)),
            NativeSettingsAbi.digest(definition(methods.reversed())))
    }

    @Test
    fun `snapshot detects changed instructions access and method set`() {
        val original = NativeSettingsAbi.digest(definition(listOf(method("first", 1))))
        assertNotEquals(original, NativeSettingsAbi.digest(definition(listOf(method("first", 2)))))
        assertNotEquals(original, NativeSettingsAbi.digest(definition(listOf(method("first", 1)), 1)))
        assertNotEquals(original, NativeSettingsAbi.digest(definition(listOf(method("first", 1), method("added", 0)))))
    }

    /** One class with a part of every kind the digest reads. Each test edits exactly one of them. */
    private data class Spec(
        val flags: Int = 17,
        val superclass: String = "Ljava/lang/Object;",
        val interfaces: List<String> = listOf("Lfixture/A;", "Lfixture/B;"),
        val source: String? = "Settings.java",
        val classNote: String = "class note",
        val fieldType: String = "I",
        val fieldFlags: Int = 25,
        val initial: Int = 7,
        val fieldNote: String = "field note",
        val methodFlags: Int = 1,
        val parameters: List<String> = listOf("I", "Ljava/lang/String;"),
        val returns: String = "V",
        val methodNote: String = "method note",
        val parameterNote: String = "parameter note",
        val registers: Int = 6,
        val dest: Int = 0,
        val literal: Int = 5,
        val wide: Long = 1L shl 40,
        val moveFrom: Int = 1,
        val operand: Int = 2,
        val invoked: String = "bar",
        val invokeRegister: Int = 2,
        val range: Int = 3,
        val fieldName: String = "count",
        val string: String = "hello",
        val cast: String = "Lfixture/C;",
        val branch: Int = 3,
        val switchKey: Int = 1,
        val switchTarget: Int = 8,
        val arrayElement: Long = 1,
        val handler: String? = "Ljava/lang/Exception;",
        val handlerAt: Int = 10,
        val tryLength: Int = 4,
    )

    private fun note(text: String, reverse: Boolean = false): ImmutableAnnotation {
        val elements = listOf(ImmutableAnnotationElement("value", ImmutableStringEncodedValue(text)),
            ImmutableAnnotationElement("level", ImmutableIntEncodedValue(2)))
        return ImmutableAnnotation(1, "Lfixture/Note;", if (reverse) elements.reversed() else elements)
    }

    /** The class's annotations: a note and a second kind, so the order of a class's annotations can matter too. */
    private fun classAnnotations(text: String, reverse: Boolean): Set<ImmutableAnnotation> {
        val annotations = listOf(note(text, reverse), ImmutableAnnotation(2, "Lfixture/Extra;", emptyList()))
        return (if (reverse) annotations.reversed() else annotations).toSet()
    }

    private fun build(spec: Spec, reverseMembers: Boolean = false): ClassDef {
        val self = "Lfixture/Settings;"
        val instructions: List<Instruction> = listOf(
            ImmutableInstruction21s(Opcode.CONST_16, spec.dest, spec.literal),
            ImmutableInstruction51l(Opcode.CONST_WIDE, 2, spec.wide),
            ImmutableInstruction12x(Opcode.MOVE, 1, spec.moveFrom),
            ImmutableInstruction23x(Opcode.ADD_INT, 0, 1, spec.operand),
            ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, spec.invokeRegister, 3, 0, 0, 0,
                ImmutableMethodReference(self, spec.invoked, listOf("I"), "V")),
            ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, spec.range, 2,
                ImmutableMethodReference(self, "baz", emptyList(), "V")),
            ImmutableInstruction22c(Opcode.IGET, 0, 1, ImmutableFieldReference(self, spec.fieldName, "I")),
            ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(spec.string)),
            ImmutableInstruction21c(Opcode.CHECK_CAST, 0, ImmutableTypeReference(spec.cast)),
            ImmutableInstruction21t(Opcode.IF_EQZ, 0, spec.branch),
            ImmutableInstruction31t(Opcode.PACKED_SWITCH, 0, spec.switchTarget),
            ImmutableInstruction31t(Opcode.FILL_ARRAY_DATA, 1, spec.switchTarget + 8),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
            ImmutablePackedSwitchPayload(listOf(ImmutableSwitchElement(spec.switchKey, 4))),
            ImmutableArrayPayload(4, listOf(spec.arrayElement, 2L)),
        )
        val implementation = ImmutableMethodImplementation(spec.registers, instructions,
            listOf(ImmutableTryBlock(0, spec.tryLength, listOf(ImmutableExceptionHandler(spec.handler, spec.handlerAt)))),
            emptyList())
        val run = ImmutableMethod(self, "run", spec.parameters.map { ImmutableMethodParameter(it, setOf(note(spec.parameterNote, reverseMembers)), null) },
            spec.returns, spec.methodFlags, setOf(note(spec.methodNote, reverseMembers)), emptySet(), implementation)
        val abstract = ImmutableMethod(self, "abstractOne", emptyList(), "V", 1025, emptySet(), emptySet(), null)
        val count = ImmutableField(self, "count", spec.fieldType, spec.fieldFlags, ImmutableIntEncodedValue(spec.initial),
            setOf(note(spec.fieldNote, reverseMembers)), emptySet())
        val plain = ImmutableField(self, "plain", "Ljava/lang/String;", 2, null, emptySet(), emptySet())
        val methods = listOf(run, abstract)
        val fields = listOf(count, plain)
        return ImmutableClassDef(self, spec.flags, spec.superclass, spec.interfaces, spec.source,
            classAnnotations(spec.classNote, reverseMembers),
            if (reverseMembers) fields.reversed() else fields, if (reverseMembers) methods.reversed() else methods)
    }

    @Test
    fun `the digest hashes a readable description that names every part`() {
        assertEquals("""
            class Lfixture/Settings; 17 super=Ljava/lang/Object; interfaces=[Lfixture/A;, Lfixture/B;] source=Settings.java
            annotation 1 Lfixture/Note; [level=0x2, value="class note"]
            annotation 2 Lfixture/Extra; []
            field count:I 25 = 0x7
              annotation 1 Lfixture/Note; [level=0x2, value="field note"]
            field plain:Ljava/lang/String; 2
            method abstractOne()V 1025
            method run(ILjava/lang/String;)V 1
              annotation 1 Lfixture/Note; [level=0x2, value="method note"]
              parameter 0 annotation 1 Lfixture/Note; [level=0x2, value="parameter note"]
              parameter 1 annotation 1 Lfixture/Note; [level=0x2, value="parameter note"]
              registers 6
              const/16 a=0 literal=5
              const-wide a=2 wide=1099511627776
              move a=1 b=1
              add-int a=0 b=1 c=2
              invoke-virtual count=2 c=2 d=3 e=0 f=0 g=0 ref=Lfixture/Settings;->bar(I)V
              invoke-static/range start=3 count=2 ref=Lfixture/Settings;->baz()V
              iget a=0 b=1 ref=Lfixture/Settings;->count:I
              const-string a=0 ref="hello"
              check-cast a=0 ref=Lfixture/C;
              if-eqz a=0 offset=3
              packed-switch a=0 offset=8
              fill-array-data a=1 offset=16
              return-void
              packed-switch-payload 1:4
              array-payload width=4 1,2
              try 0+4 Ljava/lang/Exception;->10
        """.trimIndent() + "\n", NativeSettingsAbi.describe(build(Spec())))
    }

    /** ImmutableClassDef sorts its members itself, so this hands them back in the opposite order, as a reader may. */
    private class Reversed(private val inner: ClassDef) : ClassDef by inner {
        override fun getFields(): Iterable<Field> = inner.fields.reversed()
        override fun getMethods(): Iterable<Method> = inner.methods.reversed()
    }

    @Test
    fun `member and annotation order do not change the digest`() {
        val original = NativeSettingsAbi.digest(build(Spec()))
        assertEquals(original, NativeSettingsAbi.digest(build(Spec(), reverseMembers = true)))
        assertEquals(original, NativeSettingsAbi.digest(Reversed(build(Spec()))))
    }

    @Test
    fun `every kind of change moves the digest`() {
        val edits = mapOf(
            "class flags" to Spec(flags = 1),
            "superclass" to Spec(superclass = "Lfixture/Base;"),
            "interface order" to Spec(interfaces = listOf("Lfixture/B;", "Lfixture/A;")),
            "interface removed" to Spec(interfaces = listOf("Lfixture/A;")),
            "source file" to Spec(source = null),
            "class annotation" to Spec(classNote = "other"),
            "field type" to Spec(fieldType = "J"),
            "field flags" to Spec(fieldFlags = 9),
            "field initial value" to Spec(initial = 8),
            "field annotation" to Spec(fieldNote = "other"),
            "method flags" to Spec(methodFlags = 2),
            "parameter types" to Spec(parameters = listOf("I", "Ljava/lang/Object;")),
            "parameter order" to Spec(parameters = listOf("Ljava/lang/String;", "I")),
            "return type" to Spec(returns = "I"),
            "method annotation" to Spec(methodNote = "other"),
            "parameter annotation" to Spec(parameterNote = "other"),
            "register count" to Spec(registers = 7),
            "destination register" to Spec(dest = 3),
            "literal" to Spec(literal = 6),
            "wide literal" to Spec(wide = 2),
            "move source" to Spec(moveFrom = 2),
            "third register" to Spec(operand = 3),
            "invoked method" to Spec(invoked = "qux"),
            "invoke register" to Spec(invokeRegister = 4),
            "range start" to Spec(range = 4),
            "field reference" to Spec(fieldName = "other"),
            "string" to Spec(string = "goodbye"),
            "cast type" to Spec(cast = "Lfixture/D;"),
            "branch offset" to Spec(branch = 4),
            "switch key" to Spec(switchKey = 2),
            "payload offset" to Spec(switchTarget = 9),
            "array element" to Spec(arrayElement = 3),
            "catch-all handler" to Spec(handler = null),
            "handler address" to Spec(handlerAt = 11),
            "try length" to Spec(tryLength = 5),
        )
        val original = NativeSettingsAbi.digest(build(Spec()))
        val digests = edits.mapValues { NativeSettingsAbi.digest(build(it.value)) }
        for ((name, digest) in digests) assertNotEquals(original, digest, name)
        assertEquals(edits.size, digests.values.toSet().size, "two different edits gave the same digest")
    }

    @Test
    fun `code built by a patch digests like the code it started as`() {
        val code = ImmutableMethodImplementation(1, listOf(
            ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
            ImmutableInstruction21t(Opcode.IF_EQZ, 0, 3),
            ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
            ImmutableInstruction11x(Opcode.RETURN, 0),
        ), emptyList(), emptyList())
        fun withCode(implementation: com.android.tools.smali.dexlib2.iface.MethodImplementation) = ImmutableClassDef(
            "Lfixture/Settings;", 17, "Ljava/lang/Object;", emptyList(), null, emptySet(), emptyList(),
            listOf(ImmutableMethod("Lfixture/Settings;", "run", emptyList(), "I", 9, emptySet(), emptySet(), implementation)),
        )
        assertEquals(NativeSettingsAbi.digest(withCode(code)), NativeSettingsAbi.digest(withCode(MutableMethodImplementation(code))))
    }
}
