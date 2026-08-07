.class public Ll/lim;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected alphaValue:F

.field private aspectRatio:F

.field protected baseRenderHeight:I

.field protected baseRenderWidth:I

.field protected bitmapHeight:I

.field protected bitmapWidth:I

.field private centerX:F

.field private centerY:F

.field mvpMatrix:[F

.field private projectionMatrix:[F

.field protected renderVertices:Ljava/nio/FloatBuffer;

.field public textureVertices:[Ljava/nio/FloatBuffer;

.field private viewMatrix:[F

.field private xRotate:F

.field private xScale:F

.field private yRotate:F

.field private yScale:F

.field private zRotate:F


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/lim;->baseRenderWidth:I

    .line 6
    .line 7
    iput v0, p0, Ll/lim;->baseRenderHeight:I

    .line 8
    .line 9
    iput v0, p0, Ll/lim;->bitmapWidth:I

    .line 10
    .line 11
    iput v0, p0, Ll/lim;->bitmapHeight:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput v1, p0, Ll/lim;->aspectRatio:F

    .line 15
    .line 16
    const/16 v2, 0x10

    .line 17
    .line 18
    new-array v3, v2, [F

    .line 19
    .line 20
    iput-object v3, p0, Ll/lim;->projectionMatrix:[F

    .line 21
    .line 22
    new-array v3, v2, [F

    .line 23
    .line 24
    iput-object v3, p0, Ll/lim;->viewMatrix:[F

    .line 25
    .line 26
    new-array v2, v2, [F

    .line 27
    .line 28
    iput-object v2, p0, Ll/lim;->mvpMatrix:[F

    .line 29
    .line 30
    iput v1, p0, Ll/lim;->centerX:F

    .line 31
    .line 32
    iput v1, p0, Ll/lim;->centerY:F

    .line 33
    .line 34
    iput v1, p0, Ll/lim;->xRotate:F

    .line 35
    .line 36
    iput v1, p0, Ll/lim;->yRotate:F

    .line 37
    .line 38
    iput v1, p0, Ll/lim;->zRotate:F

    .line 39
    .line 40
    const/high16 v1, 0x3f800000    # 1.0f

    .line 41
    .line 42
    iput v1, p0, Ll/lim;->xScale:F

    .line 43
    .line 44
    iput v1, p0, Ll/lim;->yScale:F

    .line 45
    .line 46
    iput v1, p0, Ll/lim;->alphaValue:F

    .line 47
    .line 48
    const/16 v1, 0x8

    .line 49
    .line 50
    new-array v2, v1, [F

    .line 51
    .line 52
    fill-array-data v2, :array_0

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v2}, Ll/lim;->setRenderVertices([F)V

    .line 56
    .line 57
    .line 58
    const/4 v2, 0x4

    .line 59
    new-array v2, v2, [Ljava/nio/FloatBuffer;

    .line 60
    .line 61
    iput-object v2, p0, Ll/lim;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 62
    .line 63
    new-array v3, v1, [F

    .line 64
    .line 65
    fill-array-data v3, :array_1

    .line 66
    .line 67
    .line 68
    const/16 v4, 0x20

    .line 69
    .line 70
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    aput-object v5, v2, v0

    .line 87
    .line 88
    iget-object v2, p0, Ll/lim;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 89
    .line 90
    aget-object v2, v2, v0

    .line 91
    .line 92
    invoke-virtual {v2, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v2, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 97
    .line 98
    .line 99
    new-array v2, v1, [F

    .line 100
    .line 101
    fill-array-data v2, :array_2

    .line 102
    .line 103
    .line 104
    iget-object v3, p0, Ll/lim;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 105
    .line 106
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    const/4 v6, 0x1

    .line 123
    aput-object v5, v3, v6

    .line 124
    .line 125
    iget-object v3, p0, Ll/lim;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 126
    .line 127
    aget-object v3, v3, v6

    .line 128
    .line 129
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v2, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 134
    .line 135
    .line 136
    new-array v2, v1, [F

    .line 137
    .line 138
    fill-array-data v2, :array_3

    .line 139
    .line 140
    .line 141
    iget-object v3, p0, Ll/lim;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 142
    .line 143
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 148
    .line 149
    .line 150
    move-result-object v6

    .line 151
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    const/4 v6, 0x2

    .line 160
    aput-object v5, v3, v6

    .line 161
    .line 162
    iget-object v3, p0, Ll/lim;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 163
    .line 164
    aget-object v3, v3, v6

    .line 165
    .line 166
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {v2, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 171
    .line 172
    .line 173
    new-array v1, v1, [F

    .line 174
    .line 175
    fill-array-data v1, :array_4

    .line 176
    .line 177
    .line 178
    iget-object v2, p0, Ll/lim;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 179
    .line 180
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    const/4 v4, 0x3

    .line 197
    aput-object v3, v2, v4

    .line 198
    .line 199
    iget-object p0, p0, Ll/lim;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 200
    .line 201
    aget-object p0, p0, v4

    .line 202
    .line 203
    invoke-virtual {p0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-virtual {p0, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    :array_1
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
    .end array-data

    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private updateGeometryMatrix()[F
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Ll/lim;->baseRenderHeight:I

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    const/high16 v2, 0x3f800000    # 1.0f

    .line 7
    .line 8
    mul-float/2addr v1, v2

    .line 9
    iget v3, v0, Ll/lim;->baseRenderWidth:I

    .line 10
    .line 11
    int-to-float v3, v3

    .line 12
    div-float v9, v1, v3

    .line 13
    .line 14
    iget-object v1, v0, Ll/lim;->mvpMatrix:[F

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-static {v1, v3}, Ljava/util/Arrays;->fill([FF)V

    .line 18
    .line 19
    .line 20
    iget-object v4, v0, Ll/lim;->projectionMatrix:[F

    .line 21
    .line 22
    neg-float v8, v9

    .line 23
    const/high16 v10, 0x40400000    # 3.0f

    .line 24
    .line 25
    const/high16 v11, 0x40e00000    # 7.0f

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    const/high16 v6, -0x40800000    # -1.0f

    .line 29
    .line 30
    const/high16 v7, 0x3f800000    # 1.0f

    .line 31
    .line 32
    invoke-static/range {v4 .. v11}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 33
    .line 34
    .line 35
    iget-object v12, v0, Ll/lim;->viewMatrix:[F

    .line 36
    .line 37
    const/high16 v21, -0x40800000    # -1.0f

    .line 38
    .line 39
    const/16 v22, 0x0

    .line 40
    .line 41
    const/4 v13, 0x0

    .line 42
    const/4 v14, 0x0

    .line 43
    const/4 v15, 0x0

    .line 44
    const/high16 v16, -0x3f600000    # -5.0f

    .line 45
    .line 46
    const/16 v17, 0x0

    .line 47
    .line 48
    const/16 v18, 0x0

    .line 49
    .line 50
    const/16 v19, 0x0

    .line 51
    .line 52
    const/16 v20, 0x0

    .line 53
    .line 54
    invoke-static/range {v12 .. v22}, Landroid/opengl/Matrix;->setLookAtM([FIFFFFFFFFF)V

    .line 55
    .line 56
    .line 57
    iget-object v4, v0, Ll/lim;->mvpMatrix:[F

    .line 58
    .line 59
    iget-object v6, v0, Ll/lim;->projectionMatrix:[F

    .line 60
    .line 61
    iget-object v8, v0, Ll/lim;->viewMatrix:[F

    .line 62
    .line 63
    const/4 v9, 0x0

    .line 64
    const/4 v7, 0x0

    .line 65
    invoke-static/range {v4 .. v9}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 66
    .line 67
    .line 68
    iget v12, v0, Ll/lim;->zRotate:F

    .line 69
    .line 70
    cmpl-float v1, v12, v3

    .line 71
    .line 72
    if-lez v1, :cond_0

    .line 73
    .line 74
    iget-object v10, v0, Ll/lim;->mvpMatrix:[F

    .line 75
    .line 76
    const/4 v14, 0x0

    .line 77
    const/high16 v15, 0x3f800000    # 1.0f

    .line 78
    .line 79
    const/4 v11, 0x0

    .line 80
    const/4 v13, 0x0

    .line 81
    invoke-static/range {v10 .. v15}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 82
    .line 83
    .line 84
    :cond_0
    iget v6, v0, Ll/lim;->xRotate:F

    .line 85
    .line 86
    cmpl-float v1, v6, v3

    .line 87
    .line 88
    if-lez v1, :cond_1

    .line 89
    .line 90
    iget-object v4, v0, Ll/lim;->mvpMatrix:[F

    .line 91
    .line 92
    const/4 v8, 0x0

    .line 93
    const/4 v9, 0x0

    .line 94
    const/4 v5, 0x0

    .line 95
    const/high16 v7, 0x3f800000    # 1.0f

    .line 96
    .line 97
    invoke-static/range {v4 .. v9}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 98
    .line 99
    .line 100
    :cond_1
    iget v12, v0, Ll/lim;->yRotate:F

    .line 101
    .line 102
    cmpl-float v1, v12, v3

    .line 103
    .line 104
    if-lez v1, :cond_2

    .line 105
    .line 106
    iget-object v10, v0, Ll/lim;->mvpMatrix:[F

    .line 107
    .line 108
    const/high16 v14, 0x3f800000    # 1.0f

    .line 109
    .line 110
    const/4 v15, 0x0

    .line 111
    const/4 v11, 0x0

    .line 112
    const/4 v13, 0x0

    .line 113
    invoke-static/range {v10 .. v15}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 114
    .line 115
    .line 116
    :cond_2
    iget-object v1, v0, Ll/lim;->mvpMatrix:[F

    .line 117
    .line 118
    iget v4, v0, Ll/lim;->xScale:F

    .line 119
    .line 120
    mul-float/2addr v4, v2

    .line 121
    iget v5, v0, Ll/lim;->yScale:F

    .line 122
    .line 123
    mul-float/2addr v5, v2

    .line 124
    const/4 v6, 0x0

    .line 125
    invoke-static {v1, v6, v4, v5, v2}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 126
    .line 127
    .line 128
    const/16 v1, 0x10

    .line 129
    .line 130
    new-array v9, v1, [F

    .line 131
    .line 132
    invoke-static {v9, v6}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 133
    .line 134
    .line 135
    iget v1, v0, Ll/lim;->centerX:F

    .line 136
    .line 137
    iget v2, v0, Ll/lim;->centerY:F

    .line 138
    .line 139
    invoke-static {v9, v6, v1, v2, v3}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 140
    .line 141
    .line 142
    iget-object v7, v0, Ll/lim;->mvpMatrix:[F

    .line 143
    .line 144
    const/4 v10, 0x0

    .line 145
    const/4 v12, 0x0

    .line 146
    const/4 v8, 0x0

    .line 147
    move-object v11, v7

    .line 148
    invoke-static/range {v7 .. v12}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 149
    .line 150
    .line 151
    iget-object v0, v0, Ll/lim;->mvpMatrix:[F

    .line 152
    .line 153
    return-object v0
.end method

.method private updateVertexInfo()V
    .locals 6

    .line 1
    iget v0, p0, Ll/lim;->bitmapWidth:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Ll/lim;->bitmapHeight:I

    .line 6
    .line 7
    if-lez v1, :cond_0

    .line 8
    .line 9
    iget v2, p0, Ll/lim;->baseRenderWidth:I

    .line 10
    .line 11
    if-lez v2, :cond_0

    .line 12
    .line 13
    iget v3, p0, Ll/lim;->baseRenderHeight:I

    .line 14
    .line 15
    if-lez v3, :cond_0

    .line 16
    .line 17
    int-to-float v3, v0

    .line 18
    const/high16 v4, 0x3f800000    # 1.0f

    .line 19
    .line 20
    mul-float/2addr v3, v4

    .line 21
    int-to-float v2, v2

    .line 22
    div-float/2addr v3, v2

    .line 23
    int-to-float v1, v1

    .line 24
    mul-float/2addr v1, v4

    .line 25
    int-to-float v0, v0

    .line 26
    div-float/2addr v1, v0

    .line 27
    mul-float/2addr v1, v3

    .line 28
    const/high16 v0, -0x40800000    # -1.0f

    .line 29
    .line 30
    mul-float/2addr v0, v3

    .line 31
    neg-float v2, v1

    .line 32
    mul-float/2addr v3, v4

    .line 33
    const/16 v4, 0x8

    .line 34
    .line 35
    new-array v4, v4, [F

    .line 36
    .line 37
    const/4 v5, 0x0

    .line 38
    aput v0, v4, v5

    .line 39
    .line 40
    const/4 v5, 0x1

    .line 41
    aput v2, v4, v5

    .line 42
    .line 43
    const/4 v5, 0x2

    .line 44
    aput v3, v4, v5

    .line 45
    .line 46
    const/4 v5, 0x3

    .line 47
    aput v2, v4, v5

    .line 48
    .line 49
    const/4 v2, 0x4

    .line 50
    aput v0, v4, v2

    .line 51
    .line 52
    const/4 v0, 0x5

    .line 53
    aput v1, v4, v0

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    aput v3, v4, v0

    .line 57
    .line 58
    const/4 v0, 0x7

    .line 59
    aput v1, v4, v0

    .line 60
    .line 61
    invoke-virtual {p0, v4}, Ll/lim;->setRenderVertices([F)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method


# virtual methods
.method public cropWidthAndHeightInNormalTextureCoord(FF)V
    .locals 5

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float v1, v0, p1

    .line 4
    .line 5
    sub-float/2addr v0, p2

    .line 6
    const/16 v2, 0x8

    .line 7
    .line 8
    new-array v2, v2, [F

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    aput p1, v2, v3

    .line 12
    .line 13
    const/4 v4, 0x1

    .line 14
    aput p2, v2, v4

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    aput v1, v2, v4

    .line 18
    .line 19
    const/4 v4, 0x3

    .line 20
    aput p2, v2, v4

    .line 21
    .line 22
    const/4 p2, 0x4

    .line 23
    aput p1, v2, p2

    .line 24
    .line 25
    const/4 p1, 0x5

    .line 26
    aput v0, v2, p1

    .line 27
    .line 28
    const/4 p1, 0x6

    .line 29
    aput v1, v2, p1

    .line 30
    .line 31
    const/4 p1, 0x7

    .line 32
    aput v0, v2, p1

    .line 33
    .line 34
    iget-object p1, p0, Ll/lim;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 35
    .line 36
    const/16 p2, 0x20

    .line 37
    .line 38
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    aput-object p2, p1, v3

    .line 55
    .line 56
    iget-object p0, p0, Ll/lim;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 57
    .line 58
    aget-object p0, p0, v3

    .line 59
    .line 60
    invoke-virtual {p0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public getAlphaValue()F
    .locals 0

    .line 1
    iget p0, p0, Ll/lim;->alphaValue:F

    .line 2
    .line 3
    return p0
.end method

.method public getMvpMatrix()[F
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lim;->updateGeometryMatrix()[F

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/lim;->mvpMatrix:[F

    .line 5
    .line 6
    return-object p0
.end method

.method public getRenderVertices()Ljava/nio/FloatBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lim;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextureVertices(I)Ljava/nio/FloatBuffer;
    .locals 2

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/lim;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 4
    .line 5
    array-length v1, v0

    .line 6
    if-ge p1, v1, :cond_0

    .line 7
    .line 8
    aget-object p0, v0, p1

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/lim;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    aget-object p0, p0, p1

    .line 15
    .line 16
    return-object p0
.end method

.method public recycleResourceInGlThread()V
    .locals 0

    .line 1
    return-void
.end method

.method public resetMatrix()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/lim;->centerX:F

    .line 3
    .line 4
    iput v0, p0, Ll/lim;->centerY:F

    .line 5
    .line 6
    iput v0, p0, Ll/lim;->xRotate:F

    .line 7
    .line 8
    iput v0, p0, Ll/lim;->yRotate:F

    .line 9
    .line 10
    iput v0, p0, Ll/lim;->zRotate:F

    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    iput v0, p0, Ll/lim;->xScale:F

    .line 15
    .line 16
    iput v0, p0, Ll/lim;->yScale:F

    .line 17
    .line 18
    invoke-direct {p0}, Ll/lim;->updateGeometryMatrix()[F

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setAlphaValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lim;->alphaValue:F

    .line 2
    .line 3
    return-void
.end method

.method public setBaseRenderSize(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lim;->baseRenderWidth:I

    .line 2
    .line 3
    iput p2, p0, Ll/lim;->baseRenderHeight:I

    .line 4
    .line 5
    invoke-direct {p0}, Ll/lim;->updateVertexInfo()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setRenderVertices([F)V
    .locals 2

    .line 1
    array-length v0, p1

    .line 2
    mul-int/lit8 v0, v0, 0x4

    .line 3
    .line 4
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/lim;->renderVertices:Ljava/nio/FloatBuffer;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, p1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public declared-synchronized setRotate(FFF)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Ll/lim;->xRotate:F

    .line 3
    .line 4
    iput p2, p0, Ll/lim;->yRotate:F

    .line 5
    .line 6
    iput p3, p0, Ll/lim;->zRotate:F

    .line 7
    .line 8
    invoke-direct {p0}, Ll/lim;->updateGeometryMatrix()[F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method

.method public declared-synchronized setScale(FF)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Ll/lim;->xScale:F

    .line 3
    .line 4
    iput p2, p0, Ll/lim;->yScale:F

    .line 5
    .line 6
    invoke-direct {p0}, Ll/lim;->updateGeometryMatrix()[F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    throw p1
.end method

.method public declared-synchronized setTraslate(FF)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Ll/lim;->centerX:F

    .line 3
    .line 4
    iput p2, p0, Ll/lim;->centerY:F

    .line 5
    .line 6
    invoke-direct {p0}, Ll/lim;->updateGeometryMatrix()[F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    throw p1
.end method

.method public updateBitmapAspectRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lim;->aspectRatio:F

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lim;->updateVertexInfo()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public updateBitmapInfo(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lim;->bitmapWidth:I

    .line 2
    .line 3
    iput p2, p0, Ll/lim;->bitmapHeight:I

    .line 4
    .line 5
    invoke-direct {p0}, Ll/lim;->updateVertexInfo()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
