.class public final Lh7o;
.super Ld7o;
.source "SourceFile"


# instance fields
.field public final k:Lxol;


# direct methods
.method public constructor <init>(Lkf;Ltsd;Ltsd;Llrk;)V
    .registers 13

    sget-object v5, Lg7o;->a:Lg7o;

    new-instance v6, Lq0n;

    const/16 v0, 0x17

    invoke-direct {v6, v0}, Lq0n;-><init>(B)V

    const v4, 0x7f0d049c

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Ld7o;-><init>(Lkf;Ltsd;Ltsd;ILkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    new-instance p0, Lxol;

    new-instance p1, Lcs;

    const/16 p2, 0x8

    invoke-direct {p1, p2}, Lcs;-><init>(B)V

    invoke-direct {p0, p1}, Lxol;-><init>(Lgyg;)V

    iput-object p0, v0, Lh7o;->k:Lxol;

    iget-object p1, v0, Ld7o;->g:La5n;

    check-cast p1, La7o;

    iget-object p1, p1, La7o;->c:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 p3, 0x0

    invoke-direct {p2, p3, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method


# virtual methods
.method public final Y()V
    .registers 2

    iget-object p0, p0, Lh7o;->k:Lxol;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lxol;->I(Lk7o;)V

    return-void
.end method

.method public final b0(La5n;Lp6o;)V
    .registers 3

    check-cast p1, La7o;

    check-cast p2, Lk7o;

    iget-object p0, p0, Lh7o;->k:Lxol;

    invoke-virtual {p0, p2}, Lxol;->I(Lk7o;)V

    return-void
.end method
