.class public Lcom/momo/mcamera/mask/WeexStickerMaskFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"


# static fields
.field public static final ATTRIBUTE_DECORATION_SIZE:Ljava/lang/String; = "decorationSize"

.field public static final ATTRIBUTE_POSITION_2:Ljava/lang/String; = "position2"

.field static final COORDS_PER_VERTEX:I = 0x2


# instance fields
.field private decorateHandler:I

.field private drawListBuffer:Ljava/nio/ShortBuffer;

.field private final drawOrder:[S

.field private final fragmentShaderCode:Ljava/lang/String;

.field private fvertexBuffer:Ljava/nio/FloatBuffer;

.field private isDraw:Z

.field private lockTexture:Z

.field protected final mProjectionMatrix:[F

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

.field protected positionHandle2:I

.field protected sticker:Lcom/momo/mcamera/mask/Sticker;

.field private stickerHeight:I

.field stickerScale:F

.field private stickerWidth:I

.field texData0:[F

.field private vertexBuffer:Ljava/nio/FloatBuffer;

.field private final vertexShaderCode:Ljava/lang/String;

.field private final vertexStride:I


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "attribute vec4 position;\nattribute vec4   position2 ; attribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->vertexShaderCode:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "precision mediump float;uniform sampler2D inputImageTexture;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture,textureCoordinate);\n   if (color1.a > 0.0) {color1.rgb = color1.rgb/color1.a;}    gl_FragColor = color1;\n}"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->fragmentShaderCode:Ljava/lang/String;

    .line 11
    .line 12
    const/16 v0, 0x10

    .line 13
    .line 14
    new-array v1, v0, [F

    .line 15
    .line 16
    iput-object v1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mProjectionMatrix:[F

    .line 17
    .line 18
    new-array v0, v0, [F

    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mViewMatrix:[F

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
    iput-object v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->drawOrder:[S

    .line 29
    .line 30
    const/16 v0, 0x8

    .line 31
    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->vertexStride:I

    .line 33
    .line 34
    new-instance v0, Ljava/lang/Object;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 40
    .line 41
    new-instance v0, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->lockTexture:Z

    .line 54
    .line 55
    iput v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->stickerWidth:I

    .line 56
    .line 57
    iput v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->stickerHeight:I

    .line 58
    .line 59
    iput-object p1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 60
    .line 61
    invoke-direct {p0}, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->initCoordinate()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
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

.method private initCoordinate()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->stickerWidth:I

    .line 4
    .line 5
    iget-object v2, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ne v1, v2, :cond_1

    .line 12
    .line 13
    iget v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->stickerHeight:I

    .line 14
    .line 15
    iget-object v2, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eq v1, v2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void

    .line 25
    :cond_1
    :goto_0
    iget-object v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->stickerWidth:I

    .line 32
    .line 33
    iget-object v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iput v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->stickerHeight:I

    .line 40
    .line 41
    iget-object v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    int-to-float v1, v1

    .line 48
    iget-object v2, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    int-to-float v2, v2

    .line 55
    div-float/2addr v1, v2

    .line 56
    iput v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->stickerScale:F

    .line 57
    .line 58
    const/high16 v2, 0x3f000000    # 0.5f

    .line 59
    .line 60
    mul-float v3, v1, v2

    .line 61
    .line 62
    const/high16 v4, -0x41000000    # -0.5f

    .line 63
    .line 64
    mul-float v5, v4, v1

    .line 65
    .line 66
    mul-float v6, v4, v1

    .line 67
    .line 68
    mul-float/2addr v1, v2

    .line 69
    const/16 v7, 0x8

    .line 70
    .line 71
    new-array v8, v7, [F

    .line 72
    .line 73
    const/4 v9, 0x0

    .line 74
    aput v4, v8, v9

    .line 75
    .line 76
    const/4 v10, 0x1

    .line 77
    aput v3, v8, v10

    .line 78
    .line 79
    const/4 v3, 0x2

    .line 80
    aput v4, v8, v3

    .line 81
    .line 82
    const/4 v11, 0x3

    .line 83
    aput v5, v8, v11

    .line 84
    .line 85
    const/4 v5, 0x4

    .line 86
    aput v2, v8, v5

    .line 87
    .line 88
    const/4 v12, 0x5

    .line 89
    aput v6, v8, v12

    .line 90
    .line 91
    const/4 v6, 0x6

    .line 92
    aput v2, v8, v6

    .line 93
    .line 94
    const/4 v13, 0x7

    .line 95
    aput v1, v8, v13

    .line 96
    .line 97
    const/16 v1, 0x20

    .line 98
    .line 99
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 104
    .line 105
    .line 106
    move-result-object v14

    .line 107
    invoke-virtual {v1, v14}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iput-object v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 115
    .line 116
    invoke-virtual {v1, v8}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 117
    .line 118
    .line 119
    iget-object v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 120
    .line 121
    invoke-virtual {v1, v9}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 122
    .line 123
    .line 124
    iget v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->stickerScale:F

    .line 125
    .line 126
    mul-float v8, v1, v2

    .line 127
    .line 128
    mul-float v14, v4, v1

    .line 129
    .line 130
    mul-float v15, v4, v1

    .line 131
    .line 132
    mul-float/2addr v1, v2

    .line 133
    move/from16 v16, v2

    .line 134
    .line 135
    const/16 v2, 0x10

    .line 136
    .line 137
    new-array v2, v2, [F

    .line 138
    .line 139
    aput v4, v2, v9

    .line 140
    .line 141
    aput v8, v2, v10

    .line 142
    .line 143
    const/4 v8, 0x0

    .line 144
    aput v8, v2, v3

    .line 145
    .line 146
    const/high16 v10, 0x3f800000    # 1.0f

    .line 147
    .line 148
    aput v10, v2, v11

    .line 149
    .line 150
    aput v4, v2, v5

    .line 151
    .line 152
    aput v14, v2, v12

    .line 153
    .line 154
    aput v8, v2, v6

    .line 155
    .line 156
    aput v10, v2, v13

    .line 157
    .line 158
    aput v16, v2, v7

    .line 159
    .line 160
    const/16 v4, 0x9

    .line 161
    .line 162
    aput v15, v2, v4

    .line 163
    .line 164
    const/16 v4, 0xa

    .line 165
    .line 166
    aput v8, v2, v4

    .line 167
    .line 168
    const/16 v4, 0xb

    .line 169
    .line 170
    aput v10, v2, v4

    .line 171
    .line 172
    const/16 v4, 0xc

    .line 173
    .line 174
    aput v16, v2, v4

    .line 175
    .line 176
    const/16 v4, 0xd

    .line 177
    .line 178
    aput v1, v2, v4

    .line 179
    .line 180
    const/16 v1, 0xe

    .line 181
    .line 182
    aput v8, v2, v1

    .line 183
    .line 184
    const/16 v1, 0xf

    .line 185
    .line 186
    aput v10, v2, v1

    .line 187
    .line 188
    iput-object v2, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->texData0:[F

    .line 189
    .line 190
    iget-object v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->drawOrder:[S

    .line 191
    .line 192
    array-length v1, v1

    .line 193
    mul-int/2addr v1, v3

    .line 194
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    iput-object v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 210
    .line 211
    iget-object v2, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->drawOrder:[S

    .line 212
    .line 213
    invoke-virtual {v1, v2}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 214
    .line 215
    .line 216
    iget-object v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 217
    .line 218
    invoke-virtual {v1, v9}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 219
    .line 220
    .line 221
    iget-object v1, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mViewMatrix:[F

    .line 222
    .line 223
    invoke-static {v1, v9}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 224
    .line 225
    .line 226
    iget-object v0, v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mViewMatrix:[F

    .line 227
    .line 228
    const/high16 v1, -0x40800000    # -1.0f

    .line 229
    .line 230
    aput v1, v0, v9

    .line 231
    .line 232
    return-void
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
    const/4 v0, 0x3

    .line 7
    const-string v1, "decorationSize"

    .line 8
    .line 9
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
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
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->isDraw:Z

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

.method public clearPoints()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mvpLists:Ljava/util/List;

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
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->deleteTexture()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public draw()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->decorateHandler:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

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
    iget-object v2, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

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
    iget-object v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->drawOrder:[S

    .line 24
    .line 25
    array-length v0, v0

    .line 26
    const/16 v1, 0x1403

    .line 27
    .line 28
    iget-object v2, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

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
    iget-object v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 43
    .line 44
    monitor-enter v0

    .line 45
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mvpLists:Ljava/util/List;

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
    invoke-virtual {p0, v2}, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->passShaderValues([F)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->draw()V

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
    const-string p0, "precision mediump float;uniform sampler2D inputImageTexture;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture,textureCoordinate);\n   if (color1.a > 0.0) {color1.rgb = color1.rgb/color1.a;}    gl_FragColor = color1;\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec4   position2 ; attribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

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
    iput v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->positionHandle2:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "decorationSize"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->decorateHandler:I

    .line 23
    .line 24
    return-void
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
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->lockTexture:Z

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
    iget-object p1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mvpLists:Ljava/util/List;

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
    iput-boolean p3, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->isDraw:Z

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mvpLists:Ljava/util/List;

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
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->isDraw:Z

    .line 39
    .line 40
    if-nez p1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->clearPoints()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    iget-object p1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImageProvider()Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    if-eqz p1, :cond_6

    .line 53
    .line 54
    invoke-interface {p1}, Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;->getRealBitmap()Landroid/graphics/Bitmap;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    if-eqz p1, :cond_5

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget v1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->stickerWidth:I

    .line 65
    .line 66
    if-ne v0, v1, :cond_3

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iget v1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->stickerHeight:I

    .line 73
    .line 74
    if-eq v0, v1, :cond_4

    .line 75
    .line 76
    :cond_3
    invoke-direct {p0}, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->initCoordinate()V

    .line 77
    .line 78
    .line 79
    :cond_4
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->deleteTexture()V

    .line 80
    .line 81
    .line 82
    invoke-static {p1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iput p1, p0, Ll/wej;->texture_in:I

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->clearPoints()V

    .line 90
    .line 91
    .line 92
    :cond_6
    :goto_0
    iget p1, p0, Ll/wej;->texture_in:I

    .line 93
    .line 94
    if-nez p1, :cond_7

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->clearPoints()V

    .line 97
    .line 98
    .line 99
    :cond_7
    iput-boolean p3, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->isDraw:Z

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_8
    const/4 p1, 0x0

    .line 103
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->isDraw:Z

    .line 104
    .line 105
    :goto_1
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    int-to-float p1, p1

    .line 124
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 125
    .line 126
    .line 127
    move-result p3

    .line 128
    int-to-float p3, p3

    .line 129
    div-float/2addr p1, p3

    .line 130
    iget-object v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mProjectionMatrix:[F

    .line 131
    .line 132
    const/high16 p3, -0x40800000    # -1.0f

    .line 133
    .line 134
    div-float v4, p3, p1

    .line 135
    .line 136
    const/high16 p3, 0x3f800000    # 1.0f

    .line 137
    .line 138
    div-float v5, p3, p1

    .line 139
    .line 140
    const/high16 v6, 0x40400000    # 3.0f

    .line 141
    .line 142
    const/high16 v7, 0x40e00000    # 7.0f

    .line 143
    .line 144
    const/4 v1, 0x0

    .line 145
    const/high16 v2, -0x40800000    # -1.0f

    .line 146
    .line 147
    const/high16 v3, 0x3f800000    # 1.0f

    .line 148
    .line 149
    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 156
    .line 157
    .line 158
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
    iput-object v0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

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
    iget-object v7, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

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
    iget v8, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->positionHandle2:I

    .line 49
    .line 50
    const/16 v12, 0x8

    .line 51
    .line 52
    iget-object v13, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

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
    iget p1, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->positionHandle2:I

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

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
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
    invoke-virtual/range {v0 .. v8}, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->setParamForMatrix(FFLandroid/graphics/PointF;F[F[F[FLcom/momo/mcamera/mask/FilterTriggerManager;)V

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
    iget-object p5, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->maskListLock:Ljava/lang/Object;

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
    iget-object v3, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mViewMatrix:[F

    .line 46
    .line 47
    iget-object v5, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mProjectionMatrix:[F

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
    iget-object v5, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->texData0:[F

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
    iget-object p0, p0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;->mvpLists:Ljava/util/List;

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
