package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import org.w3c.dom.Element
import org.w3c.dom.Document

private const val MICROG_RE = DEEZER_MICROG_PACKAGE
private const val GOOGLE_GMS = "com.google.android.gms"
private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val CREDENTIAL_PROVIDER = "Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;"
private const val SERVICE_CONFIG = "Lcom/google/android/gms/common/internal/zzn;"

// Verified signer of the supported original 9.0.27.3 APK. MicroG resolves these values
// from the installed caller before sending its existing OAuth request to Google.
internal val deezerMicrogOAuthIdentity = mapOf(
    "$MICROG_RE.SPOOFED_PACKAGE_NAME" to "deezer.android.app",
    "$MICROG_RE.SPOOFED_PACKAGE_SIGNATURE" to "5de8eb4098d2e35a2c3951a169bf9e19a680e2d4",
)

internal fun addDeezerMicrogOAuthIdentity(manifest: Document) {
    val application = manifest.getElementsByTagName("application").let {
        check(it.length == 1) { "Deezer application manifest structure changed" }
        it.item(0) as Element
    }
    val metadata = manifest.getElementsByTagName("meta-data")
    check((0 until metadata.length).none {
        val name = (metadata.item(it) as Element).getAttributeNS(ANDROID, "name")
        name.endsWith(".SPOOFED_PACKAGE_NAME") || name.endsWith(".SPOOFED_PACKAGE_SIGNATURE")
    }) { "Deezer already declares microG OAuth identity metadata" }
    for ((name, value) in deezerMicrogOAuthIdentity) {
        application.appendChild(manifest.createElement("meta-data").apply {
            setAttributeNS(ANDROID, "android:name", name)
            setAttributeNS(ANDROID, "android:value", value)
        })
    }
}

/** Keep incoming iterator-exit labels on the replacement selector, not past an inserted jump. */
internal fun selectMicrogCredentialCompatibility(method: MutableMethod) {
    check(method.definingClass == "LIlIllIlIIIIIlll;" && method.name == "IllIlIlIIlIllIll" &&
        AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.map(CharSequence::toString) ==
        listOf("Landroid/content/Context;", "LIIIIIIlllIIlIllI;", "LlIIIIIlllIlIlll;"))
    val sdkRead = method.instructions.withIndex().single {
        it.value.opcode == Opcode.SGET && (it.value as? ReferenceInstruction)?.reference?.toString() ==
            "Landroid/os/Build\$VERSION;->SDK_INT:I"
    }
    val compatibilityBranch = method.instructions.single { it.opcode == Opcode.IF_EQ } as BuilderOffsetInstruction
    val target = compatibilityBranch.target.location.index
    check(method.getInstruction(target).opcode == Opcode.INVOKE_VIRTUAL &&
        (method.getInstruction(target) as? ReferenceInstruction)?.reference?.toString() ==
        "LIlIIllIlllIllII;->llIIIIIIlIIIIll()LIIllIlIIIllIIIlI;") {
        "Deezer Google credential compatibility backend changed"
    }
    method.replaceInstruction(sdkRead.index,
        BuilderInstruction30t(Opcode.GOTO_32, method.implementation!!.newLabelForIndex(target)))
}

private val microgConsentInput = bytecodePatch {
    dependsOn(deezerBase)
    execute {
        check(classDefByOrNull { it.type.startsWith("Lnl/johninnl/deezer/auth/") } == null) {
            "Deezer already contains Google-consent integration classes"
        }
    }
}

