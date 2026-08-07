.class public Lio/agora/base/internal/video/YuvConverter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;
    }
.end annotation


# static fields
.field private static final ANDROID_MATRIX_LENGTH:I = 0x9

.field private static final DEBUG:Z = false

.field private static final FRAGMENT_SHADER:Ljava/lang/String; = "uniform vec2 xUnit;\nuniform vec4 coeffs;\n\nvoid main() {\n  gl_FragColor.r = coeffs.a + dot(coeffs.rgb,\n      sample(tc - 1.5 * xUnit).rgb);\n  gl_FragColor.g = coeffs.a + dot(coeffs.rgb,\n      sample(tc - 0.5 * xUnit).rgb);\n  gl_FragColor.b = coeffs.a + dot(coeffs.rgb,\n      sample(tc + 0.5 * xUnit).rgb);\n  gl_FragColor.a = coeffs.a + dot(coeffs.rgb,\n      sample(tc + 1.5 * xUnit).rgb);\n}\n"

.field private static final TAG:Ljava/lang/String; = "YuvConverter"

.field private static enableConvertPerLog:Z = false

.field private static enableHardwareBuffer:Z = false

.field private static enablePboOpt:Z = true

.field private static enableReportYuvConvertStats:Z

.field private static final mIsNeedForceResetPbo:Ljava/util/concurrent/atomic/AtomicBoolean;


# instance fields
.field private final convertStatsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/agora/base/internal/video/YuvConverterStats;",
            ">;"
        }
    .end annotation
.end field

.field private convertTimeCounter:J

.field private convertTimeInNS:J

.field private final drawer:Lio/agora/base/internal/video/GlGenericDrawer;

.field private final drawer10bit:Lio/agora/base/internal/video/GlRectDrawer;

.field private formerTextureMatrix:Landroid/graphics/Matrix;

.field private final gpupboUtil:Lio/agora/base/internal/video/GPUPBOUtil;

.field private final hardwareBufferHelper:Lio/agora/base/internal/video/HardwareBufferHelper;

.field private final i010TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

.field private final i420TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

.field private maxTextureSize:I

.field private final shaderCallbacks:Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;

