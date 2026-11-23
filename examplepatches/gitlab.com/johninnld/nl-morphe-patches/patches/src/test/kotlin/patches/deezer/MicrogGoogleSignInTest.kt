package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import java.util.Base64
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assume.assumeNotNull
import org.junit.Test

/** Structural product tests; Android signing/consent behavior still needs grouped acceptance. */
class MicrogGoogleSignInTest {
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun List<Instruction>.call(suffix: String) = indices.single { this[it].reference()?.endsWith(suffix) == true }

    @Test fun oauthIdentitySurvivesBothInstallationPackagesWithoutChangingLocalIdentity() {
        val android = "http://schemas.android.com/apk/res/android"
        for (installedPackage in listOf("deezer.android.app", "deezer.android.app.morphe")) {
            val document = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
                .newDocumentBuilder().parse("""
                    <manifest xmlns:android="$android" package="$installedPackage">
                        <application android:name="deezer.android.app.DZMidlet">
                            <meta-data android:name="existing" android:value="preserved"/>
                        </application>
                    </manifest>
                """.trimIndent().byteInputStream())
            addDeezerMicrogOAuthIdentity(document)
            assertEquals(installedPackage, document.documentElement.getAttribute("package"))
            val app = document.getElementsByTagName("application").item(0) as org.w3c.dom.Element
            assertEquals("deezer.android.app.DZMidlet", app.getAttributeNS(android, "name"))
            val nodes = app.getElementsByTagName("meta-data")
            val values = (0 until nodes.length).associate {
                val node = nodes.item(it) as org.w3c.dom.Element
                node.getAttributeNS(android, "name") to node.getAttributeNS(android, "value")
            }
            assertEquals("preserved", values["existing"])
            assertEquals("deezer.android.app", values["app.revanced.android.gms.SPOOFED_PACKAGE_NAME"])
            assertEquals("5de8eb4098d2e35a2c3951a169bf9e19a680e2d4",
                values["app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE"])
            assertEquals(3, nodes.length)
            assertTrue(runCatching { addDeezerMicrogOAuthIdentity(document) }.exceptionOrNull() is IllegalStateException)
            assertEquals(3, app.getElementsByTagName("meta-data").length)
        }
    }

    @Test
    fun compiledExtensionKeepsItsLambdaAndApiHelpersInsideTheOwnedNamespace() {
        // Consume the actual compiled MPE resource, not a synthetic class-list fixture.
        val dex = microgConsentExtension().buffered().use {
            com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile.fromInputStream(null, it)
        }
        val types = dex.classes.map { it.type }
        assertEquals(types.size, types.distinct().size)
        assertTrue(types.all { it.startsWith("Lnl/johninnl/deezer/auth/") })
        assertTrue(types.contains(GOOGLE_ADAPTER))
        assertTrue(types.contains(GOOGLE_CONSENT))
        assertTrue(types.contains(GOOGLE_REQUEST))
        assertTrue(types.contains(GOOGLE_GENERATION))
        assertFalse(types.any { it.startsWith("Lkotlin/") || it.matches(Regex("L[a-z];")) })
    }

