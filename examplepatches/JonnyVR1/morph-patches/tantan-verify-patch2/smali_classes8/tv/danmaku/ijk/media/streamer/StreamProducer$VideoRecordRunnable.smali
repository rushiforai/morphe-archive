.class Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/StreamProducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "VideoRecordRunnable"
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/StreamProducer;


# direct methods
.method private constructor <init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/StreamProducer$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    :catch_0
    :cond_0
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 11
    .line 12
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->d1()Ll/oxd0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_2
    invoke-virtual {v0}, Ll/oxd0;->b()Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {v0}, Ll/oxd0;->d()J

    .line 28
    .line 29
    .line 30
    move-result-wide v9

    .line 31
    const-wide/16 v0, -0x3039

    .line 32
    .line 33
    cmp-long v0, v9, v0

    .line 34
    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    :goto_1
    return-void

    .line 38
    :cond_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 39
    .line 40
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o:Landroid/media/MediaCodec;

    .line 41
    .line 42
    const-wide/16 v2, 0x0

    .line 43
    .line 44
    if-eqz v1, :cond_6

    .line 45
    .line 46
    :try_start_0
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    if-ltz v6, :cond_5

    .line 51
    .line 52
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 53
    .line 54
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t:[Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    aget-object v0, v0, v6

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-virtual {v4}, Ljava/nio/Buffer;->limit()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-ge v0, v1, :cond_4

    .line 67
    .line 68
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 69
    .line 70
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t:[Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    aget-object v0, v0, v6

    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    :goto_2
    move v8, v0

    .line 79
    goto :goto_3

    .line 80
    :cond_4
    invoke-virtual {v4}, Ljava/nio/Buffer;->limit()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    goto :goto_2

    .line 85
    :goto_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 86
    .line 87
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t:[Ljava/nio/ByteBuffer;

    .line 88
    .line 89
    aget-object v0, v0, v6

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 98
    .line 99
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t:[Ljava/nio/ByteBuffer;

    .line 100
    .line 101
    aget-object v0, v0, v6

    .line 102
    .line 103
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 107
    .line 108
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o:Landroid/media/MediaCodec;

    .line 109
    .line 110
    const/4 v7, 0x0

    .line 111
    const/4 v11, 0x0

    .line 112
    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_5
    const-string v0, "streamerCameraProducer"

    .line 117
    .line 118
    const-string v1, "No buffer available !"

    .line 119
    .line 120
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :catchall_0
    move-exception v0

    .line 125
    move-object p0, v0

    .line 126
    throw p0

    .line 127
    :cond_6
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J

    .line 128
    .line 129
    .line 130
    move-result-wide v0

    .line 131
    cmp-long v0, v0, v2

    .line 132
    .line 133
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 134
    .line 135
    if-nez v0, :cond_7

    .line 136
    .line 137
    invoke-static {v1, v9, v10}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e0(Ltv/danmaku/ijk/media/streamer/StreamProducer;J)J

    .line 138
    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_7
    const-wide/16 v2, 0x3e8

    .line 142
    .line 143
    div-long/2addr v9, v2

    .line 144
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J

    .line 145
    .line 146
    .line 147
    move-result-wide v0

    .line 148
    div-long/2addr v0, v2

    .line 149
    sub-long v2, v9, v0

    .line 150
    .line 151
    :goto_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 152
    .line 153
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    if-eqz v0, :cond_0

    .line 158
    .line 159
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 160
    .line 161
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v4}, Ljava/nio/Buffer;->limit()I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    int-to-long v5, v0

    .line 170
    invoke-virtual/range {v1 .. v6}, Lcom/immomo/mediacore/sink/SinkBase;->writeVideo(JLjava/nio/ByteBuffer;J)V

    .line 171
    .line 172
    .line 173
    goto/16 :goto_0
.end method
