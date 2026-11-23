package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.Base64

internal const val DEEZER_MICROG_PACKAGE = "app.revanced.android.gms"
internal const val DEEZER_MICROG_INTENT_FACTORY = "Lcom/google/android/gms/common/internal/zzah;"
internal const val DEEZER_MICROG_TRUST_METHOD = "morpheVerifyMicrogRelease"
internal const val DEEZER_WELCOME = "Lcom/deezer/featureskit/authui/ui/welcome/WelcomeViewModel;"
internal const val DEEZER_COMPLETED_AUTHORIZATION = "morpheCompletedGoogleAuthorization"

/**
 * Publisher trust anchor, not a digest learned from the installed package.
 * https://github.com/MorpheApp/MicroG-RE/blob/ab96213111170431bc906d04430b339836de47e4/README.md
 * The 7.3.2 ARM64 release APK was independently verified with apksigner against this pin.
 * Release asset SHA-256: f49924e25caa35172aecfe76009e82b427d006e68ffdb15c666c4f5513c8a90d.
 */
internal const val DEEZER_MICROG_RELEASE_CERT_SHA256 =
    "0b6c9515afb195fac59601696ba0a7907a0b217ccf720b43148427ccf64343e7"

/**
 * Called on each real ConnectionTracker bind, including reconnects; never cache trust.
 * PackageManager.hasSigningCertificate delegates rotation verification to Android. Reject
 * multiple simultaneous signers: the release has one signer, not a partially trusted signer set.
 * Missing/disabled packages still fail through Android's normal lookup/bind errors.
 */
internal fun microgReleaseTrustMethod(): MutableMethod {
    val digest = DEEZER_MICROG_RELEASE_CERT_SHA256.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
    val encodedDigest = Base64.getEncoder().encodeToString(digest)
    return ImmutableMethod(
        DEEZER_MICROG_INTENT_FACTORY, DEEZER_MICROG_TRUST_METHOD,
        listOf("Landroid/content/Context;", "Landroid/content/Intent;").map {
            ImmutableMethodParameter(it, emptySet(), null)
        },
        "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
        emptySet(), emptySet(), MutableMethodImplementation(7),
    ).toMutable().apply {
        addInstructions(0, """
            invoke-virtual {p1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;
            move-result-object v0
            const-string v1, "$DEEZER_MICROG_PACKAGE"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-nez v0, :verify_release
            invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;
            move-result-object v0
            const-string v1, "$DEEZER_MICROG_PACKAGE.auth.api.identity.service.signin.START"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-nez v1, :untrusted_release
            const-string v1, "$DEEZER_MICROG_PACKAGE.auth.api.identity.service.authorization.START"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-nez v1, :untrusted_release
            return-void
            :verify_release
            invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;
            move-result-object v2
            if-eqz v2, :verify_signer
            invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;
            move-result-object v2
            invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v2
            if-eqz v2, :untrusted_release
            :verify_signer
            sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
            const/16 v1, 0x1c
            if-lt v0, v1, :untrusted_release
            invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
            move-result-object v0
            const-string v1, "$DEEZER_MICROG_PACKAGE"
            const v2, 0x8000000
            invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
            move-result-object v2
            iget-object v2, v2, Landroid/content/pm/PackageInfo;->signingInfo:Landroid/content/pm/SigningInfo;
            if-eqz v2, :untrusted_release
            invoke-virtual {v2}, Landroid/content/pm/SigningInfo;->hasMultipleSigners()Z
            move-result v2
            if-nez v2, :untrusted_release
            const-string v2, "$encodedDigest"
            const/4 v3, 0x0
            invoke-static {v2, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
            move-result-object v2
            const/4 v3, 0x1
            invoke-virtual {v0, v1, v2, v3}, Landroid/content/pm/PackageManager;->hasSigningCertificate(Ljava/lang/String;[BI)Z
            move-result v0
            if-eqz v0, :untrusted_release
            return-void
            :untrusted_release
            new-instance v0, Ljava/lang/SecurityException;
            const-string v1, "Untrusted microG-RE release signer or destination"
            invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V
            throw v0
        """)
    }
}

