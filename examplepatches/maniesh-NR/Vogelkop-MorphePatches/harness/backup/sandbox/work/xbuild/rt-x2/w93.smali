.class public final Lw93;
.super Landroidx/recyclerview/widget/LinearLayoutManager;
.source "SourceFile"


# virtual methods
.method public final smoothScrollToPosition(Landroidx/recyclerview/widget/RecyclerView;Lvph;I)V
    .registers 5

    new-instance p2, Lmxf;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v0, 0x2

    invoke-direct {p2, p0, p1, v0}, Lmxf;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    invoke-virtual {p2, p3}, Luph;->setTargetPosition(I)V

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/f;->startSmoothScroll(Luph;)V

    return-void
.end method
