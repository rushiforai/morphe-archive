.class Ltv/danmaku/ijk/media/player/TextureRender;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final CUBE:[F

.field private static final FLOAT_SIZE_BYTES:I = 0x4

.field private static final FRAGMENT_SHADER:Ljava/lang/String; = "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n  gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

.field private static final TAG:Ljava/lang/String; = "TextureRender"

.field private static final VERTEX_SHADER:Ljava/lang/String; = "uniform mat4 uSTMatrix;\nattribute vec4 aPosition;\nattribute vec2 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n  gl_Position = aPosition;\n  vTextureCoord = aTextureCoord;\n}\n"


# instance fields
.field private bNeedUpdateRec:Z

.field private cut_b:F

.field private cut_l:F

.field private cut_r:F

.field private cut_t:F

.field private mFlipHorizontal:Z

.field private mFlipVertical:Z

.field private mImageHeight:I

.field private mImageWidth:I

.field private mOutputHeight:I

.field private mOutputWidth:I

.field private mProgram:I

.field private mRotation:Lcom/immomo/baseutil/Rotation;

.field private mScreenHight:I

.field private mScreenWidth:I

.field private mSource_coords:Ljava/nio/FloatBuffer;

.field private final mSource_coordsDate:[F

.field private mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

.field private mTarget_coords:Ljava/nio/FloatBuffer;

.field private final mTarget_coordsDate:[F

.field private mTextureID:I

.field private maPositionHandle:I

.field private maTextureHandle:I

.field private pixelShader:I

.field private vertexShader:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ltv/danmaku/ijk/media/player/TextureRender;->CUBE:[F

    .line 9
    .line 10
    return-void

    .line 11
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
.end method

.method public constructor <init>(Ltv/danmaku/ijk/media/player/fakeSurface;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v1, v0, [F

    .line 7
    .line 8
    fill-array-data v1, :array_0

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSource_coordsDate:[F

    .line 12
    .line 13
    new-array v0, v0, [F

    .line 14
    .line 15
    fill-array-data v0, :array_1

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mTarget_coordsDate:[F

    .line 19
    .line 20
    sget-object v2, Lcom/immomo/baseutil/Rotation;->NORMAL:Lcom/immomo/baseutil/Rotation;

    .line 21
    .line 22
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mRotation:Lcom/immomo/baseutil/Rotation;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mFlipHorizontal:Z

    .line 26
    .line 27
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mFlipVertical:Z

    .line 28
    .line 29
    const/16 v3, -0x3039

    .line 30
    .line 31
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mTextureID:I

    .line 32
    .line 33
    const/16 v3, 0x280

    .line 34
    .line 35
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageWidth:I

    .line 36
    .line 37
    const/16 v3, 0x160

    .line 38
    .line 39
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageHeight:I

    .line 40
    .line 41
    const/16 v3, 0x3c0

    .line 42
    .line 43
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenWidth:I

    .line 44
    .line 45
    const/16 v3, 0x21b

    .line 46
    .line 47
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenHight:I

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_l:F

    .line 54
    .line 55
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_t:F

    .line 56
    .line 57
    const/high16 v3, 0x3f800000    # 1.0f

    .line 58
    .line 59
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_r:F

    .line 60
    .line 61
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_b:F

    .line 62
    .line 63
    const/4 v3, 0x1

    .line 64
    iput-boolean v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->bNeedUpdateRec:Z

    .line 65
    .line 66
    iput v2, p0, Ltv/danmaku/ijk/media/player/TextureRender;->vertexShader:I

    .line 67
    .line 68
    iput v2, p0, Ltv/danmaku/ijk/media/player/TextureRender;->pixelShader:I

    .line 69
    .line 70
    array-length v3, v1

    .line 71
    mul-int/lit8 v3, v3, 0x4

    .line 72
    .line 73
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSource_coords:Ljava/nio/FloatBuffer;

    .line 90
    .line 91
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 96
    .line 97
    .line 98
    array-length v1, v0

    .line 99
    mul-int/lit8 v1, v1, 0x4

    .line 100
    .line 101
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mTarget_coords:Ljava/nio/FloatBuffer;

    .line 118
    .line 119
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 124
    .line 125
    .line 126
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 127
    .line 128
    return-void

    .line 129
    :array_0
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
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    :array_1
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
.end method

.method private addDistance(FF)F
    .locals 0

    const/4 p0, 0x0

    cmpl-float p0, p1, p0

    if-nez p0, :cond_0

    return p2

    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    sub-float/2addr p0, p2

    return p0
.end method

.method private addDistance2(FFF)F
    .locals 0

    const/4 p0, 0x0

    cmpl-float p0, p1, p0

    if-nez p0, :cond_0

    return p2

    :cond_0
    return p3
.end method

.method private createProgram(Ljava/lang/String;Ljava/lang/String;)I
    .locals 5

    .line 1
    const v0, 0x8b31

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, v0, p1}, Ltv/danmaku/ijk/media/player/TextureRender;->loadShader(ILjava/lang/String;)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->vertexShader:I

    .line 9
    .line 10
    const/4 v0, -0x1

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 17
    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    const p1, 0x8b30

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/player/TextureRender;->loadShader(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->pixelShader:I

    .line 28
    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 34
    .line 35
    .line 36
    return v1

    .line 37
    :cond_1
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const-string p2, "glCreateProgram"

    .line 42
    .line 43
    invoke-virtual {p0, p2}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const-string p2, "TextureRender"

    .line 47
    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 51
    .line 52
    invoke-virtual {v2, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 53
    .line 54
    .line 55
    const-string v2, "Could not create program"

    .line 56
    .line 57
    invoke-static {p2, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    :cond_2
    iget v2, p0, Ltv/danmaku/ijk/media/player/TextureRender;->vertexShader:I

    .line 61
    .line 62
    invoke-static {p1, v2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 63
    .line 64
    .line 65
    const-string v2, "glAttachShader"

    .line 66
    .line 67
    invoke-virtual {p0, v2}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget v3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->pixelShader:I

    .line 71
    .line 72
    invoke-static {p1, v3}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v2}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {p1}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 79
    .line 80
    .line 81
    const/4 v2, 0x1

    .line 82
    new-array v3, v2, [I

    .line 83
    .line 84
    const v4, 0x8b82

    .line 85
    .line 86
    .line 87
    invoke-static {p1, v4, v3, v1}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 88
    .line 89
    .line 90
    aget v3, v3, v1

    .line 91
    .line 92
    if-eq v3, v2, :cond_3

    .line 93
    .line 94
    const-string v2, "Could not link program: "

    .line 95
    .line 96
    invoke-static {p2, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    invoke-static {p1}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-static {p2, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    invoke-static {p1}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 112
    .line 113
    .line 114
    return v1

    .line 115
    :cond_3
    return p1
.end method

.method private loadShader(ILjava/lang/String;)I
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "glCreateShader type="

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0, v1}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, p2}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 26
    .line 27
    .line 28
    const/4 p2, 0x1

    .line 29
    new-array p2, p2, [I

    .line 30
    .line 31
    const v1, 0x8b81

    .line 32
    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-static {v0, v1, p2, v2}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 36
    .line 37
    .line 38
    aget p2, p2, v2

    .line 39
    .line 40
    if-nez p2, :cond_0

    .line 41
    .line 42
    new-instance p2, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "Could not compile shader "

    .line 45
    .line 46
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p1, ":"

    .line 53
    .line 54
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string p2, "TextureRender"

    .line 62
    .line 63
    invoke-static {p2, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    new-instance p1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v1, " "

    .line 69
    .line 70
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p2, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 91
    .line 92
    const/4 p1, -0x1

    .line 93
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 94
    .line 95
    .line 96
    return v2

    .line 97
    :cond_0
    return v0
.end method


# virtual methods
.method public adjustImageScaling()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "adjustImageScaling mOutputWidth:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget v2, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mOutputWidth:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ";outputHeight:"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget v2, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mOutputHeight:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, ";mImageWidth:"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget v2, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageWidth:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, ";mImageHeight"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget v2, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageHeight:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v2, ";mRotation:"

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object v2, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mRotation:Lcom/immomo/baseutil/Rotation;

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, "TextureRender"

    .line 60
    .line 61
    invoke-static {v2, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    iget v1, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mOutputWidth:I

    .line 65
    .line 66
    int-to-float v2, v1

    .line 67
    iget v3, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mOutputHeight:I

    .line 68
    .line 69
    int-to-float v4, v3

    .line 70
    iget-object v5, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mRotation:Lcom/immomo/baseutil/Rotation;

    .line 71
    .line 72
    sget-object v6, Lcom/immomo/baseutil/Rotation;->ROTATION_270:Lcom/immomo/baseutil/Rotation;

    .line 73
    .line 74
    if-eq v5, v6, :cond_0

    .line 75
    .line 76
    sget-object v6, Lcom/immomo/baseutil/Rotation;->ROTATION_90:Lcom/immomo/baseutil/Rotation;

    .line 77
    .line 78
    if-ne v5, v6, :cond_1

    .line 79
    .line 80
    :cond_0
    int-to-float v2, v3

    .line 81
    int-to-float v4, v1

    .line 82
    :cond_1
    iget v1, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageWidth:I

    .line 83
    .line 84
    int-to-float v1, v1

    .line 85
    div-float v1, v2, v1

    .line 86
    .line 87
    iget v3, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageHeight:I

    .line 88
    .line 89
    int-to-float v3, v3

    .line 90
    div-float v3, v4, v3

    .line 91
    .line 92
    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    iget v3, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageWidth:I

    .line 97
    .line 98
    int-to-float v3, v3

    .line 99
    mul-float/2addr v3, v1

    .line 100
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    iget v5, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageHeight:I

    .line 105
    .line 106
    int-to-float v5, v5

    .line 107
    mul-float/2addr v5, v1

    .line 108
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    int-to-float v3, v3

    .line 113
    div-float/2addr v3, v2

    .line 114
    int-to-float v1, v1

    .line 115
    div-float/2addr v1, v4

    .line 116
    sget-object v2, Ltv/danmaku/ijk/media/player/TextureRender;->CUBE:[F

    .line 117
    .line 118
    iget-object v4, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mRotation:Lcom/immomo/baseutil/Rotation;

    .line 119
    .line 120
    iget-boolean v5, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mFlipHorizontal:Z

    .line 121
    .line 122
    iget-boolean v6, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mFlipVertical:Z

    .line 123
    .line 124
    invoke-static {v4, v5, v6}, Ll/wti0;->b(Lcom/immomo/baseutil/Rotation;ZZ)[F

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    const/high16 v5, 0x3f800000    # 1.0f

    .line 129
    .line 130
    div-float v3, v5, v3

    .line 131
    .line 132
    sub-float v3, v5, v3

    .line 133
    .line 134
    const/high16 v6, 0x40000000    # 2.0f

    .line 135
    .line 136
    div-float/2addr v3, v6

    .line 137
    div-float v1, v5, v1

    .line 138
    .line 139
    sub-float/2addr v5, v1

    .line 140
    div-float/2addr v5, v6

    .line 141
    const/4 v1, 0x0

    .line 142
    aget v6, v4, v1

    .line 143
    .line 144
    invoke-direct {v0, v6, v3}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance(FF)F

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    const/4 v7, 0x1

    .line 149
    aget v8, v4, v7

    .line 150
    .line 151
    invoke-direct {v0, v8, v5}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance(FF)F

    .line 152
    .line 153
    .line 154
    move-result v8

    .line 155
    const/4 v9, 0x2

    .line 156
    aget v10, v4, v9

    .line 157
    .line 158
    invoke-direct {v0, v10, v3}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance(FF)F

    .line 159
    .line 160
    .line 161
    move-result v10

    .line 162
    const/4 v11, 0x3

    .line 163
    aget v12, v4, v11

    .line 164
    .line 165
    invoke-direct {v0, v12, v5}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance(FF)F

    .line 166
    .line 167
    .line 168
    move-result v12

    .line 169
    const/4 v13, 0x4

    .line 170
    aget v14, v4, v13

    .line 171
    .line 172
    invoke-direct {v0, v14, v3}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance(FF)F

    .line 173
    .line 174
    .line 175
    move-result v14

    .line 176
    const/4 v15, 0x5

    .line 177
    move/from16 v16, v7

    .line 178
    .line 179
    aget v7, v4, v15

    .line 180
    .line 181
    invoke-direct {v0, v7, v5}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance(FF)F

    .line 182
    .line 183
    .line 184
    move-result v7

    .line 185
    const/16 v17, 0x6

    .line 186
    .line 187
    move/from16 v18, v9

    .line 188
    .line 189
    aget v9, v4, v17

    .line 190
    .line 191
    invoke-direct {v0, v9, v3}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance(FF)F

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    const/4 v9, 0x7

    .line 196
    aget v4, v4, v9

    .line 197
    .line 198
    invoke-direct {v0, v4, v5}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance(FF)F

    .line 199
    .line 200
    .line 201
    move-result v4

    .line 202
    const/16 v5, 0x8

    .line 203
    .line 204
    new-array v5, v5, [F

    .line 205
    .line 206
    aput v6, v5, v1

    .line 207
    .line 208
    aput v8, v5, v16

    .line 209
    .line 210
    aput v10, v5, v18

    .line 211
    .line 212
    aput v12, v5, v11

    .line 213
    .line 214
    aput v14, v5, v13

    .line 215
    .line 216
    aput v7, v5, v15

    .line 217
    .line 218
    aput v3, v5, v17

    .line 219
    .line 220
    aput v4, v5, v9

    .line 221
    .line 222
    iget-object v3, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mTarget_coords:Ljava/nio/FloatBuffer;

    .line 223
    .line 224
    invoke-virtual {v3}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 225
    .line 226
    .line 227
    iget-object v3, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mTarget_coords:Ljava/nio/FloatBuffer;

    .line 228
    .line 229
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    invoke-virtual {v2, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 234
    .line 235
    .line 236
    iget-object v2, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mSource_coords:Ljava/nio/FloatBuffer;

    .line 237
    .line 238
    invoke-virtual {v2}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 239
    .line 240
    .line 241
    iget-object v0, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mSource_coords:Ljava/nio/FloatBuffer;

    .line 242
    .line 243
    invoke-virtual {v0, v5}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 248
    .line 249
    .line 250
    return-void
.end method

.method public adjustImageScaling2()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget-object v1, Ltv/danmaku/ijk/media/player/TextureRender;->CUBE:[F

    .line 4
    .line 5
    iget-object v2, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mRotation:Lcom/immomo/baseutil/Rotation;

    .line 6
    .line 7
    iget-boolean v3, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mFlipHorizontal:Z

    .line 8
    .line 9
    iget-boolean v4, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mFlipVertical:Z

    .line 10
    .line 11
    invoke-static {v2, v3, v4}, Ll/wti0;->b(Lcom/immomo/baseutil/Rotation;ZZ)[F

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/4 v3, 0x0

    .line 16
    aget v4, v2, v3

    .line 17
    .line 18
    iget v5, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_l:F

    .line 19
    .line 20
    iget v6, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_r:F

    .line 21
    .line 22
    invoke-direct {v0, v4, v5, v6}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance2(FFF)F

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const/4 v5, 0x1

    .line 27
    aget v6, v2, v5

    .line 28
    .line 29
    iget v7, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_t:F

    .line 30
    .line 31
    iget v8, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_b:F

    .line 32
    .line 33
    invoke-direct {v0, v6, v7, v8}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance2(FFF)F

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    const/4 v7, 0x2

    .line 38
    aget v8, v2, v7

    .line 39
    .line 40
    iget v9, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_l:F

    .line 41
    .line 42
    iget v10, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_r:F

    .line 43
    .line 44
    invoke-direct {v0, v8, v9, v10}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance2(FFF)F

    .line 45
    .line 46
    .line 47
    move-result v8

    .line 48
    const/4 v9, 0x3

    .line 49
    aget v10, v2, v9

    .line 50
    .line 51
    iget v11, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_t:F

    .line 52
    .line 53
    iget v12, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_b:F

    .line 54
    .line 55
    invoke-direct {v0, v10, v11, v12}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance2(FFF)F

    .line 56
    .line 57
    .line 58
    move-result v10

    .line 59
    const/4 v11, 0x4

    .line 60
    aget v12, v2, v11

    .line 61
    .line 62
    iget v13, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_l:F

    .line 63
    .line 64
    iget v14, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_r:F

    .line 65
    .line 66
    invoke-direct {v0, v12, v13, v14}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance2(FFF)F

    .line 67
    .line 68
    .line 69
    move-result v12

    .line 70
    const/4 v13, 0x5

    .line 71
    aget v14, v2, v13

    .line 72
    .line 73
    iget v15, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_t:F

    .line 74
    .line 75
    move/from16 v16, v5

    .line 76
    .line 77
    iget v5, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_b:F

    .line 78
    .line 79
    invoke-direct {v0, v14, v15, v5}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance2(FFF)F

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    const/4 v14, 0x6

    .line 84
    aget v15, v2, v14

    .line 85
    .line 86
    move/from16 v17, v7

    .line 87
    .line 88
    iget v7, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_l:F

    .line 89
    .line 90
    move/from16 v18, v9

    .line 91
    .line 92
    iget v9, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_r:F

    .line 93
    .line 94
    invoke-direct {v0, v15, v7, v9}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance2(FFF)F

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    const/4 v9, 0x7

    .line 99
    aget v2, v2, v9

    .line 100
    .line 101
    iget v15, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_t:F

    .line 102
    .line 103
    move/from16 v19, v9

    .line 104
    .line 105
    iget v9, v0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_b:F

    .line 106
    .line 107
    invoke-direct {v0, v2, v15, v9}, Ltv/danmaku/ijk/media/player/TextureRender;->addDistance2(FFF)F

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    const/16 v9, 0x8

    .line 112
    .line 113
    new-array v9, v9, [F

    .line 114
    .line 115
    aput v4, v9, v3

    .line 116
    .line 117
    aput v6, v9, v16

    .line 118
    .line 119
    aput v8, v9, v17

    .line 120
    .line 121
    aput v10, v9, v18

    .line 122
    .line 123
    aput v12, v9, v11

    .line 124
    .line 125
    aput v5, v9, v13

    .line 126
    .line 127
    aput v7, v9, v14

    .line 128
    .line 129
    aput v2, v9, v19

    .line 130
    .line 131
    iget-object v2, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mTarget_coords:Ljava/nio/FloatBuffer;

    .line 132
    .line 133
    invoke-virtual {v2}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 134
    .line 135
    .line 136
    iget-object v2, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mTarget_coords:Ljava/nio/FloatBuffer;

    .line 137
    .line 138
    invoke-virtual {v2, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v1, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 143
    .line 144
    .line 145
    iget-object v1, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mSource_coords:Ljava/nio/FloatBuffer;

    .line 146
    .line 147
    invoke-virtual {v1}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 148
    .line 149
    .line 150
    iget-object v0, v0, Ltv/danmaku/ijk/media/player/TextureRender;->mSource_coords:Ljava/nio/FloatBuffer;

    .line 151
    .line 152
    invoke-virtual {v0, v9}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public checkGlError(Ljava/lang/String;)V
    .locals 3

    .line 1
    :goto_0
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
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ": glError "

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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
    move-result-object v0

    .line 27
    const-string v1, "TextureRender"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 33
    .line 34
    const/4 v1, -0x1

    .line 35
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mProgram:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 7
    .line 8
    .line 9
    iput v1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mProgram:I

    .line 10
    .line 11
    :cond_0
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->vertexShader:I

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 16
    .line 17
    .line 18
    iput v1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->vertexShader:I

    .line 19
    .line 20
    :cond_1
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->pixelShader:I

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 25
    .line 26
    .line 27
    iput v1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->pixelShader:I

    .line 28
    .line 29
    :cond_2
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mTextureID:I

    .line 30
    .line 31
    if-lez v0, :cond_3

    .line 32
    .line 33
    filled-new-array {v0}, [I

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 39
    .line 40
    .line 41
    iput v1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mTextureID:I

    .line 42
    .line 43
    :cond_3
    const-string p0, "TextureRender"

    .line 44
    .line 45
    const-string v0, "destroy: "

    .line 46
    .line 47
    invoke-static {p0, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public drawFrame(Landroid/graphics/SurfaceTexture;)V
    .locals 7

    .line 1
    const-string p1, "onDrawFrame start"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->bNeedUpdateRec:Z

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/TextureRender;->adjustImageScaling2()V

    .line 12
    .line 13
    .line 14
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->bNeedUpdateRec:Z

    .line 15
    .line 16
    const-string p1, "TextureRender"

    .line 17
    .line 18
    const-string v1, "@@@@@@@@@@  drawFrame NeedUpdateRec"

    .line 19
    .line 20
    invoke-static {p1, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    :cond_0
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenWidth:I

    .line 24
    .line 25
    iget v1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenHight:I

    .line 26
    .line 27
    invoke-static {v0, v0, p1, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 28
    .line 29
    .line 30
    const/high16 p1, 0x3f800000    # 1.0f

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-static {v1, v1, v1, p1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 34
    .line 35
    .line 36
    const/16 p1, 0x4100

    .line 37
    .line 38
    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    .line 39
    .line 40
    .line 41
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mProgram:I

    .line 42
    .line 43
    invoke-static {p1}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 44
    .line 45
    .line 46
    const-string p1, "glUseProgram"

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const p1, 0x84c0

    .line 52
    .line 53
    .line 54
    invoke-static {p1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 55
    .line 56
    .line 57
    const p1, 0x8d65

    .line 58
    .line 59
    .line 60
    iget v1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mTextureID:I

    .line 61
    .line 62
    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mTarget_coords:Ljava/nio/FloatBuffer;

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 68
    .line 69
    .line 70
    iget v1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->maPositionHandle:I

    .line 71
    .line 72
    const/16 v5, 0x8

    .line 73
    .line 74
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mTarget_coords:Ljava/nio/FloatBuffer;

    .line 75
    .line 76
    const/4 v2, 0x2

    .line 77
    const/16 v3, 0x1406

    .line 78
    .line 79
    const/4 v4, 0x0

    .line 80
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 81
    .line 82
    .line 83
    const-string p1, "glVertexAttribPointer maPosition"

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->maPositionHandle:I

    .line 89
    .line 90
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 91
    .line 92
    .line 93
    const-string p1, "glEnableVertexAttribArray maPositionHandle"

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSource_coords:Ljava/nio/FloatBuffer;

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 101
    .line 102
    .line 103
    iget v1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->maTextureHandle:I

    .line 104
    .line 105
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSource_coords:Ljava/nio/FloatBuffer;

    .line 106
    .line 107
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 108
    .line 109
    .line 110
    const-string p1, "glVertexAttribPointer maTextureHandle"

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->maTextureHandle:I

    .line 116
    .line 117
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 118
    .line 119
    .line 120
    const-string p1, "glEnableVertexAttribArray maTextureHandle"

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    const/4 p1, 0x5

    .line 126
    const/4 v1, 0x4

    .line 127
    invoke-static {p1, v0, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 128
    .line 129
    .line 130
    const-string p1, "glDrawArrays"

    .line 131
    .line 132
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->maPositionHandle:I

    .line 136
    .line 137
    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 138
    .line 139
    .line 140
    iget p0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->maTextureHandle:I

    .line 141
    .line 142
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 143
    .line 144
    .line 145
    const/16 p0, 0xde1

    .line 146
    .line 147
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public genTex()V
    .locals 3

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
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mTextureID:I

    .line 11
    .line 12
    const v1, 0x8d65

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 16
    .line 17
    .line 18
    const-string v0, "glBindTexture mTextureID"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0x2801

    .line 24
    .line 25
    const v2, 0x46180400    # 9729.0f

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 29
    .line 30
    .line 31
    const/16 v0, 0x2800

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 34
    .line 35
    .line 36
    const/16 v0, 0x2802

    .line 37
    .line 38
    const v2, 0x812f

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 42
    .line 43
    .line 44
    const/16 v0, 0x2803

    .line 45
    .line 46
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 47
    .line 48
    .line 49
    const-string v0, "glTexParameter"

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public getTextureId()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mTextureID:I

    .line 2
    .line 3
    return p0
.end method

.method public surfaceCreated()V
    .locals 4

    .line 1
    const-string v0, "uniform mat4 uSTMatrix;\nattribute vec4 aPosition;\nattribute vec2 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n  gl_Position = aPosition;\n  vTextureCoord = aTextureCoord;\n}\n"

    .line 2
    .line 3
    const-string v1, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n  gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/TextureRender;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mProgram:I

    .line 10
    .line 11
    const-string v1, "TextureRender"

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const-string v0, "failed creating program"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 22
    .line 23
    invoke-virtual {p0, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string v3, "aPosition"

    .line 28
    .line 29
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->maPositionHandle:I

    .line 34
    .line 35
    const-string v0, "glGetAttribLocation aPosition"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->maPositionHandle:I

    .line 41
    .line 42
    if-ne v0, v2, :cond_1

    .line 43
    .line 44
    const-string v0, "Could not get attrib location for aPosition"

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 50
    .line 51
    invoke-virtual {p0, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mProgram:I

    .line 56
    .line 57
    const-string v3, "aTextureCoord"

    .line 58
    .line 59
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->maTextureHandle:I

    .line 64
    .line 65
    const-string v0, "glGetAttribLocation aTextureCoord"

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->maTextureHandle:I

    .line 71
    .line 72
    if-ne v0, v2, :cond_2

    .line 73
    .line 74
    const-string v0, "Could not get attrib location for aTextureCoord"

    .line 75
    .line 76
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 80
    .line 81
    invoke-virtual {p0, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_2
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/TextureRender;->genTex()V

    .line 86
    .line 87
    .line 88
    const-string p0, "surfaceCreated: "

    .line 89
    .line 90
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public updateRec(FFFF)V
    .locals 2

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_l:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_t:F

    .line 8
    .line 9
    cmpl-float v0, v0, p2

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_r:F

    .line 14
    .line 15
    add-float v1, p1, p3

    .line 16
    .line 17
    cmpl-float v0, v0, v1

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_b:F

    .line 22
    .line 23
    add-float v1, p2, p4

    .line 24
    .line 25
    cmpl-float v0, v0, v1

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    :goto_0
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_l:F

    .line 32
    .line 33
    iput p2, p0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_t:F

    .line 34
    .line 35
    add-float v0, p1, p3

    .line 36
    .line 37
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_r:F

    .line 38
    .line 39
    add-float v0, p2, p4

    .line 40
    .line 41
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->cut_b:F

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->bNeedUpdateRec:Z

    .line 45
    .line 46
    new-instance p0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v0, "@@@@@@@@@@  updateRec:"

    .line 49
    .line 50
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p1, ":"

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p1, "TextureRender"

    .line 81
    .line 82
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public updateRec(IIII)V
    .locals 1

    add-int/lit8 p1, p1, 0x1

    and-int/lit8 p1, p1, -0x3

    add-int/lit8 p3, p3, 0x1

    and-int/lit8 p3, p3, -0x3

    .line 86
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageWidth:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageHeight:I

    if-ne p2, v0, :cond_0

    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenWidth:I

    if-ne p3, v0, :cond_0

    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenHight:I

    if-ne p4, v0, :cond_0

    goto :goto_0

    .line 87
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageWidth:I

    .line 88
    iput p2, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageHeight:I

    .line 89
    iput p3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenWidth:I

    iput p3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mOutputWidth:I

    .line 90
    iput p4, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenHight:I

    iput p4, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mOutputHeight:I

    if-eqz p3, :cond_1

    if-nez p4, :cond_2

    .line 91
    :cond_1
    iput p3, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenWidth:I

    .line 92
    iput p2, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenHight:I

    .line 93
    :cond_2
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenWidth:I

    const/16 p2, 0x20

    if-le p1, p2, :cond_4

    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenHight:I

    if-gt p1, p2, :cond_3

    goto :goto_1

    :cond_3
    :goto_0
    return-void

    :cond_4
    :goto_1
    const/16 p1, 0x160

    .line 94
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenWidth:I

    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageWidth:I

    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mOutputWidth:I

    const/16 p1, 0x280

    .line 95
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mScreenHight:I

    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mImageHeight:I

    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRender;->mOutputHeight:I

    return-void
.end method
