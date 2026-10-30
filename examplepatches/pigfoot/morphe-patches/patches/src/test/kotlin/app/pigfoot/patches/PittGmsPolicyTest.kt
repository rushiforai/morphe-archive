package app.pigfoot.patches

import app.pigfoot.patches.pitt.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.*
import org.junit.Test
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory

class PittGmsPolicyTest {
    private val hub = "Lcom/google/android/gms/auth/api/signin/internal/SignInHubActivity;"
    private fun method(owner: String, name: String, returns: String, code: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
        params: List<String> = emptyList(), flags: Int = 1, registers: Int = 5) = MutableMethod(ImmutableMethod(
        owner, name, params.map { ImmutableMethodParameter(it, emptySet(), null) }, returns, flags,
        emptySet(), emptySet(), ImmutableMethodImplementation(registers, code, emptyList(), emptyList())))
    private fun string(value: String, register: Int = 0) = ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(value))
    private fun refs(method: MutableMethod) = method.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
    private fun hubMethod(values: List<String>) = method(hub, "onCreate", "V", values.map { string(it) } +
        ImmutableInstruction10x(Opcode.RETURN_VOID), listOf("Landroid/os/Bundle;"))

    @Test fun defaultSelectedPatchKeepsOtherPoliciesOptional() {
        assertTrue(pittGmsCorePatch.default)
        assertEquals("PiTT Google account sign-in", pittGmsCorePatch.name)
        assertFalse(pittGmsCorePatch.dependencies.contains(pittLocalSponsoredPatch))
        assertEquals(setOf(pittInputPatch), pittGmsInputPatch.dependencies)
        assertEquals(pittLocalSponsoredPatch.compatibility, pittGmsCorePatch.compatibility)
        assertEquals(8, pittGmsClassPins.size)
    }

    @Test fun onlyDeclaredAuthStringsChangeAndRegistersStayPut() {
        val m = hubMethod(listOf(PITT_GMS_ACTION, "com.google.android.gms", "com.google.android.gms.auth.NO_IMPL", "keep"))
        val before = m.implementation!!.instructions.map { (it as? OneRegisterInstruction)?.registerA }
        redirectPittGmsStrings(m)
        assertEquals(listOf("$PITT_GMS_PACKAGE.auth.GOOGLE_SIGN_IN", PITT_GMS_PACKAGE,
            "com.google.android.gms.auth.NO_IMPL", "keep"), refs(m))
        assertEquals(before, m.implementation!!.instructions.map { (it as? OneRegisterInstruction)?.registerA })
        val unrelated = method("Lother/Client;", "getStartServiceAction", "Ljava/lang/String;",
            listOf(string(PITT_GMS_SERVICE), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)))
        assertThrows(IllegalArgumentException::class.java) { redirectPittGmsStrings(unrelated) }
        assertEquals(listOf(PITT_GMS_SERVICE), refs(unrelated))
    }

    @Test fun ambiguousOrMissingSecondSiteFailsBeforeFirstMutation() {
        for (values in listOf(listOf(PITT_GMS_ACTION), listOf(PITT_GMS_ACTION, "com.google.android.gms", "com.google.android.gms"))) {
            val m = hubMethod(values)
            assertThrows(IllegalArgumentException::class.java) { redirectPittGmsStrings(m) }
            assertEquals(values, refs(m))
        }
        val m = hubMethod(listOf(PITT_GMS_ACTION, "com.google.android.gms"))
        redirectPittGmsStrings(m)
        assertThrows(IllegalArgumentException::class.java) { redirectPittGmsStrings(m) }
    }

    @Test fun legacyModeDoesNotReturnAnAccountAndKeepsOriginalBody() {
        val original = listOf(ImmutableInstruction11x(Opcode.MONITOR_ENTER, 4),
            ImmutableInstruction11n(Opcode.CONST_4, 0, 2), ImmutableInstruction11x(Opcode.MONITOR_EXIT, 4),
            ImmutableInstruction11x(Opcode.RETURN, 0))
        val m = method("Lh7/a;", "a", "I", original)
        selectPittLegacyGmsMode(m)
        val code = m.implementation!!.instructions.toList()
        assertEquals(4, (code[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, code[1].opcode)
        assertEquals(original.map { it.opcode }, code.drop(2).map { it.opcode })
        assertEquals(5, m.implementation!!.registerCount)
        assertThrows(IllegalArgumentException::class.java) { selectPittLegacyGmsMode(m) }
    }

    @Test fun availabilityOverridesBelongOnlyToLegacyAuthClient() {
        val overrides = pittGmsClientOverrides()
        assertEquals(pittGmsOverrideNames, overrides.map { it.name }.toSet())
        assertTrue(overrides.all { it.definingClass == PITT_GMS_CLIENT && it.accessFlags and AccessFlags.STATIC.value == 0 })
        val base = overrides.map { ImmutableMethod(PITT_GMS_BASE, it.name, it.parameters, it.returnType,
            AccessFlags.PUBLIC.value, emptySet(), emptySet(), it.implementation) }
        requirePittGmsBaseContract(base)
        assertThrows(IllegalArgumentException::class.java) { requirePittGmsBaseContract(base.drop(1)) }
        assertThrows(IllegalArgumentException::class.java) { requirePittGmsBaseContract(base.map {
            ImmutableMethod(PITT_GMS_BASE, it.name, it.parameters, it.returnType, it.accessFlags or AccessFlags.FINAL.value,
                emptySet(), emptySet(), it.implementation)
        }) }
    }

    private fun manifest(extra: String = "", query: String = "<queries><package android:name='com.android.vending'/></queries>",
        version: String = PITT_VERSION) = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(ByteArrayInputStream(
        """<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="$PITT_PACKAGE" android:versionName="$version" android:versionCode="$PITT_CODE">
            <uses-permission android:name="android.permission.INTERNET"/>$query
            <application android:label="PiTT"><meta-data android:name="keep" android:value="true"/>$extra</application></manifest>""".toByteArray()))

    @Test fun manifestAddsOnlyVisibilityAndIdentityWithOriginalPackage() {
        val doc = manifest()
        applyPittGmsManifest(doc)
        assertEquals(PITT_PACKAGE, doc.documentElement.getAttribute("package"))
        assertEquals(2, doc.getElementsByTagName("package").length)
        val metadata = doc.getElementsByTagName("meta-data")
        val values = (0 until metadata.length).associate {
            val node = metadata.item(it) as org.w3c.dom.Element
            node.getAttribute("android:name") to node.getAttribute("android:value")
        }
        assertEquals(mapOf("keep" to "true", "$PITT_GMS_PACKAGE.SPOOFED_PACKAGE_NAME" to PITT_PACKAGE,
            "$PITT_GMS_PACKAGE.SPOOFED_PACKAGE_SIGNATURE" to PITT_STOCK_SHA1), values)
        assertEquals(1, doc.getElementsByTagName("uses-permission").length)
        assertThrows(IllegalArgumentException::class.java) { applyPittGmsManifest(doc) }
    }

    @Test fun malformedOrPreviouslyRoutedManifestFailsWithoutAddingAnything() {
        for (doc in listOf(manifest(version = "11.12.3"), manifest(query = ""),
            manifest(extra = "<meta-data android:name='$PITT_GMS_PACKAGE.SPOOFED_PACKAGE_SIGNATURE' android:value='bad'/>"),
            manifest(query = "<queries><package android:name='$PITT_GMS_PACKAGE'/></queries>"))) {
            val metadata = doc.getElementsByTagName("meta-data").length
            val packages = doc.getElementsByTagName("package").length
            assertThrows(IllegalArgumentException::class.java) { applyPittGmsManifest(doc) }
            assertEquals(metadata, doc.getElementsByTagName("meta-data").length)
            assertEquals(packages, doc.getElementsByTagName("package").length)
        }
    }
    private fun headers(key: String = "X-Android-Cert", valueRegister: Int = 1,
        getter: String = "zza", owner: String = PITT_FIREBASE_HEADERS.substringBefore("->")): MutableMethod {
        fun call(name: String) = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 1, 0, 0, 0, 0,
            ImmutableMethodReference(PITT_FIREBASE_IDENTITY, name, emptyList(), "Ljava/lang/String;"))
        fun set() = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 3, 4, 2, valueRegister, 0, 0,
            ImmutableMethodReference("Ljava/net/URLConnection;", "setRequestProperty",
                listOf("Ljava/lang/String;", "Ljava/lang/String;"), "V"))
        return method(owner, "zza", "V", listOf(call("zzb"), ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
            string("X-Android-Package", 2), set(), ImmutableInstruction10x(Opcode.NOP), call(getter),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1), string(key, 2), set(),
            string("Accept-Language", 1), ImmutableInstruction10x(Opcode.RETURN_VOID)), listOf("Ljava/net/URLConnection;"))
    }

    @Test fun firebaseAuthChangesOnlyCertificateValueAndPreservesHeaderFlow() {
        val m = headers()
        val before = m.implementation!!.instructions.toList()
        restorePittFirebaseClientIdentity(m)
        val after = m.implementation!!.instructions.toList()
        assertEquals(5, m.implementation!!.registerCount)
        assertEquals(before.size + 1, after.size)
        assertEquals(PITT_STOCK_SHA1.uppercase(java.util.Locale.ROOT), (after[8] as ReferenceInstruction).reference.toString())
        assertEquals(1, (after[8] as OneRegisterInstruction).registerA)
        assertEquals(before.map { it.opcode }, after.filterIndexed { i, _ -> i != 8 }.map { it.opcode })
        assertEquals(before.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() },
            after.filterIndexed { i, _ -> i != 8 }.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() })
    }

    @Test fun missingAmbiguousOrWrongFirebaseHeaderShapeRejectsAtomically() {
        for (m in listOf(headers(key = "other"), headers(valueRegister = 0), headers(getter = "zzb"))) {
            val before = refs(m)
            assertThrows(IllegalArgumentException::class.java) { restorePittFirebaseClientIdentity(m) }
            assertEquals(before, refs(m))
        }
        val m = headers()
        m.implementation!!.addInstruction(0, com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c(
            Opcode.CONST_STRING, 0, ImmutableStringReference("X-Android-Cert")))
        val before = refs(m)
        assertThrows(IllegalArgumentException::class.java) { restorePittFirebaseClientIdentity(m) }
        assertEquals(before, refs(m))
    }

    @Test fun unrelatedOwnerAndRepeatedFirebaseIdentityCorrectionReject() {
        val unrelated = headers(owner = "Lcom/google/firebase/remoteconfig/internal/ConfigFetchHttpClient;")
        assertThrows(IllegalArgumentException::class.java) { restorePittFirebaseClientIdentity(unrelated) }
        val m = headers()
        restorePittFirebaseClientIdentity(m)
        val before = refs(m)
        assertThrows(IllegalArgumentException::class.java) { restorePittFirebaseClientIdentity(m) }
        assertEquals(before, refs(m))
    }

}
