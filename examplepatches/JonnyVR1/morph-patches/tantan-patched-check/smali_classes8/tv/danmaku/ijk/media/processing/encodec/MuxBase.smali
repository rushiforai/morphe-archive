.class public abstract Ltv/danmaku/ijk/media/processing/encodec/MuxBase;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ltv/danmaku/ijk/media/processing/encodec/MuxBaseInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/processing/encodec/MuxBase$EncoderFrameRateUpdataListener;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field protected b:Landroid/media/MediaFormat;

.field protected c:Landroid/media/MediaCodec;

.field protected d:Landroid/media/MediaCodec$BufferInfo;

.field protected e:[Ljava/nio/ByteBuffer;

.field protected f:Ljava/nio/ByteBuffer;

.field protected g:I

.field protected volatile h:Z

.field protected i:Ljava/lang/Thread;

.field protected j:Ljava/nio/ByteBuffer;

.field protected k:Ljava/nio/ByteBuffer;

.field protected l:[B

.field private m:I

.field private n:J

.field o:Ltv/danmaku/ijk/media/processing/encodec/MuxBase$EncoderFrameRateUpdataListener;

.field p:Ltv/danmaku/ijk/media/streamer/StreamProducer$PacketBufferlingStatusListener;

.field protected q:Lcom/immomo/mediacore/sink/SinkBase;

.field protected r:Ljava/lang/Object;

.field s:[B

.field t:Ljava/lang/String;

.field u:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/media/MediaCodec;Lcom/immomo/mediacore/sink/SinkBase;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MediaCodecAudioMux"

    .line 5
    .line 6
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 10
    .line 11
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    .line 12
    .line 13
    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 17
    .line 18
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->e:[Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    const/4 v1, -0x1

    .line 23
    iput v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->h:Z

    .line 27
    .line 28
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->j:Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->k:Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->l:[B

    .line 33
    .line 34
    const v1, 0x7a120

    .line 35
    .line 36
    .line 37
    iput v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->m:I

    .line 38
    .line 39
    const-wide/16 v1, 0x0

    .line 40
    .line 41
    iput-wide v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->n:J

    .line 42
    .line 43
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->o:Ltv/danmaku/ijk/media/processing/encodec/MuxBase$EncoderFrameRateUpdataListener;

    .line 44
    .line 45
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->p:Ltv/danmaku/ijk/media/streamer/StreamProducer$PacketBufferlingStatusListener;

    .line 46
    .line 47
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->q:Lcom/immomo/mediacore/sink/SinkBase;

    .line 48
    .line 49
    new-instance v0, Ljava/lang/Object;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->r:Ljava/lang/Object;

    .line 55
    .line 56
    const/4 v0, 0x7

    .line 57
    new-array v0, v0, [B

    .line 58
    .line 59
    fill-array-data v0, :array_0

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->s:[B

    .line 63
    .line 64
    const-string v0, "momoa9a427d1andr22"

    .line 65
    .line 66
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->t:Ljava/lang/String;

    .line 67
    .line 68
    const-string v0, "{}"

    .line 69
    .line 70
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->u:Ljava/lang/String;

    .line 71
    .line 72
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->e:[Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    iput-object p2, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->q:Lcom/immomo/mediacore/sink/SinkBase;

    .line 81
    .line 82
    return-void

    .line 83
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
        0x6t
        0x64t
        0x2et
    .end array-data
.end method


# virtual methods
.method public a()[B
    .locals 7

    .line 1
    const-string v0, "ts"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->s:[B

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    .line 8
    .line 9
    .line 10
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 11
    .line 12
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->u:Ljava/lang/String;

    .line 13
    .line 14
    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    iget-wide v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->n:J

    .line 31
    .line 32
    add-long/2addr v3, v5

    .line 33
    invoke-virtual {v2, v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    const/4 v2, 0x0

    .line 38
    :goto_0
    if-eqz v2, :cond_1

    .line 39
    .line 40
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->u:Ljava/lang/String;

    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->u:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    array-length v0, v0

    .line 53
    int-to-short v0, v0

    .line 54
    new-instance v2, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v3, "genSei len :"

    .line 57
    .line 58
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    const-string v3, "MediaCodecAudioMux"

    .line 69
    .line 70
    invoke-static {v3, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    new-instance v2, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->t:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->u:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    and-int/lit16 v1, v0, 0xff

    .line 100
    .line 101
    int-to-byte v1, v1

    .line 102
    const/16 v2, 0x18

    .line 103
    .line 104
    aput-byte v1, p0, v2

    .line 105
    .line 106
    shr-int/lit8 v1, v0, 0x8

    .line 107
    .line 108
    and-int/lit16 v1, v1, 0xff

    .line 109
    .line 110
    int-to-byte v1, v1

    .line 111
    const/16 v2, 0x17

    .line 112
    .line 113
    aput-byte v1, p0, v2

    .line 114
    .line 115
    add-int/lit8 v0, v0, 0x11

    .line 116
    .line 117
    int-to-short v0, v0

    .line 118
    and-int/lit16 v0, v0, 0xff

    .line 119
    .line 120
    int-to-byte v0, v0

    .line 121
    const/4 v1, 0x6

    .line 122
    aput-byte v0, p0, v1

    .line 123
    .line 124
    const/4 v0, 0x5

    .line 125
    const/16 v1, -0x1b

    .line 126
    .line 127
    aput-byte v1, p0, v0

    .line 128
    .line 129
    return-object p0
.end method

.method public b([B)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    aget-byte v0, p1, p0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    aget-byte v1, p1, v0

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    aget-byte v1, p1, v1

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    const/4 v1, 0x3

    .line 17
    aget-byte p1, p1, v1

    .line 18
    .line 19
    if-ne p1, v0, :cond_0

    .line 20
    .line 21
    return v0

    .line 22
    :cond_0
    return p0
.end method

.method public abstract c()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public d(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->i(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public e(Z)V
    .locals 1

    .line 1
    iget p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->m:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->j(II)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public f(Ltv/danmaku/ijk/media/processing/encodec/MuxBase$EncoderFrameRateUpdataListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->o:Ltv/danmaku/ijk/media/processing/encodec/MuxBase$EncoderFrameRateUpdataListener;

    .line 2
    .line 3
    return-void
.end method

.method public g(J)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr p1, v0

    .line 6
    iput-wide p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->n:J

    .line 7
    .line 8
    return-void
.end method

.method public h(Ltv/danmaku/ijk/media/streamer/StreamProducer$PacketBufferlingStatusListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->p:Ltv/danmaku/ijk/media/streamer/StreamProducer$PacketBufferlingStatusListener;

    .line 2
    .line 3
    return-void
.end method

.method public i(II)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->m:I

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->j(II)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public j(II)Z
    .locals 3

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "setRates: "

    .line 4
    .line 5
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const-string v0, "MediaCodecAudioMux"

    .line 16
    .line 17
    invoke-static {v0, p2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    :try_start_0
    new-instance v1, Landroid/os/Bundle;

    .line 22
    .line 23
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v2, "video-bitrate"

    .line 27
    .line 28
    invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :catch_1
    move-exception p0

    .line 42
    goto :goto_2

    .line 43
    :cond_0
    :goto_0
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :goto_1
    const-string p1, "setRates failed not susport"

    .line 46
    .line 47
    invoke-static {v0, p1, p0}, Ll/t9c;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 48
    .line 49
    .line 50
    return p2

    .line 51
    :goto_2
    const-string p1, "setRates failed"

    .line 52
    .line 53
    invoke-static {v0, p1, p0}, Ll/t9c;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 54
    .line 55
    .line 56
    return p2
.end method

.method public k(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->u:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public l()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->i:Ljava/lang/Thread;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/Thread;

    .line 6
    .line 7
    const-string v1, "live-media-VideoMux"

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->i:Ljava/lang/Thread;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public m(Lcom/immomo/mediacore/sink/SinkBase;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->r:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->q:Lcom/immomo/mediacore/sink/SinkBase;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public run()V
    .locals 2

    .line 1
    const-string v0, "H264 packetizer started !"

    .line 2
    .line 3
    const-string v1, "MediaCodecAudioMux"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :goto_0
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->h:Z

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_0
    :cond_0
    const-string p0, "H264 packetizer stopped !"

    .line 23
    .line 24
    invoke-static {v1, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public stop()V
    .locals 5

    .line 1
    const-string v0, "stop t"

    .line 2
    .line 3
    const-string v1, "MediaCodecAudioMux"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->h:Z

    .line 10
    .line 11
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->i:Ljava/lang/Thread;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-wide/16 v3, 0x7d0

    .line 17
    .line 18
    :try_start_0
    invoke-virtual {v0, v3, v4}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->i:Ljava/lang/Thread;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 25
    .line 26
    .line 27
    :goto_0
    iput-object v2, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->i:Ljava/lang/Thread;

    .line 28
    .line 29
    :cond_0
    const-string v0, "stop mWriteTread"

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    :try_start_1
    const-string v0, "stop mMediaCodec"

    .line 35
    .line 36
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 49
    .line 50
    .line 51
    iput-object v2, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;
    :try_end_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 52
    .line 53
    :catch_1
    :cond_1
    invoke-virtual {p0, v2}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->m(Lcom/immomo/mediacore/sink/SinkBase;)V

    .line 54
    .line 55
    .line 56
    iput-object v2, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->k:Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    iput-object v2, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->j:Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    iput-object v2, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->l:[B

    .line 61
    .line 62
    return-void
.end method
