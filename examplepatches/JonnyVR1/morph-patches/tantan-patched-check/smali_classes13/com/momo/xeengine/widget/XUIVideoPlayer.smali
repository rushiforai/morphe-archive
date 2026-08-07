.class public Lcom/momo/xeengine/widget/XUIVideoPlayer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/widget/IXUIVideoPlayer;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;
    }
.end annotation


# static fields
.field private static final SUCCESS_FLAG:Ljava/lang/String; = "success"


# instance fields
.field private enableTimeout:Z

.field private frameBuffer:Lcom/momo/xeengine/egl/GLFrameBuffer;

.field private mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

.field private final renderSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

.field private surface:Landroid/view/Surface;

.field private surfaceTexture:Landroid/graphics/SurfaceTexture;

.field private final textureMatrix:[F

.field private textureRender:Lcom/momo/xeengine/egl/OESTextureRender;

.field private videoDuration:F

.field private videoOriginTexture:I

.field private final videoSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->enableTimeout:Z

    .line 6
    .line 7
    new-instance v1, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v1, v2}, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;-><init>(Lcom/momo/xeengine/widget/XUIVideoPlayer$1;)V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 14
    .line 15
    new-instance v1, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 16
    .line 17
    invoke-direct {v1, v2}, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;-><init>(Lcom/momo/xeengine/widget/XUIVideoPlayer$1;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->renderSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoDuration:F

    .line 24
    .line 25
    const/16 v1, 0x10

    .line 26
    .line 27
    new-array v1, v1, [F

    .line 28
    .line 29
    iput-object v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->textureMatrix:[F

    .line 30
    .line 31
    new-instance v1, Lcom/momo/xeengine/egl/GLFrameBuffer;

    .line 32
    .line 33
    invoke-direct {v1, v0}, Lcom/momo/xeengine/egl/GLFrameBuffer;-><init>(Z)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->frameBuffer:Lcom/momo/xeengine/egl/GLFrameBuffer;

    .line 37
    .line 38
    invoke-direct {p0}, Lcom/momo/xeengine/widget/XUIVideoPlayer;->createTextureOES()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoOriginTexture:I

    .line 43
    .line 44
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 45
    .line 46
    iget v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoOriginTexture:I

    .line 47
    .line 48
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 52
    .line 53
    new-instance v0, Landroid/view/Surface;

    .line 54
    .line 55
    iget-object v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 56
    .line 57
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->surface:Landroid/view/Surface;

    .line 61
    .line 62
    return-void
.end method

.method private createTextureOES()I
    .locals 4

    .line 1
    const/4 p0, 0x1

    .line 2
    new-array v0, p0, [I

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 6
    .line 7
    .line 8
    aget p0, v0, v1

    .line 9
    .line 10
    const v2, 0x8d65

    .line 11
    .line 12
    .line 13
    invoke-static {v2, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 14
    .line 15
    .line 16
    const/16 p0, 0x2801

    .line 17
    .line 18
    const/16 v3, 0x2601

    .line 19
    .line 20
    invoke-static {v2, p0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x2800

    .line 24
    .line 25
    invoke-static {v2, p0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 26
    .line 27
    .line 28
    const/16 p0, 0x2802

    .line 29
    .line 30
    const v3, 0x812f

    .line 31
    .line 32
    .line 33
    invoke-static {v2, p0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 34
    .line 35
    .line 36
    const/16 p0, 0x2803

    .line 37
    .line 38
    invoke-static {v2, p0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 39
    .line 40
    .line 41
    aget p0, v0, v1

    .line 42
    .line 43
    return p0
.end method

.method private fixMatrix([F)V
    .locals 6

    .line 1
    const/16 p0, 0x10

    .line 2
    .line 3
    new-array v4, p0, [F

    .line 4
    .line 5
    fill-array-data v4, :array_0

    .line 6
    .line 7
    .line 8
    new-array v2, p0, [F

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p1, v0, v2, v0, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const/4 v5, 0x0

    .line 16
    const/4 v1, 0x0

    .line 17
    move-object v0, p1

    .line 18
    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    nop

    .line 23
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        -0x40800000    # -1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static videoWidthOfType(II)I
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x2

    .line 3
    if-eq p1, v0, :cond_1

    .line 4
    .line 5
    if-eq p1, v1, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    div-int/2addr p0, v0

    .line 12
    mul-int/2addr p0, v1

    .line 13
    return p0

    .line 14
    :cond_1
    div-int/2addr p0, v1

    .line 15
    return p0
.end method


# virtual methods
.method public getCurrentTexture()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-interface {v0}, Lcom/momo/xeengine/widget/IVideoPlayer;->isPlaying()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->renderSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 15
    .line 16
    iget v2, v0, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->width:I

    .line 17
    .line 18
    if-lez v2, :cond_2

    .line 19
    .line 20
    iget v0, v0, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->height:I

    .line 21
    .line 22
    if-lez v0, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->textureMatrix:[F

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->textureMatrix:[F

    .line 37
    .line 38
    invoke-direct {p0, v0}, Lcom/momo/xeengine/widget/XUIVideoPlayer;->fixMatrix([F)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->frameBuffer:Lcom/momo/xeengine/egl/GLFrameBuffer;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->renderSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 44
    .line 45
    iget v3, v2, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->width:I

    .line 46
    .line 47
    iget v2, v2, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->height:I

    .line 48
    .line 49
    invoke-virtual {v0, v3, v2}, Lcom/momo/xeengine/egl/GLFrameBuffer;->resize(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->frameBuffer:Lcom/momo/xeengine/egl/GLFrameBuffer;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/momo/xeengine/egl/GLFrameBuffer;->bind()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->frameBuffer:Lcom/momo/xeengine/egl/GLFrameBuffer;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/momo/xeengine/egl/GLFrameBuffer;->getWidth()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iget-object v2, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->frameBuffer:Lcom/momo/xeengine/egl/GLFrameBuffer;

    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/momo/xeengine/egl/GLFrameBuffer;->getHeight()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-static {v1, v1, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 70
    .line 71
    .line 72
    :try_start_1
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->textureRender:Lcom/momo/xeengine/egl/OESTextureRender;

    .line 73
    .line 74
    iget v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoOriginTexture:I

    .line 75
    .line 76
    iget-object v2, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->textureMatrix:[F

    .line 77
    .line 78
    invoke-virtual {v0, v1, v2}, Lcom/momo/xeengine/egl/BaseTextureRender;->draw(I[F)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 79
    .line 80
    .line 81
    :catch_0
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->frameBuffer:Lcom/momo/xeengine/egl/GLFrameBuffer;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/momo/xeengine/egl/GLFrameBuffer;->unbind()V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->frameBuffer:Lcom/momo/xeengine/egl/GLFrameBuffer;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/momo/xeengine/egl/GLFrameBuffer;->getColorTexture()I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    return p0

    .line 93
    :catch_1
    :cond_2
    return v1
.end method

.method public getCurrentTime()F
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/widget/IVideoPlayer;->getCurrentPosition()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    long-to-float p0, v0

    .line 10
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 11
    .line 12
    div-float/2addr p0, v0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public getTotalDuration()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoDuration:F

    .line 2
    .line 3
    return p0
.end method

.method public getVideoHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->renderSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 2
    .line 3
    iget p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->height:I

    .line 4
    .line 5
    return p0
.end method

.method public getVideoWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->renderSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 2
    .line 3
    iget p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->width:I

    .line 4
    .line 5
    return p0
.end method

.method public isPlaying()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/widget/IVideoPlayer;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public loadVideoAsset(Ljava/lang/String;I)Ljava/lang/String;
    .locals 6

    .line 1
    const-string v0, "Invalid video dimensions: "

    .line 2
    .line 3
    const-string v1, "Invalid video duration: "

    .line 4
    .line 5
    new-instance v2, Lcom/momo/xeengine/widget/MediaPlayerImpl;

    .line 6
    .line 7
    invoke-direct {v2}, Lcom/momo/xeengine/widget/MediaPlayerImpl;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v2, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 11
    .line 12
    :try_start_0
    invoke-interface {v2, p1}, Lcom/momo/xeengine/widget/IVideoPlayer;->setVideo(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->surface:Landroid/view/Surface;

    .line 18
    .line 19
    invoke-interface {p1, v2}, Lcom/momo/xeengine/widget/IVideoPlayer;->setSurface(Landroid/view/Surface;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 23
    .line 24
    invoke-interface {p1}, Lcom/momo/xeengine/widget/IVideoPlayer;->prepare()V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 28
    .line 29
    invoke-interface {p1}, Lcom/momo/xeengine/widget/IVideoPlayer;->getDuration()J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    long-to-float p1, v2

    .line 34
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 35
    .line 36
    div-float/2addr p1, v2

    .line 37
    iput p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoDuration:F

    .line 38
    .line 39
    float-to-double v2, p1

    .line 40
    const-wide v4, 0x3fb999999999999aL    # 0.1

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    cmpg-double p1, v2, v4

    .line 46
    .line 47
    if-gez p1, :cond_0

    .line 48
    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget p2, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoDuration:F

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :catch_0
    move-exception p1

    .line 65
    goto :goto_1

    .line 66
    :cond_0
    iget-object p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 69
    .line 70
    invoke-interface {v1}, Lcom/momo/xeengine/widget/IVideoPlayer;->getVideoWidth()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iput v1, p1, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->width:I

    .line 75
    .line 76
    iget-object p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 79
    .line 80
    invoke-interface {v1}, Lcom/momo/xeengine/widget/IVideoPlayer;->getVideoHeight()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    iput v1, p1, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->height:I

    .line 85
    .line 86
    iget-object p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 87
    .line 88
    iget v1, p1, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->width:I

    .line 89
    .line 90
    const/16 v2, 0x40

    .line 91
    .line 92
    if-lt v1, v2, :cond_2

    .line 93
    .line 94
    iget p1, p1, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->height:I

    .line 95
    .line 96
    if-ge p1, v2, :cond_1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    iget-object p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->renderSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 100
    .line 101
    invoke-static {v1, p2}, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoWidthOfType(II)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iput v0, p1, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->width:I

    .line 106
    .line 107
    iget-object p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->renderSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 108
    .line 109
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 110
    .line 111
    iget v0, v0, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->height:I

    .line 112
    .line 113
    iput v0, p1, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->height:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    new-instance p1, Lcom/momo/xeengine/egl/OESTextureRender;

    .line 116
    .line 117
    invoke-direct {p1, p2}, Lcom/momo/xeengine/egl/OESTextureRender;-><init>(I)V

    .line 118
    .line 119
    .line 120
    iput-object p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->textureRender:Lcom/momo/xeengine/egl/OESTextureRender;

    .line 121
    .line 122
    const-string p0, "success"

    .line 123
    .line 124
    return-object p0

    .line 125
    :cond_2
    :goto_0
    :try_start_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-object p2, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 131
    .line 132
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 139
    return-object p0

    .line 140
    :goto_1
    iget-object p2, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 141
    .line 142
    invoke-interface {p2}, Lcom/momo/xeengine/widget/IVideoPlayer;->release()V

    .line 143
    .line 144
    .line 145
    const/4 p2, 0x0

    .line 146
    iput-object p2, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 147
    .line 148
    new-instance p0, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    const-string p2, "Failed to load video: "

    .line 151
    .line 152
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    return-object p0
.end method

.method public pause()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/widget/IVideoPlayer;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/momo/xeengine/widget/IVideoPlayer;->pause()Z

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public play()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->enableTimeout:Z

    .line 6
    .line 7
    const-string v2, "success"

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-string v0, "\u5f00\u59cb\u64ad\u653e\u89c6\u9891 \u4e0d\u76d1\u542c\u9996\u5e27\u56de\u8c03"

    .line 12
    .line 13
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/momo/xeengine/XELogger;->debug([Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 21
    .line 22
    invoke-interface {p0}, Lcom/momo/xeengine/widget/IVideoPlayer;->quickStart()V

    .line 23
    .line 24
    .line 25
    return-object v2

    .line 26
    :cond_0
    invoke-interface {v0}, Lcom/momo/xeengine/widget/IVideoPlayer;->start()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    const-string p0, "\u5f00\u59cb\u64ad\u653e\u89c6\u9891 \u76d1\u542c\u9996\u5e27\u56de\u8c03"

    .line 33
    .line 34
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Lcom/momo/xeengine/XELogger;->debug([Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-object v2

    .line 42
    :cond_1
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 43
    .line 44
    invoke-interface {p0}, Lcom/momo/xeengine/widget/IVideoPlayer;->getErrorMessage()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_2
    const-string p0, "MediaPlayer is null"

    .line 50
    .line 51
    return-object p0
.end method

.method public release()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/momo/xeengine/widget/IVideoPlayer;->release()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 20
    .line 21
    iget v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoOriginTexture:I

    .line 22
    .line 23
    filled-new-array {v0}, [I

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v3, 0x1

    .line 28
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 29
    .line 30
    .line 31
    iput v2, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoOriginTexture:I

    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->surface:Landroid/view/Surface;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->surface:Landroid/view/Surface;

    .line 41
    .line 42
    :cond_2
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->textureRender:Lcom/momo/xeengine/egl/OESTextureRender;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/momo/xeengine/egl/BaseTextureRender;->release()V

    .line 47
    .line 48
    .line 49
    iput-object v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->textureRender:Lcom/momo/xeengine/egl/OESTextureRender;

    .line 50
    .line 51
    :cond_3
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->frameBuffer:Lcom/momo/xeengine/egl/GLFrameBuffer;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/momo/xeengine/egl/GLFrameBuffer;->release()V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->frameBuffer:Lcom/momo/xeengine/egl/GLFrameBuffer;

    .line 59
    .line 60
    :cond_4
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->set(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->renderSize:Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->set(I)V

    .line 68
    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    iput v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->videoDuration:F

    .line 72
    .line 73
    return-void
.end method

.method public resume()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/widget/IVideoPlayer;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/momo/xeengine/widget/IVideoPlayer;->start()Z

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public setEnableTimeout(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->enableTimeout:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMute(Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/xeengine/widget/IVideoPlayer;->setMute(Z)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public setVolume(F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/xeengine/widget/IVideoPlayer;->setVolume(F)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public stop()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/momo/xeengine/widget/IVideoPlayer;->isPlaying()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Lcom/momo/xeengine/widget/IVideoPlayer;->seekTo(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer;->mediaPlayer:Lcom/momo/xeengine/widget/IVideoPlayer;

    .line 18
    .line 19
    invoke-interface {p0}, Lcom/momo/xeengine/widget/IVideoPlayer;->pause()Z

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_1
    return v1
.end method
