.class public final Le/e/a/FullscreenViewport209;
.super Ljava/lang/Object;
.source "FullscreenViewport209.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FullscreenViewport209$Band;,
        Le/e/a/FullscreenViewport209$Glyph;,
        Le/e/a/FullscreenViewport209$Moved;,
        Le/e/a/FullscreenViewport209$Saved;,
        Le/e/a/FullscreenViewport209$Session;
    }
.end annotation


# static fields
.field private static final normalSessions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/FullscreenViewport209$Session;",
            ">;"
        }
    .end annotation
.end field

.field private static final sessions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/FullscreenViewport209$Session;",
            ">;"
        }
    .end annotation
.end field

.field private static final sideSessions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/FullscreenViewport209$Session;",
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

    sput-object v0, Le/e/a/FullscreenViewport209;->sessions:Ljava/util/Map;

    .line 14
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/FullscreenViewport209;->sideSessions:Ljava/util/Map;

    .line 15
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/FullscreenViewport209;->normalSessions:Ljava/util/Map;

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

    .line 140
    invoke-static {p0}, Le/e/a/FullscreenViewport209;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 2

    .line 16
    invoke-static {p0, p1}, Le/e/a/FullscreenViewport209;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2(Landroid/view/View;Landroid/view/View;)Z
    .registers 2

    .line 79
    invoke-static {p0, p1}, Le/e/a/FullscreenViewport209;->within(Landroid/view/View;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$3(Landroid/view/View;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 90
    invoke-static {p0, p1}, Le/e/a/FullscreenViewport209;->flatIcon(Landroid/view/View;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4(Landroid/view/View;)V
    .registers 1

    .line 70
    invoke-static {p0}, Le/e/a/FullscreenViewport209;->normalStatus(Landroid/view/View;)V

    return-void
.end method

.method private static copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 140
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

    .line 16
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

.method private static flatIcon(Landroid/view/View;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 11

    .line 92
    :try_start_0
    const-string v0, "e.e.a.PlayerIcons$Icon"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 93
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v6, "infobutton"

    const-string v7, "id"

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v6, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    if-ne v2, v3, :cond_36

    const/4 v2, 0x1

    goto :goto_37

    :cond_36
    const/4 v2, 0x0

    .line 94
    :goto_37
    new-array v1, v1, [Ljava/lang/Object;

    if-eqz v2, :cond_3e

    const-string v2, "info"

    goto :goto_40

    :cond_3e
    const-string v2, "commentpost"

    :goto_40
    aput-object v2, v1, v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    .line 96
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x7f03005e

    invoke-virtual {v2, v3, v1, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v2

    if-nez v2, :cond_72

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x1010435

    invoke-virtual {v2, v3, v1, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    :cond_72
    iget v2, v1, Landroid/util/TypedValue;->resourceId:I

    if-nez v2, :cond_79

    iget p0, v1, Landroid/util/TypedValue;->data:I

    goto :goto_83

    :cond_79
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget v1, v1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    :goto_83
    const v1, 0xffffff

    and-int/2addr p0, v1

    const/high16 v1, 0x55000000

    or-int/2addr p0, v1

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    .line 97
    new-instance v1, Landroid/graphics/drawable/RippleDrawable;

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/4 v3, -0x1

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-direct {v1, p0, v0, v2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    :try_end_99
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_99} :catch_9a

    return-object v1

    :catch_9a
    move-exception p0

    .line 98
    const-string v0, "nicoid-layout"

    const-string v1, "Cannot flatten player action icon"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object p1
.end method

.method private static normalStatus(Landroid/view/View;)V
    .registers 9

    .line 71
    const-string v0, "titlebar"

    invoke-static {p0, v0}, Le/e/a/FullscreenViewport209;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_95

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-nez v1, :cond_12

    goto/16 :goto_95

    .line 72
    :cond_12
    sget-object v1, Le/e/a/FullscreenViewport209;->normalSessions:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FullscreenViewport209$Session;

    invoke-static {p0}, Le/e/a/FullscreenViewport209;->statusTop(Landroid/view/View;)I

    move-result v3

    const/4 v4, 0x2

    new-array v4, v4, [I

    invoke-virtual {v0, v4}, Landroid/view/View;->getLocationInWindow([I)V

    const/4 v5, 0x1

    if-nez v2, :cond_2c

    .line 73
    aget v6, v4, v5

    if-lt v6, v3, :cond_2c

    return-void

    :cond_2c
    if-nez v2, :cond_4a

    .line 74
    new-instance v2, Le/e/a/FullscreenViewport209$Session;

    const/4 v6, 0x0

    invoke-direct {v2, v6}, Le/e/a/FullscreenViewport209$Session;-><init>(Le/e/a/FullscreenViewport209$Session;)V

    iput-object p0, v2, Le/e/a/FullscreenViewport209$Session;->attachRoot:Landroid/view/View;

    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    new-instance v7, Le/e/a/FullscreenViewport209$3;

    invoke-direct {v7, v6}, Le/e/a/FullscreenViewport209$3;-><init>(Ljava/lang/ref/WeakReference;)V

    iput-object v7, v2, Le/e/a/FullscreenViewport209$Session;->detach:Landroid/view/View$OnAttachStateChangeListener;

    iget-object v6, v2, Le/e/a/FullscreenViewport209$Session;->detach:Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {p0, v6}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    :cond_4a
    invoke-virtual {v2, v0}, Le/e/a/FullscreenViewport209$Session;->save(Landroid/view/View;)V

    iget-object v1, v2, Le/e/a/FullscreenViewport209$Session;->saved:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/FullscreenViewport209$Saved;

    if-nez v1, :cond_58

    return-void

    :cond_58
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    iget-object v1, v1, Le/e/a/FullscreenViewport209$Saved;->params:Landroid/view/ViewGroup$LayoutParams;

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    aget v4, v4, v5

    iget v5, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr v5, v1

    sub-int/2addr v4, v5

    const/4 v5, 0x0

    sub-int/2addr v3, v4

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    add-int/2addr v1, v3

    .line 76
    iget v3, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-eq v3, v1, :cond_80

    invoke-static {v6}, Le/e/a/FullscreenViewport209;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    iput v1, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    :cond_80
    iget-object v1, v2, Le/e/a/FullscreenViewport209$Session;->listeners:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_95

    new-instance v1, Le/e/a/FullscreenViewport209$4;

    invoke-direct {v1, p0}, Le/e/a/FullscreenViewport209$4;-><init>(Landroid/view/View;)V

    iget-object p0, v2, Le/e/a/FullscreenViewport209$Session;->listeners:Ljava/util/Map;

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_95
    :goto_95
    return-void
.end method

.method private static owner(Landroid/content/Context;)Landroid/app/Activity;
    .registers 3

    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x10

    if-lt v0, v1, :cond_6

    goto :goto_1b

    .line 17
    :cond_6
    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_d

    check-cast p0, Landroid/app/Activity;

    return-object p0

    :cond_d
    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_12

    goto :goto_1b

    :cond_12
    move-object v1, p0

    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    if-ne v1, p0, :cond_1d

    :goto_1b
    const/4 p0, 0x0

    return-object p0

    :cond_1d
    add-int/lit8 v0, v0, 0x1

    move-object p0, v1

    goto :goto_1
.end method

.method public static restore(Landroid/view/View;)V
    .registers 2

    .line 49
    invoke-static {p0}, Le/e/a/PortraitTimeline213;->restore(Landroid/view/View;)V

    sget-object v0, Le/e/a/FullscreenViewport209;->sessions:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/FullscreenViewport209$Session;

    invoke-static {v0}, Le/e/a/FullscreenViewport209;->restoreSession(Le/e/a/FullscreenViewport209$Session;)V

    sget-object v0, Le/e/a/FullscreenViewport209;->sideSessions:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/FullscreenViewport209$Session;

    invoke-static {v0}, Le/e/a/FullscreenViewport209;->restoreSession(Le/e/a/FullscreenViewport209$Session;)V

    sget-object v0, Le/e/a/FullscreenViewport209;->normalSessions:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/FullscreenViewport209$Session;

    invoke-static {p0}, Le/e/a/FullscreenViewport209;->restoreSession(Le/e/a/FullscreenViewport209$Session;)V

    return-void
.end method

.method private static restoreSession(Le/e/a/FullscreenViewport209$Session;)V
    .registers 5

    if-nez p0, :cond_3

    return-void

    .line 50
    :cond_3
    iget-object v0, p0, Le/e/a/FullscreenViewport209$Session;->attachRoot:Landroid/view/View;

    if-eqz v0, :cond_e

    iget-object v0, p0, Le/e/a/FullscreenViewport209$Session;->attachRoot:Landroid/view/View;

    iget-object v1, p0, Le/e/a/FullscreenViewport209$Session;->detach:Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_e
    invoke-virtual {p0}, Le/e/a/FullscreenViewport209$Session;->removeListeners()V

    invoke-virtual {p0}, Le/e/a/FullscreenViewport209$Session;->restoreParents()V

    iget-object v0, p0, Le/e/a/FullscreenViewport209$Session;->saved:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_5b

    iget-object v0, p0, Le/e/a/FullscreenViewport209$Session;->decor:Landroid/view/View;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Le/e/a/FullscreenViewport209$Session;->decor:Landroid/view/View;

    iget v1, p0, Le/e/a/FullscreenViewport209$Session;->flags:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_2f
    iget-object v0, p0, Le/e/a/FullscreenViewport209$Session;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_5a

    iget-object v0, p0, Le/e/a/FullscreenViewport209$Session;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget v1, p0, Le/e/a/FullscreenViewport209$Session;->windowFlags:I

    const/16 v2, 0x400

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFlags(II)V

    iget v1, p0, Le/e/a/FullscreenViewport209$Session;->cutout:I

    if-ltz v1, :cond_5a

    :try_start_44
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "layoutInDisplayCutoutMode"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    iget p0, p0, Le/e/a/FullscreenViewport209$Session;->cutout:I

    invoke-virtual {v2, v1, p0}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_5a} :catch_5a

    :catch_5a
    :cond_5a
    return-void

    :cond_5b
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FullscreenViewport209$Saved;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v2, v1}, Le/e/a/FullscreenViewport209$Saved;->restore(Landroid/view/View;)V

    goto :goto_1e
.end method

.method public static side(Landroid/view/View;)Z
    .registers 12

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 53
    :cond_4
    invoke-static {p0}, Le/e/a/FullscreenViewport209;->normalStatus(Landroid/view/View;)V

    const-string v1, "videoLayout"

    invoke-static {p0, v1}, Le/e/a/FullscreenViewport209;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string v2, "info"

    invoke-static {p0, v2}, Le/e/a/FullscreenViewport209;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    if-eqz v1, :cond_ff

    if-eqz v2, :cond_ff

    .line 54
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_ff

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v3, v3, Landroid/widget/RelativeLayout$LayoutParams;

    if-nez v3, :cond_27

    goto/16 :goto_ff

    .line 55
    :cond_27
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 56
    invoke-virtual {v2}, Landroid/widget/RelativeLayout$LayoutParams;->getRules()[I

    move-result-object v3

    const/4 v4, 0x1

    aget v3, v3, v4

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v5

    if-eq v3, v5, :cond_49

    invoke-virtual {v2}, Landroid/widget/RelativeLayout$LayoutParams;->getRules()[I

    move-result-object v2

    const/16 v3, 0x11

    aget v2, v2, v3

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    if-eq v2, v1, :cond_49

    return v0

    .line 57
    :cond_49
    sget-object v1, Le/e/a/FullscreenViewport209;->sideSessions:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FullscreenViewport209$Session;

    const-string v3, "bottommenulay"

    if-nez v2, :cond_72

    new-instance v2, Le/e/a/FullscreenViewport209$Session;

    const/4 v5, 0x0

    invoke-direct {v2, v5}, Le/e/a/FullscreenViewport209$Session;-><init>(Le/e/a/FullscreenViewport209$Session;)V

    invoke-static {p0, v3}, Le/e/a/FullscreenViewport209;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    iput-object v5, v2, Le/e/a/FullscreenViewport209$Session;->bottom:Landroid/view/View;

    iput-object p0, v2, Le/e/a/FullscreenViewport209$Session;->attachRoot:Landroid/view/View;

    new-instance v5, Le/e/a/FullscreenViewport209$2;

    invoke-direct {v5, p0}, Le/e/a/FullscreenViewport209$2;-><init>(Landroid/view/View;)V

    iput-object v5, v2, Le/e/a/FullscreenViewport209$Session;->detach:Landroid/view/View$OnAttachStateChangeListener;

    iget-object v5, v2, Le/e/a/FullscreenViewport209$Session;->detach:Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {p0, v5}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    :cond_72
    iget-object v1, v2, Le/e/a/FullscreenViewport209$Session;->bottom:Landroid/view/View;

    if-eqz v1, :cond_7e

    iget-object v1, v2, Le/e/a/FullscreenViewport209$Session;->bottom:Landroid/view/View;

    invoke-virtual {v2, v1}, Le/e/a/FullscreenViewport209$Session;->save(Landroid/view/View;)V

    invoke-virtual {v2}, Le/e/a/FullscreenViewport209$Session;->bottomIcons()V

    .line 59
    :cond_7e
    const-string v1, "controller"

    const-string v5, "titlebar"

    filled-new-array {v5, v1, v3}, [Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    :goto_87
    const/4 v6, 0x3

    if-lt v3, v6, :cond_aa

    .line 64
    invoke-static {p0, v5}, Le/e/a/FullscreenViewport209;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    const-string v1, "topmenulay"

    invoke-static {p0, v1}, Le/e/a/FullscreenViewport209;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    invoke-static {p0}, Le/e/a/FullscreenViewport209;->statusTop(Landroid/view/View;)I

    move-result p0

    .line 65
    invoke-virtual {v2, v0, v1}, Le/e/a/FullscreenViewport209$Session;->toolbar(Landroid/view/View;Landroid/view/View;)V

    .line 66
    invoke-virtual {v2, v0, p0}, Le/e/a/FullscreenViewport209$Session;->belowStatus(Landroid/view/View;I)V

    if-eqz v1, :cond_a9

    .line 67
    invoke-static {v1, v0}, Le/e/a/FullscreenViewport209;->within(Landroid/view/View;Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_a9

    invoke-virtual {v2, v1, p0}, Le/e/a/FullscreenViewport209$Session;->belowStatus(Landroid/view/View;I)V

    :cond_a9
    return v4

    .line 59
    :cond_aa
    aget-object v6, v1, v3

    .line 60
    invoke-static {p0, v6}, Le/e/a/FullscreenViewport209;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_fc

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    if-nez v7, :cond_b9

    goto :goto_fc

    :cond_b9
    invoke-virtual {v2, v6}, Le/e/a/FullscreenViewport209$Session;->save(Landroid/view/View;)V

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    invoke-static {v7}, Le/e/a/FullscreenViewport209;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    iget v8, v7, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v9, -0x1

    if-eq v8, v9, :cond_cb

    const/4 v8, 0x1

    goto :goto_cc

    :cond_cb
    const/4 v8, 0x0

    :goto_cc
    iput v9, v7, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 61
    instance-of v9, v7, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v9, :cond_f7

    move-object v9, v7

    check-cast v9, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v10, v9, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-nez v10, :cond_eb

    iget v10, v9, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-nez v10, :cond_eb

    invoke-virtual {v9}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v10

    if-nez v10, :cond_eb

    invoke-virtual {v9}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v10

    if-nez v10, :cond_eb

    const/4 v10, 0x0

    goto :goto_ec

    :cond_eb
    const/4 v10, 0x1

    :goto_ec
    or-int/2addr v8, v10

    iput v0, v9, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v0, v9, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {v9, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {v9, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    :cond_f7
    if-eqz v8, :cond_fc

    .line 62
    invoke-virtual {v6, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_fc
    :goto_fc
    add-int/lit8 v3, v3, 0x1

    goto :goto_87

    :cond_ff
    :goto_ff
    return v0
.end method

.method private static statusTop(Landroid/view/View;)I
    .registers 10

    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_9

    const/4 v2, 0x0

    goto :goto_d

    :cond_9
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v2

    :goto_d
    const/4 v3, 0x1

    if-eqz v0, :cond_54

    .line 82
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1e

    if-lt v4, v5, :cond_54

    :try_start_16
    const-string v4, "android.view.WindowInsets$Type"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "statusBars"

    new-array v6, v1, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v1, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    const-class v5, Landroid/view/WindowInsets;

    const-string v6, "getInsets"

    new-array v7, v3, [Ljava/lang/Class;

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v7, v1

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v6, v3, [Ljava/lang/Object;

    aput-object v4, v6, v1

    invoke-virtual {v5, v0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "top"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_54} :catch_54

    .line 83
    :catch_54
    :cond_54
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    const/4 v4, 0x2

    new-array v5, v4, [I

    new-array v4, v4, [I

    invoke-virtual {p0, v5}, Landroid/view/View;->getLocationOnScreen([I)V

    invoke-virtual {p0, v4}, Landroid/view/View;->getLocationInWindow([I)V

    aget p0, v5, v3

    aget v3, v4, v3

    sub-int/2addr p0, v3

    iget v0, v0, Landroid/graphics/Rect;->top:I

    sub-int/2addr v0, p0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-static {v2, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public static top(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .registers 5

    const/high16 p3, 0x77000000

    .line 87
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundColor(I)V

    const/4 p1, 0x0

    if-eqz p2, :cond_b

    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_b
    if-eqz p4, :cond_3a

    .line 88
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    const/high16 p2, 0x41400000    # 12.0f

    mul-float p0, p0, p2

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-virtual {p4}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    if-ne p2, p0, :cond_37

    invoke-virtual {p4}, Landroid/view/View;->getPaddingTop()I

    move-result p2

    if-nez p2, :cond_37

    invoke-virtual {p4}, Landroid/view/View;->getPaddingRight()I

    move-result p2

    if-ne p2, p0, :cond_37

    invoke-virtual {p4}, Landroid/view/View;->getPaddingBottom()I

    move-result p2

    if-eqz p2, :cond_3a

    :cond_37
    invoke-virtual {p4, p0, p1, p0, p1}, Landroid/view/View;->setPadding(IIII)V

    :cond_3a
    return-void
.end method

.method public static update(Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;)V
    .registers 21

    move-object/from16 v7, p0

    move-object/from16 v0, p1

    if-eqz v7, :cond_1be

    if-nez v0, :cond_a

    goto/16 :goto_1be

    .line 20
    :cond_a
    invoke-static/range {p0 .. p0}, Le/e/a/PortraitTimeline213;->restore(Landroid/view/View;)V

    if-eqz p2, :cond_1e

    .line 21
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/FrameLayout;

    if-eqz v1, :cond_1e

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    goto :goto_1f

    :cond_1e
    move-object v1, v0

    .line 22
    :goto_1f
    instance-of v2, v1, Landroid/widget/FrameLayout;

    if-nez v2, :cond_24

    return-void

    .line 23
    :cond_24
    sget-object v2, Le/e/a/FullscreenViewport209;->sessions:Ljava/util/Map;

    invoke-interface {v2, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/FullscreenViewport209$Session;

    if-nez v3, :cond_6e

    new-instance v3, Le/e/a/FullscreenViewport209$Session;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Le/e/a/FullscreenViewport209$Session;-><init>(Le/e/a/FullscreenViewport209$Session;)V

    invoke-interface {v2, v7, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/FullscreenViewport209;->owner(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v2

    iput-object v2, v3, Le/e/a/FullscreenViewport209$Session;->activity:Landroid/app/Activity;

    iput-object v0, v3, Le/e/a/FullscreenViewport209$Session;->decor:Landroid/view/View;

    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getSystemUiVisibility()I

    move-result v2

    iput v2, v3, Le/e/a/FullscreenViewport209$Session;->flags:I

    iget-object v2, v3, Le/e/a/FullscreenViewport209$Session;->activity:Landroid/app/Activity;

    if-eqz v2, :cond_5b

    iget-object v2, v3, Le/e/a/FullscreenViewport209$Session;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    iput v2, v3, Le/e/a/FullscreenViewport209$Session;->windowFlags:I

    :cond_5b
    iput-object v7, v3, Le/e/a/FullscreenViewport209$Session;->attachRoot:Landroid/view/View;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v7}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    new-instance v4, Le/e/a/FullscreenViewport209$1;

    invoke-direct {v4, v2}, Le/e/a/FullscreenViewport209$1;-><init>(Ljava/lang/ref/WeakReference;)V

    iput-object v4, v3, Le/e/a/FullscreenViewport209$Session;->detach:Landroid/view/View$OnAttachStateChangeListener;

    iget-object v2, v3, Le/e/a/FullscreenViewport209$Session;->detach:Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {v7, v2}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_6e
    move-object v15, v3

    .line 24
    iget-object v2, v15, Le/e/a/FullscreenViewport209$Session;->activity:Landroid/app/Activity;

    const/16 v16, 0x1

    if-eqz v2, :cond_cb

    iget-object v2, v15, Le/e/a/FullscreenViewport209$Session;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/16 v4, 0x400

    and-int/2addr v3, v4

    if-nez v3, :cond_89

    invoke-virtual {v2, v4}, Landroid/view/Window;->addFlags(I)V

    :cond_89
    iget v3, v15, Le/e/a/FullscreenViewport209$Session;->flags:I

    or-int/lit16 v3, v3, 0x1706

    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getSystemUiVisibility()I

    move-result v4

    if-eq v4, v3, :cond_96

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setSystemUiVisibility(I)V

    .line 25
    :cond_96
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v0, v3, :cond_cb

    :try_start_9c
    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "layoutInDisplayCutoutMode"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    iget v4, v15, Le/e/a/FullscreenViewport209$Session;->cutout:I

    if-gez v4, :cond_b4

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v4

    iput v4, v15, Le/e/a/FullscreenViewport209$Session;->cutout:I

    :cond_b4
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1e

    if-lt v4, v5, :cond_bc

    const/4 v4, 0x3

    goto :goto_bd

    :cond_bc
    const/4 v4, 0x1

    :goto_bd
    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    if-eq v5, v4, :cond_cb

    invoke-virtual {v3, v0, v4}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual {v2, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_c9
    .catch Ljava/lang/Exception; {:try_start_9c .. :try_end_c9} :catch_ca

    goto :goto_cb

    :catch_ca
    nop

    .line 27
    :cond_cb
    :goto_cb
    const-string v0, "videoLayout"

    invoke-static {v7, v0}, Le/e/a/FullscreenViewport209;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v9

    const-string v0, "commentlay"

    invoke-static {v7, v0}, Le/e/a/FullscreenViewport209;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v14

    const-string v0, "video"

    invoke-static {v7, v0}, Le/e/a/FullscreenViewport209;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v17

    .line 28
    iget-object v0, v15, Le/e/a/FullscreenViewport209$Session;->controller:Landroid/view/View;

    const-string v2, "controller"

    invoke-virtual {v15, v7, v0, v2, v1}, Le/e/a/FullscreenViewport209$Session;->control(Landroid/view/View;Landroid/view/View;Ljava/lang/String;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, v15, Le/e/a/FullscreenViewport209$Session;->controller:Landroid/view/View;

    .line 29
    iget-object v0, v15, Le/e/a/FullscreenViewport209$Session;->bottom:Landroid/view/View;

    const-string v2, "bottommenulay"

    invoke-virtual {v15, v7, v0, v2, v1}, Le/e/a/FullscreenViewport209$Session;->control(Landroid/view/View;Landroid/view/View;Ljava/lang/String;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, v15, Le/e/a/FullscreenViewport209$Session;->bottom:Landroid/view/View;

    .line 30
    iget-object v13, v15, Le/e/a/FullscreenViewport209$Session;->controller:Landroid/view/View;

    .line 32
    invoke-virtual {v15, v13}, Le/e/a/FullscreenViewport209$Session;->capture(Landroid/view/View;)V

    iget-object v0, v15, Le/e/a/FullscreenViewport209$Session;->bottom:Landroid/view/View;

    invoke-virtual {v15, v0}, Le/e/a/FullscreenViewport209$Session;->capture(Landroid/view/View;)V

    invoke-virtual {v15}, Le/e/a/FullscreenViewport209$Session;->bottomIcons()V

    .line 33
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x41400000    # 12.0f

    mul-float v0, v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v12

    .line 34
    invoke-virtual {v15, v13, v1, v12}, Le/e/a/FullscreenViewport209$Session;->overlay(Landroid/view/View;Landroid/view/ViewGroup;I)V

    .line 35
    iget-object v0, v15, Le/e/a/FullscreenViewport209$Session;->bottom:Landroid/view/View;

    const/4 v11, 0x0

    if-nez v13, :cond_11a

    const/4 v2, 0x0

    goto :goto_11e

    :cond_11a
    invoke-virtual {v13}, Landroid/view/View;->getHeight()I

    move-result v2

    :goto_11e
    add-int/2addr v2, v12

    invoke-virtual {v15, v0, v1, v2}, Le/e/a/FullscreenViewport209$Session;->overlay(Landroid/view/View;Landroid/view/ViewGroup;I)V

    .line 36
    invoke-virtual {v15}, Le/e/a/FullscreenViewport209$Session;->actionsFollowController()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, -0x1

    const/4 v3, -0x1

    const/4 v4, 0x0

    move-object v0, v15

    move-object/from16 v1, p0

    .line 38
    invoke-virtual/range {v0 .. v6}, Le/e/a/FullscreenViewport209$Session;->fit(Landroid/view/View;IIIIZ)V

    if-eq v9, v7, :cond_144

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v10, -0x1

    const/4 v2, -0x1

    const/4 v3, 0x0

    move-object v8, v15

    const/4 v4, 0x0

    move v11, v2

    move v2, v12

    move v12, v3

    move-object v3, v13

    move v13, v0

    move-object v0, v14

    move v14, v1

    invoke-virtual/range {v8 .. v14}, Le/e/a/FullscreenViewport209$Session;->fit(Landroid/view/View;IIIIZ)V

    goto :goto_148

    :cond_144
    move v2, v12

    move-object v3, v13

    move-object v0, v14

    const/4 v4, 0x0

    :goto_148
    if-eqz v3, :cond_14d

    .line 40
    invoke-virtual {v15, v3}, Le/e/a/FullscreenViewport209$Session;->timeline(Landroid/view/View;)V

    .line 41
    :cond_14d
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v5, "player_controls_visibility_mode"

    const-string v6, "off"

    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 42
    const-string v5, "normal"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_16f

    const-string v5, "both"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16f

    const/16 v16, 0x0

    :cond_16f
    if-eqz v16, :cond_181

    if-eqz p2, :cond_181

    .line 43
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-eqz v1, :cond_181

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v11, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    move v1, v11

    goto :goto_182

    :cond_181
    const/4 v1, 0x0

    :goto_182
    if-eqz v16, :cond_18e

    if-eqz v3, :cond_18e

    .line 44
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    add-int v11, v3, v2

    move v2, v11

    goto :goto_18f

    :cond_18e
    const/4 v2, 0x0

    .line 45
    :goto_18f
    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v12

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v13

    const/4 v14, 0x0

    const/4 v10, -0x1

    const/4 v11, -0x1

    move-object v8, v15

    move-object/from16 v9, v17

    invoke-virtual/range {v8 .. v14}, Le/e/a/FullscreenViewport209$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 46
    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v12

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v13

    move-object v9, v0

    invoke-virtual/range {v8 .. v14}, Le/e/a/FullscreenViewport209$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 47
    invoke-virtual {v15, v0}, Le/e/a/FullscreenViewport209$Session;->commentBounds(Landroid/view/View;)V

    const-string v0, "video_view"

    invoke-static {v7, v0}, Le/e/a/FullscreenViewport209;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v6, -0x1

    const/4 v7, -0x1

    const/4 v8, 0x0

    move-object v4, v15

    invoke-virtual/range {v4 .. v10}, Le/e/a/FullscreenViewport209$Session;->fit(Landroid/view/View;IIIIZ)V

    :cond_1be
    :goto_1be
    return-void
.end method

.method private static within(Landroid/view/View;Landroid/view/View;)Z
    .registers 4

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    :goto_4
    if-nez p0, :cond_7

    return v0

    :cond_7
    if-ne p0, p1, :cond_b

    const/4 p0, 0x1

    return p0

    .line 79
    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of v1, p0, Landroid/view/View;

    if-eqz v1, :cond_16

    check-cast p0, Landroid/view/View;

    goto :goto_4

    :cond_16
    const/4 p0, 0x0

    goto :goto_4
.end method
