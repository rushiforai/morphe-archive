.class public Lcom/tencent/liteav/basic/c/h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/basic/c/h$a;
    }
.end annotation


# instance fields
.field protected a:I

.field protected b:I

.field protected c:I

.field protected d:I

.field protected e:I

.field protected f:I

.field protected g:Z

.field protected h:Ljava/nio/FloatBuffer;

.field protected i:Ljava/nio/FloatBuffer;

.field protected j:[F

.field protected k:[F

.field protected l:Lcom/tencent/liteav/basic/c/h$a;

.field protected m:I

.field protected n:I

.field protected o:Z

.field protected p:Z

.field protected q:Z

.field private final r:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final s:Ljava/lang/String;

.field private final t:Ljava/lang/String;

.field private u:Z

.field private v:I

.field private w:[F


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 120
    const-string v0, "varying lowp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    const/4 v1, 0x0

    const-string v2, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    invoke-direct {p0, v2, v0, v1}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 119
    invoke-direct {p0, p1, p2, v0}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->u:Z

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    iput v1, p0, Lcom/tencent/liteav/basic/c/h;->v:I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-object v2, p0, Lcom/tencent/liteav/basic/c/h;->w:[F

    .line 12
    .line 13
    iput v1, p0, Lcom/tencent/liteav/basic/c/h;->m:I

    .line 14
    .line 15
    iput v1, p0, Lcom/tencent/liteav/basic/c/h;->n:I

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->o:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->p:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->q:Z

    .line 22
    .line 23
    new-instance v1, Ljava/util/LinkedList;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/tencent/liteav/basic/c/h;->r:Ljava/util/LinkedList;

    .line 29
    .line 30
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/h;->s:Ljava/lang/String;

    .line 31
    .line 32
    iput-object p2, p0, Lcom/tencent/liteav/basic/c/h;->t:Ljava/lang/String;

    .line 33
    .line 34
    iput-boolean p3, p0, Lcom/tencent/liteav/basic/c/h;->q:Z

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    if-ne p1, p3, :cond_0

    .line 38
    .line 39
    const-string p2, "TXCGPUFilter"

    .line 40
    .line 41
    const-string p3, "set Oes fileter"

    .line 42
    .line 43
    invoke-static {p2, p3}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    sget-object p2, Lcom/tencent/liteav/basic/c/l;->e:[F

    .line 47
    .line 48
    array-length p3, p2

    .line 49
    mul-int/lit8 p3, p3, 0x4

    .line 50
    .line 51
    invoke-static {p3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {p3, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    iput-object p3, p0, Lcom/tencent/liteav/basic/c/h;->h:Ljava/nio/FloatBuffer;

    .line 68
    .line 69
    iput-object p2, p0, Lcom/tencent/liteav/basic/c/h;->j:[F

    .line 70
    .line 71
    invoke-virtual {p3, p2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-virtual {p2, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 76
    .line 77
    .line 78
    sget-object p2, Lcom/tencent/liteav/basic/c/l;->a:[F

    .line 79
    .line 80
    array-length p2, p2

    .line 81
    mul-int/lit8 p2, p2, 0x4

    .line 82
    .line 83
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    iput-object p2, p0, Lcom/tencent/liteav/basic/c/h;->i:Ljava/nio/FloatBuffer;

    .line 100
    .line 101
    sget-object p2, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    .line 102
    .line 103
    invoke-static {p2, v0, p1}, Lcom/tencent/liteav/basic/c/l;->a(Lcom/tencent/liteav/basic/c/k;ZZ)[F

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/h;->k:[F

    .line 108
    .line 109
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/h;->i:Ljava/nio/FloatBuffer;

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method private static a(Ljava/nio/FloatBuffer;)[F
    .locals 3

    .line 261
    invoke-virtual {p0}, Ljava/nio/Buffer;->limit()I

    move-result v0

    if-gtz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 262
    :cond_0
    invoke-virtual {p0}, Ljava/nio/Buffer;->limit()I

    move-result v0

    new-array v0, v0, [F

    const/4 v1, 0x0

    .line 263
    :goto_0
    invoke-virtual {p0}, Ljava/nio/Buffer;->limit()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 264
    invoke-virtual {p0, v1}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v2

    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method public a(I)I
    .locals 2

    .line 303
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/h;->h:Ljava/nio/FloatBuffer;

    iget-object v1, p0, Lcom/tencent/liteav/basic/c/h;->i:Ljava/nio/FloatBuffer;

    invoke-virtual {p0, p1, v0, v1}, Lcom/tencent/liteav/basic/c/h;->b(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    move-result p0

    return p0
.end method

.method public a(III)I
    .locals 2

    .line 304
    iget-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    if-nez v0, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    const v0, 0x8d40

    .line 305
    invoke-static {v0, p2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 306
    iget-object p2, p0, Lcom/tencent/liteav/basic/c/h;->h:Ljava/nio/FloatBuffer;

    iget-object v1, p0, Lcom/tencent/liteav/basic/c/h;->i:Ljava/nio/FloatBuffer;

    invoke-virtual {p0, p1, p2, v1}, Lcom/tencent/liteav/basic/c/h;->a(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)V

    .line 307
    iget-object p1, p0, Lcom/tencent/liteav/basic/c/h;->l:Lcom/tencent/liteav/basic/c/h$a;

    if-eqz p1, :cond_1

    .line 308
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/h;->l:Lcom/tencent/liteav/basic/c/h$a;

    invoke-interface {p0, p3}, Lcom/tencent/liteav/basic/c/h$a;->a(I)V

    :cond_1
    const/4 p0, 0x0

    .line 309
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    return p3
.end method

.method public a(IF)V
    .locals 1

    .line 354
    new-instance v0, Lcom/tencent/liteav/basic/c/h$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/basic/c/h$2;-><init>(Lcom/tencent/liteav/basic/c/h;IF)V

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/basic/c/h;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(II)V
    .locals 3

    .line 265
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    if-ne v0, p2, :cond_0

    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    if-ne v0, p1, :cond_0

    goto :goto_1

    .line 266
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 267
    iput p2, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 268
    iget-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->o:Z

    if-eqz v0, :cond_2

    .line 269
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->m:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 270
    :cond_1
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->f()V

    :goto_0
    const/4 v0, 0x1

    .line 271
    new-array v1, v0, [I

    const/4 v2, 0x0

    .line 272
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 273
    aget v0, v1, v2

    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->m:I

    const/16 v0, 0x1908

    .line 274
    invoke-static {p1, p2, v0, v0}, Lcom/tencent/liteav/basic/c/j;->a(IIII)I

    move-result p1

    iput p1, p0, Lcom/tencent/liteav/basic/c/h;->n:I

    .line 275
    iget p1, p0, Lcom/tencent/liteav/basic/c/h;->m:I

    const p2, 0x8d40

    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const/16 p1, 0xde1

    .line 276
    iget p0, p0, Lcom/tencent/liteav/basic/c/h;->n:I

    const v0, 0x8ce0

    invoke-static {p2, v0, p1, p0, v2}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 277
    invoke-static {p2, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    :cond_2
    :goto_1
    return-void
.end method

.method public a(III[FFZZ)V
    .locals 15

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    sget-object v2, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Lcom/tencent/liteav/basic/c/l;->a(Lcom/tencent/liteav/basic/c/k;ZZ)[F

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    :goto_0
    move/from16 v3, p1

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    move-object/from16 v2, p4

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :goto_1
    int-to-float v4, v3

    .line 18
    move/from16 v5, p2

    .line 19
    .line 20
    int-to-float v6, v5

    .line 21
    div-float v7, v4, v6

    .line 22
    .line 23
    cmpl-float v8, v7, p5

    .line 24
    .line 25
    if-lez v8, :cond_1

    .line 26
    .line 27
    mul-float v3, v6, p5

    .line 28
    .line 29
    float-to-int v3, v3

    .line 30
    goto :goto_2

    .line 31
    :cond_1
    cmpg-float v7, v7, p5

    .line 32
    .line 33
    if-gez v7, :cond_2

    .line 34
    .line 35
    div-float v5, v4, p5

    .line 36
    .line 37
    float-to-int v5, v5

    .line 38
    :cond_2
    :goto_2
    int-to-float v3, v3

    .line 39
    div-float/2addr v3, v4

    .line 40
    int-to-float v4, v5

    .line 41
    div-float/2addr v4, v6

    .line 42
    const/high16 v5, 0x3f800000    # 1.0f

    .line 43
    .line 44
    sub-float v3, v5, v3

    .line 45
    .line 46
    const/high16 v6, 0x40000000    # 2.0f

    .line 47
    .line 48
    div-float/2addr v3, v6

    .line 49
    sub-float v4, v5, v4

    .line 50
    .line 51
    div-float/2addr v4, v6

    .line 52
    move v6, v0

    .line 53
    :goto_3
    array-length v7, v2

    .line 54
    const/4 v8, 0x2

    .line 55
    div-int/2addr v7, v8

    .line 56
    if-ge v6, v7, :cond_5

    .line 57
    .line 58
    mul-int/lit8 v7, v6, 0x2

    .line 59
    .line 60
    aget v8, v2, v7

    .line 61
    .line 62
    const/high16 v9, 0x3f000000    # 0.5f

    .line 63
    .line 64
    cmpg-float v10, v8, v9

    .line 65
    .line 66
    if-gez v10, :cond_3

    .line 67
    .line 68
    add-float/2addr v8, v3

    .line 69
    aput v8, v2, v7

    .line 70
    .line 71
    goto :goto_4

    .line 72
    :cond_3
    sub-float/2addr v8, v3

    .line 73
    aput v8, v2, v7

    .line 74
    .line 75
    :goto_4
    add-int/lit8 v7, v7, 0x1

    .line 76
    .line 77
    aget v8, v2, v7

    .line 78
    .line 79
    cmpg-float v9, v8, v9

    .line 80
    .line 81
    if-gez v9, :cond_4

    .line 82
    .line 83
    add-float/2addr v8, v4

    .line 84
    aput v8, v2, v7

    .line 85
    .line 86
    goto :goto_5

    .line 87
    :cond_4
    sub-float/2addr v8, v4

    .line 88
    aput v8, v2, v7

    .line 89
    .line 90
    :goto_5
    add-int/lit8 v6, v6, 0x1

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_5
    div-int/lit8 v3, p3, 0x5a

    .line 94
    .line 95
    move v4, v0

    .line 96
    :goto_6
    const/4 v6, 0x5

    .line 97
    const/4 v7, 0x4

    .line 98
    const/4 v9, 0x7

    .line 99
    const/4 v10, 0x6

    .line 100
    const/4 v11, 0x3

    .line 101
    if-ge v4, v3, :cond_6

    .line 102
    .line 103
    aget v12, v2, v0

    .line 104
    .line 105
    aget v13, v2, v1

    .line 106
    .line 107
    aget v14, v2, v8

    .line 108
    .line 109
    aput v14, v2, v0

    .line 110
    .line 111
    aget v14, v2, v11

    .line 112
    .line 113
    aput v14, v2, v1

    .line 114
    .line 115
    aget v14, v2, v10

    .line 116
    .line 117
    aput v14, v2, v8

    .line 118
    .line 119
    aget v14, v2, v9

    .line 120
    .line 121
    aput v14, v2, v11

    .line 122
    .line 123
    aget v11, v2, v7

    .line 124
    .line 125
    aput v11, v2, v10

    .line 126
    .line 127
    aget v10, v2, v6

    .line 128
    .line 129
    aput v10, v2, v9

    .line 130
    .line 131
    aput v12, v2, v7

    .line 132
    .line 133
    aput v13, v2, v6

    .line 134
    .line 135
    add-int/lit8 v4, v4, 0x1

    .line 136
    .line 137
    goto :goto_6

    .line 138
    :cond_6
    if-eqz v3, :cond_9

    .line 139
    .line 140
    if-ne v3, v8, :cond_7

    .line 141
    .line 142
    goto :goto_7

    .line 143
    :cond_7
    if-eqz p7, :cond_8

    .line 144
    .line 145
    aget v3, v2, v0

    .line 146
    .line 147
    sub-float v3, v5, v3

    .line 148
    .line 149
    aput v3, v2, v0

    .line 150
    .line 151
    aget v0, v2, v8

    .line 152
    .line 153
    sub-float v0, v5, v0

    .line 154
    .line 155
    aput v0, v2, v8

    .line 156
    .line 157
    aget v0, v2, v7

    .line 158
    .line 159
    sub-float v0, v5, v0

    .line 160
    .line 161
    aput v0, v2, v7

    .line 162
    .line 163
    aget v0, v2, v10

    .line 164
    .line 165
    sub-float v0, v5, v0

    .line 166
    .line 167
    aput v0, v2, v10

    .line 168
    .line 169
    :cond_8
    if-eqz p6, :cond_b

    .line 170
    .line 171
    aget v0, v2, v1

    .line 172
    .line 173
    sub-float v0, v5, v0

    .line 174
    .line 175
    aput v0, v2, v1

    .line 176
    .line 177
    aget v0, v2, v11

    .line 178
    .line 179
    sub-float v0, v5, v0

    .line 180
    .line 181
    aput v0, v2, v11

    .line 182
    .line 183
    aget v0, v2, v6

    .line 184
    .line 185
    sub-float v0, v5, v0

    .line 186
    .line 187
    aput v0, v2, v6

    .line 188
    .line 189
    aget v0, v2, v9

    .line 190
    .line 191
    sub-float/2addr v5, v0

    .line 192
    aput v5, v2, v9

    .line 193
    .line 194
    goto :goto_8

    .line 195
    :cond_9
    :goto_7
    if-eqz p6, :cond_a

    .line 196
    .line 197
    aget v3, v2, v0

    .line 198
    .line 199
    sub-float v3, v5, v3

    .line 200
    .line 201
    aput v3, v2, v0

    .line 202
    .line 203
    aget v0, v2, v8

    .line 204
    .line 205
    sub-float v0, v5, v0

    .line 206
    .line 207
    aput v0, v2, v8

    .line 208
    .line 209
    aget v0, v2, v7

    .line 210
    .line 211
    sub-float v0, v5, v0

    .line 212
    .line 213
    aput v0, v2, v7

    .line 214
    .line 215
    aget v0, v2, v10

    .line 216
    .line 217
    sub-float v0, v5, v0

    .line 218
    .line 219
    aput v0, v2, v10

    .line 220
    .line 221
    :cond_a
    if-eqz p7, :cond_b

    .line 222
    .line 223
    aget v0, v2, v1

    .line 224
    .line 225
    sub-float v0, v5, v0

    .line 226
    .line 227
    aput v0, v2, v1

    .line 228
    .line 229
    aget v0, v2, v11

    .line 230
    .line 231
    sub-float v0, v5, v0

    .line 232
    .line 233
    aput v0, v2, v11

    .line 234
    .line 235
    aget v0, v2, v6

    .line 236
    .line 237
    sub-float v0, v5, v0

    .line 238
    .line 239
    aput v0, v2, v6

    .line 240
    .line 241
    aget v0, v2, v9

    .line 242
    .line 243
    sub-float/2addr v5, v0

    .line 244
    aput v5, v2, v9

    .line 245
    .line 246
    :cond_b
    :goto_8
    sget-object v0, Lcom/tencent/liteav/basic/c/l;->e:[F

    .line 247
    .line 248
    invoke-virtual {v0}, [F->clone()Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    check-cast v0, [F

    .line 253
    .line 254
    invoke-virtual {p0, v0, v2}, Lcom/tencent/liteav/basic/c/h;->a([F[F)V

    .line 255
    .line 256
    .line 257
    return-void
.end method

.method public a(ILjava/nio/FloatBuffer;)V
    .locals 9

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p2, :cond_0

    .line 340
    sget-object p2, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    invoke-static {p2, v1, v0}, Lcom/tencent/liteav/basic/c/l;->a(Lcom/tencent/liteav/basic/c/k;ZZ)[F

    move-result-object p2

    goto :goto_0

    .line 341
    :cond_0
    invoke-static {p2}, Lcom/tencent/liteav/basic/c/h;->a(Ljava/nio/FloatBuffer;)[F

    move-result-object p2

    .line 342
    :goto_0
    div-int/lit8 p1, p1, 0x5a

    move v2, v1

    :goto_1
    if-ge v2, p1, :cond_1

    .line 343
    aget v3, p2, v1

    .line 344
    aget v4, p2, v0

    const/4 v5, 0x2

    .line 345
    aget v6, p2, v5

    aput v6, p2, v1

    const/4 v6, 0x3

    .line 346
    aget v7, p2, v6

    aput v7, p2, v0

    const/4 v7, 0x6

    .line 347
    aget v8, p2, v7

    aput v8, p2, v5

    const/4 v5, 0x7

    .line 348
    aget v8, p2, v5

    aput v8, p2, v6

    const/4 v6, 0x4

    .line 349
    aget v8, p2, v6

    aput v8, p2, v7

    const/4 v7, 0x5

    .line 350
    aget v8, p2, v7

    aput v8, p2, v5

    .line 351
    aput v3, p2, v6

    .line 352
    aput v4, p2, v7

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 353
    :cond_1
    sget-object p1, Lcom/tencent/liteav/basic/c/l;->e:[F

    invoke-virtual {p1}, [F->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [F

    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a([F[F)V

    return-void
.end method

.method public a(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)V
    .locals 7

    .line 278
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 279
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->k()V

    .line 280
    iget-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 281
    invoke-virtual {p2, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 282
    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x2

    const/16 v3, 0x1406

    move-object v6, p2

    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 283
    iget p2, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 284
    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 285
    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    move-object v6, p3

    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 286
    iget p2, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 287
    iget p2, p0, Lcom/tencent/liteav/basic/c/h;->v:I

    const/4 p3, 0x1

    if-ltz p2, :cond_1

    iget-object v1, p0, Lcom/tencent/liteav/basic/c/h;->w:[F

    if-eqz v1, :cond_1

    .line 288
    invoke-static {p2, p3, v0, v1, v0}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    :cond_1
    const/4 p2, -0x1

    const/16 v1, 0xde1

    const v2, 0x8d65

    if-eq p1, p2, :cond_3

    const p2, 0x84c0

    .line 289
    invoke-static {p2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 290
    iget-boolean p2, p0, Lcom/tencent/liteav/basic/c/h;->q:Z

    if-ne p3, p2, :cond_2

    .line 291
    invoke-static {v2, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    goto :goto_0

    .line 292
    :cond_2
    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 293
    :goto_0
    iget p1, p0, Lcom/tencent/liteav/basic/c/h;->c:I

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 294
    :cond_3
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->i()V

    const/4 p1, 0x5

    const/4 p2, 0x4

    .line 295
    invoke-static {p1, v0, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 296
    iget p1, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 297
    iget p1, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 298
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->j()V

    .line 299
    iget-boolean p0, p0, Lcom/tencent/liteav/basic/c/h;->q:Z

    if-ne p3, p0, :cond_4

    .line 300
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    return-void

    .line 301
    :cond_4
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    return-void
.end method

.method public a(I[F)V
    .locals 1

    .line 355
    new-instance v0, Lcom/tencent/liteav/basic/c/h$3;

    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/basic/c/h$3;-><init>(Lcom/tencent/liteav/basic/c/h;I[F)V

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/basic/c/h;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/c/h$a;)V
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 259
    :goto_0
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->u:Z

    .line 260
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/h;->l:Lcom/tencent/liteav/basic/c/h$a;

    return-void
.end method

.method public a(Ljava/lang/Runnable;)V
    .locals 1

    .line 356
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/h;->r:Ljava/util/LinkedList;

    monitor-enter v0

    .line 357
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/h;->r:Ljava/util/LinkedList;

    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 358
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Z)V
    .locals 0

    .line 258
    iput-boolean p1, p0, Lcom/tencent/liteav/basic/c/h;->o:Z

    return-void
.end method

.method public a([F)V
    .locals 0

    .line 302
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/h;->w:[F

    return-void
.end method

.method public a([F[F)V
    .locals 2

    .line 310
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/h;->j:[F

    .line 311
    sget-object v0, Lcom/tencent/liteav/basic/c/l;->e:[F

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 312
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 313
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/liteav/basic/c/h;->h:Ljava/nio/FloatBuffer;

    .line 314
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 315
    iput-object p2, p0, Lcom/tencent/liteav/basic/c/h;->k:[F

    .line 316
    sget-object p1, Lcom/tencent/liteav/basic/c/l;->a:[F

    array-length p1, p1

    mul-int/lit8 p1, p1, 0x4

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 317
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 318
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/liteav/basic/c/h;->i:Ljava/nio/FloatBuffer;

    .line 319
    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    return-void
.end method

.method public a()Z
    .locals 2

    .line 334
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/h;->s:Ljava/lang/String;

    iget-object v1, p0, Lcom/tencent/liteav/basic/c/h;->t:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/c/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    if-eqz v0, :cond_0

    .line 335
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 336
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 337
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 338
    :goto_0
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->c()V

    .line 339
    iget-boolean p0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    return p0
.end method

.method public a(IILjava/nio/FloatBuffer;Lcom/tencent/liteav/basic/c/a;I)[F
    .locals 4

    const/4 p0, 0x0

    if-nez p3, :cond_1

    const/4 p3, 0x4

    if-ne p3, p5, :cond_0

    .line 320
    sget-object p3, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    invoke-static {p3, p0, p0}, Lcom/tencent/liteav/basic/c/l;->a(Lcom/tencent/liteav/basic/c/k;ZZ)[F

    move-result-object p3

    goto :goto_0

    .line 321
    :cond_0
    sget-object p3, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    const/4 p5, 0x1

    invoke-static {p3, p0, p5}, Lcom/tencent/liteav/basic/c/l;->a(Lcom/tencent/liteav/basic/c/k;ZZ)[F

    move-result-object p3

    goto :goto_0

    .line 322
    :cond_1
    invoke-static {p3}, Lcom/tencent/liteav/basic/c/h;->a(Ljava/nio/FloatBuffer;)[F

    move-result-object p3

    :goto_0
    if-eqz p4, :cond_4

    .line 323
    iget p5, p4, Lcom/tencent/liteav/basic/c/a;->a:I

    int-to-float v0, p5

    int-to-float v1, p1

    const/high16 v2, 0x3f800000    # 1.0f

    mul-float/2addr v1, v2

    div-float/2addr v0, v1

    sub-int/2addr p1, p5

    .line 324
    iget p5, p4, Lcom/tencent/liteav/basic/c/a;->c:I

    sub-int/2addr p1, p5

    int-to-float p1, p1

    div-float/2addr p1, v1

    .line 325
    iget p5, p4, Lcom/tencent/liteav/basic/c/a;->b:I

    int-to-float v1, p5

    int-to-float v3, p2

    mul-float/2addr v3, v2

    div-float/2addr v1, v3

    sub-int/2addr p2, p5

    .line 326
    iget p4, p4, Lcom/tencent/liteav/basic/c/a;->d:I

    sub-int/2addr p2, p4

    int-to-float p2, p2

    div-float/2addr p2, v3

    .line 327
    :goto_1
    array-length p4, p3

    div-int/lit8 p4, p4, 0x2

    if-ge p0, p4, :cond_4

    mul-int/lit8 p4, p0, 0x2

    .line 328
    aget p5, p3, p4

    const/high16 v2, 0x3f000000    # 0.5f

    cmpg-float v3, p5, v2

    if-gez v3, :cond_2

    add-float/2addr p5, v0

    .line 329
    aput p5, p3, p4

    goto :goto_2

    :cond_2
    sub-float/2addr p5, p1

    .line 330
    aput p5, p3, p4

    :goto_2
    add-int/lit8 p4, p4, 0x1

    .line 331
    aget p5, p3, p4

    cmpg-float v2, p5, v2

    if-gez v2, :cond_3

    add-float/2addr p5, v1

    .line 332
    aput p5, p3, p4

    goto :goto_3

    :cond_3
    sub-float/2addr p5, p2

    .line 333
    aput p5, p3, p4

    :goto_3
    add-int/lit8 p0, p0, 0x1

    goto :goto_1

    :cond_4
    return-object p3
.end method

.method public b(I)I
    .locals 2

    .line 49
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->m:I

    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->n:I

    invoke-virtual {p0, p1, v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    move-result p0

    return p0
.end method

.method public b(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I
    .locals 1

    .line 45
    iget-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    if-nez v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 46
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/liteav/basic/c/h;->a(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)V

    .line 47
    iget-object p2, p0, Lcom/tencent/liteav/basic/c/h;->l:Lcom/tencent/liteav/basic/c/h$a;

    if-eqz p2, :cond_1

    .line 48
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/h;->l:Lcom/tencent/liteav/basic/c/h$a;

    invoke-interface {p0, p1}, Lcom/tencent/liteav/basic/c/h$a;->a(I)V

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public b(II)V
    .locals 1

    .line 50
    new-instance v0, Lcom/tencent/liteav/basic/c/h$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/basic/c/h$1;-><init>(Lcom/tencent/liteav/basic/c/h;II)V

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/basic/c/h;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public b(I[F)V
    .locals 1

    .line 51
    new-instance v0, Lcom/tencent/liteav/basic/c/h$4;

    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/basic/c/h$4;-><init>(Lcom/tencent/liteav/basic/c/h;I[F)V

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/basic/c/h;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 43
    iput-boolean p1, p0, Lcom/tencent/liteav/basic/c/h;->p:Z

    .line 44
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "set Nearest model "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "TXCGPUFilter"

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public b()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 2
    .line 3
    const-string v1, "position"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    .line 10
    .line 11
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 12
    .line 13
    const-string v1, "inputImageTexture"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->c:I

    .line 20
    .line 21
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 22
    .line 23
    const-string v1, "textureTransform"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->v:I

    .line 30
    .line 31
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 32
    .line 33
    const-string v1, "inputTextureCoordinate"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method public c()V
    .locals 0

    .line 10
    return-void
.end method

.method public c(I[F)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/basic/c/h$5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/basic/c/h$5;-><init>(Lcom/tencent/liteav/basic/c/h;I[F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/basic/c/h;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 11
    .line 12
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->f()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 8
    .line 9
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->m:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, -0x1

    .line 6
    if-eq v0, v3, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 13
    .line 14
    .line 15
    iput v3, p0, Lcom/tencent/liteav/basic/c/h;->m:I

    .line 16
    .line 17
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->n:I

    .line 18
    .line 19
    if-eq v0, v3, :cond_1

    .line 20
    .line 21
    filled-new-array {v0}, [I

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 26
    .line 27
    .line 28
    iput v3, p0, Lcom/tencent/liteav/basic/c/h;->n:I

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public g()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/h;->k:[F

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    const/16 v1, 0x8

    .line 7
    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/h;->k:[F

    .line 11
    .line 12
    const/high16 v2, 0x3f800000    # 1.0f

    .line 13
    .line 14
    aget v3, v1, v0

    .line 15
    .line 16
    sub-float/2addr v2, v3

    .line 17
    aput v2, v1, v0

    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x2

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/h;->j:[F

    .line 23
    .line 24
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/h;->k:[F

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;->a([F[F)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public h()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/h;->k:[F

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    :goto_0
    const/16 v1, 0x8

    .line 7
    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/h;->k:[F

    .line 11
    .line 12
    const/high16 v2, 0x3f800000    # 1.0f

    .line 13
    .line 14
    aget v3, v1, v0

    .line 15
    .line 16
    sub-float/2addr v2, v3

    .line 17
    aput v2, v1, v0

    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x2

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/h;->j:[F

    .line 23
    .line 24
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/h;->k:[F

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;->a([F[F)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public i()V
    .locals 0

    return-void
.end method

.method public j()V
    .locals 0

    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/h;->r:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/h;->r:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/c/h;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public n()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public o()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public p()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 2
    .line 3
    return p0
.end method
