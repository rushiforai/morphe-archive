package app.template.patches.sktech

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_SK_TECH_TV
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/** DEX access-flag bit for `native`; a method given a Java body must not keep it. */
private const val NATIVE_ACCESS_FLAG = 0x0100

/**
 * Constants for the pure-Java `DataHelper.AppData` port. The key matches
 * the family cert-derivation (this app is a sibling fork signed with the
 * same certificate); the IV constants are per-app and were extracted from
 * this build's native decoder. Keep these out of documentation and
 * release notes.
 */
private const val AES_KEY = "ST00ZGt3UGlPdVJP"        // 16 bytes
private const val AES_IV_PLAIN = "V9LQR42pNKc7smaX"   // 16 bytes, first native attempt
private const val AES_IV = "d2WT1lR4ckEvUsdk"         // 16 bytes, second native attempt

@Suppress("unused")
val removeAdsTelemetryAndRestrictionsPatch = bytecodePatch(
    name = "Remove ads, telemetry & restrictions",
    description = "Replaces native signature-locked config decryption in pure Java so encrypted " +
        "channel and event feeds keep loading after Morphe re-signs the APK, removes all " +
        "banner/start/support/external ads, optionally disables the in-app web view, suppresses update lockouts, and optionally bypasses root/sniffer/proxy-cert " +
        "checks. Strips Firebase telemetry and push notifications.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SK_TECH_TV)

    dependsOn(manifestAndNativeDebloatPatch)

    // Surface all user-configurable options on this single SK Tech TV patch.
    val removePushNotifications by removePushNotificationsOption()
    val bypassUpdateGate by bypassUpdateGateOption()
    val bypassEnvironmentChecks by bypassEnvironmentChecksOption()
    stripNativeAndTelemetryBloatOption()
    val disableWebActivity by disableWebActivityOption()

    execute {
        // ====================================================================
        // 1. Replace Native Signature-Locked `DataHelper.AppData` in Pure Java
        // ====================================================================
        // Stock `libnative-lib.so` derives its AES-128-CBC key from the APK's
        // X.509 signing certificate SHA-256 (same derivation as CricZ TV —
        // shared signing cert). Re-signing the APK causes native `AppData` to
        // derive the wrong key and break all encrypted endpoints.
        //
        // Replacing `DataHelper.AppData` in pure Java preserves exact decryption
        // on re-signed APKs while gracefully returning `new byte[0]` on any
        // failure (matching the native contract), and completely eliminates
        // `System.loadLibrary("native-lib")`.
        // --------------------------------------------------------------------
        run {
            val dataHelperClass = DataHelperClinitFingerprint.classDef

            // Remove `System.loadLibrary("native-lib")` from `DataHelper.<clinit>()V`.
            DataHelperClinitFingerprint.method.replaceWithCleanBody(
                owner = dataHelperClass,
                registerCount = 1,
                smaliBody = "return-void",
            )

            // Convert `public static native byte[] AppData(Context, String)` into
            // pure-Java bytecode, mirroring the native decoder's two attempts:
            //   1) Base64 → AES-128-CBC/PKCS5Padding
            //   2) Base64 → byte-pair swap → reverse → Base64 → AES-128-CBC/PKCS5Padding
            // Attempt 2 runs only if attempt 1 fails, exactly like the native code.
            val nativeAppData = dataHelperClass.methods.firstOrNull { method ->
                method.name == "AppData" &&
                    method.returnType == "[B" &&
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes[0].toString() == "Landroid/content/Context;" &&
                    method.parameterTypes[1].toString() == "Ljava/lang/String;"
            } ?: throw PatchException("Could not find DataHelper.AppData(Context, String)[B")

            val javaAppData = nativeAppData.replaceWithCleanBody(
                owner = dataHelperClass,
                registerCount = 14,
                clearFlags = AccessFlags.NATIVE.value,
                smaliBody = """
                    if-eqz p1, :empty_out

                    # ---- attempt 1: plain Base64 -> AES-128-CBC (first native path)
                    ${lenientBase64Smali("p1", "v0", "a1")}
                    if-eqz v0, :try_b
                    array-length v1, v0
                    if-lez v1, :try_b
                    rem-int/lit8 v2, v1, 0x10
                    if-nez v2, :try_b

                    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
                    const-string v2, "$AES_KEY"
                    invoke-virtual {v2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
                    move-result-object v2
                    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;
                    const-string v4, "AES"
                    invoke-direct {v3, v2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

                    const-string v2, "$AES_IV_PLAIN"
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
                    if-eqz v0, :try_b
                    return-object v0

                    # ---- attempt 2: pair-swap pipeline (second native path)
                    :try_b
                    nop

                    ${lenientBase64Smali("p1", "v0", "b1")}
                    if-eqz v0, :empty_out
                    array-length v1, v0
                    if-lez v1, :empty_out

                    const/4 v2, 0x1
                    :swap_loop
                    if-ge v2, v1, :swap_done
                    add-int/lit8 v3, v2, -0x1
                    aget-byte v4, v0, v3
                    aget-byte v5, v0, v2
                    aput-byte v5, v0, v3
                    aput-byte v4, v0, v2
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

                    sget-object v11, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
                    new-instance v1, Ljava/lang/String;
                    invoke-direct {v1, v0, v11}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
                    ${lenientBase64Smali("v1", "v0", "b2")}
                    if-eqz v0, :empty_out
                    array-length v1, v0
                    if-lez v1, :empty_out

                    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
                    const-string v2, "$AES_KEY"
                    invoke-virtual {v2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
                    move-result-object v2
                    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;
                    const-string v4, "AES"
                    invoke-direct {v3, v2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

                    const-string v2, "$AES_IV"
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

            // Match native `libnative-lib.so` contract: any decode/padding failure
            // returns `new byte[0]` without throwing, allowing callers to fall
            // through to Tier-2 AES decryption (if any).
            val impl = javaAppData.implementation!!
            val emptyOutIdx = impl.instructions.size - 3
            check(impl.instructions[emptyOutIdx].opcode == Opcode.CONST_4) {
                "Unexpected DataHelper.AppData fallback label index ($emptyOutIdx)."
            }
            val tryBIdx = impl.instructions.indexOfFirst { it.opcode == Opcode.NOP }
            check(tryBIdx > 0) { "Could not locate second-attempt marker in DataHelper.AppData port." }
            // Attempt 1 failure -> fall into attempt 2; attempt 2 failure -> empty result.
            impl.addCatch(
                "Ljava/lang/Throwable;",
                impl.newLabelForIndex(0),
                impl.newLabelForIndex(tryBIdx),
                impl.newLabelForIndex(tryBIdx),
            )
            impl.addCatch(
                "Ljava/lang/Throwable;",
                impl.newLabelForIndex(tryBIdx),
                impl.newLabelForIndex(emptyOutIdx),
                impl.newLabelForIndex(emptyOutIdx),
            )
        }

        // ====================================================================
        // 2. Complete Ad & Popunder Removal
        // ====================================================================

        // Resolve `sc.b` class and both methods before mutating either so
        // Morphe's class-stamp guard stays clean.
        val scbClass = ParseAppConfigFingerprint.classDef
        val parseConfig = ParseAppConfigFingerprint.method
        val launchExternalAd = LaunchExternalAdFingerprint.method

        // 2a. Sanitize parsed `app.txt` configuration in `sc.b.s(...)` right
        // before `return-object v0`. Verified `mc.a` field map for 2.7 (17):
        //   h = banner_ad, i = banner_ad_action, j = start_ad,
        //   k = start_ad_action, n = supportAd, d = message, e = message_url,
        //   r = app_version; the parser also mirrors message/message_url
        //   into `ProApplication.E` / `ProApplication.F`.
        //   - Force banner/start ads off (`"no"`), blank the SupportActivity
        //     sponsor URL and the promo marquee message, disable the
        //     external-ad SharedPreferences switches.
        //   - Optionally force `mc.a.r = 17` (current versionCode) so the
        //     update gate never triggers from remote-config changes.
        // ----------------------------------------------------------------
        run {
            val returnIdx = parseConfig.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (returnIdx < 0) throw PatchException("Could not find return-object in sc.b.s")
            val retReg = (parseConfig.instructions[returnIdx] as OneRegisterInstruction).registerA
            check(retReg == 0) { "Expected mc.a return register v0 in sc.b.s, got v$retReg" }

            val sanitizeSmali = buildString {
                appendLine(
                    """
                        sget-object v1, ${SKTECH_APPLICATION_CLASS}->I:$SKTECH_APPLICATION_CLASS
                        const-string v2, ""
                        const-string v3, "no"
                        # banner_ad / banner_ad_action = "no" (mc/a h, i)
                        iput-object v3, v0, ${SKTECH_CONFIG_CLASS}->h:Ljava/lang/String;
                        iput-object v3, v0, ${SKTECH_CONFIG_CLASS}->i:Ljava/lang/String;
                        # start_ad / start_ad_action = "no" (mc/a j, k)
                        iput-object v3, v0, ${SKTECH_CONFIG_CLASS}->j:Ljava/lang/String;
                        iput-object v3, v0, ${SKTECH_CONFIG_CLASS}->k:Ljava/lang/String;
                        # supportAd sponsor URL = "" (mc/a n)
                        iput-object v2, v0, ${SKTECH_CONFIG_CLASS}->n:Ljava/lang/String;
                        # promo marquee message / message_url = "" (mc/a d, e and app E, F)
                        iput-object v2, v0, ${SKTECH_CONFIG_CLASS}->d:Ljava/lang/String;
                        iput-object v2, v0, ${SKTECH_CONFIG_CLASS}->e:Ljava/lang/String;
                        iput-object v2, v1, ${SKTECH_APPLICATION_CLASS}->E:Ljava/lang/String;
                        iput-object v2, v1, ${SKTECH_APPLICATION_CLASS}->F:Ljava/lang/String;

                        # SharedPreferences injection - disable all ad-enable prefs
                        invoke-static {v1}, ${SKTECH_CONFIG_PARSER_CLASS}->j(Landroid/content/Context;)Landroid/content/SharedPreferences${'$'}Editor;
                        move-result-object v3
                        const/4 v4, 0x0
                        const-string v5, "tv_external_ad_enabled"
                        invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                        move-result-object v3
                        const-string v5, "external_ad_enabled"
                        invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                        move-result-object v3
                        const-string v5, "external_ad_url"
                        invoke-interface {v3, v5, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
                        move-result-object v3
                        invoke-interface {v3}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
                    """.trimIndent(),
                )
                if (bypassUpdateGate == true) {
                    appendLine(
                        """
                            # Force mc.a.r = 17 (current versionCode) so the update gate never fires
                            const/16 v3, 0x11
                            iput v3, v0, ${SKTECH_CONFIG_CLASS}->r:I
                        """.trimIndent(),
                    )
                }
            }
            parseConfig.addInstructions(returnIdx, sanitizeSmali)
        }

        // 2b. Disable external browser / Chrome CustomTabs popunder redirects
        // (`sc.b.w(Context)V`). Player start paths can still call it; it now
        // returns before reading preferences or starting Support/CustomBrowser
        // activities.
        launchExternalAd.replaceWithCleanBody(
            owner = scbClass,
            registerCount = 2,
            smaliBody = "return-void",
        )

        // 2c. Bypass the timed `SupportActivity` sponsor gate in `jc.j.T(...)`
        // so streams open directly in `PlayerActivity` or `FloatingPlayer`.
        // The conditional branch immediately before the `SupportActivity`
        // launch already targets the direct-launch block when the gate does
        // not apply; make that jump unconditional. (Belt-and-braces with the
        // `supportAd = ""` sanitization above.)
        run {
            val openPlayer = OpenPlayerOrSupportGateFingerprint.method
            val insns = openPlayer.instructions
            val supportClassIdx = insns.indexOfFirst { insn ->
                insn.opcode == Opcode.CONST_CLASS &&
                    ((insn as ReferenceInstruction).reference as TypeReference).type ==
                    "Lcom/live/sktechtv/activities/SupportActivity;"
            }
            if (supportClassIdx < 0) throw PatchException("Could not find SupportActivity launch in jc.j.T")
            val ifOpcodes = setOf(
                Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE, Opcode.IF_GT, Opcode.IF_LE,
                Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ, Opcode.IF_GTZ, Opcode.IF_LEZ,
            )
            val gateBranchIdx = ((supportClassIdx - 1) downTo 0).firstOrNull { idx ->
                insns[idx] is BuilderOffsetInstruction && insns[idx].opcode in ifOpcodes
            } ?: throw PatchException("Could not find support-gate branch in jc.j.T")
            val directTarget = (insns[gateBranchIdx] as BuilderOffsetInstruction).target
            check(directTarget.location.index > supportClassIdx) {
                "Unexpected support-gate branch target in jc.j.T."
            }
            openPlayer.replaceInstruction(
                gateBranchIdx,
                BuilderInstruction30t(Opcode.GOTO_32, directTarget),
            )
        }

        // ====================================================================
        // 3. Disable WebActivity (potential remote-config-driven ad surface)
        // ====================================================================
        // WebActivity is a generic in-app WebView host. The stock app does not
        // appear to use it for ads directly, but remote `app.txt` config could
        // redirect it to ad landing pages. Stubbing onCreate to immediately
        // finish() the activity prevents any such redirection.
        // --------------------------------------------------------------------
        if (disableWebActivity == true) {
            val webActivityClass = WebActivityOnCreateFingerprint.classDef
            // `super.onCreate` is mandatory: finishing without it throws
            // `SuperNotCalledException` and crashes the app. Call through to
            // the real superclass (read from the class def) first.
            val webActivitySuper = webActivityClass.superclass
                ?: throw PatchException("WebActivity has no superclass")
            WebActivityOnCreateFingerprint.method.replaceWithCleanBody(
                owner = webActivityClass,
                registerCount = 2,
                smaliBody = """
                    invoke-super {p0, p1}, ${webActivitySuper}->onCreate(Landroid/os/Bundle;)V
                    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                    return-void
                """,
            )
        }

        // ====================================================================
        // 4. MainActivity: Anti-Tamper & Push Prompt
        // ====================================================================
        // Note: SK Tech TV does NOT have a Telegram promo popup (verified —
        // no `tg_hide` / `tg_dialog` strings in app code). The CricZ tg_hide
        // patch block is therefore absent here.
        run {
            val mainOnCreate = MainActivityOnCreateFingerprint.method
            val matches = MainActivityOnCreateFingerprint.instructionMatches
            val postNotifIfLtIdx = matches[0].index
            val antiTamperIfEqzIdx = matches[3].index
            val insns = mainOnCreate.instructions

            // 4a. Always neutralize all Java anti-tamper crash bombs by turning
            // `if-eqz isTv` into `nop` so execution always takes the stock
            // `goto` directly to normal `MainActivity` initialization.
            check(insns[antiTamperIfEqzIdx + 1].opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) {
                "Unexpected instruction after is_tv check in MainActivity.onCreate."
            }
            mainOnCreate.replaceInstruction(antiTamperIfEqzIdx, BuilderInstruction10x(Opcode.NOP))

            // 4b. Skip Android 13+ `POST_NOTIFICATIONS` runtime permission
            // prompt in `MainActivity.onCreate`.
            if (removePushNotifications == true) {
                val postNotifTarget = (insns[postNotifIfLtIdx] as BuilderOffsetInstruction).target
                mainOnCreate.replaceInstruction(
                    postNotifIfLtIdx,
                    BuilderInstruction30t(Opcode.GOTO_32, postNotifTarget),
                )
            }
        }

        // Pre-resolve multi-method class fingerprints before mutating.
        val splashOnCreate = SplashOnCreateFingerprint.method
        val splashPostNotifIfLtIdx = SplashOnCreateFingerprint.instructionMatches
            .first { splashOnCreate.instructions[it.index].opcode == Opcode.IF_LT }.index
        val splashUpdate = SplashUpdateGateFingerprint.method

        val playerExit = PlayerActivityExitUpdateCheckFingerprint.method
        val playerCmpIdx = PlayerActivityExitUpdateCheckFingerprint.instructionMatches[1].index

        // ====================================================================
        // 5. Push Notification & Permission-Prompt Removal (`removePushNotifications`)
        // ====================================================================
        if (removePushNotifications == true) {
            val pushServiceClass = PushServiceMessageReceivedFingerprint.classDef
            val pushMsg = PushServiceMessageReceivedFingerprint.method
            val pushToken = PushServiceNewTokenFingerprint.method
            pushMsg.replaceWithCleanBody(
                owner = pushServiceClass,
                registerCount = 2,
                smaliBody = "return-void",
            )
            pushToken.replaceWithCleanBody(
                owner = pushServiceClass,
                registerCount = 1,
                smaliBody = "return-void",
            )

            // Skip `POST_NOTIFICATIONS` permission prompt in `SplashActivity.onCreate`.
            // (`TvActivity.onCreate` has no such prompt in this build.)
            val splashSkipTarget = (splashOnCreate.instructions[splashPostNotifIfLtIdx] as BuilderOffsetInstruction).target
            splashOnCreate.replaceInstruction(
                splashPostNotifIfLtIdx,
                BuilderInstruction30t(Opcode.GOTO_32, splashSkipTarget),
            )
        }

        // ====================================================================
        // 6. Update & Force-Update Lockout Bypass (`bypassUpdateGate`)
        // ====================================================================
        if (bypassUpdateGate == true) {
            // `SplashActivity.A()V`: the first `if-eq` after reading the
            // remote `mc.a.r` (app_version) skips the update fragment and
            // launches MainActivity / TvActivity when versions match.
            // Make that jump unconditional.
            val splashInsns = splashUpdate.instructions
            val versionReadIdx = splashInsns.indexOfFirst { insn ->
                insn.opcode == Opcode.IGET &&
                    ((insn as ReferenceInstruction).reference as FieldReference).let { ref ->
                        ref.definingClass == SKTECH_CONFIG_CLASS && ref.name == "r"
                    }
            }
            if (versionReadIdx < 0) throw PatchException("Could not find mc.a.r read in SplashActivity.A")
            val splashCmpIdx = ((versionReadIdx + 1) until splashInsns.size).firstOrNull { idx ->
                splashInsns[idx].opcode == Opcode.IF_EQ
            } ?: throw PatchException("Could not find version if-eq in SplashActivity.A")
            val splashProceedTarget = (splashInsns[splashCmpIdx] as BuilderOffsetInstruction).target
            splashUpdate.replaceInstruction(
                splashCmpIdx,
                BuilderInstruction30t(Opcode.GOTO_32, splashProceedTarget),
            )

            // `PlayerActivity.w()V`: always jump to `MainActivity` on deeplink
            // exit instead of update fragment.
            val playerProceedTarget = (playerExit.instructions[playerCmpIdx] as BuilderOffsetInstruction).target
            playerExit.replaceInstruction(
                playerCmpIdx,
                BuilderInstruction30t(Opcode.GOTO_32, playerProceedTarget),
            )
        }

        // ====================================================================
        // 7. Root, Anti-Frida / Sniffer & MITM Proxy Lockout Bypass
        // (`bypassEnvironmentChecks`)
        // ====================================================================
        if (bypassEnvironmentChecks == true) {
            // 7a–7b. Resolve both `oc.b` methods before mutating `snifferClass`,
            // then replace `<clinit>` (keeping `oc.b.a = true` and `oc.b.b = true`)
            // and `a(h.j)` (clearing `ProApplication.G`).
            val snifferClass = SnifferDetectorClinitFingerprint.classDef
            val snifferClinit = SnifferDetectorClinitFingerprint.method
            val snifferScan = SnifferDetectorScanFingerprint.method

            snifferClinit.replaceWithCleanBody(
                owner = snifferClass,
                registerCount = 1,
                smaliBody = """
                    const/4 v0, 0x0
                    new-array v0, v0, [Ljava/lang/String;
                    sput-object v0, Loc/b;->c:[Ljava/lang/String;
                    const/4 v0, 0x1
                    sput-boolean v0, Loc/b;->a:Z
                    sput-boolean v0, Loc/b;->b:Z
                    return-void
                """,
            )

            snifferScan.replaceWithCleanBody(
                owner = snifferClass,
                registerCount = 3,
                smaliBody = """
                    sget-object v0, ${SKTECH_APPLICATION_CLASS}->I:$SKTECH_APPLICATION_CLASS
                    const/4 v1, 0x0
                    iput-object v1, v0, ${SKTECH_APPLICATION_CLASS}->G:Ljava/lang/String;
                    return-void
                """,
            )

            // 7c. Neutralize RootBeer: the aggregate check `a7.k.d()Z` and the
            // `libtoolChecker.so` JNI bridge (so the library can be stripped by
            // the resource patch without UnsatisfiedLinkError).
            val rootBeerClass = RootBeerCheckFingerprint.classDef
            RootBeerCheckFingerprint.method.replaceWithCleanBody(
                owner = rootBeerClass,
                registerCount = 2,
                smaliBody = """
                    const/4 v0, 0x0
                    return v0
                """,
            )
            val rootBeerNativeClass = RootBeerNativeClinitFingerprint.classDef
            val rootBeerNativeCheck = RootBeerNativeCheckFingerprint.method
            RootBeerNativeClinitFingerprint.method.replaceWithCleanBody(
                owner = rootBeerNativeClass,
                registerCount = 1,
                smaliBody = "return-void",
            )
            rootBeerNativeCheck.replaceWithCleanBody(
                owner = rootBeerNativeClass,
                registerCount = 3,
                clearFlags = NATIVE_ACCESS_FLAG,
                smaliBody = """
                    const/4 v0, 0x0
                    return v0
                """,
            )

            // 7d. Strip SubjectDN proxy-certificate inspection from
            // `nc.a.checkClientTrusted` & `checkServerTrusted`, delegating
            // straight to the platform `X509TrustManager` (`this.a`).
            val checkClient = TrustManagerCheckClientFingerprint.method
            val checkServer = TrustManagerCheckServerFingerprint.method
            listOf(checkClient, checkServer).forEach { tmMethod ->
                val delegateIdx = tmMethod.instructions.indexOfFirst { insn ->
                    insn.opcode == Opcode.IGET_OBJECT &&
                        ((insn as ReferenceInstruction).reference as FieldReference).type ==
                        "Ljavax/net/ssl/X509TrustManager;"
                }
                if (delegateIdx < 0) throw PatchException("Could not find X509TrustManager delegate in ${tmMethod.name}")
                if (delegateIdx > 0) {
                    tmMethod.removeInstructions(0, delegateIdx)
                }
            }
        }
    }
}

// ============================================================================
// Helper — copied verbatim from the CricZ family.
// Replaces [this] method inside [owner] with a fresh MutableMethodImplementation
// compiled from [smaliBody], cleanly discarding any old try/catch blocks or
// native flags.
// ============================================================================

// Lenient Base64 decode mirroring the native decoder, which silently skips
// any character outside the Base64 alphabet (including '=' anywhere in the
// input). Android's Base64.decode can reject such inputs, which breaks
// endpoints whose payloads are not clean canonical Base64. This keeps only
// alphabet characters, re-pads with '=' to a multiple of 4, then decodes.
// Scratch registers: v6 (builder/result), v7 (index), v8 (length),
// v9 (char), v10 (temp). [inputReg] must be a String register outside v6-v10.
private fun lenientBase64Smali(inputReg: String, outputReg: String, tag: String): String = """
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V
    const/4 v7, 0x0
    invoke-virtual {$inputReg}, Ljava/lang/String;->length()I
    move-result v8
    :${tag}_loop
    if-ge v7, v8, :${tag}_pad
    invoke-virtual {$inputReg, v7}, Ljava/lang/String;->charAt(I)C
    move-result v9
    const/16 v10, 0x30
    if-lt v9, v10, :${tag}_low
    const/16 v10, 0x3a
    if-lt v9, v10, :${tag}_keep
    const/16 v10, 0x41
    if-lt v9, v10, :${tag}_next
    const/16 v10, 0x5b
    if-lt v9, v10, :${tag}_keep
    const/16 v10, 0x61
    if-lt v9, v10, :${tag}_next
    const/16 v10, 0x7b
    if-lt v9, v10, :${tag}_keep
    goto :${tag}_next
    :${tag}_low
    const/16 v10, 0x2b
    if-ne v9, v10, :${tag}_keep
    const/16 v10, 0x2f
    if-ne v9, v10, :${tag}_keep
    goto :${tag}_next
    :${tag}_keep
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :${tag}_next
    add-int/lit8 v7, v7, 0x1
    goto :${tag}_loop
    :${tag}_pad
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I
    move-result v8
    rem-int/lit8 v10, v8, 0x4
    if-eqz v10, :${tag}_dec
    rsub-int/lit8 v10, v10, 0x4
    :${tag}_padloop
    if-lez v10, :${tag}_dec
    const/16 v9, 0x3d
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    add-int/lit8 v10, v10, -0x1
    goto :${tag}_padloop
    :${tag}_dec
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v6
    const/4 v10, 0x0
    invoke-static {v6, v10}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
    move-result-object $outputReg
""".trimIndent()

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