private val microgGoogleSignInResources = resourcePatch {
    dependsOn(deezerBase)

    execute {
        // Pin the audited original input. Google routing does not replace protected startup.
        check(packageMetadata.versionName == "9.0.27.3" && packageMetadata.versionCode.toIntOrNull() == 9002703) {
            "Deezer microG-RE Google sign-in is implemented only for 9.0.27.3 (9002703)"
        }
        document("AndroidManifest.xml").use { manifest ->
            val queries = manifest.getElementsByTagName("queries")
            check(queries.length <= 1) { "Deezer package visibility structure changed" }
            val query = queries.item(0) as? Element ?: manifest.createElement("queries").also {
                manifest.documentElement.appendChild(it)
            }
            val packages = query.getElementsByTagName("package")
            if ((0 until packages.length).none {
                    (packages.item(it) as Element).getAttribute("android:name") == MICROG_RE
                }) {
                query.appendChild(manifest.createElement("package").apply {
                    setAttributeNS(ANDROID, "android:name", MICROG_RE)
                })
            }
        }
    }

    finalize {
        document("AndroidManifest.xml").use { manifest ->
            addDeezerMicrogOAuthIdentity(manifest)
        }
    }
}

/**
 * Transport interoperability only. microG-RE's IdentitySignInService implements BeginSignIn and
 * owns the account chooser/consent UI; AuthorizationService implements the subsequent native
 * authorization call. Keep Deezer's options, client IDs, nonce, results and account/session logic.
 * No account enumeration, token reads, diagnostic logging or fabricated credentials are added.
 *
 * The installed package and Manager signing key stay unchanged. MicroG's supported metadata
 * presents Deezer's original registered OAuth identity to Google. SDK availability/feature checks
 * still apply. A foreground-only fragment owns genuine consent PendingIntents and validates
 * native success/cancel results. The supported installation keeps Deezer's original package.
 */
