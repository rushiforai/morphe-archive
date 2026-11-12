.class public Lcom/opera/android/feed/FeedHeaderContainer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:Lbn7;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f07021c

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    const v0, 0x7f070966

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/opera/android/feed/FeedHeaderContainer;->a:I

    return-void
.end method


# virtual methods
.method public final getSuggestedMinimumHeight()I
    .registers 1

    iget p0, p0, Lcom/opera/android/feed/FeedHeaderContainer;->a:I

    return p0
.end method

.method public final requestLayout()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    iget-object p0, p0, Lcom/opera/android/feed/FeedHeaderContainer;->b:Lbn7;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lbn7;->run()V

    :cond_a
    return-void
.end method
