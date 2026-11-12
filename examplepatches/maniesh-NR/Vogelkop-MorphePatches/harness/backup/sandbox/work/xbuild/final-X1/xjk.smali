.class public abstract Lxjk;
.super Llj;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Late;",
        ">",
        "Llj;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\'\u0018\u0000*\u0008\u0008\u0000\u0010\u0002*\u00020\u00012\u00020\u0003B\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "Lxjk;",
        "Late;",
        "T",
        "Llj;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-static {}, Lu7k;->e()Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    return-void
.end method


# virtual methods
.method public B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 5

    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {p0}, Lxjk;->G0()Lev5;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method

.method public abstract G0()Lev5;
.end method

.method public abstract H0()Lsse;
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lxjk;->H0()Lsse;

    move-result-object p1

    iget-object p1, p1, Lsse;->b:Lpad;

    if-nez p1, :cond_c

    const/4 p1, 0x0

    :cond_c
    iget-object p1, p1, Lpad;->b:Ljava/lang/Object;

    check-cast p1, Late;

    if-eqz p1, :cond_19

    iget-object p1, p1, Late;->b:Ljava/lang/String;

    iget-object p0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->D(Ljava/lang/CharSequence;)V

    :cond_19
    return-void
.end method
