package app.morphe.patches.google.common.versions

import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.TargetSpec

private val previous = google177620.hooks

val google177814 = google177620.copy(
    versionName = "17.78.14.ve.arm64",
    versionCode = "301841514",
    inputSha256 = mapOf("google-base.apk" to "f000dcd91d81a448904c0284f985b443e05f34d4f96aecb8d5f3cb6d81f121de"),
    validation = listOf(
        "2026-11-26: Google-signed nodpi standalone APK, minSdk 30; DexKit candidates checked against DEX",
        "2026-11-26: default MPP applied; clone contract and haptic call sites verified",
        "2026-11-26: API 31 and 37 emulators accepted an in-place update and retained the disabled haptic setting",
        "2026-11-26: both emulators reached Gemini sign-in; authenticated chat and Samsung Secure Folder remain unverified"
    ),
    hooks = previous - HookId.GEMINI_HAPTICS_COMPOSE + mapOf(
        HookId.DEVICE_COMPLIANCE_FEATURE to previous.getValue(HookId.DEVICE_COMPLIANCE_FEATURE).copy(
            className = "Ldydo;"
        ),
        HookId.DEVICE_COMPLIANCE_REDIRECT to previous.getValue(HookId.DEVICE_COMPLIANCE_REDIRECT).copy(
            className = "Ldydm;"
        ),
        HookId.WORK_PROFILE_BYPASS to previous.getValue(HookId.WORK_PROFILE_BYPASS).copy(
            className = "Lahty;", methodName = "w",
            methodDescriptor = "(Lcom/google/apps/tiktok/account/AccountId;Lhmwl;)Ljava/lang/Object;",
            integers = mapOf("lookback" to 60, "branchIndex" to 135, "branchRegister" to 13,
                "branchTargetCodeUnit" to 365, "observedRegisters" to 14),
            description = "The guard is IF_EQZ v13 at code unit 249, immediately after the mask; the next IF_EQZ belongs to the nullable Boolean."
        ),
        HookId.WORK_PROFILE_ELIGIBILITY to previous.getValue(HookId.WORK_PROFILE_ELIGIBILITY).copy(
            className = "Lapmx;", methodDescriptor = "(Lhmwl;)Ljava/lang/Object;"
        ),
        HookId.MICROG_RUNTIME_PERMISSIONS to previous.getValue(HookId.MICROG_RUNTIME_PERMISSIONS).copy(
            integers = mapOf(
                "minRegisters" to 26, "maxRegisters" to 26, "observedRegisters" to 26,
                "activityAlias" to 0, "thisParameterOffset" to 2,
                "scratchArray" to 6, "scratchIndex" to 7, "scratchString" to 8
            ),
            description = "Insert after the final IPUT_BOOLEAN o:Z at code unit 895 while v0 still contains the Activity."
        ),
        HookId.PROCESS_NAME_REDIRECT to previous.getValue(HookId.PROCESS_NAME_REDIRECT).copy(className = "Leolh;"),
        HookId.MAIN_PROCESS_CHECK to previous.getValue(HookId.MAIN_PROCESS_CHECK).copy(
            className = "Leold;",
            description = "The anchor is in eold.a; eold.b compares the provider's result against the main process name."
        ),
        HookId.GMS_SIGNATURE_BYPASS to previous.getValue(HookId.GMS_SIGNATURE_BYPASS).copy(className = "Ldklf;"),
        HookId.GMS_CERTIFICATE_VERIFIER to previous.getValue(HookId.GMS_CERTIFICATE_VERIFIER).copy(className = "Ldklg;"),
        HookId.GEMINI_HAPTICS to previous.getValue(HookId.GEMINI_HAPTICS).copy(
            className = "Lcbuy;",
            methodDescriptor = "(Lawuh;Landroidx/preference/PreferenceScreen;Lhmwl;)Ljava/lang/Object;",
            methodSignatures = listOf(
                "Lbvku;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbvkv;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbvkc;->a(Lbvju;)V",
                "Lbvnq;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z",
                "Lbvns;->c(Landroid/view/View;Z)V",
                "Lcbfv;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbvuj;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z",
                "Lbpza;->i(Lbpzm;Landroid/graphics/Point;Lhmyt;Laytl;Lbisc;)Z",
                "Lcom/google/android/apps/search/assistant/surfaces/voice/robin/ui/extensions/mediagen/editor/ui/views/EditorCanvasView;->g(Lcom/google/android/apps/search/assistant/surfaces/voice/robin/ui/extensions/mediagen/editor/ui/views/EditorCanvasView;)Lhmtm;",
                "Lcfkf;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lcfkh;->f()V",
                "Lcfkh;->g()V",
                // Guided prompt interactions.
                "Lcbch;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lcbcl;->invoke()Ljava/lang/Object;",
                "Lcbct;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lcbda;->invoke()Ljava/lang/Object;",
                "Lcbdy;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lcbea;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lcbeb;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                "Lcbek;->invoke()Ljava/lang/Object;",
                // Home and suggested prompt interactions.
                "Lbwwv;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbwxv;->invoke()Ljava/lang/Object;",
                "Lbwyk;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbwym;->invoke()Ljava/lang/Object;",
                "Lbwyo;->invoke()Ljava/lang/Object;",
                "Lbwyw;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbwzs;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lchip;->invoke()Ljava/lang/Object;"
            ),
            expectedMatches = 39
        ),
        HookId.GEMINI_HAPTICS_VIBRATOR to TargetSpec(
            anchorStrings = listOf("Ma-HapticsPlayer-Impl", "Playing haptic feedback"),
            methodSignatures = listOf(
                "Latuo;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbnvg;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbnvj;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lavmz;->b(Lavmp;Lhmwl;)Ljava/lang/Object;"
            ),
            values = mapOf("vibrateReference" to
                "Lavk\$\$ExternalSyntheticApiModelOutline0;->m(Landroid/os/Vibrator;Landroid/os/VibrationEffect;)V"),
            expectedMatches = 4,
            description = "Gate the chat waveform player plus Live and Gemini feedback-report cues."
        ),
        HookId.GEMINI_HAPTICS_SETTINGS_LIST to TargetSpec(
            anchorStrings = listOf("RobinSettingsPreferenceFragment: watermark setting switch listener."),
            methodSignatures = listOf(
                "Lcbuy;->j(Landroidx/preference/PreferenceGroup;Lhmwl;)Ljava/lang/Object;",
                "Lcbyb;->J(Landroidx/preference/PreferenceGroup;Lhmwl;)Ljava/lang/Object;"
            ),
            values = mapOf(
                "composeGroup" to "cbvy", "rowsField" to "J", "keyField" to "s",
                "persistentField" to "w", "listenerField" to "n", "listenerDescriptor" to "Lrpd;",
                "setChecked" to "k"
            ),
            expectedMatches = 2,
            description = "Insert a switch before the media watermark row in both native and Compose settings builders."
        )
    )
)
