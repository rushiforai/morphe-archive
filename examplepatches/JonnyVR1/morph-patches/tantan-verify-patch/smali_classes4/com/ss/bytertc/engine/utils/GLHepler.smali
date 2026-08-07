.class public Lcom/ss/bytertc/engine/utils/GLHepler;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final DEVICE_RECTANGLE:Ljava/nio/FloatBuffer;

.field private static final TEXTURE_RECTANGLE:Ljava/nio/FloatBuffer;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private frameBufferId:I

.field private handler:Landroid/os/Handler;

.field private mBInit:Z

.field private mEglBase:Lcom/bytedance/realx/video/EglBase;

.field private final mFragmentShader:Ljava/lang/String;

.field private mGlShader:Lcom/bytedance/realx/video/GlShader;

.field private final mVertorShader:Ljava/lang/String;

.field private released:Z

.field private shader:Lcom/bytedance/realx/video/GlShader;

.field private shaderTextureType:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

.field private final threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;


# direct methods
.method static constructor <clinit>()V
    .locals 2

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
    invoke-static {v1}, Lcom/bytedance/realx/video/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sput-object v1, Lcom/ss/bytertc/engine/utils/GLHepler;->DEVICE_RECTANGLE:Ljava/nio/FloatBuffer;

    .line 13
    .line 14
    new-array v0, v0, [F

    .line 15
    .line 16
    fill-array-data v0, :array_1

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Lcom/bytedance/realx/video/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lcom/ss/bytertc/engine/utils/GLHepler;->TEXTURE_RECTANGLE:Ljava/nio/FloatBuffer;

    .line 24
    .line 25
    return-void

    .line 26
    nop

    .line 27
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

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
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
.end method

.method private constructor <init>(Landroid/opengl/EGLContext;Landroid/os/Handler;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "GLHepler"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->mBInit:Z

    .line 10
    .line 11
    iput v0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->frameBufferId:I

    .line 12
    .line 13
    const-string v1, "attribute vec4 vPosition;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\n\nvoid main(){gl_Position = vPosition;\ntextureCoordinate = inputTextureCoordinate;\n}\n"

    .line 14
    .line 15
    iput-object v1, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->mVertorShader:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 textureCoordinate;\nuniform samplerExternalOES s_texture;\nvoid main() {  gl_FragColor = texture2D( s_texture, textureCoordinate );\n}"

    .line 18
    .line 19
    iput-object v1, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->mFragmentShader:Ljava/lang/String;

    .line 20
    .line 21
    new-instance v1, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 22
    .line 23
    invoke-direct {v1}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->released:Z

    .line 29
    .line 30
    iput-object p2, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->handler:Landroid/os/Handler;

    .line 31
    .line 32
    sget-object v2, Lcom/bytedance/realx/video/EglBase;->CONFIG_PIXEL_BUFFER:[I

    .line 33
    .line 34
    invoke-static {p1, v2}, Lcom/bytedance/realx/video/EglBase;->createEgl14(Landroid/opengl/EGLContext;[I)Lcom/bytedance/realx/video/EglBase;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 39
    .line 40
    :try_start_0
    invoke-interface {p1}, Lcom/bytedance/realx/video/EglBase;->createDummyPbufferSurface()V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 44
    .line 45
    invoke-interface {p1}, Lcom/bytedance/realx/video/EglBase;->makeCurrent()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    const/4 p1, 0x1

    .line 49
    new-array p2, p1, [I

    .line 50
    .line 51
    invoke-static {p1, p2, v0}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 52
    .line 53
    .line 54
    aget p1, p2, v0

    .line 55
    .line 56
    iput p1, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->frameBufferId:I

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->detachThread()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :catch_0
    move-exception p1

    .line 63
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 64
    .line 65
    invoke-interface {p0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    .line 73
    .line 74
    .line 75
    throw p1
.end method

.method public synthetic constructor <init>(Landroid/opengl/EGLContext;Landroid/os/Handler;Lcom/ss/bytertc/engine/utils/GLHepler$1;)V
    .locals 0

    .line 76
    invoke-direct {p0, p1, p2}, Lcom/ss/bytertc/engine/utils/GLHepler;-><init>(Landroid/opengl/EGLContext;Landroid/os/Handler;)V

    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/engine/utils/GLHepler;IIII)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iget-object v2, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 11
    .line 12
    .line 13
    iget-boolean v2, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->released:Z

    .line 14
    .line 15
    if-nez v2, :cond_1

    .line 16
    .line 17
    iget-boolean v2, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->mBInit:Z

    .line 18
    .line 19
    const/16 v3, 0xde1

    .line 20
    .line 21
    const v4, 0x8ce0

    .line 22
    .line 23
    .line 24
    const v5, 0x8d40

    .line 25
    .line 26
    .line 27
    const/4 v6, 0x0

    .line 28
    if-nez v2, :cond_0

    .line 29
    .line 30
    sget-object v2, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->OES:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 31
    .line 32
    invoke-direct {p0, v2}, Lcom/ss/bytertc/engine/utils/GLHepler;->initShader(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->shader:Lcom/bytedance/realx/video/GlShader;

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/bytedance/realx/video/GlShader;->useProgram()V

    .line 38
    .line 39
    .line 40
    iget v2, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->frameBufferId:I

    .line 41
    .line 42
    invoke-static {v5, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 43
    .line 44
    .line 45
    invoke-static {v5, v4, v3, p1, v6}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object v2, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->shader:Lcom/bytedance/realx/video/GlShader;

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/bytedance/realx/video/GlShader;->useProgram()V

    .line 51
    .line 52
    .line 53
    iget p0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->frameBufferId:I

    .line 54
    .line 55
    invoke-static {v5, p0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 56
    .line 57
    .line 58
    invoke-static {v5, v4, v3, p1, v6}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 59
    .line 60
    .line 61
    const p0, 0x84c0

    .line 62
    .line 63
    .line 64
    invoke-static {p0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 65
    .line 66
    .line 67
    const p0, 0x8d65

    .line 68
    .line 69
    .line 70
    invoke-static {p0, p2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 71
    .line 72
    .line 73
    invoke-static {v6, v6, p3, p4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 74
    .line 75
    .line 76
    const/4 p1, 0x5

    .line 77
    const/4 p2, 0x4

    .line 78
    invoke-static {p1, v6, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 79
    .line 80
    .line 81
    invoke-static {v5, v6}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 82
    .line 83
    .line 84
    invoke-static {p0, v6}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 85
    .line 86
    .line 87
    new-instance p0, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string p1, "usetime:"

    .line 90
    .line 91
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 95
    .line 96
    .line 97
    move-result-wide p1

    .line 98
    sub-long/2addr p1, v0

    .line 99
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const-string p1, "opnngl ToTexture2D"

    .line 107
    .line 108
    invoke-static {p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_1
    const-string p0, "YuvConverter.convert called on released object"

    .line 113
    .line 114
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public static create(Ljava/lang/String;Landroid/opengl/EGLContext;)Lcom/ss/bytertc/engine/utils/GLHepler;
    .locals 2

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/ss/bytertc/engine/utils/GLHepler$1;

    .line 19
    .line 20
    invoke-direct {v0, p1, v1, p0}, Lcom/ss/bytertc/engine/utils/GLHepler$1;-><init>(Landroid/opengl/EGLContext;Landroid/os/Handler;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/ss/bytertc/engine/utils/GLHepler;

    .line 28
    .line 29
    return-object p0
.end method

.method private initShader(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->shader:Lcom/bytedance/realx/video/GlShader;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlShader;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->mBInit:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->mBInit:Z

    .line 15
    .line 16
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->shaderTextureType:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 17
    .line 18
    new-instance p1, Lcom/bytedance/realx/video/GlShader;

    .line 19
    .line 20
    const-string v0, "attribute vec4 vPosition;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\n\nvoid main(){gl_Position = vPosition;\ntextureCoordinate = inputTextureCoordinate;\n}\n"

    .line 21
    .line 22
    const-string v1, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 textureCoordinate;\nuniform samplerExternalOES s_texture;\nvoid main() {  gl_FragColor = texture2D( s_texture, textureCoordinate );\n}"

    .line 23
    .line 24
    invoke-direct {p1, v0, v1}, Lcom/bytedance/realx/video/GlShader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->shader:Lcom/bytedance/realx/video/GlShader;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/bytedance/realx/video/GlShader;->useProgram()V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->shader:Lcom/bytedance/realx/video/GlShader;

    .line 33
    .line 34
    const-string v0, "s_texture"

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Lcom/bytedance/realx/video/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 42
    .line 43
    .line 44
    const-string p1, "Initialize fragment shader uniform values."

    .line 45
    .line 46
    invoke-static {p1}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->shader:Lcom/bytedance/realx/video/GlShader;

    .line 50
    .line 51
    const-string v0, "vPosition"

    .line 52
    .line 53
    sget-object v1, Lcom/ss/bytertc/engine/utils/GLHepler;->DEVICE_RECTANGLE:Ljava/nio/FloatBuffer;

    .line 54
    .line 55
    const/4 v2, 0x2

    .line 56
    invoke-virtual {p1, v0, v2, v1}, Lcom/bytedance/realx/video/GlShader;->setVertexAttribArray(Ljava/lang/String;ILjava/nio/FloatBuffer;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->shader:Lcom/bytedance/realx/video/GlShader;

    .line 60
    .line 61
    const-string p1, "inputTextureCoordinate"

    .line 62
    .line 63
    sget-object v0, Lcom/ss/bytertc/engine/utils/GLHepler;->TEXTURE_RECTANGLE:Ljava/nio/FloatBuffer;

    .line 64
    .line 65
    invoke-virtual {p0, p1, v2, v0}, Lcom/bytedance/realx/video/GlShader;->setVertexAttribArray(Ljava/lang/String;ILjava/nio/FloatBuffer;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public deliverToTexture2D(IIII[F)V
    .locals 6

    .line 1
    iget-object p5, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v0, Ll/nej;

    .line 4
    .line 5
    move-object v1, p0

    .line 6
    move v4, p1

    .line 7
    move v5, p2

    .line 8
    move v3, p3

    .line 9
    move v2, p4

    .line 10
    invoke-direct/range {v0 .. v5}, Ll/nej;-><init>(Lcom/ss/bytertc/engine/utils/GLHepler;IIII)V

    .line 11
    .line 12
    .line 13
    invoke-static {p5, v0}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->released:Z

    .line 8
    .line 9
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/GLHepler;->shader:Lcom/bytedance/realx/video/GlShader;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/bytedance/realx/video/GlShader;->release()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
