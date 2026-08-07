.class public Lcom/momo/mcamera/mask/StickerHaniMaskFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# static fields
.field public static final ATTRIBUTE_DECORATION_SIZE:Ljava/lang/String; = "decorationSize"

.field public static final ATTRIBUTE_MVP_MATRIX:Ljava/lang/String; = "uMVPMatrix"

.field public static final ATTRIBUTE_POSITION_2:Ljava/lang/String; = "position2"

.field static final COORDS_PER_VERTEX:I = 0x2


# instance fields
.field color:[F

.field color2:[F

.field private context:Landroid/content/Context;

.field curMMCVImage:Ll/umw;

.field currentParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

.field private decorateHandler:I

.field private drawListBuffer:Ljava/nio/ShortBuffer;

.field private final drawOrder:[S

.field private final fragmentShaderCode:Ljava/lang/String;

.field private frameRate:I

.field private fvertexBuffer:Ljava/nio/FloatBuffer;

.field private imageDelegateProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

.field private isDraw:Z

.field private lockTexture:Z

.field protected final mProjectionMatrix:[F

.field private mVPMatrixHandler:I

.field protected final mViewMatrix:[F

.field protected maskListLock:Ljava/lang/Object;

.field mmcvImage:Ll/umw;

.field mvpMatrix:[F

.field protected positionHandle2:I

.field private startTime:J

.field protected sticker:Lcom/momo/mcamera/mask/Sticker;

.field private stickerBitmapCache:Lcom/momo/mcamera/mask/StickerBitmapCache;

.field private stickerCount:I

.field private stickerIndex:I

.field stickerScale:F

.field texData0:[F

.field textId:I

.field private vertexBuffer:Ljava/nio/FloatBuffer;

.field private final vertexShaderCode:Ljava/lang/String;

.field private final vertexStride:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput v1, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerIndex:I

    .line 8
    .line 9
    const-string v2, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; attribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 10
    .line 11
    iput-object v2, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->vertexShaderCode:Ljava/lang/String;

    .line 12
    .line 13
    const-string v2, "precision mediump float;uniform sampler2D inputImageTexture0;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = vec4(0.0,1.0,1.0,0.5);\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   outputColor.r = (color1.r * color1.a + color2.r * color2.a * (1.0 - color1.a))/a;\n   outputColor.g = (color1.g * color1.a + color2.g * color2.a * (1.0 - color1.a))/a;\n   outputColor.b = (color1.b * color1.a + color2.b * color2.a * (1.0 - color1.a))/a;\n   outputColor.a = a;\n   gl_FragColor = color1;\n}"

    .line 14
    .line 15
    iput-object v2, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->fragmentShaderCode:Ljava/lang/String;

    .line 16
    .line 17
    const/16 v2, 0x10

    .line 18
    .line 19
    new-array v3, v2, [F

    .line 20
    .line 21
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mProjectionMatrix:[F

    .line 22
    .line 23
    new-array v3, v2, [F

    .line 24
    .line 25
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mViewMatrix:[F

    .line 26
    .line 27
    const/4 v4, 0x6

    .line 28
    new-array v5, v4, [S

    .line 29
    .line 30
    fill-array-data v5, :array_0

    .line 31
    .line 32
    .line 33
    iput-object v5, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->drawOrder:[S

    .line 34
    .line 35
    const/16 v6, 0x8

    .line 36
    .line 37
    iput v6, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->vertexStride:I

    .line 38
    .line 39
    new-instance v7, Ljava/lang/Object;

    .line 40
    .line 41
    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v7, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 45
    .line 46
    const/4 v7, 0x4

    .line 47
    new-array v8, v7, [F

    .line 48
    .line 49
    fill-array-data v8, :array_1

    .line 50
    .line 51
    .line 52
    iput-object v8, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->color:[F

    .line 53
    .line 54
    new-array v8, v7, [F

    .line 55
    .line 56
    fill-array-data v8, :array_2

    .line 57
    .line 58
    .line 59
    iput-object v8, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->color2:[F

    .line 60
    .line 61
    const/4 v8, 0x1

    .line 62
    iput-boolean v8, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->isDraw:Z

    .line 63
    .line 64
    iput-boolean v1, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->lockTexture:Z

    .line 65
    .line 66
    const/4 v9, 0x0

    .line 67
    iput-object v9, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mmcvImage:Ll/umw;

    .line 68
    .line 69
    const-wide/16 v9, 0x0

    .line 70
    .line 71
    iput-wide v9, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->startTime:J

    .line 72
    .line 73
    invoke-virtual/range {p2 .. p2}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 74
    .line 75
    .line 76
    move-result v9

    .line 77
    iput v9, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerCount:I

    .line 78
    .line 79
    invoke-virtual/range {p2 .. p2}, Lcom/momo/mcamera/mask/Sticker;->getFrameRate()I

    .line 80
    .line 81
    .line 82
    move-result v9

    .line 83
    iput v9, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->frameRate:I

    .line 84
    .line 85
    move-object/from16 v9, p2

    .line 86
    .line 87
    iput-object v9, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 88
    .line 89
    move-object/from16 v10, p1

    .line 90
    .line 91
    iput-object v10, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->context:Landroid/content/Context;

    .line 92
    .line 93
    move-object/from16 v10, p3

    .line 94
    .line 95
    iput-object v10, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->imageDelegateProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 96
    .line 97
    invoke-virtual {v9}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 98
    .line 99
    .line 100
    move-result v9

    .line 101
    int-to-float v9, v9

    .line 102
    iget-object v10, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 103
    .line 104
    invoke-virtual {v10}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 105
    .line 106
    .line 107
    move-result v10

    .line 108
    int-to-float v10, v10

    .line 109
    div-float/2addr v9, v10

    .line 110
    iput v9, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerScale:F

    .line 111
    .line 112
    const/high16 v10, 0x3f000000    # 0.5f

    .line 113
    .line 114
    mul-float v11, v9, v10

    .line 115
    .line 116
    const/high16 v12, -0x41000000    # -0.5f

    .line 117
    .line 118
    mul-float v13, v12, v9

    .line 119
    .line 120
    mul-float v14, v12, v9

    .line 121
    .line 122
    mul-float/2addr v9, v10

    .line 123
    new-array v15, v6, [F

    .line 124
    .line 125
    aput v12, v15, v1

    .line 126
    .line 127
    aput v11, v15, v8

    .line 128
    .line 129
    const/4 v11, 0x2

    .line 130
    aput v12, v15, v11

    .line 131
    .line 132
    const/16 v16, 0x3

    .line 133
    .line 134
    aput v13, v15, v16

    .line 135
    .line 136
    aput v10, v15, v7

    .line 137
    .line 138
    const/4 v13, 0x5

    .line 139
    aput v14, v15, v13

    .line 140
    .line 141
    aput v10, v15, v4

    .line 142
    .line 143
    const/4 v14, 0x7

    .line 144
    aput v9, v15, v14

    .line 145
    .line 146
    const/16 v9, 0x20

    .line 147
    .line 148
    invoke-static {v9}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 149
    .line 150
    .line 151
    move-result-object v9

    .line 152
    move/from16 v17, v4

    .line 153
    .line 154
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    invoke-virtual {v9, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    iput-object v4, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 166
    .line 167
    invoke-virtual {v4, v15}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 168
    .line 169
    .line 170
    iget-object v4, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 171
    .line 172
    invoke-virtual {v4, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 173
    .line 174
    .line 175
    iget v4, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerScale:F

    .line 176
    .line 177
    mul-float v9, v4, v10

    .line 178
    .line 179
    mul-float v15, v12, v4

    .line 180
    .line 181
    mul-float v18, v12, v4

    .line 182
    .line 183
    mul-float/2addr v4, v10

    .line 184
    new-array v2, v2, [F

    .line 185
    .line 186
    aput v12, v2, v1

    .line 187
    .line 188
    aput v9, v2, v8

    .line 189
    .line 190
    const/4 v8, 0x0

    .line 191
    aput v8, v2, v11

    .line 192
    .line 193
    const/high16 v9, 0x3f800000    # 1.0f

    .line 194
    .line 195
    aput v9, v2, v16

    .line 196
    .line 197
    aput v12, v2, v7

    .line 198
    .line 199
    aput v15, v2, v13

    .line 200
    .line 201
    aput v8, v2, v17

    .line 202
    .line 203
    aput v9, v2, v14

    .line 204
    .line 205
    aput v10, v2, v6

    .line 206
    .line 207
    const/16 v6, 0x9

    .line 208
    .line 209
    aput v18, v2, v6

    .line 210
    .line 211
    const/16 v6, 0xa

    .line 212
    .line 213
    aput v8, v2, v6

    .line 214
    .line 215
    const/16 v6, 0xb

    .line 216
    .line 217
    aput v9, v2, v6

    .line 218
    .line 219
    const/16 v6, 0xc

    .line 220
    .line 221
    aput v10, v2, v6

    .line 222
    .line 223
    const/16 v6, 0xd

    .line 224
    .line 225
    aput v4, v2, v6

    .line 226
    .line 227
    const/16 v4, 0xe

    .line 228
    .line 229
    aput v8, v2, v4

    .line 230
    .line 231
    const/16 v4, 0xf

    .line 232
    .line 233
    aput v9, v2, v4

    .line 234
    .line 235
    iput-object v2, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->texData0:[F

    .line 236
    .line 237
    array-length v2, v5

    .line 238
    mul-int/2addr v2, v11

    .line 239
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 244
    .line 245
    .line 246
    move-result-object v4

    .line 247
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 248
    .line 249
    .line 250
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    iput-object v2, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 255
    .line 256
    invoke-virtual {v2, v5}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 257
    .line 258
    .line 259
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 260
    .line 261
    invoke-virtual {v0, v1}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 262
    .line 263
    .line 264
    invoke-static {v3, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 265
    .line 266
    .line 267
    const/high16 v0, -0x40800000    # -1.0f

    .line 268
    .line 269
    aput v0, v3, v1

    .line 270
    .line 271
    return-void

    .line 272
    nop

    .line 273
    :array_0
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x0s
        0x2s
        0x3s
    .end array-data

    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    :array_1
    .array-data 4
        0x3e4ccccd    # 0.2f
        0x3f35b5b6
        0x3f65e5e6
        0x3f800000    # 1.0f
    .end array-data

    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    :array_2
    .array-data 4
        0x0
        0x3e56d6d7
        0x3e4acacb
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private decodeOneFrameByImage(Ljava/lang/String;)Ll/umw;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mmcvImage:Ll/umw;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ll/umw;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mmcvImage:Ll/umw;

    .line 11
    .line 12
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mmcvImage:Ll/umw;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/umw;->a()[B

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mmcvImage:Ll/umw;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    mul-int/2addr v2, v3

    .line 35
    mul-int/lit8 v2, v2, 0x4

    .line 36
    .line 37
    new-array v2, v2, [B

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ll/umw;->g([B)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mmcvImage:Ll/umw;

    .line 46
    .line 47
    invoke-static {v0, p1}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mmcvImage:Ll/umw;

    .line 51
    .line 52
    return-object p0
.end method


# virtual methods
.method public bindShaderAttributes()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->bindShaderAttributes()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    const-string v1, "position2"

    .line 8
    .line 9
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public cancelDraw()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerBitmapCache:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerBitmapCache;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerBitmapCache:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public clearPoints()V
    .locals 0

    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->texture_in:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Ll/wej;->texture_in:I

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mmcvImage:Ll/umw;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mmcvImage:Ll/umw;

    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public draw()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->decorateHandler:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 11
    .line 12
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    int-to-float v2, v2

    .line 17
    div-float/2addr v1, v2

    .line 18
    const/high16 v2, 0x3f800000    # 1.0f

    .line 19
    .line 20
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->drawOrder:[S

    .line 24
    .line 25
    array-length v0, v0

    .line 26
    const/16 v1, 0x1403

    .line 27
    .line 28
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 29
    .line 30
    const/4 v3, 0x4

    .line 31
    invoke-static {v3, v0, v1, v2}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 32
    .line 33
    .line 34
    iget p0, p0, Ll/wej;->positionHandle:I

    .line 35
    .line 36
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public drawSub()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Ll/wej;->programHandle:I

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 16
    .line 17
    .line 18
    const/16 v0, 0x4100

    .line 19
    .line 20
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->currentParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 43
    .line 44
    iget v2, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 45
    .line 46
    iget v3, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 47
    .line 48
    new-instance v4, Landroid/graphics/PointF;

    .line 49
    .line 50
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->currentParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 51
    .line 52
    iget v1, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->cX:F

    .line 53
    .line 54
    iget v0, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->cY:F

    .line 55
    .line 56
    invoke-direct {v4, v1, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->currentParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 60
    .line 61
    iget v5, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 62
    .line 63
    iget-object v6, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points68:[F

    .line 64
    .line 65
    iget-object v7, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points96:[F

    .line 66
    .line 67
    iget-object v8, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points104:[F

    .line 68
    .line 69
    iget-object v9, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 70
    .line 71
    move-object v1, p0

    .line 72
    invoke-virtual/range {v1 .. v9}, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->setParamForMatrix(FFLandroid/graphics/PointF;F[F[F[FLcom/momo/mcamera/mask/FilterTriggerManager;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, v1, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mvpMatrix:[F

    .line 76
    .line 77
    if-eqz p0, :cond_0

    .line 78
    .line 79
    array-length v0, p0

    .line 80
    const/16 v2, 0x8

    .line 81
    .line 82
    if-ne v0, v2, :cond_0

    .line 83
    .line 84
    invoke-virtual {v1, p0}, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->passShaderValues([F)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->draw()V

    .line 88
    .line 89
    .line 90
    :cond_0
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;uniform sampler2D inputImageTexture0;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color2 = vec4(0.0,1.0,1.0,0.5);\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   outputColor.r = (color1.r * color1.a + color2.r * color2.a * (1.0 - color1.a))/a;\n   outputColor.g = (color1.g * color1.a + color2.g * color2.a * (1.0 - color1.a))/a;\n   outputColor.b = (color1.b * color1.a + color2.b * color2.a * (1.0 - color1.a))/a;\n   outputColor.a = a;\n   gl_FragColor = color1;\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; attribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

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
    iput v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->positionHandle2:I

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
    iput v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mVPMatrixHandler:I

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
    iput v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->decorateHandler:I

    .line 33
    .line 34
    return-void
.end method

.method public lockTexture()V
    .locals 0

    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 9

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mvpMatrix:[F

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->currentParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 11
    .line 12
    iget v1, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 13
    .line 14
    iget v2, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 15
    .line 16
    new-instance v3, Landroid/graphics/PointF;

    .line 17
    .line 18
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->currentParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 19
    .line 20
    iget p3, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->cX:F

    .line 21
    .line 22
    iget p1, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->cY:F

    .line 23
    .line 24
    invoke-direct {v3, p3, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->currentParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 28
    .line 29
    iget v4, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 30
    .line 31
    iget-object v5, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points68:[F

    .line 32
    .line 33
    iget-object v6, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points96:[F

    .line 34
    .line 35
    iget-object v7, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points104:[F

    .line 36
    .line 37
    iget-object v8, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 38
    .line 39
    move-object v0, p0

    .line 40
    invoke-virtual/range {v0 .. v8}, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->setParamForMatrix(FFLandroid/graphics/PointF;F[F[F[FLcom/momo/mcamera/mask/FilterTriggerManager;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move-object v0, p0

    .line 45
    :goto_0
    iget-boolean p0, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->lockTexture:Z

    .line 46
    .line 47
    if-eqz p0, :cond_2

    .line 48
    .line 49
    iget p0, v0, Ll/wej;->texture_in:I

    .line 50
    .line 51
    if-lez p0, :cond_2

    .line 52
    .line 53
    iget-object p0, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mvpMatrix:[F

    .line 54
    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    goto/16 :goto_2

    .line 58
    .line 59
    :cond_2
    iget-object p0, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mvpMatrix:[F

    .line 60
    .line 61
    const/4 p1, 0x0

    .line 62
    if-eqz p0, :cond_b

    .line 63
    .line 64
    iget-object p0, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 65
    .line 66
    iget-object p3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->context:Landroid/content/Context;

    .line 67
    .line 68
    iget v1, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerIndex:I

    .line 69
    .line 70
    invoke-virtual {p0, p3, v1}, Lcom/momo/mcamera/mask/Sticker;->getImagePathByIndex(Landroid/content/Context;I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->decodeOneFrameByImage(Ljava/lang/String;)Ll/umw;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const/4 p3, 0x1

    .line 79
    const/4 v1, 0x0

    .line 80
    if-eqz p0, :cond_3

    .line 81
    .line 82
    iput-object p0, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->curMMCVImage:Ll/umw;

    .line 83
    .line 84
    move v2, p3

    .line 85
    goto :goto_1

    .line 86
    :cond_3
    move v2, v1

    .line 87
    :goto_1
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->curMMCVImage:Ll/umw;

    .line 88
    .line 89
    if-eqz v3, :cond_5

    .line 90
    .line 91
    if-eqz v3, :cond_5

    .line 92
    .line 93
    invoke-virtual {v3}, Ll/umw;->a()[B

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    array-length v3, v3

    .line 98
    if-lez v3, :cond_5

    .line 99
    .line 100
    if-eqz v2, :cond_c

    .line 101
    .line 102
    iget p0, v0, Ll/wej;->texture_in:I

    .line 103
    .line 104
    iget-object p1, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->curMMCVImage:Ll/umw;

    .line 105
    .line 106
    if-nez p0, :cond_4

    .line 107
    .line 108
    invoke-static {p1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    iput p0, v0, Ll/wej;->texture_in:I

    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_4
    invoke-static {p0, p1}, Lcom/core/glcore/util/TextureHelper;->loadDataToTexture(ILl/umw;)I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    iput p0, v0, Ll/wej;->texture_in:I

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_5
    iget-object v2, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->curMMCVImage:Ll/umw;

    .line 123
    .line 124
    if-eqz v2, :cond_6

    .line 125
    .line 126
    iput-object p1, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->curMMCVImage:Ll/umw;

    .line 127
    .line 128
    :cond_6
    if-nez p0, :cond_a

    .line 129
    .line 130
    iget-object p0, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->imageDelegateProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 131
    .line 132
    if-eqz p0, :cond_a

    .line 133
    .line 134
    iget-object p0, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerBitmapCache:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 135
    .line 136
    if-eqz p0, :cond_7

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBitmapCache;->getRealBitmap()Landroid/graphics/Bitmap;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    :cond_7
    if-eqz p1, :cond_9

    .line 143
    .line 144
    iget p0, v0, Ll/wej;->texture_in:I

    .line 145
    .line 146
    if-eqz p0, :cond_8

    .line 147
    .line 148
    filled-new-array {p0}, [I

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-static {p3, p0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 153
    .line 154
    .line 155
    iput v1, v0, Ll/wej;->texture_in:I

    .line 156
    .line 157
    :cond_8
    invoke-static {p1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    iput p0, v0, Ll/wej;->texture_in:I

    .line 162
    .line 163
    goto :goto_2

    .line 164
    :cond_9
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->clearPoints()V

    .line 165
    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_a
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->clearPoints()V

    .line 169
    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_b
    iput-object p1, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mvpMatrix:[F

    .line 173
    .line 174
    :cond_c
    :goto_2
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    invoke-virtual {v0, p0}, Ll/wej;->setWidth(I)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    invoke-virtual {v0, p0}, Ll/wej;->setHeight(I)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0}, Ll/wej;->getWidth()I

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    int-to-float p0, p0

    .line 193
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    int-to-float p1, p1

    .line 198
    div-float/2addr p0, p1

    .line 199
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mProjectionMatrix:[F

    .line 200
    .line 201
    const/high16 p1, -0x40800000    # -1.0f

    .line 202
    .line 203
    div-float v5, p1, p0

    .line 204
    .line 205
    const/high16 p1, 0x3f800000    # 1.0f

    .line 206
    .line 207
    div-float v6, p1, p0

    .line 208
    .line 209
    const/high16 v7, 0x40400000    # 3.0f

    .line 210
    .line 211
    const/high16 v8, 0x40e00000    # 7.0f

    .line 212
    .line 213
    const/4 v2, 0x0

    .line 214
    const/high16 v3, -0x40800000    # -1.0f

    .line 215
    .line 216
    const/high16 v4, 0x3f800000    # 1.0f

    .line 217
    .line 218
    invoke-static/range {v1 .. v8}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0}, Ll/wej;->onDrawFrame()V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 225
    .line 226
    .line 227
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
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

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
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

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
    iget v8, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->positionHandle2:I

    .line 49
    .line 50
    const/16 v12, 0x8

    .line 51
    .line 52
    iget-object v13, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

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
    iget p1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->positionHandle2:I

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
    if-ltz v2, :cond_0

    .line 83
    .line 84
    iget-object p1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 85
    .line 86
    iget v0, p0, Ll/wej;->curRotation:I

    .line 87
    .line 88
    aget-object v7, p1, v0

    .line 89
    .line 90
    const/4 v3, 0x2

    .line 91
    const/16 v4, 0x1406

    .line 92
    .line 93
    const/4 v5, 0x0

    .line 94
    const/16 v6, 0x8

    .line 95
    .line 96
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 97
    .line 98
    .line 99
    iget p1, p0, Ll/wej;->texCoordHandle:I

    .line 100
    .line 101
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 102
    .line 103
    .line 104
    :cond_0
    const p1, 0x84c0

    .line 105
    .line 106
    .line 107
    invoke-static {p1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 108
    .line 109
    .line 110
    const/16 p1, 0xde1

    .line 111
    .line 112
    iget v0, p0, Ll/wej;->texture_in:I

    .line 113
    .line 114
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 115
    .line 116
    .line 117
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 118
    .line 119
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public pauseBitmapCache()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerBitmapCache:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBitmapCache;->pauseCache()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    monitor-enter v2

    .line 10
    :try_start_0
    iput-object v1, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 11
    .line 12
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerBitmapCache:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->cancelDraw()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto/16 :goto_1

    .line 22
    .line 23
    :cond_0
    :goto_0
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 24
    .line 25
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    int-to-float v3, v3

    .line 30
    iget-object v4, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 31
    .line 32
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    int-to-float v4, v4

    .line 37
    div-float/2addr v3, v4

    .line 38
    iput v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerScale:F

    .line 39
    .line 40
    const/high16 v4, 0x3f000000    # 0.5f

    .line 41
    .line 42
    mul-float v5, v3, v4

    .line 43
    .line 44
    const/high16 v6, -0x41000000    # -0.5f

    .line 45
    .line 46
    mul-float v7, v6, v3

    .line 47
    .line 48
    mul-float v8, v6, v3

    .line 49
    .line 50
    mul-float v9, v3, v4

    .line 51
    .line 52
    const/16 v10, 0x8

    .line 53
    .line 54
    new-array v11, v10, [F

    .line 55
    .line 56
    const/4 v12, 0x0

    .line 57
    aput v6, v11, v12

    .line 58
    .line 59
    const/4 v13, 0x1

    .line 60
    aput v5, v11, v13

    .line 61
    .line 62
    const/4 v5, 0x2

    .line 63
    aput v6, v11, v5

    .line 64
    .line 65
    const/4 v14, 0x3

    .line 66
    aput v7, v11, v14

    .line 67
    .line 68
    const/4 v7, 0x4

    .line 69
    aput v4, v11, v7

    .line 70
    .line 71
    const/4 v15, 0x5

    .line 72
    aput v8, v11, v15

    .line 73
    .line 74
    const/4 v8, 0x6

    .line 75
    aput v4, v11, v8

    .line 76
    .line 77
    const/16 v16, 0x7

    .line 78
    .line 79
    aput v9, v11, v16

    .line 80
    .line 81
    mul-float v9, v3, v4

    .line 82
    .line 83
    mul-float v17, v6, v3

    .line 84
    .line 85
    mul-float v18, v6, v3

    .line 86
    .line 87
    mul-float/2addr v3, v4

    .line 88
    move/from16 v19, v4

    .line 89
    .line 90
    const/16 v4, 0x10

    .line 91
    .line 92
    new-array v4, v4, [F

    .line 93
    .line 94
    aput v6, v4, v12

    .line 95
    .line 96
    aput v9, v4, v13

    .line 97
    .line 98
    const/4 v9, 0x0

    .line 99
    aput v9, v4, v5

    .line 100
    .line 101
    const/high16 v13, 0x3f800000    # 1.0f

    .line 102
    .line 103
    aput v13, v4, v14

    .line 104
    .line 105
    aput v6, v4, v7

    .line 106
    .line 107
    aput v17, v4, v15

    .line 108
    .line 109
    aput v9, v4, v8

    .line 110
    .line 111
    aput v13, v4, v16

    .line 112
    .line 113
    aput v19, v4, v10

    .line 114
    .line 115
    const/16 v6, 0x9

    .line 116
    .line 117
    aput v18, v4, v6

    .line 118
    .line 119
    const/16 v6, 0xa

    .line 120
    .line 121
    aput v9, v4, v6

    .line 122
    .line 123
    const/16 v6, 0xb

    .line 124
    .line 125
    aput v13, v4, v6

    .line 126
    .line 127
    const/16 v6, 0xc

    .line 128
    .line 129
    aput v19, v4, v6

    .line 130
    .line 131
    const/16 v6, 0xd

    .line 132
    .line 133
    aput v3, v4, v6

    .line 134
    .line 135
    const/16 v3, 0xe

    .line 136
    .line 137
    aput v9, v4, v3

    .line 138
    .line 139
    const/16 v3, 0xf

    .line 140
    .line 141
    aput v13, v4, v3

    .line 142
    .line 143
    iput-object v4, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->texData0:[F

    .line 144
    .line 145
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 146
    .line 147
    if-eqz v3, :cond_1

    .line 148
    .line 149
    invoke-virtual {v3}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 150
    .line 151
    .line 152
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 153
    .line 154
    invoke-virtual {v3}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 155
    .line 156
    .line 157
    :cond_1
    const/16 v3, 0x20

    .line 158
    .line 159
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 175
    .line 176
    invoke-virtual {v3, v11}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 177
    .line 178
    .line 179
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 180
    .line 181
    invoke-virtual {v3, v12}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 182
    .line 183
    .line 184
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->drawOrder:[S

    .line 185
    .line 186
    array-length v3, v3

    .line 187
    mul-int/2addr v3, v5

    .line 188
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 204
    .line 205
    iget-object v4, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->drawOrder:[S

    .line 206
    .line 207
    invoke-virtual {v3, v4}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 208
    .line 209
    .line 210
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 211
    .line 212
    invoke-virtual {v3, v12}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 213
    .line 214
    .line 215
    new-instance v3, Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 216
    .line 217
    iget-object v4, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->context:Landroid/content/Context;

    .line 218
    .line 219
    iget-object v5, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->imageDelegateProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 220
    .line 221
    invoke-direct {v3, v1, v4, v5}, Lcom/momo/mcamera/mask/StickerBitmapCache;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;)V

    .line 222
    .line 223
    .line 224
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerBitmapCache:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 225
    .line 226
    monitor-exit v2

    .line 227
    return-void

    .line 228
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 229
    throw v0
.end method

.method public resumeBitmapCache()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerBitmapCache:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBitmapCache;->resumeCache()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    new-instance v1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 12
    .line 13
    iput-object v2, v1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 14
    .line 15
    iget v2, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 16
    .line 17
    iput v2, v1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 18
    .line 19
    iget v2, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 20
    .line 21
    iput v2, v1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 22
    .line 23
    iget v2, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 24
    .line 25
    iput v2, v1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 26
    .line 27
    iget-object p1, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 28
    .line 29
    iget v2, p1, Landroid/graphics/PointF;->x:F

    .line 30
    .line 31
    iput v2, v1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->cX:F

    .line 32
    .line 33
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 34
    .line 35
    iput p1, v1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->cY:F

    .line 36
    .line 37
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->currentParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 38
    .line 39
    monitor-exit v0

    .line 40
    return-void

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    throw p0
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setParamForMatrix(FFLandroid/graphics/PointF;F[F[F[FLcom/momo/mcamera/mask/FilterTriggerManager;)V
    .locals 7

    .line 1
    iget-object p5, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p5

    .line 4
    :try_start_0
    iget-object p6, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->currentParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 5
    .line 6
    if-nez p6, :cond_0

    .line 7
    .line 8
    monitor-exit p5

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    move-object p0, v0

    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :cond_0
    iget p6, p3, Landroid/graphics/PointF;->x:F

    .line 15
    .line 16
    const/high16 p7, 0x40000000    # 2.0f

    .line 17
    .line 18
    mul-float/2addr p6, p7

    .line 19
    const/high16 p8, 0x3f800000    # 1.0f

    .line 20
    .line 21
    sub-float/2addr p6, p8

    .line 22
    neg-float p6, p6

    .line 23
    iget v0, p3, Landroid/graphics/PointF;->y:F

    .line 24
    .line 25
    neg-float v0, v0

    .line 26
    mul-float/2addr v0, p7

    .line 27
    add-float/2addr v0, p8

    .line 28
    iput p6, p3, Landroid/graphics/PointF;->x:F

    .line 29
    .line 30
    iput v0, p3, Landroid/graphics/PointF;->y:F

    .line 31
    .line 32
    const/16 p3, 0x10

    .line 33
    .line 34
    new-array v1, p3, [F

    .line 35
    .line 36
    new-array p3, p3, [F

    .line 37
    .line 38
    const/4 p7, 0x0

    .line 39
    invoke-static {p3, p7}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 40
    .line 41
    .line 42
    neg-float p6, p6

    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-static {p3, p7, p6, v0, v2}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 45
    .line 46
    .line 47
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mViewMatrix:[F

    .line 48
    .line 49
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mProjectionMatrix:[F

    .line 50
    .line 51
    const/4 v6, 0x0

    .line 52
    const/4 v2, 0x0

    .line 53
    const/4 v4, 0x0

    .line 54
    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 55
    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    const/4 v6, 0x0

    .line 59
    const/4 v2, 0x0

    .line 60
    move-object v5, v1

    .line 61
    move-object v3, p3

    .line 62
    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 63
    .line 64
    .line 65
    const/4 v5, 0x0

    .line 66
    const/high16 v6, 0x3f800000    # 1.0f

    .line 67
    .line 68
    const/4 v2, 0x0

    .line 69
    const/4 v4, 0x0

    .line 70
    move v3, p4

    .line 71
    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 72
    .line 73
    .line 74
    mul-float/2addr p1, p8

    .line 75
    mul-float/2addr p2, p8

    .line 76
    invoke-static {v1, p7, p1, p2, p8}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 77
    .line 78
    .line 79
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->texData0:[F

    .line 80
    .line 81
    const/4 v6, 0x0

    .line 82
    const/4 v2, 0x0

    .line 83
    const/4 v4, 0x0

    .line 84
    move-object v3, v1

    .line 85
    move-object v1, p3

    .line 86
    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 87
    .line 88
    .line 89
    aget p1, p3, p7

    .line 90
    .line 91
    const/4 p2, 0x1

    .line 92
    aget p4, p3, p2

    .line 93
    .line 94
    const/4 p6, 0x4

    .line 95
    aget p8, p3, p6

    .line 96
    .line 97
    const/4 v0, 0x5

    .line 98
    aget v1, p3, v0

    .line 99
    .line 100
    const/16 v2, 0x8

    .line 101
    .line 102
    aget v3, p3, v2

    .line 103
    .line 104
    const/16 v4, 0x9

    .line 105
    .line 106
    aget v4, p3, v4

    .line 107
    .line 108
    const/16 v5, 0xc

    .line 109
    .line 110
    aget v5, p3, v5

    .line 111
    .line 112
    const/16 v6, 0xd

    .line 113
    .line 114
    aget p3, p3, v6

    .line 115
    .line 116
    new-array v2, v2, [F

    .line 117
    .line 118
    aput p1, v2, p7

    .line 119
    .line 120
    aput p4, v2, p2

    .line 121
    .line 122
    const/4 p1, 0x2

    .line 123
    aput p8, v2, p1

    .line 124
    .line 125
    const/4 p1, 0x3

    .line 126
    aput v1, v2, p1

    .line 127
    .line 128
    aput v3, v2, p6

    .line 129
    .line 130
    aput v4, v2, v0

    .line 131
    .line 132
    const/4 p1, 0x6

    .line 133
    aput v5, v2, p1

    .line 134
    .line 135
    const/4 p1, 0x7

    .line 136
    aput p3, v2, p1

    .line 137
    .line 138
    iput-object v2, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->mvpMatrix:[F

    .line 139
    .line 140
    monitor-exit p5

    .line 141
    return-void

    .line 142
    :goto_0
    monitor-exit p5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    throw p0
.end method

.method public setTextId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->textId:I

    .line 2
    .line 3
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->startTime:J

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    iput-wide p1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->startTime:J

    .line 8
    .line 9
    :cond_0
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->startTime:J

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iput-wide p1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->startTime:J

    .line 18
    .line 19
    :cond_1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->startTime:J

    .line 20
    .line 21
    sub-long/2addr p1, v0

    .line 22
    const/16 v0, 0x3e8

    .line 23
    .line 24
    iget v1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->frameRate:I

    .line 25
    .line 26
    div-int/2addr v0, v1

    .line 27
    int-to-long v0, v0

    .line 28
    div-long/2addr p1, v0

    .line 29
    long-to-int p1, p1

    .line 30
    iget p2, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerCount:I

    .line 31
    .line 32
    rem-int/2addr p1, p2

    .line 33
    iput p1, p0, Lcom/momo/mcamera/mask/StickerHaniMaskFilter;->stickerIndex:I

    .line 34
    .line 35
    return-void
.end method

.method public unlockTexture()V
    .locals 0

    return-void
.end method
