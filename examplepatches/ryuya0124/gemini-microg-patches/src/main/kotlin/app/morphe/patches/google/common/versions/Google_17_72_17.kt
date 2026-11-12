package app.morphe.patches.google.common.versions

import app.morphe.patches.google.common.AppVersionProfile
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.TargetSpec

/** Verified against these exact inputs. Retain this file when adding another version. */
val google177217 = AppVersionProfile(
    appName = "Google App (AGSA)",
    packageName = "com.google.android.googlequicksearchbox",
    versionName = "17.72.17.ve.arm64",
    versionCode = "301831138",
    inputSha256 = mapOf(
        "google-base.apk" to "0ecc808f0d4b842f2466e81dfe22a5f1d4ac3ffb66b09d9b7ab204d647711252",
        "google-xxhdpi.apk" to "b886739754516ef87811a16561fb5494e3fec2f087aa21ac93d54d7dafdcbf7d"
    ),
    validation = listOf(
        "2026-11-10: extracted installed original APK; DEX target inspection completed",
        "2026-11-10: APK/DEX/MPP verification completed; Secure Folder send/response confirmation pending",
        "2026-11-12: API36 emulator shell UID2000: original Google coexistence, Lens permission-gate before/after and clone launcher routing verified; no account/chat test",
        "2026-11-12: actual APK first-call/cached/seeded process-name paths verified; old widget receiver DI crash reproduced and fixed"
    ),
    hooks = mapOf(
        HookId.DEVICE_COMPLIANCE_FEATURE to TargetSpec(
            className = "Lduhm;", methodName = "a", methodDescriptor = "(Lhikx;Lhikx;)V",
            anchorStrings = listOf("Checking for device compliance...", "Feature is disabled!"), expectedMatches = 1,
            description = "Select existing feature-disabled path, including native component-reset recovery. Server integrity state unchanged."
        ),
        HookId.DEVICE_COMPLIANCE_REDIRECT to TargetSpec(
            className = "Lduhk;", methodName = "invoke", methodDescriptor = "()Ljava/lang/Object;",
            anchorStrings = listOf("Redirecting to UncertifiedDeviceActivity."), expectedMatches = 1,
            description = "Skip only the local warning-launch branch; does not certify the device or change server integrity results."
        ),
        HookId.WORK_PROFILE_BYPASS to TargetSpec(
            className = "Lajiy;", methodName = "t",
            methodDescriptor = "(Lcom/google/apps/tiktok/account/AccountId;Lhiiq;)Ljava/lang/Object;",
            anchorStrings = listOf(
                "Trampolining to web app for work profile. %s",
                "Skipping trampoline to web app for work profile."
            ),
            expectedMatches = 1,
            integers = mapOf("lookback" to 60, "branchIndex" to 146, "branchRegister" to 14, "branchTargetCodeUnit" to 392, "observedRegisters" to 15),
            description = "Only the trampoline anchor remains. IF_EQZ v14 at code unit 264 jumps to 392; nearest IF_EQZ v2 is a nullable Boolean check and MUST NOT be patched. Secondary skip anchor is absent."
        ),
        HookId.WORK_PROFILE_ELIGIBILITY to TargetSpec(
            className = "Laqvf;", methodName = "k",
            methodDescriptor = "(Lhiiq;)Ljava/lang/Object;",
            fieldName = "x", fieldType = "Z",
            anchorStrings = listOf(
                "Robin eligibility : is disallowed on Work profile",
                "Robin eligibility : Work profile is allowed."
            ),
            expectedMatches = 1,
            integers = mapOf("errorCode" to 19),
            description = "Replace IGET_BOOLEAN with same-width const/16 true; retain other eligibility checks."
        ),
        HookId.MICROG_RUNTIME_PERMISSIONS to TargetSpec(
            className = "Lcom/google/android/apps/search/assistant/surfaces/voice/robin/main/MainActivity;",
            methodName = "onCreate", methodDescriptor = "(Landroid/os/Bundle;)V",
            fieldName = "o", fieldType = "Z", expectedMatches = 1,
            integers = mapOf(
                "minRegisters" to 23, "maxRegisters" to 23, "observedRegisters" to 23,
                "activityAlias" to 0,
                "thisParameterOffset" to 2, "scratchArray" to 6, "scratchIndex" to 7, "scratchString" to 8
            ),
            description = "Insert after final IPUT_BOOLEAN o:Z (code unit 811); v0 aliases Activity. v3/v19 remain live for cleanup, scratch v6/v7/v8 are dead."
        ),
        HookId.PROCESS_NAME_REDIRECT to TargetSpec(
            className = "Lekjg;", methodName = "b", methodDescriptor = "()Ljava/lang/String;",
            anchorStrings = listOf("com.google.android.googlequicksearchbox:googleapp"),
            expectedMatches = 1,
            description = "One provider return site; strip .morphe only for the compiled Dagger process-name switch."
        ),
        HookId.MAIN_PROCESS_CHECK to TargetSpec(
            className = "Lekjc;", methodName = "b", methodDescriptor = "()Z",
            anchorStrings = listOf("More than 1 custom main process specified"),
            expectedMatches = 1,
            description = "Anchor is in eipj.a; patch provider call inside eipj.b to Application.getProcessName."
        ),
        HookId.GMS_SIGNATURE_BYPASS to TargetSpec(
            className = "Ldgov;", methodName = "b", methodDescriptor = "(Landroid/content/Context;I)I",
            anchorStrings = listOf(
                " requires Google Play services, but their signature is invalid.",
                "The Google Play services resources were not found. Check your project configuration to ensure that the resources are included.",
                " requires Google Play services, but they are missing."
            ),
            expectedMatches = 1
        ),
        HookId.GMS_CERTIFICATE_VERIFIER to TargetSpec(
            className = "Ldgow;",
            anchorStrings = listOf("Unable to obtain package certificate history."),
            methodSignatures = listOf("b(Ljava/lang/String;)Z", "c(I)Z", "d(Landroid/content/pm/PackageInfo;Z)Z"),
            expectedMatches = 3
        ),
        HookId.GMS_CORE_REDIRECT to TargetSpec(
            anchorStrings = listOf("com.google.android.gms"),
            values = mapOf("originalGoogleSha1" to "38918a453d07199354f8b19af05ec6562ced5788"),
            description = "microG 7.3.0 app.revanced.android.gms; retain Binder service actions, redirect UI actions. Shared mappings: GmsConstants.kt."
        ),
        HookId.PACKAGE_CLONE_REDIRECT to TargetSpec(
            anchorStrings = listOf("com.google.android.googlequicksearchbox"),
            description = "Observed 156 exact-package substitutions across 144 classes; count can depend on other enabled patches."
        ),
        HookId.SPLIT_RESTRICTION_REMOVAL to TargetSpec(description = "Remove manifest split requirements; resource split still needs package rename/signing."),
        HookId.APP_LABEL_UPDATE to TargetSpec(description = "Google (Morphe)"),
        HookId.ACCOUNT_SWITCH_LOCK_BYPASS to TargetSpec(
            enabled = false, anchorStrings = listOf("Acquired account-switch Mutex."),
            description = "Historical rejected approach. Do not enable; normal account synchronization is required."
        ),
        HookId.ACCOUNT_SYNC_LOOP_FIX to TargetSpec(
            enabled = false, anchorStrings = listOf("Binding to service"),
            description = "Historical rejected Binder-success spoof; caused hangs."
        ),
        HookId.ACCOUNT_CONVERT_FALLBACK to TargetSpec(
            enabled = false, className = "Lfyca;",
            anchorStrings = listOf("Found google email address as the old primary email address", "Failed to convert AGSA account name to account id."),
            description = "Historical unverified helper name. Fixed AccountId=1 broke token acquisition; never use for a new version."
        )
    )
)
