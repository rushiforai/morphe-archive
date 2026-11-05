.class public final Le/e/a/FullscreenViewport204;
.super Ljava/lang/Object;
.source "FullscreenViewport204.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FullscreenViewport204$Saved;,
        Le/e/a/FullscreenViewport204$Session;
    }
.end annotation


# static fields
.field private static final sessions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/FullscreenViewport204$Session;",
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

    sput-object v0, Le/e/a/FullscreenViewport204;->sessions:Ljava/util/Map;

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

    .line 41
    invoke-static {p0}, Le/e/a/FullscreenViewport204;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method private static copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 41
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

    .line 35
    sget-object v0, Le/e/a/FullscreenViewport204;->sessions:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/FullscreenViewport204$Session;

    if-nez p0, :cond_b

    return-void

    :cond_b
    iget-object v0, p0, Le/e/a/FullscreenViewport204$Session;->saved:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_15
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_54

    iget-object v0, p0, Le/e/a/FullscreenViewport204$Session;->decor:Landroid/view/View;

    if-eqz v0, :cond_26

    iget-object v0, p0, Le/e/a/FullscreenViewport204$Session;->decor:Landroid/view/View;

    iget v1, p0, Le/e/a/FullscreenViewport204$Session;->flags:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_26
    iget-object v0, p0, Le/e/a/FullscreenViewport204$Session;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_53

    iget-object v0, p0, Le/e/a/FullscreenViewport204$Session;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget v1, p0, Le/e/a/FullscreenViewport204$Session;->windowFlags:I

    const/16 v2, 0x400

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFlags(II)V

    iget v1, p0, Le/e/a/FullscreenViewport204$Session;->cutout:I

    if-ltz v1, :cond_53

    :try_start_3b
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "layoutInDisplayCutoutMode"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    iget p0, p0, Le/e/a/FullscreenViewport204$Session;->cutout:I

    invoke-virtual {v2, v1, p0}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_51} :catch_52

    goto :goto_53

    :catch_52
    move-exception p0

    :cond_53
    :goto_53
    return-void

    :cond_54
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FullscreenViewport204$Saved;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v2, v1}, Le/e/a/FullscreenViewport204$Saved;->restore(Landroid/view/View;)V

    goto :goto_15
.end method

