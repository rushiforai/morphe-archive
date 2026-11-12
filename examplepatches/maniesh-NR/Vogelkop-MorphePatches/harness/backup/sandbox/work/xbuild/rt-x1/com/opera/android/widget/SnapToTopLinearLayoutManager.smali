.class public Lcom/opera/android/widget/SnapToTopLinearLayoutManager;
.super Landroidx/recyclerview/widget/LinearLayoutManager;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public D(Landroidx/recyclerview/widget/RecyclerView;)Lqrj;
    .registers 2

    new-instance p0, Lqrj;

    invoke-direct {p0, p1}, Lqrj;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    return-object p0
.end method

.method public final smoothScrollToPosition(Landroidx/recyclerview/widget/RecyclerView;Lvph;I)V
    .registers 4

    invoke-virtual {p0, p1}, Lcom/opera/android/widget/SnapToTopLinearLayoutManager;->D(Landroidx/recyclerview/widget/RecyclerView;)Lqrj;

    move-result-object p1

    invoke-virtual {p1, p3}, Luph;->setTargetPosition(I)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/f;->startSmoothScroll(Luph;)V

    return-void
.end method
