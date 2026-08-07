.class public Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;
.super Ll/gfj;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "VideoResourceProcessInput"

.field private static final UNIFORM_CAM_MATRIX:Ljava/lang/String; = "u_Matrix"


# instance fields
.field addIndex:I

.field private currentBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private frameSize:I

.field private volatile isProcess:Z

.field private volatile mCurTimestamp:J

.field private volatile mFinishFrameIndex:I

.field private volatile mFrameIndex:I

.field private mFrameRate:I

.field private matrix:[F

.field private matrixHandle:I

.field private onFrameAvailableListener:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

.field player:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;

.field private processListener:Lcom/momo/mcamera/videoprocess/VideoProcessListener;

.field private processParam:Lcom/momo/mcamera/videoencoder/ProcessParam;

.field private processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

.field private ready:Z

.field private volatile recordVideo:Z

.field private renderTime:J

.field private startWhenReady:Z

.field surface:Landroid/view/Surface;

.field private videoPath:Ljava/lang/String;

.field private videoTex:Landroid/graphics/SurfaceTexture;

.field private view:Landroid/opengl/GLSurfaceView;

.field yuvFileEndpoint:Ll/qmq0;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/videoencoder/ProcessParam;Lcom/momo/mcamera/videoencoder/ProcessSurface;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/gfj;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    iput-object v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->matrix:[F

    .line 9
    .line 10
    const-wide/16 v0, -0x64

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->mCurTimestamp:J

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->recordVideo:Z

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->frameSize:I

    .line 19
    .line 20
    const-wide/16 v1, 0x0

    .line 21
    .line 22
    iput-wide v1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->renderTime:J

    .line 23
    .line 24
    const/4 v1, -0x1

    .line 25
    iput v1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->mFrameRate:I

    .line 26
    .line 27
    iput v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->addIndex:I

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->startWhenReady:Z

    .line 30
    .line 31
    iput-boolean v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->ready:Z

    .line 32
    .line 33
    iput-object p1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->processParam:Lcom/momo/mcamera/videoencoder/ProcessParam;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/momo/mcamera/videoencoder/ProcessParam;->getVideoPath()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->videoPath:Ljava/lang/String;

    .line 40
    .line 41
    iput-object p2, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/momo/mcamera/videoencoder/ProcessParam;->getOutPutWidth()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    invoke-virtual {p1}, Lcom/momo/mcamera/videoencoder/ProcessParam;->getOutPutHeight()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {p0, p2, p1}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->setRenderSize(II)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->processListener:Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->videoPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1002(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->frameSize:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Landroid/media/MediaCodec$BufferInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->currentBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$202(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;Landroid/media/MediaCodec$BufferInfo;)Landroid/media/MediaCodec$BufferInfo;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->currentBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->mCurTimestamp:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$302(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->mCurTimestamp:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$402(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->isProcess:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$508(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->mFrameIndex:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->mFrameIndex:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic access$600(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoencoder/ProcessParam;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->processParam:Lcom/momo/mcamera/videoencoder/ProcessParam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoencoder/ProcessSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$800(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->renderTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$802(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->renderTime:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$900(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->mFrameRate:I

    .line 2
    .line 3
    return p0
.end method

.method private bindTexture()V
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
    const v0, 0x8d65

    .line 8
    .line 9
    .line 10
    iget p0, p0, Ll/wej;->texture_in:I

    .line 11
    .line 12
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->texture_in:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    filled-new-array {v0}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v1, p0, Ll/wej;->texture_in:I

    .line 18
    .line 19
    :cond_0
    iput-boolean v1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->recordVideo:Z

    .line 20
    .line 21
    return-void
.end method

.method public drawFrame()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->videoTex:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ll/gfj;->drawFrame()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getCurrentBuffer()Landroid/media/MediaCodec$BufferInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->currentBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nuniform samplerExternalOES inputImageTexture0;\nvarying vec2 textureCoordinate;\nvoid main() {\n   gl_FragColor = texture2D(inputImageTexture0, textureCoordinate);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->surface:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->videoTex:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 u_Matrix;\nattribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvoid main() {\n   vec4 texPos = u_Matrix * vec4(inputTextureCoordinate, 1, 1);\n   textureCoordinate = texPos.xy;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "u_Matrix"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->matrixHandle:I

    .line 13
    .line 14
    return-void
.end method

.method public initWithGLContext()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->ready:Z

    .line 3
    .line 4
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 5
    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    new-array v2, v1, [I

    .line 9
    .line 10
    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 11
    .line 12
    .line 13
    aget v3, v2, v0

    .line 14
    .line 15
    const v4, 0x8d65

    .line 16
    .line 17
    .line 18
    invoke-static {v4, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 19
    .line 20
    .line 21
    const/16 v3, 0x2801

    .line 22
    .line 23
    const v5, 0x46180400    # 9729.0f

    .line 24
    .line 25
    .line 26
    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 27
    .line 28
    .line 29
    const/16 v3, 0x2800

    .line 30
    .line 31
    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 32
    .line 33
    .line 34
    const/16 v3, 0x2802

    .line 35
    .line 36
    const v5, 0x812f

    .line 37
    .line 38
    .line 39
    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 40
    .line 41
    .line 42
    const/16 v3, 0x2803

    .line 43
    .line 44
    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 45
    .line 46
    .line 47
    aget v0, v2, v0

    .line 48
    .line 49
    iput v0, p0, Ll/wej;->texture_in:I

    .line 50
    .line 51
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 52
    .line 53
    iget v2, p0, Ll/wej;->texture_in:I

    .line 54
    .line 55
    invoke-direct {v0, v2}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->videoTex:Landroid/graphics/SurfaceTexture;

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 61
    .line 62
    .line 63
    new-instance v0, Landroid/view/Surface;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->videoTex:Landroid/graphics/SurfaceTexture;

    .line 66
    .line 67
    invoke-direct {v0, v2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->surface:Landroid/view/Surface;

    .line 71
    .line 72
    iput-boolean v1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->ready:Z

    .line 73
    .line 74
    return-void
.end method

.method public isPlaying()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->view:Landroid/opengl/GLSurfaceView;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/opengl/GLSurfaceView;->requestRender()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->onFrameAvailableListener:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0, p1}, Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;->onFrameAvailable(Landroid/graphics/SurfaceTexture;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public passShaderValues()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 8
    .line 9
    const/16 v6, 0x8

    .line 10
    .line 11
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 12
    .line 13
    const/4 v3, 0x2

    .line 14
    const/16 v4, 0x1406

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    iget v2, p0, Ll/wej;->curRotation:I

    .line 28
    .line 29
    aget-object v0, v0, v2

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 35
    .line 36
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 37
    .line 38
    iget v3, p0, Ll/wej;->curRotation:I

    .line 39
    .line 40
    aget-object v7, v0, v3

    .line 41
    .line 42
    const/4 v3, 0x2

    .line 43
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 44
    .line 45
    .line 46
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 47
    .line 48
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->bindTexture()V

    .line 52
    .line 53
    .line 54
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 55
    .line 56
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->videoTex:Landroid/graphics/SurfaceTexture;

    .line 60
    .line 61
    iget-object v2, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->matrix:[F

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 64
    .line 65
    .line 66
    iget v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->matrixHandle:I

    .line 67
    .line 68
    const/4 v2, 0x1

    .line 69
    iget-object p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->matrix:[F

    .line 70
    .line 71
    invoke-static {v0, v2, v1, p0, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->mFrameRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->onFrameAvailableListener:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    .line 2
    .line 3
    return-void
.end method

.method public setProcessListener(Lcom/momo/mcamera/videoprocess/VideoProcessListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->processListener:Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 2
    .line 3
    return-void
.end method

.method public setRenderSize(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/wej;->setRenderSize(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public startVideoDecode()V
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;-><init>(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public startWhenReady()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->ready:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->player:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->startWhenReady:Z

    .line 13
    .line 14
    return-void
.end method

.method public stop()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->player:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Thread;->stop()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
