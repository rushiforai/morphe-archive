.class Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xengine/media/MediacodecEncoderWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;


# direct methods
.method public constructor <init>(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$000(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Landroid/media/MediaCodec;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$100(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_4

    .line 16
    .line 17
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$200(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-static {v1}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$000(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Landroid/media/MediaCodec;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$000(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Landroid/media/MediaCodec;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-static {p0, v0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$002(Lcom/momo/xengine/media/MediacodecEncoderWrapper;Landroid/media/MediaCodec;)Landroid/media/MediaCodec;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-static {v1}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$300(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Ljava/util/concurrent/LinkedBlockingDeque;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_0

    .line 59
    .line 60
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$400(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-gez v0, :cond_2

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    .line 70
    .line 71
    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 72
    .line 73
    .line 74
    iget-object v2, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 75
    .line 76
    invoke-static {v2}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$000(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Landroid/media/MediaCodec;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const-wide/16 v3, 0xc8

    .line 81
    .line 82
    invoke-virtual {v2, v1, v3, v4}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    const/4 v5, -0x2

    .line 87
    if-ne v2, v5, :cond_3

    .line 88
    .line 89
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 90
    .line 91
    invoke-static {v0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$100(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iget-object v2, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 96
    .line 97
    invoke-static {v2}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$000(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Landroid/media/MediaCodec;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v2}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    const/4 v3, 0x1

    .line 106
    invoke-virtual {v1, v2, v3}, Lcom/momo/xengine/media/Mp4MuxerWrapper;->addMediaTrack(Landroid/media/MediaFormat;I)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-static {v0, v1}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$502(Lcom/momo/xengine/media/MediacodecEncoderWrapper;I)I

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 114
    .line 115
    invoke-static {v0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$100(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0}, Lcom/momo/xengine/media/Mp4MuxerWrapper;->startMuxing()V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_3
    :goto_1
    if-ltz v2, :cond_0

    .line 124
    .line 125
    iget-object v5, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 126
    .line 127
    invoke-static {v5}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$000(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Landroid/media/MediaCodec;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    invoke-virtual {v5, v2}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    iget v6, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 136
    .line 137
    new-array v6, v6, [B

    .line 138
    .line 139
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 140
    .line 141
    .line 142
    iget-object v6, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 143
    .line 144
    invoke-static {v6}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$600(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)I

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    int-to-float v6, v6

    .line 149
    const/high16 v7, 0x3f800000    # 1.0f

    .line 150
    .line 151
    mul-float/2addr v6, v7

    .line 152
    iget-object v7, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 153
    .line 154
    invoke-static {v7}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$700(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Lcom/momo/xengine/media/EncodeConfig;

    .line 155
    .line 156
    .line 157
    move-result-object v7

    .line 158
    invoke-virtual {v7}, Lcom/momo/xengine/media/EncodeConfig;->getAudioSamplesRate()I

    .line 159
    .line 160
    .line 161
    move-result v7

    .line 162
    int-to-float v7, v7

    .line 163
    div-float/2addr v6, v7

    .line 164
    const v7, 0x49742400    # 1000000.0f

    .line 165
    .line 166
    .line 167
    mul-float/2addr v6, v7

    .line 168
    float-to-long v6, v6

    .line 169
    iput-wide v6, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 170
    .line 171
    iget-object v6, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 172
    .line 173
    invoke-static {v6, v0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$612(Lcom/momo/xengine/media/MediacodecEncoderWrapper;I)I

    .line 174
    .line 175
    .line 176
    iget-object v6, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 177
    .line 178
    invoke-static {v6}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$100(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 179
    .line 180
    .line 181
    move-result-object v6

    .line 182
    iget-object v7, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 183
    .line 184
    invoke-static {v7}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$500(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)I

    .line 185
    .line 186
    .line 187
    move-result v7

    .line 188
    invoke-virtual {v6, v7, v5, v1}, Lcom/momo/xengine/media/Mp4MuxerWrapper;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 189
    .line 190
    .line 191
    iget-object v5, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 192
    .line 193
    invoke-static {v5}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$000(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Landroid/media/MediaCodec;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    const/4 v6, 0x0

    .line 198
    invoke-virtual {v5, v2, v6}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 199
    .line 200
    .line 201
    iget-object v2, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;->this$0:Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 202
    .line 203
    invoke-static {v2}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->access$000(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Landroid/media/MediaCodec;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-virtual {v2, v1, v3, v4}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    goto :goto_1

    .line 212
    :cond_4
    return-void
.end method
