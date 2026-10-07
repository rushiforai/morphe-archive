.class public final Le/e/a/FeedbackFixes;
.super Ljava/lang/Object;
.source "FeedbackFixes.java"


# static fields
.field static final refreshers:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 66
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/FeedbackFixes;->refreshers:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static amoled(Landroid/content/Context;)Z
    .registers 3

    .line 22
    invoke-static {p0}, Le/e/a/FeedbackFixes;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "app_theme"

    const-string v1, ""

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "amoled"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static bundleTitle(Landroid/os/Bundle;)Ljava/lang/String;
    .registers 3

    .line 69
    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    const-string v0, "videoTitle"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_18

    :cond_12
    const-string v0, "title"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_18
    return-object v0
.end method

.method static clearEdit(Landroid/view/View;)V
    .registers 7

    .line 55
    instance-of v0, p0, Landroid/widget/EditText;

    const/4 v1, 0x0

    if-eqz v0, :cond_41

    const v0, -0x666667

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 57
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    const v4, 0x1010352

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v2, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v3

    if-eqz v3, :cond_3a

    iget v3, v2, Landroid/util/TypedValue;->resourceId:I

    if-eqz v3, :cond_3a

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v2, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v3, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 58
    :cond_3a
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 59
    :cond_41
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_57

    check-cast p0, Landroid/view/ViewGroup;

    :goto_47
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_57

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/FeedbackFixes;->clearEdit(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_47

    :cond_57
    return-void
.end method

.method public static dialogContext(Landroid/content/Context;)Landroid/content/Context;
    .registers 8

    .line 47
    invoke-static {p0}, Le/e/a/FeedbackFixes;->amoled(Landroid/content/Context;)Z

    move-result v0

    :try_start_4
    const-string v1, "ThemeChoice"

    const-string v2, "isNight"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v6

    invoke-static {v1, v2, v4, v3}, Le/e/a/FeedbackFixes;->helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_1e} :catch_20

    or-int/2addr v0, v1

    goto :goto_21

    :catch_20
    move-exception v1

    :goto_21
    new-instance v1, Landroid/view/ContextThemeWrapper;

    if-eqz v0, :cond_29

    const v0, 0x1030226

    goto :goto_2c

    :cond_29
    const v0, 0x103023a

    :goto_2c
    invoke-direct {v1, p0, v0}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    return-object v1
.end method

