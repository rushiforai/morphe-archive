.class public final Le/e/a/PlayerIcons;
.super Ljava/lang/Object;
.source "PlayerIcons.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlayerIcons$Icon;,
        Le/e/a/PlayerIcons$PlaybackWatcher;
    }
.end annotation


# static fields
.field private static final PLAYING:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final TABLET:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final WATCHERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Runnable;",
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

    sput-object v0, Le/e/a/PlayerIcons;->TABLET:Ljava/util/Map;

    .line 13
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerIcons;->WATCHERS:Ljava/util/Map;

    .line 14
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerIcons;->PLAYING:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/content/Context;)Landroid/app/Activity;
    .registers 1

    .line 33
    invoke-static {p0}, Le/e/a/PlayerIcons;->activity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 2

    .line 34
    invoke-static {p0, p1}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2()Ljava/util/Map;
    .registers 1

    .line 14
    sget-object v0, Le/e/a/PlayerIcons;->PLAYING:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$3(Landroid/view/View;Ljava/lang/String;)V
    .registers 2

    .line 22
    invoke-static {p0, p1}, Le/e/a/PlayerIcons;->apply(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method private static activity(Landroid/content/Context;)Landroid/app/Activity;
    .registers 3

    .line 33
    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x8

    if-ge v0, v1, :cond_1f

    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_a

    goto :goto_1f

    :cond_a
    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_11

    check-cast p0, Landroid/app/Activity;

    return-object p0

    :cond_11
    move-object v1, p0

    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    if-ne v1, p0, :cond_1b

    goto :goto_1f

    :cond_1b
    add-int/lit8 v0, v0, 0x1

    move-object p0, v1

    goto :goto_1

    :cond_1f
    :goto_1f
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_26

    check-cast p0, Landroid/app/Activity;

    goto :goto_27

    :cond_26
    const/4 p0, 0x0

    :goto_27
    return-object p0
.end method

.method private static apply(Landroid/view/View;Ljava/lang/String;)V
    .registers 6

    .line 22
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x7f03005e

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    if-nez v1, :cond_1b

    iget v0, v0, Landroid/util/TypedValue;->data:I

    goto :goto_25

    :cond_1b
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    :goto_25
    new-instance v1, Le/e/a/PlayerIcons$Icon;

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/RelativeLayout;

    xor-int/2addr v2, v3

    invoke-direct {v1, p1, v2}, Le/e/a/PlayerIcons$Icon;-><init>(Ljava/lang/String;Z)V

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, v1, Le/e/a/PlayerIcons$Icon;->owner:Ljava/lang/ref/WeakReference;

    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v2, -0x1

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {p1, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    const v3, 0xffffff

    and-int/2addr v0, v3

    const/high16 v3, 0x55000000

    or-int/2addr v0, v3

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-direct {v2, v0, v1, p1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public static attach(Landroid/view/View;)V
    .registers 13

    .line 23
    if-nez p0, :cond_3

    return-void

    :cond_3
    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/QueueButtons110;->bind(Landroid/view/View;Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "viewbutton"

    const-string v2, "play"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v3

    const-string v1, "prevbutton"

    const-string v2, "prev"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v4

    const-string v1, "nextbutton"

    const-string v2, "next"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v5

    const-string v1, "popupbutton"

    const-string v2, "popup"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v6

    const-string v1, "repeatbutton"

    const-string v2, "repeaton"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v7

    const-string v1, "commentbutton"

    const-string v2, "commentoff"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v8

    const-string v1, "fullscbutton"

    const-string v2, "fullscreen"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v9

    const-string v1, "commentpostbutton"

    const-string v2, "commentpost"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v10

    const-string v1, "infobutton"

    const-string v2, "info"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v11

    filled-new-array/range {v3 .. v11}, [[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    :goto_5d
    const/16 v4, 0x9

    if-lt v3, v4, :cond_90

    instance-of v0, p0, Le/e/a/PopupPinchLayout;

    if-nez v0, :cond_8f

    const-string v0, "viewctrllay"

    invoke-static {p0, v0}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_84

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "centered-play-control"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_84

    invoke-virtual {v0, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance v0, Le/e/a/PlayerIcons$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Le/e/a/PlayerIcons$$ExternalSyntheticLambda4;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_84
    new-instance v0, Le/e/a/PlayerIcons$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Le/e/a/PlayerIcons$$ExternalSyntheticLambda5;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    invoke-static {p0}, Le/e/a/PlayerIcons;->watchPlayback(Landroid/view/View;)V

    :cond_8f
    return-void

    :cond_90
    aget-object v4, v1, v3

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    aget-object v6, v4, v2

    const-string v7, "id"

    invoke-virtual {v5, v6, v7, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_b2

    invoke-virtual {v5}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    instance-of v6, v6, Landroid/graphics/drawable/RippleDrawable;

    if-nez v6, :cond_b2

    const/4 v6, 0x1

    aget-object v4, v4, v6

    invoke-static {v5, v4}, Le/e/a/PlayerIcons;->apply(Landroid/view/View;Ljava/lang/String;)V

    :cond_b2
    add-int/lit8 v3, v3, 0x1

    goto :goto_5d
.end method

.method public static background(Landroid/view/View;I)V
    .registers 4

    .line 17
    if-gtz p1, :cond_3

    return-void

    :cond_3
    :try_start_3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/ResourceNames110;->entry(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v0
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_b} :catch_c

    goto :goto_f

    :catch_c
    move-exception v0

    const-string v0, ""

    :goto_f
    invoke-static {v0}, Le/e/a/PlayerIcons;->supported(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_19

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    return-void

    :cond_19
    invoke-static {p0, v0}, Le/e/a/PlayerIcons;->apply(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method public static center(Landroid/view/View;)V
    .registers 6

    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlayerControlsDock;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    const-string v0, "videoLayout"

    invoke-static {p0, v0}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    const-string v1, "viewctrllay"

    invoke-static {p0, v1}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    if-eqz v0, :cond_5d

    if-eqz p0, :cond_5d

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-eqz v1, :cond_5d

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-nez v1, :cond_28

    goto :goto_5d

    :cond_28
    const/4 v1, 0x2

    new-array v2, v1, [I

    new-array v1, v1, [I

    invoke-virtual {v0, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    invoke-virtual {p0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v3, 0x1

    aget v2, v2, v3

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v0, v4

    add-float/2addr v2, v0

    aget v0, v1, v3

    int-to-float v0, v0

    sub-float/2addr v2, v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v4

    sub-float/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_5d

    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    add-float/2addr v0, v2

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    :cond_5d
    :goto_5d
    return-void
.end method

.method private static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 34
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

.method static fullscreenIcon(Landroid/view/View;)Z
    .registers 4

    .line 37
    const/4 v0, 0x0

    if-eqz p0, :cond_40

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_11

    goto :goto_40

    :cond_11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PlayerIcons;->activity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_40

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2c

    goto :goto_40

    :cond_2c
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    :goto_30
    instance-of v1, p0, Landroid/view/View;

    if-nez v1, :cond_36

    const/4 p0, 0x1

    return p0

    :cond_36
    instance-of v1, p0, Le/e/a/PopupPinchLayout;

    if-eqz v1, :cond_3b

    return v0

    :cond_3b
    invoke-interface {p0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    goto :goto_30

    :cond_40
    :goto_40
    return v0
.end method

.method public static gestureIcon(I)Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 18
    new-instance v0, Le/e/a/PlayerIcons$Icon;

    const/4 v1, 0x1

    if-ne p0, v1, :cond_8

    const-string p0, "volume"

    goto :goto_a

    :cond_8
    const-string p0, "brightness"

    :goto_a
    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Le/e/a/PlayerIcons$Icon;-><init>(Ljava/lang/String;Z)V

    return-object v0
.end method

.method static synthetic lambda$0(Landroid/view/View;Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 23
    invoke-static {p0}, Le/e/a/PlayerIcons;->normalCenter(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$1(Landroid/view/View;)V
    .registers 1

    .line 23
    invoke-static {p0}, Le/e/a/PlayerIcons;->normalCenter(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/view/View;Landroid/view/View;)V
    .registers 7

    .line 32
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlayerIcons;->activity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object p0

    if-nez p0, :cond_c

    const/4 p0, 0x0

    goto :goto_12

    :cond_c
    const-string p1, "v"

    invoke-static {p0, p1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    :goto_12
    if-nez p0, :cond_15

    return-void

    :cond_15
    const-string p1, "a0"

    invoke-static {p0, p1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_3e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getDuration"

    new-array v3, v0, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-lez p1, :cond_3e

    const/4 p1, 0x1

    goto :goto_3f

    :cond_3e
    move p1, v0

    :goto_3f
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "L0"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4d} :catch_6c

    if-eqz p1, :cond_52

    :try_start_4f
    invoke-virtual {v1, p0, v0}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    :cond_52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v3, "f0"

    new-array v4, v0, [Ljava/lang/Class;

    invoke-virtual {p1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_63
    .catchall {:try_start_4f .. :try_end_63} :catchall_67

    :try_start_63
    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    goto :goto_74

    :catchall_67
    move-exception p1

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    throw p1
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_6c} :catch_6c

    :catch_6c
    move-exception p0

    const-string p1, "nicoid-player"

    const-string v0, "Unable to toggle playback"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_74
    return-void
.end method

.method public static miniIcon(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .registers 4

    .line 19
    new-instance v0, Le/e/a/PlayerIcons$Icon;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Le/e/a/PlayerIcons$Icon;-><init>(Ljava/lang/String;Z)V

    invoke-static {p0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result p0

    iput p0, v0, Le/e/a/PlayerIcons$Icon;->ink:I

    return-object v0
.end method

.method private static normalCenter(Landroid/view/View;)V
    .registers 6

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlayerControlsDock;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    const-string v0, "videoLayout"

    invoke-static {p0, v0}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    const-string v1, "viewbutton"

    invoke-static {p0, v1}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    if-eqz v0, :cond_76

    if-nez v1, :cond_1c

    goto :goto_76

    :cond_1c
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    const/4 v4, 0x2

    if-eq v3, v4, :cond_41

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v3, 0x43960000    # 300.0f

    mul-float/2addr v3, v2

    cmpl-float v0, v0, v3

    if-gtz v0, :cond_41

    const/4 v0, 0x0

    goto :goto_42

    :cond_41
    const/4 v0, 0x1

    :goto_42
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object v4, Le/e/a/PlayerIcons;->TABLET:Ljava/util/Map;

    invoke-interface {v4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_53

    const/16 v0, 0x58

    goto :goto_5a

    :cond_53
    if-eqz v0, :cond_58

    const/16 v0, 0x48

    goto :goto_5a

    :cond_58
    const/16 v0, 0x38

    :goto_5a
    int-to-float v0, v0

    mul-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v3, v0, :cond_6c

    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v3, v0, :cond_73

    :cond_6c
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_73
    invoke-static {p0}, Le/e/a/PlayerIcons;->center(Landroid/view/View;)V

    :cond_76
    :goto_76
    return-void
.end method

.method public static playing(Ljava/lang/Object;Z)V
    .registers 6

    .line 21
    const-string v0, "x1"

    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-nez v1, :cond_31

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "a"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_31

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Landroid/view/View;

    :cond_31
    if-nez v1, :cond_34

    return-void

    :cond_34
    const-string p0, "viewbutton"

    invoke-static {v1, p0}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_4f

    if-eqz p1, :cond_41

    const-string p1, "pause"

    goto :goto_43

    :cond_41
    const-string p1, "play"

    :goto_43
    invoke-static {p0, p1}, Le/e/a/PlayerIcons;->apply(Landroid/view/View;Ljava/lang/String;)V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_46} :catch_47

    goto :goto_4f

    :catch_47
    move-exception p0

    const-string p1, "nicoid-player"

    const-string v0, "Playback control state update failed"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_4f
    :goto_4f
    return-void
.end method

.method private static supported(Ljava/lang/String;)Z
    .registers 17

    .line 16
    const-string v14, "exitfullscreen"

    const-string v15, "close"

    const-string v0, "play"

    const-string v1, "pause"

    const-string v2, "prev"

    const-string v3, "next"

    const-string v4, "popup"

    const-string v5, "repeaton"

    const-string v6, "repeatoff"

    const-string v7, "commenton"

    const-string v8, "commentoff"

    const-string v9, "commentpost"

    const-string v10, "info"

    const-string v11, "fullscreen"

    const-string v12, "fullscreenoff"

    const-string v13, "fullscreenon"

    filled-new-array/range {v0 .. v15}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static symbol(Landroid/view/View;Ljava/lang/String;)V
    .registers 2

    .line 20
    invoke-static {p0, p1}, Le/e/a/PlayerIcons;->apply(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method public static tablet(Landroid/view/View;Z)V
    .registers 3

    .line 15
    sget-object v0, Le/e/a/PlayerIcons;->TABLET:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/PlayerIcons;->normalCenter(Landroid/view/View;)V

    return-void
.end method

.method private static watchPlayback(Landroid/view/View;)V
    .registers 5

    .line 32
    sget-object v0, Le/e/a/PlayerIcons;->WATCHERS:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    sget-object v1, Le/e/a/PlayerIcons;->WATCHERS:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    monitor-exit v0

    return-void

    :cond_d
    new-instance v1, Le/e/a/PlayerIcons$PlaybackWatcher;

    invoke-direct {v1, p0}, Le/e/a/PlayerIcons$PlaybackWatcher;-><init>(Landroid/view/View;)V

    sget-object v2, Le/e/a/PlayerIcons;->WATCHERS:Ljava/util/Map;

    invoke-interface {v2, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    const-string v2, "viewbutton"

    invoke-static {p0, v2}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_2a

    new-instance v3, Le/e/a/PlayerIcons$$ExternalSyntheticLambda3;

    invoke-direct {v3, p0}, Le/e/a/PlayerIcons$$ExternalSyntheticLambda3;-><init>(Landroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2a
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-virtual {p0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_33
    monitor-exit v0

    return-void

    :catchall_35
    move-exception p0

    monitor-exit v0
    :try_end_37
    .catchall {:try_start_3 .. :try_end_37} :catchall_35

    throw p0
.end method
