.class public Lcom/momo/mcamera/mask/BasicRender;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/BasicRender$SurfaceChangedListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MomoRender"


# instance fields
.field protected mRootRender:Ll/gfj;

.field final mRunOnDraw:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field final mRunOnDrawEnd:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field protected mTailRender:Lcom/momo/mcamera/mask/NormalFilter;

.field private mTextureID:I

.field protected mrCoreParameters:Ll/tow;

.field onSurfaceChangedListener:Lcom/momo/mcamera/mask/BasicRender$SurfaceChangedListener;

.field protected pipeline:Ll/pej;

.field private previewHeight:I

.field private previewWidth:I

.field selectFilter:Ll/jt2;


# direct methods
.method public constructor <init>(Ll/tow;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, -0x3039

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mTextureID:I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mRootRender:Ll/gfj;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mTailRender:Lcom/momo/mcamera/mask/NormalFilter;

    .line 12
    .line 13
    const/16 v1, 0x160

    .line 14
    .line 15
    iput v1, p0, Lcom/momo/mcamera/mask/BasicRender;->previewWidth:I

    .line 16
    .line 17
    const/16 v1, 0x280

    .line 18
    .line 19
    iput v1, p0, Lcom/momo/mcamera/mask/BasicRender;->previewHeight:I

    .line 20
    .line 21
    iput-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->onSurfaceChangedListener:Lcom/momo/mcamera/mask/BasicRender$SurfaceChangedListener;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->mrCoreParameters:Ll/tow;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget v0, p1, Ll/tow;->e:I

    .line 28
    .line 29
    iput v0, p0, Lcom/momo/mcamera/mask/BasicRender;->previewWidth:I

    .line 30
    .line 31
    iget p1, p1, Ll/tow;->f:I

    .line 32
    .line 33
    iput p1, p0, Lcom/momo/mcamera/mask/BasicRender;->previewHeight:I

    .line 34
    .line 35
    :cond_0
    new-instance p1, Ljava/util/LinkedList;

    .line 36
    .line 37
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDraw:Ljava/util/Queue;

    .line 41
    .line 42
    new-instance p1, Ljava/util/LinkedList;

    .line 43
    .line 44
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDrawEnd:Ljava/util/Queue;

    .line 48
    .line 49
    return-void
.end method

.method private initPipline(Ll/jt2;)V
    .locals 3

    .line 1
    new-instance v0, Ll/pej;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/pej;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->pipeline:Ll/pej;

    .line 7
    .line 8
    iget v1, p0, Lcom/momo/mcamera/mask/BasicRender;->previewWidth:I

    .line 9
    .line 10
    iget v2, p0, Lcom/momo/mcamera/mask/BasicRender;->previewHeight:I

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Ll/pej;->c(II)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/BasicRender;->initInternalFilter()V

    .line 16
    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iput-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->selectFilter:Ll/jt2;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/momo/mcamera/mask/BasicRender;->mRootRender:Ll/gfj;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->selectFilter:Ll/jt2;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/momo/mcamera/mask/BasicRender;->mTailRender:Lcom/momo/mcamera/mask/NormalFilter;

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->mRootRender:Ll/gfj;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/momo/mcamera/mask/BasicRender;->mTailRender:Lcom/momo/mcamera/mask/NormalFilter;

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/BasicRender;->mRootRender:Ll/gfj;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Ll/pej;->b(Ll/wej;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ll/pej;->k()V

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public addFilterToDestroy(Ll/jt2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/BasicRender;->pipeline:Ll/pej;

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
    .locals 2

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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ": glError "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "MomoRender"

    .line 28
    .line 29
    invoke-static {v0, p0}, Lcom/core/glcore/util/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public createTexture()Landroid/graphics/SurfaceTexture;
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
    iput v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mTextureID:I

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
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/BasicRender;->checkGlError(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0x2801

    .line 24
    .line 25
    const/high16 v1, 0x46180000    # 9728.0f

    .line 26
    .line 27
    const/16 v2, 0xde1

    .line 28
    .line 29
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 30
    .line 31
    .line 32
    const/16 v0, 0x2800

    .line 33
    .line 34
    const v1, 0x46180400    # 9729.0f

    .line 35
    .line 36
    .line 37
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 38
    .line 39
    .line 40
    const/16 v0, 0x2802

    .line 41
    .line 42
    const v1, 0x812f

    .line 43
    .line 44
    .line 45
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 46
    .line 47
    .line 48
    const/16 v0, 0x2803

    .line 49
    .line 50
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 51
    .line 52
    .line 53
    const-string v0, "glTexParameter"

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/BasicRender;->checkGlError(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 59
    .line 60
    iget v1, p0, Lcom/momo/mcamera/mask/BasicRender;->mTextureID:I

    .line 61
    .line 62
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 66
    .line 67
    return-object v0
.end method

.method public drawCodecFrame()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDraw:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/BasicRender;->runAll(Ljava/util/Queue;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/BasicRender;->drawDataToCodec()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public drawDataToCodec()V
    .locals 0

    return-void
.end method

.method public drawDataToDispalay()V
    .locals 0

    return-void
.end method

.method public drawFrame(I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDraw:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/BasicRender;->runAll(Ljava/util/Queue;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/BasicRender;->drawDataToDispalay()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDrawEnd:Ljava/util/Queue;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/BasicRender;->runAll(Ljava/util/Queue;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/BasicRender;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextureId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BasicRender;->mTextureID:I

    .line 2
    .line 3
    return p0
.end method

.method public initInternalFilter()V
    .locals 0

    return-void
.end method

.method public prepare(Ll/row;Ll/jt2;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/momo/mcamera/mask/BasicRender;->initPipline(Ll/jt2;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    :catchall_0
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/BasicRender;->pipeline:Ll/pej;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/pej;->d()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->pipeline:Ll/pej;

    .line 19
    .line 20
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/BasicRender;->selectFilter:Ll/jt2;

    .line 21
    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/gfj;->destroy()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->selectFilter:Ll/jt2;

    .line 28
    .line 29
    :cond_2
    iget-object v1, p0, Lcom/momo/mcamera/mask/BasicRender;->mTailRender:Lcom/momo/mcamera/mask/NormalFilter;

    .line 30
    .line 31
    if-eqz v1, :cond_3

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/gfj;->destroy()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mTailRender:Lcom/momo/mcamera/mask/NormalFilter;

    .line 37
    .line 38
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDraw:Ljava/util/Queue;

    .line 39
    .line 40
    if-eqz v0, :cond_4

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 43
    .line 44
    .line 45
    :cond_4
    iget-object p0, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDrawEnd:Ljava/util/Queue;

    .line 46
    .line 47
    if-eqz p0, :cond_5

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Collection;->clear()V

    .line 50
    .line 51
    .line 52
    :cond_5
    return-void
.end method

.method public runAll(Ljava/util/Queue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .line 1
    monitor-enter p1

    .line 2
    :goto_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    monitor-exit p1

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public runOnDraw(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDraw:Ljava/util/Queue;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDraw:Ljava/util/Queue;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

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

.method public runOnDrawEnd(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDrawEnd:Ljava/util/Queue;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDrawEnd:Ljava/util/Queue;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

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

.method public selectFilter(Ll/jt2;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->selectFilter:Ll/jt2;

    .line 4
    .line 5
    if-eq p1, v0, :cond_3

    .line 6
    .line 7
    iget-object v1, p0, Lcom/momo/mcamera/mask/BasicRender;->mRootRender:Ll/gfj;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->pipeline:Ll/pej;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/momo/mcamera/mask/BasicRender;->selectFilter:Ll/jt2;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/pej;->a(Ll/wej;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iput-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->selectFilter:Ll/jt2;

    .line 25
    .line 26
    iget-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->mRootRender:Ll/gfj;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/gfj;->clearTarget()V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->selectFilter:Ll/jt2;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mRootRender:Ll/gfj;

    .line 34
    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Lcom/momo/mcamera/mask/BasicRender;->mTailRender:Lcom/momo/mcamera/mask/NormalFilter;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    invoke-virtual {v0, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->selectFilter:Ll/jt2;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/momo/mcamera/mask/BasicRender;->mTailRender:Lcom/momo/mcamera/mask/NormalFilter;

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    :goto_0
    return-void
.end method

.method public setOnSurfaceChangedListener(Lcom/momo/mcamera/mask/BasicRender$SurfaceChangedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/BasicRender;->onSurfaceChangedListener:Lcom/momo/mcamera/mask/BasicRender$SurfaceChangedListener;

    .line 2
    .line 3
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/BasicRender;->selectFilter:Ll/jt2;

    .line 2
    .line 3
    instance-of v0, p0, Ll/gam;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/gam;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ll/gam;->setTimeStamp(J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public surfaceCreated()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/BasicRender;->createTexture()Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    return-void
.end method

.method public updateRenderSize(Ll/erf0;ZI)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDraw:Ljava/util/Queue;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/BasicRender;->mRunOnDraw:Ljava/util/Queue;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    new-instance v0, Lcom/momo/mcamera/mask/BasicRender$1;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/momo/mcamera/mask/BasicRender$1;-><init>(Lcom/momo/mcamera/mask/BasicRender;Ll/erf0;ZI)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/BasicRender;->runOnDraw(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw p0
.end method

.method public updateSize(Ll/erf0;ZI)V
    .locals 0

    .line 1
    return-void
.end method
