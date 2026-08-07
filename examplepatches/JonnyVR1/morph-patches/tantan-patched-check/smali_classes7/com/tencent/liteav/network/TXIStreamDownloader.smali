.class public abstract Lcom/tencent/liteav/network/TXIStreamDownloader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/network/TXIStreamDownloader$a;
    }
.end annotation


# instance fields
.field public connectRetryInterval:I

.field public connectRetryLimit:I

.field public connectRetryTimes:I

.field protected mApplicationContext:Landroid/content/Context;

.field protected mEnableMessage:Z

.field protected mEnableMetaData:Z

.field protected mFlvSessionKey:Ljava/lang/String;

.field protected mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mIsRunning:Z

.field protected mListener:Lcom/tencent/liteav/network/f;

.field protected mNotifyListener:Lcom/tencent/liteav/basic/b/b;

.field protected mOriginUrl:Ljava/lang/String;

.field protected mRestartListener:Lcom/tencent/liteav/network/TXIStreamDownloader$a;

.field protected mUserID:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mListener:Lcom/tencent/liteav/network/f;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mNotifyListener:Lcom/tencent/liteav/basic/b/b;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mRestartListener:Lcom/tencent/liteav/network/TXIStreamDownloader$a;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mIsRunning:Z

    .line 13
    .line 14
    const-string v1, ""

    .line 15
    .line 16
    iput-object v1, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mOriginUrl:Ljava/lang/String;

    .line 17
    .line 18
    iput v0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->connectRetryTimes:I

    .line 19
    .line 20
    const/4 v2, 0x3

    .line 21
    iput v2, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->connectRetryLimit:I

    .line 22
    .line 23
    iput v2, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->connectRetryInterval:I

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mEnableMessage:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mEnableMetaData:Z

    .line 28
    .line 29
    iput-object v1, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mFlvSessionKey:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mUserID:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p1, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mApplicationContext:Landroid/content/Context;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public PushAudioFrame([BIJI)V
    .locals 0

    return-void
.end method

.method public PushVideoFrame([BIJJI)V
    .locals 0

    return-void
.end method

.method public getConnectCountQuic()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getConnectCountTcp()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getCurrentStreamUrl()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getCurrentTS()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getDownloadStats()Lcom/tencent/liteav/network/TXCStreamDownloader$DownloadStats;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getFlvSessionKey()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mFlvSessionKey:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLastIFrameTS()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getRealStreamUrl()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public isQuicChannel()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onRecvAudioData([BIII)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mListener:Lcom/tencent/liteav/network/f;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/liteav/basic/structs/a;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tencent/liteav/basic/structs/a;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, v0, Lcom/tencent/liteav/basic/structs/a;->f:[B

    .line 11
    .line 12
    int-to-long p1, p2

    .line 13
    iput-wide p1, v0, Lcom/tencent/liteav/basic/structs/a;->e:J

    .line 14
    .line 15
    const/16 p1, 0xa

    .line 16
    .line 17
    const/4 p2, 0x2

    .line 18
    if-ne p3, p1, :cond_1

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    if-ne p4, p1, :cond_0

    .line 22
    .line 23
    iput p2, v0, Lcom/tencent/liteav/basic/structs/a;->d:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p1, 0x3

    .line 27
    iput p1, v0, Lcom/tencent/liteav/basic/structs/a;->d:I

    .line 28
    .line 29
    :goto_0
    iget p1, v0, Lcom/tencent/liteav/basic/structs/a;->d:I

    .line 30
    .line 31
    if-ne p1, p2, :cond_1

    .line 32
    .line 33
    const/16 p1, 0x10

    .line 34
    .line 35
    iput p1, v0, Lcom/tencent/liteav/basic/structs/a;->c:I

    .line 36
    .line 37
    :cond_1
    if-ne p3, p2, :cond_2

    .line 38
    .line 39
    const/4 p1, 0x5

    .line 40
    iput p1, v0, Lcom/tencent/liteav/basic/structs/a;->d:I

    .line 41
    .line 42
    :cond_2
    iput p3, v0, Lcom/tencent/liteav/basic/structs/a;->h:I

    .line 43
    .line 44
    iput p4, v0, Lcom/tencent/liteav/basic/structs/a;->g:I

    .line 45
    .line 46
    iget-object p0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mListener:Lcom/tencent/liteav/network/f;

    .line 47
    .line 48
    invoke-interface {p0, v0}, Lcom/tencent/liteav/network/f;->onPullAudio(Lcom/tencent/liteav/basic/structs/a;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    return-void
.end method

.method public onRecvMetaData(Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mNotifyListener:Lcom/tencent/liteav/basic/b/b;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v1, "EVT_GET_METADATA"

    .line 19
    .line 20
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mNotifyListener:Lcom/tencent/liteav/basic/b/b;

    .line 24
    .line 25
    const/16 p1, 0x7ec

    .line 26
    .line 27
    invoke-interface {p0, p1, v0}, Lcom/tencent/liteav/basic/b/b;->onNotifyEvent(ILandroid/os/Bundle;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public onRecvSEIData([B)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mNotifyListener:Lcom/tencent/liteav/basic/b/b;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Landroid/os/Bundle;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "EVT_GET_MSG"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mNotifyListener:Lcom/tencent/liteav/basic/b/b;

    .line 21
    .line 22
    const/16 p1, 0x7dc

    .line 23
    .line 24
    invoke-interface {p0, p1, v0}, Lcom/tencent/liteav/basic/b/b;->onNotifyEvent(ILandroid/os/Bundle;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public onRecvVideoData([BIJJI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mListener:Lcom/tencent/liteav/network/f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tencent/liteav/basic/structs/TXSNALPacket;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 11
    .line 12
    iput p2, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 13
    .line 14
    iput-wide p3, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->dts:J

    .line 15
    .line 16
    iput-wide p5, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 17
    .line 18
    iput p7, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->codecId:I

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mListener:Lcom/tencent/liteav/network/f;

    .line 21
    .line 22
    invoke-interface {p0, v0}, Lcom/tencent/liteav/network/f;->onPullNAL(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public requestKeyFrame(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public sendNotifyEvent(I)V
    .locals 1

    .line 21
    iget-object p0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mNotifyListener:Lcom/tencent/liteav/basic/b/b;

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    .line 22
    invoke-interface {p0, p1, v0}, Lcom/tencent/liteav/basic/b/b;->onNotifyEvent(ILandroid/os/Bundle;)V

    :cond_0
    return-void
.end method

.method public sendNotifyEvent(ILjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mNotifyListener:Lcom/tencent/liteav/basic/b/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "EVT_MSG"

    .line 11
    .line 12
    invoke-virtual {v0, v1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mNotifyListener:Lcom/tencent/liteav/basic/b/b;

    .line 16
    .line 17
    invoke-interface {p0, p1, v0}, Lcom/tencent/liteav/basic/b/b;->onNotifyEvent(ILandroid/os/Bundle;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setFlvSessionKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mFlvSessionKey:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setHeaders(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mHeaders:Ljava/util/Map;

    .line 2
    .line 3
    return-void
.end method

.method public setListener(Lcom/tencent/liteav/network/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mListener:Lcom/tencent/liteav/network/f;

    .line 2
    .line 3
    return-void
.end method

.method public setNotifyListener(Lcom/tencent/liteav/basic/b/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mNotifyListener:Lcom/tencent/liteav/basic/b/b;

    .line 2
    .line 3
    return-void
.end method

.method public setOriginUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mOriginUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRestartListener(Lcom/tencent/liteav/network/TXIStreamDownloader$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mRestartListener:Lcom/tencent/liteav/network/TXIStreamDownloader$a;

    .line 2
    .line 3
    return-void
.end method

.method public setUserID(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXIStreamDownloader;->mUserID:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public abstract startDownload(Ljava/util/Vector;ZZZZ)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Vector<",
            "Lcom/tencent/liteav/network/e;",
            ">;ZZZZ)V"
        }
    .end annotation
.end method

.method public abstract stopDownload()V
.end method
