.class public Lcom/immomo/moment/mediautils/k;
.super Lcom/immomo/moment/mediautils/e;
.source "SourceFile"


# instance fields
.field private final A:Ljava/lang/String;

.field private B:I

.field private C:I

.field private D:F

.field private E:Ljava/lang/Object;

.field private F:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/ad60;",
            ">;"
        }
    .end annotation
.end field

.field private G:J

.field private H:J

.field private I:J

.field J:I

.field K:I

.field private L:Z

.field private M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

.field private N:[B

.field private O:[B

.field private P:[B

.field private Q:I

.field private R:I

.field private S:[B

.field private T:Lcom/imomo/momo/mediaencoder/EncodeParam;

.field private U:Ll/ad60;

.field private V:Ll/jpw;

.field private W:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/ad60;",
            ">;"
        }
    .end annotation
.end field

.field private X:I

.field private Y:I

.field private o:I

.field private p:I

.field private final q:I

.field private final r:I

.field private final s:I

.field private t:I

.field private u:I

.field private v:J

.field private w:Lcom/imomo/momo/mediaencoder/MediaEncoder;

.field private x:Lcom/immomo/moment/mediautils/h;

.field private y:Landroid/media/MediaFormat;

.field private z:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->o:I

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->p:I

    .line 8
    .line 9
    const/4 v1, 0x7

    .line 10
    iput v1, p0, Lcom/immomo/moment/mediautils/k;->q:I

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    iput v1, p0, Lcom/immomo/moment/mediautils/k;->r:I

    .line 15
    .line 16
    const/4 v1, 0x6

    .line 17
    iput v1, p0, Lcom/immomo/moment/mediautils/k;->s:I

    .line 18
    .line 19
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->t:I

    .line 20
    .line 21
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->u:I

    .line 22
    .line 23
    const-wide/16 v1, 0x0

    .line 24
    .line 25
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/k;->v:J

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->w:Lcom/imomo/momo/mediaencoder/MediaEncoder;

    .line 29
    .line 30
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->x:Lcom/immomo/moment/mediautils/h;

    .line 31
    .line 32
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->y:Landroid/media/MediaFormat;

    .line 33
    .line 34
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->z:I

    .line 35
    .line 36
    const-string v2, "audio/mp4a-latm"

    .line 37
    .line 38
    iput-object v2, p0, Lcom/immomo/moment/mediautils/k;->A:Ljava/lang/String;

    .line 39
    .line 40
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->C:I

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    iput v2, p0, Lcom/immomo/moment/mediautils/k;->D:F

    .line 44
    .line 45
    new-instance v2, Ljava/lang/Object;

    .line 46
    .line 47
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v2, p0, Lcom/immomo/moment/mediautils/k;->E:Ljava/lang/Object;

    .line 51
    .line 52
    new-instance v2, Ljava/util/LinkedList;

    .line 53
    .line 54
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v2, p0, Lcom/immomo/moment/mediautils/k;->F:Ljava/util/LinkedList;

    .line 58
    .line 59
    const-wide/16 v2, -0x1

    .line 60
    .line 61
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/k;->G:J

    .line 62
    .line 63
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/k;->H:J

    .line 64
    .line 65
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/k;->I:J

    .line 66
    .line 67
    const/16 v2, 0x17

    .line 68
    .line 69
    iput v2, p0, Lcom/immomo/moment/mediautils/k;->J:I

    .line 70
    .line 71
    const/4 v2, 0x1

    .line 72
    iput v2, p0, Lcom/immomo/moment/mediautils/k;->K:I

    .line 73
    .line 74
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/k;->L:Z

    .line 75
    .line 76
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 77
    .line 78
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->N:[B

    .line 79
    .line 80
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->O:[B

    .line 81
    .line 82
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->P:[B

    .line 83
    .line 84
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->Q:I

    .line 85
    .line 86
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->R:I

    .line 87
    .line 88
    const v2, 0x384000

    .line 89
    .line 90
    .line 91
    new-array v2, v2, [B

    .line 92
    .line 93
    iput-object v2, p0, Lcom/immomo/moment/mediautils/k;->S:[B

    .line 94
    .line 95
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 96
    .line 97
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->U:Ll/ad60;

    .line 98
    .line 99
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->V:Ll/jpw;

    .line 100
    .line 101
    new-instance v1, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 102
    .line 103
    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 104
    .line 105
    .line 106
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->W:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 107
    .line 108
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->X:I

    .line 109
    .line 110
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->Y:I

    .line 111
    .line 112
    return-void
.end method

.method private A([BJ)I
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->w:Lcom/imomo/momo/mediaencoder/MediaEncoder;

    .line 2
    .line 3
    if-eqz v0, :cond_9

    .line 4
    .line 5
    const-wide/16 v4, 0xc8

    .line 6
    .line 7
    move-object v1, p1

    .line 8
    move-wide v2, p2

    .line 9
    invoke-virtual/range {v0 .. v5}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->queueInBuffer([BJJ)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_9

    .line 14
    .line 15
    iget p1, p0, Lcom/immomo/moment/mediautils/k;->o:I

    .line 16
    .line 17
    const/4 p2, 0x1

    .line 18
    add-int/2addr p1, p2

    .line 19
    iput p1, p0, Lcom/immomo/moment/mediautils/k;->o:I

    .line 20
    .line 21
    new-instance p1, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;

    .line 22
    .line 23
    invoke-direct {p1}, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;-><init>()V

    .line 24
    .line 25
    .line 26
    :cond_0
    :goto_0
    iget-object p3, p0, Lcom/immomo/moment/mediautils/k;->w:Lcom/imomo/momo/mediaencoder/MediaEncoder;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->S:[B

    .line 29
    .line 30
    const-wide/16 v1, 0x32

    .line 31
    .line 32
    invoke-virtual {p3, v0, v1, v2, p1}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->dequeueOutputBuffer([BJLcom/imomo/momo/mediaencoder/EncodedDataInfo;)Z

    .line 33
    .line 34
    .line 35
    move-result p3

    .line 36
    const/4 v0, 0x0

    .line 37
    if-eqz p3, :cond_8

    .line 38
    .line 39
    iget p3, p1, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;->frameType:I

    .line 40
    .line 41
    const/4 v1, 0x7

    .line 42
    const-string v2, "MediaEncoder"

    .line 43
    .line 44
    if-ne p3, v1, :cond_2

    .line 45
    .line 46
    iget-wide v3, p1, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;->dataLength:J

    .line 47
    .line 48
    long-to-int p3, v3

    .line 49
    iput p3, p0, Lcom/immomo/moment/mediautils/k;->Q:I

    .line 50
    .line 51
    if-eqz p3, :cond_1

    .line 52
    .line 53
    new-array v1, p3, [B

    .line 54
    .line 55
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->N:[B

    .line 56
    .line 57
    iget-object v2, p0, Lcom/immomo/moment/mediautils/k;->S:[B

    .line 58
    .line 59
    invoke-static {v2, v0, v1, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    const-string p3, "get sps error"

    .line 64
    .line 65
    invoke-static {v2, p3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    const/16 v1, 0x8

    .line 70
    .line 71
    if-ne p3, v1, :cond_4

    .line 72
    .line 73
    iget-wide v3, p1, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;->dataLength:J

    .line 74
    .line 75
    long-to-int p3, v3

    .line 76
    iput p3, p0, Lcom/immomo/moment/mediautils/k;->R:I

    .line 77
    .line 78
    if-eqz p3, :cond_3

    .line 79
    .line 80
    new-array v1, p3, [B

    .line 81
    .line 82
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->O:[B

    .line 83
    .line 84
    iget-object v2, p0, Lcom/immomo/moment/mediautils/k;->S:[B

    .line 85
    .line 86
    invoke-static {v2, v0, v1, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_3
    const-string p3, "get pps error"

    .line 91
    .line 92
    invoke-static {v2, p3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_4
    const/4 v1, 0x6

    .line 97
    if-ne p3, v1, :cond_5

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_5
    iget p3, p0, Lcom/immomo/moment/mediautils/k;->Q:I

    .line 101
    .line 102
    if-eqz p3, :cond_6

    .line 103
    .line 104
    iget v1, p0, Lcom/immomo/moment/mediautils/k;->R:I

    .line 105
    .line 106
    if-eqz v1, :cond_6

    .line 107
    .line 108
    iget-object v2, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 109
    .line 110
    if-eqz v2, :cond_6

    .line 111
    .line 112
    iget-boolean v2, p0, Lcom/immomo/moment/mediautils/k;->L:Z

    .line 113
    .line 114
    if-nez v2, :cond_6

    .line 115
    .line 116
    add-int v7, p3, v1

    .line 117
    .line 118
    new-array v1, v7, [B

    .line 119
    .line 120
    iput-object v1, p0, Lcom/immomo/moment/mediautils/k;->P:[B

    .line 121
    .line 122
    iget-object v2, p0, Lcom/immomo/moment/mediautils/k;->N:[B

    .line 123
    .line 124
    invoke-static {v2, v0, v1, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 125
    .line 126
    .line 127
    iget-object p3, p0, Lcom/immomo/moment/mediautils/k;->O:[B

    .line 128
    .line 129
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k;->P:[B

    .line 130
    .line 131
    iget v2, p0, Lcom/immomo/moment/mediautils/k;->Q:I

    .line 132
    .line 133
    iget v3, p0, Lcom/immomo/moment/mediautils/k;->R:I

    .line 134
    .line 135
    invoke-static {p3, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 136
    .line 137
    .line 138
    iget-object v3, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 139
    .line 140
    iget v4, p0, Lcom/immomo/moment/mediautils/e;->c:I

    .line 141
    .line 142
    iget v5, p0, Lcom/immomo/moment/mediautils/e;->d:I

    .line 143
    .line 144
    iget-object v6, p0, Lcom/immomo/moment/mediautils/k;->P:[B

    .line 145
    .line 146
    iget-object p3, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 147
    .line 148
    iget v8, p3, Lcom/imomo/momo/mediaencoder/EncodeParam;->frameRate:I

    .line 149
    .line 150
    invoke-virtual/range {v3 .. v8}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->addVideoStream(II[BII)Z

    .line 151
    .line 152
    .line 153
    iget-object p3, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 154
    .line 155
    iget v1, p0, Lcom/immomo/moment/mediautils/e;->j:I

    .line 156
    .line 157
    iget v2, p0, Lcom/immomo/moment/mediautils/e;->k:I

    .line 158
    .line 159
    iget v3, p0, Lcom/immomo/moment/mediautils/e;->l:I

    .line 160
    .line 161
    invoke-virtual {p3, v1, v2, v3}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->addAudioStream(III)Z

    .line 162
    .line 163
    .line 164
    iget-object p3, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 165
    .line 166
    invoke-virtual {p3}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->writeHeader()Z

    .line 167
    .line 168
    .line 169
    iput-boolean p2, p0, Lcom/immomo/moment/mediautils/k;->L:Z

    .line 170
    .line 171
    :cond_6
    iget p3, p0, Lcom/immomo/moment/mediautils/k;->p:I

    .line 172
    .line 173
    add-int/2addr p3, p2

    .line 174
    iput p3, p0, Lcom/immomo/moment/mediautils/k;->p:I

    .line 175
    .line 176
    iget p3, p1, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;->frameType:I

    .line 177
    .line 178
    if-ne p3, p2, :cond_7

    .line 179
    .line 180
    move v8, p2

    .line 181
    goto :goto_1

    .line 182
    :cond_7
    move v8, v0

    .line 183
    :goto_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 184
    .line 185
    if-eqz v1, :cond_0

    .line 186
    .line 187
    iget-boolean p3, p0, Lcom/immomo/moment/mediautils/k;->L:Z

    .line 188
    .line 189
    if-eqz p3, :cond_0

    .line 190
    .line 191
    iget-object v2, p0, Lcom/immomo/moment/mediautils/k;->S:[B

    .line 192
    .line 193
    iget-wide v3, p1, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;->dataLength:J

    .line 194
    .line 195
    long-to-int v3, v3

    .line 196
    iget-wide v4, p1, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;->pts:J

    .line 197
    .line 198
    move-wide v6, v4

    .line 199
    invoke-virtual/range {v1 .. v8}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->writeVideoFrame([BIJJI)Z

    .line 200
    .line 201
    .line 202
    goto/16 :goto_0

    .line 203
    .line 204
    :cond_8
    return v0

    .line 205
    :cond_9
    const/4 p0, -0x1

    .line 206
    return p0
.end method

.method private E(Z)V
    .locals 14

    .line 1
    const-string v1, "MediaEncoder"

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x0

    .line 5
    :try_start_0
    new-instance v0, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v4, p0, Lcom/immomo/moment/mediautils/k;->w:Lcom/imomo/momo/mediaencoder/MediaEncoder;

    .line 11
    .line 12
    if-eqz v4, :cond_3

    .line 13
    .line 14
    invoke-virtual {v4}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->flush()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v4, p0, Lcom/immomo/moment/mediautils/k;->w:Lcom/imomo/momo/mediaencoder/MediaEncoder;

    .line 18
    .line 19
    iget-object v5, p0, Lcom/immomo/moment/mediautils/k;->S:[B

    .line 20
    .line 21
    const-wide/16 v6, 0x32

    .line 22
    .line 23
    invoke-virtual {v4, v5, v6, v7, v0}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->dequeueOutputBuffer([BJLcom/imomo/momo/mediaencoder/EncodedDataInfo;)Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-eqz v4, :cond_2

    .line 28
    .line 29
    iget v4, v0, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;->frameType:I

    .line 30
    .line 31
    const/4 v5, 0x1

    .line 32
    if-ne v4, v5, :cond_1

    .line 33
    .line 34
    move v13, v5

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v13, v2

    .line 37
    :goto_0
    iget v4, p0, Lcom/immomo/moment/mediautils/k;->p:I

    .line 38
    .line 39
    add-int/2addr v4, v5

    .line 40
    iput v4, p0, Lcom/immomo/moment/mediautils/k;->p:I

    .line 41
    .line 42
    iget-object v6, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 43
    .line 44
    if-eqz v6, :cond_2

    .line 45
    .line 46
    iget-boolean v4, p0, Lcom/immomo/moment/mediautils/k;->L:Z

    .line 47
    .line 48
    if-eqz v4, :cond_2

    .line 49
    .line 50
    iget-object v7, p0, Lcom/immomo/moment/mediautils/k;->S:[B

    .line 51
    .line 52
    iget-wide v4, v0, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;->dataLength:J

    .line 53
    .line 54
    long-to-int v8, v4

    .line 55
    iget-wide v9, v0, Lcom/imomo/momo/mediaencoder/EncodedDataInfo;->pts:J

    .line 56
    .line 57
    move-wide v11, v9

    .line 58
    invoke-virtual/range {v6 .. v13}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->writeVideoFrame([BIJJI)Z

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :catch_0
    move-exception v0

    .line 63
    move-object p1, v0

    .line 64
    goto :goto_2

    .line 65
    :cond_2
    :goto_1
    iget v4, p0, Lcom/immomo/moment/mediautils/k;->p:I

    .line 66
    .line 67
    iget v5, p0, Lcom/immomo/moment/mediautils/k;->o:I

    .line 68
    .line 69
    if-ge v4, v5, :cond_3

    .line 70
    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v0, "StopEncoding inputframe = "

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget v0, p0, Lcom/immomo/moment/mediautils/k;->o:I

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string v0, " outputframes = "

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    iget v0, p0, Lcom/immomo/moment/mediautils/k;->p:I

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/immomo/moment/mediautils/k;->w:Lcom/imomo/momo/mediaencoder/MediaEncoder;

    .line 106
    .line 107
    if-eqz p1, :cond_4

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->stopEncoding()V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/immomo/moment/mediautils/k;->w:Lcom/imomo/momo/mediaencoder/MediaEncoder;

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->release()V

    .line 115
    .line 116
    .line 117
    iput-object v3, p0, Lcom/immomo/moment/mediautils/k;->w:Lcom/imomo/momo/mediaencoder/MediaEncoder;

    .line 118
    .line 119
    :cond_4
    iget-object p1, p0, Lcom/immomo/moment/mediautils/k;->x:Lcom/immomo/moment/mediautils/h;

    .line 120
    .line 121
    if-eqz p1, :cond_6

    .line 122
    .line 123
    iget-object p1, p0, Lcom/immomo/moment/mediautils/k;->W:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 124
    .line 125
    invoke-virtual {p1}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-lez p1, :cond_5

    .line 130
    .line 131
    new-instance p1, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    const-string v0, "May be lost audio frame , frame queue have data packet cnt is "

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->W:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 142
    .line 143
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    :cond_5
    iget-object p1, p0, Lcom/immomo/moment/mediautils/k;->x:Lcom/immomo/moment/mediautils/h;

    .line 158
    .line 159
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/h;->C()V

    .line 160
    .line 161
    .line 162
    iput-object v3, p0, Lcom/immomo/moment/mediautils/k;->x:Lcom/immomo/moment/mediautils/h;

    .line 163
    .line 164
    :cond_6
    iget-object p1, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 165
    .line 166
    if-eqz p1, :cond_7

    .line 167
    .line 168
    invoke-virtual {p1}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->writeTrailer()Z

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 172
    .line 173
    invoke-virtual {p1}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->release()V

    .line 174
    .line 175
    .line 176
    iput-object v3, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 177
    .line 178
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/k;->L:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    .line 180
    return-void

    .line 181
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 182
    .line 183
    const-string v4, "StopEncoding failed !!!"

    .line 184
    .line 185
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k;->V:Ll/jpw;

    .line 203
    .line 204
    if-eqz p0, :cond_7

    .line 205
    .line 206
    const/16 p1, -0x192

    .line 207
    .line 208
    invoke-interface {p0, p1, v2, v3}, Ll/jpw;->a(IILjava/lang/String;)V

    .line 209
    .line 210
    .line 211
    :cond_7
    return-void
.end method

.method public static synthetic o(Lcom/immomo/moment/mediautils/k;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/k;->L:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic p(Lcom/immomo/moment/mediautils/k;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/k;->w(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic q(Lcom/immomo/moment/mediautils/k;)Lcom/imomo/momo/mediamuxer/MediaMuxer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r(Lcom/immomo/moment/mediautils/k;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k;->F:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s(Lcom/immomo/moment/mediautils/k;)Lcom/immomo/moment/mediautils/l$d;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic t(Lcom/immomo/moment/mediautils/k;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k;->W:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u(Lcom/immomo/moment/mediautils/k;)Ll/jpw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k;->V:Ll/jpw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v(Lcom/immomo/moment/mediautils/k;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/k;->x(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private w(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->F:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->F:Ljava/util/LinkedList;

    .line 14
    .line 15
    new-instance v1, Ll/ad60;

    .line 16
    .line 17
    invoke-direct {v1, p1, p2}, Ll/ad60;-><init>(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->offerLast(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/immomo/moment/mediautils/k;->F:Ljava/util/LinkedList;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ll/ad60;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    move-object v4, p2

    .line 40
    move-object p2, p1

    .line 41
    move-object p1, v4

    .line 42
    :cond_1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/k;->G:J

    .line 43
    .line 44
    const-wide/16 v2, 0x0

    .line 45
    .line 46
    cmp-long v0, v0, v2

    .line 47
    .line 48
    if-gez v0, :cond_2

    .line 49
    .line 50
    iget-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 51
    .line 52
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/k;->G:J

    .line 53
    .line 54
    :cond_2
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/k;->H:J

    .line 55
    .line 56
    iget-wide v2, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 57
    .line 58
    cmp-long v0, v0, v2

    .line 59
    .line 60
    if-gez v0, :cond_3

    .line 61
    .line 62
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/k;->H:J

    .line 63
    .line 64
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/k;->G:J

    .line 65
    .line 66
    sub-long/2addr v2, v0

    .line 67
    iput-wide v2, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 68
    .line 69
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/k;->I:J

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/k;->I:J

    .line 73
    .line 74
    iput-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 75
    .line 76
    :goto_0
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method

.method private x(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 16
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/immomo/moment/mediautils/k;->E:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget-object v3, v0, Lcom/immomo/moment/mediautils/k;->W:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 9
    .line 10
    invoke-virtual {v3}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    const/4 v4, 0x0

    .line 15
    if-gtz v3, :cond_0

    .line 16
    .line 17
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    return v4

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto/16 :goto_3

    .line 21
    .line 22
    :cond_0
    :try_start_1
    iget v3, v0, Lcom/immomo/moment/mediautils/k;->X:I

    .line 23
    .line 24
    if-nez v3, :cond_1

    .line 25
    .line 26
    iget-object v3, v0, Lcom/immomo/moment/mediautils/k;->W:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Ll/ad60;

    .line 33
    .line 34
    iput-object v3, v0, Lcom/immomo/moment/mediautils/k;->U:Ll/ad60;

    .line 35
    .line 36
    invoke-virtual {v3}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 41
    .line 42
    iput v3, v0, Lcom/immomo/moment/mediautils/k;->X:I

    .line 43
    .line 44
    iput v4, v0, Lcom/immomo/moment/mediautils/k;->Y:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception v0

    .line 48
    goto/16 :goto_1

    .line 49
    .line 50
    :cond_1
    :goto_0
    iget-object v3, v0, Lcom/immomo/moment/mediautils/k;->U:Ll/ad60;

    .line 51
    .line 52
    invoke-virtual {v3}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    iget v5, v0, Lcom/immomo/moment/mediautils/k;->X:I

    .line 57
    .line 58
    if-lez v5, :cond_5

    .line 59
    .line 60
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    iget v6, v0, Lcom/immomo/moment/mediautils/k;->X:I

    .line 68
    .line 69
    const/4 v7, 0x0

    .line 70
    const-wide/16 v8, 0x0

    .line 71
    .line 72
    if-lt v5, v6, :cond_3

    .line 73
    .line 74
    iget-object v5, v0, Lcom/immomo/moment/mediautils/k;->U:Ll/ad60;

    .line 75
    .line 76
    invoke-virtual {v5}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    iget v6, v0, Lcom/immomo/moment/mediautils/k;->Y:I

    .line 85
    .line 86
    iget v10, v0, Lcom/immomo/moment/mediautils/k;->X:I

    .line 87
    .line 88
    invoke-virtual {v1, v5, v6, v10}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    .line 91
    iget v1, v0, Lcom/immomo/moment/mediautils/k;->D:F

    .line 92
    .line 93
    cmpl-float v5, v1, v7

    .line 94
    .line 95
    if-lez v5, :cond_2

    .line 96
    .line 97
    iget v5, v0, Lcom/immomo/moment/mediautils/k;->Y:I

    .line 98
    .line 99
    int-to-long v5, v5

    .line 100
    long-to-float v5, v5

    .line 101
    mul-float/2addr v5, v1

    .line 102
    float-to-long v8, v5

    .line 103
    :cond_2
    iget v11, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 104
    .line 105
    iget v12, v0, Lcom/immomo/moment/mediautils/k;->X:I

    .line 106
    .line 107
    iget-wide v5, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 108
    .line 109
    add-long v13, v5, v8

    .line 110
    .line 111
    iget v15, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 112
    .line 113
    move-object/from16 v10, p2

    .line 114
    .line 115
    invoke-virtual/range {v10 .. v15}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 116
    .line 117
    .line 118
    iput v4, v0, Lcom/immomo/moment/mediautils/k;->X:I

    .line 119
    .line 120
    iget v1, v0, Lcom/immomo/moment/mediautils/k;->Y:I

    .line 121
    .line 122
    iput v1, v0, Lcom/immomo/moment/mediautils/k;->Y:I

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_3
    iget v4, v0, Lcom/immomo/moment/mediautils/k;->D:F

    .line 126
    .line 127
    cmpl-float v5, v4, v7

    .line 128
    .line 129
    if-lez v5, :cond_4

    .line 130
    .line 131
    iget v5, v0, Lcom/immomo/moment/mediautils/k;->Y:I

    .line 132
    .line 133
    int-to-long v5, v5

    .line 134
    long-to-float v5, v5

    .line 135
    mul-float/2addr v5, v4

    .line 136
    float-to-long v8, v5

    .line 137
    :cond_4
    iget-object v4, v0, Lcom/immomo/moment/mediautils/k;->U:Ll/ad60;

    .line 138
    .line 139
    invoke-virtual {v4}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    .line 144
    .line 145
    .line 146
    move-result-object v4

    .line 147
    iget v5, v0, Lcom/immomo/moment/mediautils/k;->Y:I

    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    invoke-virtual {v1, v4, v5, v6}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 154
    .line 155
    .line 156
    iget v4, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 159
    .line 160
    .line 161
    move-result v5

    .line 162
    iget-wide v6, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 163
    .line 164
    add-long/2addr v6, v8

    .line 165
    iget v8, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 166
    .line 167
    move-object/from16 v3, p2

    .line 168
    .line 169
    invoke-virtual/range {v3 .. v8}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 170
    .line 171
    .line 172
    iget v3, v0, Lcom/immomo/moment/mediautils/k;->X:I

    .line 173
    .line 174
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    sub-int/2addr v3, v4

    .line 179
    iput v3, v0, Lcom/immomo/moment/mediautils/k;->X:I

    .line 180
    .line 181
    iget v3, v0, Lcom/immomo/moment/mediautils/k;->Y:I

    .line 182
    .line 183
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    add-int/2addr v3, v1

    .line 188
    iput v3, v0, Lcom/immomo/moment/mediautils/k;->Y:I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :goto_1
    :try_start_2
    const-string v1, "MediaEncoder"

    .line 192
    .line 193
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    :cond_5
    :goto_2
    monitor-exit v2

    .line 201
    const/4 v0, 0x1

    .line 202
    return v0

    .line 203
    :goto_3
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 204
    throw v0
.end method

.method private y()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->y:Landroid/media/MediaFormat;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/media/MediaFormat;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/media/MediaFormat;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/moment/mediautils/k;->y:Landroid/media/MediaFormat;

    .line 11
    .line 12
    const-string v1, "mime"

    .line 13
    .line 14
    const-string v2, "audio/mp4a-latm"

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->y:Landroid/media/MediaFormat;

    .line 20
    .line 21
    const-string v1, "bitrate"

    .line 22
    .line 23
    iget v2, p0, Lcom/immomo/moment/mediautils/e;->l:I

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->y:Landroid/media/MediaFormat;

    .line 29
    .line 30
    const-string v1, "channel-count"

    .line 31
    .line 32
    iget v2, p0, Lcom/immomo/moment/mediautils/e;->k:I

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->y:Landroid/media/MediaFormat;

    .line 38
    .line 39
    const-string v1, "sample-rate"

    .line 40
    .line 41
    iget v2, p0, Lcom/immomo/moment/mediautils/e;->j:I

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->y:Landroid/media/MediaFormat;

    .line 47
    .line 48
    const-string v1, "aac-profile"

    .line 49
    .line 50
    const/4 v2, 0x2

    .line 51
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->y:Landroid/media/MediaFormat;

    .line 55
    .line 56
    const-string v1, "max-input-size"

    .line 57
    .line 58
    iget v2, p0, Lcom/immomo/moment/mediautils/k;->B:I

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 61
    .line 62
    .line 63
    iget v0, p0, Lcom/immomo/moment/mediautils/k;->z:I

    .line 64
    .line 65
    or-int/lit8 v0, v0, 0x1

    .line 66
    .line 67
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->z:I

    .line 68
    .line 69
    iget v0, p0, Lcom/immomo/moment/mediautils/e;->k:I

    .line 70
    .line 71
    mul-int/lit8 v0, v0, 0x10

    .line 72
    .line 73
    div-int/lit8 v0, v0, 0x8

    .line 74
    .line 75
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->C:I

    .line 76
    .line 77
    iget v1, p0, Lcom/immomo/moment/mediautils/e;->j:I

    .line 78
    .line 79
    mul-int/2addr v1, v0

    .line 80
    const v0, 0xf4240

    .line 81
    .line 82
    .line 83
    div-int/2addr v0, v1

    .line 84
    int-to-float v0, v0

    .line 85
    iput v0, p0, Lcom/immomo/moment/mediautils/k;->D:F

    .line 86
    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v1, "mediaAudioBitrate = "

    .line 90
    .line 91
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget v1, p0, Lcom/immomo/moment/mediautils/e;->l:I

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v1, " mediaAudioSampleChannels = "

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget v1, p0, Lcom/immomo/moment/mediautils/e;->k:I

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string v1, " mediaAudioSampleRate = "

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    iget v1, p0, Lcom/immomo/moment/mediautils/e;->j:I

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v1, " maxInputBufsize = "

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget v1, p0, Lcom/immomo/moment/mediautils/k;->B:I

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string v1, " mSampleSize = "

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    iget v1, p0, Lcom/immomo/moment/mediautils/k;->C:I

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v1, " mSampleDuration = "

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget p0, p0, Lcom/immomo/moment/mediautils/k;->D:F

    .line 145
    .line 146
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    const-string v0, "MediaEncoder"

    .line 154
    .line 155
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    :cond_0
    return-void
.end method

.method private z()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/immomo/moment/mediautils/k;->t:I

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/immomo/moment/mediautils/k;->u:I

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/imomo/momo/mediaencoder/EncodeParam;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 19
    .line 20
    iget v1, p0, Lcom/immomo/moment/mediautils/k;->t:I

    .line 21
    .line 22
    iput v1, v0, Lcom/imomo/momo/mediaencoder/EncodeParam;->inputWidth:I

    .line 23
    .line 24
    iget v1, p0, Lcom/immomo/moment/mediautils/k;->u:I

    .line 25
    .line 26
    iput v1, v0, Lcom/imomo/momo/mediaencoder/EncodeParam;->inputHeight:I

    .line 27
    .line 28
    iget v1, p0, Lcom/immomo/moment/mediautils/e;->e:I

    .line 29
    .line 30
    iput v1, v0, Lcom/imomo/momo/mediaencoder/EncodeParam;->frameRate:I

    .line 31
    .line 32
    iget v1, p0, Lcom/immomo/moment/mediautils/e;->f:I

    .line 33
    .line 34
    iput v1, v0, Lcom/imomo/momo/mediaencoder/EncodeParam;->bitsRate:I

    .line 35
    .line 36
    iget v1, p0, Lcom/immomo/moment/mediautils/k;->J:I

    .line 37
    .line 38
    iput v1, v0, Lcom/imomo/momo/mediaencoder/EncodeParam;->rfConstant:I

    .line 39
    .line 40
    iget v1, p0, Lcom/immomo/moment/mediautils/k;->K:I

    .line 41
    .line 42
    iput v1, v0, Lcom/imomo/momo/mediaencoder/EncodeParam;->rcMethod:I

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    iput v1, v0, Lcom/imomo/momo/mediaencoder/EncodeParam;->enableCabac:I

    .line 46
    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v1, "encodeParam.inputWidth = "

    .line 50
    .line 51
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 55
    .line 56
    iget v1, v1, Lcom/imomo/momo/mediaencoder/EncodeParam;->inputWidth:I

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, " encodeParam.inputHeight = "

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 67
    .line 68
    iget v1, v1, Lcom/imomo/momo/mediaencoder/EncodeParam;->inputHeight:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, " encodeParam.frameRate = "

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 79
    .line 80
    iget v1, v1, Lcom/imomo/momo/mediaencoder/EncodeParam;->frameRate:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v1, " encodeParam.bitsRate  = "

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 91
    .line 92
    iget v1, v1, Lcom/imomo/momo/mediaencoder/EncodeParam;->bitsRate:I

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v1, " encodeParam.rfConstant = "

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 103
    .line 104
    iget v1, v1, Lcom/imomo/momo/mediaencoder/EncodeParam;->rfConstant:I

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string v1, " encodeParam.rcMethod = "

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 115
    .line 116
    iget v1, v1, Lcom/imomo/momo/mediaencoder/EncodeParam;->rcMethod:I

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string v1, " encodeParam.enableCabac = "

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 127
    .line 128
    iget p0, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->enableCabac:I

    .line 129
    .line 130
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    const-string v0, "MediaEncoder"

    .line 138
    .line 139
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :cond_0
    return-void
.end method


# virtual methods
.method public B(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/k;->v:J

    .line 2
    .line 3
    return-void
.end method

.method public C(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/k;->J:I

    .line 2
    .line 3
    return-void
.end method

.method public D(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/k;->K:I

    .line 2
    .line 3
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/immomo/moment/mediautils/k;->E(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public b(Ll/ad60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->E:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k;->W:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public c(Ll/ad60;)V
    .locals 4

    .line 1
    :cond_0
    invoke-virtual {p1}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-wide v1, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 14
    .line 15
    invoke-direct {p0, v0, v1, v2}, Lcom/immomo/moment/mediautils/k;->A([BJ)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, -0x1

    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    const-wide/16 v2, 0xa

    .line 23
    .line 24
    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-exception v2

    .line 29
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    if-ne v0, v1, :cond_2

    .line 33
    .line 34
    iget-boolean v2, p0, Lcom/immomo/moment/mediautils/e;->m:Z

    .line 35
    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    :cond_2
    const-string p0, "MediaEncoder"

    .line 39
    .line 40
    if-gez v0, :cond_3

    .line 41
    .line 42
    const-string p1, "Put image to buffer queue error !!"

    .line 43
    .line 44
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_3
    if-ne v0, v1, :cond_4

    .line 49
    .line 50
    const-string p1, "Image queue is full! push failed !"

    .line 51
    .line 52
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_4
    :goto_1
    return-void
.end method

.method public l(IIII)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/immomo/moment/mediautils/e;->l(IIII)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/immomo/moment/mediautils/k;->t:I

    .line 5
    .line 6
    iput p2, p0, Lcom/immomo/moment/mediautils/k;->u:I

    .line 7
    .line 8
    const-wide/16 p1, 0x3e8

    .line 9
    .line 10
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/k;->v:J

    .line 11
    .line 12
    new-instance p1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string p2, "mediaSrcWidth = "

    .line 15
    .line 16
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget p2, p0, Lcom/immomo/moment/mediautils/k;->t:I

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p2, " mediaSrcHeight = "

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget p2, p0, Lcom/immomo/moment/mediautils/k;->u:I

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p2, " mediaDuration = "

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/k;->v:J

    .line 40
    .line 41
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string p0, " fps = "

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string p1, "MediaEncoder"

    .line 57
    .line 58
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public m()Z
    .locals 6

    .line 1
    const-string v0, "soft Encoder muxer init failed !!!"

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/k;->y()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/k;->z()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k;->E:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v1

    .line 12
    :try_start_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    new-instance v2, Lcom/imomo/momo/mediaencoder/MediaEncoder;

    .line 18
    .line 19
    invoke-direct {v2}, Lcom/imomo/momo/mediaencoder/MediaEncoder;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Lcom/immomo/moment/mediautils/k;->w:Lcom/imomo/momo/mediaencoder/MediaEncoder;

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->initEncoder(I)I

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 28
    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    iget v2, p0, Lcom/immomo/moment/mediautils/k;->z:I

    .line 32
    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    iget-object v2, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    :try_start_1
    new-instance v2, Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 40
    .line 41
    invoke-direct {v2}, Lcom/imomo/momo/mediamuxer/MediaMuxer;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v2, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->initMuxer(I)Z

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 50
    .line 51
    iget-object v4, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v2, v4}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->setFileName(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_1

    .line 59
    :catch_0
    move-exception v2

    .line 60
    const/4 v4, 0x0

    .line 61
    :try_start_2
    iput-object v4, p0, Lcom/immomo/moment/mediautils/k;->M:Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 62
    .line 63
    const-string v4, "MediaEncoder"

    .line 64
    .line 65
    new-instance v5, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v4, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :goto_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->w:Lcom/imomo/momo/mediaencoder/MediaEncoder;

    .line 85
    .line 86
    iget-object v2, p0, Lcom/immomo/moment/mediautils/k;->T:Lcom/imomo/momo/mediaencoder/EncodeParam;

    .line 87
    .line 88
    invoke-virtual {v0, v2}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->setParam(Lcom/imomo/momo/mediaencoder/EncodeParam;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_0

    .line 93
    .line 94
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->w:Lcom/imomo/momo/mediaencoder/MediaEncoder;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->startEncoding()V

    .line 97
    .line 98
    .line 99
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->y:Landroid/media/MediaFormat;

    .line 100
    .line 101
    if-eqz v0, :cond_2

    .line 102
    .line 103
    new-instance v0, Lcom/immomo/moment/mediautils/h;

    .line 104
    .line 105
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/h;-><init>()V

    .line 106
    .line 107
    .line 108
    iput-object v0, p0, Lcom/immomo/moment/mediautils/k;->x:Lcom/immomo/moment/mediautils/h;

    .line 109
    .line 110
    iget-object v2, p0, Lcom/immomo/moment/mediautils/k;->y:Landroid/media/MediaFormat;

    .line 111
    .line 112
    const/4 v4, 0x0

    .line 113
    invoke-virtual {v0, v2, v4}, Lcom/immomo/moment/mediautils/h;->u(Landroid/media/MediaFormat;I)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_1

    .line 118
    .line 119
    const-string p0, "MediaEncoder"

    .line 120
    .line 121
    const-string v0, "Create audio mediacodec erorr !"

    .line 122
    .line 123
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    monitor-exit v1

    .line 127
    return v4

    .line 128
    :cond_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k;->x:Lcom/immomo/moment/mediautils/h;

    .line 129
    .line 130
    new-instance v2, Lcom/immomo/moment/mediautils/k$a;

    .line 131
    .line 132
    invoke-direct {v2, p0}, Lcom/immomo/moment/mediautils/k$a;-><init>(Lcom/immomo/moment/mediautils/k;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v2}, Lcom/immomo/moment/mediautils/h;->I(Lcom/immomo/moment/mediautils/h$b;)V

    .line 136
    .line 137
    .line 138
    iput v4, p0, Lcom/immomo/moment/mediautils/k;->X:I

    .line 139
    .line 140
    iput v4, p0, Lcom/immomo/moment/mediautils/k;->Y:I

    .line 141
    .line 142
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k;->x:Lcom/immomo/moment/mediautils/h;

    .line 143
    .line 144
    invoke-virtual {p0, v3}, Lcom/immomo/moment/mediautils/h;->L(Z)V

    .line 145
    .line 146
    .line 147
    :cond_2
    monitor-exit v1

    .line 148
    return v3

    .line 149
    :goto_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 150
    throw p0
.end method

.method public n()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/immomo/moment/mediautils/k;->E(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