    private fun original(owner: String, name: String, parameters: List<String>): MutableMethod {
        val path = System.getenv("DEEZER_ORIGINAL_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val cls = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.single { it.type == owner }
        return MutableMethod(cls.methods.single {
            it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters
        })
    }

    @Test fun iteratorExitActuallyReachesTheCompatibilitySelectorOnTheOriginalInput() {
        val method = original("LIlIllIlIIIIIlll;", "IllIlIlIIlIllIll",
            listOf("Landroid/content/Context;", "LIIIIIIlllIIlIllI;", "LlIIIIIlllIlIlll;"))
        val before = method.instructions.toList()
        val sdk = before.indices.single { before[it].reference() == "Landroid/os/Build\$VERSION;->SDK_INT:I" }
        val exit = before.indices.single { before[it].opcode == Opcode.IF_EQZ &&
            before.getOrNull(it - 2)?.reference() == "Ljava/util/Iterator;->hasNext()Z" }
        assertEquals(sdk, (before[exit] as BuilderOffsetInstruction).target.location.index)
        selectMicrogCredentialCompatibility(method)
        val after = method.instructions.toList()
        assertEquals(before.size, after.size)
        assertEquals(Opcode.GOTO_32, after[sdk].opcode)
        assertEquals(sdk, (after[exit] as BuilderOffsetInstruction).target.location.index)
        val destination = (after[sdk] as BuilderOffsetInstruction).target.location.index
        assertEquals("LIlIIllIlllIllII;->llIIIIIIlIIIIll()LIIllIlIIIllIIIlI;", after[destination].reference())
        before.indices.filter { it != sdk }.forEach { assertTrue(before[it] === after[it]) }
        assertBranchBoundaries(method)
    }

    @Test
    fun trustUsesPublisherPinAndAndroidRotationVerifierRatherThanLegacySignatureArrays() {
        val code = microgReleaseTrustMethod().instructions.toList()
        val digest = code.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
            .mapNotNull { runCatching { Base64.getDecoder().decode(it) }.getOrNull() }
            .single { it.size == 32 }
        assertEquals("0b6c9515afb195fac59601696ba0a7907a0b217ccf720b43148427ccf64343e7",
            digest.joinToString("") { "%02x".format(it.toInt() and 0xff) })
        val lookup = code.call("->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;")
        assertEquals(0x08000000, (code[lookup - 1] as NarrowLiteralInstruction).narrowLiteral)
        val multiple = code.call("->hasMultipleSigners()Z")
        val pin = code.call("->hasSigningCertificate(Ljava/lang/String;[BI)Z")
        assertTrue(multiple < pin)
        assertEquals(1, (code[pin - 1] as NarrowLiteralInstruction).narrowLiteral) // CERT_INPUT_SHA256.
        assertEquals(Opcode.IF_NEZ, code[multiple + 2].opcode)
        assertEquals(Opcode.IF_EQZ, code[pin + 2].opcode)
        val reject = (code[pin + 2] as BuilderOffsetInstruction).target.location.index
        assertEquals(reject, (code[multiple + 2] as BuilderOffsetInstruction).target.location.index)
        assertEquals("Ljava/lang/SecurityException;", code[reject].reference())
        assertEquals(Opcode.THROW, code.last().opcode)
        assertEquals(Opcode.RETURN_VOID, code[pin + 3].opcode)
        // No home-grown certificate history walk, legacy signatures, trust cache or token API.
        assertFalse(code.any { it.reference()?.contains("->signatures:") == true })
        assertFalse(code.any { it.opcode == Opcode.SPUT_BOOLEAN || it.reference()?.contains("AccountManager") == true })
        val unsupportedApi = code.single { it.opcode == Opcode.IF_LT } as BuilderOffsetInstruction
        assertEquals(reject, unsupportedApi.target.location.index)
        val componentPackage = code.call("Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;")
        // Explicit components must agree with the pinned package before the signer lookup.
        assertTrue(componentPackage < lookup)
        assertEquals(Opcode.IF_EQZ, code[componentPackage + 4].opcode)
        assertEquals(reject, (code[componentPackage + 4] as BuilderOffsetInstruction).target.location.index)
    }

    @Test
    fun bothIdentityDestinationsConvergeOnTrustBeforeReturningAnIntent() {
        val method = original(DEEZER_MICROG_INTENT_FACTORY, "IllIlIlIIlIllIll",
            listOf("Landroid/content/Context;", "Lcom/google/android/gms/common/internal/zzn;"))
        val native = method.instructions.toList()
        routeMicrogIdentityServices(method)
        val code = method.instructions.toList()
        val nativeStart = code.indexOfFirst { it === native.first() }
        assertTrue(nativeStart > 0)
        assertEquals(native, code.drop(nativeStart))
        val prefix = code.take(nativeStart)
        val strings = prefix.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
        assertTrue(strings.contains("$DEEZER_MICROG_PACKAGE.auth.api.identity.service.signin.START"))
        assertTrue(strings.contains("$DEEZER_MICROG_PACKAGE.auth.api.identity.service.authorization.START"))
        val trust = prefix.call("->$DEEZER_MICROG_TRUST_METHOD(Landroid/content/Context;Landroid/content/Intent;)V")
        assertEquals(Opcode.RETURN_OBJECT, prefix[trust + 1].opcode)
        assertEquals(1, prefix.count { it.opcode == Opcode.NEW_INSTANCE })
        // Both actions share the sole Intent construction and trust call. Other actions retain
        // the complete native resolution path rather than getting a new trusted-status result.
        assertEquals(2, prefix.count {
            it.opcode == Opcode.IF_EQZ && (it as BuilderOffsetInstruction).target.location.index == nativeStart
        })
    }

    @Test
    fun everyActualBindAndReconnectPassesTheGuardWithoutChangingNativeBindingOrCleanup() {
        val method = original("Lcom/google/android/gms/common/stats/ConnectionTracker;", "IIlIlIlIlIllllll", listOf(
            "Landroid/content/Context;", "Ljava/lang/String;", "Landroid/content/Intent;",
            "Landroid/content/ServiceConnection;", "I", "Ljava/util/concurrent/Executor;",
        ))
        val native = method.instructions.toList()
        val registers = method.implementation!!.registerCount
        guardMicrogServiceBinds(method)
        val code = method.instructions.toList()
        assertEquals(native, code.drop(3))
        assertEquals(registers, method.implementation!!.registerCount)
        assertEquals(registers - 6, (code[0] as TwoRegisterInstruction).registerB) // Context p1.
        assertEquals(registers - 4, (code[1] as TwoRegisterInstruction).registerB) // Intent p3.
        assertTrue(code[2].reference()!!.contains("->$DEEZER_MICROG_TRUST_METHOD("))
        val binds = code.indices.filter { code[it].reference()?.startsWith("Landroid/content/Context;->bindService(") == true }
        assertEquals(4, binds.size) // Both Android bind overloads, in both original paths.
        assertTrue(binds.all { it > 2 })
        assertTrue(runCatching { guardMicrogServiceBinds(method) }.exceptionOrNull() is IllegalStateException)
    }

    @Test
    fun genuinePendingResultIsDispatchedOnlyForTheMatchedCurrentRequest() {
        val original = original(DEEZER_WELCOME, "onCredentialManagerSignIn\$lambda\$0", listOf(
            DEEZER_WELCOME, "LlIIIlllllIIlIll;", "Lcom/google/android/gms/auth/api/identity/AuthorizationResult;",
        ))
        val native = original.instructions.map { it.opcode to it.reference() }
        val (guarded, completed) = microgConsentCallbacks(original)
        assertEquals(3, completed.implementation!!.registerCount)
        assertEquals(native, completed.instructions.map { it.opcode to it.reference() })
        assertTrue(com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.isSet(completed.accessFlags))
        assertEquals(5, guarded.implementation!!.registerCount)
        val code = guarded.instructions.toList()
        val match = code.call("->matches(Ljava/lang/Object;)Z")
        val launch = code.call("->launch(Landroid/app/PendingIntent;)V")
        val complete = code.call("->completeNative(Ljava/lang/Object;)V")
        assertTrue(match < launch && match < complete)
        assertEquals(Opcode.IF_EQZ, code[match + 2].opcode)
        assertTrue((code[match + 2] as BuilderOffsetInstruction).target.location.index > complete)
        assertEquals(1, code.count { it.reference()?.endsWith(":Landroid/app/PendingIntent;") == true })
        assertFalse(code.any { it.reference()?.contains("handleGoogleSignIn") == true })
        assertFalse(code.any { it.reference()?.contains("startIntentSender") == true }) // Foreground extension owns launch.
    }

    @Test
    fun nativeAuthorizationOptionsStayIntactAndFailureGetsRequestCorrelation() {
        val method = original(DEEZER_WELCOME, "onCredentialManagerSignIn",
            listOf("Landroid/content/Context;", "LlIIIlllllIIlIll;"))
        val before = method.instructions.toList()
        val registers = method.implementation!!.registerCount
        val requestBuilderReferences = before.filter {
            it.reference()?.contains("Lcom/google/android/gms/auth/api/identity/AuthorizationRequest\$Builder;") == true
        }
        prepareMicrogConsent(method)
        val after = method.instructions.toList()
        assertEquals(registers, method.implementation!!.registerCount)
        assertTrue(requestBuilderReferences.all { expected -> after.any { it === expected } })
        assertEquals(3, before.count { expected -> after.none { it === expected } }) // Only failure-listener allocation.
        assertFalse(after.any { it.reference()?.contains("$GOOGLE_CONSENT->prepare(") == true })
        assertTrue(after.any { it.reference()?.contains("$GOOGLE_REQUEST->matches(Ljava/lang/Object;)Z") == true })
        assertTrue(after.any { it.reference()?.contains("$GOOGLE_ADAPTER-><init>(") == true })
        // Decode serialized bytes: mutable instruction labels alone hid the crash.
        val store = com.android.tools.smali.dexlib2.writer.io.MemoryDataStore()
        val pool = com.android.tools.smali.dexlib2.writer.pool.DexPool(Opcodes.getDefault())
        pool.internClass(com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
            method.definingClass, 1, "Ljava/lang/Object;", emptyList(), null, emptySet(), emptyList(), listOf(method)))
        val decoded = try {
            pool.writeTo(store)
            com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile.fromInputStream(null, store.data.inputStream())
                .classes.single().methods.single()
        } finally { store.close() }
        assertBranchBoundaries(decoded)
        val decodedCode = decoded.implementation!!.instructions.toList()
        val starts = decodedCode.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        val match = decodedCode.call("->matches(Ljava/lang/Object;)Z")
        val allow = decodedCode[match + 2] as com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
        val destination = starts[match + 2] + allow.codeOffset
        val builder = decodedCode.indices.single { decodedCode[it].opcode == Opcode.NEW_INSTANCE &&
            decodedCode[it].reference() == "Lcom/google/android/gms/auth/api/identity/AuthorizationRequest\$Builder;" }
        assertEquals(starts[builder], destination)

    }

