package app.diskwala.patches.update

import app.diskwala.patches.shared.Constants.COMPATIBILITY_DISKWALA
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * DiskWala 26.9 PairIP / forced-update bypass.
 *
 * Background:
 *  - DiskWala 26.9 uses PairIP's VM only for two methods:
 *      DiskWalaApp.onCreate()V and MainActivity.onCreate(Bundle)V.
 *  - PairIP's StartupLauncher normally decrypts/dispatches those methods into
 *    the VM. On a repackaged APK the keys do not exist, so the VM path is dead.
 *  - This patch neutralizes the VM/license checks and reconstructs the two
 *    entry points from the real, non-obfuscated app classes.
 *
 * The reconstruction intentionally does NOT try to run the PairIP VM at all.
 */
@Suppress("unused")
val disableForceUpdatePatch = bytecodePatch(
    name = "Disable forced update",
    description = "Bypasses PairIP signature/license checks, prevents the PairIP VM from starting, and reconstructs the native app entry points so DiskWala 26.9 can launch as a sideloaded APK.",
    default = true
) {
    compatibleWith(COMPATIBILITY_DISKWALA)

    execute {
        fun MutableMethod.replaceBody(smali: String) {
            val count = implementation?.instructions?.count()
                ?: error("Method ${definingClass}->${name} has no implementation")
            removeInstructions(0, count)
            addInstructions(0, smali)
        }

        /**
         * Replace a PairIP-hoisted string read (sget-object into a String field)
         * with the original literal. Looking the instruction up by field
         * reference avoids brittle hard-coded instruction indices.
         */
        fun MutableMethod.restoreHoistedString(
            fieldClass: String,
            fieldName: String,
            literal: String,
        ) {
            val instructions = implementation?.instructions
                ?: error("Method ${definingClass}->${name} has no implementation")
            val index = instructions.indexOfFirst { instruction ->
                instruction is BuilderInstruction21c &&
                    instruction.opcode == Opcode.SGET_OBJECT &&
                    (instruction.reference as? FieldReference)?.let { reference ->
                        reference.definingClass == fieldClass && reference.name == fieldName
                    } == true
            }
            require(index >= 0) {
                "Could not find ${fieldClass}->${fieldName} in ${definingClass}->${name}"
            }
            val register = (instructions[index] as BuilderInstruction21c).registerA
            val escaped = literal.replace("\\", "\\\\").replace("\"", "\\\"")
            replaceInstruction(index, "const-string v$register, \"$escaped\"")
        }

        // ---------------------------------------------------------------
        // 1. PairIP startup / VM
        // ---------------------------------------------------------------
        // The base Application <clinit> calls StartupLauncher.launch(). If the
        // VM starts it will try to find the PairIP key and abort the process.
        StartupLauncherLaunchFingerprint.method.addInstructions(0, "return-void")

        // Any remaining VM dispatch must not execute the encrypted programs.
        VMRunnerInvokeFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
        VMRunnerSetContextFingerprint.method.addInstructions(0, "return-void")

        // ---------------------------------------------------------------
        // 2. PairIP signature / license checks
        // ---------------------------------------------------------------
        // PairIP's factory takes the "key present" branch when
        // isEncryptionKeyPresent() returns true, which instantiates the normal
        // components through the original CoreComponentFactory. Returning false
        // selects the empty KeyImportPlaceholderApplication instead.
        KeyImportAppComponentFactoryIsEncryptionKeyPresentFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // PairIP also hoists a handful of SDK string constants into static
        // fields of per-SDK container classes, which only its VM initializes.
        // Restore the literals that are needed during startup.
        //
        // Firebase's GA-tracking resource name.
        FirebaseOptionsFromResourceFingerprint.method.restoreHoistedString(
            "LO4/ls/JYRhGXgRiELe;",
            "XqdS",
            "google_analytics_default_bbq"
        )

        // kotlinx.coroutines' pb/n first AtomicReferenceFieldUpdater field name.
        CoroutinesNodeClinitFingerprint.method.restoreHoistedString(
            "Lcom/bytedance/sdk/openadsdk/api/nativeAd/EMzj/VkNhloVfEgieu;",
            "QosRoxYPVDnPNy",
            "_next\$volatile"
        )

        // kotlinx.serialization's Int serializer descriptor name. Without it,
        // the Int serializer is constructed with a null name and any deep link
        // (or other JSON payload) containing an integer crashes on use.
        KotlinxIntSerializerClinitFingerprint.method.restoreHoistedString(
            "Lsg/bigo/ads/D0/KtJJ/DUatbAc;",
            "PLljvZLKm",
            "kotlin.Int"
        )

        // GMS measurement's reserved-parameter list entry.
        GmsMeasurementParamsClinitFingerprint.method.restoreHoistedString(
            "Lcom/bytedance/sdk/openadsdk/api/nativeAd/EMzj/VkNhloVfEgieu;",
            "JEnwGbUObiYydw",
            "_exp_expire"
        )

        // WorkManager's SystemJobScheduler log tag.
        WorkManagerSystemJobSchedulerClinitFingerprint.method.restoreHoistedString(
            "Landroidx/work/ktx/IK/kWcjtONMFWQh;",
            "UzdJpOt",
            "SystemJobScheduler"
        )

        // Room's closing SQL quote after the identity hash.
        RoomOpenHelperWriteIdentityFingerprint.method.restoreHoistedString(
            "Lsg/bigo/ads/m/aAW/dwdcYK;",
            "tex",
            "')"
        )

        // Tink's AES/CTR encryptor's SecretKeySpec algorithm name.
        TinkAesCtrEncryptFingerprint.method.restoreHoistedString(
            "LJ0/LGb/qrZMAWujkbQCj;",
            "sNeBhDwultzP",
            "AES"
        )

        // OkHttp's header-name table entry between "if-range" and
        // "last-modified".
        OkHttpHeadersClinitFingerprint.method.restoreHoistedString(
            "LO4/ls/JYRhGXgRiELe;",
            "SYAiXwuc",
            "if-unmodified-since"
        )

        // OkHttp's status-line parser falls back to an empty message when the
        // reason phrase is absent. HTTP/2 always synthesizes a status line
        // without one, so leaving this null makes every HTTP/2 response fail
        // inside Response.Builder.build().
        OkHttpStatusLineParseFingerprint.method.restoreHoistedString(
            "Lio/bidmachine/iab/vast/tags/wDdE/OYbzy;",
            "mJqkALtRtTQ",
            ""
        )

        SignatureCheckVerifyIntegrityFingerprint.method.addInstructions(0, "return-void")
        SignatureCheckVerifySignatureMatchesFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        LicenseClientCheckLicenseFingerprint.method.addInstructions(0, "return-void")
        LicenseClientInitializeLicenseCheckFingerprint.method.addInstructions(0, "return-void")
        LicenseClientRetryOrThrowFingerprint.method.addInstructions(0, "return-void")
        LicenseClientRetryOrThrowWithFlagsFingerprint.method.addInstructions(0, "return-void")

        // The license activities are never allowed to show a blocking dialog.
        LicenseActivityShowErrorDialogFingerprint.method.addInstructions(0, "return-void")
        LicenseActivityShowPaywallFingerprint.method.addInstructions(0, "return-void")

        // ---------------------------------------------------------------
        // 3. PairIP Application.attachBaseContext
        // ---------------------------------------------------------------
        // The original body calls VMRunner.setContext, SignatureCheck,
        // LicenseClient and then an invoke-super that points at itself in the
        // protected dex. Replace it with the real Application super call.
        PairIPApplicationAttachBaseContextFingerprint.method.replaceBody(
            """
                invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V
                return-void
            """
        )

        // ---------------------------------------------------------------
        // 4. DiskWalaApp.onCreate
        // ---------------------------------------------------------------
        // Directly chain to the base Koin/Hilt application class. This is the
        // body the PairIP VM program used to invoke.
        DiskWalaAppOnCreateFingerprint.method.replaceBody(
            """
                invoke-super {p0}, Ll5/n;->onCreate()V
                return-void
            """
        )

        // ---------------------------------------------------------------
        // 5. MainActivity.onCreate
        // ---------------------------------------------------------------
        // Hilt field injection (MainActivity.s/t/u), then the real Compose
        // content lambda (c5/p1 case 1), exactly what the app's own root
        // composition expects.
        MainActivityOnCreateFingerprint.method.replaceBody(
            """
                invoke-super {p0, p1}, Lcom/diskwalaapp/app/Hilt_MainActivity;->onCreate(Landroid/os/Bundle;)V

                invoke-virtual {p0}, Lcom/diskwalaapp/app/Hilt_MainActivity;->h()Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Ll5/d;
                invoke-virtual {v0, p0}, Ll5/d;->a(Lcom/diskwalaapp/app/MainActivity;)V

                new-instance v0, LN0/B0;
                invoke-direct {v0, p0}, LN0/B0;-><init>(Landroid/content/Context;)V

                new-instance v1, Lc5/p1;
                const/4 v2, 0x1
                invoke-direct {v1, p0, v2}, Lc5/p1;-><init>(Ljava/lang/Object;I)V
                invoke-virtual {v0, v1}, LN0/B0;->setContent(LZa/p;)V

                invoke-virtual {p0, v0}, Lcom/diskwalaapp/app/MainActivity;->setContentView(Landroid/view/View;)V
                return-void
            """
        )

        // ---------------------------------------------------------------
        // 6. Launch state fallback
        // ---------------------------------------------------------------
        // LaunchState(launchReady, isPremium, adUnits, updateRequired,
        //             adsGateSettled, deviceCheck, refusal, postIdentityRuns)
        //
        // Every state update funnels through the 9-arg constructor, but the
        // one-arg constructor is the initial/fallback state used before the
        // network responds. Force it to a ready, premium, no-update state.
        LaunchStateConstructorIntFingerprint.method.replaceBody(
            """
                const/4 v1, 0x1
                const/4 v2, 0x1
                sget-object v3, Lj5/h;->I:Lj5/h;
                const/4 v4, 0x0
                const/4 v5, 0x1
                sget-object v6, LA5/p;->b:LA5/p;
                sget-object v7, LA5/q;->e:LA5/q;
                const/4 v8, 0x0
                move-object v0, v9
                invoke-direct/range {v0 .. v8}, LA5/f0;-><init>(ZZLj5/h;ZZLA5/p;LA5/q;I)V
                return-void
            """
        )

        // Every LaunchState update is copied through the canonical constructor.
        // Force updateRequired to false and the device-check enum to OK there so
        // a server update check or attestation failure (RETRY/UNSUPPORTED) can
        // never lock the main UI behind the update or "Still checking your
        // device" screen.
        LaunchStateConstructorFingerprint.method.addInstructions(
            0,
            """
                const/4 v5, 0x0
                sget-object v7, LA5/p;->b:LA5/p;
            """
        )

        // The root composable keeps the main UI behind a "session ready"
        // StateFlow. That flow is only set after the server-backed anonymous
        // session/attestation completes, which cannot happen on a repackaged
        // build, so expose an already-true flow while keeping the session
        // manager reference intact for the rest of the UI.
        SessionGateViewModelConstructorFingerprint.method.replaceBody(
            """
                const-string v0, "sessionManager"
                invoke-static {v2, v0}, Lkotlin/jvm/internal/n;->f(Ljava/lang/Object;Ljava/lang/String;)V
                invoke-direct {v1}, Landroidx/lifecycle/U;-><init>()V
                iput-object v2, v1, LA5/Y0;->b:Ln5/d;
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-static {v0}, Lnb/p0;->a(Ljava/lang/Object;)Lnb/o0;
                move-result-object v0
                iput-object v0, v1, LA5/Y0;->c:Lnb/o0;
                return-void
            """
        )
    }
}
