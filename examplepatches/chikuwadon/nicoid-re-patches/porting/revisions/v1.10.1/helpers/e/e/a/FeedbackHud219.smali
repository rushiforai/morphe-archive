.class public final Le/e/a/FeedbackHud219;
.super Ljava/lang/Object;
.source "FeedbackHud219.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FeedbackHud219$Notice;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static foreground:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static shown:Le/e/a/FeedbackHud219$Notice;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 14
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/FeedbackHud219;->MAIN:Landroid/os/Handler;

    .line 15
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/FeedbackHud219;->foreground:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Landroid/os/Handler;
    .registers 1

    .line 14
    sget-object v0, Le/e/a/FeedbackHud219;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1()Le/e/a/FeedbackHud219$Notice;
    .registers 1

    .line 16
    sget-object v0, Le/e/a/FeedbackHud219;->shown:Le/e/a/FeedbackHud219$Notice;

    return-object v0
.end method

.method static synthetic access$2(Le/e/a/FeedbackHud219$Notice;)V
    .registers 1

    .line 16
    sput-object p0, Le/e/a/FeedbackHud219;->shown:Le/e/a/FeedbackHud219$Notice;

    return-void
.end method

.method static activity(Landroid/content/Context;)Landroid/app/Activity;
    .registers 3

    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x8

    if-ge v0, v1, :cond_22

    if-nez p0, :cond_8

    goto :goto_22

    .line 51
    :cond_8
    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_f

    check-cast p0, Landroid/app/Activity;

    return-object p0

    :cond_f
    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_14

    goto :goto_22

    :cond_14
    move-object v1, p0

    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    if-ne v1, p0, :cond_1e

    goto :goto_22

    :cond_1e
    add-int/lit8 v0, v0, 0x1

    move-object p0, v1

    goto :goto_1

    :cond_22
    :goto_22
    sget-object p0, Le/e/a/FeedbackHud219;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    return-object p0
.end method

