package app.morphe.patches.google.common.versions

import app.morphe.patches.google.common.AppVersionProfile
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.TargetSpec

/** Verified against these exact inputs. Retain this file when adding another version. */
val google175418 = AppVersionProfile(
    appName = "Google App (AGSA)",
    packageName = "com.google.android.googlequicksearchbox",
    versionName = "17.54.18.ve.arm64",
    versionCode = "301800642",
    inputSha256 = mapOf(
        "google-base.apk" to "ec2483a9dea3786e23f68012059bc00d5a4593a7f7189c758e57eaa29dfb2325",
        "google-xxhdpi.apk" to "772c1b02579a8f04316b585024128b655af8a32ee25e775c2cfa5a5bae122a9f"
    ),
    validation = listOf(
        "2026-09-06: SM-S948Q, microG 7.0.0, user 0 chat and process restart verified",
        "2026-09-06: user 150 eligibility logs and user-confirmed Secure Folder success",
        "MainActivity branches and appk.k single-instruction replacement verified"
    ),
    hooks = mapOf(
        HookId.WORK_PROFILE_BYPASS to TargetSpec(
            className = "Laiwk;", methodName = "f",
            methodDescriptor = "(Lfnbp;Lgtij;)Ljava/lang/Object;",
            anchorStrings = listOf(
                "Trampolining to web app for work profile. %s",
                "Skipping trampoline to web app for work profile."
            ),
            expectedMatches = 2,
            integers = mapOf("lookback" to 60, "observedRegisters" to 53),
            description = "Both fingerprints resolve the same method; preserve the existing two insertions. Old Lauby.a record was incorrect."
        ),
        HookId.WORK_PROFILE_ELIGIBILITY to TargetSpec(
            className = "Lappk;", methodName = "k",
            methodDescriptor = "(Lgtij;)Ljava/lang/Object;",
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
                "minRegisters" to 11, "maxRegisters" to 17, "observedRegisters" to 13,
                "thisParameterOffset" to 2, "scratchArray" to 6, "scratchIndex" to 7, "scratchString" to 8
            ),
            description = "Insert after final IPUT_BOOLEAN o:Z while p0 is Activity, before trace cleanup. Never insert at return."
        ),
        HookId.PROCESS_NAME_REDIRECT to TargetSpec(
            className = "Leacx;", methodName = "b", methodDescriptor = "()Ljava/lang/String;",
            anchorStrings = listOf("com.google.android.googlequicksearchbox:googleapp"),
            expectedMatches = 2,
            description = "Two provider return sites; strip .morphe only for the compiled Dagger process-name switch."
        ),
        HookId.MAIN_PROCESS_CHECK to TargetSpec(
            className = "Leact;", methodName = "b", methodDescriptor = "()Z",
            anchorStrings = listOf("More than 1 custom main process specified"),
            expectedMatches = 1,
            description = "Anchor is in eact.a; patch provider call inside eact.b to Application.getProcessName."
        ),
        HookId.GMS_SIGNATURE_BYPASS to TargetSpec(
            className = "Lcwfs;", methodName = "b", methodDescriptor = "(Landroid/content/Context;I)I",
            anchorStrings = listOf(
                " requires Google Play services, but their signature is invalid.",
                "The Google Play services resources were not found. Check your project configuration to ensure that the resources are included.",
                " requires Google Play services, but they are missing."
            ),
            expectedMatches = 1
        ),
        HookId.GMS_CERTIFICATE_VERIFIER to TargetSpec(
            className = "Lcwft;",
            anchorStrings = listOf("Unable to obtain package certificate history."),
            methodSignatures = listOf("b(Ljava/lang/String;)Z", "c(I)Z", "d(Landroid/content/pm/PackageInfo;Z)Z"),
            expectedMatches = 3
        ),
        HookId.GMS_CORE_REDIRECT to TargetSpec(
            anchorStrings = listOf("com.google.android.gms"),
            values = mapOf("originalGoogleSha1" to "38918a453d07199354f8b19af05ec6562ced5788"),
            description = "microG 7.0.0 app.revanced.android.gms; retain Binder service actions, redirect UI actions. Shared mappings: GmsConstants.kt."
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
