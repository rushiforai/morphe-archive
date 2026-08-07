.class public Lcom/immomo/velib/player/EffectTextureView;
.super Landroid/view/TextureView;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/velib/player/e;


# instance fields
.field a:Lcom/immomo/velib/player/d;

.field b:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/immomo/velib/player/EffectTextureView;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/immomo/velib/player/EffectTextureView;->e()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/immomo/velib/player/EffectTextureView;->b:Z

    .line 13
    invoke-direct {p0}, Lcom/immomo/velib/player/EffectTextureView;->e()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/immomo/velib/player/EffectTextureView;->b:Z

    .line 16
    invoke-direct {p0}, Lcom/immomo/velib/player/EffectTextureView;->e()V

    return-void
.end method

.method private e()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/TextureView;->setOpaque(Z)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Lcom/immomo/velib/player/EffectTextureView$a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/immomo/velib/player/EffectTextureView$a;-><init>(Lcom/immomo/velib/player/EffectTextureView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/TextureView;->isAvailable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/velib/player/EffectTextureView;->a:Lcom/immomo/velib/player/d;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    if-lez p1, :cond_0

    .line 18
    .line 19
    if-lez p2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/TextureView;->setOpaque(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/velib/player/EffectTextureView;->a:Lcom/immomo/velib/player/d;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/velib/player/EffectTextureView;->a:Lcom/immomo/velib/player/d;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {v0, p0}, Lcom/immomo/velib/player/d;->d(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/immomo/velib/player/EffectTextureView;->b:Z

    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/immomo/velib/player/EffectTextureView;->a:Lcom/immomo/velib/player/d;

    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/immomo/velib/player/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/EffectTextureView;->a:Lcom/immomo/velib/player/d;

    .line 2
    .line 3
    return-void
.end method

.method public setOnBackgroundListener(Lcom/immomo/velib/player/d$a;)V
    .locals 0

    return-void
.end method
