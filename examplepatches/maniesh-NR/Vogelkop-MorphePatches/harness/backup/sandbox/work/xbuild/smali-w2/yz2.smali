.class public final Lyz2;
.super Lzz2;
.source "SourceFile"


# instance fields
.field public d:Lxz2;

.field public final synthetic e:Landroid/view/ViewTreeObserver;

.field public final synthetic f:Lro9;

.field public final synthetic g:Lami;


# direct methods
.method public constructor <init>(Lami;Lumi;Lro9;Landroid/view/ViewTreeObserver;Lcom/opera/android/browser/OperaPageRootView;Lro9;)V
    .registers 7

    iput-object p4, p0, Lyz2;->e:Landroid/view/ViewTreeObserver;

    iput-object p6, p0, Lyz2;->f:Lro9;

    iput-object p1, p0, Lyz2;->g:Lami;

    const/16 p1, 0x3e8

    invoke-direct {p0, p2, p1, p3}, Lzz2;-><init>(Lumi;ILro9;)V

    invoke-virtual {p4}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result p1

    if-eqz p1, :cond_1b

    new-instance p1, Lxz2;

    invoke-direct {p1, p0, p5}, Lxz2;-><init>(Lyz2;Lcom/opera/android/browser/OperaPageRootView;)V

    iput-object p1, p0, Lyz2;->d:Lxz2;

    invoke-virtual {p4, p1}, Landroid/view/ViewTreeObserver;->addOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    :cond_1b
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 4

    iget-object v0, p0, Lzz2;->c:Ljava/lang/Object;

    check-cast v0, Loml;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lzz2;->a:Z

    iget-object v0, p0, Lyz2;->d:Lxz2;

    if-eqz v0, :cond_1f

    iget-object v0, p0, Lyz2;->e:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_1c

    iget-object v1, p0, Lyz2;->d:Lxz2;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    :cond_1c
    const/4 v0, 0x0

    iput-object v0, p0, Lyz2;->d:Lxz2;

    :cond_1f
    if-eqz p1, :cond_2c

    iget-object p1, p0, Lyz2;->g:Lami;

    iget-object v0, p1, Lami;->g:Ljava/lang/Object;

    check-cast v0, Lro9;

    iget-object p0, p0, Lyz2;->f:Lro9;

    invoke-virtual {p1, v0, p0}, Lami;->x(Lro9;Lro9;)V

    :cond_2c
    return-void
.end method

.method public final b()V
    .registers 4

    iget-object v0, p0, Lyz2;->g:Lami;

    iget-object v1, v0, Lami;->g:Ljava/lang/Object;

    check-cast v1, Lro9;

    iget-object v2, p0, Lyz2;->f:Lro9;

    invoke-virtual {v0, v1, v2}, Lami;->y(Lro9;Lro9;)V

    iget-object p0, p0, Lzz2;->b:Ljava/lang/Object;

    check-cast p0, Lro9;

    invoke-virtual {v0, p0}, Lami;->t(Lro9;)V

    const/4 p0, 0x0

    iput-object p0, v0, Lami;->h:Ljava/lang/Object;

    return-void
.end method
