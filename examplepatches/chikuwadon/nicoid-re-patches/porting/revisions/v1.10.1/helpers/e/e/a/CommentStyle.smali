.class public final Le/e/a/CommentStyle;
.super Ljava/lang/Object;
.source "CommentStyle.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentStyle$Entry;
    }
.end annotation


# static fields
.field private static final FONTS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/graphics/Typeface;",
            "[",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field

.field private static final LISTENER:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

.field private static final PAINTS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/graphics/Paint;",
            "Le/e/a/CommentStyle$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private static final RENDERERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Landroid/graphics/Paint;",
            ">;"
        }
    .end annotation
.end field

.field private static app:Landroid/content/Context;

.field private static volatile preferences:Landroid/content/SharedPreferences;

.field private static volatile selected:Landroid/graphics/Typeface;

.field private static volatile weight:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/CommentStyle;->PAINTS:Ljava/util/Map;

    .line 6
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/CommentStyle;->RENDERERS:Ljava/util/Map;

    .line 7
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentStyle;->FONTS:Ljava/util/Map;

    .line 8
    const/16 v0, 0x190

    sput v0, Le/e/a/CommentStyle;->weight:I

    .line 9
    new-instance v0, Le/e/a/CommentStyle$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Le/e/a/CommentStyle$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Le/e/a/CommentStyle;->LISTENER:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/graphics/Paint;Landroid/content/Context;)Z
    .registers 3

    .line 14
    sget-object v0, Le/e/a/CommentStyle;->preferences:Landroid/content/SharedPreferences;

    if-nez v0, :cond_7

    invoke-static {p1}, Le/e/a/CommentStyle;->initialize(Landroid/content/Context;)V

    :cond_7
    sget p1, Le/e/a/CommentStyle;->weight:I

    sget-object v0, Le/e/a/CommentStyle;->selected:Landroid/graphics/Typeface;

    invoke-static {p0, p1, v0}, Le/e/a/CommentStyle;->set(Landroid/graphics/Paint;ILandroid/graphics/Typeface;)Z

    move-result p0

    return p0
.end method

.method static applyFont(Landroid/graphics/Paint;ILandroid/graphics/Typeface;)Z
    .registers 3

    .line 15
    invoke-static {p0, p1, p2}, Le/e/a/CommentStyle;->set(Landroid/graphics/Paint;ILandroid/graphics/Typeface;)Z

    move-result p0

    return p0
.end method

.method static applyWeight(Landroid/graphics/Paint;I)Z
    .registers 3

    .line 15
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/CommentStyle;->set(Landroid/graphics/Paint;ILandroid/graphics/Typeface;)Z

    move-result p0

    return p0
.end method

.method public static bind(Landroid/view/View;)V
    .registers 4

    .line 12
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "e.e.a.u"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    const-string v1, "r0"

    goto :goto_19

    :cond_17
    const-string v1, "s0"

    :goto_19
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Paint;

    sget-object v1, Le/e/a/CommentStyle;->RENDERERS:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {v0, p0}, Le/e/a/CommentStyle;->apply(Landroid/graphics/Paint;Landroid/content/Context;)Z
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2f} :catch_30

    goto :goto_38

    :catch_30
    move-exception p0

    const-string v0, "nicoid-comment-style"

    const-string v1, "Could not configure comment font"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_38
    return-void
.end method

