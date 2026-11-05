.class public final Le/e/a/FullscreenViewport205;
.super Ljava/lang/Object;
.source "FullscreenViewport205.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FullscreenViewport205$Moved;,
        Le/e/a/FullscreenViewport205$Saved;,
        Le/e/a/FullscreenViewport205$Session;
    }
.end annotation


# static fields
.field private static final sessions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/FullscreenViewport205$Session;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 13
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/FullscreenViewport205;->sessions:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 1

    .line 57
    invoke-static {p0}, Le/e/a/FullscreenViewport205;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method private static copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 57
    instance-of v0, p0, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v0, :cond_c

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    check-cast p0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, p0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/widget/RelativeLayout$LayoutParams;)V

    return-object v0

    :cond_c
    instance-of v0, p0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_18

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    check-cast p0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/widget/LinearLayout$LayoutParams;)V

    return-object v0

    :cond_18
    instance-of v0, p0, Landroid/widget/FrameLayout$LayoutParams;

    if-eqz v0, :cond_24

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    return-object v0

    :cond_24
    instance-of v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_30

    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, p0}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object v0

    :cond_30
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, p0}, Landroid/view/ViewGroup$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method private static owner(Landroid/content/Context;)Landroid/app/Activity;
    .registers 3

    .line 15
    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x10

    if-lt v0, v1, :cond_6

    :goto_5
    goto :goto_1c

    :cond_6
    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_d

    check-cast p0, Landroid/app/Activity;

    return-object p0

    :cond_d
    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_12

    goto :goto_5

    :cond_12
    move-object v1, p0

    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    if-ne v1, p0, :cond_1e

    goto :goto_5

    :goto_1c
    const/4 p0, 0x0

    return-object p0

    :cond_1e
    add-int/lit8 v0, v0, 0x1

    move-object p0, v1

    goto :goto_1
.end method

.method public static restore(Landroid/view/View;)V
    .registers 5

    .line 42
    sget-object v0, Le/e/a/FullscreenViewport205;->sessions:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/FullscreenViewport205$Session;

    if-nez p0, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0}, Le/e/a/FullscreenViewport205$Session;->removeListeners()V

    invoke-virtual {p0}, Le/e/a/FullscreenViewport205$Session;->restoreParents()V

    iget-object v0, p0, Le/e/a/FullscreenViewport205$Session;->saved:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_5a

    iget-object v0, p0, Le/e/a/FullscreenViewport205$Session;->decor:Landroid/view/View;

    if-eqz v0, :cond_2c

    iget-object v0, p0, Le/e/a/FullscreenViewport205$Session;->decor:Landroid/view/View;

    iget v1, p0, Le/e/a/FullscreenViewport205$Session;->flags:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_2c
    iget-object v0, p0, Le/e/a/FullscreenViewport205$Session;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_59

    iget-object v0, p0, Le/e/a/FullscreenViewport205$Session;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget v1, p0, Le/e/a/FullscreenViewport205$Session;->windowFlags:I

    const/16 v2, 0x400

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFlags(II)V

    iget v1, p0, Le/e/a/FullscreenViewport205$Session;->cutout:I

    if-ltz v1, :cond_59

    :try_start_41
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "layoutInDisplayCutoutMode"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    iget p0, p0, Le/e/a/FullscreenViewport205$Session;->cutout:I

    invoke-virtual {v2, v1, p0}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_57} :catch_58

    goto :goto_59

    :catch_58
    move-exception p0

    :cond_59
    :goto_59
    return-void

    :cond_5a
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FullscreenViewport205$Saved;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v2, v1}, Le/e/a/FullscreenViewport205$Saved;->restore(Landroid/view/View;)V

    goto :goto_1b
.end method

