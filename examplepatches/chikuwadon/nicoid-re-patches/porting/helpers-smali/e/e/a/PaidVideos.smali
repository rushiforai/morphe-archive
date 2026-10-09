.class public final Le/e/a/PaidVideos;
.super Ljava/lang/Object;
.source "PaidVideos.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "nicoid_payment_badge"

.field private static final known:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 19
    new-instance v0, Ljava/util/LinkedHashMap;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x10

    invoke-direct {v0, v3, v1, v2}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    sput-object v0, Le/e/a/PaidVideos;->known:Ljava/util/LinkedHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bind(Landroid/view/View;Ljava/lang/Object;)V
    .registers 8
    .param p0, "root"    # Landroid/view/View;
    .param p1, "row"    # Ljava/lang/Object;

    .line 62
    if-eqz p0, :cond_54

    if-nez p1, :cond_5

    goto :goto_54

    .line 64
    :cond_5
    :try_start_5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "a"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    const-string v3, "videourl"

    aput-object v3, v1, v5

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 65
    .local v0, "url":Ljava/lang/Object;
    const v1, 0x7f0801b2

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 66
    .local v1, "thumbnail":Landroid/view/View;
    if-eqz v1, :cond_49

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/ViewGroup;

    if-eqz v3, :cond_49

    .line 67
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    if-eqz v0, :cond_45

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Le/e/a/PaidVideos;->required(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_45

    goto :goto_46

    :cond_45
    const/4 v2, 0x0

    :goto_46
    invoke-static {v3, v2}, Le/e/a/PaidVideos;->show(Landroid/view/ViewGroup;Z)V
    :try_end_49
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_5 .. :try_end_49} :catch_4b

    .line 69
    .end local v0    # "url":Ljava/lang/Object;
    .end local v1    # "thumbnail":Landroid/view/View;
    :cond_49
    nop

    .line 70
    return-void

    .line 69
    :catch_4b
    move-exception v0

    .local v0, "error":Ljava/lang/ReflectiveOperationException;
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Unsupported video row"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 62
    .end local v0    # "error":Ljava/lang/ReflectiveOperationException;
    :cond_54
    :goto_54
    return-void
.end method

.method public static bindAdapter(Landroid/view/View;Ljava/lang/Object;I)V
    .registers 6
    .param p0, "root"    # Landroid/view/View;
    .param p1, "adapter"    # Ljava/lang/Object;
    .param p2, "position"    # I

    .line 51
    if-nez p0, :cond_3

    return-void

    .line 53
    :cond_3
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "b"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 54
    .local v0, "rows":Ljava/util/List;, "Ljava/util/List<*>;"
    if-ltz p2, :cond_25

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-ge p2, v1, :cond_25

    .line 55
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 56
    .local v1, "row":Ljava/lang/Object;
    invoke-static {p0, p1, v1}, Le/e/a/HistorySupport;->bindAccount(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 57
    invoke-static {p0, v1}, Le/e/a/PaidVideos;->bind(Landroid/view/View;Ljava/lang/Object;)V
    :try_end_25
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_3 .. :try_end_25} :catch_27

    .line 59
    .end local v0    # "rows":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v1    # "row":Ljava/lang/Object;
    :cond_25
    nop

    .line 60
    return-void

    .line 59
    :catch_27
    move-exception v0

    .local v0, "error":Ljava/lang/ReflectiveOperationException;
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Unsupported video adapter"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "value"    # I

    .line 116
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float v1, p1

    mul-float v0, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method static foreground(I)I
    .registers 12
    .param p0, "background"    # I

    .line 72
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {v0}, Le/e/a/PaidVideos;->linear(I)D

    move-result-wide v0

    .local v0, "red":D
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-static {v2}, Le/e/a/PaidVideos;->linear(I)D

    move-result-wide v2

    .local v2, "green":D
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    invoke-static {v4}, Le/e/a/PaidVideos;->linear(I)D

    move-result-wide v4

    .line 73
    .local v4, "blue":D
    const-wide v6, 0x3fcb367a0f9096bcL    # 0.2126

    mul-double v6, v6, v0

    const-wide v8, 0x3fe6e2eb1c432ca5L    # 0.7152

    mul-double v8, v8, v2

    add-double/2addr v6, v8

    const-wide v8, 0x3fb27bb2fec56d5dL    # 0.0722

    mul-double v8, v8, v4

    add-double/2addr v6, v8

    const-wide v8, 0x3fc6e978d4fdf3b6L    # 0.179

    cmpl-double v10, v6, v8

    if-lez v10, :cond_3b

    const/high16 v6, -0x1000000

    goto :goto_3c

    :cond_3b
    const/4 v6, -0x1

    :goto_3c
    return v6
