/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredmarketplace

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Hide sponsored Marketplace listings over a stand-in Networking module: which method counts as its
 * sendRequest, where it reads the POST body and the request data, what the patch refuses, and the
 * call it puts right after the body is read. Each rule has a control that must fail it.
 */
class MarketplaceRequestShapesTest {
    private val module = "Lfixture/NetworkingModule;"
    private val string = "Ljava/lang/String;"
    private val entity = "Lorg/apache/http/entity/StringEntity;"

    private fun method(
        name: String = SEND_REQUEST,
        parameters: List<String> = SEND_REQUEST_PARAMETERS,
        static: Boolean = false,
        locals: Int = 17,
        smali: String,
    ): MutableMethod {
        var flags = AccessFlags.PUBLIC.value
        if (static) flags = flags or AccessFlags.STATIC.value
        val ins = parameters.fold(if (static) 0 else 1) { count, type -> count + if (type == "J" || type == "D") 2 else 1 }
        return MutableMethod(
            ImmutableMethod(
                module, name, parameters.map { ImmutableMethodParameter(it, null, null) }, "V", flags, null, null,
                ImmutableMethodImplementation(locals + ins, emptyList(), null, null),
            ),
        ).apply { addInstructionsWithLabels(0, smali) }
    }

    /**
     * sendRequest as both builds write it: the data copied down from its parameter, the POST body
     * read from its "string" entry and built into a StringEntity, the tracking name read further
     * down. Parts can change.
     */
    private fun sendRequest(
        name: String = SEND_REQUEST,
        parameters: List<String> = SEND_REQUEST_PARAMETERS,
        static: Boolean = false,
        dataFrom: String = "p6",
        bodyKey: String = BODY_KEY,
        bodyInto: String = "v6",
        trackingFrom: String = "v1",
        tag: String = NETWORKING_TAG,
        secondEntity: Boolean = false,
        jumpToTheCheck: Boolean = false,
        headersError: Boolean = true,
    ): MutableMethod = method(
        name, parameters, static, smali = """
            move-object/from16 v1, $dataFrom
            const-string v0, "$tag"
            const-string/jumbo v11, "$bodyKey"
            ${if (headersError) "if-nez v0, :headers" else ""}
            invoke-interface { v1, v11 }, $READABLE_MAP->hasKey(Ljava/lang/String;)Z
            move-result v0
            const-string v8, "Unsupported POST data type"
            if-eqz v0, :tracking
            ${if (jumpToTheCheck) "if-nez v0, :check" else ""}
            invoke-interface { v1, v11 }, $GET_STRING
            move-result-object $bodyInto
            :check
            if-eqz v6, :refused
            new-instance v12, $entity
            const-string v0, "UTF-8"
            invoke-direct { v12, v6, v0 }, $STRING_ENTITY_INIT
            ${if (secondEntity) "new-instance v13, $entity\ninvoke-direct { v13, v6, v0 }, $STRING_ENTITY_INIT" else ""}
            :tracking
            const-string/jumbo v0, "$TRACKING_NAME"
            invoke-interface { $trackingFrom, v0 }, $GET_STRING
            move-result-object v5
            return-void
            :refused
            new-instance v1, Ljava/lang/IllegalArgumentException;
            invoke-direct { v1, v8 }, Ljava/lang/IllegalArgumentException;-><init>(${string})V
            throw v1
            :headers
            new-instance v1, Ljava/lang/RuntimeException;
            invoke-direct { v1 }, Ljava/lang/RuntimeException;-><init>()V
            throw v1
        """,
    )

    /** The OSS module beside Facebook's: the same spec, no request context tag. */
    private fun ossSendRequest(): MutableMethod = sendRequest(tag = "OkHttp")

    private fun classOf(type: String, vararg methods: Method): ClassDef = ImmutableClassDef(
        type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, emptyList(), methods.toList(),
    )

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private val Instruction.reference: String get() = (this as ReferenceInstruction).reference.toString()

