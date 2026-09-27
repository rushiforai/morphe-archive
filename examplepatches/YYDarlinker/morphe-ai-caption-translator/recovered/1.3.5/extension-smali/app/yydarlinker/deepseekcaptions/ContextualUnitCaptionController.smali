.class final Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;
.super Ljava/lang/Object;
.source "ContextualUnitCaptionController.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static activate(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 49
    invoke-static {p0, p1, v0, v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->activate(Landroid/content/Context;Ljava/lang/String;ZZ)V

    return-void
.end method

.method static activateSource(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x1

    .line 53
    invoke-static {p0, p1, v0, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->activate(Landroid/content/Context;Ljava/lang/String;ZZ)V

    return-void
.end method

.method static activeTranslatedUrl()Ljava/lang/String;
    .registers 1

    .line 13
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->activeUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static deactivateForCoreSwitch()V
    .registers 0

    .line 25
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->stop()V

    return-void
.end method

.method static deactivateFromCaptionButton()V
    .registers 0

    .line 17
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->stop()V

    return-void
.end method

.method static deactivateFromNativeCaptionState()V
    .registers 0

    .line 21
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->stop()V

    return-void
.end method

.method static isVisibleActive()Z
    .registers 1

    .line 9
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->visible()Z

    move-result v0

    return v0
.end method

.method static observeTimedTextUrl(Ljava/lang/String;)V
    .registers 1

    .line 61
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->observe(Ljava/lang/String;)V

    return-void
.end method

.method static onPlayerType(Ljava/lang/String;)V
    .registers 1

    .line 33
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->player(Ljava/lang/String;)V

    return-void
.end method

.method static onVideoId(Ljava/lang/String;)V
    .registers 1

    .line 41
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->video(Ljava/lang/String;)V

    return-void
.end method

.method static onVideoTime(J)V
    .registers 2

    .line 65
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->time(J)V

    return-void
.end method

.method static prewarm(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 57
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->prewarm(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static refreshConfiguration(Landroid/content/Context;)V
    .registers 1

    .line 45
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->refresh(Landroid/content/Context;)V

    return-void
.end method

.method static restoreTargetAfterMiniplayer(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 37
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->restore(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static setMainActivity(Landroid/app/Activity;)V
    .registers 1

    .line 29
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->activity(Landroid/app/Activity;)V

    return-void
.end method
