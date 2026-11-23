package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.io.InputStream

internal const val GOOGLE_CONSENT = "Lnl/johninnl/deezer/auth/GoogleConsent;"
internal const val GOOGLE_REQUEST = "Lnl/johninnl/deezer/auth/GoogleConsent\$Request;"
internal const val GOOGLE_CALLBACKS = "Lnl/johninnl/deezer/auth/GoogleConsent\$Callbacks;"
internal const val GOOGLE_ADAPTER = "Lnl/johninnl/deezer/auth/NativeConsentCallbacks;"
internal const val GOOGLE_GENERATION = "Lnl/johninnl/deezer/auth/ConsentGeneration;"
internal const val GOOGLE_GENERATION_FIELD = "morpheGoogleChooserGeneration"
internal const val GOOGLE_CHOOSER = "Lcom/deezer/featureskit/authui/ui/welcome/WelcomeViewModel\$onSignInWithGoogle\$1;"
internal const val GOOGLE_REQUEST_FIELD = "morpheGoogleAuthorization"
private const val AUTH_RESULT = "Lcom/google/android/gms/auth/api/identity/AuthorizationResult;"
private const val RESPONSE = "LlIIIlllllIIlIll;"

internal fun microgConsentExtension(): InputStream {
    val stream = checkNotNull(object {}.javaClass.getResourceAsStream("/extensions/deezer-google-auth.mpe"))
    val extension = stream.buffered().use { DexBackedDexFile.fromInputStream(null, it) }
    val adapter = microgConsentAdapterDex().buffered().use { DexBackedDexFile.fromInputStream(null, it) }
    val classes = extension.classes.toList() + adapter.classes.toList()
    check(classes.map { it.type }.distinct().size == classes.size &&
        classes.all { it.type.startsWith("Lnl/johninnl/deezer/auth/") }) {
        "Deezer consent extension class isolation failed"
    }
    val store = MemoryDataStore()
    return try {
        DexPool.writeTo(store, ImmutableDexFile(Opcodes.forApi(28), classes))
        store.data.inputStream()
    } finally { store.close() }
}

private fun consentMethod(owner: String, name: String, result: String, params: List<String>,
    locals: Int, code: String, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value): MutableMethod =
    ImmutableMethod(owner, name, params.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        flags, emptySet(), emptySet(), MutableMethodImplementation(
            locals + params.size + if (AccessFlags.STATIC.isSet(flags)) 0 else 1,
        )).toMutable().apply { addInstructions(0, code.trimIndent()) }

