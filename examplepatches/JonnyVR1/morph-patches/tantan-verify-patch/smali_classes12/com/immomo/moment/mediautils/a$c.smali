.class Lcom/immomo/moment/mediautils/a$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/h$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/a;->e(Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/a;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCodecIdle()V
    .locals 0

    return-void
.end method

.method public onDataOutput(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/a;->p(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget v0, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 11
    .line 12
    if-lez v0, :cond_6

    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/immomo/moment/mediautils/a;->r(Lcom/immomo/moment/mediautils/a;)Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/immomo/moment/mediautils/a;->r(Lcom/immomo/moment/mediautils/a;)Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget v2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 33
    .line 34
    if-ge v0, v2, :cond_1

    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 37
    .line 38
    iget v2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 39
    .line 40
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-static {v0, v2}, Lcom/immomo/moment/mediautils/a;->s(Lcom/immomo/moment/mediautils/a;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/immomo/moment/mediautils/a;->r(Lcom/immomo/moment/mediautils/a;)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget v2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 61
    .line 62
    invoke-virtual {p1, v0, v1, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 63
    .line 64
    .line 65
    iget p1, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 66
    .line 67
    mul-int/lit8 p1, p1, 0x8

    .line 68
    .line 69
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 70
    .line 71
    iget v2, v0, Lcom/immomo/moment/mediautils/b;->e:I

    .line 72
    .line 73
    div-int/2addr p1, v2

    .line 74
    iget v2, v0, Lcom/immomo/moment/mediautils/b;->f:I

    .line 75
    .line 76
    div-int/2addr p1, v2

    .line 77
    invoke-static {v0}, Lcom/immomo/moment/mediautils/a;->p(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v2, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 82
    .line 83
    invoke-static {v2}, Lcom/immomo/moment/mediautils/a;->r(Lcom/immomo/moment/mediautils/a;)Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v0, v2, p1}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->resamplePcmData([BI)Ljava/nio/ByteBuffer;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    if-nez p1, :cond_2

    .line 96
    .line 97
    goto/16 :goto_1

    .line 98
    .line 99
    :cond_2
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 105
    .line 106
    invoke-virtual {v0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 110
    .line 111
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_3
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 116
    .line 117
    iget-boolean v0, v0, Lcom/immomo/moment/mediautils/b;->k:Z

    .line 118
    .line 119
    if-eqz v0, :cond_4

    .line 120
    .line 121
    iget v0, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 122
    .line 123
    if-lez v0, :cond_4

    .line 124
    .line 125
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 137
    .line 138
    .line 139
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 140
    .line 141
    iget-object v1, v1, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 142
    .line 143
    invoke-virtual {v1, v0}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    :cond_4
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 147
    .line 148
    iget-object v0, v0, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 149
    .line 150
    if-eqz v0, :cond_5

    .line 151
    .line 152
    iget v1, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 153
    .line 154
    iget-wide v2, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 155
    .line 156
    invoke-interface {v0, p1, v1, v2, v3}, Lcom/immomo/moment/mediautils/b$b;->a(Ljava/nio/ByteBuffer;IJ)V

    .line 157
    .line 158
    .line 159
    :cond_5
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 160
    .line 161
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 162
    .line 163
    .line 164
    :cond_6
    :goto_0
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 165
    .line 166
    iget-wide v0, p1, Lcom/immomo/moment/mediautils/b;->o:J

    .line 167
    .line 168
    const-wide/16 v2, 0x0

    .line 169
    .line 170
    cmp-long v2, v0, v2

    .line 171
    .line 172
    if-eqz v2, :cond_8

    .line 173
    .line 174
    iget-wide v2, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 175
    .line 176
    cmp-long p2, v2, v0

    .line 177
    .line 178
    if-ltz p2, :cond_8

    .line 179
    .line 180
    iget-boolean p2, p1, Lcom/immomo/moment/mediautils/b;->k:Z

    .line 181
    .line 182
    if-eqz p2, :cond_8

    .line 183
    .line 184
    const/4 p2, 0x1

    .line 185
    iput-boolean p2, p1, Lcom/immomo/moment/mediautils/b;->r:Z

    .line 186
    .line 187
    iget-object p1, p1, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 188
    .line 189
    if-eqz p1, :cond_7

    .line 190
    .line 191
    const-string p1, "AudioDecoder"

    .line 192
    .line 193
    const-string p2, "mOnDataListener.onFinished"

    .line 194
    .line 195
    invoke-static {p1, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 199
    .line 200
    iget-object p1, p1, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 201
    .line 202
    invoke-interface {p1}, Lcom/immomo/moment/mediautils/b$b;->onFinished()V

    .line 203
    .line 204
    .line 205
    :cond_7
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 206
    .line 207
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 208
    .line 209
    .line 210
    new-instance p1, Ljava/lang/Thread;

    .line 211
    .line 212
    new-instance p2, Lcom/immomo/moment/mediautils/a$c$a;

    .line 213
    .line 214
    invoke-direct {p2, p0}, Lcom/immomo/moment/mediautils/a$c$a;-><init>(Lcom/immomo/moment/mediautils/a$c;)V

    .line 215
    .line 216
    .line 217
    new-instance p0, Ljava/lang/StringBuilder;

    .line 218
    .line 219
    const-string v0, "AudioDecoderRelease"

    .line 220
    .line 221
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    invoke-static {}, Ll/g8g0;->b()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-direct {p1, p2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 239
    .line 240
    .line 241
    :cond_8
    :goto_1
    return-void
.end method

.method public onError(IILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/b;->r:Z

    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/moment/mediautils/b;->c:Ll/jpw;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, p1, p2, p3}, Ll/jpw;->a(IILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string p1, "AudioDecoder error !!!"

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "AudioDecoder"

    .line 28
    .line 29
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onFeedingData(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/a;->n(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/immomo/moment/mediautils/a;->n(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/j;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/immomo/moment/mediautils/j;->d(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    :goto_0
    if-gez p0, :cond_1

    .line 22
    .line 23
    const-wide/16 v3, 0x0

    .line 24
    .line 25
    const/4 v5, 0x0

    .line 26
    const/4 v1, 0x0

    .line 27
    const/4 v2, -0x1

    .line 28
    move-object v0, p2

    .line 29
    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 30
    .line 31
    .line 32
    :cond_1
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public onFinished()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/immomo/moment/mediautils/b;->k:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, v0, Lcom/immomo/moment/mediautils/b;->r:Z

    .line 9
    .line 10
    :cond_0
    iget-object v0, v0, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Lcom/immomo/moment/mediautils/b$b;->onFinished()V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    const-string p0, "AudioDecoder"

    .line 23
    .line 24
    const-string v0, "AudioDecoder finished !!!"

    .line 25
    .line 26
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onFormatChanged(Landroid/media/MediaFormat;)V
    .locals 9

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const-string v0, "channel-count"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, v1, Lcom/immomo/moment/mediautils/b;->f:I

    .line 18
    .line 19
    :cond_0
    const-string v0, "sample-rate"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, v1, Lcom/immomo/moment/mediautils/b;->d:I

    .line 34
    .line 35
    :cond_1
    const-string v0, "bit-width"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iput p1, v1, Lcom/immomo/moment/mediautils/b;->e:I

    .line 50
    .line 51
    :cond_2
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 52
    .line 53
    iget-object v0, p1, Lcom/immomo/moment/mediautils/b;->b:Lcom/immomo/moment/mediautils/b$a;

    .line 54
    .line 55
    const-string v1, "AudioDecoder"

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget v2, p1, Lcom/immomo/moment/mediautils/b;->d:I

    .line 60
    .line 61
    iget v3, p1, Lcom/immomo/moment/mediautils/b;->i:I

    .line 62
    .line 63
    iget p1, p1, Lcom/immomo/moment/mediautils/b;->h:I

    .line 64
    .line 65
    invoke-interface {v0, v2, v3, p1}, Lcom/immomo/moment/mediautils/b$a;->a(III)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 69
    .line 70
    iget-boolean p1, p1, Lcom/immomo/moment/mediautils/b;->s:Z

    .line 71
    .line 72
    if-nez p1, :cond_3

    .line 73
    .line 74
    const-string p1, "Demuxer Get Wrong Audio Info!"

    .line 75
    .line 76
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 80
    .line 81
    iget v0, p1, Lcom/immomo/moment/mediautils/b;->d:I

    .line 82
    .line 83
    iput v0, p1, Lcom/immomo/moment/mediautils/b;->g:I

    .line 84
    .line 85
    iget v2, p1, Lcom/immomo/moment/mediautils/b;->f:I

    .line 86
    .line 87
    iput v2, p1, Lcom/immomo/moment/mediautils/b;->i:I

    .line 88
    .line 89
    iput v0, p1, Lcom/immomo/moment/mediautils/b;->g:I

    .line 90
    .line 91
    :cond_3
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 92
    .line 93
    invoke-static {p1}, Lcom/immomo/moment/mediautils/a;->p(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    if-nez p1, :cond_4

    .line 98
    .line 99
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 100
    .line 101
    iget v0, p1, Lcom/immomo/moment/mediautils/b;->d:I

    .line 102
    .line 103
    iget p1, p1, Lcom/immomo/moment/mediautils/b;->g:I

    .line 104
    .line 105
    if-ne v0, p1, :cond_5

    .line 106
    .line 107
    :cond_4
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 108
    .line 109
    iget v0, p1, Lcom/immomo/moment/mediautils/b;->f:I

    .line 110
    .line 111
    iget v2, p1, Lcom/immomo/moment/mediautils/b;->i:I

    .line 112
    .line 113
    if-ne v0, v2, :cond_5

    .line 114
    .line 115
    iget v0, p1, Lcom/immomo/moment/mediautils/b;->e:I

    .line 116
    .line 117
    iget p1, p1, Lcom/immomo/moment/mediautils/b;->h:I

    .line 118
    .line 119
    if-eq v0, p1, :cond_6

    .line 120
    .line 121
    :cond_5
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 122
    .line 123
    new-instance v0, Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 124
    .line 125
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/AudioResampleUtils;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-static {p1, v0}, Lcom/immomo/moment/mediautils/a;->q(Lcom/immomo/moment/mediautils/a;Lcom/immomo/moment/mediautils/AudioResampleUtils;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 132
    .line 133
    invoke-static {p1}, Lcom/immomo/moment/mediautils/a;->p(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 138
    .line 139
    iget v3, p1, Lcom/immomo/moment/mediautils/b;->d:I

    .line 140
    .line 141
    iget v4, p1, Lcom/immomo/moment/mediautils/b;->f:I

    .line 142
    .line 143
    iget v5, p1, Lcom/immomo/moment/mediautils/b;->e:I

    .line 144
    .line 145
    iget v6, p1, Lcom/immomo/moment/mediautils/b;->g:I

    .line 146
    .line 147
    iget v7, p1, Lcom/immomo/moment/mediautils/b;->i:I

    .line 148
    .line 149
    iget v8, p1, Lcom/immomo/moment/mediautils/b;->h:I

    .line 150
    .line 151
    invoke-virtual/range {v2 .. v8}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->initResampleInfo(IIIIII)I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-gez p1, :cond_6

    .line 156
    .line 157
    const-string p1, "Init audio resampler failed !"

    .line 158
    .line 159
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    iget-object p0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 163
    .line 164
    const/4 p1, 0x0

    .line 165
    invoke-static {p0, p1}, Lcom/immomo/moment/mediautils/a;->q(Lcom/immomo/moment/mediautils/a;Lcom/immomo/moment/mediautils/AudioResampleUtils;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 166
    .line 167
    .line 168
    :cond_6
    return-void
.end method
