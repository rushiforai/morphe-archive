package app.morphe.patches.google.common.versions

import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.TargetSpec

private val previous = google177217.hooks

val google177620 = google177217.copy(
    versionName = "17.76.20.ve.arm64",
    versionCode = "301838242",
    inputSha256 = mapOf(
        "google-base.apk" to "4e36a04c15fac7fbcbac19bb01783a37391c324498e937cc78b876c0d12b54ae",
        "google-xxhdpi.apk" to "579c60128a50b59deaa47e32cfcdf48f1cdb599503cc0aa40eff242968ae5a28"
    ),
    validation = listOf(
        "2026-11-26: exact Play Store split variant extracted from a Google-signed installation; default MPP applied",
        "2026-11-26: API 37 emulator installed the base plus four splits; Gemini launched to sign-in",
        "2026-11-26: AndroidX switch deduplication, haptic delegation, suppression and process restart exercised in the APK",
        "Authenticated chat, Secure Folder and the conversation warning hook remain unverified for this version"
    ),
    hooks = previous - HookId.CONVERSATION_UPDATE_WARNING + mapOf(
        HookId.DEVICE_COMPLIANCE_FEATURE to previous.getValue(HookId.DEVICE_COMPLIANCE_FEATURE).copy(
            className = "Ldvde;", methodName = "c", methodDescriptor = "()Z",
            anchorStrings = listOf("Feature is disabled!"),
            integers = mapOf("branchDistance" to 2),
            description = "Feature-disabled logging and the negated flag moved into c(); verify the XOR and branch before editing."
        ),
        HookId.DEVICE_COMPLIANCE_REDIRECT to previous.getValue(HookId.DEVICE_COMPLIANCE_REDIRECT).copy(
            className = "Ldvdc;"
        ),
        HookId.WORK_PROFILE_BYPASS to previous.getValue(HookId.WORK_PROFILE_BYPASS).copy(
            className = "Lahoz;", methodName = "u",
            methodDescriptor = "(Lcom/google/apps/tiktok/account/AccountId;Lhist;)Ljava/lang/Object;"
        ),
        HookId.WORK_PROFILE_ELIGIBILITY to previous.getValue(HookId.WORK_PROFILE_ELIGIBILITY).copy(
            className = "Laozi;", methodName = "l", methodDescriptor = "(Lhist;)Ljava/lang/Object;"
        ),
        HookId.MICROG_RUNTIME_PERMISSIONS to previous.getValue(HookId.MICROG_RUNTIME_PERMISSIONS).copy(
            description = "Insert after final IPUT_BOOLEAN o:Z (code unit 818); v0 aliases Activity."
        ),
        HookId.PROCESS_NAME_REDIRECT to previous.getValue(HookId.PROCESS_NAME_REDIRECT).copy(
            className = "Lelhw;", methodName = "b", methodDescriptor = "()Ljava/lang/String;"
        ),
        HookId.MAIN_PROCESS_CHECK to previous.getValue(HookId.MAIN_PROCESS_CHECK).copy(
            className = "Lelhs;", methodName = "b",
            description = "Anchor is in elhs.a; the provider call inside elhs.b is the main-process check."
        ),
        HookId.GMS_SIGNATURE_BYPASS to previous.getValue(HookId.GMS_SIGNATURE_BYPASS).copy(className = "Ldhsf;"),
        HookId.GMS_CERTIFICATE_VERIFIER to previous.getValue(HookId.GMS_CERTIFICATE_VERIFIER).copy(className = "Ldhsg;"),
        HookId.PACKAGE_CLONE_REDIRECT to previous.getValue(HookId.PACKAGE_CLONE_REDIRECT).copy(
            description = "Rewrite exact package references in the Google application."
        ),
        HookId.GEMINI_HAPTICS to previous.getValue(HookId.GEMINI_HAPTICS).copy(
            className = "Lcafg;",
            methodDescriptor = "(Lavyc;Landroidx/preference/PreferenceScreen;Lhist;)Ljava/lang/Object;",
            methodSignatures = listOf(
                "Lbtmy;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbtow;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbtmg;->a(Lbtly;)V",
                "Lbtpt;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z",
                "Lbtpv;->c(Landroid/view/View;Z)V",
                "Lbzbc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbtwo;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z",
                "Lbohr;->i(Lboid;Landroid/graphics/Point;Lhivb;Laxvh;Lbhqj;)Z",
                "Lcom/google/android/apps/search/assistant/surfaces/voice/robin/ui/extensions/mediagen/editor/ui/views/EditorCanvasView;->g(Lcom/google/android/apps/search/assistant/surfaces/voice/robin/ui/extensions/mediagen/editor/ui/views/EditorCanvasView;)Lhipw;",
                "Lcdqz;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lcdrb;->f()V",
                "Lcdrb;->g()V",
                // Guided prompt interactions.
                "Lbyxm;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbyxq;->invoke()Ljava/lang/Object;",
                "Lbyxy;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbyyf;->invoke()Ljava/lang/Object;",
                "Lbyzf;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbyzh;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbyzi;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbyzr;->invoke()Ljava/lang/Object;",
                // Home and suggested prompt interactions.
                "Lbuwu;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbuxw;->invoke()Ljava/lang/Object;",
                "Lbuxz;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbuyd;->invoke()Ljava/lang/Object;",
                "Lbuye;->a(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbuyq;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;"
            ),
            expectedMatches = 37,
            values = mapOf("findPreference" to "ae", "setKey" to "I", "setTitle" to "K",
                "addPreference" to "ab", "listenerField" to "n", "persistentField" to "w", "setChecked" to "k")
        ),
        HookId.GEMINI_HAPTICS_VIBRATOR to TargetSpec(
            anchorStrings = listOf("Ma-HapticsPlayer-Impl", "Playing haptic feedback"),
            methodSignatures = listOf(
                "Latai;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbmfg;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Lbmfj;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                "Laurp;->b(Laurf;Lhist;)Ljava/lang/Object;"
            ),
            values = mapOf("vibrateReference" to
                "Lbv\$\$ExternalSyntheticApiModelOutline0;->m(Landroid/os/Vibrator;Landroid/os/VibrationEffect;)V"),
            expectedMatches = 4,
            description = "Gate the chat waveform player plus Live and Gemini feedback-report cues."
        ),
        HookId.GEMINI_HAPTICS_COMPOSE to previous.getValue(HookId.GEMINI_HAPTICS_COMPOSE).copy(
            className = "Lcabq;",
            integers = mapOf("registers" to 11, "viewRegister" to 7, "titleRegister" to 8,
                "geminiSettingsTitle" to 0x7f151c4c, "settingsTitle" to 0x7f151c59)
        )
    )
)