/** Adapter contains only typed references to the original flow; no token reflection or copying. */
internal fun microgConsentAdapterDex(): InputStream {
    val instance = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
    fun member(name: String, result: String, params: List<String>, locals: Int, code: String) =
        consentMethod(GOOGLE_ADAPTER, name, result, params, locals, code, instance)
    val methods = listOf(
        consentMethod(GOOGLE_ADAPTER, "<init>", "V", listOf(DEEZER_WELCOME, GOOGLE_GENERATION), 0, """
            invoke-direct {p0}, Ljava/lang/Object;-><init>()V
            iput-object p1, p0, $GOOGLE_ADAPTER->owner:$DEEZER_WELCOME
            iput-object p2, p0, $GOOGLE_ADAPTER->generation:$GOOGLE_GENERATION
            return-void
        """, AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value),
        member("isCurrent", "Z", listOf(GOOGLE_REQUEST), 2, """
            iget-object v0, p0, $GOOGLE_ADAPTER->owner:$DEEZER_WELCOME
            iget-object v1, v0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
            if-ne v1, p1, :stale
            invoke-virtual {p0}, $GOOGLE_ADAPTER->generationCurrent()Z
            move-result v0
            return v0
            :stale
            const/4 v0, 0x0
            return v0
        """),
        member("install", "Z", listOf(GOOGLE_REQUEST), 2, """
            invoke-virtual {p0}, $GOOGLE_ADAPTER->generationCurrent()Z
            move-result v0
            if-eqz v0, :rejected
            iget-object v0, p0, $GOOGLE_ADAPTER->owner:$DEEZER_WELCOME
            iget-object v1, v0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
            if-nez v1, :rejected
            iput-object p1, v0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
            const/4 v0, 0x1
            return v0
            :rejected
            const/4 v0, 0x0
            return v0
        """),
        member("generationCurrent", "Z", emptyList(), 3, """
            iget-object v0, p0, $GOOGLE_ADAPTER->owner:$DEEZER_WELCOME
            iget-object v1, v0, $DEEZER_WELCOME->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
            invoke-static {v0}, $DEEZER_WELCOME->morpheIsGoogleMode($DEEZER_WELCOME)Z
            move-result v2
            iget-object v0, p0, $GOOGLE_ADAPTER->generation:$GOOGLE_GENERATION
            invoke-virtual {v0, v1, v2}, $GOOGLE_GENERATION->isCurrentFor(${GOOGLE_GENERATION}Z)Z
            move-result v0
            return v0
        """),
        member("retire", "V", emptyList(), 2, """
            iget-object v0, p0, $GOOGLE_ADAPTER->owner:$DEEZER_WELCOME
            iget-object v1, p0, $GOOGLE_ADAPTER->generation:$GOOGLE_GENERATION
            invoke-static {v0, v1}, $DEEZER_WELCOME->morpheRetireGoogleGeneration($DEEZER_WELCOME$GOOGLE_GENERATION)V
            return-void
        """),
        member("clear", "V", listOf(GOOGLE_REQUEST), 2, """
            iget-object v0, p0, $GOOGLE_ADAPTER->owner:$DEEZER_WELCOME
            iget-object v1, v0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
            if-ne v1, p1, :done
            const/4 v1, 0x0
            iput-object v1, v0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
            :done
            return-void
        """),
        member("verifyDestination", "V", listOf("Landroid/content/Context;"), 2, """
            new-instance v0, Landroid/content/Intent;
            invoke-direct {v0}, Landroid/content/Intent;-><init>()V
            const-string v1, "$DEEZER_MICROG_PACKAGE"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
            invoke-static {p1, v0}, $DEEZER_MICROG_INTENT_FACTORY->$DEEZER_MICROG_TRUST_METHOD(Landroid/content/Context;Landroid/content/Intent;)V
            return-void
        """),
        member("parseResult", "Ljava/lang/Object;", listOf("Landroid/content/Intent;"), 1, """
            invoke-static {p1}, $DEEZER_WELCOME->morpheParseGoogleAuthorization(Landroid/content/Intent;)$AUTH_RESULT
            move-result-object v0
            return-object v0
        """),
        member("isComplete", "Z", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), 1, """
            instance-of v0, p2, $AUTH_RESULT
            if-eqz v0, :invalid
            instance-of v0, p1, $RESPONSE
            if-eqz v0, :invalid
            check-cast p1, $RESPONSE
            check-cast p2, $AUTH_RESULT
            invoke-static {p2}, $DEEZER_WELCOME->morpheIsGoogleAuthorizationComplete($AUTH_RESULT)Z
            move-result v0
            if-eqz v0, :invalid
            invoke-static {p1, p2}, $DEEZER_WELCOME->morpheSameGoogleAccount($RESPONSE$AUTH_RESULT)Z
            move-result v0
            return v0
            :invalid
            const/4 v0, 0x0
            return v0
        """),
        member("success", "V", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), 1, """
            invoke-virtual {p0}, $GOOGLE_ADAPTER->generationCurrent()Z
            move-result v0
            if-eqz v0, :done
            check-cast p1, $RESPONSE
            check-cast p2, $AUTH_RESULT
            iget-object v0, p0, $GOOGLE_ADAPTER->owner:$DEEZER_WELCOME
            invoke-static {v0, p1, p2}, $DEEZER_WELCOME->$DEEZER_COMPLETED_AUTHORIZATION(${DEEZER_WELCOME}${RESPONSE}$AUTH_RESULT)LIlIIlIIIlII;
            :done
            return-void
        """),
        member("cancel", "V", emptyList(), 1, """
            invoke-virtual {p0}, $GOOGLE_ADAPTER->generationCurrent()Z
            move-result v0
            if-eqz v0, :done
            iget-object v0, p0, $GOOGLE_ADAPTER->owner:$DEEZER_WELCOME
            invoke-static {v0}, $DEEZER_WELCOME->morpheFailGoogleAuthorization($DEEZER_WELCOME)V
            :done
            return-void
        """),
        member("failure", "V", listOf("I"), 1, """
            invoke-virtual {p0}, $GOOGLE_ADAPTER->generationCurrent()Z
            move-result v0
            if-eqz v0, :done
            iget-object v0, p0, $GOOGLE_ADAPTER->owner:$DEEZER_WELCOME
            invoke-static {v0, p1}, $DEEZER_WELCOME->morpheFailGoogleAuthorizationStatus(${DEEZER_WELCOME}I)V
            :done
            return-void
        """),
        member("statusCode", "I", listOf("Ljava/lang/Exception;"), 1, """
            instance-of v0, p1, Lcom/google/android/gms/common/api/ApiException;
            if-eqz v0, :unknown
            check-cast p1, Lcom/google/android/gms/common/api/ApiException;
            invoke-virtual {p1}, Lcom/google/android/gms/common/api/ApiException;->getStatusCode()I
            move-result v0
            return v0
            :unknown
            const/16 v0, 0x8
            return v0
        """),
        // This exact obfuscated OnFailureListener ABI is retained in the supported input.
        member("llIIlIlIlIllI", "V", listOf("Ljava/lang/Exception;"), 2, """
            iget-object v0, p0, $GOOGLE_ADAPTER->owner:$DEEZER_WELCOME
            iget-object v0, v0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
            if-eqz v0, :done
            iget-object v1, p0, $GOOGLE_ADAPTER->generation:$GOOGLE_GENERATION
            invoke-virtual {v0, v1}, $GOOGLE_REQUEST->matchesGeneration($GOOGLE_GENERATION)Z
            move-result v1
            if-eqz v1, :done
            invoke-virtual {p0, p1}, $GOOGLE_ADAPTER->statusCode(Ljava/lang/Exception;)I
            move-result v1
            invoke-virtual {v0, v1}, $GOOGLE_REQUEST->failStatus(I)V
            :done
            return-void
        """),
    )
    val fields = listOf("owner" to DEEZER_WELCOME, "generation" to GOOGLE_GENERATION).map { (name, type) ->
        ImmutableField(GOOGLE_ADAPTER, name, type, AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
            null, emptySet(), emptySet())
    }
    val cls = ImmutableClassDef(GOOGLE_ADAPTER, instance, "Ljava/lang/Object;",
        listOf(GOOGLE_CALLBACKS, "Lcom/google/android/gms/tasks/OnFailureListener;"),
        "DeezerNativeConsentCallbacks", emptySet(), fields, methods)
    val store = MemoryDataStore()
    return try {
        DexPool.writeTo(store, ImmutableDexFile(Opcodes.forApi(28), listOf(cls)))
        store.data.inputStream()
    } finally { store.close() }
}

