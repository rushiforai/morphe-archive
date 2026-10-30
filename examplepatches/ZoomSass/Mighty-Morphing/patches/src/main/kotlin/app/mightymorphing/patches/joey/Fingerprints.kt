package app.mightymorphing.patches.joey

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal

object AdsDisabledFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/BaseActivity;",
    name = "b1",
    returnType = "Z",
    strings = listOf("inside areAdsDisabled"),
)

object InlineAdsFingerprint : Fingerprint(
    definingClass = "Lmb/f;",
    name = "a",
    returnType = "Z",
    strings = listOf("PREF_INLINE_ADS"),
)

object RatePromptFingerprint : Fingerprint(
    definingClass = "Lx8/j;",
    name = "n0",
    returnType = "Z",
    strings = listOf("app_rate_prefs"),
)

object PurchaseErrorPromptFingerprint : Fingerprint(
    definingClass = "Lx8/j;",
    name = "q0",
    returnType = "Z",
    strings = listOf("TROUBLE_GETTING_PURCHASE_DETAILS"),
)

object UpdateNagFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/HomeActivity;",
    name = "J3",
    returnType = "V",
    filters = listOf(literal(0x1f4)),
)

object InstallerCheckFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Initializers/ProcessLifeCyleListener;",
    name = "n",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

object PlayCheckFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Initializers/ProcessLifeCyleListener;",
    name = "p",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(literal(0x64)),
)

object PurchasePromptFingerprint : Fingerprint(
    definingClass = "Lua/b;",
    name = "q",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

object PurchaseDialogFingerprint : Fingerprint(
    definingClass = "Lua/a;",
    name = "r2",
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(literal(0x7f1307a7)),
)

object PreviousCrashFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/MyApplication;",
    name = "j",
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                instruction.reference.toString().contains("didCrashOnPreviousExecution")
        } == true
    },
)

object CrashlyticsToggleFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/MyApplication;",
    name = "u",
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                instruction.reference.toString().contains("setCrashlyticsCollectionEnabled")
        } == true
    },
)

object RecordExceptionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "recordException",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;"),
)

object SendReportsFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "sendUnsentReports",
    returnType = "V",
    parameters = listOf(),
)

object UncaughtHandlerFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/internal/common/CrashlyticsController;",
    name = "z",
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                instruction.reference.toString().contains("setDefaultUncaughtExceptionHandler")
        } == true
    },
)

object NativeCrashFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/ndk/FirebaseCrashlyticsNdk;",
    name = "c",
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                instruction.reference.toString().contains("SignalHandlerInstaller")
        } == true
    },
)

object RedgifsAuthFingerprint : Fingerprint(
    definingClass = "Lod/b;",
    name = "u",
    returnType = "Z",
    strings = listOf("https://api.redgifs.com/v2/oauth/client"),
)

object RedgifsTokenFieldFingerprint : Fingerprint(
    definingClass = "Lod/b;",
    name = "g",
    returnType = "Ljava/lang/String;",
    strings = listOf("access_token"),
)

object RedgifsExpiryFingerprint : Fingerprint(
    definingClass = "Lod/b;",
    name = "h",
    returnType = "J",
    strings = listOf("expires_in"),
)

object RedgifsUrlFingerprint : Fingerprint(
    definingClass = "Lod/b;",
    name = "m",
    returnType = "Ljava/lang/String;",
    strings = listOf("hd", "urls"),
)

object RedgifsResolveFingerprint : Fingerprint(
    definingClass = "Lod/b;",
    name = "n",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;", "Z"),
)

object RedgifsDirectFingerprint : Fingerprint(
    definingClass = "Lab/l;",
    name = "s",
    returnType = "Lab/l\$h;",
    strings = listOf(".mp4", "gfycat.com"),
)

object RedgifsIdFingerprint : Fingerprint(
    definingClass = "Lab/l;",
    name = "G",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;", "L", "Z"),
)

object RedditPreviewFingerprint : Fingerprint(
    definingClass = "Lzd/e0;",
    name = "f",
    returnType = "Ljava/lang/String;",
    strings = listOf("reddit_video_preview", "hls_url"),
)

object SwipeResetFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/CustomViews/AnySwipeLayout;",
    name = "f",
    returnType = "V",
    parameters = listOf(),
)

object SwipeCaptureFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/CustomViews/AnySwipeLayout\$d;",
    name = "onViewCaptured",
    returnType = "V",
)

object ViewerWindowFingerprint : Fingerprint(
    definingClass = "Lzd/p1;",
    name = "b",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
)

object CommentHtmlFingerprint : Fingerprint(
    definingClass = "Ln9/k;",
    name = "W",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("body_html"),
)

object CommentSetHtmlFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/CustomViews/HTMLTextView;",
    name = "setTextHtml",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object PostGifFingerprint : Fingerprint(
    definingClass = "Lzd/c0;",
    name = "d",
    returnType = "Z",
    parameters = listOf("Landroid/widget/ImageView;", "Ljava/io/File;"),
)

object CommentSpannableFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/CustomViews/HTMLTextView;",
    name = "setSpannable",
    returnType = "V",
    parameters = listOf("Landroid/text/SpannableStringBuilder;"),
)

object CommentLinkTouchFingerprint : Fingerprint(
    definingClass = "Lxa/n;",
    name = "onTouchEvent",
    returnType = "Z",
    parameters = listOf("Landroid/widget/TextView;", "Landroid/text/Spannable;", "Landroid/view/MotionEvent;"),
)

object TutorialSeenFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Tutorial/a;",
    name = "b",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

object ActivityResultFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/BaseActivity;",
    name = "onActivityResult",
    returnType = "V",
    parameters = listOf("I", "I", "Landroid/content/Intent;"),
)

object SettingsHookFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/SettingActivities/SettingsActivity;",
    name = "q3",
    returnType = "V",
    parameters = listOf(),
)

object ClientIdFingerprint : Fingerprint(
    definingClass = "Le9/b;",
    name = "a",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(literal(0x7f130807)),
)

object UserAgentFingerprint : Fingerprint(
    definingClass = "Le9/b;",
    name = "c",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("2.1.6.5"),
)

object CredentialsFingerprint : Fingerprint(
    definingClass = "Lt7/a;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Lnet/dean/jraw/http/a;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/util/UUID;",
        "Ljava/lang/String;",
    ),
)

object LoginCodeCheckFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/LoginActivity;",
    name = "s3",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("code="),
)

object LoginOverrideFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/LoginActivity\$d;",
    name = "shouldOverrideUrlLoading",
    returnType = "Z",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
)

object LoginPageLoadFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/LoginActivity;",
    name = "v3",
    returnType = "V",
    parameters = listOf(),
)

object CommentSearchCreateFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/CommentSearchActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

object SearchDialogShowFingerprint : Fingerprint(
    definingClass = "Lq1/f;",
    name = "onShow",
    returnType = "V",
    parameters = listOf("Landroid/content/DialogInterface;"),
)

object EditorUploadFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/EditorActivity;",
    name = "A3",
    returnType = "V",
    parameters = listOf("Ljava/util/List;", "Z"),
)

object CommentSubmitFingerprint : Fingerprint(
    definingClass = "Lnet/dean/jraw/managers/AccountManager;",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lnet/dean/jraw/models/Contribution;", "Ljava/lang/String;"),
)

object ReplyResultFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/ReplyActivity\$q;",
    name = "k",
    returnType = "Ljava/lang/String;",
    parameters = listOf("[Ljava/lang/Void;"),
)

object EditSubmitFingerprint : Fingerprint(
    definingClass = "Lnet/dean/jraw/managers/AccountManager;",
    returnType = "V",
    parameters = listOf("Lnet/dean/jraw/models/PublicContribution;", "Ljava/lang/String;"),
)

object GifPickerFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/EditorActivity\$e;",
    strings = listOf("video/*", "image/gif"),
)

object EditorHostAgreementFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/EditorActivity;",
    name = "d4",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/Runnable;"),
    strings = listOf("EXTERNAL_MEDIA_HOST_V4"),
)

object DrawerOpenFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/HomeActivity\$w0;",
    name = "a",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    strings = listOf("SWIPE_MARGIN_FOR_DRAWER"),
)

object DrawerBuildFingerprint : Fingerprint(
    definingClass = "Lua/b;",
    name = "B",
    returnType = "V",
    parameters = listOf(),
)

object EditorBarFingerprint : Fingerprint(
    definingClass = "Lsb/a;",
    name = "f",
    returnType = "V",
    parameters = listOf(
        "Lo/o/joey/Activities/EditorActivity;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

object EditorInputFingerprint : Fingerprint(
    definingClass = "Landroidx/appcompat/widget/AppCompatEditText;",
    name = "onCreateInputConnection",
    returnType = "Landroid/view/inputmethod/InputConnection;",
    parameters = listOf("Landroid/view/inputmethod/EditorInfo;"),
)

object LoginPageFinishedFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/LoginActivity\$d;",
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
)


object OpenContentFingerprint : Fingerprint(
    definingClass = "Lfb/a;",
    name = "F",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z",
        "Ljava/lang/Boolean;",
    ),
)

object OpenRedditLinkFingerprint : Fingerprint(
    definingClass = "Lfb/b;",
    name = "j",
    returnType = "V",
    parameters = listOf("Z", "Landroid/content/Context;", "Ljava/lang/String;"),
)

object OpenRedditInternalLinkFingerprint : Fingerprint(
    definingClass = "Lfb/b;",
    name = "l",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)

object NormalizeRedditLinkFingerprint : Fingerprint(
    definingClass = "Lfb/b;",
    name = "c",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
)

object FilterSettingsCreateFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/SettingActivities/FilterSettings;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

object FilterSettingsPauseFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/SettingActivities/FilterSettings;",
    name = "onPause",
    returnType = "V",
    parameters = listOf(),
)

object SettingsListRowFingerprint : Fingerprint(
    definingClass = "Lzd/c1;",
    name = "b",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/util/List;",
        "Ljava/lang/String;",
        "Landroid/widget/LinearLayout;",
        "Z",
        "Lzd/c1\$e;",
    ),
)

object QuickFilterDialogFingerprint : Fingerprint(
    definingClass = "Lha/b;",
    name = "b",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Z"),
)

object QuickFilterApplyFingerprint : Fingerprint(
    definingClass = "Lha/b\$a;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Lq1/f;", "[Ljava/lang/Integer;", "[Ljava/lang/CharSequence;"),
)

object SubmissionFilterFingerprint : Fingerprint(
    definingClass = "Ls9/b;",
    name = "b",
    returnType = "Z",
    parameters = listOf("Lnet/dean/jraw/models/Submission;"),
)

object SubredditPrefixFilterFingerprint : Fingerprint(
    definingClass = "Lia/i;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Lnet/dean/jraw/models/Submission;"),
)

object BaseActivityPrepareMenuFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/Activities/BaseActivity;",
    name = "onPrepareOptionsMenu",
    returnType = "Z",
    parameters = listOf("Landroid/view/Menu;"),
)
