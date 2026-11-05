.class public final Le/e/a/PlayerGestures;
.super Ljava/lang/Object;
.source "PlayerGestures.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlayerGestures$State;
    }
.end annotation


# static fields
.field private static final gains:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final states:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/PlayerGestures$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 15
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerGestures;->states:Ljava/util/WeakHashMap;

    .line 16
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerGestures;->gains:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static controlAt(Landroid/view/View;FFLandroid/view/View;)Z
    .registers 10

    .line 79
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v2

    if-nez v2, :cond_14

    return v1

    .line 80
    :cond_14
    instance-of v2, p0, Landroid/widget/SeekBar;

    const/4 v3, 0x1

    if-nez v2, :cond_27

    instance-of v2, p0, Landroid/widget/Button;

    if-nez v2, :cond_27

    instance-of v2, p0, Landroid/widget/ImageButton;

    if-nez v2, :cond_27

    instance-of v2, p0, Landroid/widget/EditText;

    if-nez v2, :cond_27

    const/4 v2, 0x0

    goto :goto_28

    :cond_27
    const/4 v2, 0x1

    :goto_28
    if-eqz v2, :cond_40

    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    const/high16 v5, 0x41400000    # 12.0f

    mul-float v4, v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    neg-int v4, v4

    invoke-virtual {v0, v4, v4}, Landroid/graphics/Rect;->inset(II)V

    :cond_40
    float-to-int v4, p1

    float-to-int v5, p2

    .line 82
    invoke-virtual {v0, v4, v5}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-nez v0, :cond_49

    return v1

    :cond_49
    if-eqz v2, :cond_4c

    return v3

    .line 84
    :cond_4c
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_68

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v3

    :goto_57
    if-gez v0, :cond_5a

    goto :goto_68

    :cond_5a
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2, p1, p2, p3}, Le/e/a/PlayerGestures;->controlAt(Landroid/view/View;FFLandroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_65

    return v3

    :cond_65
    add-int/lit8 v0, v0, -0x1

    goto :goto_57

    :cond_68
    :goto_68
    return v1
.end method

.method public static destroy(Landroid/app/Activity;)V
    .registers 3

    invoke-static/range {p0 .. p0}, Le/e/a/PlayerGestures219;->destroy(Landroid/app/Activity;)V

    .line 74
    invoke-static {p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    sget-object v0, Le/e/a/PlayerGestures;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlayerGestures$State;

    if-eqz p0, :cond_2c

    iget-object v0, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    if-eqz v0, :cond_2c

    iget-object v0, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/PlayerGestures$State;->hide:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2c

    check-cast v0, Landroid/view/ViewGroup;

    iget-object p0, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_2c
    return-void
.end method

.method private static hud(Landroid/app/Activity;Le/e/a/PlayerGestures$State;I)V
    .registers 11

    .line 89
    iget-object v0, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/4 v1, 0x1

    if-nez v0, :cond_b7

    const v0, 0x1020002

    .line 90
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    iget-object v2, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v2, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    iget-object v3, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/high16 v4, 0x41800000    # 16.0f

    mul-float v4, v4, v2

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v5

    const/high16 v6, 0x41200000    # 10.0f

    mul-float v2, v2, v6

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v6

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v7

    invoke-virtual {v3, v5, v6, v4, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v3, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 91
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    const v4, 0x7f03005e

    invoke-virtual {v3, v4, v2, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v3, v2, Landroid/util/TypedValue;->resourceId:I

    if-nez v3, :cond_69

    iget v2, v2, Landroid/util/TypedValue;->data:I

    goto :goto_73

    :cond_69
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v2, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    .line 92
    :goto_73
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v4, 0xfcfcfc

    and-int/2addr v2, v4

    ushr-int/lit8 v2, v2, 0x2

    const/high16 v4, -0x67000000

    or-int/2addr v2, v4

    const v2, -0x4d000000

    invoke-virtual {v3, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x41000000    # 8.0f

    mul-float v2, v2, v4

    invoke-virtual {v3, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    iget-object v2, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 93
    iget-object v2, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v4, 0x33

    const/4 v5, -0x2

    invoke-direct {v3, v5, v5, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le/e/a/PlayerGestures$$ExternalSyntheticLambda2;

    invoke-direct {v0, p1}, Le/e/a/PlayerGestures$$ExternalSyntheticLambda2;-><init>(Le/e/a/PlayerGestures$State;)V

    iput-object v0, p1, Le/e/a/PlayerGestures$State;->hide:Ljava/lang/Runnable;

    .line 95
    :cond_b7
    iget v0, p1, Le/e/a/PlayerGestures$State;->target:I

    invoke-static {v0}, Le/e/a/PlayerIcons;->gestureIcon(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x41d00000    # 26.0f

    mul-float p0, p0, v2

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, p0, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object p0, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iget-object p0, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "%"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    iget v4, p1, Le/e/a/PlayerGestures$State;->target:I

    if-ne v4, v1, :cond_fb

    const-string v1, "\u97f3\u91cf"

    goto :goto_fd

    :cond_fb
    const-string v1, "\u8f1d\u5ea6"

    :goto_fd
    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p0, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    new-instance p2, Le/e/a/PlayerGestures$$ExternalSyntheticLambda3;

    invoke-direct {p2, p1}, Le/e/a/PlayerGestures$$ExternalSyntheticLambda3;-><init>(Le/e/a/PlayerGestures$State;)V

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    iget-object p0, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p0, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    iget-object p2, p1, Le/e/a/PlayerGestures$State;->hide:Ljava/lang/Runnable;

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object p0, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    iget-object p1, p1, Le/e/a/PlayerGestures$State;->hide:Ljava/lang/Runnable;

    const-wide/16 v0, 0x2bc

    invoke-virtual {p0, p1, v0, v1}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method static synthetic lambda$0(Le/e/a/PlayerGestures$State;)V
    .registers 2

    .line 93
    iget-object p0, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method static synthetic lambda$1(Le/e/a/PlayerGestures$State;)V
    .registers 1

    .line 95
    invoke-static {p0}, Le/e/a/PlayerGestures;->position(Le/e/a/PlayerGestures$State;)V

    return-void
.end method

.method private static position(Le/e/a/PlayerGestures$State;)V
    .registers 7

    .line 87
    iget-object v0, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    if-eqz v0, :cond_66

    iget-object v0, p0, Le/e/a/PlayerGestures$State;->video:Landroid/view/View;

    if-eqz v0, :cond_66

    iget-object v0, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-nez v0, :cond_13

    goto :goto_66

    :cond_13
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v1, p0, Le/e/a/PlayerGestures$State;->video:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v1

    if-nez v1, :cond_28

    iget-object p0, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    return-void

    :cond_28
    const/4 v1, 0x2

    new-array v1, v1, [I

    iget-object v2, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    iget-object v2, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v3

    const/4 v4, 0x0

    aget v4, v1, v4

    int-to-float v4, v4

    sub-float/2addr v3, v4

    iget-object v4, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getWidth()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    sub-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setX(F)V

    iget-object v2, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v0

    const/4 v3, 0x1

    aget v1, v1, v3

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iget-object p0, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    move-result p0

    int-to-float p0, p0

    div-float/2addr p0, v5

    sub-float/2addr v0, p0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setY(F)V

    :cond_66
    :goto_66
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 5

    .line 19
    const-string v0, "\u30b9\u30ef\u30a4\u30d7\u3067\u97f3\u91cf\u8abf\u6574"

    const-string v1, "\u4e0a\u4e0b\u30b9\u30ef\u30a4\u30d7\u3067\u97f3\u91cf\u3092\u8abf\u6574\u3057\u307e\u3059\u3002\u8f1d\u5ea6\u8abf\u6574\u3082ON\u306e\u5834\u5408\u306f\u52d5\u753b\u306e\u53f3\u5074\u3067\u64cd\u4f5c\u3057\u307e\u3059"

    const-string v2, "gesture_volume"

    invoke-static {p0, p1, v2, v0, v1}, Le/e/a/PlayerGestures;->toggle(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    const-string v0, "\u30b9\u30ef\u30a4\u30d7\u3067\u8f1d\u5ea6\u8abf\u6574"

    const-string v1, "\u4e0a\u4e0b\u30b9\u30ef\u30a4\u30d7\u3067\u518d\u751f\u753b\u9762\u306e\u8f1d\u5ea6\u3092\u8abf\u6574\u3057\u307e\u3059\u3002\u97f3\u91cf\u8abf\u6574\u3082ON\u306e\u5834\u5408\u306f\u52d5\u753b\u306e\u5de6\u5074\u3067\u64cd\u4f5c\u3057\u307e\u3059"

    const-string v2, "gesture_brightness"

    invoke-static {p0, p1, v2, v0, v1}, Le/e/a/PlayerGestures;->toggle(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 9

    const/4 v0, 0x0

    .line 76
    :try_start_1
    const-string v1, "e.e.a.ModernShorts"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "touch"

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/app/Activity;

    aput-object v5, v4, v0

    const-class v5, Landroid/view/MotionEvent;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p0, v2, v0

    aput-object p1, v2, v6

    const/4 p0, 0x0

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_2a} :catch_2b

    return p0

    :catch_2b
    return v0
.end method

.method private static toggle(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 23
    invoke-virtual {p0, p2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Landroid/preference/CheckBoxPreference;

    invoke-direct {v0, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    invoke-static {p3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-static {p4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    const/4 p0, 0x0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 19

    move-object/from16 v1, p0

    .line 26
    invoke-static/range {p0 .. p0}, Le/e/a/HoldSpeed;->cancelling(Landroid/app/Activity;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_a

    return v2

    .line 27
    :cond_a
    sget-object v0, Le/e/a/PlayerGestures;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/PlayerGestures$State;

    if-eqz v3, :cond_19

    iget-boolean v3, v3, Le/e/a/PlayerGestures$State;->cancelling:Z

    if-eqz v3, :cond_19

    return v2

    .line 28
    :cond_19
    invoke-static/range {p0 .. p1}, Le/e/a/HoldSpeed;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_21

    return v4

    .line 29
    :cond_21
    invoke-static/range {p0 .. p0}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 31
    :cond_2c
    :try_start_2c
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v5, "v"

    invoke-virtual {v3, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v5, 0x0

    if-nez v3, :cond_3f

    move-object v3, v5

    goto :goto_4f

    .line 32
    :cond_3f
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "a0"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 33
    :goto_4f
    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 34
    const-string v7, "gesture_volume"

    invoke-interface {v6, v7, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    const-string v8, "gesture_brightness"

    invoke-interface {v6, v8, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    .line 35
    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Le/e/a/PlayerGestures$State;

    if-nez v8, :cond_6f

    new-instance v8, Le/e/a/PlayerGestures$State;

    invoke-direct {v8, v5}, Le/e/a/PlayerGestures$State;-><init>(Le/e/a/PlayerGestures$State;)V

    invoke-virtual {v0, v1, v8}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    :cond_6f
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0
    :try_end_73
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_73} :catch_2cc

    .line 37
    const-string v9, "audio"

    const/4 v10, 0x2

    const/high16 v12, 0x42c80000    # 100.0f

    const/4 v13, 0x3

    if-nez v0, :cond_189

    .line 38
    :try_start_7b
    iput-boolean v2, v8, Le/e/a/PlayerGestures$State;->active:Z

    iput-boolean v2, v8, Le/e/a/PlayerGestures$State;->rejected:Z

    iput v2, v8, Le/e/a/PlayerGestures$State;->target:I

    iput-object v3, v8, Le/e/a/PlayerGestures$State;->video:Landroid/view/View;

    if-eqz v3, :cond_184

    .line 39
    invoke-virtual {v3}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_184

    if-nez v7, :cond_91

    if-nez v6, :cond_91

    goto/16 :goto_184

    .line 40
    :cond_91
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v3, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v2

    if-eqz v2, :cond_17f

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v14

    float-to-int v14, v14

    invoke-virtual {v0, v2, v14}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    if-nez v2, :cond_ae

    goto/16 :goto_17f

    .line 42
    :cond_ae
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    iget v14, v0, Landroid/graphics/Rect;->left:I

    int-to-float v14, v14

    sub-float/2addr v2, v14

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v14

    iget v15, v0, Landroid/graphics/Rect;->top:I

    int-to-float v15, v15

    sub-float/2addr v14, v15

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v15

    int-to-float v15, v15

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v11

    iget v11, v11, Landroid/util/DisplayMetrics;->density:F

    invoke-static {v2, v14, v15, v5, v11}, Le/e/a/GestureRules;->startArea(FFFFF)Z

    move-result v2

    if-eqz v2, :cond_17a

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v11

    invoke-static {v2, v5, v11, v3}, Le/e/a/PlayerGestures;->controlAt(Landroid/view/View;FFLandroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_f0

    goto/16 :goto_17a

    .line 43
    :cond_f0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    iput v2, v8, Le/e/a/PlayerGestures$State;->x:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    iput v2, v8, Le/e/a/PlayerGestures$State;->y:F

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    iput v2, v8, Le/e/a/PlayerGestures$State;->height:F

    .line 44
    iget v2, v8, Le/e/a/PlayerGestures$State;->x:F

    iget v5, v0, Landroid/graphics/Rect;->left:I

    int-to-float v5, v5

    sub-float/2addr v2, v5

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    invoke-static {v7, v6, v2, v0}, Le/e/a/GestureRules;->target(ZZFF)I

    move-result v0

    iput v0, v8, Le/e/a/PlayerGestures$State;->target:I

    .line 45
    invoke-virtual {v1, v9}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 46
    iget v2, v8, Le/e/a/PlayerGestures$State;->target:I

    if-ne v2, v4, :cond_14c

    invoke-virtual {v0, v13}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, v12

    invoke-virtual {v0, v13}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v2, v0

    sget-object v0, Le/e/a/PlayerGestures;->gains:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v3}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_142

    invoke-virtual {v0, v3}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v5

    goto :goto_144

    :cond_142
    const/high16 v5, 0x3f800000    # 1.0f

    :goto_144
    mul-float v2, v2, v5

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-float v0, v0

    goto :goto_156

    :cond_14c
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    :goto_156
    iput v0, v8, Le/e/a/PlayerGestures$State;->start:F

    .line 47
    iget v0, v8, Le/e/a/PlayerGestures$State;->target:I

    if-ne v0, v10, :cond_175

    iget v0, v8, Le/e/a/PlayerGestures$State;->start:F

    const/4 v2, 0x0

    cmpg-float v0, v0, v2

    if-gez v0, :cond_175

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "screen_brightness"

    const/16 v3, 0x80

    invoke-static {v0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x437f0000    # 255.0f

    div-float/2addr v0, v2

    iput v0, v8, Le/e/a/PlayerGestures$State;->start:F

    .line 48
    :cond_175
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 42
    :cond_17a
    :goto_17a
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 40
    :cond_17f
    :goto_17f
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 39
    :cond_184
    :goto_184
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 50
    :cond_189
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-gt v3, v4, :cond_2c5

    const/4 v3, 0x5

    if-ne v0, v3, :cond_194

    goto/16 :goto_2c5

    :cond_194
    if-eq v0, v4, :cond_2b5

    if-ne v0, v13, :cond_19a

    goto/16 :goto_2b5

    :cond_19a
    if-ne v0, v10, :cond_2b0

    .line 52
    iget v0, v8, Le/e/a/PlayerGestures$State;->target:I

    if-eqz v0, :cond_2b0

    iget-boolean v0, v8, Le/e/a/PlayerGestures$State;->rejected:Z

    if-eqz v0, :cond_1a6

    goto/16 :goto_2b0

    .line 53
    :cond_1a6
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v3, v8, Le/e/a/PlayerGestures$State;->x:F

    sub-float/2addr v0, v3

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    iget v5, v8, Le/e/a/PlayerGestures$State;->y:F

    sub-float/2addr v3, v5

    .line 54
    iget-boolean v5, v8, Le/e/a/PlayerGestures$State;->active:Z

    if-nez v5, :cond_222

    .line 55
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    const/high16 v6, 0x41c00000    # 24.0f

    mul-float v5, v5, v6

    invoke-static/range {p0 .. p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v6

    int-to-float v6, v6

    const/high16 v7, 0x40000000    # 2.0f

    mul-float v6, v6, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .line 56
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpl-float v6, v6, v5

    if-lez v6, :cond_1f2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v6

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_1f2

    iput-boolean v4, v8, Le/e/a/PlayerGestures$State;->rejected:Z

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 57
    :cond_1f2
    invoke-static {v0, v3, v5}, Le/e/a/GestureRules;->vertical(FFF)Z

    move-result v0

    if-nez v0, :cond_1fd

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 59
    :cond_1fd
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v3

    invoke-virtual {v3, v13}, Landroid/view/MotionEvent;->setAction(I)V

    iput-boolean v4, v8, Le/e/a/PlayerGestures$State;->cancelling:Z
    :try_end_206
    .catch Ljava/lang/Exception; {:try_start_7b .. :try_end_206} :catch_2cc

    :try_start_206
    invoke-virtual {v1, v3}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-static {v1, v3}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    :try_end_20c
    .catchall {:try_start_206 .. :try_end_20c} :catchall_21b

    :try_start_20c
    iput-boolean v2, v8, Le/e/a/PlayerGestures$State;->cancelling:Z

    invoke-virtual {v3}, Landroid/view/MotionEvent;->recycle()V

    iput-boolean v4, v8, Le/e/a/PlayerGestures$State;->active:Z

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, v8, Le/e/a/PlayerGestures$State;->y:F

    const/4 v3, 0x0

    goto :goto_222

    :catchall_21b
    move-exception v0

    iput-boolean v2, v8, Le/e/a/PlayerGestures$State;->cancelling:Z

    invoke-virtual {v3}, Landroid/view/MotionEvent;->recycle()V

    throw v0

    .line 61
    :cond_222
    :goto_222
    iget v0, v8, Le/e/a/PlayerGestures$State;->target:I

    if-ne v0, v4, :cond_288

    .line 62
    invoke-virtual {v1, v9}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v13}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v5

    .line 63
    iget v6, v8, Le/e/a/PlayerGestures$State;->start:F

    iget v7, v8, Le/e/a/PlayerGestures$State;->height:F

    const/4 v9, 0x0

    invoke-static {v6, v3, v7, v9, v12}, Le/e/a/GestureRules;->value(FFFFF)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    mul-int v5, v5, v3

    int-to-float v5, v5

    div-float v6, v5, v12

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v6, v6

    if-nez v6, :cond_24c

    const/4 v11, 0x0

    goto :goto_251

    :cond_24c
    int-to-float v7, v6

    mul-float v7, v7, v12

    div-float v11, v5, v7

    .line 64
    :goto_251
    iget-object v5, v8, Le/e/a/PlayerGestures$State;->video:Landroid/view/View;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v7, "setVolume"

    new-array v9, v4, [Ljava/lang/Class;

    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v10, v9, v2

    invoke-virtual {v5, v7, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    iget-object v7, v8, Le/e/a/PlayerGestures$State;->video:Landroid/view/View;

    new-array v9, v4, [Ljava/lang/Object;

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    aput-object v10, v9, v2

    invoke-virtual {v5, v7, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v5, Le/e/a/PlayerGestures;->gains:Ljava/util/WeakHashMap;

    iget-object v7, v8, Le/e/a/PlayerGestures$State;->video:Landroid/view/View;

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    invoke-virtual {v5, v7, v9}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    invoke-virtual {v0, v13}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v5

    if-eq v6, v5, :cond_284

    invoke-virtual {v0, v13, v6, v2}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 66
    :cond_284
    invoke-static {v1, v8, v3}, Le/e/a/PlayerGestures;->hud(Landroid/app/Activity;Le/e/a/PlayerGestures$State;I)V

    goto :goto_2af

    .line 68
    :cond_288
    iget v0, v8, Le/e/a/PlayerGestures$State;->start:F

    iget v2, v8, Le/e/a/PlayerGestures$State;->height:F

    const v5, 0x3ca3d70a    # 0.02f

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v0, v3, v2, v5, v6}, Le/e/a/GestureRules;->value(FFFFF)F

    move-result v0

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    mul-float v0, v0, v12

    .line 69
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {v1, v8, v0}, Le/e/a/PlayerGestures;->hud(Landroid/app/Activity;Le/e/a/PlayerGestures$State;I)V

    :goto_2af
    return v4

    .line 52
    :cond_2b0
    :goto_2b0
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 51
    :cond_2b5
    :goto_2b5
    iget-boolean v0, v8, Le/e/a/PlayerGestures$State;->active:Z

    iput-boolean v2, v8, Le/e/a/PlayerGestures$State;->active:Z

    iput v2, v8, Le/e/a/PlayerGestures$State;->target:I

    if-nez v0, :cond_2c4

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_2c4

    return v2

    :cond_2c4
    return v4

    .line 50
    :cond_2c5
    :goto_2c5
    iput-boolean v4, v8, Le/e/a/PlayerGestures$State;->rejected:Z

    iput v2, v8, Le/e/a/PlayerGestures$State;->target:I

    iget-boolean v0, v8, Le/e/a/PlayerGestures$State;->active:Z
    :try_end_2cb
    .catch Ljava/lang/Exception; {:try_start_20c .. :try_end_2cb} :catch_2cc

    return v0

    :catch_2cc
    move-exception v0

    .line 72
    const-string v2, "nicoid-gesture"

    const-string v3, "Gesture failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
