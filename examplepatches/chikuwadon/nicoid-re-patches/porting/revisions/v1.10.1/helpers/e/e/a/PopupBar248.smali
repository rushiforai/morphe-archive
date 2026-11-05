.class public final Le/e/a/PopupBar248;
.super Ljava/lang/Object;
.source "PopupBar248.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fit(Le/e/a/PopupControls193;I)V
    .registers 8

    .line 17
    iget-object v0, p0, Le/e/a/PopupControls193;->center:Landroid/view/View;

    if-eqz v0, :cond_45

    iget-object v0, p0, Le/e/a/PopupControls193;->center:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Le/e/a/PopupControls193;->row:Landroid/widget/LinearLayout;

    if-eq v0, v1, :cond_f

    goto :goto_45

    .line 19
    :cond_f
    nop

    .line 20
    const-string v0, "prevbutton"

    const-string v1, "nextbutton"

    const-string v2, "viewbutton"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_1c
    const/4 v3, 0x3

    if-lt v1, v3, :cond_2b

    .line 21
    iget-object p0, p0, Le/e/a/PopupControls193;->center:Landroid/view/View;

    const/4 v0, 0x1

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int/2addr v0, p1

    invoke-static {p0, v0, p1}, Le/e/a/PopupControls193;->size(Landroid/view/View;II)V

    .line 22
    return-void

    .line 20
    :cond_2b
    aget-object v3, v0, v1

    iget-object v4, p0, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-static {v4, v3}, Le/e/a/PopupControls193;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_42

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_42

    invoke-static {v3, p1, p1}, Le/e/a/PopupControls193;->size(Landroid/view/View;II)V

    add-int/lit8 v2, v2, 0x1

    :cond_42
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    .line 17
    :cond_45
    :goto_45
    return-void
.end method

.method static place(Landroid/widget/LinearLayout;Landroid/widget/RelativeLayout;Landroid/view/View;Z)V
    .registers 6

    .line 8
    if-nez p2, :cond_3

    return-void

    .line 9
    :cond_3
    if-eqz p3, :cond_7

    move-object v0, p0

    goto :goto_8

    :cond_7
    move-object v0, p1

    .line 10
    :goto_8
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-ne v1, v0, :cond_f

    return-void

    .line 11
    :cond_f
    invoke-static {p2}, Le/e/a/PopupControls193;->detach(Landroid/view/View;)V

    .line 12
    if-eqz p3, :cond_1f

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p3, 0x1

    invoke-direct {p1, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 p3, 0x0

    invoke-virtual {p0, p2, p3, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_29

    .line 13
    :cond_1f
    new-instance p0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 p3, -0x1

    const/4 v0, -0x2

    invoke-direct {p0, p3, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2, p0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    :goto_29
    return-void
.end method

.method static place(Le/e/a/PopupControls193;Z)V
    .registers 4

    .line 6
    iget-object v0, p0, Le/e/a/PopupControls193;->row:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/PopupControls193;->stage:Landroid/widget/RelativeLayout;

    iget-object p0, p0, Le/e/a/PopupControls193;->center:Landroid/view/View;

    invoke-static {v0, v1, p0, p1}, Le/e/a/PopupBar248;->place(Landroid/widget/LinearLayout;Landroid/widget/RelativeLayout;Landroid/view/View;Z)V

    return-void
.end method

.method static slots(Le/e/a/PopupControls193;)I
    .registers 6

    .line 15
    const-string v0, "prevbutton"

    const-string v1, "nextbutton"

    const-string v2, "viewbutton"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_c
    const/4 v3, 0x3

    if-lt v1, v3, :cond_15

    const/4 p0, 0x1

    invoke-static {p0, v2}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0

    :cond_15
    aget-object v3, v0, v1

    iget-object v4, p0, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-static {v4, v3}, Le/e/a/PopupControls193;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_29

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-eq v3, v4, :cond_29

    add-int/lit8 v2, v2, 0x1

    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_c
.end method
