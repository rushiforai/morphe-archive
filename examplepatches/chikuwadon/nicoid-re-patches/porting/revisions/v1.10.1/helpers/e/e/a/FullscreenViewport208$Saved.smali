.class final Le/e/a/FullscreenViewport208$Saved;
.super Ljava/lang/Object;
.source "FullscreenViewport208.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FullscreenViewport208;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Saved"
.end annotation


# instance fields
.field final background:Landroid/graphics/drawable/Drawable;

.field final clip:Landroid/graphics/Rect;

.field final minHeight:I

.field final minWidth:I

.field final padding:[I

.field final params:Landroid/view/ViewGroup$LayoutParams;

.field final textMinHeight:I

.field final textMinWidth:I


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 6

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    # invokes: Le/e/a/FullscreenViewport208;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    invoke-static {v0}, Le/e/a/FullscreenViewport208;->access$0(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FullscreenViewport208$Saved;->params:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    filled-new-array {v0, v1, v2, v3}, [I

    move-result-object v0

    iput-object v0, p0, Le/e/a/FullscreenViewport208$Saved;->padding:[I

    invoke-virtual {p1}, Landroid/view/View;->getClipBounds()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FullscreenViewport208$Saved;->clip:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FullscreenViewport208$Saved;->background:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/view/View;->getMinimumWidth()I

    move-result v0

    iput v0, p0, Le/e/a/FullscreenViewport208$Saved;->minWidth:I

    invoke-virtual {p1}, Landroid/view/View;->getMinimumHeight()I

    move-result v0

    iput v0, p0, Le/e/a/FullscreenViewport208$Saved;->minHeight:I

    instance-of v0, p1, Landroid/widget/TextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_48

    move-object v2, p1

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getMinWidth()I

    move-result v2

    goto :goto_49

    :cond_48
    move v2, v1

    :goto_49
    iput v2, p0, Le/e/a/FullscreenViewport208$Saved;->textMinWidth:I

    if-eqz v0, :cond_53

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getMinHeight()I

    move-result v1

    :cond_53
    iput v1, p0, Le/e/a/FullscreenViewport208$Saved;->textMinHeight:I

    return-void
.end method


# virtual methods
.method restore(Landroid/view/View;)V
    .registers 7

    .line 122
    iget-object v0, p0, Le/e/a/FullscreenViewport208$Saved;->params:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/FullscreenViewport208$Saved;->padding:[I

    const/4 v1, 0x0

    aget v1, v0, v1

    const/4 v2, 0x1

    aget v2, v0, v2

    const/4 v3, 0x2

    aget v3, v0, v3

    const/4 v4, 0x3

    aget v0, v0, v4

    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/view/View;->setPadding(IIII)V

    iget-object v0, p0, Le/e/a/FullscreenViewport208$Saved;->clip:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    iget-object v0, p0, Le/e/a/FullscreenViewport208$Saved;->background:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget v0, p0, Le/e/a/FullscreenViewport208$Saved;->minWidth:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setMinimumWidth(I)V

    iget v0, p0, Le/e/a/FullscreenViewport208$Saved;->minHeight:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setMinimumHeight(I)V

    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_3a

    check-cast p1, Landroid/widget/TextView;

    iget v0, p0, Le/e/a/FullscreenViewport208$Saved;->textMinWidth:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMinWidth(I)V

    iget v0, p0, Le/e/a/FullscreenViewport208$Saved;->textMinHeight:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMinHeight(I)V

    :cond_3a
    return-void
.end method
