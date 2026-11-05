.class public final Le/e/a/PlayerCollapse227;
.super Ljava/lang/Object;
.source "PlayerCollapse227.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Ljava/lang/Object;)V
    .registers 9

    .line 6
    const-string v0, "nicoid-player-collapse"

    :try_start_2
    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    const-string v2, "x1"

    invoke-static {p0, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    const-string v3, "a0"

    invoke-static {p0, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 7
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Landroid/view/ViewGroup;

    if-eqz v4, :cond_b1

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_2a

    goto/16 :goto_b1

    .line 8
    :cond_2a
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const-string v5, "videoLayout"

    const-string v6, "id"

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_3e

    const/4 v2, 0x0

    goto :goto_42

    :cond_3e
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    :goto_42
    instance-of v4, v2, Landroid/view/ViewGroup;

    if-nez v4, :cond_47

    return-void

    :cond_47
    check-cast v2, Landroid/view/ViewGroup;

    new-instance v4, Landroid/widget/FrameLayout;

    invoke-direct {v4, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v0}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    const-string v0, "\u4e0b\u306b\u30c9\u30e9\u30c3\u30b0\u3057\u3066\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    const-string v5, "Drag down to background playback"

    const-string v6, "\u5411\u4e0b\u62d6\u66f3\u9032\u5165\u80cc\u666f\u64ad\u653e"

    invoke-static {v1, v0, v5, v6}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 9
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v5, -0x333334

    const/4 v6, 0x2

    invoke-static {v1, v5, v6}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 10
    const/16 v5, 0x8

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 12
    instance-of v0, v2, Landroid/widget/RelativeLayout;

    const/16 v5, 0x18

    const/16 v6, 0x48

    if-eqz v0, :cond_93

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-static {v1, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v1, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v0, v6, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v5, 0xa

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v5, 0xe

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_a2

    :cond_93
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v1, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v1, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/16 v7, 0x31

    invoke-direct {v0, v6, v5, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    :goto_a2
    invoke-virtual {v2, v4, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v4}, Landroid/widget/FrameLayout;->bringToFront()V

    .line 13
    new-instance v0, Le/e/a/PlayerCollapse227$1;

    invoke-direct {v0, v1, v3, p0}, Le/e/a/PlayerCollapse227$1;-><init>(Landroid/app/Activity;Landroid/view/View;Ljava/lang/Object;)V

    invoke-virtual {v4, v0}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V
    :try_end_b0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_b0} :catch_b2

    .line 19
    goto :goto_ba

    .line 7
    :cond_b1
    :goto_b1
    return-void

    .line 19
    :catch_b2
    move-exception p0

    const-string v0, "nicoid-mini"

    const-string v1, "Cannot attach collapse handle"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_ba
    return-void
.end method