.method static dp(Landroid/content/Context;I)I
    .registers 2

    .line 23
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    int-to-float p1, p1

    mul-float/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method public static form(Landroid/app/AlertDialog;)V
    .registers 6

    .line 49
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    .line 51
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mainlay"

    invoke-virtual {v1, v4, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 52
    if-eqz v1, :cond_3c

    const/16 v2, 0x14

    invoke-static {v0, v2}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v2

    const/16 v3, 0x8

    invoke-static {v0, v3}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v0, v3}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v1, v2, v4, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 53
    :cond_3c
    invoke-static {v0}, Le/e/a/FeedbackFixes;->amoled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_45

    invoke-static {p0}, Le/e/a/FeedbackFixes;->clearEdit(Landroid/view/View;)V

    .line 54
    :cond_45
    invoke-static {p0}, Le/e/a/DialogInputs;->pad(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/SearchSuggestions;->attach(Landroid/view/View;)V

    return-void
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :goto_4
    if-eqz v0, :cond_19

    :try_start_6
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_12
    .catch Ljava/lang/NoSuchFieldException; {:try_start_6 .. :try_end_12} :catch_13

    return-object p0

    :catch_13
    move-exception v1

    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_4

    :cond_19
    new-instance p0, Ljava/lang/NoSuchFieldException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static varargs helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "e.e.a."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static varargs invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    invoke-virtual {p1, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$refresh$0(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 63
    sget-object v0, Le/e/a/FeedbackFixes;->refreshers:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_10

    sget-object v0, Le/e/a/FeedbackFixes;->refreshers:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Le/e/a/FeedbackFixes;->stop(Ljava/lang/Object;)V

    :cond_10
    return-void
.end method

.method static log(Ljava/lang/Exception;)V
    .registers 3

    .line 25
    const-string v0, "nicoid-followup"

    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static mobileQuality(Landroid/content/Context;I)I
    .registers 6

    .line 45
    :try_start_0
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_3f

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    if-eqz v0, :cond_15

    goto :goto_3f

    :cond_15
    invoke-static {p0}, Le/e/a/FeedbackFixes;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "mobile_quality_mode"

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v2, "mobile_low_quality"

    const/4 v3, 0x0

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_2b

    const-string p0, "3"

    goto :goto_2d

    :cond_2b
    const-string p0, "-1"

    :goto_2d
    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_39} :catch_40

    if-ltz p0, :cond_3f

    const/4 v0, 0x3

    if-gt p0, v0, :cond_3f

    move p1, p0

    :cond_3f
    :goto_3f
    return p1

    :catch_40
    move-exception p0

    return p1
.end method

.method static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 6

    .line 43
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    :cond_4
    const/4 v1, 0x0

    :goto_5
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-ge v1, v2, :cond_22

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    if-ne v2, p1, :cond_12

    return-object p0

    :cond_12
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_1f

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/FeedbackFixes;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    if-eqz v2, :cond_1f

    return-object v2

    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_22
    return-object v0
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 21
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static prepareTheme(Landroid/app/Activity;)V
    .registers 12

    .line 27
    const-string v0, "style"

    const-string v1, "ThemeRules"

    :try_start_4
    invoke-static {p0}, Le/e/a/FeedbackFixes;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "mode"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x1

    aput-object v6, v5, v8

    new-array v6, v4, [Ljava/lang/Object;

    const-string v9, "app_theme"

    const/4 v10, 0x0

    invoke-interface {v2, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static/range {v9 .. v9}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v6, v7

    const-string v9, "material_you_mode"

    invoke-interface {v2, v9, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v6, v8

    invoke-static {v1, v3, v5, v6}, Le/e/a/FeedbackFixes;->helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v3, v3, 0x30

    const/16 v5, 0x20

    if-ne v3, v5, :cond_4a

    move v3, v8

    goto :goto_4b

    :cond_4a
    move v3, v7

    :goto_4b
    const/4 v5, 0x3

    new-array v6, v5, [Ljava/lang/Class;

    const-class v9, Ljava/lang/String;

    aput-object v9, v6, v7

    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v9, v6, v8

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v9, v6, v4

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v2, v5, v7

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v5, v8

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v4

    invoke-static {v1, v0, v6, v5}, Le/e/a/FeedbackFixes;->helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v0, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_88

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTheme(I)V
    :try_end_83
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_83} :catch_84

    goto :goto_88

    :catch_84
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    .line 28
    :cond_88
    :goto_88
    return-void
.end method

.method public static refresh(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 2

    invoke-static {p0, p1}, Le/e/a/Followup3;->refresh(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public static refreshed(Ljava/lang/Object;)V
    .registers 2

    .line 68
    sget-object v0, Le/e/a/FeedbackFixes;->refreshers:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_b

    invoke-static {p0}, Le/e/a/FeedbackFixes;->stop(Ljava/lang/Object;)V

    :cond_b
    return-void
.end method

.method static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 13

    move-object v11, p0

    .line 30
    const-string v0, "settings"

    const/4 v1, 0x0

    :try_start_4
    const-string v2, "CommentOptions"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/preference/PreferenceActivity;

    aput-object v5, v4, v1

    new-array v5, v3, [Ljava/lang/Object;

    aput-object p0, v5, v1

    invoke-static {v2, v0, v4, v5}, Le/e/a/FeedbackFixes;->helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "StartupScreen"

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/preference/PreferenceActivity;

    aput-object v5, v4, v1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v1

    invoke-static {v2, v0, v4, v3}, Le/e/a/FeedbackFixes;->helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_23} :catch_24

    goto :goto_28

    :catch_24
    move-exception v0

    invoke-static {v0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    .line 31
    :goto_28
    const-string v7, "comment_rows"

    const-string v8, "comment_hide"

    const-string v2, "comment_size_percent"

    const-string v3, "comment_fps"

    const-string v4, "comment_opacity_percent"

    const-string v5, "comment_shadow"

    const-string v6, "comment_shadow_tenths"

    filled-new-array/range {v2 .. v8}, [Ljava/lang/String;

    move-result-object v0

    .line 32
    move v2, v1

    :goto_3b
    const/4 v3, 0x7

    if-ge v2, v3, :cond_4c

    aget-object v3, v0, v2

    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    if-eqz v3, :cond_49

    invoke-virtual {v3, v2}, Landroid/preference/Preference;->setOrder(I)V

    :cond_49
    add-int/lit8 v2, v2, 0x1

    goto :goto_3b

    .line 33
    :cond_4c
    const-string v0, "comment_shadow_tenths"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_5d

    const-string v2, "\u30b3\u30e1\u30f3\u30c8\u306e\u5f71\u306e\u5927\u304d\u3055"

    invoke-static {v2}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 34
    :cond_5d
    const-string v0, "comment_shadow"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_6e

    const-string v2, "\u30b3\u30e1\u30f3\u30c8\u306e\u5f71\u306e\u7a2e\u985e"

    invoke-static {v2}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 35
    :cond_6e
    const-string v0, "back_playback"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/ListPreference;

    .line 36
    if-eqz v0, :cond_b2

    const-string v2, "\u4f55\u3082\u3057\u306a\u3044\uff08\u5f93\u6765\u306e\u52d5\u4f5c\uff09"

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30df\u30cb\u30d7\u30ec\u30a4\u30e4\u30fc"

    invoke-static {v5}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v2, v3, v4, v5}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    const-string v2, "popup"

    const-string v3, "mini"

    const-string v4, "none"

    const-string v5, "background"

    filled-new-array {v4, v5, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 37
    :cond_b2
    const-string v0, "mobile_low_quality"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    invoke-static {v3, v2}, Le/e/a/FeedbackFixes;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v3

    .line 38
    if-eqz v3, :cond_14d

    const-string v4, "mobile_quality_mode"

    invoke-virtual {p0, v4}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    if-nez v5, :cond_14d

    .line 39
    new-instance v5, Landroid/preference/ListPreference;

    invoke-direct {v5, p0}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v4}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    const-string v6, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u6642\u306e\u753b\u8cea"

    invoke-static {v6}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/preference/ListPreference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v6, "\u901a\u5e38\u306e\u753b\u8cea\u8a2d\u5b9a\u306b\u5f93\u3046"

    invoke-static {v6}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "\u6700\u5927\u753b\u8cea"

    invoke-static/range {v7 .. v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "\u9ad8\u753b\u8cea"

    invoke-static/range {v8 .. v8}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "\u6a19\u6e96\u753b\u8cea"

    invoke-static/range {v9 .. v9}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "\u4f4e\u753b\u8cea"

    invoke-static/range {v10 .. v10}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    filled-new-array {v6, v7, v8, v9, v10}, [Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    const-string v6, "1"

    const-string v7, "2"

    const-string v8, "-1"

    const-string v9, "0"

    const-string v10, "3"

    filled-new-array {v8, v9, v6, v7, v10}, [Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    invoke-virtual {v2}, Landroid/preference/Preference;->getOrder()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/preference/ListPreference;->setOrder(I)V

    .line 40
    invoke-static {p0}, Le/e/a/FeedbackFixes;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_137

    move-object v8, v10

    :cond_137
    invoke-interface {v6, v4, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    const-string p0, "%s"

    invoke-virtual {v5, p0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v2}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    invoke-virtual {v3, v5}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 42
    :cond_14d
    invoke-static {v11}, Le/e/a/NoMini;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {v11}, Le/e/a/Followup173;->settings(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method static stop(Ljava/lang/Object;)V
    .registers 6

    .line 67
    :try_start_0
    const-string v0, "setRefreshing"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v4

    invoke-static {p0, v0, v2, v1}, Le/e/a/FeedbackFixes;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_15} :catch_16

    goto :goto_17

    :catch_16
    move-exception p0

    :goto_17
    return-void
.end method

.method static tr(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 24
    :try_start_0
    const-string v0, "UiStrings"

    const-string v1, "translate"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    invoke-static {v0, v1, v3, v2}, Le/e/a/FeedbackFixes;->helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_17

    return-object v0

    :catch_17
    move-exception v0

    return-object p0
.end method
