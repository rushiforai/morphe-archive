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
    .param p0, "root"    # Landroid/view/View;

    .line 6
    const-string v0, "topmenulay"

    invoke-static {p0, v0}, Le/e/a/PopupOverlay;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .local v0, "menu":Landroid/view/View;
    instance-of v1, v0, Landroid/widget/RelativeLayout;

    if-nez v1, :cond_b

    return-void

    .line 7
    :cond_b
    const-string v1, "popup-controls-surface"

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_3f

    new-instance v2, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .local v2, "strip":Landroid/view/View;
    invoke-virtual {v2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const/high16 v1, -0x56000000

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .local v1, "p":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v3, 0xa

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    move-object v3, v0

    check-cast v3, Landroid/widget/RelativeLayout;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Le/e/a/PopupOverlay$0;

    invoke-direct {v3, p0}, Le/e/a/PopupOverlay$0;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v3}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 8
    .end local v1    # "p":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v2    # "strip":Landroid/view/View;
    :cond_3f
    new-instance v1, Le/e/a/PopupOverlay$1;

    invoke-direct {v1, p0}, Le/e/a/PopupOverlay$1;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    return-void
.end method

.method private static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5
    .param p0, "root"    # Landroid/view/View;
    .param p1, "name"    # Ljava/lang/String;

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$attach$0(Landroid/view/View;Landroid/view/View;IIIIIIII)V
    .registers 10
    .param p0, "root"    # Landroid/view/View;
    .param p1, "v"    # Landroid/view/View;
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I
    .param p6, "ol"    # I
    .param p7, "ot"    # I
    .param p8, "or"    # I
    .param p9, "ob"    # I

    .line 7
    invoke-static {p0}, Le/e/a/PopupOverlay;->update(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$attach$1(Landroid/view/View;)V
    .registers 1
    .param p0, "root"    # Landroid/view/View;

    .line 8
    invoke-static {p0}, Le/e/a/PopupOverlay;->update(Landroid/view/View;)V

    return-void
.end method

.method private static size(Landroid/view/View;II)V
    .registers 8
    .param p0, "v"    # Landroid/view/View;
    .param p1, "w"    # I
    .param p2, "h"    # I

    .line 10
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .local v0, "p":Landroid/view/ViewGroup$LayoutParams;
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v1, p1, :cond_f

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v1, p2, :cond_16

    :cond_f
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_16
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setMinimumWidth(I)V

    instance-of v2, p0, Landroid/widget/TextView;

    if-eqz v2, :cond_42

    move-object v2, p0

    check-cast v2, Landroid/widget/TextView;

    .local v2, "text":Landroid/widget/TextView;
    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setMinHeight(I)V

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setMinWidth(I)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v3, v3, v1}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    int-to-float v3, p2

    const v4, 0x3eae147b    # 0.34f

    mul-float v3, v3, v4

    invoke-virtual {v2, v1, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .end local v2    # "text":Landroid/widget/TextView;
    :cond_42
    return-void
.end method

.method private static update(Landroid/view/View;)V
    .registers 12
    .param p0, "root"    # Landroid/view/View;

    .line 11
    const-string v0, "videoLayout"

    invoke-static {p0, v0}, Le/e/a/PopupOverlay;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .local v0, "video":Landroid/view/View;
    const-string v1, "topmenulay"

    invoke-static {p0, v1}, Le/e/a/PopupOverlay;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    .local v1, "menu":Landroid/view/View;
    if-eqz v0, :cond_aa

    if-eqz v1, :cond_aa

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    if-eqz v2, :cond_aa

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    if-nez v2, :cond_1e

    goto/16 :goto_aa

    :cond_1e
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .local v2, "density":F
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-static {v3, v4, v2}, Le/e/a/OverlayRules;->toolbar(IIF)I

    move-result v3

    .local v3, "h":I
    invoke-static {v3}, Le/e/a/OverlayRules;->slot(I)I

    move-result v4

    .local v4, "slot":I
    const/4 v5, 0x0

    invoke-virtual {v1, v5, v5, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 12
    const-string v6, "popup-controls-surface"

    invoke-virtual {p0, v6}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v6

    .local v6, "strip":Landroid/view/View;
    if-eqz v6, :cond_51

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    .local v7, "p":Landroid/view/ViewGroup$LayoutParams;
    iget v8, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v8, v3, :cond_51

    iput v3, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v6, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    .end local v7    # "p":Landroid/view/ViewGroup$LayoutParams;
    :cond_51
    const-string v7, "commentbutton"

    const-string v8, "fullscbutton"

    const-string v9, "infobutton"

    filled-new-array {v9, v7, v8}, [Ljava/lang/String;

    move-result-object v7

    :goto_5b
    const/4 v8, 0x3

    if-ge v5, v8, :cond_6a

    aget-object v8, v7, v5

    .local v8, "name":Ljava/lang/String;
    invoke-static {p0, v8}, Le/e/a/PopupOverlay;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v9

    invoke-static {v9, v4, v3}, Le/e/a/PopupOverlay;->size(Landroid/view/View;II)V

    .end local v8    # "name":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    goto :goto_5b

    .line 14
    :cond_6a
    const-string v5, "popup-modern-controls"

    invoke-virtual {p0, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    .local v5, "row":Landroid/view/View;
    instance-of v7, v5, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_95

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    .restart local v7    # "p":Landroid/view/ViewGroup$LayoutParams;
    iget v8, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v8, v3, :cond_81

    iput v3, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v5, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_81
    move-object v8, v5

    check-cast v8, Landroid/widget/LinearLayout;

    .local v8, "group":Landroid/widget/LinearLayout;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_85
    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v10

    if-ge v9, v10, :cond_95

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    invoke-static {v10, v4, v3}, Le/e/a/PopupOverlay;->size(Landroid/view/View;II)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_85

    .line 15
    .end local v7    # "p":Landroid/view/ViewGroup$LayoutParams;
    .end local v8    # "group":Landroid/widget/LinearLayout;
    .end local v9    # "i":I
    :cond_95
    const-string v7, "viewbutton"

    invoke-static {p0, v7}, Le/e/a/PopupOverlay;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v7

    .local v7, "play":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v8

    invoke-static {v8, v2}, Le/e/a/OverlayRules;->central(IF)I

    move-result v8

    .local v8, "central":I
    invoke-static {v7, v8, v8}, Le/e/a/PopupOverlay;->size(Landroid/view/View;II)V

    invoke-static {p0}, Le/e/a/PlayerIcons;->center(Landroid/view/View;)V

    .line 16
    return-void

    .line 11
    .end local v2    # "density":F
    .end local v3    # "h":I
    .end local v4    # "slot":I
    .end local v5    # "row":Landroid/view/View;
    .end local v6    # "strip":Landroid/view/View;
    .end local v7    # "play":Landroid/view/View;
    .end local v8    # "central":I
    :cond_aa
    :goto_aa
    return-void
.end method
