.class public final Le/e/a/ModernControls;
.super Ljava/lang/Object;


# static fields
.field public static selectedVideo:Ljava/lang/String;

.field public static speed:F


# direct methods
.method private static add(Landroid/widget/LinearLayout;Lcom/sauzask/nicoid/NicoidVideoFragment;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 11

    new-instance v0, Landroid/widget/Button;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {p4}, Le/e/a/ModernControls;->label(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextColor(I)V

    const/high16 v2, 0x41600000    # 14.0f

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextSize(F)V

    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    const/high16 v2, 0x40000000    # 2.0f

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, -0x1000000

    invoke-virtual {v0, v2, v3, v3, v4}, Landroid/widget/Button;->setShadowLayer(FFFI)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundColor(I)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setAllCaps(Z)V

    new-instance v3, Le/e/a/ModernControls$Open;

    invoke-direct {v3, p1, p4}, Le/e/a/ModernControls$Open;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;I)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42600000    # 56.0f

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v5, v1

    float-to-int v5, v5

    const/high16 v4, 0x42300000    # 44.0f

    mul-float/2addr v4, v1

    float-to-int v4, v4

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setMinimumWidth(I)V

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {p0, v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public static attach(Lcom/sauzask/nicoid/NicoidVideoFragment;)V
    .registers 9

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    if-eqz v0, :cond_41

    const v1, 0x7f0801cf

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    if-eqz v1, :cond_41

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v2, "topmenulay"

    const-string v3, "id"

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v2, v0, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_41

    check-cast v0, Landroid/widget/LinearLayout;

    const-string v2, "modern-quality"

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    if-nez v3, :cond_41

    const-string v3, "\u753b\u8cea"

    const/4 v4, 0x0

    invoke-static {v0, p0, v2, v3, v4}, Le/e/a/ModernControls;->add(Landroid/widget/LinearLayout;Lcom/sauzask/nicoid/NicoidVideoFragment;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "modern-speed"

    const-string v3, "\u901f\u5ea6"

    const/4 v4, 0x1

    invoke-static {v0, p0, v2, v3, v4}, Le/e/a/ModernControls;->add(Landroid/widget/LinearLayout;Lcom/sauzask/nicoid/NicoidVideoFragment;Ljava/lang/String;Ljava/lang/String;I)V

    :cond_41
    return-void
.end method

.method public static label(I)Ljava/lang/String;
    .registers 5

    if-nez p0, :cond_1e

    sget-object v0, Le/e/a/ModernControls;->selectedVideo:Ljava/lang/String;

    if-eqz v0, :cond_1b

    const-string v1, "([0-9]{3,4})p"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1b
    const-string v0, "\u81ea\u52d5"

    return-object v0

    :cond_1e
    sget v0, Le/e/a/ModernControls;->speed:F

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-nez v1, :cond_27

    const/high16 v0, 0x3f800000    # 1.0f

    :cond_27
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static qualityOption(I)Ljava/lang/String;
    .registers 8

    const-string v0, "\u9ad8\u753b\u8cea"

    if-eqz p0, :cond_b

    const-string v0, "\u6a19\u6e96\u753b\u8cea"

    const/4 v1, 0x1

    if-eq p0, v1, :cond_b

    const-string v0, "\u4f4e\u753b\u8cea"

    :cond_b
    sget-object v1, Le/e/a/ModernPlayback;->latestWatch:Lorg/json/JSONObject;

    if-eqz v1, :cond_57

    const-string v2, "media"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_57

    const-string v2, "domand"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_57

    const-string v2, "videos"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_57

    invoke-static {v1, p0}, Le/e/a/ModernPlayback;->pickVideo(Lorg/json/JSONArray;I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_57

    const-string v2, "([0-9]{3,4})p"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_41

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v1

    :cond_41
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\uff08"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\uff09"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_57
    return-object v0
.end method

.method public static update(Lcom/sauzask/nicoid/NicoidVideoFragment;)V
    .registers 6

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    if-eqz v0, :cond_2c

    const-string v1, "modern-quality"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Landroid/widget/Button;

    if-eqz v3, :cond_18

    check-cast v2, Landroid/widget/Button;

    const/4 v3, 0x0

    invoke-static {v3}, Le/e/a/ModernControls;->label(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_18
    const-string v1, "modern-speed"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Landroid/widget/Button;

    if-eqz v3, :cond_2c

    check-cast v2, Landroid/widget/Button;

    const/4 v3, 0x1

    invoke-static {v3}, Le/e/a/ModernControls;->label(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_2c
    return-void
.end method
