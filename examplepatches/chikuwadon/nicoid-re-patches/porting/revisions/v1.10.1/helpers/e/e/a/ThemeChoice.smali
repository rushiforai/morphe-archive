.class public final Le/e/a/ThemeChoice;
.super Ljava/lang/Object;
.source "ThemeChoice.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ThemeChoice$Refresh;,
        Le/e/a/ThemeChoice$ThemedSpinner;
    }
.end annotation


# static fields
.field private static final APPLIED:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final KEY:Ljava/lang/String; = "app_theme"

.field private static final LABELS:[Ljava/lang/String;

.field private static final VALUES:[Ljava/lang/String;

.field private static watching:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 17
    const-string v0, "material"

    const-string v1, "amoled"

    const-string v2, "light"

    const-string v3, "dark"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/ThemeChoice;->VALUES:[Ljava/lang/String;

    .line 18
    const-string v0, "Material You"

    const-string v1, "AMOLED\u30c0\u30fc\u30af\u30e2\u30fc\u30c9"

    const-string v2, "\u30e9\u30a4\u30c8\u30e2\u30fc\u30c9"

    const-string v3, "\u30c0\u30fc\u30af\u30e2\u30fc\u30c9"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/ThemeChoice;->LABELS:[Ljava/lang/String;

    .line 19
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ThemeChoice;->APPLIED:Ljava/util/WeakHashMap;

    .line 20
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static accent(Landroid/content/Context;)I
    .registers 4

    .line 126
    invoke-static {p0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_e

    const v1, -0xad335d

    goto :goto_11

    :cond_e
    const v1, -0xff94a5

    :goto_11
    const v2, 0x7f03005e

    invoke-static {v0, v2, v1}, Le/e/a/ThemeChoice;->color(Landroid/content/Context;II)I

    move-result v0

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    invoke-static {v0, v1}, Le/e/a/DialogColors;->accent(IZ)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0}, Le/e/a/CustomTheme119;->color(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method static synthetic access$0()Ljava/util/WeakHashMap;
    .registers 1

    .line 19
    sget-object v0, Le/e/a/ThemeChoice;->APPLIED:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$1(Landroid/content/Context;)Ljava/lang/String;
    .registers 1

    .line 79
    invoke-static {p0}, Le/e/a/ThemeChoice;->stamp(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static amoled(Landroid/content/Context;)Z
    .registers 1

    .line 128
    invoke-static {p0}, Le/e/a/ThemeChoice;->isAmoled(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public static apply(Landroid/app/Activity;)V
    .registers 7

    .line 32
    invoke-static {p0}, Le/e/a/ThemeChoice;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 33
    invoke-static {p0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 34
    invoke-static {p0}, Le/e/a/ThemeChoice;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 35
    const-string v2, "material"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 36
    const-string v3, "app_theme"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    const-string v5, "material_you_mode"

    if-eqz v4, :cond_2e

    const/4 v4, 0x0

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eq v4, v2, :cond_3d

    .line 37
    :cond_2e
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v5, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 38
    :cond_3d
    invoke-static {p0}, Le/e/a/CustomTheme119;->enabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_4e

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4c

    const-string v0, "dark"

    goto :goto_4e

    :cond_4c
    const-string v0, "light"

    :cond_4e
    :goto_4e
    invoke-static {p0}, Le/e/a/ThemeChoice;->systemNight(Landroid/content/Context;)Z

    move-result v1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v0, v1, v2}, Le/e/a/ThemeRules;->style(Ljava/lang/String;ZI)Ljava/lang/String;

    move-result-object v0

    .line 39
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "style"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 40
    if-eqz v0, :cond_6b

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTheme(I)V

    .line 41
    :cond_6b
    const-string v0, "register"

    const-class v1, Landroid/app/Activity;

    const-string v2, "e.e.a.StartupScreen"

    invoke-static {v2, v0, v1, p0}, Le/e/a/ThemeChoice;->legacy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 42
    invoke-static {p0}, Le/e/a/ThemeChoice;->isAmoled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_8a

    .line 43
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 44
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 46
    :cond_8a
    sget-object v0, Le/e/a/ThemeChoice;->APPLIED:Ljava/util/WeakHashMap;

    invoke-static {p0}, Le/e/a/ThemeChoice;->stamp(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-boolean v0, Le/e/a/ThemeChoice;->watching:Z

    if-nez v0, :cond_a6

    .line 48
    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/ThemeChoice;->watching:Z

    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    new-instance v0, Le/e/a/ThemeChoice$1;

    invoke-direct {v0}, Le/e/a/ThemeChoice$1;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 67
    :cond_a6
    return-void
.end method

.method public static background(Landroid/view/View;)V
    .registers 4

    .line 150
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CustomTheme119;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CustomTheme119;->background(Landroid/content/Context;)I

    move-result v0

    :goto_12
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void

    :cond_16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v0

    goto :goto_12

    :cond_29
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x1010031

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Le/e/a/ThemeChoice;->color(Landroid/content/Context;II)I

    move-result v0

    goto :goto_12
.end method

.method public static button(Landroid/widget/Button;)V
    .registers 9

    .line 152
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    .line 153
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "attr"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "nicoidSurface"

    invoke-virtual {v2, v5, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 154
    if-eqz v1, :cond_24

    invoke-static {v0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v2

    const/4 v3, 0x1

    invoke-static {v2, v3}, Le/e/a/DialogColors;->secondary(IZ)I

    move-result v2

    goto :goto_2b

    :cond_24
    const v3, -0x181819

    invoke-static {v0, v2, v3}, Le/e/a/ThemeChoice;->color(Landroid/content/Context;II)I

    move-result v2

    .line 155
    :goto_2b
    invoke-static {p0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v3

    .line 156
    if-nez v1, :cond_79

    const-string v4, "material"

    invoke-static {v0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_79

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1f

    if-lt v4, v5, :cond_79

    .line 157
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    if-eqz v1, :cond_4c

    const-string v5, "system_accent1_700"

    goto :goto_4e

    :cond_4c
    const-string v5, "system_accent1_100"

    :goto_4e
    const-string v6, "color"

    const-string v7, "android"

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 158
    if-eqz v4, :cond_60

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    .line 159
    :cond_60
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    if-eqz v1, :cond_69

    const-string v1, "system_neutral1_50"

    goto :goto_6b

    :cond_69
    const-string v1, "system_neutral1_900"

    :goto_6b
    invoke-virtual {v4, v1, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 160
    if-eqz v1, :cond_79

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    .line 162
    :cond_79
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 163
    const-string v0, "button"

    const-class v1, Landroid/widget/Button;

    const-string v2, "e.e.a.Followup3"

    invoke-static {v2, v0, v1, p0}, Le/e/a/ThemeChoice;->legacy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/FlatUi191;->one(Landroid/view/View;)V

    .line 164
    return-void
.end method

.method private static color(Landroid/content/Context;II)I
    .registers 6

    .line 122
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 123
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-nez p1, :cond_11

    return p2

    .line 124
    :cond_11
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    if-nez p1, :cond_18

    iget p0, v0, Landroid/util/TypedValue;->data:I

    goto :goto_22

    :cond_18
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    :goto_22
    return p0
.end method

.method public static controls(Landroid/view/View;)V
    .registers 3

    .line 134
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-static {p0}, Le/e/a/ThemeChoice;->controlsOne(Landroid/view/View;)V

    instance-of v0, p0, Landroid/widget/Spinner;

    if-eqz v0, :cond_10

    move-object v0, p0

    check-cast v0, Landroid/widget/Spinner;

    invoke-static {v0}, Le/e/a/ThemeChoice;->spinner(Landroid/widget/Spinner;)V

    :cond_10
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_28

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_1e

    goto :goto_28

    :cond_1e
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->controls(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    :cond_28
    :goto_28
    return-void
.end method

.method static controlsOne(Landroid/view/View;)V
    .registers 1

    .line 136
    invoke-static {p0}, Le/e/a/UiControls194;->apply(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/CustomControls119;->apply(Landroid/view/View;)V

    return-void
.end method

.method private static index(Ljava/lang/String;)I
    .registers 4

    .line 107
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    sget-object v2, Le/e/a/ThemeChoice;->VALUES:[Ljava/lang/String;

    array-length v2, v2

    if-lt v1, v2, :cond_8

    .line 108
    return v0

    .line 107
    :cond_8
    sget-object v2, Le/e/a/ThemeChoice;->VALUES:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    return v1

    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method public static isAmoled(Landroid/content/Context;)Z
    .registers 3

    .line 30
    invoke-static {p0}, Le/e/a/CustomTheme119;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-static {p0}, Le/e/a/ThemeChoice;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "app_theme"

    const-string v1, ""

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "amoled"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1c

    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public static isNight(Landroid/content/Context;)Z
    .registers 3

    .line 29
    invoke-static {p0}, Le/e/a/CustomTheme119;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static {p0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Le/e/a/ThemeChoice;->systemNight(Landroid/content/Context;)Z

    move-result p0

    invoke-static {v1, p0}, Le/e/a/ThemeRules;->night(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_1c

    const p0, -0xe6e4e0

    goto :goto_1f

    :cond_1c
    const p0, -0x50506

    :goto_1f
    const-string v1, "custom_background"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {p0}, Le/e/a/CustomTheme119;->dark(I)Z

    move-result p0

    goto :goto_36

    :cond_2a
    invoke-static {p0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Le/e/a/ThemeChoice;->systemNight(Landroid/content/Context;)Z

    move-result p0

    invoke-static {v0, p0}, Le/e/a/ThemeRules;->night(Ljava/lang/String;Z)Z

    move-result p0

    :goto_36
    return p0
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 5

    .line 92
    sget-object p1, Le/e/a/ThemeChoice;->LABELS:[Ljava/lang/String;

    array-length p1, p1

    new-array v0, p1, [Ljava/lang/String;

    .line 93
    const/4 v1, 0x0

    :goto_6
    if-lt v1, p1, :cond_40

    .line 94
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 95
    const-string v1, "\u30c6\u30fc\u30de"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 96
    invoke-static {p0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->index(Ljava/lang/String;)I

    move-result v1

    new-instance v2, Le/e/a/ThemeChoice$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0}, Le/e/a/ThemeChoice$$ExternalSyntheticLambda4;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {p1, v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 100
    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 94
    nop

    .line 101
    invoke-static {p0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    .line 102
    const/4 p0, 0x1

    return p0

    .line 93
    :cond_40
    sget-object v2, Le/e/a/ThemeChoice;->LABELS:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_6
.end method

.method static synthetic lambda$1(Landroid/preference/PreferenceActivity;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 97
    sget-object v0, Le/e/a/ThemeChoice;->VALUES:[Ljava/lang/String;

    aget-object p2, v0, p2

    .line 98
    invoke-static {p0}, Le/e/a/ThemeChoice;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "app_theme"

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "material"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const-string v1, "material_you_mode"

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 99
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->recreate()V

    .line 100
    return-void
.end method

.method private static legacy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 78
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {p0, p1, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array p1, v0, [Ljava/lang/Object;

    aput-object p3, p1, v2

    const/4 p2, 0x0

    invoke-virtual {p0, p2, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_17

    goto :goto_1f

    :catch_17
    move-exception p0

    const-string p1, "nicoid-theme"

    const-string p2, "Theme compatibility hook failed"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1f
    return-void
.end method

.method private static mode(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 23
    invoke-static {p0}, Le/e/a/ThemeChoice;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 24
    const-string v0, "app_theme"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "material_you_mode"

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    invoke-static {v0, p0}, Le/e/a/ThemeRules;->mode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 5

    .line 111
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_9

    .line 119
    const/4 p0, 0x0

    return-object p0

    .line 112
    :cond_9
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    .line 113
    if-ne v1, p1, :cond_10

    return-object p0

    .line 114
    :cond_10
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_1d

    .line 115
    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1, p1}, Le/e/a/ThemeChoice;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    .line 116
    if-eqz v1, :cond_1d

    return-object v1

    .line 111
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 21
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static purpleStates(Landroid/content/res/ColorStateList;)Z
    .registers 7

    .line 135
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    :cond_4
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    invoke-static {v1}, Le/e/a/DialogColors;->purple(I)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_10

    return v2

    :cond_10
    const v1, 0x10100a1

    const v3, 0x101009c

    const v4, 0x10100a7

    const v5, 0x10100a0

    filled-new-array {v4, v5, v1, v3}, [I

    move-result-object v1

    const/4 v3, 0x0

    :goto_21
    const/4 v4, 0x4

    if-lt v3, v4, :cond_25

    return v0

    :cond_25
    aget v4, v1, v3

    const v5, 0x101009e

    filled-new-array {v5, v4}, [I

    move-result-object v4

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v5

    invoke-virtual {p0, v4, v5}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v4

    invoke-static {v4}, Le/e/a/DialogColors;->purple(I)Z

    move-result v4

    if-eqz v4, :cond_3d

    return v2

    :cond_3d
    add-int/lit8 v3, v3, 0x1

    goto :goto_21
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 6

    .line 81
    const-string v0, "material_you_mode"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 82
    const-string v1, "app_theme"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 83
    if-nez v0, :cond_10

    const/4 v3, 0x0

    goto :goto_18

    :cond_10
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    invoke-static {v3, v0}, Le/e/a/ThemeChoice;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v3

    .line 84
    :goto_18
    if-nez v3, :cond_2b

    const-string v3, "setting_whole"

    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    instance-of v4, v3, Landroid/preference/PreferenceGroup;

    if-eqz v4, :cond_27

    check-cast v3, Landroid/preference/PreferenceGroup;

    goto :goto_2b

    :cond_27
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    .line 85
    :cond_2b
    :goto_2b
    if-nez v2, :cond_43

    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    if-nez v0, :cond_39

    const/4 v1, 0x0

    goto :goto_3d

    :cond_39
    invoke-virtual {v0}, Landroid/preference/Preference;->getOrder()I

    move-result v1

    :goto_3d
    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setOrder(I)V

    invoke-virtual {v3, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 86
    :cond_43
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    invoke-static {v1, v2}, Le/e/a/ThemeChoice;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-eq v1, v3, :cond_55

    if-eqz v1, :cond_52

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_52
    invoke-virtual {v3, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 87
    :cond_55
    const/16 v1, -0x3e8

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setOrder(I)V

    .line 88
    const-string v1, "\u30c6\u30fc\u30de"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 89
    invoke-static {p0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->index(Ljava/lang/String;)I

    move-result v1

    .line 90
    sget-object v3, Le/e/a/ThemeChoice;->LABELS:[Ljava/lang/String;

    aget-object v1, v3, v1

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 91
    new-instance v1, Le/e/a/ThemeChoice$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Le/e/a/ThemeChoice$$ExternalSyntheticLambda5;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 104
    if-eqz v0, :cond_8d

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object p0

    invoke-static {p0, v0}, Le/e/a/ThemeChoice;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object p0

    if-eqz p0, :cond_8d

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 105
    :cond_8d
    return-void
.end method

.method public static spinner(Landroid/widget/Spinner;)V
    .registers 5

    .line 138
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Landroid/widget/Spinner;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Landroid/widget/Spinner;->setPopupBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 139
    invoke-virtual {p0}, Landroid/widget/Spinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    .line 140
    if-eqz v0, :cond_34

    instance-of v1, v0, Le/e/a/ThemeChoice$ThemedSpinner;

    if-eqz v1, :cond_1b

    goto :goto_34

    .line 141
    :cond_1b
    invoke-virtual {p0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    new-instance v2, Le/e/a/ThemeChoice$ThemedSpinner;

    invoke-virtual {p0}, Landroid/widget/Spinner;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Le/e/a/ThemeChoice$ThemedSpinner;-><init>(Landroid/widget/SpinnerAdapter;Landroid/content/Context;)V

    invoke-virtual {p0, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    const/4 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/Spinner;->setSelection(I)V

    .line 142
    return-void

    .line 140
    :cond_34
    :goto_34
    return-void
.end method

.method private static stamp(Landroid/content/Context;)Ljava/lang/String;
    .registers 5

    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Le/e/a/ThemeChoice;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "app_lang"

    const-string v3, "0"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Le/e/a/CustomTheme119;->stamp(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static systemNight(Landroid/content/Context;)Z
    .registers 2

    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p0, p0, 0x30

    const/16 v0, 0x20

    if-ne p0, v0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public static textColor(Landroid/view/View;)I
    .registers 3

    .line 127
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CustomTheme119;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CustomTheme119;->ink(Landroid/content/Context;)I

    move-result p0

    return p0

    :cond_13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_21

    const p0, -0x111112

    goto :goto_2f

    :cond_21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x1010036

    const v1, -0xdfdedc

    invoke-static {p0, v0, v1}, Le/e/a/ThemeChoice;->color(Landroid/content/Context;II)I

    move-result p0

    :goto_2f
    return p0
.end method

.method public static tree(Landroid/view/View;)V
    .registers 4

    .line 130
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_2e

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    const-string v1, "nicoid_duration"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    invoke-static {p0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_1a
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_28

    const v1, -0x48453d

    goto :goto_2b

    :cond_28
    const v1, -0x99958d

    :goto_2b
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 131
    :cond_2e
    invoke-static {p0}, Le/e/a/ThemeChoice;->controlsOne(Landroid/view/View;)V

    .line 132
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_49

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_38
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_3f

    goto :goto_49

    :cond_3f
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->tree(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_38

    .line 133
    :cond_49
    :goto_49
    return-void
.end method
