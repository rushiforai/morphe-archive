.class public final Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;
.super Ljava/lang/Object;
.source "DeepSeekCaptionHookV2.java"


# static fields
.field private static volatile appContext:Landroid/content/Context;


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static concreteAiUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 101
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;->decodeLoopbackTarget(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 102
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_b

    return-object p1

    .line 103
    :cond_b
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_18

    .line 104
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object p1

    if-eqz p1, :cond_18

    return-object p0

    .line 107
    :cond_18
    const-string p0, ""

    return-object p0
.end method

.method private static decodeLoopbackTarget(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 111
    const-string v0, ""

    if-eqz p0, :cond_46

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b

    goto :goto_46

    .line 113
    :cond_b
    :try_start_b
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    .line 114
    const-string v1, "127.0.0.1"

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    return-object v0

    .line 115
    :cond_1c
    const-string v1, "u"

    invoke-virtual {p0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_46

    .line 116
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2b

    goto :goto_46

    :cond_2b
    const/16 v1, 0xb

    .line 117
    invoke-static {p0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    .line 121
    new-instance v1, Ljava/lang/String;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, p0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 122
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_46

    .line 123
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object p0
    :try_end_42
    .catchall {:try_start_b .. :try_end_42} :catchall_46

    if-nez p0, :cond_45

    goto :goto_46

    :cond_45
    return-object v1

    :catchall_46
    :cond_46
    :goto_46
    return-object v0
.end method

.method static synthetic lambda$onNativeCaptionButtonController$0(Landroid/widget/ImageView;)V
    .registers 1

    .line 53
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->onNativeCaptionButtonController(Landroid/widget/ImageView;)V

    return-void
.end method

.method public static onNativeCaptionButtonController(Landroid/widget/ImageView;)V
    .registers 2

    if-nez p0, :cond_3

    return-void

    .line 53
    :cond_3
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2$$ExternalSyntheticLambda0;-><init>(Landroid/widget/ImageView;)V

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static onPlayerType(Ljava/lang/Enum;)V
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum<",
            "*>;)V"
        }
    .end annotation

    .line 38
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->onPlayerType(Ljava/lang/Enum;)V

    .line 42
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->forceNativeRendererScan()V

    .line 43
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->kick()V

    return-void
.end method

.method public static onVideoId(Ljava/lang/String;)V
    .registers 1

    .line 32
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->onVideoId(Ljava/lang/String;)V

    .line 33
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->onVideoId(Ljava/lang/String;)V

    .line 34
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->forceNativeRendererScan()V

    return-void
.end method

.method public static onVideoTime(J)V
    .registers 4

    const-wide/16 v0, 0x0

    .line 59
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    .line 60
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->onVideoTime(J)V

    .line 61
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->kick()V

    return-void
.end method

.method public static rewriteUrl(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 65
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;->appContext:Landroid/content/Context;

    if-eqz v0, :cond_e

    .line 66
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v1

    iget-boolean v1, v1, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->enabled:Z

    if-eqz v1, :cond_e

    const/4 v1, 0x1

    goto :goto_f

    :cond_e
    const/4 v1, 0x0

    :goto_f
    if-eqz v1, :cond_16

    .line 73
    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->restoreForNextVideo(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_17

    :cond_16
    move-object v2, p1

    .line 76
    :goto_17
    invoke-static {p0, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->rewriteUrl(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 80
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->forceNativeRendererScan()V

    .line 81
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->kick()V

    if-eqz v1, :cond_66

    .line 84
    invoke-static {v2, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;->concreteAiUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 85
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_30

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->noteAiTarget(Ljava/lang/String;)V

    :cond_30
    if-eqz p1, :cond_66

    .line 87
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_66

    .line 88
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object p1

    .line 89
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u5207\u6362\u5230\u65b0\u89c6\u9891\u540e\u6062\u590d\u9ed8\u8ba4 AI \u5b57\u5e55"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-nez p1, :cond_48

    .line 93
    const-string p1, ""

    goto :goto_5a

    :cond_48
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\uff1b\u76ee\u6807 "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->promptLabel()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_5a
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 89
    const-string v1, "VIDEO_DEFAULT_AI_RESTORED"

    invoke-static {v0, v1, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_66
    return-object p0
.end method

.method public static setMainActivity(Landroid/app/Activity;)V
    .registers 2

    if-eqz p0, :cond_8

    .line 19
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;->appContext:Landroid/content/Context;

    .line 23
    :cond_8
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->setActivity(Landroid/app/Activity;)V

    .line 24
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->setMainActivity(Landroid/app/Activity;)V

    .line 25
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->kick()V

    return-void
.end method
