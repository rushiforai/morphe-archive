.class public final Le/e/a/AmbientSettings;
.super Ljava/lang/Object;
.source "AmbientSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/AmbientSettings$Editor;,
        Le/e/a/AmbientSettings$Entry;
    }
.end annotation


# static fields
.field private static final EN:[Ljava/lang/String;

.field private static final KEY:Ljava/lang/String; = "nicoid_ambient_settings"

.field private static final LABELS:[Ljava/lang/String;

.field private static final ZH:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    .line 28
    const-string/jumbo v8, "\u66f4\u65b0\u983b\u5ea6"

    const-string v9, "\u30b5\u30f3\u30d7\u30eb\u89e3\u50cf\u5ea6"

    const-string v0, "\u5f37\u3055"

    const-string v1, "\u5e83\u304c\u308a"

    const-string v2, "\u307c\u304b\u3057"

    const-string/jumbo v3, "\u660e\u308b\u3055"

    const-string v4, "\u30b3\u30f3\u30c8\u30e9\u30b9\u30c8"

    const-string v5, "\u5f69\u5ea6"

    const-string/jumbo v6, "\u9bae\u3084\u304b\u3055"

    const-string/jumbo v7, "\u8ffd\u5f93\u901f\u5ea6"

    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    move-result-object v0

    .line 27
    sput-object v0, Le/e/a/AmbientSettings;->LABELS:[Ljava/lang/String;

    .line 30
    const-string v9, "Update rate"

    const-string v10, "Sampling resolution"

    const-string v1, "Intensity"

    const-string v2, "Spread"

    const-string v3, "Softness"

    const-string v4, "Brightness"

    const-string v5, "Contrast"

    const-string v6, "Saturation"

    const-string v7, "Vibrance"

    const-string v8, "Response speed"

    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    move-result-object v0

    .line 29
    sput-object v0, Le/e/a/AmbientSettings;->EN:[Ljava/lang/String;

    .line 31
    const-string/jumbo v9, "\u66f4\u65b0\u983b\u7387"

    const-string v10, "\u53d6\u6a23\u89e3\u6790\u5ea6"

    const-string v1, "\u5f37\u5ea6"

    const-string/jumbo v2, "\u64f4\u6563"

    const-string/jumbo v3, "\u67d4\u5316"

    const-string v4, "\u4eae\u5ea6"

    const-string v5, "\u5c0d\u6bd4"

    const-string/jumbo v6, "\u98fd\u548c\u5ea6"

    const-string/jumbo v7, "\u9bae\u8c54\u5ea6"

    const-string v8, "\u53cd\u61c9\u901f\u5ea6"

    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/AmbientSettings;->ZH:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()[Ljava/lang/String;
    .registers 1

    .line 27
    sget-object v0, Le/e/a/AmbientSettings;->LABELS:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1()[Ljava/lang/String;
    .registers 1

    .line 29
    sget-object v0, Le/e/a/AmbientSettings;->EN:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2()[Ljava/lang/String;
    .registers 1

    .line 31
    sget-object v0, Le/e/a/AmbientSettings;->ZH:[Ljava/lang/String;

    return-object v0
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 9

    .line 36
    const-string v0, "mobile_quality_mode"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 37
    const-string v1, "nicoid_ambient_settings"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-nez v2, :cond_2

    .line 38
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    invoke-static {v2, v0}, Le/e/a/AmbientSettings;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 40
    invoke-virtual {v2}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v3

    new-array v4, v3, [Landroid/preference/Preference;

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    if-lt v6, v3, :cond_1

    :goto_1
    if-lt v5, v3, :cond_0

    .line 43
    invoke-static {p0}, Le/e/a/AmbientLight;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 44
    new-instance v4, Le/e/a/AmbientSettings$Entry;

    invoke-direct {v4, p0, v3}, Le/e/a/AmbientSettings$Entry;-><init>(Landroid/content/Context;Landroid/content/SharedPreferences;)V

    .line 45
    invoke-virtual {v4, v1}, Le/e/a/AmbientSettings$Entry;->setKey(Ljava/lang/String;)V

    .line 46
    invoke-virtual {v0}, Landroid/preference/Preference;->getOrder()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v4, v0}, Le/e/a/AmbientSettings$Entry;->setOrder(I)V

    .line 47
    invoke-static {p0}, Le/e/a/AmbientLight;->title(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Le/e/a/AmbientSettings$Entry;->setTitle(Ljava/lang/CharSequence;)V

    .line 48
    new-instance v0, Le/e/a/AmbientSettings$4;

    invoke-direct {v0, p0, v3, v4}, Le/e/a/AmbientSettings$4;-><init>(Landroid/preference/PreferenceActivity;Landroid/content/SharedPreferences;Le/e/a/AmbientSettings$Entry;)V

    invoke-virtual {v4, v0}, Le/e/a/AmbientSettings$Entry;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 52
    invoke-virtual {v2, v4}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void

    .line 42
    :cond_0
    aget-object v6, v4, v5

    mul-int/lit8 v7, v5, 0xa

    invoke-virtual {v6, v7}, Landroid/preference/Preference;->setOrder(I)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 41
    :cond_1
    invoke-virtual {v2, v6}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v7

    aput-object v7, v4, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/content/SharedPreferences;Le/e/a/AmbientSettings$Entry;Landroid/preference/Preference;)Z
    .registers 4

    .line 49
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p3, Le/e/a/AmbientSettings$5;

    invoke-direct {p3, p2}, Le/e/a/AmbientSettings$5;-><init>(Le/e/a/AmbientSettings$Entry;)V

    invoke-static {p0, p1, p3}, Le/e/a/AmbientSettings;->open(Landroid/preference/PreferenceActivity;Landroid/content/SharedPreferences;Ljava/lang/Runnable;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$2(Le/e/a/AmbientSettings$Editor;Landroid/content/SharedPreferences;Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 93
    invoke-virtual {p0, p1}, Le/e/a/AmbientSettings$Editor;->save(Landroid/content/SharedPreferences;)V

    .line 94
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method private static open(Landroid/preference/PreferenceActivity;Landroid/content/SharedPreferences;Ljava/lang/Runnable;)V
    .registers 6

    .line 88
    invoke-static {p0}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 89
    new-instance v1, Le/e/a/AmbientSettings$Editor;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1}, Le/e/a/AmbientSettings$Editor;-><init>(Landroid/preference/PreferenceActivity;Landroid/content/Context;Landroid/content/SharedPreferences;)V

    .line 90
    invoke-static {p0}, Le/e/a/AmbientLight;->title(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    iget-object v0, v1, Le/e/a/AmbientSettings$Editor;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 v0, 0x1040000

    const/4 v2, 0x0

    .line 91
    invoke-virtual {p0, v0, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 92
    new-instance v0, Le/e/a/AmbientSettings$3;

    invoke-direct {v0, v1, p1, p2}, Le/e/a/AmbientSettings$3;-><init>(Le/e/a/AmbientSettings$Editor;Landroid/content/SharedPreferences;Ljava/lang/Runnable;)V

    const p1, 0x104000a

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 95
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 90
    invoke-static {p0}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method private static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 6

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    const/4 v1, 0x0

    .line 76
    :goto_0
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-lt v1, v2, :cond_1

    return-object v0

    .line 77
    :cond_1
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    if-ne v2, p1, :cond_2

    return-object p0

    .line 79
    :cond_2
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_3

    .line 80
    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/AmbientSettings;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    if-eqz v2, :cond_3

    return-object v2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
