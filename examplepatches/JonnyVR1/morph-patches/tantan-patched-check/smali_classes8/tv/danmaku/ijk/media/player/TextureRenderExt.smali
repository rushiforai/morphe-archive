.class Ltv/danmaku/ijk/media/player/TextureRenderExt;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final CUBE:[F

.field private static final FLOAT_SIZE_BYTES:I = 0x4

.field private static final FRAGMENT_SHADER:Ljava/lang/String; = "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nuniform float displayPos; \nuniform float heightInv; \nuniform float widthInv; \nuniform int width; \nuniform int halfShow;\nuniform int deblurEnabled;\nuniform float weight; \nuniform float threshold;\nuniform float saturation;\nvec3 luminanceWeighting=vec3(0.2125,0.7154,0.0721);\nvoid main() {\n  vec4 imageC = texture2D(sTexture, vTextureCoord);\n  vec4 imageH = imageC-\n            (texture2D(sTexture, clamp(vTextureCoord+vec2(-widthInv,-heightInv),0.0,1.0))*0.08\n            +texture2D(sTexture, clamp(vTextureCoord+vec2(      0.0,-heightInv),0.0,1.0))*0.12\n            +texture2D(sTexture, clamp(vTextureCoord+vec2( widthInv,-heightInv),0.0,1.0))*0.08\n            +texture2D(sTexture, clamp(vTextureCoord+vec2(-widthInv,       0.0),0.0,1.0))*0.12\n            +texture2D(sTexture, clamp(vTextureCoord+vec2( widthInv,       0.0),0.0,1.0))*0.12\n            +texture2D(sTexture, clamp(vTextureCoord+vec2(-widthInv, heightInv),0.0,1.0))*0.08\n            +texture2D(sTexture, clamp(vTextureCoord+vec2(      0.0, heightInv),0.0,1.0))*0.12\n            +texture2D(sTexture, clamp(vTextureCoord+vec2( widthInv, heightInv),0.0,1.0))*0.08\n            +imageC*0.2);\n  vec4 imageM = imageC;\n  vec4 diff = abs(imageH);\n  if (diff.r>threshold || diff.g>threshold || diff.b>threshold) imageM=clamp(imageC+imageH*weight,0.0,1.0);\n  float luminance = dot(imageM.rgb,luminanceWeighting);\n  vec3 greyScaleColor = vec3(luminance);\n  vec4 imageS=vec4(mix(greyScaleColor,imageM.rgb,saturation), imageM.w);\n  vec4 image = imageC;\n  if (deblurEnabled == 1 && (((vTextureCoord.x < displayPos) && halfShow==1) || halfShow==0)) {\n    image = imageS;\n   }\n  if ((abs(vTextureCoord.x-displayPos)<=(widthInv*1.0))&&deblurEnabled==1 && halfShow==1) {gl_FragColor=vec4(0.5,0.5,0.5,1.0);}else {gl_FragColor=image;}\n}\n"

.field private static final TAG:Ljava/lang/String; = "TextureRender"

.field private static final VERTEX_SHADER:Ljava/lang/String; = "uniform mat4 uSTMatrix;\nattribute vec4 aPosition;\nattribute vec2 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n  gl_Position = aPosition;\n  vTextureCoord = aTextureCoord;\n}\n"

.field private static final weightAmp:F = 3.0f


# instance fields
.field private mDeblurEnabled:Z

.field private mDeblurRadius:I

.field private mDeblurThreshold:F

.field private mDeblurWeight:F

.field private mDisplayPos:I

.field private mDisplayPosIncreasing:Z

.field private mEnabledLocation:I

.field private mFlipHorizontal:Z

.field private mFlipVertical:Z

.field private mHalfShow:I

.field private mHalfShowLocation:I

.field private mImageDisplayLocation:I

.field private mImageHeight:I

.field private mImageHeightStepLocation:I

.field private mImageSaturationLocation:I

.field private mImageThresholdLocation:I

.field private mImageWeightLocation:I

.field private mImageWidth:I

.field private mImageWidthStepLocation:I

.field private mImageWidthocation:I

.field private mOutputHeight:I

.field private mOutputWidth:I

.field private mProgram:I

.field private mRotation:Lcom/immomo/baseutil/Rotation;

.field private mSaturation:F

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
    sput-object v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->CUBE:[F

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
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSource_coordsDate:[F

    .line 12
    .line 13
    new-array v0, v0, [F

    .line 14
    .line 15
    fill-array-data v0, :array_1

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mTarget_coordsDate:[F

    .line 19
    .line 20
    sget-object v2, Lcom/immomo/baseutil/Rotation;->NORMAL:Lcom/immomo/baseutil/Rotation;

    .line 21
    .line 22
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mRotation:Lcom/immomo/baseutil/Rotation;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mFlipHorizontal:Z

    .line 26
    .line 27
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mFlipVertical:Z

    .line 28
    .line 29
    const/16 v3, -0x3039

    .line 30
    .line 31
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mTextureID:I

    .line 32
    .line 33
    const/16 v3, 0x280

    .line 34
    .line 35
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWidth:I

    .line 36
    .line 37
    const/16 v3, 0x160

    .line 38
    .line 39
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageHeight:I

    .line 40
    .line 41
    const/16 v3, 0x3c0

    .line 42
    .line 43
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mScreenWidth:I

    .line 44
    .line 45
    const/16 v3, 0x21b

    .line 46
    .line 47
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mScreenHight:I

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 51
    .line 52
    const/4 v3, 0x1

    .line 53
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDisplayPos:I

    .line 54
    .line 55
    iput-boolean v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDisplayPosIncreasing:Z

    .line 56
    .line 57
    const v4, 0x3ee66666    # 0.45f

    .line 58
    .line 59
    .line 60
    iput v4, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDeblurWeight:F

    .line 61
    .line 62
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDeblurRadius:I

    .line 63
    .line 64
    const v3, 0x3c449ba6    # 0.012f

    .line 65
    .line 66
    .line 67
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDeblurThreshold:F

    .line 68
    .line 69
    const/high16 v3, 0x3f800000    # 1.0f

    .line 70
    .line 71
    iput v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSaturation:F

    .line 72
    .line 73
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDeblurEnabled:Z

    .line 74
    .line 75
    iput v2, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mHalfShow:I

    .line 76
    .line 77
    array-length v3, v1

    .line 78
    mul-int/lit8 v3, v3, 0x4

    .line 79
    .line 80
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSource_coords:Ljava/nio/FloatBuffer;

    .line 97
    .line 98
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 103
    .line 104
    .line 105
    array-length v1, v0

    .line 106
    mul-int/lit8 v1, v1, 0x4

    .line 107
    .line 108
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mTarget_coords:Ljava/nio/FloatBuffer;

    .line 125
    .line 126
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 131
    .line 132
    .line 133
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 134
    .line 135
    return-void

    .line 136
    nop

    .line 137
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
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
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

.method private createProgram(Ljava/lang/String;Ljava/lang/String;)I
    .locals 5

    .line 1
    const v0, 0x8b31

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, v0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->loadShader(ILjava/lang/String;)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 v0, -0x1

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 15
    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    const v2, 0x8b30

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, v2, p2}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->loadShader(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-nez p2, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 30
    .line 31
    .line 32
    return v1

    .line 33
    :cond_1
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const-string v3, "glCreateProgram"

    .line 38
    .line 39
    invoke-virtual {p0, v3}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const-string v3, "TextureRender"

    .line 43
    .line 44
    if-nez v2, :cond_2

    .line 45
    .line 46
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 47
    .line 48
    invoke-virtual {v4, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 49
    .line 50
    .line 51
    const-string v4, "Could not create program"

    .line 52
    .line 53
    invoke-static {v3, v4}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    :cond_2
    invoke-static {v2, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 57
    .line 58
    .line 59
    const-string p1, "glAttachShader"

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v2, p2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v2}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 71
    .line 72
    .line 73
    const/4 p1, 0x1

    .line 74
    new-array p2, p1, [I

    .line 75
    .line 76
    const v4, 0x8b82

    .line 77
    .line 78
    .line 79
    invoke-static {v2, v4, p2, v1}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 80
    .line 81
    .line 82
    aget p2, p2, v1

    .line 83
    .line 84
    if-eq p2, p1, :cond_3

    .line 85
    .line 86
    const-string p1, "Could not link program: "

    .line 87
    .line 88
    invoke-static {v3, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    invoke-static {v2}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {v3, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    invoke-static {v2}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 104
    .line 105
    .line 106
    return v1

    .line 107
    :cond_3
    return v2
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
    invoke-virtual {p0, v1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

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
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

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
    iget v1, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mOutputWidth:I

    .line 4
    .line 5
    int-to-float v2, v1

    .line 6
    iget v3, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mOutputHeight:I

    .line 7
    .line 8
    int-to-float v4, v3

    .line 9
    iget-object v5, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mRotation:Lcom/immomo/baseutil/Rotation;

    .line 10
    .line 11
    sget-object v6, Lcom/immomo/baseutil/Rotation;->ROTATION_270:Lcom/immomo/baseutil/Rotation;

    .line 12
    .line 13
    if-eq v5, v6, :cond_0

    .line 14
    .line 15
    sget-object v6, Lcom/immomo/baseutil/Rotation;->ROTATION_90:Lcom/immomo/baseutil/Rotation;

    .line 16
    .line 17
    if-ne v5, v6, :cond_1

    .line 18
    .line 19
    :cond_0
    int-to-float v2, v3

    .line 20
    int-to-float v4, v1

    .line 21
    :cond_1
    iget v1, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWidth:I

    .line 22
    .line 23
    int-to-float v1, v1

    .line 24
    div-float v1, v2, v1

    .line 25
    .line 26
    iget v3, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageHeight:I

    .line 27
    .line 28
    int-to-float v3, v3

    .line 29
    div-float v3, v4, v3

    .line 30
    .line 31
    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget v3, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWidth:I

    .line 36
    .line 37
    int-to-float v3, v3

    .line 38
    mul-float/2addr v3, v1

    .line 39
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    iget v5, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageHeight:I

    .line 44
    .line 45
    int-to-float v5, v5

    .line 46
    mul-float/2addr v5, v1

    .line 47
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    int-to-float v3, v3

    .line 52
    div-float/2addr v3, v2

    .line 53
    int-to-float v1, v1

    .line 54
    div-float/2addr v1, v4

    .line 55
    sget-object v2, Ltv/danmaku/ijk/media/player/TextureRenderExt;->CUBE:[F

    .line 56
    .line 57
    iget-object v4, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mRotation:Lcom/immomo/baseutil/Rotation;

    .line 58
    .line 59
    iget-boolean v5, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mFlipHorizontal:Z

    .line 60
    .line 61
    iget-boolean v6, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mFlipVertical:Z

    .line 62
    .line 63
    invoke-static {v4, v5, v6}, Ll/wti0;->b(Lcom/immomo/baseutil/Rotation;ZZ)[F

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    const/high16 v5, 0x3f800000    # 1.0f

    .line 68
    .line 69
    div-float v3, v5, v3

    .line 70
    .line 71
    sub-float v3, v5, v3

    .line 72
    .line 73
    const/high16 v6, 0x40000000    # 2.0f

    .line 74
    .line 75
    div-float/2addr v3, v6

    .line 76
    div-float v1, v5, v1

    .line 77
    .line 78
    sub-float/2addr v5, v1

    .line 79
    div-float/2addr v5, v6

    .line 80
    const/4 v1, 0x0

    .line 81
    aget v6, v4, v1

    .line 82
    .line 83
    invoke-direct {v0, v6, v3}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->addDistance(FF)F

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    const/4 v7, 0x1

    .line 88
    aget v8, v4, v7

    .line 89
    .line 90
    invoke-direct {v0, v8, v5}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->addDistance(FF)F

    .line 91
    .line 92
    .line 93
    move-result v8

    .line 94
    const/4 v9, 0x2

    .line 95
    aget v10, v4, v9

    .line 96
    .line 97
    invoke-direct {v0, v10, v3}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->addDistance(FF)F

    .line 98
    .line 99
    .line 100
    move-result v10

    .line 101
    const/4 v11, 0x3

    .line 102
    aget v12, v4, v11

    .line 103
    .line 104
    invoke-direct {v0, v12, v5}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->addDistance(FF)F

    .line 105
    .line 106
    .line 107
    move-result v12

    .line 108
    const/4 v13, 0x4

    .line 109
    aget v14, v4, v13

    .line 110
    .line 111
    invoke-direct {v0, v14, v3}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->addDistance(FF)F

    .line 112
    .line 113
    .line 114
    move-result v14

    .line 115
    const/4 v15, 0x5

    .line 116
    move/from16 v16, v7

    .line 117
    .line 118
    aget v7, v4, v15

    .line 119
    .line 120
    invoke-direct {v0, v7, v5}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->addDistance(FF)F

    .line 121
    .line 122
    .line 123
    move-result v7

    .line 124
    const/16 v17, 0x6

    .line 125
    .line 126
    move/from16 v18, v9

    .line 127
    .line 128
    aget v9, v4, v17

    .line 129
    .line 130
    invoke-direct {v0, v9, v3}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->addDistance(FF)F

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    const/4 v9, 0x7

    .line 135
    aget v4, v4, v9

    .line 136
    .line 137
    invoke-direct {v0, v4, v5}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->addDistance(FF)F

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    const/16 v5, 0x8

    .line 142
    .line 143
    new-array v5, v5, [F

    .line 144
    .line 145
    aput v6, v5, v1

    .line 146
    .line 147
    aput v8, v5, v16

    .line 148
    .line 149
    aput v10, v5, v18

    .line 150
    .line 151
    aput v12, v5, v11

    .line 152
    .line 153
    aput v14, v5, v13

    .line 154
    .line 155
    aput v7, v5, v15

    .line 156
    .line 157
    aput v3, v5, v17

    .line 158
    .line 159
    aput v4, v5, v9

    .line 160
    .line 161
    iget-object v3, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mTarget_coords:Ljava/nio/FloatBuffer;

    .line 162
    .line 163
    invoke-virtual {v3}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 164
    .line 165
    .line 166
    iget-object v3, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mTarget_coords:Ljava/nio/FloatBuffer;

    .line 167
    .line 168
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {v2, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 173
    .line 174
    .line 175
    iget-object v2, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSource_coords:Ljava/nio/FloatBuffer;

    .line 176
    .line 177
    invoke-virtual {v2}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 178
    .line 179
    .line 180
    iget-object v0, v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSource_coords:Ljava/nio/FloatBuffer;

    .line 181
    .line 182
    invoke-virtual {v0, v5}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 187
    .line 188
    .line 189
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
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

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

.method public drawFrame(Landroid/graphics/SurfaceTexture;)V
    .locals 10

    .line 1
    const-string p1, "onDrawFrame start"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-static {p1, p1, p1, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 10
    .line 11
    .line 12
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mProgram:I

    .line 13
    .line 14
    invoke-static {p1}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 15
    .line 16
    .line 17
    const-string p1, "glUseProgram"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-boolean p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDisplayPosIncreasing:Z

    .line 23
    .line 24
    iget v1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDisplayPos:I

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    add-int/2addr v1, v2

    .line 30
    iput v1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDisplayPos:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sub-int/2addr v1, v2

    .line 34
    iput v1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDisplayPos:I

    .line 35
    .line 36
    :goto_0
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDisplayPos:I

    .line 37
    .line 38
    iget v1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWidth:I

    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    if-lt p1, v1, :cond_1

    .line 42
    .line 43
    iput-boolean v3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDisplayPosIncreasing:Z

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    if-gtz p1, :cond_2

    .line 47
    .line 48
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDisplayPosIncreasing:Z

    .line 49
    .line 50
    :cond_2
    :goto_1
    int-to-float p1, v1

    .line 51
    div-float p1, v0, p1

    .line 52
    .line 53
    iget v1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageHeight:I

    .line 54
    .line 55
    int-to-float v1, v1

    .line 56
    div-float v1, v0, v1

    .line 57
    .line 58
    iget v2, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWidthStepLocation:I

    .line 59
    .line 60
    invoke-static {v2, p1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 61
    .line 62
    .line 63
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageHeightStepLocation:I

    .line 64
    .line 65
    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 66
    .line 67
    .line 68
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageDisplayLocation:I

    .line 69
    .line 70
    iget v1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDisplayPos:I

    .line 71
    .line 72
    int-to-float v1, v1

    .line 73
    mul-float/2addr v1, v0

    .line 74
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWidth:I

    .line 75
    .line 76
    int-to-float v0, v0

    .line 77
    div-float/2addr v1, v0

    .line 78
    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 79
    .line 80
    .line 81
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWidthocation:I

    .line 82
    .line 83
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWidth:I

    .line 84
    .line 85
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 86
    .line 87
    .line 88
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWeightLocation:I

    .line 89
    .line 90
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDeblurWeight:F

    .line 91
    .line 92
    const/high16 v1, 0x40400000    # 3.0f

    .line 93
    .line 94
    mul-float/2addr v0, v1

    .line 95
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 96
    .line 97
    .line 98
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mHalfShowLocation:I

    .line 99
    .line 100
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mHalfShow:I

    .line 101
    .line 102
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 103
    .line 104
    .line 105
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mEnabledLocation:I

    .line 106
    .line 107
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDeblurEnabled:Z

    .line 108
    .line 109
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 110
    .line 111
    .line 112
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageSaturationLocation:I

    .line 113
    .line 114
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSaturation:F

    .line 115
    .line 116
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 117
    .line 118
    .line 119
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageThresholdLocation:I

    .line 120
    .line 121
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDeblurThreshold:F

    .line 122
    .line 123
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 124
    .line 125
    .line 126
    const p1, 0x84c0

    .line 127
    .line 128
    .line 129
    invoke-static {p1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 130
    .line 131
    .line 132
    const p1, 0x8d65

    .line 133
    .line 134
    .line 135
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mTextureID:I

    .line 136
    .line 137
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mTarget_coords:Ljava/nio/FloatBuffer;

    .line 141
    .line 142
    invoke-virtual {p1, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 143
    .line 144
    .line 145
    iget v4, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->maPositionHandle:I

    .line 146
    .line 147
    const/16 v8, 0x8

    .line 148
    .line 149
    iget-object v9, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mTarget_coords:Ljava/nio/FloatBuffer;

    .line 150
    .line 151
    const/4 v5, 0x2

    .line 152
    const/16 v6, 0x1406

    .line 153
    .line 154
    const/4 v7, 0x0

    .line 155
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 156
    .line 157
    .line 158
    const-string p1, "glVertexAttribPointer maPosition"

    .line 159
    .line 160
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->maPositionHandle:I

    .line 164
    .line 165
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 166
    .line 167
    .line 168
    const-string p1, "glEnableVertexAttribArray maPositionHandle"

    .line 169
    .line 170
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSource_coords:Ljava/nio/FloatBuffer;

    .line 174
    .line 175
    invoke-virtual {p1, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 176
    .line 177
    .line 178
    iget v4, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->maTextureHandle:I

    .line 179
    .line 180
    iget-object v9, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSource_coords:Ljava/nio/FloatBuffer;

    .line 181
    .line 182
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 183
    .line 184
    .line 185
    const-string p1, "glVertexAttribPointer maTextureHandle"

    .line 186
    .line 187
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->maTextureHandle:I

    .line 191
    .line 192
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 193
    .line 194
    .line 195
    const-string p1, "glEnableVertexAttribArray maTextureHandle"

    .line 196
    .line 197
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    const/4 p1, 0x5

    .line 201
    const/4 v0, 0x4

    .line 202
    invoke-static {p1, v3, v0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 203
    .line 204
    .line 205
    const-string p1, "glDrawArrays"

    .line 206
    .line 207
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 211
    .line 212
    .line 213
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
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mTextureID:I

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
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

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
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public getTextureId()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mTextureID:I

    .line 2
    .line 3
    return p0
.end method

.method public setDeblurEnabled(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setDeblurEnabled:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDeblurEnabled:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "--->"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "TextureRender"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDeblurEnabled:Z

    .line 31
    .line 32
    return-void
.end method

.method public setDeblurWeight(F)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setDeblurWeight:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDeblurWeight:F

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "--->"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "TextureRender"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mDeblurWeight:F

    .line 31
    .line 32
    return-void
.end method

.method public setSaturation(F)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setSaturation:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSaturation:F

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "--->"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "TextureRender"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSaturation:F

    .line 31
    .line 32
    return-void
.end method

.method public surfaceCreated()V
    .locals 4

    .line 1
    const-string v0, "uniform mat4 uSTMatrix;\nattribute vec4 aPosition;\nattribute vec2 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n  gl_Position = aPosition;\n  vTextureCoord = aTextureCoord;\n}\n"

    .line 2
    .line 3
    const-string v1, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nuniform float displayPos; \nuniform float heightInv; \nuniform float widthInv; \nuniform int width; \nuniform int halfShow;\nuniform int deblurEnabled;\nuniform float weight; \nuniform float threshold;\nuniform float saturation;\nvec3 luminanceWeighting=vec3(0.2125,0.7154,0.0721);\nvoid main() {\n  vec4 imageC = texture2D(sTexture, vTextureCoord);\n  vec4 imageH = imageC-\n            (texture2D(sTexture, clamp(vTextureCoord+vec2(-widthInv,-heightInv),0.0,1.0))*0.08\n            +texture2D(sTexture, clamp(vTextureCoord+vec2(      0.0,-heightInv),0.0,1.0))*0.12\n            +texture2D(sTexture, clamp(vTextureCoord+vec2( widthInv,-heightInv),0.0,1.0))*0.08\n            +texture2D(sTexture, clamp(vTextureCoord+vec2(-widthInv,       0.0),0.0,1.0))*0.12\n            +texture2D(sTexture, clamp(vTextureCoord+vec2( widthInv,       0.0),0.0,1.0))*0.12\n            +texture2D(sTexture, clamp(vTextureCoord+vec2(-widthInv, heightInv),0.0,1.0))*0.08\n            +texture2D(sTexture, clamp(vTextureCoord+vec2(      0.0, heightInv),0.0,1.0))*0.12\n            +texture2D(sTexture, clamp(vTextureCoord+vec2( widthInv, heightInv),0.0,1.0))*0.08\n            +imageC*0.2);\n  vec4 imageM = imageC;\n  vec4 diff = abs(imageH);\n  if (diff.r>threshold || diff.g>threshold || diff.b>threshold) imageM=clamp(imageC+imageH*weight,0.0,1.0);\n  float luminance = dot(imageM.rgb,luminanceWeighting);\n  vec3 greyScaleColor = vec3(luminance);\n  vec4 imageS=vec4(mix(greyScaleColor,imageM.rgb,saturation), imageM.w);\n  vec4 image = imageC;\n  if (deblurEnabled == 1 && (((vTextureCoord.x < displayPos) && halfShow==1) || halfShow==0)) {\n    image = imageS;\n   }\n  if ((abs(vTextureCoord.x-displayPos)<=(widthInv*1.0))&&deblurEnabled==1 && halfShow==1) {gl_FragColor=vec4(0.5,0.5,0.5,1.0);}else {gl_FragColor=image;}\n}\n"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mProgram:I

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
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

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
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->maPositionHandle:I

    .line 34
    .line 35
    const-string v0, "glGetAttribLocation aPosition"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->maPositionHandle:I

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
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 50
    .line 51
    invoke-virtual {p0, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mProgram:I

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
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->maTextureHandle:I

    .line 64
    .line 65
    const-string v0, "glGetAttribLocation aTextureCoord"

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->maTextureHandle:I

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
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mSurfce:Ltv/danmaku/ijk/media/player/fakeSurface;

    .line 80
    .line 81
    invoke-virtual {p0, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_2
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->genTex()V

    .line 86
    .line 87
    .line 88
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mProgram:I

    .line 89
    .line 90
    const-string v1, "widthInv"

    .line 91
    .line 92
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWidthStepLocation:I

    .line 97
    .line 98
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mProgram:I

    .line 99
    .line 100
    const-string v1, "HeightInv"

    .line 101
    .line 102
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageHeightStepLocation:I

    .line 107
    .line 108
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mProgram:I

    .line 109
    .line 110
    const-string v1, "displayPos"

    .line 111
    .line 112
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageDisplayLocation:I

    .line 117
    .line 118
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mProgram:I

    .line 119
    .line 120
    const-string v1, "width"

    .line 121
    .line 122
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWidthocation:I

    .line 127
    .line 128
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mProgram:I

    .line 129
    .line 130
    const-string v1, "weight"

    .line 131
    .line 132
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWeightLocation:I

    .line 137
    .line 138
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mProgram:I

    .line 139
    .line 140
    const-string v1, "halfShow"

    .line 141
    .line 142
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mHalfShowLocation:I

    .line 147
    .line 148
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mProgram:I

    .line 149
    .line 150
    const-string v1, "deblurEnabled"

    .line 151
    .line 152
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mEnabledLocation:I

    .line 157
    .line 158
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mProgram:I

    .line 159
    .line 160
    const-string v1, "saturation"

    .line 161
    .line 162
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageSaturationLocation:I

    .line 167
    .line 168
    iget v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mProgram:I

    .line 169
    .line 170
    const-string v1, "threshold"

    .line 171
    .line 172
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    iput v0, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageThresholdLocation:I

    .line 177
    .line 178
    return-void
.end method

.method public updateRec(IIII)V
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    div-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    mul-int/lit8 p1, p1, 0x2

    .line 6
    .line 7
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWidth:I

    .line 8
    .line 9
    iput p2, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageHeight:I

    .line 10
    .line 11
    add-int/lit8 p3, p3, 0x1

    .line 12
    .line 13
    div-int/lit8 p3, p3, 0x2

    .line 14
    .line 15
    mul-int/lit8 p3, p3, 0x2

    .line 16
    .line 17
    iput p3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mScreenWidth:I

    .line 18
    .line 19
    iput p3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mOutputWidth:I

    .line 20
    .line 21
    iput p4, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mScreenHight:I

    .line 22
    .line 23
    iput p4, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mOutputHeight:I

    .line 24
    .line 25
    if-eqz p3, :cond_0

    .line 26
    .line 27
    if-nez p4, :cond_1

    .line 28
    .line 29
    :cond_0
    iput p3, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mScreenWidth:I

    .line 30
    .line 31
    iput p2, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mScreenHight:I

    .line 32
    .line 33
    :cond_1
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mScreenWidth:I

    .line 34
    .line 35
    const/16 p2, 0x20

    .line 36
    .line 37
    if-le p1, p2, :cond_2

    .line 38
    .line 39
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mScreenHight:I

    .line 40
    .line 41
    if-gt p1, p2, :cond_3

    .line 42
    .line 43
    :cond_2
    const/16 p1, 0x160

    .line 44
    .line 45
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mScreenWidth:I

    .line 46
    .line 47
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageWidth:I

    .line 48
    .line 49
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mOutputWidth:I

    .line 50
    .line 51
    const/16 p1, 0x280

    .line 52
    .line 53
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mScreenHight:I

    .line 54
    .line 55
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mImageHeight:I

    .line 56
    .line 57
    iput p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mOutputHeight:I

    .line 58
    .line 59
    :cond_3
    iget p1, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mScreenWidth:I

    .line 60
    .line 61
    iget p2, p0, Ltv/danmaku/ijk/media/player/TextureRenderExt;->mScreenHight:I

    .line 62
    .line 63
    const/4 p3, 0x0

    .line 64
    invoke-static {p3, p3, p1, p2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->adjustImageScaling()V

    .line 68
    .line 69
    .line 70
    return-void
.end method
