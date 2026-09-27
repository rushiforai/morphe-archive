.class final Lapp/yydarlinker/deepseekcaptions/PageCaptionController;
.super Ljava/lang/Object;
.source "PageCaptionController.java"


# static fields
.field private static volatile currentId:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static activate(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 19
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->activate(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static currentVideoIdSnapshot()Ljava/lang/String;
    .registers 1

    .line 8
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentId:Ljava/lang/String;

    return-object v0
.end method

.method static deactivateFromCaptionButton()V
    .registers 0

    .line 12
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->deactivateFromCaptionButton()V

    return-void
.end method

.method static deactivateFromNativeCaptionState()V
    .registers 0

    .line 13
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->deactivateFromNativeCaptionState()V

    return-void
.end method

.method static isVisibleActive()Z
    .registers 1

    .line 11
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->isVisibleActive()Z

    move-result v0

    return v0
.end method

.method static observeTimedTextUrl(Ljava/lang/String;)V
    .registers 1

    .line 21
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->observeTimedTextUrl(Ljava/lang/String;)V

    return-void
.end method

.method static onPlayerStable()V
    .registers 0

    return-void
.end method

.method static onPlayerType(Ljava/lang/String;)V
    .registers 1

    .line 15
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->onPlayerType(Ljava/lang/String;)V

    return-void
.end method

.method static onVideoId(Ljava/lang/String;)V
    .registers 2

    if-nez p0, :cond_5

    .line 17
    const-string v0, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :goto_9
    sput-object v0, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentId:Ljava/lang/String;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->onVideoId(Ljava/lang/String;)V

    sget-object p0, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentId:Ljava/lang/String;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->onVideoId(Ljava/lang/String;)V

    return-void
.end method

.method static onVideoTime(J)V
    .registers 2

    .line 22
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->onVideoTime(J)V

    return-void
.end method

.method static prewarm(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 20
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->prewarm(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static refreshConfiguration(Landroid/content/Context;)V
    .registers 1

    .line 18
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->refreshConfiguration(Landroid/content/Context;)V

    return-void
.end method

.method static restoreTargetAfterMiniplayer(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 16
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->restoreTargetAfterMiniplayer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static setMainActivity(Landroid/app/Activity;)V
    .registers 2

    if-eqz p0, :cond_7

    .line 14
    const-string v0, "contextual_unit_v1"

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->onCoreSelected(Landroid/content/Context;Ljava/lang/String;)V

    :cond_7
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->setMainActivity(Landroid/app/Activity;)V

    return-void
.end method

.method static videoIdFromUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 24
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    .line 25
    :cond_5
    :try_start_5
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const-string v1, "v"

    invoke-virtual {p0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_f} :catch_13

    if-nez p0, :cond_12

    return-object v0

    :cond_12
    return-object p0

    :catch_13
    return-object v0
.end method