.method private static declared-synchronized initialize(Landroid/content/Context;)V
    .registers 3

    const-class v0, Le/e/a/CommentStyle;

    monitor-enter v0

    .line 17
    :try_start_3
    sget-object v1, Le/e/a/CommentStyle;->preferences:Landroid/content/SharedPreferences;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_2b

    if-eqz v1, :cond_9

    :goto_7
    monitor-exit v0

    return-void

    :cond_9
    :try_start_9
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Le/e/a/CommentStyle;->app:Landroid/content/Context;

    sget-object p0, Le/e/a/CommentStyle;->app:Landroid/content/Context;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CommentStyle;->weight(Landroid/content/SharedPreferences;)I

    move-result v1

    sput v1, Le/e/a/CommentStyle;->weight:I

    sget-object v1, Le/e/a/CommentStyle;->app:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/CommentFonts194;->current(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v1

    sput-object v1, Le/e/a/CommentStyle;->selected:Landroid/graphics/Typeface;

    sget-object v1, Le/e/a/CommentStyle;->LISTENER:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    sput-object p0, Le/e/a/CommentStyle;->preferences:Landroid/content/SharedPreferences;
    :try_end_2a
    .catchall {:try_start_9 .. :try_end_2a} :catchall_2b

    goto :goto_7

    .line 17
    :catchall_2b
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method static synthetic lambda$0(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    .line 9
    const-string v0, "comment_font_weight"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const-string v0, "comment_bold"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_10
    invoke-static {p0}, Le/e/a/CommentStyle;->weight(Landroid/content/SharedPreferences;)I

    move-result p0

    sput p0, Le/e/a/CommentStyle;->weight:I

    :cond_16
    invoke-static {p1}, Le/e/a/FontSelection195;->isFontKey(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_24

    sget-object p0, Le/e/a/CommentStyle;->app:Landroid/content/Context;

    invoke-static {p0}, Le/e/a/CommentFonts194;->current(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object p0

    sput-object p0, Le/e/a/CommentStyle;->selected:Landroid/graphics/Typeface;

    :cond_24
    return-void
.end method

.method public static refresh(Ljava/lang/Object;)V
    .registers 3

    .line 13
    sget-object v0, Le/e/a/CommentStyle;->RENDERERS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Paint;

    if-eqz v0, :cond_17

    instance-of v1, p0, Landroid/view/View;

    if-eqz v1, :cond_17

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {v0, p0}, Le/e/a/CommentStyle;->apply(Landroid/graphics/Paint;Landroid/content/Context;)Z

    :cond_17
    return-void
.end method

.method private static set(Landroid/graphics/Paint;ILandroid/graphics/Typeface;)Z
    .registers 12

    .line 16
    sget-object v0, Le/e/a/CommentStyle;->PAINTS:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    sget-object v1, Le/e/a/CommentStyle;->PAINTS:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CommentStyle$Entry;

    const/4 v2, 0x0

    if-nez v1, :cond_1d

    new-instance v1, Le/e/a/CommentStyle$Entry;

    invoke-virtual {p0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    invoke-direct {v1, v3}, Le/e/a/CommentStyle$Entry;-><init>(Landroid/graphics/Typeface;)V

    sget-object v3, Le/e/a/CommentStyle;->PAINTS:Ljava/util/Map;

    invoke-interface {v3, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2d

    :cond_1d
    invoke-virtual {p0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    iget-object v4, v1, Le/e/a/CommentStyle$Entry;->result:Landroid/graphics/Typeface;

    if-eq v3, v4, :cond_2d

    invoke-virtual {p0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    iput-object v3, v1, Le/e/a/CommentStyle$Entry;->original:Landroid/graphics/Typeface;

    iput v2, v1, Le/e/a/CommentStyle$Entry;->weight:I

    :cond_2d
    :goto_2d
    if-nez p2, :cond_31

    iget-object p2, v1, Le/e/a/CommentStyle$Entry;->original:Landroid/graphics/Typeface;

    :cond_31
    iget v3, v1, Le/e/a/CommentStyle$Entry;->weight:I

    if-ne v3, p1, :cond_43

    iget-object v3, v1, Le/e/a/CommentStyle$Entry;->base:Landroid/graphics/Typeface;

    if-ne v3, p2, :cond_43

    invoke-virtual {p0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    iget-object v4, v1, Le/e/a/CommentStyle$Entry;->result:Landroid/graphics/Typeface;

    if-ne v3, v4, :cond_43

    monitor-exit v0

    return v2

    :cond_43
    iput-object p2, v1, Le/e/a/CommentStyle$Entry;->base:Landroid/graphics/Typeface;

    div-int/lit8 v3, p1, 0x64

    add-int/lit8 v3, v3, -0x2

    const/4 v4, 0x5

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    sget-object v4, Le/e/a/CommentStyle;->FONTS:Ljava/util/Map;

    monitor-enter v4
    :try_end_55
    .catchall {:try_start_3 .. :try_end_55} :catchall_9c

    :try_start_55
    sget-object v5, Le/e/a/CommentStyle;->FONTS:Ljava/util/Map;

    invoke-interface {v5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Landroid/graphics/Typeface;

    if-nez v5, :cond_67

    const/4 v5, 0x6

    new-array v5, v5, [Landroid/graphics/Typeface;

    sget-object v6, Le/e/a/CommentStyle;->FONTS:Ljava/util/Map;

    invoke-interface {v6, p2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_67
    aget-object v6, v5, v3

    const/4 v7, 0x1

    if-nez v6, :cond_88

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x1c

    if-lt v6, v8, :cond_7b

    mul-int/lit8 v6, v3, 0x64

    add-int/lit16 v6, v6, 0xc8

    invoke-static {p2, v6, v2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object p2

    goto :goto_86

    :cond_7b
    const/16 v6, 0x258

    if-lt p1, v6, :cond_81

    const/4 v6, 0x1

    goto :goto_82

    :cond_81
    const/4 v6, 0x0

    :goto_82
    invoke-static {p2, v6}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p2

    :goto_86
    aput-object p2, v5, v3

    :cond_88
    aget-object p2, v5, v3

    iput-object p2, v1, Le/e/a/CommentStyle$Entry;->result:Landroid/graphics/Typeface;

    monitor-exit v4
    :try_end_8d
    .catchall {:try_start_55 .. :try_end_8d} :catchall_99

    :try_start_8d
    iget-object p2, v1, Le/e/a/CommentStyle$Entry;->result:Landroid/graphics/Typeface;

    invoke-virtual {p0, p2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    iput p1, v1, Le/e/a/CommentStyle$Entry;->weight:I

    monitor-exit v0
    :try_end_98
    .catchall {:try_start_8d .. :try_end_98} :catchall_9c

    return v7

    :catchall_99
    move-exception p0

    :try_start_9a
    monitor-exit v4
    :try_end_9b
    .catchall {:try_start_9a .. :try_end_9b} :catchall_99

    :try_start_9b
    throw p0

    :catchall_9c
    move-exception p0

    monitor-exit v0
    :try_end_9e
    .catchall {:try_start_9b .. :try_end_9e} :catchall_9c

    throw p0
.end method

.method static weight(Landroid/content/SharedPreferences;)I
    .registers 4

    .line 11
    const-string v0, "comment_bold"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const/16 v1, 0x2bc

    if-eqz v0, :cond_e

    const/16 v0, 0x2bc

    goto :goto_10

    :cond_e
    const/16 v0, 0x190

    :goto_10
    const-string v2, "comment_font_weight"

    invoke-interface {p0, v2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    int-to-float p0, p0

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    mul-int/lit8 p0, p0, 0x64

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/16 v0, 0xc8

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method
