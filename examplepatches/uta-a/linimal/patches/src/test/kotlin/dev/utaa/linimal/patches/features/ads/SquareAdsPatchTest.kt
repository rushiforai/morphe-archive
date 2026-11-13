package dev.utaa.linimal.patches.features.ads

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

class SquareAdsPatchTest {
    private val publicFinal = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value

    private fun method(
        name: String,
        parameters: List<String>,
        returnType: String,
        instructions: List<Instruction> = listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
        registers: Int = 4,
        accessFlags: Int = publicFinal,
        owner: String = "Lowner;",
    ) = ImmutableMethod(
        owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType,
        accessFlags, null, null,
        ImmutableMethodImplementation(registers, instructions, emptyList(), emptyList()),
    )

    private fun classDef(
        type: String,
        methods: List<ImmutableMethod> = emptyList(),
        fields: List<ImmutableField> = emptyList(),
        accessFlags: Int = publicFinal,
    ) = ImmutableClassDef(type, accessFlags, "Ljava/lang/Object;", null, null, null, fields, methods)

    private fun newInstance(type: String): Instruction =
        ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, ImmutableTypeReference(type))

    @Test
    fun `factory component is the single type created by the non-bridge createComponent`() {
        val real = method("createComponent", listOf("Landroid/content/Context;"), "Lk06/a;",
            listOf(newInstance("Lxz5/c;"), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)))
        val bridge = method("createComponent", listOf("Landroid/content/Context;"), "Ljava/lang/Object;",
            listOf(newInstance("Lunrelated;"), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)))
        assertEquals("Lxz5/c;", createdComponentType(classDef("Lfactory;", listOf(real, bridge))))

        val twoTypes = method("createComponent", listOf("Landroid/content/Context;"), "Lk06/a;",
            listOf(newInstance("Lxz5/c;"), newInstance("Lxz5/d;"), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)))
        assertNull(createdComponentType(classDef("Lfactory;", listOf(twoTypes))))
        assertNull(createdComponentType(classDef("Lfactory;")))
    }

    private val typeCall = ImmutableMethodReference(
        "Ls16/c;", "c", listOf("Lz56/b;", "Ljava/lang/String;", "Ldt8/d;"), "Ljava/lang/Enum;",
    )

    private fun invoke(ref: MethodReference): Instruction =
        ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, ref.parameterTypes.size + 1, 0, 1, 2, 3, 0, ref)

    @Test
    fun `ad type call must be the single enum returning placement lookup`() {
        assertEquals(typeCall, adTypeCall(listOf(invoke(typeCall))))
        // 同じ呼び出しが resume 経路などで重複しても 1 種類なら同じ参照を返します。
        assertEquals(typeCall, adTypeCall(listOf(invoke(typeCall), invoke(typeCall))))
        val other = ImmutableMethodReference(
            "Lother;", "x", listOf("Lz56/b;", "Ljava/lang/String;", "Ldt8/d;"), "Ljava/lang/Enum;",
        )
        assertNull(adTypeCall(listOf(invoke(typeCall), invoke(other))))
        val wrongShape = ImmutableMethodReference(
            "Ls16/c;", "a", listOf("Ljava/lang/String;", "Ldt8/d;"), "Ljava/lang/Enum;",
        )
        assertNull(adTypeCall(listOf(invoke(wrongShape))))
    }

    @Test
    fun `ad type is the first check-cast after the lookup call`() {
        val caller = method(
            "c", emptyList(), "Ljava/lang/Object;",
            listOf(
                ImmutableInstruction21c(Opcode.CHECK_CAST, 0, ImmutableTypeReference("Lbefore;")),
                invoke(typeCall),
                ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                ImmutableInstruction21c(Opcode.CHECK_CAST, 0, ImmutableTypeReference("Lz56/a;")),
                ImmutableInstruction21c(Opcode.CHECK_CAST, 0, ImmutableTypeReference("Llater;")),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
            ),
        )
        assertEquals("Lz56/a;", adTypeAfterCall(classDef("Lxz5/c;", listOf(caller)), typeCall))

        val noCast = method("c", emptyList(), "Ljava/lang/Object;",
            listOf(invoke(typeCall), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)))
        assertNull(adTypeAfterCall(classDef("Lxz5/c;", listOf(noCast)), typeCall))
        assertNull(adTypeAfterCall(classDef("Lxz5/c;"), typeCall))
    }

    @Test
    fun `type gate must not be overridable`() {
        val params = typeCall.parameterTypes.map { it.toString() }
        assertTrue(isNotOverridable(method("c", params, "Ljava/lang/Enum;"), AccessFlags.PUBLIC.value))
        val open = method("c", params, "Ljava/lang/Enum;", accessFlags = AccessFlags.PUBLIC.value)
        assertTrue(isNotOverridable(open, publicFinal))
        assertFalse(isNotOverridable(open, AccessFlags.PUBLIC.value))
    }

    private fun enumConstant(owner: String, name: String) = ImmutableField(
        owner, name, owner,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value or AccessFlags.ENUM.value,
        null, null, null,
    )

    @Test
    fun `ad type enum has exactly LAD GOOGLE and NONE`() {
        val enumFlags = publicFinal or AccessFlags.ENUM.value
        val values = ImmutableField("Lz56/a;", "\$VALUES", "[Lz56/a;",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value, null, null, null)
        fun enumOf(vararg names: String) = classDef(
            "Lz56/a;", fields = names.map { enumConstant("Lz56/a;", it) } + values, accessFlags = enumFlags,
        )
        assertTrue(isAdTypeEnum(enumOf("LAD", "GOOGLE", "NONE")))
        assertFalse(isAdTypeEnum(enumOf("LAD", "GOOGLE")))
        assertFalse(isAdTypeEnum(enumOf("LAD", "GOOGLE", "NONE", "OTHER")))
        assertFalse(isAdTypeEnum(classDef("Lz56/a;", fields = listOf(enumConstant("Lz56/a;", "NONE")))))
        assertFalse(isAdTypeEnum(null))
    }

    @Test
    fun `embedded entry is the void instance method taking a ViewStub`() {
        val params = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Landroid/view/ViewStub;")
        assertTrue(isEmbeddedAdEntry(method("a", params, "V")))
        assertFalse(isEmbeddedAdEntry(method("a", params, "Ljava/lang/Object;")))
        assertFalse(isEmbeddedAdEntry(method("a", params.dropLast(1), "V")))
        assertFalse(isEmbeddedAdEntry(method("<init>", params, "V")))
        assertFalse(isEmbeddedAdEntry(
            method("a", params, "V", accessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
        ))
    }

    @Test
    fun `early return register must be a local register`() {
        // registers=8、引数は this + 3 なので v0..v3 が local。
        assertEquals(0, earlyReturnRegister(method("c", typeCall.parameterTypes.map { it.toString() }, "Ljava/lang/Enum;", registers = 8)))
        // local がない method は拒否します。
        assertNull(earlyReturnRegister(method("c", typeCall.parameterTypes.map { it.toString() }, "Ljava/lang/Enum;", registers = 4)))
        // long は 2 register を使うので、registers=3 の this + J には local がありません。
        assertNull(earlyReturnRegister(method("w", listOf("J"), "V", registers = 3)))
        assertEquals(0, earlyReturnRegister(method("w", listOf("J"), "V", registers = 4)))
        // static method には this がありません。
        assertEquals(0, earlyReturnRegister(method("s", listOf("I"), "V", registers = 2,
            accessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)))
    }

    private fun originalTypeGate(): MutableMethod = MutableMethod(
        method(
            "c", typeCall.parameterTypes.map { it.toString() }, "Ljava/lang/Enum;",
            listOf(newInstance("Lt16/f;"), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)),
            registers = 8,
        ),
    )

    private fun assertHook(instruction: Instruction) {
        val hook = (instruction as ReferenceInstruction).reference as MethodReference
        assertEquals("Ldev/utaa/linimal/extension/features/SquareAdsHooks;", hook.definingClass)
        assertEquals("shouldSuppressAds", hook.name)
        assertEquals("Z", hook.returnType)
    }

    @Test
    fun `type gate returns NONE or branches to the original first instruction`() {
        val method = originalTypeGate()
        injectAdTypeGate(method, 0, "Lz56/a;")

        val code = method.implementation!!.instructions.toList()
        assertEquals(
            listOf(
                Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT,
                Opcode.NEW_INSTANCE, Opcode.RETURN_OBJECT,
            ),
            code.map { it.opcode },
        )
        assertHook(code[0])
        assertEquals(0, (code[1] as OneRegisterInstruction).registerA)
        val none = (code[3] as ReferenceInstruction).reference as FieldReference
        assertEquals("Lz56/a;", none.definingClass)
        assertEquals("NONE", none.name)
        assertEquals("Lz56/a;", none.type)
        // OFF のときは元の先頭命令へ進み、公式の判定をそのまま実行します。
        assertEquals(code[5], (code[2] as BuilderOffsetInstruction).target.location.instruction)
        assertEquals(8, method.implementation!!.registerCount)
    }

    @Test
    fun `embedded gate returns before creating the ad slot`() {
        val method = MutableMethod(
            method(
                "a", listOf("Landroid/content/Context;", "Landroid/view/ViewStub;"), "V",
                listOf(newInstance("Lslot;"), ImmutableInstruction10x(Opcode.RETURN_VOID)),
                registers = 4,
            ),
        )
        injectEmbeddedGate(method, 0)

        val code = method.implementation!!.instructions.toList()
        assertEquals(
            listOf(
                Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID,
                Opcode.NEW_INSTANCE, Opcode.RETURN_VOID,
            ),
            code.map { it.opcode },
        )
        assertHook(code[0])
        assertEquals(code[4], (code[2] as BuilderOffsetInstruction).target.location.instruction)
        assertEquals(4, method.implementation!!.registerCount)
    }
}
