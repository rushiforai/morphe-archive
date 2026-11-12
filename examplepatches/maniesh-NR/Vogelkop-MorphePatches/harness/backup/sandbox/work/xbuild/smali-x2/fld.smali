.class public final Lfld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leig;


# instance fields
.field public final synthetic a:Lgld;


# direct methods
.method public constructor <init>(Lgld;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfld;->a:Lgld;

    return-void
.end method


# virtual methods
.method public final G(Lfzl;)V
    .registers 2

    iget-object p0, p0, Lfld;->a:Lgld;

    invoke-virtual {p0}, Lgld;->J0()V

    return-void
.end method

.method public final K(Lgql;I)V
    .registers 3

    iget-object p0, p0, Lfld;->a:Lgld;

    invoke-virtual {p0}, Lgld;->J0()V

    invoke-virtual {p1}, Lgql;->p()Z

    move-result p1

    if-eqz p1, :cond_35

    iget-object p1, p0, Lgld;->v:Lxbf;

    if-eqz p1, :cond_35

    iget-object p1, p1, Lxbf;->b:Ljava/lang/Object;

    check-cast p1, Ltjg;

    iget-object p1, p1, Ltjg;->k:Lokg;

    iget-object p1, p1, Lokg;->c:Llkg;

    invoke-interface {p1}, Llkg;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_35

    iget-boolean p1, p0, Lryl;->a:Z

    if-nez p1, :cond_35

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    const/4 p2, 0x0

    iput-boolean p2, p0, Lgld;->x:Z

    invoke-virtual {p0}, Lryl;->g0()V

    invoke-virtual {p1}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    move-result p0

    if-eqz p0, :cond_35

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    :cond_35
    return-void
.end method
