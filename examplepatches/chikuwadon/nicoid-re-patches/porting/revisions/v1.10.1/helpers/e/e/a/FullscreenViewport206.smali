.class public final Le/e/a/FullscreenViewport206;
.super Ljava/lang/Object;
.source "FullscreenViewport206.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FullscreenViewport206$Band;,
        Le/e/a/FullscreenViewport206$Glyph;,
        Le/e/a/FullscreenViewport206$Moved;,
        Le/e/a/FullscreenViewport206$Saved;,
        Le/e/a/FullscreenViewport206$Session;
    }
.end annotation


# static fields
.field private static final sessions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/FullscreenViewport206$Session;",
            ">;"
        }
    .end annotation
.end field

.field private static final sideSessions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/FullscreenViewport206$Session;",
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

    sput-object v0, Le/e/a/FullscreenViewport206;->sessions:Ljava/util/Map;

    .line 14
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/FullscreenViewport206;->sideSessions:Ljava/util/Map;

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

    .line 107
    invoke-static {p0}, Le/e/a/FullscreenViewport206;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1(Landroid/view/View;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 65
    invoke-static {p0, p1}, Le/e/a/FullscreenViewport206;->flatIcon(Landroid/view/View;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method private static copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 107
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

    .line 15
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

    .line 67
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

    .line 68
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

    move v2, v5

    goto :goto_37

    :cond_36
    move v2, v4

    .line 69
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

    .line 71
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

    .line 72
    new-instance v1, Landroid/graphics/drawable/RippleDrawable;

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/4 v3, -0x1

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-direct {v1, p0, v0, v2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    :try_end_99
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_99} :catch_9a

    return-object v1

    .line 73
    :catch_9a
    move-exception p0

    const-string v0, "nicoid-layout"

    const-string v1, "Cannot flatten player action icon"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object p1
.end method

.method private static owner(Landroid/content/Context;)Landroid/app/Activity;
    .registers 3

    .line 16
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
    .registers 2

    .line 43
    sget-object v0, Le/e/a/FullscreenViewport206;->sessions:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/FullscreenViewport206$Session;

    invoke-static {v0}, Le/e/a/FullscreenViewport206;->restoreSession(Le/e/a/FullscreenViewport206$Session;)V

    sget-object v0, Le/e/a/FullscreenViewport206;->sideSessions:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/FullscreenViewport206$Session;

    invoke-static {p0}, Le/e/a/FullscreenViewport206;->restoreSession(Le/e/a/FullscreenViewport206$Session;)V

    return-void
.end method

.method private static restoreSession(Le/e/a/FullscreenViewport206$Session;)V
    .registers 5

    .line 44
    if-nez p0, :cond_3

    return-void

    :cond_3
    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->attachRoot:Landroid/view/View;

    if-eqz v0, :cond_e

    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->attachRoot:Landroid/view/View;

    iget-object v1, p0, Le/e/a/FullscreenViewport206$Session;->detach:Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_e
    invoke-virtual {p0}, Le/e/a/FullscreenViewport206$Session;->removeListeners()V

    invoke-virtual {p0}, Le/e/a/FullscreenViewport206$Session;->restoreParents()V

    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->saved:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_5d

    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->decor:Landroid/view/View;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->decor:Landroid/view/View;

    iget v1, p0, Le/e/a/FullscreenViewport206$Session;->flags:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_2f
    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_5c

    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget v1, p0, Le/e/a/FullscreenViewport206$Session;->windowFlags:I

    const/16 v2, 0x400

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFlags(II)V

    iget v1, p0, Le/e/a/FullscreenViewport206$Session;->cutout:I

    if-ltz v1, :cond_5c

    :try_start_44
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "layoutInDisplayCutoutMode"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    iget p0, p0, Le/e/a/FullscreenViewport206$Session;->cutout:I

    invoke-virtual {v2, v1, p0}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_5a} :catch_5b

    goto :goto_5c

    :catch_5b
    move-exception p0

    :cond_5c
    :goto_5c
    return-void

    :cond_5d
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FullscreenViewport206$Saved;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v2, v1}, Le/e/a/FullscreenViewport206$Saved;->restore(Landroid/view/View;)V

    goto :goto_1e
