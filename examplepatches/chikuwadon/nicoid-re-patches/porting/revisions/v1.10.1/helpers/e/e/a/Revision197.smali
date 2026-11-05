.class public final Le/e/a/Revision197;
.super Ljava/lang/Object;
.source "Revision197.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Revision197$PreviewRow;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static previewRow(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .registers 16

    .line 9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_f8

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/CheckBox;

    if-eqz v2, :cond_f8

    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v3, v3, Landroid/widget/Spinner;

    if-eqz v3, :cond_f8

    const/4 v3, 0x5

    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v3, v3, Landroid/widget/Spinner;

    if-nez v3, :cond_24

    goto/16 :goto_f8

    .line 10
    :cond_24
    new-array v3, v1, [Landroid/view/View;

    const/4 v4, 0x0

    :goto_27
    if-lt v4, v1, :cond_ee

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->removeAllViews()V

    new-instance v5, Le/e/a/Revision197$PreviewRow;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v5, p0}, Le/e/a/Revision197$PreviewRow;-><init>(Landroid/content/Context;)V

    .line 11
    invoke-virtual {v5, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/high16 p0, 0x40400000    # 3.0f

    invoke-virtual {v5, p0}, Landroid/widget/LinearLayout;->setWeightSum(F)V

    const/16 v6, 0x10

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 12
    new-array v7, v2, [Landroid/widget/LinearLayout;

    .line 13
    const/4 p0, 0x0

    :goto_45
    const/high16 v1, 0x3f800000    # 1.0f

    if-lt p0, v2, :cond_c6

    .line 14
    aget-object p0, v3, v0

    check-cast p0, Landroid/widget/CheckBox;

    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/widget/CheckBox;->setPadding(IIII)V

    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Landroid/widget/CheckBox;->setSingleLine(Z)V

    invoke-virtual {p0, v0}, Landroid/widget/CheckBox;->setMinWidth(I)V

    invoke-virtual {p0, v0}, Landroid/widget/CheckBox;->setMinimumWidth(I)V

    .line 15
    aget-object v6, v7, v0

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x1

    invoke-direct {v8, v0, v9, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, p0, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    aget-object p0, v3, v4

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    const/16 v8, 0x11

    invoke-virtual {p0, v8}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMinWidth(I)V

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMinimumWidth(I)V

    .line 17
    aget-object v6, v7, v0

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v11

    const/16 v12, 0x20

    invoke-static {v11, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v10, v11, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, p0, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    const/4 p0, 0x1

    :goto_8c
    if-lt p0, v2, :cond_8f

    .line 24
    return-object v5

    .line 19
    :cond_8f
    mul-int/lit8 v6, p0, 0x2

    aget-object v10, v3, v6

    check-cast v10, Landroid/widget/TextView;

    invoke-virtual {v10, v0, v0, v0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v10, v8}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v10, v4}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 20
    aget-object v11, v7, p0

    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-static {v14, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v13, v14, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v10, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    add-int/2addr v6, v4

    aget-object v6, v3, v6

    invoke-virtual {v6, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v6, v0}, Landroid/view/View;->setMinimumWidth(I)V

    .line 22
    aget-object v10, v7, p0

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v11, v0, v9, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v6, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    add-int/lit8 p0, p0, 0x1

    goto :goto_8c

    .line 13
    :cond_c6
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v4, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    aput-object v4, v7, p0

    aget-object v4, v7, p0

    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    aget-object v4, v7, p0

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v9

    const/16 v10, 0x30

    invoke-static {v9, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v8, v0, v9, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v4, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 p0, p0, 0x1

    goto/16 :goto_45

    .line 10
    :cond_ee
    invoke-virtual {p0, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    aput-object v5, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_27

    .line 9
    :cond_f8
    :goto_f8
    return-object p0
.end method
