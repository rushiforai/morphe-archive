.class public Lcom/tencent/liteav/renderer/h;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:I = 0x1

.field public static b:I = 0x2


# instance fields
.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:Z

.field private j:[F

.field private k:[F

.field private l:F

.field private m:F

.field private n:Z

.field private o:Z

.field private final p:[F

.field private q:Ljava/nio/FloatBuffer;

.field private r:[F

.field private s:[F

.field private t:I

.field private u:I

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/lang/Boolean;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->c:I

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->d:I

    .line 8
    .line 9
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->e:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->f:I

    .line 12
    .line 13
    sget v1, Lcom/tencent/liteav/renderer/h;->b:I

    .line 14
    .line 15
    iput v1, p0, Lcom/tencent/liteav/renderer/h;->g:I

    .line 16
    .line 17
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->h:I

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/h;->i:Z

    .line 20
    .line 21
    const/16 v1, 0x10

    .line 22
    .line 23
    new-array v2, v1, [F

    .line 24
    .line 25
    iput-object v2, p0, Lcom/tencent/liteav/renderer/h;->j:[F

    .line 26
    .line 27
    new-array v2, v1, [F

    .line 28
    .line 29
    iput-object v2, p0, Lcom/tencent/liteav/renderer/h;->k:[F

    .line 30
    .line 31
    const/high16 v2, 0x3f800000    # 1.0f

    .line 32
    .line 33
    iput v2, p0, Lcom/tencent/liteav/renderer/h;->l:F

    .line 34
    .line 35
    iput v2, p0, Lcom/tencent/liteav/renderer/h;->m:F

    .line 36
    .line 37
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/h;->n:Z

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    iput-boolean v2, p0, Lcom/tencent/liteav/renderer/h;->o:Z

    .line 41
    .line 42
    const/16 v2, 0x14

    .line 43
    .line 44
    new-array v2, v2, [F

    .line 45
    .line 46
    fill-array-data v2, :array_0

    .line 47
    .line 48
    .line 49
    iput-object v2, p0, Lcom/tencent/liteav/renderer/h;->p:[F

    .line 50
    .line 51
    new-array v3, v1, [F

    .line 52
    .line 53
    iput-object v3, p0, Lcom/tencent/liteav/renderer/h;->r:[F

    .line 54
    .line 55
    new-array v1, v1, [F

    .line 56
    .line 57
    iput-object v1, p0, Lcom/tencent/liteav/renderer/h;->s:[F

    .line 58
    .line 59
    const/16 v1, -0x3039

    .line 60
    .line 61
    iput v1, p0, Lcom/tencent/liteav/renderer/h;->u:I

    .line 62
    .line 63
    iput v1, p0, Lcom/tencent/liteav/renderer/h;->v:I

    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/h;->o:Z

    .line 70
    .line 71
    array-length p1, v2

    .line 72
    mul-int/lit8 p1, p1, 0x4

    .line 73
    .line 74
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/tencent/liteav/renderer/h;->q:Ljava/nio/FloatBuffer;

    .line 91
    .line 92
    invoke-virtual {p1, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/tencent/liteav/renderer/h;->s:[F

    .line 100
    .line 101
    invoke-static {p0, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x0
        0x3f800000    # 1.0f
        0x0
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private a(ILjava/lang/String;)I
    .locals 3

    .line 114
    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result v0

    .line 115
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "glCreateShader type="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 116
    invoke-static {v0, p2}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 117
    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    const/4 p0, 0x1

    .line 118
    new-array p0, p0, [I

    const p2, 0x8b81

    const/4 v1, 0x0

    .line 119
    invoke-static {v0, p2, p0, v1}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 120
    aget p0, p0, v1

    if-nez p0, :cond_0

    .line 121
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "Could not compile shader "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ":"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "TXTweenFilter"

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, " "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    return v1

    :cond_0
    return v0
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4

    const v0, 0x8b31

    .line 124
    invoke-direct {p0, v0, p1}, Lcom/tencent/liteav/renderer/h;->a(ILjava/lang/String;)I

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const v1, 0x8b30

    .line 125
    invoke-direct {p0, v1, p2}, Lcom/tencent/liteav/renderer/h;->a(ILjava/lang/String;)I

    move-result p2

    if-nez p2, :cond_1

    return v0

    .line 126
    :cond_1
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v1

    .line 127
    const-string v2, "glCreateProgram"

    invoke-direct {p0, v2}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 128
    const-string v2, "TXTweenFilter"

    if-nez v1, :cond_2

    .line 129
    const-string v3, "Could not create program"

    invoke-static {v2, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    :cond_2
    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 131
    const-string p1, "glAttachShader"

    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 132
    invoke-static {v1, p2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 133
    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 134
    invoke-static {v1}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    const/4 p0, 0x1

    .line 135
    new-array p1, p0, [I

    const p2, 0x8b82

    .line 136
    invoke-static {v1, p2, p1, v0}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 137
    aget p1, p1, v0

    if-eq p1, p0, :cond_3

    .line 138
    const-string p0, "Could not link program: "

    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    invoke-static {v1}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    return v0

    :cond_3
    return v1
.end method

.method private a(Ljava/lang/String;)V
    .locals 2

    .line 141
    :goto_0
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result p0

    if-eqz p0, :cond_0

    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": glError "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "TXTweenFilter"

    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private b([F)V
    .locals 13

    .line 136
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->d:I

    if-eqz v0, :cond_8

    iget v1, p0, Lcom/tencent/liteav/renderer/h;->c:I

    if-nez v1, :cond_0

    goto/16 :goto_2

    .line 137
    :cond_0
    iget v2, p0, Lcom/tencent/liteav/renderer/h;->e:I

    .line 138
    iget v3, p0, Lcom/tencent/liteav/renderer/h;->f:I

    .line 139
    iget v4, p0, Lcom/tencent/liteav/renderer/h;->h:I

    const/16 v5, 0x10e

    if-eq v4, v5, :cond_1

    const/16 v5, 0x5a

    if-ne v4, v5, :cond_2

    :cond_1
    move v12, v3

    move v3, v2

    move v2, v12

    :cond_2
    int-to-float v1, v1

    const/high16 v4, 0x3f800000    # 1.0f

    mul-float/2addr v1, v4

    int-to-float v2, v2

    div-float/2addr v1, v2

    int-to-float v5, v0

    mul-float/2addr v5, v4

    int-to-float v3, v3

    div-float/2addr v5, v3

    .line 140
    iget v6, p0, Lcom/tencent/liteav/renderer/h;->g:I

    sget v7, Lcom/tencent/liteav/renderer/h;->a:I

    if-ne v6, v7, :cond_3

    mul-float v6, v1, v3

    int-to-float v0, v0

    cmpl-float v0, v6, v0

    if-lez v0, :cond_4

    goto :goto_0

    :cond_3
    mul-float v6, v1, v3

    int-to-float v0, v0

    cmpl-float v0, v6, v0

    if-lez v0, :cond_5

    :cond_4
    move v1, v5

    .line 141
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/h;->k:[F

    const/4 v5, 0x0

    invoke-static {v0, v5}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 142
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/h;->i:Z

    if-eqz v0, :cond_7

    .line 143
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->h:I

    rem-int/lit16 v0, v0, 0xb4

    .line 144
    iget-object v6, p0, Lcom/tencent/liteav/renderer/h;->k:[F

    const/high16 v7, -0x40800000    # -1.0f

    if-nez v0, :cond_6

    .line 145
    invoke-static {v6, v5, v7, v4, v4}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    goto :goto_1

    .line 146
    :cond_6
    invoke-static {v6, v5, v4, v7, v4}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 147
    :cond_7
    :goto_1
    iget-object v0, p0, Lcom/tencent/liteav/renderer/h;->k:[F

    mul-float/2addr v2, v1

    iget v6, p0, Lcom/tencent/liteav/renderer/h;->c:I

    int-to-float v6, v6

    div-float/2addr v2, v6

    mul-float/2addr v2, v4

    mul-float/2addr v3, v1

    iget v1, p0, Lcom/tencent/liteav/renderer/h;->d:I

    int-to-float v1, v1

    div-float/2addr v3, v1

    mul-float/2addr v3, v4

    invoke-static {v0, v5, v2, v3, v4}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 148
    iget-object v6, p0, Lcom/tencent/liteav/renderer/h;->k:[F

    iget v0, p0, Lcom/tencent/liteav/renderer/h;->h:I

    int-to-float v8, v0

    const/4 v10, 0x0

    const/high16 v11, -0x40800000    # -1.0f

    const/4 v7, 0x0

    const/4 v9, 0x0

    invoke-static/range {v6 .. v11}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 149
    iget-object v2, p0, Lcom/tencent/liteav/renderer/h;->j:[F

    iget-object v4, p0, Lcom/tencent/liteav/renderer/h;->k:[F

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v3, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    :cond_8
    :goto_2
    return-void
.end method

.method private d()V
    .locals 14

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/h;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "reloadFrameBuffer. size = "

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget v1, p0, Lcom/tencent/liteav/renderer/h;->c:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "*"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget v1, p0, Lcom/tencent/liteav/renderer/h;->d:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "TXTweenFilter"

    .line 33
    .line 34
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/h;->e()V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    new-array v2, v0, [I

    .line 42
    .line 43
    new-array v3, v0, [I

    .line 44
    .line 45
    const/4 v4, 0x0

    .line 46
    invoke-static {v0, v2, v4}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v3, v4}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 50
    .line 51
    .line 52
    aget v0, v2, v4

    .line 53
    .line 54
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->u:I

    .line 55
    .line 56
    aget v0, v3, v4

    .line 57
    .line 58
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->v:I

    .line 59
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v2, "frameBuffer id = "

    .line 63
    .line 64
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget v2, p0, Lcom/tencent/liteav/renderer/h;->v:I

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v2, ", texture id = "

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget v2, p0, Lcom/tencent/liteav/renderer/h;->u:I

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->u:I

    .line 90
    .line 91
    const/16 v1, 0xde1

    .line 92
    .line 93
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 94
    .line 95
    .line 96
    const-string v0, "glBindTexture mFrameBufferTextureID"

    .line 97
    .line 98
    invoke-direct {p0, v0}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget v8, p0, Lcom/tencent/liteav/renderer/h;->c:I

    .line 102
    .line 103
    iget v9, p0, Lcom/tencent/liteav/renderer/h;->d:I

    .line 104
    .line 105
    const/16 v12, 0x1401

    .line 106
    .line 107
    const/4 v13, 0x0

    .line 108
    const/16 v5, 0xde1

    .line 109
    .line 110
    const/4 v6, 0x0

    .line 111
    const/16 v7, 0x1908

    .line 112
    .line 113
    const/4 v10, 0x0

    .line 114
    const/16 v11, 0x1908

    .line 115
    .line 116
    invoke-static/range {v5 .. v13}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 117
    .line 118
    .line 119
    const/16 v0, 0x2801

    .line 120
    .line 121
    const v2, 0x46180400    # 9729.0f

    .line 122
    .line 123
    .line 124
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 125
    .line 126
    .line 127
    const/16 v0, 0x2800

    .line 128
    .line 129
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 130
    .line 131
    .line 132
    const/16 v0, 0x2802

    .line 133
    .line 134
    const v2, 0x812f

    .line 135
    .line 136
    .line 137
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 138
    .line 139
    .line 140
    const/16 v0, 0x2803

    .line 141
    .line 142
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 143
    .line 144
    .line 145
    const-string v0, "glTexParameter"

    .line 146
    .line 147
    invoke-direct {p0, v0}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->v:I

    .line 151
    .line 152
    const v2, 0x8d40

    .line 153
    .line 154
    .line 155
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 156
    .line 157
    .line 158
    const v0, 0x8ce0

    .line 159
    .line 160
    .line 161
    iget v3, p0, Lcom/tencent/liteav/renderer/h;->u:I

    .line 162
    .line 163
    invoke-static {v2, v0, v1, v3, v4}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 164
    .line 165
    .line 166
    invoke-static {v1, v4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 167
    .line 168
    .line 169
    invoke-static {v2, v4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 170
    .line 171
    .line 172
    iput-boolean v4, p0, Lcom/tencent/liteav/renderer/h;->n:Z

    .line 173
    .line 174
    return-void
.end method

.method private e()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->v:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/16 v3, -0x3039

    .line 6
    .line 7
    if-eq v0, v3, :cond_0

    .line 8
    .line 9
    filled-new-array {v0}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 14
    .line 15
    .line 16
    iput v3, p0, Lcom/tencent/liteav/renderer/h;->v:I

    .line 17
    .line 18
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->u:I

    .line 19
    .line 20
    if-eq v0, v3, :cond_1

    .line 21
    .line 22
    filled-new-array {v0}, [I

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 27
    .line 28
    .line 29
    iput v3, p0, Lcom/tencent/liteav/renderer/h;->u:I

    .line 30
    .line 31
    :cond_1
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 111
    iput p1, p0, Lcom/tencent/liteav/renderer/h;->g:I

    return-void
.end method

.method public a(II)V
    .locals 10

    .line 1
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->c:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->d:I

    .line 6
    .line 7
    if-ne p2, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "Output resolution change: "

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget v1, p0, Lcom/tencent/liteav/renderer/h;->c:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, "*"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget v2, p0, Lcom/tencent/liteav/renderer/h;->d:I

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v2, " -> "

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "TXTweenFilter"

    .line 51
    .line 52
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iput p1, p0, Lcom/tencent/liteav/renderer/h;->c:I

    .line 56
    .line 57
    iput p2, p0, Lcom/tencent/liteav/renderer/h;->d:I

    .line 58
    .line 59
    iget-object v2, p0, Lcom/tencent/liteav/renderer/h;->j:[F

    .line 60
    .line 61
    const/high16 v0, 0x3f800000    # 1.0f

    .line 62
    .line 63
    const/high16 v5, 0x3f800000    # 1.0f

    .line 64
    .line 65
    if-le p1, p2, :cond_1

    .line 66
    .line 67
    const/high16 v8, -0x40800000    # -1.0f

    .line 68
    .line 69
    const/high16 v9, 0x3f800000    # 1.0f

    .line 70
    .line 71
    const/4 v3, 0x0

    .line 72
    const/high16 v4, -0x40800000    # -1.0f

    .line 73
    .line 74
    const/high16 v6, -0x40800000    # -1.0f

    .line 75
    .line 76
    const/high16 v7, 0x3f800000    # 1.0f

    .line 77
    .line 78
    invoke-static/range {v2 .. v9}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 79
    .line 80
    .line 81
    iput v5, p0, Lcom/tencent/liteav/renderer/h;->l:F

    .line 82
    .line 83
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->m:F

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    const/high16 v8, -0x40800000    # -1.0f

    .line 87
    .line 88
    const/high16 v9, 0x3f800000    # 1.0f

    .line 89
    .line 90
    const/4 v3, 0x0

    .line 91
    const/high16 v4, -0x40800000    # -1.0f

    .line 92
    .line 93
    move v7, v5

    .line 94
    const/high16 v5, 0x3f800000    # 1.0f

    .line 95
    .line 96
    const/high16 v6, -0x40800000    # -1.0f

    .line 97
    .line 98
    invoke-static/range {v2 .. v9}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 99
    .line 100
    .line 101
    move v5, v7

    .line 102
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->l:F

    .line 103
    .line 104
    iput v5, p0, Lcom/tencent/liteav/renderer/h;->m:F

    .line 105
    .line 106
    :goto_0
    const/4 p1, 0x1

    .line 107
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/h;->n:Z

    .line 108
    .line 109
    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 112
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/h;->i:Z

    return-void
.end method

.method public a([F)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/tencent/liteav/renderer/h;->s:[F

    return-void
.end method

.method public a()Z
    .locals 0

    .line 110
    iget-boolean p0, p0, Lcom/tencent/liteav/renderer/h;->o:Z

    return p0
.end method

.method public b()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/h;->o:Z

    .line 2
    .line 3
    const-string v1, "uniform mat4 uMVPMatrix;\nuniform mat4 uSTMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n  gl_Position = uMVPMatrix * aPosition;\n  vTextureCoord = (uSTMatrix * aTextureCoord).xy;\n}\n"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n  gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

    .line 8
    .line 9
    invoke-direct {p0, v1, v0}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->t:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v0, "varying highp vec2 vTextureCoord;\n \nuniform sampler2D sTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(sTexture, vTextureCoord);\n}"

    .line 17
    .line 18
    invoke-direct {p0, v1, v0}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->t:I

    .line 23
    .line 24
    :goto_0
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->t:I

    .line 25
    .line 26
    const-string v1, "TXTweenFilter"

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    const-string p0, "failed creating program"

    .line 31
    .line 32
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const-string v2, "aPosition"

    .line 37
    .line 38
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->y:I

    .line 43
    .line 44
    const-string v0, "glGetAttribLocation aPosition"

    .line 45
    .line 46
    invoke-direct {p0, v0}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->y:I

    .line 50
    .line 51
    const/4 v2, -0x1

    .line 52
    if-ne v0, v2, :cond_2

    .line 53
    .line 54
    const-string p0, "Could not get attrib location for aPosition"

    .line 55
    .line 56
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->t:I

    .line 61
    .line 62
    const-string v3, "aTextureCoord"

    .line 63
    .line 64
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->z:I

    .line 69
    .line 70
    const-string v0, "glGetAttribLocation aTextureCoord"

    .line 71
    .line 72
    invoke-direct {p0, v0}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->z:I

    .line 76
    .line 77
    if-ne v0, v2, :cond_3

    .line 78
    .line 79
    const-string p0, "Could not get attrib location for aTextureCoord"

    .line 80
    .line 81
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_3
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->t:I

    .line 86
    .line 87
    const-string v3, "uMVPMatrix"

    .line 88
    .line 89
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->w:I

    .line 94
    .line 95
    const-string v0, "glGetUniformLocation uMVPMatrix"

    .line 96
    .line 97
    invoke-direct {p0, v0}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->w:I

    .line 101
    .line 102
    if-ne v0, v2, :cond_4

    .line 103
    .line 104
    const-string p0, "Could not get attrib location for uMVPMatrix"

    .line 105
    .line 106
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_4
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->t:I

    .line 111
    .line 112
    const-string v3, "uSTMatrix"

    .line 113
    .line 114
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    iput v0, p0, Lcom/tencent/liteav/renderer/h;->x:I

    .line 119
    .line 120
    const-string v0, "glGetUniformLocation uSTMatrix"

    .line 121
    .line 122
    invoke-direct {p0, v0}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget p0, p0, Lcom/tencent/liteav/renderer/h;->x:I

    .line 126
    .line 127
    if-ne p0, v2, :cond_5

    .line 128
    .line 129
    const-string p0, "Could not get attrib location for uSTMatrix"

    .line 130
    .line 131
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_5
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 135
    iput p1, p0, Lcom/tencent/liteav/renderer/h;->h:I

    return-void
.end method

.method public b(II)V
    .locals 3

    .line 150
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->e:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/tencent/liteav/renderer/h;->f:I

    if-ne p2, v0, :cond_0

    return-void

    .line 151
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Input resolution change: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/tencent/liteav/renderer/h;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/tencent/liteav/renderer/h;->f:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " -> "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXTweenFilter"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    iput p1, p0, Lcom/tencent/liteav/renderer/h;->e:I

    .line 153
    iput p2, p0, Lcom/tencent/liteav/renderer/h;->f:I

    return-void
.end method

.method public c()V
    .locals 1

    .line 167
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->t:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 168
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/h;->e()V

    return-void
.end method

.method public c(I)V
    .locals 10

    .line 1
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->c:I

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/liteav/renderer/h;->d:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/high16 v1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-static {v0, v0, v0, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 13
    .line 14
    .line 15
    const/16 v0, 0x4100

    .line 16
    .line 17
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->t:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 23
    .line 24
    .line 25
    const-string v0, "glUseProgram"

    .line 26
    .line 27
    invoke-direct {p0, v0}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/h;->o:Z

    .line 31
    .line 32
    const/16 v1, 0xde1

    .line 33
    .line 34
    const v3, 0x8d65

    .line 35
    .line 36
    .line 37
    const v4, 0x84c0

    .line 38
    .line 39
    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    invoke-static {v4}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 43
    .line 44
    .line 45
    invoke-static {v3, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-static {v4}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 53
    .line 54
    .line 55
    :goto_0
    iget-object p1, p0, Lcom/tencent/liteav/renderer/h;->q:Ljava/nio/FloatBuffer;

    .line 56
    .line 57
    invoke-virtual {p1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 58
    .line 59
    .line 60
    iget v4, p0, Lcom/tencent/liteav/renderer/h;->y:I

    .line 61
    .line 62
    const/16 v8, 0x14

    .line 63
    .line 64
    iget-object v9, p0, Lcom/tencent/liteav/renderer/h;->q:Ljava/nio/FloatBuffer;

    .line 65
    .line 66
    const/4 v5, 0x3

    .line 67
    const/16 v6, 0x1406

    .line 68
    .line 69
    const/4 v7, 0x0

    .line 70
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 71
    .line 72
    .line 73
    const-string p1, "glVertexAttribPointer maPosition"

    .line 74
    .line 75
    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget p1, p0, Lcom/tencent/liteav/renderer/h;->y:I

    .line 79
    .line 80
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 81
    .line 82
    .line 83
    const-string p1, "glEnableVertexAttribArray maPositionHandle"

    .line 84
    .line 85
    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/tencent/liteav/renderer/h;->q:Ljava/nio/FloatBuffer;

    .line 89
    .line 90
    const/4 v0, 0x3

    .line 91
    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 92
    .line 93
    .line 94
    iget v4, p0, Lcom/tencent/liteav/renderer/h;->z:I

    .line 95
    .line 96
    iget-object v9, p0, Lcom/tencent/liteav/renderer/h;->q:Ljava/nio/FloatBuffer;

    .line 97
    .line 98
    const/4 v5, 0x2

    .line 99
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 100
    .line 101
    .line 102
    const-string p1, "glVertexAttribPointer maTextureHandle"

    .line 103
    .line 104
    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget p1, p0, Lcom/tencent/liteav/renderer/h;->z:I

    .line 108
    .line 109
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 110
    .line 111
    .line 112
    const-string p1, "glEnableVertexAttribArray maTextureHandle"

    .line 113
    .line 114
    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/tencent/liteav/renderer/h;->r:[F

    .line 118
    .line 119
    invoke-static {p1, v2}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/tencent/liteav/renderer/h;->r:[F

    .line 123
    .line 124
    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/h;->b([F)V

    .line 125
    .line 126
    .line 127
    iget p1, p0, Lcom/tencent/liteav/renderer/h;->w:I

    .line 128
    .line 129
    iget-object v0, p0, Lcom/tencent/liteav/renderer/h;->r:[F

    .line 130
    .line 131
    const/4 v4, 0x1

    .line 132
    invoke-static {p1, v4, v2, v0, v2}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 133
    .line 134
    .line 135
    iget p1, p0, Lcom/tencent/liteav/renderer/h;->x:I

    .line 136
    .line 137
    iget-object v0, p0, Lcom/tencent/liteav/renderer/h;->s:[F

    .line 138
    .line 139
    invoke-static {p1, v4, v2, v0, v2}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 140
    .line 141
    .line 142
    const-string p1, "glDrawArrays"

    .line 143
    .line 144
    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    const/4 v0, 0x5

    .line 148
    const/4 v4, 0x4

    .line 149
    invoke-static {v0, v2, v4}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 150
    .line 151
    .line 152
    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/h;->a(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-boolean p0, p0, Lcom/tencent/liteav/renderer/h;->o:Z

    .line 156
    .line 157
    if-eqz p0, :cond_1

    .line 158
    .line 159
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_1
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public d(I)I
    .locals 2

    .line 175
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/h;->d()V

    .line 176
    iget v0, p0, Lcom/tencent/liteav/renderer/h;->v:I

    const/16 v1, -0x3039

    if-ne v0, v1, :cond_0

    .line 177
    const-string p0, "TXTweenFilter"

    const-string v0, "invalid frame buffer id"

    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return p1

    :cond_0
    const v1, 0x8d40

    .line 178
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 179
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/h;->c(I)V

    const/4 p1, 0x0

    .line 180
    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 181
    iget p0, p0, Lcom/tencent/liteav/renderer/h;->u:I

    return p0
.end method