.method static bounds(Landroid/view/View;Landroid/graphics/Rect;)Z
    .registers 4

    const/4 v0, 0x0

    if-eqz p0, :cond_24

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v1

    if-eqz v1, :cond_24

    invoke-virtual {p0, p1}, Landroid/view/View;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v1

    if-nez v1, :cond_10

    goto :goto_24

    :cond_10
    const/4 v1, 0x2

    new-array v1, v1, [I

    invoke-virtual {p0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    aget p0, v1, v0

    const/4 v0, 0x1

    aget v1, v1, v0

    invoke-virtual {p1, p0, v1}, Landroid/graphics/Rect;->offset(II)V

    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v0

    return p0

    :cond_24
    :goto_24
    return v0
.end method

.method public static clear(Landroid/content/Context;)V
    .registers 3

    .line 50
    sget-object v0, Le/e/a/FeedbackHud219;->shown:Le/e/a/FeedbackHud219$Notice;

    const/4 v1, 0x0

    if-eqz v0, :cond_16

    iget-object v0, v0, Le/e/a/FeedbackHud219$Notice;->context:Landroid/content/Context;

    if-eq v0, p0, :cond_f

    sget-object v0, Le/e/a/FeedbackHud219;->shown:Le/e/a/FeedbackHud219$Notice;

    iget-object v0, v0, Le/e/a/FeedbackHud219$Notice;->activity:Landroid/app/Activity;

    if-ne v0, p0, :cond_16

    :cond_f
    sget-object v0, Le/e/a/FeedbackHud219;->shown:Le/e/a/FeedbackHud219$Notice;

    invoke-virtual {v0}, Le/e/a/FeedbackHud219$Notice;->cancel()V

    sput-object v1, Le/e/a/FeedbackHud219;->shown:Le/e/a/FeedbackHud219$Notice;

    :cond_16
    sget-object v0, Le/e/a/FeedbackHud219;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_25

    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p0, Le/e/a/FeedbackHud219;->foreground:Ljava/lang/ref/WeakReference;

    :cond_25
    return-void
.end method

.method static controlsBottom(Landroid/view/View;Landroid/graphics/Rect;)I
    .registers 8

    if-eqz p0, :cond_75

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_75

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    const v1, 0x3d4ccccd    # 0.05f

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_14

    goto :goto_75

    :cond_14
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-static {p0, v0}, Le/e/a/FeedbackHud219;->bounds(Landroid/view/View;Landroid/graphics/Rect;)Z

    move-result v1

    if-eqz v1, :cond_72

    invoke-static {v0, p1}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v1

    if-nez v1, :cond_26

    goto :goto_72

    .line 31
    :cond_26
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 32
    iget v2, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iget v3, p1, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    const v5, 0x3eb33333    # 0.35f

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_54

    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    iget v3, p1, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    const v5, 0x3f0ccccd    # 0.55f

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_54

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 33
    :cond_54
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_71

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_5b
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v0, v2, :cond_62

    goto :goto_71

    :cond_62
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2, p1}, Le/e/a/FeedbackHud219;->controlsBottom(Landroid/view/View;Landroid/graphics/Rect;)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_5b

    :cond_71
    :goto_71
    return v1

    .line 30
    :cond_72
    :goto_72
    iget p0, p1, Landroid/graphics/Rect;->top:I

    return p0

    :cond_75
    :goto_75
    iget p0, p1, Landroid/graphics/Rect;->top:I

    return p0
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_19

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    goto :goto_1d

    :cond_19
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    :goto_1d
    return-object p0
.end method

.method public static foreground(Landroid/app/Activity;)V
    .registers 2

    .line 18
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/FeedbackHud219;->foreground:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static indicator(Landroid/content/Context;F)Landroid/widget/TextView;
    .registers 2

    .line 19
    invoke-static {p1}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/FeedbackHud219;->label(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method public static label(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/TextView;
    .registers 7

    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 22
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p0, -0x1

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 p0, 0x41800000    # 16.0f

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 23
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 p1, 0x0

    invoke-virtual {v1, p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const/16 p0, 0x11

    .line 24
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    const/high16 p0, 0x41900000    # 18.0f

    mul-float p0, p0, v0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result v2

    const/high16 v3, 0x41000000    # 8.0f

    mul-float v3, v3, v0

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {v1, v2, v4, p0, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    const/high16 p0, 0x42980000    # 76.0f

    mul-float p0, p0, v0

    .line 25
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setMinimumWidth(I)V

    const/high16 p0, 0x42100000    # 36.0f

    mul-float p0, p0, v0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setMinimumHeight(I)V

    const/4 p0, 0x4

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setElevation(F)V

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setClickable(Z)V

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 26
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/high16 p1, -0x4d000000

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 p1, 0x42c80000    # 100.0f

    mul-float v0, v0, p1

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-object v1
.end method

.method public static makeText(Landroid/content/Context;II)Landroid/widget/Toast;
    .registers 3

    .line 48
    invoke-virtual {p0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p0, p1, p2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    .registers 4

    .line 49
    new-instance v0, Le/e/a/FeedbackHud219$Notice;

    invoke-direct {v0, p0, p1, p2}, Le/e/a/FeedbackHud219$Notice;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    return-object v0
.end method

.method public static popupPosition(Ljava/lang/Object;)V
    .registers 4

    .line 47
    :try_start_0
    const-string v0, "root"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const-string v1, "video"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    const-string v2, "hud"

    invoke-static {p0, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-eqz p0, :cond_26

    invoke-static {v0, v1, p0}, Le/e/a/FeedbackHud219;->position(Landroid/view/ViewGroup;Landroid/view/View;Landroid/widget/TextView;)V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1d} :catch_1e

    goto :goto_26

    :catch_1e
    move-exception p0

    const-string v0, "nicoid-feedback"

    const-string v1, "Cannot place feedback"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_26
    :goto_26
    return-void
.end method

.method public static position(Landroid/view/ViewGroup;Landroid/view/View;Landroid/widget/TextView;)V
    .registers 14

    .line 36
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-static {p1, v0}, Le/e/a/FeedbackHud219;->bounds(Landroid/view/View;Landroid/graphics/Rect;)Z

    move-result p1

    if-nez p1, :cond_10

    const/4 p0, 0x4

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setVisibility(I)V

    return-void

    :cond_10
    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 37
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/4 v2, 0x2

    new-array v3, v2, [I

    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 38
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v4

    const/high16 v5, 0x41800000    # 16.0f

    mul-float v5, v5, v1

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    sub-int/2addr v4, v5

    const/4 v5, 0x1

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setMaxWidth(I)V

    const/high16 v6, -0x80000000

    .line 39
    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v7

    invoke-static {v7, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    invoke-virtual {p2, v4, v6}, Landroid/widget/TextView;->measure(II)V

    .line 40
    invoke-virtual {p2}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v4

    invoke-virtual {p2}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v6

    invoke-virtual {p2, p1, p1, v4, v6}, Landroid/widget/TextView;->layout(IIII)V

    .line 42
    iget v7, v0, Landroid/graphics/Rect;->bottom:I

    iget v8, v0, Landroid/graphics/Rect;->top:I

    const/high16 v9, 0x42400000    # 48.0f

    mul-float v9, v9, v1

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    add-int/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 43
    const-string v8, "topmenulay"

    const-string v9, "titlebar"

    filled-new-array {v8, v9}, [Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    :goto_6f
    if-lt v9, v2, :cond_a2

    int-to-float p0, v7

    const/high16 v2, 0x41000000    # 8.0f

    mul-float v1, v1, v2

    add-float/2addr p0, v1

    .line 44
    iget v2, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iget v7, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v7, v6

    int-to-float v6, v7

    sub-float/2addr v6, v1

    invoke-static {v2, v6}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {p0, v1}, Ljava/lang/Math;->min(FF)F

    move-result p0

    .line 45
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v0

    aget p1, v3, p1

    int-to-float p1, p1

    sub-float/2addr v0, p1

    int-to-float p1, v4

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr p1, v1

    sub-float/2addr v0, p1

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setX(F)V

    aget p1, v3, v5

    int-to-float p1, p1

    sub-float/2addr p0, p1

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setY(F)V

    invoke-virtual {p2}, Landroid/widget/TextView;->bringToFront()V

    return-void

    .line 43
    :cond_a2
    aget-object v10, v8, v9

    invoke-static {p0, v10}, Le/e/a/FeedbackHud219;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v10

    invoke-static {v10, v0}, Le/e/a/FeedbackHud219;->controlsBottom(Landroid/view/View;Landroid/graphics/Rect;)I

    move-result v10

    invoke-static {v7, v10}, Ljava/lang/Math;->max(II)I

    move-result v7

    add-int/lit8 v9, v9, 0x1

    goto :goto_6f
.end method
