.class public final Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;
.super Ljava/lang/Object;
.source "DeepSeekCaptionHook.java"


# static fields
.field private static final CLOSED_TRANSLATION_SINK:Ljava/lang/String; = "http://127.0.0.1:9/deepseek-caption-unavailable"

.field private static volatile appContext:Landroid/content/Context;

.field private static volatile youtubeCronetEngine:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static context()Landroid/content/Context;
    .registers 4

    .line 212
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->appContext:Landroid/content/Context;

    if-eqz v0, :cond_5

    goto :goto_20

    .line 215
    :cond_5
    :try_start_5
    const-string v1, "android.app.ActivityThread"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 216
    const-string v2, "currentApplication"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 217
    invoke-virtual {v1, v3, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Application;

    if-eqz v1, :cond_20

    .line 219
    invoke-virtual {v1}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 220
    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->appContext:Landroid/content/Context;
    :try_end_20
    .catchall {:try_start_5 .. :try_end_20} :catchall_20

    :catchall_20
    :cond_20
    :goto_20
    return-object v0
.end method

.method static isAutoTranslatedCaptionUrl(Ljava/lang/String;)Z
    .registers 1

    .line 188
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object p0

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method static isYouTubeTimedTextUrl(Ljava/lang/String;)Z
    .registers 4

    const/4 v0, 0x0

    if-eqz p0, :cond_7d

    .line 192
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0xc

    if-lt v1, v2, :cond_7d

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x6000

    if-le v1, v2, :cond_14

    goto :goto_7d

    :cond_14
    const/16 v1, 0xd

    .line 193
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_7d

    const/16 v1, 0xa

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_25

    goto :goto_7d

    .line 195
    :cond_25
    :try_start_25
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    .line 196
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 197
    const-string v2, "https"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3e

    const-string v2, "http"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3e

    return v0

    .line 198
    :cond_3e
    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_45

    return v0

    .line 200
    :cond_45
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 201
    const-string v2, "youtube.com"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5c

    const-string v2, ".youtube.com"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5c

    return v0

    .line 202
    :cond_5c
    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_63

    return v0

    .line 204
    :cond_63
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 205
    const-string v1, "/api/timedtext"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7b

    const-string v1, "/timedtext"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0
    :try_end_77
    .catchall {:try_start_25 .. :try_end_77} :catchall_7d

    if-eqz p0, :cond_7a

    goto :goto_7b

    :cond_7a
    return v0

    :cond_7b
    :goto_7b
    const/4 p0, 0x1

    return p0

    :catchall_7d
    :cond_7d
    :goto_7d
    return v0
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

    if-eqz p0, :cond_c

    .line 48
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    .line 49
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->onPlayerType(Ljava/lang/String;)V

    .line 50
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->onPlayerType(Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_2 .. :try_end_c} :catchall_c

    :catchall_c
    :cond_c
    return-void
.end method

.method public static onVideoId(Ljava/lang/String;)V
    .registers 2

    .line 38
    :try_start_0
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->context()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->onVideoId(Landroid/content/Context;Ljava/lang/String;)V

    .line 39
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->onVideoId(Ljava/lang/String;)V

    .line 40
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->onVideoId(Ljava/lang/String;)V
    :try_end_d
    .catchall {:try_start_0 .. :try_end_d} :catchall_d

    :catchall_d
    return-void
.end method

.method public static onVideoTime(J)V
    .registers 4

    .line 58
    :try_start_0
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->onVideoTime(J)V

    .line 59
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->context()Landroid/content/Context;

    move-result-object v0

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v1

    invoke-static {v0, p0, p1, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->onVideoTime(Landroid/content/Context;JZ)V
    :try_end_e
    .catchall {:try_start_0 .. :try_end_e} :catchall_e

    :catchall_e
    return-void
.end method

.method static openWithYouTubeCronet(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    .registers 9

    .line 169
    const-string v0, "openConnection"

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->youtubeCronetEngine:Ljava/lang/Object;

    const/4 v2, 0x0

    if-eqz v1, :cond_49

    if-nez p0, :cond_a

    goto :goto_49

    :cond_a
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 172
    :try_start_c
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    new-array v6, v4, [Ljava/lang/Class;

    const-class v7, Ljava/net/URL;

    aput-object v7, v6, v3

    invoke-virtual {v5, v0, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 173
    new-array v6, v4, [Ljava/lang/Object;

    aput-object p0, v6, v3

    invoke-virtual {v5, v1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 174
    instance-of v6, v5, Ljava/net/HttpURLConnection;

    if-eqz v6, :cond_29

    check-cast v5, Ljava/net/HttpURLConnection;
    :try_end_28
    .catchall {:try_start_c .. :try_end_28} :catchall_2a

    return-object v5

    :cond_29
    return-object v2

    .line 177
    :catchall_2a
    :try_start_2a
    const-string v5, "org.chromium.net.CronetEngine"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 178
    new-array v6, v4, [Ljava/lang/Class;

    const-class v7, Ljava/net/URL;

    aput-object v7, v6, v3

    invoke-virtual {v5, v0, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 179
    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v3

    invoke-virtual {v0, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 180
    instance-of v0, p0, Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_49

    check-cast p0, Ljava/net/HttpURLConnection;
    :try_end_48
    .catchall {:try_start_2a .. :try_end_48} :catchall_49

    move-object v2, p0

    :catchall_49
    :cond_49
    :goto_49
    return-object v2
.end method

.method public static rewriteUrl(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 65
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->context()Landroid/content/Context;

    move-result-object v0

    if-eqz p0, :cond_8

    .line 67
    :try_start_6
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->youtubeCronetEngine:Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_6 .. :try_end_8} :catchall_8

    :catchall_8
    :cond_8
    if-eqz v0, :cond_157

    .line 74
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->enabled(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_12

    goto/16 :goto_157

    .line 78
    :cond_12
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->videoIdFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 79
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentVideoIdSnapshot()Ljava/lang/String;

    move-result-object v2

    .line 80
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_34

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_34

    .line 81
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_34

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    goto/16 :goto_157

    .line 84
    :cond_34
    const-string v1, "http://127.0.0.1:9/deepseek-caption-unavailable"

    if-eqz v0, :cond_5d

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->enabled(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_5d

    .line 85
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5d

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v2

    if-eqz v2, :cond_5d

    .line 86
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->known()Z

    move-result v2

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->isOn()Z

    move-result v3

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->translates()Z

    move-result v4

    invoke-static {v2, v3, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionModePolicy;->mayTranslateSelection(ZZZ)Z

    move-result v2

    if-nez v2, :cond_5d

    return-object v1

    :cond_5d
    if-eqz v0, :cond_86

    .line 91
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v2

    iget-boolean v2, v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->enabled:Z

    if-eqz v2, :cond_86

    .line 92
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_86

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->known()Z

    move-result v2

    if-eqz v2, :cond_86

    .line 93
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->isOn()Z

    move-result v2

    if-eqz v2, :cond_85

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->translates()Z

    move-result v2

    if-nez v2, :cond_86

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v2

    if-eqz v2, :cond_86

    :cond_85
    return-object v1

    :cond_86
    if-eqz v0, :cond_b5

    .line 97
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v2

    iget-boolean v2, v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->enabled:Z

    if-eqz v2, :cond_b5

    .line 98
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b5

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v2

    if-nez v2, :cond_b5

    .line 99
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->isOn()Z

    move-result v2

    if-eqz v2, :cond_b5

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->translates()Z

    move-result v2

    if-nez v2, :cond_b5

    .line 100
    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->activateSource(Landroid/content/Context;Ljava/lang/String;)V

    .line 101
    :try_start_ab
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->get(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;

    move-result-object p0

    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->urlFor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_b3
    .catch Ljava/lang/Exception; {:try_start_ab .. :try_end_b3} :catch_b4

    return-object p0

    :catch_b4
    return-object v1

    .line 104
    :cond_b5
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->restoreTargetAfterMiniplayer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 105
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->restoreAfterLifecycle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_cb

    .line 107
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v5

    iget-boolean v5, v5, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->enabled:Z

    if-eqz v5, :cond_cb

    move v5, v3

    goto :goto_cc

    :cond_cb
    move v5, v4

    :goto_cc
    if-eqz v5, :cond_d2

    .line 110
    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->rewriteDefaultTarget(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 113
    :cond_d2
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v6

    if-eqz v6, :cond_ec

    .line 115
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v6

    if-nez v6, :cond_ea

    .line 116
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->mayActivateAiTarget()Z

    move-result v6

    if-nez v6, :cond_ea

    .line 117
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isAutoTranslatedCaptionUrl(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_ec

    :cond_ea
    move p1, v3

    goto :goto_ed

    :cond_ec
    move p1, v4

    :goto_ed
    if-eqz v5, :cond_f3

    if-eqz p1, :cond_f3

    move p1, v3

    goto :goto_f4

    :cond_f3
    move p1, v4

    :goto_f4
    if-eqz v0, :cond_fd

    .line 122
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->contextualUnitCoreEnabled(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_fd

    goto :goto_fe

    :cond_fd
    move v3, v4

    .line 124
    :goto_fe
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->videoIdFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 125
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentVideoIdSnapshot()Ljava/lang/String;

    move-result-object v5

    .line 120
    invoke-static {v3, p1, v4, v5}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCorePolicy;->shouldPassThroughUnresolvedActivation(ZZLjava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_119

    if-eqz v0, :cond_115

    .line 129
    const-string p0, "CONTEXTUAL_OWNER_UNRESOLVED_PASSTHROUGH"

    const-string p1, "\u5f53\u524d\u8bf7\u6c42\u7f3a\u5c11\u53ef\u9a8c\u8bc1 video owner\uff1b\u4fdd\u6301 YouTube timed-text \u539f\u751f\u76f4\u8fde"

    invoke-static {v0, p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    :cond_115
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->observeTimedTextUrl(Ljava/lang/String;)V

    return-object v2

    :cond_119
    if-eqz p0, :cond_120

    .line 141
    :try_start_11b
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->youtubeCronetEngine:Ljava/lang/Object;

    goto :goto_120

    :catchall_11e
    move-exception p0

    goto :goto_138

    :cond_120
    :goto_120
    if-nez p1, :cond_126

    .line 143
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->observeTimedTextUrl(Ljava/lang/String;)V

    return-object v2

    .line 147
    :cond_126
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->noteAiTrackSelected()V

    .line 148
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->noteAiTarget(Ljava/lang/String;)V

    .line 149
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->get(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;

    move-result-object p0

    invoke-virtual {p0, v2}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->urlFor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 150
    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->activate(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_137
    .catchall {:try_start_11b .. :try_end_137} :catchall_11e

    return-object p0

    .line 153
    :goto_138
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->context()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_152

    .line 155
    const-string v3, "HOOK_ERROR"

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->errorDetail(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, v3, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_152

    .line 158
    :try_start_149
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->noteAiTrackSelected()V

    .line 159
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->noteAiTarget(Ljava/lang/String;)V

    .line 160
    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->activate(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_152
    .catchall {:try_start_149 .. :try_end_152} :catchall_152

    :catchall_152
    :cond_152
    if-eqz p1, :cond_155

    goto :goto_156

    :cond_155
    move-object v1, v2

    :goto_156
    return-object v1

    :cond_157
    :goto_157
    return-object p1
.end method

.method public static setMainActivity(Landroid/app/Activity;)V
    .registers 2

    if-eqz p0, :cond_8

    .line 25
    :try_start_2
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->appContext:Landroid/content/Context;

    .line 26
    :cond_8
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->appContext:Landroid/content/Context;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->install(Landroid/content/Context;)V

    .line 27
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->setActivity(Landroid/app/Activity;)V

    .line 28
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->setMainActivity(Landroid/app/Activity;)V

    .line 29
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->install(Landroid/app/Activity;)V

    .line 30
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->install(Landroid/app/Activity;)V

    .line 31
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->initialize(Landroid/content/Context;)V
    :try_end_1c
    .catchall {:try_start_2 .. :try_end_1c} :catchall_1c

    :catchall_1c
    return-void
.end method
