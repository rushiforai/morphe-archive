package app.template.patches.cricz

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_CRICZ_TV
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

@Suppress("unused")
val removeAdsTelemetryAndRestrictionsPatch = bytecodePatch(
    name = "Remove ads, telemetry & restrictions",
    description = "Replaces native signature-locked config decryption in pure Java, removes all " +
        "banner/popunder/timer ads and the local NanoHTTPD ad server, suppresses the startup Telegram " +
        "popup and player watermarks, strips Firebase telemetry and push notifications, and bypasses " +
        "update lockouts. Optional root/sniffer bypass and native/telemetry stripping are off by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRICZ_TV)

    dependsOn(manifestAndNativeDebloatPatch)

    // Surface all user-configurable options on this single CricZ TV patch.
    val hidePromoMarquee by hidePromoMarqueeOption()
    val removePushNotifications by removePushNotificationsOption()
    val bypassUpdateGate by bypassUpdateGateOption()
    val bypassEnvironmentChecks by bypassEnvironmentChecksOption()
    stripNativeAndTelemetryBloatOption()

    execute {
        // ====================================================================
        // 1. Replace Native Signature-Locked `DataHelper.MyApp` in Pure Java
        // ====================================================================
        // Stock `libnative-lib.so` derives its Tier-1 AES-128-CBC key from the APK's X.509 signing
        // certificate SHA-256 (`9ff349c0...` -> key `"ST00ZGt3UGlPdVJP"`, IV `"K9mX2qP7vL4nR8sT"`).
        // Re-signing the APK causes native `MyApp` to derive the wrong key and break all 6 endpoints.
        // Replacing `DataHelper.MyApp` in pure Java preserves exact Tier-1 decryption on re-signed
        // APKs while gracefully returning `new byte[0]` if the server ever switches to Tier-2 AES,
        // and completely eliminates `System.loadLibrary("native-lib")`.
        run {
            val dataHelperClass = DataHelperClinitFingerprint.classDef

            // Remove `System.loadLibrary("native-lib")` from `DataHelper.<clinit>()V`.
            DataHelperClinitFingerprint.method.replaceWithCleanBody(
                owner = dataHelperClass,
                registerCount = 1,
                smaliBody = "return-void",
            )

            // Convert `public static native byte[] MyApp(Context, String)` into pure-Java bytecode.
            val nativeMyApp = dataHelperClass.methods.firstOrNull { method ->
                method.name == "MyApp" &&
                    method.returnType == "[B" &&
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes[0].toString() == "Landroid/content/Context;" &&
                    method.parameterTypes[1].toString() == "Ljava/lang/String;"
            } ?: throw PatchException("Could not find DataHelper.MyApp(Context, String)[B")

            val javaMyApp = nativeMyApp.replaceWithCleanBody(
                owner = dataHelperClass,
                registerCount = 8,
                clearFlags = AccessFlags.NATIVE.value,
                smaliBody = """
                    if-eqz p1, :empty_out

                    const/4 v0, 0x0
                    invoke-static {p1, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
                    move-result-object v0
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

                    const/4 v1, 0x0
                    invoke-static {v0, v1}, Landroid/util/Base64;->decode([BI)[B
                    move-result-object v0
                    if-eqz v0, :empty_out
                    array-length v1, v0
                    if-lez v1, :empty_out

                    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
                    const-string v2, "ST00ZGt3UGlPdVJP"
                    invoke-virtual {v2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
                    move-result-object v2
                    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;
                    const-string v4, "AES"
                    invoke-direct {v3, v2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

                    const-string v2, "K9mX2qP7vL4nR8sT"
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

            // Match native `libnative-lib.so` contract: any decode/padding failure returns `new byte[0]`
            // without throwing, allowing `c6.f0.j` to fall through seamlessly to Tier-2 AES decryption.
            val impl = javaMyApp.implementation!!
            val emptyOutIdx = impl.instructions.size - 3
            check(impl.instructions[emptyOutIdx].opcode == Opcode.CONST_4) {
                "Unexpected DataHelper.MyApp fallback label index ($emptyOutIdx)."
            }
            impl.addCatch(
                "Ljava/lang/Throwable;",
                impl.newLabelForIndex(0),
                impl.newLabelForIndex(emptyOutIdx),
                impl.newLabelForIndex(emptyOutIdx),
            )
        }

        // ====================================================================
        // 2. Complete Ad, Popunder, NanoHTTPD Banner Server & Watermark Removal
        // ====================================================================

        // Resolve `vc.b` class and both methods before mutating either so Morphe's class-stamp guard stays clean.
        val vcbClass = ParseAppConfigFingerprint.classDef
        val parseConfig = ParseAppConfigFingerprint.method
        val launchExternalAd = LaunchExternalAdFingerprint.method

        // 2a. Sanitize parsed `app.txt` configuration in `vc.b.v(...)` right before `return aVar`:
        //   - Force `banner_ad = "no"`, `banner_ad_action = "no"`, `supportAd = ""`, `player_text = ""`
        //   - Force `tv_external_ad_enabled = false`, `external_ad_enabled = false`, `external_ad_url = ""`
        //   - Optionally clear `message` / `message_url` and normalize `app_version` (`pc.a.q = 10`)
        run {
            val returnIdx = parseConfig.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (returnIdx < 0) throw PatchException("Could not find return-object in vc.b.v")
            val retReg = (parseConfig.instructions[returnIdx] as OneRegisterInstruction).registerA
            check(retReg == 0) { "Expected pc.a return register v0 in vc.b.v, got v$retReg" }

            val sanitizeSmali = buildString {
                appendLine(
                    """
                        sget-object v1, Lcom/pro/cricztv/app/App;->P:Lcom/pro/cricztv/app/App;
                        const-string v2, ""
                        const-string v3, "no"
                        iput-object v2, v1, Lcom/pro/cricztv/app/App;->M:Ljava/lang/String;
                        iput-object v3, v0, Lpc/a;->k:Ljava/lang/String;
                        iput-object v3, v0, Lpc/a;->l:Ljava/lang/String;
                        iput-object v2, v0, Lpc/a;->m:Ljava/lang/String;
                        invoke-static {v1}, Lvc/b;->k(Landroid/content/Context;)Landroid/content/SharedPreferences${'$'}Editor;
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
                if (hidePromoMarquee == true) {
                    appendLine(
                        """
                            const/4 v3, 0x0
                            iput-object v3, v1, Lcom/pro/cricztv/app/App;->H:Ljava/lang/String;
                            iput-object v2, v1, Lcom/pro/cricztv/app/App;->I:Ljava/lang/String;
                            iput-object v2, v0, Lpc/a;->i:Ljava/lang/String;
                            iput-object v2, v0, Lpc/a;->j:Ljava/lang/String;
                        """.trimIndent(),
                    )
                }
                if (bypassUpdateGate == true) {
                    appendLine(
                        """
                            const/16 v3, 0xa
                            iput v3, v0, Lpc/a;->q:I
                        """.trimIndent(),
                    )
                }
            }
            parseConfig.addInstructions(returnIdx, sanitizeSmali)
        }

        // 2b. Disable external browser / Chrome CustomTabs popunder redirects (`vc.b.A(Context)V`).
        launchExternalAd.replaceWithCleanBody(
            owner = vcbClass,
            registerCount = 2,
            smaliBody = "return-void",
        )

        // 2c. Disable Events match-feed `"adpro*"` banner cards (`hc.h.g()Z` -> `false`), preventing
        // `item_banner` WebViews and the local `qc.k` (`NanoHTTPD` port `1120`) server from starting.
        val matchAdapterClass = MatchAdapterBannerEnabledFingerprint.classDef
        MatchAdapterBannerEnabledFingerprint.method.replaceWithCleanBody(
            owner = matchAdapterClass,
            registerCount = 2,
            smaliBody = """
                const/4 v0, 0x0
                return v0
            """,
        )

        // 2d. Bypass the 10-second `SupportActivity` sponsor gate in `kc.k.T(...)` so streams open
        // directly in `PlayerActivity` or `FloatingPlayer`.
        run {
            val openPlayer = OpenPlayerOrSupportGateFingerprint.method
            val matches = OpenPlayerOrSupportGateFingerprint.instructionMatches
            val supportGateStartIdx = matches[1].index
            val directLaunchIdx = matches[3].index
            val impl = openPlayer.implementation!!
            openPlayer.replaceInstruction(
                supportGateStartIdx,
                BuilderInstruction30t(Opcode.GOTO_32, impl.newLabelForIndex(directLaunchIdx)),
            )
        }

        // ====================================================================
        // 3. MainActivity: Startup Telegram Dialog, Anti-Tamper & Push Prompt
        // ====================================================================
        run {
            val mainOnCreate = MainActivityOnCreateFingerprint.method
            val matches = MainActivityOnCreateFingerprint.instructionMatches
            val postNotifIfLtIdx = matches[0].index
            val antiTamperIfEqzIdx = matches[3].index
            val tgHideConstIdx = matches[4].index
            val insns = mainOnCreate.instructions

            // 3a. Always suppress the startup "Join Telegram" modal (`dialog_telegram`).
            // Locate the `if-nez v0, :after_tg` branch immediately preceding `"DataPreferences"` / `"tg_hide"`.
            val tgSkipBranchIdx = ((tgHideConstIdx - 1) downTo (tgHideConstIdx - 8).coerceAtLeast(0))
                .firstOrNull { idx ->
                    val insn = insns[idx]
                    insn.opcode == Opcode.IF_NEZ &&
                        (insn as BuilderOffsetInstruction).target.location.index > tgHideConstIdx + 50
                } ?: throw PatchException("Could not find startup Telegram dialog skip branch in MainActivity.onCreate")
            val tgTarget = (insns[tgSkipBranchIdx] as BuilderOffsetInstruction).target
            mainOnCreate.replaceInstruction(tgSkipBranchIdx, BuilderInstruction30t(Opcode.GOTO_32, tgTarget))

            // 3b. Always neutralize all 6 Java anti-tamper crash bombs (`versionCode != 10`,
            // `minSdk`/`targetSdk`, `getFilesDir()` dot-count, `res/raw/{live,load}` JSON check,
            // `R.raw` field-count reflection, and `rc.b.a & rc.b.b`) by turning `if-eqz isTv` into
            // `nop` so execution always takes the stock `goto/16` directly to normal `MainActivity`
            // initialization. Kept unconditional (like the pure-Java decryption above) so patched
            // builds always start; the optional root/sniffer bypasses in section 7 stay opt-in.
            check(insns[antiTamperIfEqzIdx + 1].opcode == Opcode.GOTO_16) {
                "Unexpected instruction after is_tv check in MainActivity.onCreate."
            }
            mainOnCreate.replaceInstruction(antiTamperIfEqzIdx, BuilderInstruction10x(Opcode.NOP))

            // 3c. Skip Android 13+ `POST_NOTIFICATIONS` runtime permission prompt in `MainActivity.onCreate`.
            if (removePushNotifications == true) {
                val postNotifTarget = (insns[postNotifIfLtIdx] as BuilderOffsetInstruction).target
                mainOnCreate.replaceInstruction(
                    postNotifIfLtIdx,
                    BuilderInstruction30t(Opcode.GOTO_32, postNotifTarget),
                )
            }
        }

        // Pre-resolve multi-method class fingerprints before mutating any of their classes.
        val splashOnCreate = SplashOnCreateFingerprint.method
        val splashPostNotifIfLtIdx = SplashOnCreateFingerprint.instructionMatches
            .first { splashOnCreate.instructions[it.index].opcode == Opcode.IF_LT }.index
        val splashUpdate = SplashUpdateCheckFingerprint.method
        val splashCmpIdx = SplashUpdateCheckFingerprint.instructionMatches[0].index

        val playerOnCreate = PlayerActivityOnCreateFingerprint.method
        val playerExit = PlayerActivityExitUpdateCheckFingerprint.method
        val playerCmpIdx = PlayerActivityExitUpdateCheckFingerprint.instructionMatches[1].index

        // ====================================================================
        // 4. Promo Announcement Marquee Bar (`hidePromoMarquee`)
        // ====================================================================
        if (hidePromoMarquee == true) {
            // 4a. Blank fallback marquee strings in `App.<init>()V`.
            val appInit = AppInitFingerprint.method
            appInit.instructions.withIndex().forEach { (idx, insn) ->
                if (insn.opcode == Opcode.CONST_STRING) {
                    val str = ((insn as ReferenceInstruction).reference as StringReference).string
                    if (str.startsWith("CricZ TV,") || str == "https://t.me/cricztvapp") {
                        val reg = (insn as OneRegisterInstruction).registerA
                        appInit.replaceInstruction(
                            idx,
                            BuilderInstruction21c(Opcode.CONST_STRING, reg, ImmutableStringReference("")),
                        )
                    }
                }
            }

            // 4b. Collapse `message_card` (`MaterialCardView`) in Events home fragment (`mc.i.E()V`).
            val eventsSetup = EventsFragmentSetupFingerprint.method
            val eventsRetIdx = eventsSetup.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (eventsRetIdx < 0) throw PatchException("Could not find return-void in mc.i.E")
            eventsSetup.addInstructions(
                eventsRetIdx,
                """
                    iget-object v0, p0, Lmc/i;->x0:Lya/c;
                    iget-object v0, v0, Lya/c;->B:Ljava/lang/Object;
                    check-cast v0, Landroid/view/View;
                    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
                    move-result-object v0
                    check-cast v0, Landroid/view/View;
                    const/16 v1, 0x8
                    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                """,
            )

            // 4c. Collapse `message_card` (`Ljc/a;->h:Landroid/view/ViewGroup;`) in `PlayerActivity.onCreate`.
            val msgReadIdx = playerOnCreate.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.IGET_OBJECT &&
                    ((insn as ReferenceInstruction).reference as FieldReference).let { ref ->
                        ref.definingClass == "Lcom/pro/cricztv/app/App;" && ref.name == "H"
                    }
            }
            if (msgReadIdx < 1) throw PatchException("Could not find App.H read in PlayerActivity.onCreate")
            val thisReg = (playerOnCreate.instructions[msgReadIdx - 1] as TwoRegisterInstruction).registerB
            check(thisReg == 0) { "Expected PlayerActivity this register v0, got v$thisReg" }
            playerOnCreate.addInstructions(
                msgReadIdx - 1,
                """
                    iget-object v1, v0, Lcom/pro/cricztv/activities/PlayerActivity;->X:Ljc/a;
                    iget-object v1, v1, Ljc/a;->h:Landroid/view/ViewGroup;
                    const/16 v3, 0x8
                    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V
                """,
            )
        }

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

            // Skip `POST_NOTIFICATIONS` permission prompt in `SplashActivity.onCreate` and `TvActivity.onCreate`.
            val splashSkipTarget = (splashOnCreate.instructions[splashPostNotifIfLtIdx] as BuilderOffsetInstruction).target
            splashOnCreate.replaceInstruction(
                splashPostNotifIfLtIdx,
                BuilderInstruction30t(Opcode.GOTO_32, splashSkipTarget),
            )

            val tvOnCreate = TvActivityOnCreateFingerprint.method
            val tvIfLtIdx = TvActivityOnCreateFingerprint.instructionMatches
                .first { tvOnCreate.instructions[it.index].opcode == Opcode.IF_LT }.index
            val tvSkipTarget = (tvOnCreate.instructions[tvIfLtIdx] as BuilderOffsetInstruction).target
            tvOnCreate.replaceInstruction(tvIfLtIdx, BuilderInstruction30t(Opcode.GOTO_32, tvSkipTarget))
        }

        // ====================================================================
        // 6. Update & Force-Update Lockout Bypass (`bypassUpdateGate`)
        // ====================================================================
        if (bypassUpdateGate == true) {
            // `SplashActivity.z()V`: always jump to `MainActivity` / `TvActivity` launch.
            val splashProceedTarget = (splashUpdate.instructions[splashCmpIdx] as BuilderOffsetInstruction).target
            splashUpdate.replaceInstruction(
                splashCmpIdx,
                BuilderInstruction30t(Opcode.GOTO_32, splashProceedTarget),
            )

            // `PlayerActivity.v()V`: always jump to `MainActivity` on deeplink exit instead of `mc.z`.
            val playerProceedTarget = (playerExit.instructions[playerCmpIdx] as BuilderOffsetInstruction).target
            playerExit.replaceInstruction(
                playerCmpIdx,
                BuilderInstruction30t(Opcode.GOTO_32, playerProceedTarget),
            )
        }

        // ====================================================================
        // 7. Root, Anti-Frida / Sniffer & MITM Proxy Lockout Bypass (`bypassEnvironmentChecks`)
        // ====================================================================
        if (bypassEnvironmentChecks == true) {
            // 7a. Bypass RootBeer (`a7.l` / `libtoolChecker.so`) + shell `su`/`magisk` checks in `b8.h.r(...)`
            // by jumping straight to the non-root `b8.h.K(...)` request dispatch.
            val rootWrapper = RootCheckRequestWrapperFingerprint.method
            val rootIfEqzIdx = RootCheckRequestWrapperFingerprint.instructionMatches[0].index
            val nonRootTarget = (rootWrapper.instructions[rootIfEqzIdx] as BuilderOffsetInstruction).target
            rootWrapper.replaceInstruction(
                rootIfEqzIdx,
                BuilderInstruction30t(Opcode.GOTO_32, nonRootTarget),
            )

            // 7b–7c. Resolve both `rc.b` methods before mutating `snifferClass`, then replace
            // `<clinit>` (keeping `rc.b.a = true` and `rc.b.b = true`) and `a(h.j)` + `p4.v.O`.
            val snifferClass = SnifferDetectorClinitFingerprint.classDef
            val snifferClinit = SnifferDetectorClinitFingerprint.method
            val snifferScan = SnifferDetectorScanFingerprint.method

            snifferClinit.replaceWithCleanBody(
                owner = snifferClass,
                registerCount = 1,
                smaliBody = """
                    const/4 v0, 0x0
                    new-array v0, v0, [Ljava/lang/String;
                    sput-object v0, Lrc/b;->c:[Ljava/lang/String;
                    const/4 v0, 0x1
                    sput-boolean v0, Lrc/b;->a:Z
                    sput-boolean v0, Lrc/b;->b:Z
                    return-void
                """,
            )

            snifferScan.replaceWithCleanBody(
                owner = snifferClass,
                registerCount = 3,
                smaliBody = """
                    sget-object v0, Lcom/pro/cricztv/app/App;->P:Lcom/pro/cricztv/app/App;
                    const/4 v1, 0x0
                    iput-object v1, v0, Lcom/pro/cricztv/app/App;->K:Ljava/lang/String;
                    return-void
                """,
            )
            val playerSnifferClass = PlayerSnifferGateFingerprint.classDef
            PlayerSnifferGateFingerprint.method.replaceWithCleanBody(
                owner = playerSnifferClass,
                registerCount = 2,
                smaliBody = """
                    const/4 v0, 0x0
                    return v0
                """,
            )

            // 7d. Strip SubjectDN proxy-certificate inspection from `qc.b.checkClientTrusted` & `checkServerTrusted`,
            // delegating straight to the platform `X509TrustManager` (`this.a`).
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

            // 7e. Neutralize external-files-dir wipe (`ka.c.G`) and `"cHJvX2lzX3Bybw=="` permanent lockout
            // inside `SplashActivity`'s `app.txt` callback (`androidx.fragment.app.e.c`).
            val callbackMethod = SplashCallbackErrorTrapFingerprint.method
            val cbMatches = SplashCallbackErrorTrapFingerprint.instructionMatches
            val wipeCallIdx = cbMatches[1].index
            val proxyLockBranchIdx = cbMatches[3].index
            callbackMethod.replaceInstruction(proxyLockBranchIdx, BuilderInstruction10x(Opcode.NOP))
            callbackMethod.replaceInstruction(wipeCallIdx, BuilderInstruction10x(Opcode.NOP))
        }
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