.end method

.method public static side(Landroid/view/View;)Z
    .registers 11

    .line 47
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    :cond_4
    const-string v1, "videoLayout"

    invoke-static {p0, v1}, Le/e/a/FullscreenViewport206;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string v2, "info"

    invoke-static {p0, v2}, Le/e/a/FullscreenViewport206;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    .line 48
    if-eqz v1, :cond_dd

    if-eqz v2, :cond_dd

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_dd

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v3, v3, Landroid/widget/RelativeLayout$LayoutParams;

    if-nez v3, :cond_24

    goto/16 :goto_dd

    .line 49
    :cond_24
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 50
    invoke-virtual {v2}, Landroid/widget/RelativeLayout$LayoutParams;->getRules()[I

    move-result-object v3

    const/4 v4, 0x1

    aget v3, v3, v4

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v5

    if-eq v3, v5, :cond_46

    invoke-virtual {v2}, Landroid/widget/RelativeLayout$LayoutParams;->getRules()[I

    move-result-object v2

    const/16 v3, 0x11

    aget v2, v2, v3

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    if-eq v2, v1, :cond_46

    return v0

    .line 51
    :cond_46
    sget-object v1, Le/e/a/FullscreenViewport206;->sideSessions:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FullscreenViewport206$Session;

    const-string v3, "bottommenulay"

    if-nez v2, :cond_6f

    new-instance v2, Le/e/a/FullscreenViewport206$Session;

    const/4 v5, 0x0

    invoke-direct {v2, v5}, Le/e/a/FullscreenViewport206$Session;-><init>(Le/e/a/FullscreenViewport206$Session;)V

    invoke-static {p0, v3}, Le/e/a/FullscreenViewport206;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    iput-object v5, v2, Le/e/a/FullscreenViewport206$Session;->bottom:Landroid/view/View;

    iput-object p0, v2, Le/e/a/FullscreenViewport206$Session;->attachRoot:Landroid/view/View;

    new-instance v5, Le/e/a/FullscreenViewport206$1;

    invoke-direct {v5, p0}, Le/e/a/FullscreenViewport206$1;-><init>(Landroid/view/View;)V

    iput-object v5, v2, Le/e/a/FullscreenViewport206$Session;->detach:Landroid/view/View$OnAttachStateChangeListener;

    iget-object v5, v2, Le/e/a/FullscreenViewport206$Session;->detach:Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {p0, v5}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    :cond_6f
    iget-object v1, v2, Le/e/a/FullscreenViewport206$Session;->bottom:Landroid/view/View;

    if-eqz v1, :cond_7b

    iget-object v1, v2, Le/e/a/FullscreenViewport206$Session;->bottom:Landroid/view/View;

    invoke-virtual {v2, v1}, Le/e/a/FullscreenViewport206$Session;->save(Landroid/view/View;)V

    invoke-virtual {v2}, Le/e/a/FullscreenViewport206$Session;->bottomIcons()V

    .line 53
    :cond_7b
    const-string v1, "titlebar"

    const-string v5, "controller"

    filled-new-array {v1, v5, v3}, [Ljava/lang/String;

    move-result-object v1

    move v3, v0

    :goto_84
    const/4 v5, 0x3

    if-lt v3, v5, :cond_88

    .line 58
    return v4

    .line 53
    :cond_88
    aget-object v5, v1, v3

    .line 54
    invoke-static {p0, v5}, Le/e/a/FullscreenViewport206;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_da

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    if-nez v6, :cond_97

    goto :goto_da

    :cond_97
    invoke-virtual {v2, v5}, Le/e/a/FullscreenViewport206$Session;->save(Landroid/view/View;)V

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    invoke-static {v6}, Le/e/a/FullscreenViewport206;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    iget v7, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v8, -0x1

    if-eq v7, v8, :cond_a9

    move v7, v4

    goto :goto_aa

    :cond_a9
    move v7, v0

    :goto_aa
    iput v8, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 55
    instance-of v8, v6, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v8, :cond_d5

    move-object v8, v6

    check-cast v8, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-nez v9, :cond_c9

    iget v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-nez v9, :cond_c9

    invoke-virtual {v8}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v9

    if-nez v9, :cond_c9

    invoke-virtual {v8}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v9

    if-nez v9, :cond_c9

    move v9, v0

    goto :goto_ca

    :cond_c9
    move v9, v4

    :goto_ca
    or-int/2addr v7, v9

    iput v0, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v0, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {v8, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {v8, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 56
    :cond_d5
    if-eqz v7, :cond_da

    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    :cond_da
    :goto_da
    add-int/lit8 v3, v3, 0x1

    goto :goto_84

    .line 48
    :cond_dd
    :goto_dd
    return v0
.end method

.method public static top(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .registers 5

    .line 62
    const/high16 p3, 0x77000000

    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundColor(I)V

    const/4 p1, 0x0

    if-eqz p2, :cond_b

    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 63
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

    .line 64
    :cond_39
    return-void
.end method

.method public static update(Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;)V
    .registers 21

    .line 18
    move-object/from16 v8, p0

    move-object/from16 v1, p1

    if-nez v8, :cond_7

    return-void

    .line 19
    :cond_7
    sget-object v0, Le/e/a/FullscreenViewport206;->sessions:Ljava/util/Map;

    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FullscreenViewport206$Session;

    if-nez v2, :cond_40

    new-instance v2, Le/e/a/FullscreenViewport206$Session;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Le/e/a/FullscreenViewport206$Session;-><init>(Le/e/a/FullscreenViewport206$Session;)V

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/FullscreenViewport206;->owner(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    iput-object v0, v2, Le/e/a/FullscreenViewport206$Session;->activity:Landroid/app/Activity;

    iput-object v1, v2, Le/e/a/FullscreenViewport206$Session;->decor:Landroid/view/View;

    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getSystemUiVisibility()I

    move-result v0

    iput v0, v2, Le/e/a/FullscreenViewport206$Session;->flags:I

    iget-object v0, v2, Le/e/a/FullscreenViewport206$Session;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_3e

    iget-object v0, v2, Le/e/a/FullscreenViewport206$Session;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    iput v0, v2, Le/e/a/FullscreenViewport206$Session;->windowFlags:I

    .line 20
    :cond_3e
    move-object v15, v2

    goto :goto_41

    .line 19
    :cond_40
    move-object v15, v2

    .line 20
    :goto_41
    iget-object v0, v15, Le/e/a/FullscreenViewport206$Session;->activity:Landroid/app/Activity;

    const/16 v16, 0x1

    if-eqz v0, :cond_9e

    iget-object v0, v15, Le/e/a/FullscreenViewport206$Session;->activity:Landroid/app/Activity;

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
    iget v2, v15, Le/e/a/FullscreenViewport206$Session;->flags:I

    or-int/lit16 v2, v2, 0x1706

    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getSystemUiVisibility()I

    move-result v3

    if-eq v3, v2, :cond_68

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setSystemUiVisibility(I)V

    .line 21
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

    iget v4, v15, Le/e/a/FullscreenViewport206$Session;->cutout:I

    if-gez v4, :cond_86

    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v4

    iput v4, v15, Le/e/a/FullscreenViewport206$Session;->cutout:I

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

    .line 23
    :cond_9e
    :goto_9e
    const-string v0, "videoLayout"

    invoke-static {v8, v0}, Le/e/a/FullscreenViewport206;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v10

    const-string v0, "commentlay"

    invoke-static {v8, v0}, Le/e/a/FullscreenViewport206;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    const-string v2, "video"

    invoke-static {v8, v2}, Le/e/a/FullscreenViewport206;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v17

    .line 24
    iget-object v2, v15, Le/e/a/FullscreenViewport206$Session;->controller:Landroid/view/View;

    if-nez v2, :cond_bc

    const-string v2, "controller"

    invoke-static {v8, v2}, Le/e/a/FullscreenViewport206;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    iput-object v2, v15, Le/e/a/FullscreenViewport206$Session;->controller:Landroid/view/View;

    .line 25
    :cond_bc
    iget-object v2, v15, Le/e/a/FullscreenViewport206$Session;->bottom:Landroid/view/View;

    if-nez v2, :cond_c8

    const-string v2, "bottommenulay"

    invoke-static {v8, v2}, Le/e/a/FullscreenViewport206;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    iput-object v2, v15, Le/e/a/FullscreenViewport206$Session;->bottom:Landroid/view/View;

    .line 26
    :cond_c8
    iget-object v14, v15, Le/e/a/FullscreenViewport206$Session;->controller:Landroid/view/View;

    .line 27
    if-eqz p2, :cond_da

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/FrameLayout;

    if-eqz v2, :cond_da

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 28
    :cond_da
    invoke-virtual {v15, v14}, Le/e/a/FullscreenViewport206$Session;->capture(Landroid/view/View;)V

    iget-object v2, v15, Le/e/a/FullscreenViewport206$Session;->bottom:Landroid/view/View;

    invoke-virtual {v15, v2}, Le/e/a/FullscreenViewport206$Session;->capture(Landroid/view/View;)V

    invoke-virtual {v15}, Le/e/a/FullscreenViewport206$Session;->bottomIcons()V

    .line 29
    const/4 v13, 0x0

    invoke-virtual {v15, v14, v1, v13}, Le/e/a/FullscreenViewport206$Session;->overlay(Landroid/view/View;Landroid/view/ViewGroup;I)V

    .line 30
    iget-object v2, v15, Le/e/a/FullscreenViewport206$Session;->bottom:Landroid/view/View;

    if-nez v14, :cond_ef

    move v3, v13

    goto :goto_f3

    :cond_ef
    invoke-virtual {v14}, Landroid/view/View;->getHeight()I

    move-result v3

    :goto_f3
    invoke-virtual {v15, v2, v1, v3}, Le/e/a/FullscreenViewport206$Session;->overlay(Landroid/view/View;Landroid/view/ViewGroup;I)V

    .line 32
    const/4 v3, -0x1

    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, v15

    move-object/from16 v2, p0

    invoke-virtual/range {v1 .. v7}, Le/e/a/FullscreenViewport206$Session;->fit(Landroid/view/View;IIIIZ)V

    if-eq v10, v8, :cond_113

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

    invoke-virtual/range {v9 .. v15}, Le/e/a/FullscreenViewport206$Session;->fit(Landroid/view/View;IIIIZ)V

    goto :goto_116

    :cond_113
    move v4, v13

    move-object v1, v14

    move-object v2, v15

    .line 34
    :goto_116
    if-eqz v1, :cond_11b

    invoke-virtual {v2, v1}, Le/e/a/FullscreenViewport206$Session;->timeline(Landroid/view/View;)V

    .line 35
    :cond_11b
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v5, "player_controls_visibility_mode"

    const-string v6, "off"

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 36
    const-string v5, "normal"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_13d

    const-string v5, "both"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13d

    move/from16 v16, v4

    .line 37
    :cond_13d
    if-eqz v16, :cond_149

    if-eqz p2, :cond_149

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iget v13, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    move v3, v13

    goto :goto_14a

    :cond_149
    move v3, v4

    .line 38
    :goto_14a
    if-eqz v16, :cond_154

    if-eqz v1, :cond_154

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v13

    move v1, v13

    goto :goto_155

    :cond_154
    move v1, v4

    .line 39
    :goto_155
    const/4 v11, -0x1

    const/4 v12, -0x1

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v13

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v14

    const/4 v15, 0x0

    move-object v9, v2

    move-object/from16 v10, v17

    invoke-virtual/range {v9 .. v15}, Le/e/a/FullscreenViewport206$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 40
    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v13

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v14

    move-object v10, v0

    invoke-virtual/range {v9 .. v15}, Le/e/a/FullscreenViewport206$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 41
    invoke-virtual {v2, v0}, Le/e/a/FullscreenViewport206$Session;->commentBounds(Landroid/view/View;)V

    const-string v0, "video_view"

    invoke-static {v8, v0}, Le/e/a/FullscreenViewport206;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v4

    const/4 v5, -0x1

    const/4 v6, -0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v3, v2

    invoke-virtual/range {v3 .. v9}, Le/e/a/FullscreenViewport206$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 42
    return-void
.end method
