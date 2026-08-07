.class public Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/b/b;
.implements Lcom/tencent/liteav/videodecoder/f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;
    }
.end annotation


# static fields
.field private static final NEW_DECODER:Z = true

.field private static final TAG:Ljava/lang/String; = "TXCVideoDecoder"

.field private static mDecodeFirstFrameTS:J


# instance fields
.field private mDecFormat:Lorg/json/JSONArray;

.field private mDecoderCacheNum:I

.field private mDecoderHandler:Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;

.field mDecoderListener:Lcom/tencent/liteav/videodecoder/f;

.field private mEnableDecoderChange:Z

.field private mEnableLimitDecCache:Z

.field private mEnableRestartDecoder:Z

.field mHWDec:Z

.field mHevc:Z

.field private mNALList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tencent/liteav/basic/structs/TXSNALPacket;",
            ">;"
        }
    .end annotation
.end field

.field private mNativeContext:J

.field mNeedSortFrame:Z

.field private mNotifyListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;"
        }
    .end annotation
.end field

.field private mPps:Ljava/nio/ByteBuffer;

.field mRecvFirstFrame:Z

.field private mRestarting:Z

.field private mSps:Ljava/nio/ByteBuffer;

.field private mStreamType:I

.field mSurface:Landroid/view/Surface;

.field private mUserId:Ljava/lang/String;

.field mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

.field private mVideoHeight:I

.field private mVideoWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->f()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mRestarting:Z

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 8
    .line 9
    iput v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoWidth:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoHeight:I

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mEnableDecoderChange:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mEnableRestartDecoder:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mEnableLimitDecCache:Z

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecFormat:Lorg/json/JSONArray;

    .line 21
    .line 22
    new-instance v1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNALList:Ljava/util/ArrayList;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    iput-boolean v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHWDec:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHevc:Z

    .line 33
    .line 34
    iput-boolean v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNeedSortFrame:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mRecvFirstFrame:Z

    .line 37
    .line 38
    const-wide/16 v0, 0x0

    .line 39
    .line 40
    sput-wide v0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecodeFirstFrameTS:J

    .line 41
    .line 42
    return-void
.end method

