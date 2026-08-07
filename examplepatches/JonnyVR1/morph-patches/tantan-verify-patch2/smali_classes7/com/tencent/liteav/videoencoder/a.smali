.class public Lcom/tencent/liteav/videoencoder/a;
.super Lcom/tencent/liteav/videoencoder/c;
.source "SourceFile"


# instance fields
.field private A:Z

.field private B:[Ljava/nio/ByteBuffer;

.field private C:[B

.field private volatile D:J

.field private E:J

.field private F:J

.field private G:I

.field private H:I

.field private I:I

.field private J:I

.field private K:I

.field private L:Z

.field private M:Z

.field private N:Z

.field private O:I

.field private P:I

.field private Q:I

.field private R:J

.field private S:I

.field private T:I

.field private U:I

.field private V:Lcom/tencent/liteav/basic/c/h;

.field private final W:Ljava/lang/Object;

.field private X:Z

.field private Y:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private Z:I

.field private a:I

.field private aa:J

.field private ab:I

.field private ac:I

.field private ad:Z

.field private ae:Z

.field private af:J

.field private ag:Ljava/lang/Runnable;

.field private b:J

.field private c:D

.field private d:J

.field private e:J

.field private f:I

.field private g:Z

.field private h:Z

.field private i:J

.field private j:J

.field private k:J

.field private l:J

.field private m:J

.field private n:Z

.field private o:J

.field private p:J

.field private q:Landroid/media/MediaCodec;

.field private r:Lcom/tencent/liteav/basic/util/g;

.field private s:Ljava/lang/Runnable;

.field private t:Ljava/lang/Runnable;

.field private u:Ljava/lang/Runnable;

.field private v:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private w:Ljava/lang/Object;

.field private x:Landroid/view/Surface;

.field private y:Z

.field private z:Z


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/c;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->a:I

    .line 6
    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->b:J

    .line 10
    .line 11
    const-wide/16 v3, 0x0

    .line 12
    .line 13
    iput-wide v3, p0, Lcom/tencent/liteav/videoencoder/a;->c:D

    .line 14
    .line 15
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->d:J

    .line 16
    .line 17
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->e:J

    .line 18
    .line 19
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->f:I

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->g:Z

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    iput-boolean v3, p0, Lcom/tencent/liteav/videoencoder/a;->h:Z

    .line 25
    .line 26
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->i:J

    .line 27
    .line 28
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->j:J

    .line 29
    .line 30
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->k:J

    .line 31
    .line 32
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->l:J

    .line 33
    .line 34
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->m:J

    .line 35
    .line 36
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->o:J

    .line 37
    .line 38
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->p:J

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    iput-object v4, p0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 42
    .line 43
    iput-object v4, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 44
    .line 45
    new-instance v5, Lcom/tencent/liteav/videoencoder/a$10;

    .line 46
    .line 47
    invoke-direct {v5, p0}, Lcom/tencent/liteav/videoencoder/a$10;-><init>(Lcom/tencent/liteav/videoencoder/a;)V

    .line 48
    .line 49
    .line 50
    iput-object v5, p0, Lcom/tencent/liteav/videoencoder/a;->s:Ljava/lang/Runnable;

    .line 51
    .line 52
    new-instance v5, Lcom/tencent/liteav/videoencoder/a$11;

    .line 53
    .line 54
    invoke-direct {v5, p0}, Lcom/tencent/liteav/videoencoder/a$11;-><init>(Lcom/tencent/liteav/videoencoder/a;)V

    .line 55
    .line 56
    .line 57
    iput-object v5, p0, Lcom/tencent/liteav/videoencoder/a;->t:Ljava/lang/Runnable;

    .line 58
    .line 59
    new-instance v5, Lcom/tencent/liteav/videoencoder/a$2;

    .line 60
    .line 61
    invoke-direct {v5, p0}, Lcom/tencent/liteav/videoencoder/a$2;-><init>(Lcom/tencent/liteav/videoencoder/a;)V

    .line 62
    .line 63
    .line 64
    iput-object v5, p0, Lcom/tencent/liteav/videoencoder/a;->u:Ljava/lang/Runnable;

    .line 65
    .line 66
    new-instance v5, Ljava/util/ArrayDeque;

    .line 67
    .line 68
    const/16 v6, 0xa

    .line 69
    .line 70
    invoke-direct {v5, v6}, Ljava/util/ArrayDeque;-><init>(I)V

    .line 71
    .line 72
    .line 73
    iput-object v5, p0, Lcom/tencent/liteav/videoencoder/a;->v:Ljava/util/ArrayDeque;

    .line 74
    .line 75
    iput-object v4, p0, Lcom/tencent/liteav/videoencoder/a;->x:Landroid/view/Surface;

    .line 76
    .line 77
    iput-boolean v3, p0, Lcom/tencent/liteav/videoencoder/a;->y:Z

    .line 78
    .line 79
    iput-boolean v3, p0, Lcom/tencent/liteav/videoencoder/a;->z:Z

    .line 80
    .line 81
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->A:Z

    .line 82
    .line 83
    iput-object v4, p0, Lcom/tencent/liteav/videoencoder/a;->B:[Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    iput-object v4, p0, Lcom/tencent/liteav/videoencoder/a;->C:[B

    .line 86
    .line 87
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->D:J

    .line 88
    .line 89
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->E:J

    .line 90
    .line 91
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->F:J

    .line 92
    .line 93
    iput-boolean v3, p0, Lcom/tencent/liteav/videoencoder/a;->M:Z

    .line 94
    .line 95
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->N:Z

    .line 96
    .line 97
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->O:I

    .line 98
    .line 99
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->P:I

    .line 100
    .line 101
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->Q:I

    .line 102
    .line 103
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->R:J

    .line 104
    .line 105
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->S:I

    .line 106
    .line 107
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->T:I

    .line 108
    .line 109
    const/4 v4, -0x1

    .line 110
    iput v4, p0, Lcom/tencent/liteav/videoencoder/a;->U:I

    .line 111
    .line 112
    new-instance v4, Ljava/lang/Object;

    .line 113
    .line 114
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 115
    .line 116
    .line 117
    iput-object v4, p0, Lcom/tencent/liteav/videoencoder/a;->W:Ljava/lang/Object;

    .line 118
    .line 119
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->X:Z

    .line 120
    .line 121
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->Z:I

    .line 122
    .line 123
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->aa:J

    .line 124
    .line 125
    const/4 v4, 0x3

    .line 126
    iput v4, p0, Lcom/tencent/liteav/videoencoder/a;->ab:I

    .line 127
    .line 128
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->ac:I

    .line 129
    .line 130
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->ad:Z

    .line 131
    .line 132
    iput-boolean v3, p0, Lcom/tencent/liteav/videoencoder/a;->ae:Z

    .line 133
    .line 134
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->af:J

    .line 135
    .line 136
    new-instance v0, Lcom/tencent/liteav/videoencoder/a$3;

    .line 137
    .line 138
    invoke-direct {v0, p0}, Lcom/tencent/liteav/videoencoder/a$3;-><init>(Lcom/tencent/liteav/videoencoder/a;)V

    .line 139
    .line 140
    .line 141
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->ag:Ljava/lang/Runnable;

    .line 142
    .line 143
    new-instance v0, Lcom/tencent/liteav/basic/util/g;

    .line 144
    .line 145
    const-string v1, "HWVideoEncoder"

    .line 146
    .line 147
    invoke-direct {v0, v1}, Lcom/tencent/liteav/basic/util/g;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 151
    .line 152
    return-void
.end method

.method private a(I)I
    .locals 38

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "TXCHWVideoEncoder"

    .line 4
    .line 5
    iget-object v2, v0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 6
    .line 7
    const/4 v3, -0x1

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    return v3

    .line 11
    :cond_0
    new-instance v2, Landroid/media/MediaCodec$BufferInfo;

    .line 12
    .line 13
    invoke-direct {v2}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    iget-object v4, v0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 17
    .line 18
    move/from16 v5, p1

    .line 19
    .line 20
    mul-int/lit16 v5, v5, 0x3e8

    .line 21
    .line 22
    int-to-long v5, v5

    .line 23
    invoke-virtual {v4, v2, v5, v6}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 24
    .line 25
    .line 26
    move-result v4
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2

    .line 27
    const/4 v5, 0x0

    .line 28
    if-ne v4, v3, :cond_1

    .line 29
    .line 30
    return v5

    .line 31
    :cond_1
    const/4 v6, -0x3

    .line 32
    const/4 v7, 0x1

    .line 33
    if-ne v4, v6, :cond_2

    .line 34
    .line 35
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, v0, Lcom/tencent/liteav/videoencoder/a;->B:[Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    return v7

    .line 44
    :cond_2
    const/4 v6, -0x2

    .line 45
    if-ne v4, v6, :cond_3

    .line 46
    .line 47
    :try_start_1
    iget-object v2, v0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 48
    .line 49
    invoke-virtual {v2}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/videoencoder/c;->callDelegate(Landroid/media/MediaFormat;)V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    .line 54
    .line 55
    .line 56
    return v7

    .line 57
    :catch_0
    move-exception v0

    .line 58
    new-instance v2, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v4, "mediacodec getOutputFormat failed."

    .line 61
    .line 62
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return v3

    .line 76
    :cond_3
    if-gez v4, :cond_4

    .line 77
    .line 78
    return v3

    .line 79
    :cond_4
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 80
    .line 81
    .line 82
    move-result-wide v18

    .line 83
    iget-object v8, v0, Lcom/tencent/liteav/videoencoder/a;->B:[Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    aget-object v8, v8, v4

    .line 86
    .line 87
    if-nez v8, :cond_5

    .line 88
    .line 89
    move-object/from16 v34, v1

    .line 90
    .line 91
    move/from16 v35, v4

    .line 92
    .line 93
    move v2, v5

    .line 94
    goto/16 :goto_e

    .line 95
    .line 96
    :cond_5
    iget v9, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 97
    .line 98
    move-object v10, v1

    .line 99
    new-array v1, v9, [B

    .line 100
    .line 101
    iget v11, v2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 102
    .line 103
    invoke-virtual {v8, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 104
    .line 105
    .line 106
    iget v11, v2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 107
    .line 108
    iget v12, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 109
    .line 110
    add-int/2addr v11, v12

    .line 111
    invoke-virtual {v8, v11}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 112
    .line 113
    .line 114
    iget v11, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 115
    .line 116
    invoke-virtual {v8, v1, v5, v11}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 117
    .line 118
    .line 119
    iget v11, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 120
    .line 121
    const/4 v12, 0x5

    .line 122
    const/16 v20, 0x4

    .line 123
    .line 124
    const/4 v13, 0x2

    .line 125
    if-le v11, v12, :cond_8

    .line 126
    .line 127
    aget-byte v11, v1, v5

    .line 128
    .line 129
    if-nez v11, :cond_8

    .line 130
    .line 131
    aget-byte v11, v1, v7

    .line 132
    .line 133
    if-nez v11, :cond_8

    .line 134
    .line 135
    aget-byte v11, v1, v13

    .line 136
    .line 137
    if-nez v11, :cond_8

    .line 138
    .line 139
    const/4 v11, 0x3

    .line 140
    aget-byte v14, v1, v11

    .line 141
    .line 142
    if-nez v14, :cond_8

    .line 143
    .line 144
    aget-byte v14, v1, v20

    .line 145
    .line 146
    if-nez v14, :cond_8

    .line 147
    .line 148
    aget-byte v12, v1, v12

    .line 149
    .line 150
    if-nez v12, :cond_8

    .line 151
    .line 152
    :goto_0
    add-int/lit8 v12, v9, -0x4

    .line 153
    .line 154
    if-ge v11, v12, :cond_7

    .line 155
    .line 156
    aget-byte v12, v1, v11

    .line 157
    .line 158
    if-nez v12, :cond_6

    .line 159
    .line 160
    add-int/lit8 v12, v11, 0x1

    .line 161
    .line 162
    aget-byte v12, v1, v12

    .line 163
    .line 164
    if-nez v12, :cond_6

    .line 165
    .line 166
    add-int/lit8 v12, v11, 0x2

    .line 167
    .line 168
    aget-byte v12, v1, v12

    .line 169
    .line 170
    if-nez v12, :cond_6

    .line 171
    .line 172
    add-int/lit8 v12, v11, 0x3

    .line 173
    .line 174
    aget-byte v12, v1, v12

    .line 175
    .line 176
    if-ne v12, v7, :cond_6

    .line 177
    .line 178
    sub-int/2addr v9, v11

    .line 179
    goto :goto_1

    .line 180
    :cond_6
    add-int/lit8 v11, v11, 0x1

    .line 181
    .line 182
    goto :goto_0

    .line 183
    :cond_7
    move v11, v5

    .line 184
    :goto_1
    new-array v12, v9, [B

    .line 185
    .line 186
    invoke-static {v1, v11, v12, v5, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 187
    .line 188
    .line 189
    goto :goto_2

    .line 190
    :cond_8
    move-object v12, v1

    .line 191
    :goto_2
    iget v9, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 192
    .line 193
    iget v11, v2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 194
    .line 195
    const/4 v14, 0x0

    .line 196
    if-nez v9, :cond_b

    .line 197
    .line 198
    and-int/lit8 v1, v11, 0x4

    .line 199
    .line 200
    if-eqz v1, :cond_a

    .line 201
    .line 202
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/c;->mListener:Lcom/tencent/liteav/videoencoder/d;

    .line 203
    .line 204
    if-eqz v1, :cond_9

    .line 205
    .line 206
    invoke-interface {v1, v14, v5}, Lcom/tencent/liteav/videoencoder/d;->a(Lcom/tencent/liteav/basic/structs/TXSNALPacket;I)V

    .line 207
    .line 208
    .line 209
    :cond_9
    move/from16 v35, v4

    .line 210
    .line 211
    move v2, v5

    .line 212
    move v3, v6

    .line 213
    :goto_3
    move-object/from16 v34, v10

    .line 214
    .line 215
    goto/16 :goto_e

    .line 216
    .line 217
    :cond_a
    move/from16 v35, v4

    .line 218
    .line 219
    move v2, v5

    .line 220
    goto :goto_3

    .line 221
    :cond_b
    and-int/lit8 v9, v11, 0x2

    .line 222
    .line 223
    if-ne v9, v13, :cond_d

    .line 224
    .line 225
    iget-boolean v1, v0, Lcom/tencent/liteav/videoencoder/a;->g:Z

    .line 226
    .line 227
    if-eqz v1, :cond_c

    .line 228
    .line 229
    invoke-virtual {v12}, [B->clone()Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    check-cast v1, [B

    .line 234
    .line 235
    iput-object v1, v0, Lcom/tencent/liteav/videoencoder/a;->C:[B

    .line 236
    .line 237
    goto :goto_4

    .line 238
    :cond_c
    invoke-virtual {v12}, [B->clone()Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    check-cast v1, [B

    .line 243
    .line 244
    invoke-direct {v0, v1}, Lcom/tencent/liteav/videoencoder/a;->a([B)[B

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    iput-object v1, v0, Lcom/tencent/liteav/videoencoder/a;->C:[B

    .line 249
    .line 250
    :goto_4
    move/from16 v35, v4

    .line 251
    .line 252
    move v2, v5

    .line 253
    move v3, v7

    .line 254
    goto :goto_3

    .line 255
    :cond_d
    and-int/lit8 v9, v11, 0x1

    .line 256
    .line 257
    if-ne v9, v7, :cond_f

    .line 258
    .line 259
    iput v3, v0, Lcom/tencent/liteav/videoencoder/a;->G:I

    .line 260
    .line 261
    iget-boolean v3, v0, Lcom/tencent/liteav/videoencoder/a;->g:Z

    .line 262
    .line 263
    if-eqz v3, :cond_e

    .line 264
    .line 265
    iget-object v3, v0, Lcom/tencent/liteav/videoencoder/a;->C:[B

    .line 266
    .line 267
    array-length v9, v3

    .line 268
    array-length v11, v12

    .line 269
    add-int/2addr v9, v11

    .line 270
    new-array v9, v9, [B

    .line 271
    .line 272
    array-length v11, v3

    .line 273
    invoke-static {v3, v5, v9, v5, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 274
    .line 275
    .line 276
    iget-object v3, v0, Lcom/tencent/liteav/videoencoder/a;->C:[B

    .line 277
    .line 278
    array-length v3, v3

    .line 279
    array-length v11, v12

    .line 280
    invoke-static {v12, v5, v9, v3, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 281
    .line 282
    .line 283
    move v3, v5

    .line 284
    move-object v12, v9

    .line 285
    goto :goto_5

    .line 286
    :cond_e
    invoke-direct {v0, v12}, Lcom/tencent/liteav/videoencoder/a;->a([B)[B

    .line 287
    .line 288
    .line 289
    move-result-object v3

    .line 290
    iget-object v9, v0, Lcom/tencent/liteav/videoencoder/a;->C:[B

    .line 291
    .line 292
    array-length v11, v9

    .line 293
    array-length v12, v3

    .line 294
    add-int/2addr v11, v12

    .line 295
    new-array v12, v11, [B

    .line 296
    .line 297
    array-length v11, v9

    .line 298
    invoke-static {v9, v5, v12, v5, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 299
    .line 300
    .line 301
    iget-object v9, v0, Lcom/tencent/liteav/videoencoder/a;->C:[B

    .line 302
    .line 303
    array-length v9, v9

    .line 304
    array-length v11, v3

    .line 305
    invoke-static {v3, v5, v12, v9, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 306
    .line 307
    .line 308
    move v3, v5

    .line 309
    goto :goto_5

    .line 310
    :cond_f
    iget-boolean v3, v0, Lcom/tencent/liteav/videoencoder/a;->g:Z

    .line 311
    .line 312
    if-nez v3, :cond_10

    .line 313
    .line 314
    invoke-direct {v0, v12}, Lcom/tencent/liteav/videoencoder/a;->a([B)[B

    .line 315
    .line 316
    .line 317
    move-result-object v12

    .line 318
    :cond_10
    move v3, v7

    .line 319
    :goto_5
    iget-boolean v9, v0, Lcom/tencent/liteav/videoencoder/a;->L:Z

    .line 320
    .line 321
    if-nez v9, :cond_11

    .line 322
    .line 323
    iget v9, v0, Lcom/tencent/liteav/videoencoder/a;->G:I

    .line 324
    .line 325
    add-int/2addr v9, v7

    .line 326
    iput v9, v0, Lcom/tencent/liteav/videoencoder/a;->G:I

    .line 327
    .line 328
    iget v11, v0, Lcom/tencent/liteav/videoencoder/a;->f:I

    .line 329
    .line 330
    iget v13, v0, Lcom/tencent/liteav/videoencoder/a;->H:I

    .line 331
    .line 332
    mul-int/2addr v11, v13

    .line 333
    if-ne v9, v11, :cond_11

    .line 334
    .line 335
    invoke-direct {v0}, Lcom/tencent/liteav/videoencoder/a;->f()V

    .line 336
    .line 337
    .line 338
    :cond_11
    invoke-direct {v0}, Lcom/tencent/liteav/videoencoder/a;->a()J

    .line 339
    .line 340
    .line 341
    move-result-wide v5

    .line 342
    move-object v11, v10

    .line 343
    iget-wide v9, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 344
    .line 345
    const-wide/16 v15, 0x3e8

    .line 346
    .line 347
    div-long/2addr v9, v15

    .line 348
    iget-wide v13, v0, Lcom/tencent/liteav/videoencoder/a;->F:J

    .line 349
    .line 350
    move-object/from16 v23, v8

    .line 351
    .line 352
    const-wide/16 v7, 0x0

    .line 353
    .line 354
    cmp-long v13, v13, v7

    .line 355
    .line 356
    if-nez v13, :cond_12

    .line 357
    .line 358
    iput-wide v5, v0, Lcom/tencent/liteav/videoencoder/a;->F:J

    .line 359
    .line 360
    :cond_12
    iget-wide v13, v0, Lcom/tencent/liteav/videoencoder/a;->E:J

    .line 361
    .line 362
    cmp-long v13, v13, v7

    .line 363
    .line 364
    if-nez v13, :cond_13

    .line 365
    .line 366
    iput-wide v9, v0, Lcom/tencent/liteav/videoencoder/a;->E:J

    .line 367
    .line 368
    :cond_13
    iget-wide v13, v0, Lcom/tencent/liteav/videoencoder/a;->F:J

    .line 369
    .line 370
    iget-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->E:J

    .line 371
    .line 372
    sub-long/2addr v13, v7

    .line 373
    add-long/2addr v9, v13

    .line 374
    iget-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->m:J

    .line 375
    .line 376
    cmp-long v13, v5, v7

    .line 377
    .line 378
    const-wide/16 v26, 0x1

    .line 379
    .line 380
    if-gtz v13, :cond_14

    .line 381
    .line 382
    add-long v5, v7, v26

    .line 383
    .line 384
    :cond_14
    cmp-long v7, v5, v9

    .line 385
    .line 386
    if-lez v7, :cond_15

    .line 387
    .line 388
    move-wide v5, v9

    .line 389
    :cond_15
    iput-wide v5, v0, Lcom/tencent/liteav/videoencoder/a;->m:J

    .line 390
    .line 391
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 392
    .line 393
    .line 394
    move-result-wide v5

    .line 395
    if-nez v3, :cond_18

    .line 396
    .line 397
    iget-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->d:J

    .line 398
    .line 399
    add-long/2addr v15, v7

    .line 400
    cmp-long v13, v5, v15

    .line 401
    .line 402
    if-lez v13, :cond_16

    .line 403
    .line 404
    iget-wide v13, v0, Lcom/tencent/liteav/videoencoder/a;->o:J

    .line 405
    .line 406
    long-to-double v13, v13

    .line 407
    const-wide v15, 0x40bf400000000000L    # 8000.0

    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    mul-double/2addr v13, v15

    .line 413
    sub-long v7, v5, v7

    .line 414
    .line 415
    long-to-double v7, v7

    .line 416
    div-double/2addr v13, v7

    .line 417
    const-wide/high16 v7, 0x4090000000000000L    # 1024.0

    .line 418
    .line 419
    div-double/2addr v13, v7

    .line 420
    double-to-long v7, v13

    .line 421
    iput-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->b:J

    .line 422
    .line 423
    const-wide/16 v7, 0x0

    .line 424
    .line 425
    iput-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->o:J

    .line 426
    .line 427
    iput-wide v5, v0, Lcom/tencent/liteav/videoencoder/a;->d:J

    .line 428
    .line 429
    invoke-direct {v0}, Lcom/tencent/liteav/videoencoder/a;->g()V

    .line 430
    .line 431
    .line 432
    goto :goto_6

    .line 433
    :cond_16
    const-wide/16 v7, 0x0

    .line 434
    .line 435
    :goto_6
    iget-wide v13, v0, Lcom/tencent/liteav/videoencoder/a;->j:J

    .line 436
    .line 437
    move-wide/from16 v24, v7

    .line 438
    .line 439
    add-long v7, v13, v26

    .line 440
    .line 441
    iput-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->j:J

    .line 442
    .line 443
    const-wide/16 v15, 0x100

    .line 444
    .line 445
    rem-long/2addr v7, v15

    .line 446
    cmp-long v7, v7, v24

    .line 447
    .line 448
    if-nez v7, :cond_17

    .line 449
    .line 450
    const-wide/16 v7, 0x2

    .line 451
    .line 452
    add-long/2addr v13, v7

    .line 453
    iput-wide v13, v0, Lcom/tencent/liteav/videoencoder/a;->j:J

    .line 454
    .line 455
    :cond_17
    move-wide/from16 v7, v24

    .line 456
    .line 457
    iput-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->k:J

    .line 458
    .line 459
    goto :goto_7

    .line 460
    :cond_18
    iget-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->k:J

    .line 461
    .line 462
    add-long v7, v7, v26

    .line 463
    .line 464
    iput-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->k:J

    .line 465
    .line 466
    :goto_7
    iget-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->o:J

    .line 467
    .line 468
    array-length v13, v12

    .line 469
    int-to-long v13, v13

    .line 470
    add-long/2addr v7, v13

    .line 471
    iput-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->o:J

    .line 472
    .line 473
    iget-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->e:J

    .line 474
    .line 475
    const-wide/16 v13, 0x7d0

    .line 476
    .line 477
    add-long/2addr v13, v7

    .line 478
    cmp-long v13, v5, v13

    .line 479
    .line 480
    if-lez v13, :cond_1b

    .line 481
    .line 482
    iget-wide v13, v0, Lcom/tencent/liteav/videoencoder/a;->p:J

    .line 483
    .line 484
    long-to-double v13, v13

    .line 485
    const-wide v15, 0x408f400000000000L    # 1000.0

    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    mul-double/2addr v13, v15

    .line 491
    sub-long v7, v5, v7

    .line 492
    .line 493
    long-to-double v7, v7

    .line 494
    div-double/2addr v13, v7

    .line 495
    iput-wide v13, v0, Lcom/tencent/liteav/videoencoder/a;->c:D

    .line 496
    .line 497
    const-wide/16 v7, 0x0

    .line 498
    .line 499
    iput-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->p:J

    .line 500
    .line 501
    iput-wide v5, v0, Lcom/tencent/liteav/videoencoder/a;->e:J

    .line 502
    .line 503
    iget-object v5, v0, Lcom/tencent/liteav/videoencoder/a;->Y:Ljava/util/ArrayList;

    .line 504
    .line 505
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 506
    .line 507
    .line 508
    move-result-object v5

    .line 509
    :cond_19
    :goto_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 510
    .line 511
    .line 512
    move-result v6

    .line 513
    if-eqz v6, :cond_1a

    .line 514
    .line 515
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 516
    .line 517
    .line 518
    move-result-object v6

    .line 519
    check-cast v6, Ljava/lang/Long;

    .line 520
    .line 521
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 522
    .line 523
    .line 524
    move-result-wide v13

    .line 525
    cmp-long v13, v13, v7

    .line 526
    .line 527
    if-lez v13, :cond_19

    .line 528
    .line 529
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 530
    .line 531
    .line 532
    move-result-wide v6

    .line 533
    move-wide v7, v6

    .line 534
    goto :goto_8

    .line 535
    :cond_1a
    iget-object v5, v0, Lcom/tencent/liteav/videoencoder/a;->Y:Ljava/util/ArrayList;

    .line 536
    .line 537
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 538
    .line 539
    .line 540
    const-wide/16 v5, 0x3

    .line 541
    .line 542
    mul-long/2addr v7, v5

    .line 543
    long-to-int v5, v7

    .line 544
    iput v5, v0, Lcom/tencent/liteav/videoencoder/a;->Z:I

    .line 545
    .line 546
    :cond_1b
    iget-wide v5, v0, Lcom/tencent/liteav/videoencoder/a;->p:J

    .line 547
    .line 548
    add-long v5, v5, v26

    .line 549
    .line 550
    iput-wide v5, v0, Lcom/tencent/liteav/videoencoder/a;->p:J

    .line 551
    .line 552
    iget v5, v2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 553
    .line 554
    move-object/from16 v6, v23

    .line 555
    .line 556
    invoke-virtual {v6, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 557
    .line 558
    .line 559
    iget-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->l:J

    .line 560
    .line 561
    add-long v7, v7, v26

    .line 562
    .line 563
    iput-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->l:J

    .line 564
    .line 565
    iget-object v5, v0, Lcom/tencent/liteav/videoencoder/c;->mListener:Lcom/tencent/liteav/videoencoder/d;

    .line 566
    .line 567
    if-eqz v5, :cond_1c

    .line 568
    .line 569
    iget-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->j:J

    .line 570
    .line 571
    iget-wide v13, v0, Lcom/tencent/liteav/videoencoder/a;->k:J

    .line 572
    .line 573
    const/16 v29, 0x2

    .line 574
    .line 575
    move-object/from16 v28, v5

    .line 576
    .line 577
    move-wide/from16 v30, v7

    .line 578
    .line 579
    move-wide/from16 v32, v13

    .line 580
    .line 581
    invoke-interface/range {v28 .. v33}, Lcom/tencent/liteav/videoencoder/d;->a(IJJ)V

    .line 582
    .line 583
    .line 584
    :cond_1c
    iget-boolean v5, v0, Lcom/tencent/liteav/videoencoder/a;->h:Z

    .line 585
    .line 586
    move-object/from16 v17, v2

    .line 587
    .line 588
    move v2, v3

    .line 589
    move v7, v4

    .line 590
    const/4 v8, 0x0

    .line 591
    iget-wide v3, v0, Lcom/tencent/liteav/videoencoder/a;->j:J

    .line 592
    .line 593
    if-eqz v5, :cond_1e

    .line 594
    .line 595
    move-object/from16 v16, v6

    .line 596
    .line 597
    iget-wide v5, v0, Lcom/tencent/liteav/videoencoder/a;->k:J

    .line 598
    .line 599
    move v1, v7

    .line 600
    move-object v13, v8

    .line 601
    iget-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->l:J

    .line 602
    .line 603
    if-nez v2, :cond_1d

    .line 604
    .line 605
    move-wide v14, v5

    .line 606
    goto :goto_9

    .line 607
    :cond_1d
    sub-long v14, v5, v26

    .line 608
    .line 609
    :goto_9
    const/16 v23, 0x0

    .line 610
    .line 611
    move/from16 v24, v1

    .line 612
    .line 613
    move-object v1, v12

    .line 614
    move-object/from16 v25, v13

    .line 615
    .line 616
    move-wide/from16 v36, v14

    .line 617
    .line 618
    move-object v15, v11

    .line 619
    move-wide v11, v9

    .line 620
    move-wide/from16 v9, v36

    .line 621
    .line 622
    move-wide v13, v11

    .line 623
    move-object/from16 v34, v15

    .line 624
    .line 625
    move/from16 v15, v23

    .line 626
    .line 627
    move/from16 v35, v24

    .line 628
    .line 629
    const/16 v21, -0x2

    .line 630
    .line 631
    const/16 v22, 0x1

    .line 632
    .line 633
    invoke-virtual/range {v0 .. v17}, Lcom/tencent/liteav/videoencoder/c;->callDelegate([BIJJJJJJILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 634
    .line 635
    .line 636
    :goto_a
    move-object/from16 v1, v17

    .line 637
    .line 638
    goto :goto_c

    .line 639
    :cond_1e
    move-object/from16 v16, v6

    .line 640
    .line 641
    move/from16 v35, v7

    .line 642
    .line 643
    move-object/from16 v34, v11

    .line 644
    .line 645
    const/16 v21, -0x2

    .line 646
    .line 647
    const/16 v22, 0x1

    .line 648
    .line 649
    move-wide v11, v9

    .line 650
    iget-wide v5, v0, Lcom/tencent/liteav/videoencoder/a;->k:J

    .line 651
    .line 652
    iget-wide v7, v0, Lcom/tencent/liteav/videoencoder/a;->l:J

    .line 653
    .line 654
    if-nez v2, :cond_1f

    .line 655
    .line 656
    move-wide v9, v5

    .line 657
    goto :goto_b

    .line 658
    :cond_1f
    sub-long v9, v5, v26

    .line 659
    .line 660
    :goto_b
    const/4 v15, 0x0

    .line 661
    move-wide v13, v11

    .line 662
    invoke-virtual/range {v0 .. v17}, Lcom/tencent/liteav/videoencoder/c;->callDelegate([BIJJJJJJILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 663
    .line 664
    .line 665
    goto :goto_a

    .line 666
    :goto_c
    iget v2, v0, Lcom/tencent/liteav/videoencoder/a;->P:I

    .line 667
    .line 668
    add-int/lit8 v2, v2, 0x1

    .line 669
    .line 670
    iput v2, v0, Lcom/tencent/liteav/videoencoder/a;->P:I

    .line 671
    .line 672
    iget v1, v1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 673
    .line 674
    and-int/lit8 v1, v1, 0x4

    .line 675
    .line 676
    if-eqz v1, :cond_21

    .line 677
    .line 678
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/c;->mListener:Lcom/tencent/liteav/videoencoder/d;

    .line 679
    .line 680
    const/4 v2, 0x0

    .line 681
    if-eqz v1, :cond_20

    .line 682
    .line 683
    const/4 v8, 0x0

    .line 684
    invoke-interface {v1, v8, v2}, Lcom/tencent/liteav/videoencoder/d;->a(Lcom/tencent/liteav/basic/structs/TXSNALPacket;I)V

    .line 685
    .line 686
    .line 687
    :cond_20
    move/from16 v3, v21

    .line 688
    .line 689
    goto :goto_d

    .line 690
    :cond_21
    const/4 v2, 0x0

    .line 691
    move/from16 v3, v22

    .line 692
    .line 693
    :goto_d
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 694
    .line 695
    .line 696
    move-result-wide v4

    .line 697
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/a;->Y:Ljava/util/ArrayList;

    .line 698
    .line 699
    sub-long v4, v4, v18

    .line 700
    .line 701
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 702
    .line 703
    .line 704
    move-result-object v4

    .line 705
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 706
    .line 707
    .line 708
    :goto_e
    :try_start_2
    iget-object v0, v0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 709
    .line 710
    if-eqz v0, :cond_22

    .line 711
    .line 712
    move/from16 v1, v35

    .line 713
    .line 714
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_1

    .line 715
    .line 716
    .line 717
    return v3

    .line 718
    :catch_1
    move-exception v0

    .line 719
    goto :goto_f

    .line 720
    :cond_22
    return v3

    .line 721
    :goto_f
    new-instance v1, Ljava/lang/StringBuilder;

    .line 722
    .line 723
    const-string v2, "releaseOutputBuffer failed."

    .line 724
    .line 725
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 726
    .line 727
    .line 728
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 729
    .line 730
    .line 731
    move-result-object v0

    .line 732
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 733
    .line 734
    .line 735
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 736
    .line 737
    .line 738
    move-result-object v0

    .line 739
    move-object/from16 v15, v34

    .line 740
    .line 741
    invoke-static {v15, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 742
    .line 743
    .line 744
    return v3

    .line 745
    :catch_2
    move-exception v0

    .line 746
    move-object v15, v1

    .line 747
    new-instance v1, Ljava/lang/StringBuilder;

    .line 748
    .line 749
    const-string v2, "dequeueOutputBuffer failed."

    .line 750
    .line 751
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 752
    .line 753
    .line 754
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 755
    .line 756
    .line 757
    move-result-object v0

    .line 758
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 759
    .line 760
    .line 761
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 762
    .line 763
    .line 764
    move-result-object v0

    .line 765
    invoke-static {v15, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 766
    .line 767
    .line 768
    return v3
.end method

.method private a(II[B[BI)I
    .locals 2

    if-lez p2, :cond_0

    if-le p1, p2, :cond_0

    sub-int/2addr p1, p2

    const/4 p0, 0x4

    .line 879
    :try_start_0
    new-array v0, p0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 880
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 881
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 882
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1, p3, p5, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, p5, 0x4

    .line 883
    invoke-static {p4, p2, p3, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/2addr p1, p0

    add-int/2addr p5, p1

    return p5

    .line 884
    :catch_0
    const-string p0, "TXCHWVideoEncoder"

    const-string p1, "setNalData exception"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return p5
.end method

.method private a()J
    .locals 2

    .line 806
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a;->v:Ljava/util/ArrayDeque;

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 807
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method private static a(Ljava/lang/String;)Landroid/media/MediaCodecInfo;
    .locals 8
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 799
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_2

    .line 800
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v3

    .line 801
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 802
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v4

    .line 803
    array-length v5, v4

    move v6, v1

    :goto_1
    if-ge v6, v5, :cond_1

    aget-object v7, v4, v6

    .line 804
    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method private a(IIIII)Landroid/media/MediaFormat;
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    if-eqz p3, :cond_1

    if-nez p4, :cond_0

    goto :goto_0

    .line 773
    :cond_0
    const-string p0, "video/avc"

    invoke-static {p0, p1, p2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object p0

    mul-int/lit16 p3, p3, 0x400

    .line 774
    const-string p1, "bitrate"

    invoke-virtual {p0, p1, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 775
    const-string p1, "frame-rate"

    invoke-virtual {p0, p1, p4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 776
    const-string p1, "color-format"

    const p2, 0x7f000789

    invoke-virtual {p0, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 777
    const-string p1, "i-frame-interval"

    invoke-virtual {p0, p1, p5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private a(IIIIIIIZ)Landroid/media/MediaFormat;
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 778
    invoke-direct/range {p0 .. p5}, Lcom/tencent/liteav/videoencoder/a;->a(IIIII)Landroid/media/MediaFormat;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 779
    :cond_0
    const-string p2, "video/avc"

    invoke-static {p2}, Lcom/tencent/liteav/videoencoder/a;->a(Ljava/lang/String;)Landroid/media/MediaCodecInfo;

    move-result-object p3

    if-nez p3, :cond_1

    goto/16 :goto_2

    .line 780
    :cond_1
    invoke-virtual {p3, p2}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object p2

    .line 781
    invoke-virtual {p2}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getEncoderCapabilities()Landroid/media/MediaCodecInfo$EncoderCapabilities;

    move-result-object p3

    .line 782
    const-string p4, "bitrate-mode"

    if-eqz p8, :cond_2

    .line 783
    invoke-virtual {p1, p4, p6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    goto :goto_0

    .line 784
    :cond_2
    invoke-virtual {p3, p6}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->isBitrateModeSupported(I)Z

    move-result p5

    if-eqz p5, :cond_3

    .line 785
    invoke-virtual {p1, p4, p6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    goto :goto_0

    .line 786
    :cond_3
    iget-boolean p0, p0, Lcom/tencent/liteav/videoencoder/a;->L:Z

    const/4 p5, 0x2

    if-eqz p0, :cond_5

    const/4 p0, 0x1

    .line 787
    invoke-virtual {p3, p0}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->isBitrateModeSupported(I)Z

    move-result p6

    if-eqz p6, :cond_4

    .line 788
    invoke-virtual {p1, p4, p0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    goto :goto_0

    .line 789
    :cond_4
    invoke-virtual {p3, p5}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->isBitrateModeSupported(I)Z

    move-result p0

    if-eqz p0, :cond_6

    .line 790
    invoke-virtual {p1, p4, p5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    goto :goto_0

    .line 791
    :cond_5
    invoke-virtual {p3, p5}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->isBitrateModeSupported(I)Z

    move-result p0

    if-eqz p0, :cond_6

    .line 792
    invoke-virtual {p1, p4, p5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 793
    :cond_6
    :goto_0
    invoke-virtual {p3}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->getComplexityRange()Landroid/util/Range;

    move-result-object p0

    const/4 p3, 0x5

    .line 794
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p0, p3}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const-string p3, "complexity"

    invoke-virtual {p1, p3, p0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 795
    iget-object p0, p2, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    array-length p2, p0

    const/4 p3, 0x0

    move p4, p3

    :goto_1
    if-ge p3, p2, :cond_8

    aget-object p5, p0, p3

    .line 796
    iget p6, p5, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    if-gt p6, p7, :cond_7

    if-le p6, p4, :cond_7

    .line 797
    const-string p4, "profile"

    invoke-virtual {p1, p4, p6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 798
    const-string p4, "level"

    iget p5, p5, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-virtual {p1, p4, p5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    move p4, p6

    :cond_7
    add-int/lit8 p3, p3, 0x1

    goto :goto_1

    :cond_8
    :goto_2
    return-object p1
.end method

.method private a(II)V
    .locals 3

    .line 885
    const-string v0, "TXCHWVideoEncoder"

    const-string v1, "createCopyTexture"

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 886
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->W:Ljava/lang/Object;

    monitor-enter v0

    .line 887
    :try_start_0
    new-instance v1, Lcom/tencent/liteav/basic/c/h;

    invoke-direct {v1}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    iput-object v1, p0, Lcom/tencent/liteav/videoencoder/a;->V:Lcom/tencent/liteav/basic/c/h;

    const/4 v2, 0x1

    .line 888
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 889
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/a;->V:Lcom/tencent/liteav/basic/c/h;

    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 890
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a;->V:Lcom/tencent/liteav/basic/c/h;

    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 891
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private a(J)V
    .locals 0

    .line 805
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a;->v:Ljava/util/ArrayDeque;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/videoencoder/a;)V
    .locals 0

    .line 868
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->e()V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/videoencoder/a;I)V
    .locals 0

    .line 769
    invoke-direct {p0, p1}, Lcom/tencent/liteav/videoencoder/a;->d(I)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/videoencoder/a;J)V
    .locals 0

    .line 770
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/videoencoder/a;->a(J)V

    return-void
.end method

.method private a(Landroid/view/Surface;II)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 808
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "HWVideoEncode createGL: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/c;->mGLContextExternal:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TXCHWVideoEncoder"

    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 809
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/c;->mGLContextExternal:Ljava/lang/Object;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    instance-of v3, v1, Landroid/opengl/EGLContext;

    if-eqz v3, :cond_1

    .line 810
    check-cast v1, Landroid/opengl/EGLContext;

    invoke-static {v2, v1, p1, p2, p3}, Lcom/tencent/liteav/basic/c/c;->a(Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;Landroid/view/Surface;II)Lcom/tencent/liteav/basic/c/c;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/a;->w:Ljava/lang/Object;

    goto :goto_0

    .line 811
    :cond_1
    check-cast v1, Ljavax/microedition/khronos/egl/EGLContext;

    invoke-static {v2, v1, p1, p2, p3}, Lcom/tencent/liteav/basic/c/b;->a(Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;Landroid/view/Surface;II)Lcom/tencent/liteav/basic/c/b;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/a;->w:Ljava/lang/Object;

    .line 812
    :goto_0
    iget-object p1, p0, Lcom/tencent/liteav/videoencoder/a;->w:Ljava/lang/Object;

    if-nez p1, :cond_2

    return v0

    :cond_2
    const/high16 p1, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 813
    invoke-static {v1, v1, v1, p1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 814
    new-instance p1, Lcom/tencent/liteav/basic/c/h;

    invoke-direct {p1}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/c;->mEncodeFilter:Lcom/tencent/liteav/basic/c/h;

    .line 815
    sget-object v1, Lcom/tencent/liteav/basic/c/l;->e:[F

    sget-object v3, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    invoke-static {v3, v0, v0}, Lcom/tencent/liteav/basic/c/l;->a(Lcom/tencent/liteav/basic/c/k;ZZ)[F

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Lcom/tencent/liteav/basic/c/h;->a([F[F)V

    .line 816
    iget-object p1, p0, Lcom/tencent/liteav/videoencoder/c;->mEncodeFilter:Lcom/tencent/liteav/basic/c/h;

    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    move-result p1

    if-nez p1, :cond_3

    .line 817
    iput-object v2, p0, Lcom/tencent/liteav/videoencoder/c;->mEncodeFilter:Lcom/tencent/liteav/basic/c/h;

    return v0

    .line 818
    :cond_3
    invoke-static {v0, v0, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    const/4 p0, 0x1

    return p0
.end method

.method private a(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)Z
    .locals 9
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    const/4 v0, 0x0

    .line 819
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->z:Z

    .line 820
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->y:Z

    const-wide/16 v1, 0x0

    .line 821
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->b:J

    const-wide/16 v3, 0x0

    .line 822
    iput-wide v3, p0, Lcom/tencent/liteav/videoencoder/a;->c:D

    .line 823
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->d:J

    .line 824
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->e:J

    .line 825
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->f:I

    .line 826
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->i:J

    .line 827
    iget-wide v3, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->baseGopIndex:J

    iput-wide v3, p0, Lcom/tencent/liteav/videoencoder/a;->j:J

    .line 828
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->k:J

    .line 829
    iget-wide v3, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->baseFrameIndex:J

    iput-wide v3, p0, Lcom/tencent/liteav/videoencoder/a;->l:J

    .line 830
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->m:J

    .line 831
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->o:J

    .line 832
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->p:J

    const/4 v3, 0x0

    .line 833
    iput-object v3, p0, Lcom/tencent/liteav/videoencoder/a;->B:[Ljava/nio/ByteBuffer;

    .line 834
    iput-object v3, p0, Lcom/tencent/liteav/videoencoder/a;->C:[B

    .line 835
    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->D:J

    const/4 v1, -0x1

    .line 836
    iput v1, p0, Lcom/tencent/liteav/videoencoder/a;->G:I

    .line 837
    iget v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    iput v2, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 838
    iget v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    iput v2, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 839
    iget v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->gop:I

    iput v2, p0, Lcom/tencent/liteav/videoencoder/a;->H:I

    .line 840
    iget v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fps:I

    iput v2, p0, Lcom/tencent/liteav/videoencoder/a;->I:I

    .line 841
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "init with fps "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/tencent/liteav/videoencoder/a;->I:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "TXCHWVideoEncoder"

    invoke-static {v3, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 842
    iget-boolean v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fullIFrame:Z

    iput-boolean v2, p0, Lcom/tencent/liteav/videoencoder/a;->L:Z

    .line 843
    iget-boolean v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->syncOutput:Z

    iput-boolean v2, p0, Lcom/tencent/liteav/videoencoder/a;->n:Z

    .line 844
    iget-boolean v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->enableEGL14:Z

    iput-boolean v2, p0, Lcom/tencent/liteav/videoencoder/a;->A:Z

    .line 845
    iget-boolean v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->forceSetBitrateMode:Z

    iput-boolean v2, p0, Lcom/tencent/liteav/videoencoder/a;->N:Z

    .line 846
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/a;->v:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->clear()V

    .line 847
    iget-boolean v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->bLimitFps:Z

    iput-boolean v2, p0, Lcom/tencent/liteav/videoencoder/a;->M:Z

    .line 848
    iget v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    const/4 v3, 0x1

    if-eqz v2, :cond_8

    iget v4, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    if-eqz v4, :cond_8

    iget v5, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fps:I

    if-eqz v5, :cond_8

    iget v5, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->gop:I

    if-nez v5, :cond_0

    goto :goto_1

    .line 849
    :cond_0
    iget-boolean v5, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->annexb:Z

    iput-boolean v5, p0, Lcom/tencent/liteav/videoencoder/a;->g:Z

    .line 850
    iget-boolean v5, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->appendSpsPps:Z

    iput-boolean v5, p0, Lcom/tencent/liteav/videoencoder/a;->h:Z

    .line 851
    iget v5, p0, Lcom/tencent/liteav/videoencoder/a;->a:I

    if-nez v5, :cond_1

    mul-int/2addr v2, v2

    int-to-double v5, v2

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    mul-double/2addr v5, v7

    mul-int/2addr v4, v4

    int-to-double v7, v4

    add-double/2addr v5, v7

    .line 852
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    const-wide v6, 0x3ff3333333333333L    # 1.2

    mul-double/2addr v4, v6

    double-to-int v2, v4

    iput v2, p0, Lcom/tencent/liteav/videoencoder/a;->a:I

    .line 853
    :cond_1
    iget v2, p0, Lcom/tencent/liteav/videoencoder/a;->a:I

    int-to-long v4, v2

    iput-wide v4, p0, Lcom/tencent/liteav/videoencoder/a;->i:J

    .line 854
    iget v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fps:I

    iput v2, p0, Lcom/tencent/liteav/videoencoder/a;->f:I

    .line 855
    iget v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderMode:I

    const/4 v4, 0x2

    if-eq v2, v3, :cond_4

    if-eq v2, v4, :cond_3

    const/4 v5, 0x3

    if-eq v2, v5, :cond_2

    goto :goto_0

    :cond_2
    move v4, v0

    goto :goto_0

    :cond_3
    move v4, v3

    .line 856
    :cond_4
    :goto_0
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    move-result-object v2

    invoke-virtual {v2}, Lcom/tencent/liteav/basic/d/c;->c()I

    move-result v2

    if-ne v2, v3, :cond_5

    .line 857
    iput v3, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderProfile:I

    .line 858
    :cond_5
    iput v4, p0, Lcom/tencent/liteav/videoencoder/a;->J:I

    .line 859
    iput v3, p0, Lcom/tencent/liteav/videoencoder/a;->K:I

    .line 860
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->c()Z

    move-result p1

    if-nez p1, :cond_6

    return v0

    .line 861
    :cond_6
    iput-boolean v3, p0, Lcom/tencent/liteav/videoencoder/c;->mInit:Z

    .line 862
    iget-boolean p1, p0, Lcom/tencent/liteav/videoencoder/a;->M:Z

    if-eqz p1, :cond_7

    .line 863
    iput v1, p0, Lcom/tencent/liteav/videoencoder/a;->U:I

    .line 864
    iget-object p1, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/a;->t:Ljava/lang/Runnable;

    invoke-virtual {p1, v1}, Lcom/tencent/liteav/basic/util/g;->b(Ljava/lang/Runnable;)V

    .line 865
    :cond_7
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/a;->Y:Ljava/util/ArrayList;

    .line 866
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->Z:I

    return v3

    .line 867
    :cond_8
    :goto_1
    iput-boolean v3, p0, Lcom/tencent/liteav/videoencoder/a;->y:Z

    return v0
.end method

.method public static synthetic a(Lcom/tencent/liteav/videoencoder/a;Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)Z
    .locals 0

    .line 771
    invoke-direct {p0, p1}, Lcom/tencent/liteav/videoencoder/a;->a(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)Z

    move-result p0

    return p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/videoencoder/a;Z)Z
    .locals 0

    .line 772
    iput-boolean p1, p0, Lcom/tencent/liteav/videoencoder/a;->y:Z

    return p1
.end method

.method private a([B)[B
    .locals 10

    .line 869
    array-length v0, p1

    add-int/lit8 v1, v0, 0x14

    .line 870
    new-array v5, v1, [B

    const/4 v1, 0x0

    move v3, v1

    move v4, v3

    move v7, v4

    :goto_0
    if-ge v3, v0, :cond_4

    .line 871
    aget-byte v8, p1, v3

    const/4 v9, 0x1

    if-nez v8, :cond_0

    add-int/lit8 v2, v3, 0x1

    aget-byte v2, p1, v2

    if-nez v2, :cond_0

    add-int/lit8 v2, v3, 0x2

    aget-byte v2, p1, v2

    if-ne v2, v9, :cond_0

    move-object v2, p0

    move-object v6, p1

    .line 872
    invoke-direct/range {v2 .. v7}, Lcom/tencent/liteav/videoencoder/a;->a(II[B[BI)I

    move-result v7

    add-int/lit8 v3, v3, 0x3

    :goto_1
    move v4, v3

    goto :goto_2

    :cond_0
    move-object v2, p0

    move-object v6, p1

    if-nez v8, :cond_1

    add-int/lit8 p0, v3, 0x1

    .line 873
    aget-byte p0, v6, p0

    if-nez p0, :cond_1

    add-int/lit8 p0, v3, 0x2

    aget-byte p0, v6, p0

    if-nez p0, :cond_1

    add-int/lit8 p0, v3, 0x3

    aget-byte p0, v6, p0

    if-ne p0, v9, :cond_1

    .line 874
    invoke-direct/range {v2 .. v7}, Lcom/tencent/liteav/videoencoder/a;->a(II[B[BI)I

    move-result v7

    add-int/lit8 v3, v3, 0x4

    goto :goto_1

    :cond_1
    :goto_2
    add-int/lit8 p0, v0, -0x4

    if-ne v3, p0, :cond_3

    add-int/lit8 p0, v3, 0x1

    .line 875
    aget-byte p0, v6, p0

    if-nez p0, :cond_2

    add-int/lit8 p0, v3, 0x2

    aget-byte p0, v6, p0

    if-nez p0, :cond_2

    add-int/lit8 p0, v3, 0x3

    aget-byte p0, v6, p0

    if-eq p0, v9, :cond_3

    :cond_2
    move v3, v0

    goto :goto_3

    :cond_3
    add-int/lit8 v3, v3, 0x1

    move-object p0, v2

    move-object p1, v6

    goto :goto_0

    :cond_4
    move-object v2, p0

    move-object v6, p1

    .line 876
    :goto_3
    invoke-direct/range {v2 .. v7}, Lcom/tencent/liteav/videoencoder/a;->a(II[B[BI)I

    move-result p0

    .line 877
    new-array p1, p0, [B

    .line 878
    invoke-static {v5, v1, p1, v1, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/videoencoder/a;J)J
    .locals 0

    .line 199
    iput-wide p1, p0, Lcom/tencent/liteav/videoencoder/a;->af:J

    return-wide p1
.end method

.method private b()V
    .locals 3

    .line 189
    const-string v0, "TXCHWVideoEncoder"

    const-string v1, "HWVideoEncode destroyGL"

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/c;->mEncodeFilter:Lcom/tencent/liteav/basic/c/h;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 191
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 192
    iput-object v1, p0, Lcom/tencent/liteav/videoencoder/c;->mEncodeFilter:Lcom/tencent/liteav/basic/c/h;

    .line 193
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->w:Ljava/lang/Object;

    instance-of v2, v0, Lcom/tencent/liteav/basic/c/b;

    if-eqz v2, :cond_1

    .line 194
    check-cast v0, Lcom/tencent/liteav/basic/c/b;

    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/b;->c()V

    .line 195
    iput-object v1, p0, Lcom/tencent/liteav/videoencoder/a;->w:Ljava/lang/Object;

    .line 196
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->w:Ljava/lang/Object;

    instance-of v2, v0, Lcom/tencent/liteav/basic/c/c;

    if-eqz v2, :cond_2

    .line 197
    check-cast v0, Lcom/tencent/liteav/basic/c/c;

    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/c;->c()V

    .line 198
    iput-object v1, p0, Lcom/tencent/liteav/videoencoder/a;->w:Ljava/lang/Object;

    :cond_2
    return-void
.end method

.method private b(I)V
    .locals 13
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->y:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_e

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->w:Ljava/lang/Object;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto/16 :goto_7

    .line 11
    .line 12
    :cond_0
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/a;->W:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v2

    .line 15
    :try_start_0
    iget v0, p0, Lcom/tencent/liteav/videoencoder/a;->U:I

    .line 16
    .line 17
    iget-boolean v3, p0, Lcom/tencent/liteav/videoencoder/a;->M:Z

    .line 18
    .line 19
    const/4 v4, -0x1

    .line 20
    if-eqz v3, :cond_2

    .line 21
    .line 22
    iput v4, p0, Lcom/tencent/liteav/videoencoder/a;->U:I

    .line 23
    .line 24
    if-ne v0, v4, :cond_1

    .line 25
    .line 26
    iput-boolean v1, p0, Lcom/tencent/liteav/videoencoder/a;->X:Z

    .line 27
    .line 28
    monitor-exit v2

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    move-object p0, v0

    .line 32
    goto/16 :goto_6

    .line 33
    .line 34
    :cond_1
    iget v3, p0, Lcom/tencent/liteav/videoencoder/a;->T:I

    .line 35
    .line 36
    add-int/2addr v3, v1

    .line 37
    iput v3, p0, Lcom/tencent/liteav/videoencoder/a;->T:I

    .line 38
    .line 39
    iget-object v3, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 40
    .line 41
    iget-object v5, p0, Lcom/tencent/liteav/videoencoder/a;->t:Ljava/lang/Runnable;

    .line 42
    .line 43
    iget v6, p0, Lcom/tencent/liteav/videoencoder/a;->I:I

    .line 44
    .line 45
    const/16 v7, 0x3e8

    .line 46
    .line 47
    div-int/2addr v7, v6

    .line 48
    int-to-long v6, v7

    .line 49
    invoke-virtual {v3, v5, v6, v7}, Lcom/tencent/liteav/basic/util/g;->a(Ljava/lang/Runnable;J)V

    .line 50
    .line 51
    .line 52
    :cond_2
    if-ne v0, v4, :cond_3

    .line 53
    .line 54
    monitor-exit v2

    .line 55
    return-void

    .line 56
    :cond_3
    iget-wide v5, p0, Lcom/tencent/liteav/videoencoder/a;->D:J

    .line 57
    .line 58
    invoke-direct {p0, v5, v6}, Lcom/tencent/liteav/videoencoder/a;->a(J)V

    .line 59
    .line 60
    .line 61
    iget v3, p0, Lcom/tencent/liteav/videoencoder/c;->mRotation:I

    .line 62
    .line 63
    rsub-int v3, v3, 0x2d0

    .line 64
    .line 65
    rem-int/lit16 v8, v3, 0x168

    .line 66
    .line 67
    const/16 v3, 0x10e

    .line 68
    .line 69
    const/16 v5, 0x5a

    .line 70
    .line 71
    if-eq v8, v5, :cond_5

    .line 72
    .line 73
    if-ne v8, v3, :cond_4

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    iget v6, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_5
    :goto_0
    iget v6, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 80
    .line 81
    :goto_1
    if-eq v8, v5, :cond_7

    .line 82
    .line 83
    if-ne v8, v3, :cond_6

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_6
    iget v3, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_7
    :goto_2
    iget v3, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 90
    .line 91
    :goto_3
    iget-object v5, p0, Lcom/tencent/liteav/videoencoder/c;->mEncodeFilter:Lcom/tencent/liteav/basic/c/h;

    .line 92
    .line 93
    move v7, v6

    .line 94
    iget v6, p0, Lcom/tencent/liteav/videoencoder/c;->mInputWidth:I

    .line 95
    .line 96
    move v9, v7

    .line 97
    iget v7, p0, Lcom/tencent/liteav/videoencoder/c;->mInputHeight:I

    .line 98
    .line 99
    int-to-float v9, v9

    .line 100
    int-to-float v3, v3

    .line 101
    div-float v10, v9, v3

    .line 102
    .line 103
    iget-boolean v11, p0, Lcom/tencent/liteav/videoencoder/c;->mEnableXMirror:Z

    .line 104
    .line 105
    const/4 v12, 0x1

    .line 106
    const/4 v9, 0x0

    .line 107
    invoke-virtual/range {v5 .. v12}, Lcom/tencent/liteav/basic/c/h;->a(III[FFZZ)V

    .line 108
    .line 109
    .line 110
    iget-object v3, p0, Lcom/tencent/liteav/videoencoder/c;->mEncodeFilter:Lcom/tencent/liteav/basic/c/h;

    .line 111
    .line 112
    invoke-virtual {v3, v0}, Lcom/tencent/liteav/basic/c/h;->a(I)I

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->w:Ljava/lang/Object;

    .line 116
    .line 117
    instance-of v3, v0, Lcom/tencent/liteav/basic/c/c;

    .line 118
    .line 119
    if-eqz v3, :cond_8

    .line 120
    .line 121
    check-cast v0, Lcom/tencent/liteav/basic/c/c;

    .line 122
    .line 123
    iget-wide v5, p0, Lcom/tencent/liteav/videoencoder/a;->D:J

    .line 124
    .line 125
    const-wide/32 v7, 0xf4240

    .line 126
    .line 127
    .line 128
    mul-long/2addr v5, v7

    .line 129
    invoke-virtual {v0, v5, v6}, Lcom/tencent/liteav/basic/c/c;->a(J)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->w:Ljava/lang/Object;

    .line 133
    .line 134
    check-cast v0, Lcom/tencent/liteav/basic/c/c;

    .line 135
    .line 136
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/c;->d()Z

    .line 137
    .line 138
    .line 139
    :cond_8
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->w:Ljava/lang/Object;

    .line 140
    .line 141
    instance-of v3, v0, Lcom/tencent/liteav/basic/c/b;

    .line 142
    .line 143
    if-eqz v3, :cond_9

    .line 144
    .line 145
    check-cast v0, Lcom/tencent/liteav/basic/c/b;

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/b;->a()Z

    .line 148
    .line 149
    .line 150
    :cond_9
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    :goto_4
    invoke-direct {p0, p1}, Lcom/tencent/liteav/videoencoder/a;->a(I)I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-lez v0, :cond_a

    .line 156
    .line 157
    goto :goto_4

    .line 158
    :cond_a
    if-eq v0, v4, :cond_c

    .line 159
    .line 160
    const/4 p1, -0x2

    .line 161
    if-ne v0, p1, :cond_b

    .line 162
    .line 163
    goto :goto_5

    .line 164
    :cond_b
    iget p1, p0, Lcom/tencent/liteav/videoencoder/a;->O:I

    .line 165
    .line 166
    add-int/2addr p1, v1

    .line 167
    iput p1, p0, Lcom/tencent/liteav/videoencoder/a;->O:I

    .line 168
    .line 169
    return-void

    .line 170
    :cond_c
    :goto_5
    if-ne v0, v4, :cond_d

    .line 171
    .line 172
    const p1, 0x989685

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videoencoder/c;->callDelegate(I)V

    .line 176
    .line 177
    .line 178
    :cond_d
    iput-boolean v1, p0, Lcom/tencent/liteav/videoencoder/a;->y:Z

    .line 179
    .line 180
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->e()V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :goto_6
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 185
    throw p0

    .line 186
    :cond_e
    :goto_7
    return-void
.end method

.method public static synthetic b(Lcom/tencent/liteav/videoencoder/a;I)V
    .locals 0

    .line 187
    invoke-direct {p0, p1}, Lcom/tencent/liteav/videoencoder/a;->c(I)V

    return-void
.end method

.method public static synthetic b(Lcom/tencent/liteav/videoencoder/a;)Z
    .locals 0

    .line 188
    iget-boolean p0, p0, Lcom/tencent/liteav/videoencoder/a;->y:Z

    return p0
.end method

.method public static synthetic c(Lcom/tencent/liteav/videoencoder/a;I)I
    .locals 0

    .line 368
    invoke-direct {p0, p1}, Lcom/tencent/liteav/videoencoder/a;->a(I)I

    move-result p0

    return p0
.end method

.method public static synthetic c(Lcom/tencent/liteav/videoencoder/a;)Ljava/lang/Object;
    .locals 0

    .line 367
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a;->w:Ljava/lang/Object;

    return-object p0
.end method

.method private c(I)V
    .locals 8

    .line 369
    iget-boolean p1, p0, Lcom/tencent/liteav/videoencoder/c;->mInit:Z

    if-nez p1, :cond_0

    goto/16 :goto_1

    .line 370
    :cond_0
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->i:J

    iget p1, p0, Lcom/tencent/liteav/videoencoder/a;->a:I

    int-to-long v2, p1

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    goto/16 :goto_1

    :cond_1
    int-to-long v2, p1

    cmp-long p1, v2, v0

    const/4 v0, 0x0

    if-gez p1, :cond_3

    .line 371
    iget-boolean p1, p0, Lcom/tencent/liteav/videoencoder/a;->ae:Z

    if-eqz p1, :cond_3

    .line 372
    iget-boolean p1, p0, Lcom/tencent/liteav/videoencoder/a;->ad:Z

    if-eqz p1, :cond_2

    .line 373
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "restart video hw encoder when down bps\u3002[module:"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "] [Hardware:"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "] [osVersion:"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 374
    const-string v1, "TXCHWVideoEncoder"

    invoke-static {v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x2

    .line 375
    const-string v2, ""

    invoke-static {v1, p1, v2, v0}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x3

    .line 376
    iput p1, p0, Lcom/tencent/liteav/videoencoder/a;->ab:I

    .line 377
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->aa:J

    .line 378
    iget p1, p0, Lcom/tencent/liteav/videoencoder/a;->a:I

    iput p1, p0, Lcom/tencent/liteav/videoencoder/a;->ac:I

    .line 379
    :cond_3
    :goto_0
    iget p1, p0, Lcom/tencent/liteav/videoencoder/a;->a:I

    int-to-long v1, p1

    iput-wide v1, p0, Lcom/tencent/liteav/videoencoder/a;->i:J

    .line 380
    iget-object p1, p0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    if-eqz p1, :cond_6

    if-eqz v0, :cond_5

    .line 381
    iget-object p1, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    invoke-virtual {p1}, Lcom/tencent/liteav/basic/util/g;->a()Landroid/os/Handler;

    move-result-object p1

    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->ag:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 382
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 383
    iget-wide v2, p0, Lcom/tencent/liteav/videoencoder/a;->af:J

    sub-long v4, v0, v2

    const-wide/16 v6, 0x7d0

    cmp-long p1, v4, v6

    if-ltz p1, :cond_4

    .line 384
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a;->ag:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    .line 385
    :cond_4
    iget-object p1, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a;->ag:Ljava/lang/Runnable;

    sub-long/2addr v0, v2

    sub-long/2addr v6, v0

    invoke-virtual {p1, p0, v6, v7}, Lcom/tencent/liteav/basic/util/g;->a(Ljava/lang/Runnable;J)V

    return-void

    .line 386
    :cond_5
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 387
    iget v0, p0, Lcom/tencent/liteav/videoencoder/a;->a:I

    mul-int/lit16 v0, v0, 0x400

    const-string v1, "video-bitrate"

    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 388
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    invoke-virtual {p0, p1}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V

    :cond_6
    :goto_1
    return-void
.end method

.method private c()Z
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v10, "TXCHWVideoEncoder"

    .line 4
    .line 5
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v2, "Video"

    .line 10
    .line 11
    const-string v3, "CheckVideoEncDownBps"

    .line 12
    .line 13
    invoke-virtual {v0, v2, v3}, Lcom/tencent/liteav/basic/d/c;->a(Ljava/lang/String;Ljava/lang/String;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    const-wide/16 v4, 0x0

    .line 18
    .line 19
    cmp-long v0, v2, v4

    .line 20
    .line 21
    const/4 v11, 0x0

    .line 22
    const/4 v12, 0x1

    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    move v0, v12

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v0, v11

    .line 28
    :goto_0
    iput-boolean v0, v1, Lcom/tencent/liteav/videoencoder/a;->ae:Z

    .line 29
    .line 30
    iput v11, v1, Lcom/tencent/liteav/videoencoder/a;->O:I

    .line 31
    .line 32
    iput v11, v1, Lcom/tencent/liteav/videoencoder/a;->P:I

    .line 33
    .line 34
    iput-wide v4, v1, Lcom/tencent/liteav/videoencoder/a;->R:J

    .line 35
    .line 36
    iput v11, v1, Lcom/tencent/liteav/videoencoder/a;->S:I

    .line 37
    .line 38
    iput v11, v1, Lcom/tencent/liteav/videoencoder/a;->Q:I

    .line 39
    .line 40
    iput v11, v1, Lcom/tencent/liteav/videoencoder/a;->T:I

    .line 41
    .line 42
    const/4 v13, 0x5

    .line 43
    const/4 v14, 0x0

    .line 44
    :try_start_0
    iget v2, v1, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 45
    .line 46
    iget v3, v1, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 47
    .line 48
    iget v4, v1, Lcom/tencent/liteav/videoencoder/a;->a:I

    .line 49
    .line 50
    iget v5, v1, Lcom/tencent/liteav/videoencoder/a;->I:I

    .line 51
    .line 52
    iget v6, v1, Lcom/tencent/liteav/videoencoder/a;->H:I

    .line 53
    .line 54
    iget v7, v1, Lcom/tencent/liteav/videoencoder/a;->J:I

    .line 55
    .line 56
    iget v8, v1, Lcom/tencent/liteav/videoencoder/a;->K:I

    .line 57
    .line 58
    iget-boolean v9, v1, Lcom/tencent/liteav/videoencoder/a;->N:Z

    .line 59
    .line 60
    invoke-direct/range {v1 .. v9}, Lcom/tencent/liteav/videoencoder/a;->a(IIIIIIIZ)Landroid/media/MediaFormat;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    if-nez v2, :cond_1

    .line 65
    .line 66
    iput-boolean v12, v1, Lcom/tencent/liteav/videoencoder/a;->y:Z

    .line 67
    .line 68
    return v11

    .line 69
    :catch_0
    move-exception v0

    .line 70
    move v15, v12

    .line 71
    goto/16 :goto_5

    .line 72
    .line 73
    :cond_1
    const-string v0, "video/avc"

    .line 74
    .line 75
    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, v1, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .line 81
    const/4 v15, 0x2

    .line 82
    :try_start_1
    iget-object v0, v1, Lcom/tencent/liteav/videoencoder/c;->mEncFmt:Lorg/json/JSONArray;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 83
    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    move v0, v11

    .line 87
    :goto_1
    :try_start_2
    iget-object v3, v1, Lcom/tencent/liteav/videoencoder/c;->mEncFmt:Lorg/json/JSONArray;

    .line 88
    .line 89
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-ge v0, v3, :cond_2

    .line 94
    .line 95
    iget-object v3, v1, Lcom/tencent/liteav/videoencoder/c;->mEncFmt:Lorg/json/JSONArray;

    .line 96
    .line 97
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    const-string v4, "key"

    .line 102
    .line 103
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    const-string v5, "value"

    .line 108
    .line 109
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    invoke-virtual {v2, v4, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 114
    .line 115
    .line 116
    add-int/lit8 v0, v0, 0x1

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :catch_1
    move-exception v0

    .line 120
    :try_start_3
    new-instance v3, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    const-string v4, "config custom format error "

    .line 126
    .line 127
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-static {v10, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 142
    .line 143
    .line 144
    goto :goto_2

    .line 145
    :catch_2
    move-exception v0

    .line 146
    goto/16 :goto_5

    .line 147
    .line 148
    :cond_2
    :goto_2
    :try_start_4
    iget-object v0, v1, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 149
    .line 150
    invoke-virtual {v0, v2, v14, v14, v12}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 151
    .line 152
    .line 153
    new-instance v0, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 156
    .line 157
    .line 158
    const-string v3, "configure format =  "

    .line 159
    .line 160
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v2}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-static {v10, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 175
    .line 176
    .line 177
    goto/16 :goto_4

    .line 178
    .line 179
    :catch_3
    move-exception v0

    .line 180
    move-object v2, v0

    .line 181
    :try_start_5
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 182
    .line 183
    .line 184
    iget-boolean v0, v1, Lcom/tencent/liteav/videoencoder/a;->N:Z

    .line 185
    .line 186
    if-eqz v0, :cond_5

    .line 187
    .line 188
    move-object v3, v2

    .line 189
    iget v2, v1, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 190
    .line 191
    move-object v4, v3

    .line 192
    iget v3, v1, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 193
    .line 194
    move-object v5, v4

    .line 195
    iget v4, v1, Lcom/tencent/liteav/videoencoder/a;->a:I

    .line 196
    .line 197
    move-object v6, v5

    .line 198
    iget v5, v1, Lcom/tencent/liteav/videoencoder/a;->I:I

    .line 199
    .line 200
    move-object v7, v6

    .line 201
    iget v6, v1, Lcom/tencent/liteav/videoencoder/a;->H:I

    .line 202
    .line 203
    move-object v8, v7

    .line 204
    iget v7, v1, Lcom/tencent/liteav/videoencoder/a;->J:I

    .line 205
    .line 206
    move-object v9, v8

    .line 207
    iget v8, v1, Lcom/tencent/liteav/videoencoder/a;->K:I

    .line 208
    .line 209
    move-object/from16 v16, v9

    .line 210
    .line 211
    const/4 v9, 0x0

    .line 212
    move-object/from16 v17, v16

    .line 213
    .line 214
    invoke-direct/range {v1 .. v9}, Lcom/tencent/liteav/videoencoder/a;->a(IIIIIIIZ)Landroid/media/MediaFormat;

    .line 215
    .line 216
    .line 217
    move-result-object v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 218
    :try_start_6
    iget-object v2, v1, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 219
    .line 220
    invoke-virtual {v2, v0, v14, v14, v12}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 221
    .line 222
    .line 223
    goto :goto_4

    .line 224
    :catch_4
    move-exception v0

    .line 225
    :try_start_7
    instance-of v2, v0, Ljava/lang/IllegalArgumentException;

    .line 226
    .line 227
    if-nez v2, :cond_3

    .line 228
    .line 229
    instance-of v0, v0, Landroid/media/MediaCodec$CodecException;

    .line 230
    .line 231
    if-eqz v0, :cond_4

    .line 232
    .line 233
    :cond_3
    iget v2, v1, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 234
    .line 235
    iget v3, v1, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 236
    .line 237
    iget v4, v1, Lcom/tencent/liteav/videoencoder/a;->a:I

    .line 238
    .line 239
    iget v5, v1, Lcom/tencent/liteav/videoencoder/a;->I:I

    .line 240
    .line 241
    iget v6, v1, Lcom/tencent/liteav/videoencoder/a;->H:I

    .line 242
    .line 243
    invoke-direct/range {v1 .. v6}, Lcom/tencent/liteav/videoencoder/a;->a(IIIII)Landroid/media/MediaFormat;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    iget-object v2, v1, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 248
    .line 249
    invoke-virtual {v2, v0, v14, v14, v12}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 250
    .line 251
    .line 252
    :cond_4
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Throwable;->printStackTrace()V

    .line 253
    .line 254
    .line 255
    goto :goto_4

    .line 256
    :cond_5
    move-object v3, v2

    .line 257
    instance-of v0, v3, Ljava/lang/IllegalArgumentException;

    .line 258
    .line 259
    if-nez v0, :cond_7

    .line 260
    .line 261
    instance-of v0, v3, Landroid/media/MediaCodec$CodecException;

    .line 262
    .line 263
    if-eqz v0, :cond_6

    .line 264
    .line 265
    goto :goto_3

    .line 266
    :cond_6
    throw v3

    .line 267
    :cond_7
    :goto_3
    iget v2, v1, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 268
    .line 269
    iget v3, v1, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 270
    .line 271
    iget v4, v1, Lcom/tencent/liteav/videoencoder/a;->a:I

    .line 272
    .line 273
    iget v5, v1, Lcom/tencent/liteav/videoencoder/a;->I:I

    .line 274
    .line 275
    iget v6, v1, Lcom/tencent/liteav/videoencoder/a;->H:I

    .line 276
    .line 277
    invoke-direct/range {v1 .. v6}, Lcom/tencent/liteav/videoencoder/a;->a(IIIII)Landroid/media/MediaFormat;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    iget-object v2, v1, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 282
    .line 283
    invoke-virtual {v2, v0, v14, v14, v12}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 284
    .line 285
    .line 286
    :goto_4
    const/4 v15, 0x3

    .line 287
    iget-object v0, v1, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 288
    .line 289
    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    iput-object v0, v1, Lcom/tencent/liteav/videoencoder/a;->x:Landroid/view/Surface;

    .line 294
    .line 295
    const/4 v15, 0x4

    .line 296
    iget-object v0, v1, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 297
    .line 298
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    .line 299
    .line 300
    .line 301
    :try_start_8
    iget-object v0, v1, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 302
    .line 303
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    iput-object v0, v1, Lcom/tencent/liteav/videoencoder/a;->B:[Ljava/nio/ByteBuffer;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    .line 308
    .line 309
    goto :goto_6

    .line 310
    :catch_5
    move-exception v0

    .line 311
    move v15, v13

    .line 312
    :goto_5
    const-string v2, "create encode format failed."

    .line 313
    .line 314
    invoke-static {v10, v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 315
    .line 316
    .line 317
    if-lt v15, v13, :cond_8

    .line 318
    .line 319
    :try_start_9
    iget-object v0, v1, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 320
    .line 321
    if-eqz v0, :cond_8

    .line 322
    .line 323
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 324
    .line 325
    .line 326
    :cond_8
    iput-object v14, v1, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 327
    .line 328
    iget-object v0, v1, Lcom/tencent/liteav/videoencoder/a;->x:Landroid/view/Surface;

    .line 329
    .line 330
    if-eqz v0, :cond_9

    .line 331
    .line 332
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 333
    .line 334
    .line 335
    :cond_9
    iput-object v14, v1, Lcom/tencent/liteav/videoencoder/a;->x:Landroid/view/Surface;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    .line 336
    .line 337
    :catch_6
    :goto_6
    iget-object v0, v1, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 338
    .line 339
    if-eqz v0, :cond_c

    .line 340
    .line 341
    iget-object v0, v1, Lcom/tencent/liteav/videoencoder/a;->B:[Ljava/nio/ByteBuffer;

    .line 342
    .line 343
    if-eqz v0, :cond_c

    .line 344
    .line 345
    iget-object v0, v1, Lcom/tencent/liteav/videoencoder/a;->x:Landroid/view/Surface;

    .line 346
    .line 347
    if-nez v0, :cond_a

    .line 348
    .line 349
    goto :goto_7

    .line 350
    :cond_a
    iget v2, v1, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 351
    .line 352
    iget v3, v1, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 353
    .line 354
    invoke-direct {v1, v0, v2, v3}, Lcom/tencent/liteav/videoencoder/a;->a(Landroid/view/Surface;II)Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    if-nez v0, :cond_b

    .line 359
    .line 360
    iput-boolean v12, v1, Lcom/tencent/liteav/videoencoder/a;->y:Z

    .line 361
    .line 362
    return v11

    .line 363
    :cond_b
    return v12

    .line 364
    :cond_c
    :goto_7
    iput-boolean v12, v1, Lcom/tencent/liteav/videoencoder/a;->y:Z

    .line 365
    .line 366
    return v11
.end method

.method public static synthetic d(Lcom/tencent/liteav/videoencoder/a;)I
    .locals 2

    .line 83
    iget v0, p0, Lcom/tencent/liteav/videoencoder/a;->O:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/tencent/liteav/videoencoder/a;->O:I

    return v0
.end method

.method private d()V
    .locals 5

    .line 1
    const-string v0, "release encoder failed."

    .line 2
    .line 3
    const-string v1, "TXCHWVideoEncoder"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v3, 0x0

    .line 11
    :try_start_0
    invoke-virtual {v2}, Landroid/media/MediaCodec;->stop()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    :try_start_1
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/a;->x:Landroid/view/Surface;

    .line 20
    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/view/Surface;->release()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception v2

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    :goto_0
    iput-object v3, p0, Lcom/tencent/liteav/videoencoder/a;->x:Landroid/view/Surface;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :goto_1
    invoke-static {v1, v0, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    goto :goto_2

    .line 36
    :catchall_0
    move-exception v2

    .line 37
    goto :goto_3

    .line 38
    :catch_1
    move-exception v2

    .line 39
    :try_start_2
    const-string v4, "stop encoder failed."

    .line 40
    .line 41
    invoke-static {v1, v4, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 42
    .line 43
    .line 44
    :try_start_3
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 45
    .line 46
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/a;->x:Landroid/view/Surface;

    .line 50
    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/view/Surface;->release()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :goto_2
    iput-object v3, p0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 58
    .line 59
    return-void

    .line 60
    :goto_3
    :try_start_4
    iget-object v4, p0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 61
    .line 62
    invoke-virtual {v4}, Landroid/media/MediaCodec;->release()V

    .line 63
    .line 64
    .line 65
    iget-object v4, p0, Lcom/tencent/liteav/videoencoder/a;->x:Landroid/view/Surface;

    .line 66
    .line 67
    if-eqz v4, :cond_2

    .line 68
    .line 69
    invoke-virtual {v4}, Landroid/view/Surface;->release()V

    .line 70
    .line 71
    .line 72
    goto :goto_4

    .line 73
    :catch_2
    move-exception p0

    .line 74
    goto :goto_5

    .line 75
    :cond_2
    :goto_4
    iput-object v3, p0, Lcom/tencent/liteav/videoencoder/a;->x:Landroid/view/Surface;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 76
    .line 77
    goto :goto_6

    .line 78
    :goto_5
    invoke-static {v1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    :goto_6
    throw v2
.end method

.method private d(I)V
    .locals 2

    .line 84
    iget-boolean v0, p0, Lcom/tencent/liteav/videoencoder/c;->mInit:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_2

    .line 85
    iget v0, p0, Lcom/tencent/liteav/videoencoder/a;->I:I

    if-ne v0, p1, :cond_1

    goto :goto_0

    .line 86
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "set fps "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", restart encoder."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXCHWVideoEncoder"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->b()V

    .line 88
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->d()V

    .line 89
    iput p1, p0, Lcom/tencent/liteav/videoencoder/a;->I:I

    .line 90
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->c()Z

    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic d(Lcom/tencent/liteav/videoencoder/a;I)V
    .locals 0

    .line 82
    invoke-direct {p0, p1}, Lcom/tencent/liteav/videoencoder/a;->b(I)V

    return-void
.end method

.method public static synthetic e(Lcom/tencent/liteav/videoencoder/a;)Landroid/media/MediaCodec;
    .locals 0

    .line 79
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    return-object p0
.end method

.method private e()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/videoencoder/c;->mInit:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->y:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->z:Z

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->b()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->d()V

    .line 15
    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->U:I

    .line 19
    .line 20
    const-wide/16 v0, 0x0

    .line 21
    .line 22
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->b:J

    .line 23
    .line 24
    const-wide/16 v2, 0x0

    .line 25
    .line 26
    iput-wide v2, p0, Lcom/tencent/liteav/videoencoder/a;->c:D

    .line 27
    .line 28
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->d:J

    .line 29
    .line 30
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->e:J

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    iput v2, p0, Lcom/tencent/liteav/videoencoder/a;->f:I

    .line 34
    .line 35
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->i:J

    .line 36
    .line 37
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->j:J

    .line 38
    .line 39
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->k:J

    .line 40
    .line 41
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->l:J

    .line 42
    .line 43
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->m:J

    .line 44
    .line 45
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->o:J

    .line 46
    .line 47
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->p:J

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    iput-object v3, p0, Lcom/tencent/liteav/videoencoder/c;->mGLContextExternal:Ljava/lang/Object;

    .line 51
    .line 52
    iput-object v3, p0, Lcom/tencent/liteav/videoencoder/a;->B:[Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    iput-object v3, p0, Lcom/tencent/liteav/videoencoder/a;->C:[B

    .line 55
    .line 56
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->D:J

    .line 57
    .line 58
    iput v2, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 59
    .line 60
    iput v2, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 61
    .line 62
    iput-boolean v2, p0, Lcom/tencent/liteav/videoencoder/c;->mInit:Z

    .line 63
    .line 64
    iput-object v3, p0, Lcom/tencent/liteav/videoencoder/c;->mListener:Lcom/tencent/liteav/videoencoder/d;

    .line 65
    .line 66
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->v:Ljava/util/ArrayDeque;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->Y:Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 74
    .line 75
    .line 76
    iput v2, p0, Lcom/tencent/liteav/videoencoder/a;->Z:I

    .line 77
    .line 78
    return-void
.end method

.method private f()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

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
    const-string v1, "request-sync"

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a;->q:Landroid/media/MediaCodec;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/tencent/liteav/videoencoder/a;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->b()V

    return-void
.end method

.method private g()V
    .locals 10

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->aa:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_4

    .line 8
    .line 9
    iget v0, p0, Lcom/tencent/liteav/videoencoder/a;->I:I

    .line 10
    .line 11
    iget-wide v4, p0, Lcom/tencent/liteav/videoencoder/a;->c:D

    .line 12
    .line 13
    double-to-int v1, v4

    .line 14
    sub-int v1, v0, v1

    .line 15
    .line 16
    div-int/lit8 v0, v0, 0x2

    .line 17
    .line 18
    const/4 v4, 0x5

    .line 19
    if-ge v0, v4, :cond_0

    .line 20
    .line 21
    move v0, v4

    .line 22
    :cond_0
    if-gt v1, v0, :cond_4

    .line 23
    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    iget-wide v4, p0, Lcom/tencent/liteav/videoencoder/a;->aa:J

    .line 29
    .line 30
    sub-long/2addr v0, v4

    .line 31
    iget v4, p0, Lcom/tencent/liteav/videoencoder/a;->ab:I

    .line 32
    .line 33
    rsub-int/lit8 v5, v4, 0x4

    .line 34
    .line 35
    mul-int/lit16 v5, v5, 0x7d0

    .line 36
    .line 37
    int-to-long v5, v5

    .line 38
    cmp-long v0, v0, v5

    .line 39
    .line 40
    if-lez v0, :cond_4

    .line 41
    .line 42
    iget v0, p0, Lcom/tencent/liteav/videoencoder/a;->ac:I

    .line 43
    .line 44
    int-to-long v0, v0

    .line 45
    iget-wide v5, p0, Lcom/tencent/liteav/videoencoder/a;->b:J

    .line 46
    .line 47
    sub-long/2addr v0, v5

    .line 48
    iget-wide v5, p0, Lcom/tencent/liteav/videoencoder/a;->i:J

    .line 49
    .line 50
    const-wide/16 v7, 0x2

    .line 51
    .line 52
    div-long/2addr v5, v7

    .line 53
    const-wide/16 v7, 0x64

    .line 54
    .line 55
    cmp-long v9, v5, v7

    .line 56
    .line 57
    if-gez v9, :cond_1

    .line 58
    .line 59
    move-wide v5, v7

    .line 60
    :cond_1
    cmp-long v0, v0, v5

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    if-lez v0, :cond_3

    .line 64
    .line 65
    iput-boolean v1, p0, Lcom/tencent/liteav/videoencoder/a;->ad:Z

    .line 66
    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v1, "real bitrate is too much lower than target bitrate![targetBr:"

    .line 70
    .line 71
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget v1, p0, Lcom/tencent/liteav/videoencoder/a;->ac:I

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v1, "] [realBr:"

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-wide v4, p0, Lcom/tencent/liteav/videoencoder/a;->b:J

    .line 85
    .line 86
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v1, "]. restart encoder. [module:"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v1, "] [Hardware:"

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    sget-object v1, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string v1, "] [osVersion:"

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v1, "]"

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    const-string v1, "TXCHWVideoEncoder"

    .line 129
    .line 130
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    const-string v1, ""

    .line 134
    .line 135
    const/4 v4, 0x0

    .line 136
    const/4 v5, 0x3

    .line 137
    invoke-static {v5, v0, v1, v4}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 141
    .line 142
    if-eqz v0, :cond_2

    .line 143
    .line 144
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/a;->ag:Ljava/lang/Runnable;

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/util/g;->b(Ljava/lang/Runnable;)V

    .line 147
    .line 148
    .line 149
    :cond_2
    iput-wide v2, p0, Lcom/tencent/liteav/videoencoder/a;->aa:J

    .line 150
    .line 151
    return-void

    .line 152
    :cond_3
    sub-int/2addr v4, v1

    .line 153
    iput v4, p0, Lcom/tencent/liteav/videoencoder/a;->ab:I

    .line 154
    .line 155
    if-gtz v4, :cond_4

    .line 156
    .line 157
    iput-wide v2, p0, Lcom/tencent/liteav/videoencoder/a;->aa:J

    .line 158
    .line 159
    :cond_4
    return-void
.end method

.method public static synthetic g(Lcom/tencent/liteav/videoencoder/a;)V
    .locals 0

    .line 160
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->d()V

    return-void
.end method

.method private h()V
    .locals 2

    .line 1
    const-string v0, "TXCHWVideoEncoder"

    .line 2
    .line 3
    const-string v1, "destroyCopyTexture"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->W:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/a;->V:Lcom/tencent/liteav/basic/c/h;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Lcom/tencent/liteav/videoencoder/a;->V:Lcom/tencent/liteav/basic/c/h;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    const/4 v1, -0x1

    .line 25
    iput v1, p0, Lcom/tencent/liteav/videoencoder/a;->U:I

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0
.end method

.method public static synthetic h(Lcom/tencent/liteav/videoencoder/a;)Z
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->c()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public getEncodeCost()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/videoencoder/a;->Z:I

    .line 2
    .line 3
    return p0
.end method

.method public getRealBitrate()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRealFPS()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/a;->c:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public pushVideoFrame(IIIJ)J
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->z:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-wide/32 p0, 0x989684

    .line 6
    .line 7
    .line 8
    return-wide p0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->W:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/a;->V:Lcom/tencent/liteav/basic/c/h;

    .line 13
    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    invoke-direct {p0, p2, p3}, Lcom/tencent/liteav/videoencoder/a;->a(II)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto/16 :goto_1

    .line 22
    .line 23
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/a;->V:Lcom/tencent/liteav/basic/c/h;

    .line 24
    .line 25
    invoke-virtual {v1, p2, p3}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 26
    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-static {v1, v1, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/a;->V:Lcom/tencent/liteav/basic/c/h;

    .line 33
    .line 34
    invoke-virtual {v2, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 39
    .line 40
    .line 41
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    iget v0, p0, Lcom/tencent/liteav/videoencoder/a;->Q:I

    .line 43
    .line 44
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    iput v0, p0, Lcom/tencent/liteav/videoencoder/a;->Q:I

    .line 47
    .line 48
    iput-wide p4, p0, Lcom/tencent/liteav/videoencoder/a;->D:J

    .line 49
    .line 50
    iput p1, p0, Lcom/tencent/liteav/videoencoder/a;->U:I

    .line 51
    .line 52
    iput p2, p0, Lcom/tencent/liteav/videoencoder/c;->mInputWidth:I

    .line 53
    .line 54
    iput p3, p0, Lcom/tencent/liteav/videoencoder/c;->mInputHeight:I

    .line 55
    .line 56
    iget-boolean p1, p0, Lcom/tencent/liteav/videoencoder/a;->L:Z

    .line 57
    .line 58
    if-eqz p1, :cond_2

    .line 59
    .line 60
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->f()V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget-boolean p1, p0, Lcom/tencent/liteav/videoencoder/a;->M:Z

    .line 64
    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    iget-boolean p1, p0, Lcom/tencent/liteav/videoencoder/a;->X:Z

    .line 68
    .line 69
    if-eqz p1, :cond_4

    .line 70
    .line 71
    :cond_3
    iget p1, p0, Lcom/tencent/liteav/videoencoder/a;->T:I

    .line 72
    .line 73
    add-int/lit8 p1, p1, 0x1

    .line 74
    .line 75
    iput p1, p0, Lcom/tencent/liteav/videoencoder/a;->T:I

    .line 76
    .line 77
    iget-object p1, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 78
    .line 79
    iget-object p2, p0, Lcom/tencent/liteav/videoencoder/a;->t:Ljava/lang/Runnable;

    .line 80
    .line 81
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/basic/util/g;->b(Ljava/lang/Runnable;)V

    .line 82
    .line 83
    .line 84
    iput-boolean v1, p0, Lcom/tencent/liteav/videoencoder/a;->X:Z

    .line 85
    .line 86
    :cond_4
    iget p1, p0, Lcom/tencent/liteav/videoencoder/a;->O:I

    .line 87
    .line 88
    iget p2, p0, Lcom/tencent/liteav/videoencoder/a;->P:I

    .line 89
    .line 90
    add-int/lit8 p2, p2, 0x1e

    .line 91
    .line 92
    if-le p1, p2, :cond_5

    .line 93
    .line 94
    const-string p2, "TXCHWVideoEncoder"

    .line 95
    .line 96
    const-string p3, "hw encoder error when render[%d] pop[%d]"

    .line 97
    .line 98
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iget p4, p0, Lcom/tencent/liteav/videoencoder/a;->P:I

    .line 103
    .line 104
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object p4

    .line 108
    filled-new-array {p1, p4}, [Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-static {p3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-static {p2, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/tencent/liteav/videoencoder/c;->mListener:Lcom/tencent/liteav/videoencoder/d;

    .line 120
    .line 121
    if-eqz p1, :cond_5

    .line 122
    .line 123
    iget p2, p0, Lcom/tencent/liteav/videoencoder/c;->mStreamType:I

    .line 124
    .line 125
    invoke-interface {p1, p2}, Lcom/tencent/liteav/videoencoder/d;->k(I)V

    .line 126
    .line 127
    .line 128
    :cond_5
    iget-wide p1, p0, Lcom/tencent/liteav/videoencoder/a;->R:J

    .line 129
    .line 130
    const-wide/16 p3, 0x1388

    .line 131
    .line 132
    add-long/2addr p1, p3

    .line 133
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 134
    .line 135
    .line 136
    move-result-wide p3

    .line 137
    cmp-long p1, p1, p3

    .line 138
    .line 139
    if-gez p1, :cond_7

    .line 140
    .line 141
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 142
    .line 143
    .line 144
    move-result-wide p1

    .line 145
    iput-wide p1, p0, Lcom/tencent/liteav/videoencoder/a;->R:J

    .line 146
    .line 147
    iget p1, p0, Lcom/tencent/liteav/videoencoder/a;->S:I

    .line 148
    .line 149
    if-eqz p1, :cond_6

    .line 150
    .line 151
    iget p2, p0, Lcom/tencent/liteav/videoencoder/a;->O:I

    .line 152
    .line 153
    if-ne p1, p2, :cond_6

    .line 154
    .line 155
    const-string p1, "TXCHWVideoEncoder"

    .line 156
    .line 157
    const-string p2, "hw encoder error when push[%d] render task[%d] render[%d] pop[%d]"

    .line 158
    .line 159
    iget p3, p0, Lcom/tencent/liteav/videoencoder/a;->Q:I

    .line 160
    .line 161
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object p3

    .line 165
    iget p4, p0, Lcom/tencent/liteav/videoencoder/a;->T:I

    .line 166
    .line 167
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 168
    .line 169
    .line 170
    move-result-object p4

    .line 171
    iget p5, p0, Lcom/tencent/liteav/videoencoder/a;->O:I

    .line 172
    .line 173
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 174
    .line 175
    .line 176
    move-result-object p5

    .line 177
    iget v0, p0, Lcom/tencent/liteav/videoencoder/a;->P:I

    .line 178
    .line 179
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    filled-new-array {p3, p4, p5, v0}, [Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object p3

    .line 187
    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p2

    .line 191
    invoke-static {p1, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Lcom/tencent/liteav/videoencoder/c;->mListener:Lcom/tencent/liteav/videoencoder/d;

    .line 195
    .line 196
    if-eqz p1, :cond_6

    .line 197
    .line 198
    iget p2, p0, Lcom/tencent/liteav/videoencoder/c;->mStreamType:I

    .line 199
    .line 200
    invoke-interface {p1, p2}, Lcom/tencent/liteav/videoencoder/d;->k(I)V

    .line 201
    .line 202
    .line 203
    :cond_6
    iget p1, p0, Lcom/tencent/liteav/videoencoder/a;->O:I

    .line 204
    .line 205
    iput p1, p0, Lcom/tencent/liteav/videoencoder/a;->S:I

    .line 206
    .line 207
    :cond_7
    const-wide/16 p0, 0x0

    .line 208
    .line 209
    return-wide p0

    .line 210
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 211
    throw p0
.end method

.method public pushVideoFrameAsync(IIIJ)J
    .locals 0

    .line 1
    iget-boolean p2, p0, Lcom/tencent/liteav/videoencoder/a;->z:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const-wide/32 p0, 0x989684

    .line 6
    .line 7
    .line 8
    return-wide p0

    .line 9
    :cond_0
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 10
    .line 11
    .line 12
    iget-boolean p2, p0, Lcom/tencent/liteav/videoencoder/a;->L:Z

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->f()V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p2, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/tencent/liteav/basic/util/g;->a()Landroid/os/Handler;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    new-instance p3, Lcom/tencent/liteav/videoencoder/a$8;

    .line 26
    .line 27
    invoke-direct {p3, p0, p1, p4, p5}, Lcom/tencent/liteav/videoencoder/a$8;-><init>(Lcom/tencent/liteav/videoencoder/a;IJ)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 31
    .line 32
    .line 33
    const-wide/16 p0, 0x0

    .line 34
    .line 35
    return-wide p0
.end method

.method public pushVideoFrameSync(IIIJ)J
    .locals 0

    .line 1
    iget-boolean p2, p0, Lcom/tencent/liteav/videoencoder/a;->z:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const-wide/32 p0, 0x989684

    .line 6
    .line 7
    .line 8
    return-wide p0

    .line 9
    :cond_0
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 10
    .line 11
    .line 12
    iput-wide p4, p0, Lcom/tencent/liteav/videoencoder/a;->D:J

    .line 13
    .line 14
    iput p1, p0, Lcom/tencent/liteav/videoencoder/a;->U:I

    .line 15
    .line 16
    iget-boolean p1, p0, Lcom/tencent/liteav/videoencoder/a;->L:Z

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->f()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p1, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a;->u:Ljava/lang/Runnable;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/basic/util/g;->a(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 p0, 0x0

    .line 31
    .line 32
    return-wide p0
.end method

.method public setBitrate(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/tencent/liteav/videoencoder/a;->a:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 4
    .line 5
    new-instance v1, Lcom/tencent/liteav/videoencoder/a$6;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/videoencoder/a$6;-><init>(Lcom/tencent/liteav/videoencoder/a;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/util/g;->b(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setBitrateFromQos(II)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/tencent/liteav/videoencoder/a;->a:I

    .line 2
    .line 3
    iget-object p2, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/liteav/videoencoder/a$7;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/videoencoder/a$7;-><init>(Lcom/tencent/liteav/videoencoder/a;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, v0}, Lcom/tencent/liteav/basic/util/g;->b(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setEncodeIdrFpsFromQos(I)V
    .locals 0

    return-void
.end method

.method public setFPS(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/liteav/videoencoder/a$5;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/videoencoder/a$5;-><init>(Lcom/tencent/liteav/videoencoder/a;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/util/g;->b(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public signalEOSAndFlush()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->z:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 7
    .line 8
    new-instance v1, Lcom/tencent/liteav/videoencoder/a$9;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/tencent/liteav/videoencoder/a$9;-><init>(Lcom/tencent/liteav/videoencoder/a;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/util/g;->a(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public start(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/videoencoder/c;->start(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 5
    .line 6
    new-instance v1, Lcom/tencent/liteav/videoencoder/a$1;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/videoencoder/a$1;-><init>(Lcom/tencent/liteav/videoencoder/a;Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/util/g;->b(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public stop()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tencent/liteav/videoencoder/a;->z:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a;->r:Lcom/tencent/liteav/basic/util/g;

    .line 5
    .line 6
    new-instance v1, Lcom/tencent/liteav/videoencoder/a$4;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/tencent/liteav/videoencoder/a$4;-><init>(Lcom/tencent/liteav/videoencoder/a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/util/g;->b(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/a;->h()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
