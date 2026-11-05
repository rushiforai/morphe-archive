.class final Le/e/a/SelectionUi191;
.super Ljava/lang/Object;
.source "SelectionUi191.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static count(Landroid/widget/TextView;I)V
    .registers 3

    .line 7
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/BulkSelection;->countText(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private static enable(Landroid/view/View;Z)V
    .registers 2

    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    if-eqz p1, :cond_8

    const/high16 p1, 0x3f800000    # 1.0f

    goto :goto_b

    :cond_8
    const p1, 0x3ec28f5c    # 0.38f

    :goto_b
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method

.method static enabled(Landroid/widget/LinearLayout;I)V
    .registers 3

    .line 8
    if-eqz p0, :cond_d

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    if-lez p1, :cond_a

    const/4 v0, 0x1

    :cond_a
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    :cond_d
    return-void
.end method

.method static footer(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;
    .registers 10

    .line 5
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v1, 0xc

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    const/4 v2, 0x4

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0, v1, v3, v1, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const-string v1, "\u524a\u9664"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Le/e/a/UiDialogs;->actionButton(Landroid/widget/Button;Z)V

    new-instance v3, Le/e/a/SelectionUi191$$ExternalSyntheticLambda5;

    invoke-direct {v3, p1}, Le/e/a/SelectionUi191$$ExternalSyntheticLambda5;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x30

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v5, -0x2

    invoke-direct {p1, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Landroid/view/View;

    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    invoke-direct {v1, v6, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string p1, "\u5b8c\u4e86"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p1

    invoke-static {p1, v6}, Le/e/a/UiDialogs;->actionButton(Landroid/widget/Button;Z)V

    invoke-static {p0}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setTextColor(I)V

    new-instance v1, Le/e/a/SelectionUi191$$ExternalSyntheticLambda6;

    invoke-direct {v1, p2}, Le/e/a/SelectionUi191$$ExternalSyntheticLambda6;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-direct {p2, v5, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v0}, Le/e/a/SelectionUi191;->insets(Landroid/view/View;)V

    return-object v0
.end method

.method static header(Landroid/widget/TextView;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;
    .registers 12

    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const-string v2, "selection-header"

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v2, 0xc

    invoke-static {v0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x30

    invoke-static {v0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, p0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p0, 0x0

    :goto_37
    const/4 v3, 0x2

    if-lt p0, v3, :cond_3b

    return-object v1

    :cond_3b
    if-nez p0, :cond_40

    const-string v3, "\u5168\u9078\u629e"

    goto :goto_42

    :cond_40
    const-string v3, "\u5168\u89e3\u9664"

    :goto_42
    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    const/16 v6, 0x11

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setGravity(I)V

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v6, 0x8

    invoke-static {v0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {v0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v3, v7, v4, v6, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    const/16 v6, 0x40

    invoke-static {v0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setMinimumWidth(I)V

    invoke-static {v0, v4, v4}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    if-nez p0, :cond_77

    move-object v6, p1

    goto :goto_78

    :cond_77
    move-object v6, p2

    :goto_78
    new-instance v7, Le/e/a/SelectionUi191$$ExternalSyntheticLambda4;

    invoke-direct {v7, v6}, Le/e/a/SelectionUi191$$ExternalSyntheticLambda4;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    invoke-static {v0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 p0, p0, 0x1

    goto :goto_37
.end method

.method static headerView(Landroid/widget/TextView;)Landroid/view/View;
    .registers 3

    .line 12
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_20

    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "selection-header"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    :cond_20
    return-object p0
.end method

.method static insets(Landroid/view/View;)V
    .registers 8

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v5

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    new-instance v6, Le/e/a/SelectionUi191$$ExternalSyntheticLambda1;

    move-object v0, v6

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Le/e/a/SelectionUi191$$ExternalSyntheticLambda1;-><init>(Landroid/view/View;IIII)V

    new-instance v0, Le/e/a/SelectionUi191$$ExternalSyntheticLambda2;

    invoke-direct {v0, v6}, Le/e/a/SelectionUi191$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    new-instance v0, Le/e/a/SelectionUi191$$ExternalSyntheticLambda3;

    invoke-direct {v0, v6}, Le/e/a/SelectionUi191$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    invoke-virtual {p0, v6}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 5
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 5
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$2(Landroid/view/View;IIII)V
    .registers 8

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    const/4 v1, 0x2

    new-array v1, v1, [I

    invoke-virtual {p0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v2, 0x1

    aget v1, v1, v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    add-int/2addr v1, v2

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v1, v0

    const/4 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/2addr p1, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    if-eq v0, p1, :cond_2f

    invoke-virtual {p0, p2, p3, p4, p1}, Landroid/view/View;->setPadding(IIII)V

    :cond_2f
    return-void
.end method

.method static synthetic lambda$3(Ljava/lang/Runnable;Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 6
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$4(Ljava/lang/Runnable;Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .registers 3

    .line 6
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-object p2
.end method

.method static synthetic lambda$5(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 9
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$6(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 2

    .line 13
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static menu(Landroid/view/Menu;Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .registers 5

    .line 13
    if-eqz p4, :cond_14

    const-string p1, "\u79fb\u52d5"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p0

    new-instance p1, Le/e/a/SelectionUi191$$ExternalSyntheticLambda0;

    invoke-direct {p1, p4}, Le/e/a/SelectionUi191$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    :cond_14
    return-void
.end method

.method static selection(Landroid/widget/TextView;II)V
    .registers 6

    .line 10
    invoke-static {p0, p1}, Le/e/a/SelectionUi191;->count(Landroid/widget/TextView;I)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_3a

    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    const-string v0, "selection-header"

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    return-void

    :cond_1e
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    if-lez p2, :cond_2a

    if-ge p1, p2, :cond_2a

    const/4 p2, 0x1

    goto :goto_2b

    :cond_2a
    const/4 p2, 0x0

    :goto_2b
    invoke-static {v1, p2}, Le/e/a/SelectionUi191;->enable(Landroid/view/View;Z)V

    const/4 p2, 0x2

    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    if-lez p1, :cond_36

    goto :goto_37

    :cond_36
    const/4 v0, 0x0

    :goto_37
    invoke-static {p0, v0}, Le/e/a/SelectionUi191;->enable(Landroid/view/View;Z)V

    :cond_3a
    return-void
.end method