    @Test
    fun nativeResultParserRequiresSuccessfulStatusAndUsesOriginalSafeParcelableCreator() {
        val methods = microgConsentNativeMethods()
        val parser = methods.single { it.name == "morpheParseGoogleAuthorization" }.instructions.toList()
        val status = parser.call("Lcom/google/android/gms/common/api/Status;->IIIlllIIIIIllIll()Z")
        val decode = parser.call("Lcom/google/android/gms/common/internal/safeparcel/SafeParcelableSerializer;->IllIlIlIIlIllIll([BLandroid/os/Parcelable\$Creator;)Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;")
        assertTrue(status < decode)
        assertEquals(Opcode.IF_NEZ, parser[status + 2].opcode)
        assertTrue(parser.any { it.reference()?.contains("Lcom/google/android/gms/common/api/ApiException;-><init>(") == true })
        assertTrue(parser.any { it.reference()?.contains("AuthorizationResult;->CREATOR:") == true })
        assertTrue(parser.any { it.reference()?.contains("->morpheIsGoogleAuthorizationComplete(") == true })
        assertEquals(Opcode.THROW, parser.last().opcode)
        val account = methods.single { it.name == "morpheSameGoogleAccount" }.instructions.toList()
        assertTrue(account.any { it.reference()?.contains("BUNDLE_KEY_ID") == true })
        assertTrue(account.any { it.reference()?.endsWith("->equalsIgnoreCase(Ljava/lang/String;)Z") == true })
        assertFalse(account.any { it.reference()?.contains("ID_TOKEN") == true })
        assertFalse(account.any { it.reference()?.contains("android/util/Log") == true })
        val adapter = microgConsentAdapterDex().buffered().use {
            com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile.fromInputStream(null, it)
        }.classes.single()
        assertTrue(adapter.interfaces.contains(GOOGLE_CALLBACKS))
        assertTrue(adapter.interfaces.contains("Lcom/google/android/gms/tasks/OnFailureListener;"))
        val install = adapter.methods.single { it.name == "install" }.implementation!!.instructions.toList()
        val installGate = install.indexOfFirst { it.reference()?.contains("->generationCurrent()Z") == true }
        val ownership = install.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT && it.reference()?.contains("->$GOOGLE_REQUEST_FIELD:") == true }
        assertTrue(installGate >= 0 && installGate < ownership)
        val failure = adapter.methods.single { it.name == "llIIlIlIlIllI" }.implementation!!.instructions.toList()
        assertTrue(failure.any { it.reference()?.contains("->matchesGeneration($GOOGLE_GENERATION)Z") == true })
        assertFalse(failure.any { it.reference()?.contains("getMessage") == true })
        assertFalse(failure.any { it.reference()?.contains("android/util/Log") == true })
        val numericStatus = adapter.methods.single { it.name == "statusCode" }.implementation!!.instructions.toList()
        assertTrue(numericStatus.any { it.reference()?.endsWith("->getStatusCode()I") == true })
        assertFalse(numericStatus.any { it.reference()?.contains("getMessage") == true })
        val current = adapter.methods.single { it.name == "isCurrent" }.implementation!!.instructions.toList()
        assertTrue(current.any { it.reference()?.contains("->generationCurrent()Z") == true })
        val generationGate = adapter.methods.single { it.name == "generationCurrent" }.implementation!!.instructions.toList()
        assertTrue(generationGate.any { it.reference()?.contains("->isCurrentFor(${GOOGLE_GENERATION}Z)Z") == true })
        for (name in listOf("cancel", "failure")) {
            val callback = adapter.methods.single { it.name == name }.implementation!!.instructions.toList()
            assertTrue(callback.any { it.opcode == Opcode.IF_EQZ }) // Captured generation must still be current before reset.
        }
        val clear = methods.single { it.name == "onCleared" }.instructions.toList()
        assertTrue(clear[0].reference()!!.contains("->morpheAbandonGoogleAuthorization("))
        assertEquals(Opcode.INVOKE_SUPER, clear[1].opcode)
        assertTrue(clear[1].reference()!!.endsWith("SocialMissingInfosViewModel;->onCleared()V"))
    }
    @Test
    fun generationBeginsBeforeChooserAndAuthStageCanOnlyConsumeItsBoundCredential() {
        val start = original(DEEZER_WELCOME, "onSignInWithGoogle", listOf("Landroid/content/Context;"))
        val native = start.instructions.toList()
        beginGoogleChooserGeneration(start)
        val code = start.instructions.toList()
        assertTrue(code[0].reference()!!.contains("->morpheBeginGoogleChooser("))
        assertEquals(native, code.drop(4))
        val begin = microgConsentNativeMethods().single { it.name == "morpheBeginGoogleChooser" }.instructions.toList()
        val mint = begin.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.reference() == GOOGLE_GENERATION }
        val prepare = begin.indexOfFirst { it.reference()?.contains("$GOOGLE_CONSENT->prepare(") == true }
        assertTrue(mint >= 0 && mint < prepare)
        assertTrue(begin.subList(mint, prepare).any { it.reference()?.contains("->$GOOGLE_GENERATION_FIELD:") == true })
    }

    @Test
    fun coroutineCloneCarriesItsOriginalGenerationAndResumeRejectsStaleSuccessOrFailure() {
        val constructor = original(GOOGLE_CHOOSER, "<init>", listOf(DEEZER_WELCOME,
            "Landroid/content/Context;", "LIIIIIIlllIIlIllI;", "LlIIIIIlllIlIlll;"))
        val beforeCtor = constructor.instructions.toList()
        captureGoogleChooserGeneration(constructor)
        assertEquals(5, constructor.implementation!!.registerCount)
        assertTrue(beforeCtor.all { old -> constructor.instructions.any { it === old } })
        assertTrue(constructor.instructions.any { it.reference()?.contains("->this\$0:$DEEZER_WELCOME") == true })
        val create = original(GOOGLE_CHOOSER, "create", listOf("Ljava/lang/Object;", "LlIIIIIlllIlIlll;"))
        val native = create.instructions.map { it.opcode to it.reference() }
        val (wrapped, kept) = copyGoogleChooserGeneration(create)
        assertEquals(native, kept.instructions.map { it.opcode to it.reference() })
        assertEquals(5, kept.implementation!!.registerCount)
        assertTrue(wrapped.instructions.any { it.reference() == "$GOOGLE_CHOOSER->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION" })
        assertFalse(wrapped.instructions.any { it.reference() == "$DEEZER_WELCOME->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION" })
        val resume = original(GOOGLE_CHOOSER, "invokeSuspend", listOf("Ljava/lang/Object;"))
        guardGoogleChooserResume(resume)
        val code = resume.instructions.toList()
        val gate = code.indexOfFirst { it.reference()?.contains("->morpheGoogleGenerationCurrent(") == true }
        val chooserCall = code.indexOfFirst { it.reference()?.contains("LIlIllIlIIIIIlll;->IllIlIlIIlIllIll(") == true }
        val bind = code.indexOfFirst { it.reference()?.contains("->bindCredential(Ljava/lang/Object;)Z") == true }
        val callback = code.indexOfFirst { it.reference()?.contains("->access\$onCredentialManagerSignIn(") == true }
        assertTrue(gate >= 0 && gate < chooserCall && bind > chooserCall && bind < callback)
        assertEquals(11, resume.implementation!!.registerCount)
    }

}

