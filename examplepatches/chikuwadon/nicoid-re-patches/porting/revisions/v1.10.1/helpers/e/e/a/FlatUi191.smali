.class public final Le/e/a/FlatUi191;
.super Ljava/lang/Object;
.source "FlatUi191.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FlatUi191$FlatOutline;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static flatten(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 7

    .line 24
    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MaterialShapeDrawable"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_33

    :try_start_16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v3, "setShadowCompatibilityMode"

    new-array v4, v2, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_31
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_16 .. :try_end_31} :catch_32

    goto :goto_33

    :catch_32
    move-exception v0

    :cond_33
    :goto_33
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x18

    if-lt v0, v3, :cond_54

    instance-of v0, p0, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_54

    move-object v0, p0

    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getColors()[I

    move-result-object v0

    if-eqz v0, :cond_54

    array-length v3, v0

    if-le v3, v2, :cond_54

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    aget v0, v0, v1

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    :cond_54
    instance-of v0, p0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_6c

    move-object v0, p0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    :goto_5b
    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v2

    if-lt v1, v2, :cond_62

    goto :goto_7a

    :cond_62
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v2}, Le/e/a/FlatUi191;->flatten(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    add-int/lit8 v1, v1, 0x1

    goto :goto_5b

    :cond_6c
    instance-of v0, p0, Landroid/graphics/drawable/InsetDrawable;

    if-eqz v0, :cond_7a

    move-object v0, p0

    check-cast v0, Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/InsetDrawable;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0}, Le/e/a/FlatUi191;->flatten(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    :cond_7a
    :goto_7a
    return-object p0
.end method

.method static legacyButton(Landroid/widget/Button;)V
    .registers 6

    .line 27
    invoke-virtual {p0}, Landroid/widget/Button;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_9

    move-object v0, v1

    goto :goto_d

    :cond_9
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_d
    instance-of v0, v0, Landroid/graphics/drawable/NinePatchDrawable;

    if-nez v0, :cond_12

    return-void

    :cond_12
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v0

    const/4 v2, 0x1

    invoke-static {v0, v2}, Le/e/a/DialogColors;->secondary(IZ)I

    move-result v0

    goto :goto_2d

    :cond_2a
    const v0, -0x181819

    :goto_2d
    invoke-virtual {p0}, Landroid/widget/Button;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v2

    if-eqz v2, :cond_37

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    :cond_37
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {v2, v0, v3}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v3

    const v4, 0xffffff

    and-int/2addr v3, v4

    const/high16 v4, 0x33000000

    or-int/2addr v3, v4

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-direct {v2, v3, v0, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-static {p0, v2}, Le/e/a/FlatUi191;->replaceBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method static media(Landroid/view/View;)Z
    .registers 3

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    instance-of v1, p0, Landroid/view/SurfaceView;

    if-nez v1, :cond_32

    instance-of v1, p0, Landroid/view/TextureView;

    if-nez v1, :cond_32

    instance-of v1, p0, Landroid/webkit/WebView;

    if-nez v1, :cond_32

    const-string v1, "com.devbrackets."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_32

    const-string v1, "PlayerView"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "nicoid-media-overlay"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_32

    const/4 p0, 0x0

    return p0

    :cond_32
    const/4 p0, 0x1

    return p0
.end method

.method static noShadow(Landroid/view/View;)V
    .registers 3

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getStateListAnimator()Landroid/animation/StateListAnimator;

    move-result-object v0

    if-eqz v0, :cond_1e

    instance-of v0, p0, Landroid/widget/Button;

    if-nez v0, :cond_1a

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CardView"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1e

    :cond_1a
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 20
    :cond_1e
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_43

    invoke-virtual {p0}, Landroid/view/View;->hasTransientState()Z

    move-result v0

    if-nez v0, :cond_43

    invoke-virtual {p0}, Landroid/view/View;->getElevation()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_38

    invoke-virtual {p0, v1}, Landroid/view/View;->setElevation(F)V

    :cond_38
    invoke-virtual {p0}, Landroid/view/View;->getTranslationZ()F

    move-result v0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_43

    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationZ(F)V

    .line 21
    :cond_43
    invoke-virtual {p0}, Landroid/view/View;->getOutlineProvider()Landroid/view/ViewOutlineProvider;

    move-result-object v0

    if-eqz v0, :cond_55

    instance-of v1, v0, Le/e/a/FlatUi191$FlatOutline;

    if-nez v1, :cond_55

    new-instance v1, Le/e/a/FlatUi191$FlatOutline;

    invoke-direct {v1, v0}, Le/e/a/FlatUi191$FlatOutline;-><init>(Landroid/view/ViewOutlineProvider;)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 22
    :cond_55
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_6e

    invoke-virtual {p0}, Landroid/view/View;->getOutlineAmbientShadowColor()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_65

    invoke-virtual {p0, v1}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    :cond_65
    invoke-virtual {p0}, Landroid/view/View;->getOutlineSpotShadowColor()I

    move-result v0

    if-eqz v0, :cond_6e

    invoke-virtual {p0, v1}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    .line 23
    :cond_6e
    return-void
.end method

.method public static one(Landroid/view/View;)V
    .registers 4

    .line 25
    if-eqz p0, :cond_44

    invoke-static {p0}, Le/e/a/FlatUi191;->media(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_44

    :cond_9
    invoke-static {p0}, Le/e/a/FlatUi191;->noShadow(Landroid/view/View;)V

    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_2c

    const-string v0, "nicoid_duration"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getShadowRadius()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_2c

    const/4 v1, 0x0

    invoke-virtual {v0, v2, v2, v2, v1}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    :cond_2c
    instance-of v0, p0, Landroid/widget/ImageView;

    if-nez v0, :cond_37

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0}, Le/e/a/FlatUi191;->flatten(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    :cond_37
    instance-of v0, p0, Landroid/widget/Button;

    if-eqz v0, :cond_44

    instance-of v0, p0, Landroid/widget/CompoundButton;

    if-nez v0, :cond_44

    check-cast p0, Landroid/widget/Button;

    invoke-static {p0}, Le/e/a/FlatUi191;->legacyButton(Landroid/widget/Button;)V

    :cond_44
    :goto_44
    return-void
.end method

.method static replaceBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .registers 9

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getMinimumWidth()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {p0, v4}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {p0, v5}, Landroid/view/View;->setMinimumHeight(I)V

    return-void
.end method

.method static tagDepth(Landroid/view/View;)V
    .registers 6

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "style"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "NicoidFlatTag"

    invoke-virtual {v1, v4, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    const v2, 0x1010440

    const v3, 0x10103fa

    filled-new-array {v2, v3}, [I

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_24
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    invoke-virtual {p0, v1}, Landroid/view/View;->setElevation(F)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationZ(F)V
    :try_end_33
    .catchall {:try_start_24 .. :try_end_33} :catchall_3e

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    invoke-static {p0}, Le/e/a/FlatUi191;->noShadow(Landroid/view/View;)V

    return-void

    :catchall_3e
    move-exception p0

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw p0
.end method

.method public static tree(Landroid/view/View;)V
    .registers 3

    .line 26
    if-eqz p0, :cond_24

    invoke-static {p0}, Le/e/a/FlatUi191;->media(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_24

    :cond_9
    invoke-static {p0}, Le/e/a/FlatUi191;->one(Landroid/view/View;)V

    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_24

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_1a

    goto :goto_24

    :cond_1a
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/FlatUi191;->tree(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    :cond_24
    :goto_24
    return-void
.end method

.method public static window(Landroid/app/Dialog;)V
    .registers 3

    .line 29
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_19

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setElevation(F)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Le/e/a/FlatUi191;->tree(Landroid/view/View;)V

    :cond_19
    return-void
.end method
