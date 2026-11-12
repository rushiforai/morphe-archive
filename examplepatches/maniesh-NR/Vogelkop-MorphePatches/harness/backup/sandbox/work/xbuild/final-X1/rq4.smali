.class public final Lrq4;
.super Lltl;
.source "SourceFile"


# instance fields
.field public final r:Lode;

.field public final s:Z

.field public t:Loq4;


# direct methods
.method public constructor <init>(Lumi;[[BZ)V
    .registers 7

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    if-eqz p3, :cond_c

    const v1, 0x7f140d7f

    goto :goto_f

    :cond_c
    const v1, 0x7f14041a

    :goto_f
    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lode;

    invoke-direct {v0}, Lekc;-><init>()V

    new-instance v1, Lfh4;

    const/4 v2, 0x3

    invoke-direct {v1, v0, p2, v2}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p1, v1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lnml;->a(Ljava/lang/Object;)Loml;

    iput-object v0, p0, Lrq4;->r:Lode;

    iput-boolean p3, p0, Lrq4;->s:Z

    return-void
.end method


# virtual methods
.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p1

    iget-object p2, p0, Lrq4;->t:Loq4;

    new-instance v0, Lnrl;

    iget-object v1, p0, Lrq4;->r:Lode;

    iget-boolean p0, p0, Lrq4;->s:Z

    invoke-direct {v0, p2, v1, p0}, Lnrl;-><init>(Loq4;Lode;Z)V

    new-instance p0, Lk9;

    const/16 p2, 0x18

    invoke-direct {p0, v0, p2}, Lk9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Loq4;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Loq4;

    move-result-object p1

    iput-object p1, p0, Lrq4;->t:Loq4;

    return-void
.end method
