.class public Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;
.super Landroidx/fragment/app/Fragment;
.source ""


# instance fields
.field public Y:Landroid/view/View;

.field public Z:Landroid/app/Activity;

.field public a0:Le/e/a/l3/g;


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/Integer;)Landroid/widget/Button;
    .registers 5

    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;->Z:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const v1, 0x7f07005f

    invoke-static {v0, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    if-nez p2, :cond_1a

    const/16 p1, 0x13

    goto :goto_1e

    :cond_1a
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_1e
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setGravity(I)V

    const/4 p1, 0x2

    const/high16 p2, 0x41600000    # 14.0f

    invoke-virtual {v0, p1, p2}, Landroid/widget/Button;->setTextSize(IF)V

    const/high16 p1, -0x1000000

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    invoke-static {v0}, Le/e/a/DynamicTheme;->button(Landroid/widget/Button;)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x1

    const/4 v1, -0x2

    invoke-direct {p1, p2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v0}, Le/e/a/Revision201;->menuButton(Landroid/view/View;)V

    return-object v0
.end method
