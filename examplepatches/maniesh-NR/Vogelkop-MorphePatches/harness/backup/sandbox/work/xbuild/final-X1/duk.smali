.class public final Lduk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# instance fields
.field public a:Landroid/util/Size;

.field public b:Lbuk;

.field public c:Lbuk;

.field public d:La32;

.field public e:Landroid/util/Size;

.field public f:Z

.field public g:Z

.field public final synthetic h:Leuk;


# direct methods
.method public constructor <init>(Leuk;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lduk;->h:Leuk;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lduk;->f:Z

    iput-boolean p1, p0, Lduk;->g:Z

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 8

    iget-object v0, p0, Lduk;->h:Leuk;

    iget-object v1, v0, Leuk;->e:Landroid/view/SurfaceView;

    invoke-virtual {v1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    iget-boolean v2, p0, Lduk;->f:Z

    if-nez v2, :cond_42

    iget-object v2, p0, Lduk;->b:Lbuk;

    if-eqz v2, :cond_42

    iget-object v2, p0, Lduk;->a:Landroid/util/Size;

    iget-object v3, p0, Lduk;->e:Landroid/util/Size;

    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_42

    iget-object v2, p0, Lduk;->d:La32;

    iget-object v3, p0, Lduk;->b:Lbuk;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, v0, Leuk;->e:Landroid/view/SurfaceView;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v4

    new-instance v5, Lip1;

    const/16 v6, 0x8

    invoke-direct {v5, v2, v6}, Lip1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v1, v4, v5}, Lbuk;->a(Landroid/view/Surface;Ljava/util/concurrent/Executor;Lqp5;)V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lduk;->f:Z

    iput-boolean v1, v0, Ln1f;->a:Z

    invoke-virtual {v0}, Ln1f;->k()V

    return v1

    :cond_42
    const/4 p0, 0x0

    return p0
.end method

.method public final surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .registers 5

    new-instance p1, Landroid/util/Size;

    invoke-direct {p1, p3, p4}, Landroid/util/Size;-><init>(II)V

    iput-object p1, p0, Lduk;->e:Landroid/util/Size;

    invoke-virtual {p0}, Lduk;->a()Z

    return-void
.end method

.method public final surfaceCreated(Landroid/view/SurfaceHolder;)V
    .registers 3

    iget-boolean p1, p0, Lduk;->g:Z

    if-eqz p1, :cond_16

    iget-object p1, p0, Lduk;->c:Lbuk;

    if-eqz p1, :cond_16

    invoke-virtual {p1}, Lbuk;->c()Z

    iget-object p1, p1, Lbuk;->k:Ll94;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ll94;->b(Ljava/lang/Object;)Z

    iput-object v0, p0, Lduk;->c:Lbuk;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lduk;->g:Z

    :cond_16
    return-void
.end method

.method public final surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .registers 3

    iget-boolean p1, p0, Lduk;->f:Z

    iget-object v0, p0, Lduk;->b:Lbuk;

    if-eqz p1, :cond_13

    if-eqz v0, :cond_27

    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget-object p1, p0, Lduk;->b:Lbuk;

    iget-object p1, p1, Lbuk;->m:Ls0b;

    invoke-virtual {p1}, Lg07;->a()V

    goto :goto_27

    :cond_13
    if-eqz v0, :cond_27

    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget-object p1, p0, Lduk;->b:Lbuk;

    invoke-virtual {p1}, Lbuk;->c()Z

    move-result p1

    if-eqz p1, :cond_27

    iget-object p1, p0, Lduk;->d:La32;

    if-eqz p1, :cond_27

    invoke-virtual {p1}, La32;->k()V

    :cond_27
    :goto_27
    const/4 p1, 0x1

    iput-boolean p1, p0, Lduk;->g:Z

    iget-object p1, p0, Lduk;->b:Lbuk;

    if-eqz p1, :cond_30

    iput-object p1, p0, Lduk;->c:Lbuk;

    :cond_30
    const/4 p1, 0x0

    iput-boolean p1, p0, Lduk;->f:Z

    const/4 p1, 0x0

    iput-object p1, p0, Lduk;->b:Lbuk;

    iput-object p1, p0, Lduk;->d:La32;

    iput-object p1, p0, Lduk;->e:Landroid/util/Size;

    iput-object p1, p0, Lduk;->a:Landroid/util/Size;

    return-void
.end method
