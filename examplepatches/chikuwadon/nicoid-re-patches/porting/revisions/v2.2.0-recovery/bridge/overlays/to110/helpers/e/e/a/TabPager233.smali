.class public final Le/e/a/TabPager233;
.super Ljava/lang/Object;
.source "TabPager233.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/TabPager233$Drag;
    }
.end annotation


# static fields
.field static final states:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/TabPager233$Drag;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/TabPager233;->states:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static capture(Landroid/view/View;)Landroid/graphics/Bitmap;
    .registers 1

    invoke-static {p0}, Le/e/a/TabFrame220;->snapshot(Landroid/view/View;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static destroy(Landroid/app/Activity;)V
    .registers 3

    .line 20
    sget-object v0, Le/e/a/TabPager233;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/TabPager233$Drag;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, v0, Le/e/a/TabPager233$Drag;->animator:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_1

    iget-object v1, v0, Le/e/a/TabPager233$Drag;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    iget-object v1, v0, Le/e/a/TabPager233$Drag;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_1
    invoke-static {p0, v0}, Le/e/a/TabPager233;->release(Landroid/app/Activity;Le/e/a/TabPager233$Drag;)V

    return-void
.end method

.method static finish(Landroid/app/Activity;Le/e/a/TabPager233$Drag;Z)V
    .registers 10

    iget v0, p1, Le/e/a/TabPager233$Drag;->neighborVisibility:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget-object v0, p1, Le/e/a/TabPager233$Drag;->target:Le/e/a/SavedTabs227$Tab;

    iget-object v1, p1, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    invoke-static {p0, p1}, Le/e/a/TabPager233;->release(Landroid/app/Activity;Le/e/a/TabPager233$Drag;)V

    if-eqz p2, :cond_0

    if-eqz v0, :cond_0

    iget-object v0, v0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/MultiTabs227$Host;->select(Ljava/lang/String;)V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p1, Le/e/a/TabPager233$Drag;->animator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_2

    return-void

    :cond_2
    iget-object v0, p1, Le/e/a/TabPager233$Drag;->target:Le/e/a/SavedTabs227$Tab;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p2, :cond_3

    if-eqz v0, :cond_3

    const/4 p2, 0x1

    goto :goto_0

    :cond_3
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_5

    iget v3, p1, Le/e/a/TabPager233$Drag;->dx:F

    const/4 v4, 0x0

    cmpg-float v3, v3, v4

    if-gez v3, :cond_4

    iget-object v3, p1, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    neg-int v3, v3

    goto :goto_1

    :cond_4
    iget-object v3, p1, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    goto :goto_1

    :cond_5
    const/4 v3, 0x0

    :goto_1
    int-to-float v3, v3

    iget v4, p1, Le/e/a/TabPager233$Drag;->dx:F

    const/4 v5, 0x2

    new-array v5, v5, [F

    aput v4, v5, v2

    aput v3, v5, v1

    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v2

    iput-object v2, p1, Le/e/a/TabPager233$Drag;->animator:Landroid/animation/ValueAnimator;

    iget v4, p1, Le/e/a/TabPager233$Drag;->dx:F

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v4, 0x43340000    # 180.0f

    mul-float v3, v3, v4

    iget-object v4, p1, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v3, v1

    float-to-long v3, v3

    const-wide/16 v5, 0xdc

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    const-wide/16 v5, 0x5a

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v2, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v1, Le/e/a/TabPager233$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Le/e/a/TabPager233$$ExternalSyntheticLambda2;-><init>(Le/e/a/TabPager233$Drag;)V

    invoke-virtual {v2, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v1, Le/e/a/TabPager233$1;

    invoke-direct {v1, p2, p0, p1, v0}, Le/e/a/TabPager233$1;-><init>(ZLandroid/app/Activity;Le/e/a/TabPager233$Drag;Le/e/a/SavedTabs227$Tab;)V

    invoke-virtual {v2, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method static synthetic lambda$0(Le/e/a/TabPager233$Drag;Landroid/animation/ValueAnimator;)V
    .registers 2

    .line 16
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p0, p1}, Le/e/a/TabPager233;->move(Le/e/a/TabPager233$Drag;F)V

    return-void
.end method

.method private static listPreview(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)Landroid/graphics/Bitmap;
    .registers 4

    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v1, "list"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1}, Le/e/a/TabPager233;->page(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/TabFrame220;->snapshot(Landroid/view/View;)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-static {v1, v0}, Le/e/a/TabPreview235;->remember(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method static move(Le/e/a/TabPager233$Drag;F)V
    .registers 6

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-gtz v0, :cond_0

    return-void

    :cond_0
    iget v1, p0, Le/e/a/TabPager233$Drag;->neighborVisibility:I

    if-nez v1, :cond_2

    iget-object v1, p0, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object v1, v1, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const/16 v3, 0x13

    new-array v3, v3, [C

    fill-array-data v3, :array_0

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([C)V

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x2

    :cond_1
    iput v1, p0, Le/e/a/TabPager233$Drag;->neighborVisibility:I

    :cond_2
    const/4 v2, 0x2

    if-eq v1, v2, :cond_3

    invoke-static {p0}, Le/e/a/TabPager233;->stage(Le/e/a/TabPager233$Drag;)V

    :cond_3
    neg-int v1, v0

    int-to-float v2, v1

    int-to-float v3, v0

    invoke-static {v3, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {v2, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Le/e/a/TabPager233$Drag;->dx:F

    iget p1, p0, Le/e/a/TabPager233$Drag;->dx:F

    const/4 v2, 0x0

    cmpg-float p1, p1, v2

    if-gez p1, :cond_4

    const/4 p1, 0x1

    goto :goto_0

    :cond_4
    const/4 p1, -0x1

    :goto_0
    invoke-static {p0, p1}, Le/e/a/TabPager233;->next(Le/e/a/TabPager233$Drag;I)Le/e/a/SavedTabs227$Tab;

    move-result-object p1

    iget v1, p0, Le/e/a/TabPager233$Drag;->neighborVisibility:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_5

    iput-object p1, p0, Le/e/a/TabPager233$Drag;->target:Le/e/a/SavedTabs227$Tab;

    return-void

    :cond_5
    invoke-static {p0, p1}, Le/e/a/TabPager233;->neighbor(Le/e/a/TabPager233$Drag;Le/e/a/SavedTabs227$Tab;)V

    iget-object p1, p0, Le/e/a/TabPager233$Drag;->target:Le/e/a/SavedTabs227$Tab;

    if-nez p1, :cond_6

    iget p1, p0, Le/e/a/TabPager233$Drag;->dx:F

    const v3, 0x3e3851ec    # 0.18f

    mul-float p1, p1, v3

    goto :goto_1

    :cond_6
    iget p1, p0, Le/e/a/TabPager233$Drag;->dx:F

    :goto_1
    iget-object v3, p0, Le/e/a/TabPager233$Drag;->outgoing:Landroid/view/View;

    if-eqz v3, :cond_7

    iget-object v3, p0, Le/e/a/TabPager233$Drag;->outgoing:Landroid/view/View;

    invoke-virtual {v3, p1}, Landroid/view/View;->setTranslationX(F)V

    :cond_7
    iget-object v3, p0, Le/e/a/TabPager233$Drag;->neighbor:Landroid/view/View;

    if-eqz v3, :cond_9

    iget-object v3, p0, Le/e/a/TabPager233$Drag;->neighbor:Landroid/view/View;

    iget p0, p0, Le/e/a/TabPager233$Drag;->dx:F

    cmpg-float p0, p0, v2

    if-gez p0, :cond_8

    goto :goto_2

    :cond_8
    neg-int v0, v0

    :goto_2
    int-to-float p0, v0

    add-float/2addr p1, p0

    invoke-virtual {v3, p1}, Landroid/view/View;->setTranslationX(F)V

    :cond_9
    return-void

    :array_0
    .array-data 2
        0x74s
        0x61s
        0x62s
        0x5fs
        0x73s
        0x77s
        0x69s
        0x70s
        0x65s
        0x5fs
        0x61s
        0x6es
        0x69s
        0x6ds
        0x61s
        0x74s
        0x69s
        0x6fs
        0x6es
    .end array-data
.end method

.method static neighbor(Le/e/a/TabPager233$Drag;Le/e/a/SavedTabs227$Tab;)V
    .registers 4

    .line 12
    iget-object v0, p0, Le/e/a/TabPager233$Drag;->target:Le/e/a/SavedTabs227$Tab;

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Le/e/a/TabPager233;->removeNeighbor(Le/e/a/TabPager233$Drag;)V

    iput-object p1, p0, Le/e/a/TabPager233$Drag;->target:Le/e/a/SavedTabs227$Tab;

    if-eqz p1, :cond_3

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-static {v0}, Le/e/a/TabPreview235;->get(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_2

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    invoke-static {v0, p1}, Le/e/a/TabPager233;->listPreview(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)Landroid/graphics/Bitmap;

    move-result-object v0

    :cond_2
    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-static {p0, v0, p1}, Le/e/a/TabPager233;->panel(Le/e/a/TabPager233$Drag;Landroid/graphics/Bitmap;Ljava/lang/String;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Le/e/a/TabPager233$Drag;->neighbor:Landroid/view/View;

    iget-object p1, p0, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    iget-object p0, p0, Le/e/a/TabPager233$Drag;->neighbor:Landroid/view/View;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_3
    :goto_0
    return-void
.end method

.method static next(Le/e/a/TabPager233$Drag;I)Le/e/a/SavedTabs227$Tab;
    .registers 4

    .line 8
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v0, v0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    iget-object p0, p0, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object p0, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {v1, p0}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p0

    add-int/2addr p0, p1

    if-ltz p0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    if-ge p0, p1, :cond_0

    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/SavedTabs227$Tab;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method static page(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)Landroid/view/View;
    .registers 7

    .line 7
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    iget-object v2, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string p0, "V"

    const/4 p1, 0x0

    new-array v2, p1, [Ljava/lang/Class;

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {v1, p0, v2, p1}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    return-object p0

    :cond_0
    sget-object v1, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3

    sget-object v1, Le/e/a/TabRoutes228;->ROOTS:Ljava/util/Map;

    iget-object p0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-nez p0, :cond_2

    goto :goto_0

    :cond_2
    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    move-object v0, p0

    :goto_0
    return-object v0

    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/MultiTabs227$Host;

    iget-object v3, v2, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget-object v4, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    if-ne v3, v4, :cond_1

    iget-object v3, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    iget-object v4, v2, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object p0, v2, Le/e/a/MultiTabs227$Host;->body:Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    return-object v0
.end method

.method static panel(Le/e/a/TabPager233$Drag;Landroid/graphics/Bitmap;Ljava/lang/String;)Landroid/view/View;
    .registers 6

    .line 10
    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object v1, v1, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object v1, v1, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    const/4 v1, -0x1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-nez v2, :cond_0

    new-instance p2, Landroid/widget/ImageView;

    iget-object p0, p0, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object p0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {p2, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    sget-object p0, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p2, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object p0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/16 p1, 0x10

    invoke-static {p0, p2, p1}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    const/16 p1, 0x11

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setGravity(I)V

    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p1, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_0
    return-object v0
.end method

.method static release(Landroid/app/Activity;Le/e/a/TabPager233$Drag;)V
    .registers 4

    .line 14
    iget-boolean v0, p1, Le/e/a/TabPager233$Drag;->released:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/TabPager233$Drag;->released:Z

    invoke-static {p1}, Le/e/a/TabPager233;->removeNeighbor(Le/e/a/TabPager233$Drag;)V

    iget-object v0, p1, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_1

    iget-object v0, p1, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    iget-object v0, p1, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    iget-object v0, p1, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p1, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p1, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    iput-object v0, p1, Le/e/a/TabPager233$Drag;->outgoing:Landroid/view/View;

    iput-object v0, p1, Le/e/a/TabPager233$Drag;->overlay:Landroid/view/ViewGroup;

    iget-object v1, p1, Le/e/a/TabPager233$Drag;->captured:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_2

    iget-object v1, p1, Le/e/a/TabPager233$Drag;->captured:Landroid/graphics/Bitmap;

    iput-object v0, p1, Le/e/a/TabPager233$Drag;->captured:Landroid/graphics/Bitmap;

    :cond_2
    iget-object v1, p1, Le/e/a/TabPager233$Drag;->velocity:Landroid/view/VelocityTracker;

    if-eqz v1, :cond_3

    iget-object v1, p1, Le/e/a/TabPager233$Drag;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v0, p1, Le/e/a/TabPager233$Drag;->velocity:Landroid/view/VelocityTracker;

    :cond_3
    sget-object v0, Le/e/a/TabPager233;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_4

    sget-object p1, Le/e/a/TabPager233;->states:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    return-void
.end method

.method static removeNeighbor(Le/e/a/TabPager233$Drag;)V
    .registers 3

    .line 13
    iget-object v0, p0, Le/e/a/TabPager233$Drag;->neighbor:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->neighbor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->neighbor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Le/e/a/TabPager233$Drag;->neighbor:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/TabPager233$Drag;->neighbor:Landroid/view/View;

    iput-object v0, p0, Le/e/a/TabPager233$Drag;->target:Le/e/a/SavedTabs227$Tab;

    return-void
.end method

.method static stage(Le/e/a/TabPager233$Drag;)V
    .registers 7

    .line 11
    iget-object v0, p0, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object v0, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Le/e/a/TabPager233$Drag;->overlay:Landroid/view/ViewGroup;

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->overlay:Landroid/view/ViewGroup;

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    invoke-static {v0}, Le/e/a/TabPager233;->capture(Landroid/view/View;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Le/e/a/TabPager233$Drag;->captured:Landroid/graphics/Bitmap;

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->captured:Landroid/graphics/Bitmap;

    if-nez v0, :cond_2

    return-void

    :cond_2
    iget-object v1, p0, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object v1, v1, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-static {v1, v0}, Le/e/a/TabPreview235;->remember(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object v1, v1, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    const-string v1, "nicoid-media-overlay"

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    iget-object v2, p0, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object v2, v2, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    const/4 v0, 0x2

    new-array v2, v0, [I

    new-array v0, v0, [I

    iget-object v3, p0, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    invoke-virtual {v3, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    iget-object v3, p0, Le/e/a/TabPager233$Drag;->overlay:Landroid/view/ViewGroup;

    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v4, p0, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v4

    iget-object v5, p0, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/4 v4, 0x0

    aget v5, v2, v4

    aget v4, v0, v4

    sub-int/2addr v5, v4

    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    aget v2, v2, v1

    aget v0, v0, v1

    sub-int/2addr v2, v0

    iput v2, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->overlay:Landroid/view/ViewGroup;

    iget-object v1, p0, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->captured:Landroid/graphics/Bitmap;

    const-string v1, ""

    invoke-static {p0, v0, v1}, Le/e/a/TabPager233;->panel(Le/e/a/TabPager233$Drag;Landroid/graphics/Bitmap;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Le/e/a/TabPager233$Drag;->outgoing:Landroid/view/View;

    iget-object v0, p0, Le/e/a/TabPager233$Drag;->stage:Landroid/widget/FrameLayout;

    iget-object p0, p0, Le/e/a/TabPager233$Drag;->outgoing:Landroid/view/View;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 14

    .line 17
    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/MultiTabs227$Host;

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v2

    iget-object v2, v2, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x2

    if-ge v2, v3, :cond_0

    goto/16 :goto_7

    :cond_0
    sget-object v2, Le/e/a/TabPager233;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/TabPager233$Drag;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v4

    const/4 v5, 0x1

    if-eqz v2, :cond_1

    iget-object v6, v2, Le/e/a/TabPager233$Drag;->animator:Landroid/animation/ValueAnimator;

    if-eqz v6, :cond_1

    return v5

    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    if-nez v4, :cond_7

    invoke-static {p0}, Le/e/a/TabPager233;->destroy(Landroid/app/Activity;)V

    invoke-static {p0, p1}, Le/e/a/VideoTitleOverrides;->miniOwnsDown(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v2

    if-eqz v2, :cond_2

    return v1

    :cond_2
    new-instance v2, Le/e/a/TabPager233$Drag;

    invoke-direct {v2}, Le/e/a/TabPager233$Drag;-><init>()V

    iput-object v0, v2, Le/e/a/TabPager233$Drag;->host:Le/e/a/MultiTabs227$Host;

    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->body:Landroid/view/View;

    iput-object v3, v2, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    :try_start_0
    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-eqz v3, :cond_3

    iget-object v0, v0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    const-string v3, "V"

    new-array v4, v1, [Ljava/lang/Class;

    new-array v7, v1, [Ljava/lang/Object;

    invoke-static {v0, v3, v4, v7}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    :goto_0
    iput-object v0, v2, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    goto :goto_1

    :cond_3
    sget-object v0, Le/e/a/TabRoutes228;->ROOTS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_4

    invoke-static {p0}, Le/e/a/TabRoutes228;->screen(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-static {p0}, Le/e/a/TabRoutes228;->screen(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_4
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, v2, Le/e/a/TabPager233$Drag;->x:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, v2, Le/e/a/TabPager233$Drag;->y:F

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v3, v2, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    if-eqz v3, :cond_5

    iget-object v3, v2, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    invoke-virtual {v3, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v3

    if-eqz v3, :cond_5

    iget v3, v2, Le/e/a/TabPager233$Drag;->x:F

    float-to-int v3, v3

    iget v4, v2, Le/e/a/TabPager233$Drag;->y:F

    float-to-int v4, v4

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-eqz v0, :cond_5

    iget v0, v2, Le/e/a/TabPager233$Drag;->x:F

    const/high16 v3, 0x42000000    # 32.0f

    mul-float v3, v3, v6

    cmpl-float v0, v0, v3

    if-lez v0, :cond_5

    iget v0, v2, Le/e/a/TabPager233$Drag;->x:F

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v3

    cmpg-float v0, v0, v4

    if-gez v0, :cond_5

    iget v0, v2, Le/e/a/TabPager233$Drag;->y:F

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x42c00000    # 96.0f

    mul-float v6, v6, v4

    sub-float/2addr v3, v6

    cmpg-float v0, v0, v3

    if-gez v0, :cond_5

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget v3, v2, Le/e/a/TabPager233$Drag;->x:F

    iget v4, v2, Le/e/a/TabPager233$Drag;->y:F

    invoke-static {v0, v3, v4}, Le/e/a/TabGestures228;->horizontal(Landroid/view/View;FF)Z

    move-result v0

    if-nez v0, :cond_5

    const/4 v0, 0x1

    goto :goto_2

    :cond_5
    const/4 v0, 0x0

    :goto_2
    iput-boolean v0, v2, Le/e/a/TabPager233$Drag;->candidate:Z

    :try_start_1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v3, "u"

    invoke-static {p0, v3}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "e"

    new-array v6, v5, [Ljava/lang/Class;

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v1

    const v7, 0x800003

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v7, v5, v1

    invoke-static {v3, v4, v6, v5}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    iput-boolean v1, v2, Le/e/a/TabPager233$Drag;->candidate:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    :catch_1
    move-exception v0

    :cond_6
    :goto_3
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, v2, Le/e/a/TabPager233$Drag;->velocity:Landroid/view/VelocityTracker;

    iget-object v0, v2, Le/e/a/TabPager233$Drag;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    sget-object p1, Le/e/a/TabPager233;->states:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v1

    .line 18
    :cond_7
    if-nez v2, :cond_8

    return v1

    :cond_8
    iget-object v0, v2, Le/e/a/TabPager233$Drag;->velocity:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_9

    iget-object v0, v2, Le/e/a/TabPager233$Drag;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-gt v0, v5, :cond_10

    const/4 v0, 0x3

    if-ne v4, v0, :cond_a

    goto/16 :goto_6

    :cond_a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v7

    iget v8, v2, Le/e/a/TabPager233$Drag;->x:F

    sub-float/2addr v7, v8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v8

    iget v9, v2, Le/e/a/TabPager233$Drag;->y:F

    sub-float/2addr v8, v9

    if-ne v4, v3, :cond_c

    iget-boolean v9, v2, Le/e/a/TabPager233$Drag;->claimed:Z

    if-nez v9, :cond_c

    iget-boolean v9, v2, Le/e/a/TabPager233$Drag;->candidate:Z

    if-eqz v9, :cond_c

    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v9

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v10

    int-to-float v11, v9

    cmpl-float v10, v10, v11

    if-lez v10, :cond_b

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v10

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v11

    cmpl-float v10, v10, v11

    if-ltz v10, :cond_b

    iput-boolean v1, v2, Le/e/a/TabPager233$Drag;->candidate:Z

    goto :goto_4

    :cond_b
    invoke-static {v7, v8, v9}, Le/e/a/TabPagingRules233;->claim(FFI)Z

    move-result v8

    if-eqz v8, :cond_c

    iput-boolean v5, v2, Le/e/a/TabPager233$Drag;->claimed:Z

    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setAction(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Window;->superDispatchTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    :cond_c
    :goto_4
    iget-boolean p1, v2, Le/e/a/TabPager233$Drag;->claimed:Z

    if-eqz p1, :cond_d

    if-ne v4, v3, :cond_d

    invoke-static {v2, v7}, Le/e/a/TabPager233;->move(Le/e/a/TabPager233$Drag;F)V

    :cond_d
    if-ne v4, v5, :cond_f

    iget-boolean p1, v2, Le/e/a/TabPager233$Drag;->claimed:Z

    if-nez p1, :cond_e

    invoke-static {p0}, Le/e/a/TabPager233;->destroy(Landroid/app/Activity;)V

    return v1

    :cond_e
    iget-object p1, v2, Le/e/a/TabPager233$Drag;->velocity:Landroid/view/VelocityTracker;

    const/16 v0, 0x3e8

    invoke-virtual {p1, v0}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget-object p1, v2, Le/e/a/TabPager233$Drag;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result p1

    div-float/2addr p1, v6

    iget v0, v2, Le/e/a/TabPager233$Drag;->dx:F

    iget-object v1, v2, Le/e/a/TabPager233$Drag;->body:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-static {v0, v1, p1}, Le/e/a/TabPagingRules233;->commit(FIF)Z

    move-result p1

    invoke-static {p0, v2, p1}, Le/e/a/TabPager233;->finish(Landroid/app/Activity;Le/e/a/TabPager233$Drag;Z)V

    :cond_f
    :goto_5
    iget-boolean p0, v2, Le/e/a/TabPager233$Drag;->claimed:Z

    return p0

    :cond_10
    :goto_6
    iget-boolean p1, v2, Le/e/a/TabPager233$Drag;->claimed:Z

    if-eqz p1, :cond_11

    invoke-static {p0, v2, v1}, Le/e/a/TabPager233;->finish(Landroid/app/Activity;Le/e/a/TabPager233$Drag;Z)V

    goto :goto_5

    :cond_11
    invoke-static {p0}, Le/e/a/TabPager233;->destroy(Landroid/app/Activity;)V

    goto :goto_5

    .line 17
    :cond_12
    :goto_7
    return v1
.end method
