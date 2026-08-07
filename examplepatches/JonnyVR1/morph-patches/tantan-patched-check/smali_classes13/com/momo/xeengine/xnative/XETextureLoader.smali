.class public final Lcom/momo/xeengine/xnative/XETextureLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static getBitmap(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    :try_start_0
    invoke-static {}, Lcom/momo/xeengine/XEnginePreferences;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 21
    .line 22
    .line 23
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    return-object v1

    .line 27
    :cond_0
    invoke-static {v2, v1, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catch_0
    return-object v1

    .line 32
    :cond_1
    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 33
    .line 34
    .line 35
    move-object v2, v1

    .line 36
    :goto_0
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 37
    .line 38
    if-lez v3, :cond_4

    .line 39
    .line 40
    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 41
    .line 42
    if-gtz v0, :cond_2

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    invoke-static {v3, v0}, Lcom/momo/xeengine/xnative/XETextureLoader;->getBitmapDecodeOptions(II)Landroid/graphics/BitmapFactory$Options;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->reset()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 52
    .line 53
    .line 54
    invoke-static {v2, v1, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :catch_1
    return-object v1

    .line 60
    :cond_3
    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_4
    :goto_1
    return-object v1
.end method

.method private static getBitmapDecodeOptions(II)Landroid/graphics/BitmapFactory$Options;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inPremultiplied:Z

    .line 10
    .line 11
    iput-object v1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 12
    .line 13
    const/16 v1, 0x800

    .line 14
    .line 15
    if-gt p0, v1, :cond_1

    .line 16
    .line 17
    if-le p1, v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-object v0

    .line 21
    :cond_1
    :goto_0
    div-int/2addr p0, v1

    .line 22
    div-int/2addr p1, v1

    .line 23
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    iput p0, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 28
    .line 29
    return-object v0
.end method

.method public static loadTexture(Ljava/lang/String;Ljava/lang/String;ZJI)J
    .locals 13

    .line 126
    invoke-static {p0, p2}, Lcom/momo/xeengine/xnative/XETextureLoader;->getBitmap(Ljava/lang/String;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    const-wide/16 v0, 0x0

    if-nez p0, :cond_0

    return-wide v0

    .line 127
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    if-eq v2, v3, :cond_1

    return-wide v0

    .line 128
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    .line 129
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    if-eqz v7, :cond_3

    if-nez v8, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    .line 130
    new-array v1, v0, [I

    const/4 v2, 0x0

    .line 131
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    const v0, 0x84c0

    .line 132
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 133
    aget v0, v1, v2

    const/16 v3, 0xde1

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v11, 0x1401

    const/4 v12, 0x0

    const/16 v4, 0xde1

    const/4 v5, 0x0

    const/16 v6, 0x1908

    const/4 v9, 0x0

    const/16 v10, 0x1908

    .line 134
    invoke-static/range {v4 .. v12}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    const/16 v0, 0x2801

    const/high16 v4, 0x46180000    # 9728.0f

    .line 135
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2800

    const v4, 0x46180400    # 9729.0f

    .line 136
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2802

    const v4, 0x812f

    .line 137
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2803

    .line 138
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 139
    invoke-static {v3, v2, v2, v2, p0}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;)V

    .line 140
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 141
    aget p0, v1, v2

    move-object v6, p1

    move-wide/from16 v4, p3

    move/from16 v10, p5

    move v9, v8

    move v8, v7

    move v7, p0

    invoke-static/range {v4 .. v10}, Lcom/momo/xeengine/xnative/XETextureLoader;->nativeCreateTexture2D(JLjava/lang/String;IIII)J

    move-result-wide p0

    return-wide p0

    :cond_3
    :goto_0
    return-wide v0
.end method

.method public static loadTexture([BLjava/lang/String;JI)J
    .locals 14

    .line 1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inPremultiplied:Z

    .line 8
    .line 9
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    iput-object v2, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 12
    .line 13
    array-length v3, p0

    .line 14
    invoke-static {p0, v1, v3, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-wide/16 v3, 0x0

    .line 19
    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    return-wide v3

    .line 23
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eq v0, v2, :cond_1

    .line 28
    .line 29
    return-wide v3

    .line 30
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v8

    .line 34
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 35
    .line 36
    .line 37
    move-result v9

    .line 38
    if-eqz v8, :cond_3

    .line 39
    .line 40
    if-nez v9, :cond_2

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    const/4 v0, 0x1

    .line 44
    new-array v2, v0, [I

    .line 45
    .line 46
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 47
    .line 48
    .line 49
    const v0, 0x84c0

    .line 50
    .line 51
    .line 52
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 53
    .line 54
    .line 55
    aget v0, v2, v1

    .line 56
    .line 57
    const/16 v3, 0xde1

    .line 58
    .line 59
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 60
    .line 61
    .line 62
    const/16 v12, 0x1401

    .line 63
    .line 64
    const/4 v13, 0x0

    .line 65
    const/16 v5, 0xde1

    .line 66
    .line 67
    const/4 v6, 0x0

    .line 68
    const/16 v7, 0x1908

    .line 69
    .line 70
    const/4 v10, 0x0

    .line 71
    const/16 v11, 0x1908

    .line 72
    .line 73
    invoke-static/range {v5 .. v13}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 74
    .line 75
    .line 76
    const/16 v0, 0x2801

    .line 77
    .line 78
    const/high16 v4, 0x46180000    # 9728.0f

    .line 79
    .line 80
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 81
    .line 82
    .line 83
    const/16 v0, 0x2800

    .line 84
    .line 85
    const v4, 0x46180400    # 9729.0f

    .line 86
    .line 87
    .line 88
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 89
    .line 90
    .line 91
    const/16 v0, 0x2802

    .line 92
    .line 93
    const v4, 0x812f

    .line 94
    .line 95
    .line 96
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 97
    .line 98
    .line 99
    const/16 v0, 0x2803

    .line 100
    .line 101
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 102
    .line 103
    .line 104
    invoke-static {v3, v1, v1, v1, p0}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 108
    .line 109
    .line 110
    aget p0, v2, v1

    .line 111
    .line 112
    move-object v7, p1

    .line 113
    move-wide/from16 v5, p2

    .line 114
    .line 115
    move/from16 v11, p4

    .line 116
    .line 117
    move v10, v9

    .line 118
    move v9, v8

    .line 119
    move v8, p0

    .line 120
    invoke-static/range {v5 .. v11}, Lcom/momo/xeengine/xnative/XETextureLoader;->nativeCreateTexture2D(JLjava/lang/String;IIII)J

    .line 121
    .line 122
    .line 123
    move-result-wide v0

    .line 124
    return-wide v0

    .line 125
    :cond_3
    :goto_0
    return-wide v3
.end method

.method private static native nativeCreateTexture2D(JLjava/lang/String;IIII)J
.end method
