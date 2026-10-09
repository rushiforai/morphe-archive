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
    .registers 12

    .line 62
    sget-object v0, Le/e/a/CommentVisuals;->CONTEXT:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-virtual {p4}, Landroid/graphics/Paint;->getAlpha()I

    move-result v1

    if-eqz v0, :cond_64

    invoke-static {v0}, Le/e/a/CommentOptions;->opacity(Landroid/content/Context;)I

    move-result v2

    mul-int v2, v2, v1

    int-to-float v2, v2

    const/high16 v3, 0x42c80000    # 100.0f

    div-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {p4, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    const/4 v2, 0x2

    const/16 v3, 0x14

    const-string v4, "comment_shadow_dp"

    const/4 v5, 0x0

    invoke-static {v0}, Le/e/a/CommentOptions;->shadow(Landroid/content/Context;)F

    move-result v2

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    mul-float v2, v2, v3

    invoke-static {v0}, Le/e/a/CommentVisuals;->shadowMode(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p4}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v3

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    const/4 v6, 0x0

    if-ne v3, v4, :cond_4c

    invoke-virtual {p4, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    cmpl-float v3, v2, v6

    if-nez v3, :cond_4c

    invoke-virtual {p4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    :cond_4c
    invoke-virtual {p4}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v3

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    if-ne v3, v4, :cond_64

    const/4 v3, 0x1

    if-ne v0, v3, :cond_61

    cmpl-float v0, v2, v6

    if-lez v0, :cond_61

    const/high16 v0, -0x1000000

    invoke-virtual {p4, v2, v6, v6, v0}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto :goto_64

    :cond_61
    invoke-virtual {p4}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 63
    :cond_64
    :goto_64
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual {p4, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 64
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

    if-nez v0, :cond_4a

    sget-object v1, Le/e/a/CommentVisuals;->FIELDS:Ljava/util/Map;

    monitor-enter v1

    :try_start_11
    sget-object v0, Le/e/a/CommentVisuals;->FIELDS:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_45

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_2e
    if-ge v4, v3, :cond_3c

    aget-object v5, v2, v4

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_2e

    :cond_3c
    sget-object v2, Le/e/a/CommentVisuals;->FIELDS:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_45
    monitor-exit v1

    goto :goto_4a

    :catchall_47
    move-exception p0

    monitor-exit v1
    :try_end_49
    .catchall {:try_start_11 .. :try_end_49} :catchall_47

    throw p0

    :cond_4a
    :goto_4a
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    if-eqz v0, :cond_57

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_57
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
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_b

    return p0

    :catch_b
    move-exception p0

    const/4 p0, 0x0

    return p0
.end method

.method public static font(Landroid/content/Context;F)F
    .registers 4

    .line 65
    invoke-static {p0}, Le/e/a/CommentVisuals;->shorts(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_18

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

    :cond_18
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
    if-nez p0, :cond_3

    return-void

    .line 69
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "e.e.a.t"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_24

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "e.e.a.u"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    .line 70
    :cond_24
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_44

    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_33

    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v2, v3, :cond_44

    :cond_33
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    instance-of v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_41

    move-object v2, v0

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v2, v1, v1, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    :cond_41
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    :cond_44
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_5a

    check-cast p0, Landroid/view/ViewGroup;

    :goto_4a
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_5a

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CommentVisuals;->fullViewport(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_4a

    .line 73
    :cond_5a
    return-void
.end method

.method static lane(Le/e/a/CommentVisuals$State;Le/e/a/CommentVisuals$Entry;FII)I
    .registers 13

    .line 53
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    iget v2, p1, Le/e/a/CommentVisuals$Entry;->height:F

    iget v3, p0, Le/e/a/CommentVisuals$State;->height:I

    invoke-static {v2, v3, p4}, Le/e/a/CommentLayoutRules;->occupiedRows(FII)I

    move-result v2

    add-int/2addr v2, v1

    if-gt v2, p4, :cond_62

    iget-object v2, p0, Le/e/a/CommentVisuals$State;->active:Ljava/util/IdentityHashMap;

    invoke-virtual {v2}, Ljava/util/IdentityHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_17
    :goto_17
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/CommentVisuals$Entry;

    .line 54
    iget v4, v3, Le/e/a/CommentVisuals$Entry;->height:F

    iget v5, p0, Le/e/a/CommentVisuals$State;->height:I

    invoke-static {v4, v5, p4}, Le/e/a/CommentLayoutRules;->occupiedRows(FII)I

    move-result v4

    iget v5, p1, Le/e/a/CommentVisuals$Entry;->height:F

    iget v6, p0, Le/e/a/CommentVisuals$State;->height:I

    invoke-static {v5, v6, p4}, Le/e/a/CommentLayoutRules;->occupiedRows(FII)I

    move-result v5

    iget v6, v3, Le/e/a/CommentVisuals$Entry;->row:I

    add-int/2addr v6, v4

    if-ge v1, v6, :cond_17

    add-int/2addr v5, v1

    iget v4, v3, Le/e/a/CommentVisuals$Entry;->row:I

    if-gt v5, v4, :cond_3e

    goto :goto_17

    .line 55
    :cond_3e
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

    if-nez v3, :cond_5a

    const/4 v2, 0x0

    goto :goto_5c

    .line 57
    :cond_5a
    goto :goto_17

    .line 53
    :cond_5b
    const/4 v2, 0x1

    .line 57
    :goto_5c
    if-eqz v2, :cond_5f

    return v1

    .line 53
    :cond_5f
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 57
    :cond_62
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

    if-eqz p1, :cond_e

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p2
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    :cond_e
    return p2

    :catch_f
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

    if-nez v0, :cond_12

    const-string v0, "l"

    invoke-static {p0, v0, v1}, Le/e/a/CommentVisuals;->number(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result p0

    if-nez p0, :cond_12

    const/4 v1, 0x1

    :cond_12
    return v1
.end method

.method public static scrolling(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 30
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Landroid/graphics/Canvas;",
            "Ljava/util/ArrayList<",
            "*>;)",
            "Ljava/util/ArrayList<",
            "*>;"
        }
    .end annotation

    invoke-static/range {p0 .. p2}, Le/e/a/CommentDuration;->apply(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;)V

    .line 22
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object v0, v1

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v0, Le/e/a/CommentVisuals;->CONTEXT:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    sget-object v4, Le/e/a/CommentVisuals;->STATES:Ljava/util/WeakHashMap;

    monitor-enter v4

    :try_start_16
    sget-object v0, Le/e/a/CommentVisuals;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/CommentVisuals$State;

    const/4 v5, 0x0

    if-nez v0, :cond_2b

    new-instance v0, Le/e/a/CommentVisuals$State;

    invoke-direct {v0, v5}, Le/e/a/CommentVisuals$State;-><init>(Le/e/a/CommentVisuals$1;)V

    sget-object v6, Le/e/a/CommentVisuals;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v6, v1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2b
    move-object v6, v0

    monitor-exit v4
    :try_end_2d
    .catchall {:try_start_16 .. :try_end_2d} :catchall_371

    iget-object v0, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    invoke-static {v0, v3}, Le/e/a/CommentStyle;->apply(Landroid/graphics/Paint;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_38

    const/4 v0, -0x1

    iput v0, v6, Le/e/a/CommentVisuals$State;->size:I

    .line 23
    :cond_38
    const/16 v4, 0xff

    :try_start_3a
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "u"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_51

    const-string v7, "W"

    goto :goto_53

    :cond_51
    const-string v7, "a0"

    :goto_53
    invoke-virtual {v0, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1, v4}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_5a} :catch_5b

    goto :goto_5c

    :catch_5b
    move-exception v0

    .line 24
    :goto_5c
    const-string v0, "comment_rows"

    const/16 v7, 0xa

    const/16 v8, 0x14

    const/4 v9, 0x1

    invoke-static {v3, v0, v7, v9, v8}, Le/e/a/CommentOptions;->value(Landroid/content/Context;Ljava/lang/String;III)I

    move-result v7

    invoke-static {v3}, Le/e/a/CommentOptions;->size(Landroid/content/Context;)I

    move-result v0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v8

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v10

    .line 25
    invoke-static/range {p0 .. p0}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v11

    invoke-static/range {p0 .. p0}, Le/e/a/CommentClock;->position(Ljava/lang/Object;)I

    move-result v12

    int-to-float v12, v12

    const/high16 v13, 0x41200000    # 10.0f

    div-float/2addr v12, v13

    invoke-static/range {p0 .. p0}, Le/e/a/CommentClock;->rate(Ljava/lang/Object;)F

    move-result v13

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-static {v14, v13}, Ljava/lang/Math;->max(FF)F

    move-result v13

    .line 26
    iget v15, v6, Le/e/a/CommentVisuals$State;->last:F

    cmpg-float v15, v11, v15

    if-ltz v15, :cond_ad

    iget v15, v6, Le/e/a/CommentVisuals$State;->last:F

    sub-float v15, v11, v15

    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    move-result v15

    const/high16 v16, 0x42480000    # 50.0f

    cmpl-float v15, v15, v16

    if-gtz v15, :cond_ad

    iget v15, v6, Le/e/a/CommentVisuals$State;->rows:I

    if-ne v7, v15, :cond_ad

    iget v15, v6, Le/e/a/CommentVisuals$State;->size:I

    if-ne v0, v15, :cond_ad

    iget v15, v6, Le/e/a/CommentVisuals$State;->width:I

    if-ne v8, v15, :cond_ad

    iget v15, v6, Le/e/a/CommentVisuals$State;->height:I

    if-eq v10, v15, :cond_b2

    :cond_ad
    iget-object v15, v6, Le/e/a/CommentVisuals$State;->active:Ljava/util/IdentityHashMap;

    invoke-virtual {v15}, Ljava/util/IdentityHashMap;->clear()V

    .line 27
    :cond_b2
    iput v11, v6, Le/e/a/CommentVisuals$State;->last:F

    iput v7, v6, Le/e/a/CommentVisuals$State;->rows:I

    iput v0, v6, Le/e/a/CommentVisuals$State;->size:I

    iput v8, v6, Le/e/a/CommentVisuals$State;->width:I

    iput v10, v6, Le/e/a/CommentVisuals$State;->height:I

    iget-object v15, v6, Le/e/a/CommentVisuals$State;->fixed:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->clear()V

    .line 28
    invoke-static {v3}, Le/e/a/CommentVisuals;->shorts(Landroid/content/Context;)Z

    move-result v15

    if-eqz v15, :cond_cc

    invoke-static {v8, v10}, Ljava/lang/Math;->min(II)I

    move-result v15

    goto :goto_cd

    :cond_cc
    move v15, v10

    :goto_cd
    int-to-float v15, v15

    const/high16 v16, 0x41600000    # 14.0f

    div-float v15, v15, v16

    int-to-float v0, v0

    mul-float v15, v15, v0

    const/high16 v16, 0x42c80000    # 100.0f

    div-float v15, v15, v16

    .line 29
    invoke-static {v3}, Le/e/a/CommentOptions;->opacity(Landroid/content/Context;)I

    move-result v14

    const-string v0, "comment_shadow_dp"

    const/16 v4, 0x14

    const/4 v9, 0x2

    const/4 v5, 0x0

    invoke-static {v3}, Le/e/a/CommentOptions;->shadow(Landroid/content/Context;)F

    move-result v0

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    mul-float v4, v4, v0

    .line 30
    iget-object v0, v6, Le/e/a/CommentVisuals$State;->active:Ljava/util/IdentityHashMap;

    invoke-virtual {v0}, Ljava/util/IdentityHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_fd
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_126

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v9, v17

    check-cast v9, Le/e/a/CommentVisuals$Entry;

    iget v5, v9, Le/e/a/CommentVisuals$Entry;->start:F

    sub-float v5, v11, v5

    int-to-float v2, v8

    move/from16 v18, v4

    iget v4, v9, Le/e/a/CommentVisuals$Entry;->width:F

    add-float/2addr v2, v4

    iget v4, v9, Le/e/a/CommentVisuals$Entry;->speed:F

    div-float/2addr v2, v4

    cmpl-float v2, v5, v2

    if-lez v2, :cond_11f

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    :cond_11f
    move-object/from16 v2, p1

    move/from16 v4, v18

    const/4 v5, 0x0

    const/4 v9, 0x2

    goto :goto_fd

    .line 31
    :cond_126
    move/from16 v18, v4

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_12c
    :goto_12c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_36e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 32
    invoke-static {v0}, Le/e/a/CommentVisuals;->scroll(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_142

    iget-object v4, v6, Le/e/a/CommentVisuals$State;->fixed:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_12c

    .line 33
    :cond_142
    const-string v4, "d"

    const/4 v5, 0x0

    invoke-static {v0, v4, v5}, Le/e/a/CommentVisuals;->number(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v4

    const-string v9, "k"

    invoke-static {v0, v9, v5}, Le/e/a/CommentVisuals;->number(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v9

    if-gtz v9, :cond_16c

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    const-string v9, "u"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_164

    const-string v5, "R"

    goto :goto_166

    :cond_164
    const-string v5, "S"

    :goto_166
    const/16 v9, 0x190

    invoke-static {v1, v5, v9}, Le/e/a/CommentVisuals;->number(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v9

    :cond_16c
    const/16 v5, 0x64

    invoke-static {v5, v9}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 34
    int-to-float v4, v4

    cmpl-float v9, v4, v12

    if-gtz v9, :cond_35c

    sub-float v9, v12, v4

    int-to-float v5, v5

    mul-float v19, v5, v13

    cmpl-float v9, v9, v19

    if-lez v9, :cond_188

    iget-object v9, v6, Le/e/a/CommentVisuals$State;->active:Ljava/util/IdentityHashMap;

    invoke-virtual {v9, v0}, Ljava/util/IdentityHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_12c

    :cond_188
    const-string v9, "o"

    invoke-static {v0, v9}, Le/e/a/CommentVisuals;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_191

    goto :goto_12c

    .line 35
    :cond_191
    invoke-static {v1, v0, v4}, Le/e/a/CommentMotion;->start(Ljava/lang/Object;Ljava/lang/Object;F)F

    move-result v4

    sub-float v9, v11, v4

    .line 36
    const/4 v1, 0x0

    cmpg-float v19, v9, v1

    if-ltz v19, :cond_34a

    cmpl-float v9, v9, v5

    if-ltz v9, :cond_1a3

    move-object/from16 v1, p0

    goto :goto_12c

    .line 37
    :cond_1a3
    iget-object v9, v6, Le/e/a/CommentVisuals$State;->active:Ljava/util/IdentityHashMap;

    invoke-virtual {v9, v0}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Le/e/a/CommentVisuals$Entry;

    if-nez v9, :cond_251

    .line 38
    new-instance v9, Le/e/a/CommentVisuals$Entry;

    const/4 v1, 0x0

    invoke-direct {v9, v1}, Le/e/a/CommentVisuals$Entry;-><init>(Le/e/a/CommentVisuals$1;)V

    iput-object v0, v9, Le/e/a/CommentVisuals$Entry;->comment:Ljava/lang/Object;

    iput v4, v9, Le/e/a/CommentVisuals$Entry;->start:F

    const-string v4, "i"

    const/4 v1, 0x0

    invoke-static {v0, v4, v1}, Le/e/a/CommentVisuals;->number(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v4

    const/4 v1, 0x1

    if-ne v4, v1, :cond_1c6

    const v1, 0x3f2b851f    # 0.67f

    const/4 v4, 0x2

    goto :goto_1d6

    :cond_1c6
    const-string v1, "i"

    const/4 v4, 0x0

    invoke-static {v0, v1, v4}, Le/e/a/CommentVisuals;->number(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v1

    const/4 v4, 0x2

    if-ne v1, v4, :cond_1d4

    const v1, 0x3fb5c28f    # 1.42f

    goto :goto_1d6

    :cond_1d4
    const/high16 v1, 0x3f800000    # 1.0f

    :goto_1d6
    mul-float v1, v1, v15

    iput v1, v9, Le/e/a/CommentVisuals$Entry;->height:F

    .line 39
    :try_start_1da
    const-string v1, "a"

    invoke-static {v0, v1}, Le/e/a/CommentVisuals;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v9, Le/e/a/CommentVisuals$Entry;->text:Ljava/lang/String;
    :try_end_1e6
    .catch Ljava/lang/Exception; {:try_start_1da .. :try_end_1e6} :catch_244

    .line 40
    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    iget v4, v9, Le/e/a/CommentVisuals$Entry;->height:F

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v1, v9, Le/e/a/CommentVisuals$Entry;->text:Ljava/lang/String;

    const-string v4, "\n"

    move-object/from16 v20, v2

    const/4 v2, -0x1

    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    move/from16 v21, v12

    const/4 v4, 0x0

    const/4 v12, 0x0

    :goto_1fd
    if-ge v12, v2, :cond_216

    move/from16 v22, v2

    aget-object v2, v1, v12

    move-object/from16 v23, v1

    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(FF)F

    move-result v4

    add-int/lit8 v12, v12, 0x1

    move/from16 v2, v22

    move-object/from16 v1, v23

    goto :goto_1fd

    :cond_216
    iput v4, v9, Le/e/a/CommentVisuals$Entry;->width:F

    int-to-float v1, v8

    add-float/2addr v1, v4

    div-float/2addr v1, v5

    iput v1, v9, Le/e/a/CommentVisuals$Entry;->speed:F

    const-string v1, "f"

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Le/e/a/CommentVisuals;->number(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v1

    iput v1, v9, Le/e/a/CommentVisuals$Entry;->color:I

    .line 41
    iget v1, v9, Le/e/a/CommentVisuals$Entry;->color:I

    if-nez v1, :cond_22c

    iput v2, v9, Le/e/a/CommentVisuals$Entry;->color:I

    .line 42
    :cond_22c
    invoke-static {v6, v9, v11, v8, v7}, Le/e/a/CommentVisuals;->lane(Le/e/a/CommentVisuals$State;Le/e/a/CommentVisuals$Entry;FII)I

    move-result v1

    iput v1, v9, Le/e/a/CommentVisuals$Entry;->row:I

    iget v1, v9, Le/e/a/CommentVisuals$Entry;->row:I

    if-gez v1, :cond_23e

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    move/from16 v12, v21

    goto/16 :goto_12c

    :cond_23e
    iget-object v1, v6, Le/e/a/CommentVisuals$State;->active:Ljava/util/IdentityHashMap;

    invoke-virtual {v1, v0, v9}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_255

    .line 39
    :catch_244
    move-exception v0

    move-object/from16 v20, v2

    move/from16 v21, v12

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    move/from16 v12, v21

    goto/16 :goto_12c

    .line 37
    :cond_251
    move-object/from16 v20, v2

    move/from16 v21, v12

    .line 44
    :goto_255
    int-to-float v0, v8

    iget v1, v9, Le/e/a/CommentVisuals$Entry;->start:F

    sub-float v1, v11, v1

    iget v2, v9, Le/e/a/CommentVisuals$Entry;->speed:F

    mul-float v1, v1, v2

    sub-float/2addr v0, v1

    .line 45
    iget v1, v9, Le/e/a/CommentVisuals$Entry;->row:I

    iget v2, v9, Le/e/a/CommentVisuals$Entry;->height:F

    invoke-static {v1, v7, v10, v2}, Le/e/a/CommentLayoutRules;->baseline(IIIF)F

    move-result v1

    .line 46
    iget-object v2, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    iget v4, v9, Le/e/a/CommentVisuals$Entry;->height:F

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v2, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    iget v4, v9, Le/e/a/CommentVisuals$Entry;->color:I

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    const/16 v4, 0xff

    mul-int/lit16 v5, v14, 0xff

    int-to-float v5, v5

    div-float v5, v5, v16

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v12

    invoke-virtual {v2, v12}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v2, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    sget-object v12, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v12}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 47
    invoke-static {v3}, Le/e/a/CommentVisuals;->shadowMode(Landroid/content/Context;)I

    move-result v2

    const/high16 v12, -0x1000000

    const/4 v4, 0x1

    if-ne v2, v4, :cond_2a6

    const/4 v4, 0x0

    cmpl-float v22, v18, v4

    if-lez v22, :cond_2a6

    move/from16 v22, v1

    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    move-object/from16 v23, v3

    move/from16 v3, v18

    invoke-virtual {v1, v3, v4, v4, v12}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto :goto_2b1

    :cond_2a6
    move/from16 v22, v1

    move-object/from16 v23, v3

    move/from16 v3, v18

    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 48
    :goto_2b1
    iget-object v1, v9, Le/e/a/CommentVisuals$Entry;->text:Ljava/lang/String;

    const-string v4, "\n"

    const/4 v12, -0x1

    invoke-virtual {v1, v4, v12}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    array-length v4, v1

    move/from16 v19, v7

    move/from16 v12, v22

    const/4 v7, 0x0

    :goto_2c0
    if-ge v7, v4, :cond_338

    move/from16 v22, v4

    aget-object v4, v1, v7

    if-nez v2, :cond_316

    const/16 v24, 0x0

    cmpl-float v25, v3, v24

    if-lez v25, :cond_30f

    move-object/from16 p2, v1

    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    move/from16 v25, v2

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual {v2, v4, v0, v12, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    move/from16 v26, v3

    iget v3, v9, Le/e/a/CommentVisuals$Entry;->color:I

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto :goto_320

    :cond_30f
    move-object/from16 p2, v1

    move/from16 v25, v2

    move/from16 v26, v3

    goto :goto_31e

    :cond_316
    move-object/from16 p2, v1

    move/from16 v25, v2

    move/from16 v26, v3

    const/16 v24, 0x0

    :goto_31e
    move-object/from16 v2, p1

    :goto_320
    iget-object v1, v6, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    invoke-virtual {v2, v4, v0, v12, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget v1, v9, Le/e/a/CommentVisuals$Entry;->height:F

    const v3, 0x3f933333    # 1.15f

    mul-float v1, v1, v3

    add-float/2addr v12, v1

    add-int/lit8 v7, v7, 0x1

    move-object/from16 v1, p2

    move/from16 v4, v22

    move/from16 v2, v25

    move/from16 v3, v26

    goto :goto_2c0

    .line 49
    :cond_338
    move-object/from16 v2, p1

    move/from16 v26, v3

    move-object/from16 v1, p0

    move/from16 v7, v19

    move-object/from16 v2, v20

    move/from16 v12, v21

    move-object/from16 v3, v23

    move/from16 v18, v26

    goto/16 :goto_12c

    .line 36
    :cond_34a
    move-object/from16 v20, v2

    move-object/from16 v23, v3

    move/from16 v19, v7

    move/from16 v21, v12

    move/from16 v26, v18

    move-object/from16 v2, p1

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    goto/16 :goto_12c

    .line 34
    :cond_35c
    move-object/from16 v20, v2

    move-object/from16 v23, v3

    move/from16 v19, v7

    move/from16 v21, v12

    move/from16 v26, v18

    move-object/from16 v2, p1

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    goto/16 :goto_12c

    .line 50
    :cond_36e
    iget-object v0, v6, Le/e/a/CommentVisuals$State;->fixed:Ljava/util/ArrayList;

    return-object v0

    .line 22
    :catchall_371
    move-exception v0

    :try_start_372
    monitor-exit v4
    :try_end_373
    .catchall {:try_start_372 .. :try_end_373} :catchall_371

    throw v0
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
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_15

    return p0

    :catch_15
    move-exception p0

    const/4 p0, 0x0

    return p0
.end method

.method private static shorts(Landroid/content/Context;)Z
    .registers 3

    .line 66
    nop

    :goto_1
    instance-of v0, p0, Landroid/content/ContextWrapper;

    const/4 v1, 0x0

    if-eqz v0, :cond_23

    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_17

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid_re_shorts"

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    :cond_17
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-ne v0, p0, :cond_21

    goto :goto_23

    :cond_21
    move-object p0, v0

    goto :goto_1

    :cond_23
    :goto_23
    return v1
.end method
