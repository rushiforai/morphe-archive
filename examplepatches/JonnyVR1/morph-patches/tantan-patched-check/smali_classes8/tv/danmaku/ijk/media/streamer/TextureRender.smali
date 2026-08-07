.class Ltv/danmaku/ijk/media/streamer/TextureRender;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private A:Landroid/graphics/SurfaceTexture;

.field private B:I

.field private C:I

.field private D:Landroid/graphics/Bitmap;

.field private final E:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final F:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private G:I

.field private H:I

.field private I:Z

.field private J:I

.field private K:I

.field private L:I

.field private M:I

.field private N:I

.field private O:I

.field private P:I

.field private Q:I

.field private R:I

.field private S:Z

.field private T:I

.field public a:Ljava/nio/ByteBuffer;

.field public b:Ljava/nio/ByteBuffer;

.field c:Ll/pej;

.field d:Ll/gb20;

.field e:Ll/qnw;

.field f:Ll/qmq0;

.field g:Lproject/android/imageprocessing/ext/a;

.field h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

.field i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

.field j:Ll/qmq0$a;

.field private k:I

.field private l:Landroid/graphics/SurfaceTexture;

.field private m:Ll/jt2;

.field private n:Ll/zej;

.field private o:Ll/zej;

.field private p:Ll/zej;

.field private q:Lproject/android/imageprocessing/ext/a;

.field private r:Lcom/immomo/mediacore/strinf/VideoQuality;

.field private s:I

.field private t:I

.field private u:I

.field private v:I

