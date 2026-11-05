.class final Le/e/a/Ui110$Tabs;
.super Landroid/widget/LinearLayout;
.source "Ui110.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Ui110;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Tabs"
.end annotation


# instance fields
.field final bars:[Landroid/view/View;

.field final changed:Ljava/util/function/IntConsumer;

.field final labels:[Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;[Ljava/lang/String;Ljava/util/function/IntConsumer;)V
    .registers 11

    .line 9
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Le/e/a/Ui110$Tabs;->changed:Ljava/util/function/IntConsumer;

    array-length p3, p2

    new-array p3, p3, [Landroid/widget/TextView;

    iput-object p3, p0, Le/e/a/Ui110$Tabs;->labels:[Landroid/widget/TextView;

    array-length p3, p2

    new-array p3, p3, [Landroid/view/View;

    iput-object p3, p0, Le/e/a/Ui110$Tabs;->bars:[Landroid/view/View;

    const/4 p3, 0x0

    const/4 v0, 0x0

    :goto_11
    array-length v1, p2

    if-lt v0, v1, :cond_18

    invoke-virtual {p0, p3}, Le/e/a/Ui110$Tabs;->select(I)V

    return-void

    :cond_18
    invoke-static {p1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, p3, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, v1, v2}, Le/e/a/Ui110$Tabs;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    aget-object v2, p2, v0

    const/16 v3, 0xe

    invoke-static {p1, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x2c

    invoke-static {p1, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v5, -0x1

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/view/View;

    invoke-direct {v3, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, 0x2

    invoke-static {p1, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, p0, Le/e/a/Ui110$Tabs;->labels:[Landroid/widget/TextView;

    aput-object v2, v4, v0

    iget-object v2, p0, Le/e/a/Ui110$Tabs;->bars:[Landroid/view/View;

    aput-object v3, v2, v0

    new-instance v2, Le/e/a/Ui110$Tabs$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0}, Le/e/a/Ui110$Tabs$$ExternalSyntheticLambda0;-><init>(Le/e/a/Ui110$Tabs;I)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_11
.end method


# virtual methods
.method synthetic lambda$0$e-e-a-Ui110$Tabs(ILandroid/view/View;)V
    .registers 3

    .line 9
    iget-object p2, p0, Le/e/a/Ui110$Tabs;->changed:Ljava/util/function/IntConsumer;

    invoke-interface {p2, p1}, Ljava/util/function/IntConsumer;->accept(I)V

    return-void
.end method

.method select(I)V
    .registers 6

    .line 9
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    iget-object v2, p0, Le/e/a/Ui110$Tabs;->labels:[Landroid/widget/TextView;

    array-length v2, v2

    if-lt v1, v2, :cond_8

    return-void

    :cond_8
    iget-object v2, p0, Le/e/a/Ui110$Tabs;->labels:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Le/e/a/Ui110$Tabs;->getContext()Landroid/content/Context;

    move-result-object v3

    if-ne v1, p1, :cond_17

    invoke-static {v3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v3

    goto :goto_1b

    :cond_17
    invoke-static {v3}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v3

    :goto_1b
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v2, p0, Le/e/a/Ui110$Tabs;->bars:[Landroid/view/View;

    aget-object v2, v2, v1

    if-ne v1, p1, :cond_2d

    invoke-virtual {p0}, Le/e/a/Ui110$Tabs;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v3

    goto :goto_2e

    :cond_2d
    const/4 v3, 0x0

    :goto_2e
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method
