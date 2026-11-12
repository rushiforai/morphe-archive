.class public abstract Lbqh;
.super Llj;
.source "SourceFile"


# instance fields
.field public r:Lkf;


# virtual methods
.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lbqh;->r:Lkf;

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 5

    const v0, 0x7f0d031c

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz p1, :cond_2f

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance p2, Lkf;

    const/16 v0, 0x16

    invoke-direct {p2, v0, p1, p1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    iput-object p2, p0, Lbqh;->r:Lkf;

    invoke-virtual {p0}, Landroidx/fragment/app/i;->getShowsDialog()Z

    move-result p1

    if-eqz p1, :cond_2e

    iget-object p0, p0, Lbqh;->r:Lkf;

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object p1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->N0:Lm9f;

    if-eqz p1, :cond_2e

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->N0:Lm9f;

    invoke-virtual {p0}, Lcom/opera/android/custom_views/FadingRecyclerView;->requestLayout()V

    :cond_2e
    return-void

    :cond_2f
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