.method public static top(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .registers 5

    .line 45
    const/high16 p3, 0x77000000

    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundColor(I)V

    const/4 p1, 0x0

    if-eqz p2, :cond_b

    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 46
    :cond_b
    if-eqz p4, :cond_39

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    const/high16 p2, 0x41400000    # 12.0f

    mul-float/2addr p0, p2

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-virtual {p4}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    if-ne p2, p0, :cond_36

    invoke-virtual {p4}, Landroid/view/View;->getPaddingTop()I

    move-result p2

    if-nez p2, :cond_36

    invoke-virtual {p4}, Landroid/view/View;->getPaddingRight()I

    move-result p2

    if-ne p2, p0, :cond_36

    invoke-virtual {p4}, Landroid/view/View;->getPaddingBottom()I

    move-result p2

    if-eqz p2, :cond_39

    :cond_36
    invoke-virtual {p4, p0, p1, p0, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 47
    :cond_39
    return-void
.end method

.method public static update(Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;)V
    .registers 21

    .line 17
    move-object/from16 v8, p0

    move-object/from16 v1, p1

    if-nez v8, :cond_7

    return-void

    .line 18
    :cond_7
    sget-object v0, Le/e/a/FullscreenViewport205;->sessions:Ljava/util/Map;

    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FullscreenViewport205$Session;

    if-nez v2, :cond_40

    new-instance v2, Le/e/a/FullscreenViewport205$Session;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Le/e/a/FullscreenViewport205$Session;-><init>(Le/e/a/FullscreenViewport205$Session;)V

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/FullscreenViewport205;->owner(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    iput-object v0, v2, Le/e/a/FullscreenViewport205$Session;->activity:Landroid/app/Activity;

    iput-object v1, v2, Le/e/a/FullscreenViewport205$Session;->decor:Landroid/view/View;

    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getSystemUiVisibility()I

    move-result v0

    iput v0, v2, Le/e/a/FullscreenViewport205$Session;->flags:I

    iget-object v0, v2, Le/e/a/FullscreenViewport205$Session;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_3e

    iget-object v0, v2, Le/e/a/FullscreenViewport205$Session;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    iput v0, v2, Le/e/a/FullscreenViewport205$Session;->windowFlags:I

    .line 19
    :cond_3e
    move-object v15, v2

    goto :goto_41

    .line 18
    :cond_40
    move-object v15, v2

    .line 19
    :goto_41
    iget-object v0, v15, Le/e/a/FullscreenViewport205$Session;->activity:Landroid/app/Activity;

    const/16 v16, 0x1

    if-eqz v0, :cond_9e

    iget-object v0, v15, Le/e/a/FullscreenViewport205$Session;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/16 v3, 0x400

    and-int/2addr v2, v3

    if-nez v2, :cond_5b

    invoke-virtual {v0, v3}, Landroid/view/Window;->addFlags(I)V

    :cond_5b
    iget v2, v15, Le/e/a/FullscreenViewport205$Session;->flags:I

    or-int/lit16 v2, v2, 0x1706

    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getSystemUiVisibility()I

    move-result v3

    if-eq v3, v2, :cond_68

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setSystemUiVisibility(I)V

    .line 20
    :cond_68
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_9e

    :try_start_6e
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "layoutInDisplayCutoutMode"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    iget v4, v15, Le/e/a/FullscreenViewport205$Session;->cutout:I

    if-gez v4, :cond_86

    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v4

    iput v4, v15, Le/e/a/FullscreenViewport205$Session;->cutout:I

    :cond_86
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1e

    if-lt v4, v5, :cond_8e

    const/4 v4, 0x3

    goto :goto_90

    :cond_8e
    move/from16 v4, v16

    :goto_90
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    if-eq v5, v4, :cond_9e

    invoke-virtual {v3, v2, v4}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual {v0, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_9c
    .catch Ljava/lang/Exception; {:try_start_6e .. :try_end_9c} :catch_9d

    goto :goto_9e

    :catch_9d
    move-exception v0

    .line 22
    :cond_9e
    :goto_9e
    const-string v0, "videoLayout"

    invoke-static {v8, v0}, Le/e/a/FullscreenViewport205;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v10

    const-string v0, "commentlay"

    invoke-static {v8, v0}, Le/e/a/FullscreenViewport205;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    const-string v2, "video"

    invoke-static {v8, v2}, Le/e/a/FullscreenViewport205;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v17

    .line 23
    iget-object v2, v15, Le/e/a/FullscreenViewport205$Session;->controller:Landroid/view/View;

    if-nez v2, :cond_bc

    const-string v2, "controller"

    invoke-static {v8, v2}, Le/e/a/FullscreenViewport205;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    iput-object v2, v15, Le/e/a/FullscreenViewport205$Session;->controller:Landroid/view/View;

    .line 24
    :cond_bc
    iget-object v2, v15, Le/e/a/FullscreenViewport205$Session;->bottom:Landroid/view/View;

    if-nez v2, :cond_c8

    const-string v2, "bottommenulay"

    invoke-static {v8, v2}, Le/e/a/FullscreenViewport205;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    iput-object v2, v15, Le/e/a/FullscreenViewport205$Session;->bottom:Landroid/view/View;

    .line 25
    :cond_c8
    iget-object v14, v15, Le/e/a/FullscreenViewport205$Session;->controller:Landroid/view/View;

    .line 26
    if-eqz p2, :cond_da

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/FrameLayout;

    if-eqz v2, :cond_da

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 27
    :cond_da
    invoke-virtual {v15, v14}, Le/e/a/FullscreenViewport205$Session;->capture(Landroid/view/View;)V

    iget-object v2, v15, Le/e/a/FullscreenViewport205$Session;->bottom:Landroid/view/View;

    invoke-virtual {v15, v2}, Le/e/a/FullscreenViewport205$Session;->capture(Landroid/view/View;)V

    .line 28
    const/4 v13, 0x0

    invoke-virtual {v15, v14, v1, v13}, Le/e/a/FullscreenViewport205$Session;->overlay(Landroid/view/View;Landroid/view/ViewGroup;I)V

    .line 29
    iget-object v2, v15, Le/e/a/FullscreenViewport205$Session;->bottom:Landroid/view/View;

    if-nez v14, :cond_ec

    move v3, v13

    goto :goto_f0

    :cond_ec
    invoke-virtual {v14}, Landroid/view/View;->getHeight()I

    move-result v3

    :goto_f0
    invoke-virtual {v15, v2, v1, v3}, Le/e/a/FullscreenViewport205$Session;->overlay(Landroid/view/View;Landroid/view/ViewGroup;I)V

    .line 31
    const/4 v3, -0x1

    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, v15

    move-object/from16 v2, p0

    invoke-virtual/range {v1 .. v7}, Le/e/a/FullscreenViewport205$Session;->fit(Landroid/view/View;IIIIZ)V

    if-eq v10, v8, :cond_110

    const/4 v11, -0x1

    const/4 v12, -0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v9, v15

    move v4, v13

    move v13, v1

    move-object v1, v14

    move v14, v2

    move-object v2, v15

    move v15, v3

    invoke-virtual/range {v9 .. v15}, Le/e/a/FullscreenViewport205$Session;->fit(Landroid/view/View;IIIIZ)V

    goto :goto_113

    :cond_110
    move v4, v13

    move-object v1, v14

    move-object v2, v15

    .line 33
    :goto_113
    if-eqz v1, :cond_118

    invoke-virtual {v2, v1}, Le/e/a/FullscreenViewport205$Session;->timeline(Landroid/view/View;)V

    .line 34
    :cond_118
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v5, "player_controls_visibility_mode"

    const-string v6, "off"

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 35
    const-string v5, "normal"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_13a

    const-string v5, "both"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13a

    move/from16 v16, v4

    .line 36
    :cond_13a
    if-eqz v16, :cond_146

    if-eqz p2, :cond_146

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iget v13, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    move v3, v13

    goto :goto_147

    :cond_146
    move v3, v4

    .line 37
    :goto_147
    if-eqz v16, :cond_151

    if-eqz v1, :cond_151

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v13

    move v1, v13

    goto :goto_152

    :cond_151
    move v1, v4

    .line 38
    :goto_152
    const/4 v11, -0x1

    const/4 v12, -0x1

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v13

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v14

    const/4 v15, 0x0

    move-object v9, v2

    move-object/from16 v10, v17

    invoke-virtual/range {v9 .. v15}, Le/e/a/FullscreenViewport205$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 39
    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v13

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v14

    move-object v10, v0

    invoke-virtual/range {v9 .. v15}, Le/e/a/FullscreenViewport205$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 40
    invoke-virtual {v2, v0}, Le/e/a/FullscreenViewport205$Session;->commentBounds(Landroid/view/View;)V

    const-string v0, "video_view"

    invoke-static {v8, v0}, Le/e/a/FullscreenViewport205;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v4

    const/4 v5, -0x1

    const/4 v6, -0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v3, v2

    invoke-virtual/range {v3 .. v9}, Le/e/a/FullscreenViewport205$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 41
    return-void
.end method
