.class public final Le/e/a/CommentVisuals;
.super Ljava/lang/Object;
.source "CommentVisuals.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentVisuals$State;,
        Le/e/a/CommentVisuals$Entry;
    }
.end annotation


# static fields
.field private static final CONTEXT:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private static final FIELDS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Field;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final STATES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/CommentVisuals$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 12
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentVisuals;->STATES:Ljava/util/WeakHashMap;

    .line 13
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/CommentVisuals;->CONTEXT:Ljava/lang/ThreadLocal;

    .line 16
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentVisuals;->FIELDS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V
    .registers 11

    sget-object v0, Le/e/a/CommentVisuals;->CONTEXT:Ljava/lang/ThreadLocal;

    invoke-static {v0}, Le/e/a/ScrollingComments267;->fixedContext(Ljava/lang/ThreadLocal;)Landroid/content/Context;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Le/e/a/FixedCommentCollision;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;Landroid/content/Context;)V

    return-void
.end method

.method static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 17
    sget-object v0, Le/e/a/CommentVisuals;->FIELDS:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_2

    sget-object v1, Le/e/a/CommentVisuals;->FIELDS:Ljava/util/Map;

    monitor-enter v1

    :try_start_0
    sget-object v0, Le/e/a/CommentVisuals;->FIELDS:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_0

    aget-object v5, v2, v4

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    sget-object v2, Le/e/a/CommentVisuals;->FIELDS:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    monitor-exit v1

    goto :goto_1

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_2
    :goto_1
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    if-eqz v0, :cond_3

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_3
    new-instance p0, Ljava/lang/NoSuchFieldException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static flag(Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 2

    .line 19
    :try_start_0
    invoke-static {p0, p1}, Le/e/a/CommentVisuals;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const/4 p0, 0x0

    return p0
.end method

.method public static font(Landroid/content/Context;F)F
    .registers 4

    .line 65
    invoke-static {p0}, Le/e/a/CommentVisuals;->shorts(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v0, v0

    const/high16 v1, 0x41600000    # 14.0f

    div-float/2addr v0, v1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    :cond_0
    invoke-static {p0}, Le/e/a/CommentOptions;->size(Landroid/content/Context;)I

    move-result p0

    int-to-float p0, p0

    mul-float p1, p1, p0

    const/high16 p0, 0x42c80000    # 100.0f

    div-float/2addr p1, p0

    return p1
.end method

.method public static fullViewport(Landroid/view/View;)V
    .registers 5

    .line 68
    if-nez p0, :cond_0

    return-void

    .line 69
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "e.e.a.t"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "e.e.a.u"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 70
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_4

    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v2, v3, :cond_4

    :cond_2
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    instance-of v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_3

    move-object v2, v0

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v2, v1, v1, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    :cond_3
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    :cond_4
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_5

    check-cast p0, Landroid/view/ViewGroup;

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_5

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CommentVisuals;->fullViewport(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 73
    :cond_5
    return-void
.end method

.method static lane(Le/e/a/CommentVisuals$State;Le/e/a/CommentVisuals$Entry;FII)I
    .registers 13

    .line 53
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget v2, p1, Le/e/a/CommentVisuals$Entry;->height:F

    iget-object v7, p1, Le/e/a/CommentVisuals$Entry;->text:Ljava/lang/String;

    invoke-static {v7, v2}, Le/e/a/CommentFlow220;->height(Ljava/lang/String;F)F

    move-result v2

    iget v3, p0, Le/e/a/CommentVisuals$State;->height:I

    invoke-static {v2, v3, p4}, Le/e/a/CommentLayoutRules;->occupiedRows(FII)I

    move-result v2

    add-int/2addr v2, v1

    if-gt v2, p4, :cond_5

    iget-object v2, p0, Le/e/a/CommentVisuals$State;->active:Ljava/util/IdentityHashMap;

    invoke-virtual {v2}, Ljava/util/IdentityHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/CommentVisuals$Entry;

    .line 54
    iget v4, v3, Le/e/a/CommentVisuals$Entry;->height:F

    iget-object v7, v3, Le/e/a/CommentVisuals$Entry;->text:Ljava/lang/String;

    invoke-static {v7, v4}, Le/e/a/CommentFlow220;->height(Ljava/lang/String;F)F

    move-result v4

    iget v5, p0, Le/e/a/CommentVisuals$State;->height:I

    invoke-static {v4, v5, p4}, Le/e/a/CommentLayoutRules;->occupiedRows(FII)I

    move-result v4

    iget v5, p1, Le/e/a/CommentVisuals$Entry;->height:F

    iget-object v7, p1, Le/e/a/CommentVisuals$Entry;->text:Ljava/lang/String;

    invoke-static {v7, v5}, Le/e/a/CommentFlow220;->height(Ljava/lang/String;F)F

    move-result v5

    iget v6, p0, Le/e/a/CommentVisuals$State;->height:I

    invoke-static {v5, v6, p4}, Le/e/a/CommentLayoutRules;->occupiedRows(FII)I

    move-result v5

    iget v6, v3, Le/e/a/CommentVisuals$Entry;->row:I

    add-int/2addr v6, v4

    if-ge v1, v6, :cond_0

    add-int/2addr v5, v1

    iget v4, v3, Le/e/a/CommentVisuals$Entry;->row:I

    if-gt v5, v4, :cond_1

    goto :goto_1

    .line 55
    :cond_1
    int-to-float v4, p3

    iget v5, v3, Le/e/a/CommentVisuals$Entry;->start:F

    sub-float v5, p2, v5

    iget v6, v3, Le/e/a/CommentVisuals$Entry;->speed:F

    mul-float v5, v5, v6

    sub-float v5, v4, v5

    iget v6, v3, Le/e/a/CommentVisuals$Entry;->width:F

    add-float/2addr v5, v6

    .line 56
    iget v3, v3, Le/e/a/CommentVisuals$Entry;->speed:F

    iget v6, p1, Le/e/a/CommentVisuals$Entry;->speed:F

    const/high16 v7, 0x41000000    # 8.0f

    invoke-static {v5, v3, v6, v4, v7}, Le/e/a/CommentLayoutRules;->clears(FFFFF)Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v2, 0x0

    goto :goto_2

    .line 57
    :cond_2
    goto :goto_1

    .line 53
    :cond_3
    const/4 v2, 0x1

    .line 57
    :goto_2
    if-eqz v2, :cond_4

    return v1

    .line 53
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 57
    :cond_5
    const/4 p0, -0x1

    return p0
.end method

.method static number(Ljava/lang/Object;Ljava/lang/String;I)I
    .registers 3

    .line 18
    :try_start_0
    invoke-static {p0, p1}, Le/e/a/CommentVisuals;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Ljava/lang/Number;

    if-eqz p1, :cond_0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return p2

    :catch_0
    move-exception p0

    return p2
.end method

.method public static opacity(Landroid/content/Context;)I
    .registers 1

    .line 60
    invoke-static {p0}, Le/e/a/CommentOptions;->opacity(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method private static scroll(Ljava/lang/Object;)Z
    .registers 3

    .line 20
    const-string v0, "j"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Le/e/a/CommentVisuals;->number(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "l"

    invoke-static {p0, v0, v1}, Le/e/a/CommentVisuals;->number(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result p0

    if-nez p0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public static scrolling(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;Z)Ljava/util/ArrayList;
    .registers 6

    invoke-static {p0}, Le/e/a/CommentStyle;->refresh(Ljava/lang/Object;)V

    invoke-static {p0, p1, p2, p3}, Le/e/a/ScrollingComments267;->draw(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;Z)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {p0, p1, v1}, Le/e/a/CommentViewport190;->fixedStart120(Ljava/lang/Object;Landroid/graphics/Canvas;I)V

    return-object v0
.end method

.method private static shadowMode(Landroid/content/Context;)I
    .registers 3

    .line 59
    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "comment_shadow"

    const-string v1, "0"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const/4 p0, 0x0

    return p0
.end method

.method private static shorts(Landroid/content/Context;)Z
    .registers 3

    .line 66
    nop

    :goto_0
    instance-of v0, p0, Landroid/content/ContextWrapper;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid_re_shorts"

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    :cond_0
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-ne v0, p0, :cond_1

    goto :goto_1

    :cond_1
    move-object p0, v0

    goto :goto_0

    :cond_2
    :goto_1
    return v1
.end method
