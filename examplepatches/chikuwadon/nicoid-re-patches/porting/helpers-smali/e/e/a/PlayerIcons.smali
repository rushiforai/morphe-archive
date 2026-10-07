.class public final Le/e/a/PlayerIcons;
.super Ljava/lang/Object;
.source "PlayerIcons.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlayerIcons$Icon;
    }
.end annotation


# static fields
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


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 9
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerIcons;->TABLET:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static apply(Landroid/view/View;Ljava/lang/String;)V
    .registers 6

    .line 16
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
    .registers 14

    .line 17
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "viewbutton"

    const-string v2, "play"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "prevbutton"

    const-string v3, "prev"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "nextbutton"

    const-string v4, "next"

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const-string v4, "popupbutton"

    const-string v5, "popup"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "repeatbutton"

    const-string v6, "repeaton"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "commentbutton"

    const-string v7, "commentoff"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v6

    const-string v7, "fullscbutton"

    const-string v8, "fullscreen"

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v7

    const-string v8, "commentpostbutton"

    const-string v9, "commentpost"

    filled-new-array {v8, v9}, [Ljava/lang/String;

    move-result-object v8

    const-string v9, "infobutton"

    const-string v10, "info"

    filled-new-array {v9, v10}, [Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x9

    new-array v11, v10, [[Ljava/lang/String;

    const/4 v12, 0x0

    aput-object v1, v11, v12

    const/4 v1, 0x1

    aput-object v2, v11, v1

    const/4 v2, 0x2

    aput-object v3, v11, v2

    const/4 v2, 0x3

    aput-object v4, v11, v2

    const/4 v2, 0x4

    aput-object v5, v11, v2

    const/4 v2, 0x5

    aput-object v6, v11, v2

    const/4 v2, 0x6

    aput-object v7, v11, v2

    const/4 v2, 0x7

    aput-object v8, v11, v2

    const/16 v2, 0x8

    aput-object v9, v11, v2

    const/4 v2, 0x0

    :goto_74
    if-ge v2, v10, :cond_9a

    aget-object v3, v11, v2

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    aget-object v5, v3, v12

    const-string v6, "id"

    invoke-virtual {v4, v5, v6, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_97

    invoke-virtual {v4}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    instance-of v5, v5, Landroid/graphics/drawable/RippleDrawable;

    if-nez v5, :cond_97

    aget-object v3, v3, v1

    invoke-static {v4, v3}, Le/e/a/PlayerIcons;->apply(Landroid/view/View;Ljava/lang/String;)V

    :cond_97
    add-int/lit8 v2, v2, 0x1

    goto :goto_74

    :cond_9a
    instance-of v0, p0, Le/e/a/PopupPinchLayout;

    if-nez v0, :cond_c5

    const-string v0, "viewctrllay"

    invoke-static {p0, v0}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_bd

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "centered-play-control"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_bd

    invoke-virtual {v0, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance v0, Le/e/a/PlayerIcons$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Le/e/a/PlayerIcons$$ExternalSyntheticLambda0;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_bd
    new-instance v0, Le/e/a/PlayerIcons$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Le/e/a/PlayerIcons$$ExternalSyntheticLambda1;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_c5
    return-void
.end method

.method public static background(Landroid/view/View;I)V
    .registers 4

    .line 12
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_9

    goto :goto_c

    :catch_9
    move-exception v0

    const-string v0, ""

    :goto_c
    invoke-static {v0}, Le/e/a/PlayerIcons;->supported(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_16

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    return-void

    :cond_16
    invoke-static {p0, v0}, Le/e/a/PlayerIcons;->apply(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method public static center(Landroid/view/View;)V
    .registers 6

    .line 20
    const-string v0, "videoLayout"

    invoke-static {p0, v0}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    const-string v1, "viewctrllay"

    invoke-static {p0, v1}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    if-eqz v0, :cond_52

    if-eqz p0, :cond_52

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-eqz v1, :cond_52

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-nez v1, :cond_1d

    goto :goto_52

    :cond_1d
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

    if-lez v0, :cond_52

    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    add-float/2addr v0, v2

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    :cond_52
    :goto_52
    return-void
.end method

.method private static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 18
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

.method public static gestureIcon(I)Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 14
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

.method static synthetic lambda$attach$0(Landroid/view/View;Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 17
    invoke-static {p0}, Le/e/a/PlayerIcons;->normalCenter(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$attach$1(Landroid/view/View;)V
    .registers 1

    .line 17
    invoke-static {p0}, Le/e/a/PlayerIcons;->normalCenter(Landroid/view/View;)V

    return-void
.end method

.method public static miniIcon(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .registers 4

    .line 13
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

    .line 19
    const-string v0, "videoLayout"

    invoke-static {p0, v0}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    const-string v1, "viewbutton"

    invoke-static {p0, v1}, Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    if-eqz v0, :cond_6e

    if-nez v1, :cond_11

    goto :goto_6e

    :cond_11
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

    if-eq v3, v4, :cond_38

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v3, 0x43960000    # 300.0f

    mul-float v3, v3, v2

    cmpl-float v0, v0, v3

    if-lez v0, :cond_36

    goto :goto_38

    :cond_36
    const/4 v0, 0x0

    goto :goto_39

    :cond_38
    :goto_38
    const/4 v0, 0x1

    :goto_39
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object v4, Le/e/a/PlayerIcons;->TABLET:Ljava/util/Map;

    invoke-interface {v4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4a

    const/16 v0, 0x58

    goto :goto_51

    :cond_4a
    if-eqz v0, :cond_4f

    const/16 v0, 0x48

    goto :goto_51

    :cond_4f
    const/16 v0, 0x38

    :goto_51
    int-to-float v0, v0

    mul-float v0, v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v3, v0, :cond_64

    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v3, v0, :cond_6b

    :cond_64
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_6b
    invoke-static {p0}, Le/e/a/PlayerIcons;->center(Landroid/view/View;)V

    :cond_6e
    :goto_6e
    return-void
.end method

.method private static supported(Ljava/lang/String;)Z
    .registers 16

    .line 11
    const-string v13, "fullscreenon"

    const-string v14, "exitfullscreen"

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

    filled-new-array/range {v0 .. v14}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static symbol(Landroid/view/View;Ljava/lang/String;)V
    .registers 2

    .line 15
    invoke-static {p0, p1}, Le/e/a/PlayerIcons;->apply(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method public static tablet(Landroid/view/View;Z)V
    .registers 3

    .line 10
    sget-object v0, Le/e/a/PlayerIcons;->TABLET:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/PlayerIcons;->normalCenter(Landroid/view/View;)V

    return-void
.end method
