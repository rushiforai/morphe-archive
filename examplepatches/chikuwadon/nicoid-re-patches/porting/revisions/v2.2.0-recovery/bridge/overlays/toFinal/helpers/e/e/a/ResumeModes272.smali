.class public final Le/e/a/ResumeModes272;
.super Ljava/lang/Object;
.source "ResumeModes272.java"


# static fields
.field public static final BG:Ljava/lang/String; = "nicoid_app_resume_background"

.field private static final FULL:Ljava/lang/String; = "nicoid_fullscreen262"

.field private static final KEEP:Ljava/lang/String; = "background"

.field public static final LEGACY:Ljava/lang/String; = "nicoid_app_resume_playback"

.field private static final MIGRATED:Ljava/lang/String; = "nicoid_app_resume_split_272"

.field private static final NORMAL:Ljava/lang/String; = "normal"

.field public static final POP:Ljava/lang/String; = "nicoid_app_resume_popup"

.field private static final TAG:Ljava/lang/String; = "nicoid-resume-modes"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static configure(Landroid/preference/PreferenceActivity;Landroid/content/SharedPreferences;Landroid/preference/ListPreference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13

    .line 131
    const-string v0, "Return to normal playback"

    const-string/jumbo v1, "\u8fd4\u56de\u4e00\u822c\u64ad\u653e"

    const-string/jumbo v2, "\u901a\u5e38\u518d\u751f\u306b\u623b\u308b"

    invoke-static {p0, v2, v0, v1}, Le/e/a/ResumeModes272;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 132
    const-string v1, "Return to fullscreen playback"

    const-string/jumbo v2, "\u8fd4\u56de\u5168\u87a2\u5e55\u64ad\u653e"

    const-string v3, "\u5168\u753b\u9762\u518d\u751f\u306b\u623b\u308b"

    invoke-static {p0, v3, v1, v2}, Le/e/a/ResumeModes272;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 133
    invoke-virtual {p2, p4}, Landroid/preference/ListPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 134
    const/4 p4, 0x1

    invoke-virtual {p2, p4}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 135
    const/4 v2, 0x3

    new-array v3, v2, [Ljava/lang/CharSequence;

    const/4 v4, 0x0

    aput-object p5, v3, v4

    aput-object v0, v3, p4

    const/4 p5, 0x2

    aput-object v1, v3, p5

    invoke-virtual {p2, v3}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 136
    new-array v0, v2, [Ljava/lang/CharSequence;

    const-string v1, "background"

    aput-object v1, v0, v4

    const-string v2, "normal"

    aput-object v2, v0, p4

    const-string p4, "nicoid_fullscreen262"

    aput-object p4, v0, p5

    invoke-virtual {p2, v0}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 137
    invoke-virtual {p2, v4}, Landroid/preference/ListPreference;->setPersistent(Z)V

    .line 138
    invoke-interface {p1, p3, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Le/e/a/ResumeModes272;->valid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 139
    invoke-static {p0, p2, p6}, Le/e/a/ResumeModes272;->setSummary(Landroid/content/Context;Landroid/preference/ListPreference;Ljava/lang/String;)V

    .line 140
    new-instance v0, Le/e/a/ResumeModes272$0;

    move-object v4, p0

    move-object v2, p1

    move-object v1, p2

    move-object v3, p3

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Le/e/a/ResumeModes272$0;-><init>(Landroid/preference/ListPreference;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/preference/PreferenceActivity;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 154
    return-void
.end method

.method private static currentService()Landroid/app/Service;
    .registers 5

    .line 167
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "e.e.a.AppResume253"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 168
    const-string v2, "service"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 169
    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/app/Service;

    if-eqz v2, :cond_0

    check-cast v1, Landroid/app/Service;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    :cond_0
    return-object v0

    .line 170
    :catch_0
    move-exception v1

    return-object v0
.end method

.method private static directMini()Z
    .registers 3

    .line 173
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "e.e.a.DirectBackground235"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "active"

    invoke-static {v1, v2}, Le/e/a/ResumeModes272;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    .line 174
    :catch_0
    move-exception v1

    return v0
.end method

.method private static field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 160
    nop

    :goto_0
    if-eqz p0, :cond_0

    .line 161
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 162
    :catch_0
    move-exception v0

    .line 160
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_0

    .line 163
    :cond_0
    new-instance p0, Ljava/lang/NoSuchFieldException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static inAppMini()Z
    .registers 4

    .line 178
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "e.e.a.MiniSession225"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "showing"

    new-array v3, v0, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 179
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 180
    :catch_0
    move-exception v1

    return v0
.end method

.method private static initial(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 52
    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 53
    if-eqz v0, :cond_0

    invoke-static {v0}, Le/e/a/ResumeModes272;->valid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 54
    :cond_0
    const-string v0, "app_switch_playback"

    const-string v1, "none"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 55
    invoke-static {p0}, Le/e/a/ResumeModes272;->oldChoice(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object p0

    .line 56
    const-string v1, "nicoid_app_resume_popup"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const-string v1, "background"

    const-string v2, "popup"

    if-eqz p1, :cond_2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    move-object p0, v1

    :goto_0
    return-object p0

    .line 57
    :cond_2
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    move-object p0, v1

    :cond_3
    return-object p0
.end method

.method static synthetic lambda$configure$0(Landroid/preference/ListPreference;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/preference/PreferenceActivity;Ljava/lang/String;Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 9

    .line 141
    invoke-static {p6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p5

    invoke-static {p5}, Le/e/a/ResumeModes272;->valid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    .line 142
    invoke-virtual {p0, p5}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result p6

    const/4 v0, 0x0

    if-gez p6, :cond_0

    return v0

    .line 143
    :cond_0
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1, p2, p5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 145
    const-string p6, "nicoid_app_resume_background"

    invoke-virtual {p6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 146
    const-string p2, "nicoid_fullscreen262"

    invoke-virtual {p2, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p6

    if-eqz p6, :cond_1

    const-string p6, "normal"

    goto :goto_0

    :cond_1
    move-object p6, p5

    :goto_0
    const-string v1, "nicoid_app_resume_playback"

    invoke-interface {p1, v1, p6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 147
    const-string p6, "nicoid_fullscreen_resume262"

    invoke-virtual {p2, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    invoke-interface {p1, p6, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 149
    :cond_2
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 150
    invoke-virtual {p0, p5}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 151
    invoke-static {p3, p0, p4}, Le/e/a/ResumeModes272;->setSummary(Landroid/content/Context;Landroid/preference/ListPreference;Ljava/lang/String;)V

    .line 152
    return v0
.end method

.method private static migrate(Landroid/content/SharedPreferences;)V
    .registers 8

    .line 60
    const/4 v0, 0x0

    const-string v1, "nicoid_app_resume_split_272"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 61
    :cond_0
    const-string v0, "nicoid_app_resume_background"

    invoke-static {p0, v0}, Le/e/a/ResumeModes272;->initial(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "nicoid_app_resume_popup"

    invoke-static {p0, v3}, Le/e/a/ResumeModes272;->initial(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 62
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    .line 63
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    invoke-interface {v5, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 64
    :cond_1
    invoke-interface {p0, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_2

    invoke-interface {v5, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 65
    :cond_2
    const/4 p0, 0x1

    invoke-interface {v5, v1, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 66
    return-void
.end method

.method private static oldChoice(Landroid/content/SharedPreferences;)Ljava/lang/String;
    .registers 4

    .line 47
    const-string v0, "nicoid_app_resume_playback"

    const-string v1, "background"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ResumeModes272;->valid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 48
    const-string v1, "normal"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "nicoid_fullscreen_resume262"

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "nicoid_fullscreen262"

    return-object p0

    .line 49
    :cond_0
    return-object v0
.end method

.method private static owner(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 6

    .line 68
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 69
    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 70
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    .line 71
    if-ne v2, p1, :cond_1

    return-object p0

    .line 72
    :cond_1
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_2

    .line 73
    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/ResumeModes272;->owner(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    .line 74
    if-eqz v2, :cond_2

    return-object v2

    .line 69
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 77
    :cond_3
    return-object v0
.end method

.method private static popupService(Landroid/app/Service;)Z
    .registers 4

    .line 189
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 190
    :cond_0
    invoke-static {}, Le/e/a/ResumeModes272;->directMini()Z

    move-result v1

    if-eqz v1, :cond_1

    return v0

    .line 191
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v1, "p0"

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    xor-int/lit8 p0, p0, 0x1

    return p0

    .line 192
    :catch_0
    move-exception p0

    const-string v1, "nicoid-resume-modes"

    const-string v2, "Cannot classify playback service; preserving background policy"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method public static refresh(Landroid/preference/PreferenceActivity;)V
    .registers 10

    .line 101
    invoke-static {p0}, Le/e/a/ResumeModes272;->validActivity(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 102
    :cond_0
    const-string v0, "nicoid_app_resume_playback"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 103
    instance-of v1, v0, Landroid/preference/ListPreference;

    if-nez v1, :cond_1

    return-void

    .line 104
    :cond_1
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 105
    invoke-static {v3}, Le/e/a/ResumeModes272;->migrate(Landroid/content/SharedPreferences;)V

    .line 106
    move-object v4, v0

    check-cast v4, Landroid/preference/ListPreference;

    .line 107
    const-string v0, "nicoid_app_resume_popup"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 109
    instance-of v2, v1, Landroid/preference/ListPreference;

    if-eqz v2, :cond_2

    check-cast v1, Landroid/preference/ListPreference;

    goto :goto_0

    .line 111
    :cond_2
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    invoke-static {v1, v4}, Le/e/a/ResumeModes272;->owner(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    .line 112
    if-nez v1, :cond_3

    return-void

    .line 113
    :cond_3
    new-instance v2, Landroid/preference/ListPreference;

    invoke-direct {v2, p0}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    .line 114
    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    .line 116
    invoke-virtual {v4}, Landroid/preference/ListPreference;->getOrder()I

    move-result v0

    const v5, 0x7ffffffe

    if-ge v0, v5, :cond_4

    invoke-virtual {v4}, Landroid/preference/ListPreference;->getOrder()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setOrder(I)V

    .line 117
    :cond_4
    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    move-object v1, v2

    .line 119
    :goto_0
    nop

    .line 120
    const-string v0, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f\u304b\u3089\u306e\u5fa9\u5e30\u6642\u306e\u52d5\u4f5c"

    const-string v2, "When returning from background playback"

    const-string/jumbo v5, "\u5f9e\u80cc\u666f\u64ad\u653e\u8fd4\u56de\u6642\u7684\u884c\u70ba"

    invoke-static {p0, v0, v2, v5}, Le/e/a/ResumeModes272;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 121
    const-string v0, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f\u3092\u7dad\u6301"

    const-string v2, "Keep background playback"

    const-string/jumbo v5, "\u7dad\u6301\u80cc\u666f\u64ad\u653e"

    invoke-static {p0, v0, v2, v5}, Le/e/a/ResumeModes272;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 122
    const-string v0, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f\u4e2d\u306b\u30a2\u30d7\u30ea\u3078\u623b\u3063\u305f\u5834\u5408\u306e\u52d5\u4f5c"

    const-string v2, "Choose what happens when returning to the app from background playback"

    const-string/jumbo v5, "\u5f9e\u80cc\u666f\u64ad\u653e\u8fd4\u56de\u61c9\u7528\u7a0b\u5f0f\u6642\u7684\u52d5\u4f5c"

    invoke-static {p0, v0, v2, v5}, Le/e/a/ResumeModes272;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 119
    const-string v5, "nicoid_app_resume_background"

    move-object v2, p0

    invoke-static/range {v2 .. v8}, Le/e/a/ResumeModes272;->configure(Landroid/preference/PreferenceActivity;Landroid/content/SharedPreferences;Landroid/preference/ListPreference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    nop

    .line 124
    const-string p0, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u304b\u3089\u306e\u5fa9\u5e30\u6642\u306e\u52d5\u4f5c"

    const-string v0, "When returning from popup playback"

    const-string/jumbo v4, "\u5f9e\u5f48\u51fa\u8996\u7a97\u64ad\u653e\u8fd4\u56de\u6642\u7684\u884c\u70ba"

    invoke-static {v2, p0, v0, v4}, Le/e/a/ResumeModes272;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 125
    const-string p0, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u3092\u7dad\u6301"

    const-string v0, "Keep popup playback"

    const-string/jumbo v4, "\u7dad\u6301\u5f48\u51fa\u8996\u7a97\u64ad\u653e"

    invoke-static {v2, p0, v0, v4}, Le/e/a/ResumeModes272;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 126
    const-string p0, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u4e2d\u306b\u30a2\u30d7\u30ea\u3078\u623b\u3063\u305f\u5834\u5408\u306e\u52d5\u4f5c"

    const-string v0, "Choose what happens when returning to the app from popup playback"

    const-string/jumbo v4, "\u5f9e\u5f48\u51fa\u8996\u7a97\u64ad\u653e\u8fd4\u56de\u61c9\u7528\u7a0b\u5f0f\u6642\u7684\u52d5\u4f5c"

    invoke-static {v2, p0, v0, v4}, Le/e/a/ResumeModes272;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 123
    const-string v5, "nicoid_app_resume_popup"

    move-object v4, v1

    invoke-static/range {v2 .. v8}, Le/e/a/ResumeModes272;->configure(Landroid/preference/PreferenceActivity;Landroid/content/SharedPreferences;Landroid/preference/ListPreference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    invoke-static {v2}, Le/e/a/ResumeModes272;->reparent(Landroid/preference/PreferenceActivity;)V

    .line 128
    return-void
.end method

.method public static reparent(Landroid/preference/PreferenceActivity;)V
    .registers 5

    .line 85
    invoke-static {p0}, Le/e/a/ResumeModes272;->validActivity(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_3

    .line 86
    :cond_0
    const-string v0, "nicoid_app_resume_playback"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 87
    const-string v1, "nicoid_app_resume_popup"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 88
    if-eqz v0, :cond_7

    if-eqz v1, :cond_7

    if-ne v0, v1, :cond_1

    goto :goto_2

    .line 89
    :cond_1
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object p0

    .line 90
    invoke-static {p0, v0}, Le/e/a/ResumeModes272;->owner(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    .line 91
    invoke-static {p0, v1}, Le/e/a/ResumeModes272;->owner(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object p0

    .line 92
    if-eqz v2, :cond_6

    if-nez p0, :cond_2

    goto :goto_1

    .line 93
    :cond_2
    invoke-virtual {v0}, Landroid/preference/Preference;->getOrder()I

    move-result v0

    .line 94
    const v3, 0x7ffffffe

    if-ge v0, v3, :cond_3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    invoke-virtual {v1}, Landroid/preference/Preference;->getOrder()I

    move-result v0

    .line 95
    :goto_0
    if-ne p0, v2, :cond_4

    invoke-virtual {v1}, Landroid/preference/Preference;->getOrder()I

    move-result v3

    if-ne v3, v0, :cond_4

    return-void

    .line 96
    :cond_4
    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setOrder(I)V

    .line 97
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    move-result p0

    if-nez p0, :cond_5

    return-void

    .line 98
    :cond_5
    invoke-virtual {v2, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 99
    return-void

    .line 92
    :cond_6
    :goto_1
    return-void

    .line 88
    :cond_7
    :goto_2
    return-void

    .line 85
    :cond_8
    :goto_3
    return-void
.end method

.method public static selection(Landroid/content/SharedPreferences;)Ljava/lang/String;
    .registers 2

    .line 195
    invoke-static {}, Le/e/a/ResumeModes272;->currentService()Landroid/app/Service;

    move-result-object v0

    .line 196
    invoke-static {v0}, Le/e/a/ResumeModes272;->popupService(Landroid/app/Service;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "nicoid_app_resume_popup"

    goto :goto_0

    :cond_0
    const-string v0, "nicoid_app_resume_background"

    .line 197
    :goto_0
    invoke-static {p0, v0}, Le/e/a/ResumeModes272;->initial(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static setSummary(Landroid/content/Context;Landroid/preference/ListPreference;Ljava/lang/String;)V
    .registers 6

    .line 156
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v0

    .line 157
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\uff1a"

    const-string v2, ": "

    invoke-static {p0, v1, v2, v1}, Le/e/a/ResumeModes272;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 158
    return-void
.end method

.method public static shouldArm(Ljava/lang/String;)Z
    .registers 2

    .line 184
    const-string v0, "background"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "popup"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    .line 185
    invoke-static {}, Le/e/a/ResumeModes272;->currentService()Landroid/app/Service;

    move-result-object p0

    if-nez p0, :cond_1

    invoke-static {}, Le/e/a/ResumeModes272;->directMini()Z

    move-result p0

    if-nez p0, :cond_1

    invoke-static {}, Le/e/a/ResumeModes272;->inAppMini()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 184
    :goto_1
    return p0
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 11

    .line 29
    const-string v0, "en"

    const-string v1, "zh"

    :try_start_0
    const-string v2, "e.e.a.PanelUi"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "tr"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x2

    aput-object v5, v4, v6

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x3

    aput-object v5, v4, v6

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    move-result-object v3

    .line 30
    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 31
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_0

    check-cast v2, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 32
    :catch_0
    move-exception v2

    :cond_0
    nop

    .line 34
    :try_start_1
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v2, "app_lang"

    const-string v3, "-1"

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 35
    const-string v2, "1"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    .line 36
    :cond_1
    const-string v2, "2"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    .line 37
    :cond_2
    const-string v2, "0"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "ja"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz p0, :cond_6

    :cond_3
    return-object p1

    .line 36
    :cond_4
    :goto_0
    return-object p3

    .line 35
    :cond_5
    :goto_1
    return-object p2

    .line 38
    :catch_1
    move-exception p0

    :cond_6
    nop

    .line 39
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    move-object p1, p3

    goto :goto_2

    :cond_7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    move-object p1, p2

    :cond_8
    :goto_2
    return-object p1
.end method

.method private static valid(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 43
    const-string v0, "nicoid_fullscreen262"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "normal"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 44
    :cond_0
    const-string p0, "background"

    return-object p0

    .line 43
    :cond_1
    :goto_0
    return-object p0
.end method

.method private static validActivity(Landroid/app/Activity;)Z
    .registers 2

    .line 80
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
