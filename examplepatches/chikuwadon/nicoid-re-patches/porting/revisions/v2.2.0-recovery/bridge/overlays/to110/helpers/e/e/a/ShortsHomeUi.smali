.class final Le/e/a/ShortsHomeUi;
.super Ljava/lang/Object;
.source "ShortsHomeUi.java"


# static fields
.field private static final MORE:Ljava/lang/String; = "nicoid-shorts-more"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static addCard(Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 8

    .line 16
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    :goto_0
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 18
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2

    .line 19
    :cond_1
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/high16 v2, 0x40000000    # 2.0f

    .line 20
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setWeightSum(F)V

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 22
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->screenWidthDp:I

    add-int/lit8 v2, v2, -0x20

    mul-int/lit8 v2, v2, 0x3

    const/4 v3, 0x4

    div-int/2addr v2, v3

    const/16 v4, 0x12c

    .line 24
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/16 v4, 0xcd

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 26
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 27
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/high16 v5, 0x3f800000    # 1.0f

    .line 26
    invoke-direct {v4, v1, v2, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 28
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    .line 29
    invoke-virtual {v4, p0, p0, p0, p0}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 30
    invoke-virtual {v0, p1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static attach(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Landroid/widget/LinearLayout;)V
    .registers 8

    .line 34
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 35
    const-string v1, "nicoid-shorts-more"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 37
    const-string v1, "Load more"

    const-string/jumbo v2, "\u8f09\u5165\u66f4\u591a"

    const-string v3, "\u3055\u3089\u306b\u8aad\u307f\u8fbc\u3080"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/16 v1, 0x8

    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 39
    invoke-static {v0}, Le/e/a/UiDialogs;->secondaryButton(Landroid/widget/Button;)V

    .line 40
    invoke-static {v0}, Le/e/a/PressFeedback;->force(Landroid/view/View;)V

    .line 41
    new-instance v1, Le/e/a/ShortsHomeUi$0;

    invoke-direct {v1, p1, p2, p0}, Le/e/a/ShortsHomeUi$0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p1, -0x1

    const/4 p2, -0x2

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p3, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static bindCardMeta(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;Le/e/a/ModernShorts$Item;)V
    .registers 12

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p2, Le/e/a/ModernShorts$Item;->duration:I

    if-lez v1, :cond_0

    int-to-long v1, v1

    invoke-static {v1, v2}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/ShortsHomeUi;->metadataText(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    const/4 v2, 0x6

    invoke-static {v0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x2

    invoke-static {v0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v1, v2, v3, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v5, -0x33000000

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    int-to-float v3, v2

    invoke-virtual {v4, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v1, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x2

    const v5, 0x800035

    invoke-direct {v3, v4, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iput v2, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    invoke-virtual {p0, v1, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    iget v1, p2, Le/e/a/ModernShorts$Item;->views:I

    if-ltz v1, :cond_1

    invoke-static {}, Ljava/text/NumberFormat;->getIntegerInstance()Ljava/text/NumberFormat;

    move-result-object v2

    int-to-long v3, v1

    invoke-virtual {v2, v3, v4}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u25b7 "

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/ShortsHomeUi;->metadataText(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_1
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V
    .registers 9

    .line 43
    :try_start_0
    const-class p3, Le/e/a/ModernShorts;

    const-string v0, "loadMoreHome"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Class;

    .line 44
    const-class v2, Landroid/app/Activity;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const/4 v4, 0x2

    aput-object v2, v1, v4

    .line 43
    invoke-virtual {p3, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p3

    .line 45
    invoke-virtual {p3, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 46
    filled-new-array {p2, p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p3, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 48
    const-string p1, "nicoid-shorts"

    const-string p2, "Cannot request more recommendations"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method private static metadataText(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 4

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object v0
.end method

.method static moreStatus(Landroid/widget/TextView;Z)V
    .registers 5

    if-eqz p1, :cond_0

    .line 64
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 65
    const-string v0, "Could not load more videos"

    const-string/jumbo v1, "\u7121\u6cd5\u8f09\u5165\u66f4\u591a\u5f71\u7247"

    .line 64
    const-string/jumbo v2, "\u7d9a\u304d\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p1, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 66
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 67
    const-string v0, "No new recommendations"

    const-string/jumbo v1, "\u6c92\u6709\u65b0\u7684\u63a8\u85a6\u5f71\u7247"

    .line 66
    const-string/jumbo v2, "\u65b0\u3057\u3044\u304a\u3059\u3059\u3081\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-static {p1, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 64
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static readMeta(Le/e/a/ModernShorts$Item;Lorg/json/JSONObject;)V
    .registers 5

    const-string v0, "duration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    if-gtz v1, :cond_0

    const-string v0, "durationSeconds"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    :cond_0
    iput v1, p0, Le/e/a/ModernShorts$Item;->duration:I

    const-string v0, "count"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const/4 v1, -0x1

    if-eqz v2, :cond_1

    const-string v0, "view"

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    if-gez v1, :cond_2

    :cond_1
    const-string v0, "viewCount"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    :cond_2
    iput v1, p0, Le/e/a/ModernShorts$Item;->views:I

    return-void
.end method

.method static setupScroll(Landroid/widget/ScrollView;)V
    .registers 2

    const/4 v0, 0x1

    .line 71
    invoke-virtual {p0, v0}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    const/4 v0, 0x0

    .line 72
    invoke-virtual {p0, v0}, Landroid/widget/ScrollView;->setClipToPadding(Z)V

    return-void
.end method

.method static showMore(Landroid/widget/LinearLayout;Z)V
    .registers 3

    .line 55
    const-string v0, "nicoid-shorts-more"

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    .line 56
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method static summary(Landroid/widget/TextView;I)V
    .registers 6

    .line 60
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " \u672c\u306e\u52d5\u753b"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " videos"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v3, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, " \u90e8\u5f71\u7247"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1, v2, p1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
