.class public final Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;
.super Landroid/preference/Preference;
.source "DeepSeekActionPreference.java"


# static fields
.field static final KEY_CLEAR_CACHE:Ljava/lang/String; = "deepseek_caption_clear_cache"

.field static final KEY_CLEAR_DIAGNOSTICS:Ljava/lang/String; = "deepseek_caption_clear_diagnostics"

.field static final KEY_DELETE_KEY:Ljava/lang/String; = "deepseek_caption_delete_key"

.field static final KEY_RESET_POSITION:Ljava/lang/String; = "deepseek_caption_reset_position"

.field static final KEY_TEST:Ljava/lang/String; = "deepseek_caption_test_api"


# direct methods
.method public static synthetic $r8$lambda$CE8SbTmorg_7t807_GZZHnK6GPY(Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->lambda$testApi$1(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Gbt1diVxSMV2c30dwUJsCTEXR5k(Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->lambda$testApi$2(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$hIGUn5DuBwx_rnFv4zY0wo6S_YI(Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;Landroid/preference/Preference;)Z
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->lambda$initialize$0(Landroid/preference/Preference;)Z

    move-result p0

    return p0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 18
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 19
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 23
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 28
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 29
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 38
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 39
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->initialize()V

    return-void
.end method

.method private initialize()V
    .registers 2

    const/4 v0, 0x0

    .line 43
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->setPersistent(Z)V

    .line 44
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference$$ExternalSyntheticLambda0;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;)V

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    return-void
.end method

.method private synthetic lambda$initialize$0(Landroid/preference/Preference;)Z
    .registers 2

    .line 45
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->performAction()V

    const/4 p0, 0x1

    return p0
.end method

.method private synthetic lambda$testApi$1(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    const/4 v0, 0x1

    .line 98
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->setEnabled(Z)V

    .line 99
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "\u4f7f\u7528\u5f53\u524d\u5df2\u81ea\u52a8\u4fdd\u5b58\u7684\u914d\u7f6e\u6d4b\u8bd5\u8fde\u63a5"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 100
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_20

    return-void

    .line 101
    :cond_20
    const-string p1, "API \u53ef\u7528\uff1a"

    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2f

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->refreshConfiguration(Landroid/content/Context;)V

    .line 102
    :cond_2f
    invoke-direct {p0, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->toast(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic lambda$testApi$2(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;Ljava/lang/String;)V
    .registers 6

    const-string v0, "API \u53ef\u7528\uff1a"

    .line 87
    :try_start_2
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/ContextualBatchApiClient;->test(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;)Ljava/lang/String;

    move-result-object p1

    .line 88
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_12
    .catchall {:try_start_2 .. :try_end_12} :catchall_13

    goto :goto_3a

    :catchall_13
    move-exception p1

    .line 90
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "API \u6d4b\u8bd5\u5931\u8d25\uff1a"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v0, :cond_2b

    .line 92
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_33

    .line 93
    :cond_2b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 94
    :cond_33
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 97
    :goto_3a
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p2, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference$$ExternalSyntheticLambda2;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->postToUi(Ljava/lang/Runnable;)V

    return-void
.end method

.method private performAction()V
    .registers 4

    .line 51
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 52
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 53
    const-string v2, "deepseek_caption_test_api"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 54
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->testApi()V

    return-void

    .line 55
    :cond_14
    const-string v2, "deepseek_caption_reset_position"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 56
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->resetCaptionPositions(Landroid/content/Context;)V

    .line 57
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->refreshStyle(Landroid/content/Context;)V

    .line 58
    const-string v0, "\u5b57\u5e55\u5df2\u6062\u590d\u6c34\u5e73\u5c45\u4e2d\u7684\u9ed8\u8ba4\u4f4d\u7f6e"

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->toast(Ljava/lang/String;)V

    return-void

    .line 59
    :cond_28
    const-string v2, "deepseek_caption_clear_cache"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 60
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache;->clear(Landroid/content/Context;)V

    .line 61
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildCache;->clear(Landroid/content/Context;)V

    .line 62
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->clear(Landroid/content/Context;)V

    .line 63
    const-string v0, "\u5b57\u5e55\u7f13\u5b58\u5df2\u6e05\u9664"

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->toast(Ljava/lang/String;)V

    return-void

    .line 64
    :cond_3f
    const-string v2, "deepseek_caption_delete_key"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_50

    .line 65
    new-instance p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->clearCurrentKey()V

    return-void

    .line 66
    :cond_50
    const-string v2, "deepseek_caption_clear_diagnostics"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    .line 67
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->clear(Landroid/content/Context;)V

    .line 68
    const-string v0, "\u8bca\u65ad\u8bb0\u5f55\u5df2\u6e05\u7a7a"

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->toast(Ljava/lang/String;)V

    :cond_60
    return-void
.end method

.method private postToUi(Ljava/lang/Runnable;)V
    .registers 3

    .line 108
    new-instance p0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 109
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private testApi()V
    .registers 5

    .line 73
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushCurrent()Z

    move-result v0

    if-nez v0, :cond_14

    .line 74
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "profile_invalid_edits"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->toast(Ljava/lang/String;)V

    return-void

    .line 76
    :cond_14
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v0

    .line 77
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 78
    const-string v0, "\u8bf7\u5148\u586b\u5199 API Key"

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->toast(Ljava/lang/String;)V

    return-void

    .line 81
    :cond_2a
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 82
    invoke-virtual {p0, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->setEnabled(Z)V

    .line 83
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "\u6d4b\u8bd5\u4e2d\u2026"

    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 84
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference$$ExternalSyntheticLambda1;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;Ljava/lang/String;)V

    const-string p0, "DeepSeekCaptionApiTest"

    invoke-direct {v2, v3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 104
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private toast(Ljava/lang/String;)V
    .registers 3

    .line 113
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekActionPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x1

    invoke-static {v0, p0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method
