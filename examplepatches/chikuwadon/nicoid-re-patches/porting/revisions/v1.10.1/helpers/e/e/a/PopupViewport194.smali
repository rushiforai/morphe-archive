.class public final Le/e/a/PopupViewport194;
.super Ljava/lang/Object;
.source "PopupViewport194.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inset(Landroid/view/View;II)V
    .registers 6

    .line 3
    if-eqz p0, :cond_28

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/RelativeLayout$LayoutParams;

    if-nez v0, :cond_b

    goto :goto_28

    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1f

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    if-ne v1, p1, :cond_1f

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    if-ne v1, p2, :cond_1f

    return-void

    :cond_1f
    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iput p2, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_28
    :goto_28
    return-void
.end method
