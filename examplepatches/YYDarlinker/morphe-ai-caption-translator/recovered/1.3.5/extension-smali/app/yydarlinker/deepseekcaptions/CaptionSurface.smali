.class final Lapp/yydarlinker/deepseekcaptions/CaptionSurface;
.super Ljava/lang/Object;
.source "CaptionSurface.java"


# static fields
.field private static final REGULAR:[Ljava/lang/String;

.field private static final SHORTS:[Ljava/lang/String;

.field private static activity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static nativeView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private static player:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private static shorts:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .line 11
    const-string v0, "reel_player_page_container"

    const-string v1, "reel_watch_fragment_root"

    const-string v2, "reel_player_overlay_root"

    const-string v3, "reel_watch_player"

    const-string v4, "shorts_player_view_container"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->SHORTS:[Ljava/lang/String;

    .line 18
    const-string v0, "player_overlay"

    const-string v1, "watch_player"

    const-string v2, "inset_overlay_view_layout"

    const-string v3, "player_overlays"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->REGULAR:[Ljava/lang/String;

    .line 21
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->activity:Ljava/lang/ref/WeakReference;

    .line 22
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->shorts:Ljava/lang/ref/WeakReference;

    .line 23
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->player:Ljava/lang/ref/WeakReference;

    .line 24
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->nativeView:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static activity(Landroid/app/Activity;)V
    .registers 2

    .line 27
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->activity:Ljava/lang/ref/WeakReference;

    .line 28
    new-instance p0, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->shorts:Ljava/lang/ref/WeakReference;

    .line 29
    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->player:Ljava/lang/ref/WeakReference;

    .line 30
    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->nativeView:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static bounds(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 2

    .line 114
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->shorts:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->relative(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p0

    return-object p0
.end method

.method static discover(Landroid/view/View;Ljava/util/Set;)Landroid/view/View;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 88
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    if-eqz p0, :cond_a

    .line 89
    invoke-virtual {v0, p0}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    :cond_a
    const/4 p0, 0x0

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    move v4, p0

    .line 91
    :goto_f
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7f

    add-int/lit8 v5, v4, 0x1

    const/16 v6, 0x708

    if-ge v4, v6, :cond_7f

    .line 92
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 93
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_35

    .line 94
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "yydarlinker.deepseek.caption"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_35

    :cond_33
    move v4, v5

    goto :goto_f

    .line 95
    :cond_35
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_62

    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->visible(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_62

    .line 96
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 97
    invoke-virtual {v4, v6}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 98
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-long v7, v7

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-long v9, v6

    mul-long/2addr v7, v9

    cmp-long v6, v7, v2

    if-lez v6, :cond_62

    move-object v1, v4

    move-wide v2, v7

    .line 104
    :cond_62
    instance-of v6, v4, Landroid/view/ViewGroup;

    if-eqz v6, :cond_33

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-nez v6, :cond_33

    .line 105
    check-cast v4, Landroid/view/ViewGroup;

    move v6, p0

    .line 106
    :goto_6f
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v7

    if-ge v6, v7, :cond_33

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_6f

    .line 109
    :cond_7f
    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->shorts:Ljava/lang/ref/WeakReference;

    return-object v1
.end method

.method static isShorts()Z
    .registers 1

    .line 40
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->shorts:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->visible(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method static nativeCenter(Landroid/view/View;Landroid/graphics/Rect;)Ljava/lang/Float;
    .registers 5

    .line 163
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->nativeView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->relative(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p0

    if-eqz p0, :cond_3c

    if-eqz p1, :cond_3c

    .line 166
    invoke-static {p0, p1}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 167
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3ecccccd    # 0.4f

    mul-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_29

    goto :goto_3c

    .line 168
    :cond_29
    invoke-virtual {p0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result p0

    iget v0, p1, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    sub-float/2addr p0, v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :cond_3c
    :goto_3c
    const/4 p0, 0x0

    return-object p0
.end method

.method static nativeRenderer(Landroid/view/View;)V
    .registers 2

    .line 159
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->nativeView:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static player()Landroid/view/View;
    .registers 2

    .line 81
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->player:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 82
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->visible(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_f

    return-object v0

    :cond_f
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->refresh()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method static refresh()Landroid/view/View;
    .registers 19

    .line 44
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_c0

    .line 45
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    if-nez v2, :cond_12

    goto/16 :goto_c0

    .line 46
    :cond_12
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    .line 47
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 48
    sget-object v4, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->SHORTS:[Ljava/lang/String;

    array-length v5, v4

    const/4 v7, 0x0

    :goto_23
    const-string v8, "id"

    if-ge v7, v5, :cond_41

    aget-object v9, v4, v7

    .line 49
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v9, v8, v11}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v8

    if-eqz v8, :cond_3e

    .line 50
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_3e
    add-int/lit8 v7, v7, 0x1

    goto :goto_23

    .line 52
    :cond_41
    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->discover(Landroid/view/View;Ljava/util/Set;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_4f

    .line 54
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->player:Ljava/lang/ref/WeakReference;

    return-object v3

    .line 60
    :cond_4f
    sget-object v3, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->REGULAR:[Ljava/lang/String;

    array-length v4, v3

    const-wide/16 v9, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v11, 0x0

    :goto_57
    if-ge v5, v4, :cond_b4

    aget-object v12, v3, v5

    .line 61
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v12, v8, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v12

    if-nez v12, :cond_6b

    const/4 v12, 0x0

    goto :goto_6f

    .line 62
    :cond_6b
    invoke-virtual {v2, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    .line 63
    :goto_6f
    invoke-static {v12}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->visible(Landroid/view/View;)Z

    move-result v13

    if-eqz v13, :cond_a7

    .line 64
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 65
    invoke-virtual {v12, v13}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 66
    invoke-static {v12, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->renderedBounds(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v14

    if-eqz v14, :cond_85

    const/4 v14, 0x1

    goto :goto_86

    :cond_85
    const/4 v14, 0x0

    .line 68
    :goto_86
    invoke-virtual {v13}, Landroid/graphics/Rect;->width()I

    move-result v15

    move-object/from16 v17, v2

    const/16 v16, 0x0

    int-to-long v1, v15

    invoke-virtual {v13}, Landroid/graphics/Rect;->height()I

    move-result v13

    move-object/from16 v18, v7

    int-to-long v6, v13

    mul-long/2addr v1, v6

    if-eqz v18, :cond_a3

    if-eqz v14, :cond_9d

    if-eqz v11, :cond_a3

    :cond_9d
    if-ne v14, v11, :cond_ad

    cmp-long v6, v1, v9

    if-gez v6, :cond_ad

    :cond_a3
    move-wide v9, v1

    move-object v7, v12

    move v11, v14

    goto :goto_af

    :cond_a7
    move-object/from16 v17, v2

    move-object/from16 v18, v7

    const/16 v16, 0x0

    :cond_ad
    move-object/from16 v7, v18

    :goto_af
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v2, v17

    goto :goto_57

    :cond_b4
    move-object/from16 v18, v7

    .line 76
    new-instance v0, Ljava/lang/ref/WeakReference;

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->player:Ljava/lang/ref/WeakReference;

    return-object v1

    :cond_c0
    :goto_c0
    const/16 v16, 0x0

    return-object v16
.end method

.method private static relative(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Rect;
    .registers 5

    .line 118
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->visible(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_39

    if-nez p1, :cond_a

    goto :goto_39

    .line 119
    :cond_a
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 120
    invoke-virtual {p0, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p0

    if-eqz p0, :cond_39

    invoke-virtual {p1, v2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p0

    if-eqz p0, :cond_39

    invoke-virtual {v0, v2}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    move-result p0

    if-nez p0, :cond_27

    goto :goto_39

    :cond_27
    const/4 p0, 0x2

    .line 121
    new-array p0, p0, [I

    .line 122
    invoke-virtual {p1, p0}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 p1, 0x0

    .line 123
    aget p1, p0, p1

    neg-int p1, p1

    const/4 v1, 0x1

    aget p0, p0, v1

    neg-int p0, p0

    invoke-virtual {v0, p1, p0}, Landroid/graphics/Rect;->offset(II)V

    return-object v0

    :cond_39
    :goto_39
    return-object v1
.end method

.method static renderedBounds(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Rect;
    .registers 13

    const/4 v0, 0x0

    if-eqz p0, :cond_7c

    if-nez p1, :cond_7

    goto/16 :goto_7c

    .line 129
    :cond_7
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    .line 130
    invoke-virtual {v1, p0}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    const/4 p0, 0x0

    const-wide/16 v2, 0x0

    move v4, p0

    .line 134
    :goto_13
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7c

    add-int/lit8 v5, v4, 0x1

    const/16 v6, 0x384

    if-ge v4, v6, :cond_7c

    .line 135
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 136
    invoke-virtual {v4}, Landroid/view/View;->isShown()Z

    move-result v6

    if-eqz v6, :cond_7a

    invoke-virtual {v4}, Landroid/view/View;->getAlpha()F

    move-result v6

    float-to-double v6, v6

    const-wide v8, 0x3f847ae147ae147bL    # 0.01

    cmpg-double v6, v6, v8

    if-gtz v6, :cond_3a

    goto :goto_7a

    .line 137
    :cond_3a
    instance-of v6, v4, Landroid/view/SurfaceView;

    if-nez v6, :cond_42

    instance-of v6, v4, Landroid/view/TextureView;

    if-eqz v6, :cond_63

    .line 138
    :cond_42
    invoke-static {v4, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->relative(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v6

    if-eqz v6, :cond_63

    .line 139
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-long v7, v7

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v9

    int-to-long v9, v9

    mul-long/2addr v7, v9

    cmp-long v7, v7, v2

    if-lez v7, :cond_63

    .line 141
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-long v2, v0

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-long v7, v0

    mul-long/2addr v2, v7

    move-object v0, v6

    .line 144
    :cond_63
    instance-of v6, v4, Landroid/view/ViewGroup;

    if-eqz v6, :cond_7a

    .line 145
    check-cast v4, Landroid/view/ViewGroup;

    move v6, p0

    .line 146
    :goto_6a
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v7

    if-ge v6, v7, :cond_7a

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_6a

    :cond_7a
    :goto_7a
    move v4, v5

    goto :goto_13

    :cond_7c
    :goto_7c
    return-object v0
.end method

.method static videoBounds(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 3

    .line 153
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->player()Landroid/view/View;

    move-result-object v0

    .line 154
    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->renderedBounds(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    if-nez v1, :cond_f

    .line 155
    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->relative(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p0

    return-object p0

    :cond_f
    return-object v1
.end method

.method static visible(Landroid/view/View;)Z
    .registers 6

    const/4 v0, 0x0

    if-eqz p0, :cond_39

    .line 34
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v1

    float-to-double v1, v1

    const-wide v3, 0x3f847ae147ae147bL    # 0.01

    cmpg-double v1, v1, v3

    if-gtz v1, :cond_1e

    goto :goto_39

    .line 35
    :cond_1e
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 36
    invoke-virtual {p0, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p0

    if-eqz p0, :cond_39

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result p0

    const/16 v2, 0x28

    if-le p0, v2, :cond_39

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result p0

    if-le p0, v2, :cond_39

    const/4 p0, 0x1

    return p0

    :cond_39
    :goto_39
    return v0
.end method