.field private w:Z

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(Ll/jt2;Lcom/immomo/mediacore/strinf/VideoQuality;I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, -0x3039

    .line 5
    .line 6
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->k:I

    .line 7
    .line 8
    const/16 v0, 0x160

    .line 9
    .line 10
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 11
    .line 12
    const/16 v0, 0x280

    .line 13
    .line 14
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 15
    .line 16
    const/16 v1, 0x1e0

    .line 17
    .line 18
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->u:I

    .line 19
    .line 20
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->v:I

    .line 21
    .line 22
    const/4 v0, -0x1

    .line 23
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->y:I

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->z:I

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->A:Landroid/graphics/SurfaceTexture;

    .line 30
    .line 31
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->B:I

    .line 32
    .line 33
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->C:I

    .line 34
    .line 35
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->D:Landroid/graphics/Bitmap;

    .line 36
    .line 37
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->G:I

    .line 38
    .line 39
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->H:I

    .line 40
    .line 41
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->I:Z

    .line 42
    .line 43
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->J:I

    .line 44
    .line 45
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->K:I

    .line 46
    .line 47
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->L:I

    .line 48
    .line 49
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->M:I

    .line 50
    .line 51
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->N:I

    .line 52
    .line 53
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->O:I

    .line 54
    .line 55
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->P:I

    .line 56
    .line 57
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->Q:I

    .line 58
    .line 59
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->R:I

    .line 60
    .line 61
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->S:Z

    .line 62
    .line 63
    const/4 v0, 0x1

    .line 64
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->T:I

    .line 65
    .line 66
    iput p3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 67
    .line 68
    if-eqz p2, :cond_0

    .line 69
    .line 70
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->r:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 71
    .line 72
    iget p3, p2, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 73
    .line 74
    iput p3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 75
    .line 76
    iget p2, p2, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 77
    .line 78
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 79
    .line 80
    :cond_0
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->w:Z

    .line 81
    .line 82
    new-instance p2, Ljava/util/LinkedList;

    .line 83
    .line 84
    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->E:Ljava/util/Queue;

    .line 88
    .line 89
    new-instance p2, Ljava/util/LinkedList;

    .line 90
    .line 91
    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->F:Ljava/util/Queue;

    .line 95
    .line 96
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/TextureRender;->x(Ll/jt2;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method private S(III)V
    .locals 12

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    if-ne p3, v2, :cond_1

    .line 8
    .line 9
    if-le p1, p2, :cond_0

    .line 10
    .line 11
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 12
    .line 13
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 17
    .line 18
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    if-ne p3, v1, :cond_4

    .line 22
    .line 23
    if-le p2, p1, :cond_2

    .line 24
    .line 25
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 26
    .line 27
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 31
    .line 32
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_3
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 36
    .line 37
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 38
    .line 39
    :cond_4
    :goto_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 40
    .line 41
    invoke-virtual {p1, p3}, Lproject/android/imageprocessing/ext/a;->W1(I)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 45
    .line 46
    iget p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 47
    .line 48
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 49
    .line 50
    invoke-virtual {p1, p2, v0}, Ll/wej;->setRenderSize(II)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 54
    .line 55
    const/4 p2, 0x3

    .line 56
    const/4 v0, -0x1

    .line 57
    const/4 v3, 0x0

    .line 58
    if-eqz p1, :cond_9

    .line 59
    .line 60
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->T:I

    .line 61
    .line 62
    if-ne v4, v2, :cond_5

    .line 63
    .line 64
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->O:I

    .line 65
    .line 66
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->P:I

    .line 67
    .line 68
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 69
    .line 70
    iput v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->Q:I

    .line 71
    .line 72
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 73
    .line 74
    iput v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->R:I

    .line 75
    .line 76
    move v11, v3

    .line 77
    goto :goto_1

    .line 78
    :cond_5
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->O:I

    .line 79
    .line 80
    if-eq v5, v0, :cond_6

    .line 81
    .line 82
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->P:I

    .line 83
    .line 84
    if-eq v5, v0, :cond_6

    .line 85
    .line 86
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->Q:I

    .line 87
    .line 88
    if-ltz v5, :cond_6

    .line 89
    .line 90
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->R:I

    .line 91
    .line 92
    if-gez v5, :cond_7

    .line 93
    .line 94
    :cond_6
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->O:I

    .line 95
    .line 96
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->P:I

    .line 97
    .line 98
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 99
    .line 100
    iput v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->Q:I

    .line 101
    .line 102
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 103
    .line 104
    iput v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->R:I

    .line 105
    .line 106
    :cond_7
    move v11, v2

    .line 107
    :goto_1
    if-ne v4, v1, :cond_8

    .line 108
    .line 109
    move v4, v2

    .line 110
    goto :goto_2

    .line 111
    :cond_8
    move v4, v3

    .line 112
    :goto_2
    invoke-virtual {p1, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v2(Z)V

    .line 113
    .line 114
    .line 115
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 116
    .line 117
    iget v7, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->O:I

    .line 118
    .line 119
    iget v8, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->P:I

    .line 120
    .line 121
    iget v9, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->Q:I

    .line 122
    .line 123
    iget v10, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->R:I

    .line 124
    .line 125
    invoke-virtual/range {v6 .. v11}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->x2(IIIII)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 129
    .line 130
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 131
    .line 132
    invoke-virtual {p1, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->w2(I)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 136
    .line 137
    invoke-virtual {p1, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->u2(I)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 141
    .line 142
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 143
    .line 144
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 145
    .line 146
    invoke-virtual {p1, v4, v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->setRenderSize(II)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 150
    .line 151
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 152
    .line 153
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 154
    .line 155
    invoke-virtual {p1, v4, v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->z2(II)V

    .line 156
    .line 157
    .line 158
    iget p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 159
    .line 160
    if-ne p1, v2, :cond_9

    .line 161
    .line 162
    if-ne p3, p2, :cond_9

    .line 163
    .line 164
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 165
    .line 166
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->y:I

    .line 167
    .line 168
    invoke-virtual {p1, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->A2(I)V

    .line 169
    .line 170
    .line 171
    :cond_9
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 172
    .line 173
    if-eqz p1, :cond_f

    .line 174
    .line 175
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->T:I

    .line 176
    .line 177
    if-ne v4, v2, :cond_a

    .line 178
    .line 179
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->O:I

    .line 180
    .line 181
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->P:I

    .line 182
    .line 183
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 184
    .line 185
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->Q:I

    .line 186
    .line 187
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 188
    .line 189
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->R:I

    .line 190
    .line 191
    invoke-virtual {p1, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->u2(Z)V

    .line 192
    .line 193
    .line 194
    goto :goto_3

    .line 195
    :cond_a
    if-ne v4, v1, :cond_d

    .line 196
    .line 197
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->O:I

    .line 198
    .line 199
    if-eq v1, v0, :cond_b

    .line 200
    .line 201
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->P:I

    .line 202
    .line 203
    if-eq v1, v0, :cond_b

    .line 204
    .line 205
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->Q:I

    .line 206
    .line 207
    if-lez v1, :cond_b

    .line 208
    .line 209
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->R:I

    .line 210
    .line 211
    if-gtz v1, :cond_c

    .line 212
    .line 213
    :cond_b
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->O:I

    .line 214
    .line 215
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->P:I

    .line 216
    .line 217
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 218
    .line 219
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->Q:I

    .line 220
    .line 221
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 222
    .line 223
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->R:I

    .line 224
    .line 225
    :cond_c
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->u2(Z)V

    .line 226
    .line 227
    .line 228
    goto :goto_3

    .line 229
    :cond_d
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->O:I

    .line 230
    .line 231
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->P:I

    .line 232
    .line 233
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 234
    .line 235
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->Q:I

    .line 236
    .line 237
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 238
    .line 239
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->R:I

    .line 240
    .line 241
    invoke-virtual {p1, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->u2(Z)V

    .line 242
    .line 243
    .line 244
    :goto_3
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 245
    .line 246
    iget v7, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->O:I

    .line 247
    .line 248
    iget v8, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->P:I

    .line 249
    .line 250
    iget v9, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->Q:I

    .line 251
    .line 252
    iget v10, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->R:I

    .line 253
    .line 254
    const/4 v11, 0x0

    .line 255
    const-wide/16 v5, 0x0

    .line 256
    .line 257
    invoke-virtual/range {v4 .. v11}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y2(JIIIII)V

    .line 258
    .line 259
    .line 260
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 261
    .line 262
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 263
    .line 264
    invoke-virtual {p1, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r2(I)V

    .line 265
    .line 266
    .line 267
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 268
    .line 269
    invoke-virtual {p1, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->s2(I)V

    .line 270
    .line 271
    .line 272
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 273
    .line 274
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 275
    .line 276
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 277
    .line 278
    invoke-virtual {p1, v1, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->setRenderSize(II)V

    .line 279
    .line 280
    .line 281
    iget p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 282
    .line 283
    if-ne p1, v2, :cond_f

    .line 284
    .line 285
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 286
    .line 287
    if-ne p3, p2, :cond_e

    .line 288
    .line 289
    iget p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->y:I

    .line 290
    .line 291
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t2(I)V

    .line 292
    .line 293
    .line 294
    goto :goto_4

    .line 295
    :cond_e
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t2(I)V

    .line 296
    .line 297
    .line 298
    :cond_f
    :goto_4
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->n:Ll/zej;

    .line 299
    .line 300
    if-eqz p1, :cond_10

    .line 301
    .line 302
    iget p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 303
    .line 304
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 305
    .line 306
    invoke-virtual {p1, p2, p0}, Ll/zej;->setRenderSize(II)V

    .line 307
    .line 308
    .line 309
    :cond_10
    return-void
.end method

.method public static synthetic a(Ltv/danmaku/ijk/media/streamer/TextureRender;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ltv/danmaku/ijk/media/streamer/TextureRender;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Ltv/danmaku/ijk/media/streamer/TextureRender;)Ll/zej;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->o:Ll/zej;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ltv/danmaku/ijk/media/streamer/TextureRender;Ll/zej;)Ll/zej;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->o:Ll/zej;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic e(Ltv/danmaku/ijk/media/streamer/TextureRender;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ltv/danmaku/ijk/media/streamer/TextureRender;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Ltv/danmaku/ijk/media/streamer/TextureRender;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->u:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic h(Ltv/danmaku/ijk/media/streamer/TextureRender;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->v:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic i(Ltv/danmaku/ijk/media/streamer/TextureRender;III)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/TextureRender;->S(III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private w()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->w:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 7
    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 11
    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 15
    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 19
    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 27
    .line 28
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 39
    .line 40
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 53
    .line 54
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->n:Ll/zej;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 71
    .line 72
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->n:Ll/zej;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 75
    .line 76
    .line 77
    :goto_0
    const/4 v0, 0x1

    .line 78
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->w:Z

    .line 79
    .line 80
    :cond_3
    :goto_1
    return-void
.end method

.method private x(Ll/jt2;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 2
    .line 3
    new-instance p1, Ll/gb20;

    .line 4
    .line 5
    invoke-direct {p1}, Ll/gb20;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 9
    .line 10
    new-instance p1, Ll/qnw;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/qnw;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 16
    .line 17
    new-instance p1, Ll/pej;

    .line 18
    .line 19
    invoke-direct {p1}, Ll/pej;-><init>()V

    .line 20
    .line 21
    .line 22
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 23
    .line 24
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 25
    .line 26
    invoke-virtual {p1, v0, v1}, Ll/pej;->c(II)V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 34
    .line 35
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 42
    .line 43
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    new-instance v0, Ll/zej;

    .line 49
    .line 50
    invoke-direct {v0}, Ll/zej;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->n:Ll/zej;

    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 57
    .line 58
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 59
    .line 60
    invoke-direct {v0, p1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;-><init>(Ll/pej;)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 64
    .line 65
    new-instance v0, Lproject/android/imageprocessing/ext/a;

    .line 66
    .line 67
    invoke-direct {v0}, Lproject/android/imageprocessing/ext/a;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 71
    .line 72
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 73
    .line 74
    if-nez v0, :cond_1

    .line 75
    .line 76
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Ll/pej;->b(Ll/wej;)V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ll/pej;->b(Ll/wej;)V

    .line 85
    .line 86
    .line 87
    :goto_1
    invoke-virtual {p1}, Ll/pej;->k()V

    .line 88
    .line 89
    .line 90
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 91
    .line 92
    return-void
.end method

.method private z(Ljava/util/Queue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .line 1
    monitor-enter p1

    .line 2
    :goto_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    monitor-exit p1

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method


# virtual methods
.method public A(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->E:Ljava/util/Queue;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->E:Ljava/util/Queue;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 7
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

.method public B(Ll/jt2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 13
    .line 14
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 21
    .line 22
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 28
    .line 29
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/pej;->a(Ll/wej;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 35
    .line 36
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 37
    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 49
    .line 50
    .line 51
    :goto_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 52
    .line 53
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public C(I)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "switch input capture:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "--->"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "TextureRender"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 31
    .line 32
    if-eq p1, v0, :cond_2

    .line 33
    .line 34
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/pej;->i()V

    .line 37
    .line 38
    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 42
    .line 43
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 49
    .line 50
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ll/pej;->j(Ll/wej;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 56
    .line 57
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 63
    .line 64
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 65
    .line 66
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 67
    .line 68
    invoke-virtual {v0, v2, v3}, Ll/pej;->c(II)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 72
    .line 73
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Ll/pej;->b(Ll/wej;)V

    .line 76
    .line 77
    .line 78
    const-string v0, "camera###"

    .line 79
    .line 80
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 85
    .line 86
    const/4 v2, 0x1

    .line 87
    if-ne p1, v2, :cond_1

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Ll/qnw;->setOESMode(Z)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    const/4 v2, 0x0

    .line 94
    invoke-virtual {v0, v2}, Ll/qnw;->setOESMode(Z)V

    .line 95
    .line 96
    .line 97
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 98
    .line 99
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 105
    .line 106
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 107
    .line 108
    invoke-virtual {v0, v2}, Ll/pej;->j(Ll/wej;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 112
    .line 113
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 114
    .line 115
    invoke-virtual {v0, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 119
    .line 120
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 121
    .line 122
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 123
    .line 124
    invoke-virtual {v0, v2, v3}, Ll/pej;->c(II)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 128
    .line 129
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Ll/pej;->b(Ll/wej;)V

    .line 132
    .line 133
    .line 134
    const-string v0, "texture###"

    .line 135
    .line 136
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/pej;->k()V

    .line 142
    .line 143
    .line 144
    :cond_2
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 145
    .line 146
    return-void
.end method

.method public D(Ll/qmq0$a;)V
    .locals 1

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/streamer/TextureRender$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ltv/danmaku/ijk/media/streamer/TextureRender$1;-><init>(Ltv/danmaku/ijk/media/streamer/TextureRender;Ll/qmq0$a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->A(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public E(I)V
    .locals 2

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->y:I

    .line 7
    .line 8
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->A2(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public F(Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->n:Ll/zej;

    .line 10
    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    :cond_1
    return-void

    .line 14
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->E:Ljava/util/Queue;

    .line 15
    .line 16
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->z(Ljava/util/Queue;)V

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_4

    .line 20
    .line 21
    iget v0, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 22
    .line 23
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 24
    .line 25
    if-ne v0, v1, :cond_3

    .line 26
    .line 27
    iget v2, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 28
    .line 29
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 30
    .line 31
    if-ne v2, v3, :cond_3

    .line 32
    .line 33
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->n:Ll/zej;

    .line 34
    .line 35
    invoke-virtual {p0, v1, v3}, Ll/zej;->setRenderSize(II)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_3
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->n:Ll/zej;

    .line 40
    .line 41
    iget p1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 42
    .line 43
    invoke-virtual {p0, v0, p1}, Ll/zej;->setRenderSize(II)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_4
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->n:Ll/zej;

    .line 48
    .line 49
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 50
    .line 51
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 52
    .line 53
    invoke-virtual {p1, v0, p0}, Ll/zej;->setRenderSize(II)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public G(JLtv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->v2(JLtv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->j2(JLtv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public H(JZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->w2(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->E2(JZ)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public I(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x2(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public J(JIIIII)V
    .locals 13

    .line 1
    move/from16 v3, p3

    .line 2
    .line 3
    move/from16 v4, p4

    .line 4
    .line 5
    move/from16 v5, p5

    .line 6
    .line 7
    move/from16 v6, p6

    .line 8
    .line 9
    const-wide/16 v7, 0x0

    .line 10
    .line 11
    cmp-long v7, p1, v7

    .line 12
    .line 13
    if-nez v7, :cond_1

    .line 14
    .line 15
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->O:I

    .line 16
    .line 17
    iput v4, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->P:I

    .line 18
    .line 19
    iput v5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->Q:I

    .line 20
    .line 21
    iput v6, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->R:I

    .line 22
    .line 23
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 24
    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    const/4 v7, 0x1

    .line 28
    iput-boolean v7, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->S:Z

    .line 29
    .line 30
    const/4 v8, 0x1

    .line 31
    move v7, v6

    .line 32
    move v6, v5

    .line 33
    move v5, v4

    .line 34
    move/from16 v4, p3

    .line 35
    .line 36
    invoke-virtual/range {v3 .. v8}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->x2(IIIII)V

    .line 37
    .line 38
    .line 39
    move v9, v4

    .line 40
    move v10, v5

    .line 41
    move v11, v6

    .line 42
    move v12, v7

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move/from16 v9, p3

    .line 45
    .line 46
    move v10, v4

    .line 47
    move v11, v5

    .line 48
    move v12, v6

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    move v9, v3

    .line 51
    move v10, v4

    .line 52
    move v11, v5

    .line 53
    move v12, v6

    .line 54
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 55
    .line 56
    if-eqz v3, :cond_2

    .line 57
    .line 58
    new-instance v3, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v4, "@@@ (mergeFilterManager)setSubVideoPos: id["

    .line 61
    .line 62
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v4, "], view["

    .line 69
    .line 70
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v4, ","

    .line 77
    .line 78
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    const-string v4, "TextureRender"

    .line 101
    .line 102
    invoke-static {v4, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 106
    .line 107
    int-to-float v4, v9

    .line 108
    int-to-float v5, v10

    .line 109
    int-to-float v6, v11

    .line 110
    int-to-float v7, v12

    .line 111
    move-wide v2, p1

    .line 112
    move/from16 v8, p7

    .line 113
    .line 114
    invoke-virtual/range {v1 .. v8}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->B2(JFFFFI)V

    .line 115
    .line 116
    .line 117
    :cond_2
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 118
    .line 119
    if-eqz v0, :cond_3

    .line 120
    .line 121
    move-wide v1, p1

    .line 122
    move/from16 v7, p7

    .line 123
    .line 124
    move v3, v9

    .line 125
    move v4, v10

    .line 126
    move v5, v11

    .line 127
    move v6, v12

    .line 128
    invoke-virtual/range {v0 .. v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y2(JIIIII)V

    .line 129
    .line 130
    .line 131
    :cond_3
    return-void
.end method

.method public K(JIIII)V
    .locals 7

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    move-wide v1, p1

    .line 4
    move v3, p3

    .line 5
    move v4, p4

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move v5, p5

    .line 9
    move v6, p6

    .line 10
    invoke-virtual/range {v0 .. v6}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z2(JIIII)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, v1, v2, v3, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->C2(JII)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public L(I)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "@@@ S merge(setViewShowMode):"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ";"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->T:I

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v2, "TextureRender"

    .line 26
    .line 27
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->T:I

    .line 31
    .line 32
    if-ne p1, v0, :cond_0

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->T:I

    .line 36
    .line 37
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 38
    .line 39
    const/4 v3, 0x2

    .line 40
    if-ne p1, v3, :cond_2

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->u2(Z)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    invoke-virtual {v0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v2(Z)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    const/4 v3, 0x0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    invoke-virtual {v0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->u2(Z)V

    .line 60
    .line 61
    .line 62
    :cond_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    invoke-virtual {v0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v2(Z)V

    .line 67
    .line 68
    .line 69
    :cond_4
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v3, "@@@ merge(setViewShowMode):"

    .line 72
    .line 73
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->T:I

    .line 83
    .line 84
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {v2, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public M(JZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->A2(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r2(J)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public N()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->o()Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->l:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    return-void
.end method

.method public O(IIZIIIII)V
    .locals 3

    .line 1
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->E:Ljava/util/Queue;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->E:Ljava/util/Queue;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 7
    .line 8
    .line 9
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->G:I

    .line 11
    .line 12
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->H:I

    .line 13
    .line 14
    iput-boolean p3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->I:Z

    .line 15
    .line 16
    iput p4, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->J:I

    .line 17
    .line 18
    iput p6, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->K:I

    .line 19
    .line 20
    iput p5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->L:I

    .line 21
    .line 22
    iput p7, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->M:I

    .line 23
    .line 24
    iput p8, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->N:I

    .line 25
    .line 26
    move p6, p4

    .line 27
    move p4, p7

    .line 28
    move p7, p3

    .line 29
    move p3, p2

    .line 30
    move p2, p1

    .line 31
    move-object p1, p0

    .line 32
    new-instance p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;

    .line 33
    .line 34
    move v2, p8

    .line 35
    move p8, p5

    .line 36
    move p5, v2

    .line 37
    invoke-direct/range {p0 .. p8}, Ltv/danmaku/ijk/media/streamer/TextureRender$2;-><init>(Ltv/danmaku/ijk/media/streamer/TextureRender;IIIIIZI)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->A(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    move-object p0, v0

    .line 46
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    throw p0
.end method

.method public P(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->b:Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    return-void
.end method

.method public Q(Landroid/graphics/Bitmap;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->D:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    const-string v1, "TextureRender"

    .line 4
    .line 5
    if-eq p1, v0, :cond_3

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "----updatePipLineBitmap: free Bitmap<>"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->D:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->D:Landroid/graphics/Bitmap;

    .line 27
    .line 28
    :cond_0
    if-eqz p1, :cond_2

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->D:Landroid/graphics/Bitmap;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->D:Landroid/graphics/Bitmap;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->B:I

    .line 49
    .line 50
    if-ne v2, p1, :cond_1

    .line 51
    .line 52
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->C:I

    .line 53
    .line 54
    if-eq v2, v0, :cond_2

    .line 55
    .line 56
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v3, "----updatePipLineBitmap: ["

    .line 59
    .line 60
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->B:I

    .line 64
    .line 65
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v3, ","

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->C:I

    .line 74
    .line 75
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v4, "]--->["

    .line 79
    .line 80
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v3, "]"

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->B:I

    .line 105
    .line 106
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->C:I

    .line 107
    .line 108
    :cond_2
    return-void

    .line 109
    :cond_3
    const-string p0, "----updatePipLineBitmap: bitmap same, bitmap not drawed"

    .line 110
    .line 111
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public R(Landroid/graphics/SurfaceTexture;I)V
    .locals 0

    .line 1
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->z:I

    .line 2
    .line 3
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->A:Landroid/graphics/SurfaceTexture;

    .line 4
    .line 5
    return-void
.end method

.method public T(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    move-wide v1, p1

    .line 4
    move-object v3, p3

    .line 5
    move v4, p4

    .line 6
    move-object v5, p5

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual/range {v0 .. v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->C2(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 13
    .line 14
    if-eqz p0, :cond_2

    .line 15
    .line 16
    if-eqz v5, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, v1, v2, v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->G2(JLandroid/graphics/Bitmap;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-virtual {p0, v1, v2, v4, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->F2(JILandroid/graphics/SurfaceTexture;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    return-void
.end method

.method public j(Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/zej;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/zej;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->p:Ll/zej;

    .line 9
    .line 10
    iget v1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 11
    .line 12
    iget v2, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Ll/zej;->setRenderSize(II)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Lproject/android/imageprocessing/ext/a;

    .line 18
    .line 19
    invoke-direct {v0}, Lproject/android/imageprocessing/ext/a;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->q:Lproject/android/imageprocessing/ext/a;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->q:Lproject/android/imageprocessing/ext/a;

    .line 28
    .line 29
    iget v1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 30
    .line 31
    iget p1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 32
    .line 33
    invoke-virtual {v0, v1, p1}, Ll/wej;->setRenderSize(II)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 37
    .line 38
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->q:Lproject/android/imageprocessing/ext/a;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 44
    .line 45
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->q:Lproject/android/imageprocessing/ext/a;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->q:Lproject/android/imageprocessing/ext/a;

    .line 52
    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->q:Lproject/android/imageprocessing/ext/a;

    .line 61
    .line 62
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->p:Ll/zej;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 68
    .line 69
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->q:Lproject/android/imageprocessing/ext/a;

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ll/pej;->a(Ll/wej;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    const/4 p1, 0x0

    .line 75
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->q:Lproject/android/imageprocessing/ext/a;

    .line 76
    .line 77
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->p:Ll/zej;

    .line 78
    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Ll/pej;->a(Ll/wej;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->p:Ll/zej;

    .line 87
    .line 88
    return-void
.end method

.method public k(Ll/jt2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/pej;->a(Ll/wej;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public l(JII)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "@@@ addSubView:ID["

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "];"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ";"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "TextureRender"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 41
    .line 42
    invoke-virtual {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->h2(JII)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public m(Ljava/lang/String;)V
    .locals 2

    .line 1
    :goto_0
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ": glError "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "TextureRender"

    .line 28
    .line 29
    invoke-static {v0, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public n(FFFFZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e2(FFFFZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public o()Landroid/graphics/SurfaceTexture;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 6
    .line 7
    .line 8
    aget v0, v1, v2

    .line 9
    .line 10
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->k:I

    .line 11
    .line 12
    const v1, 0x8d65

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 16
    .line 17
    .line 18
    const-string v0, "glBindTexture mTextureID"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->m(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0xde1

    .line 24
    .line 25
    const/16 v1, 0x2801

    .line 26
    .line 27
    const v2, 0x46180400    # 9729.0f

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 31
    .line 32
    .line 33
    const/16 v1, 0x2800

    .line 34
    .line 35
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 36
    .line 37
    .line 38
    const/16 v1, 0x2802

    .line 39
    .line 40
    const v2, 0x812f

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 44
    .line 45
    .line 46
    const/16 v1, 0x2803

    .line 47
    .line 48
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 49
    .line 50
    .line 51
    const-string v0, "glTexParameter"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->m(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 57
    .line 58
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->k:I

    .line 59
    .line 60
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->l:Landroid/graphics/SurfaceTexture;

    .line 64
    .line 65
    return-object v0
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->E:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->z(Ljava/util/Queue;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->q:Lproject/android/imageprocessing/ext/a;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->p:Ll/zej;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->q:Lproject/android/imageprocessing/ext/a;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/wej;->onDrawFrame()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->q:Lproject/android/imageprocessing/ext/a;

    .line 21
    .line 22
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->p:Ll/zej;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->E:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->z(Ljava/util/Queue;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->o:Ll/zej;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "----drawCodecFrame:"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, ","

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "TextureRender"

    .line 37
    .line 38
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/zej;

    .line 42
    .line 43
    invoke-direct {v0}, Ll/zej;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->o:Ll/zej;

    .line 47
    .line 48
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 49
    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 53
    .line 54
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->setRenderSize(II)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 65
    .line 66
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->o:Ll/zej;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 72
    .line 73
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->n:Ll/zej;

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 80
    .line 81
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->s:I

    .line 82
    .line 83
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->t:I

    .line 84
    .line 85
    invoke-virtual {v0, v1, v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->setRenderSize(II)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 89
    .line 90
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 94
    .line 95
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->o:Ll/zej;

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 101
    .line 102
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->n:Ll/zej;

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_1
    if-eqz v0, :cond_3

    .line 109
    .line 110
    invoke-virtual {v0}, Ll/wej;->onDrawFrame()V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 114
    .line 115
    if-eqz v0, :cond_2

    .line 116
    .line 117
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->o:Ll/zej;

    .line 118
    .line 119
    invoke-virtual {v0, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 124
    .line 125
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->o:Ll/zej;

    .line 126
    .line 127
    invoke-virtual {v0, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 128
    .line 129
    .line 130
    :cond_3
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->E:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->z(Ljava/util/Queue;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 7
    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->x:I

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 22
    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->D:Landroid/graphics/Bitmap;

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 36
    .line 37
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->D:Landroid/graphics/Bitmap;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/qnw;->loadTexture(Landroid/graphics/Bitmap;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->z:I

    .line 48
    .line 49
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->A:Landroid/graphics/SurfaceTexture;

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Ll/qnw;->loadTexture(ILandroid/graphics/SurfaceTexture;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->a:Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->b:Ljava/nio/ByteBuffer;

    .line 62
    .line 63
    invoke-virtual {v0, v1, v2}, Ll/gb20;->updateYUVBuffer(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    .line 64
    .line 65
    .line 66
    :cond_3
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/pej;->h()V

    .line 69
    .line 70
    .line 71
    :cond_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->F:Ljava/util/Queue;

    .line 72
    .line 73
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->z(Ljava/util/Queue;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->f:Ll/qmq0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public t()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->l:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public u()I
    .locals 1

    .line 1
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->q:Lproject/android/imageprocessing/ext/a;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/gfj;->getTextOutID()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->getTextOutID()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 23
    .line 24
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->getTextOutID()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method public v()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public y()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->l:Landroid/graphics/SurfaceTexture;

    .line 3
    .line 4
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/pej;->d()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 12
    .line 13
    :cond_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/gfj;->destroy()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->g:Lproject/android/imageprocessing/ext/a;

    .line 21
    .line 22
    :cond_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->destroy()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 30
    .line 31
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 32
    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->destroy()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 39
    .line 40
    :cond_3
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->o:Ll/zej;

    .line 41
    .line 42
    if-eqz v1, :cond_4

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/zej;->destroy()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->o:Ll/zej;

    .line 48
    .line 49
    :cond_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->n:Ll/zej;

    .line 50
    .line 51
    if-eqz v1, :cond_5

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/zej;->destroy()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->n:Ll/zej;

    .line 57
    .line 58
    :cond_5
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->f:Ll/qmq0;

    .line 59
    .line 60
    if-eqz v1, :cond_6

    .line 61
    .line 62
    invoke-virtual {v1}, Ll/qmq0;->destroy()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->f:Ll/qmq0;

    .line 66
    .line 67
    :cond_6
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 68
    .line 69
    if-eqz v1, :cond_7

    .line 70
    .line 71
    invoke-virtual {v1}, Ll/gfj;->destroy()V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->m:Ll/jt2;

    .line 75
    .line 76
    :cond_7
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->b:Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    if-eqz v1, :cond_8

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 81
    .line 82
    .line 83
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->b:Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    :cond_8
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->a:Ljava/nio/ByteBuffer;

    .line 86
    .line 87
    if-eqz v1, :cond_9

    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->a:Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    :cond_9
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->E:Ljava/util/Queue;

    .line 95
    .line 96
    if-eqz v0, :cond_a

    .line 97
    .line 98
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 99
    .line 100
    .line 101
    :cond_a
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->F:Ljava/util/Queue;

    .line 102
    .line 103
    if-eqz p0, :cond_b

    .line 104
    .line 105
    invoke-interface {p0}, Ljava/util/Collection;->clear()V

    .line 106
    .line 107
    .line 108
    :cond_b
    return-void
.end method