@Suppress("unused")
val deezerMicrogGoogleSignIn = bytecodePatch(
    name = "Google sign-in through microG-RE",
    description = "Google account chooser and sign-in routing through installed microG-RE. " +
        "Uses Deezer's original OAuth identity through microG compatibility metadata. " +
        "Google SDK availability checks still apply. " +
        "Resolves interactive consent from foreground sign-in using Deezer's standard package name. " +
        "Does not change email, Facebook or Apple sign-in.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(deezerBase, microgGoogleSignInResources, microgConsentInput)
    extendWith(java.util.function.Supplier { microgConsentExtension() })

    execute {
        // The only caller in the supported input is WelcomeViewModel's Google-sign-in coroutine.
        // Select the existing AndroidX compatibility backend, not a fake SDK level. Its factory
        // still runs isAvailableOnDevice(), and cancellation/result/error delivery stays native.
        val bridge = exact(
            "LIlIllIlIIIIIlll;", "IllIlIlIIlIllIll", "Ljava/lang/Object;",
            "Landroid/content/Context;", "LIIIIIIlllIIlIllI;", "LlIIIIIlllIlIlll;",
        ).method
        selectMicrogCredentialCompatibility(bridge)

        // This is the provider's version lookup, not the caller's package or certificate.
        // Require the exact prototype and getPackageInfo consumer to avoid rewriting an
        // unrelated overload or any Google availability/signature-verification implementation.
        val getCredential = exact(
            CREDENTIAL_PROVIDER, "onGetCredential", "V",
            "Landroid/content/Context;", "LIIIIIIlllIIlIllI;", "Landroid/os/CancellationSignal;",
            "Ljava/util/concurrent/Executor;", "LIIllIlIIlIlI;",
        ).method
        val lookup = getCredential.instructions.withIndex().single {
            it.value.opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) &&
                ((it.value as? ReferenceInstruction)?.reference as? StringReference)?.string == GOOGLE_GMS
        }
        val lookupRegister = (lookup.value as OneRegisterInstruction).registerA
        val lookupCall = getCredential.getInstruction(lookup.index + 2)
        check(lookupCall.opcode == Opcode.INVOKE_VIRTUAL &&
            (lookupCall as? ReferenceInstruction)?.reference?.toString() ==
            "Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;" &&
            (lookupCall as? FiveRegisterInstruction)?.registerD == lookupRegister) {
            "Deezer credential-provider version lookup changed"
        }
        val opcode = if (lookup.value.opcode == Opcode.CONST_STRING_JUMBO) "const-string/jumbo" else "const-string"
        getCredential.replaceInstruction(lookup.index, "$opcode v$lookupRegister, \"$MICROG_RE\"")

        val factoryClass = mutableClassDefBy(DEEZER_MICROG_INTENT_FACTORY)
        check(factoryClass.methods.none { it.name == DEEZER_MICROG_TRUST_METHOD }) {
            "Deezer microG release-trust helper already exists"
        }
        factoryClass.methods.add(microgReleaseTrustMethod())
        guardMicrogServiceBinds(exact(
            "Lcom/google/android/gms/common/stats/ConnectionTracker;", "IIlIlIlIlIllllll", "Z",
            "Landroid/content/Context;", "Ljava/lang/String;", "Landroid/content/Intent;",
            "Landroid/content/ServiceConnection;", "I", "Ljava/util/concurrent/Executor;",
        ).method)
        val callbackClass = mutableClassDefBy(DEEZER_WELCOME)
        check(callbackClass.superclass == "Lcom/deezer/featureskit/authui/social/SocialMissingInfosViewModel;")
        exact("Lcom/deezer/featureskit/authui/social/SocialMissingInfosViewModel;", "getLoginMode",
            "Lcom/deezer/featureskit/authui/social/LoginMode;")
        exact("Lcom/deezer/featureskit/authui/social/SocialMissingInfosViewModel;", "onCleared", "V")
        // Fail closed on drift in the native validation/result ABI before adding the bridge.
        exact("Lcom/google/android/gms/tasks/OnFailureListener;", "llIIlIlIlIllI", "V", "Ljava/lang/Exception;")
        exact("Lcom/google/android/gms/common/api/Status;", "IIIlllIIIIIllIll", "Z")
        exact("Lcom/google/android/gms/common/api/ApiException;", "getStatusCode", "I")
        exact("Lcom/google/android/gms/common/internal/safeparcel/SafeParcelableSerializer;", "IllIlIlIIlIllIll",
            "Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;", "[B", "Landroid/os/Parcelable\$Creator;")
        val nativeResult = mutableClassDefBy("Lcom/google/android/gms/auth/api/identity/AuthorizationResult;")
        for ((name, type) in listOf("IlIlIIIIlIlIllII" to "Landroid/app/PendingIntent;",
            "IIllllllllIlll" to "Ljava/lang/String;", "CREATOR" to "Landroid/os/Parcelable\$Creator;",
            "IIIIIlIIIlIlllI" to "Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;")) {
            check(nativeResult.fields.count { it.name == name && it.type == type } == 1)
        }
        for ((owner, name, type) in listOf(
            Triple("LlIIIlllllIIlIll;", "IllIlIlIIlIllIll", "LlIIlllllllIlIl;"),
            Triple("LlIIlllllllIlIl;", "IIlllIlllIlll", "Ljava/lang/Object;"),
            Triple("Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;", "IIIIIllIIIlIIllI", "Ljava/lang/String;"),
        )) check(mutableClassDefBy(owner).fields.count { it.name == name && it.type == type } == 1)
        for ((name, type) in listOf(GOOGLE_REQUEST_FIELD to GOOGLE_REQUEST, GOOGLE_GENERATION_FIELD to GOOGLE_GENERATION)) {
            check(callbackClass.fields.none { it.name == name })
            callbackClass.fields.add(MutableField(ImmutableField(DEEZER_WELCOME, name, type,
                AccessFlags.PUBLIC.value or AccessFlags.SYNTHETIC.value, null, emptySet(), emptySet())))
        }
        val helpers = microgConsentNativeMethods()
        check(callbackClass.methods.none { existing -> helpers.any { it.name == existing.name } })
        callbackClass.methods.addAll(helpers)
        prepareMicrogConsent(exact(
            DEEZER_WELCOME, "onCredentialManagerSignIn", "V", "Landroid/content/Context;", "LlIIIlllllIIlIll;",
        ).method)
        beginGoogleChooserGeneration(exact(
            DEEZER_WELCOME, "onSignInWithGoogle", "V", "Landroid/content/Context;",
        ).method)
        val chooserClass = mutableClassDefBy(GOOGLE_CHOOSER)
        check(chooserClass.methods.none { it.name == GOOGLE_CHOOSER_COPY })
        check(chooserClass.fields.count { it.name == "this\$0" && it.type == DEEZER_WELCOME } == 1)
        check(chooserClass.fields.none { it.name == GOOGLE_GENERATION_FIELD })
        chooserClass.fields.add(MutableField(ImmutableField(GOOGLE_CHOOSER, GOOGLE_GENERATION_FIELD,
            GOOGLE_GENERATION, AccessFlags.PRIVATE.value or AccessFlags.SYNTHETIC.value, null, emptySet(), emptySet())))
        captureGoogleChooserGeneration(exact(GOOGLE_CHOOSER, "<init>", "V", DEEZER_WELCOME,
            "Landroid/content/Context;", "LIIIIIIlllIIlIllI;", "LlIIIIIlllIlIlll;").method)
        val create = exact(GOOGLE_CHOOSER, "create", "LlIIIIIlllIlIlll;", "Ljava/lang/Object;", "LlIIIIIlllIlIlll;").method
        check(chooserClass.methods.none { it.name == GOOGLE_CHOOSER_COPY })
        val (wrappedCreate, nativeCreate) = copyGoogleChooserGeneration(create)
        check(chooserClass.methods.remove(create))
        chooserClass.methods.add(wrappedCreate)
        chooserClass.methods.add(nativeCreate)
        guardGoogleChooserResume(exact(GOOGLE_CHOOSER, "invokeSuspend", "Ljava/lang/Object;", "Ljava/lang/Object;").method)
        val clickGoogle = exact(DEEZER_WELCOME, "onClickGoogle", "V").method
        check(checkNotNull(clickGoogle.implementation).registerCount in 2..16)
        clickGoogle.addInstructionsWithLabels(0, """
            iget-object v0, p0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
            if-eqz v0, :morphe_new_google_signin
            invoke-virtual {v0}, $GOOGLE_REQUEST->isActive()Z
            move-result v0
            if-eqz v0, :morphe_new_google_signin
            return-void
        """, ExternalLabel("morphe_new_google_signin", clickGoogle.getInstruction(0)))
        exact(DEEZER_WELCOME, "resetSocialLoading", "V").method.addInstructions(0,
            "invoke-static/range {p0 .. p0}, $DEEZER_WELCOME->morpheAbandonGoogleAuthorization($DEEZER_WELCOME)V")
        for (name in listOf("onClickFacebook", "onClickApple", "goToEmailScreen")) {
            exact(DEEZER_WELCOME, name, "V").method.addInstructions(0,
                "invoke-static/range {p0 .. p0}, $DEEZER_WELCOME->morpheCancelActiveGoogleAuthorization($DEEZER_WELCOME)V")
        }
        check(callbackClass.methods.none { it.name == DEEZER_COMPLETED_AUTHORIZATION })
        val callback = exact(
            DEEZER_WELCOME, "onCredentialManagerSignIn\$lambda\$0", "LIlIIlIIIlII;",
            DEEZER_WELCOME, "LlIIIlllllIIlIll;", "Lcom/google/android/gms/auth/api/identity/AuthorizationResult;",
        ).method
        val (guarded, completed) = microgConsentCallbacks(callback)
        check(callbackClass.methods.remove(callback))
        callbackClass.methods.add(guarded)
        callbackClass.methods.add(completed)

        // Route only the two identity-service actions, ahead of Chimera resolution. The real
        // Context package is unchanged. In the inspected microG source AuthorizationService
        // checks Binder caller ownership; IdentitySignInService and the common broker do not
        // perform the equivalent request.packageName ownership check. Do not claim they do.
        // AuthSignInActivity separately checks its caller/configuration package relationship.
        // OAuth server validation is still authoritative; this patch does not repair microG.
        val intent = exact(
            "Lcom/google/android/gms/common/internal/zzah;", "IllIlIlIIlIllIll", "Landroid/content/Intent;",
            "Landroid/content/Context;", SERVICE_CONFIG,
        ).method
        check(AccessFlags.STATIC.isSet(intent.accessFlags) && checkNotNull(intent.implementation).registerCount >= 5)
        routeMicrogIdentityServices(intent)
    }
}
