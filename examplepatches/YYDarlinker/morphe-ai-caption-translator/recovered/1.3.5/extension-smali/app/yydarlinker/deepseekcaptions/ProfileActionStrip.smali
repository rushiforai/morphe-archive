.class final Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;
.super Landroid/widget/LinearLayout;
.source "ProfileActionStrip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;
    }
.end annotation


# instance fields
.field private primaryButton:Landroid/widget/Button;

.field private stackedLastMeasure:Z


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 15
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method static danger(Landroid/content/Context;)I
    .registers 3

    .line 30
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result p0

    .line 31
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    add-int/2addr v0, p0

    const/16 p0, 0x1a4

    if-le v0, p0, :cond_1a

    const p0, -0x18555c

    return p0

    :cond_1a
    const p0, -0x67bec4

    return p0
.end method

.method static icon(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;
    .registers 4

    .line 73
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;

    invoke-direct {v0, p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;-><init>(Landroid/content/Context;II)V

    return-object v0
.end method


# virtual methods
.method add(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .registers 6

    .line 18
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1, v1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->action(Landroid/content/Context;Ljava/lang/String;ZZLjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p1

    .line 20
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x2

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p2, v1, v0, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object p1
.end method

.method addPrimary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .registers 6

    .line 25
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->action(Landroid/content/Context;Ljava/lang/String;ZZLjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p1

    .line 26
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->primaryButton:Landroid/widget/Button;

    .line 27
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x2

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p2, v2, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object p1
.end method

.method protected onMeasure(II)V
    .registers 14

    .line 36
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v0

    .line 37
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    .line 39
    :goto_1b
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getChildCount()I

    move-result v5

    if-ge v3, v5, :cond_3b

    .line 40
    invoke-virtual {p0, v3}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 41
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 42
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 41
    invoke-virtual {v5, v6, v7}, Landroid/view/View;->measure(II)V

    .line 43
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    .line 45
    :cond_3b
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    if-eqz v3, :cond_55

    .line 46
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getChildCount()I

    move-result v3

    mul-int/2addr v4, v3

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getChildCount()I

    move-result v3

    const/4 v5, 0x1

    sub-int/2addr v3, v5

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    mul-int/2addr v3, v0

    add-int/2addr v4, v3

    if-le v4, v1, :cond_55

    goto :goto_56

    :cond_55
    move v5, v2

    .line 49
    :goto_56
    iget-boolean v1, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->stackedLastMeasure:Z

    if-eq v5, v1, :cond_81

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->primaryButton:Landroid/widget/Button;

    if-eqz v1, :cond_81

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getChildCount()I

    move-result v1

    const/4 v3, 0x2

    if-ne v1, v3, :cond_81

    xor-int/lit8 v1, v5, 0x1

    .line 51
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->primaryButton:Landroid/widget/Button;

    invoke-virtual {p0, v3}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->indexOfChild(Landroid/view/View;)I

    move-result v3

    if-eq v3, v1, :cond_81

    .line 52
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->primaryButton:Landroid/widget/Button;

    invoke-virtual {v3}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 53
    iget-object v4, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->primaryButton:Landroid/widget/Button;

    invoke-virtual {p0, v4}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->removeView(Landroid/view/View;)V

    .line 54
    iget-object v4, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->primaryButton:Landroid/widget/Button;

    invoke-virtual {p0, v4, v1, v3}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 57
    :cond_81
    iput-boolean v5, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->stackedLastMeasure:Z

    .line 58
    invoke-virtual {p0, v5}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->setOrientation(I)V

    move v1, v2

    .line 59
    :goto_87
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_de

    .line 60
    invoke-virtual {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v5, :cond_9b

    const/4 v4, -0x1

    goto :goto_9c

    :cond_9b
    move v4, v2

    :goto_9c
    if-eqz v5, :cond_a0

    const/4 v6, 0x0

    goto :goto_a2

    :cond_a0
    const/high16 v6, 0x3f800000    # 1.0f

    :goto_a2
    if-eqz v5, :cond_a8

    if-lez v1, :cond_a8

    move v7, v0

    goto :goto_a9

    :cond_a8
    move v7, v2

    :goto_a9
    if-nez v5, :cond_af

    if-lez v1, :cond_af

    move v8, v0

    goto :goto_b0

    :cond_af
    move v8, v2

    .line 64
    :goto_b0
    iget v9, v3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/4 v10, -0x2

    if-ne v9, v4, :cond_c9

    iget v9, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    if-ne v9, v10, :cond_c9

    iget v9, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    cmpl-float v9, v9, v6

    if-nez v9, :cond_c9

    iget v9, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    if-ne v9, v7, :cond_c9

    .line 65
    invoke-virtual {v3}, Landroid/widget/LinearLayout$LayoutParams;->getMarginStart()I

    move-result v9

    if-eq v9, v8, :cond_db

    .line 66
    :cond_c9
    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v10, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 67
    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v8}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    invoke-virtual {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_db
    add-int/lit8 v1, v1, 0x1

    goto :goto_87

    .line 70
    :cond_de
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void
.end method
