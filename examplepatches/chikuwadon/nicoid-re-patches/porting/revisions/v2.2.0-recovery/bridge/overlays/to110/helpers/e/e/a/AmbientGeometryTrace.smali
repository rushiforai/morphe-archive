.class final Le/e/a/AmbientGeometryTrace;
.super Ljava/lang/Object;
.source "AmbientGeometryTrace.java"


# instance fields
.field private next:J

.field private final position:[I

.field private previous:Ljava/lang/String;

.field private final visible:Landroid/graphics/Rect;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Le/e/a/AmbientGeometryTrace;->position:[I

    .line 15
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Le/e/a/AmbientGeometryTrace;->visible:Landroid/graphics/Rect;

    return-void
.end method

.method private append(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V
    .registers 10
    .param p1, "line"    # Ljava/lang/StringBuilder;
    .param p2, "role"    # Ljava/lang/String;
    .param p3, "view"    # Landroid/view/View;

    .line 73
    const-string v0, "\n  "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 74
    const-string v0, "none"

    if-nez p3, :cond_0

    .line 75
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    return-void

    .line 78
    :cond_0
    iget-object v1, p0, Le/e/a/AmbientGeometryTrace;->position:[I

    invoke-virtual {p3, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 79
    invoke-virtual {p3}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 80
    .local v1, "bg":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .line 81
    .local v2, "parent":Landroid/view/ViewParent;
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 82
    const-string v4, " screen="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Le/e/a/AmbientGeometryTrace;->position:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Le/e/a/AmbientGeometryTrace;->position:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 83
    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x78

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 84
    const-string v4, " visible="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Le/e/a/AmbientGeometryTrace;->visible:Landroid/graphics/Rect;

    invoke-virtual {p3, v4}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Le/e/a/AmbientGeometryTrace;->visible:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_1
    move-object v4, v0

    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 85
    const-string v4, " shown="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p3}, Landroid/view/View;->isShown()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " alpha="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p3}, Landroid/view/View;->getAlpha()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 86
    const-string v4, " z="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p3}, Landroid/view/View;->getZ()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " elevation="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p3}, Landroid/view/View;->getElevation()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 87
    const-string v4, " bg="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-nez v1, :cond_2

    move-object v4, v0

    goto :goto_1

    :cond_2
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    :goto_1
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 88
    const-string v4, " parent="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-nez v2, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    instance-of v0, p3, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4

    .line 90
    move-object v0, p3

    check-cast v0, Landroid/view/ViewGroup;

    .line 91
    .local v0, "group":Landroid/view/ViewGroup;
    const-string v3, " clipChildren="

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getClipChildren()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 92
    const-string v4, " clipPadding="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getClipToPadding()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 94
    .end local v0    # "group":Landroid/view/ViewGroup;
    :cond_4
    return-void
.end method

.method private children(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/ViewGroup;)V
    .registers 8
    .param p1, "line"    # Ljava/lang/StringBuilder;
    .param p2, "label"    # Ljava/lang/String;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .line 68
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 69
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {p0, p1, v2, v3}, Le/e/a/AmbientGeometryTrace;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 70
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method private emit(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .line 97
    iget-object v0, p0, Le/e/a/AmbientGeometryTrace;->previous:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 98
    :cond_0
    iput-object p1, p0, Le/e/a/AmbientGeometryTrace;->previous:Ljava/lang/String;

    .line 99
    invoke-static {p1}, Le/e/a/AmbientGeometryTrace;->record(Ljava/lang/String;)V

    .line 100
    return-void
.end method

.method static record(Ljava/lang/String;)V
    .registers 8
    .param p0, "message"    # Ljava/lang/String;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lnicoid/network238/DiagnosticThrottle276;->ambient(Ljava/lang/String;J)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 103
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[ambient-geometry] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 104
    .local v0, "line":Ljava/lang/String;
    const-string v1, "nicoid-ambient"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    :try_start_0
    const-string v1, "e.e.a.ModernDebug"

    const-string v2, "record"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v6

    invoke-static {v1, v2, v4, v3}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    goto :goto_0

    .line 107
    :catch_0
    move-exception v1

    .line 110
    :goto_0
    return-void
.end method


# virtual methods
.method begin()Z
    .registers 6

    .line 20
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 21
    .local v0, "now":J
    iget-wide v2, p0, Le/e/a/AmbientGeometryTrace;->next:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const/4 v2, 0x0

    return v2

    .line 22
    :cond_0
    const-wide/16 v2, 0x3e8

    add-long/2addr v2, v0

    iput-wide v2, p0, Le/e/a/AmbientGeometryTrace;->next:J

    .line 23
    const/4 v2, 0x1

    return v2
.end method

.method layout(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;[IIIZZZ)V
    .registers 36
    .param p1, "root"    # Landroid/view/View;
    .param p2, "host"    # Landroid/view/View;
    .param p3, "decor"    # Landroid/view/View;
    .param p4, "target"    # Landroid/view/View;
    .param p5, "source"    # Landroid/view/View;
    .param p6, "tab"    # Landroid/view/View;
    .param p7, "pager"    # Landroid/view/ViewGroup;
    .param p8, "page"    # Landroid/view/View;
    .param p9, "frame"    # Landroid/graphics/Rect;
    .param p10, "glow"    # Landroid/graphics/Rect;
    .param p11, "exterior"    # Landroid/graphics/Rect;
    .param p12, "limits"    # [I
    .param p13, "intensity"    # I
    .param p14, "spread"    # I
    .param p15, "split"    # Z
    .param p16, "tabActive"    # Z
    .param p17, "pageActive"    # Z

    .line 37
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p7

    move-object/from16 v3, p8

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "NORMAL"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .local v4, "line":Ljava/lang/StringBuilder;
    const-string v5, " density="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 39
    const-string v6, " strength="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v6, p13

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " spreadDp="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v7, p14

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 40
    const-string v8, " split="

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v8, p15

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, " tabInstalled="

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v9, p16

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 41
    const-string v10, " pageInstalled="

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v10, p17

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 42
    const-string v11, " frame="

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p9 .. p9}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v11, " glow="

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p10 .. p10}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 43
    const-string v11, " exterior="

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p11 .. p11}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 44
    const-string v11, " limitsPx="

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static/range {p12 .. p12}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    invoke-virtual/range {p3 .. p3}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v5

    .line 46
    .local v5, "insets":Landroid/view/WindowInsets;
    if-eqz v5, :cond_0

    .line 47
    const-string v11, " insets="

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0x2c

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 48
    invoke-virtual {v5}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 49
    invoke-virtual {v5}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    move-result v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 50
    invoke-virtual {v5}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    :cond_0
    const-string v11, "root"

    invoke-direct {v0, v4, v11, v1}, Le/e/a/AmbientGeometryTrace;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V

    .line 53
    const-string v11, "host"

    move-object/from16 v12, p2

    invoke-direct {v0, v4, v11, v12}, Le/e/a/AmbientGeometryTrace;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V

    .line 54
    const-string v11, "decor"

    move-object/from16 v13, p3

    invoke-direct {v0, v4, v11, v13}, Le/e/a/AmbientGeometryTrace;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V

    .line 55
    const-string v11, "commentlay"

    move-object/from16 v14, p4

    invoke-direct {v0, v4, v11, v14}, Le/e/a/AmbientGeometryTrace;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V

    .line 56
    const-string v11, "source"

    move-object/from16 v15, p5

    invoke-direct {v0, v4, v11, v15}, Le/e/a/AmbientGeometryTrace;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V

    .line 57
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v16

    move-object/from16 v17, v5

    .end local v5    # "insets":Landroid/view/WindowInsets;
    .local v17, "insets":Landroid/view/WindowInsets;
    invoke-virtual/range {v16 .. v16}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "videoLayout"

    const-string v7, "id"

    invoke-virtual {v11, v6, v7, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 58
    .local v5, "id":I
    if-nez v5, :cond_1

    const/4 v7, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    :goto_0
    invoke-direct {v0, v4, v6, v7}, Le/e/a/AmbientGeometryTrace;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V

    .line 59
    const-string v6, "tab"

    move-object/from16 v7, p6

    invoke-direct {v0, v4, v6, v7}, Le/e/a/AmbientGeometryTrace;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V

    .line 60
    const-string v6, "pager"

    invoke-direct {v0, v4, v6, v2}, Le/e/a/AmbientGeometryTrace;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V

    .line 61
    if-eqz v2, :cond_2

    const-string v6, "pagerChild"

    invoke-direct {v0, v4, v6, v2}, Le/e/a/AmbientGeometryTrace;->children(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/ViewGroup;)V

    .line 62
    :cond_2
    const-string v6, "matched"

    invoke-direct {v0, v4, v6, v3}, Le/e/a/AmbientGeometryTrace;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V

    .line 63
    instance-of v6, v3, Landroid/view/ViewGroup;

    if-eqz v6, :cond_3

    const-string v6, "matchedChild"

    move-object v11, v3

    check-cast v11, Landroid/view/ViewGroup;

    invoke-direct {v0, v4, v6, v11}, Le/e/a/AmbientGeometryTrace;->children(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/ViewGroup;)V

    .line 64
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6}, Le/e/a/AmbientGeometryTrace;->emit(Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method unavailable(Ljava/lang/String;Landroid/view/View;)V
    .registers 5
    .param p1, "role"    # Ljava/lang/String;
    .param p2, "view"    # Landroid/view/View;

    .line 27
    invoke-virtual {p0}, Le/e/a/AmbientGeometryTrace;->begin()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 28
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unavailable "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 29
    .local v0, "line":Ljava/lang/StringBuilder;
    invoke-direct {p0, v0, p1, p2}, Le/e/a/AmbientGeometryTrace;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Landroid/view/View;)V

    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Le/e/a/AmbientGeometryTrace;->emit(Ljava/lang/String;)V

    .line 31
    return-void
.end method
