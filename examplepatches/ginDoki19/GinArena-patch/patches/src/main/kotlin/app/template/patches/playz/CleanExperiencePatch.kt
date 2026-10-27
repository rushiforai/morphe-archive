package app.template.patches.playz

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_PLAYZ_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/** DEX access-flag bit for `native`; a method given a Java body must not keep it. */
private const val NATIVE_ACCESS_FLAG = 0x0100

@Suppress("unused")
val playzRemoveAdsAndPopupsPatch = bytecodePatch(
    name = "Remove ads, popups & restrictions",
    description = "Replaces the native signature-locked decryption in pure Java so encrypted " +
        "channel and event feeds keep loading after Morphe re-signs the APK, and removes " +
        "start/player/support/external ads plus the automatic Telegram promo dialog.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PLAYZ_TV)

    execute {
        // Resolve every target before mutating any class. Several Px methods live in one class,
        // so obtain all method objects first, then replace bodies one by one.
        val pxClass = PlayZPxClinitFingerprint.classDef
        val pxClinit = PlayZPxClinitFingerprint.method
        val pxCheck = PlayZPxCheckFingerprint.method
        val pxApp = PlayZPxAppFingerprint.method
        val dataHelperClass = PlayZParseAppConfigFingerprint.classDef
        val parseConfig = PlayZParseAppConfigFingerprint.method
        val launchExternalAd = PlayZLaunchExternalAdFingerprint.method
        val telegramDialogClass = PlayZTelegramDialogFingerprint.classDef
        val telegramDialog = PlayZTelegramDialogFingerprint.method

        // 0. Anti-tamper neutralization + pure-Java Px.app reimplementation.
        //    Px has no JNI_OnLoad; the fatal signer self-test only runs when Java code
        //    calls Px.check. Make the whole Java bridge pure-Java and never load native-lib here.
        //    - <clinit>: skip System.loadLibrary("native-lib").
        //    - check(Context): return immediately. The native flag must be cleared.
        //    - app(Context,String): full pure-Java port of the native decoder, using the same
        //      transform and decryption parameters as the stock build so encrypted server
        //      payloads decode exactly like stock under any signing certificate. The
        //      parameters are fixed constants for this exact stock build (they cannot be
        //      derived at runtime once the APK is re-signed). Any failure returns an empty
        //      byte array (never throws), matching the native contract so q4.a0.j can still
        //      use its fallbacks.
        //    rc.b.a() is intentionally NOT stubbed: q1.c.t() calls it and then null-checks/uses
        //    rc.b.f (SSLSocketFactory) and rc.b.e (trust manager). No-op'ing a() would break TLS.
        pxClinit.replaceWithCleanBody(
            owner = pxClass,
            registerCount = 1,
            smaliBody = "return-void",
        )
        pxCheck.replaceWithCleanBody(
            owner = pxClass,
            registerCount = 2,
            clearFlags = NATIVE_ACCESS_FLAG,
            smaliBody = "return-void",
        )
        val javaPxApp = pxApp.replaceWithCleanBody(
            owner = pxClass,
            registerCount = 10,
            clearFlags = NATIVE_ACCESS_FLAG,
            smaliBody = """
                if-eqz p1, :empty_out
                const/4 v0, 0x0
                invoke-static {p1, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
                move-result-object v0
                if-eqz v0, :empty_out
                array-length v1, v0
                if-lez v1, :empty_out
                const/4 v2, 0x0
                :swap_loop
                add-int/lit8 v3, v2, 0x1
                if-ge v3, v1, :swap_done
                aget-byte v4, v0, v2
                aget-byte v5, v0, v3
                aput-byte v5, v0, v2
                aput-byte v4, v0, v3
                add-int/lit8 v2, v2, 0x2
                goto :swap_loop
                :swap_done
                const/4 v2, 0x0
                add-int/lit8 v3, v1, -0x1
                :rev_loop
                if-ge v2, v3, :rev_done
                aget-byte v4, v0, v2
                aget-byte v5, v0, v3
                aput-byte v5, v0, v2
                aput-byte v4, v0, v3
                add-int/lit8 v2, v2, 0x1
                add-int/lit8 v3, v3, -0x1
                goto :rev_loop
                :rev_done
                const/4 v1, 0x0
                invoke-static {v0, v1}, Landroid/util/Base64;->decode([BI)[B
                move-result-object v0
                if-eqz v0, :empty_out
                array-length v1, v0
                if-lez v1, :empty_out
                sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
                const-string v2, "cz14RStkN01PVE5w"
                invoke-virtual {v2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
                move-result-object v2
                new-instance v3, Ljavax/crypto/spec/SecretKeySpec;
                const-string v4, "AES"
                invoke-direct {v3, v2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V
                const-string v2, "WTlEvckd2UR41sdk"
                invoke-virtual {v2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
                move-result-object v2
                new-instance v4, Ljavax/crypto/spec/IvParameterSpec;
                invoke-direct {v4, v2}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V
                const-string v2, "AES/CBC/PKCS5Padding"
                invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;
                move-result-object v2
                const/4 v5, 0x2
                invoke-virtual {v2, v5, v3, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
                invoke-virtual {v2, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B
                move-result-object v0
                if-eqz v0, :empty_out
                return-object v0
                :empty_out
                const/4 v0, 0x0
                new-array v0, v0, [B
                return-object v0
            """,
        )
        // Catch-all: any decode/AES/verifier-visible failure returns byte[0], exactly like the
        // native implementation (it returns an empty array on every error path, never throws).
        run {
            val impl = javaPxApp.implementation!!
            val emptyOutIdx = impl.instructions.size - 3
            check(impl.instructions[emptyOutIdx].opcode == Opcode.CONST_4) {
                "Unexpected Px.app fallback label index ($emptyOutIdx)."
            }
            impl.addCatch(
                "Ljava/lang/Throwable;",
                impl.newLabelForIndex(0),
                impl.newLabelForIndex(emptyOutIdx),
                impl.newLabelForIndex(emptyOutIdx),
            )
        }

        // 1. Sanitize the parsed `app.txt` config at the single choke point (`wc.d.u`).
        //    Stock writes all remote ad fields/preferences first; immediately before
        //    `return-object v0`, force the app's own disabled values:
        //    banner/start = "no", supportAd/supportOpenTutorial = "", external prefs off/empty.
        //    Existing installs are cleaned on the next successful config parse.
        run {
            val returnIdx = parseConfig.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (returnIdx < 0) throw PatchException("Could not find return-object in wc.d.u")
            val retReg = (parseConfig.instructions[returnIdx] as OneRegisterInstruction).registerA
            check(retReg == 0) { "Expected qc.a return register v0 in wc.d.u, got v$retReg" }

            parseConfig.addInstructions(
                returnIdx,
                """
                    const-string v1, "no"
                    iput-object v1, v0, Lqc/a;->h:Ljava/lang/String;
                    iput-object v1, v0, Lqc/a;->i:Ljava/lang/String;
                    iput-object v1, v0, Lqc/a;->j:Ljava/lang/String;
                    iput-object v1, v0, Lqc/a;->k:Ljava/lang/String;
                    const-string v2, ""
                    iput-object v2, v0, Lqc/a;->p:Ljava/lang/String;
                    iput-object v2, v0, Lqc/a;->q:Ljava/lang/String;
                    sget-object v4, Lcom/playz/tv/app/ProApplication;->S:Lcom/playz/tv/app/ProApplication;
                    invoke-static {v4}, Lwc/d;->j(Landroid/content/Context;)Landroid/content/SharedPreferences${'$'}Editor;
                    move-result-object v4
                    const/4 v3, 0x0
                    const-string v5, "tv_external_ad_enabled"
                    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                    move-result-object v4
                    const-string v5, "external_ad_enabled"
                    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                    move-result-object v4
                    const-string v5, "external_ad_url"
                    invoke-interface {v4, v5, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
                    move-result-object v4
                    const-string v5, "external_ad_repeat_after"
                    const v3, 0x7fffffff
                    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences${'$'}Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences${'$'}Editor;
                    move-result-object v4
                    invoke-interface {v4}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
                """,
            )
        }

        // 2. Disable the timed external/support browser popunder (`wc.d.y(Context)V`).
        //    Player start paths can still call it; it now returns before reading preferences
        //    or starting Support/CustomBrowser activities.
        launchExternalAd.replaceWithCleanBody(
            owner = dataHelperClass,
            registerCount = 2,
            smaliBody = "return-void",
        )

        // 3. Suppress only the automatic Telegram promo dialog (`lc.n.a(Context, String)V`).
        //    Explicit Telegram buttons/cards elsewhere are left untouched.
        telegramDialog.replaceWithCleanBody(
            owner = telegramDialogClass,
            registerCount = 3,
            smaliBody = "return-void",
        )
    }
}

/**
 * Replaces [this] method inside [owner] with a fresh [MutableMethodImplementation] compiled from
 * [smaliBody], cleanly discarding any old `try`/`catch` blocks or `native` flags.
 */
private fun MutableMethod.replaceWithCleanBody(
    owner: MutableClass,
    registerCount: Int,
    clearFlags: Int = 0,
    smaliBody: String,
): MutableMethod {
    val cleanMethod = ImmutableMethod(
        definingClass,
        name,
        parameters,
        returnType,
        accessFlags and clearFlags.inv(),
        annotations,
        hiddenApiRestrictions,
        MutableMethodImplementation(registerCount),
    ).toMutable()
    cleanMethod.addInstructions(0, smaliBody.trimIndent())
    owner.methods.remove(this)
    owner.methods.add(cleanMethod)
    return cleanMethod
}
