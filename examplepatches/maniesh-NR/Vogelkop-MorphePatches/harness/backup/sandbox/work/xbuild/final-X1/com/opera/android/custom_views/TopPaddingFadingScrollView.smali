.class public Lcom/opera/android/custom_views/TopPaddingFadingScrollView;
.super Lcom/opera/android/custom_views/FadingScrollView;
.source "SourceFile"


# instance fields
.field public final d:Lxy4;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/FadingScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p2, Lxy4;

    invoke-direct {p2, p0, p1}, Lxy4;-><init>(Lcom/opera/android/custom_views/TopPaddingFadingScrollView;Landroid/content/Context;)V

    iput-object p2, p0, Lcom/opera/android/custom_views/TopPaddingFadingScrollView;->d:Lxy4;

    return-void
.end method


# virtual methods
.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/custom_views/TopPaddingFadingScrollView;->d:Lxy4;

    iget-object v1, v0, Lxy4;->d:Landroid/widget/FrameLayout;

    check-cast v1, Lcom/opera/android/custom_views/TopPaddingFadingScrollView;

    iget-boolean v2, v0, Lxy4;->c:Z

    if-nez v2, :cond_2e

    iget-object v2, v0, Lxy4;->e:Landroid/view/View;

    if-nez v2, :cond_15

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v0, Lxy4;->e:Landroid/view/View;

    :cond_15
    const/4 v3, 0x1

    if-eqz v2, :cond_2c

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v2

    if-nez v2, :cond_25

    invoke-virtual {v1, v3}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v1

    if-eqz v1, :cond_2c

    :cond_25
    iget-boolean v1, v0, Lxy4;->b:Z

    if-nez v1, :cond_2c

    invoke-virtual {v0, v3}, Lxy4;->a(Z)V

    :cond_2c
    iput-boolean v3, v0, Lxy4;->c:Z

    :cond_2e
    invoke-super {p0, p1}, Lcom/opera/android/custom_views/FadingScrollView;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final onSizeChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    iget-object p0, p0, Lcom/opera/android/custom_views/TopPaddingFadingScrollView;->d:Lxy4;

    iget-boolean p1, p0, Lxy4;->b:Z

    const/4 p2, 0x0

    if-eqz p1, :cond_f

    if-eqz p1, :cond_f

    invoke-virtual {p0, p2}, Lxy4;->a(Z)V

    :cond_f
    iput-boolean p2, p0, Lxy4;->c:Z

    return-void
.end method
