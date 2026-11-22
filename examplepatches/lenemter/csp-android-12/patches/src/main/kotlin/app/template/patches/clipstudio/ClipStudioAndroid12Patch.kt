package app.template.patches.clipstudio

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_CLIP_STUDIO

@Suppress("unused")
val clipStudioAndroid12Patch = patch(
    name = "Clip Studio Paint Android 12 Compatibility",
    description = "Enables Clip Studio Paint 5.1.4 to run on Android 12 (API 31) by backporting API 33+ calls and fixing resource crashes.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CLIP_STUDIO)

    dependsOn(cspAndroid12ResourcePatch)

    execute {
        // 1. PWLegacyJniBuildAndroid.getVersionSdkInt() -> return 33 (0x21) so native engine passes checks
        PWLegacyBuildFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x21
                return v0
            """
        )

        // 2. ProfileVerifier$Api33Impl.getPackageInfo() -> call backwards-compatible getPackageInfo(pkg, 0)
        ProfileVerifierApi33Fingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                move-result-object p1
                const/4 v0, 0x0
                invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
                move-result-object p0
                return-object p0
            """
        )

        // 3. AFg1fSDK.w_() -> call backwards-compatible getPackageInfo(pkg, 0)
        AFg1fSDKFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
                move-result-object p0
                const-string p1, ""
                invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
                return-object p0
            """
        )

        // 4. AFj1tSDK.C_() -> call backwards-compatible resolveContentProvider(String, 0)
        AFj1tSDKFingerprint.method.addInstructions(
            0,
            """
                :try_start_0
                invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
                move-result-object p0
                const-string v0, "com.huawei.appmarket.commondata"
                const/4 v1, 0x0
                invoke-virtual {p0, v0, v1}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;
                move-result-object p0
                return-object p0
                :try_end_0
                .catchall {:try_start_0 .. :try_end_0} :catchall_0
                :catchall_0
                const/4 p0, 0x0
                return-object p0
            """
        )

        // 5. FirebaseApp.getInstance() -> replace Process.myProcessName() (API 33) with ProcessUtils.getMyProcessName()
        val index = FirebaseProcessFingerprint.instructionMatches.first().index
        FirebaseProcessFingerprint.method.replaceInstruction(
            index,
            "invoke-static {}, Lcom/google/android/gms/common/util/ProcessUtils;->getMyProcessName()Ljava/lang/String;"
        )
    }
}
