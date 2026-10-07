.class public final Le/e/a/ThemeChoice;
.super Ljava/lang/Object;
.source "ThemeChoice.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
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
    const-string v0, "amoled"

    const-string v1, "material"

    const-string v2, "light"

    const-string v3, "dark"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/ThemeChoice;->VALUES:[Ljava/lang/String;

    .line 18
    const-string v0, "AMOLED\u30c0\u30fc\u30af\u30e2\u30fc\u30c9"

    const-string v1, "Material You"

    const-string v2, "\u30e9\u30a4\u30c8\u30e2\u30fc\u30c9"

    const-string v3, "\u30c0\u30fc\u30af\u30e2\u30fc\u30c9"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/ThemeChoice;->LABELS:[Ljava/lang/String;

    .line 19
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ThemeChoice;->APPLIED:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static accent(Landroid/content/Context;)I
    .registers 3

    .line 123
    const v0, 0x7f03005e

    const v1, -0xad335d

    invoke-static {p0, v0, v1}, Le/e/a/ThemeChoice;->color(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method static synthetic access$000()Ljava/util/WeakHashMap;
    .registers 1

    .line 15
    sget-object v0, Le/e/a/ThemeChoice;->APPLIED:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$100(Landroid/content/Context;)Ljava/lang/String;
    .registers 1

    .line 15
    invoke-static {p0}, Le/e/a/ThemeChoice;->stamp(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static amoled(Landroid/content/Context;)Z
    .registers 2

    .line 111
    const-string v0, "amoled"

    invoke-static {p0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static apply(Landroid/app/Activity;)V
    .registers 7

    .line 31
    invoke-static {p0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 32
    invoke-static {p0}, Le/e/a/ThemeChoice;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 33
    const-string v2, "material"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 34
    const-string v3, "app_theme"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    const-string v5, "material_you_mode"

    if-eqz v4, :cond_1f

    const/4 v4, 0x0

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eq v4, v2, :cond_2e

    .line 35
    :cond_1f
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v5, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 36
    :cond_2e
    invoke-static {p0}, Le/e/a/ThemeChoice;->systemNight(Landroid/content/Context;)Z

    move-result v1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v0, v1, v2}, Le/e/a/ThemeRules;->style(Ljava/lang/String;ZI)Ljava/lang/String;

    move-result-object v1

    .line 37
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "style"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 38
    if-eqz v1, :cond_4b

    invoke-virtual {p0, v1}, Landroid/app/Activity;->setTheme(I)V

    .line 39
    .line 40
    :cond_4b
    invoke-static {p0}, Le/e/a/StartupScreen;->register(Landroid/app/Activity;)V

    .line 41
    const-string v1, "amoled"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_66

    .line 42
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 43
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 45
    :cond_66
    sget-object v0, Le/e/a/ThemeChoice;->APPLIED:Ljava/util/WeakHashMap;

    invoke-static {p0}, Le/e/a/ThemeChoice;->stamp(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-boolean v0, Le/e/a/ThemeChoice;->watching:Z

    if-nez v0, :cond_82

    .line 47
    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/ThemeChoice;->watching:Z

    .line 48
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    new-instance v0, Le/e/a/ThemeChoice$1;

    invoke-direct {v0}, Le/e/a/ThemeChoice$1;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 64
    :cond_82
    return-void
.end method

.method public static background(Landroid/view/View;)V
    .registers 4

    .line 131
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->amoled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_d

    const/high16 v0, -0x1000000

    goto :goto_27

    :cond_d
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1f

    const v1, -0xe6e4e0

    goto :goto_20

    :cond_1f
    const/4 v1, -0x1

    :goto_20
    const v2, 0x1010031

    invoke-static {v0, v2, v1}, Le/e/a/ThemeChoice;->color(Landroid/content/Context;II)I

    move-result v0

    :goto_27
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method public static button(Landroid/widget/Button;)V
    .registers 9

    .line 133
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    .line 134
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "attr"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "nicoidSurface"

    invoke-virtual {v2, v5, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 135
    if-eqz v1, :cond_1e

    const v3, -0xcfcdc8

    goto :goto_21

    :cond_1e
    const v3, -0x181819

    :goto_21
    invoke-static {v0, v2, v3}, Le/e/a/ThemeChoice;->color(Landroid/content/Context;II)I

    move-result v2

    .line 136
    invoke-static {p0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v3

    .line 137
    const-string v4, "material"

    invoke-static {v0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_71

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1f

    if-lt v4, v5, :cond_71

    .line 138
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    if-eqz v1, :cond_44

    const-string v5, "system_accent1_700"

    goto :goto_46

    :cond_44
    const-string v5, "system_accent1_100"

    :goto_46
    const-string v6, "color"

    const-string v7, "android"

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 139
    if-eqz v4, :cond_58

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    .line 140
    :cond_58
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    if-eqz v1, :cond_61

    const-string v1, "system_neutral1_50"

    goto :goto_63

    :cond_61
    const-string v1, "system_neutral1_900"

    :goto_63
    invoke-virtual {v4, v1, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 141
    if-eqz v1, :cond_71

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    .line 143
    :cond_71
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 144
    invoke-static {p0}, Le/e/a/Followup3;->button(Landroid/widget/Button;)V

    return-void
.end method

.method private static color(Landroid/content/Context;II)I
    .registers 6

    .line 107
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 108
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-nez p1, :cond_11

    return p2

    .line 109
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

.method private static index(Ljava/lang/String;)I
    .registers 4

    .line 92
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    sget-object v2, Le/e/a/ThemeChoice;->VALUES:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_15

    sget-object v2, Le/e/a/ThemeChoice;->VALUES:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    return v1

    :cond_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 93
    :cond_15
    return v0
.end method

.method public static isNight(Landroid/content/Context;)Z
    .registers 2

    .line 29
    invoke-static {p0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Le/e/a/ThemeChoice;->systemNight(Landroid/content/Context;)Z

    move-result p0

    invoke-static {v0, p0}, Le/e/a/ThemeRules;->night(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$settings$0(Landroid/preference/PreferenceActivity;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 82
    sget-object v0, Le/e/a/ThemeChoice;->VALUES:[Ljava/lang/String;

    aget-object p2, v0, p2

    .line 83
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

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 84
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->recreate()V

    .line 85
    return-void
.end method

.method static synthetic lambda$settings$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 5

    .line 77
    sget-object p1, Le/e/a/ThemeChoice;->LABELS:[Ljava/lang/String;

    array-length p1, p1

    new-array v0, p1, [Ljava/lang/String;

    .line 78
    const/4 v1, 0x0

    :goto_6
    if-ge v1, p1, :cond_15

    sget-object v2, Le/e/a/ThemeChoice;->LABELS:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 79
    :cond_15
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 80
    const-string v1, "\u30c6\u30fc\u30de"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 81
    invoke-static {p0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->index(Ljava/lang/String;)I

    move-result v1

    new-instance v2, Le/e/a/ThemeChoice$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Le/e/a/ThemeChoice$$ExternalSyntheticLambda0;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {p1, v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 85
    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 86
    invoke-static {p0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    .line 87
    const/4 p0, 0x1

    return p0
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

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

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

    .line 96
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-ge v0, v1, :cond_1e

    .line 97
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    .line 98
    if-ne v1, p1, :cond_e

    return-object p0

    .line 99
    :cond_e
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_1b

    .line 100
    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1, p1}, Le/e/a/ThemeChoice;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    .line 101
    if-eqz v1, :cond_1b

    return-object v1

    .line 96
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 104
    :cond_1e
    const/4 p0, 0x0

    return-object p0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 21
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 6

    .line 67
    const-string v0, "material_you_mode"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 68
    if-nez v0, :cond_9

    return-void

    .line 69
    :cond_9
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    invoke-static {v1, v0}, Le/e/a/ThemeChoice;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    .line 70
    if-nez v1, :cond_14

    return-void

    .line 71
    :cond_14
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 72
    const-string v3, "app_theme"

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/preference/Preference;->getOrder()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setOrder(I)V

    .line 73
    const-string v3, "\u30c6\u30fc\u30de"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 74
    invoke-static {p0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le/e/a/ThemeChoice;->index(Ljava/lang/String;)I

    move-result v3

    .line 75
    sget-object v4, Le/e/a/ThemeChoice;->LABELS:[Ljava/lang/String;

    aget-object v3, v4, v3

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 76
    new-instance v3, Le/e/a/ThemeChoice$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0}, Le/e/a/ThemeChoice$$ExternalSyntheticLambda1;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 89
    invoke-virtual {v1, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 90
    return-void
.end method

.method public static spinner(Landroid/widget/Spinner;)V
    .registers 5

    .line 113
    invoke-virtual {p0}, Landroid/widget/Spinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    if-eqz v0, :cond_24

    instance-of v1, v0, Le/e/a/ThemeChoice$ThemedSpinner;

    if-eqz v1, :cond_b

    goto :goto_24

    .line 114
    :cond_b
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

    .line 115
    return-void

    .line 113
    :cond_24
    :goto_24
    return-void
.end method

.method private static stamp(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Le/e/a/ThemeChoice;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

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

    goto :goto_13

    :cond_12
    const/4 p0, 0x0

    :goto_13
    return p0
.end method

.method public static textColor(Landroid/view/View;)I
    .registers 3

    .line 130
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_12

    const p0, -0x111112

    goto :goto_15

    :cond_12
    const p0, -0xdfdedc

    :goto_15
    const v1, 0x1010036

    invoke-static {v0, v1, p0}, Le/e/a/ThemeChoice;->color(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method public static tree(Landroid/view/View;)V
    .registers 3

    .line 125
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_22

    .line 126
    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-static {p0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1c

    const v1, -0x48453d

    goto :goto_1f

    :cond_1c
    const v1, -0x99958d

    :goto_1f
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 128
    :cond_22
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_39

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_39

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->tree(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_29

    .line 129
    :cond_39
    return-void
.end method
