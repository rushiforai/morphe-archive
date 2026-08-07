.class public abstract Ltv/danmaku/ijk/media/player/BaseMediaPlayer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer;


# instance fields
.field private mIsLogEnabled:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getAudioTrackNum()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public getCurrentPts()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getRate()F
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getVideoDarDen()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public getVideoDarNum()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public getVideoSarDen()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public getVideoSarNum()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public isLogEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/player/BaseMediaPlayer;->mIsLogEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPlayable()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public setAudioStreamType(I)V
    .locals 0

    return-void
.end method

.method public setKeepInBackground(Z)V
    .locals 0

    return-void
.end method

.method public setLogEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/BaseMediaPlayer;->mIsLogEnabled:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPlayback(Z)V
    .locals 0

    return-void
.end method

.method public setRate(F)V
    .locals 0

    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    return-void
.end method

.method public setWakeMode(Landroid/content/Context;I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method