/** Inspect the complete patched welcome class, including methods not executed while signed in. */
class MicrogGoogleSignInEmittedTest {
    @Test fun signedOutClassesHaveOnlyValidInstructionTargets() {
        val path = System.getenv("DEEZER_QUEUE_27_EMITTED_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
        val owners = classes.filter { it.type == DEEZER_WELCOME || it.type == GOOGLE_CHOOSER ||
            it.type.startsWith("Lnl/johninnl/deezer/auth/") }
        assertTrue(owners.any { it.type == DEEZER_WELCOME })
        assertTrue(owners.any { it.type == GOOGLE_CHOOSER })
        owners.forEach { it.methods.forEach(::assertBranchBoundaries) }
        val bridge = classes.single { it.type == "LIlIllIlIIIIIlll;" }.methods.single { it.name == "IllIlIlIIlIllIll" }
        val code = bridge.implementation!!.instructions.toList()
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }.dropLast(1)
        val exit = code.indices.single { code[it].opcode == Opcode.IF_EQZ &&
            (code.getOrNull(it - 2) as? ReferenceInstruction)?.reference.toString() == "Ljava/util/Iterator;->hasNext()Z" }
        val selectorAddress = addresses[exit] + (code[exit] as OffsetInstruction).codeOffset
        val selector = addresses.indexOf(selectorAddress)
        assertTrue("Iterator exit must land on the selector, not skip it", selector >= 0)
        assertEquals(Opcode.GOTO_32, code[selector].opcode)
        val destination = addresses.indexOf(selectorAddress + (code[selector] as OffsetInstruction).codeOffset)
        assertTrue(destination >= 0)
        assertEquals("LIlIIllIlllIllII;->llIIIIIIlIIIIll()LIIllIlIIIllIIIlI;",
            (code[destination] as ReferenceInstruction).reference.toString())
    }
}
