package app.template.patches.playfy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_PLAYFY_TV
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/**
 * Constants for the pure-Java `NintyMin` decoder ports. These reproduce the
 * stock signer-derived values of the audited build so encrypted server
 * payloads keep decrypting after the APK is re-signed. Keep these out of
 * documentation and release notes.
 */
private const val STOCK_CERT_SHA256_B64 = "OM3iiPBg+o9HaraBH/IVdnw1EXv2JI/YrRV81FZomMw="
private const val CERT_T_STRING = "Mc1pOdG+rjLRsO8tlGCxcBFqGIU"
private const val DEFAULT_POOL_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/@#%&="
private const val FALLBACK_KEY = "ouAzyvGQqd5yAi5G"
private const val FALLBACK_IV = "QC4a1NX)XXEHQ1bf"

@Suppress("unused")
val removeAdsTelemetryAndRestrictionsPatch = bytecodePatch(
    name = "Remove ads, telemetry & restrictions",
    description = "Removes ads and tracking, and hides the player app logo.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PLAYFY_TV)

    dependsOn(manifestAndNativeDebloatPatch)
    dependsOn(hidePlayerAppLogoPatch)

    // Surface all user-configurable options on this single Playfy TV patch.
    val removePushNotifications by removePushNotificationsOption()
    val bypassUpdateGate by bypassUpdateGateOption()
    val bypassEnvironmentChecks by bypassEnvironmentChecksOption()
    stripNativeAndTelemetryBloatOption()

    execute {
        // Pre-resolve every fingerprint against classes that will be mutated
        // below, before touching any of them.
        val nintyMinClass = NintyMinClinitFingerprint.classDef
        val nintyMinClinit = NintyMinClinitFingerprint.method
        val ohMyNoNative = NintyMinOhMyNoFingerprint.method
        val ohMyYesNative = NintyMinOhMyYesFingerprint.method

        val splashCallback = SplashConfigCallbackFingerprint.method
        val splashOnCreate = SplashOnCreateFingerprint.method
        val splashPostNotifIfLtIdx = SplashOnCreateFingerprint.instructionMatches[0].index
        val splashInstallUpdate = SplashInstallUpdateFingerprint.method
        val splashInstallClass = SplashInstallUpdateFingerprint.classDef
        val splashUnknownSources = SplashUnknownSourcesFingerprint.method

        val adsManagerClass = AdsManagerConstructorFingerprint.classDef
        val adsManagerCtor = AdsManagerConstructorFingerprint.method
        val adsShouldShow = AdsShouldShowFingerprint.method
        val adsCooldown = AdsCooldownFingerprint.method
        val adsBanner = AdsBannerFingerprint.method
        val playerOnCreate = PlayerOnCreateFingerprint.method
        val mainOnCreate = MainActivityOnCreateFingerprint.method
        val telegramDialogPrefIdx = MainActivityOnCreateFingerprint.instructionMatches[0].index
        val telegramDialogGetBooleanIdx = MainActivityOnCreateFingerprint.instructionMatches[1].index
        val telegramDialogResultIdx = MainActivityOnCreateFingerprint.instructionMatches[2].index

        val appOnCreate = AppOnCreateFingerprint.method
        val pushServiceClass = PushServiceMessageReceivedFingerprint.classDef
        val pushMessage = PushServiceMessageReceivedFingerprint.method
        val snifferClass = SnifferCheckFingerprint.classDef
        val snifferCheck = SnifferCheckFingerprint.method

        // ====================================================================
        // 1. Replace the native signature-locked `NintyMin` decoders in
        //    pure Java
        // ====================================================================
        // Both stock libraries (`libumairi-lib.so`, `libnative-lib.so`)
        // derive their decryption material from the stock signing
        // certificate, so a re-signed APK cannot decode any server config.
        // The pure-Java ports below reproduce both native schemes exactly
        // using the stock signer's derived constants (any failure returns
        // `null` from `ohMyNo` / `""` from `ohMyYes`, matching the native
        // contract relied on by `jd.n`'s fallback logic), and eliminate
        // both `System.loadLibrary` calls.
        // --------------------------------------------------------------------
        run {
            nintyMinClinit.replaceWithCleanBody(
                owner = nintyMinClass,
                registerCount = 1,
                smaliBody = "return-void",
            )

            val javaOhMyNo = ohMyNoNative.replaceWithCleanBody(
                owner = nintyMinClass,
                registerCount = 18,
                clearFlags = AccessFlags.NATIVE.value,
                smaliBody = ohMyNoSmali(),
            )
            // Any failure anywhere in the port returns null, exactly like
            // the native decoder (jd.n then falls back to ohMyYes).
            run {
                val impl = javaOhMyNo.implementation!!
                val failIdx = impl.instructions.size - 2
                check(impl.instructions[failIdx].opcode == Opcode.CONST_4) {
                    "Unexpected ohMyNo fallback label index ($failIdx)."
                }
                impl.addCatch(
                    "Ljava/lang/Throwable;",
                    impl.newLabelForIndex(0),
                    impl.newLabelForIndex(failIdx),
                    impl.newLabelForIndex(failIdx),
                )
            }

            val javaOhMyYes = ohMyYesNative.replaceWithCleanBody(
                owner = nintyMinClass,
                registerCount = 19,
                clearFlags = AccessFlags.NATIVE.value,
                smaliBody = ohMyYesSmali(),
            )
            // Attempt 1 failure -> hardcoded fallback attempt; fallback
            // failure -> "" (the native decoder never returns null).
            run {
                val impl = javaOhMyYes.implementation!!
                val emptyIdx = impl.instructions.size - 2
                check(impl.instructions[emptyIdx].opcode == Opcode.CONST_STRING) {
                    "Unexpected ohMyYes empty-result label index ($emptyIdx)."
                }
                val fbIdx = impl.instructions.indexOfFirst { it.opcode == Opcode.NOP }
                check(fbIdx > 0) { "Could not locate fallback marker in ohMyYes port." }
                val unsignedMaskCount = impl.instructions.count {
                    (it as? WideLiteralInstruction)?.wideLiteral == 0xffffffffL
                }
                check(unsignedMaskCount == 2) {
                    "ohMyYes unsigned mask encoding regressed ($unsignedMaskCount)."
                }
                impl.addCatch(
                    "Ljava/lang/Throwable;",
                       impl.newLabelForIndex(0),
                    impl.newLabelForIndex(fbIdx),
                    impl.newLabelForIndex(fbIdx),
                )
                impl.addCatch(
                    "Ljava/lang/Throwable;",
                    impl.newLabelForIndex(fbIdx),
                    impl.newLabelForIndex(emptyIdx),
                    impl.newLabelForIndex(emptyIdx),
                )
            }
        }

        // ====================================================================
        // 2. Splash gates: signer check, blocked-apps lockout, update gate
        // ====================================================================
        run {
            val insns = splashCallback.instructions

            // 2a. Always neutralize the Java signer gate: the splash success
            // handler compares Base64(SHA-1(signing cert)) against the
            // server-provided `AppData.sig` and refuses to load content for
            // any other signer. Force the equality result to true.
            val equalsIdx = insns.indices.firstOrNull { idx ->
                val insn = insns[idx]
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as ReferenceInstruction).reference as? MethodReference)?.let { ref ->
                        ref.definingClass == "Lkotlin/jvm/internal/k;" && ref.name == "a"
                    } == true &&
                    (maxOf(0, idx - 4) until idx).any { prev ->
                        val p = insns[prev]
                        p.opcode == Opcode.IGET_OBJECT &&
                            ((p as ReferenceInstruction).reference as? FieldReference)?.let { ref ->
                                ref.definingClass == PLAYFY_APPDATA_CLASS && ref.name == "a"
                            } == true
                    }
            } ?: -1
            if (equalsIdx < 0) throw PatchException("Could not find sig comparison in splash callback")
            val moveResultIdx = equalsIdx + 1
            check(insns[moveResultIdx].opcode == Opcode.MOVE_RESULT) {
                "Expected move-result after sig comparison in splash callback."
            }
            val resultReg = (insns[moveResultIdx] as OneRegisterInstruction).registerA
            splashCallback.replaceInstruction(
                moveResultIdx,
                if (resultReg <= 15) {
                    BuilderInstruction11n(Opcode.CONST_4, resultReg, 1)
                } else {
                    BuilderInstruction21s(Opcode.CONST_16, resultReg, 1)
                },
            )

            // 2b. Always bypass the "blocked apps installed" lockout: when
            // any server-listed package is installed, stock diverts to an
            // uninstall-or-quit dialog instead of the main screen. NOP the
            // isEmpty branch so startup always proceeds to the main screen.
            val blockedGateIdx = (0 until insns.size - 2).firstOrNull { idx ->
                val insn = insns[idx]
                insn.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((insn as ReferenceInstruction).reference as? MethodReference)?.let { ref ->
                        ref.definingClass == "Ljava/util/ArrayList;" && ref.name == "isEmpty"
                    } == true &&
                    insns[idx + 1].opcode == Opcode.MOVE_RESULT &&
                    insns[idx + 2].opcode == Opcode.IF_EQZ &&
                    ((insns[idx + 2] as BuilderOffsetInstruction).target.location.index.let { target ->
                        val t = insns[target]
                        (t as? ReferenceInstruction)?.let { refIns ->
                            (refIns.reference as? MethodReference)?.let { ref ->
                                ref.definingClass == PLAYFY_SPLASH_ACTIVITY_CLASS && ref.name == "Z"
                            }
                        } == true
                    })
            } ?: throw PatchException("Could not find blocked-apps gate in splash callback")
            splashCallback.replaceInstruction(
                blockedGateIdx + 2,
                BuilderInstruction10x(Opcode.NOP),
            )

            // 2c. Bypass the forced-update version comparison. Stock
            // computes `remoteVersion - installedVersion`; `IF_GTZ`
            // branches to the "New Update Available" card, while the
            // fallthrough is the normal up-to-date path (blocked-apps
            // check, then Main). NOP the branch so startup always uses
            // that fallthrough. Also stub the update installer entry
            // points so no downloaded APK can ever be installed.
            if (bypassUpdateGate == true) {
                val parseLongIdx = insns.indexOfFirst { insn ->
                    insn.opcode == Opcode.INVOKE_STATIC &&
                        ((insn as ReferenceInstruction).reference as? MethodReference)?.let { ref ->
                            ref.definingClass == "Ljava/lang/Long;" && ref.name == "parseLong"
                        } == true
                }
                if (parseLongIdx < 0) throw PatchException("Could not find version parseLong in splash callback")
                val versionCmpIdx = ((parseLongIdx + 1) until minOf(insns.size, parseLongIdx + 8))
                    .firstOrNull { insns[it].opcode == Opcode.IF_GTZ }
                    ?: throw PatchException("Could not find version if-gtz in splash callback")
                splashCallback.replaceInstruction(
                    versionCmpIdx,
                    BuilderInstruction10x(Opcode.NOP),
                )

                splashInstallUpdate.replaceWithCleanBody(
                    owner = splashInstallClass,
                    registerCount = 1,
                    smaliBody = "return-void",
                )
                splashUnknownSources.replaceWithCleanBody(
                    owner = splashInstallClass,
                    registerCount = 1,
                    smaliBody = "return-void",
                )
            }
        }

        // ====================================================================
        // 3. Ads: Unity Ads pre-roll, sponsor/full-banner gates, banners
        // ====================================================================
        run {
            // 3a. Remove the `UnityAds.initialize(...)` call from the ads
            // manager constructor; config parsing and field setup are kept.
            val initIdx = adsManagerCtor.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as ReferenceInstruction).reference as? MethodReference)?.let { ref ->
                        ref.definingClass == "Lcom/unity3d/ads/UnityAds;" && ref.name == "initialize"
                    } == true
            }
            if (initIdx < 0) throw PatchException("Could not find UnityAds.initialize in ads manager")
            adsManagerCtor.removeInstructions(initIdx, 1)

            // 3b. The sponsor player gate and splash full-banner gate both
            // ask `id.h.b(type, name)`; answering "never" opens content
            // directly everywhere. MainActivity also calls the underlying
            // `id.h.c(...)` frequency-cap check directly for an external-
            // link gate before the player, so stub that check too.
            adsShouldShow.replaceWithCleanBody(
                owner = adsManagerClass,
                registerCount = 4,
                smaliBody = """
                    const/4 v0, 0x0
                    return v0
                """,
            )
            adsCooldown.replaceWithCleanBody(
                owner = adsManagerClass,
                registerCount = 6,
                smaliBody = """
                    const/4 v0, 0x0
                    return v0
                """,
            )

            // 3c. Banners render through `id.h.d(container)`; collapse the
            // container instead of building the ad WebView/image.
            adsBanner.replaceWithCleanBody(
                owner = adsManagerClass,
                registerCount = 3,
                smaliBody = """
                    const/16 v0, 0x8
                    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V
                    return-void
                """,
            )

            // 3d. Remove the Unity Ads pre-roll (`UnityAds.show`) executed
            // when the player opens.
            val showIdx = playerOnCreate.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as ReferenceInstruction).reference as? MethodReference)?.let { ref ->
                        ref.definingClass == "Lcom/unity3d/ads/UnityAds;" && ref.name == "show"
                    } == true
            }
            if (showIdx < 0) throw PatchException("Could not find UnityAds.show in PlayerActivity.onCreate")
            playerOnCreate.removeInstructions(showIdx, 1)
        }

        // ====================================================================
        // 4. Startup Telegram join dialog
        // ====================================================================
        run {
            val mainInsns = mainOnCreate.instructions

            check(
                mainInsns[telegramDialogPrefIdx].opcode == Opcode.CONST_STRING &&
                    ((mainInsns[telegramDialogPrefIdx] as ReferenceInstruction).reference as? StringReference)
                        ?.string == "tgd",
            ) { "Unexpected Telegram dialog preference anchor in MainActivity.onCreate." }
            check(
                telegramDialogGetBooleanIdx == telegramDialogPrefIdx + 1 &&
                    mainInsns[telegramDialogGetBooleanIdx].opcode == Opcode.INVOKE_INTERFACE &&
                    ((mainInsns[telegramDialogGetBooleanIdx] as ReferenceInstruction).reference as? MethodReference)
                        ?.let { ref ->
                            ref.definingClass == "Landroid/content/SharedPreferences;" &&
                                ref.name == "getBoolean" &&
                                ref.returnType == "Z" &&
                                ref.parameterTypes.map { it.toString() } ==
                                listOf("Ljava/lang/String;", "Z")
                        } == true,
            ) { "Unexpected Telegram dialog preference read in MainActivity.onCreate." }
            check(
                telegramDialogResultIdx == telegramDialogGetBooleanIdx + 1 &&
                    mainInsns[telegramDialogResultIdx].opcode == Opcode.MOVE_RESULT &&
                    mainInsns[telegramDialogResultIdx + 1].opcode == Opcode.IF_EQZ,
            ) { "Unexpected Telegram dialog gate in MainActivity.onCreate." }

            // The dialog's "don't show again" action stores `tgd=false`;
            // stock then branches over the whole DialogTgJoinBinding block.
            // Force that same result in-place so the automatic startup
            // dialog is never created, without changing the preference or
            // any manually opened Telegram links elsewhere in the app.
            val telegramDialogResultReg =
                (mainInsns[telegramDialogResultIdx] as OneRegisterInstruction).registerA
            mainOnCreate.replaceInstruction(
                telegramDialogResultIdx,
                if (telegramDialogResultReg <= 15) {
                    BuilderInstruction11n(Opcode.CONST_4, telegramDialogResultReg, 0)
                } else {
                    BuilderInstruction21s(Opcode.CONST_16, telegramDialogResultReg, 0)
                },
            )
        }

        // ====================================================================
        // 5. Push notification removal (`removePushNotifications`)
        // ====================================================================
        if (removePushNotifications == true) {
            // `App.onCreate` unconditionally obtains an FCM token before
            // RemoteConfig starts. The manifest patch removes the Firebase
            // Messaging component registrar, so leaving this call in place
            // crashes the process with "Firebase Messaging component is
            // not present" before Splash can appear. Skip only the token
            // request/listener registration and resume at the next,
            // unrelated startup task.
            run {
                val appInsns = appOnCreate.instructions
                val fcmStartIdx = appInsns.indices.firstOrNull { idx ->
                    idx + 2 < appInsns.size &&
                        appInsns[idx].opcode == Opcode.INVOKE_STATIC &&
                        ((appInsns[idx] as ReferenceInstruction).reference as? MethodReference)?.let { ref ->
                            ref.definingClass == "Llg/c;" &&
                                ref.name == "j" &&
                                ref.returnType == "Lcom/google/firebase/messaging/FirebaseMessaging;" &&
                                ref.parameterTypes.isEmpty()
                        } == true &&
                        appInsns[idx + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                        appInsns[idx + 2].opcode == Opcode.IGET_OBJECT &&
                        ((appInsns[idx + 2] as ReferenceInstruction).reference as? FieldReference)?.let { ref ->
                            ref.definingClass == "Lcom/google/firebase/messaging/FirebaseMessaging;" &&
                                ref.name == "h" &&
                                ref.type == "Ls9/n;"
                        } == true
                } ?: throw PatchException("Could not find Firebase Messaging startup token request in App.onCreate")

                val resumeIdx = ((fcmStartIdx + 1) until minOf(appInsns.size - 3, fcmStartIdx + 32))
                    .firstOrNull { idx ->
                        appInsns[idx].opcode == Opcode.NEW_INSTANCE &&
                            ((appInsns[idx] as ReferenceInstruction).reference as? TypeReference)?.type == "Lcf/n;" &&
                            appInsns[idx + 2].opcode == Opcode.INVOKE_DIRECT &&
                            ((appInsns[idx + 2] as ReferenceInstruction).reference as? MethodReference)?.let { ref ->
                                ref.definingClass == "Lcf/n;" &&
                                    ref.name == "<init>" &&
                                    ref.parameterTypes.map { it.toString() } ==
                                    listOf("Ljava/lang/Object;", "I")
                            } == true &&
                            appInsns[idx + 3].opcode == Opcode.INVOKE_STATIC &&
                            ((appInsns[idx + 3] as ReferenceInstruction).reference as? MethodReference)?.let { ref ->
                                ref.definingClass == "Lbf/y;" &&
                                    ref.name == "w" &&
                                    ref.returnType == "V" &&
                                    ref.parameterTypes.map { it.toString() } == listOf("Lcf/n;")
                            } == true
                    } ?: throw PatchException("Could not find safe post-FCM resume point in App.onCreate")

                // Remove (rather than branch over) the block so no dangling
                // `move-result-object` remains in unreachable code.
                appOnCreate.removeInstructions(fcmStartIdx, resumeIdx - fcmStartIdx)
            }

            pushMessage.replaceWithCleanBody(
                owner = pushServiceClass,
                registerCount = 2,
                smaliBody = "return-void",
            )

            // Skip the Android 13+ POST_NOTIFICATIONS permission prompt.
            val promptTarget =
                (splashOnCreate.instructions[splashPostNotifIfLtIdx] as BuilderOffsetInstruction).target
            splashOnCreate.replaceInstruction(
                splashPostNotifIfLtIdx,
                BuilderInstruction30t(Opcode.GOTO_32, promptTarget),
            )
        }

        // ====================================================================
        // 6. Sniffer-app lockout bypass (`bypassEnvironmentChecks`)
        // ====================================================================
        if (bypassEnvironmentChecks == true) {
            snifferCheck.replaceWithCleanBody(
                owner = snifferClass,
                registerCount = 2,
                smaliBody = """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }
    }
}

// ============================================================================
// Smali emitters for the NintyMin ports
// ============================================================================

/** Emits a big-endian 32-bit read: outReg = be32(arrayReg[baseReg..baseReg+4]). */
private fun be32Smali(arrayReg: String, baseReg: String, outReg: String, tmpReg: String, idxReg: String): String = """
    aget-byte $tmpReg, $arrayReg, $baseReg
    shl-int/lit8 $outReg, $tmpReg, 0x18
    add-int/lit8 $idxReg, $baseReg, 0x1
    aget-byte $tmpReg, $arrayReg, $idxReg
    shl-int/lit8 $tmpReg, $tmpReg, 0x18
    ushr-int/lit8 $tmpReg, $tmpReg, 0x8
    or-int $outReg, $outReg, $tmpReg
    add-int/lit8 $idxReg, $baseReg, 0x2
    aget-byte $tmpReg, $arrayReg, $idxReg
    shl-int/lit8 $tmpReg, $tmpReg, 0x18
    ushr-int/lit8 $tmpReg, $tmpReg, 0x10
    or-int $outReg, $outReg, $tmpReg
    add-int/lit8 $idxReg, $baseReg, 0x3
    aget-byte $tmpReg, $arrayReg, $idxReg
    shl-int/lit8 $tmpReg, $tmpReg, 0x18
    ushr-int/lit8 $tmpReg, $tmpReg, 0x18
    or-int $outReg, $outReg, $tmpReg
""".trimIndent()

/**
 * Pure-Java port of the `libumairi-lib.so` decoder (`ohMyNo`).
 * Envelope: Base64( 0xDEADBEEF || be32(32) || signer SHA-256 ||
 * be32(len) || salt || AES-256-CBC ciphertext ); the AES key/IV are the
 * first 48 bytes of HKDF-Expand(HMAC-SHA256, SHA-256(salt)); the plaintext
 * is be32(len) || bytes, each byte ROR-3-rotated then XORed with the
 * repeating signer SHA-256. Decryption is raw CBC (NoPadding), matching
 * the native manual CBC helper; the explicit plaintext length makes any
 * block padding irrelevant. Returns null on any mismatch/failure.
 */
private fun ohMyNoSmali(): String = """
    move-object/from16 v12, p0
    if-eqz v12, :fail
    const/4 v9, 0x2
    invoke-static {v12, v9}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
    move-result-object v0
    if-eqz v0, :fail
    array-length v1, v0
    const/16 v9, 0x10
    if-lt v1, v9, :fail
    const/4 v2, 0x0
    aget-byte v9, v0, v2
    const/16 v10, -0x22
    if-ne v9, v10, :fail
    const/4 v2, 0x1
    aget-byte v9, v0, v2
    const/16 v10, -0x53
    if-ne v9, v10, :fail
    const/4 v2, 0x2
    aget-byte v9, v0, v2
    const/16 v10, -0x42
    if-ne v9, v10, :fail
    const/4 v2, 0x3
    aget-byte v9, v0, v2
    const/16 v10, -0x11
    if-ne v9, v10, :fail
    const/4 v2, 0x4
    ${be32Smali("v0", "v2", "v3", "v9", "v10")}
    move v4, v3
    if-lez v4, :fail
    add-int/lit8 v9, v4, 0x8
    if-gt v9, v1, :fail
    const/16 v2, 0x8
    add-int/lit8 v3, v4, 0x8
    invoke-static {v0, v2, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B
    move-result-object v5
    const-string v9, "$STOCK_CERT_SHA256_B64"
    const/4 v10, 0x0
    invoke-static {v9, v10}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
    move-result-object v6
    invoke-static {v5, v6}, Ljava/security/MessageDigest;->isEqual([B[B)Z
    move-result v9
    if-eqz v9, :fail
    add-int/lit8 v2, v4, 0x8
    add-int/lit8 v9, v2, 0x4
    if-gt v9, v1, :fail
    ${be32Smali("v0", "v2", "v3", "v9", "v10")}
    move v4, v3
    if-lez v4, :fail
    add-int/lit8 v2, v2, 0x4
    add-int v9, v2, v4
    if-gt v9, v1, :fail
    add-int v3, v2, v4
    invoke-static {v0, v2, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B
    move-result-object v7
    add-int v2, v2, v4
    invoke-static {v0, v2, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B
    move-result-object v8
    array-length v9, v8
    if-lez v9, :fail
    const-string v9, "SHA-256"
    invoke-static {v9}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    move-result-object v14
    invoke-virtual {v14, v7}, Ljava/security/MessageDigest;->digest([B)[B
    move-result-object v7
    const/16 v9, 0x40
    new-array v13, v9, [B
    const/4 v9, 0x0
    new-array v5, v9, [B
    const/4 v11, 0x0
    const/4 v4, 0x1
    :hkdf_loop
    const/16 v9, 0x30
    if-ge v11, v9, :hkdf_done
    array-length v9, v5
    add-int/lit8 v3, v9, 0x1
    new-array v15, v3, [B
    const/4 v2, 0x0
    const/4 v3, 0x0
    array-length v9, v5
    invoke-static {v5, v2, v15, v3, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    array-length v9, v5
    aput-byte v4, v15, v9
    const-string v9, "HmacSHA256"
    invoke-static {v9}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;
    move-result-object v14
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;
    const-string v3, "HmacSHA256"
    invoke-direct {v2, v7, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V
    invoke-virtual {v14, v2}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V
    invoke-virtual {v14, v15}, Ljavax/crypto/Mac;->doFinal([B)[B
    move-result-object v5
    const/4 v2, 0x0
    array-length v3, v5
    invoke-static {v5, v2, v13, v11, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    add-int v11, v11, v3
    add-int/lit8 v4, v4, 0x1
    goto :hkdf_loop
    :hkdf_done
    const/4 v2, 0x0
    const/16 v3, 0x20
    invoke-static {v13, v2, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B
    move-result-object v14
    const/16 v2, 0x20
    const/16 v3, 0x30
    invoke-static {v13, v2, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B
    move-result-object v13
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;
    const-string v3, "AES"
    invoke-direct {v2, v14, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V
    new-instance v14, Ljavax/crypto/spec/IvParameterSpec;
    invoke-direct {v14, v13}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V
    const-string v9, "AES/CBC/NoPadding"
    invoke-static {v9}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;
    move-result-object v13
    const/4 v3, 0x2
    invoke-virtual {v13, v3, v2, v14}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    invoke-virtual {v13, v8}, Ljavax/crypto/Cipher;->doFinal([B)[B
    move-result-object v15
    if-eqz v15, :fail
    array-length v1, v15
    const/4 v9, 0x4
    if-lt v1, v9, :fail
    const/4 v2, 0x0
    ${be32Smali("v15", "v2", "v3", "v9", "v10")}
    move v4, v3
    if-lez v4, :fail
    add-int/lit8 v9, v4, 0x4
    if-gt v9, v1, :fail
    new-array v13, v4, [B
    const/4 v11, 0x0
    :xor_loop
    if-ge v11, v4, :xor_done
    add-int/lit8 v2, v11, 0x4
    aget-byte v9, v15, v2
    shl-int/lit8 v9, v9, 0x18
    ushr-int/lit8 v9, v9, 0x18
    ushr-int/lit8 v2, v9, 0x3
    and-int/lit8 v10, v9, 0x7
    shl-int/lit8 v10, v10, 0x5
    or-int v9, v2, v10
    rem-int/lit8 v2, v11, 0x20
    aget-byte v10, v6, v2
    xor-int v9, v9, v10
    aput-byte v9, v13, v11
    add-int/lit8 v11, v11, 0x1
    goto :xor_loop
    :xor_done
    new-instance v14, Ljava/lang/String;
    sget-object v9, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
    invoke-direct {v14, v13, v9}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    return-object v14
    :fail
    const/4 v0, 0x0
    return-object v0
""".trimIndent()

/**
 * Emits the FNV-1a-keyed 16-byte derivation used for `ohMyYes` key/IV.
 * The unsigned mask literal must keep its `L` suffix: in smali,
 * `const-wide 0xffffffff` encodes as -1, which leaves a negative hash
 * negative and makes the pool index invalid on the first picked byte.
 */
private fun fnvDeriveSmali(
    tag: String,
    basisLiteral: String,
    mult: Int,
    stepI: Int,
    stepA: Int,
    outReg: String,
): String = """
    const v7, $basisLiteral
    const v8, 0x1000193
    const/4 v9, 0x0
    array-length v10, v2
    :${tag}_fnv
    if-ge v9, v10, :${tag}_fnv_done
    aget-byte v3, v2, v9
    shl-int/lit8 v3, v3, 0x18
    ushr-int/lit8 v3, v3, 0x18
    xor-int v7, v7, v3
    mul-int v7, v7, v8
    add-int/lit8 v9, v9, 0x1
    goto :${tag}_fnv
    :${tag}_fnv_done
    const/4 v9, 0x0
    const/4 v3, 0x0
    const/4 v4, 0x0
    :${tag}_pick
    const/16 v10, 0x10
    if-ge v4, v10, :${tag}_done
    array-length v10, v2
    rem-int v10, v9, v10
    aget-byte v10, v2, v10
    shl-int/lit8 v10, v10, 0x18
    ushr-int/lit8 v10, v10, 0x18
    add-int v10, v3, v10
    mul-int/lit8 v7, v7, $mult
    xor-int v7, v7, v10
    int-to-long v11, v7
    const-wide v13, 0xffffffffL
    and-long v11, v11, v13
    array-length v10, v1
    int-to-long v13, v10
    rem-long v11, v11, v13
    long-to-int v10, v11
    aget-byte v10, v1, v10
    aput-byte v10, $outReg, v4
    add-int/lit8 v9, v9, $stepI
    add-int/lit8 v3, v3, $stepA
    add-int/lit8 v4, v4, 0x1
    goto :${tag}_pick
    :${tag}_done
""".trimIndent()

/**
 * Emits a raw AES/CBC/NoPadding decrypt of v0 into v15 with key/iv regs,
 * followed by the native helper's padding handling: a valid PKCS#7 tail
 * (last byte 1..16, repeated) is stripped, while any other tail is left
 * untouched. The stock native code decrypts CBC manually and does not
 * require PKCS#7 — the live content payloads are space-padded, so a
 * PKCS5Padding cipher rejects them in doFinal even with the right key.
 */
private fun aesDecryptSmali(keyReg: String, ivReg: String, tag: String): String = """
    new-instance v9, Ljavax/crypto/spec/SecretKeySpec;
    const-string v4, "AES"
    invoke-direct {v9, $keyReg, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V
    new-instance v14, Ljavax/crypto/spec/IvParameterSpec;
    invoke-direct {v14, $ivReg}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V
    const-string v3, "AES/CBC/NoPadding"
    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;
    move-result-object v4
    const/4 v3, 0x2
    invoke-virtual {v4, v3, v9, v14}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    invoke-virtual {v4, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B
    move-result-object v15
    array-length v3, v15
    if-lez v3, :${tag}_done
    add-int/lit8 v4, v3, -0x1
    aget-byte v7, v15, v4
    shl-int/lit8 v7, v7, 0x18
    ushr-int/lit8 v7, v7, 0x18
    if-lez v7, :${tag}_done
    const/16 v8, 0x10
    if-gt v7, v8, :${tag}_done
    if-gt v7, v3, :${tag}_done
    sub-int v4, v3, v7
    const/4 v8, 0x0
    :${tag}_check
    if-ge v8, v7, :${tag}_strip
    add-int v9, v4, v8
    aget-byte v10, v15, v9
    if-ne v10, v7, :${tag}_done
    add-int/lit8 v8, v8, 0x1
    goto :${tag}_check
    :${tag}_strip
    move v3, v4
    invoke-static {v15, v3}, Ljava/util/Arrays;->copyOf([BI)[B
    move-result-object v15
    :${tag}_done
""".trimIndent()

/**
 * Emits a strict UTF-8 decode of v15 into v1; v3 receives the length.
 * The decoded text is truncated at the first NUL character because the
 * native decoder returns it through `NewStringUTF`, whose C-string input
 * ends there (relevant only to zero-padded plaintext; current payloads
 * are PKCS- or space-padded).
 */
private fun strictUtf8Smali(tag: String): String = """
    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
    invoke-virtual {v3}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;
    move-result-object v3
    sget-object v4, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;
    invoke-virtual {v3, v4}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;
    move-result-object v3
    invoke-virtual {v3, v4}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;
    move-result-object v3
    invoke-static {v15}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;
    move-result-object v4
    invoke-virtual {v3, v4}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;
    move-result-object v4
    invoke-virtual {v4}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;
    move-result-object v1
    const/4 v4, 0x0
    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(I)I
    move-result v4
    if-ltz v4, :${tag}_no_nul
    const/4 v3, 0x0
    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v1
    :${tag}_no_nul
    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v3
""".trimIndent()

/**
 * Pure-Java port of the `libnative-lib.so` decoder (`ohMyYes`).
 * Key and IV are two 16-byte values derived by an FNV-1a-seeded hash chain
 * over the signer string T, with bytes drawn from a character pool — the
 * app's rotation string when provided, otherwise a built-in default pool.
 * Payload is Base64(AES-128-CBC ciphertext); on failure a hardcoded
 * fallback key/IV is tried, and the result must be valid non-empty UTF-8.
 * Returns "" on any failure (never null), like the native decoder.
 */
private fun ohMyYesSmali(): String = """
    const/4 v0, 0x0
    move-object/from16 v5, p0
    move-object/from16 v6, p1
    if-eqz v5, :empty_out
    if-eqz v6, :pool_default
    invoke-virtual {v6}, Ljava/lang/String;->length()I
    move-result v3
    if-lez v3, :pool_default
    sget-object v9, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
    invoke-virtual {v6, v9}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
    move-result-object v1
    goto :pool_done
    :pool_default
    const-string v15, "$DEFAULT_POOL_STRING"
    sget-object v9, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
    invoke-virtual {v15, v9}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
    move-result-object v1
    :pool_done
    const-string v15, "$CERT_T_STRING"
    sget-object v9, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
    invoke-virtual {v15, v9}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
    move-result-object v2
    const/4 v3, 0x0
    invoke-static {v5, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
    move-result-object v0
    if-eqz v0, :empty_out
    array-length v3, v0
    if-lez v3, :empty_out
    const/16 v3, 0x10
    new-array v5, v3, [B
    new-array v6, v3, [B
    ${fnvDeriveSmali("k", "-0x7ee3623b", 31, 1, 13, "v5")}
    ${fnvDeriveSmali("i", "-0x7ee37cd6", 29, 3, 7, "v6")}
    ${aesDecryptSmali("v5", "v6", "p1")}
    ${strictUtf8Smali("p1")}
    if-lez v3, :fb
    return-object v1
    :fb
    nop
    if-eqz v0, :empty_out
    const-string v15, "$FALLBACK_KEY"
    sget-object v9, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
    invoke-virtual {v15, v9}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
    move-result-object v5
    const-string v15, "$FALLBACK_IV"
    sget-object v9, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
    invoke-virtual {v15, v9}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
    move-result-object v6
    ${aesDecryptSmali("v5", "v6", "p2")}
    ${strictUtf8Smali("p2")}
    if-lez v3, :empty_out
    return-object v1
    :empty_out
    const-string v1, ""
    return-object v1
""".trimIndent()

// ============================================================================
// Helper — copied verbatim from the SK Tech / CricZ family.
// Replaces [this] method inside [owner] with a fresh MutableMethodImplementation
// compiled from [smaliBody], cleanly discarding any old try/catch blocks or
// native flags.
// ============================================================================

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
