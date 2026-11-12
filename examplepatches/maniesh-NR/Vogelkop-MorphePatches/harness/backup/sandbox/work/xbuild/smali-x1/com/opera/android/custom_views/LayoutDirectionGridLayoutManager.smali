.class public Lcom/opera/android/custom_views/LayoutDirectionGridLayoutManager;
.super Landroidx/recyclerview/widget/GridLayoutManager;
.source "SourceFile"


# instance fields
.field public final m:Lcom/opera/android/custom_views/FadingRecyclerView;


# direct methods
.method public constructor <init>(Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 4

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 v0, 0x6

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(II)V

    iput-object p1, p0, Lcom/opera/android/custom_views/LayoutDirectionGridLayoutManager;->m:Lcom/opera/android/custom_views/FadingRecyclerView;

    return-void
.end method


# virtual methods
.method public final getExtraLayoutSpace(Lvph;)I
    .registers 2

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->getExtraLayoutSpace(Lvph;)I

    move-result p0

    const/4 p1, 0x0

    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public final getLayoutDirection()I
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/LayoutDirectionGridLayoutManager;->m:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {p0}, Lcs5;->L(Landroid/view/View;)I

    move-result p0

    return p0
.end method

.method public final scrollToPosition(I)V
    .registers 3

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    return-void
.end method
