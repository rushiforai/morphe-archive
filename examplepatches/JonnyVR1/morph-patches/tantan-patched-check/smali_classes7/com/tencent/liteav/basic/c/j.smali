.class public Lcom/tencent/liteav/basic/c/j;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/basic/c/j$a;,
        Lcom/tencent/liteav/basic/c/j$b;
    }
.end annotation


# static fields
.field public static a:Ljava/nio/FloatBuffer;

.field public static b:Ljava/nio/FloatBuffer;

.field public static c:Ljava/nio/FloatBuffer;

.field public static d:Ljava/nio/FloatBuffer;

.field public static e:Ljava/nio/FloatBuffer;

.field private static f:[F

.field private static g:[F

.field private static h:[F

.field private static i:[F

.field private static j:[F

.field private static k:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v1, v0, [F

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Lcom/tencent/liteav/basic/c/j;->f:[F

    .line 9
    .line 10
    new-array v2, v0, [F

    .line 11
    .line 12
    fill-array-data v2, :array_1

    .line 13
    .line 14
    .line 15
    sput-object v2, Lcom/tencent/liteav/basic/c/j;->g:[F

    .line 16
    .line 17
    new-array v2, v0, [F

    .line 18
    .line 19
    fill-array-data v2, :array_2

    .line 20
    .line 21
    .line 22
    sput-object v2, Lcom/tencent/liteav/basic/c/j;->h:[F

    .line 23
    .line 24
    new-array v2, v0, [F

    .line 25
    .line 26
    fill-array-data v2, :array_3

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/tencent/liteav/basic/c/j;->i:[F

    .line 30
    .line 31
    new-array v0, v0, [F

    .line 32
    .line 33
    fill-array-data v0, :array_4

    .line 34
    .line 35
    .line 36
    sput-object v0, Lcom/tencent/liteav/basic/c/j;->j:[F

    .line 37
    .line 38
    invoke-static {v1}, Lcom/tencent/liteav/basic/c/j;->a([F)Ljava/nio/FloatBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sput-object v0, Lcom/tencent/liteav/basic/c/j;->a:Ljava/nio/FloatBuffer;

    .line 43
    .line 44
    sget-object v0, Lcom/tencent/liteav/basic/c/j;->g:[F

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tencent/liteav/basic/c/j;->a([F)Ljava/nio/FloatBuffer;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sput-object v0, Lcom/tencent/liteav/basic/c/j;->b:Ljava/nio/FloatBuffer;

    .line 51
    .line 52
    sget-object v0, Lcom/tencent/liteav/basic/c/j;->h:[F

    .line 53
    .line 54
    invoke-static {v0}, Lcom/tencent/liteav/basic/c/j;->a([F)Ljava/nio/FloatBuffer;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sput-object v0, Lcom/tencent/liteav/basic/c/j;->c:Ljava/nio/FloatBuffer;

    .line 59
    .line 60
    sget-object v0, Lcom/tencent/liteav/basic/c/j;->i:[F

    .line 61
    .line 62
    invoke-static {v0}, Lcom/tencent/liteav/basic/c/j;->a([F)Ljava/nio/FloatBuffer;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, Lcom/tencent/liteav/basic/c/j;->d:Ljava/nio/FloatBuffer;

    .line 67
    .line 68
    sget-object v0, Lcom/tencent/liteav/basic/c/j;->j:[F

    .line 69
    .line 70
    invoke-static {v0}, Lcom/tencent/liteav/basic/c/j;->a([F)Ljava/nio/FloatBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sput-object v0, Lcom/tencent/liteav/basic/c/j;->e:Ljava/nio/FloatBuffer;

    .line 75
    .line 76
    const/4 v0, 0x2

    .line 77
    sput v0, Lcom/tencent/liteav/basic/c/j;->k:I

    .line 78
    .line 79
    return-void

    .line 80
    nop

    .line 81
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

    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
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

    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
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

    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    :array_3
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

    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    :array_4
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
.end method

.method public static final a()I
    .locals 1

    .line 73
    sget v0, Lcom/tencent/liteav/basic/c/j;->k:I

    return v0
.end method

.method public static a(IIII)I
    .locals 1

    const/4 v0, 0x0

    .line 110
    invoke-static {p0, p1, p2, p3, v0}, Lcom/tencent/liteav/basic/c/j;->a(IIIILjava/nio/IntBuffer;)I

    move-result p0

    return p0
.end method

.method public static a(IIIILjava/nio/IntBuffer;)I
    .locals 11

    .line 106
    invoke-static {}, Lcom/tencent/liteav/basic/c/j;->c()I

    move-result v0

    const/16 v1, 0xde1

    .line 107
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/4 v7, 0x0

    const/16 v9, 0x1401

    const/16 v2, 0xde1

    const/4 v3, 0x0

    move v5, p0

    move v6, p1

    move v4, p2

    move v8, p3

    move-object v10, p4

    .line 108
    invoke-static/range {v2 .. v10}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    const/4 p0, 0x0

    .line 109
    invoke-static {v1, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    return v0
.end method

.method public static a(IIII[I)I
    .locals 14

    move-object/from16 v0, p4

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 93
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 94
    aget v1, v0, v2

    const/16 v3, 0xde1

    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v1, 0x2802

    const v4, 0x812f

    .line 95
    invoke-static {v3, v1, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v1, 0x2803

    .line 96
    invoke-static {v3, v1, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v1, 0x2801

    const/16 v4, 0x2600

    .line 97
    invoke-static {v3, v1, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v1, 0x2800

    const/16 v4, 0x2601

    .line 98
    invoke-static {v3, v1, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v12, 0x1401

    const/4 v13, 0x0

    const/16 v5, 0xde1

    const/4 v6, 0x0

    const/4 v10, 0x0

    move v8, p0

    move v9, p1

    move/from16 v7, p2

    move/from16 v11, p3

    .line 99
    invoke-static/range {v5 .. v13}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 100
    aget p0, v0, v2

    return p0
.end method

.method public static a(II[I)I
    .locals 3

    mul-int/2addr p0, p1

    mul-int/lit8 p0, p0, 0x4

    const/4 p1, 0x1

    const/4 v0, 0x0

    .line 124
    invoke-static {p1, p2, v0}, Landroid/opengl/GLES20;->glGenBuffers(I[II)V

    .line 125
    aget p1, p2, v0

    const v1, 0x88eb

    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    const/4 p1, 0x0

    const v2, 0x88e9

    .line 126
    invoke-static {v1, p0, p1, v2}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 127
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 128
    aget p0, p2, v0

    return p0
.end method

.method public static a(Landroid/graphics/Bitmap;IZ)I
    .locals 5

    const/4 v0, 0x1

    .line 111
    new-array v1, v0, [I

    const/4 v2, -0x1

    const/16 v3, 0xde1

    const/4 v4, 0x0

    if-ne p1, v2, :cond_0

    .line 112
    invoke-static {v0, v1, v4}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 113
    aget p1, v1, v4

    invoke-static {v3, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 p1, 0x2800

    const v0, 0x46180400    # 9729.0f

    .line 114
    invoke-static {v3, p1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 p1, 0x2801

    .line 115
    invoke-static {v3, p1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 p1, 0x2802

    const v0, 0x47012f00    # 33071.0f

    .line 116
    invoke-static {v3, p1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 p1, 0x2803

    .line 117
    invoke-static {v3, p1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 118
    invoke-static {v3, v4, p0, v4}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    goto :goto_0

    .line 119
    :cond_0
    invoke-static {v3, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 120
    invoke-static {v3, v4, v4, v4, p0}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;)V

    .line 121
    aput p1, v1, v4

    :goto_0
    if-eqz p2, :cond_1

    .line 122
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 123
    :cond_1
    aget p0, v1, v4

    return p0
.end method

.method public static a(Ljava/lang/String;I)I
    .locals 2

    const/4 v0, 0x1

    .line 134
    new-array v0, v0, [I

    .line 135
    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result p1

    .line 136
    invoke-static {p1, p0}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 137
    invoke-static {p1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    const p0, 0x8b81

    const/4 v1, 0x0

    .line 138
    invoke-static {p1, p0, v0, v1}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 139
    aget p0, v0, v1

    if-nez p0, :cond_0

    .line 140
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "Compilation\n"

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "Load Shader Failed"

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    return p1
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)I
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    const v1, 0x8b31

    .line 5
    .line 6
    .line 7
    invoke-static {p0, v1}, Lcom/tencent/liteav/basic/c/j;->a(Ljava/lang/String;I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const-string v1, "Load Program"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    const-string p0, "Vertex Shader Failed"

    .line 17
    .line 18
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return v2

    .line 22
    :cond_0
    const v3, 0x8b30

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v3}, Lcom/tencent/liteav/basic/c/j;->a(Ljava/lang/String;I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    const-string p0, "Fragment Shader Failed"

    .line 32
    .line 33
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return v2

    .line 37
    :cond_1
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-static {v3, p0}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 42
    .line 43
    .line 44
    invoke-static {v3, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 45
    .line 46
    .line 47
    invoke-static {v3}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 48
    .line 49
    .line 50
    const v4, 0x8b82

    .line 51
    .line 52
    .line 53
    invoke-static {v3, v4, v0, v2}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 54
    .line 55
    .line 56
    aget v0, v0, v2

    .line 57
    .line 58
    if-gtz v0, :cond_2

    .line 59
    .line 60
    const-string p0, "Linking Failed"

    .line 61
    .line 62
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return v2

    .line 66
    :cond_2
    invoke-static {p0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 67
    .line 68
    .line 69
    invoke-static {p1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 70
    .line 71
    .line 72
    return v3
.end method

.method public static a(Lcom/tencent/liteav/basic/c/j$a;)Lcom/tencent/liteav/basic/c/j$a;
    .locals 4

    if-eqz p0, :cond_2

    .line 87
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/j$a;->a:[I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    .line 88
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 89
    iput-object v3, p0, Lcom/tencent/liteav/basic/c/j$a;->a:[I

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/j$a;->b:[I

    if-eqz v0, :cond_1

    .line 91
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 92
    iput-object v3, p0, Lcom/tencent/liteav/basic/c/j$a;->b:[I

    :cond_1
    return-object v3

    :cond_2
    return-object p0
.end method

.method public static a(Lcom/tencent/liteav/basic/c/j$a;II)Lcom/tencent/liteav/basic/c/j$a;
    .locals 2

    if-nez p0, :cond_0

    .line 79
    new-instance p0, Lcom/tencent/liteav/basic/c/j$a;

    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/j$a;-><init>()V

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/j$a;->a:[I

    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 81
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/tencent/liteav/basic/c/j$a;->a:[I

    .line 82
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/j$a;->b:[I

    if-nez v0, :cond_2

    .line 83
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/tencent/liteav/basic/c/j$a;->b:[I

    .line 84
    :cond_2
    iput p1, p0, Lcom/tencent/liteav/basic/c/j$a;->c:I

    .line 85
    iput p2, p0, Lcom/tencent/liteav/basic/c/j$a;->d:I

    .line 86
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/j$a;->a:[I

    iget-object v1, p0, Lcom/tencent/liteav/basic/c/j$a;->b:[I

    invoke-static {v0, v1, p1, p2}, Lcom/tencent/liteav/basic/c/j;->a([I[III)V

    return-object p0
.end method

.method public static a([F)Ljava/nio/FloatBuffer;
    .locals 2

    .line 101
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 102
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 103
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    .line 104
    invoke-virtual {v0, p0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    const/4 p0, 0x0

    .line 105
    invoke-virtual {v0, p0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    return-object v0
.end method

.method public static a(I)V
    .locals 0

    .line 141
    sput p0, Lcom/tencent/liteav/basic/c/j;->k:I

    return-void
.end method

.method public static a([I[III)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 129
    invoke-static {v0, p0, v1}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    const/16 v0, 0x1908

    .line 130
    invoke-static {p2, p3, v0, v0, p1}, Lcom/tencent/liteav/basic/c/j;->a(IIII[I)I

    move-result p2

    aput p2, p1, v1

    .line 131
    aget p0, p0, v1

    const p2, 0x8d40

    invoke-static {p2, p0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const/16 p0, 0xde1

    .line 132
    aget p1, p1, v1

    const p3, 0x8ce0

    invoke-static {p2, p3, p0, p1, v1}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 133
    invoke-static {p2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    return-void
.end method

.method public static a([Lcom/tencent/liteav/basic/c/j$a;)V
    .locals 3

    if-eqz p0, :cond_1

    .line 74
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p0, v1

    if-eqz v2, :cond_0

    .line 75
    invoke-static {v2}, Lcom/tencent/liteav/basic/c/j;->a(Lcom/tencent/liteav/basic/c/j$a;)Lcom/tencent/liteav/basic/c/j$a;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static a([Lcom/tencent/liteav/basic/c/j$a;III)[Lcom/tencent/liteav/basic/c/j$a;
    .locals 1

    if-nez p0, :cond_0

    .line 76
    new-array p0, p1, [Lcom/tencent/liteav/basic/c/j$a;

    :cond_0
    const/4 p1, 0x0

    .line 77
    :goto_0
    array-length v0, p0

    if-ge p1, v0, :cond_1

    .line 78
    aget-object v0, p0, p1

    invoke-static {v0, p2, p3}, Lcom/tencent/liteav/basic/c/j;->a(Lcom/tencent/liteav/basic/c/j$a;II)Lcom/tencent/liteav/basic/c/j$a;

    move-result-object v0

    aput-object v0, p0, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public static b()I
    .locals 5

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
    const v3, 0x8d65

    .line 11
    .line 12
    .line 13
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 14
    .line 15
    .line 16
    const/16 v0, 0x2801

    .line 17
    .line 18
    const v4, 0x46180400    # 9729.0f

    .line 19
    .line 20
    .line 21
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x2800

    .line 25
    .line 26
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 27
    .line 28
    .line 29
    const/16 v0, 0x2802

    .line 30
    .line 31
    const v4, 0x812f

    .line 32
    .line 33
    .line 34
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 35
    .line 36
    .line 37
    const/16 v0, 0x2803

    .line 38
    .line 39
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 40
    .line 41
    .line 42
    aget v0, v1, v2

    .line 43
    .line 44
    return v0
.end method

.method public static c()I
    .locals 5

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
    const/16 v0, 0x2801

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
    const/16 v0, 0x2800

    .line 24
    .line 25
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 26
    .line 27
    .line 28
    const/16 v0, 0x2802

    .line 29
    .line 30
    const v4, 0x812f

    .line 31
    .line 32
    .line 33
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 34
    .line 35
    .line 36
    const/16 v0, 0x2803

    .line 37
    .line 38
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 39
    .line 40
    .line 41
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 42
    .line 43
    .line 44
    aget v0, v1, v2

    .line 45
    .line 46
    return v0
.end method
