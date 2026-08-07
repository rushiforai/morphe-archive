.class public Ll/ed1;
.super Ll/bc1;
.source "SourceFile"


# instance fields
.field d:Lcom/immomo/moment/mediautils/AudioResampleUtils;

.field private e:Ljava/lang/String;

.field private f:F

.field private g:Ljava/nio/ByteBuffer;

.field private h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;",
            ">;"
        }
    .end annotation
.end field

.field private i:I

.field private j:I

.field private k:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bc1;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "AudioScaleProcessor"

    .line 5
    .line 6
    iput-object v0, p0, Ll/ed1;->e:Ljava/lang/String;

    .line 7
    .line 8
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    iput v0, p0, Ll/ed1;->f:F

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Ll/ed1;->i:I

    .line 14
    .line 15
    iput v0, p0, Ll/ed1;->j:I

    .line 16
    .line 17
    new-instance v0, Ljava/lang/Object;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/ed1;->k:Ljava/lang/Object;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ed1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/ed1;->d:Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/AudioResampleUtils;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ll/ed1;->d:Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 14
    .line 15
    iget v2, p0, Ll/bc1;->a:I

    .line 16
    .line 17
    iget v3, p0, Ll/bc1;->c:I

    .line 18
    .line 19
    iget p0, p0, Ll/bc1;->b:I

    .line 20
    .line 21
    invoke-virtual {v1, v2, v3, p0}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->initScaleInfo(III)I

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    monitor-exit v0

    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method public b(Ll/ad60;IJ)Ll/ad60;
    .locals 13

    .line 1
    iget-object v8, p0, Ll/ed1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v8

    .line 4
    :try_start_0
    iget v2, p0, Ll/ed1;->f:F

    .line 5
    .line 6
    iget-object v3, p0, Ll/ed1;->h:Ljava/util/List;

    .line 7
    .line 8
    const/high16 v4, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    cmpl-float v3, v2, v4

    .line 13
    .line 14
    if-nez v3, :cond_0

    .line 15
    .line 16
    monitor-exit v8

    .line 17
    return-object p1

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto/16 :goto_2

    .line 20
    .line 21
    :cond_0
    const/4 v3, 0x0

    .line 22
    move v5, v3

    .line 23
    :goto_0
    iget-object v6, p0, Ll/ed1;->h:Ljava/util/List;

    .line 24
    .line 25
    if-eqz v6, :cond_2

    .line 26
    .line 27
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    if-lez v6, :cond_2

    .line 32
    .line 33
    iget-object v6, p0, Ll/ed1;->h:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-ge v5, v6, :cond_2

    .line 40
    .line 41
    iget-object v6, p0, Ll/ed1;->h:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    check-cast v6, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;

    .line 48
    .line 49
    invoke-virtual {v6}, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->getStart()J

    .line 50
    .line 51
    .line 52
    move-result-wide v9

    .line 53
    const-wide/16 v11, 0x3e8

    .line 54
    .line 55
    mul-long/2addr v9, v11

    .line 56
    cmp-long v7, p3, v9

    .line 57
    .line 58
    if-ltz v7, :cond_1

    .line 59
    .line 60
    invoke-virtual {v6}, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->getEnd()J

    .line 61
    .line 62
    .line 63
    move-result-wide v9

    .line 64
    mul-long/2addr v9, v11

    .line 65
    cmp-long v7, p3, v9

    .line 66
    .line 67
    if-gtz v7, :cond_1

    .line 68
    .line 69
    invoke-virtual {v6}, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->getSpeed()F

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    div-float v2, v4, v2

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    invoke-virtual {v6}, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->getEnd()J

    .line 77
    .line 78
    .line 79
    add-int/lit8 v5, v5, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    :goto_1
    invoke-virtual {p1}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    float-to-double v6, v2

    .line 87
    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    .line 88
    .line 89
    cmpl-double v6, v6, v9

    .line 90
    .line 91
    const v7, 0x49742400    # 1000000.0f

    .line 92
    .line 93
    .line 94
    if-nez v6, :cond_3

    .line 95
    .line 96
    invoke-virtual {v5, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iget v1, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 104
    .line 105
    iget v2, p0, Ll/ed1;->i:I

    .line 106
    .line 107
    int-to-float v3, v2

    .line 108
    mul-float/2addr v3, v4

    .line 109
    iget v4, p0, Ll/bc1;->a:I

    .line 110
    .line 111
    int-to-float v4, v4

    .line 112
    div-float/2addr v3, v4

    .line 113
    mul-float/2addr v3, v7

    .line 114
    float-to-long v4, v3

    .line 115
    iget v3, p0, Ll/ed1;->j:I

    .line 116
    .line 117
    div-int v3, v1, v3

    .line 118
    .line 119
    add-int/2addr v2, v3

    .line 120
    iput v2, p0, Ll/ed1;->i:I

    .line 121
    .line 122
    const/4 v3, 0x0

    .line 123
    const/4 v6, 0x0

    .line 124
    const/4 v2, 0x0

    .line 125
    move-object v0, p1

    .line 126
    invoke-virtual/range {v0 .. v6}, Ll/ad60;->d(IIIJI)V

    .line 127
    .line 128
    .line 129
    monitor-exit v8

    .line 130
    return-object p1

    .line 131
    :cond_3
    iget-object v9, p0, Ll/ed1;->g:Ljava/nio/ByteBuffer;

    .line 132
    .line 133
    if-eqz v9, :cond_4

    .line 134
    .line 135
    mul-int/lit8 v10, p2, 0x8

    .line 136
    .line 137
    invoke-virtual {v9}, Ljava/nio/Buffer;->capacity()I

    .line 138
    .line 139
    .line 140
    move-result v9

    .line 141
    if-le v10, v9, :cond_5

    .line 142
    .line 143
    :cond_4
    mul-int/lit8 v9, p2, 0x8

    .line 144
    .line 145
    invoke-static {v9}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 146
    .line 147
    .line 148
    move-result-object v9

    .line 149
    iput-object v9, p0, Ll/ed1;->g:Ljava/nio/ByteBuffer;

    .line 150
    .line 151
    :cond_5
    iget-object v9, p0, Ll/ed1;->d:Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 152
    .line 153
    iget-object v10, p0, Ll/ed1;->g:Ljava/nio/ByteBuffer;

    .line 154
    .line 155
    invoke-virtual {v9, v5, p2, v2, v10}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->scalePcmData(Ljava/nio/ByteBuffer;IFLjava/nio/ByteBuffer;)I

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    if-lez v2, :cond_6

    .line 160
    .line 161
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iget-object v5, p0, Ll/ed1;->g:Ljava/nio/ByteBuffer;

    .line 166
    .line 167
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 168
    .line 169
    .line 170
    move-result-object v9

    .line 171
    invoke-virtual {v5, v9}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 172
    .line 173
    .line 174
    iget-object v5, p0, Ll/ed1;->g:Ljava/nio/ByteBuffer;

    .line 175
    .line 176
    invoke-virtual {v5, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 180
    .line 181
    .line 182
    iget v3, p0, Ll/ed1;->i:I

    .line 183
    .line 184
    int-to-float v3, v3

    .line 185
    mul-float/2addr v3, v4

    .line 186
    iget v4, p0, Ll/bc1;->a:I

    .line 187
    .line 188
    int-to-float v4, v4

    .line 189
    div-float/2addr v3, v4

    .line 190
    mul-float/2addr v3, v7

    .line 191
    float-to-long v3, v3

    .line 192
    invoke-virtual {p1, v1}, Ll/ad60;->e(Ljava/nio/ByteBuffer;)V

    .line 193
    .line 194
    .line 195
    move-wide v5, v3

    .line 196
    const/4 v4, 0x0

    .line 197
    const/4 v7, 0x0

    .line 198
    const/4 v3, 0x0

    .line 199
    move-object v1, p1

    .line 200
    invoke-virtual/range {v1 .. v7}, Ll/ad60;->d(IIIJI)V

    .line 201
    .line 202
    .line 203
    iget v1, p0, Ll/ed1;->i:I

    .line 204
    .line 205
    iget v3, p0, Ll/ed1;->j:I

    .line 206
    .line 207
    div-int/2addr v2, v3

    .line 208
    add-int/2addr v1, v2

    .line 209
    iput v1, p0, Ll/ed1;->i:I

    .line 210
    .line 211
    monitor-exit v8

    .line 212
    return-object p1

    .line 213
    :cond_6
    const/4 v0, 0x0

    .line 214
    monitor-exit v8

    .line 215
    return-object v0

    .line 216
    :goto_2
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 217
    throw v0
.end method

.method public c()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/ed1;->i:I

    .line 3
    .line 4
    invoke-super {p0}, Ll/bc1;->c()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public d(III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/bc1;->d(III)V

    .line 2
    .line 3
    .line 4
    mul-int/2addr p2, p3

    .line 5
    div-int/lit8 p2, p2, 0x8

    .line 6
    .line 7
    iput p2, p0, Ll/ed1;->j:I

    .line 8
    .line 9
    return-void
.end method

.method public e(Ll/ad60;F)Ll/ad60;
    .locals 12

    .line 1
    iget-object v8, p0, Ll/ed1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v8

    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz p1, :cond_5

    .line 6
    .line 7
    :try_start_0
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget v2, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 20
    .line 21
    const/high16 v3, 0x3f800000    # 1.0f

    .line 22
    .line 23
    div-float v4, v3, p2

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    float-to-double v6, v4

    .line 30
    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    .line 31
    .line 32
    cmpl-double v6, v6, v9

    .line 33
    .line 34
    const v7, 0x49742400    # 1000000.0f

    .line 35
    .line 36
    .line 37
    const/4 v9, 0x0

    .line 38
    if-nez v6, :cond_1

    .line 39
    .line 40
    invoke-virtual {v5, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget v1, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 48
    .line 49
    iget v2, p0, Ll/ed1;->i:I

    .line 50
    .line 51
    int-to-float v4, v2

    .line 52
    mul-float/2addr v4, v3

    .line 53
    iget v3, p0, Ll/bc1;->a:I

    .line 54
    .line 55
    int-to-float v3, v3

    .line 56
    div-float/2addr v4, v3

    .line 57
    mul-float/2addr v4, v7

    .line 58
    float-to-long v4, v4

    .line 59
    iget v3, p0, Ll/ed1;->j:I

    .line 60
    .line 61
    div-int v3, v1, v3

    .line 62
    .line 63
    add-int/2addr v2, v3

    .line 64
    iput v2, p0, Ll/ed1;->i:I

    .line 65
    .line 66
    const/4 v3, 0x0

    .line 67
    const/4 v6, 0x0

    .line 68
    const/4 v2, 0x0

    .line 69
    move-object v0, p1

    .line 70
    invoke-virtual/range {v0 .. v6}, Ll/ad60;->d(IIIJI)V

    .line 71
    .line 72
    .line 73
    monitor-exit v8

    .line 74
    return-object p1

    .line 75
    :catchall_0
    move-exception v0

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    iget-object v10, p0, Ll/ed1;->g:Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    if-eqz v10, :cond_2

    .line 80
    .line 81
    mul-int/lit8 v11, v2, 0x8

    .line 82
    .line 83
    invoke-virtual {v10}, Ljava/nio/Buffer;->capacity()I

    .line 84
    .line 85
    .line 86
    move-result v10

    .line 87
    if-le v11, v10, :cond_3

    .line 88
    .line 89
    :cond_2
    mul-int/lit8 v10, v2, 0x8

    .line 90
    .line 91
    invoke-static {v10}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 92
    .line 93
    .line 94
    move-result-object v10

    .line 95
    iput-object v10, p0, Ll/ed1;->g:Ljava/nio/ByteBuffer;

    .line 96
    .line 97
    :cond_3
    iget-object v10, p0, Ll/ed1;->d:Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 98
    .line 99
    iget-object v11, p0, Ll/ed1;->g:Ljava/nio/ByteBuffer;

    .line 100
    .line 101
    invoke-virtual {v10, v5, v2, v4, v11}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->scalePcmData(Ljava/nio/ByteBuffer;IFLjava/nio/ByteBuffer;)I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-lez v2, :cond_4

    .line 106
    .line 107
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    iget-object v4, p0, Ll/ed1;->g:Ljava/nio/ByteBuffer;

    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 118
    .line 119
    .line 120
    iget-object v4, p0, Ll/ed1;->g:Ljava/nio/ByteBuffer;

    .line 121
    .line 122
    invoke-virtual {v4, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 126
    .line 127
    .line 128
    iget v4, p0, Ll/ed1;->i:I

    .line 129
    .line 130
    int-to-float v4, v4

    .line 131
    mul-float/2addr v4, v3

    .line 132
    iget v3, p0, Ll/bc1;->a:I

    .line 133
    .line 134
    int-to-float v3, v3

    .line 135
    div-float/2addr v4, v3

    .line 136
    mul-float/2addr v4, v7

    .line 137
    float-to-long v3, v4

    .line 138
    invoke-virtual {p1, v1}, Ll/ad60;->e(Ljava/nio/ByteBuffer;)V

    .line 139
    .line 140
    .line 141
    move-wide v5, v3

    .line 142
    const/4 v4, 0x0

    .line 143
    const/4 v7, 0x0

    .line 144
    const/4 v3, 0x0

    .line 145
    move-object v1, p1

    .line 146
    invoke-virtual/range {v1 .. v7}, Ll/ad60;->d(IIIJI)V

    .line 147
    .line 148
    .line 149
    iget v1, p0, Ll/ed1;->i:I

    .line 150
    .line 151
    iget v3, p0, Ll/ed1;->j:I

    .line 152
    .line 153
    div-int/2addr v2, v3

    .line 154
    add-int/2addr v1, v2

    .line 155
    iput v1, p0, Ll/ed1;->i:I

    .line 156
    .line 157
    monitor-exit v8

    .line 158
    return-object p1

    .line 159
    :cond_4
    monitor-exit v8

    .line 160
    return-object v1

    .line 161
    :cond_5
    :goto_0
    monitor-exit v8

    .line 162
    return-object v1

    .line 163
    :goto_1
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    throw v0
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ed1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput v1, p0, Ll/ed1;->i:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/ed1;->h:Ljava/util/List;

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public h(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ed1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/ed1;->h:Ljava/util/List;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x1

    .line 13
    if-ne v1, v2, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/ed1;->h:Ljava/util/List;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->setSpeed(F)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    monitor-exit v0

    .line 31
    return-void

    .line 32
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method