.field private final threadChecker:Lio/agora/base/internal/ThreadUtils$ThreadChecker;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lio/agora/base/internal/video/YuvConverter;->mIsNeedForceResetPbo:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 8
    .line 9
    sput-boolean v1, Lio/agora/base/internal/video/YuvConverter;->enableConvertPerLog:Z

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    sput-boolean v0, Lio/agora/base/internal/video/YuvConverter;->enableReportYuvConvertStats:Z

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    .line 5
    .line 6
    invoke-direct {v0}, Lio/agora/base/internal/ThreadUtils$ThreadChecker;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lio/agora/base/internal/video/YuvConverter;->threadChecker:Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    .line 10
    .line 11
    new-instance v1, Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 12
    .line 13
    const/16 v2, 0x1908

    .line 14
    .line 15
    invoke-direct {v1, v2}, Lio/agora/base/internal/video/GlTextureFrameBuffer;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lio/agora/base/internal/video/YuvConverter;->i420TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 19
    .line 20
    new-instance v1, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-direct {v1, v2}, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;-><init>(Lio/agora/base/internal/video/YuvConverter$1;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lio/agora/base/internal/video/YuvConverter;->shaderCallbacks:Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;

    .line 27
    .line 28
    new-instance v2, Lio/agora/base/internal/video/GlGenericDrawer;

    .line 29
    .line 30
    const-string v3, "uniform vec2 xUnit;\nuniform vec4 coeffs;\n\nvoid main() {\n  gl_FragColor.r = coeffs.a + dot(coeffs.rgb,\n      sample(tc - 1.5 * xUnit).rgb);\n  gl_FragColor.g = coeffs.a + dot(coeffs.rgb,\n      sample(tc - 0.5 * xUnit).rgb);\n  gl_FragColor.b = coeffs.a + dot(coeffs.rgb,\n      sample(tc + 0.5 * xUnit).rgb);\n  gl_FragColor.a = coeffs.a + dot(coeffs.rgb,\n      sample(tc + 1.5 * xUnit).rgb);\n}\n"

    .line 31
    .line 32
    invoke-direct {v2, v3, v1}, Lio/agora/base/internal/video/GlGenericDrawer;-><init>(Ljava/lang/String;Lio/agora/base/internal/video/GlGenericDrawer$ShaderCallbacks;)V

    .line 33
    .line 34
    .line 35
    iput-object v2, p0, Lio/agora/base/internal/video/YuvConverter;->drawer:Lio/agora/base/internal/video/GlGenericDrawer;

    .line 36
    .line 37
    new-instance v1, Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 38
    .line 39
    const v2, 0x881a

    .line 40
    .line 41
    .line 42
    invoke-direct {v1, v2}, Lio/agora/base/internal/video/GlTextureFrameBuffer;-><init>(I)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lio/agora/base/internal/video/YuvConverter;->i010TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 46
    .line 47
    new-instance v1, Lio/agora/base/internal/video/GlRectDrawer;

    .line 48
    .line 49
    invoke-direct {v1}, Lio/agora/base/internal/video/GlRectDrawer;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Lio/agora/base/internal/video/YuvConverter;->drawer10bit:Lio/agora/base/internal/video/GlRectDrawer;

    .line 53
    .line 54
    new-instance v1, Lio/agora/base/internal/video/GPUPBOUtil;

    .line 55
    .line 56
    invoke-direct {v1}, Lio/agora/base/internal/video/GPUPBOUtil;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lio/agora/base/internal/video/YuvConverter;->gpupboUtil:Lio/agora/base/internal/video/GPUPBOUtil;

    .line 60
    .line 61
    new-instance v1, Landroid/graphics/Matrix;

    .line 62
    .line 63
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v1, p0, Lio/agora/base/internal/video/YuvConverter;->formerTextureMatrix:Landroid/graphics/Matrix;

    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    iput v1, p0, Lio/agora/base/internal/video/YuvConverter;->maxTextureSize:I

    .line 70
    .line 71
    const-wide/16 v1, 0x0

    .line 72
    .line 73
    iput-wide v1, p0, Lio/agora/base/internal/video/YuvConverter;->convertTimeInNS:J

    .line 74
    .line 75
    iput-wide v1, p0, Lio/agora/base/internal/video/YuvConverter;->convertTimeCounter:J

    .line 76
    .line 77
    new-instance v1, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Lio/agora/base/internal/video/YuvConverter;->convertStatsList:Ljava/util/List;

    .line 83
    .line 84
    new-instance v1, Lio/agora/base/internal/video/HardwareBufferHelper;

    .line 85
    .line 86
    invoke-direct {v1}, Lio/agora/base/internal/video/HardwareBufferHelper;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object v1, p0, Lio/agora/base/internal/video/YuvConverter;->hardwareBufferHelper:Lio/agora/base/internal/video/HardwareBufferHelper;

    .line 90
    .line 91
    invoke-virtual {v0}, Lio/agora/base/internal/ThreadUtils$ThreadChecker;->detachThread()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method private checkMaxTextureSize(II)Z
    .locals 4

    .line 1
    iget v0, p0, Lio/agora/base/internal/video/YuvConverter;->maxTextureSize:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-array v0, v1, [I

    .line 8
    .line 9
    const/16 v3, 0xd33

    .line 10
    .line 11
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 12
    .line 13
    .line 14
    const-string v3, "glGetIntegerv of max texture size error"

    .line 15
    .line 16
    invoke-static {v3}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    aget v0, v0, v2

    .line 20
    .line 21
    iput v0, p0, Lio/agora/base/internal/video/YuvConverter;->maxTextureSize:I

    .line 22
    .line 23
    :cond_0
    iget v0, p0, Lio/agora/base/internal/video/YuvConverter;->maxTextureSize:I

    .line 24
    .line 25
    if-lt v0, p1, :cond_1

    .line 26
    .line 27
    if-lt v0, p2, :cond_1

    .line 28
    .line 29
    return v2

    .line 30
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "reach max texture size width:"

    .line 33
    .line 34
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p1, ", height:"

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p1, ", maxTextureSize:"

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget p0, p0, Lio/agora/base/internal/video/YuvConverter;->maxTextureSize:I

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "YuvConverter"

    .line 63
    .line 64
    invoke-static {p1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return v1
.end method

.method public static clearPboBuffer()V
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    sget-object v0, Lio/agora/base/internal/video/YuvConverter;->mIsNeedForceResetPbo:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private convert10Texture(Lio/agora/base/VideoFrame$TextureBuffer;)Lio/agora/base/JavaI010Buffer;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lio/agora/base/internal/video/YuvConverter;->threadChecker:Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    .line 4
    .line 5
    invoke-virtual {v1}, Lio/agora/base/internal/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 6
    .line 7
    .line 8
    invoke-interface/range {p1 .. p1}, Lio/agora/base/VideoFrame$Buffer;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v6

    .line 12
    invoke-interface/range {p1 .. p1}, Lio/agora/base/VideoFrame$Buffer;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v7

    .line 16
    add-int/lit8 v1, v6, 0x7

    .line 17
    .line 18
    div-int/lit8 v1, v1, 0x8

    .line 19
    .line 20
    mul-int/lit8 v1, v1, 0x8

    .line 21
    .line 22
    add-int/lit8 v2, v7, 0x1

    .line 23
    .line 24
    div-int/lit8 v13, v2, 0x2

    .line 25
    .line 26
    add-int v14, v7, v13

    .line 27
    .line 28
    div-int/lit8 v10, v1, 0x4

    .line 29
    .line 30
    new-instance v5, Landroid/graphics/Matrix;

    .line 31
    .line 32
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 33
    .line 34
    .line 35
    const/high16 v2, 0x3f000000    # 0.5f

    .line 36
    .line 37
    invoke-virtual {v5, v2, v2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 38
    .line 39
    .line 40
    const/high16 v2, 0x3f800000    # 1.0f

    .line 41
    .line 42
    const/high16 v3, -0x40800000    # -1.0f

    .line 43
    .line 44
    invoke-virtual {v5, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 45
    .line 46
    .line 47
    const/high16 v2, -0x41000000    # -0.5f

    .line 48
    .line 49
    invoke-virtual {v5, v2, v2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 50
    .line 51
    .line 52
    invoke-direct {v0, v10, v14}, Lio/agora/base/internal/video/YuvConverter;->checkMaxTextureSize(II)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_0

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    return-object v0

    .line 60
    :cond_0
    iget-object v2, v0, Lio/agora/base/internal/video/YuvConverter;->i010TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 61
    .line 62
    invoke-virtual {v2, v10, v14}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->setSize(II)V

    .line 63
    .line 64
    .line 65
    new-instance v2, Lio/agora/base/internal/video/WrappedNativeColorSpace;

    .line 66
    .line 67
    sget-object v3, Lio/agora/base/VideoFrame$ColorSpace$Range;->Full:Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 68
    .line 69
    invoke-virtual {v3}, Lio/agora/base/VideoFrame$ColorSpace$Range;->getRange()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    sget-object v4, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->BT2020_CL:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 74
    .line 75
    invoke-virtual {v4}, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->getMatrix()I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    sget-object v8, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->BT2020_10:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 80
    .line 81
    invoke-virtual {v8}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->getTransfer()I

    .line 82
    .line 83
    .line 84
    move-result v8

    .line 85
    sget-object v9, Lio/agora/base/VideoFrame$ColorSpace$Primary;->kBT2020:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 86
    .line 87
    invoke-virtual {v9}, Lio/agora/base/VideoFrame$ColorSpace$Primary;->getPrimary()I

    .line 88
    .line 89
    .line 90
    move-result v9

    .line 91
    invoke-direct {v2, v3, v4, v8, v9}, Lio/agora/base/internal/video/WrappedNativeColorSpace;-><init>(IIII)V

    .line 92
    .line 93
    .line 94
    iget-object v3, v0, Lio/agora/base/internal/video/YuvConverter;->shaderCallbacks:Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;

    .line 95
    .line 96
    invoke-virtual {v3, v2}, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->setColorSpace(Lio/agora/base/VideoFrame$ColorSpace;)V

    .line 97
    .line 98
    .line 99
    iget-object v2, v0, Lio/agora/base/internal/video/YuvConverter;->i010TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 100
    .line 101
    invoke-virtual {v2}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->getFrameBufferId()I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    const v15, 0x8d40

    .line 106
    .line 107
    .line 108
    invoke-static {v15, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 109
    .line 110
    .line 111
    const-string v2, "glBindFramebuffer"

    .line 112
    .line 113
    invoke-static {v2}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iget-object v2, v0, Lio/agora/base/internal/video/YuvConverter;->shaderCallbacks:Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;

    .line 117
    .line 118
    invoke-virtual {v2}, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->setPlaneY()V

    .line 119
    .line 120
    .line 121
    iget-object v2, v0, Lio/agora/base/internal/video/YuvConverter;->drawer:Lio/agora/base/internal/video/GlGenericDrawer;

    .line 122
    .line 123
    const/4 v9, 0x0

    .line 124
    const/4 v12, 0x0

    .line 125
    const/4 v4, 0x0

    .line 126
    const/4 v8, 0x0

    .line 127
    move v11, v7

    .line 128
    move-object/from16 v3, p1

    .line 129
    .line 130
    invoke-static/range {v2 .. v12}, Lio/agora/base/internal/video/VideoFrameDrawer;->drawTexture(Lio/agora/base/internal/video/RendererCommon$GlDrawer;Lio/agora/base/VideoFrame$TextureBuffer;ILandroid/graphics/Matrix;IIIIIII)V

    .line 131
    .line 132
    .line 133
    iget-object v2, v0, Lio/agora/base/internal/video/YuvConverter;->shaderCallbacks:Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;

    .line 134
    .line 135
    invoke-virtual {v2}, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->setPlaneU()V

    .line 136
    .line 137
    .line 138
    iget-object v2, v0, Lio/agora/base/internal/video/YuvConverter;->drawer:Lio/agora/base/internal/video/GlGenericDrawer;

    .line 139
    .line 140
    div-int/lit8 v8, v10, 0x2

    .line 141
    .line 142
    move v10, v8

    .line 143
    const/4 v8, 0x0

    .line 144
    move v9, v7

    .line 145
    move v11, v13

    .line 146
    invoke-static/range {v2 .. v12}, Lio/agora/base/internal/video/VideoFrameDrawer;->drawTexture(Lio/agora/base/internal/video/RendererCommon$GlDrawer;Lio/agora/base/VideoFrame$TextureBuffer;ILandroid/graphics/Matrix;IIIIIII)V

    .line 147
    .line 148
    .line 149
    iget-object v2, v0, Lio/agora/base/internal/video/YuvConverter;->shaderCallbacks:Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;

    .line 150
    .line 151
    invoke-virtual {v2}, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->setPlaneV()V

    .line 152
    .line 153
    .line 154
    iget-object v2, v0, Lio/agora/base/internal/video/YuvConverter;->drawer:Lio/agora/base/internal/video/GlGenericDrawer;

    .line 155
    .line 156
    move v8, v10

    .line 157
    invoke-static/range {v2 .. v12}, Lio/agora/base/internal/video/VideoFrameDrawer;->drawTexture(Lio/agora/base/internal/video/RendererCommon$GlDrawer;Lio/agora/base/VideoFrame$TextureBuffer;ILandroid/graphics/Matrix;IIIIIII)V

    .line 158
    .line 159
    .line 160
    mul-int v2, v1, v14

    .line 161
    .line 162
    mul-int/lit8 v2, v2, 0x4

    .line 163
    .line 164
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 165
    .line 166
    .line 167
    move-result-object v8

    .line 168
    move v2, v6

    .line 169
    const/16 v6, 0x1908

    .line 170
    .line 171
    const/16 v7, 0x1406

    .line 172
    .line 173
    move v4, v2

    .line 174
    const/4 v2, 0x0

    .line 175
    const/4 v3, 0x0

    .line 176
    move v5, v14

    .line 177
    invoke-static/range {v2 .. v8}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 178
    .line 179
    .line 180
    move v6, v4

    .line 181
    const/4 v7, 0x0

    .line 182
    invoke-static {v15, v7}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 183
    .line 184
    .line 185
    const-string v2, "glReadPixels setSize"

    .line 186
    .line 187
    invoke-static {v2}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-virtual {v8, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 195
    .line 196
    .line 197
    move v4, v1

    .line 198
    move v2, v6

    .line 199
    move-object v1, v8

    .line 200
    move v3, v9

    .line 201
    invoke-direct/range {v0 .. v5}, Lio/agora/base/internal/video/YuvConverter;->get10BitBuffer(Ljava/nio/ByteBuffer;IIII)Ljava/nio/ByteBuffer;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    mul-int v2, v4, v3

    .line 206
    .line 207
    mul-int/lit8 v5, v2, 0x2

    .line 208
    .line 209
    div-int/lit8 v8, v2, 0x4

    .line 210
    .line 211
    add-int/2addr v2, v8

    .line 212
    mul-int/lit8 v2, v2, 0x2

    .line 213
    .line 214
    invoke-virtual {v1, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 218
    .line 219
    .line 220
    move v7, v4

    .line 221
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 226
    .line 227
    .line 228
    mul-int/lit8 v8, v8, 0x2

    .line 229
    .line 230
    add-int/2addr v5, v8

    .line 231
    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 232
    .line 233
    .line 234
    move v5, v6

    .line 235
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 236
    .line 237
    .line 238
    move-result-object v6

    .line 239
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 240
    .line 241
    .line 242
    add-int/2addr v2, v8

    .line 243
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 247
    .line 248
    .line 249
    move-result-object v8

    .line 250
    move v2, v5

    .line 251
    move v5, v7

    .line 252
    div-int/lit8 v7, v5, 0x2

    .line 253
    .line 254
    new-instance v10, Lio/agora/base/internal/video/YuvConverter$2;

    .line 255
    .line 256
    invoke-direct {v10, v0, v1}, Lio/agora/base/internal/video/YuvConverter$2;-><init>(Lio/agora/base/internal/video/YuvConverter;Ljava/nio/ByteBuffer;)V

    .line 257
    .line 258
    .line 259
    move v9, v7

    .line 260
    invoke-static/range {v2 .. v10}, Lio/agora/base/JavaI010Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lio/agora/base/JavaI010Buffer;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    return-object v0
.end method

.method private drawTexture(ILio/agora/base/VideoFrame$TextureBuffer$Type;III)V
    .locals 14

    .line 1
    const/16 v0, 0x4000

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lio/agora/base/internal/video/YuvConverter$3;->$SwitchMap$io$agora$base$VideoFrame$TextureBuffer$Type:[I

    .line 7
    .line 8
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    aget v0, v0, v1

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    iget-object v2, p0, Lio/agora/base/internal/video/YuvConverter;->drawer10bit:Lio/agora/base/internal/video/GlRectDrawer;

    .line 21
    .line 22
    sget-object v5, Lio/agora/base/internal/video/GlUtil;->IDENTITY_MATRIX:[F

    .line 23
    .line 24
    sget-object p0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_NO_STITCH:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 25
    .line 26
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$AlphaStitchMode;->value()I

    .line 27
    .line 28
    .line 29
    move-result v13

    .line 30
    const/4 v4, 0x0

    .line 31
    const/4 v8, 0x0

    .line 32
    const/4 v9, 0x0

    .line 33
    move/from16 v10, p3

    .line 34
    .line 35
    move/from16 v11, p4

    .line 36
    .line 37
    move v3, p1

    .line 38
    move/from16 v6, p3

    .line 39
    .line 40
    move/from16 v7, p4

    .line 41
    .line 42
    move/from16 v12, p5

    .line 43
    .line 44
    invoke-virtual/range {v2 .. v13}, Lio/agora/base/internal/video/GlGenericDrawer;->drawRgb(II[FIIIIIIII)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const-string p0, "Unknown texture type."

    .line 49
    .line 50
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter;->drawer10bit:Lio/agora/base/internal/video/GlRectDrawer;

    .line 55
    .line 56
    sget-object v3, Lio/agora/base/internal/video/GlUtil;->IDENTITY_MATRIX:[F

    .line 57
    .line 58
    sget-object p0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_NO_STITCH:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 59
    .line 60
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$AlphaStitchMode;->value()I

    .line 61
    .line 62
    .line 63
    move-result v11

    .line 64
    const/4 v2, 0x0

    .line 65
    const/4 v6, 0x0

    .line 66
    const/4 v7, 0x0

    .line 67
    move/from16 v8, p3

    .line 68
    .line 69
    move/from16 v9, p4

    .line 70
    .line 71
    move v1, p1

    .line 72
    move/from16 v4, p3

    .line 73
    .line 74
    move/from16 v5, p4

    .line 75
    .line 76
    move/from16 v10, p5

    .line 77
    .line 78
    invoke-virtual/range {v0 .. v11}, Lio/agora/base/internal/video/GlGenericDrawer;->drawOes(II[FIIIIIIII)V

    .line 79
    .line 80
    .line 81
    :goto_0
    const-string p0, "yuvconvert.drawFrameBuffer"

    .line 82
    .line 83
    invoke-static {p0}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method private get10BitBuffer(Ljava/nio/ByteBuffer;IIII)Ljava/nio/ByteBuffer;
    .locals 9

    .line 1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    mul-int p1, p4, p5

    .line 6
    .line 7
    new-array v0, p1, [F

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/nio/FloatBuffer;->get([F)Ljava/nio/FloatBuffer;

    .line 10
    .line 11
    .line 12
    mul-int/2addr p2, p3

    .line 13
    mul-int/lit8 p0, p2, 0x2

    .line 14
    .line 15
    new-array p0, p0, [B

    .line 16
    .line 17
    div-int/lit8 p2, p2, 0x4

    .line 18
    .line 19
    mul-int/lit8 p2, p2, 0x2

    .line 20
    .line 21
    new-array v1, p2, [B

    .line 22
    .line 23
    new-array p2, p2, [B

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    move v3, v2

    .line 27
    :goto_0
    if-ge v3, p4, :cond_3

    .line 28
    .line 29
    move v4, v2

    .line 30
    :goto_1
    if-ge v4, p5, :cond_2

    .line 31
    .line 32
    mul-int v5, v4, p4

    .line 33
    .line 34
    add-int/2addr v5, v3

    .line 35
    :try_start_0
    aget v6, v0, v5

    .line 36
    .line 37
    mul-int v7, p4, p3

    .line 38
    .line 39
    const/high16 v8, 0x44800000    # 1024.0f

    .line 40
    .line 41
    if-ge v5, v7, :cond_0

    .line 42
    .line 43
    mul-float/2addr v6, v8

    .line 44
    float-to-int v6, v6

    .line 45
    int-to-short v6, v6

    .line 46
    mul-int/lit8 v5, v5, 0x2

    .line 47
    .line 48
    and-int/lit16 v7, v6, 0xff

    .line 49
    .line 50
    int-to-byte v7, v7

    .line 51
    aput-byte v7, p0, v5

    .line 52
    .line 53
    add-int/lit8 v5, v5, 0x1

    .line 54
    .line 55
    shr-int/lit8 v6, v6, 0x8

    .line 56
    .line 57
    int-to-byte v6, v6

    .line 58
    aput-byte v6, p0, v5

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_0
    div-int/lit8 v5, p4, 0x2

    .line 62
    .line 63
    if-ge v3, v5, :cond_1

    .line 64
    .line 65
    mul-float/2addr v6, v8

    .line 66
    float-to-int v5, v6

    .line 67
    int-to-short v5, v5

    .line 68
    sub-int v6, v4, p3

    .line 69
    .line 70
    div-int/lit8 v7, p4, 0x2

    .line 71
    .line 72
    mul-int/2addr v6, v7

    .line 73
    add-int/2addr v6, v3

    .line 74
    mul-int/lit8 v6, v6, 0x2

    .line 75
    .line 76
    and-int/lit16 v7, v5, 0xff

    .line 77
    .line 78
    int-to-byte v7, v7

    .line 79
    aput-byte v7, v1, v6

    .line 80
    .line 81
    add-int/lit8 v6, v6, 0x1

    .line 82
    .line 83
    shr-int/lit8 v5, v5, 0x8

    .line 84
    .line 85
    int-to-byte v5, v5

    .line 86
    aput-byte v5, v1, v6

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_1
    mul-float/2addr v6, v8

    .line 90
    float-to-int v5, v6

    .line 91
    int-to-short v5, v5

    .line 92
    sub-int v6, v4, p3

    .line 93
    .line 94
    div-int/lit8 v7, p4, 0x2

    .line 95
    .line 96
    mul-int/2addr v6, v7

    .line 97
    add-int/2addr v6, v3

    .line 98
    div-int/lit8 v7, p4, 0x2

    .line 99
    .line 100
    sub-int/2addr v6, v7

    .line 101
    mul-int/lit8 v6, v6, 0x2

    .line 102
    .line 103
    and-int/lit16 v7, v5, 0xff

    .line 104
    .line 105
    int-to-byte v7, v7

    .line 106
    aput-byte v7, p2, v6

    .line 107
    .line 108
    add-int/lit8 v6, v6, 0x1

    .line 109
    .line 110
    shr-int/lit8 v5, v5, 0x8

    .line 111
    .line 112
    int-to-byte v5, v5

    .line 113
    aput-byte v5, p2, v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :catch_0
    move-exception p0

    .line 119
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 120
    .line 121
    .line 122
    const/4 p0, 0x0

    .line 123
    return-object p0

    .line 124
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_3
    mul-int/lit8 p1, p1, 0x2

    .line 128
    .line 129
    invoke-static {p1}, Lio/agora/base/internal/JniCommon;->nativeAllocateByteBuffer(I)Ljava/nio/ByteBuffer;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 143
    .line 144
    .line 145
    return-object p1
.end method

.method private getYuvConverterStats(IILio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;)Lio/agora/base/internal/video/YuvConverterStats;
    .locals 5

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter;->convertStatsList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lio/agora/base/internal/video/YuvConverterStats;

    .line 19
    .line 20
    invoke-virtual {v2}, Lio/agora/base/internal/video/YuvConverterStats;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-ne v3, p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v2}, Lio/agora/base/internal/video/YuvConverterStats;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-ne v3, p2, :cond_0

    .line 31
    .line 32
    invoke-virtual {v2}, Lio/agora/base/internal/video/YuvConverterStats;->getMethod()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    iget v4, p3, Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;->value:I

    .line 37
    .line 38
    if-ne v3, v4, :cond_0

    .line 39
    .line 40
    move-object v1, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    if-nez v1, :cond_2

    .line 43
    .line 44
    new-instance v0, Lio/agora/base/internal/video/YuvConverterStats;

    .line 45
    .line 46
    invoke-direct {v0, p1, p2, p3}, Lio/agora/base/internal/video/YuvConverterStats;-><init>(IILio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lio/agora/base/internal/video/YuvConverter;->convertStatsList:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    return-object v0

    .line 55
    :cond_2
    return-object v1
.end method

.method public static native nativeReportYuvConvertStats(Lio/agora/base/internal/video/YuvConverterStats;)V
.end method

.method public static setEnableConvertPerLog(Z)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    sput-boolean p0, Lio/agora/base/internal/video/YuvConverter;->enableConvertPerLog:Z

    .line 2
    .line 3
    return-void
.end method

.method public static setEnableConvertReport(Z)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    sput-boolean p0, Lio/agora/base/internal/video/YuvConverter;->enableReportYuvConvertStats:Z

    .line 2
    .line 3
    return-void
.end method

.method public static setEnableHardwareBuffer(Z)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    sput-boolean p0, Lio/agora/base/internal/video/YuvConverter;->enableHardwareBuffer:Z

    .line 2
    .line 3
    return-void
.end method

.method public static setEnablePboOpt(Z)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    sput-boolean p0, Lio/agora/base/internal/video/YuvConverter;->enablePboOpt:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public convert(Lio/agora/base/VideoFrame$TextureBuffer;)Lio/agora/base/VideoFrame$I420Buffer;
    .locals 1

    const/4 v0, 0x0

    .line 617
    invoke-virtual {p0, p1, v0}, Lio/agora/base/internal/video/YuvConverter;->convert(Lio/agora/base/VideoFrame$TextureBuffer;Lio/agora/base/VideoFrame$ColorSpace;)Lio/agora/base/VideoFrame$I420Buffer;

    move-result-object p0

    return-object p0
.end method

.method public convert(Lio/agora/base/VideoFrame$TextureBuffer;Lio/agora/base/VideoFrame$ColorSpace;)Lio/agora/base/VideoFrame$I420Buffer;
    .locals 42
    .param p2    # Lio/agora/base/VideoFrame$ColorSpace;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "YuvConverter"

    .line 4
    .line 5
    const-string v2, "pbo "

    .line 6
    .line 7
    iget-object v3, v0, Lio/agora/base/internal/video/YuvConverter;->threadChecker:Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    .line 8
    .line 9
    invoke-virtual {v3}, Lio/agora/base/internal/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 10
    .line 11
    .line 12
    invoke-interface/range {p1 .. p1}, Lio/agora/base/VideoFrame$Buffer;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v8

    .line 16
    invoke-interface/range {p1 .. p1}, Lio/agora/base/VideoFrame$Buffer;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v9

    .line 20
    add-int/lit8 v3, v8, 0x7

    .line 21
    .line 22
    div-int/lit8 v3, v3, 0x8

    .line 23
    .line 24
    mul-int/lit8 v3, v3, 0x8

    .line 25
    .line 26
    add-int/lit8 v4, v9, 0x1

    .line 27
    .line 28
    div-int/lit8 v15, v4, 0x2

    .line 29
    .line 30
    add-int v4, v9, v15

    .line 31
    .line 32
    div-int/lit8 v12, v3, 0x4

    .line 33
    .line 34
    new-instance v7, Landroid/graphics/Matrix;

    .line 35
    .line 36
    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 37
    .line 38
    .line 39
    const/high16 v5, 0x3f000000    # 0.5f

    .line 40
    .line 41
    invoke-virtual {v7, v5, v5}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 42
    .line 43
    .line 44
    const/high16 v5, 0x3f800000    # 1.0f

    .line 45
    .line 46
    const/high16 v6, -0x40800000    # -1.0f

    .line 47
    .line 48
    invoke-virtual {v7, v5, v6}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 49
    .line 50
    .line 51
    const/high16 v5, -0x41000000    # -0.5f

    .line 52
    .line 53
    invoke-virtual {v7, v5, v5}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 54
    .line 55
    .line 56
    invoke-direct {v0, v12, v4}, Lio/agora/base/internal/video/YuvConverter;->checkMaxTextureSize(II)Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    const/16 v23, 0x0

    .line 61
    .line 62
    if-eqz v5, :cond_0

    .line 63
    .line 64
    return-object v23

    .line 65
    :cond_0
    invoke-interface/range {p1 .. p1}, Lio/agora/base/VideoFrame$TextureBuffer;->getTransformMatrix()Landroid/graphics/Matrix;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    iget-object v6, v0, Lio/agora/base/internal/video/YuvConverter;->formerTextureMatrix:Landroid/graphics/Matrix;

    .line 70
    .line 71
    invoke-virtual {v5, v6}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    const/16 v24, 0x1

    .line 76
    .line 77
    xor-int/lit8 v30, v5, 0x1

    .line 78
    .line 79
    sget-boolean v5, Lio/agora/base/internal/video/YuvConverter;->enableHardwareBuffer:Z

    .line 80
    .line 81
    const/4 v6, 0x0

    .line 82
    if-eqz v5, :cond_1

    .line 83
    .line 84
    iget-object v5, v0, Lio/agora/base/internal/video/YuvConverter;->hardwareBufferHelper:Lio/agora/base/internal/video/HardwareBufferHelper;

    .line 85
    .line 86
    const/16 v19, 0x1

    .line 87
    .line 88
    const-wide/16 v20, 0x103

    .line 89
    .line 90
    move/from16 v18, v4

    .line 91
    .line 92
    move-object/from16 v16, v5

    .line 93
    .line 94
    move/from16 v17, v12

    .line 95
    .line 96
    move/from16 v22, v30

    .line 97
    .line 98
    invoke-virtual/range {v16 .. v22}, Lio/agora/base/internal/video/HardwareBufferHelper;->prepare(IIIJZ)Z

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    if-eqz v4, :cond_2

    .line 103
    .line 104
    move/from16 v22, v24

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_1
    move/from16 v18, v4

    .line 108
    .line 109
    move/from16 v17, v12

    .line 110
    .line 111
    :cond_2
    move/from16 v22, v6

    .line 112
    .line 113
    :goto_0
    iget-object v4, v0, Lio/agora/base/internal/video/YuvConverter;->i420TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 114
    .line 115
    if-eqz v22, :cond_3

    .line 116
    .line 117
    iget-object v5, v0, Lio/agora/base/internal/video/YuvConverter;->hardwareBufferHelper:Lio/agora/base/internal/video/HardwareBufferHelper;

    .line 118
    .line 119
    invoke-virtual {v5}, Lio/agora/base/internal/video/HardwareBufferHelper;->getOesTextureId()I

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    move/from16 v20, v18

    .line 124
    .line 125
    const v18, 0x8d65

    .line 126
    .line 127
    .line 128
    move-object/from16 v16, v4

    .line 129
    .line 130
    move/from16 v19, v17

    .line 131
    .line 132
    move/from16 v21, v30

    .line 133
    .line 134
    move/from16 v17, v5

    .line 135
    .line 136
    invoke-virtual/range {v16 .. v21}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->bindTexture(IIIIZ)V

    .line 137
    .line 138
    .line 139
    move/from16 v12, v19

    .line 140
    .line 141
    move/from16 v4, v20

    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_3
    move-object v5, v4

    .line 145
    move/from16 v12, v17

    .line 146
    .line 147
    move/from16 v4, v18

    .line 148
    .line 149
    invoke-virtual {v5, v12, v4}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->setSize(II)V

    .line 150
    .line 151
    .line 152
    :goto_1
    iget-object v5, v0, Lio/agora/base/internal/video/YuvConverter;->i420TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 153
    .line 154
    invoke-virtual {v5}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->getFrameBufferId()I

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    const v10, 0x8d40

    .line 159
    .line 160
    .line 161
    invoke-static {v10, v5}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 162
    .line 163
    .line 164
    const-string v5, "glBindFramebuffer"

    .line 165
    .line 166
    invoke-static {v5}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iget-object v5, v0, Lio/agora/base/internal/video/YuvConverter;->shaderCallbacks:Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;

    .line 170
    .line 171
    move-object/from16 v11, p2

    .line 172
    .line 173
    invoke-virtual {v5, v11}, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->setColorSpace(Lio/agora/base/VideoFrame$ColorSpace;)V

    .line 174
    .line 175
    .line 176
    iget-object v5, v0, Lio/agora/base/internal/video/YuvConverter;->shaderCallbacks:Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;

    .line 177
    .line 178
    invoke-virtual {v5}, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->setPlaneY()V

    .line 179
    .line 180
    .line 181
    move/from16 v18, v4

    .line 182
    .line 183
    iget-object v4, v0, Lio/agora/base/internal/video/YuvConverter;->drawer:Lio/agora/base/internal/video/GlGenericDrawer;

    .line 184
    .line 185
    const/4 v11, 0x0

    .line 186
    const/4 v14, 0x0

    .line 187
    move v5, v6

    .line 188
    const/4 v6, 0x0

    .line 189
    move v13, v10

    .line 190
    const/4 v10, 0x0

    .line 191
    move/from16 v16, v13

    .line 192
    .line 193
    move v13, v9

    .line 194
    move/from16 v17, v3

    .line 195
    .line 196
    move v3, v5

    .line 197
    move-object/from16 v5, p1

    .line 198
    .line 199
    invoke-static/range {v4 .. v14}, Lio/agora/base/internal/video/VideoFrameDrawer;->drawTexture(Lio/agora/base/internal/video/RendererCommon$GlDrawer;Lio/agora/base/VideoFrame$TextureBuffer;ILandroid/graphics/Matrix;IIIIIII)V

    .line 200
    .line 201
    .line 202
    iget-object v4, v0, Lio/agora/base/internal/video/YuvConverter;->shaderCallbacks:Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;

    .line 203
    .line 204
    invoke-virtual {v4}, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->setPlaneU()V

    .line 205
    .line 206
    .line 207
    iget-object v4, v0, Lio/agora/base/internal/video/YuvConverter;->drawer:Lio/agora/base/internal/video/GlGenericDrawer;

    .line 208
    .line 209
    div-int/lit8 v10, v12, 0x2

    .line 210
    .line 211
    move v12, v10

    .line 212
    const/4 v10, 0x0

    .line 213
    move v11, v9

    .line 214
    move v13, v15

    .line 215
    invoke-static/range {v4 .. v14}, Lio/agora/base/internal/video/VideoFrameDrawer;->drawTexture(Lio/agora/base/internal/video/RendererCommon$GlDrawer;Lio/agora/base/VideoFrame$TextureBuffer;ILandroid/graphics/Matrix;IIIIIII)V

    .line 216
    .line 217
    .line 218
    iget-object v4, v0, Lio/agora/base/internal/video/YuvConverter;->shaderCallbacks:Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;

    .line 219
    .line 220
    invoke-virtual {v4}, Lio/agora/base/internal/video/YuvConverter$ShaderCallbacks;->setPlaneV()V

    .line 221
    .line 222
    .line 223
    iget-object v4, v0, Lio/agora/base/internal/video/YuvConverter;->drawer:Lio/agora/base/internal/video/GlGenericDrawer;

    .line 224
    .line 225
    move v10, v12

    .line 226
    invoke-static/range {v4 .. v14}, Lio/agora/base/internal/video/VideoFrameDrawer;->drawTexture(Lio/agora/base/internal/video/RendererCommon$GlDrawer;Lio/agora/base/VideoFrame$TextureBuffer;ILandroid/graphics/Matrix;IIIIIII)V

    .line 227
    .line 228
    .line 229
    mul-int v4, v17, v18

    .line 230
    .line 231
    invoke-static {v4}, Lio/agora/base/internal/JniCommon;->nativeAllocateByteBuffer(I)Ljava/nio/ByteBuffer;

    .line 232
    .line 233
    .line 234
    move-result-object v33

    .line 235
    sget-boolean v4, Lio/agora/base/internal/video/YuvConverter;->enableConvertPerLog:Z

    .line 236
    .line 237
    const-wide/16 v5, 0x0

    .line 238
    .line 239
    if-nez v4, :cond_5

    .line 240
    .line 241
    sget-boolean v4, Lio/agora/base/internal/video/YuvConverter;->enableReportYuvConvertStats:Z

    .line 242
    .line 243
    if-eqz v4, :cond_4

    .line 244
    .line 245
    goto :goto_2

    .line 246
    :cond_4
    move-wide v10, v5

    .line 247
    goto :goto_3

    .line 248
    :cond_5
    :goto_2
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 249
    .line 250
    .line 251
    move-result-wide v10

    .line 252
    :goto_3
    if-eqz v22, :cond_6

    .line 253
    .line 254
    iget-object v4, v0, Lio/agora/base/internal/video/YuvConverter;->hardwareBufferHelper:Lio/agora/base/internal/video/HardwareBufferHelper;

    .line 255
    .line 256
    iget-object v7, v0, Lio/agora/base/internal/video/YuvConverter;->i420TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 257
    .line 258
    invoke-virtual {v7}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->getWidth()I

    .line 259
    .line 260
    .line 261
    move-result v38

    .line 262
    iget-object v7, v0, Lio/agora/base/internal/video/YuvConverter;->i420TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 263
    .line 264
    invoke-virtual {v7}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->getHeight()I

    .line 265
    .line 266
    .line 267
    move-result v39

    .line 268
    const/16 v36, 0x0

    .line 269
    .line 270
    const/16 v37, 0x0

    .line 271
    .line 272
    move-object/from16 v35, v4

    .line 273
    .line 274
    move-object/from16 v40, v33

    .line 275
    .line 276
    invoke-virtual/range {v35 .. v40}, Lio/agora/base/internal/video/HardwareBufferHelper;->readFrame(IIIILjava/nio/ByteBuffer;)Z

    .line 277
    .line 278
    .line 279
    move-result v4

    .line 280
    if-eqz v4, :cond_6

    .line 281
    .line 282
    move/from16 v4, v24

    .line 283
    .line 284
    goto :goto_4

    .line 285
    :cond_6
    move v4, v3

    .line 286
    :goto_4
    if-eqz v4, :cond_7

    .line 287
    .line 288
    move v7, v3

    .line 289
    :goto_5
    move-object/from16 v12, v33

    .line 290
    .line 291
    goto :goto_7

    .line 292
    :cond_7
    sget-boolean v7, Lio/agora/base/internal/video/YuvConverter;->enablePboOpt:Z

    .line 293
    .line 294
    if-eqz v7, :cond_8

    .line 295
    .line 296
    iget-object v7, v0, Lio/agora/base/internal/video/YuvConverter;->gpupboUtil:Lio/agora/base/internal/video/GPUPBOUtil;

    .line 297
    .line 298
    iget-object v12, v0, Lio/agora/base/internal/video/YuvConverter;->i420TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 299
    .line 300
    invoke-virtual {v12}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->getWidth()I

    .line 301
    .line 302
    .line 303
    move-result v28

    .line 304
    iget-object v12, v0, Lio/agora/base/internal/video/YuvConverter;->i420TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 305
    .line 306
    invoke-virtual {v12}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->getHeight()I

    .line 307
    .line 308
    .line 309
    move-result v29

    .line 310
    sget-object v12, Lio/agora/base/internal/video/YuvConverter;->mIsNeedForceResetPbo:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 311
    .line 312
    invoke-virtual {v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 313
    .line 314
    .line 315
    move-result v34

    .line 316
    const/16 v26, 0x0

    .line 317
    .line 318
    const/16 v27, 0x0

    .line 319
    .line 320
    const/16 v31, 0x1908

    .line 321
    .line 322
    const/16 v32, 0x1401

    .line 323
    .line 324
    move-object/from16 v25, v7

    .line 325
    .line 326
    invoke-virtual/range {v25 .. v34}, Lio/agora/base/internal/video/GPUPBOUtil;->readFrame(IIIIZIILjava/nio/ByteBuffer;Z)Z

    .line 327
    .line 328
    .line 329
    move-result v7

    .line 330
    if-eqz v7, :cond_8

    .line 331
    .line 332
    move/from16 v7, v24

    .line 333
    .line 334
    goto :goto_6

    .line 335
    :cond_8
    move v7, v3

    .line 336
    :goto_6
    sget-object v12, Lio/agora/base/internal/video/YuvConverter;->mIsNeedForceResetPbo:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 337
    .line 338
    invoke-virtual {v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 339
    .line 340
    .line 341
    move-result v14

    .line 342
    if-eqz v14, :cond_9

    .line 343
    .line 344
    invoke-virtual {v12, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 345
    .line 346
    .line 347
    :cond_9
    if-eqz v7, :cond_a

    .line 348
    .line 349
    goto :goto_5

    .line 350
    :cond_a
    iget-object v12, v0, Lio/agora/base/internal/video/YuvConverter;->i420TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 351
    .line 352
    invoke-virtual {v12}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->getWidth()I

    .line 353
    .line 354
    .line 355
    move-result v37

    .line 356
    iget-object v12, v0, Lio/agora/base/internal/video/YuvConverter;->i420TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 357
    .line 358
    invoke-virtual {v12}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->getHeight()I

    .line 359
    .line 360
    .line 361
    move-result v38

    .line 362
    const/16 v39, 0x1908

    .line 363
    .line 364
    const/16 v40, 0x1401

    .line 365
    .line 366
    const/16 v35, 0x0

    .line 367
    .line 368
    const/16 v36, 0x0

    .line 369
    .line 370
    move-object/from16 v41, v33

    .line 371
    .line 372
    invoke-static/range {v35 .. v41}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 373
    .line 374
    .line 375
    move-object/from16 v12, v41

    .line 376
    .line 377
    :goto_7
    const/16 v14, 0x9

    .line 378
    .line 379
    :try_start_0
    new-array v14, v14, [F

    .line 380
    .line 381
    invoke-interface/range {p1 .. p1}, Lio/agora/base/VideoFrame$TextureBuffer;->getTransformMatrix()Landroid/graphics/Matrix;

    .line 382
    .line 383
    .line 384
    move-result-object v15

    .line 385
    invoke-virtual {v15, v14}, Landroid/graphics/Matrix;->getValues([F)V

    .line 386
    .line 387
    .line 388
    iget-object v15, v0, Lio/agora/base/internal/video/YuvConverter;->formerTextureMatrix:Landroid/graphics/Matrix;

    .line 389
    .line 390
    invoke-virtual {v15, v14}, Landroid/graphics/Matrix;->setValues([F)V

    .line 391
    .line 392
    .line 393
    sget-boolean v14, Lio/agora/base/internal/video/YuvConverter;->enableConvertPerLog:Z

    .line 394
    .line 395
    if-eqz v14, :cond_d

    .line 396
    .line 397
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 398
    .line 399
    .line 400
    move-result-wide v14

    .line 401
    sub-long/2addr v14, v10

    .line 402
    move/from16 p2, v4

    .line 403
    .line 404
    iget-wide v3, v0, Lio/agora/base/internal/video/YuvConverter;->convertTimeInNS:J

    .line 405
    .line 406
    cmp-long v18, v3, v5

    .line 407
    .line 408
    if-nez v18, :cond_b

    .line 409
    .line 410
    iput-wide v14, v0, Lio/agora/base/internal/video/YuvConverter;->convertTimeInNS:J

    .line 411
    .line 412
    goto :goto_8

    .line 413
    :catch_0
    move-exception v0

    .line 414
    goto/16 :goto_c

    .line 415
    .line 416
    :cond_b
    add-long/2addr v3, v14

    .line 417
    long-to-double v3, v3

    .line 418
    const-wide/high16 v14, 0x4000000000000000L    # 2.0

    .line 419
    .line 420
    div-double/2addr v3, v14

    .line 421
    double-to-long v3, v3

    .line 422
    iput-wide v3, v0, Lio/agora/base/internal/video/YuvConverter;->convertTimeInNS:J

    .line 423
    .line 424
    :goto_8
    iget-wide v3, v0, Lio/agora/base/internal/video/YuvConverter;->convertTimeCounter:J

    .line 425
    .line 426
    const-wide/16 v14, 0x1

    .line 427
    .line 428
    add-long/2addr v3, v14

    .line 429
    iput-wide v3, v0, Lio/agora/base/internal/video/YuvConverter;->convertTimeCounter:J

    .line 430
    .line 431
    const-wide/16 v14, 0x64

    .line 432
    .line 433
    rem-long/2addr v3, v14

    .line 434
    cmp-long v3, v3, v5

    .line 435
    .line 436
    if-nez v3, :cond_e

    .line 437
    .line 438
    iput-wide v5, v0, Lio/agora/base/internal/video/YuvConverter;->convertTimeCounter:J

    .line 439
    .line 440
    new-instance v3, Ljava/lang/StringBuilder;

    .line 441
    .line 442
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 443
    .line 444
    .line 445
    if-eqz v7, :cond_c

    .line 446
    .line 447
    const-string v2, "YES"

    .line 448
    .line 449
    goto :goto_9

    .line 450
    :cond_c
    const-string v2, "NO"

    .line 451
    .line 452
    :goto_9
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 453
    .line 454
    .line 455
    const-string v2, ", avg timing for read pixel, "

    .line 456
    .line 457
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 458
    .line 459
    .line 460
    iget-wide v4, v0, Lio/agora/base/internal/video/YuvConverter;->convertTimeInNS:J

    .line 461
    .line 462
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 463
    .line 464
    .line 465
    const-string v2, " ns"

    .line 466
    .line 467
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 468
    .line 469
    .line 470
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v2

    .line 474
    invoke-static {v1, v2}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 475
    .line 476
    .line 477
    goto :goto_a

    .line 478
    :cond_d
    move/from16 p2, v4

    .line 479
    .line 480
    :cond_e
    :goto_a
    sget-boolean v2, Lio/agora/base/internal/video/YuvConverter;->enableReportYuvConvertStats:Z

    .line 481
    .line 482
    if-eqz v2, :cond_11

    .line 483
    .line 484
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 485
    .line 486
    .line 487
    move-result-wide v2

    .line 488
    sub-long/2addr v2, v10

    .line 489
    if-eqz v7, :cond_f

    .line 490
    .line 491
    sget-object v4, Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;->PBO:Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;

    .line 492
    .line 493
    goto :goto_b

    .line 494
    :cond_f
    sget-object v4, Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;->GL_READ_PIXELS:Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;

    .line 495
    .line 496
    :goto_b
    if-eqz p2, :cond_10

    .line 497
    .line 498
    sget-object v4, Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;->HARDWARE_BUFFER:Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;

    .line 499
    .line 500
    :cond_10
    invoke-direct {v0, v8, v9, v4}, Lio/agora/base/internal/video/YuvConverter;->getYuvConverterStats(IILio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;)Lio/agora/base/internal/video/YuvConverterStats;

    .line 501
    .line 502
    .line 503
    move-result-object v4

    .line 504
    const-wide/16 v5, 0x3e8

    .line 505
    .line 506
    div-long/2addr v2, v5

    .line 507
    long-to-int v2, v2

    .line 508
    invoke-virtual {v4, v2}, Lio/agora/base/internal/video/YuvConverterStats;->stats(I)Z

    .line 509
    .line 510
    .line 511
    move-result v2

    .line 512
    if-eqz v2, :cond_11

    .line 513
    .line 514
    invoke-static {v4}, Lio/agora/base/internal/video/YuvConverter;->nativeReportYuvConvertStats(Lio/agora/base/internal/video/YuvConverterStats;)V

    .line 515
    .line 516
    .line 517
    :cond_11
    const-string v2, "YuvConverter.convert"

    .line 518
    .line 519
    invoke-static {v2}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 520
    .line 521
    .line 522
    const v1, 0x8d40

    .line 523
    .line 524
    .line 525
    const/4 v3, 0x0

    .line 526
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 527
    .line 528
    .line 529
    mul-int v1, v17, v9

    .line 530
    .line 531
    div-int/lit8 v2, v17, 0x2

    .line 532
    .line 533
    add-int v4, v1, v2

    .line 534
    .line 535
    invoke-virtual {v12, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 536
    .line 537
    .line 538
    invoke-virtual {v12, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 539
    .line 540
    .line 541
    invoke-virtual {v12}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 542
    .line 543
    .line 544
    move-result-object v6

    .line 545
    invoke-virtual {v12, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 546
    .line 547
    .line 548
    add-int/lit8 v15, v13, -0x1

    .line 549
    .line 550
    mul-int v3, v17, v15

    .line 551
    .line 552
    add-int/2addr v3, v2

    .line 553
    add-int/2addr v1, v3

    .line 554
    invoke-virtual {v12, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 555
    .line 556
    .line 557
    move v1, v8

    .line 558
    invoke-virtual {v12}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 559
    .line 560
    .line 561
    move-result-object v8

    .line 562
    invoke-virtual {v12, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 563
    .line 564
    .line 565
    add-int/2addr v4, v3

    .line 566
    invoke-virtual {v12, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 567
    .line 568
    .line 569
    invoke-virtual {v12}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 570
    .line 571
    .line 572
    move-result-object v10

    .line 573
    new-instance v2, Lio/agora/base/internal/video/YuvConverter$1;

    .line 574
    .line 575
    invoke-direct {v2, v0, v12}, Lio/agora/base/internal/video/YuvConverter$1;-><init>(Lio/agora/base/internal/video/YuvConverter;Ljava/nio/ByteBuffer;)V

    .line 576
    .line 577
    .line 578
    move v5, v9

    .line 579
    move/from16 v9, v17

    .line 580
    .line 581
    move/from16 v11, v17

    .line 582
    .line 583
    move v4, v1

    .line 584
    move-object v12, v2

    .line 585
    move/from16 v7, v17

    .line 586
    .line 587
    invoke-static/range {v4 .. v12}, Lio/agora/base/JavaI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lio/agora/base/JavaI420Buffer;

    .line 588
    .line 589
    .line 590
    move-result-object v0

    .line 591
    return-object v0

    .line 592
    :goto_c
    invoke-static {v12}, Lio/agora/base/internal/JniCommon;->nativeFreeByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 593
    .line 594
    .line 595
    new-instance v2, Ljava/lang/StringBuilder;

    .line 596
    .line 597
    const-string v3, "convert error: "

    .line 598
    .line 599
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 600
    .line 601
    .line 602
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 603
    .line 604
    .line 605
    move-result-object v0

    .line 606
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 607
    .line 608
    .line 609
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 610
    .line 611
    .line 612
    move-result-object v0

    .line 613
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 614
    .line 615
    .line 616
    return-object v23
.end method

.method public convertI010(Lio/agora/base/VideoFrame$TextureBuffer;)Lio/agora/base/JavaI010Buffer;
    .locals 1

    .line 1
    invoke-static {}, Lio/agora/base/internal/video/HdrUtil;->isSupportedEGL3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-direct {p0, p1}, Lio/agora/base/internal/video/YuvConverter;->convert10Texture(Lio/agora/base/VideoFrame$TextureBuffer;)Lio/agora/base/JavaI010Buffer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter;->threadChecker:Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lio/agora/base/internal/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter;->drawer:Lio/agora/base/internal/video/GlGenericDrawer;

    .line 7
    .line 8
    invoke-virtual {v0}, Lio/agora/base/internal/video/GlGenericDrawer;->release()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter;->i420TextureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 12
    .line 13
    invoke-virtual {v0}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->release()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter;->gpupboUtil:Lio/agora/base/internal/video/GPUPBOUtil;

    .line 17
    .line 18
    invoke-virtual {v0}, Lio/agora/base/internal/video/GPUPBOUtil;->release()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter;->threadChecker:Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    .line 22
    .line 23
    invoke-virtual {v0}, Lio/agora/base/internal/ThreadUtils$ThreadChecker;->detachThread()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverter;->convertStatsList:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lio/agora/base/internal/video/YuvConverter;->hardwareBufferHelper:Lio/agora/base/internal/video/HardwareBufferHelper;

    .line 32
    .line 33
    invoke-virtual {p0}, Lio/agora/base/internal/video/HardwareBufferHelper;->release()V

    .line 34
    .line 35
    .line 36
    return-void
.end method
