.class public abstract Lcom/immomo/mediabase/mediacodec/MediaCodecBase;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String; = "MediaCodecBase"

.field private static final kTimeOutUs:J = 0x64L


# instance fields
.field protected mCodec:Landroid/media/MediaCodec;

.field protected mFormat:Landroid/media/MediaFormat;

.field private mInputBuffers:[Ljava/nio/ByteBuffer;

.field protected mListener:Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;

.field private mOutputBuffers:[Ljava/nio/ByteBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mFormat:Landroid/media/MediaFormat;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mListener:Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mInputBuffers:[Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/MediaCodec;->flush()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public initCodec(Z)I
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mFormat:Landroid/media/MediaFormat;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2, v2, p1}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :catch_0
    move-exception p1

    .line 12
    sget-object v0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->TAG:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "Configure AudioEncode Error : "

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v0, v1}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mListener:Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;

    .line 36
    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    const/4 v0, -0x2

    .line 40
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {p0, v0, p1}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;->onError(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    const/4 p0, -0x1

    .line 48
    return p0
.end method

.method public processFrame(Ljava/nio/ByteBuffer;J)I
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const-wide/16 v1, 0x64

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    const/4 v0, 0x0

    .line 14
    if-ltz v4, :cond_1

    .line 15
    .line 16
    iget-object v3, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mInputBuffers:[Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    aget-object v3, v3, v4

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v3, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    const/4 v9, 0x0

    .line 33
    const/4 v5, 0x0

    .line 34
    move-wide v7, p2

    .line 35
    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 36
    .line 37
    .line 38
    :cond_1
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    .line 39
    .line 40
    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 44
    .line 45
    invoke-virtual {p2, p1, v1, v2}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-ltz p2, :cond_4

    .line 50
    .line 51
    iget-object p3, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    aget-object p3, p3, p2

    .line 54
    .line 55
    iget v1, p1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 56
    .line 57
    if-lez v1, :cond_2

    .line 58
    .line 59
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 64
    .line 65
    .line 66
    iget v2, p1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 67
    .line 68
    invoke-virtual {p3, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    iget v3, p1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 76
    .line 77
    invoke-virtual {p3, v2, v0, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    .line 80
    iget-object p3, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mListener:Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;

    .line 81
    .line 82
    if-eqz p3, :cond_2

    .line 83
    .line 84
    invoke-interface {p3, v1, p1}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;->onFrameAvailable(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 85
    .line 86
    .line 87
    :cond_2
    iget-object p3, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 88
    .line 89
    invoke-virtual {p3, p2, v0}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 90
    .line 91
    .line 92
    iget p1, p1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 93
    .line 94
    and-int/lit8 p1, p1, 0x4

    .line 95
    .line 96
    if-eqz p1, :cond_3

    .line 97
    .line 98
    sget-object p1, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->TAG:Ljava/lang/String;

    .line 99
    .line 100
    const-string p2, "AudioEnoce END_OF_STREAM"

    .line 101
    .line 102
    invoke-static {p1, p2}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mListener:Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;

    .line 106
    .line 107
    if-eqz p0, :cond_3

    .line 108
    .line 109
    invoke-interface {p0}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;->onFinished()V

    .line 110
    .line 111
    .line 112
    :cond_3
    return v0

    .line 113
    :cond_4
    const/4 p1, -0x3

    .line 114
    if-ne p2, p1, :cond_5

    .line 115
    .line 116
    iget-object p1, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 117
    .line 118
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    .line 123
    .line 124
    sget-object p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->TAG:Ljava/lang/String;

    .line 125
    .line 126
    const-string p1, "AudioEnoce output buffers have changed."

    .line 127
    .line 128
    invoke-static {p0, p1}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    .line 130
    .line 131
    return v0

    .line 132
    :cond_5
    const/4 p1, -0x2

    .line 133
    if-ne p2, p1, :cond_7

    .line 134
    .line 135
    iget-object p1, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 136
    .line 137
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iget-object p0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mListener:Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;

    .line 142
    .line 143
    if-eqz p0, :cond_6

    .line 144
    .line 145
    invoke-interface {p0, p1}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;->onForamtChange(Landroid/media/MediaFormat;)V

    .line 146
    .line 147
    .line 148
    :cond_6
    sget-object p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->TAG:Ljava/lang/String;

    .line 149
    .line 150
    new-instance p2, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    const-string p3, "AudioEnoce output format has changed to "

    .line 153
    .line 154
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-static {p0, p1}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    .line 166
    .line 167
    return v0

    .line 168
    :cond_7
    sget-object p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->TAG:Ljava/lang/String;

    .line 169
    .line 170
    new-instance p3, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    const-string v0, "AudioEnoce Error : dequeueOutputBuffer returned "

    .line 173
    .line 174
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-static {p0, p2}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    return p1
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/MediaCodec;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setLogTag(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p1, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public start()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mInputBuffers:[Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mOutputBuffers:[Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :catch_0
    move-exception v0

    .line 27
    iget-object p0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mListener:Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 v1, -0x3

    .line 32
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {p0, v1, v0}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;->onError(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    const/4 p0, -0x1

    .line 40
    return p0
.end method

.method public stop()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/MediaCodec;->stop()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
