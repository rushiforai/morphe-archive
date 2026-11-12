.class public Lcom/opera/android/custom_views/RecyclerViewForScreenshot;
.super Lcom/opera/android/theme/ThemeableRecyclerView;
.source "SourceFile"


# instance fields
.field public G0:Landroidx/recyclerview/widget/e;

.field public H0:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/opera/android/theme/ThemeableRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    iput-object p1, p0, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->G0:Landroidx/recyclerview/widget/e;

    return-void
.end method


# virtual methods
.method public final B0(Landroidx/recyclerview/widget/e;)V
    .registers 3

    iput-object p1, p0, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->G0:Landroidx/recyclerview/widget/e;

    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->s:Z

    if-eqz v0, :cond_a

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    return-void

    :cond_a
    if-nez p1, :cond_10

    const/4 p1, 0x0

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    :cond_10
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->H0:Z

    if-eqz v0, :cond_10

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->H0:Z

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    :cond_10
    iget-object v0, p0, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->G0:Landroidx/recyclerview/widget/e;

    invoke-super {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->onAttachedToWindow()V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->onDetachedFromWindow()V

    const/4 v0, 0x0

    invoke-super {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    return-void
.end method

.method public onMeasure(II)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->onMeasure(II)V

    iget-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->s:Z

    if-nez p1, :cond_a

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->H0:Z

    :cond_a
    return-void
.end method
