.class public Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# static fields
.field public static final ATTRIBUTE_DECORATION_SIZE:Ljava/lang/String; = "decorationSize"

.field public static final ATTRIBUTE_MVP_MATRIX:Ljava/lang/String; = "uMVPMatrix"

.field public static final ATTRIBUTE_POSITION_2:Ljava/lang/String; = "position2"

.field public static final ATTRIBUTE_POSITION_3:Ljava/lang/String; = "position3"

.field static final COORDS_PER_VERTEX:I = 0x2


# instance fields
.field private curIndex:I

.field curMMCVImage:Lcom/momocv/MMFrame;

.field private decorateHandler:I

.field private drawListBuffer:Ljava/nio/ShortBuffer;

.field private final drawOrder:[S

.field private etc1Batch:Lcom/momo/mcamera/mask/Etc1Batch;

.field private final fragmentShaderCode:Ljava/lang/String;

.field private fvertexBuffer:Ljava/nio/FloatBuffer;

.field private isDraw:Z

.field private lastFrameTime:J

.field private lockTexture:Z

.field protected final mProjectionMatrix:[F

.field private mVPMatrixHandler:I

.field protected final mViewMatrix:[F

.field protected maskListLock:Ljava/lang/Object;

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

.field protected positionHandle3:I

.field protected sticker:Lcom/momo/mcamera/mask/Sticker;

.field stickerScale:F

.field texData0:[F

.field textId:I

.field private texturePath:Ljava/lang/String;

.field private texture_Etc1:Landroid/opengl/ETC1Util$ETC1Texture;

.field private vertexBuffer:Ljava/nio/FloatBuffer;

.field private vertexBufferAlpha:Ljava/nio/FloatBuffer;

.field private final vertexShaderCode:Ljava/lang/String;

.field private final vertexStride:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string p1, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; attribute vec4   position3 ; attribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;  vec2 coord = position2.xy;  vec2 coord1 = position3.xy;  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n  textureCoordinate1 = vec2(1.0 - (coord1.x + 0.5),1.0 - (coord1.y + 0.5));\n}"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->vertexShaderCode:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "precision mediump float;uniform sampler2D inputImageTexture;varying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture,textureCoordinate);\n   color1.a = texture2D(inputImageTexture,textureCoordinate1).r;\n   gl_FragColor = color1;\n}"

    .line 9
    .line 10
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->fragmentShaderCode:Ljava/lang/String;

    .line 11
    .line 12
    const/16 p1, 0x10

    .line 13
    .line 14
    new-array v0, p1, [F

    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->mProjectionMatrix:[F

    .line 17
    .line 18
    new-array p1, p1, [F

    .line 19
    .line 20
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->mViewMatrix:[F

    .line 21
    .line 22
    const/4 v0, 0x6

    .line 23
    new-array v0, v0, [S

    .line 24
    .line 25
    fill-array-data v0, :array_0

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->drawOrder:[S

    .line 29
    .line 30
    const/16 v1, 0x8

    .line 31
    .line 32
    iput v1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->vertexStride:I

    .line 33
    .line 34
    new-instance v1, Ljava/lang/Object;

    .line 35
    .line 36
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->maskListLock:Ljava/lang/Object;

    .line 40
    .line 41
    new-instance v1, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->mvpLists:Ljava/util/List;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->lockTexture:Z

    .line 54
    .line 55
    const-wide/16 v2, -0x1

    .line 56
    .line 57
    iput-wide v2, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->lastFrameTime:J

    .line 58
    .line 59
    iput v1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->curIndex:I

    .line 60
    .line 61
    iput-object p2, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->initCoordinate()V

    .line 64
    .line 65
    .line 66
    array-length p2, v0

    .line 67
    mul-int/lit8 p2, p2, 0x2

    .line 68
    .line 69
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {p2, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    iput-object p2, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 85
    .line 86
    invoke-virtual {p2, v0}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 87
    .line 88
    .line 89
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 90
    .line 91
    invoke-virtual {p2, v1}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 92
    .line 93
    .line 94
    invoke-static {p1, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 95
    .line 96
    .line 97
    const/high16 p2, -0x40800000    # -1.0f

    .line 98
    .line 99
    aput p2, p1, v1

    .line 100
    .line 101
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->getETC1Texture()Landroid/opengl/ETC1Util$ETC1Texture;

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
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

.method private getETC1Texture()Landroid/opengl/ETC1Util$ETC1Texture;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->texturePath:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getETC1Path()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->texturePath:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->loadPkmFile(Ljava/lang/String;)Landroid/opengl/ETC1Util$ETC1Texture;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->texture_Etc1:Landroid/opengl/ETC1Util$ETC1Texture;

    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->texture_Etc1:Landroid/opengl/ETC1Util$ETC1Texture;

    .line 20
    .line 21
    return-object p0
.end method

.method private loadPkmFile(Ljava/lang/String;)Landroid/opengl/ETC1Util$ETC1Texture;
    .locals 0

    .line 1
    :try_start_0
    new-instance p0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/io/FileInputStream;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Landroid/opengl/ETC1Util;->createTexture(Ljava/io/InputStream;)Landroid/opengl/ETC1Util$ETC1Texture;

    .line 12
    .line 13
    .line 14
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    return-object p0

    .line 16
    :catch_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method private updateETC1Coordinate()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->lastFrameTime:J

    .line 4
    .line 5
    const-wide/16 v3, -0x1

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->lastFrameTime:J

    .line 16
    .line 17
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getETC1ImageIndex()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->curIndex:I

    .line 24
    .line 25
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    iget-wide v3, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->lastFrameTime:J

    .line 30
    .line 31
    sub-long/2addr v1, v3

    .line 32
    const-wide/16 v3, 0x32

    .line 33
    .line 34
    cmp-long v1, v1, v3

    .line 35
    .line 36
    if-lez v1, :cond_1

    .line 37
    .line 38
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getETC1ImageIndex()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iput v1, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->curIndex:I

    .line 45
    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    iput-wide v1, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->lastFrameTime:J

    .line 51
    .line 52
    :cond_1
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->etc1Batch:Lcom/momo/mcamera/mask/Etc1Batch;

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Etc1Batch;->getBatchStickers()Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget v2, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->curIndex:I

    .line 59
    .line 60
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Lcom/momo/mcamera/mask/batchbean/BatchSticker;

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->getFrame()Lcom/momo/mcamera/mask/batchbean/BatchFrame;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v2, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->etc1Batch:Lcom/momo/mcamera/mask/Etc1Batch;

    .line 71
    .line 72
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Etc1Batch;->getBatchMeta()Lcom/momo/mcamera/mask/batchbean/BatchMeta;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchMeta;->getSize()Lcom/momo/mcamera/mask/batchbean/BatchSize;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageX()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    int-to-float v3, v3

    .line 85
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchWidth()I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    int-to-float v4, v4

    .line 90
    div-float/2addr v3, v4

    .line 91
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageY()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    int-to-float v4, v4

    .line 96
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchHeight()I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    const/4 v6, 0x2

    .line 101
    mul-int/2addr v5, v6

    .line 102
    int-to-float v5, v5

    .line 103
    div-float/2addr v4, v5

    .line 104
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageX()I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    int-to-float v5, v5

    .line 109
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchWidth()I

    .line 110
    .line 111
    .line 112
    move-result v7

    .line 113
    int-to-float v7, v7

    .line 114
    div-float/2addr v5, v7

    .line 115
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageY()I

    .line 116
    .line 117
    .line 118
    move-result v7

    .line 119
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageHeight()I

    .line 120
    .line 121
    .line 122
    move-result v8

    .line 123
    add-int/2addr v7, v8

    .line 124
    int-to-float v7, v7

    .line 125
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchHeight()I

    .line 126
    .line 127
    .line 128
    move-result v8

    .line 129
    mul-int/2addr v8, v6

    .line 130
    int-to-float v8, v8

    .line 131
    div-float/2addr v7, v8

    .line 132
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageX()I

    .line 133
    .line 134
    .line 135
    move-result v8

    .line 136
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageWidth()I

    .line 137
    .line 138
    .line 139
    move-result v9

    .line 140
    add-int/2addr v8, v9

    .line 141
    int-to-float v8, v8

    .line 142
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchWidth()I

    .line 143
    .line 144
    .line 145
    move-result v9

    .line 146
    int-to-float v9, v9

    .line 147
    div-float/2addr v8, v9

    .line 148
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageY()I

    .line 149
    .line 150
    .line 151
    move-result v9

    .line 152
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageHeight()I

    .line 153
    .line 154
    .line 155
    move-result v10

    .line 156
    add-int/2addr v9, v10

    .line 157
    int-to-float v9, v9

    .line 158
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchHeight()I

    .line 159
    .line 160
    .line 161
    move-result v10

    .line 162
    mul-int/2addr v10, v6

    .line 163
    int-to-float v10, v10

    .line 164
    div-float/2addr v9, v10

    .line 165
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageX()I

    .line 166
    .line 167
    .line 168
    move-result v10

    .line 169
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageWidth()I

    .line 170
    .line 171
    .line 172
    move-result v11

    .line 173
    add-int/2addr v10, v11

    .line 174
    int-to-float v10, v10

    .line 175
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchWidth()I

    .line 176
    .line 177
    .line 178
    move-result v11

    .line 179
    int-to-float v11, v11

    .line 180
    div-float/2addr v10, v11

    .line 181
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageY()I

    .line 182
    .line 183
    .line 184
    move-result v11

    .line 185
    int-to-float v11, v11

    .line 186
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchHeight()I

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    mul-int/2addr v2, v6

    .line 191
    int-to-float v2, v2

    .line 192
    div-float/2addr v11, v2

    .line 193
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageHeight()I

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    int-to-float v2, v2

    .line 198
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageWidth()I

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    int-to-float v1, v1

    .line 203
    div-float/2addr v2, v1

    .line 204
    iput v2, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->stickerScale:F

    .line 205
    .line 206
    const/high16 v1, -0x41000000    # -0.5f

    .line 207
    .line 208
    add-float/2addr v3, v1

    .line 209
    const/high16 v2, 0x3f000000    # 0.5f

    .line 210
    .line 211
    sub-float v12, v2, v4

    .line 212
    .line 213
    add-float/2addr v5, v1

    .line 214
    sub-float v13, v2, v7

    .line 215
    .line 216
    add-float/2addr v8, v1

    .line 217
    sub-float v14, v2, v9

    .line 218
    .line 219
    add-float/2addr v10, v1

    .line 220
    sub-float/2addr v2, v11

    .line 221
    const/16 v1, 0x8

    .line 222
    .line 223
    new-array v15, v1, [F

    .line 224
    .line 225
    move/from16 v16, v6

    .line 226
    .line 227
    const/4 v6, 0x0

    .line 228
    aput v3, v15, v6

    .line 229
    .line 230
    const/16 v17, 0x1

    .line 231
    .line 232
    aput v12, v15, v17

    .line 233
    .line 234
    aput v5, v15, v16

    .line 235
    .line 236
    const/4 v12, 0x3

    .line 237
    aput v13, v15, v12

    .line 238
    .line 239
    const/4 v13, 0x4

    .line 240
    aput v8, v15, v13

    .line 241
    .line 242
    const/16 v18, 0x5

    .line 243
    .line 244
    aput v14, v15, v18

    .line 245
    .line 246
    const/4 v14, 0x6

    .line 247
    aput v10, v15, v14

    .line 248
    .line 249
    const/16 v19, 0x7

    .line 250
    .line 251
    aput v2, v15, v19

    .line 252
    .line 253
    neg-float v2, v4

    .line 254
    neg-float v4, v7

    .line 255
    neg-float v7, v9

    .line 256
    neg-float v9, v11

    .line 257
    new-array v1, v1, [F

    .line 258
    .line 259
    aput v3, v1, v6

    .line 260
    .line 261
    aput v2, v1, v17

    .line 262
    .line 263
    aput v5, v1, v16

    .line 264
    .line 265
    aput v4, v1, v12

    .line 266
    .line 267
    aput v8, v1, v13

    .line 268
    .line 269
    aput v7, v1, v18

    .line 270
    .line 271
    aput v10, v1, v14

    .line 272
    .line 273
    aput v9, v1, v19

    .line 274
    .line 275
    const/16 v2, 0x20

    .line 276
    .line 277
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 278
    .line 279
    .line 280
    move-result-object v3

    .line 281
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 282
    .line 283
    .line 284
    move-result-object v4

    .line 285
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 289
    .line 290
    .line 291
    move-result-object v3

    .line 292
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 293
    .line 294
    invoke-virtual {v3, v15}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 295
    .line 296
    .line 297
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 298
    .line 299
    invoke-virtual {v3, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 300
    .line 301
    .line 302
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 307
    .line 308
    .line 309
    move-result-object v3

    .line 310
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    iput-object v2, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->vertexBufferAlpha:Ljava/nio/FloatBuffer;

    .line 318
    .line 319
    invoke-virtual {v2, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 320
    .line 321
    .line 322
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->vertexBufferAlpha:Ljava/nio/FloatBuffer;

    .line 323
    .line 324
    invoke-virtual {v0, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 325
    .line 326
    .line 327
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

.method public cancelDraw()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->isDraw:Z

    .line 3
    .line 4
    iget v1, p0, Ll/wej;->texture_in:I

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    filled-new-array {v1}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-static {v2, v1, v0}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 14
    .line 15
    .line 16
    iput v0, p0, Ll/wej;->texture_in:I

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public clearPoints()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->maskListLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->mvpLists:Ljava/util/List;

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
    return-void
.end method

.method public draw()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->decorateHandler:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

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
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

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
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->drawOrder:[S

    .line 24
    .line 25
    array-length v0, v0

    .line 26
    const/16 v1, 0x1403

    .line 27
    .line 28
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

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
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->maskListLock:Ljava/lang/Object;

    .line 43
    .line 44
    monitor-enter v0

    .line 45
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->mvpLists:Ljava/util/List;

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
    invoke-virtual {p0, v2}, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->passShaderValues([F)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->draw()V

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
    const-string p0, "precision mediump float;uniform sampler2D inputImageTexture;varying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture,textureCoordinate);\n   color1.a = texture2D(inputImageTexture,textureCoordinate1).r;\n   gl_FragColor = color1;\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; attribute vec4   position3 ; attribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;  vec2 coord = position2.xy;  vec2 coord1 = position3.xy;  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n  textureCoordinate1 = vec2(1.0 - (coord1.x + 0.5),1.0 - (coord1.y + 0.5));\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public initCoordinate()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getETC1JsonPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :try_start_0
    new-instance v1, Ljava/io/File;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Lcom/core/glcore/util/FileUtil;->readString(Ljava/io/File;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    :goto_0
    if-nez v0, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {v0}, Lcom/momo/mcamera/mask/Etc1Batch;->getEffectModel(Ljava/lang/String;)Lcom/momo/mcamera/mask/Etc1Batch;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->etc1Batch:Lcom/momo/mcamera/mask/Etc1Batch;

    .line 30
    .line 31
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->updateETC1Coordinate()V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->stickerScale:F

    .line 35
    .line 36
    const/high16 v1, 0x3f000000    # 0.5f

    .line 37
    .line 38
    mul-float v2, v0, v1

    .line 39
    .line 40
    const/high16 v3, -0x41000000    # -0.5f

    .line 41
    .line 42
    mul-float v4, v3, v0

    .line 43
    .line 44
    mul-float v5, v3, v0

    .line 45
    .line 46
    mul-float/2addr v0, v1

    .line 47
    const/16 v6, 0x10

    .line 48
    .line 49
    new-array v6, v6, [F

    .line 50
    .line 51
    const/4 v7, 0x0

    .line 52
    aput v3, v6, v7

    .line 53
    .line 54
    const/4 v7, 0x1

    .line 55
    aput v2, v6, v7

    .line 56
    .line 57
    const/4 v2, 0x2

    .line 58
    const/4 v7, 0x0

    .line 59
    aput v7, v6, v2

    .line 60
    .line 61
    const/4 v2, 0x3

    .line 62
    const/high16 v8, 0x3f800000    # 1.0f

    .line 63
    .line 64
    aput v8, v6, v2

    .line 65
    .line 66
    const/4 v2, 0x4

    .line 67
    aput v3, v6, v2

    .line 68
    .line 69
    const/4 v2, 0x5

    .line 70
    aput v4, v6, v2

    .line 71
    .line 72
    const/4 v2, 0x6

    .line 73
    aput v7, v6, v2

    .line 74
    .line 75
    const/4 v2, 0x7

    .line 76
    aput v8, v6, v2

    .line 77
    .line 78
    const/16 v2, 0x8

    .line 79
    .line 80
    aput v1, v6, v2

    .line 81
    .line 82
    const/16 v2, 0x9

    .line 83
    .line 84
    aput v5, v6, v2

    .line 85
    .line 86
    const/16 v2, 0xa

    .line 87
    .line 88
    aput v7, v6, v2

    .line 89
    .line 90
    const/16 v2, 0xb

    .line 91
    .line 92
    aput v8, v6, v2

    .line 93
    .line 94
    const/16 v2, 0xc

    .line 95
    .line 96
    aput v1, v6, v2

    .line 97
    .line 98
    const/16 v1, 0xd

    .line 99
    .line 100
    aput v0, v6, v1

    .line 101
    .line 102
    const/16 v0, 0xe

    .line 103
    .line 104
    aput v7, v6, v0

    .line 105
    .line 106
    const/16 v0, 0xf

    .line 107
    .line 108
    aput v8, v6, v0

    .line 109
    .line 110
    iput-object v6, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->texData0:[F

    .line 111
    .line 112
    return-void
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
    iput v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->positionHandle2:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "position3"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->positionHandle3:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "uMVPMatrix"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->mVPMatrixHandler:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "decorationSize"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->decorateHandler:I

    .line 43
    .line 44
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
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->lockTexture:Z

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
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->lockTexture:Z

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
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->mvpLists:Ljava/util/List;

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
    iput-boolean p3, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->isDraw:Z

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->mvpLists:Ljava/util/List;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    if-eqz p1, :cond_5

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-lez p1, :cond_5

    .line 38
    .line 39
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->isDraw:Z

    .line 40
    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->clearPoints()V

    .line 44
    .line 45
    .line 46
    :cond_2
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->texture_Etc1:Landroid/opengl/ETC1Util$ETC1Texture;

    .line 47
    .line 48
    if-eqz p1, :cond_4

    .line 49
    .line 50
    iget v0, p0, Ll/wej;->texture_in:I

    .line 51
    .line 52
    if-nez v0, :cond_3

    .line 53
    .line 54
    invoke-static {p1}, Lcom/core/glcore/util/TextureHelper;->etc1ToTexture(Landroid/opengl/ETC1Util$ETC1Texture;)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput p1, p0, Ll/wej;->texture_in:I

    .line 59
    .line 60
    :cond_3
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->updateETC1Coordinate()V

    .line 61
    .line 62
    .line 63
    iput-boolean p3, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->isDraw:Z

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_4
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->isDraw:Z

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_5
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->isDraw:Z

    .line 70
    .line 71
    :goto_0
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    int-to-float p1, p1

    .line 90
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 91
    .line 92
    .line 93
    move-result p3

    .line 94
    int-to-float p3, p3

    .line 95
    div-float/2addr p1, p3

    .line 96
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->mProjectionMatrix:[F

    .line 97
    .line 98
    const/high16 p3, -0x40800000    # -1.0f

    .line 99
    .line 100
    div-float v4, p3, p1

    .line 101
    .line 102
    const/high16 p3, 0x3f800000    # 1.0f

    .line 103
    .line 104
    div-float v5, p3, p1

    .line 105
    .line 106
    const/high16 v6, 0x40400000    # 3.0f

    .line 107
    .line 108
    const/high16 v7, 0x40e00000    # 7.0f

    .line 109
    .line 110
    const/4 v1, 0x0

    .line 111
    const/high16 v2, -0x40800000    # -1.0f

    .line 112
    .line 113
    const/high16 v3, 0x3f800000    # 1.0f

    .line 114
    .line 115
    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 122
    .line 123
    .line 124
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
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

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
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

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
    iget v8, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->positionHandle2:I

    .line 49
    .line 50
    const/16 v12, 0x8

    .line 51
    .line 52
    iget-object v13, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

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
    iget v2, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->positionHandle3:I

    .line 62
    .line 63
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->vertexBufferAlpha:Ljava/nio/FloatBuffer;

    .line 64
    .line 65
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 66
    .line 67
    .line 68
    iget p1, p0, Ll/wej;->positionHandle:I

    .line 69
    .line 70
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 71
    .line 72
    .line 73
    iget p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->positionHandle2:I

    .line 74
    .line 75
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 76
    .line 77
    .line 78
    iget p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->positionHandle3:I

    .line 79
    .line 80
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 84
    .line 85
    iget v0, p0, Ll/wej;->curRotation:I

    .line 86
    .line 87
    aget-object p1, p1, v0

    .line 88
    .line 89
    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 90
    .line 91
    .line 92
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 93
    .line 94
    iget-object p1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 95
    .line 96
    iget v0, p0, Ll/wej;->curRotation:I

    .line 97
    .line 98
    aget-object v7, p1, v0

    .line 99
    .line 100
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 101
    .line 102
    .line 103
    iget p1, p0, Ll/wej;->texCoordHandle:I

    .line 104
    .line 105
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 106
    .line 107
    .line 108
    const p1, 0x84c0

    .line 109
    .line 110
    .line 111
    invoke-static {p1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 112
    .line 113
    .line 114
    const/16 p1, 0xde1

    .line 115
    .line 116
    iget v0, p0, Ll/wej;->texture_in:I

    .line 117
    .line 118
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 119
    .line 120
    .line 121
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 122
    .line 123
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public pauseBitmapCache()V
    .locals 0

    return-void
.end method

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
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
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 7
    .line 8
    iget p1, p0, Ll/wej;->texture_in:I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    filled-new-array {p1}, [I

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-static {v2, p1, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 19
    .line 20
    .line 21
    iput v1, p0, Ll/wej;->texture_in:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->vertexBufferAlpha:Ljava/nio/FloatBuffer;

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->vertexBufferAlpha:Ljava/nio/FloatBuffer;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->initCoordinate()V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->drawOrder:[S

    .line 51
    .line 52
    array-length p1, p1

    .line 53
    mul-int/lit8 p1, p1, 0x2

    .line 54
    .line 55
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->drawOrder:[S

    .line 73
    .line 74
    invoke-virtual {p1, v2}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 78
    .line 79
    invoke-virtual {p0, v1}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 80
    .line 81
    .line 82
    monitor-exit v0

    .line 83
    return-void

    .line 84
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    throw p0
.end method

.method public resumeBitmapCache()V
    .locals 0

    return-void
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
    invoke-virtual/range {v0 .. v8}, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->setParamForMatrix(FFLandroid/graphics/PointF;F[F[F[FLcom/momo/mcamera/mask/FilterTriggerManager;)V

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
    .locals 7

    .line 1
    iget-object p5, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->maskListLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p5

    .line 4
    if-nez p3, :cond_0

    .line 5
    .line 6
    :try_start_0
    monitor-exit p5

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception v0

    .line 9
    move-object p0, v0

    .line 10
    goto/16 :goto_0

    .line 11
    .line 12
    :cond_0
    iget p6, p3, Landroid/graphics/PointF;->x:F

    .line 13
    .line 14
    const/high16 p7, 0x40000000    # 2.0f

    .line 15
    .line 16
    mul-float/2addr p6, p7

    .line 17
    const/high16 p8, 0x3f800000    # 1.0f

    .line 18
    .line 19
    sub-float/2addr p6, p8

    .line 20
    neg-float p6, p6

    .line 21
    iget v0, p3, Landroid/graphics/PointF;->y:F

    .line 22
    .line 23
    neg-float v0, v0

    .line 24
    mul-float/2addr v0, p7

    .line 25
    add-float/2addr v0, p8

    .line 26
    iput p6, p3, Landroid/graphics/PointF;->x:F

    .line 27
    .line 28
    iput v0, p3, Landroid/graphics/PointF;->y:F

    .line 29
    .line 30
    const/16 p3, 0x10

    .line 31
    .line 32
    new-array v1, p3, [F

    .line 33
    .line 34
    new-array p3, p3, [F

    .line 35
    .line 36
    const/4 p7, 0x0

    .line 37
    invoke-static {p3, p7}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 38
    .line 39
    .line 40
    neg-float p6, p6

    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-static {p3, p7, p6, v0, v2}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 43
    .line 44
    .line 45
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->mViewMatrix:[F

    .line 46
    .line 47
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->mProjectionMatrix:[F

    .line 48
    .line 49
    const/4 v6, 0x0

    .line 50
    const/4 v2, 0x0

    .line 51
    const/4 v4, 0x0

    .line 52
    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 53
    .line 54
    .line 55
    const/4 v4, 0x0

    .line 56
    const/4 v6, 0x0

    .line 57
    const/4 v2, 0x0

    .line 58
    move-object v5, v1

    .line 59
    move-object v3, p3

    .line 60
    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 61
    .line 62
    .line 63
    const/4 v5, 0x0

    .line 64
    const/high16 v6, 0x3f800000    # 1.0f

    .line 65
    .line 66
    const/4 v2, 0x0

    .line 67
    const/4 v4, 0x0

    .line 68
    move v3, p4

    .line 69
    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 70
    .line 71
    .line 72
    mul-float/2addr p1, p8

    .line 73
    mul-float/2addr p2, p8

    .line 74
    invoke-static {v1, p7, p1, p2, p8}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 75
    .line 76
    .line 77
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->texData0:[F

    .line 78
    .line 79
    const/4 v6, 0x0

    .line 80
    const/4 v2, 0x0

    .line 81
    const/4 v4, 0x0

    .line 82
    move-object v3, v1

    .line 83
    move-object v1, p3

    .line 84
    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 85
    .line 86
    .line 87
    aget p1, p3, p7

    .line 88
    .line 89
    const/4 p2, 0x1

    .line 90
    aget p4, p3, p2

    .line 91
    .line 92
    const/4 p6, 0x4

    .line 93
    aget p8, p3, p6

    .line 94
    .line 95
    const/4 v0, 0x5

    .line 96
    aget v1, p3, v0

    .line 97
    .line 98
    const/16 v2, 0x8

    .line 99
    .line 100
    aget v3, p3, v2

    .line 101
    .line 102
    const/16 v4, 0x9

    .line 103
    .line 104
    aget v4, p3, v4

    .line 105
    .line 106
    const/16 v5, 0xc

    .line 107
    .line 108
    aget v5, p3, v5

    .line 109
    .line 110
    const/16 v6, 0xd

    .line 111
    .line 112
    aget p3, p3, v6

    .line 113
    .line 114
    new-array v2, v2, [F

    .line 115
    .line 116
    aput p1, v2, p7

    .line 117
    .line 118
    aput p4, v2, p2

    .line 119
    .line 120
    const/4 p1, 0x2

    .line 121
    aput p8, v2, p1

    .line 122
    .line 123
    const/4 p1, 0x3

    .line 124
    aput v1, v2, p1

    .line 125
    .line 126
    aput v3, v2, p6

    .line 127
    .line 128
    aput v4, v2, v0

    .line 129
    .line 130
    const/4 p1, 0x6

    .line 131
    aput v5, v2, p1

    .line 132
    .line 133
    const/4 p1, 0x7

    .line 134
    aput p3, v2, p1

    .line 135
    .line 136
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->mvpLists:Ljava/util/List;

    .line 137
    .line 138
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    monitor-exit p5

    .line 142
    return-void

    .line 143
    :goto_0
    monitor-exit p5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    throw p0
.end method

.method public setTextId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->textId:I

    .line 2
    .line 3
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

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
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;->lockTexture:Z

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
