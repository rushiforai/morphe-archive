.class public Lcom/devbrackets/android/exomedia/ui/widget/VideoView;
.super Landroid/widget/RelativeLayout;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;,
        Lcom/devbrackets/android/exomedia/ui/widget/VideoView$TouchListener;,
        Lcom/devbrackets/android/exomedia/ui/widget/VideoView$MuxNotifier;,
        Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AudioFocusHelper;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field public audioFocusHelper:Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AudioFocusHelper;

.field public audioManager:Landroid/media/AudioManager;

.field public deviceUtil:Lcom/devbrackets/android/exomedia/util/DeviceUtil;

.field public handleAudioFocus:Z

.field public listenerMux:Lcom/devbrackets/android/exomedia/core/ListenerMux;

.field public matchOverridePositionSpeed:Z

.field public muxNotifier:Lcom/devbrackets/android/exomedia/ui/widget/VideoView$MuxNotifier;

.field public overriddenDuration:J

.field public overriddenPositionStopWatch:Lcom/devbrackets/android/exomedia/util/StopWatch;

.field public overridePosition:Z

.field public positionOffset:J

.field public previewImageView:Landroid/widget/ImageView;

.field public releaseOnDetachFromWindow:Z

.field public videoControls:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsCore;

.field public videoUri:Landroid/net/Uri;

.field public videoViewImpl:Lcom/devbrackets/android/exomedia/core/api/VideoViewApi;


# virtual methods
.method public getVideoViewApiImplementation(Landroid/content/Context;Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;)I
    .registers 4

    iget-object v0, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->deviceUtil:Lcom/devbrackets/android/exomedia/util/DeviceUtil;

    invoke-virtual {v0, p1}, Lcom/devbrackets/android/exomedia/util/DeviceUtil;->supportsExoPlayer(Landroid/content/Context;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    if-eqz p1, :cond_d

    iget p1, p2, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->apiImplLegacyResourceId:I

    goto :goto_f

    :cond_d
    iget p1, p2, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->apiImplResourceId:I

    :goto_f
    return p1
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .registers 2

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    return-void
.end method

.method public start()V
    .registers 3

    invoke-static {p0}, Le/e/a/PlaybackTransfer221;->allowStart(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->audioFocusHelper:Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AudioFocusHelper;

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AudioFocusHelper;->requestFocus()Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->videoViewImpl:Lcom/devbrackets/android/exomedia/core/api/VideoViewApi;

    invoke-interface {v0}, Lcom/devbrackets/android/exomedia/core/api/VideoViewApi;->start()V

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/view/View;->setKeepScreenOn(Z)V

    iget-object v0, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->videoControls:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsCore;

    if-eqz v0, :cond_1e

    invoke-virtual {v0, v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsCore;->updatePlaybackState(Z)V

    :cond_1e
    return-void
.end method