.method public static update(Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;)V
    .registers 16

    .line 17
    if-nez p0, :cond_3

    return-void

    .line 18
    :cond_3
    sget-object v0, Le/e/a/FullscreenViewport204;->sessions:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/FullscreenViewport204$Session;

    if-nez v1, :cond_3a

    new-instance v1, Le/e/a/FullscreenViewport204$Session;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Le/e/a/FullscreenViewport204$Session;-><init>(Le/e/a/FullscreenViewport204$Session;)V

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/FullscreenViewport204;->owner(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    iput-object v0, v1, Le/e/a/FullscreenViewport204$Session;->activity:Landroid/app/Activity;

    iput-object p1, v1, Le/e/a/FullscreenViewport204$Session;->decor:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getSystemUiVisibility()I

    move-result v0

    iput v0, v1, Le/e/a/FullscreenViewport204$Session;->flags:I

    iget-object v0, v1, Le/e/a/FullscreenViewport204$Session;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_3a

    iget-object v0, v1, Le/e/a/FullscreenViewport204$Session;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    iput v0, v1, Le/e/a/FullscreenViewport204$Session;->windowFlags:I

    .line 19
    :cond_3a
    iget-object v0, v1, Le/e/a/FullscreenViewport204$Session;->activity:Landroid/app/Activity;

    const/4 v9, 0x1

    if-eqz v0, :cond_95

    iget-object v0, v1, Le/e/a/FullscreenViewport204$Session;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/16 v3, 0x400

    and-int/2addr v2, v3

    if-nez v2, :cond_53

    invoke-virtual {v0, v3}, Landroid/view/Window;->addFlags(I)V

    :cond_53
    iget v2, v1, Le/e/a/FullscreenViewport204$Session;->flags:I

    or-int/lit16 v2, v2, 0x1706

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getSystemUiVisibility()I

    move-result v3

    if-eq v3, v2, :cond_60

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setSystemUiVisibility(I)V

    .line 20
    :cond_60
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt p1, v2, :cond_95

    :try_start_66
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "layoutInDisplayCutoutMode"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    iget v3, v1, Le/e/a/FullscreenViewport204$Session;->cutout:I

    if-gez v3, :cond_7e

    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v3

    iput v3, v1, Le/e/a/FullscreenViewport204$Session;->cutout:I

    :cond_7e
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1e

    if-lt v3, v4, :cond_86

    const/4 v3, 0x3

    goto :goto_87

    :cond_86
    move v3, v9

    :goto_87
    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v4

    if-eq v4, v3, :cond_95

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual {v0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_93
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_93} :catch_94

    goto :goto_95

    :catch_94
    move-exception p1

    .line 22
    :cond_95
    :goto_95
    const-string p1, "videoLayout"

    invoke-static {p0, p1}, Le/e/a/FullscreenViewport204;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p1

    const-string v0, "controller"

    invoke-static {p0, v0}, Le/e/a/FullscreenViewport204;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    const-string v2, "commentlay"

    invoke-static {p0, v2}, Le/e/a/FullscreenViewport204;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v10

    const-string v2, "video"

    invoke-static {p0, v2}, Le/e/a/FullscreenViewport204;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v11

    .line 24
    const/4 v4, -0x1

    const/4 v5, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, v1

    move-object v3, p0

    invoke-virtual/range {v2 .. v8}, Le/e/a/FullscreenViewport204$Session;->fit(Landroid/view/View;IIIIZ)V

    if-eq p1, p0, :cond_c3

    const/4 v4, -0x1

    const/4 v5, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, v1

    move-object v3, p1

    invoke-virtual/range {v2 .. v8}, Le/e/a/FullscreenViewport204$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 25
    :cond_c3
    const/4 v4, -0x1

    if-nez v0, :cond_c8

    const/4 p1, -0x2

    goto :goto_ce

    :cond_c8
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    :goto_ce
    move v5, p1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object v2, v1

    move-object v3, v0

    invoke-virtual/range {v2 .. v8}, Le/e/a/FullscreenViewport204$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 26
    if-eqz v0, :cond_dc

    invoke-virtual {v1, v0}, Le/e/a/FullscreenViewport204$Session;->timeline(Landroid/view/View;)V

    .line 27
    :cond_dc
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v2, "player_controls_visibility_mode"

    const-string v3, "off"

    invoke-interface {p1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 28
    const-string v2, "normal"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v12, 0x0

    if-nez v2, :cond_fe

    const-string v2, "both"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_fe

    move v9, v12

    .line 29
    :cond_fe
    if-eqz v9, :cond_109

    if-eqz p2, :cond_109

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_10a

    :cond_109
    move p1, v12

    .line 30
    :goto_10a
    if-eqz v9, :cond_113

    if-eqz v0, :cond_113

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result p2

    goto :goto_114

    :cond_113
    move p2, v12

    .line 31
    :goto_114
    const/4 v4, -0x1

    const/4 v5, -0x1

    invoke-static {v12, p1}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-static {v12, p2}, Ljava/lang/Math;->max(II)I

    move-result v7

    const/4 v8, 0x0

    move-object v2, v1

    move-object v3, v11

    invoke-virtual/range {v2 .. v8}, Le/e/a/FullscreenViewport204$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 32
    invoke-static {v12, p1}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-static {v12, p2}, Ljava/lang/Math;->max(II)I

    move-result v7

    move-object v3, v10

    invoke-virtual/range {v2 .. v8}, Le/e/a/FullscreenViewport204$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 33
    invoke-virtual {v1, v10}, Le/e/a/FullscreenViewport204$Session;->commentBounds(Landroid/view/View;)V

    const-string p1, "video_view"

    invoke-static {p0, p1}, Le/e/a/FullscreenViewport204;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v8}, Le/e/a/FullscreenViewport204$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 34
    return-void
.end method
