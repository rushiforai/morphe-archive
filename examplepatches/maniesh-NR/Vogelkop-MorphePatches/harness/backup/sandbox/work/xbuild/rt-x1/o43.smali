.class public abstract Lo43;
.super Llx8;
.source "SourceFile"

# interfaces
.implements Lrjm;
.implements Ly9n;
.implements Lcr;


# instance fields
.field public final d:Landroid/view/ViewGroup;

.field public final e:Ldr;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    const v0, 0x7f0a0430

    .line 27
    invoke-direct {p0, p1, v0}, Lo43;-><init>(Landroid/view/View;I)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;I)V
    .registers 4

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/view/ViewGroup;

    iput-object p2, p0, Lo43;->d:Landroid/view/ViewGroup;

    new-instance p2, Ldr;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1, p0}, Ldr;-><init>(Landroid/content/Context;Lo43;)V

    iput-object p2, p0, Lo43;->e:Ldr;

    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;II)V
    .registers 4

    iget-object p0, p0, Lo43;->e:Ldr;

    invoke-virtual {p0, p1, p2, p3}, Ldr;->T(Landroid/view/View;II)V

    return-void
.end method

.method public final U()I
    .registers 1

    const/4 p0, -0x1

    return p0
.end method

.method public V(Lja2;Z)V
    .registers 4

    if-nez p2, :cond_1a

    iget-object p0, p0, Lo43;->e:Ldr;

    iget-object p1, p0, Ldr;->a:Lan;

    iget-object p2, p1, Lan;->a:Lh7f;

    invoke-virtual {p2, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_16

    iget-boolean p1, p1, Lan;->b:Z

    if-eqz p1, :cond_16

    invoke-virtual {p0, v0}, Ldr;->d(Z)V

    :cond_16
    iget-boolean p1, p0, Ldr;->f:Z

    if-ne p1, v0, :cond_1b

    :cond_1a
    return-void

    :cond_1b
    new-instance p1, Lar;

    const/4 p2, 0x0

    invoke-direct {p1, p0, v0, p2}, Lar;-><init>(Ldr;ZB)V

    invoke-virtual {p0, p1}, Ldr;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public Y()V
    .registers 4

    iget-object p0, p0, Lo43;->e:Ldr;

    iget-boolean v0, p0, Ldr;->f:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    new-instance v0, Lar;

    invoke-direct {v0, p0, v1, v1}, Lar;-><init>(Ldr;ZB)V

    invoke-virtual {p0, v0}, Ldr;->a(Ljava/lang/Runnable;)V

    :cond_f
    iget-object v0, p0, Ldr;->a:Lan;

    iget-object v2, v0, Lan;->a:Lh7f;

    invoke-virtual {v2, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    iget-boolean v0, v0, Lan;->b:Z

    if-eqz v0, :cond_20

    invoke-virtual {p0, v1}, Ldr;->d(Z)V

    :cond_20
    return-void
.end method

.method public final b(Lsjm;)V
    .registers 5

    invoke-virtual {p0}, Lo43;->Z()Lmq;

    move-result-object v0

    invoke-virtual {p1}, Lsjm;->a()Z

    move-result v1

    iget-boolean v2, v0, Lmq;->o:Z

    if-eq v2, v1, :cond_19

    iput-boolean v1, v0, Lmq;->o:Z

    iget-object v2, v0, Lmq;->k:Lk8;

    if-eqz v1, :cond_16

    invoke-virtual {v2, v0}, Lk8;->d0(Lmq;)V

    goto :goto_19

    :cond_16
    invoke-virtual {v2, v0}, Lk8;->f0(Lmq;)V

    :cond_19
    :goto_19
    iget-object p0, p0, Lo43;->e:Ldr;

    invoke-virtual {p0, p1}, Ldr;->b(Lsjm;)V

    return-void
.end method

.method public e0()Lmq;
    .registers 1

    iget-object p0, p0, Lab2;->b:Lja2;

    check-cast p0, Lmq;

    return-object p0
.end method

.method public i(Z)V
    .registers 2

    return-void
.end method

.method public q(Z)V
    .registers 2

    invoke-virtual {p0}, Lo43;->Z()Lmq;

    move-result-object p0

    invoke-virtual {p0, p1}, Lmq;->l(Z)V

    return-void
.end method
