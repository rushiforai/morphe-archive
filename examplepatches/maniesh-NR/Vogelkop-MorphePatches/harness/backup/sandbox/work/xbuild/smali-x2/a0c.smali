.class public La0c;
.super Lbqh;
.source "SourceFile"


# instance fields
.field public s:I

.field public t:Lu85;

.field public u:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    const v0, 0x7f140f9b

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Llj;-><init>(II)V

    return-void
.end method


# virtual methods
.method public final g0()V
    .registers 5

    invoke-super {p0}, Lryl;->g0()V

    iget-object v0, p0, La0c;->t:Lu85;

    if-eqz v0, :cond_19

    new-instance v0, Lvl6;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v1

    check-cast v1, Lfp1;

    iget-object v2, p0, La0c;->t:Lu85;

    iget-object v3, p0, La0c;->u:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lvl6;-><init>(Lfp1;Lu85;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-object v0, p0, La0c;->t:Lu85;

    :cond_19
    return-void
.end method

.method public final onActivityResult(IILandroid/content/Intent;)V
    .registers 4

    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    iget p3, p0, La0c;->s:I

    if-ne p1, p3, :cond_c

    if-nez p2, :cond_c

    invoke-virtual {p0}, La0c;->g0()V

    :cond_c
    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lbqh;->r:Lkf;

    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance p2, Lzzb;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, p0, v0}, Lzzb;-><init>(La0c;Landroid/content/Context;)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget p0, p2, Lzzb;->b:I

    iget p2, p2, Lzzb;->c:I

    if-ge p0, p2, :cond_27

    return-void

    :cond_27
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    return-void
.end method
