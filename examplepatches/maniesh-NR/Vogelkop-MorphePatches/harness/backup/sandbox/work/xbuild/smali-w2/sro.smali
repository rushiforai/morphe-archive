.class public final Lsro;
.super Lyjo;
.source "SourceFile"


# instance fields
.field public e:Landroid/widget/ImageView;

.field public f:Ltqo;

.field public g:Lu6p;

.field public h:Z

.field public i:Ljava/lang/Throwable;


# virtual methods
.method public final b(Landroid/content/Context;Landroid/util/Size;Lu6p;)V
    .registers 7

    iget-object v0, p0, Lsro;->f:Ltqo;

    if-nez v0, :cond_1e

    iput-object p3, p0, Lsro;->g:Lu6p;

    new-instance p3, Ltqo;

    invoke-virtual {p0}, Lyjo;->a()Ljava/io/File;

    move-result-object v0

    new-instance v1, Lcno;

    const/4 v2, 0x5

    invoke-direct {v1, p0, v2}, Lcno;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p3, p1, v0, p2, v1}, Ltqo;-><init>(Landroid/content/Context;Ljava/io/File;Landroid/util/Size;Lcno;)V

    iput-object p3, p0, Lsro;->f:Ltqo;

    iget-object p1, p0, Lsro;->e:Landroid/widget/ImageView;

    if-eqz p1, :cond_1e

    invoke-virtual {p0, p1}, Lsro;->c(Landroid/widget/ImageView;)V

    :cond_1e
    return-void
.end method

.method public final c(Landroid/widget/ImageView;)V
    .registers 7

    invoke-virtual {p0}, Lsro;->d()V

    iput-object p1, p0, Lsro;->e:Landroid/widget/ImageView;

    iget-object v0, p0, Lsro;->f:Ltqo;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lsro;->f:Ltqo;

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_24

    iget-object v2, p1, Ltqo;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v2

    if-eqz v2, :cond_24

    sget-object v2, Lw2p;->a:La64;

    new-instance v4, Lsqo;

    invoke-direct {v4, v3, v1, p1}, Lsqo;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p1, 0x3

    invoke-static {v2, v1, v1, v4, p1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_24
    iget-object p1, p0, Lsro;->f:Ltqo;

    if-eqz p1, :cond_35

    iget-object v2, p1, Ltqo;->f:Lqt6;

    if-eqz v2, :cond_2e

    iput-boolean v0, v2, Lqt6;->b:Z

    :cond_2e
    invoke-virtual {p1}, Landroid/graphics/drawable/DrawableWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-static {p1, v0}, Lw0h;->e(Landroid/graphics/drawable/Drawable;Z)V

    :cond_35
    iget-object p1, p0, Lsro;->e:Landroid/widget/ImageView;

    if-eqz p1, :cond_48

    iget-boolean p1, p0, Lsro;->h:Z

    if-eqz p1, :cond_48

    iget-object p1, p0, Lsro;->g:Lu6p;

    if-eqz p1, :cond_46

    iget-object v0, p0, Lsro;->i:Ljava/lang/Throwable;

    invoke-virtual {p1, v0}, Lu6p;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_46
    iput-object v1, p0, Lsro;->g:Lu6p;

    :cond_48
    return-void
.end method

.method public final d()V
    .registers 4

    iget-object v0, p0, Lsro;->f:Ltqo;

    if-eqz v0, :cond_12

    iget-object v1, v0, Ltqo;->f:Lqt6;

    const/4 v2, 0x0

    if-eqz v1, :cond_b

    iput-boolean v2, v1, Lqt6;->b:Z

    :cond_b
    invoke-virtual {v0}, Landroid/graphics/drawable/DrawableWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0, v2}, Lw0h;->e(Landroid/graphics/drawable/Drawable;Z)V

    :cond_12
    iget-object v0, p0, Lsro;->e:Landroid/widget/ImageView;

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_1a
    iput-object v1, p0, Lsro;->e:Landroid/widget/ImageView;

    return-void
.end method
