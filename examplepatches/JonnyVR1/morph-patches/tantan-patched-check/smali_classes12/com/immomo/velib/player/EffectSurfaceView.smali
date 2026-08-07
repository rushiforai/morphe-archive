.class public Lcom/immomo/velib/player/EffectSurfaceView;
.super Landroid/view/SurfaceView;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/velib/player/e;


# instance fields
.field a:Lcom/immomo/velib/player/d;

.field b:Landroid/view/SurfaceHolder;

.field c:I

.field d:I

.field e:Z

.field f:Lcom/immomo/velib/player/d$a;

.field g:Landroid/view/SurfaceHolder$Callback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/immomo/velib/player/EffectSurfaceView;->e:Z

    .line 6
    .line 7
    new-instance p1, Lcom/immomo/velib/player/EffectSurfaceView$a;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lcom/immomo/velib/player/EffectSurfaceView$a;-><init>(Lcom/immomo/velib/player/EffectSurfaceView;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/immomo/velib/player/EffectSurfaceView;->g:Landroid/view/SurfaceHolder$Callback;

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/immomo/velib/player/EffectSurfaceView;->e()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/immomo/velib/player/EffectSurfaceView;->e:Z

    .line 20
    new-instance p1, Lcom/immomo/velib/player/EffectSurfaceView$a;

    invoke-direct {p1, p0}, Lcom/immomo/velib/player/EffectSurfaceView$a;-><init>(Lcom/immomo/velib/player/EffectSurfaceView;)V

    iput-object p1, p0, Lcom/immomo/velib/player/EffectSurfaceView;->g:Landroid/view/SurfaceHolder$Callback;

    .line 21
    invoke-direct {p0}, Lcom/immomo/velib/player/EffectSurfaceView;->e()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lcom/immomo/velib/player/EffectSurfaceView;->e:Z

    .line 24
    new-instance p1, Lcom/immomo/velib/player/EffectSurfaceView$a;

    invoke-direct {p1, p0}, Lcom/immomo/velib/player/EffectSurfaceView$a;-><init>(Lcom/immomo/velib/player/EffectSurfaceView;)V

    iput-object p1, p0, Lcom/immomo/velib/player/EffectSurfaceView;->g:Landroid/view/SurfaceHolder$Callback;

    .line 25
    invoke-direct {p0}, Lcom/immomo/velib/player/EffectSurfaceView;->e()V

    return-void
.end method

.method private e()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, -0x2

    .line 10
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lcom/immomo/velib/player/EffectSurfaceView;->g:Landroid/view/SurfaceHolder$Callback;

    .line 18
    .line 19
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/player/EffectSurfaceView;->c:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/velib/player/EffectSurfaceView;->d:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/immomo/velib/player/EffectSurfaceView;->b:Landroid/view/SurfaceHolder;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/velib/player/EffectSurfaceView;->a:Lcom/immomo/velib/player/d;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/immomo/velib/player/EffectSurfaceView;->b:Landroid/view/SurfaceHolder;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-interface {v0, p0}, Lcom/immomo/velib/player/d;->d(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/immomo/velib/player/EffectSurfaceView;->e:Z

    .line 16
    .line 17
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/immomo/velib/player/EffectSurfaceView;->a:Lcom/immomo/velib/player/d;

    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/immomo/velib/player/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/EffectSurfaceView;->a:Lcom/immomo/velib/player/d;

    .line 2
    .line 3
    return-void
.end method

.method public setOnBackgroundListener(Lcom/immomo/velib/player/d$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/EffectSurfaceView;->f:Lcom/immomo/velib/player/d$a;

    .line 2
    .line 3
    return-void
.end method
