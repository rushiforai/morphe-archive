.class Lcom/momo/mcamera/videoencoder/ProcessRender;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "TextureRender"


# instance fields
.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field pipeline:Ll/pej;

.field private previewHeight:I

.field private previewWidth:I

.field private processListener:Lcom/momo/mcamera/videoprocess/VideoProcessListener;

.field private processParam:Lcom/momo/mcamera/videoencoder/ProcessParam;

.field private processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

.field private screenEndpoint:Ll/zej;

.field private selectFilter:Ll/jt2;

.field textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;


# direct methods
.method public constructor <init>(Ll/jt2;Lcom/momo/mcamera/videoencoder/ProcessSurface;Lcom/momo/mcamera/videoencoder/ProcessParam;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x160

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->previewWidth:I

    .line 7
    .line 8
    const/16 v0, 0x280

    .line 9
    .line 10
    iput v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->previewHeight:I

    .line 11
    .line 12
    iput-object p2, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->processParam:Lcom/momo/mcamera/videoencoder/ProcessParam;

    .line 15
    .line 16
    invoke-virtual {p3}, Lcom/momo/mcamera/videoencoder/ProcessParam;->getOutPutWidth()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    iput p2, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->previewWidth:I

    .line 21
    .line 22
    invoke-virtual {p3}, Lcom/momo/mcamera/videoencoder/ProcessParam;->getOutPutHeight()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iput p2, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->previewHeight:I

    .line 27
    .line 28
    invoke-direct {p0, p1}, Lcom/momo/mcamera/videoencoder/ProcessRender;->initPipline(Ll/jt2;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/videoencoder/ProcessRender;)Lcom/momo/mcamera/videoencoder/ProcessSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/videoencoder/ProcessRender;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->processListener:Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private initPipline(Ll/jt2;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->selectFilter:Ll/jt2;

    .line 2
    .line 3
    new-instance p1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->processParam:Lcom/momo/mcamera/videoencoder/ProcessParam;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 8
    .line 9
    invoke-direct {p1, v0, v1}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;-><init>(Lcom/momo/mcamera/videoencoder/ProcessParam;Lcom/momo/mcamera/videoencoder/ProcessSurface;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 13
    .line 14
    new-instance p1, Ll/pej;

    .line 15
    .line 16
    invoke-direct {p1}, Ll/pej;-><init>()V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->previewWidth:I

    .line 20
    .line 21
    iget v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->previewHeight:I

    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Ll/pej;->c(II)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 27
    .line 28
    iget v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->previewWidth:I

    .line 29
    .line 30
    iget v2, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->previewHeight:I

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->setRenderSize(II)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->selectFilter:Ll/jt2;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/zej;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/zej;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->screenEndpoint:Ll/zej;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->selectFilter:Ll/jt2;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ll/pej;->b(Ll/wej;)V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->pipeline:Ll/pej;

    .line 60
    .line 61
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 62
    .line 63
    new-instance v0, Lcom/momo/mcamera/videoencoder/ProcessRender$1;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Lcom/momo/mcamera/videoencoder/ProcessRender$1;-><init>(Lcom/momo/mcamera/videoencoder/ProcessRender;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 72
    .line 73
    new-instance v0, Lcom/momo/mcamera/videoencoder/ProcessRender$2;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Lcom/momo/mcamera/videoencoder/ProcessRender$2;-><init>(Lcom/momo/mcamera/videoencoder/ProcessRender;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->setProcessListener(Lcom/momo/mcamera/videoprocess/VideoProcessListener;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method


# virtual methods
.method public addFilterToDestory(Ll/jt2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->pipeline:Ll/pej;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/pej;->a(Ll/wej;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public checkGlError(Ljava/lang/String;)V
    .locals 0

    .line 1
    :goto_0
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    return-void
.end method

.method public createTexture()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public drawFrame(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->pipeline:Ll/pej;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pej;->h()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public drawScreenFrame()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->screenEndpoint:Ll/zej;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getCurrentBuffer()Landroid/media/MediaCodec$BufferInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->getCurrentBuffer()Landroid/media/MediaCodec$BufferInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->getSurface()Landroid/view/Surface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public release()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->stop()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->pipeline:Ll/pej;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/pej;->i()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->pipeline:Ll/pej;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/pej;->d()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->pipeline:Ll/pej;

    .line 24
    .line 25
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->destroy()V

    .line 30
    .line 31
    .line 32
    :cond_2
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->screenEndpoint:Ll/zej;

    .line 33
    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/zej;->destroy()V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->processListener:Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 40
    .line 41
    if-eqz v1, :cond_4

    .line 42
    .line 43
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->processListener:Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 44
    .line 45
    :cond_4
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 46
    .line 47
    return-void
.end method

.method public selectFilter(Ll/jt2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->selectFilter:Ll/jt2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->pipeline:Ll/pej;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->selectFilter:Ll/jt2;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/pej;->a(Ll/wej;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->selectFilter:Ll/jt2;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->selectFilter:Ll/jt2;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->screenEndpoint:Ll/zej;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->setFrameRate(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setProcessListener(Lcom/momo/mcamera/videoprocess/VideoProcessListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->processListener:Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 2
    .line 3
    return-void
.end method

.method public startRender()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->pipeline:Ll/pej;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/pej;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->textureResourceInput:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->startVideoDecode()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->pipeline:Ll/pej;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/pej;->h()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public surfaceCreated()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->createTexture()Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    return-void
.end method
