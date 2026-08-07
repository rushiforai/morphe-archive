.class public Lcom/core/glcore/util/TextureHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bitmapToTexture(Landroid/graphics/Bitmap;)I
    .locals 5

    const/4 v0, 0x1

    .line 81
    new-array v1, v0, [I

    const/4 v2, 0x0

    .line 82
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 83
    aget v0, v1, v2

    const/16 v3, 0xde1

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v0, 0x2800

    const v4, 0x46180400    # 9729.0f

    .line 84
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2801

    .line 85
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2802

    const v4, 0x47012f00    # 33071.0f

    .line 86
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2803

    .line 87
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    if-eqz p0, :cond_0

    .line 88
    invoke-static {v3, v2, p0, v2}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 89
    :cond_0
    aget p0, v1, v2

    return p0
.end method

.method public static bitmapToTexture(Ll/umw;)I
    .locals 12

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
    const/16 v3, 0xde1

    .line 11
    .line 12
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 13
    .line 14
    .line 15
    const/16 v0, 0x2800

    .line 16
    .line 17
    const v4, 0x46180400    # 9729.0f

    .line 18
    .line 19
    .line 20
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0x2801

    .line 24
    .line 25
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 26
    .line 27
    .line 28
    const/16 v0, 0x2802

    .line 29
    .line 30
    const v4, 0x47012f00    # 33071.0f

    .line 31
    .line 32
    .line 33
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 34
    .line 35
    .line 36
    const/16 v0, 0x2803

    .line 37
    .line 38
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 39
    .line 40
    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/umw;->a()[B

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/umw;->e()I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    invoke-virtual {p0}, Ll/umw;->c()I

    .line 54
    .line 55
    .line 56
    move-result v7

    .line 57
    invoke-virtual {p0}, Ll/umw;->a()[B

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 62
    .line 63
    .line 64
    move-result-object v11

    .line 65
    const/16 v3, 0xde1

    .line 66
    .line 67
    const/4 v4, 0x0

    .line 68
    const/16 v5, 0x1908

    .line 69
    .line 70
    const/4 v8, 0x0

    .line 71
    const/16 v9, 0x1908

    .line 72
    .line 73
    const/16 v10, 0x1401

    .line 74
    .line 75
    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 76
    .line 77
    .line 78
    :cond_0
    aget p0, v1, v2

    .line 79
    .line 80
    return p0
.end method

.method public static byteToLuminanceTexture([BII)I
    .locals 14

    const/4 v0, 0x1

    .line 66
    new-array v1, v0, [I

    const/4 v2, 0x0

    .line 67
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 68
    aget v0, v1, v2

    const/16 v3, 0xde1

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v0, 0x2800

    const v4, 0x46180400    # 9729.0f

    .line 69
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2801

    .line 70
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2802

    const v4, 0x47012f00    # 33071.0f

    .line 71
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2803

    .line 72
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v12, 0x1401

    .line 73
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v13

    const/16 v5, 0xde1

    const/4 v6, 0x0

    const/16 v7, 0x1909

    const/4 v10, 0x0

    const/16 v11, 0x1909

    move v8, p1

    move/from16 v9, p2

    invoke-static/range {v5 .. v13}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 74
    aget p0, v1, v2

    return p0
.end method

.method public static byteToLuminanceTexture([BIII)I
    .locals 12

    .line 1
    const/4 p3, 0x1

    .line 2
    new-array v0, p3, [I

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {p3, v0, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 6
    .line 7
    .line 8
    aget v2, v0, v1

    .line 9
    .line 10
    const/16 v3, 0xde1

    .line 11
    .line 12
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 13
    .line 14
    .line 15
    const/16 v2, 0x2800

    .line 16
    .line 17
    const v4, 0x46180400    # 9729.0f

    .line 18
    .line 19
    .line 20
    invoke-static {v3, v2, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 21
    .line 22
    .line 23
    const/16 v2, 0x2801

    .line 24
    .line 25
    invoke-static {v3, v2, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 26
    .line 27
    .line 28
    const/16 v2, 0x2802

    .line 29
    .line 30
    const v4, 0x47012f00    # 33071.0f

    .line 31
    .line 32
    .line 33
    invoke-static {v3, v2, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 34
    .line 35
    .line 36
    const/16 v2, 0x2803

    .line 37
    .line 38
    invoke-static {v3, v2, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 39
    .line 40
    .line 41
    const/16 v2, 0xcf5

    .line 42
    .line 43
    invoke-static {v2, p3}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    .line 44
    .line 45
    .line 46
    const/16 v10, 0x1401

    .line 47
    .line 48
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 49
    .line 50
    .line 51
    move-result-object v11

    .line 52
    const/4 v4, 0x0

    .line 53
    const/16 v5, 0x1909

    .line 54
    .line 55
    const/4 v8, 0x0

    .line 56
    const/16 v9, 0x1909

    .line 57
    .line 58
    move v6, p1

    .line 59
    move v7, p2

    .line 60
    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 61
    .line 62
    .line 63
    aget p0, v0, v1

    .line 64
    .line 65
    return p0
.end method

.method public static byteToLuminanceTextureBytextureId(I[BII)I
    .locals 10

    .line 1
    const/16 v0, 0xde1

    .line 2
    .line 3
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 4
    .line 5
    .line 6
    const/16 v8, 0x1401

    .line 7
    .line 8
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    .line 11
    move-result-object v9

    .line 12
    const/16 v1, 0xde1

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/16 v3, 0x1909

    .line 16
    .line 17
    const/4 v6, 0x0

    .line 18
    const/16 v7, 0x1909

    .line 19
    .line 20
    move v4, p2

    .line 21
    move v5, p3

    .line 22
    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 23
    .line 24
    .line 25
    return p0
.end method

.method public static byteToTexture(Ljava/nio/ByteBuffer;II)I
    .locals 14

    const/4 v0, 0x1

    .line 64
    new-array v1, v0, [I

    const/4 v2, 0x0

    .line 65
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 66
    aget v0, v1, v2

    const/16 v3, 0xde1

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v0, 0x2800

    const v4, 0x46180400    # 9729.0f

    .line 67
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2801

    .line 68
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2802

    const v4, 0x47012f00    # 33071.0f

    .line 69
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2803

    .line 70
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v11, 0x1908

    const/16 v12, 0x1401

    const/16 v5, 0xde1

    const/4 v6, 0x0

    const/16 v7, 0x1908

    const/4 v10, 0x0

    move-object v13, p0

    move v8, p1

    move/from16 v9, p2

    .line 71
    invoke-static/range {v5 .. v13}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 72
    aget p0, v1, v2

    return p0
.end method

.method public static byteToTexture([BII)I
    .locals 14

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
    const/16 v3, 0xde1

    .line 11
    .line 12
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 13
    .line 14
    .line 15
    const/16 v0, 0x2800

    .line 16
    .line 17
    const v4, 0x46180400    # 9729.0f

    .line 18
    .line 19
    .line 20
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0x2801

    .line 24
    .line 25
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 26
    .line 27
    .line 28
    const/16 v0, 0x2802

    .line 29
    .line 30
    const v4, 0x47012f00    # 33071.0f

    .line 31
    .line 32
    .line 33
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 34
    .line 35
    .line 36
    const/16 v0, 0x2803

    .line 37
    .line 38
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 39
    .line 40
    .line 41
    const/16 v12, 0x1401

    .line 42
    .line 43
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    .line 46
    move-result-object v13

    .line 47
    const/16 v5, 0xde1

    .line 48
    .line 49
    const/4 v6, 0x0

    .line 50
    const/16 v7, 0x1908

    .line 51
    .line 52
    const/4 v10, 0x0

    .line 53
    const/16 v11, 0x1908

    .line 54
    .line 55
    move v8, p1

    .line 56
    move/from16 v9, p2

    .line 57
    .line 58
    invoke-static/range {v5 .. v13}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 59
    .line 60
    .line 61
    aget p0, v1, v2

    .line 62
    .line 63
    return p0
.end method

.method public static captureTextureToBitmap(IIII)Landroid/graphics/Bitmap;
    .locals 11

    .line 1
    const v7, 0x8d40

    .line 2
    .line 3
    .line 4
    const/4 v8, 0x0

    .line 5
    invoke-static {v7, v8}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 6
    .line 7
    .line 8
    if-lez p3, :cond_0

    .line 9
    .line 10
    if-lez p2, :cond_0

    .line 11
    .line 12
    const/4 v9, 0x1

    .line 13
    new-array v10, v9, [I

    .line 14
    .line 15
    invoke-static {v9, v10, v8}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 16
    .line 17
    .line 18
    aget v0, v10, v8

    .line 19
    .line 20
    invoke-static {v7, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 21
    .line 22
    .line 23
    const v0, 0x8ce0

    .line 24
    .line 25
    .line 26
    const/16 v1, 0xde1

    .line 27
    .line 28
    invoke-static {v7, v0, v1, p1, v8}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 29
    .line 30
    .line 31
    invoke-static {v7}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const v1, 0x8cd5

    .line 36
    .line 37
    .line 38
    if-ne v0, v1, :cond_0

    .line 39
    .line 40
    mul-int v0, p2, p3

    .line 41
    .line 42
    invoke-static {v0}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    const/16 v4, 0x1908

    .line 47
    .line 48
    const/16 v5, 0x1401

    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    const/4 v1, 0x0

    .line 52
    move v2, p2

    .line 53
    move v3, p3

    .line 54
    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 55
    .line 56
    .line 57
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 58
    .line 59
    invoke-static {p2, p3, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0, v6}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 64
    .line 65
    .line 66
    new-instance v5, Landroid/graphics/Matrix;

    .line 67
    .line 68
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 69
    .line 70
    .line 71
    const/high16 v1, 0x3f800000    # 1.0f

    .line 72
    .line 73
    const/high16 v4, -0x40800000    # -1.0f

    .line 74
    .line 75
    invoke-virtual {v5, v1, v4}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 76
    .line 77
    .line 78
    int-to-float v1, p0

    .line 79
    invoke-virtual {v5, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 80
    .line 81
    .line 82
    const/4 v2, 0x0

    .line 83
    const/4 v6, 0x1

    .line 84
    const/4 v1, 0x0

    .line 85
    move v3, p2

    .line 86
    move v4, p3

    .line 87
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {v7, v8}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 92
    .line 93
    .line 94
    invoke-static {v9, v10, v8}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 95
    .line 96
    .line 97
    return-object v0

    .line 98
    :cond_0
    const/4 v0, 0x0

    .line 99
    return-object v0
.end method

.method public static destroyTexture([I)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {v0, p0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static etc1ToTexture(Landroid/opengl/ETC1Util$ETC1Texture;)I
    .locals 12

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
    const/16 v3, 0xde1

    .line 11
    .line 12
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/opengl/ETC1Util$ETC1Texture;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v7

    .line 19
    invoke-virtual {p0}, Landroid/opengl/ETC1Util$ETC1Texture;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v8

    .line 23
    invoke-virtual {p0}, Landroid/opengl/ETC1Util$ETC1Texture;->getData()Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 28
    .line 29
    .line 30
    move-result v10

    .line 31
    invoke-virtual {p0}, Landroid/opengl/ETC1Util$ETC1Texture;->getData()Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object v11

    .line 35
    const/16 v4, 0xde1

    .line 36
    .line 37
    const/4 v5, 0x0

    .line 38
    const v6, 0x8d64

    .line 39
    .line 40
    .line 41
    const/4 v9, 0x0

    .line 42
    invoke-static/range {v4 .. v11}, Landroid/opengl/GLES20;->glCompressedTexImage2D(IIIIIIILjava/nio/Buffer;)V

    .line 43
    .line 44
    .line 45
    const/16 p0, 0x2800

    .line 46
    .line 47
    const v0, 0x46180400    # 9729.0f

    .line 48
    .line 49
    .line 50
    invoke-static {v3, p0, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 51
    .line 52
    .line 53
    const/16 p0, 0x2801

    .line 54
    .line 55
    invoke-static {v3, p0, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 56
    .line 57
    .line 58
    const/16 p0, 0x2802

    .line 59
    .line 60
    const v0, 0x47012f00    # 33071.0f

    .line 61
    .line 62
    .line 63
    invoke-static {v3, p0, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 64
    .line 65
    .line 66
    const/16 p0, 0x2803

    .line 67
    .line 68
    invoke-static {v3, p0, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 69
    .line 70
    .line 71
    aget p0, v1, v2

    .line 72
    .line 73
    return p0
.end method

.method public static loadDataToTexture(ILl/umw;)I
    .locals 10

    .line 1
    filled-new-array {p0}, [I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    aget v0, v0, v1

    .line 7
    .line 8
    const/16 v1, 0xde1

    .line 9
    .line 10
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 11
    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/umw;->a()[B

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/umw;->e()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-virtual {p1}, Ll/umw;->c()I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    invoke-virtual {p1}, Ll/umw;->a()[B

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object v9

    .line 37
    const/16 v1, 0xde1

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    const/16 v3, 0x1908

    .line 41
    .line 42
    const/4 v6, 0x0

    .line 43
    const/16 v7, 0x1908

    .line 44
    .line 45
    const/16 v8, 0x1401

    .line 46
    .line 47
    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return p0
.end method

.method public static snapPicture(III)Landroid/graphics/Bitmap;
    .locals 7

    const v0, 0x8d40

    const/4 v1, 0x0

    .line 68
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    if-lez p2, :cond_0

    if-lez p1, :cond_0

    mul-int v0, p1, p2

    .line 69
    invoke-static {v0}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    move-result-object v6

    const/16 v4, 0x1908

    const/16 v5, 0x1401

    const/4 v0, 0x0

    const/4 v1, 0x0

    move v2, p1

    move v3, p2

    .line 70
    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 71
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 72
    invoke-virtual {v0, v6}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 73
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v4, -0x40800000    # -1.0f

    .line 74
    invoke-virtual {v5, v1, v4}, Landroid/graphics/Matrix;->postScale(FF)Z

    int-to-float v1, p0

    .line 75
    invoke-virtual {v5, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    const/4 v2, 0x0

    const/4 v6, 0x1

    const/4 v1, 0x0

    move v3, p1

    move v4, p2

    .line 76
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static snapPicture(IIII)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    const/4 v1, -0x1

    .line 2
    if-eq p3, v1, :cond_0

    .line 3
    .line 4
    const v1, 0x8d40

    .line 5
    .line 6
    .line 7
    invoke-static {v1, p3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 8
    .line 9
    .line 10
    :cond_0
    if-lez p2, :cond_1

    .line 11
    .line 12
    if-lez p1, :cond_1

    .line 13
    .line 14
    mul-int v0, p1, p2

    .line 15
    .line 16
    invoke-static {v0}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    .line 17
    .line 18
    .line 19
    move-result-object v6

    .line 20
    const/16 v4, 0x1908

    .line 21
    .line 22
    const/16 v5, 0x1401

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    const/4 v1, 0x0

    .line 26
    move v2, p1

    .line 27
    move v3, p2

    .line 28
    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 29
    .line 30
    .line 31
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 32
    .line 33
    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, v6}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 38
    .line 39
    .line 40
    new-instance v5, Landroid/graphics/Matrix;

    .line 41
    .line 42
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 43
    .line 44
    .line 45
    const/high16 v1, 0x3f800000    # 1.0f

    .line 46
    .line 47
    const/high16 v4, -0x40800000    # -1.0f

    .line 48
    .line 49
    invoke-virtual {v5, v1, v4}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 50
    .line 51
    .line 52
    int-to-float v1, p0

    .line 53
    invoke-virtual {v5, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 54
    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    const/4 v6, 0x1

    .line 58
    const/4 v1, 0x0

    .line 59
    move v3, p1

    .line 60
    move v4, p2

    .line 61
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    return-object v0

    .line 66
    :cond_1
    const/4 v0, 0x0

    .line 67
    return-object v0
.end method

.method public static updateBitmap(Landroid/graphics/Bitmap;I)V
    .locals 2

    const/16 v0, 0xde1

    .line 70
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 p1, 0x2800

    const v1, 0x46180400    # 9729.0f

    .line 71
    invoke-static {v0, p1, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 p1, 0x2801

    .line 72
    invoke-static {v0, p1, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 p1, 0x2802

    const v1, 0x47012f00    # 33071.0f

    .line 73
    invoke-static {v0, p1, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 p1, 0x2803

    .line 74
    invoke-static {v0, p1, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    if-eqz p0, :cond_0

    const/4 p1, 0x0

    .line 75
    invoke-static {v0, p1, p1, p1, p0}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public static updateBitmap(Ll/umw;I)V
    .locals 9

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
    invoke-virtual {p0}, Ll/umw;->a()[B

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/umw;->e()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {p0}, Ll/umw;->c()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    invoke-virtual {p0}, Ll/umw;->a()[B

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    const/16 v0, 0xde1

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    const/16 v2, 0x1908

    .line 60
    .line 61
    const/4 v5, 0x0

    .line 62
    const/16 v6, 0x1908

    .line 63
    .line 64
    const/16 v7, 0x1401

    .line 65
    .line 66
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexSubImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method
