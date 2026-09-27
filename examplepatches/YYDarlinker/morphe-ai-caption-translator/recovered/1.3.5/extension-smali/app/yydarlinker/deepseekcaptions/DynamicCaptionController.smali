.class final Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;
.super Ljava/lang/Object;
.source "DynamicCaptionController.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static activate(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 49
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->activate(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static deactivateFromCaptionButton()V
    .registers 0

    .line 21
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->deactivateFromCaptionButton()V

    return-void
.end method

.method static deactivateFromNativeCaptionState()V
    .registers 0

    .line 25
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->deactivateFromNativeCaptionState()V

    return-void
.end method

.method static isVisibleActive()Z
    .registers 1

    .line 17
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->isVisibleActive()Z

    move-result v0

    return v0
.end method

.method static observeTimedTextUrl(Ljava/lang/String;)V
    .registers 1

    .line 57
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->observeTimedTextUrl(Ljava/lang/String;)V

    return-void
.end method

.method static onPlayerType(Ljava/lang/String;)V
    .registers 1

    .line 33
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->onPlayerType(Ljava/lang/String;)V

    return-void
.end method

.method static onVideoId(Ljava/lang/String;)V
    .registers 1

    .line 41
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->onVideoId(Ljava/lang/String;)V

    return-void
.end method

.method static onVideoTime(J)V
    .registers 2

    .line 61
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->onVideoTime(J)V

    return-void
.end method

.method static prewarm(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 53
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->prewarm(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static refreshConfiguration(Landroid/content/Context;)V
    .registers 1

    .line 45
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->refreshConfiguration(Landroid/content/Context;)V

    return-void
.end method

.method static restoreTargetAfterMiniplayer(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 37
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->restoreTargetAfterMiniplayer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static setMainActivity(Landroid/app/Activity;)V
    .registers 1

    .line 29
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->setMainActivity(Landroid/app/Activity;)V

    return-void
.end method
