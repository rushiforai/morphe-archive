.class public Lcom/core/glcore/util/GpuBenmark;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private glRenderer:Lcom/core/glcore/util/GpuBenmarkRenderer;

.field private gpuBenmarkListener:Lcom/core/glcore/util/GpuBenmarkListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000(Lcom/core/glcore/util/GpuBenmark;)Lcom/core/glcore/util/GpuBenmarkListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmark;->gpuBenmarkListener:Lcom/core/glcore/util/GpuBenmarkListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private init()V
    .locals 2

    .line 1
    new-instance v0, Lcom/core/glcore/util/GpuBenmarkRenderer;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/core/glcore/util/GpuBenmarkRenderer;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/core/glcore/util/GpuBenmark;->glRenderer:Lcom/core/glcore/util/GpuBenmarkRenderer;

    .line 7
    .line 8
    new-instance v0, Lcom/core/glcore/util/GLSurface;

    .line 9
    .line 10
    const/16 v1, 0x200

    .line 11
    .line 12
    invoke-direct {v0, v1, v1}, Lcom/core/glcore/util/GLSurface;-><init>(II)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmark;->glRenderer:Lcom/core/glcore/util/GpuBenmarkRenderer;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/core/glcore/util/GLRenderer;->addSurface(Lcom/core/glcore/util/GLSurface;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public releaseGL()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/core/glcore/util/GpuBenmark;->glRenderer:Lcom/core/glcore/util/GpuBenmarkRenderer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/core/glcore/util/GLRenderer;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/core/glcore/util/GpuBenmark;->glRenderer:Lcom/core/glcore/util/GpuBenmarkRenderer;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setGpuBenmarkListener(Lcom/core/glcore/util/GpuBenmarkListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/GpuBenmark;->gpuBenmarkListener:Lcom/core/glcore/util/GpuBenmarkListener;

    .line 2
    .line 3
    return-void
.end method

.method public startGpuBenmark()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/core/glcore/util/GpuBenmark;->init()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/core/glcore/util/GpuBenmark;->glRenderer:Lcom/core/glcore/util/GpuBenmarkRenderer;

    .line 5
    .line 6
    new-instance v1, Lcom/core/glcore/util/GpuBenmark$1;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/core/glcore/util/GpuBenmark$1;-><init>(Lcom/core/glcore/util/GpuBenmark;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/core/glcore/util/GpuBenmarkRenderer;->setGpuRenderListener(Lcom/core/glcore/util/GpuRenderListener;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/core/glcore/util/GpuBenmark;->glRenderer:Lcom/core/glcore/util/GpuBenmarkRenderer;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/core/glcore/util/GLRenderer;->startRender()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmark;->glRenderer:Lcom/core/glcore/util/GpuBenmarkRenderer;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/core/glcore/util/GLRenderer;->requestRender()V

    .line 22
    .line 23
    .line 24
    return-void
.end method
