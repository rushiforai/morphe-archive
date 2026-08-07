.class public Lcom/momo/mcamera/mask/StickerMaskFilter;
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

.field private decorateHandler:I

.field private drawListBuffer:Ljava/nio/ShortBuffer;

.field private final drawOrder:[S

.field private final fragmentShaderCode:Ljava/lang/String;

.field private fvertexBuffer:Ljava/nio/FloatBuffer;

.field private imagePath:Ljava/lang/String;

.field private isDraw:Z

.field private isPlaying:Z

.field private lockTexture:Z

.field protected final mProjectionMatrix:[F

.field private mVPMatrixHandler:I

.field protected final mViewMatrix:[F

.field protected maskListLock:Ljava/lang/Object;

.field private mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

.field mvpLists:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[F>;"
        }
    .end annotation
.end field

.field mvpMatrix:[F

.field protected positionHandle2:I

.field protected sticker:Lcom/momo/mcamera/mask/Sticker;

.field stickerScale:F

.field texData0:[F

.field textId:I

.field private vertexBuffer:Ljava/nio/FloatBuffer;

.field private final vertexShaderCode:Ljava/lang/String;

.field private final vertexStride:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v3, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; attribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 11
    .line 12
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->vertexShaderCode:Ljava/lang/String;

    .line 13
    .line 14
    const-string v3, "precision mediump float;uniform sampler2D inputImageTexture;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture,textureCoordinate);\n   gl_FragColor = color1;\n}"

    .line 15
    .line 16
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->fragmentShaderCode:Ljava/lang/String;

    .line 17
    .line 18
    const/16 v3, 0x10

    .line 19
    .line 20
    new-array v4, v3, [F

    .line 21
    .line 22
    iput-object v4, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mProjectionMatrix:[F

    .line 23
    .line 24
    new-array v4, v3, [F

    .line 25
    .line 26
    iput-object v4, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mViewMatrix:[F

    .line 27
    .line 28
    const/4 v5, 0x6

    .line 29
    new-array v6, v5, [S

    .line 30
    .line 31
    fill-array-data v6, :array_0

    .line 32
    .line 33
    .line 34
    iput-object v6, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->drawOrder:[S

    .line 35
    .line 36
    const/16 v7, 0x8

    .line 37
    .line 38
    iput v7, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->vertexStride:I

    .line 39
    .line 40
    new-instance v8, Ljava/lang/Object;

    .line 41
    .line 42
    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v8, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 46
    .line 47
    const/4 v8, 0x4

    .line 48
    new-array v9, v8, [F

    .line 49
    .line 50
    fill-array-data v9, :array_1

    .line 51
    .line 52
    .line 53
    iput-object v9, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->color:[F

    .line 54
    .line 55
    new-array v9, v8, [F

    .line 56
    .line 57
    fill-array-data v9, :array_2

    .line 58
    .line 59
    .line 60
    iput-object v9, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->color2:[F

    .line 61
    .line 62
    new-instance v9, Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v9}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v9

    .line 71
    iput-object v9, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 72
    .line 73
    const/4 v9, 0x0

    .line 74
    iput-boolean v9, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->lockTexture:Z

    .line 75
    .line 76
    iput-object v2, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 77
    .line 78
    iput-object v1, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->context:Landroid/content/Context;

    .line 79
    .line 80
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 81
    .line 82
    .line 83
    move-result v10

    .line 84
    int-to-float v10, v10

    .line 85
    iget-object v11, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 86
    .line 87
    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 88
    .line 89
    .line 90
    move-result v11

    .line 91
    int-to-float v11, v11

    .line 92
    div-float/2addr v10, v11

    .line 93
    iput v10, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->stickerScale:F

    .line 94
    .line 95
    const/high16 v11, 0x3f000000    # 0.5f

    .line 96
    .line 97
    mul-float v12, v10, v11

    .line 98
    .line 99
    const/high16 v13, -0x41000000    # -0.5f

    .line 100
    .line 101
    mul-float v14, v13, v10

    .line 102
    .line 103
    mul-float v15, v13, v10

    .line 104
    .line 105
    mul-float/2addr v10, v11

    .line 106
    move/from16 p3, v5

    .line 107
    .line 108
    new-array v5, v7, [F

    .line 109
    .line 110
    aput v13, v5, v9

    .line 111
    .line 112
    move/from16 v16, v7

    .line 113
    .line 114
    const/4 v7, 0x1

    .line 115
    aput v12, v5, v7

    .line 116
    .line 117
    const/4 v12, 0x2

    .line 118
    aput v13, v5, v12

    .line 119
    .line 120
    const/16 v17, 0x3

    .line 121
    .line 122
    aput v14, v5, v17

    .line 123
    .line 124
    aput v11, v5, v8

    .line 125
    .line 126
    const/4 v14, 0x5

    .line 127
    aput v15, v5, v14

    .line 128
    .line 129
    aput v11, v5, p3

    .line 130
    .line 131
    const/4 v15, 0x7

    .line 132
    aput v10, v5, v15

    .line 133
    .line 134
    new-instance v10, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 135
    .line 136
    invoke-direct {v10, v2, v1}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 137
    .line 138
    .line 139
    iput-object v10, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 140
    .line 141
    iput-boolean v7, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->isPlaying:Z

    .line 142
    .line 143
    const/16 v1, 0x20

    .line 144
    .line 145
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    iput-object v1, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 161
    .line 162
    invoke-virtual {v1, v5}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 163
    .line 164
    .line 165
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 166
    .line 167
    invoke-virtual {v1, v9}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 168
    .line 169
    .line 170
    iget v1, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->stickerScale:F

    .line 171
    .line 172
    mul-float v2, v1, v11

    .line 173
    .line 174
    mul-float v5, v13, v1

    .line 175
    .line 176
    mul-float v10, v13, v1

    .line 177
    .line 178
    mul-float/2addr v1, v11

    .line 179
    new-array v3, v3, [F

    .line 180
    .line 181
    aput v13, v3, v9

    .line 182
    .line 183
    aput v2, v3, v7

    .line 184
    .line 185
    const/4 v2, 0x0

    .line 186
    aput v2, v3, v12

    .line 187
    .line 188
    const/high16 v7, 0x3f800000    # 1.0f

    .line 189
    .line 190
    aput v7, v3, v17

    .line 191
    .line 192
    aput v13, v3, v8

    .line 193
    .line 194
    aput v5, v3, v14

    .line 195
    .line 196
    aput v2, v3, p3

    .line 197
    .line 198
    aput v7, v3, v15

    .line 199
    .line 200
    aput v11, v3, v16

    .line 201
    .line 202
    const/16 v5, 0x9

    .line 203
    .line 204
    aput v10, v3, v5

    .line 205
    .line 206
    const/16 v5, 0xa

    .line 207
    .line 208
    aput v2, v3, v5

    .line 209
    .line 210
    const/16 v5, 0xb

    .line 211
    .line 212
    aput v7, v3, v5

    .line 213
    .line 214
    const/16 v5, 0xc

    .line 215
    .line 216
    aput v11, v3, v5

    .line 217
    .line 218
    const/16 v5, 0xd

    .line 219
    .line 220
    aput v1, v3, v5

    .line 221
    .line 222
    const/16 v1, 0xe

    .line 223
    .line 224
    aput v2, v3, v1

    .line 225
    .line 226
    const/16 v1, 0xf

    .line 227
    .line 228
    aput v7, v3, v1

    .line 229
    .line 230
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->texData0:[F

    .line 231
    .line 232
    array-length v1, v6

    .line 233
    mul-int/2addr v1, v12

    .line 234
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    iput-object v1, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 250
    .line 251
    invoke-virtual {v1, v6}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 252
    .line 253
    .line 254
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 255
    .line 256
    invoke-virtual {v1, v9}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 257
    .line 258
    .line 259
    invoke-static {v4, v9}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 260
    .line 261
    .line 262
    const/high16 v1, -0x40800000    # -1.0f

    .line 263
    .line 264
    aput v1, v4, v9

    .line 265
    .line 266
    iput-boolean v9, v0, Ll/gfj;->useCache:Z

    .line 267
    .line 268
    return-void

    .line 269
    :array_0
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x0s
        0x2s
        0x3s
    .end array-data

    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    :array_1
    .array-data 4
        0x3e4ccccd    # 0.2f
        0x3f35b5b6
        0x3f65e5e6
        0x3f800000    # 1.0f
    .end array-data

    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    :array_2
    .array-data 4
        0x0
        0x3e56d6d7
        0x3e4acacb
        0x3f800000    # 1.0f
    .end array-data
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

.method public cancelDraw()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->isDraw:Z

    .line 8
    .line 9
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->isPlaying:Z

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MmcvImageLoader;->cancel()V

    .line 14
    .line 15
    .line 16
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public clearPoints()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->clear()V

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

.method public deleteTexture()V
    .locals 3

    .line 1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    filled-new-array {v0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 12
    .line 13
    .line 14
    iput v2, p0, Ll/wej;->texture_in:I

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerMaskFilter;->deleteTexture()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public draw()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->decorateHandler:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

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
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

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
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->drawOrder:[S

    .line 24
    .line 25
    array-length v0, v0

    .line 26
    const/16 v1, 0x1403

    .line 27
    .line 28
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

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
    .locals 4

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
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 43
    .line 44
    monitor-enter v0

    .line 45
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_0

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, [F

    .line 62
    .line 63
    invoke-virtual {p0, v2}, Lcom/momo/mcamera/mask/StickerMaskFilter;->passShaderValues([F)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerMaskFilter;->draw()V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catchall_0
    move-exception p0

    .line 71
    goto :goto_1

    .line 72
    :cond_0
    monitor-exit v0

    .line 73
    return-void

    .line 74
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    throw p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;uniform sampler2D inputImageTexture;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture,textureCoordinate);\n   gl_FragColor = color1;\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getImagePathName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->imagePath:Ljava/lang/String;

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
    iput v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->positionHandle2:I

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
    iput v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mVPMatrixHandler:I

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
    iput v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->decorateHandler:I

    .line 33
    .line 34
    return-void
.end method

.method public lockTexture()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x1

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->lockTexture:Z

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

.method public newTextureReady(ILl/gfj;Z)V
    .locals 8

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->lockTexture:Z

    .line 7
    .line 8
    const/4 p3, 0x1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget p1, p0, Ll/wej;->texture_in:I

    .line 12
    .line 13
    if-lez p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-lez p1, :cond_1

    .line 24
    .line 25
    iput-boolean p3, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->isDraw:Z

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 29
    .line 30
    if-eqz p1, :cond_8

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-lez p1, :cond_8

    .line 37
    .line 38
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->isDraw:Z

    .line 39
    .line 40
    if-nez p1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerMaskFilter;->clearPoints()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->isPlaying:Z

    .line 47
    .line 48
    if-eqz p1, :cond_6

    .line 49
    .line 50
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->context:Landroid/content/Context;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->getMmcvImage(Landroid/content/Context;)Ll/umw;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/momo/mcamera/mask/MmcvImageLoader;->imagePath:Ljava/lang/String;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->imagePath:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz p1, :cond_4

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/umw;->a()[B

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    iget v0, p0, Ll/wej;->texture_in:I

    .line 73
    .line 74
    if-nez v0, :cond_3

    .line 75
    .line 76
    invoke-static {p1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iput p1, p0, Ll/wej;->texture_in:I

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    invoke-static {v0, p1}, Lcom/core/glcore/util/TextureHelper;->loadDataToTexture(ILl/umw;)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput p1, p0, Ll/wej;->texture_in:I

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_4
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getDelegateBitmap()Landroid/graphics/Bitmap;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    if-eqz p1, :cond_5

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerMaskFilter;->deleteTexture()V

    .line 99
    .line 100
    .line 101
    invoke-static {p1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iput p1, p0, Ll/wej;->texture_in:I

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerMaskFilter;->clearPoints()V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_6
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerMaskFilter;->deleteTexture()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerMaskFilter;->clearPoints()V

    .line 116
    .line 117
    .line 118
    :goto_0
    iget p1, p0, Ll/wej;->texture_in:I

    .line 119
    .line 120
    if-nez p1, :cond_7

    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerMaskFilter;->clearPoints()V

    .line 123
    .line 124
    .line 125
    :cond_7
    iput-boolean p3, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->isDraw:Z

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_8
    const/4 p1, 0x0

    .line 129
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->isDraw:Z

    .line 130
    .line 131
    :goto_1
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    int-to-float p1, p1

    .line 150
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 151
    .line 152
    .line 153
    move-result p3

    .line 154
    int-to-float p3, p3

    .line 155
    div-float/2addr p1, p3

    .line 156
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mProjectionMatrix:[F

    .line 157
    .line 158
    const/high16 p3, -0x40800000    # -1.0f

    .line 159
    .line 160
    div-float v4, p3, p1

    .line 161
    .line 162
    const/high16 p3, 0x3f800000    # 1.0f

    .line 163
    .line 164
    div-float v5, p3, p1

    .line 165
    .line 166
    const/high16 v6, 0x40400000    # 3.0f

    .line 167
    .line 168
    const/high16 v7, 0x40e00000    # 7.0f

    .line 169
    .line 170
    const/4 v1, 0x0

    .line 171
    const/high16 v2, -0x40800000    # -1.0f

    .line 172
    .line 173
    const/high16 v3, 0x3f800000    # 1.0f

    .line 174
    .line 175
    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 182
    .line 183
    .line 184
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
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

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
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

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
    iget v8, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->positionHandle2:I

    .line 49
    .line 50
    const/16 v12, 0x8

    .line 51
    .line 52
    iget-object v13, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

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
    iget p1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->positionHandle2:I

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

.method public pauseBitmapCache()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->isPlaying:Z

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
    iput-object v1, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerMaskFilter;->cancelDraw()V

    .line 13
    .line 14
    .line 15
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 16
    .line 17
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    int-to-float v3, v3

    .line 22
    iget-object v4, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 23
    .line 24
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    int-to-float v4, v4

    .line 29
    div-float/2addr v3, v4

    .line 30
    iput v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->stickerScale:F

    .line 31
    .line 32
    const/high16 v4, 0x3f000000    # 0.5f

    .line 33
    .line 34
    mul-float v5, v3, v4

    .line 35
    .line 36
    const/high16 v6, -0x41000000    # -0.5f

    .line 37
    .line 38
    mul-float v7, v6, v3

    .line 39
    .line 40
    mul-float v8, v6, v3

    .line 41
    .line 42
    mul-float v9, v3, v4

    .line 43
    .line 44
    const/16 v10, 0x8

    .line 45
    .line 46
    new-array v11, v10, [F

    .line 47
    .line 48
    const/4 v12, 0x0

    .line 49
    aput v6, v11, v12

    .line 50
    .line 51
    const/4 v13, 0x1

    .line 52
    aput v5, v11, v13

    .line 53
    .line 54
    const/4 v5, 0x2

    .line 55
    aput v6, v11, v5

    .line 56
    .line 57
    const/4 v14, 0x3

    .line 58
    aput v7, v11, v14

    .line 59
    .line 60
    const/4 v7, 0x4

    .line 61
    aput v4, v11, v7

    .line 62
    .line 63
    const/4 v15, 0x5

    .line 64
    aput v8, v11, v15

    .line 65
    .line 66
    const/4 v8, 0x6

    .line 67
    aput v4, v11, v8

    .line 68
    .line 69
    const/16 v16, 0x7

    .line 70
    .line 71
    aput v9, v11, v16

    .line 72
    .line 73
    mul-float v9, v3, v4

    .line 74
    .line 75
    mul-float v17, v6, v3

    .line 76
    .line 77
    mul-float v18, v6, v3

    .line 78
    .line 79
    mul-float/2addr v3, v4

    .line 80
    move/from16 v19, v4

    .line 81
    .line 82
    const/16 v4, 0x10

    .line 83
    .line 84
    new-array v4, v4, [F

    .line 85
    .line 86
    aput v6, v4, v12

    .line 87
    .line 88
    aput v9, v4, v13

    .line 89
    .line 90
    const/4 v9, 0x0

    .line 91
    aput v9, v4, v5

    .line 92
    .line 93
    const/high16 v13, 0x3f800000    # 1.0f

    .line 94
    .line 95
    aput v13, v4, v14

    .line 96
    .line 97
    aput v6, v4, v7

    .line 98
    .line 99
    aput v17, v4, v15

    .line 100
    .line 101
    aput v9, v4, v8

    .line 102
    .line 103
    aput v13, v4, v16

    .line 104
    .line 105
    aput v19, v4, v10

    .line 106
    .line 107
    const/16 v6, 0x9

    .line 108
    .line 109
    aput v18, v4, v6

    .line 110
    .line 111
    const/16 v6, 0xa

    .line 112
    .line 113
    aput v9, v4, v6

    .line 114
    .line 115
    const/16 v6, 0xb

    .line 116
    .line 117
    aput v13, v4, v6

    .line 118
    .line 119
    const/16 v6, 0xc

    .line 120
    .line 121
    aput v19, v4, v6

    .line 122
    .line 123
    const/16 v6, 0xd

    .line 124
    .line 125
    aput v3, v4, v6

    .line 126
    .line 127
    const/16 v3, 0xe

    .line 128
    .line 129
    aput v9, v4, v3

    .line 130
    .line 131
    const/16 v3, 0xf

    .line 132
    .line 133
    aput v13, v4, v3

    .line 134
    .line 135
    iput-object v4, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->texData0:[F

    .line 136
    .line 137
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 138
    .line 139
    if-eqz v3, :cond_0

    .line 140
    .line 141
    invoke-virtual {v3}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 142
    .line 143
    .line 144
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 145
    .line 146
    invoke-virtual {v3}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 147
    .line 148
    .line 149
    goto :goto_0

    .line 150
    :catchall_0
    move-exception v0

    .line 151
    goto :goto_1

    .line 152
    :cond_0
    :goto_0
    const/16 v3, 0x20

    .line 153
    .line 154
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 170
    .line 171
    invoke-virtual {v3, v11}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 172
    .line 173
    .line 174
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 175
    .line 176
    invoke-virtual {v3, v12}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 177
    .line 178
    .line 179
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->drawOrder:[S

    .line 180
    .line 181
    array-length v3, v3

    .line 182
    mul-int/2addr v3, v5

    .line 183
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 199
    .line 200
    iget-object v4, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->drawOrder:[S

    .line 201
    .line 202
    invoke-virtual {v3, v4}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 203
    .line 204
    .line 205
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 206
    .line 207
    invoke-virtual {v3, v12}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 208
    .line 209
    .line 210
    new-instance v3, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 211
    .line 212
    iget-object v4, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->context:Landroid/content/Context;

    .line 213
    .line 214
    invoke-direct {v3, v1, v4}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 215
    .line 216
    .line 217
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 218
    .line 219
    monitor-exit v2

    .line 220
    return-void

    .line 221
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 222
    throw v0
.end method

.method public resumeBitmapCache()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x1

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->isPlaying:Z

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

.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 9

    .line 1
    iget v1, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 2
    .line 3
    iget v2, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 4
    .line 5
    iget-object v3, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 6
    .line 7
    iget v4, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 8
    .line 9
    iget-object v5, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points68:[F

    .line 10
    .line 11
    iget-object v6, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points96:[F

    .line 12
    .line 13
    iget-object v7, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points104:[F

    .line 14
    .line 15
    iget-object v8, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 16
    .line 17
    move-object v0, p0

    .line 18
    invoke-virtual/range {v0 .. v8}, Lcom/momo/mcamera/mask/StickerMaskFilter;->setParamForMatrix(FFLandroid/graphics/PointF;F[F[F[FLcom/momo/mcamera/mask/FilterTriggerManager;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setParamForMatrix(FFLandroid/graphics/PointF;F[F[F[FLcom/momo/mcamera/mask/FilterTriggerManager;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v3

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    :try_start_0
    monitor-exit v3

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_0
    iget v4, v2, Landroid/graphics/PointF;->x:F

    .line 18
    .line 19
    const/high16 v5, 0x40000000    # 2.0f

    .line 20
    .line 21
    mul-float/2addr v4, v5

    .line 22
    const/high16 v6, 0x3f800000    # 1.0f

    .line 23
    .line 24
    sub-float/2addr v4, v6

    .line 25
    neg-float v4, v4

    .line 26
    iget v7, v2, Landroid/graphics/PointF;->y:F

    .line 27
    .line 28
    neg-float v7, v7

    .line 29
    mul-float/2addr v7, v5

    .line 30
    add-float/2addr v7, v6

    .line 31
    iput v4, v2, Landroid/graphics/PointF;->x:F

    .line 32
    .line 33
    iput v7, v2, Landroid/graphics/PointF;->y:F

    .line 34
    .line 35
    const/16 v2, 0x10

    .line 36
    .line 37
    new-array v8, v2, [F

    .line 38
    .line 39
    new-array v2, v2, [F

    .line 40
    .line 41
    const/4 v14, 0x0

    .line 42
    invoke-static {v2, v14}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 43
    .line 44
    .line 45
    neg-float v4, v4

    .line 46
    const/4 v15, 0x0

    .line 47
    invoke-static {v2, v14, v4, v7, v15}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 48
    .line 49
    .line 50
    iget-object v10, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mViewMatrix:[F

    .line 51
    .line 52
    iget-object v12, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mProjectionMatrix:[F

    .line 53
    .line 54
    const/4 v13, 0x0

    .line 55
    const/4 v9, 0x0

    .line 56
    const/4 v11, 0x0

    .line 57
    invoke-static/range {v8 .. v13}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 58
    .line 59
    .line 60
    const/4 v11, 0x0

    .line 61
    const/4 v13, 0x0

    .line 62
    const/4 v9, 0x0

    .line 63
    move-object v12, v8

    .line 64
    move-object v10, v2

    .line 65
    invoke-static/range {v8 .. v13}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 66
    .line 67
    .line 68
    const/4 v12, 0x0

    .line 69
    const/high16 v13, 0x3f800000    # 1.0f

    .line 70
    .line 71
    const/4 v9, 0x0

    .line 72
    const/4 v11, 0x0

    .line 73
    move/from16 v10, p4

    .line 74
    .line 75
    invoke-static/range {v8 .. v13}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 76
    .line 77
    .line 78
    mul-float v4, p1, v6

    .line 79
    .line 80
    mul-float v7, v1, v6

    .line 81
    .line 82
    invoke-static {v8, v14, v4, v7, v6}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 83
    .line 84
    .line 85
    iget-object v12, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->texData0:[F

    .line 86
    .line 87
    const/4 v13, 0x0

    .line 88
    const/4 v9, 0x0

    .line 89
    const/4 v11, 0x0

    .line 90
    move-object v10, v8

    .line 91
    move-object v8, v2

    .line 92
    invoke-static/range {v8 .. v13}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 93
    .line 94
    .line 95
    iget-object v2, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 96
    .line 97
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->isComic()Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-eqz v2, :cond_4

    .line 102
    .line 103
    cmpl-float v2, p4, v15

    .line 104
    .line 105
    const/16 v4, 0x3c0

    .line 106
    .line 107
    if-nez v2, :cond_2

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-gt v2, v4, :cond_1

    .line 114
    .line 115
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    int-to-float v2, v2

    .line 120
    invoke-virtual {v0}, Ll/wej;->getWidth()I

    .line 121
    .line 122
    .line 123
    move-result v4

    .line 124
    int-to-float v4, v4

    .line 125
    div-float/2addr v2, v4

    .line 126
    cmpl-float v2, v2, v6

    .line 127
    .line 128
    if-eqz v2, :cond_1

    .line 129
    .line 130
    const/high16 v2, 0x3f400000    # 0.75f

    .line 131
    .line 132
    mul-float/2addr v1, v2

    .line 133
    iget-object v2, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 134
    .line 135
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    int-to-float v2, v2

    .line 140
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    :goto_0
    int-to-float v4, v4

    .line 145
    div-float/2addr v2, v4

    .line 146
    mul-float/2addr v1, v2

    .line 147
    div-float v15, v1, v5

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_1
    iget-object v2, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 151
    .line 152
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    int-to-float v2, v2

    .line 157
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    goto :goto_0

    .line 162
    :cond_2
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    if-gt v2, v4, :cond_3

    .line 167
    .line 168
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 169
    .line 170
    .line 171
    move-result v2

    .line 172
    int-to-float v2, v2

    .line 173
    invoke-virtual {v0}, Ll/wej;->getWidth()I

    .line 174
    .line 175
    .line 176
    move-result v4

    .line 177
    int-to-float v4, v4

    .line 178
    div-float/2addr v2, v4

    .line 179
    cmpl-float v2, v2, v6

    .line 180
    .line 181
    if-eqz v2, :cond_3

    .line 182
    .line 183
    const/high16 v2, -0x40c00000    # -0.75f

    .line 184
    .line 185
    mul-float/2addr v1, v2

    .line 186
    iget-object v2, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 187
    .line 188
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    int-to-float v2, v2

    .line 193
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 194
    .line 195
    .line 196
    move-result v4

    .line 197
    goto :goto_0

    .line 198
    :cond_3
    neg-float v1, v1

    .line 199
    iget-object v2, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 200
    .line 201
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 202
    .line 203
    .line 204
    move-result v2

    .line 205
    int-to-float v2, v2

    .line 206
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    goto :goto_0

    .line 211
    :cond_4
    :goto_1
    aget v1, v8, v14

    .line 212
    .line 213
    const/4 v2, 0x1

    .line 214
    aget v4, v8, v2

    .line 215
    .line 216
    sub-float/2addr v4, v15

    .line 217
    const/4 v5, 0x4

    .line 218
    aget v6, v8, v5

    .line 219
    .line 220
    const/4 v7, 0x5

    .line 221
    aget v9, v8, v7

    .line 222
    .line 223
    sub-float/2addr v9, v15

    .line 224
    const/16 v10, 0x8

    .line 225
    .line 226
    aget v11, v8, v10

    .line 227
    .line 228
    const/16 v12, 0x9

    .line 229
    .line 230
    aget v12, v8, v12

    .line 231
    .line 232
    sub-float/2addr v12, v15

    .line 233
    const/16 v13, 0xc

    .line 234
    .line 235
    aget v13, v8, v13

    .line 236
    .line 237
    const/16 v16, 0xd

    .line 238
    .line 239
    aget v8, v8, v16

    .line 240
    .line 241
    sub-float/2addr v8, v15

    .line 242
    new-array v10, v10, [F

    .line 243
    .line 244
    aput v1, v10, v14

    .line 245
    .line 246
    aput v4, v10, v2

    .line 247
    .line 248
    const/4 v1, 0x2

    .line 249
    aput v6, v10, v1

    .line 250
    .line 251
    const/4 v1, 0x3

    .line 252
    aput v9, v10, v1

    .line 253
    .line 254
    aput v11, v10, v5

    .line 255
    .line 256
    aput v12, v10, v7

    .line 257
    .line 258
    const/4 v1, 0x6

    .line 259
    aput v13, v10, v1

    .line 260
    .line 261
    const/4 v1, 0x7

    .line 262
    aput v8, v10, v1

    .line 263
    .line 264
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 265
    .line 266
    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    monitor-exit v3

    .line 270
    return-void

    .line 271
    :goto_2
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 272
    throw v0
.end method

.method public setTextId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->textId:I

    .line 2
    .line 3
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/MmcvImageLoader;->setRenderTime(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public unlockTexture()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->lockTexture:Z

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