internal fun microgConsentNativeMethods(): List<MutableMethod> = listOf(
    consentMethod(DEEZER_WELCOME, "morpheGoogleGenerationCurrent", "Z", listOf(DEEZER_WELCOME, GOOGLE_GENERATION), 2, """
        if-eqz p1, :stale
        iget-object v0, p0, $DEEZER_WELCOME->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
        invoke-static {p0}, $DEEZER_WELCOME->morpheIsGoogleMode($DEEZER_WELCOME)Z
        move-result v1
        invoke-virtual {p1, v0, v1}, $GOOGLE_GENERATION->isCurrentFor(${GOOGLE_GENERATION}Z)Z
        move-result v0
        return v0
        :stale
        const/4 v0, 0x0
        return v0
    """),
    consentMethod(DEEZER_WELCOME, "morpheRetireGoogleGeneration", "V", listOf(DEEZER_WELCOME, GOOGLE_GENERATION), 1, """
        if-eqz p1, :done
        iget-object v0, p0, $DEEZER_WELCOME->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
        if-ne v0, p1, :retire_only
        const/4 v0, 0x0
        iput-object v0, p0, $DEEZER_WELCOME->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
        :retire_only
        invoke-virtual {p1}, $GOOGLE_GENERATION->retire()V
        :done
        return-void
    """),
    consentMethod(DEEZER_WELCOME, "morpheBeginGoogleChooser", "Z", listOf(DEEZER_WELCOME, "Landroid/content/Context;"), 3, """
        invoke-static {p0}, $DEEZER_WELCOME->morpheIsGoogleMode($DEEZER_WELCOME)Z
        move-result v0
        if-eqz v0, :blocked
        iget-object v0, p0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
        if-eqz v0, :new_generation
        invoke-virtual {v0}, $GOOGLE_REQUEST->isActive()Z
        move-result v0
        if-nez v0, :blocked
        :new_generation
        invoke-static {p0}, $DEEZER_WELCOME->morpheAbandonGoogleAuthorization($DEEZER_WELCOME)V
        new-instance v0, $GOOGLE_GENERATION
        invoke-direct {v0}, $GOOGLE_GENERATION-><init>()V
        iput-object v0, p0, $DEEZER_WELCOME->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
        new-instance v1, $GOOGLE_ADAPTER
        invoke-direct {v1, p0, v0}, $GOOGLE_ADAPTER-><init>($DEEZER_WELCOME$GOOGLE_GENERATION)V
        invoke-static {p1, v0, v1}, $GOOGLE_CONSENT->prepare(Landroid/content/Context;$GOOGLE_GENERATION$GOOGLE_CALLBACKS)$GOOGLE_REQUEST
        move-result-object v2
        if-eqz v2, :blocked
        invoke-virtual {v2}, $GOOGLE_REQUEST->isActive()Z
        move-result v1
        if-eqz v1, :blocked
        iput-object v2, p0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
        const/4 v0, 0x1
        return v0
        :blocked
        const/4 v0, 0x0
        return v0
    """),
    // Compare only the provider's account identifier (email), never decode or log token claims.
    consentMethod(DEEZER_WELCOME, "morpheSameGoogleAccount", "Z", listOf(RESPONSE, AUTH_RESULT), 3, """
        if-eqz p0, :invalid
        if-eqz p1, :invalid
        iget-object v0, p1, $AUTH_RESULT->IIIIIlIIIlIlllI:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;
        if-eqz v0, :invalid
        iget-object v0, v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->IIIIIllIIIlIIllI:Ljava/lang/String;
        invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
        move-result v1
        if-nez v1, :invalid
        iget-object v1, p0, $RESPONSE->IllIlIlIIlIllIll:LlIIlllllllIlIl;
        iget-object v1, v1, LlIIlllllllIlIl;->IIlllIlllIlll:Ljava/lang/Object;
        check-cast v1, Landroid/os/Bundle;
        const-string v2, "com.google.android.libraries.identity.googleid.BUNDLE_KEY_ID"
        invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v1
        if-eqz v1, :invalid
        invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
        move-result v0
        return v0
        :invalid
        const/4 v0, 0x0
        return v0
    """),
    consentMethod(DEEZER_WELCOME, "morpheIsGoogleMode", "Z", listOf(DEEZER_WELCOME), 2, """
        invoke-virtual {p0}, Lcom/deezer/featureskit/authui/social/SocialMissingInfosViewModel;->getLoginMode()Lcom/deezer/featureskit/authui/social/LoginMode;
        move-result-object v0
        sget-object v1, Lcom/deezer/featureskit/authui/social/LoginMode;->GOOGLE:Lcom/deezer/featureskit/authui/social/LoginMode;
        if-ne v0, v1, :other_mode
        const/4 v0, 0x1
        return v0
        :other_mode
        const/4 v0, 0x0
        return v0
    """),
    consentMethod(DEEZER_WELCOME, "onCleared", "V", emptyList(), 0, """
        invoke-static {p0}, $DEEZER_WELCOME->morpheAbandonGoogleAuthorization($DEEZER_WELCOME)V
        invoke-super {p0}, Lcom/deezer/featureskit/authui/social/SocialMissingInfosViewModel;->onCleared()V
        return-void
    """, AccessFlags.PUBLIC.value),
    consentMethod(DEEZER_WELCOME, "morpheIsGoogleAuthorizationComplete", "Z", listOf(AUTH_RESULT), 1, """
        if-eqz p0, :invalid
        iget-object v0, p0, $AUTH_RESULT->IlIlIIIIlIlIllII:Landroid/app/PendingIntent;
        if-nez v0, :invalid
        iget-object v0, p0, $AUTH_RESULT->IIllllllllIlll:Ljava/lang/String;
        invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
        move-result v0
        if-nez v0, :invalid
        const/4 v0, 0x1
        return v0
        :invalid
        const/4 v0, 0x0
        return v0
    """),
    consentMethod(DEEZER_WELCOME, "morpheParseGoogleAuthorization", AUTH_RESULT, listOf("Landroid/content/Intent;"), 2, """
        const-class v0, Lcom/google/android/gms/common/api/Status;
        invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;
        move-result-object v0
        invoke-virtual {p0, v0}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V
        const-string v0, "googleSignInStatus"
        invoke-virtual {p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;
        move-result-object v0
        instance-of v1, v0, Lcom/google/android/gms/common/api/Status;
        if-eqz v1, :invalid
        check-cast v0, Lcom/google/android/gms/common/api/Status;
        invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->IIIlllIIIIIllIll()Z
        move-result v1
        if-nez v1, :status_valid
        new-instance v1, Lcom/google/android/gms/common/api/ApiException;
        invoke-direct {v1, v0}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V
        throw v1
        :status_valid
        const-string v0, "authorization_result"
        invoke-virtual {p0, v0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B
        move-result-object v0
        if-eqz v0, :invalid
        sget-object v1, $AUTH_RESULT->CREATOR:Landroid/os/Parcelable${'$'}Creator;
        invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelableSerializer;->IllIlIlIIlIllIll([BLandroid/os/Parcelable${'$'}Creator;)Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;
        move-result-object v0
        check-cast v0, $AUTH_RESULT
        invoke-static {v0}, $DEEZER_WELCOME->morpheIsGoogleAuthorizationComplete($AUTH_RESULT)Z
        move-result v1
        if-eqz v1, :invalid
        return-object v0
        :invalid
        new-instance v0, Ljava/lang/IllegalArgumentException;
        invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V
        throw v0
    """),
    consentMethod(DEEZER_WELCOME, "morpheFailGoogleAuthorization", "V", listOf(DEEZER_WELCOME), 1, """
        const/16 v0, 0x10
        invoke-static {p0, v0}, $DEEZER_WELCOME->morpheFailGoogleAuthorizationStatus(${DEEZER_WELCOME}I)V
        return-void
    """),
    consentMethod(DEEZER_WELCOME, "morpheFailGoogleAuthorizationStatus", "V", listOf(DEEZER_WELCOME, "I"), 2, """
        invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
        move-result-object v0
        const-string v1, "Google sign-in status "
        invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        new-instance v1, Ljava/lang/IllegalStateException;
        invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
        invoke-static {p0, v1}, $DEEZER_WELCOME->onCredentialManagerSignIn${'$'}lambda${'$'}2(${DEEZER_WELCOME}Ljava/lang/Exception;)V
        return-void
    """),
    consentMethod(DEEZER_WELCOME, "morpheAbandonGoogleAuthorization", "V", listOf(DEEZER_WELCOME), 2, """
        iget-object v1, p0, $DEEZER_WELCOME->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
        iget-object v0, p0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
        if-eqz v0, :retire_generation
        invoke-virtual {v0}, $GOOGLE_REQUEST->abandon()V
        :retire_generation
        invoke-static {p0, v1}, $DEEZER_WELCOME->morpheRetireGoogleGeneration($DEEZER_WELCOME$GOOGLE_GENERATION)V
        return-void
    """),
    consentMethod(DEEZER_WELCOME, "morpheCancelActiveGoogleAuthorization", "V", listOf(DEEZER_WELCOME), 2, """
        iget-object v1, p0, $DEEZER_WELCOME->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION
        iget-object v0, p0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
        if-eqz v0, :retire_generation
        invoke-virtual {v0}, $GOOGLE_REQUEST->cancel()V
        :retire_generation
        invoke-static {p0, v1}, $DEEZER_WELCOME->morpheRetireGoogleGeneration($DEEZER_WELCOME$GOOGLE_GENERATION)V
        return-void
    """),
)

