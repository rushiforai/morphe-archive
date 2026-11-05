.class final Le/e/a/FullscreenScreen203$Saved;
.super Ljava/lang/Object;
.source "FullscreenScreen203.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FullscreenScreen203;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Saved"
.end annotation


# instance fields
.field final background:Landroid/graphics/drawable/Drawable;

.field final minH:I

.field final minW:I

.field final padding:[I

.field final params:Landroid/view/ViewGroup$LayoutParams;

.field final scaleX:F

.field final scaleY:F

.field final textSize:F

.field final view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 6

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FullscreenScreen203$Saved;->view:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-static {v0}, Le/e/a/FullscreenScreen203;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FullscreenScreen203$Saved;->params:Landroid/view/ViewGroup$LayoutParams;

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

    iput-object v0, p0, Le/e/a/FullscreenScreen203$Saved;->padding:[I

    invoke-virtual {p1}, Landroid/view/View;->getMinimumWidth()I

    move-result v0

    iput v0, p0, Le/e/a/FullscreenScreen203$Saved;->minW:I

    invoke-virtual {p1}, Landroid/view/View;->getMinimumHeight()I

    move-result v0

    iput v0, p0, Le/e/a/FullscreenScreen203$Saved;->minH:I

    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_3d

    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextSize()F

    move-result v0

    goto :goto_3e

    :cond_3d
    const/4 v0, 0x0

    :goto_3e
    iput v0, p0, Le/e/a/FullscreenScreen203$Saved;->textSize:F

    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    move-result v0

    iput v0, p0, Le/e/a/FullscreenScreen203$Saved;->scaleX:F

    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    move-result v0

    iput v0, p0, Le/e/a/FullscreenScreen203$Saved;->scaleY:F

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Le/e/a/FullscreenScreen203$Saved;->background:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method restore()V
    .registers 8

    .line 46
    iget-object v0, p0, Le/e/a/FullscreenScreen203$Saved;->view:Landroid/view/View;

    iget-object v1, p0, Le/e/a/FullscreenScreen203$Saved;->params:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/FullscreenScreen203$Saved;->view:Landroid/view/View;

    iget-object v1, p0, Le/e/a/FullscreenScreen203$Saved;->padding:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    iget-object v3, p0, Le/e/a/FullscreenScreen203$Saved;->padding:[I

    const/4 v4, 0x1

    aget v3, v3, v4

    iget-object v4, p0, Le/e/a/FullscreenScreen203$Saved;->padding:[I

    const/4 v5, 0x2

    aget v4, v4, v5

    iget-object v5, p0, Le/e/a/FullscreenScreen203$Saved;->padding:[I

    const/4 v6, 0x3

    aget v5, v5, v6

    invoke-virtual {v0, v1, v3, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    iget-object v0, p0, Le/e/a/FullscreenScreen203$Saved;->view:Landroid/view/View;

    iget v1, p0, Le/e/a/FullscreenScreen203$Saved;->minW:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setMinimumWidth(I)V

    iget-object v0, p0, Le/e/a/FullscreenScreen203$Saved;->view:Landroid/view/View;

    iget v1, p0, Le/e/a/FullscreenScreen203$Saved;->minH:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setMinimumHeight(I)V

    iget-object v0, p0, Le/e/a/FullscreenScreen203$Saved;->view:Landroid/view/View;

    iget v1, p0, Le/e/a/FullscreenScreen203$Saved;->scaleX:F

    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    iget-object v0, p0, Le/e/a/FullscreenScreen203$Saved;->view:Landroid/view/View;

    iget v1, p0, Le/e/a/FullscreenScreen203$Saved;->scaleY:F

    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    iget-object v0, p0, Le/e/a/FullscreenScreen203$Saved;->view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Le/e/a/FullscreenScreen203$Glyph;

    if-eqz v0, :cond_55

    iget-object v0, p0, Le/e/a/FullscreenScreen203$Saved;->view:Landroid/view/View;

    iget-object v1, p0, Le/e/a/FullscreenScreen203$Saved;->view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Le/e/a/FullscreenScreen203$Glyph;

    iget-object v1, v1, Le/e/a/FullscreenScreen203$Glyph;->original:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_55
    iget-object v0, p0, Le/e/a/FullscreenScreen203$Saved;->view:Landroid/view/View;

    instance-of v0, v0, Landroid/widget/TextView;

    if-eqz v0, :cond_64

    iget-object v0, p0, Le/e/a/FullscreenScreen203$Saved;->view:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iget v1, p0, Le/e/a/FullscreenScreen203$Saved;->textSize:F

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_64
    return-void
.end method
