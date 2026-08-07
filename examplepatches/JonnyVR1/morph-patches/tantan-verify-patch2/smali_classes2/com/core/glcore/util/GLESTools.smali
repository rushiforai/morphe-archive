.class public Lcom/core/glcore/util/GLESTools;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static FLOAT_SIZE_BYTES:I = 0x4

.field public static final NO_TEXTURE:I = -0x1

.field public static SHORT_SIZE_BYTES:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static checkGlError(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p0, ": glError 0x"

    .line 17
    .line 18
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "mediaRender"

    .line 33
    .line 34
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static createFrameBuff([I[III)V
    .locals 12

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-static {v0, p0, v1}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p1, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 7
    .line 8
    .line 9
    aget v0, p1, v1

    .line 10
    .line 11
    const/16 v2, 0xde1

    .line 12
    .line 13
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 14
    .line 15
    .line 16
    const/16 v10, 0x1401

    .line 17
    .line 18
    const/4 v11, 0x0

    .line 19
    const/16 v3, 0xde1

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    const/16 v5, 0x1908

    .line 23
    .line 24
    const/4 v8, 0x0

    .line 25
    const/16 v9, 0x1908

    .line 26
    .line 27
    move v6, p2

    .line 28
    move v7, p3

    .line 29
    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 30
    .line 31
    .line 32
    const-string p2, "createCamFrameBuff"

    .line 33
    .line 34
    invoke-static {p2}, Lcom/core/glcore/util/GLESTools;->checkGlError(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/16 p3, 0x2800

    .line 38
    .line 39
    const v0, 0x46180400    # 9729.0f

    .line 40
    .line 41
    .line 42
    invoke-static {v2, p3, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 43
    .line 44
    .line 45
    const/16 p3, 0x2801

    .line 46
    .line 47
    invoke-static {v2, p3, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 48
    .line 49
    .line 50
    const/16 p3, 0x2802

    .line 51
    .line 52
    const v0, 0x47012f00    # 33071.0f

    .line 53
    .line 54
    .line 55
    invoke-static {v2, p3, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 56
    .line 57
    .line 58
    const/16 p3, 0x2803

    .line 59
    .line 60
    invoke-static {v2, p3, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 61
    .line 62
    .line 63
    aget p0, p0, v1

    .line 64
    .line 65
    const p3, 0x8d40

    .line 66
    .line 67
    .line 68
    invoke-static {p3, p0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 69
    .line 70
    .line 71
    const p0, 0x8ce0

    .line 72
    .line 73
    .line 74
    aget p1, p1, v1

    .line 75
    .line 76
    invoke-static {p3, p0, v2, p1, v1}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 77
    .line 78
    .line 79
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 80
    .line 81
    .line 82
    invoke-static {p3, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 83
    .line 84
    .line 85
    invoke-static {p2}, Lcom/core/glcore/util/GLESTools;->checkGlError(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public static createProgram(Landroid/content/res/Resources;II)I
    .locals 0

    .line 112
    invoke-static {p0, p1}, Lcom/core/glcore/util/GLESTools;->readTextFile(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object p1

    .line 113
    invoke-static {p0, p2}, Lcom/core/glcore/util/GLESTools;->readTextFile(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object p0

    .line 114
    invoke-static {p1, p0}, Lcom/core/glcore/util/GLESTools;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static createProgram(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    if-eqz p1, :cond_3

    .line 5
    .line 6
    const v1, 0x8b31

    .line 7
    .line 8
    .line 9
    invoke-static {v1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const v2, 0x8b30

    .line 14
    .line 15
    .line 16
    invoke-static {v2}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-static {v1, p0}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v2, p1}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    new-array p0, p0, [I

    .line 28
    .line 29
    invoke-static {v1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 30
    .line 31
    .line 32
    const p1, 0x8b81

    .line 33
    .line 34
    .line 35
    invoke-static {v1, p1, p0, v0}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 36
    .line 37
    .line 38
    aget v3, p0, v0

    .line 39
    .line 40
    if-eqz v3, :cond_2

    .line 41
    .line 42
    invoke-static {v2}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 43
    .line 44
    .line 45
    invoke-static {v2, p1, p0, v0}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 46
    .line 47
    .line 48
    aget p1, p0, v0

    .line 49
    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 57
    .line 58
    .line 59
    invoke-static {p1, v2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 60
    .line 61
    .line 62
    invoke-static {p1}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 63
    .line 64
    .line 65
    const v1, 0x8b82

    .line 66
    .line 67
    .line 68
    invoke-static {p1, v1, p0, v0}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 69
    .line 70
    .line 71
    aget p0, p0, v0

    .line 72
    .line 73
    if-eqz p0, :cond_0

    .line 74
    .line 75
    return p1

    .line 76
    :cond_0
    const-string p0, "link program,failed:"

    .line 77
    .line 78
    invoke-static {p1}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {p0, p1}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    return v0

    .line 86
    :cond_1
    const-string p0, "fragment shader compile,failed:"

    .line 87
    .line 88
    invoke-static {v2}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p0, p1}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    return v0

    .line 96
    :cond_2
    const-string p0, "vertext shader compile,failed:"

    .line 97
    .line 98
    invoke-static {v1}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-static {p0, p1}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    return v0

    .line 106
    :cond_3
    const-string p0, "invalid shader code"

    .line 107
    .line 108
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return v0
.end method

.method public static loadTexture(Landroid/graphics/Bitmap;I)I
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    const/4 v2, -0x1

    .line 5
    const/16 v3, 0xde1

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    if-ne p1, v2, :cond_0

    .line 9
    .line 10
    invoke-static {v0, v1, v4}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 11
    .line 12
    .line 13
    aget p1, v1, v4

    .line 14
    .line 15
    invoke-static {v3, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 16
    .line 17
    .line 18
    const/16 p1, 0x2800

    .line 19
    .line 20
    const v0, 0x46180400    # 9729.0f

    .line 21
    .line 22
    .line 23
    invoke-static {v3, p1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 24
    .line 25
    .line 26
    const/16 p1, 0x2801

    .line 27
    .line 28
    invoke-static {v3, p1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 29
    .line 30
    .line 31
    const/16 p1, 0x2802

    .line 32
    .line 33
    const v0, 0x47012f00    # 33071.0f

    .line 34
    .line 35
    .line 36
    invoke-static {v3, p1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 37
    .line 38
    .line 39
    const/16 p1, 0x2803

    .line 40
    .line 41
    invoke-static {v3, p1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 42
    .line 43
    .line 44
    invoke-static {v3, v4, p0, v4}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 45
    .line 46
    .line 47
    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-static {v3, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 52
    .line 53
    .line 54
    invoke-static {v3, v4, v4, v4, p0}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;)V

    .line 55
    .line 56
    .line 57
    aput p1, v1, v4

    .line 58
    .line 59
    :goto_0
    aget p0, v1, v4

    .line 60
    .line 61
    return p0
.end method

.method public static readTextFile(Landroid/content/res/Resources;I)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ljava/io/BufferedReader;

    .line 6
    .line 7
    new-instance v0, Ljava/io/InputStreamReader;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 13
    .line 14
    .line 15
    new-instance p0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v0, "\n"

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :catch_0
    move-exception p0

    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    return-object p0
.end method