/** Only the valid Google credential branch is changed; the OAuth request builder stays native. */
internal fun prepareMicrogConsent(method: MutableMethod) {
    check(method.definingClass == DEEZER_WELCOME && method.name == "onCredentialManagerSignIn" &&
        method.returnType == "V" && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", RESPONSE) &&
        checkNotNull(method.implementation).registerCount in 4..16)
    val code = method.instructions.toList()
    val builder = code.indices.single {
        code[it].opcode == Opcode.NEW_INSTANCE && (code[it] as? ReferenceInstruction)?.reference?.toString() ==
            "Lcom/google/android/gms/auth/api/identity/AuthorizationRequest${'$'}Builder;"
    }
    val failure = code.indices.single { index ->
        val instruction = code[index]
        instruction.opcode == Opcode.INVOKE_DIRECT &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == "LIllIIIIIlllIlIll;-><init>(Ljava/lang/Object;I)V" &&
            (code.getOrNull(index - 1) as? NarrowLiteralInstruction)?.narrowLiteral == 17
    }
    val constructor = code[failure] as FiveRegisterInstruction
    check(constructor.registerCount == 3 && constructor.registerD == method.implementation!!.registerCount - 3)
    check((code[failure - 1] as OneRegisterInstruction).registerA == constructor.registerE &&
        code[failure - 2].opcode == Opcode.NEW_INSTANCE &&
        (code[failure - 2] as OneRegisterInstruction).registerA == constructor.registerC)
    method.replaceInstruction(failure - 2, "new-instance v${constructor.registerC}, $GOOGLE_ADAPTER")
    method.replaceInstruction(failure - 1, "iget-object v${constructor.registerE}, p0, $DEEZER_WELCOME->$GOOGLE_GENERATION_FIELD:$GOOGLE_GENERATION")
    method.replaceInstruction(failure, "invoke-direct {v${constructor.registerC}, p0, v${constructor.registerE}}, $GOOGLE_ADAPTER-><init>($DEEZER_WELCOME$GOOGLE_GENERATION)V")
    // Fragment-local labels are not relocated correctly when inserted inside this
    // existing method. Bind both continuations to actual original instructions.
    val nativeReturn = code.indexOfLast { it.opcode == Opcode.RETURN_VOID }
    check(nativeReturn > builder) { "Deezer Google authorization return changed" }
    method.addInstructionsWithLabels(builder, """
        iget-object v0, p0, $DEEZER_WELCOME->$GOOGLE_REQUEST_FIELD:$GOOGLE_REQUEST
        if-eqz v0, :morphe_google_request_done
        invoke-virtual {v0, p2}, $GOOGLE_REQUEST->matches(Ljava/lang/Object;)Z
        move-result v0
        if-nez v0, :morphe_google_native_request
        return-void
    """,
        ExternalLabel("morphe_google_request_done", method.getInstruction(nativeReturn)),
        ExternalLabel("morphe_google_native_request", method.getInstruction(builder)),
    )
}
