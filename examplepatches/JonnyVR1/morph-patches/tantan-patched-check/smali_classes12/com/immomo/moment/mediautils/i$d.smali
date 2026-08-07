.class Lcom/immomo/moment/mediautils/i$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/h$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/i;->f0(Ljava/lang/String;I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/i;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

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
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 2
    .line 3
    iget-wide v1, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 4
    .line 5
    invoke-static {v0, v1, v2}, Lcom/immomo/moment/mediautils/i;->N(Lcom/immomo/moment/mediautils/i;J)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-wide p1, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 13
    .line 14
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 15
    .line 16
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 17
    .line 18
    cmp-long p1, p1, v2

    .line 19
    .line 20
    if-lez p1, :cond_5

    .line 21
    .line 22
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/i;->l0:Z

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-static {p0, p1}, Lcom/immomo/moment/mediautils/i;->E(Lcom/immomo/moment/mediautils/i;I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 30
    .line 31
    iget-object v2, v0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 32
    .line 33
    if-eqz v2, :cond_5

    .line 34
    .line 35
    if-eqz p1, :cond_5

    .line 36
    .line 37
    iget v2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 38
    .line 39
    if-lez v2, :cond_5

    .line 40
    .line 41
    invoke-static {v0}, Lcom/immomo/moment/mediautils/i;->L(Lcom/immomo/moment/mediautils/i;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v2, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 46
    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    invoke-static {v2}, Lcom/immomo/moment/mediautils/i;->O(Lcom/immomo/moment/mediautils/i;)J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    const-wide/16 v4, 0x0

    .line 54
    .line 55
    cmp-long v0, v2, v4

    .line 56
    .line 57
    if-gez v0, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 60
    .line 61
    iget-wide v2, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 62
    .line 63
    invoke-static {v0, v2, v3}, Lcom/immomo/moment/mediautils/i;->P(Lcom/immomo/moment/mediautils/i;J)J

    .line 64
    .line 65
    .line 66
    :cond_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 67
    .line 68
    invoke-static {v0}, Lcom/immomo/moment/mediautils/i;->Q(Lcom/immomo/moment/mediautils/i;)Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/immomo/moment/mediautils/i;->Q(Lcom/immomo/moment/mediautils/i;)Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iget v2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 85
    .line 86
    if-ge v0, v2, :cond_3

    .line 87
    .line 88
    :cond_2
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 89
    .line 90
    iget v2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 91
    .line 92
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-static {v0, v2}, Lcom/immomo/moment/mediautils/i;->R(Lcom/immomo/moment/mediautils/i;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 97
    .line 98
    .line 99
    :cond_3
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 103
    .line 104
    invoke-static {v0}, Lcom/immomo/moment/mediautils/i;->Q(Lcom/immomo/moment/mediautils/i;)Ljava/nio/ByteBuffer;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget v2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 113
    .line 114
    invoke-virtual {p1, v0, v1, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    .line 117
    iget p1, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 118
    .line 119
    mul-int/lit8 p1, p1, 0x8

    .line 120
    .line 121
    iget-object p2, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 122
    .line 123
    iget v0, p2, Lcom/immomo/moment/mediautils/m;->e:I

    .line 124
    .line 125
    div-int/2addr p1, v0

    .line 126
    iget v0, p2, Lcom/immomo/moment/mediautils/m;->d:I

    .line 127
    .line 128
    div-int/2addr p1, v0

    .line 129
    invoke-static {p2}, Lcom/immomo/moment/mediautils/i;->L(Lcom/immomo/moment/mediautils/i;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 134
    .line 135
    invoke-static {v0}, Lcom/immomo/moment/mediautils/i;->Q(Lcom/immomo/moment/mediautils/i;)Ljava/nio/ByteBuffer;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {p2, v0, p1}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->resamplePcmData([BI)Ljava/nio/ByteBuffer;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    if-eqz p1, :cond_5

    .line 148
    .line 149
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    mul-int/lit8 v0, p2, 0x8

    .line 154
    .line 155
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 156
    .line 157
    iget v2, v1, Lcom/immomo/moment/mediautils/m;->g:I

    .line 158
    .line 159
    div-int/2addr v0, v2

    .line 160
    iget v2, v1, Lcom/immomo/moment/mediautils/m;->h:I

    .line 161
    .line 162
    div-int/2addr v0, v2

    .line 163
    iget-object v2, v1, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 164
    .line 165
    invoke-static {v1}, Lcom/immomo/moment/mediautils/i;->S(Lcom/immomo/moment/mediautils/i;)J

    .line 166
    .line 167
    .line 168
    move-result-wide v3

    .line 169
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 170
    .line 171
    invoke-static {v1}, Lcom/immomo/moment/mediautils/i;->O(Lcom/immomo/moment/mediautils/i;)J

    .line 172
    .line 173
    .line 174
    move-result-wide v5

    .line 175
    add-long/2addr v3, v5

    .line 176
    invoke-interface {v2, p1, p2, v3, v4}, Lcom/immomo/moment/mediautils/m$c;->e(Ljava/nio/ByteBuffer;IJ)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 180
    .line 181
    int-to-float p2, v0

    .line 182
    const/high16 v0, 0x3f800000    # 1.0f

    .line 183
    .line 184
    mul-float/2addr p2, v0

    .line 185
    iget v0, p1, Lcom/immomo/moment/mediautils/m;->f:I

    .line 186
    .line 187
    int-to-float v0, v0

    .line 188
    div-float/2addr p2, v0

    .line 189
    const v0, 0x49742400    # 1000000.0f

    .line 190
    .line 191
    .line 192
    mul-float/2addr p2, v0

    .line 193
    invoke-static {p1, p2}, Lcom/immomo/moment/mediautils/i;->T(Lcom/immomo/moment/mediautils/i;F)J

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 197
    .line 198
    invoke-static {p1}, Lcom/immomo/moment/mediautils/i;->S(Lcom/immomo/moment/mediautils/i;)J

    .line 199
    .line 200
    .line 201
    move-result-wide v0

    .line 202
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 203
    .line 204
    invoke-static {p0}, Lcom/immomo/moment/mediautils/i;->O(Lcom/immomo/moment/mediautils/i;)J

    .line 205
    .line 206
    .line 207
    move-result-wide v2

    .line 208
    add-long/2addr v0, v2

    .line 209
    invoke-static {p1, v0, v1}, Lcom/immomo/moment/mediautils/i;->V(Lcom/immomo/moment/mediautils/i;J)J

    .line 210
    .line 211
    .line 212
    return-void

    .line 213
    :cond_4
    iget-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 214
    .line 215
    invoke-static {v2, v0, v1}, Lcom/immomo/moment/mediautils/i;->V(Lcom/immomo/moment/mediautils/i;J)J

    .line 216
    .line 217
    .line 218
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 219
    .line 220
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 221
    .line 222
    iget v0, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 223
    .line 224
    iget-wide v1, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 225
    .line 226
    invoke-interface {p0, p1, v0, v1, v2}, Lcom/immomo/moment/mediautils/m$c;->e(Ljava/nio/ByteBuffer;IJ)V

    .line 227
    .line 228
    .line 229
    :cond_5
    return-void
.end method

.method public onError(IILjava/lang/String;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/immomo/moment/mediautils/m;->z:Ll/spw;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "["

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "]"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, " sourcePath:"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/immomo/moment/mediautils/i;->D(Lcom/immomo/moment/mediautils/i;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/16 v0, 0x232e

    .line 44
    .line 45
    invoke-interface {p1, v0, p0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string p1, "Audio decode error "

    .line 51
    .line 52
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "MediaDecoder"

    .line 66
    .line 67
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public onFeedingData(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 10

    .line 1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 2
    .line 3
    iget-boolean v3, v2, Lcom/immomo/moment/mediautils/i;->l0:Z

    .line 4
    .line 5
    const/4 v7, 0x0

    .line 6
    if-eqz v3, :cond_4

    .line 7
    .line 8
    invoke-static {v2}, Lcom/immomo/moment/mediautils/i;->U(Lcom/immomo/moment/mediautils/i;)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    iget-object v4, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 13
    .line 14
    invoke-static {v4}, Lcom/immomo/moment/mediautils/i;->W(Lcom/immomo/moment/mediautils/i;)J

    .line 15
    .line 16
    .line 17
    move-result-wide v4

    .line 18
    sub-long/2addr v2, v4

    .line 19
    const-wide/32 v4, 0x7a1200

    .line 20
    .line 21
    .line 22
    cmp-long v2, v2, v4

    .line 23
    .line 24
    if-lez v2, :cond_0

    .line 25
    .line 26
    iget-object v2, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 27
    .line 28
    iget-boolean v2, v2, Lcom/immomo/moment/mediautils/i;->k0:Z

    .line 29
    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    return v7

    .line 33
    :cond_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 34
    .line 35
    invoke-virtual {v2, p1, p2}, Lcom/immomo/moment/mediautils/i;->c0(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iget-object v3, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 40
    .line 41
    if-gtz v2, :cond_2

    .line 42
    .line 43
    iget-boolean v2, v3, Lcom/immomo/moment/mediautils/m;->s:Z

    .line 44
    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    const-wide/16 v4, 0x0

    .line 48
    .line 49
    const/4 v6, 0x0

    .line 50
    const/4 v2, 0x0

    .line 51
    const/4 v3, -0x1

    .line 52
    move-object v1, p2

    .line 53
    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    const-wide/16 v4, 0x0

    .line 58
    .line 59
    const/4 v6, 0x0

    .line 60
    const/4 v2, 0x0

    .line 61
    const/4 v3, 0x0

    .line 62
    move-object v1, p2

    .line 63
    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 64
    .line 65
    .line 66
    :goto_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 67
    .line 68
    iput-boolean v7, v0, Lcom/immomo/moment/mediautils/i;->l0:Z

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    iget-wide v2, v3, Lcom/immomo/moment/mediautils/m;->q:J

    .line 72
    .line 73
    const-wide/16 v4, 0x0

    .line 74
    .line 75
    cmp-long v4, v2, v4

    .line 76
    .line 77
    if-lez v4, :cond_3

    .line 78
    .line 79
    iget-wide v4, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 80
    .line 81
    const-wide/32 v8, 0x7a120

    .line 82
    .line 83
    .line 84
    add-long/2addr v2, v8

    .line 85
    cmp-long v2, v4, v2

    .line 86
    .line 87
    if-lez v2, :cond_3

    .line 88
    .line 89
    const-wide/16 v4, 0x0

    .line 90
    .line 91
    const/4 v6, 0x0

    .line 92
    const/4 v2, 0x0

    .line 93
    const/4 v3, 0x0

    .line 94
    move-object v1, p2

    .line 95
    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 99
    .line 100
    iput-boolean v7, v0, Lcom/immomo/moment/mediautils/i;->l0:Z

    .line 101
    .line 102
    :cond_3
    :goto_1
    const/4 v0, 0x1

    .line 103
    return v0

    .line 104
    :cond_4
    return v7
.end method

.method public onFinished()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v0, v1}, Lcom/immomo/moment/mediautils/i;->E(Lcom/immomo/moment/mediautils/i;I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/immomo/moment/mediautils/m$c;->a()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const-string p0, "MediaDecoder"

    .line 19
    .line 20
    const-string v0, "Audio decoder finished !!!"

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onFormatChanged(Landroid/media/MediaFormat;)V
    .locals 10

    .line 1
    const-string v0, "MediaDecoder"

    .line 2
    .line 3
    const-string v1, "Audio format changed !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 9
    .line 10
    invoke-static {v0, p1}, Lcom/immomo/moment/mediautils/i;->K(Lcom/immomo/moment/mediautils/i;Landroid/media/MediaFormat;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 14
    .line 15
    iget-object v0, p1, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Landroid/media/MediaFormat;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/media/MediaFormat;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p1, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 27
    .line 28
    iget-object v0, p1, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 29
    .line 30
    iget p1, p1, Lcom/immomo/moment/mediautils/m;->e:I

    .line 31
    .line 32
    const-string v1, "channel-count"

    .line 33
    .line 34
    invoke-virtual {v0, v1, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 38
    .line 39
    iget-object v0, p1, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 40
    .line 41
    iget p1, p1, Lcom/immomo/moment/mediautils/m;->c:I

    .line 42
    .line 43
    const-string v2, "sample-rate"

    .line 44
    .line 45
    invoke-virtual {v0, v2, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 49
    .line 50
    iget-object v0, p1, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 51
    .line 52
    const-string v3, "bit-width"

    .line 53
    .line 54
    iget p1, p1, Lcom/immomo/moment/mediautils/m;->d:I

    .line 55
    .line 56
    invoke-virtual {v0, v3, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 60
    .line 61
    iget v0, p1, Lcom/immomo/moment/mediautils/m;->g:I

    .line 62
    .line 63
    iget v3, p1, Lcom/immomo/moment/mediautils/m;->d:I

    .line 64
    .line 65
    if-ne v0, v3, :cond_1

    .line 66
    .line 67
    iget v0, p1, Lcom/immomo/moment/mediautils/m;->h:I

    .line 68
    .line 69
    iget v3, p1, Lcom/immomo/moment/mediautils/m;->e:I

    .line 70
    .line 71
    if-ne v0, v3, :cond_1

    .line 72
    .line 73
    iget v0, p1, Lcom/immomo/moment/mediautils/m;->f:I

    .line 74
    .line 75
    iget v3, p1, Lcom/immomo/moment/mediautils/m;->c:I

    .line 76
    .line 77
    if-eq v0, v3, :cond_3

    .line 78
    .line 79
    :cond_1
    invoke-static {p1}, Lcom/immomo/moment/mediautils/i;->L(Lcom/immomo/moment/mediautils/i;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    if-eqz p1, :cond_2

    .line 84
    .line 85
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 86
    .line 87
    invoke-static {p1}, Lcom/immomo/moment/mediautils/i;->L(Lcom/immomo/moment/mediautils/i;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->release()V

    .line 92
    .line 93
    .line 94
    :cond_2
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 95
    .line 96
    new-instance v0, Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 97
    .line 98
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/AudioResampleUtils;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-static {p1, v0}, Lcom/immomo/moment/mediautils/i;->M(Lcom/immomo/moment/mediautils/i;Lcom/immomo/moment/mediautils/AudioResampleUtils;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 105
    .line 106
    invoke-static {p1}, Lcom/immomo/moment/mediautils/i;->L(Lcom/immomo/moment/mediautils/i;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 111
    .line 112
    iget v4, p1, Lcom/immomo/moment/mediautils/m;->c:I

    .line 113
    .line 114
    iget v5, p1, Lcom/immomo/moment/mediautils/m;->e:I

    .line 115
    .line 116
    iget v6, p1, Lcom/immomo/moment/mediautils/m;->d:I

    .line 117
    .line 118
    iget v7, p1, Lcom/immomo/moment/mediautils/m;->f:I

    .line 119
    .line 120
    iget v8, p1, Lcom/immomo/moment/mediautils/m;->h:I

    .line 121
    .line 122
    iget v9, p1, Lcom/immomo/moment/mediautils/m;->g:I

    .line 123
    .line 124
    invoke-virtual/range {v3 .. v9}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->initResampleInfo(IIIIII)I

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 128
    .line 129
    iget-object v0, p1, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 130
    .line 131
    iget p1, p1, Lcom/immomo/moment/mediautils/m;->h:I

    .line 132
    .line 133
    invoke-virtual {v0, v1, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 137
    .line 138
    iget-object v0, p1, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 139
    .line 140
    iget p1, p1, Lcom/immomo/moment/mediautils/m;->f:I

    .line 141
    .line 142
    invoke-virtual {v0, v2, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 143
    .line 144
    .line 145
    :cond_3
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i$d;->a:Lcom/immomo/moment/mediautils/i;

    .line 146
    .line 147
    iget-object p1, p0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 148
    .line 149
    if-eqz p1, :cond_4

    .line 150
    .line 151
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 152
    .line 153
    invoke-interface {p1, p0}, Lcom/immomo/moment/mediautils/m$c;->d(Landroid/media/MediaFormat;)V

    .line 154
    .line 155
    .line 156
    :cond_4
    return-void
.end method
