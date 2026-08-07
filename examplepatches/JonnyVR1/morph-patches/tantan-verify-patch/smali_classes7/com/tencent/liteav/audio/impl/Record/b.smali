.class public Lcom/tencent/liteav/audio/impl/Record/b;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field private a:Landroid/media/MediaCodec$BufferInfo;

.field private b:Landroid/media/MediaCodecInfo;

.field private c:Landroid/media/MediaFormat;

.field private d:Landroid/media/MediaCodec;

.field private e:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "[B>;"
        }
    .end annotation
.end field

.field private f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/audio/f;",
            ">;"
        }
    .end annotation
.end field

.field private volatile g:Z

.field private volatile h:Z

.field private final i:Ljava/lang/Object;

.field private j:J

.field private k:I

.field private l:I

.field private m:I

.field private n:[B


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
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    const-string v0, "TXAudioRecordThread"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->g:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->h:Z

    .line 10
    .line 11
    new-instance v0, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->i:Ljava/lang/Object;

    .line 17
    .line 18
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    iput-wide v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->j:J

    .line 21
    .line 22
    const v0, 0xbb80

    .line 23
    .line 24
    .line 25
    iput v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->k:I

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    iput v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->l:I

    .line 29
    .line 30
    const/16 v0, 0x10

    .line 31
    .line 32
    iput v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->m:I

    .line 33
    .line 34
    return-void
.end method

.method private static final a(Ljava/lang/String;)Landroid/media/MediaCodecInfo;
    .locals 9

    .line 184
    const-string v0, "selectAudioCodec:"

    const-string v1, "AudioCenter:TXCAudioHWEncoder"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_3

    .line 186
    invoke-static {v3}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v4

    .line 187
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v5

    if-nez v5, :cond_0

    goto :goto_2

    .line 188
    :cond_0
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v5

    move v6, v2

    .line 189
    :goto_1
    array-length v7, v5

    if-ge v6, v7, :cond_2

    .line 190
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "supportedType:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ",MIME="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v8, v5, v6

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v1, v7}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    aget-object v7, v5, v6

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    return-object v4

    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method private a(Ljava/nio/ByteBuffer;IJ)V
    .locals 11

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 14
    .line 15
    const-wide/16 v2, 0x2710

    .line 16
    .line 17
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    const-string v1, "AudioCenter:TXCAudioHWEncoder"

    .line 22
    .line 23
    if-ltz v5, :cond_3

    .line 24
    .line 25
    aget-object v0, v0, v5

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 28
    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    .line 35
    :cond_1
    if-gtz p2, :cond_2

    .line 36
    .line 37
    const-string p1, "send BUFFER_FLAG_END_OF_STREAM"

    .line 38
    .line 39
    invoke-static {v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v4, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 43
    .line 44
    const/4 v7, 0x0

    .line 45
    const/4 v10, 0x4

    .line 46
    const/4 v6, 0x0

    .line 47
    move-wide v8, p3

    .line 48
    invoke-virtual/range {v4 .. v10}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    move-wide v8, p3

    .line 53
    iget-object v4, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 54
    .line 55
    const/4 v6, 0x0

    .line 56
    const/4 v10, 0x0

    .line 57
    move v7, p2

    .line 58
    invoke-virtual/range {v4 .. v10}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 59
    .line 60
    .line 61
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    :cond_4
    iget-object p2, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 68
    .line 69
    iget-object p3, p0, Lcom/tencent/liteav/audio/impl/Record/b;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 70
    .line 71
    invoke-virtual {p2, p3, v2, v3}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    const/4 p3, -0x1

    .line 76
    if-ne p2, p3, :cond_5

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_5
    const/4 p3, -0x3

    .line 80
    if-ne p2, p3, :cond_6

    .line 81
    .line 82
    iget-object p1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    goto :goto_1

    .line 89
    :cond_6
    const/4 p3, -0x2

    .line 90
    if-ne p2, p3, :cond_7

    .line 91
    .line 92
    iget-object p3, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 93
    .line 94
    invoke-virtual {p3}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_7
    if-gez p2, :cond_8

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_8
    aget-object p3, p1, p2

    .line 102
    .line 103
    iget-object p4, p0, Lcom/tencent/liteav/audio/impl/Record/b;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 104
    .line 105
    iget p4, p4, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 106
    .line 107
    and-int/lit8 p4, p4, 0x2

    .line 108
    .line 109
    const/4 v0, 0x0

    .line 110
    if-eqz p4, :cond_9

    .line 111
    .line 112
    const-string p4, "drain:BUFFER_FLAG_CODEC_CONFIG"

    .line 113
    .line 114
    invoke-static {v1, p4}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object p4, p0, Lcom/tencent/liteav/audio/impl/Record/b;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 118
    .line 119
    iput v0, p4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 120
    .line 121
    :cond_9
    iget-object p4, p0, Lcom/tencent/liteav/audio/impl/Record/b;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 122
    .line 123
    iget v4, p4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 124
    .line 125
    if-eqz v4, :cond_a

    .line 126
    .line 127
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/Record/b;->f()J

    .line 128
    .line 129
    .line 130
    move-result-wide v4

    .line 131
    iput-wide v4, p4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 132
    .line 133
    invoke-virtual {p3}, Ljava/nio/Buffer;->limit()I

    .line 134
    .line 135
    .line 136
    move-result p4

    .line 137
    new-array p4, p4, [B

    .line 138
    .line 139
    iput-object p4, p0, Lcom/tencent/liteav/audio/impl/Record/b;->n:[B

    .line 140
    .line 141
    invoke-virtual {p3, p4}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 142
    .line 143
    .line 144
    iget-object p3, p0, Lcom/tencent/liteav/audio/impl/Record/b;->n:[B

    .line 145
    .line 146
    iget-object p4, p0, Lcom/tencent/liteav/audio/impl/Record/b;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 147
    .line 148
    iget-wide v4, p4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 149
    .line 150
    invoke-direct {p0, p3, v4, v5}, Lcom/tencent/liteav/audio/impl/Record/b;->b([BJ)V

    .line 151
    .line 152
    .line 153
    iget-object p3, p0, Lcom/tencent/liteav/audio/impl/Record/b;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 154
    .line 155
    iget-wide p3, p3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 156
    .line 157
    iput-wide p3, p0, Lcom/tencent/liteav/audio/impl/Record/b;->j:J

    .line 158
    .line 159
    :cond_a
    iget-object p3, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 160
    .line 161
    invoke-virtual {p3, p2, v0}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 162
    .line 163
    .line 164
    :goto_1
    if-gez p2, :cond_4

    .line 165
    .line 166
    :goto_2
    return-void
.end method

.method private b()V
    .locals 5

    .line 1
    const-string v0, "audio/mp4a-latm"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/audio/impl/Record/b;->a(Ljava/lang/String;)Landroid/media/MediaCodecInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iput-object v1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->b:Landroid/media/MediaCodecInfo;

    .line 8
    .line 9
    const-string v2, "AudioCenter:TXCAudioHWEncoder"

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    const-string p0, "Unable to find an appropriate codec for audio/mp4a-latm"

    .line 14
    .line 15
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "selected codec: "

    .line 22
    .line 23
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Lcom/tencent/liteav/audio/impl/Record/b;->b:Landroid/media/MediaCodecInfo;

    .line 27
    .line 28
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget v1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->k:I

    .line 43
    .line 44
    const/16 v3, 0x7d00

    .line 45
    .line 46
    if-lt v1, v3, :cond_1

    .line 47
    .line 48
    const v3, 0xfa00

    .line 49
    .line 50
    .line 51
    :cond_1
    iget v4, p0, Lcom/tencent/liteav/audio/impl/Record/b;->l:I

    .line 52
    .line 53
    invoke-static {v0, v1, v4}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->c:Landroid/media/MediaFormat;

    .line 58
    .line 59
    const-string v1, "bitrate"

    .line 60
    .line 61
    invoke-virtual {v0, v1, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->c:Landroid/media/MediaFormat;

    .line 65
    .line 66
    const-string v1, "channel-count"

    .line 67
    .line 68
    iget v3, p0, Lcom/tencent/liteav/audio/impl/Record/b;->l:I

    .line 69
    .line 70
    invoke-virtual {v0, v1, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->c:Landroid/media/MediaFormat;

    .line 74
    .line 75
    const-string v1, "sample-rate"

    .line 76
    .line 77
    iget v3, p0, Lcom/tencent/liteav/audio/impl/Record/b;->k:I

    .line 78
    .line 79
    invoke-virtual {v0, v1, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->c:Landroid/media/MediaFormat;

    .line 83
    .line 84
    const-string v1, "aac-profile"

    .line 85
    .line 86
    const/4 v3, 0x2

    .line 87
    invoke-virtual {v0, v1, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 88
    .line 89
    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v1, "format: "

    .line 93
    .line 94
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->c:Landroid/media/MediaFormat;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :try_start_0
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/Record/b;->d()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :catch_0
    move-exception v0

    .line 114
    const-string v1, "start media codec failed."

    .line 115
    .line 116
    invoke-static {v2, v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 117
    .line 118
    .line 119
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method private b([BJ)V
    .locals 8

    .line 123
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->f:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 124
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/tencent/liteav/audio/f;

    if-eqz v1, :cond_0

    .line 125
    iget v5, p0, Lcom/tencent/liteav/audio/impl/Record/b;->k:I

    iget v6, p0, Lcom/tencent/liteav/audio/impl/Record/b;->l:I

    iget v7, p0, Lcom/tencent/liteav/audio/impl/Record/b;->m:I

    move-object v2, p1

    move-wide v3, p2

    invoke-interface/range {v1 .. v7}, Lcom/tencent/liteav/audio/f;->onRecordEncData([BJIII)V

    :cond_0
    return-void
.end method

.method private c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method private d()V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "audio/mp4a-latm"

    .line 7
    .line 8
    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->c:Landroid/media/MediaFormat;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-virtual {v0, v1, v2, v2, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 24
    .line 25
    .line 26
    const-string v0, "AudioCenter:TXCAudioHWEncoder"

    .line 27
    .line 28
    const-string v1, "prepare finishing"

    .line 29
    .line 30
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-boolean v3, p0, Lcom/tencent/liteav/audio/impl/Record/b;->g:Z

    .line 34
    .line 35
    return-void
.end method

.method private e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->d:Landroid/media/MediaCodec;

    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->g:Z

    .line 18
    .line 19
    return-void
.end method

.method private f()J
    .locals 4

    .line 1
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/tencent/liteav/audio/impl/Record/b;->j:J

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-gez p0, :cond_0

    .line 10
    .line 11
    sub-long/2addr v2, v0

    .line 12
    add-long/2addr v2, v0

    .line 13
    return-wide v2

    .line 14
    :cond_0
    return-wide v0
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 176
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/Record/b;->c()V

    return-void
.end method

.method public a(IIIILjava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/audio/f;",
            ">;)V"
        }
    .end annotation

    .line 177
    iput-object p5, p0, Lcom/tencent/liteav/audio/impl/Record/b;->f:Ljava/lang/ref/WeakReference;

    .line 178
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object p1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 179
    new-instance p1, Ljava/util/Vector;

    invoke-direct {p1}, Ljava/util/Vector;-><init>()V

    iput-object p1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->e:Ljava/util/Vector;

    .line 180
    iput p2, p0, Lcom/tencent/liteav/audio/impl/Record/b;->k:I

    .line 181
    iput p3, p0, Lcom/tencent/liteav/audio/impl/Record/b;->l:I

    .line 182
    iput p4, p0, Lcom/tencent/liteav/audio/impl/Record/b;->m:I

    .line 183
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/Record/b;->b()V

    return-void
.end method

.method public a([BJ)V
    .locals 0

    .line 167
    iget-object p2, p0, Lcom/tencent/liteav/audio/impl/Record/b;->e:Ljava/util/Vector;

    if-eqz p2, :cond_1

    if-eqz p1, :cond_1

    .line 168
    monitor-enter p2

    .line 169
    :try_start_0
    iget-object p3, p0, Lcom/tencent/liteav/audio/impl/Record/b;->e:Ljava/util/Vector;

    if-nez p3, :cond_0

    .line 170
    monitor-exit p2

    return-void

    :catchall_0
    move-exception p0

    goto :goto_0

    .line 171
    :cond_0
    invoke-virtual {p3, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 172
    monitor-exit p2

    goto :goto_1

    :goto_0
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 173
    :cond_1
    :goto_1
    iget-object p1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->i:Ljava/lang/Object;

    monitor-enter p1

    .line 174
    :try_start_1
    iget-object p0, p0, Lcom/tencent/liteav/audio/impl/Record/b;->i:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 175
    monitor-exit p1

    return-void

    :catchall_1
    move-exception p0

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p0
.end method

.method public run()V
    .locals 4

    .line 1
    const/16 v0, 0x400

    .line 2
    .line 3
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :catch_0
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->h:Z

    .line 8
    .line 9
    if-nez v1, :cond_4

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->g:Z

    .line 12
    .line 13
    if-eqz v1, :cond_3

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->e:Ljava/util/Vector;

    .line 16
    .line 17
    monitor-enter v1

    .line 18
    :try_start_0
    iget-object v2, p0, Lcom/tencent/liteav/audio/impl/Record/b;->e:Ljava/util/Vector;

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/util/Vector;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    const-wide/16 v1, 0xa

    .line 28
    .line 29
    :try_start_1
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object v2, p0, Lcom/tencent/liteav/audio/impl/Record/b;->e:Ljava/util/Vector;

    .line 34
    .line 35
    monitor-enter v2

    .line 36
    :try_start_2
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->e:Ljava/util/Vector;

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-virtual {v1, v3}, Ljava/util/Vector;->remove(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, [B

    .line 44
    .line 45
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    :try_start_3
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 49
    .line 50
    .line 51
    array-length v2, v1

    .line 52
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-le v2, v3, :cond_2

    .line 57
    .line 58
    array-length v2, v1

    .line 59
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    goto :goto_1

    .line 64
    :catch_1
    move-exception v1

    .line 65
    goto :goto_2

    .line 66
    :cond_2
    :goto_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 73
    .line 74
    .line 75
    array-length v1, v1

    .line 76
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/Record/b;->f()J

    .line 77
    .line 78
    .line 79
    move-result-wide v2

    .line 80
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/tencent/liteav/audio/impl/Record/b;->a(Ljava/nio/ByteBuffer;IJ)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :goto_2
    const-string v2, "AudioCenter:TXCAudioHWEncoder"

    .line 85
    .line 86
    const-string v3, "encode frame failed."

    .line 87
    .line 88
    invoke-static {v2, v3, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :catchall_0
    move-exception p0

    .line 93
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 94
    throw p0

    .line 95
    :catchall_1
    move-exception p0

    .line 96
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 97
    throw p0

    .line 98
    :cond_3
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/Record/b;->i:Ljava/lang/Object;

    .line 99
    .line 100
    monitor-enter v1

    .line 101
    :try_start_6
    iget-object v2, p0, Lcom/tencent/liteav/audio/impl/Record/b;->i:Ljava/lang/Object;

    .line 102
    .line 103
    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 104
    .line 105
    .line 106
    goto :goto_3

    .line 107
    :catchall_2
    move-exception p0

    .line 108
    goto :goto_4

    .line 109
    :catch_2
    :goto_3
    :try_start_7
    monitor-exit v1

    .line 110
    goto :goto_0

    .line 111
    :goto_4
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 112
    throw p0

    .line 113
    :cond_4
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/Record/b;->e()V

    .line 114
    .line 115
    .line 116
    return-void
.end method
