.class public abstract Ltv/danmaku/ijk/media/source/audio/audioSource;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected a:Lcom/immomo/mediacore/audio/AudioQuality;

.field protected b:Lcom/immomo/mediacore/audio/AudioQuality;

.field private c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;",
            ">;"
        }
    .end annotation
.end field

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;",
            ">;"
        }
    .end annotation
.end field

.field e:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/immomo/mediacore/audio/AudioQuality;->DEFAULT_AUDIO_QUALITY:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioQuality;->clone()Lcom/immomo/mediacore/audio/AudioQuality;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/audio/audioSource;->a:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioQuality;->clone()Lcom/immomo/mediacore/audio/AudioQuality;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/audio/audioSource;->b:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/audio/audioSource;->c:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/audio/audioSource;->d:Ljava/util/List;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput v0, p0, Ltv/danmaku/ijk/media/source/audio/audioSource;->e:I

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/audio/audioSource;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/audioSource;->d:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/audio/audioSource;->d:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public c(Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/audioSource;->d:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/audio/audioSource;->d:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    return-void
.end method
