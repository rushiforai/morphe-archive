.class final Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;
.super Ljava/lang/Object;
.source "CaptionVideoHandoffV2.java"


# static fields
.field private static final WINDOW_MS:J = 0x2ee0L

.field private static volatile currentVideoId:Ljava/lang/String; = ""

.field private static volatile pendingUntilMs:J = 0x0L

.field private static volatile pendingVideoId:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static arm(Ljava/lang/String;)V
    .registers 5

    if-nez p0, :cond_5

    .line 98
    const-string p0, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :goto_9
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->pendingVideoId:Ljava/lang/String;

    .line 99
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->pendingVideoId:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_16

    const-wide/16 v0, 0x0

    goto :goto_1d

    .line 101
    :cond_16
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-wide/16 v2, 0x2ee0

    add-long/2addr v0, v2

    :goto_1d
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->pendingUntilMs:J

    return-void
.end method

.method private static clearPending()V
    .registers 2

    .line 105
    const-string v0, ""

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->pendingVideoId:Ljava/lang/String;

    const-wide/16 v0, 0x0

    .line 106
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->pendingUntilMs:J

    return-void
.end method

.method static noteAiTarget(Ljava/lang/String;)V
    .registers 2

    .line 49
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->pendingVideoId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_1c

    .line 50
    :cond_9
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1d

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->pendingVideoId:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1c

    goto :goto_1d

    :cond_1c
    :goto_1c
    return-void

    :cond_1d
    :goto_1d
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->clearPending()V

    return-void
.end method

.method static onExplicitNativeSelection()V
    .registers 0

    .line 44
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->clearPending()V

    return-void
.end method

.method static onVideoId(Ljava/lang/String;)V
    .registers 3

    if-nez p0, :cond_5

    .line 26
    const-string p0, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 27
    :goto_9
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_10

    goto :goto_34

    .line 28
    :cond_10
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->currentVideoId:Ljava/lang/String;

    .line 29
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->currentVideoId:Ljava/lang/String;

    .line 30
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_34

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    goto :goto_34

    .line 35
    :cond_21
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->memoryInstalled()Z

    move-result v0

    if-eqz v0, :cond_31

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->isOn()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 36
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->arm(Ljava/lang/String;)V

    return-void

    .line 38
    :cond_31
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->clearPending()V

    :cond_34
    :goto_34
    return-void
.end method

.method static restoreForNextVideo(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    if-eqz p0, :cond_6a

    if-eqz p1, :cond_6a

    .line 62
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->pendingVideoId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6a

    .line 63
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_13

    goto :goto_6a

    .line 67
    :cond_13
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 68
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->pendingUntilMs:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_21

    .line 69
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->clearPending()V

    return-object p1

    .line 73
    :cond_21
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 74
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_34

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->pendingVideoId:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_34

    goto :goto_6a

    .line 78
    :cond_34
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->mayActivateAiTarget()Z

    move-result v0

    if-nez v0, :cond_3e

    .line 79
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->clearPending()V

    return-object p1

    .line 83
    :cond_3e
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->defaultTargetLanguage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    .line 84
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionVideoHandoffV2;->clearPending()V

    if-eqz p0, :cond_6a

    .line 85
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_52

    goto :goto_6a

    .line 87
    :cond_52
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v0

    .line 88
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    if-eqz v0, :cond_65

    .line 89
    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->code:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_65

    goto :goto_6a

    .line 94
    :cond_65
    invoke-static {p1, p0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->withCode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_6a
    :goto_6a
    return-object p1
.end method

.method private static videoId(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 111
    const-string v0, ""

    :try_start_2
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    .line 112
    const-string v1, "v"

    invoke-virtual {p0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_14

    .line 113
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1a

    :cond_14
    const-string v1, "video_id"

    invoke-virtual {p0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_1a
    if-nez v1, :cond_1d

    return-object v0

    .line 114
    :cond_1d
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0
    :try_end_21
    .catchall {:try_start_2 .. :try_end_21} :catchall_22

    return-object p0

    :catchall_22
    return-object v0
.end method
