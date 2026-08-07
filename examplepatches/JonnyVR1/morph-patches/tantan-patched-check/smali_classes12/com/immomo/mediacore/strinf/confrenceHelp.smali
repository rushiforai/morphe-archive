.class public abstract Lcom/immomo/mediacore/strinf/confrenceHelp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediacore/strinf/NotifyCenter;


# instance fields
.field private mADevStatusCallback:Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;

.field private mCaptureType:I

.field private mCaptureTypeMap:[I

.field private mJsonDateCallback:Lcom/immomo/mediacore/sink/ijkStreamerUtil$JsonDateCallback;

.field private mPcmDateCallback:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mPlaybackDateCallback:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mRecordDateCallback:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mCaptureType:I

    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    new-array v0, v0, [I

    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mCaptureTypeMap:[I

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPlaybackDateCallback:Ljava/util/List;

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mRecordDateCallback:Ljava/util/List;

    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPcmDateCallback:Ljava/util/List;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mJsonDateCallback:Lcom/immomo/mediacore/sink/ijkStreamerUtil$JsonDateCallback;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mADevStatusCallback:Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public getExternAudioDevStatusCallback()Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mADevStatusCallback:Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public getJsonDateCallback()Lcom/immomo/mediacore/sink/ijkStreamerUtil$JsonDateCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mJsonDateCallback:Lcom/immomo/mediacore/sink/ijkStreamerUtil$JsonDateCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPcmDateCallback()Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPcmDateCallback:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlaybackDateCallback()Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPlaybackDateCallback:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecordDateCallback()Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mRecordDateCallback:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStreamerCaptureType(I)I
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    if-le p1, v0, :cond_0

    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mCaptureTypeMap:[I

    .line 6
    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    return p0
.end method

.method public postPcmData(J[BIZ)V
    .locals 7

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPcmDateCallback:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v1, v0

    .line 26
    check-cast v1, Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 27
    .line 28
    move-wide v2, p1

    .line 29
    move-object v4, p3

    .line 30
    move v5, p4

    .line 31
    move v6, p5

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-interface/range {v1 .. v6}, Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;->onPcmDateCallback(J[BIZ)V

    .line 35
    .line 36
    .line 37
    :cond_0
    move-wide p1, v2

    .line 38
    move-object p3, v4

    .line 39
    move p4, v5

    .line 40
    move p5, v6

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return-void
.end method

.method public postPlaybackData(J[BIZ)V
    .locals 7

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPlaybackDateCallback:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    move-object v1, v0

    .line 18
    check-cast v1, Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;

    .line 19
    .line 20
    move-wide v2, p1

    .line 21
    move-object v4, p3

    .line 22
    move v5, p4

    .line 23
    move v6, p5

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-interface/range {v1 .. v6}, Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;->onPlaybackFrame(J[BIZ)V

    .line 27
    .line 28
    .line 29
    :cond_0
    move-wide p1, v2

    .line 30
    move-object p3, v4

    .line 31
    move p4, v5

    .line 32
    move p5, v6

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return-void
.end method

.method public postRecordFrame([BIZ)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mRecordDateCallback:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {v0, p1, p2, p3}, Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;->onRecordFrame([BIZ)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mRecordDateCallback:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mRecordDateCallback:Ljava/util/List;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPlaybackDateCallback:Ljava/util/List;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPlaybackDateCallback:Ljava/util/List;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPcmDateCallback:Ljava/util/List;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPcmDateCallback:Ljava/util/List;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mADevStatusCallback:Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    iput-object v1, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mADevStatusCallback:Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;

    .line 34
    .line 35
    :cond_3
    return-void
.end method

.method public removePcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPcmDateCallback:Ljava/util/List;

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
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPcmDateCallback:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public removePlaybackDateCallback(Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPlaybackDateCallback:Ljava/util/List;

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
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPlaybackDateCallback:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public removeRecordDateCallback(Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mRecordDateCallback:Ljava/util/List;

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
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mRecordDateCallback:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final setExternAudioDevStatusCallback(Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mADevStatusCallback:Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;

    .line 2
    .line 3
    return-void
.end method

.method public setJsonDataCallback(Lcom/immomo/mediacore/sink/ijkStreamerUtil$JsonDateCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mJsonDateCallback:Lcom/immomo/mediacore/sink/ijkStreamerUtil$JsonDateCallback;

    .line 2
    .line 3
    return-void
.end method

.method public setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPcmDateCallback:Ljava/util/List;

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
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPcmDateCallback:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setPlaybackDateCallback(Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPlaybackDateCallback:Ljava/util/List;

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
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mPlaybackDateCallback:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setRecordDateCallback(Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mRecordDateCallback:Ljava/util/List;

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
    iget-object p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mRecordDateCallback:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setStreamerCaptureType(II)V
    .locals 2

    .line 1
    iput p2, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mCaptureType:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p2, v0, :cond_0

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq p2, v1, :cond_0

    .line 8
    .line 9
    iput v0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mCaptureType:I

    .line 10
    .line 11
    :cond_0
    const/4 p2, 0x3

    .line 12
    if-le p1, p2, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    :cond_1
    iget-object p2, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mCaptureTypeMap:[I

    .line 16
    .line 17
    iget p0, p0, Lcom/immomo/mediacore/strinf/confrenceHelp;->mCaptureType:I

    .line 18
    .line 19
    aput p0, p2, p1

    .line 20
    .line 21
    return-void
.end method