internal fun guardMicrogServiceBinds(method: MutableMethod) {
    check(method.definingClass == "Lcom/google/android/gms/common/stats/ConnectionTracker;" &&
        method.name == "IIlIlIlIlIllllll" && method.returnType == "Z" &&
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.parameterTypes.map(CharSequence::toString) == listOf(
            "Landroid/content/Context;", "Ljava/lang/String;", "Landroid/content/Intent;",
            "Landroid/content/ServiceConnection;", "I", "Ljava/util/concurrent/Executor;",
        ) && checkNotNull(method.implementation).registerCount >= 9) {
        "Deezer Google service-binding prototype changed"
    }
    check(method.instructions.any {
        (it as? ReferenceInstruction)?.reference?.toString()?.startsWith("Landroid/content/Context;->bindService(") == true
    }) { "Deezer Google service-binding path changed" }
    check(method.instructions.none {
        (it as? ReferenceInstruction)?.reference?.toString()?.contains("->$DEEZER_MICROG_TRUST_METHOD(") == true
    }) { "Deezer Google service binding was already guarded" }
    method.addInstructions(0, """
        move-object/from16 v0, p1
        move-object/from16 v1, p3
        invoke-static {v0, v1}, $DEEZER_MICROG_INTENT_FACTORY->$DEEZER_MICROG_TRUST_METHOD(Landroid/content/Context;Landroid/content/Intent;)V
    """)
}

/** Correlate each result with the retained request and original credential object. The extension
 * owns only foreground PendingIntent/lifecycle handling; completed results still enter the native
 * callback below, and the original OAuth request/validation code stays intact. */
internal fun microgConsentCallbacks(method: MutableMethod): Pair<MutableMethod, MutableMethod> {
    check(method.definingClass == DEEZER_WELCOME && method.name == "onCredentialManagerSignIn\$lambda\$0" &&
        method.returnType == "LIlIIlIIIlII;" && AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.parameterTypes.map(CharSequence::toString) == listOf(
            DEEZER_WELCOME, "LlIIIlllllIIlIll;", "Lcom/google/android/gms/auth/api/identity/AuthorizationResult;",
        ) && checkNotNull(method.implementation).registerCount == 3) {
        "Deezer Google authorization callback changed"
    }
    val completed = ImmutableMethod(
        method.definingClass, DEEZER_COMPLETED_AUTHORIZATION, method.parameters, method.returnType,
        (method.accessFlags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value or AccessFlags.SYNTHETIC.value,
        method.annotations, method.hiddenApiRestrictions, ImmutableMethodImplementation.of(method.implementation),
    ).toMutable()
    val guarded = ImmutableMethod(
        method.definingClass, method.name, method.parameters, method.returnType,
        method.accessFlags, method.annotations, method.hiddenApiRestrictions, MutableMethodImplementation(5),
    ).toMutable()
    guarded.addInstructions(0, """
        iget-object v0, p0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
        if-eqz v0, :morphe_authorization_done
        invoke-virtual {v0, p1}, $GOOGLE_REQUEST->matches(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :morphe_authorization_done
        iget-object v1, p2, Lcom/google/android/gms/auth/api/identity/AuthorizationResult;->IlIlIIIIlIlIllII:Landroid/app/PendingIntent;
        if-eqz v1, :morphe_completed_authorization
        invoke-virtual {v0, v1}, $GOOGLE_REQUEST->launch(Landroid/app/PendingIntent;)V
        goto :morphe_authorization_done
        :morphe_completed_authorization
        invoke-virtual {v0, p2}, $GOOGLE_REQUEST->completeNative(Ljava/lang/Object;)V
        :morphe_authorization_done
        sget-object v0, LIlIIlIIIlII;->IllIlIlIIlIllIll:LIlIIlIIIlII;
        return-object v0
    """)
    return guarded to completed
}

internal fun routeMicrogIdentityServices(intent: MutableMethod) {
    intent.addInstructionsWithLabels(0, """
        iget-object v0, p1, Lcom/google/android/gms/common/internal/zzn;->llIIIIIIlIIIIll:Ljava/lang/String;
        const-string v1, "com.google.android.gms"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :morphe_original_identity_route
        iget-object v0, p1, Lcom/google/android/gms/common/internal/zzn;->IllIlIlIIlIllIll:Ljava/lang/String;
        const-string v1, "com.google.android.gms.auth.api.identity.service.signin.START"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-nez v1, :morphe_microg_signin
        const-string v1, "com.google.android.gms.auth.api.identity.service.authorization.START"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :morphe_original_identity_route
        const-string v0, "$DEEZER_MICROG_PACKAGE.auth.api.identity.service.authorization.START"
        goto :morphe_microg_identity_intent
        :morphe_microg_signin
        const-string v0, "$DEEZER_MICROG_PACKAGE.auth.api.identity.service.signin.START"
        :morphe_microg_identity_intent
        new-instance v1, Landroid/content/Intent;
        invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
        const-string v0, "$DEEZER_MICROG_PACKAGE"
        invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
        invoke-static {p0, v1}, $DEEZER_MICROG_INTENT_FACTORY->$DEEZER_MICROG_TRUST_METHOD(Landroid/content/Context;Landroid/content/Intent;)V
        return-object v1
    """, ExternalLabel("morphe_original_identity_route", intent.getInstruction(0)))
}
