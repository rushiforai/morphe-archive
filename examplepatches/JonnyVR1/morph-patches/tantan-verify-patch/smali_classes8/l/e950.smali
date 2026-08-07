.class public Ll/e950;
.super Ll/jt2;
.source "SourceFile"


# static fields
.field public static final ATTRIBUTE_DECORATION_SIZE:Ljava/lang/String; = "decorationSize"

.field public static final ATTRIBUTE_MVP_MATRIX:Ljava/lang/String; = "uMVPMatrix"

.field public static final ATTRIBUTE_POSITION_2:Ljava/lang/String; = "position2"

.field static final COORDS_PER_VERTEX:I = 0x2


# instance fields
.field private centerPoint:Landroid/graphics/PointF;

.field private decorateHandler:I

.field protected drawListBuffer:Ljava/nio/ShortBuffer;

.field protected final drawOrder:[S

.field private final fragmentShaderCode:Ljava/lang/String;

.field protected fvertexBuffer:Ljava/nio/FloatBuffer;

.field private mAngle:F

.field private mH:F

.field protected final mProjectionMatrix:[F

.field private mVPMatrixHandler:I

.field protected final mViewMatrix:[F

.field private mW:F

.field protected maskListLock:Ljava/lang/Object;

.field protected mvpLists:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[F>;"
        }
    .end annotation
.end field

.field private needUpdate:Z

.field protected positionHandle2:I

.field protected stickerScale:F

.field protected texData0:[F

.field protected vertexBuffer:Ljava/nio/FloatBuffer;

.field private final vertexShaderCode:Ljava/lang/String;

.field protected final vertexStride:I


# direct methods
.method public constructor <init>(F)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    invoke-direct {v0}, Ll/jt2;-><init>()V

    .line 6
    .line 7
    .line 8
    const/16 v2, 0x10

    .line 9
    .line 10
    new-array v3, v2, [F

    .line 11
    .line 12
    iput-object v3, v0, Ll/e950;->mProjectionMatrix:[F

    .line 13
    .line 14
    new-array v3, v2, [F

    .line 15
    .line 16
    iput-object v3, v0, Ll/e950;->mViewMatrix:[F

    .line 17
    .line 18
    const/4 v4, 0x6

    .line 19
    new-array v5, v4, [S

    .line 20
    .line 21
    fill-array-data v5, :array_0

    .line 22
    .line 23
    .line 24
    iput-object v5, v0, Ll/e950;->drawOrder:[S

    .line 25
    .line 26
    const/16 v6, 0x8

    .line 27
    .line 28
    iput v6, v0, Ll/e950;->vertexStride:I

    .line 29
    .line 30
    new-instance v7, Ljava/lang/Object;

    .line 31
    .line 32
    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v7, v0, Ll/e950;->maskListLock:Ljava/lang/Object;

    .line 36
    .line 37
    new-instance v7, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v7}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    iput-object v7, v0, Ll/e950;->mvpLists:Ljava/util/List;

    .line 47
    .line 48
    const-string v7, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; attribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),(coord.y + 0.5));\n}"

    .line 49
    .line 50
    iput-object v7, v0, Ll/e950;->vertexShaderCode:Ljava/lang/String;

    .line 51
    .line 52
    const-string v7, "precision mediump float;uniform sampler2D inputImageTexture;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture,textureCoordinate);\n   vec4 color2 = vec4(0.0);\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   outputColor.r = (color1.r * color1.a + color2.r * color2.a * (1.0 - color1.a))/a;\n   outputColor.g = (color1.g * color1.a + color2.g * color2.a * (1.0 - color1.a))/a;\n   outputColor.b = (color1.b * color1.a + color2.b * color2.a * (1.0 - color1.a))/a;\n   outputColor.a = 1.0;\n   gl_FragColor = color1;\n}"

    .line 53
    .line 54
    iput-object v7, v0, Ll/e950;->fragmentShaderCode:Ljava/lang/String;

    .line 55
    .line 56
    iput v1, v0, Ll/e950;->stickerScale:F

    .line 57
    .line 58
    const/high16 v7, 0x3f000000    # 0.5f

    .line 59
    .line 60
    mul-float v8, v1, v7

    .line 61
    .line 62
    const/high16 v9, -0x41000000    # -0.5f

    .line 63
    .line 64
    mul-float v10, v9, v1

    .line 65
    .line 66
    mul-float v11, v9, v1

    .line 67
    .line 68
    mul-float/2addr v1, v7

    .line 69
    new-array v12, v6, [F

    .line 70
    .line 71
    const/4 v13, 0x0

    .line 72
    aput v9, v12, v13

    .line 73
    .line 74
    const/4 v14, 0x1

    .line 75
    aput v8, v12, v14

    .line 76
    .line 77
    const/4 v8, 0x2

    .line 78
    aput v9, v12, v8

    .line 79
    .line 80
    const/4 v15, 0x3

    .line 81
    aput v10, v12, v15

    .line 82
    .line 83
    const/4 v10, 0x4

    .line 84
    aput v7, v12, v10

    .line 85
    .line 86
    const/16 v16, 0x5

    .line 87
    .line 88
    aput v11, v12, v16

    .line 89
    .line 90
    aput v7, v12, v4

    .line 91
    .line 92
    const/4 v11, 0x7

    .line 93
    aput v1, v12, v11

    .line 94
    .line 95
    const/16 v1, 0x20

    .line 96
    .line 97
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    move/from16 v17, v4

    .line 102
    .line 103
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iput-object v1, v0, Ll/e950;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 115
    .line 116
    invoke-virtual {v1, v12}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 117
    .line 118
    .line 119
    iget-object v1, v0, Ll/e950;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 120
    .line 121
    invoke-virtual {v1, v13}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 122
    .line 123
    .line 124
    iget v1, v0, Ll/e950;->stickerScale:F

    .line 125
    .line 126
    mul-float v4, v1, v7

    .line 127
    .line 128
    mul-float v12, v9, v1

    .line 129
    .line 130
    mul-float v18, v9, v1

    .line 131
    .line 132
    mul-float/2addr v1, v7

    .line 133
    new-array v2, v2, [F

    .line 134
    .line 135
    aput v9, v2, v13

    .line 136
    .line 137
    aput v4, v2, v14

    .line 138
    .line 139
    const/4 v4, 0x0

    .line 140
    aput v4, v2, v8

    .line 141
    .line 142
    const/high16 v14, 0x3f800000    # 1.0f

    .line 143
    .line 144
    aput v14, v2, v15

    .line 145
    .line 146
    aput v9, v2, v10

    .line 147
    .line 148
    aput v12, v2, v16

    .line 149
    .line 150
    aput v4, v2, v17

    .line 151
    .line 152
    aput v14, v2, v11

    .line 153
    .line 154
    aput v7, v2, v6

    .line 155
    .line 156
    const/16 v6, 0x9

    .line 157
    .line 158
    aput v18, v2, v6

    .line 159
    .line 160
    const/16 v6, 0xa

    .line 161
    .line 162
    aput v4, v2, v6

    .line 163
    .line 164
    const/16 v6, 0xb

    .line 165
    .line 166
    aput v14, v2, v6

    .line 167
    .line 168
    const/16 v6, 0xc

    .line 169
    .line 170
    aput v7, v2, v6

    .line 171
    .line 172
    const/16 v6, 0xd

    .line 173
    .line 174
    aput v1, v2, v6

    .line 175
    .line 176
    const/16 v1, 0xe

    .line 177
    .line 178
    aput v4, v2, v1

    .line 179
    .line 180
    const/16 v1, 0xf

    .line 181
    .line 182
    aput v14, v2, v1

    .line 183
    .line 184
    iput-object v2, v0, Ll/e950;->texData0:[F

    .line 185
    .line 186
    array-length v1, v5

    .line 187
    mul-int/2addr v1, v8

    .line 188
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    iput-object v1, v0, Ll/e950;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 204
    .line 205
    invoke-virtual {v1, v5}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 206
    .line 207
    .line 208
    iget-object v0, v0, Ll/e950;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 209
    .line 210
    invoke-virtual {v0, v13}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 211
    .line 212
    .line 213
    invoke-static {v3, v13}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 214
    .line 215
    .line 216
    const/high16 v0, -0x40800000    # -1.0f

    .line 217
    .line 218
    aput v0, v3, v13

    .line 219
    .line 220
    return-void

    .line 221
    :array_0
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x0s
        0x2s
        0x3s
    .end array-data
.end method

.method private caculateTransform()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/e950;->needUpdate:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget v1, v0, Ll/e950;->mW:F

    .line 9
    .line 10
    iget v2, v0, Ll/e950;->mH:F

    .line 11
    .line 12
    iget-object v3, v0, Ll/e950;->centerPoint:Landroid/graphics/PointF;

    .line 13
    .line 14
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 15
    .line 16
    const/high16 v5, 0x40000000    # 2.0f

    .line 17
    .line 18
    mul-float/2addr v4, v5

    .line 19
    const/high16 v6, 0x3f800000    # 1.0f

    .line 20
    .line 21
    sub-float/2addr v4, v6

    .line 22
    neg-float v4, v4

    .line 23
    iget v7, v3, Landroid/graphics/PointF;->y:F

    .line 24
    .line 25
    neg-float v7, v7

    .line 26
    mul-float/2addr v7, v5

    .line 27
    add-float/2addr v7, v6

    .line 28
    iget v10, v0, Ll/e950;->mAngle:F

    .line 29
    .line 30
    iput v4, v3, Landroid/graphics/PointF;->x:F

    .line 31
    .line 32
    iput v7, v3, Landroid/graphics/PointF;->y:F

    .line 33
    .line 34
    const/16 v3, 0x10

    .line 35
    .line 36
    new-array v11, v3, [F

    .line 37
    .line 38
    new-array v3, v3, [F

    .line 39
    .line 40
    const/4 v5, 0x0

    .line 41
    invoke-static {v3, v5}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 42
    .line 43
    .line 44
    neg-float v4, v4

    .line 45
    const/4 v8, 0x0

    .line 46
    invoke-static {v3, v5, v4, v7, v8}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 47
    .line 48
    .line 49
    iget-object v13, v0, Ll/e950;->mViewMatrix:[F

    .line 50
    .line 51
    iget-object v15, v0, Ll/e950;->mProjectionMatrix:[F

    .line 52
    .line 53
    const/16 v16, 0x0

    .line 54
    .line 55
    const/4 v12, 0x0

    .line 56
    const/4 v14, 0x0

    .line 57
    invoke-static/range {v11 .. v16}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 58
    .line 59
    .line 60
    move-object v15, v11

    .line 61
    move-object v13, v3

    .line 62
    invoke-static/range {v11 .. v16}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 63
    .line 64
    .line 65
    const/4 v12, 0x0

    .line 66
    const/high16 v13, 0x3f800000    # 1.0f

    .line 67
    .line 68
    const/4 v9, 0x0

    .line 69
    move-object v8, v11

    .line 70
    const/4 v11, 0x0

    .line 71
    invoke-static/range {v8 .. v13}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 72
    .line 73
    .line 74
    move-object v11, v8

    .line 75
    mul-float/2addr v1, v6

    .line 76
    mul-float/2addr v2, v6

    .line 77
    invoke-static {v11, v5, v1, v2, v6}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 78
    .line 79
    .line 80
    iget-object v15, v0, Ll/e950;->texData0:[F

    .line 81
    .line 82
    const/4 v12, 0x0

    .line 83
    move-object v13, v11

    .line 84
    move-object v11, v3

    .line 85
    invoke-static/range {v11 .. v16}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 86
    .line 87
    .line 88
    aget v1, v3, v5

    .line 89
    .line 90
    const/4 v2, 0x1

    .line 91
    aget v4, v3, v2

    .line 92
    .line 93
    const/4 v6, 0x4

    .line 94
    aget v7, v3, v6

    .line 95
    .line 96
    const/4 v8, 0x5

    .line 97
    aget v9, v3, v8

    .line 98
    .line 99
    const/16 v10, 0x8

    .line 100
    .line 101
    aget v11, v3, v10

    .line 102
    .line 103
    const/16 v12, 0x9

    .line 104
    .line 105
    aget v12, v3, v12

    .line 106
    .line 107
    const/16 v13, 0xc

    .line 108
    .line 109
    aget v13, v3, v13

    .line 110
    .line 111
    const/16 v14, 0xd

    .line 112
    .line 113
    aget v3, v3, v14

    .line 114
    .line 115
    new-array v10, v10, [F

    .line 116
    .line 117
    aput v1, v10, v5

    .line 118
    .line 119
    aput v4, v10, v2

    .line 120
    .line 121
    const/4 v1, 0x2

    .line 122
    aput v7, v10, v1

    .line 123
    .line 124
    const/4 v1, 0x3

    .line 125
    aput v9, v10, v1

    .line 126
    .line 127
    aput v11, v10, v6

    .line 128
    .line 129
    aput v12, v10, v8

    .line 130
    .line 131
    const/4 v1, 0x6

    .line 132
    aput v13, v10, v1

    .line 133
    .line 134
    const/4 v1, 0x7

    .line 135
    aput v3, v10, v1

    .line 136
    .line 137
    iget-object v1, v0, Ll/e950;->mvpLists:Ljava/util/List;

    .line 138
    .line 139
    if-eqz v1, :cond_1

    .line 140
    .line 141
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 142
    .line 143
    .line 144
    :cond_1
    const-string v1, "zk setOverlayPosition out"

    .line 145
    .line 146
    invoke-static {v10}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    iget-object v1, v0, Ll/e950;->mvpLists:Ljava/util/List;

    .line 154
    .line 155
    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    iput-boolean v5, v0, Ll/e950;->needUpdate:Z

    .line 159
    .line 160
    return-void
.end method


# virtual methods
.method public bindShaderAttributes()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->bindShaderAttributes()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    const-string v2, "uMVPMatrix"

    .line 8
    .line 9
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget p0, p0, Ll/wej;->programHandle:I

    .line 13
    .line 14
    const/4 v0, 0x3

    .line 15
    const-string v1, "decorationSize"

    .line 16
    .line 17
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public draw()V
    .locals 4

    .line 1
    iget v0, p0, Ll/e950;->decorateHandler:I

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    iget v2, p0, Ll/e950;->stickerScale:F

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/e950;->drawOrder:[S

    .line 11
    .line 12
    array-length v0, v0

    .line 13
    const/16 v1, 0x1403

    .line 14
    .line 15
    iget-object v2, p0, Ll/e950;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 16
    .line 17
    const/4 v3, 0x4

    .line 18
    invoke-static {v3, v0, v1, v2}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 19
    .line 20
    .line 21
    iget p0, p0, Ll/wej;->positionHandle:I

    .line 22
    .line 23
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public drawSub()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/e950;->caculateTransform()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Ll/wej;->programHandle:I

    .line 17
    .line 18
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 19
    .line 20
    .line 21
    const/16 v0, 0x4100

    .line 22
    .line 23
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/e950;->maskListLock:Ljava/lang/Object;

    .line 46
    .line 47
    monitor-enter v0

    .line 48
    :try_start_0
    iget-object v1, p0, Ll/e950;->mvpLists:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_0

    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, [F

    .line 65
    .line 66
    invoke-virtual {p0, v2}, Ll/e950;->passShaderValues([F)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/e950;->draw()V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :catchall_0
    move-exception p0

    .line 74
    goto :goto_1

    .line 75
    :cond_0
    monitor-exit v0

    .line 76
    return-void

    .line 77
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    throw p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;uniform sampler2D inputImageTexture;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture,textureCoordinate);\n   vec4 color2 = vec4(0.0);\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   outputColor.r = (color1.r * color1.a + color2.r * color2.a * (1.0 - color1.a))/a;\n   outputColor.g = (color1.g * color1.a + color2.g * color2.a * (1.0 - color1.a))/a;\n   outputColor.b = (color1.b * color1.a + color2.b * color2.a * (1.0 - color1.a))/a;\n   outputColor.a = 1.0;\n   gl_FragColor = color1;\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; attribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),(coord.y + 0.5));\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "position2"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/e950;->positionHandle2:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "uMVPMatrix"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/e950;->mVPMatrixHandler:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "decorationSize"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/e950;->decorateHandler:I

    .line 33
    .line 34
    return-void
.end method

.method public passShaderValues([F)V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    array-length v0, p1

    .line 8
    mul-int/lit8 v0, v0, 0x4

    .line 9
    .line 10
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/e950;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/e950;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 33
    .line 34
    .line 35
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 36
    .line 37
    const/16 v6, 0x8

    .line 38
    .line 39
    iget-object v7, p0, Ll/e950;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    const/4 v3, 0x2

    .line 42
    const/16 v4, 0x1406

    .line 43
    .line 44
    const/4 v5, 0x0

    .line 45
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 46
    .line 47
    .line 48
    iget v8, p0, Ll/e950;->positionHandle2:I

    .line 49
    .line 50
    const/16 v12, 0x8

    .line 51
    .line 52
    iget-object v13, p0, Ll/e950;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 53
    .line 54
    const/4 v9, 0x2

    .line 55
    const/16 v10, 0x1406

    .line 56
    .line 57
    const/4 v11, 0x0

    .line 58
    invoke-static/range {v8 .. v13}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 59
    .line 60
    .line 61
    iget p1, p0, Ll/wej;->positionHandle:I

    .line 62
    .line 63
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 64
    .line 65
    .line 66
    iget p1, p0, Ll/e950;->positionHandle2:I

    .line 67
    .line 68
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 72
    .line 73
    iget v0, p0, Ll/wej;->curRotation:I

    .line 74
    .line 75
    aget-object p1, p1, v0

    .line 76
    .line 77
    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 78
    .line 79
    .line 80
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 81
    .line 82
    iget-object p1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 83
    .line 84
    iget v0, p0, Ll/wej;->curRotation:I

    .line 85
    .line 86
    aget-object v7, p1, v0

    .line 87
    .line 88
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 89
    .line 90
    .line 91
    iget p1, p0, Ll/wej;->texCoordHandle:I

    .line 92
    .line 93
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 94
    .line 95
    .line 96
    const p1, 0x84c0

    .line 97
    .line 98
    .line 99
    invoke-static {p1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 100
    .line 101
    .line 102
    const/16 p1, 0xde1

    .line 103
    .line 104
    iget v0, p0, Ll/wej;->texture_in:I

    .line 105
    .line 106
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 107
    .line 108
    .line 109
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 110
    .line 111
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public setOverlayPosition(FFLandroid/graphics/PointF;F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e950;->maskListLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-nez p3, :cond_0

    .line 5
    .line 6
    :try_start_0
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput p1, p0, Ll/e950;->mW:F

    .line 11
    .line 12
    iput p2, p0, Ll/e950;->mH:F

    .line 13
    .line 14
    iput-object p3, p0, Ll/e950;->centerPoint:Landroid/graphics/PointF;

    .line 15
    .line 16
    iput p4, p0, Ll/e950;->mAngle:F

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, p0, Ll/e950;->needUpdate:Z

    .line 20
    .line 21
    monitor-exit v0

    .line 22
    return-void

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method
