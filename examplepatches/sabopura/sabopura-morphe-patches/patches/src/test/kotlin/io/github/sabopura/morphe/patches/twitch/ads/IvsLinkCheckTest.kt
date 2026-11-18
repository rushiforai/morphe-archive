package io.github.sabopura.morphe.patches.twitch.ads

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.fail
import org.junit.Test

class IvsLinkCheckTest {
    private val request = "Lcom/amazonaws/ivs/net/Request;"
    private val callback = "Lcom/amazonaws/ivs/net/ResponseCallback;"
    private val methodEnum = "Lcom/amazonaws/ivs/net/Method;"
    private val client = "Lio/github/sabopura/morphe/extension/twitch/ads/Client;"
    private val publicFlags = AccessFlags.PUBLIC.value
    private val abstractFlags = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value

    private fun method(owner: String, name: String, returns: String, vararg parameters: String,
                       flags: Int = publicFlags, code: List<Instruction>? = listOf(ImmutableInstruction10x(Opcode.RETURN_VOID))): Method =
        ImmutableMethod(owner, name, parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, returns, flags,
            emptySet(), emptySet(), code?.let { ImmutableMethodImplementation(2, it, emptyList(), emptyList()) })

    private fun type(name: String, vararg methods: Method, flags: Int = publicFlags, superclass: String = "Ljava/lang/Object;",
                     interfaces: List<String> = emptyList(), fields: List<ImmutableField> = emptyList()): ClassDef =
        ImmutableClassDef(name, flags, superclass, interfaces, null, emptySet(), fields, methods.toList())

    private fun calls(owner: String, name: String, returns: String) =
        ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0, ImmutableMethodReference(owner, name, emptyList(), returns))

    private val ivsCallback = type(callback, method(callback, "onError", "V", "Ljava/lang/Exception;", flags = abstractFlags, code = null),
        method(callback, "onResponse", "V", "Lcom/amazonaws/ivs/net/Response;", flags = abstractFlags, code = null),
        flags = abstractFlags or AccessFlags.INTERFACE.value)

    /** Calls Request.lock(), reads Method.GET and implements ResponseCallback, as AdFreeHttpClient does. */
    private fun extension(vararg extra: Method) = type(client,
        method(client, "deliver", "V", code = listOf(calls(request, "lock", "Ljava/lang/Object;"),
            ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, ImmutableFieldReference(methodEnum, "GET", methodEnum)),
            ImmutableInstruction10x(Opcode.RETURN_VOID))),
        method(client, "onError", "V", "Ljava/lang/Exception;"),
        method(client, "onResponse", "V", "Lcom/amazonaws/ivs/net/Response;"),
        *extra, interfaces = listOf(callback))

    private val get = ImmutableField(methodEnum, "GET", methodEnum,
        publicFlags or AccessFlags.STATIC.value or AccessFlags.FINAL.value or AccessFlags.ENUM.value, null, emptySet(), emptySet())

    private fun ivs(vararg classes: ClassDef): (String) -> ClassDef? = classes.associateBy { it.type }::get

    private val twitch = ivs(type(request, method(request, "lock", "Ljava/lang/Object;")), ivsCallback,
        type(methodEnum, superclass = "Ljava/lang/Enum;", fields = listOf(get)))

    @Test fun nothingIsReportedWhenIvsHasEverythingTheExtensionUses() {
        assertEquals(emptyList<String>(), ivsLinkFailures(listOf(extension()), twitch))
    }

    @Test fun aMissingOrHiddenMemberIsReportedByItsDescriptor() {
        val noLock = ivs(type(request), ivsCallback, type(methodEnum, superclass = "Ljava/lang/Enum;"))
        assertEquals(listOf("Lcom/amazonaws/ivs/net/Method;->GET:Lcom/amazonaws/ivs/net/Method;",
            "Lcom/amazonaws/ivs/net/Request;->lock()Ljava/lang/Object;"), ivsLinkFailures(listOf(extension()), noLock))

        val privateLock = ivs(type(request, method(request, "lock", "Ljava/lang/Object;", flags = AccessFlags.PRIVATE.value)),
            ivsCallback, type(methodEnum, superclass = "Ljava/lang/Enum;", fields = listOf(get)))
        assertEquals(listOf("Lcom/amazonaws/ivs/net/Request;->lock()Ljava/lang/Object;"),
            ivsLinkFailures(listOf(extension()), privateLock))
    }

    @Test fun aCallbackMethodIvsAddedIsReportedUnlessASuperclassOfTheExtensionHasIt() {
        val wider = type(callback, *ivsCallback.methods.toList().toTypedArray(),
            method(callback, "onCancel", "V", flags = abstractFlags, code = null), flags = ivsCallback.accessFlags)
        val newer = ivs(type(request, method(request, "lock", "Ljava/lang/Object;")), wider,
            type(methodEnum, superclass = "Ljava/lang/Enum;", fields = listOf(get)))
        assertEquals(listOf("Lcom/amazonaws/ivs/net/ResponseCallback;->onCancel()V, which $client does not implement"),
            ivsLinkFailures(listOf(extension()), newer))

        val base = "Lio/github/sabopura/morphe/extension/twitch/ads/Base;"
        val inherited = type(client, *extension().methods.toList().toTypedArray(), superclass = base, interfaces = listOf(callback))
        assertEquals(emptyList<String>(), ivsLinkFailures(listOf(inherited, type(base, method(base, "onCancel", "V"))), newer))
    }

    @Test fun anExtensionThatUsesNoIvsFailsTheCheckItself() {
        try {
            ivsLinkFailures(listOf(type(client, method(client, "run", "V"))), twitch)
            fail("expected the check to refuse to prove nothing")
        } catch (expected: PatchException) {
            assertEquals(true, "IVS" in expected.message!!)
        }
    }
}
