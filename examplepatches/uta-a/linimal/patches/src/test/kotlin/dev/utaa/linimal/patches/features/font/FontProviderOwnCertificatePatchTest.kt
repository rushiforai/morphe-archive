package dev.utaa.linimal.patches.features.font

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import dev.utaa.linimal.patches.status.FeatureId
import dev.utaa.linimal.patches.status.PatchId
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

class FontProviderOwnCertificatePatchTest {
    private val string = "Ljava/lang/String;"
    private val providerInfo = "Landroid/content/pm/ProviderInfo;"

    private fun call(opcode: Opcode, definingClass: String, name: String, parameters: List<String>, returnType: String, vararg registers: Int) =
        ImmutableInstruction35c(
            opcode,
            registers.size,
            registers.getOrElse(0) { 0 },
            registers.getOrElse(1) { 0 },
            registers.getOrElse(2) { 0 },
            registers.getOrElse(3) { 0 },
            registers.getOrElse(4) { 0 },
            ImmutableMethodReference(definingClass, name, parameters, returnType),
        )

    private fun beginSection(register: Int) =
        call(Opcode.INVOKE_STATIC, "Landroid/os/Trace;", "beginSection", listOf(string), "V", register)

    private fun resolveContentProvider(packageManager: Int, authority: Int, flags: Int) = call(
        Opcode.INVOKE_VIRTUAL,
        "Landroid/content/pm/PackageManager;",
        "resolveContentProvider",
        listOf(string, "I"),
        providerInfo,
        packageManager, authority, flags,
    )

    private fun packageName(destination: Int, provider: Int) = ImmutableInstruction22c(
        Opcode.IGET_OBJECT,
        destination,
        provider,
        ImmutableFieldReference(providerInfo, "packageName", string),
    )

    private fun stringEquals(receiver: Int, other: Int) =
        call(Opcode.INVOKE_VIRTUAL, string, "equals", listOf("Ljava/lang/Object;"), "Z", receiver, other)

    /**
     * LINE 26.16.0 の `j7.e.b`（androidx の `FontProvider.getProvider`）の 0033〜0042 に相当する形。
     * index 10 の `iget-object v2, v7, packageName` が package 一致を確かめた直後の命令です。
     * 2 つの `if-eqz` は、index 11（address 22）の `return-object` へ飛ぶものとして置きます。
     */
    private fun referenceShape(
        notFoundOffset: Int = 12,
        insertion: Instruction = packageName(destination = 2, provider = 7),
        equals: Instruction = stringEquals(receiver = 3, other = 6),
    ): List<Instruction> = listOf(
        ImmutableInstruction21c(Opcode.CONST_STRING, 4, ImmutableStringReference("FontProvider.getProvider")),
        beginSection(4),
        ImmutableInstruction11n(Opcode.CONST_4, 11, 0),
        resolveContentProvider(packageManager = 9, authority = 5, flags = 11),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 7),
        ImmutableInstruction21t(Opcode.IF_EQZ, 7, notFoundOffset),
        packageName(destination = 3, provider = 7),
        equals,
        ImmutableInstruction11x(Opcode.MOVE_RESULT, 3),
        ImmutableInstruction21t(Opcode.IF_EQZ, 3, 4),
        insertion,
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 7),
    )

    @Test
    fun `the hook goes right after the package name check`() {
        assertEquals(
            FontProviderInjection(insertionIndex = 10, providerRegister = 7, resultRegister = 2),
            fontProviderInjection(referenceShape()),
        )
    }

    @Test
    fun `the result register must not be the provider register`() {
        assertNull(fontProviderInjection(referenceShape(insertion = packageName(destination = 7, provider = 7))))
    }

    @Test
    fun `an insertion point that other paths jump to is rejected`() {
        // provider が null の分岐が挿入位置（address 20）へ飛ぶと、その経路が hook を飛び越します。
        assertNull(fontProviderInjection(referenceShape(notFoundOffset = 10)))
        assertNull(fontProviderInjection(referenceShape(), handlerAddresses = setOf(20)))
    }

    @Test
    fun `the package comparison must use the provider package name`() {
        assertNull(fontProviderInjection(referenceShape(equals = stringEquals(receiver = 6, other = 3))))
    }

    @Test
    fun `methods without the expected shape are left unchanged`() {
        val shape = referenceShape()
        // package の一致を確かめる分岐がない。
        assertNull(fontProviderInjection(shape.take(6) + shape.drop(10)))
        // Trace の section を開いていない。
        assertNull(fontProviderInjection(shape.drop(2)))
        // resolveContentProvider が 2 か所ある。
        assertNull(fontProviderInjection(shape + resolveContentProvider(9, 5, 11)))
        assertNull(fontProviderInjection(emptyList()))
    }

    @Test
    fun `the certificate hook is recorded for both font features`() {
        assertEquals(
            listOf(FeatureId.OFFICIAL_FONTS, FeatureId.CUSTOM_FONT),
            FONT_PROVIDER_CERTIFICATE_PATCH_IDS.map(PatchId::featureId),
        )
    }
}
