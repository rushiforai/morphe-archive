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

.method private static controlAt(Landroid/view/View;FFLandroid/view/View;)Z
    .registers 11
    .param p0, "v"    # Landroid/view/View;
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "video"    # Landroid/view/View;

    .line 77
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .local v0, "r":Landroid/graphics/Rect;
    invoke-virtual {p0, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v2

    if-nez v2, :cond_14

    return v1

    .line 78
    :cond_14
    instance-of v2, p0, Landroid/widget/SeekBar;

    const/4 v3, 0x1

    if-nez v2, :cond_28

    instance-of v2, p0, Landroid/widget/Button;

    if-nez v2, :cond_28

    instance-of v2, p0, Landroid/widget/ImageButton;

    if-nez v2, :cond_28

    instance-of v2, p0, Landroid/widget/EditText;

    if-eqz v2, :cond_26

    goto :goto_28

    :cond_26
    const/4 v2, 0x0

    goto :goto_29

    :cond_28
    :goto_28
    const/4 v2, 0x1

    .line 79
    .local v2, "control":Z
    :goto_29
    if-eqz v2, :cond_42

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    const/high16 v5, 0x41400000    # 12.0f

    mul-float v4, v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    .local v4, "margin":I
    neg-int v5, v4

    neg-int v6, v4

    invoke-virtual {v0, v5, v6}, Landroid/graphics/Rect;->inset(II)V

    .line 80
    .end local v4    # "margin":I
    :cond_42
    float-to-int v4, p1

    float-to-int v5, p2

    invoke-virtual {v0, v4, v5}, Landroid/graphics/Rect;->contains(II)Z

    move-result v4

    if-nez v4, :cond_4b

    return v1

    .line 81
    :cond_4b
    if-eqz v2, :cond_4e

    return v3

    .line 82
    :cond_4e
    instance-of v4, p0, Landroid/view/ViewGroup;

    if-eqz v4, :cond_6a

    move-object v4, p0

    check-cast v4, Landroid/view/ViewGroup;

    .local v4, "g":Landroid/view/ViewGroup;
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    sub-int/2addr v5, v3

    .local v5, "i":I
    :goto_5a
    if-ltz v5, :cond_6a

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-static {v6, p1, p2, p3}, Le/e/a/PlayerGestures;->controlAt(Landroid/view/View;FFLandroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_67

    return v3

    :cond_67
    add-int/lit8 v5, v5, -0x1

    goto :goto_5a

    .line 83
    .end local v4    # "g":Landroid/view/ViewGroup;
    .end local v5    # "i":I
    :cond_6a
    return v1
.end method

.method public static destroy(Landroid/app/Activity;)V
    .registers 5
    .param p0, "a"    # Landroid/app/Activity;

    .line 72
    sget-object v0, Le/e/a/PlayerGestures;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlayerGestures$State;

    .local v0, "s":Le/e/a/PlayerGestures$State;
    if-eqz v0, :cond_27

    iget-object v1, v0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    if-eqz v1, :cond_27

    iget-object v1, v0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    iget-object v2, v0, Le/e/a/PlayerGestures$State;->hide:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v1, v0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .local v1, "p":Landroid/view/ViewParent;
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_27

    move-object v2, v1

    check-cast v2, Landroid/view/ViewGroup;

    iget-object v3, v0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .end local v1    # "p":Landroid/view/ViewParent;
    :cond_27
    return-void
.end method

.method private static hud(Landroid/app/Activity;Le/e/a/PlayerGestures$State;I)V
    .registers 13
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "s"    # Le/e/a/PlayerGestures$State;
    .param p2, "percent"    # I

    .line 87
    iget-object v0, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/4 v1, 0x1

    if-nez v0, :cond_ba

    .line 88
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .local v0, "root":Landroid/widget/FrameLayout;
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

    .local v2, "density":F
    iget-object v3, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/high16 v4, 0x41800000    # 16.0f

    mul-float v5, v2, v4

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    const/high16 v6, 0x41200000    # 10.0f

    mul-float v7, v2, v6

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    mul-float v4, v4, v2

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    mul-float v8, v2, v6

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    invoke-virtual {v3, v5, v7, v4, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v3, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    mul-float v6, v6, v2

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 89
    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .local v3, "color":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    const v5, 0x7f03005e

    invoke-virtual {v4, v5, v3, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v4, v3, Landroid/util/TypedValue;->resourceId:I

    if-nez v4, :cond_6f

    iget v4, v3, Landroid/util/TypedValue;->data:I

    goto :goto_79

    :cond_6f
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget v5, v3, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    .line 90
    .local v4, "accent":I
    :goto_79
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .local v5, "bg":Landroid/graphics/drawable/GradientDrawable;
    const v6, 0xfcfcfc

    and-int/2addr v6, v4

    ushr-int/lit8 v6, v6, 0x2

    const/high16 v7, -0x67000000

    or-int/2addr v6, v7

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x41000000    # 8.0f

    mul-float v6, v6, v7

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    iget-object v6, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v6, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 91
    iget-object v6, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v8, 0x33

    const/4 v9, -0x2

    invoke-direct {v7, v9, v9, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v6, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Le/e/a/PlayerGestures$0;

    invoke-direct {v6, p1}, Le/e/a/PlayerGestures$0;-><init>(Le/e/a/PlayerGestures$State;)V

    iput-object v6, p1, Le/e/a/PlayerGestures$State;->hide:Ljava/lang/Runnable;

    .line 93
    .end local v0    # "root":Landroid/widget/FrameLayout;
    .end local v2    # "density":F
    .end local v3    # "color":Landroid/util/TypedValue;
    .end local v4    # "accent":I
    .end local v5    # "bg":Landroid/graphics/drawable/GradientDrawable;
    :cond_ba
    iget v0, p1, Le/e/a/PlayerGestures$State;->target:I

    invoke-static {v0}, Le/e/a/PlayerIcons;->gestureIcon(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .local v0, "icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x41d00000    # 26.0f

    mul-float v2, v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .local v2, "side":I
    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v2, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v4, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iget-object v4, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "%"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget v7, p1, Le/e/a/PlayerGestures$State;->target:I

    if-ne v7, v1, :cond_102

    const-string v1, "\u97f3\u91cf"

    goto :goto_104

    :cond_102
    const-string v1, "\u8f1d\u5ea6"

    :goto_104
    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, " "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v1, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    new-instance v4, Le/e/a/PlayerGestures$2;

    invoke-direct {v4, p1}, Le/e/a/PlayerGestures$2;-><init>(Le/e/a/PlayerGestures$State;)V

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    iget-object v1, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    iget-object v3, p1, Le/e/a/PlayerGestures$State;->hide:Ljava/lang/Runnable;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v1, p1, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    iget-object v3, p1, Le/e/a/PlayerGestures$State;->hide:Ljava/lang/Runnable;

    const-wide/16 v4, 0x2bc

    invoke-virtual {v1, v3, v4, v5}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 94
    return-void
.end method

.method static synthetic lambda$hud$0(Le/e/a/PlayerGestures$State;)V
    .registers 3
    .param p0, "s"    # Le/e/a/PlayerGestures$State;

    .line 91
    iget-object v0, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method static synthetic lambda$hud$1(Le/e/a/PlayerGestures$State;)V
    .registers 1
    .param p0, "s"    # Le/e/a/PlayerGestures$State;

    .line 93
    invoke-static {p0}, Le/e/a/PlayerGestures;->position(Le/e/a/PlayerGestures$State;)V

    return-void
.end method

.method private static position(Le/e/a/PlayerGestures$State;)V
    .registers 7
    .param p0, "s"    # Le/e/a/PlayerGestures$State;

    .line 85
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

    .local v0, "r":Landroid/graphics/Rect;
    iget-object v1, p0, Le/e/a/PlayerGestures$State;->video:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v1

    if-nez v1, :cond_28

    iget-object v1, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    return-void

    :cond_28
    const/4 v1, 0x2

    new-array v1, v1, [I

    .local v1, "origin":[I
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

    move-result v3

    const/4 v4, 0x1

    aget v4, v1, v4

    int-to-float v4, v4

    sub-float/2addr v3, v4

    iget-object v4, p0, Le/e/a/PlayerGestures$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v5

    sub-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setY(F)V

    .end local v0    # "r":Landroid/graphics/Rect;
    .end local v1    # "origin":[I
    :cond_66
    :goto_66
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 5
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "group"    # Landroid/preference/PreferenceGroup;

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

    .line 21
    return-void
.end method

.method private static shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 9
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "e"    # Landroid/view/MotionEvent;

    .line 74
    const/4 v0, 0x0

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

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_2a} :catch_2b

    return v0

    :catch_2b
    move-exception v1

    .local v1, "ignored":Ljava/lang/Exception;
    return v0
.end method

.method private static toggle(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "g"    # Landroid/preference/PreferenceGroup;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "summary"    # Ljava/lang/String;

    .line 23
    invoke-virtual {p0, p2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Landroid/preference/CheckBoxPreference;

    invoke-direct {v0, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    .local v0, "p":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v0, p2}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    invoke-static {p3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-static {p4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 24
    return-void
.end method

.method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 25
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 26
    move-object/from16 v1, p0

    sget-object v0, Le/e/a/PlayerGestures;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Le/e/a/PlayerGestures$State;

    .local v2, "previous":Le/e/a/PlayerGestures$State;
    const/4 v3, 0x0

    if-eqz v2, :cond_13

    iget-boolean v0, v2, Le/e/a/PlayerGestures$State;->cancelling:Z

    if-eqz v0, :cond_13

    return v3

    .line 27
    :cond_13
    invoke-static {v1}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 29
    :cond_1e
    :try_start_1e
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v4, "v"

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    .line 30
    .local v4, "fragment":Ljava/lang/Object;
    const/4 v0, 0x0

    if-nez v4, :cond_32

    move-object v5, v0

    goto :goto_42

    :cond_32
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "a0"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 31
    .local v5, "video":Landroid/view/View;
    :goto_42
    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 32
    .local v6, "p":Landroid/content/SharedPreferences;
    const-string v7, "gesture_volume"

    invoke-interface {v6, v7, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    .local v7, "volume":Z
    const-string v8, "gesture_brightness"

    invoke-interface {v6, v8, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    .line 33
    .local v8, "brightness":Z
    sget-object v9, Le/e/a/PlayerGestures;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v9, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Le/e/a/PlayerGestures$State;
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_5a} :catch_32f

    .local v9, "s":Le/e/a/PlayerGestures$State;
    if-nez v9, :cond_6d

    :try_start_5c
    new-instance v10, Le/e/a/PlayerGestures$State;

    invoke-direct {v10, v0}, Le/e/a/PlayerGestures$State;-><init>(Le/e/a/PlayerGestures$1;)V

    move-object v9, v10

    sget-object v0, Le/e/a/PlayerGestures;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v1, v9}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_67} :catch_68

    goto :goto_6d

    .line 70
    .end local v4    # "fragment":Ljava/lang/Object;
    .end local v5    # "video":Landroid/view/View;
    .end local v6    # "p":Landroid/content/SharedPreferences;
    .end local v7    # "volume":Z
    .end local v8    # "brightness":Z
    .end local v9    # "s":Le/e/a/PlayerGestures$State;
    :catch_68
    move-exception v0

    move-object/from16 v17, v2

    goto/16 :goto_332

    .line 34
    .restart local v4    # "fragment":Ljava/lang/Object;
    .restart local v5    # "video":Landroid/view/View;
    .restart local v6    # "p":Landroid/content/SharedPreferences;
    .restart local v7    # "volume":Z
    .restart local v8    # "brightness":Z
    .restart local v9    # "s":Le/e/a/PlayerGestures$State;
    :cond_6d
    :goto_6d
    :try_start_6d
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_6d .. :try_end_71} :catch_32f

    move v10, v0

    .line 35
    .local v10, "action":I
    const-string v11, "audio"

    if-nez v10, :cond_18e

    .line 36
    :try_start_76
    iput-boolean v3, v9, Le/e/a/PlayerGestures$State;->active:Z

    iput-boolean v3, v9, Le/e/a/PlayerGestures$State;->rejected:Z

    iput v3, v9, Le/e/a/PlayerGestures$State;->target:I

    iput-object v5, v9, Le/e/a/PlayerGestures$State;->video:Landroid/view/View;

    .line 37
    if-eqz v5, :cond_189

    invoke-virtual {v5}, Landroid/view/View;->isShown()Z

    move-result v3

    if-eqz v3, :cond_189

    if-nez v7, :cond_8c

    if-nez v8, :cond_8c

    goto/16 :goto_189

    .line 38
    :cond_8c
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .local v3, "r":Landroid/graphics/Rect;
    invoke-virtual {v5, v3}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v17

    if-eqz v17, :cond_184

    const/16 v17, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v13

    float-to-int v13, v13

    const/high16 v18, 0x42c80000    # 100.0f

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v14

    float-to-int v14, v14

    invoke-virtual {v3, v13, v14}, Landroid/graphics/Rect;->contains(II)Z

    move-result v13

    if-nez v13, :cond_ad

    goto/16 :goto_184

    .line 40
    :cond_ad
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v13

    iget v14, v3, Landroid/graphics/Rect;->left:I

    int-to-float v14, v14

    sub-float/2addr v13, v14

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v14

    iget v12, v3, Landroid/graphics/Rect;->top:I

    int-to-float v12, v12

    sub-float/2addr v14, v12

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v12

    int-to-float v12, v12

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v15

    int-to-float v15, v15

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    invoke-static {v13, v14, v12, v15, v0}, Le/e/a/GestureRules;->startArea(FFFFF)Z

    move-result v0

    if-eqz v0, :cond_17f

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v12

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v13

    invoke-static {v0, v12, v13, v5}, Le/e/a/PlayerGestures;->controlAt(Landroid/view/View;FFLandroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_ef

    goto/16 :goto_17f

    .line 41
    :cond_ef
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, v9, Le/e/a/PlayerGestures$State;->x:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, v9, Le/e/a/PlayerGestures$State;->y:F

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    iput v0, v9, Le/e/a/PlayerGestures$State;->height:F

    .line 42
    iget v0, v9, Le/e/a/PlayerGestures$State;->x:F

    iget v12, v3, Landroid/graphics/Rect;->left:I

    int-to-float v12, v12

    sub-float/2addr v0, v12

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v12

    int-to-float v12, v12

    invoke-static {v7, v8, v0, v12}, Le/e/a/GestureRules;->target(ZZFF)I

    move-result v0

    iput v0, v9, Le/e/a/PlayerGestures$State;->target:I

    .line 43
    invoke-virtual {v1, v11}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 44
    .local v0, "audio":Landroid/media/AudioManager;
    iget v11, v9, Le/e/a/PlayerGestures$State;->target:I

    const/4 v12, 0x1

    if-ne v11, v12, :cond_151

    const/4 v11, 0x3

    invoke-virtual {v0, v11}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v13

    int-to-float v13, v13

    mul-float v13, v13, v18

    invoke-virtual {v0, v11}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v11

    invoke-static {v12, v11}, Ljava/lang/Math;->max(II)I

    move-result v11

    int-to-float v11, v11

    div-float/2addr v13, v11

    sget-object v11, Le/e/a/PlayerGestures;->gains:Ljava/util/WeakHashMap;

    invoke-virtual {v11, v5}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_147

    sget-object v11, Le/e/a/PlayerGestures;->gains:Ljava/util/WeakHashMap;

    invoke-virtual {v11, v5}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Float;

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v11

    move/from16 v16, v11

    goto :goto_149

    :cond_147
    const/high16 v16, 0x3f800000    # 1.0f

    :goto_149
    mul-float v13, v13, v16

    invoke-static {v13}, Ljava/lang/Math;->round(F)I

    move-result v11

    int-to-float v11, v11

    goto :goto_15b

    :cond_151
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v11

    iget v11, v11, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    :goto_15b
    iput v11, v9, Le/e/a/PlayerGestures$State;->start:F

    .line 45
    iget v11, v9, Le/e/a/PlayerGestures$State;->target:I

    const/4 v12, 0x2

    if-ne v11, v12, :cond_17a

    iget v11, v9, Le/e/a/PlayerGestures$State;->start:F

    cmpg-float v11, v11, v17

    if-gez v11, :cond_17a

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    const-string v12, "screen_brightness"

    const/16 v13, 0x80

    invoke-static {v11, v12, v13}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v11

    int-to-float v11, v11

    const/high16 v12, 0x437f0000    # 255.0f

    div-float/2addr v11, v12

    iput v11, v9, Le/e/a/PlayerGestures$State;->start:F

    .line 46
    :cond_17a
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v11

    return v11

    .line 40
    .end local v0    # "audio":Landroid/media/AudioManager;
    :cond_17f
    :goto_17f
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 38
    :cond_184
    :goto_184
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 37
    .end local v3    # "r":Landroid/graphics/Rect;
    :cond_189
    :goto_189
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0
    :try_end_18d
    .catch Ljava/lang/Exception; {:try_start_76 .. :try_end_18d} :catch_68

    return v0

    .line 48
    :cond_18e
    const/16 v17, 0x0

    const/high16 v18, 0x42c80000    # 100.0f

    :try_start_192
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    const/4 v12, 0x1

    if-gt v0, v12, :cond_31e

    const/4 v0, 0x5

    if-ne v10, v0, :cond_1a4

    move-object/from16 v17, v2

    move-object/from16 v20, v4

    move-object/from16 v22, v5

    goto/16 :goto_324

    .line 49
    :cond_1a4
    if-eq v10, v12, :cond_304

    const/4 v0, 0x3

    if-ne v10, v0, :cond_1b1

    move-object/from16 v17, v2

    move-object/from16 v20, v4

    move-object/from16 v22, v5

    goto/16 :goto_30a

    .line 50
    :cond_1b1
    const/4 v12, 0x2

    if-ne v10, v12, :cond_2f9

    iget v0, v9, Le/e/a/PlayerGestures$State;->target:I

    if-eqz v0, :cond_2f9

    iget-boolean v0, v9, Le/e/a/PlayerGestures$State;->rejected:Z

    if-eqz v0, :cond_1c4

    move-object/from16 v17, v2

    move-object/from16 v20, v4

    move-object/from16 v22, v5

    goto/16 :goto_2ff

    .line 51
    :cond_1c4
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v12, v9, Le/e/a/PlayerGestures$State;->x:F

    sub-float v12, v0, v12

    .local v12, "dx":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iget v13, v9, Le/e/a/PlayerGestures$State;->y:F

    sub-float v13, v0, v13

    .line 52
    .local v13, "dy":F
    iget-boolean v0, v9, Le/e/a/PlayerGestures$State;->active:Z
    :try_end_1d6
    .catch Ljava/lang/Exception; {:try_start_192 .. :try_end_1d6} :catch_32f

    if-nez v0, :cond_248

    .line 53
    :try_start_1d8
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v14, 0x41c00000    # 24.0f

    mul-float v0, v0, v14

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v14

    invoke-virtual {v14}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v14

    int-to-float v14, v14

    const/high16 v15, 0x40000000    # 2.0f

    mul-float v14, v14, v15

    invoke-static {v0, v14}, Ljava/lang/Math;->max(FF)F

    move-result v0

    move v14, v0

    .line 54
    .local v14, "slop":F
    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, v14

    if-lez v0, :cond_214

    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    move-result v15

    cmpl-float v0, v0, v15

    if-lez v0, :cond_214

    const/4 v0, 0x1

    iput-boolean v0, v9, Le/e/a/PlayerGestures$State;->rejected:Z

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 55
    :cond_214
    invoke-static {v12, v13, v14}, Le/e/a/GestureRules;->vertical(FFF)Z

    move-result v0

    if-nez v0, :cond_21f

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 57
    :cond_21f
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    move-object v15, v0

    const/4 v0, 0x3

    .local v15, "cancel":Landroid/view/MotionEvent;
    invoke-virtual {v15, v0}, Landroid/view/MotionEvent;->setAction(I)V

    const/4 v0, 0x1

    iput-boolean v0, v9, Le/e/a/PlayerGestures$State;->cancelling:Z
    :try_end_22b
    .catch Ljava/lang/Exception; {:try_start_1d8 .. :try_end_22b} :catch_68

    :try_start_22b
    invoke-virtual {v1, v15}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-static {v1, v15}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    :try_end_231
    .catchall {:try_start_22b .. :try_end_231} :catchall_241

    :try_start_231
    iput-boolean v3, v9, Le/e/a/PlayerGestures$State;->cancelling:Z

    invoke-virtual {v15}, Landroid/view/MotionEvent;->recycle()V

    const/4 v0, 0x1

    iput-boolean v0, v9, Le/e/a/PlayerGestures$State;->active:Z

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, v9, Le/e/a/PlayerGestures$State;->y:F

    const/4 v13, 0x0

    goto :goto_248

    :catchall_241
    move-exception v0

    iput-boolean v3, v9, Le/e/a/PlayerGestures$State;->cancelling:Z

    invoke-virtual {v15}, Landroid/view/MotionEvent;->recycle()V

    .end local v2    # "previous":Le/e/a/PlayerGestures$State;
    .end local p0    # "a":Landroid/app/Activity;
    .end local p1    # "event":Landroid/view/MotionEvent;
    throw v0
    :try_end_248
    .catch Ljava/lang/Exception; {:try_start_231 .. :try_end_248} :catch_68

    .line 59
    .end local v14    # "slop":F
    .end local v15    # "cancel":Landroid/view/MotionEvent;
    .restart local v2    # "previous":Le/e/a/PlayerGestures$State;
    .restart local p0    # "a":Landroid/app/Activity;
    .restart local p1    # "event":Landroid/view/MotionEvent;
    :cond_248
    :goto_248
    :try_start_248
    iget v0, v9, Le/e/a/PlayerGestures$State;->target:I

    const/4 v14, 0x1

    if-ne v0, v14, :cond_2c7

    .line 60
    invoke-virtual {v1, v11}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    const/4 v11, 0x3

    .restart local v0    # "audio":Landroid/media/AudioManager;
    invoke-virtual {v0, v11}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v14

    .line 61
    .local v14, "max":I
    iget v11, v9, Le/e/a/PlayerGestures$State;->start:F

    iget v15, v9, Le/e/a/PlayerGestures$State;->height:F
    :try_end_25c
    .catch Ljava/lang/Exception; {:try_start_248 .. :try_end_25c} :catch_32f

    move-object/from16 v17, v2

    const/high16 v2, 0x42c80000    # 100.0f

    const/4 v3, 0x0

    const/16 v19, 0x0

    .end local v2    # "previous":Le/e/a/PlayerGestures$State;
    .local v17, "previous":Le/e/a/PlayerGestures$State;
    :try_start_263
    invoke-static {v11, v13, v15, v3, v2}, Le/e/a/GestureRules;->value(FFFFF)F

    move-result v11

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v11

    .local v11, "percent":I
    mul-int v15, v11, v14

    int-to-float v15, v15

    div-float/2addr v15, v2

    move-object v2, v4

    .end local v4    # "fragment":Ljava/lang/Object;
    .local v2, "fragment":Ljava/lang/Object;
    float-to-double v3, v15

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    .local v3, "step":I
    if-nez v3, :cond_27b

    const/16 v16, 0x0

    goto :goto_286

    :cond_27b
    mul-int v4, v11, v14

    int-to-float v4, v4

    int-to-float v15, v3

    const/high16 v18, 0x42c80000    # 100.0f

    mul-float v15, v15, v18

    div-float/2addr v4, v15

    move/from16 v16, v4

    .line 62
    .local v16, "gain":F
    :goto_286
    iget-object v4, v9, Le/e/a/PlayerGestures$State;->video:Landroid/view/View;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v15, "setVolume"

    move-object/from16 v20, v2

    move-object/from16 v22, v5

    const/4 v2, 0x1

    .end local v2    # "fragment":Ljava/lang/Object;
    .end local v5    # "video":Landroid/view/View;
    .local v20, "fragment":Ljava/lang/Object;
    .local v22, "video":Landroid/view/View;
    new-array v5, v2, [Ljava/lang/Class;

    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v2, v5, v19

    invoke-virtual {v4, v15, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iget-object v4, v9, Le/e/a/PlayerGestures$State;->video:Landroid/view/View;

    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    move-object/from16 v18, v5

    const/4 v15, 0x1

    new-array v5, v15, [Ljava/lang/Object;

    aput-object v18, v5, v19

    invoke-virtual {v2, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Le/e/a/PlayerGestures;->gains:Ljava/util/WeakHashMap;

    iget-object v4, v9, Le/e/a/PlayerGestures$State;->video:Landroid/view/View;

    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v4

    if-eq v3, v4, :cond_2c3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 64
    :cond_2c3
    invoke-static {v1, v9, v11}, Le/e/a/PlayerGestures;->hud(Landroid/app/Activity;Le/e/a/PlayerGestures$State;I)V

    .line 65
    .end local v0    # "audio":Landroid/media/AudioManager;
    .end local v3    # "step":I
    .end local v11    # "percent":I
    .end local v14    # "max":I
    .end local v16    # "gain":F
    goto :goto_2f6

    .line 66
    .end local v17    # "previous":Le/e/a/PlayerGestures$State;
    .end local v20    # "fragment":Ljava/lang/Object;
    .end local v22    # "video":Landroid/view/View;
    .local v2, "previous":Le/e/a/PlayerGestures$State;
    .restart local v4    # "fragment":Ljava/lang/Object;
    .restart local v5    # "video":Landroid/view/View;
    :cond_2c7
    move-object/from16 v17, v2

    move-object/from16 v20, v4

    move-object/from16 v22, v5

    .end local v2    # "previous":Le/e/a/PlayerGestures$State;
    .end local v4    # "fragment":Ljava/lang/Object;
    .end local v5    # "video":Landroid/view/View;
    .restart local v17    # "previous":Le/e/a/PlayerGestures$State;
    .restart local v20    # "fragment":Ljava/lang/Object;
    .restart local v22    # "video":Landroid/view/View;
    iget v0, v9, Le/e/a/PlayerGestures$State;->start:F

    iget v2, v9, Le/e/a/PlayerGestures$State;->height:F

    const v3, 0x3ca3d70a    # 0.02f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v0, v13, v2, v3, v4}, Le/e/a/GestureRules;->value(FFFFF)F

    move-result v0

    .local v0, "value":F
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .local v2, "lp":Landroid/view/WindowManager$LayoutParams;
    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 67
    const/high16 v18, 0x42c80000    # 100.0f

    mul-float v14, v0, v18

    invoke-static {v14}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {v1, v9, v3}, Le/e/a/PlayerGestures;->hud(Landroid/app/Activity;Le/e/a/PlayerGestures$State;I)V

    .line 69
    .end local v0    # "value":F
    .end local v2    # "lp":Landroid/view/WindowManager$LayoutParams;
    :goto_2f6
    const/16 v21, 0x1

    return v21

    .line 50
    .end local v12    # "dx":F
    .end local v13    # "dy":F
    .end local v17    # "previous":Le/e/a/PlayerGestures$State;
    .end local v20    # "fragment":Ljava/lang/Object;
    .end local v22    # "video":Landroid/view/View;
    .local v2, "previous":Le/e/a/PlayerGestures$State;
    .restart local v4    # "fragment":Ljava/lang/Object;
    .restart local v5    # "video":Landroid/view/View;
    :cond_2f9
    move-object/from16 v17, v2

    move-object/from16 v20, v4

    move-object/from16 v22, v5

    .end local v2    # "previous":Le/e/a/PlayerGestures$State;
    .end local v4    # "fragment":Ljava/lang/Object;
    .end local v5    # "video":Landroid/view/View;
    .restart local v17    # "previous":Le/e/a/PlayerGestures$State;
    .restart local v20    # "fragment":Ljava/lang/Object;
    .restart local v22    # "video":Landroid/view/View;
    :goto_2ff
    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 49
    .end local v17    # "previous":Le/e/a/PlayerGestures$State;
    .end local v20    # "fragment":Ljava/lang/Object;
    .end local v22    # "video":Landroid/view/View;
    .restart local v2    # "previous":Le/e/a/PlayerGestures$State;
    .restart local v4    # "fragment":Ljava/lang/Object;
    .restart local v5    # "video":Landroid/view/View;
    :cond_304
    move-object/from16 v17, v2

    move-object/from16 v20, v4

    move-object/from16 v22, v5

    .end local v2    # "previous":Le/e/a/PlayerGestures$State;
    .end local v4    # "fragment":Ljava/lang/Object;
    .end local v5    # "video":Landroid/view/View;
    .restart local v17    # "previous":Le/e/a/PlayerGestures$State;
    .restart local v20    # "fragment":Ljava/lang/Object;
    .restart local v22    # "video":Landroid/view/View;
    :goto_30a
    iget-boolean v0, v9, Le/e/a/PlayerGestures$State;->active:Z

    const/4 v4, 0x0

    .local v0, "consumed":Z
    iput-boolean v4, v9, Le/e/a/PlayerGestures$State;->active:Z

    iput v4, v9, Le/e/a/PlayerGestures$State;->target:I

    if-nez v0, :cond_31c

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v2

    if-eqz v2, :cond_31a

    goto :goto_31c

    :cond_31a
    const/4 v3, 0x0

    goto :goto_31d

    :cond_31c
    :goto_31c
    const/4 v3, 0x1

    :goto_31d
    return v3

    .line 48
    .end local v0    # "consumed":Z
    .end local v17    # "previous":Le/e/a/PlayerGestures$State;
    .end local v20    # "fragment":Ljava/lang/Object;
    .end local v22    # "video":Landroid/view/View;
    .restart local v2    # "previous":Le/e/a/PlayerGestures$State;
    .restart local v4    # "fragment":Ljava/lang/Object;
    .restart local v5    # "video":Landroid/view/View;
    :cond_31e
    move-object/from16 v17, v2

    move-object/from16 v20, v4

    move-object/from16 v22, v5

    .end local v2    # "previous":Le/e/a/PlayerGestures$State;
    .end local v4    # "fragment":Ljava/lang/Object;
    .end local v5    # "video":Landroid/view/View;
    .restart local v17    # "previous":Le/e/a/PlayerGestures$State;
    .restart local v20    # "fragment":Ljava/lang/Object;
    .restart local v22    # "video":Landroid/view/View;
    :goto_324
    const/4 v0, 0x1

    iput-boolean v0, v9, Le/e/a/PlayerGestures$State;->rejected:Z

    const/4 v4, 0x0

    iput v4, v9, Le/e/a/PlayerGestures$State;->target:I

    iget-boolean v0, v9, Le/e/a/PlayerGestures$State;->active:Z
    :try_end_32c
    .catch Ljava/lang/Exception; {:try_start_263 .. :try_end_32c} :catch_32d

    return v0

    .line 70
    .end local v6    # "p":Landroid/content/SharedPreferences;
    .end local v7    # "volume":Z
    .end local v8    # "brightness":Z
    .end local v9    # "s":Le/e/a/PlayerGestures$State;
    .end local v10    # "action":I
    .end local v20    # "fragment":Ljava/lang/Object;
    .end local v22    # "video":Landroid/view/View;
    :catch_32d
    move-exception v0

    goto :goto_332

    .end local v17    # "previous":Le/e/a/PlayerGestures$State;
    .restart local v2    # "previous":Le/e/a/PlayerGestures$State;
    :catch_32f
    move-exception v0

    move-object/from16 v17, v2

    .end local v2    # "previous":Le/e/a/PlayerGestures$State;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v17    # "previous":Le/e/a/PlayerGestures$State;
    :goto_332
    const-string v2, "nicoid-gesture"

    const-string v3, "Gesture failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-static/range {p0 .. p1}, Le/e/a/PlayerGestures;->shorts(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v2

    return v2
.end method
