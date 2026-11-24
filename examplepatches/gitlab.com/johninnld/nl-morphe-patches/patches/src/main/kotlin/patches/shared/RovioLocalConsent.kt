package patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.ByteArrayInputStream
import java.io.InputStream

private const val LOCAL_CONSENT = "Lnl/johninnl/rovio/LocalConsent;"
private const val CONSENT_LISTENER = "Lcom/rovio/beacon/tcfconsent/Listener;"
private const val CONSENT = "Lcom/rovio/beacon/tcfconsent/Consent;"

/** Local opt-out completion, not a fabricated CMP receipt or a grant of consent. */
internal fun rovioLocalConsentDex(): InputStream {
    fun method(name: String, parameters: List<String>, locals: Int, flags: Int, code: String, result: String = "V") =
        MutableMethod(ImmutableMethod(LOCAL_CONSENT, name,
            parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, result, flags,
            emptySet(), emptySet(), ImmutableMethodImplementation(
                locals + parameters.size + if (flags and AccessFlags.STATIC.value == 0) 1 else 0,
                emptyList(), emptyList(), emptyList()))).apply { addInstructions(0, code.trimIndent()) }
    val ctor = method("<init>", listOf(CONSENT_LISTENER), 0,
        AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value, """
        invoke-direct {p0}, Ljava/lang/Object;-><init>()V
        iput-object p1, p0, $LOCAL_CONSENT->listener:$CONSENT_LISTENER
        return-void
    """)
    val dispatch = method("complete", listOf(CONSENT_LISTENER), 1,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, """
        new-instance v0, $LOCAL_CONSENT
        invoke-direct {v0, p0}, $LOCAL_CONSENT-><init>($CONSENT_LISTENER)V
        invoke-static {v0}, Lcom/rovio/beacon/Globals;->runOnUiThread(Ljava/lang/Runnable;)V
        return-void
    """)
    // Revoke every previously granted bit while preserving the stored bit-vector lengths.
    // Do not alter the recorded geographic applicability or manufacture a TCF consent string.
    val denyBits = listOf("PurposeConsents", "PurposeLegitimateInterests", "VendorConsents",
        "VendorLegitimateInterests", "SpecialFeaturesOptIns", "PublisherConsent",
        "PublisherLegitimateInterests", "PublisherCustomPurposesConsents",
        "PublisherCustomPurposesLegitimateInterests").joinToString("\n") { key -> """
        const-string v1, "IABTCF_$key"
        const-string v2, "0"
        invoke-interface {v5, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
        move-result-object v2
        if-nez v2, :present$key
        const-string v2, "0"
        :present$key
        invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;
        move-result-object v2
        invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
    """.trimIndent() }
    val clearReceipts = listOf("IABTCF_TCString", "IABTCF_AddtlConsent", "IABTCF_UserConsentRecordId")
        .joinToString("\n") { key -> """
        const-string v1, "$key"
        const-string v2, ""
        invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
    """.trimIndent() }
    val status = method("status", emptyList(), 1, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, """
        sget-boolean v0, $LOCAL_CONSENT->completed:Z
        if-eqz v0, :unknown
        const/4 v0, 0x3
        return v0
        :unknown
        const/4 v0, 0x0
        return v0
    """, "I")
    val run = method("run", emptyList(), 7, AccessFlags.PUBLIC.value, """
        invoke-static {}, Lcom/rovio/beacon/Globals;->getActivity()Landroid/app/Activity;
        move-result-object v5
        invoke-static {v5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
        move-result-object v5
        invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
        move-result-object v0
        const/16 v3, 0x31
        const/16 v4, 0x30
        $denyBits
        $clearReceipts
        const-string v1, "IABTCF_EnableAdvertiserConsentMode"
        const/4 v2, 0x0
        invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences${'$'}Editor;
        invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
        const/4 v0, 0x1
        sput-boolean v0, $LOCAL_CONSENT->completed:Z
        iget-object v6, p0, $LOCAL_CONSENT->listener:$CONSENT_LISTENER
        const/4 v0, 0x3
        invoke-interface {v6, v0}, $CONSENT_LISTENER->onSuccess(I)V
        return-void
    """)
    val cls = ImmutableClassDef(LOCAL_CONSENT, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        "Ljava/lang/Object;", listOf("Ljava/lang/Runnable;"), "MorpheLocalConsent", emptySet(),
        listOf(ImmutableField(LOCAL_CONSENT, "listener", CONSENT_LISTENER,
            AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, null, emptySet(), emptySet()),
            ImmutableField(LOCAL_CONSENT, "completed", "Z",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.VOLATILE.value,
                null, emptySet(), emptySet())),
        listOf(ctor, dispatch, run, status))
    val output = MemoryDataStore()
    DexPool.writeTo(output, ImmutableDexFile(Opcodes.forApi(29), listOf(cls)))
    return ByteArrayInputStream(output.data)
}

/** ConsentStatus.OBTAINED means the local decision completed; all optional grants remain denied. */
context(context: BytecodePatchContext)
internal fun useRovioLocalConsent(game: String) {
    val owner = context.mutableClassDefBy(CONSENT)
    for ((name, parameters, result) in listOf(
        Triple("initialize", listOf("Z", CONSENT_LISTENER), "V"),
        Triple("showDialog", listOf("Z", CONSENT_LISTENER), "V"),
        Triple("getStatus", emptyList(), "I"),
        Triple("isDialogRequired", emptyList(), "Z"),
        Triple("isOptionsDialogRequired", emptyList(), "Z"),
    )) {
        val original = owner.methods.singleOrNull {
            it.name == name && it.parameterTypes == parameters && it.returnType == result
        } ?: error("$game TCF consent entry changed: $name")
        check(original.accessFlags and AccessFlags.STATIC.value != 0 &&
            original.implementation?.instructions?.count()?.let { it > 2 } == true) {
            "$game TCF consent body changed or already patched: $name"
        }
        val replacement = MutableMethod(ImmutableMethod(original.definingClass, original.name,
            original.parameters, result, original.accessFlags, original.annotations,
            original.hiddenApiRestrictions, ImmutableMethodImplementation(parameters.size + 1,
                emptyList(), emptyList(), emptyList())))
        replacement.addInstructions(0, if (result == "V") """
            invoke-static {p1}, $LOCAL_CONSENT->complete($CONSENT_LISTENER)V
            return-void
        """.trimIndent() else if (name == "getStatus") """
            invoke-static {}, $LOCAL_CONSENT->status()I
            move-result v0
            return v0
        """.trimIndent() else "const/4 v0, 0x0\nreturn v0")
        check(owner.methods.remove(original))
        check(owner.methods.add(replacement))
    }
}
