.class public final Le/e/a/VideoInfoUi;
.super Ljava/lang/Object;
.source "VideoInfoUi.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bindStatistics(Ljava/lang/Object;Landroid/view/View;)V
    .registers 7

    invoke-static {p0, p1}, Le/e/a/VideoDetails;->bind(Ljava/lang/Object;Landroid/view/View;)V

    .line 14
    if-nez p1, :cond_6

    return-void

    .line 16
    :cond_6
    :try_start_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "i0"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Bundle;

    .line 17
    const v0, 0x7f080193

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 18
    if-eqz p1, :cond_85

    if-nez p0, :cond_24

    goto :goto_85

    .line 19
    :cond_24
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Le/e/a/VideoInfoUi$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Le/e/a/VideoInfoUi$$ExternalSyntheticLambda0;-><init>(Landroid/os/Bundle;)V

    invoke-static {v0}, Le/e/a/VideoInfoCounts;->read(Le/e/a/VideoInfoCounts$Values;)[J

    move-result-object p0

    .line 20
    const/4 v0, 0x0

    aget-wide v0, p0, v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-ltz v4, :cond_84

    const/4 v0, 0x1

    aget-wide v0, p0, v0

    cmp-long v4, v0, v2

    if-ltz v4, :cond_84

    const/4 v0, 0x3

    aget-wide v0, p0, v0

    cmp-long v4, v0, v2

    if-gez v4, :cond_48

    goto :goto_84

    .line 21
    :cond_48
    invoke-static {p1, p0}, Le/e/a/VideoCounts;->render(Landroid/widget/TextView;[J)V

    .line 23
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    .line 24
    instance-of v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_82

    .line 25
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 26
    invoke-virtual {p1}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 27
    iget v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    const/high16 v2, 0x40e00000    # 7.0f

    mul-float v2, v2, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 28
    iget v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    const/high16 v2, 0x40000000    # 2.0f

    mul-float v0, v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 29
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_82
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_6 .. :try_end_82} :catch_86

    .line 33
    :cond_82
    nop

    .line 34
    return-void

    .line 20
    :cond_84
    :goto_84
    return-void

    .line 18
    :cond_85
    :goto_85
    return-void

    .line 31
    :catch_86
    move-exception p0

    .line 32
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Unsupported video information panel"

    invoke-direct {p1, v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static captureStatistics(Lorg/json/JSONObject;Landroid/os/Bundle;)V
    .registers 10

    invoke-static {p0, p1}, Le/e/a/VideoDetails;->capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V

    invoke-static {p0, p1}, Le/e/a/VideoExtras;->capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V

    .line 38
    if-eqz p0, :cond_54

    if-nez p1, :cond_b

    goto :goto_54

    .line 39
    :cond_b
    const-string v0, "video"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 40
    if-nez p0, :cond_15

    const/4 p0, 0x0

    goto :goto_1b

    :cond_15
    const-string v0, "count"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 41
    :goto_1b
    const-string v0, "like"

    const-string v1, "mylist"

    const-string v2, "view"

    const-string v3, "comment"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    .line 42
    const-string v1, "likeCount"

    const-string v2, "mylistCount"

    const-string v3, "viewCount"

    const-string v4, "commentCount"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    .line 43
    const/4 v2, 0x0

    :goto_34
    if-eqz p0, :cond_53

    const/4 v3, 0x4

    if-ge v2, v3, :cond_53

    .line 44
    aget-object v3, v0, v2

    const-wide/16 v4, -0x1

    invoke-virtual {p0, v3, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v3

    .line 45
    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-ltz v7, :cond_50

    aget-object v5, v1, v2

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v5, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    :cond_50
    add-int/lit8 v2, v2, 0x1

    goto :goto_34

    .line 48
    :cond_53
    return-void

    .line 38
    :cond_54
    :goto_54
    return-void
.end method

.method public static hideDivider(Landroid/app/Activity;)V
    .registers 3

    .line 56
    const v0, 0x7f0801be

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 57
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-nez v0, :cond_c

    return-void

    .line 58
    :cond_c
    check-cast p0, Landroid/view/ViewGroup;

    .line 59
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-nez v0, :cond_15

    return-void

    .line 60
    :cond_15
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_26

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 64
    :cond_26
    return-void
.end method

.method public static hideRegistration(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .registers 2

    .line 51
    const-string p1, ""

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 53
    return-void
.end method
