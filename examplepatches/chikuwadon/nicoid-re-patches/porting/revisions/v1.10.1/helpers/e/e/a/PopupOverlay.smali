.class public final Le/e/a/PopupOverlay;
.super Ljava/lang/Object;
.source "PopupOverlay.java"


# static fields
.field private static final STRIP:Ljava/lang/String; = "popup-controls-surface"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Landroid/view/View;)V
    .registers 6

    .line 6
    const-string v0, "topmenulay"

    invoke-static {p0, v0}, Le/e/a/PopupOverlay;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/RelativeLayout;

    if-nez v1, :cond_b

    return-void

    .line 7
    :cond_b
    const-string v1, "popup-controls-surface"

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_3e

    new-instance v2, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const/high16 v1, -0x56000000

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0xa

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    check-cast v0, Landroid/widget/RelativeLayout;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le/e/a/PopupOverlay$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Le/e/a/PopupOverlay$$ExternalSyntheticLambda2;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 8
    :cond_3e
    new-instance v0, Le/e/a/PopupOverlay$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Le/e/a/PopupOverlay$$ExternalSyntheticLambda3;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    return-void
.end method

.method private static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/view/View;Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 7
    invoke-static {p0}, Le/e/a/PopupOverlay;->update(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$1(Landroid/view/View;)V
    .registers 2

    .line 8
    invoke-static {p0}, Le/e/a/PopupOverlay;->update(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Le/e/a/PopupControls193;->attach(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method private static size(Landroid/view/View;II)V
    .registers 5

    .line 10
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v1, p1, :cond_f

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v1, p2, :cond_16

    :cond_f
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_16
    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setMinimumWidth(I)V

    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_41

    check-cast p0, Landroid/widget/TextView;

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMinHeight(I)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMinWidth(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0, p1}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    int-to-float p2, p2

    const v0, 0x3eae147b    # 0.34f

    mul-float p2, p2, v0

    invoke-virtual {p0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_41
    return-void
.end method

.method private static update(Landroid/view/View;)V
    .registers 11

    .line 11
    const-string v0, "popup-modern-controls"

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_9

    return-void

    :cond_9
    const-string v1, "videoLayout"

    invoke-static {p0, v1}, Le/e/a/PopupOverlay;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string v2, "topmenulay"

    invoke-static {p0, v2}, Le/e/a/PopupOverlay;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    if-eqz v1, :cond_d3

    if-eqz v2, :cond_d3

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    if-eqz v3, :cond_d3

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v3

    if-nez v3, :cond_27

    goto/16 :goto_d3

    :cond_27
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-static {v4, v5, v3}, Le/e/a/OverlayRules;->toolbar(IIF)I

    move-result v4

    const-string v5, "popup-close"

    invoke-virtual {p0, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_5a

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v6

    int-to-float v6, v6

    const/high16 v7, 0x41200000    # 10.0f

    div-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    const/4 v7, 0x1

    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    :cond_5a
    invoke-static {v4}, Le/e/a/OverlayRules;->slot(I)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v2, v7, v7, v7, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 12
    const-string v2, "popup-controls-surface"

    invoke-virtual {p0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_77

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    iget v9, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v9, v4, :cond_77

    iput v4, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v2, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    :cond_77
    const-string v2, "commentbutton"

    const-string v8, "fullscbutton"

    const-string v9, "infobutton"

    filled-new-array {v9, v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const/4 v8, 0x0

    :goto_82
    const/4 v9, 0x3

    if-lt v8, v9, :cond_c7

    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    instance-of v2, v0, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_ad

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v8, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v8, v4, :cond_9a

    iput v4, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_9a
    check-cast v0, Landroid/widget/LinearLayout;

    :goto_9c
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-lt v7, v2, :cond_a3

    goto :goto_ad

    :cond_a3
    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2, v6, v4}, Le/e/a/PopupOverlay;->size(Landroid/view/View;II)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_9c

    .line 15
    :cond_ad
    :goto_ad
    if-eqz v5, :cond_b2

    invoke-static {v5, v6, v4}, Le/e/a/PopupOverlay;->size(Landroid/view/View;II)V

    .line 16
    :cond_b2
    const-string v0, "viewbutton"

    invoke-static {p0, v0}, Le/e/a/PopupOverlay;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-static {v1, v3}, Le/e/a/OverlayRules;->central(IF)I

    move-result v1

    invoke-static {v0, v1, v1}, Le/e/a/PopupOverlay;->size(Landroid/view/View;II)V

    invoke-static {p0}, Le/e/a/PlayerIcons;->center(Landroid/view/View;)V

    .line 17
    return-void

    .line 13
    :cond_c7
    aget-object v9, v2, v8

    invoke-static {p0, v9}, Le/e/a/PopupOverlay;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v9

    invoke-static {v9, v6, v4}, Le/e/a/PopupOverlay;->size(Landroid/view/View;II)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_82

    .line 11
    :cond_d3
    :goto_d3
    return-void
.end method