    private fun Instruction.callRegisters(): List<Int> {
        val call = this as FiveRegisterInstruction
        return listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount)
    }

    private fun build(vararg sends: Method): List<ClassDef> = listOf(
        classOf(module, *sends),
        classOf("Lfixture/OkHttpNetworkingModule;", ossSendRequest()),
        ExtensionDex.classDef(SETTINGS_STATUS),
    )

    @Test
    fun `the send method is the Networking spec's sendRequest holding the module's tag`() {
        assertTrue(isSendRequest(sendRequest()))
        assertFalse("the OSS module without the tag", isSendRequest(ossSendRequest()))
        assertFalse("another name", isSendRequest(sendRequest(name = "sendRequestInternal")))
        assertFalse("a static method", isSendRequest(sendRequest(static = true, dataFrom = "p5")))
        assertFalse("other parameters", isSendRequest(sendRequest(parameters = SEND_REQUEST_PARAMETERS.dropLast(1), dataFrom = "p6")))
    }

    @Test
    fun `the body is read from the request data's string entry right before the StringEntity`() {
        // Seventeen locals: v1 holds the data, copied from p6 (v23), and the body lands in v6.
        val read = bodyRead(sendRequest())!!
        assertEquals(6, read.body)
        assertEquals(1, read.data)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, sendRequest().body()[read.index].opcode)
        assertNull("the body read from another entry", bodyRead(sendRequest(bodyKey = "formData")))
        assertNull("the map copied from the headers", bodyRead(sendRequest(dataFrom = "p5")))
        assertNull("the tracking name read from another map", bodyRead(sendRequest(trackingFrom = "v2")))
        assertNull("two StringEntity bodies", bodyRead(sendRequest(secondEntity = true)))
        assertNull("the check reached around the read", bodyRead(sendRequest(jumpToTheCheck = true)))
        assertNull("the body written somewhere else", bodyRead(sendRequest(bodyInto = "v7")))
    }

    /** A write of the data's register on a path that throws doesn't count against it. */
    @Test
    fun `a write on a path that never reaches the read is ignored`() {
        for (headersError in listOf(false, true)) {
            val read = bodyRead(sendRequest(headersError = headersError))!!
            assertEquals("with the throwing path $headersError", listOf(6, 1), listOf(read.body, read.data))
        }
    }

    @Test
    fun `the patch asks the extension right after the body is read`() {
        val original = sendRequest()
        val read = bodyRead(original)!!
        val context = PatchContexts.of(build(original))

        hideSponsoredMarketplaceListingsPatch.execute(context)

        val patched = context.mutableClassDefBy(module).methods.single().body()
        val asks = patched[read.index + 1]
        assertEquals(Opcode.INVOKE_STATIC, asks.opcode)
        assertEquals(REQUEST_BODY, asks.reference)
        assertEquals("the body, then the data", listOf(6, 1), asks.callRegisters())
        assertEquals(Opcode.MOVE_RESULT_OBJECT, patched[read.index + 2].opcode)
        assertEquals("the answer takes the body's place", 6, (patched[read.index + 2] as OneRegisterInstruction).registerA)
        val before = original.body().map { it.opcode }
        assertEquals("nothing else changes", before,
            patched.filterIndexed { index, _ -> index != read.index + 1 && index != read.index + 2 }.map { it.opcode })
        assertEquals("the OSS module is left alone", ossSendRequest().body().map { it.opcode },
            context.mutableClassDefBy("Lfixture/OkHttpNetworkingModule;").methods.single().body().map { it.opcode })

        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "sponsoredMarketplace" }
        val answer = status.body().first { it is NarrowLiteralInstruction }
        assertEquals("the settings screen isn't told the patch is in", 1, (answer as NarrowLiteralInstruction).narrowLiteral)
    }

    @Test
    fun `a build whose sendRequest can't be told apart or read is refused`() {
        fun refusal(classes: List<ClassDef>): String {
            val context = PatchContexts.of(classes)
            return assertThrows(PatchException::class.java) { hideSponsoredMarketplaceListingsPatch.execute(context) }.message!!
        }
        val none = refusal(listOf(classOf("Lfixture/OkHttpNetworkingModule;", ossSendRequest()), ExtensionDex.classDef(SETTINGS_STATUS)))
        assertTrue(none, none.contains("sendRequest") && none.contains("found 0"))
        val two = refusal(build(sendRequest()) + classOf("Lfixture/OtherModule;", sendRequest()))
        assertTrue(two, two.contains("found 2"))
        val unread = refusal(build(sendRequest(bodyKey = "formData")))
        assertTrue(unread, unread.contains("no longer reads its POST body"))
    }
}
