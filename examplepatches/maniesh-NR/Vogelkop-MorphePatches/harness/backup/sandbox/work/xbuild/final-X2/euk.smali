.class public final Leuk;
.super Ln1f;
.source "SourceFile"


# instance fields
.field public e:Landroid/view/SurfaceView;

.field public final f:Lduk;


# direct methods
.method public constructor <init>(Landroid/widget/FrameLayout;Lywg;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Ln1f;-><init>(Landroid/widget/FrameLayout;Lywg;)V

    new-instance p1, Lduk;

    invoke-direct {p1, p0}, Lduk;-><init>(Leuk;)V

    iput-object p1, p0, Leuk;->f:Lduk;

    return-void
.end method


# virtual methods
.method public final c()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Leuk;->e:Landroid/view/SurfaceView;

    return-object p0
.end method

.method public final j(Lbuk;La32;)V
    .registers 8

    iget-object v0, p0, Leuk;->e:Landroid/view/SurfaceView;

    iget-object v1, p0, Ln1f;->b:Ljava/lang/Object;

    check-cast v1, Landroid/util/Size;

    iget-object v2, p1, Lbuk;->b:Landroid/util/Size;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v0, :cond_10

    if-nez v1, :cond_51

    :cond_10
    iget-object v0, p1, Lbuk;->b:Landroid/util/Size;

    iput-object v0, p0, Ln1f;->b:Ljava/lang/Object;

    iget-object v1, p0, Ln1f;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Landroid/view/SurfaceView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Leuk;->e:Landroid/view/SurfaceView;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v3, p0, Ln1f;->b:Ljava/lang/Object;

    check-cast v3, Landroid/util/Size;

    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v3

    iget-object v4, p0, Ln1f;->b:Ljava/lang/Object;

    check-cast v4, Landroid/util/Size;

    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v0, p0, Leuk;->e:Landroid/view/SurfaceView;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v0, p0, Leuk;->e:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Leuk;->f:Lduk;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    :cond_51
    iget-object v0, p0, Leuk;->e:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lqlk;

    const/16 v2, 0x9

    invoke-direct {v1, p2, v2}, Lqlk;-><init>(Ljava/lang/Object;B)V

    iget-object v2, p1, Lbuk;->l:Ll94;

    invoke-virtual {v2, v1, v0}, Ll94;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    iget-object v0, p0, Leuk;->e:Landroid/view/SurfaceView;

    new-instance v1, Ljbd;

    const/16 v2, 0x14

    invoke-direct {v1, p0, p1, p2, v2}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