.method private addOneNalToDecoder(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 5

    .line 1
    iget v0, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    new-instance v2, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v3, "iframe"

    .line 15
    .line 16
    invoke-virtual {v2, v3, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    const-string v0, "nal"

    .line 20
    .line 21
    iget-object v3, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 22
    .line 23
    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 24
    .line 25
    .line 26
    const-string v0, "pts"

    .line 27
    .line 28
    iget-wide v3, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 29
    .line 30
    invoke-virtual {v2, v0, v3, v4}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 31
    .line 32
    .line 33
    const-string v0, "dts"

    .line 34
    .line 35
    iget-wide v3, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->dts:J

    .line 36
    .line 37
    invoke-virtual {v2, v0, v3, v4}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 38
    .line 39
    .line 40
    const-string v0, "codecId"

    .line 41
    .line 42
    iget p1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->codecId:I

    .line 43
    .line 44
    invoke-virtual {v2, v0, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    new-instance p1, Landroid/os/Message;

    .line 48
    .line 49
    invoke-direct {p1}, Landroid/os/Message;-><init>()V

    .line 50
    .line 51
    .line 52
    const/16 v0, 0x65

    .line 53
    .line 54
    iput v0, p1, Landroid/os/Message;->what:I

    .line 55
    .line 56
    invoke-virtual {p1, v2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderHandler:Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;

    .line 60
    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 64
    .line 65
    .line 66
    :cond_1
    iget p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderCacheNum:I

    .line 67
    .line 68
    add-int/2addr p1, v1

    .line 69
    iput p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderCacheNum:I

    .line 70
    .line 71
    return-void
.end method

.method private decNALByNewWay(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 12

    .line 1
    iget-boolean v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHWDec:Z

    .line 2
    .line 3
    if-eqz v2, :cond_0

    .line 4
    .line 5
    iget-object v2, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 6
    .line 7
    iget-wide v3, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 8
    .line 9
    iget-wide v5, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->dts:J

    .line 10
    .line 11
    iget v7, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->rotation:I

    .line 12
    .line 13
    iget v8, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->codecId:I

    .line 14
    .line 15
    const/4 v10, 0x0

    .line 16
    iget v11, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 17
    .line 18
    const/4 v9, 0x0

    .line 19
    move-object v1, p0

    .line 20
    invoke-direct/range {v1 .. v11}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->decodeFrame([BJJIIIII)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    monitor-enter p0

    .line 25
    :try_start_0
    iget-wide v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 26
    .line 27
    iget-object v4, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 28
    .line 29
    iget v5, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 30
    .line 31
    iget-wide v6, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 32
    .line 33
    iget-wide v8, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->dts:J

    .line 34
    .line 35
    iget v10, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->rotation:I

    .line 36
    .line 37
    iget v11, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->codecId:I

    .line 38
    .line 39
    move-object v1, p0

    .line 40
    invoke-direct/range {v1 .. v11}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeDecodeFrame(J[BIJJII)V

    .line 41
    .line 42
    .line 43
    monitor-exit p0

    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception v0

    .line 46
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    throw v0
.end method

.method private decNALByOldWay(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 6

    .line 1
    const-string v0, "TXCVideoDecoder"

    .line 2
    .line 3
    :try_start_0
    iget v1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    move v1, v2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    :goto_0
    iget-boolean v3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mRecvFirstFrame:Z

    .line 12
    .line 13
    if-nez v3, :cond_1

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    const-string p0, "play:decode: push nal ignore p frame when not got i frame"

    .line 18
    .line 19
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p0

    .line 24
    goto :goto_2

    .line 25
    :cond_1
    if-nez v3, :cond_2

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    const-string v3, "play:decode: push first i frame"

    .line 30
    .line 31
    invoke-static {v0, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iput-boolean v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mRecvFirstFrame:Z

    .line 35
    .line 36
    :cond_2
    iget-boolean v3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mRestarting:Z

    .line 37
    .line 38
    if-nez v3, :cond_3

    .line 39
    .line 40
    iget v3, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->codecId:I

    .line 41
    .line 42
    if-ne v3, v2, :cond_3

    .line 43
    .line 44
    iget-boolean v3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHWDec:Z

    .line 45
    .line 46
    if-nez v3, :cond_3

    .line 47
    .line 48
    const-string v3, "play:decode: hevc decode error  "

    .line 49
    .line 50
    invoke-static {v0, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNotifyListener:Ljava/lang/ref/WeakReference;

    .line 54
    .line 55
    const-string v4, "h265 Decoding failed"

    .line 56
    .line 57
    const/16 v5, -0x900

    .line 58
    .line 59
    invoke-static {v3, v5, v4}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iput-boolean v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mRestarting:Z

    .line 63
    .line 64
    :cond_3
    iget-object v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderHandler:Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;

    .line 65
    .line 66
    if-eqz v2, :cond_5

    .line 67
    .line 68
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNALList:Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_4

    .line 75
    .line 76
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNALList:Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_4

    .line 87
    .line 88
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Lcom/tencent/liteav/basic/structs/TXSNALPacket;

    .line 93
    .line 94
    invoke-direct {p0, v2}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->addOneNalToDecoder(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_4
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNALList:Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 101
    .line 102
    .line 103
    invoke-direct {p0, p1}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->addOneNalToDecoder(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_5
    if-eqz v1, :cond_6

    .line 108
    .line 109
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNALList:Ljava/util/ArrayList;

    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-nez v1, :cond_6

    .line 116
    .line 117
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNALList:Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 120
    .line 121
    .line 122
    :cond_6
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNALList:Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    iget-boolean p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mRestarting:Z

    .line 128
    .line 129
    if-nez p1, :cond_7

    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->start()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .line 133
    .line 134
    :cond_7
    return-void

    .line 135
    :goto_2
    const-string p1, "decode NAL By Old way failed."

    .line 136
    .line 137
    invoke-static {v0, p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method private decodeFrame([BJJIIIII)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/liteav/basic/structs/TXSNALPacket;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 7
    .line 8
    iput-wide p2, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 9
    .line 10
    iput-wide p4, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->dts:J

    .line 11
    .line 12
    iput p6, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->rotation:I

    .line 13
    .line 14
    iput p7, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->codecId:I

    .line 15
    .line 16
    iput p10, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 17
    .line 18
    monitor-enter p0

    .line 19
    :try_start_0
    iget-wide p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 20
    .line 21
    const-wide/16 p3, 0x0

    .line 22
    .line 23
    cmp-long p1, p1, p3

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 28
    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    new-instance p1, Lcom/tencent/liteav/videodecoder/e;

    .line 32
    .line 33
    invoke-direct {p1}, Lcom/tencent/liteav/videodecoder/e;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p8, p9}, Lcom/tencent/liteav/videodecoder/e;->a(II)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/videodecoder/e;->setListener(Lcom/tencent/liteav/videodecoder/f;)V

    .line 40
    .line 41
    .line 42
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 43
    .line 44
    invoke-direct {p2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/videodecoder/e;->setNotifyListener(Ljava/lang/ref/WeakReference;)V

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecFormat:Lorg/json/JSONArray;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/videodecoder/e;->a(Lorg/json/JSONArray;)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mSurface:Landroid/view/Surface;

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/videodecoder/e;->config(Landroid/view/Surface;)I

    .line 58
    .line 59
    .line 60
    iget-boolean p2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mEnableLimitDecCache:Z

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/videodecoder/e;->enableLimitDecCache(Z)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mSps:Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    iget-object p3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mPps:Ljava/nio/ByteBuffer;

    .line 68
    .line 69
    iget-boolean p4, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNeedSortFrame:Z

    .line 70
    .line 71
    iget-boolean p5, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHevc:Z

    .line 72
    .line 73
    invoke-virtual {p1, p2, p3, p4, p5}, Lcom/tencent/liteav/videodecoder/e;->start(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;ZZ)I

    .line 74
    .line 75
    .line 76
    const/4 p2, 0x1

    .line 77
    invoke-direct {p0, p2}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->notifyDecoderStartEvent(Z)V

    .line 78
    .line 79
    .line 80
    iput-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :catchall_0
    move-exception p1

    .line 84
    goto :goto_1

    .line 85
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 86
    .line 87
    if-eqz p1, :cond_1

    .line 88
    .line 89
    invoke-interface {p1, v0}, Lcom/tencent/liteav/videodecoder/b;->decode(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    monitor-exit p0

    .line 93
    return-void

    .line 94
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    throw p1
.end method

.method private hasSurface()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mSurface:Landroid/view/Surface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private native nativeCreateContext(Z)J
.end method

.method private native nativeDecCache(J)V
.end method

.method private native nativeDecodeFrame(J[BIJJII)V
.end method

.method private native nativeDestroyContext(J)V
.end method

.method private native nativeEnableDecodeChange(JZ)V
.end method

.method private native nativeEnableRestartDecoder(JZ)V
.end method

.method private native nativeNotifyHWDecoderError(J)V
.end method

.method private native nativeNotifyPts(JJII)V
.end method

.method private native nativeReStart(JZ)V
.end method

.method private native nativeSetID(JLjava/lang/String;)V
.end method

.method private native nativeSetStreamType(JI)V
.end method

.method private notifyDecoderStartEvent(Z)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 2
    .line 3
    const-wide/16 v8, 0x1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    move-wide v2, v8

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    move-wide v2, v1

    .line 12
    :goto_0
    const-string v6, ""

    .line 13
    .line 14
    iget v7, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 15
    .line 16
    const/16 v1, 0xfa5

    .line 17
    .line 18
    const-wide/16 v4, -0x1

    .line 19
    .line 20
    invoke-static/range {v0 .. v7}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Landroid/os/Bundle;

    .line 24
    .line 25
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string v1, "EVT_ID"

    .line 29
    .line 30
    const/16 v2, 0x7d8

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    const-string v1, "EVT_TIME"

    .line 36
    .line 37
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 38
    .line 39
    .line 40
    move-result-wide v3

    .line 41
    invoke-virtual {v0, v1, v3, v4}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 42
    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    const-string v1, "Enables hardware decoding"

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    const-string v1, "Enables software decoding"

    .line 50
    .line 51
    :goto_1
    const-string v3, "EVT_MSG"

    .line 52
    .line 53
    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    const/4 v1, 0x1

    .line 59
    goto :goto_2

    .line 60
    :cond_2
    const/4 v1, 0x2

    .line 61
    :goto_2
    const-string v3, "EVT_PARAM1"

    .line 62
    .line 63
    invoke-virtual {v0, v3, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNotifyListener:Ljava/lang/ref/WeakReference;

    .line 67
    .line 68
    iget-object v3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v1, v3, v2, v0}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    goto :goto_3

    .line 78
    :cond_3
    const-wide/16 v8, 0x2

    .line 79
    .line 80
    :goto_3
    iget p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 81
    .line 82
    const p1, 0x9c5a

    .line 83
    .line 84
    .line 85
    invoke-static {v0, p1, v8, v9, p0}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(Ljava/lang/String;IJI)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method private onDecodeDone(Lcom/tencent/liteav/basic/structs/TXSVideoFrame;IIJJII)V
    .locals 5

    .line 1
    sget-wide v0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecodeFirstFrameTS:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    sput-wide v0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecodeFirstFrameTS:J

    .line 14
    .line 15
    iget-object v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 16
    .line 17
    iget v3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 18
    .line 19
    const/16 v4, 0x138d

    .line 20
    .line 21
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v2, v4, v3, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHevc:Z

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    const/4 v0, 0x2

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 v0, 0x0

    .line 35
    :goto_0
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 36
    .line 37
    iget v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 38
    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/16 v3, 0x138c

    .line 44
    .line 45
    invoke-static {v1, v3, v2, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    :cond_1
    move v0, p9

    .line 49
    move p9, p8

    .line 50
    move-wide p7, p6

    .line 51
    move-wide p5, p4

    .line 52
    move p4, p3

    .line 53
    move p3, p2

    .line 54
    move-object p2, p1

    .line 55
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderListener:Lcom/tencent/liteav/videodecoder/f;

    .line 56
    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    iput p3, p2, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->width:I

    .line 60
    .line 61
    iput p4, p2, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->height:I

    .line 62
    .line 63
    iput p9, p2, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->rotation:I

    .line 64
    .line 65
    iput-wide p5, p2, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->pts:J

    .line 66
    .line 67
    iput v0, p2, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->frameType:I

    .line 68
    .line 69
    invoke-interface/range {p1 .. p9}, Lcom/tencent/liteav/videodecoder/f;->onDecodeFrame(Lcom/tencent/liteav/basic/structs/TXSVideoFrame;IIJJI)V

    .line 70
    .line 71
    .line 72
    iget p2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoWidth:I

    .line 73
    .line 74
    if-ne p2, p3, :cond_2

    .line 75
    .line 76
    iget p2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoHeight:I

    .line 77
    .line 78
    if-eq p2, p4, :cond_3

    .line 79
    .line 80
    :cond_2
    iput p3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoWidth:I

    .line 81
    .line 82
    iput p4, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoHeight:I

    .line 83
    .line 84
    invoke-interface {p1, p3, p4}, Lcom/tencent/liteav/videodecoder/f;->onVideoSizeChange(II)V

    .line 85
    .line 86
    .line 87
    :cond_3
    return-void
.end method

.method private onStartDecoder(Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->notifyDecoderStartEvent(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private startDecodeThread()I
    .locals 12

    .line 1
    const-string v0, "VideoSWDec"

    .line 2
    .line 3
    const-string v1, "VideoWDec"

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-object v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderHandler:Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    const-string v0, "TXCVideoDecoder"

    .line 11
    .line 12
    const-string v1, "play:decode: start decoder error when decoder is started"

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    monitor-exit p0

    .line 19
    return v0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    move-object v10, p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    const/4 v2, 0x0

    .line 24
    iput v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderCacheNum:I

    .line 25
    .line 26
    iput-boolean v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mRestarting:Z

    .line 27
    .line 28
    new-instance v3, Landroid/os/HandlerThread;

    .line 29
    .line 30
    const-string v4, "VDecoder"

    .line 31
    .line 32
    invoke-direct {v3, v4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 36
    .line 37
    .line 38
    iget-boolean v4, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHWDec:Z

    .line 39
    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    .line 48
    .line 49
    .line 50
    move-result-wide v4

    .line 51
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v3, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    .line 68
    .line 69
    .line 70
    move-result-wide v4

    .line 71
    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v3, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :goto_0
    new-instance v4, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;

    .line 82
    .line 83
    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-direct {v4, v0}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;-><init>(Landroid/os/Looper;)V

    .line 88
    .line 89
    .line 90
    iget-boolean v5, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHevc:Z

    .line 91
    .line 92
    iget-boolean v6, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHWDec:Z

    .line 93
    .line 94
    iget-object v7, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mSurface:Landroid/view/Surface;

    .line 95
    .line 96
    iget-object v8, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mSps:Ljava/nio/ByteBuffer;

    .line 97
    .line 98
    iget-object v9, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mPps:Ljava/nio/ByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    .line 100
    move-object v11, p0

    .line 101
    move-object v10, p0

    .line 102
    :try_start_1
    invoke-virtual/range {v4 .. v11}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a(ZZLandroid/view/Surface;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Lcom/tencent/liteav/videodecoder/f;Lcom/tencent/liteav/basic/b/b;)V

    .line 103
    .line 104
    .line 105
    const-string p0, "TXCVideoDecoder"

    .line 106
    .line 107
    const-string v0, "play:decode: start decode thread"

    .line 108
    .line 109
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    const/16 v0, 0x64

    .line 117
    .line 118
    iput v0, p0, Landroid/os/Message;->what:I

    .line 119
    .line 120
    iget-boolean v0, v10, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNeedSortFrame:Z

    .line 121
    .line 122
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 127
    .line 128
    invoke-virtual {v4, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 129
    .line 130
    .line 131
    iput-object v4, v10, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderHandler:Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;

    .line 132
    .line 133
    monitor-exit v10

    .line 134
    return v2

    .line 135
    :catchall_1
    move-exception v0

    .line 136
    :goto_1
    monitor-exit v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 137
    throw v0
.end method

.method private stopDecodeThread()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderHandler:Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/16 v1, 0x66

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderHandler:Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw v0
.end method

.method private declared-synchronized stopHWDecoder()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/tencent/liteav/videodecoder/b;->stop()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1}, Lcom/tencent/liteav/videodecoder/b;->setListener(Lcom/tencent/liteav/videodecoder/f;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 16
    .line 17
    invoke-interface {v0, v1}, Lcom/tencent/liteav/videodecoder/b;->setNotifyListener(Ljava/lang/ref/WeakReference;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw v0
.end method


# virtual methods
.method public GetDecodeFirstFrameTS()J
    .locals 2

    .line 1
    sget-wide v0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecodeFirstFrameTS:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public config(Lorg/json/JSONArray;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecFormat:Lorg/json/JSONArray;

    .line 2
    .line 3
    return-void
.end method

.method public enableChange(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mEnableDecoderChange:Z

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mEnableDecoderChange:Z

    .line 7
    .line 8
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeEnableDecodeChange(JZ)V

    .line 9
    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p1
.end method

.method public enableHWDec(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHWDec:Z

    .line 2
    .line 3
    return-void
.end method

.method public enableLimitDecCache(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mEnableLimitDecCache:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/tencent/liteav/videodecoder/b;->enableLimitDecCache(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public enableRestart(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mEnableRestartDecoder:Z

    .line 2
    .line 3
    return-void
.end method

.method public getDecoderCacheNum()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderCacheNum:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNALList:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public isHardwareDecode()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isHevc()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderHandler:Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public onDecodeFailed(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderListener:Lcom/tencent/liteav/videodecoder/f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/tencent/liteav/videodecoder/f;->onDecodeFailed(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    monitor-enter p0

    .line 9
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 10
    .line 11
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeDecCache(J)V

    .line 12
    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p1
.end method

.method public onDecodeFrame(Lcom/tencent/liteav/basic/structs/TXSVideoFrame;IIJJI)V
    .locals 14

    .line 1
    sget-wide v0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecodeFirstFrameTS:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    sput-wide v2, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecodeFirstFrameTS:J

    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 17
    .line 18
    iget v4, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 19
    .line 20
    const/16 v5, 0x138d

    .line 21
    .line 22
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v0, v5, v4, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-boolean v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHevc:Z

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    const/4 v0, 0x3

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v0, v1

    .line 36
    :goto_0
    iget-object v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 37
    .line 38
    iget v3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/16 v4, 0x138c

    .line 45
    .line 46
    invoke-static {v2, v4, v3, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object v5, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderListener:Lcom/tencent/liteav/videodecoder/f;

    .line 50
    .line 51
    if-eqz v5, :cond_2

    .line 52
    .line 53
    move-object v6, p1

    .line 54
    move/from16 v7, p2

    .line 55
    .line 56
    move/from16 v8, p3

    .line 57
    .line 58
    move-wide/from16 v9, p4

    .line 59
    .line 60
    move-wide/from16 v11, p6

    .line 61
    .line 62
    move/from16 v13, p8

    .line 63
    .line 64
    invoke-interface/range {v5 .. v13}, Lcom/tencent/liteav/videodecoder/f;->onDecodeFrame(Lcom/tencent/liteav/basic/structs/TXSVideoFrame;IIJJI)V

    .line 65
    .line 66
    .line 67
    :cond_2
    iget v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderCacheNum:I

    .line 68
    .line 69
    if-lez v0, :cond_3

    .line 70
    .line 71
    sub-int/2addr v0, v1

    .line 72
    iput v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderCacheNum:I

    .line 73
    .line 74
    :cond_3
    if-nez p1, :cond_4

    .line 75
    .line 76
    monitor-enter p0

    .line 77
    :try_start_0
    iget-wide v3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 78
    .line 79
    move-object v2, p0

    .line 80
    move/from16 v7, p2

    .line 81
    .line 82
    move/from16 v8, p3

    .line 83
    .line 84
    move-wide/from16 v5, p4

    .line 85
    .line 86
    invoke-direct/range {v2 .. v8}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeNotifyPts(JJII)V

    .line 87
    .line 88
    .line 89
    monitor-exit p0

    .line 90
    goto :goto_1

    .line 91
    :catchall_0
    move-exception v0

    .line 92
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    throw v0

    .line 94
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 95
    .line 96
    invoke-interface {v0}, Lcom/tencent/liteav/videodecoder/b;->GetDecodeCost()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    iget-boolean v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHWDec:Z

    .line 101
    .line 102
    iget-object v3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v1, :cond_5

    .line 105
    .line 106
    iget p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 107
    .line 108
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    const/16 v1, 0x1f44

    .line 113
    .line 114
    invoke-static {v3, v1, p0, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_5
    iget p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 119
    .line 120
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const/16 v1, 0x1f43

    .line 125
    .line 126
    invoke-static {v3, v1, p0, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public onNotifyEvent(ILandroid/os/Bundle;)V
    .locals 2

    .line 1
    const/16 v0, 0x83a

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeNotifyHWDecoderError(J)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNotifyListener:Ljava/lang/ref/WeakReference;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0, p0, p1, p2}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onVideoSizeChange(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderListener:Lcom/tencent/liteav/videodecoder/f;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoWidth:I

    .line 6
    .line 7
    if-ne v1, p1, :cond_0

    .line 8
    .line 9
    iget v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoHeight:I

    .line 10
    .line 11
    if-eq v1, p2, :cond_1

    .line 12
    .line 13
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoWidth:I

    .line 14
    .line 15
    iput p2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoHeight:I

    .line 16
    .line 17
    invoke-interface {v0, p1, p2}, Lcom/tencent/liteav/videodecoder/f;->onVideoSizeChange(II)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public pushNAL(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->decNALByNewWay(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public restart(Z)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-boolean p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHWDec:Z

    .line 3
    .line 4
    iget-wide v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 5
    .line 6
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeReStart(JZ)V

    .line 7
    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p1
.end method

.method public setListener(Lcom/tencent/liteav/videodecoder/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderListener:Lcom/tencent/liteav/videodecoder/f;

    .line 2
    .line 3
    return-void
.end method

.method public setNotifyListener(Lcom/tencent/liteav/basic/b/b;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNotifyListener:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method

.method public setStreamType(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 5
    .line 6
    iget p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 7
    .line 8
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeSetStreamType(JI)V

    .line 9
    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p1
.end method

.method public setUserId(Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 5
    .line 6
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 7
    .line 8
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeSetID(JLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p1
.end method

.method public setup(Landroid/graphics/SurfaceTexture;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Z)I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mSurface:Landroid/view/Surface;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mSurface:Landroid/view/Surface;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    new-instance v0, Landroid/view/Surface;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0, p2, p3, p4}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->setup(Landroid/view/Surface;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Z)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw p1
.end method

.method public setup(Landroid/view/Surface;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Z)I
    .locals 0

    .line 28
    monitor-enter p0

    .line 29
    :try_start_0
    iput-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mSurface:Landroid/view/Surface;

    .line 30
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    iput-object p2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mSps:Ljava/nio/ByteBuffer;

    .line 32
    iput-object p3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mPps:Ljava/nio/ByteBuffer;

    .line 33
    iput-boolean p4, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNeedSortFrame:Z

    const/4 p0, 0x0

    return p0

    :catchall_0
    move-exception p1

    .line 34
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized start()I
    .locals 7

    .line 1
    const-string v0, "play:decode: start decoder java id "

    .line 2
    .line 3
    const-string v1, "play:decode: start decoder error when decoder is started, id "

    .line 4
    .line 5
    const-string v2, "play:decode: start decoder error when not setup surface, id "

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    iget-boolean v3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHWDec:Z

    .line 9
    .line 10
    const/4 v4, -0x1

    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    iget-object v3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mSurface:Landroid/view/Surface;

    .line 14
    .line 15
    if-nez v3, :cond_0

    .line 16
    .line 17
    const-string v0, "TXCVideoDecoder"

    .line 18
    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v2, "_"

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    monitor-exit p0

    .line 47
    return v4

    .line 48
    :catchall_0
    move-exception v0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    :try_start_1
    iget-wide v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 51
    .line 52
    const-wide/16 v5, 0x0

    .line 53
    .line 54
    cmp-long v2, v2, v5

    .line 55
    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    const-string v0, "TXCVideoDecoder"

    .line 59
    .line 60
    new-instance v2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v1, "_"

    .line 71
    .line 72
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 76
    .line 77
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 85
    .line 86
    .line 87
    monitor-exit p0

    .line 88
    return v4

    .line 89
    :cond_1
    :try_start_2
    const-string v1, "TXCVideoDecoder"

    .line 90
    .line 91
    new-instance v2, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v0, "_"

    .line 102
    .line 103
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 107
    .line 108
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v0, " "

    .line 112
    .line 113
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-boolean v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mHWDec:Z

    .line 131
    .line 132
    invoke-direct {p0, v0}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeCreateContext(Z)J

    .line 133
    .line 134
    .line 135
    move-result-wide v0

    .line 136
    iput-wide v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 137
    .line 138
    iget-object v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 139
    .line 140
    invoke-direct {p0, v0, v1, v2}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeSetID(JLjava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-wide v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 144
    .line 145
    iget v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 146
    .line 147
    invoke-direct {p0, v0, v1, v2}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeSetStreamType(JI)V

    .line 148
    .line 149
    .line 150
    iget-wide v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 151
    .line 152
    iget-boolean v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mEnableDecoderChange:Z

    .line 153
    .line 154
    invoke-direct {p0, v0, v1, v2}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeEnableDecodeChange(JZ)V

    .line 155
    .line 156
    .line 157
    iget-wide v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 158
    .line 159
    iget-boolean v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mEnableRestartDecoder:Z

    .line 160
    .line 161
    invoke-direct {p0, v0, v1, v2}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeEnableRestartDecoder(JZ)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 162
    .line 163
    .line 164
    monitor-exit p0

    .line 165
    const/4 p0, 0x0

    .line 166
    return p0

    .line 167
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 168
    throw v0
.end method

.method public declared-synchronized stop()V
    .locals 6

    .line 1
    const-string v0, "play:decode: stop decoder java id "

    .line 2
    .line 3
    const-string v1, "play:decode: stop decoder ignore when decoder is stopped, id "

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-wide v2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 7
    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    cmp-long v2, v2, v4

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    const-string v0, "TXCVideoDecoder"

    .line 15
    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, "_"

    .line 27
    .line 28
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    .line 43
    monitor-exit p0

    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception v0

    .line 46
    goto :goto_2

    .line 47
    :cond_0
    :try_start_1
    const-string v1, "TXCVideoDecoder"

    .line 48
    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mUserId:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v0, "_"

    .line 60
    .line 61
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    iget v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mStreamType:I

    .line 65
    .line 66
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v0, " "

    .line 70
    .line 71
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-wide v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 89
    .line 90
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->nativeDestroyContext(J)V

    .line 91
    .line 92
    .line 93
    iput-wide v4, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNativeContext:J

    .line 94
    .line 95
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mNALList:Ljava/util/ArrayList;

    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 98
    .line 99
    .line 100
    const/4 v0, 0x0

    .line 101
    iput-boolean v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mRecvFirstFrame:Z

    .line 102
    .line 103
    iput v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecoderCacheNum:I

    .line 104
    .line 105
    sput-wide v4, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mDecodeFirstFrameTS:J

    .line 106
    .line 107
    monitor-enter p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 108
    :try_start_2
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 109
    .line 110
    const/4 v1, 0x0

    .line 111
    if-eqz v0, :cond_1

    .line 112
    .line 113
    invoke-interface {v0}, Lcom/tencent/liteav/videodecoder/b;->stop()V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 117
    .line 118
    invoke-interface {v0, v1}, Lcom/tencent/liteav/videodecoder/b;->setListener(Lcom/tencent/liteav/videodecoder/f;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 122
    .line 123
    invoke-interface {v0, v1}, Lcom/tencent/liteav/videodecoder/b;->setNotifyListener(Ljava/lang/ref/WeakReference;)V

    .line 124
    .line 125
    .line 126
    iput-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mVideoDecoder:Lcom/tencent/liteav/videodecoder/b;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :catchall_1
    move-exception v0

    .line 130
    goto :goto_1

    .line 131
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mSurface:Landroid/view/Surface;

    .line 132
    .line 133
    if-eqz v0, :cond_2

    .line 134
    .line 135
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 136
    .line 137
    .line 138
    iput-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;->mSurface:Landroid/view/Surface;

    .line 139
    .line 140
    :cond_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 141
    monitor-exit p0

    .line 142
    return-void

    .line 143
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 144
    :try_start_4
    throw v0

    .line 145
    :goto_2
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 146
    throw v0
.end method