.end method

.method static id(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "value"    # Ljava/lang/String;

    .line 22
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    .line 23
    :cond_5
    move-object v1, p0

    .line 24
    .local v1, "id":Ljava/lang/String;
    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .local v2, "slash":I
    if-ltz v2, :cond_14

    add-int/lit8 v3, v2, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 25
    :cond_14
    const/16 v3, 0x3f

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .local v3, "query":I
    const/4 v4, 0x0

    if-ltz v3, :cond_21

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 26
    :cond_21
    const/16 v5, 0x23

    invoke-virtual {v1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .local v5, "fragment":I
    if-ltz v5, :cond_2d

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 27
    :cond_2d
    const-string v4, "(?:sm|so|nm|ss)?[0-9]+"

    invoke-virtual {v1, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_36

    move-object v0, v1

    :cond_36
    return-object v0
.end method

.method public static item(Lorg/json/JSONArray;I)Lorg/json/JSONObject;
    .registers 3
    .param p0, "array"    # Lorg/json/JSONArray;
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 39
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .local v0, "source":Lorg/json/JSONObject;
    invoke-static {v0}, Le/e/a/PaidVideos;->remember(Lorg/json/JSONObject;)V

    return-object v0
.end method

.method private static linear(I)D
    .registers 7
    .param p0, "value"    # I

    .line 75
    int-to-double v0, p0

    const-wide v2, 0x406fe00000000000L    # 255.0

    div-double/2addr v0, v2

    .local v0, "n":D
    const-wide v2, 0x3fa4b5dcc63f1412L    # 0.04045

    cmpg-double v4, v0, v2

    if-gtz v4, :cond_18

    const-wide v2, 0x4029d70a3d70a3d7L    # 12.92

    div-double v2, v0, v2

    goto :goto_2d

    :cond_18
    const-wide v2, 0x3fac28f5c28f5c29L    # 0.055

    add-double/2addr v2, v0

    const-wide v4, 0x3ff0e147ae147ae1L    # 1.055

    div-double/2addr v2, v4

    const-wide v4, 0x4003333333333333L    # 2.4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    :goto_2d
    return-wide v2
.end method

.method public static remember(Lorg/json/JSONObject;)V
    .registers 6
    .param p0, "source"    # Lorg/json/JSONObject;

    .line 30
    if-eqz p0, :cond_68

    const-string v0, "isPaymentRequired"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_68

    const-string v0, "isPaymentRequired"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    goto :goto_68

    .line 31
    :cond_13
    const-string v0, "id"

    const-string v1, "videourl"

    const-string v2, ""

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PaidVideos;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 32
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2c

    return-void

    .line 33
    :cond_2c
    sget-object v1, Le/e/a/PaidVideos;->known:Ljava/util/LinkedHashMap;

    monitor-enter v1

    .line 34
    :try_start_2f
    sget-object v2, Le/e/a/PaidVideos;->known:Ljava/util/LinkedHashMap;

    const-string v3, "isPaymentRequired"

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    :goto_3f
    sget-object v2, Le/e/a/PaidVideos;->known:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    const/16 v3, 0x400

    if-le v2, v3, :cond_63

    sget-object v2, Le/e/a/PaidVideos;->known:Ljava/util/LinkedHashMap;

    sget-object v3, Le/e/a/PaidVideos;->known:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3f

    .line 36
    :cond_63
    monitor-exit v1

    .line 37
    return-void

    .line 36
    :catchall_65
    move-exception v2

    monitor-exit v1
    :try_end_67
    .catchall {:try_start_2f .. :try_end_67} :catchall_65

    throw v2

    .line 30
    .end local v0    # "key":Ljava/lang/String;
    :cond_68
    :goto_68
    return-void
.end method

.method static required(Ljava/lang/String;)Z
    .registers 5
    .param p0, "key"    # Ljava/lang/String;

    .line 42
    sget-object v0, Le/e/a/PaidVideos;->known:Ljava/util/LinkedHashMap;

    monitor-enter v0

    :try_start_3
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object v2, Le/e/a/PaidVideos;->known:Ljava/util/LinkedHashMap;

    invoke-static {p0}, Le/e/a/PaidVideos;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    monitor-exit v0

    return v1

    :catchall_15
    move-exception v1

    monitor-exit v0
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v1
.end method

.method public static show(Landroid/view/ViewGroup;Z)V
    .registers 16
    .param p0, "thumbnail"    # Landroid/view/ViewGroup;
    .param p1, "paid"    # Z

    .line 77
    const-string v0, "nicoid_payment_badge"

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 78
    .local v1, "badge":Landroid/widget/TextView;
    const/16 v2, 0x8

    if-nez p1, :cond_12

    if-eqz v1, :cond_11

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_11
    return-void

    .line 79
    :cond_12
    const/4 v3, 0x4

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-nez v1, :cond_7b

    .line 80
    new-instance v6, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object v1, v6

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 81
    const v0, 0x41366666    # 11.4f

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 82
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v3}, Le/e/a/PaidVideos;->dp(Landroid/content/Context;I)I

    move-result v0

    .local v0, "padding":I
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6, v5}, Le/e/a/PaidVideos;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v5}, Le/e/a/PaidVideos;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v1, v0, v6, v0, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 83
    const/16 v6, 0x11

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 84
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setClickable(Z)V

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 85
    instance-of v6, p0, Landroid/widget/RelativeLayout;

    const/4 v7, -0x2

    if-eqz v6, :cond_6b

    .line 86
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v6, v7, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 87
    .local v6, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v7, 0x9

    invoke-virtual {v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v7, 0xa

    invoke-virtual {v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {p0, v1, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    .end local v6    # "lp":Landroid/widget/RelativeLayout$LayoutParams;
    goto :goto_7b

    :cond_6b
    instance-of v6, p0, Landroid/widget/FrameLayout;

    if-eqz v6, :cond_7a

    .line 89
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v8, 0x33

    invoke-direct {v6, v7, v7, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v1, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_7b

    .line 90
    :cond_7a
    return-void

    .line 92
    .end local v0    # "padding":I
    :cond_7b
    :goto_7b
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .local v0, "accent":Landroid/util/TypedValue;
    invoke-virtual {v1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v6

    .line 93
    .local v6, "context":Landroid/content/Context;
    const v7, -0xbbbbbc

    .line 94
    .local v7, "color":I
    invoke-virtual {v6}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v8

    const v9, 0x7f03005e

    invoke-virtual {v8, v9, v0, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v8

    if-eqz v8, :cond_a6

    iget v8, v0, Landroid/util/TypedValue;->resourceId:I

    if-nez v8, :cond_9b

    iget v8, v0, Landroid/util/TypedValue;->data:I

    goto :goto_a5

    :cond_9b
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    iget v9, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    :goto_a5
    move v7, v8

    .line 95
    :cond_a6
    invoke-static {v7}, Landroid/graphics/Color;->red(I)I

    move-result v8

    invoke-static {v7}, Landroid/graphics/Color;->green(I)I

    move-result v9

    invoke-static {v7}, Landroid/graphics/Color;->blue(I)I

    move-result v10

    invoke-static {v8, v9, v10}, Landroid/graphics/Color;->rgb(III)I

    move-result v7

    .line 96
    new-instance v8, Landroid/util/TypedValue;

    invoke-direct {v8}, Landroid/util/TypedValue;-><init>()V

    .line 97
    .local v8, "background":Landroid/util/TypedValue;
    invoke-virtual {v6}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v9

    const v10, 0x1010031

    invoke-virtual {v9, v10, v8, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v9

    if-eqz v9, :cond_f5

    .line 98
    iget v9, v8, Landroid/util/TypedValue;->resourceId:I

    if-nez v9, :cond_cf

    iget v9, v8, Landroid/util/TypedValue;->data:I

    goto :goto_d9

    :cond_cf
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    iget v10, v8, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    .line 99
    .local v9, "bg":I
    :goto_d9
    invoke-static {v9}, Landroid/graphics/Color;->red(I)I

    move-result v10

    mul-int/lit16 v10, v10, 0x12b

    invoke-static {v9}, Landroid/graphics/Color;->green(I)I

    move-result v11

    mul-int/lit16 v11, v11, 0x24b

    add-int/2addr v10, v11

    invoke-static {v9}, Landroid/graphics/Color;->blue(I)I

    move-result v11

    mul-int/lit8 v11, v11, 0x72

    add-int/2addr v10, v11

    const v11, 0x1f400

    if-ge v10, v11, :cond_f5

    const v7, -0xbbbbbc

    .line 101
    .end local v9    # "bg":I
    :cond_f5
    const v9, 0x7f0800df

    invoke-virtual {p0, v9}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v9

    .line 102
    .local v9, "durationView":Landroid/view/View;
    instance-of v10, v9, Landroid/widget/TextView;

    if-eqz v10, :cond_128

    .line 103
    move-object v10, v9

    check-cast v10, Landroid/widget/TextView;

    .line 104
    .local v10, "duration":Landroid/widget/TextView;
    invoke-virtual {v10}, Landroid/widget/TextView;->getTextSize()F

    move-result v11

    const v12, 0x3f733333    # 0.95f

    mul-float v11, v11, v12

    invoke-virtual {v1, v4, v11}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 105
    invoke-virtual {v10}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v11

    invoke-virtual {v1, v11}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 106
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 107
    invoke-static {v6, v3}, Le/e/a/PaidVideos;->dp(Landroid/content/Context;I)I

    move-result v11

    .line 108
    .local v11, "padding":I
    invoke-static {v6, v5}, Le/e/a/PaidVideos;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-static {v6, v5}, Le/e/a/PaidVideos;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-virtual {v1, v11, v12, v11, v13}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 110
    .end local v10    # "duration":Landroid/widget/TextView;
    .end local v11    # "padding":I
    :cond_128
    new-instance v10, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v10}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .local v10, "shape":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v10, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 111
    invoke-static {v6, v3}, Le/e/a/PaidVideos;->dp(Landroid/content/Context;I)I

    move-result v11

    int-to-float v11, v11

    .line 112
    .local v11, "radius":F
    new-array v2, v2, [F

    const/4 v12, 0x0

    aput v12, v2, v4

    aput v12, v2, v5

    const/4 v5, 0x2

    aput v12, v2, v5

    const/4 v5, 0x3

    aput v12, v2, v5

    aput v11, v2, v3

    const/4 v3, 0x5

    aput v11, v2, v3

    const/4 v3, 0x6

    aput v12, v2, v3

    const/4 v3, 0x7

    aput v12, v2, v3

    invoke-virtual {v10, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 113
    invoke-virtual {v1, v10}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-static {v7}, Le/e/a/PaidVideos;->foreground(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 114
    const-string v2, "\u6709\u6599"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 115
    return-void
.end method

.method static watchRequired(Lorg/json/JSONObject;)Z
    .registers 4
    .param p0, "watch"    # Lorg/json/JSONObject;

    .line 45
    const/4 v0, 0x0

    if-nez p0, :cond_5

    move-object v1, v0

    goto :goto_b

    :cond_5
    const-string v1, "payment"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 46
    .local v1, "payment":Lorg/json/JSONObject;
    :goto_b
    if-nez v1, :cond_e

    goto :goto_14

    :cond_e
    const-string v0, "video"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 47
    .local v0, "video":Lorg/json/JSONObject;
    :goto_14
    if-eqz v0, :cond_38

    const-string v2, "isPpv"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_36

    const-string v2, "isAdmission"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_36

    .line 48
    const-string v2, "isPremium"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_36

    const-string v2, "isContinuationBenefit"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_38

    :cond_36
    const/4 v2, 0x1

    goto :goto_39

    :cond_38
    const/4 v2, 0x0

    .line 47
    :goto_39
    return v2
.end method
