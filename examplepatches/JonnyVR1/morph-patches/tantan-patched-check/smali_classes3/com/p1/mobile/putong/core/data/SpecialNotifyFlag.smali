.class public Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static MINE_PLAY_ANIM_TIME:J = 0x7d0L


# instance fields
.field private AUDIO_MAX_TIME:J

.field private audioExpTime:J

.field private hasPlayAnim:Z

.field private hasPlayAudio:Z

.field private latestPlayAnimTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0xea60

    .line 5
    .line 6
    .line 7
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->AUDIO_MAX_TIME:J

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->hasPlayAudio:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->hasPlayAnim:Z

    .line 13
    .line 14
    const-wide/16 v0, -0x1

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->latestPlayAnimTime:J

    .line 17
    .line 18
    invoke-static {}, Ll/pzi0;->o()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->AUDIO_MAX_TIME:J

    .line 23
    .line 24
    add-long/2addr v0, v2

    .line 25
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->audioExpTime:J

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public checkAndPlayAnimOnce()Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->hasPlayAnim:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->hasPlayAnim:Z

    .line 7
    .line 8
    invoke-static {}, Ll/pzi0;->o()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->latestPlayAnimTime:J

    .line 13
    .line 14
    sub-long/2addr v1, v3

    .line 15
    sget-wide v3, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->MINE_PLAY_ANIM_TIME:J

    .line 16
    .line 17
    cmp-long v1, v1, v3

    .line 18
    .line 19
    if-ltz v1, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->latestPlayAnimTime:J

    .line 26
    .line 27
    return v0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public checkAndPlayAudioOnce()Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->hasPlayAudio:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->hasPlayAudio:Z

    .line 7
    .line 8
    invoke-static {}, Ll/pzi0;->o()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->audioExpTime:J

    .line 13
    .line 14
    cmp-long p0, v1, v3

    .line 15
    .line 16
    if-gez p0, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public reset()V
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->AUDIO_MAX_TIME:J

    .line 6
    .line 7
    add-long/2addr v0, v2

    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->audioExpTime:J

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->hasPlayAudio:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->hasPlayAnim:Z

    .line 14
    .line 15
    return-void
.end method
