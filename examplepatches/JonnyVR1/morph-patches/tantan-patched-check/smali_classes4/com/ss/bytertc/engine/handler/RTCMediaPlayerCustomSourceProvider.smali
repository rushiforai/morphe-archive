.class public Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mCustomSourceProvider:Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;


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
.method public onReadData(Ljava/nio/ByteBuffer;I)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;->mCustomSourceProvider:Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;->onReadData(Ljava/nio/ByteBuffer;I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    sget-object p0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_WRONG_STATE:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public onSeek(JI)J
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;->mCustomSourceProvider:Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p3}, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceSeekWhence;->fromId(I)Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceSeekWhence;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-interface {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;->onSeek(JLcom/ss/bytertc/engine/data/MediaPlayerCustomSourceSeekWhence;)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    return-wide p0

    .line 14
    :cond_0
    sget-object p0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_WRONG_STATE:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    int-to-long p0, p0

    .line 21
    return-wide p0
.end method

.method public setCustomSourceProvider(Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;->mCustomSourceProvider:Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;

    .line 2
    .line 3
    return-void
.end method
