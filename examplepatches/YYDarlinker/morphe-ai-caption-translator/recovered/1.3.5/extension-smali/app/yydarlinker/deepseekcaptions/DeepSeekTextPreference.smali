.class public Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;
.super Landroid/preference/Preference;
.source "DeepSeekTextPreference.java"

# interfaces
.implements Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;


# static fields
.field private static final AUTO_SAVE_DELAY_MS:J = 0x352L

.field static final KEY_API_KEY:Ljava/lang/String; = "deepseek_caption_api_key"

.field static final KEY_BASE_URL:Ljava/lang/String; = "deepseek_caption_base_url"

.field static final KEY_PROMPT:Ljava/lang/String; = "deepseek_caption_prompt"


# instance fields
.field private boundDefaultPrompt:Ljava/lang/String;

.field private boundProfile:Ljava/lang/String;

.field private boundRevision:J

.field private boundView:Landroid/view/View;

.field private editor:Landroid/widget/EditText;

.field private lastCommitted:Ljava/lang/String;

.field private final main:Landroid/os/Handler;

.field private pendingSave:Ljava/lang/Runnable;

.field private state:Landroid/widget/TextView;


# direct methods
.method public static synthetic $r8$lambda$Hi0MdV3Lwltd2hFucpELMbRO3Qs(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lambda$scheduleSave$2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$hU5V4HF2EVGzUmjZps1x5esCADw(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Ljava/lang/String;Landroid/view/View;Z)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lambda$onCreateView$0(Ljava/lang/String;Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$mf1XHYL0dIIfQlQ82vGcmPQtXYY(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Ljava/lang/String;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 5

    invoke-direct {p0, p1, p2, p3, p4}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lambda$onCreateView$1(Ljava/lang/String;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$fgeteditor(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;)Landroid/widget/EditText;
    .registers 1

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mcancelPendingSave(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;)V
    .registers 1

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->cancelPendingSave()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcommitNow(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Ljava/lang/String;Z)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->commitNow(Ljava/lang/String;Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mscheduleSave(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->scheduleSave(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 45
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 34
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->main:Landroid/os/Handler;

    .line 38
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lastCommitted:Ljava/lang/String;

    .line 39
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundProfile:Ljava/lang/String;

    const-wide/16 v0, -0x1

    .line 41
    iput-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundRevision:J

    .line 42
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundDefaultPrompt:Ljava/lang/String;

    .line 46
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    .line 50
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->main:Landroid/os/Handler;

    .line 38
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lastCommitted:Ljava/lang/String;

    .line 39
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundProfile:Ljava/lang/String;

    const-wide/16 v0, -0x1

    .line 41
    iput-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundRevision:J

    .line 42
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundDefaultPrompt:Ljava/lang/String;

    .line 51
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 55
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->main:Landroid/os/Handler;

    .line 38
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lastCommitted:Ljava/lang/String;

    .line 39
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundProfile:Ljava/lang/String;

    const-wide/16 p2, -0x1

    .line 41
    iput-wide p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundRevision:J

    .line 42
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundDefaultPrompt:Ljava/lang/String;

    .line 56
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 65
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 34
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->main:Landroid/os/Handler;

    .line 38
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lastCommitted:Ljava/lang/String;

    .line 39
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundProfile:Ljava/lang/String;

    const-wide/16 p2, -0x1

    .line 41
    iput-wide p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundRevision:J

    .line 42
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundDefaultPrompt:Ljava/lang/String;

    .line 66
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->initialize()V

    return-void
.end method

.method private cancelPendingSave()V
    .registers 3

    .line 306
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->pendingSave:Ljava/lang/Runnable;

    if-eqz v0, :cond_9

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->main:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_9
    const/4 v0, 0x0

    .line 307
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->pendingSave:Ljava/lang/Runnable;

    return-void
.end method

.method private commit(Ljava/lang/String;Z)V
    .registers 7

    .line 232
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundRevision:J

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_d3

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundProfile:Ljava/lang/String;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    goto/16 :goto_d3

    :cond_1c
    if-nez p1, :cond_21

    .line 233
    const-string p1, ""

    goto :goto_25

    :cond_21
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 234
    :goto_25
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lastCommitted:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    goto/16 :goto_d3

    .line 235
    :cond_2f
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "deepseek_caption_api_key"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_43

    goto/16 :goto_d3

    .line 236
    :cond_43
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6f

    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5d

    const-string v0, "\r"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_6f

    .line 237
    :cond_5d
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    if-eqz p1, :cond_d3

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p2, "API Key \u5e94\u4e3a\u5355\u884c"

    invoke-static {p0, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    .line 241
    :cond_6f
    :try_start_6f
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->saveValue(Ljava/lang/String;)V

    .line 242
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lastCommitted:Ljava/lang/String;

    .line 243
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    const/4 v0, 0x0

    if-eqz p1, :cond_7c

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :cond_7c
    const/4 p1, 0x1

    .line 244
    invoke-direct {p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->updateState(ZLjava/lang/String;)V

    .line 245
    const-string p1, "deepseek_caption_base_url"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_96

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9d

    .line 246
    :cond_96
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->onCredentialsChanged(Landroid/content/Context;)V

    .line 248
    :cond_9d
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushing()Z

    move-result p1

    if-nez p1, :cond_d3

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->refreshConfiguration(Landroid/content/Context;)V
    :try_end_aa
    .catchall {:try_start_6f .. :try_end_aa} :catchall_ab

    return-void

    :catchall_ab
    move-exception p1

    .line 250
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_bc

    .line 251
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_be

    :cond_bc
    const-string p1, "\u81ea\u52a8\u4fdd\u5b58\u5931\u8d25"

    :cond_be
    const/4 v0, 0x0

    .line 254
    invoke-direct {p0, v0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->updateState(ZLjava/lang/String;)V

    if-eqz p2, :cond_d3

    .line 255
    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    if-eqz p2, :cond_d3

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :cond_d3
    :goto_d3
    return-void
.end method

.method private commitNow(Ljava/lang/String;Z)V
    .registers 3

    .line 227
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->cancelPendingSave()V

    .line 228
    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->commit(Ljava/lang/String;Z)V

    return-void
.end method

.method private configureEditor(Landroid/widget/EditText;)V
    .registers 5

    .line 184
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 185
    const-string v1, "deepseek_caption_api_key"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_3e

    .line 186
    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 187
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionInputPolicy;->keyInputType()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 188
    move-object v0, p1

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;

    invoke-virtual {v0, v2}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->sensitive(Z)V

    const v0, 0x1000006

    .line 189
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 190
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->hasSavedValue(Landroid/content/Context;)Z

    move-result v0

    .line 191
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    if-eqz v0, :cond_34

    const-string v0, "\u5df2\u52a0\u5bc6\u4fdd\u5b58\uff1b\u8f93\u5165\u53ef\u66ff\u6362"

    goto :goto_36

    :cond_34
    const-string v0, "\u8bf7\u8f93\u5165 API Key"

    :goto_36
    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    return-void

    .line 192
    :cond_3e
    const-string p0, "deepseek_caption_prompt"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_64

    const/4 p0, 0x0

    .line 193
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setSingleLine(Z)V

    const/4 p0, 0x3

    .line 194
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setMinLines(I)V

    const/4 p0, 0x7

    .line 195
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setMaxLines(I)V

    const p0, 0x800033

    .line 196
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setGravity(I)V

    const p0, 0x24001

    .line 197
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setInputType(I)V

    const/high16 p0, 0x40000000    # 2.0f

    .line 200
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setImeOptions(I)V

    return-void

    .line 201
    :cond_64
    const-string p0, "deepseek_caption_base_url"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    const/4 v0, 0x6

    if-eqz p0, :cond_79

    .line 202
    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    const/16 p0, 0x11

    .line 203
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setInputType(I)V

    .line 204
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setImeOptions(I)V

    return-void

    .line 206
    :cond_79
    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 207
    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 208
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setImeOptions(I)V

    return-void
.end method

.method private dp(I)I
    .registers 2

    int-to-float p1, p1

    .line 318
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private initialValue()Ljava/lang/String;
    .registers 5

    .line 213
    const-string v0, "deepseek_caption_api_key"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_f

    return-object v1

    .line 214
    :cond_f
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v0

    .line 215
    const-string v2, "deepseek_caption_base_url"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    iget-object p0, v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->baseUrl:Ljava/lang/String;

    return-object p0

    .line 216
    :cond_26
    const-string v2, "deepseek_caption_prompt"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_35

    iget-object p0, v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->prompt:Ljava/lang/String;

    return-object p0

    :cond_35
    return-object v1
.end method

.method private initialize()V
    .registers 2

    .line 70
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->register(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V

    const/4 v0, 0x0

    .line 71
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->setPersistent(Z)V

    .line 72
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->setSelectable(Z)V

    return-void
.end method

.method private synthetic lambda$onCreateView$0(Ljava/lang/String;Landroid/view/View;Z)V
    .registers 5

    .line 148
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    if-ne p2, v0, :cond_4f

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_13

    goto :goto_4f

    :cond_13
    if-nez p3, :cond_4f

    .line 150
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->commitNow(Ljava/lang/String;Z)V

    .line 151
    const-string p2, "deepseek_caption_prompt"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4f

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_4f

    .line 152
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->defaultPrompt(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 153
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lastCommitted:Ljava/lang/String;

    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->cancelPendingSave()V

    :cond_4f
    :goto_4f
    return-void
.end method

.method private synthetic lambda$onCreateView$1(Ljava/lang/String;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 7

    .line 159
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    const/4 v1, 0x0

    if-ne p2, v0, :cond_47

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_14

    goto :goto_47

    :cond_14
    const/4 p1, 0x6

    if-eq p3, p1, :cond_27

    if-eqz p4, :cond_47

    .line 161
    invoke-virtual {p4}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    const/16 p2, 0x42

    if-ne p1, p2, :cond_47

    .line 162
    invoke-virtual {p4}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_47

    .line 163
    :cond_27
    const-string p1, "deepseek_caption_prompt"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_47

    .line 164
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->commitNow(Ljava/lang/String;Z)V

    .line 165
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->clearFocus()V

    return p2

    :cond_47
    :goto_47
    return v1
.end method

.method private synthetic lambda$scheduleSave$2(Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x0

    .line 222
    invoke-direct {p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->commit(Ljava/lang/String;Z)V

    return-void
.end method

.method private matchWrap()Landroid/widget/LinearLayout$LayoutParams;
    .registers 3

    .line 311
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p0, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method private saveValue(Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 260
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 261
    const-string v1, "deepseek_caption_base_url"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 262
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->saveBaseUrl(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 263
    :cond_14
    const-string v1, "deepseek_caption_api_key"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 264
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->save(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 265
    :cond_24
    const-string v1, "deepseek_caption_prompt"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 266
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->savePrompt(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 268
    :cond_34
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u672a\u77e5\u8bbe\u7f6e\u9879"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private scheduleSave(Ljava/lang/String;)V
    .registers 5

    .line 221
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->cancelPendingSave()V

    .line 222
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$$ExternalSyntheticLambda2;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Ljava/lang/String;)V

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->pendingSave:Ljava/lang/Runnable;

    .line 223
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->main:Landroid/os/Handler;

    const-wide/16 v1, 0x352

    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private updateState(ZLjava/lang/String;)V
    .registers 6

    .line 273
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->state:Landroid/widget/TextView;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz p2, :cond_2b

    .line 275
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\uff1b\u4fdd\u7559\u4e0a\u6b21\u6709\u6548\u503c"

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 276
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->state:Landroid/widget/TextView;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    return-void

    .line 280
    :cond_2b
    const-string p2, "deepseek_caption_api_key"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_59

    .line 281
    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->state:Landroid/widget/TextView;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->hasSavedValue(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_4a

    .line 282
    const-string p1, "\u7f16\u8f91\u65f6\u53ef\u89c1\uff1b\u5173\u95ed\u9875\u9762\u6e05\u7a7a\uff0c\u52a0\u5bc6\u4fdd\u5b58"

    goto :goto_51

    :cond_4a
    if-eqz p1, :cond_4f

    .line 283
    const-string p1, "\u5df2\u81ea\u52a8\u52a0\u5bc6\u4fdd\u5b58"

    goto :goto_51

    :cond_4f
    const-string p1, "\u5df2\u52a0\u5bc6\u4fdd\u5b58\uff0c\u4e0d\u56de\u663e\u539f Key"

    .line 281
    :goto_51
    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_81

    .line 285
    :cond_59
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object p2

    .line 287
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->state:Landroid/widget/TextView;

    if-eqz p1, :cond_6c

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "\u5df2\u81ea\u52a8\u4fdd\u5b58"

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    goto :goto_7e

    :cond_6c
    if-eqz p2, :cond_74

    .line 288
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-nez p1, :cond_7e

    :cond_74
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "\u4fee\u6539\u540e\u81ea\u52a8\u4fdd\u5b58"

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 287
    :cond_7e
    :goto_7e
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 290
    :goto_81
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->state:Landroid/widget/TextView;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    return-void
.end method


# virtual methods
.method public flushProfile()Z
    .registers 7

    .line 294
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    const/4 v1, 0x1

    if-eqz v0, :cond_4e

    iget-wide v2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundRevision:J

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision()J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-nez v0, :cond_4e

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundProfile:Ljava/lang/String;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    goto :goto_4e

    .line 295
    :cond_20
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->commitNow(Ljava/lang/String;Z)V

    .line 296
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lastCommitted:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4e

    const-string v2, "deepseek_caption_api_key"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4c

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_4c

    goto :goto_4e

    :cond_4c
    const/4 p0, 0x0

    return p0

    :cond_4e
    :goto_4e
    return v1
.end method

.method public getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 7

    .line 79
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object p1

    .line 80
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundView:Landroid/view/View;

    if-eqz v0, :cond_6a

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, p2, :cond_6a

    :cond_16
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundRevision:J

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_6a

    const-string v0, "deepseek_caption_prompt"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundDefaultPrompt:Ljava/lang/String;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->defaultPrompt(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6a

    :cond_38
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundProfile:Ljava/lang/String;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6a

    if-eqz p1, :cond_6a

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundProfile:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6a

    .line 81
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundView:Landroid/view/View;

    goto :goto_6b

    :cond_6a
    const/4 p1, 0x0

    .line 83
    :goto_6b
    invoke-super {p0, p1, p2}, Landroid/preference/Preference;->getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 84
    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    if-eqz p2, :cond_90

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setEnabled(Z)V

    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setFocusable(Z)V

    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setClickable(Z)V

    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setLongClickable(Z)V

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 85
    :cond_90
    instance-of p0, p1, Landroid/view/ViewGroup;

    if-eqz p0, :cond_a0

    move-object p0, p1

    check-cast p0, Landroid/view/ViewGroup;

    const/high16 p2, 0x40000

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/view/View;->setFocusable(Z)V

    :cond_a0
    return-object p1
.end method

.method protected onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9

    .line 91
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->register(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V

    .line 93
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->flushProfile()Z

    .line 94
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->cancelPendingSave()V

    .line 95
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundProfile:Ljava/lang/String;

    .line 96
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision()J

    move-result-wide v0

    iput-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundRevision:J

    .line 97
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->defaultPrompt(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundDefaultPrompt:Ljava/lang/String;

    .line 98
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 99
    instance-of v1, p1, Landroid/widget/ListView;

    const/high16 v2, 0x40000

    const/4 v3, 0x1

    if-eqz v1, :cond_37

    .line 100
    move-object v1, p1

    check-cast v1, Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 101
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 103
    :cond_37
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 104
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundView:Landroid/view/View;

    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundProfile:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 106
    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 107
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setDescendantFocusability(I)V

    .line 108
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->row(Landroid/view/View;)V

    .line 110
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 111
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->title(Landroid/widget/TextView;)V

    const/16 v2, 0x8

    .line 113
    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->dp(I)I

    move-result v2

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v4, v4, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 114
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;

    invoke-direct {v1, v0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    const v2, 0x1020003

    .line 117
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setId(I)V

    .line 118
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 119
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->editor(Landroid/widget/EditText;)V

    .line 120
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->configureEditor(Landroid/widget/EditText;)V

    .line 121
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->initialValue()Ljava/lang/String;

    move-result-object v1

    .line 122
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    const-string v5, "deepseek_caption_api_key"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b9

    .line 123
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 124
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/widget/EditText;->setSelection(I)V

    .line 126
    :cond_b9
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c6

    const-string v1, ""

    goto :goto_ca

    :cond_c6
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    :goto_ca
    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lastCommitted:Ljava/lang/String;

    .line 127
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 128
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setLongClickable(Z)V

    .line 131
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->state:Landroid/widget/TextView;

    .line 132
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->caption(Landroid/widget/TextView;)V

    .line 133
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->state:Landroid/widget/TextView;

    const/4 v1, 0x6

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->dp(I)I

    move-result v1

    invoke-virtual {v0, v4, v1, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    const/4 v0, 0x0

    .line 134
    invoke-direct {p0, v4, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->updateState(ZLjava/lang/String;)V

    .line 135
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->state:Landroid/widget/TextView;

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 137
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    .line 138
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundProfile:Ljava/lang/String;

    .line 139
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$1;

    invoke-direct {v2, p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$1;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Landroid/widget/EditText;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 147
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$$ExternalSyntheticLambda0;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 158
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$$ExternalSyntheticLambda1;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 170
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;

    invoke-direct {v2, p0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-object p1
.end method

.method public profileChanged()V
    .registers 3

    .line 299
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->cancelPendingSave()V

    .line 300
    const-string v0, ""

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundProfile:Ljava/lang/String;

    const/4 v1, 0x0

    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->boundView:Landroid/view/View;

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->lastCommitted:Ljava/lang/String;

    .line 301
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    if-eqz v1, :cond_18

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 302
    :cond_18
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->notifyChanged()V

    return-void
.end method
