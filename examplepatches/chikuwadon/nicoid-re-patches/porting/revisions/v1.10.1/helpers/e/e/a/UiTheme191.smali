.class public final Le/e/a/UiTheme191;
.super Ljava/lang/Object;
.source "UiTheme191.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static activity(Landroid/app/Activity;)V
    .registers 7

    .line 11
    const-string v0, "videomenulist"

    const-string v1, "infoscroll"

    const-string v2, "left_drawer"

    const-string v3, "menu_listview"

    const-string v4, "videoinfotitlelay"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_f
    const/4 v2, 0x5

    if-lt v1, v2, :cond_13

    return-void

    :cond_13
    aget-object v2, v0, v1

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "id"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v2, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_27

    const/4 v2, 0x0

    goto :goto_2b

    :cond_27
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    :goto_2b
    if-eqz v2, :cond_33

    invoke-static {v2}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    invoke-static {v2}, Le/e/a/UiTheme191;->surface(Landroid/view/View;)V

    :cond_33
    add-int/lit8 v1, v1, 0x1

    goto :goto_f
.end method

.method public static context(Landroid/content/Context;)Landroid/content/Context;
    .registers 5

    .line 6
    invoke-static {p0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ThemeChoice;->isAmoled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "NicoidDialogAMOLED"

    goto :goto_18

    :cond_d
    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_16

    const-string v0, "NicoidDialogDark"

    goto :goto_18

    :cond_16
    const-string v0, "NicoidDialogLight"

    :goto_18
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "style"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    new-instance v1, Landroid/view/ContextThemeWrapper;

    if-eqz v0, :cond_2b

    goto :goto_38

    :cond_2b
    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_35

    const v0, 0x1030226

    goto :goto_38

    :cond_35
    const v0, 0x103023a

    :goto_38
    invoke-direct {v1, p0, v0}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    return-object v1
.end method

.method static light(I)Z
    .registers 3

    .line 9
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    const/16 v1, 0xf5

    if-le v0, v1, :cond_22

    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/16 v0, 0xcd

    if-le p0, v0, :cond_22

    const/4 p0, 0x1

    return p0

    :cond_22
    const/4 p0, 0x0

    return p0
.end method

.method static media(Landroid/view/View;)Z
    .registers 3

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    instance-of v1, p0, Landroid/widget/ImageView;

    if-nez v1, :cond_2a

    instance-of v1, p0, Landroid/view/SurfaceView;

    if-nez v1, :cond_2a

    instance-of v1, p0, Landroid/view/TextureView;

    if-nez v1, :cond_2a

    instance-of p0, p0, Landroid/webkit/WebView;

    if-nez p0, :cond_2a

    const-string p0, "com.devbrackets."

    invoke-virtual {v0, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_2a

    const-string p0, "PlayerView"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2a

    const/4 p0, 0x0

    return p0

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method

.method public static surface(Landroid/view/View;)V
    .registers 5

    .line 10
    if-eqz p0, :cond_af

    invoke-static {p0}, Le/e/a/UiTheme191;->media(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto/16 :goto_af

    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_94

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v1, v0, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v1, :cond_35

    move-object v1, v0

    check-cast v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v1

    invoke-static {v1}, Le/e/a/UiTheme191;->light(I)Z

    move-result v1

    if-eqz v1, :cond_35

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_63

    :cond_35
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v1, v2, :cond_63

    instance-of v1, v0, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v1, :cond_63

    move-object v1, v0

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/GradientDrawable;->getColor()Landroid/content/res/ColorStateList;

    move-result-object v1

    if-eqz v1, :cond_63

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    invoke-static {v1}, Le/e/a/UiTheme191;->light(I)Z

    move-result v1

    if-eqz v1, :cond_63

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    :cond_63
    :goto_63
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_94

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v1

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    const/16 v3, 0xf0

    if-le v2, v3, :cond_94

    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/16 v2, 0x82

    if-ge v1, v2, :cond_94

    const v1, -0x111112

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_94
    invoke-static {p0}, Le/e/a/ThemeChoice;->controlsOne(Landroid/view/View;)V

    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_af

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_9e
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_a5

    goto :goto_af

    :cond_a5
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiTheme191;->surface(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_9e

    :cond_af
    :goto_af
    return-void
.end method

.method public static window(Landroid/app/Dialog;)V
    .registers 4

    .line 7
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    const/16 v2, 0x18

    invoke-static {v0, v1, v2}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiTheme191;->surface(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->controls(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/FlatUi191;->window(Landroid/app/Dialog;)V

    return-void
.end method
