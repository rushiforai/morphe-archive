.class public Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;
.super Ll/gfj;
.source "SourceFile"


# static fields
.field public static final FLIP_BOTH:I = 0x2

.field public static final FLIP_HORIZONTAL:I = 0x1

.field public static final FLIP_NONE:I = 0x3

.field public static final FLIP_VERTICAL:I = 0x0

.field private static final TAG:Ljava/lang/String; = "com.momo.mcamera.mask.videomix.MMTextureResourceInput1"

.field private static final UNIFORM_CAM_MATRIX:Ljava/lang/String; = "u_Matrix"

.field public static final UNIFORM_TEXTURE1:Ljava/lang/String; = "inputImageTexture1"

.field public static final identityMatrix:[F


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mBitmapHeight:I

.field private mBitmapWidth:I

.field private mDisplayMode:I

.field private mHeightOutput:I

.field private mInputHeight:I

.field private mInputWidth:I

.field private mIsOES:Z

.field private mOES:F

.field private mOESLocation:I

.field protected mSizeChanged:Z

.field private mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

.field public mText:Landroid/graphics/SurfaceTexture;

.field private mTextureIDBitmap:I

.field private mTextureTex:[I

.field private mWidthOutput:I

.field private matrixHandle:I

.field protected textureHandle1:I

.field protected updateText:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->identityMatrix:[F

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 9

    .line 1
    invoke-direct {p0}, Ll/gfj;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->updateText:I

    .line 9
    .line 10
    iput v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mHeightOutput:I

    .line 11
    .line 12
    iput v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mWidthOutput:I

    .line 13
    .line 14
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSizeChanged:Z

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mIsOES:Z

    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmap:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    const/4 v3, -0x1

    .line 22
    iput v3, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmapWidth:I

    .line 23
    .line 24
    iput v3, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmapHeight:I

    .line 25
    .line 26
    iput v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureIDBitmap:I

    .line 27
    .line 28
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureTex:[I

    .line 31
    .line 32
    const/high16 v3, 0x3f800000    # 1.0f

    .line 33
    .line 34
    iput v3, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mOES:F

    .line 35
    .line 36
    iput v2, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mDisplayMode:I

    .line 37
    .line 38
    iput v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mInputWidth:I

    .line 39
    .line 40
    iput v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mInputHeight:I

    .line 41
    .line 42
    const/4 v3, 0x4

    .line 43
    new-array v3, v3, [Ljava/nio/FloatBuffer;

    .line 44
    .line 45
    iput-object v3, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    const/16 v4, 0x8

    .line 48
    .line 49
    new-array v5, v4, [F

    .line 50
    .line 51
    fill-array-data v5, :array_0

    .line 52
    .line 53
    .line 54
    const/16 v6, 0x20

    .line 55
    .line 56
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    invoke-virtual {v7, v8}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    aput-object v7, v3, v1

    .line 73
    .line 74
    iget-object v3, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 75
    .line 76
    aget-object v3, v3, v1

    .line 77
    .line 78
    invoke-virtual {v3, v5}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 83
    .line 84
    .line 85
    new-array v3, v4, [F

    .line 86
    .line 87
    fill-array-data v3, :array_1

    .line 88
    .line 89
    .line 90
    iget-object v5, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 91
    .line 92
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 97
    .line 98
    .line 99
    move-result-object v8

    .line 100
    invoke-virtual {v7, v8}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    aput-object v7, v5, v2

    .line 109
    .line 110
    iget-object v5, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 111
    .line 112
    aget-object v5, v5, v2

    .line 113
    .line 114
    invoke-virtual {v5, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 119
    .line 120
    .line 121
    new-array v3, v4, [F

    .line 122
    .line 123
    fill-array-data v3, :array_2

    .line 124
    .line 125
    .line 126
    iget-object v5, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 127
    .line 128
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 129
    .line 130
    .line 131
    move-result-object v7

    .line 132
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 133
    .line 134
    .line 135
    move-result-object v8

    .line 136
    invoke-virtual {v7, v8}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 137
    .line 138
    .line 139
    move-result-object v7

    .line 140
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    const/4 v8, 0x2

    .line 145
    aput-object v7, v5, v8

    .line 146
    .line 147
    iget-object v5, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 148
    .line 149
    aget-object v5, v5, v8

    .line 150
    .line 151
    invoke-virtual {v5, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 156
    .line 157
    .line 158
    new-array v3, v4, [F

    .line 159
    .line 160
    fill-array-data v3, :array_3

    .line 161
    .line 162
    .line 163
    iget-object v4, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 164
    .line 165
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    const/4 v6, 0x3

    .line 182
    aput-object v5, v4, v6

    .line 183
    .line 184
    iget-object v4, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 185
    .line 186
    aget-object v4, v4, v6

    .line 187
    .line 188
    invoke-virtual {v4, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 193
    .line 194
    .line 195
    iput v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureIDBitmap:I

    .line 196
    .line 197
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

    .line 198
    .line 199
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mIsOES:Z

    .line 200
    .line 201
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmap:Landroid/graphics/Bitmap;

    .line 202
    .line 203
    return-void

    .line 204
    nop

    .line 205
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
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
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
    .end array-data

    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    :array_3
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private bindTexture()V
    .locals 1

    .line 1
    const v0, 0x84c0

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mIsOES:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const v0, 0x8d65

    .line 12
    .line 13
    .line 14
    iget p0, p0, Ll/wej;->texture_in:I

    .line 15
    .line 16
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const v0, 0x84c1

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 24
    .line 25
    .line 26
    const/16 v0, 0xde1

    .line 27
    .line 28
    iget p0, p0, Ll/wej;->texture_in:I

    .line 29
    .line 30
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private bitmapToTexture(Landroid/graphics/Bitmap;)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureTex:[I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureTex:[I

    .line 12
    .line 13
    :cond_0
    new-array v0, v1, [I

    .line 14
    .line 15
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureTex:[I

    .line 16
    .line 17
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureTex:[I

    .line 21
    .line 22
    aget v0, v0, v2

    .line 23
    .line 24
    const/16 v1, 0xde1

    .line 25
    .line 26
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 27
    .line 28
    .line 29
    const/16 v0, 0x2800

    .line 30
    .line 31
    const v3, 0x46180400    # 9729.0f

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 35
    .line 36
    .line 37
    const/16 v0, 0x2801

    .line 38
    .line 39
    invoke-static {v1, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 40
    .line 41
    .line 42
    const/16 v0, 0x2802

    .line 43
    .line 44
    const v3, 0x47012f00    # 33071.0f

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 48
    .line 49
    .line 50
    const/16 v0, 0x2803

    .line 51
    .line 52
    invoke-static {v1, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 53
    .line 54
    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_1

    .line 62
    .line 63
    invoke-static {v1, v2, p1, v2}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 64
    .line 65
    .line 66
    :cond_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureTex:[I

    .line 67
    .line 68
    aget p0, p0, v2

    .line 69
    .line 70
    return p0
.end method

.method public static updateBitmap(Landroid/graphics/Bitmap;I)V
    .locals 2

    .line 1
    const/16 v0, 0xde1

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x2800

    .line 7
    .line 8
    const v1, 0x46180400    # 9729.0f

    .line 9
    .line 10
    .line 11
    invoke-static {v0, p1, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 12
    .line 13
    .line 14
    const/16 p1, 0x2801

    .line 15
    .line 16
    invoke-static {v0, p1, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 17
    .line 18
    .line 19
    const/16 p1, 0x2802

    .line 20
    .line 21
    const v1, 0x47012f00    # 33071.0f

    .line 22
    .line 23
    .line 24
    invoke-static {v0, p1, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 25
    .line 26
    .line 27
    const/16 p1, 0x2803

    .line 28
    .line 29
    invoke-static {v0, p1, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 30
    .line 31
    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-static {v0, p1, p1, p1, p0}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method


# virtual methods
.method public changeCurRotation(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/wej;->curRotation:I

    .line 3
    .line 4
    div-int/lit8 p1, p1, 0x5a

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/wej;->rotateClockwise90Degrees(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget v0, p0, Ll/wej;->texture_in:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    filled-new-array {v0}, [I

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 30
    .line 31
    .line 32
    iput-object v3, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

    .line 33
    .line 34
    :cond_2
    iput-object v3, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 35
    .line 36
    iput v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureIDBitmap:I

    .line 37
    .line 38
    iput-object v3, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

    .line 39
    .line 40
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mIsOES:Z

    .line 41
    .line 42
    iput-object v3, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmap:Landroid/graphics/Bitmap;

    .line 43
    .line 44
    return-void
.end method

.method public drawImageFrame()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gfj;->drawFrame()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public flipPosition(I)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    const/16 v3, 0x8

    .line 7
    .line 8
    const/16 v4, 0x20

    .line 9
    .line 10
    const/4 v5, 0x2

    .line 11
    const/4 v6, 0x1

    .line 12
    const/4 v7, 0x0

    .line 13
    const/4 v8, 0x3

    .line 14
    if-ne v1, v8, :cond_0

    .line 15
    .line 16
    new-array v1, v3, [F

    .line 17
    .line 18
    fill-array-data v1, :array_0

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/wej;->setRenderVertices([F)V

    .line 22
    .line 23
    .line 24
    new-array v1, v2, [Ljava/nio/FloatBuffer;

    .line 25
    .line 26
    iput-object v1, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 27
    .line 28
    new-array v2, v3, [F

    .line 29
    .line 30
    fill-array-data v2, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object v9

    .line 37
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 38
    .line 39
    .line 40
    move-result-object v10

    .line 41
    invoke-virtual {v9, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    .line 44
    move-result-object v9

    .line 45
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    .line 48
    move-result-object v9

    .line 49
    aput-object v9, v1, v7

    .line 50
    .line 51
    iget-object v1, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 52
    .line 53
    aget-object v1, v1, v7

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 60
    .line 61
    .line 62
    new-array v1, v3, [F

    .line 63
    .line 64
    fill-array-data v1, :array_2

    .line 65
    .line 66
    .line 67
    iget-object v2, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 68
    .line 69
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    move-result-object v9

    .line 73
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 74
    .line 75
    .line 76
    move-result-object v10

    .line 77
    invoke-virtual {v9, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    .line 80
    move-result-object v9

    .line 81
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 82
    .line 83
    .line 84
    move-result-object v9

    .line 85
    aput-object v9, v2, v6

    .line 86
    .line 87
    iget-object v2, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 88
    .line 89
    aget-object v2, v2, v6

    .line 90
    .line 91
    invoke-virtual {v2, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 96
    .line 97
    .line 98
    new-array v1, v3, [F

    .line 99
    .line 100
    fill-array-data v1, :array_3

    .line 101
    .line 102
    .line 103
    iget-object v2, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 104
    .line 105
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 110
    .line 111
    .line 112
    move-result-object v9

    .line 113
    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    aput-object v6, v2, v5

    .line 122
    .line 123
    iget-object v2, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 124
    .line 125
    aget-object v2, v2, v5

    .line 126
    .line 127
    invoke-virtual {v2, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v1, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 132
    .line 133
    .line 134
    new-array v1, v3, [F

    .line 135
    .line 136
    fill-array-data v1, :array_4

    .line 137
    .line 138
    .line 139
    iget-object v2, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 140
    .line 141
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    aput-object v3, v2, v8

    .line 158
    .line 159
    iget-object v0, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 160
    .line 161
    aget-object v0, v0, v8

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v0, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_0
    const/high16 v9, 0x3f800000    # 1.0f

    .line 172
    .line 173
    const/4 v10, 0x0

    .line 174
    if-eqz v1, :cond_3

    .line 175
    .line 176
    if-eq v1, v6, :cond_2

    .line 177
    .line 178
    if-eq v1, v5, :cond_1

    .line 179
    .line 180
    move v1, v9

    .line 181
    move v11, v1

    .line 182
    move v9, v10

    .line 183
    goto :goto_0

    .line 184
    :cond_1
    move v1, v10

    .line 185
    move v11, v1

    .line 186
    move v10, v9

    .line 187
    goto :goto_0

    .line 188
    :cond_2
    move v1, v9

    .line 189
    move v11, v10

    .line 190
    move v10, v1

    .line 191
    move v9, v11

    .line 192
    goto :goto_0

    .line 193
    :cond_3
    move v11, v9

    .line 194
    move v1, v10

    .line 195
    :goto_0
    new-array v12, v3, [F

    .line 196
    .line 197
    aput v9, v12, v7

    .line 198
    .line 199
    aput v10, v12, v6

    .line 200
    .line 201
    aput v1, v12, v5

    .line 202
    .line 203
    aput v10, v12, v8

    .line 204
    .line 205
    aput v9, v12, v2

    .line 206
    .line 207
    const/4 v13, 0x5

    .line 208
    aput v11, v12, v13

    .line 209
    .line 210
    const/4 v14, 0x6

    .line 211
    aput v1, v12, v14

    .line 212
    .line 213
    const/4 v15, 0x7

    .line 214
    aput v11, v12, v15

    .line 215
    .line 216
    move/from16 v16, v2

    .line 217
    .line 218
    iget-object v2, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 219
    .line 220
    move/from16 v17, v4

    .line 221
    .line 222
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 223
    .line 224
    .line 225
    move-result-object v4

    .line 226
    move/from16 v18, v5

    .line 227
    .line 228
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 229
    .line 230
    .line 231
    move-result-object v5

    .line 232
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 237
    .line 238
    .line 239
    move-result-object v4

    .line 240
    aput-object v4, v2, v7

    .line 241
    .line 242
    iget-object v2, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 243
    .line 244
    aget-object v2, v2, v7

    .line 245
    .line 246
    invoke-virtual {v2, v12}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    invoke-virtual {v2, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 251
    .line 252
    .line 253
    new-array v2, v3, [F

    .line 254
    .line 255
    aput v10, v2, v7

    .line 256
    .line 257
    aput v1, v2, v6

    .line 258
    .line 259
    aput v10, v2, v18

    .line 260
    .line 261
    aput v9, v2, v8

    .line 262
    .line 263
    aput v11, v2, v16

    .line 264
    .line 265
    aput v1, v2, v13

    .line 266
    .line 267
    aput v11, v2, v14

    .line 268
    .line 269
    aput v9, v2, v15

    .line 270
    .line 271
    iget-object v4, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 272
    .line 273
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 274
    .line 275
    .line 276
    move-result-object v5

    .line 277
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 278
    .line 279
    .line 280
    move-result-object v12

    .line 281
    invoke-virtual {v5, v12}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 282
    .line 283
    .line 284
    move-result-object v5

    .line 285
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 286
    .line 287
    .line 288
    move-result-object v5

    .line 289
    aput-object v5, v4, v6

    .line 290
    .line 291
    iget-object v4, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 292
    .line 293
    aget-object v4, v4, v6

    .line 294
    .line 295
    invoke-virtual {v4, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    invoke-virtual {v2, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 300
    .line 301
    .line 302
    new-array v2, v3, [F

    .line 303
    .line 304
    aput v1, v2, v7

    .line 305
    .line 306
    aput v11, v2, v6

    .line 307
    .line 308
    aput v9, v2, v18

    .line 309
    .line 310
    aput v11, v2, v8

    .line 311
    .line 312
    aput v1, v2, v16

    .line 313
    .line 314
    aput v10, v2, v13

    .line 315
    .line 316
    aput v9, v2, v14

    .line 317
    .line 318
    aput v10, v2, v15

    .line 319
    .line 320
    iget-object v4, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 321
    .line 322
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 323
    .line 324
    .line 325
    move-result-object v5

    .line 326
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 327
    .line 328
    .line 329
    move-result-object v12

    .line 330
    invoke-virtual {v5, v12}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 331
    .line 332
    .line 333
    move-result-object v5

    .line 334
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 335
    .line 336
    .line 337
    move-result-object v5

    .line 338
    aput-object v5, v4, v18

    .line 339
    .line 340
    iget-object v4, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 341
    .line 342
    aget-object v4, v4, v18

    .line 343
    .line 344
    invoke-virtual {v4, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 345
    .line 346
    .line 347
    move-result-object v2

    .line 348
    invoke-virtual {v2, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 349
    .line 350
    .line 351
    new-array v2, v3, [F

    .line 352
    .line 353
    aput v11, v2, v7

    .line 354
    .line 355
    aput v9, v2, v6

    .line 356
    .line 357
    aput v11, v2, v18

    .line 358
    .line 359
    aput v1, v2, v8

    .line 360
    .line 361
    aput v10, v2, v16

    .line 362
    .line 363
    aput v9, v2, v13

    .line 364
    .line 365
    aput v10, v2, v14

    .line 366
    .line 367
    aput v1, v2, v15

    .line 368
    .line 369
    iget-object v1, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 370
    .line 371
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 372
    .line 373
    .line 374
    move-result-object v3

    .line 375
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 376
    .line 377
    .line 378
    move-result-object v4

    .line 379
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 380
    .line 381
    .line 382
    move-result-object v3

    .line 383
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 384
    .line 385
    .line 386
    move-result-object v3

    .line 387
    aput-object v3, v1, v8

    .line 388
    .line 389
    iget-object v0, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 390
    .line 391
    aget-object v0, v0, v8

    .line 392
    .line 393
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-virtual {v0, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 398
    .line 399
    .line 400
    return-void

    .line 401
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

    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
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

    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
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

    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
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

    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
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

.method public getBitmapSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBitmapTextureID()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureIDBitmap:I

    .line 2
    .line 3
    return p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nuniform samplerExternalOES inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvarying float oes_flag; \nvoid main() {\nif (oes_flag ==1.0) {   gl_FragColor = texture2D(inputImageTexture0, textureCoordinate);\n} else { \ngl_FragColor = texture2D(inputImageTexture1, textureCoordinate);} \n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 u_Matrix;\nattribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform float oesFlag; \nvarying float oes_flag; \nvoid main() {\n   oes_flag = oesFlag; \n   vec4 texPos = u_Matrix * vec4(inputTextureCoordinate, 1, 1);\n   textureCoordinate = texPos.xy;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initFBO()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ll/lej;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-direct {v0, v1, v2}, Ll/lej;-><init>(II)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-virtual {v0, v1, v2}, Ll/lej;->b(II)V

    .line 32
    .line 33
    .line 34
    const v0, 0x8d40

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const v1, 0x8cd5

    .line 42
    .line 43
    .line 44
    if-ne v0, v1, :cond_2

    .line 45
    .line 46
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSizeChanged:Z

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSizeChanged:Z

    .line 52
    .line 53
    :cond_1
    return-void

    .line 54
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 67
    .line 68
    .line 69
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
    const-string v1, "u_Matrix"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->matrixHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "inputImageTexture1"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->textureHandle1:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "oesFlag"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mOESLocation:I

    .line 33
    .line 34
    return-void
.end method

.method public initWithGLContext()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public loadTexture(ILandroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 141
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mIsOES:Z

    if-eqz v0, :cond_0

    .line 142
    iput p1, p0, Ll/wej;->texture_in:I

    .line 143
    iput-object p2, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    const/4 p1, 0x1

    .line 144
    iput p1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->updateText:I

    .line 145
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    :cond_0
    return-void
.end method

.method public loadTexture(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mIsOES:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_4

    .line 6
    .line 7
    :cond_0
    if-eqz p1, :cond_6

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_6

    .line 14
    .line 15
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureIDBitmap:I

    .line 16
    .line 17
    if-eqz v0, :cond_5

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iget v2, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmapHeight:I

    .line 33
    .line 34
    if-ne v0, v2, :cond_3

    .line 35
    .line 36
    iget v2, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmapWidth:I

    .line 37
    .line 38
    if-eq v1, v2, :cond_2

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureIDBitmap:I

    .line 42
    .line 43
    invoke-static {p1, v0}, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->updateBitmap(Landroid/graphics/Bitmap;I)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_3
    :goto_0
    iput v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmapWidth:I

    .line 48
    .line 49
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmapHeight:I

    .line 50
    .line 51
    invoke-virtual {p0, v1, v0}, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->setRenderSize(II)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureIDBitmap:I

    .line 56
    .line 57
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

    .line 58
    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 62
    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

    .line 66
    .line 67
    :cond_4
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureIDBitmap:I

    .line 72
    .line 73
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 74
    .line 75
    iget v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureIDBitmap:I

    .line 76
    .line 77
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

    .line 81
    .line 82
    :goto_1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 83
    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_5
    :goto_2
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmapWidth:I

    .line 91
    .line 92
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmapHeight:I

    .line 97
    .line 98
    iget v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmapWidth:I

    .line 99
    .line 100
    invoke-virtual {p0, v1, v0}, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->setRenderSize(II)V

    .line 101
    .line 102
    .line 103
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureIDBitmap:I

    .line 108
    .line 109
    if-lez v0, :cond_6

    .line 110
    .line 111
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 112
    .line 113
    iget v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureIDBitmap:I

    .line 114
    .line 115
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 116
    .line 117
    .line 118
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 121
    .line 122
    .line 123
    :cond_6
    :goto_3
    iget p1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mTextureIDBitmap:I

    .line 124
    .line 125
    iput p1, p0, Ll/wej;->texture_in:I

    .line 126
    .line 127
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSurfaceTextureBitmap:Landroid/graphics/SurfaceTexture;

    .line 128
    .line 129
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 130
    .line 131
    if-nez p1, :cond_7

    .line 132
    .line 133
    :goto_4
    return-void

    .line 134
    :cond_7
    const/4 p1, 0x1

    .line 135
    iput p1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->updateText:I

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public passShaderValues()V
    .locals 8

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
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 8
    .line 9
    const/16 v6, 0x8

    .line 10
    .line 11
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 12
    .line 13
    const/4 v3, 0x2

    .line 14
    const/16 v4, 0x1406

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    iget v2, p0, Ll/wej;->curRotation:I

    .line 28
    .line 29
    aget-object v0, v0, v2

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 35
    .line 36
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 37
    .line 38
    iget v3, p0, Ll/wej;->curRotation:I

    .line 39
    .line 40
    aget-object v7, v0, v3

    .line 41
    .line 42
    const/4 v3, 0x2

    .line 43
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 44
    .line 45
    .line 46
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 47
    .line 48
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 49
    .line 50
    .line 51
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mIsOES:Z

    .line 52
    .line 53
    iget v2, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mOESLocation:I

    .line 54
    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    const/high16 v0, 0x3f800000    # 1.0f

    .line 58
    .line 59
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    const/4 v0, 0x0

    .line 64
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 65
    .line 66
    .line 67
    :goto_0
    invoke-direct {p0}, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->bindTexture()V

    .line 68
    .line 69
    .line 70
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 71
    .line 72
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 73
    .line 74
    .line 75
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->textureHandle1:I

    .line 76
    .line 77
    const/4 v2, 0x1

    .line 78
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 79
    .line 80
    .line 81
    iget p0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->matrixHandle:I

    .line 82
    .line 83
    sget-object v0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->identityMatrix:[F

    .line 84
    .line 85
    invoke-static {p0, v2, v1, v0, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->texture_in:I

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    filled-new-array {v0}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 19
    .line 20
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mIsOES:Z

    .line 21
    .line 22
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mBitmap:Landroid/graphics/Bitmap;

    .line 23
    .line 24
    return-void
.end method

.method public setDisplayMode(III)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mDisplayMode:I

    .line 2
    .line 3
    if-ne v0, p3, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mInputHeight:I

    .line 6
    .line 7
    if-ne v0, p2, :cond_1

    .line 8
    .line 9
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mInputWidth:I

    .line 10
    .line 11
    if-eq v0, p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    iput p3, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mDisplayMode:I

    .line 16
    .line 17
    iput p2, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mInputHeight:I

    .line 18
    .line 19
    iput p1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mInputWidth:I

    .line 20
    .line 21
    invoke-super {p0, p1, p2, p3}, Ll/wej;->setDisplayMode(III)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setOESMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mIsOES:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRenderSize(II)V
    .locals 1

    .line 1
    if-lez p1, :cond_3

    .line 2
    .line 3
    if-gtz p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mWidthOutput:I

    .line 7
    .line 8
    if-ne p1, v0, :cond_1

    .line 9
    .line 10
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mHeightOutput:I

    .line 11
    .line 12
    if-eq p2, v0, :cond_2

    .line 13
    .line 14
    :cond_1
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSizeChanged:Z

    .line 16
    .line 17
    iput p2, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mHeightOutput:I

    .line 18
    .line 19
    iput p1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mWidthOutput:I

    .line 20
    .line 21
    :cond_2
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mSizeChanged:Z

    .line 22
    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-super {p0, p1, p2}, Ll/wej;->setRenderSize(II)V

    .line 26
    .line 27
    .line 28
    :cond_3
    :goto_0
    return-void
.end method

.method public updateYUVBuffer(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 0

    return-void
.end method
