.class public final Ll/zet0;
.super Ljava/lang/Thread;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
.implements Ll/xet0;


# static fields
.field public static final B:[F


# instance fields
.field public volatile A:Z

.field public final a:Ll/yet0;

.field public final b:[F

.field public final c:[F

.field public final d:[F

.field public final e:[F

.field public final f:[F

.field public final g:[F

.field public final h:[F

.field public i:F

.field public j:F

.field public k:F

.field public l:I

.field public m:I

.field public n:Landroid/graphics/SurfaceTexture;

.field public o:Landroid/graphics/SurfaceTexture;

.field public p:I

.field public q:I

.field public r:I

.field public final s:Ljava/nio/FloatBuffer;

.field public final t:Ljava/util/concurrent/CountDownLatch;

.field public final u:Ljava/lang/Object;

.field public v:Ljavax/microedition/khronos/egl/EGL10;

.field public w:Ljavax/microedition/khronos/egl/EGLDisplay;

.field public x:Ljavax/microedition/khronos/egl/EGLContext;

.field public y:Ljavax/microedition/khronos/egl/EGLSurface;

.field public volatile z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/zet0;->B:[F

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "SphericalVideoProcessor"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/zet0;->B:[F

    .line 7
    .line 8
    array-length v1, v0

    .line 9
    const/16 v1, 0x30

    .line 10
    .line 11
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, p0, Ll/zet0;->s:Ljava/nio/FloatBuffer;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    const/16 v0, 0x9

    .line 38
    .line 39
    new-array v1, v0, [F

    .line 40
    .line 41
    iput-object v1, p0, Ll/zet0;->b:[F

    .line 42
    .line 43
    new-array v1, v0, [F

    .line 44
    .line 45
    iput-object v1, p0, Ll/zet0;->c:[F

    .line 46
    .line 47
    new-array v1, v0, [F

    .line 48
    .line 49
    iput-object v1, p0, Ll/zet0;->d:[F

    .line 50
    .line 51
    new-array v1, v0, [F

    .line 52
    .line 53
    iput-object v1, p0, Ll/zet0;->e:[F

    .line 54
    .line 55
    new-array v1, v0, [F

    .line 56
    .line 57
    iput-object v1, p0, Ll/zet0;->f:[F

    .line 58
    .line 59
    new-array v1, v0, [F

    .line 60
    .line 61
    iput-object v1, p0, Ll/zet0;->g:[F

    .line 62
    .line 63
    new-array v0, v0, [F

    .line 64
    .line 65
    iput-object v0, p0, Ll/zet0;->h:[F

    .line 66
    .line 67
    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 68
    .line 69
    iput v0, p0, Ll/zet0;->i:F

    .line 70
    .line 71
    new-instance v0, Ll/yet0;

    .line 72
    .line 73
    invoke-direct {v0, p1}, Ll/yet0;-><init>(Landroid/content/Context;)V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Ll/zet0;->a:Ll/yet0;

    .line 77
    .line 78
    invoke-virtual {v0, p0}, Ll/yet0;->b(Ll/xet0;)V

    .line 79
    .line 80
    .line 81
    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    .line 82
    .line 83
    const/4 v0, 0x1

    .line 84
    invoke-direct {p1, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 85
    .line 86
    .line 87
    iput-object p1, p0, Ll/zet0;->t:Ljava/util/concurrent/CountDownLatch;

    .line 88
    .line 89
    new-instance p1, Ljava/lang/Object;

    .line 90
    .line 91
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object p1, p0, Ll/zet0;->u:Ljava/lang/Object;

    .line 95
    .line 96
    return-void
.end method

.method public static final g(Ljava/lang/String;)V
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
    const-string p0, ": glError "

    .line 16
    .line 17
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "SphericalVideoRenderer"

    .line 28
    .line 29
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public static final h([F[F[F)V
    .locals 19

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p1, v0

    .line 3
    .line 4
    aget v2, p2, v0

    .line 5
    .line 6
    mul-float/2addr v1, v2

    .line 7
    const/4 v2, 0x1

    .line 8
    aget v3, p1, v2

    .line 9
    .line 10
    const/4 v4, 0x3

    .line 11
    aget v5, p2, v4

    .line 12
    .line 13
    mul-float v6, v3, v5

    .line 14
    .line 15
    const/4 v7, 0x2

    .line 16
    aget v8, p1, v7

    .line 17
    .line 18
    const/4 v9, 0x6

    .line 19
    aget v10, p2, v9

    .line 20
    .line 21
    mul-float v11, v8, v10

    .line 22
    .line 23
    add-float/2addr v1, v6

    .line 24
    add-float/2addr v1, v11

    .line 25
    aput v1, p0, v0

    .line 26
    .line 27
    aget v1, p1, v0

    .line 28
    .line 29
    aget v6, p2, v2

    .line 30
    .line 31
    mul-float/2addr v6, v1

    .line 32
    const/4 v11, 0x4

    .line 33
    aget v12, p2, v11

    .line 34
    .line 35
    mul-float/2addr v3, v12

    .line 36
    const/4 v13, 0x7

    .line 37
    aget v14, p2, v13

    .line 38
    .line 39
    mul-float v15, v8, v14

    .line 40
    .line 41
    add-float/2addr v6, v3

    .line 42
    add-float/2addr v6, v15

    .line 43
    aput v6, p0, v2

    .line 44
    .line 45
    aget v3, p2, v7

    .line 46
    .line 47
    mul-float/2addr v1, v3

    .line 48
    aget v3, p1, v2

    .line 49
    .line 50
    const/4 v6, 0x5

    .line 51
    aget v15, p2, v6

    .line 52
    .line 53
    mul-float/2addr v3, v15

    .line 54
    const/16 v16, 0x8

    .line 55
    .line 56
    aget v17, p2, v16

    .line 57
    .line 58
    mul-float v8, v8, v17

    .line 59
    .line 60
    add-float/2addr v1, v3

    .line 61
    add-float/2addr v1, v8

    .line 62
    aput v1, p0, v7

    .line 63
    .line 64
    aget v1, p1, v4

    .line 65
    .line 66
    aget v0, p2, v0

    .line 67
    .line 68
    mul-float/2addr v1, v0

    .line 69
    aget v3, p1, v11

    .line 70
    .line 71
    mul-float/2addr v5, v3

    .line 72
    aget v8, p1, v6

    .line 73
    .line 74
    mul-float v18, v8, v10

    .line 75
    .line 76
    add-float/2addr v1, v5

    .line 77
    add-float v1, v1, v18

    .line 78
    .line 79
    aput v1, p0, v4

    .line 80
    .line 81
    aget v1, p1, v4

    .line 82
    .line 83
    aget v2, p2, v2

    .line 84
    .line 85
    mul-float v5, v1, v2

    .line 86
    .line 87
    mul-float/2addr v3, v12

    .line 88
    mul-float v12, v8, v14

    .line 89
    .line 90
    add-float/2addr v5, v3

    .line 91
    add-float/2addr v5, v12

    .line 92
    aput v5, p0, v11

    .line 93
    .line 94
    aget v3, p2, v7

    .line 95
    .line 96
    mul-float/2addr v1, v3

    .line 97
    aget v5, p1, v11

    .line 98
    .line 99
    mul-float/2addr v5, v15

    .line 100
    mul-float v8, v8, v17

    .line 101
    .line 102
    add-float/2addr v1, v5

    .line 103
    add-float/2addr v1, v8

    .line 104
    aput v1, p0, v6

    .line 105
    .line 106
    aget v1, p1, v9

    .line 107
    .line 108
    mul-float/2addr v1, v0

    .line 109
    aget v0, p1, v13

    .line 110
    .line 111
    aget v4, p2, v4

    .line 112
    .line 113
    mul-float/2addr v4, v0

    .line 114
    aget v5, p1, v16

    .line 115
    .line 116
    mul-float/2addr v10, v5

    .line 117
    add-float/2addr v1, v4

    .line 118
    add-float/2addr v1, v10

    .line 119
    aput v1, p0, v9

    .line 120
    .line 121
    aget v1, p1, v9

    .line 122
    .line 123
    mul-float/2addr v2, v1

    .line 124
    aget v4, p2, v11

    .line 125
    .line 126
    mul-float/2addr v0, v4

    .line 127
    add-float/2addr v2, v0

    .line 128
    mul-float/2addr v14, v5

    .line 129
    add-float/2addr v2, v14

    .line 130
    aput v2, p0, v13

    .line 131
    .line 132
    mul-float/2addr v1, v3

    .line 133
    aget v0, p1, v13

    .line 134
    .line 135
    aget v2, p2, v6

    .line 136
    .line 137
    mul-float/2addr v0, v2

    .line 138
    mul-float v5, v5, v17

    .line 139
    .line 140
    add-float/2addr v1, v0

    .line 141
    add-float/2addr v1, v5

    .line 142
    aput v1, p0, v16

    .line 143
    .line 144
    return-void
.end method

.method public static final i([FF)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    aput v1, p0, v0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    aput v1, p0, v0

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    aput v1, p0, v0

    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    aput v1, p0, v0

    .line 15
    .line 16
    float-to-double v2, p1

    .line 17
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    double-to-float p1, v4

    .line 22
    const/4 v0, 0x4

    .line 23
    aput p1, p0, v0

    .line 24
    .line 25
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    neg-double v4, v4

    .line 30
    double-to-float p1, v4

    .line 31
    const/4 v0, 0x5

    .line 32
    aput p1, p0, v0

    .line 33
    .line 34
    const/4 p1, 0x6

    .line 35
    aput v1, p0, p1

    .line 36
    .line 37
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    double-to-float p1, v0

    .line 42
    const/4 v0, 0x7

    .line 43
    aput p1, p0, v0

    .line 44
    .line 45
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    double-to-float p1, v0

    .line 50
    const/16 v0, 0x8

    .line 51
    .line 52
    aput p1, p0, v0

    .line 53
    .line 54
    return-void
.end method

.method public static final j([FF)V
    .locals 5

    .line 1
    float-to-double v0, p1

    .line 2
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    .line 3
    .line 4
    .line 5
    move-result-wide v2

    .line 6
    double-to-float p1, v2

    .line 7
    const/4 v2, 0x0

    .line 8
    aput p1, p0, v2

    .line 9
    .line 10
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    neg-double v2, v2

    .line 15
    double-to-float p1, v2

    .line 16
    const/4 v2, 0x1

    .line 17
    aput p1, p0, v2

    .line 18
    .line 19
    const/4 p1, 0x2

    .line 20
    const/4 v2, 0x0

    .line 21
    aput v2, p0, p1

    .line 22
    .line 23
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    double-to-float p1, v3

    .line 28
    const/4 v3, 0x3

    .line 29
    aput p1, p0, v3

    .line 30
    .line 31
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    double-to-float p1, v0

    .line 36
    const/4 v0, 0x4

    .line 37
    aput p1, p0, v0

    .line 38
    .line 39
    const/4 p1, 0x5

    .line 40
    aput v2, p0, p1

    .line 41
    .line 42
    const/4 p1, 0x6

    .line 43
    aput v2, p0, p1

    .line 44
    .line 45
    const/4 p1, 0x7

    .line 46
    aput v2, p0, p1

    .line 47
    .line 48
    const/16 p1, 0x8

    .line 49
    .line 50
    const/high16 v0, 0x3f800000    # 1.0f

    .line 51
    .line 52
    aput v0, p0, p1

    .line 53
    .line 54
    return-void
.end method

.method public static final k(ILjava/lang/String;)I
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "createShader"

    .line 6
    .line 7
    invoke-static {v1}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p1, "shaderSource"

    .line 16
    .line 17
    invoke-static {p1}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 21
    .line 22
    .line 23
    const-string p1, "compileShader"

    .line 24
    .line 25
    invoke-static {p1}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    new-array p1, p1, [I

    .line 30
    .line 31
    const v1, 0x8b81

    .line 32
    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-static {v0, v1, p1, v2}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 36
    .line 37
    .line 38
    const-string v1, "getShaderiv"

    .line 39
    .line 40
    invoke-static {v1}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    aget p1, p1, v2

    .line 44
    .line 45
    if-nez p1, :cond_0

    .line 46
    .line 47
    new-instance p1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v1, "Could not compile shader "

    .line 50
    .line 51
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p0, ":"

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "SphericalVideoRenderer"

    .line 67
    .line 68
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 79
    .line 80
    .line 81
    const-string p0, "deleteShader"

    .line 82
    .line 83
    invoke-static {p0}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return v2

    .line 87
    :cond_0
    return v0
.end method


# virtual methods
.method public final a()Landroid/graphics/SurfaceTexture;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zet0;->o:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/zet0;->t:Ljava/util/concurrent/CountDownLatch;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    :catch_0
    iget-object p0, p0, Ll/zet0;->n:Landroid/graphics/SurfaceTexture;

    .line 13
    .line 14
    return-object p0
.end method

.method public final b(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zet0;->u:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput p1, p0, Ll/zet0;->m:I

    .line 5
    .line 6
    iput p2, p0, Ll/zet0;->l:I

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Ll/zet0;->z:Z

    .line 10
    .line 11
    iget-object p0, p0, Ll/zet0;->u:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

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

.method public final c(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 1
    iput p2, p0, Ll/zet0;->m:I

    .line 2
    .line 3
    iput p3, p0, Ll/zet0;->l:I

    .line 4
    .line 5
    iput-object p1, p0, Ll/zet0;->o:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    return-void
.end method

.method public final d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zet0;->u:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/zet0;->A:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Ll/zet0;->o:Landroid/graphics/SurfaceTexture;

    .line 9
    .line 10
    iget-object p0, p0, Ll/zet0;->u:Ljava/lang/Object;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 13
    .line 14
    .line 15
    monitor-exit v0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public final e(FF)V
    .locals 3

    .line 1
    iget v0, p0, Ll/zet0;->m:I

    .line 2
    .line 3
    iget v1, p0, Ll/zet0;->l:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    move v0, v1

    .line 8
    :cond_0
    iget v1, p0, Ll/zet0;->j:F

    .line 9
    .line 10
    const v2, 0x3fdf66f3

    .line 11
    .line 12
    .line 13
    mul-float/2addr p1, v2

    .line 14
    int-to-float v0, v0

    .line 15
    div-float/2addr p1, v0

    .line 16
    sub-float/2addr v1, p1

    .line 17
    iput v1, p0, Ll/zet0;->j:F

    .line 18
    .line 19
    iget p1, p0, Ll/zet0;->k:F

    .line 20
    .line 21
    mul-float/2addr p2, v2

    .line 22
    div-float/2addr p2, v0

    .line 23
    sub-float/2addr p1, p2

    .line 24
    iput p1, p0, Ll/zet0;->k:F

    .line 25
    .line 26
    const p2, -0x4036f025

    .line 27
    .line 28
    .line 29
    cmpg-float v0, p1, p2

    .line 30
    .line 31
    if-gez v0, :cond_1

    .line 32
    .line 33
    iput p2, p0, Ll/zet0;->k:F

    .line 34
    .line 35
    move p1, p2

    .line 36
    :cond_1
    const p2, 0x3fc90fdb

    .line 37
    .line 38
    .line 39
    cmpl-float p1, p1, p2

    .line 40
    .line 41
    if-lez p1, :cond_2

    .line 42
    .line 43
    iput p2, p0, Ll/zet0;->k:F

    .line 44
    .line 45
    :cond_2
    return-void
.end method

.method public final f()Z
    .locals 5
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zet0;->y:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 8
    .line 9
    if-eq v0, v3, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/zet0;->v:Ljavax/microedition/khronos/egl/EGL10;

    .line 12
    .line 13
    iget-object v1, p0, Ll/zet0;->w:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 14
    .line 15
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 16
    .line 17
    invoke-interface {v0, v1, v3, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Ll/zet0;->v:Ljavax/microedition/khronos/egl/EGL10;

    .line 22
    .line 23
    iget-object v3, p0, Ll/zet0;->w:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 24
    .line 25
    iget-object v4, p0, Ll/zet0;->y:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 26
    .line 27
    invoke-interface {v1, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    or-int/2addr v1, v0

    .line 32
    iput-object v2, p0, Ll/zet0;->y:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Ll/zet0;->x:Ljavax/microedition/khronos/egl/EGLContext;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v3, p0, Ll/zet0;->v:Ljavax/microedition/khronos/egl/EGL10;

    .line 39
    .line 40
    iget-object v4, p0, Ll/zet0;->w:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 41
    .line 42
    invoke-interface {v3, v4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    or-int/2addr v1, v0

    .line 47
    iput-object v2, p0, Ll/zet0;->x:Ljavax/microedition/khronos/egl/EGLContext;

    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, Ll/zet0;->w:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object v3, p0, Ll/zet0;->v:Ljavax/microedition/khronos/egl/EGL10;

    .line 54
    .line 55
    invoke-interface {v3, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    or-int/2addr v0, v1

    .line 60
    iput-object v2, p0, Ll/zet0;->w:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 61
    .line 62
    return v0

    .line 63
    :cond_2
    return v1
.end method

.method public final onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    iget p1, p0, Ll/zet0;->r:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    iput p1, p0, Ll/zet0;->r:I

    .line 6
    .line 7
    iget-object p1, p0, Ll/zet0;->u:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter p1

    .line 10
    :try_start_0
    iget-object p0, p0, Ll/zet0;->u:Ljava/lang/Object;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 13
    .line 14
    .line 15
    monitor-exit p1

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public final run()V
    .locals 15

    .line 1
    iget-object v0, p0, Ll/zet0;->o:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    if-eqz v0, :cond_18

    .line 4
    .line 5
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 10
    .line 11
    iput-object v0, p0, Ll/zet0;->v:Ljavax/microedition/khronos/egl/EGL10;

    .line 12
    .line 13
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/zet0;->w:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 20
    .line 21
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    const/4 v3, 0x0

    .line 25
    const/4 v4, 0x1

    .line 26
    const/4 v5, 0x0

    .line 27
    if-ne v0, v1, :cond_1

    .line 28
    .line 29
    :cond_0
    :goto_0
    move v0, v5

    .line 30
    goto/16 :goto_2

    .line 31
    .line 32
    :cond_1
    new-array v1, v2, [I

    .line 33
    .line 34
    iget-object v6, p0, Ll/zet0;->v:Ljavax/microedition/khronos/egl/EGL10;

    .line 35
    .line 36
    invoke-interface {v6, v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    new-array v11, v4, [I

    .line 44
    .line 45
    new-array v9, v4, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 46
    .line 47
    const/16 v0, 0xb

    .line 48
    .line 49
    new-array v8, v0, [I

    .line 50
    .line 51
    fill-array-data v8, :array_0

    .line 52
    .line 53
    .line 54
    iget-object v6, p0, Ll/zet0;->v:Ljavax/microedition/khronos/egl/EGL10;

    .line 55
    .line 56
    iget-object v7, p0, Ll/zet0;->w:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 57
    .line 58
    const/4 v10, 0x1

    .line 59
    invoke-interface/range {v6 .. v11}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_4

    .line 64
    .line 65
    :cond_3
    move-object v0, v3

    .line 66
    goto :goto_1

    .line 67
    :cond_4
    aget v0, v11, v5

    .line 68
    .line 69
    if-lez v0, :cond_3

    .line 70
    .line 71
    aget-object v0, v9, v5

    .line 72
    .line 73
    :goto_1
    if-nez v0, :cond_5

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_5
    const/16 v1, 0x3098

    .line 77
    .line 78
    const/16 v6, 0x3038

    .line 79
    .line 80
    filled-new-array {v1, v2, v6}, [I

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iget-object v6, p0, Ll/zet0;->v:Ljavax/microedition/khronos/egl/EGL10;

    .line 85
    .line 86
    iget-object v7, p0, Ll/zet0;->w:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 87
    .line 88
    sget-object v8, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 89
    .line 90
    invoke-interface {v6, v7, v0, v8, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iput-object v1, p0, Ll/zet0;->x:Ljavax/microedition/khronos/egl/EGLContext;

    .line 95
    .line 96
    if-eqz v1, :cond_0

    .line 97
    .line 98
    if-ne v1, v8, :cond_6

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_6
    iget-object v1, p0, Ll/zet0;->v:Ljavax/microedition/khronos/egl/EGL10;

    .line 102
    .line 103
    iget-object v6, p0, Ll/zet0;->w:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 104
    .line 105
    iget-object v7, p0, Ll/zet0;->o:Landroid/graphics/SurfaceTexture;

    .line 106
    .line 107
    invoke-interface {v1, v6, v0, v7, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iput-object v0, p0, Ll/zet0;->y:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 112
    .line 113
    if-eqz v0, :cond_0

    .line 114
    .line 115
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 116
    .line 117
    if-ne v0, v1, :cond_7

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_7
    iget-object v1, p0, Ll/zet0;->v:Ljavax/microedition/khronos/egl/EGL10;

    .line 121
    .line 122
    iget-object v6, p0, Ll/zet0;->w:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 123
    .line 124
    iget-object v7, p0, Ll/zet0;->x:Ljavax/microedition/khronos/egl/EGLContext;

    .line 125
    .line 126
    invoke-interface {v1, v6, v0, v0, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-nez v0, :cond_8

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_8
    move v0, v4

    .line 134
    :goto_2
    sget-object v1, Ll/sgs0;->j1:Ll/dgs0;

    .line 135
    .line 136
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    invoke-virtual {v6, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    check-cast v6, Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v1}, Ll/dgs0;->m()Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v7

    .line 150
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v6

    .line 154
    if-nez v6, :cond_9

    .line 155
    .line 156
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 157
    .line 158
    .line 159
    move-result-object v6

    .line 160
    invoke-virtual {v6, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    check-cast v1, Ljava/lang/String;

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_9
    const-string v1, "attribute highp vec3 aPosition;varying vec3 pos;void main() {  gl_Position = vec4(aPosition, 1.0);  pos = aPosition;}"

    .line 168
    .line 169
    :goto_3
    const v6, 0x8b31

    .line 170
    .line 171
    .line 172
    invoke-static {v6, v1}, Ll/zet0;->k(ILjava/lang/String;)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-nez v1, :cond_a

    .line 177
    .line 178
    :goto_4
    move v8, v5

    .line 179
    goto/16 :goto_6

    .line 180
    .line 181
    :cond_a
    sget-object v6, Ll/sgs0;->k1:Ll/dgs0;

    .line 182
    .line 183
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 184
    .line 185
    .line 186
    move-result-object v7

    .line 187
    invoke-virtual {v7, v6}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v7

    .line 191
    check-cast v7, Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v6}, Ll/dgs0;->m()Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v8

    .line 197
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v7

    .line 201
    if-nez v7, :cond_b

    .line 202
    .line 203
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 204
    .line 205
    .line 206
    move-result-object v7

    .line 207
    invoke-virtual {v7, v6}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v6

    .line 211
    check-cast v6, Ljava/lang/String;

    .line 212
    .line 213
    goto :goto_5

    .line 214
    :cond_b
    const-string v6, "#extension GL_OES_EGL_image_external : require\n#define INV_PI 0.3183\nprecision highp float;varying vec3 pos;uniform samplerExternalOES uSplr;uniform mat3 uVMat;uniform float uFOVx;uniform float uFOVy;void main() {  vec3 ray = vec3(pos.x * tan(uFOVx), pos.y * tan(uFOVy), -1);  ray = (uVMat * ray).xyz;  ray = normalize(ray);  vec2 texCrd = vec2(    0.5 + atan(ray.x, - ray.z) * INV_PI * 0.5, acos(ray.y) * INV_PI);  gl_FragColor = vec4(texture2D(uSplr, texCrd).xyz, 1.0);}"

    .line 215
    .line 216
    :goto_5
    const v7, 0x8b30

    .line 217
    .line 218
    .line 219
    invoke-static {v7, v6}, Ll/zet0;->k(ILjava/lang/String;)I

    .line 220
    .line 221
    .line 222
    move-result v6

    .line 223
    if-nez v6, :cond_c

    .line 224
    .line 225
    goto :goto_4

    .line 226
    :cond_c
    const-string v7, "createProgram"

    .line 227
    .line 228
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    .line 229
    .line 230
    .line 231
    move-result v8

    .line 232
    invoke-static {v7}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    if-eqz v8, :cond_e

    .line 236
    .line 237
    invoke-static {v8, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 238
    .line 239
    .line 240
    const-string v1, "attachShader"

    .line 241
    .line 242
    invoke-static {v1}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    invoke-static {v8, v6}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 246
    .line 247
    .line 248
    const-string v1, "attachShader"

    .line 249
    .line 250
    invoke-static {v1}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    invoke-static {v8}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 254
    .line 255
    .line 256
    const-string v1, "linkProgram"

    .line 257
    .line 258
    invoke-static {v1}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    new-array v1, v4, [I

    .line 262
    .line 263
    const v6, 0x8b82

    .line 264
    .line 265
    .line 266
    invoke-static {v8, v6, v1, v5}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 267
    .line 268
    .line 269
    const-string v6, "getProgramiv"

    .line 270
    .line 271
    invoke-static {v6}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    aget v1, v1, v5

    .line 275
    .line 276
    if-eq v1, v4, :cond_d

    .line 277
    .line 278
    const-string v1, "SphericalVideoRenderer"

    .line 279
    .line 280
    const-string v6, "Could not link program: "

    .line 281
    .line 282
    invoke-static {v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    .line 284
    .line 285
    invoke-static {v8}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    const-string v6, "SphericalVideoRenderer"

    .line 290
    .line 291
    invoke-static {v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    .line 293
    .line 294
    invoke-static {v8}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 295
    .line 296
    .line 297
    const-string v1, "deleteProgram"

    .line 298
    .line 299
    invoke-static {v1}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    goto :goto_4

    .line 303
    :cond_d
    invoke-static {v8}, Landroid/opengl/GLES20;->glValidateProgram(I)V

    .line 304
    .line 305
    .line 306
    const-string v1, "validateProgram"

    .line 307
    .line 308
    invoke-static {v1}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    :cond_e
    :goto_6
    iput v8, p0, Ll/zet0;->p:I

    .line 312
    .line 313
    invoke-static {v8}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 314
    .line 315
    .line 316
    const-string v1, "useProgram"

    .line 317
    .line 318
    invoke-static {v1}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    iget v1, p0, Ll/zet0;->p:I

    .line 322
    .line 323
    const-string v6, "aPosition"

    .line 324
    .line 325
    invoke-static {v1, v6}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 326
    .line 327
    .line 328
    move-result v7

    .line 329
    const/16 v11, 0xc

    .line 330
    .line 331
    iget-object v12, p0, Ll/zet0;->s:Ljava/nio/FloatBuffer;

    .line 332
    .line 333
    const/4 v8, 0x3

    .line 334
    const/16 v9, 0x1406

    .line 335
    .line 336
    const/4 v10, 0x0

    .line 337
    invoke-static/range {v7 .. v12}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 338
    .line 339
    .line 340
    const-string v1, "vertexAttribPointer"

    .line 341
    .line 342
    invoke-static {v1}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 343
    .line 344
    .line 345
    invoke-static {v7}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 346
    .line 347
    .line 348
    const-string v1, "enableVertexAttribArray"

    .line 349
    .line 350
    invoke-static {v1}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    new-array v1, v4, [I

    .line 354
    .line 355
    invoke-static {v4, v1, v5}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 356
    .line 357
    .line 358
    const-string v6, "genTextures"

    .line 359
    .line 360
    invoke-static {v6}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    aget v1, v1, v5

    .line 364
    .line 365
    const v6, 0x8d65

    .line 366
    .line 367
    .line 368
    invoke-static {v6, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 369
    .line 370
    .line 371
    const-string v7, "bindTextures"

    .line 372
    .line 373
    invoke-static {v7}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    const/16 v7, 0x2800

    .line 377
    .line 378
    const/16 v8, 0x2601

    .line 379
    .line 380
    invoke-static {v6, v7, v8}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 381
    .line 382
    .line 383
    const-string v7, "texParameteri"

    .line 384
    .line 385
    invoke-static {v7}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
    const/16 v7, 0x2801

    .line 389
    .line 390
    invoke-static {v6, v7, v8}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 391
    .line 392
    .line 393
    const-string v7, "texParameteri"

    .line 394
    .line 395
    invoke-static {v7}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    const/16 v7, 0x2802

    .line 399
    .line 400
    const v8, 0x812f

    .line 401
    .line 402
    .line 403
    invoke-static {v6, v7, v8}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 404
    .line 405
    .line 406
    const-string v7, "texParameteri"

    .line 407
    .line 408
    invoke-static {v7}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    const/16 v7, 0x2803

    .line 412
    .line 413
    invoke-static {v6, v7, v8}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 414
    .line 415
    .line 416
    const-string v6, "texParameteri"

    .line 417
    .line 418
    invoke-static {v6}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    iget v6, p0, Ll/zet0;->p:I

    .line 422
    .line 423
    const-string v7, "uVMat"

    .line 424
    .line 425
    invoke-static {v6, v7}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 426
    .line 427
    .line 428
    move-result v6

    .line 429
    iput v6, p0, Ll/zet0;->q:I

    .line 430
    .line 431
    const/16 v7, 0x9

    .line 432
    .line 433
    new-array v7, v7, [F

    .line 434
    .line 435
    fill-array-data v7, :array_1

    .line 436
    .line 437
    .line 438
    invoke-static {v6, v4, v5, v7, v5}, Landroid/opengl/GLES20;->glUniformMatrix3fv(IIZ[FI)V

    .line 439
    .line 440
    .line 441
    iget v6, p0, Ll/zet0;->p:I

    .line 442
    .line 443
    if-eqz v0, :cond_17

    .line 444
    .line 445
    if-nez v6, :cond_f

    .line 446
    .line 447
    goto/16 :goto_10

    .line 448
    .line 449
    :cond_f
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 450
    .line 451
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 452
    .line 453
    .line 454
    iput-object v0, p0, Ll/zet0;->n:Landroid/graphics/SurfaceTexture;

    .line 455
    .line 456
    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 457
    .line 458
    .line 459
    iget-object v0, p0, Ll/zet0;->t:Ljava/util/concurrent/CountDownLatch;

    .line 460
    .line 461
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 462
    .line 463
    .line 464
    iget-object v0, p0, Ll/zet0;->a:Ll/yet0;

    .line 465
    .line 466
    invoke-virtual {v0}, Ll/yet0;->c()V

    .line 467
    .line 468
    .line 469
    :try_start_0
    iput-boolean v4, p0, Ll/zet0;->z:Z

    .line 470
    .line 471
    :catch_0
    :goto_7
    iget-boolean v0, p0, Ll/zet0;->A:Z

    .line 472
    .line 473
    if-eqz v0, :cond_10

    .line 474
    .line 475
    goto/16 :goto_e

    .line 476
    .line 477
    :cond_10
    :goto_8
    iget v0, p0, Ll/zet0;->r:I

    .line 478
    .line 479
    if-lez v0, :cond_11

    .line 480
    .line 481
    iget-object v0, p0, Ll/zet0;->n:Landroid/graphics/SurfaceTexture;

    .line 482
    .line 483
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 484
    .line 485
    .line 486
    iget v0, p0, Ll/zet0;->r:I

    .line 487
    .line 488
    add-int/lit8 v0, v0, -0x1

    .line 489
    .line 490
    iput v0, p0, Ll/zet0;->r:I

    .line 491
    .line 492
    goto :goto_8

    .line 493
    :catchall_0
    move-exception v0

    .line 494
    goto/16 :goto_d

    .line 495
    .line 496
    :cond_11
    iget-object v0, p0, Ll/zet0;->a:Ll/yet0;

    .line 497
    .line 498
    iget-object v1, p0, Ll/zet0;->b:[F

    .line 499
    .line 500
    invoke-virtual {v0, v1}, Ll/yet0;->e([F)Z

    .line 501
    .line 502
    .line 503
    move-result v0

    .line 504
    const v1, -0x4036f025

    .line 505
    .line 506
    .line 507
    const/4 v6, 0x5

    .line 508
    const/4 v7, 0x4

    .line 509
    if-eqz v0, :cond_13

    .line 510
    .line 511
    iget v0, p0, Ll/zet0;->i:F

    .line 512
    .line 513
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    .line 514
    .line 515
    .line 516
    move-result v0

    .line 517
    if-eqz v0, :cond_12

    .line 518
    .line 519
    iget-object v0, p0, Ll/zet0;->b:[F

    .line 520
    .line 521
    const/4 v8, 0x3

    .line 522
    new-array v9, v8, [F

    .line 523
    .line 524
    fill-array-data v9, :array_2

    .line 525
    .line 526
    .line 527
    aget v10, v0, v5

    .line 528
    .line 529
    aget v11, v9, v5

    .line 530
    .line 531
    mul-float/2addr v10, v11

    .line 532
    aget v12, v0, v4

    .line 533
    .line 534
    aget v9, v9, v4

    .line 535
    .line 536
    mul-float/2addr v12, v9

    .line 537
    add-float/2addr v10, v12

    .line 538
    aget v12, v0, v2

    .line 539
    .line 540
    const/4 v13, 0x0

    .line 541
    mul-float/2addr v12, v13

    .line 542
    add-float/2addr v10, v12

    .line 543
    aget v12, v0, v8

    .line 544
    .line 545
    mul-float/2addr v12, v11

    .line 546
    aget v14, v0, v7

    .line 547
    .line 548
    mul-float/2addr v14, v9

    .line 549
    add-float/2addr v12, v14

    .line 550
    aget v14, v0, v6

    .line 551
    .line 552
    mul-float/2addr v14, v13

    .line 553
    add-float/2addr v12, v14

    .line 554
    const/4 v14, 0x6

    .line 555
    aget v14, v0, v14

    .line 556
    .line 557
    mul-float/2addr v14, v11

    .line 558
    const/4 v11, 0x7

    .line 559
    aget v11, v0, v11

    .line 560
    .line 561
    mul-float/2addr v11, v9

    .line 562
    add-float/2addr v14, v11

    .line 563
    const/16 v9, 0x8

    .line 564
    .line 565
    aget v0, v0, v9

    .line 566
    .line 567
    mul-float/2addr v0, v13

    .line 568
    add-float/2addr v14, v0

    .line 569
    new-array v0, v8, [F

    .line 570
    .line 571
    aput v10, v0, v5

    .line 572
    .line 573
    aput v12, v0, v4

    .line 574
    .line 575
    aput v14, v0, v2

    .line 576
    .line 577
    aget v8, v0, v4

    .line 578
    .line 579
    float-to-double v8, v8

    .line 580
    aget v0, v0, v5

    .line 581
    .line 582
    float-to-double v10, v0

    .line 583
    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->atan2(DD)D

    .line 584
    .line 585
    .line 586
    move-result-wide v8

    .line 587
    double-to-float v0, v8

    .line 588
    add-float/2addr v0, v1

    .line 589
    neg-float v0, v0

    .line 590
    iput v0, p0, Ll/zet0;->i:F

    .line 591
    .line 592
    :cond_12
    iget-object v0, p0, Ll/zet0;->g:[F

    .line 593
    .line 594
    iget v1, p0, Ll/zet0;->i:F

    .line 595
    .line 596
    iget v8, p0, Ll/zet0;->j:F

    .line 597
    .line 598
    add-float/2addr v1, v8

    .line 599
    invoke-static {v0, v1}, Ll/zet0;->j([FF)V

    .line 600
    .line 601
    .line 602
    goto :goto_9

    .line 603
    :cond_13
    iget-object v0, p0, Ll/zet0;->b:[F

    .line 604
    .line 605
    invoke-static {v0, v1}, Ll/zet0;->i([FF)V

    .line 606
    .line 607
    .line 608
    iget-object v0, p0, Ll/zet0;->g:[F

    .line 609
    .line 610
    iget v1, p0, Ll/zet0;->j:F

    .line 611
    .line 612
    invoke-static {v0, v1}, Ll/zet0;->j([FF)V

    .line 613
    .line 614
    .line 615
    :goto_9
    iget-object v0, p0, Ll/zet0;->c:[F

    .line 616
    .line 617
    const v1, 0x3fc90fdb

    .line 618
    .line 619
    .line 620
    invoke-static {v0, v1}, Ll/zet0;->i([FF)V

    .line 621
    .line 622
    .line 623
    iget-object v0, p0, Ll/zet0;->d:[F

    .line 624
    .line 625
    iget-object v1, p0, Ll/zet0;->g:[F

    .line 626
    .line 627
    iget-object v8, p0, Ll/zet0;->c:[F

    .line 628
    .line 629
    invoke-static {v0, v1, v8}, Ll/zet0;->h([F[F[F)V

    .line 630
    .line 631
    .line 632
    iget-object v0, p0, Ll/zet0;->e:[F

    .line 633
    .line 634
    iget-object v1, p0, Ll/zet0;->b:[F

    .line 635
    .line 636
    iget-object v8, p0, Ll/zet0;->d:[F

    .line 637
    .line 638
    invoke-static {v0, v1, v8}, Ll/zet0;->h([F[F[F)V

    .line 639
    .line 640
    .line 641
    iget-object v0, p0, Ll/zet0;->f:[F

    .line 642
    .line 643
    iget v1, p0, Ll/zet0;->k:F

    .line 644
    .line 645
    invoke-static {v0, v1}, Ll/zet0;->i([FF)V

    .line 646
    .line 647
    .line 648
    iget-object v0, p0, Ll/zet0;->h:[F

    .line 649
    .line 650
    iget-object v1, p0, Ll/zet0;->f:[F

    .line 651
    .line 652
    iget-object v8, p0, Ll/zet0;->e:[F

    .line 653
    .line 654
    invoke-static {v0, v1, v8}, Ll/zet0;->h([F[F[F)V

    .line 655
    .line 656
    .line 657
    iget v0, p0, Ll/zet0;->q:I

    .line 658
    .line 659
    iget-object v1, p0, Ll/zet0;->h:[F

    .line 660
    .line 661
    invoke-static {v0, v4, v5, v1, v5}, Landroid/opengl/GLES20;->glUniformMatrix3fv(IIZ[FI)V

    .line 662
    .line 663
    .line 664
    invoke-static {v6, v5, v7}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 665
    .line 666
    .line 667
    const-string v0, "drawArrays"

    .line 668
    .line 669
    invoke-static {v0}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 670
    .line 671
    .line 672
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 673
    .line 674
    .line 675
    iget-object v0, p0, Ll/zet0;->v:Ljavax/microedition/khronos/egl/EGL10;

    .line 676
    .line 677
    iget-object v1, p0, Ll/zet0;->w:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 678
    .line 679
    iget-object v6, p0, Ll/zet0;->y:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 680
    .line 681
    invoke-interface {v0, v1, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 682
    .line 683
    .line 684
    iget-boolean v0, p0, Ll/zet0;->z:Z

    .line 685
    .line 686
    if-eqz v0, :cond_15

    .line 687
    .line 688
    iget v0, p0, Ll/zet0;->m:I

    .line 689
    .line 690
    iget v1, p0, Ll/zet0;->l:I

    .line 691
    .line 692
    invoke-static {v5, v5, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 693
    .line 694
    .line 695
    const-string v0, "viewport"

    .line 696
    .line 697
    invoke-static {v0}, Ll/zet0;->g(Ljava/lang/String;)V

    .line 698
    .line 699
    .line 700
    iget v0, p0, Ll/zet0;->p:I

    .line 701
    .line 702
    const-string v1, "uFOVx"

    .line 703
    .line 704
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 705
    .line 706
    .line 707
    move-result v0

    .line 708
    iget v1, p0, Ll/zet0;->p:I

    .line 709
    .line 710
    const-string v6, "uFOVy"

    .line 711
    .line 712
    invoke-static {v1, v6}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 713
    .line 714
    .line 715
    move-result v1

    .line 716
    iget v6, p0, Ll/zet0;->m:I

    .line 717
    .line 718
    iget v7, p0, Ll/zet0;->l:I

    .line 719
    .line 720
    const v8, 0x3f5f66f3

    .line 721
    .line 722
    .line 723
    if-le v6, v7, :cond_14

    .line 724
    .line 725
    invoke-static {v0, v8}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 726
    .line 727
    .line 728
    iget v0, p0, Ll/zet0;->l:I

    .line 729
    .line 730
    int-to-float v0, v0

    .line 731
    mul-float/2addr v0, v8

    .line 732
    iget v6, p0, Ll/zet0;->m:I

    .line 733
    .line 734
    int-to-float v6, v6

    .line 735
    div-float/2addr v0, v6

    .line 736
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 737
    .line 738
    .line 739
    goto :goto_a

    .line 740
    :cond_14
    int-to-float v6, v6

    .line 741
    mul-float/2addr v6, v8

    .line 742
    int-to-float v7, v7

    .line 743
    div-float/2addr v6, v7

    .line 744
    invoke-static {v0, v6}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 745
    .line 746
    .line 747
    invoke-static {v1, v8}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 748
    .line 749
    .line 750
    :goto_a
    iput-boolean v5, p0, Ll/zet0;->z:Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 751
    .line 752
    :cond_15
    :try_start_1
    iget-object v1, p0, Ll/zet0;->u:Ljava/lang/Object;

    .line 753
    .line 754
    monitor-enter v1
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 755
    :try_start_2
    iget-boolean v0, p0, Ll/zet0;->A:Z

    .line 756
    .line 757
    if-nez v0, :cond_16

    .line 758
    .line 759
    iget-boolean v0, p0, Ll/zet0;->z:Z

    .line 760
    .line 761
    if-nez v0, :cond_16

    .line 762
    .line 763
    iget v0, p0, Ll/zet0;->r:I

    .line 764
    .line 765
    if-nez v0, :cond_16

    .line 766
    .line 767
    iget-object v0, p0, Ll/zet0;->u:Ljava/lang/Object;

    .line 768
    .line 769
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V

    .line 770
    .line 771
    .line 772
    goto :goto_b

    .line 773
    :catchall_1
    move-exception v0

    .line 774
    goto :goto_c

    .line 775
    :cond_16
    :goto_b
    monitor-exit v1

    .line 776
    goto/16 :goto_7

    .line 777
    .line 778
    :goto_c
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 779
    :try_start_3
    throw v0
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 780
    :goto_d
    :try_start_4
    const-string v1, "SphericalVideoProcessor died."

    .line 781
    .line 782
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 783
    .line 784
    .line 785
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 786
    .line 787
    .line 788
    move-result-object v1

    .line 789
    const-string v2, "SphericalVideoProcessor.run.2"

    .line 790
    .line 791
    invoke-virtual {v1, v0, v2}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 792
    .line 793
    .line 794
    goto :goto_e

    .line 795
    :catchall_2
    move-exception v0

    .line 796
    goto :goto_f

    .line 797
    :catch_1
    const-string v0, "SphericalVideoProcessor halted unexpectedly."

    .line 798
    .line 799
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 800
    .line 801
    .line 802
    :goto_e
    iget-object v0, p0, Ll/zet0;->a:Ll/yet0;

    .line 803
    .line 804
    invoke-virtual {v0}, Ll/yet0;->d()V

    .line 805
    .line 806
    .line 807
    iget-object v0, p0, Ll/zet0;->n:Landroid/graphics/SurfaceTexture;

    .line 808
    .line 809
    invoke-virtual {v0, v3}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 810
    .line 811
    .line 812
    iput-object v3, p0, Ll/zet0;->n:Landroid/graphics/SurfaceTexture;

    .line 813
    .line 814
    invoke-virtual {p0}, Ll/zet0;->f()Z

    .line 815
    .line 816
    .line 817
    return-void

    .line 818
    :goto_f
    iget-object v1, p0, Ll/zet0;->a:Ll/yet0;

    .line 819
    .line 820
    invoke-virtual {v1}, Ll/yet0;->d()V

    .line 821
    .line 822
    .line 823
    iget-object v1, p0, Ll/zet0;->n:Landroid/graphics/SurfaceTexture;

    .line 824
    .line 825
    invoke-virtual {v1, v3}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 826
    .line 827
    .line 828
    iput-object v3, p0, Ll/zet0;->n:Landroid/graphics/SurfaceTexture;

    .line 829
    .line 830
    invoke-virtual {p0}, Ll/zet0;->f()Z

    .line 831
    .line 832
    .line 833
    throw v0

    .line 834
    :cond_17
    :goto_10
    iget-object v0, p0, Ll/zet0;->v:Ljavax/microedition/khronos/egl/EGL10;

    .line 835
    .line 836
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    .line 837
    .line 838
    .line 839
    move-result v0

    .line 840
    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 841
    .line 842
    .line 843
    move-result-object v0

    .line 844
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 845
    .line 846
    .line 847
    move-result-object v0

    .line 848
    const-string v1, "EGL initialization failed: "

    .line 849
    .line 850
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 851
    .line 852
    .line 853
    move-result-object v0

    .line 854
    invoke-static {v0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 855
    .line 856
    .line 857
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 858
    .line 859
    .line 860
    move-result-object v1

    .line 861
    new-instance v2, Ljava/lang/Throwable;

    .line 862
    .line 863
    invoke-direct {v2, v0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 864
    .line 865
    .line 866
    const-string v0, "SphericalVideoProcessor.run.1"

    .line 867
    .line 868
    invoke-virtual {v1, v2, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 869
    .line 870
    .line 871
    invoke-virtual {p0}, Ll/zet0;->f()Z

    .line 872
    .line 873
    .line 874
    iget-object p0, p0, Ll/zet0;->t:Ljava/util/concurrent/CountDownLatch;

    .line 875
    .line 876
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 877
    .line 878
    .line 879
    return-void

    .line 880
    :cond_18
    const-string v0, "SphericalVideoProcessor started with no output texture."

    .line 881
    .line 882
    invoke-static {v0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 883
    .line 884
    .line 885
    iget-object p0, p0, Ll/zet0;->t:Ljava/util/concurrent/CountDownLatch;

    .line 886
    .line 887
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 888
    .line 889
    .line 890
    return-void

    .line 891
    :array_0
    .array-data 4
        0x3040
        0x4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3025
        0x10
        0x3038
    .end array-data

    .line 892
    .line 893
    .line 894
    .line 895
    .line 896
    .line 897
    .line 898
    .line 899
    .line 900
    .line 901
    .line 902
    .line 903
    .line 904
    .line 905
    .line 906
    .line 907
    .line 908
    .line 909
    .line 910
    .line 911
    .line 912
    .line 913
    .line 914
    .line 915
    .line 916
    .line 917
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 918
    .line 919
    .line 920
    .line 921
    .line 922
    .line 923
    .line 924
    .line 925
    .line 926
    .line 927
    .line 928
    .line 929
    .line 930
    .line 931
    .line 932
    .line 933
    .line 934
    .line 935
    .line 936
    .line 937
    .line 938
    .line 939
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final zza()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zet0;->u:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/zet0;->u:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

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
