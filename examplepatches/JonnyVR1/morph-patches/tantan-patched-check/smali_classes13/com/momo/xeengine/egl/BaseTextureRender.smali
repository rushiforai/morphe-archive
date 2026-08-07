.class public Lcom/momo/xeengine/egl/BaseTextureRender;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field private static final DefaultTextureMatrix:[F

.field private static final DefaultVertexMatrix:[F

.field private static final TextureCo:[F

.field private static final VertexCo:[F

.field private static mTextureMatrix:[F

.field private static mVertexMatrix:[F


# instance fields
.field private final mFragment:Ljava/lang/String;

.field private mGLProgram:I

.field private mGLTexture:I

.field private mGLTextureCo:I

.field private mGLTextureMatrix:I

.field private mGLVertexCo:I

.field private mGLVertexMatrix:I

.field private mTextureBuffer:Ljava/nio/FloatBuffer;

.field private final mVAO:[I

.field private final mVBOs:[I

.field private final mVertex:Ljava/lang/String;

.field private mVertexBuffer:Ljava/nio/FloatBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v1, v0, [F

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Lcom/momo/xeengine/egl/BaseTextureRender;->DefaultVertexMatrix:[F

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    sput-object v1, Lcom/momo/xeengine/egl/BaseTextureRender;->mTextureMatrix:[F

    .line 12
    .line 13
    new-array v0, v0, [F

    .line 14
    .line 15
    fill-array-data v0, :array_1

    .line 16
    .line 17
    .line 18
    sput-object v0, Lcom/momo/xeengine/egl/BaseTextureRender;->DefaultTextureMatrix:[F

    .line 19
    .line 20
    const/16 v0, 0x8

    .line 21
    .line 22
    new-array v1, v0, [F

    .line 23
    .line 24
    fill-array-data v1, :array_2

    .line 25
    .line 26
    .line 27
    sput-object v1, Lcom/momo/xeengine/egl/BaseTextureRender;->TextureCo:[F

    .line 28
    .line 29
    new-array v0, v0, [F

    .line 30
    .line 31
    fill-array-data v0, :array_3

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/momo/xeengine/egl/BaseTextureRender;->VertexCo:[F

    .line 35
    .line 36
    return-void

    .line 37
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

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    :array_1
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

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
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
    :array_2
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

    :array_3
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [I

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVBOs:[I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    new-array v0, v0, [I

    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVAO:[I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLProgram:I

    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    iput v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLVertexCo:I

    .line 19
    .line 20
    iput v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLTextureCo:I

    .line 21
    .line 22
    iput v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLVertexMatrix:I

    .line 23
    .line 24
    iput v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLTextureMatrix:I

    .line 25
    .line 26
    iput v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLTexture:I

    .line 27
    .line 28
    iput-object p1, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVertex:Ljava/lang/String;

    .line 29
    .line 30
    iput-object p2, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mFragment:Ljava/lang/String;

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/momo/xeengine/egl/BaseTextureRender;->initBuffer()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private static checkError(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, " glError: 0x"

    .line 16
    .line 17
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "HongjieFu"

    .line 32
    .line 33
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method private createGLProgram(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4

    .line 1
    const v0, 0x8b31

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, v0, p1}, Lcom/momo/xeengine/egl/BaseTextureRender;->loadShader(ILjava/lang/String;)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 v0, 0x0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    const v1, 0x8b30

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, v1, p2}, Lcom/momo/xeengine/egl/BaseTextureRender;->loadShader(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_2

    .line 27
    .line 28
    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 29
    .line 30
    .line 31
    invoke-static {p2, p0}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 32
    .line 33
    .line 34
    invoke-static {p2}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 35
    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    new-array v2, v1, [I

    .line 39
    .line 40
    const v3, 0x8b82

    .line 41
    .line 42
    .line 43
    invoke-static {p2, v3, v2, v0}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 44
    .line 45
    .line 46
    aget v2, v2, v0

    .line 47
    .line 48
    if-eq v2, v1, :cond_2

    .line 49
    .line 50
    invoke-static {p2}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v2, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v3, "Program linking failed: "

    .line 57
    .line 58
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const-string v2, "BaseTextureRender"

    .line 69
    .line 70
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    invoke-static {p2}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    move v0, p2

    .line 78
    :goto_0
    if-lez p1, :cond_3

    .line 79
    .line 80
    invoke-static {p1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 81
    .line 82
    .line 83
    :cond_3
    if-lez p0, :cond_4

    .line 84
    .line 85
    invoke-static {p0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 86
    .line 87
    .line 88
    :cond_4
    return v0
.end method

.method private createVBOAndVAO()V
    .locals 13

    .line 1
    iget v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLVertexCo:I

    .line 2
    .line 3
    const-string v1, "BaseTextureRender"

    .line 4
    .line 5
    if-ltz v0, :cond_2

    .line 6
    .line 7
    iget v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLTextureCo:I

    .line 8
    .line 9
    if-gez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_0

    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    new-array v2, v0, [I

    .line 15
    .line 16
    new-array v3, v0, [I

    .line 17
    .line 18
    const v4, 0x8894

    .line 19
    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    invoke-static {v4, v2, v5}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 23
    .line 24
    .line 25
    const v4, 0x85b5

    .line 26
    .line 27
    .line 28
    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 29
    .line 30
    .line 31
    const/4 v4, 0x2

    .line 32
    iget-object v6, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVBOs:[I

    .line 33
    .line 34
    invoke-static {v4, v6, v5}, Landroid/opengl/GLES20;->glGenBuffers(I[II)V

    .line 35
    .line 36
    .line 37
    iget-object v4, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVBOs:[I

    .line 38
    .line 39
    aget v4, v4, v5

    .line 40
    .line 41
    const v6, 0x8892

    .line 42
    .line 43
    .line 44
    invoke-static {v6, v4}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 45
    .line 46
    .line 47
    sget-object v4, Lcom/momo/xeengine/egl/BaseTextureRender;->VertexCo:[F

    .line 48
    .line 49
    array-length v4, v4

    .line 50
    mul-int/lit8 v4, v4, 0x4

    .line 51
    .line 52
    iget-object v7, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    .line 53
    .line 54
    const v8, 0x88e4

    .line 55
    .line 56
    .line 57
    invoke-static {v6, v4, v7, v8}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 58
    .line 59
    .line 60
    iget-object v4, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVBOs:[I

    .line 61
    .line 62
    aget v4, v4, v0

    .line 63
    .line 64
    invoke-static {v6, v4}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 65
    .line 66
    .line 67
    sget-object v4, Lcom/momo/xeengine/egl/BaseTextureRender;->TextureCo:[F

    .line 68
    .line 69
    array-length v4, v4

    .line 70
    mul-int/lit8 v4, v4, 0x4

    .line 71
    .line 72
    iget-object v7, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mTextureBuffer:Ljava/nio/FloatBuffer;

    .line 73
    .line 74
    invoke-static {v6, v4, v7, v8}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 75
    .line 76
    .line 77
    iget-object v4, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVAO:[I

    .line 78
    .line 79
    invoke-static {v0, v4, v5}, Landroid/opengl/GLES30;->glGenVertexArrays(I[II)V

    .line 80
    .line 81
    .line 82
    iget-object v4, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVAO:[I

    .line 83
    .line 84
    aget v4, v4, v5

    .line 85
    .line 86
    invoke-static {v4}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    .line 87
    .line 88
    .line 89
    iget-object v4, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVBOs:[I

    .line 90
    .line 91
    aget v4, v4, v5

    .line 92
    .line 93
    invoke-static {v6, v4}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 94
    .line 95
    .line 96
    iget v7, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLVertexCo:I

    .line 97
    .line 98
    const/4 v11, 0x0

    .line 99
    const/4 v12, 0x0

    .line 100
    const/4 v8, 0x2

    .line 101
    const/16 v9, 0x1406

    .line 102
    .line 103
    const/4 v10, 0x0

    .line 104
    invoke-static/range {v7 .. v12}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    .line 105
    .line 106
    .line 107
    iget v4, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLVertexCo:I

    .line 108
    .line 109
    invoke-static {v4}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 110
    .line 111
    .line 112
    iget-object v4, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVBOs:[I

    .line 113
    .line 114
    aget v4, v4, v0

    .line 115
    .line 116
    invoke-static {v6, v4}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 117
    .line 118
    .line 119
    iget v7, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLTextureCo:I

    .line 120
    .line 121
    invoke-static/range {v7 .. v12}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    .line 122
    .line 123
    .line 124
    iget v4, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLTextureCo:I

    .line 125
    .line 126
    invoke-static {v4}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 127
    .line 128
    .line 129
    aget v3, v3, v5

    .line 130
    .line 131
    invoke-static {v3}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    .line 132
    .line 133
    .line 134
    aget v2, v2, v5

    .line 135
    .line 136
    invoke-static {v6, v2}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 137
    .line 138
    .line 139
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-eqz v2, :cond_1

    .line 144
    .line 145
    new-instance p0, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    const-string v0, "VBO/VAO creation failed with error: 0x"

    .line 148
    .line 149
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_1
    iget-object v1, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVBOs:[I

    .line 168
    .line 169
    aget v2, v1, v5

    .line 170
    .line 171
    aget v0, v1, v0

    .line 172
    .line 173
    iget-object p0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVAO:[I

    .line 174
    .line 175
    aget p0, p0, v5

    .line 176
    .line 177
    return-void

    .line 178
    :cond_2
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    const-string v2, "Invalid attribute locations - Vertex: "

    .line 181
    .line 182
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    iget v2, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLVertexCo:I

    .line 186
    .line 187
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    const-string v2, ", Texture: "

    .line 191
    .line 192
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    iget p0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLTextureCo:I

    .line 196
    .line 197
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method private initBuffer()V
    .locals 3

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    .line 19
    .line 20
    sget-object v2, Lcom/momo/xeengine/egl/BaseTextureRender;->VertexCo:[F

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mTextureBuffer:Ljava/nio/FloatBuffer;

    .line 47
    .line 48
    sget-object v1, Lcom/momo/xeengine/egl/BaseTextureRender;->TextureCo:[F

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mTextureBuffer:Ljava/nio/FloatBuffer;

    .line 54
    .line 55
    invoke-virtual {p0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private loadShader(ILjava/lang/String;)I
    .locals 3

    .line 1
    const-string p0, "BaseTextureRender"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    const-string p1, "Shader source is null"

    .line 7
    .line 8
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 22
    .line 23
    .line 24
    const/4 p2, 0x1

    .line 25
    new-array p2, p2, [I

    .line 26
    .line 27
    const v1, 0x8b81

    .line 28
    .line 29
    .line 30
    invoke-static {p1, v1, p2, v0}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 31
    .line 32
    .line 33
    aget p2, p2, v0

    .line 34
    .line 35
    if-nez p2, :cond_1

    .line 36
    .line 37
    invoke-static {p1}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v2, "Shader compilation failed: "

    .line 44
    .line 45
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    invoke-static {p1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 59
    .line 60
    .line 61
    return v0

    .line 62
    :cond_1
    return p1
.end method

.method private onBindTexture(I)V
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
    const/16 v0, 0xde1

    .line 8
    .line 9
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 10
    .line 11
    .line 12
    iget p0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLTexture:I

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private onClear()V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0, p0, p0, p0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 3
    .line 4
    .line 5
    const/16 p0, 0x4100

    .line 6
    .line 7
    invoke-static {p0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private onCreate()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVertex:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mFragment:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/momo/xeengine/egl/BaseTextureRender;->createGLProgram(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLProgram:I

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string p0, "BaseTextureRender"

    .line 14
    .line 15
    const-string v0, "Failed to create GL program"

    .line 16
    .line 17
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string v1, "aVertexCo"

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLVertexCo:I

    .line 28
    .line 29
    iget v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLProgram:I

    .line 30
    .line 31
    const-string v1, "aTextureCo"

    .line 32
    .line 33
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLTextureCo:I

    .line 38
    .line 39
    iget v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLProgram:I

    .line 40
    .line 41
    const-string v1, "uVertexMatrix"

    .line 42
    .line 43
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLVertexMatrix:I

    .line 48
    .line 49
    iget v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLProgram:I

    .line 50
    .line 51
    const-string v1, "uTextureMatrix"

    .line 52
    .line 53
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLTextureMatrix:I

    .line 58
    .line 59
    iget v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLProgram:I

    .line 60
    .line 61
    const-string v1, "uTexture"

    .line 62
    .line 63
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iput v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLTexture:I

    .line 68
    .line 69
    invoke-direct {p0}, Lcom/momo/xeengine/egl/BaseTextureRender;->createVBOAndVAO()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method private onDraw()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    const v1, 0x85b5

    .line 5
    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVAO:[I

    .line 12
    .line 13
    aget p0, p0, v2

    .line 14
    .line 15
    invoke-static {p0}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x5

    .line 19
    const/4 v1, 0x4

    .line 20
    invoke-static {p0, v2, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 21
    .line 22
    .line 23
    aget p0, v0, v2

    .line 24
    .line 25
    invoke-static {p0}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private onSetExpandData()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLVertexMatrix:I

    .line 2
    .line 3
    sget-object v1, Lcom/momo/xeengine/egl/BaseTextureRender;->mVertexMatrix:[F

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v1, Lcom/momo/xeengine/egl/BaseTextureRender;->DefaultVertexMatrix:[F

    .line 9
    .line 10
    :goto_0
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-static {v0, v2, v3, v1, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 13
    .line 14
    .line 15
    iget p0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLTextureMatrix:I

    .line 16
    .line 17
    sget-object v0, Lcom/momo/xeengine/egl/BaseTextureRender;->mTextureMatrix:[F

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    sget-object v0, Lcom/momo/xeengine/egl/BaseTextureRender;->DefaultTextureMatrix:[F

    .line 23
    .line 24
    :goto_1
    invoke-static {p0, v2, v3, v0, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private onUseProgram()V
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLProgram:I

    .line 2
    .line 3
    invoke-static {p0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public create()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVertex:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mFragment:Ljava/lang/String;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/momo/xeengine/egl/BaseTextureRender;->onCreate()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public draw(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/egl/BaseTextureRender;->onClear()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/xeengine/egl/BaseTextureRender;->onUseProgram()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/momo/xeengine/egl/BaseTextureRender;->onSetExpandData()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/momo/xeengine/egl/BaseTextureRender;->onBindTexture(I)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/momo/xeengine/egl/BaseTextureRender;->onDraw()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public draw(I[F)V
    .locals 0

    .line 17
    sput-object p2, Lcom/momo/xeengine/egl/BaseTextureRender;->mTextureMatrix:[F

    .line 18
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/egl/BaseTextureRender;->draw(I)V

    return-void
.end method

.method public isInitialized()Z
    .locals 3

    .line 1
    iget v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLProgram:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVBOs:[I

    .line 7
    .line 8
    aget v2, v0, v1

    .line 9
    .line 10
    if-lez v2, :cond_0

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    aget v0, v0, v2

    .line 14
    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVAO:[I

    .line 18
    .line 19
    aget p0, p0, v1

    .line 20
    .line 21
    if-lez p0, :cond_0

    .line 22
    .line 23
    return v2

    .line 24
    :cond_0
    return v1
.end method

.method public release()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVAO:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v2, v0, v1

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    if-lez v2, :cond_0

    .line 8
    .line 9
    invoke-static {v3, v0, v1}, Landroid/opengl/GLES30;->glDeleteVertexArrays(I[II)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVAO:[I

    .line 13
    .line 14
    aput v1, v0, v1

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVBOs:[I

    .line 17
    .line 18
    aget v2, v0, v1

    .line 19
    .line 20
    if-lez v2, :cond_1

    .line 21
    .line 22
    aget v2, v0, v3

    .line 23
    .line 24
    if-lez v2, :cond_1

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteBuffers(I[II)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mVBOs:[I

    .line 31
    .line 32
    aput v1, v0, v1

    .line 33
    .line 34
    aput v1, v0, v3

    .line 35
    .line 36
    :cond_1
    iget v0, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLProgram:I

    .line 37
    .line 38
    if-lez v0, :cond_2

    .line 39
    .line 40
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 41
    .line 42
    .line 43
    iput v1, p0, Lcom/momo/xeengine/egl/BaseTextureRender;->mGLProgram:I

    .line 44
    .line 45
    :cond_2
    return-void
.end method
