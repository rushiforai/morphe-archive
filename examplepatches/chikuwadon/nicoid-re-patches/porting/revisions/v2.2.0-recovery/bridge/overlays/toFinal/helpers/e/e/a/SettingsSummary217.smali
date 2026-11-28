.class public final Le/e/a/SettingsSummary217;
.super Ljava/lang/Object;
.source "SettingsSummary217.java"


# static fields
.field private static final KEYS:[Ljava/lang/String;

.field private static final LISTENERS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/preference/PreferenceActivity;",
            "Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .line 17
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/SettingsSummary217;->MAIN:Landroid/os/Handler;

    .line 19
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SettingsSummary217;->LISTENERS:Ljava/util/WeakHashMap;

    .line 22
    const-string v5, "nicoid_app_resume_playback"

    const-string v6, "back_playback"

    const-string v1, "videolist_tap"

    const-string v2, "intent_type"

    const-string v3, "nicoid_external_link_back"

    const-string v4, "app_switch_playback"

    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    move-result-object v0

    .line 20
    sput-object v0, Le/e/a/SettingsSummary217;->KEYS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static attach(Landroid/preference/PreferenceActivity;)V
    .registers 14

    .line 96
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_6

    .line 97
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 98
    :cond_0
    const-string v1, "intent_type"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 99
    :goto_0
    invoke-static {v0, v1}, Le/e/a/SettingsSummary217;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v0

    if-nez v0, :cond_1

    .line 101
    const-string v2, "setting_whole"

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 102
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_1

    move-object v0, v2

    check-cast v0, Landroid/preference/PreferenceGroup;

    :cond_1
    if-nez v0, :cond_2

    .line 105
    const-string p0, "nicoid-settings217"

    const-string v0, "General preferences category not found"

    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 108
    :cond_2
    const-string v2, "nicoid_external_link_back"

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    if-nez v3, :cond_4

    .line 109
    new-instance v3, Landroid/preference/ListPreference;

    invoke-direct {v3, p0}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    .line 110
    invoke-virtual {v3, v2}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    .line 112
    const-string v4, "Back action when opened from a link"

    const-string/jumbo v5, "\u5f9e\u5916\u90e8\u9023\u7d50\u958b\u555f\u5f8c\u7684\u8fd4\u56de\u884c\u70ba"

    .line 111
    const-string v6, "\u30ea\u30f3\u30af\u304b\u3089\u8d77\u52d5\u3057\u305f\u5834\u5408\u306e\u623b\u308b\u52d5\u4f5c"

    invoke-static {p0, v6, v4, v5}, Le/e/a/SettingsSummary217;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v4, 0x5

    .line 113
    new-array v5, v4, [Ljava/lang/CharSequence;

    .line 114
    const-string v6, "Follow normal Back setting"

    const-string/jumbo v7, "\u6cbf\u7528\u4e00\u822c\u8fd4\u56de\u8a2d\u5b9a"

    const-string/jumbo v8, "\u901a\u5e38\u306e\u8a2d\u5b9a\u306b\u5f93\u3046"

    invoke-static {p0, v8, v6, v7}, Le/e/a/SettingsSummary217;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    .line 115
    const-string v6, "Stop playback and return"

    const-string v8, "\u505c\u6b62\u64ad\u653e\u4e26\u8fd4\u56de"

    const-string v9, "\u518d\u751f\u3092\u7d42\u4e86\u3057\u3066\u623b\u308b"

    invoke-static {p0, v9, v6, v8}, Le/e/a/SettingsSummary217;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x1

    aput-object v6, v5, v8

    .line 116
    const-string v6, "Continue playback in background"

    const-string/jumbo v9, "\u80cc\u666f\u64ad\u653e\u4e26\u8fd4\u56de"

    const-string v10, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f\u3057\u3066\u623b\u308b"

    invoke-static {p0, v10, v6, v9}, Le/e/a/SettingsSummary217;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v9, 0x2

    aput-object v6, v5, v9

    .line 117
    const-string v6, "Continue in popup"

    const-string v10, "\u4ee5\u61f8\u6d6e\u8996\u7a97\u64ad\u653e\u4e26\u8fd4\u56de"

    const-string v11, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u3057\u3066\u623b\u308b"

    invoke-static {p0, v11, v6, v10}, Le/e/a/SettingsSummary217;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v10, 0x3

    aput-object v6, v5, v10

    .line 118
    const-string v6, "Return to nicoid"

    const-string/jumbo v11, "\u8fd4\u56denicoid"

    const-string v12, "nicoid\u306e\u753b\u9762\u306b\u623b\u308b"

    invoke-static {p0, v12, v6, v11}, Le/e/a/SettingsSummary217;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v11, 0x4

    aput-object v6, v5, v11

    .line 113
    invoke-virtual {v3, v5}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 120
    new-array v4, v4, [Ljava/lang/CharSequence;

    const-string v5, "inherit"

    aput-object v5, v4, v7

    const-string v6, "stop"

    aput-object v6, v4, v8

    const-string v6, "background"

    aput-object v6, v4, v9

    const-string v6, "popup"

    aput-object v6, v4, v10

    const-string v6, "nicoid"

    aput-object v6, v4, v11

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 121
    invoke-virtual {v3, v5}, Landroid/preference/ListPreference;->setDefaultValue(Ljava/lang/Object;)V

    if-nez v1, :cond_3

    .line 122
    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    mul-int/lit8 v1, v1, 0xa

    goto :goto_1

    :cond_3
    invoke-virtual {v1}, Landroid/preference/Preference;->getOrder()I

    move-result v1

    add-int/2addr v1, v8

    .line 123
    :goto_1
    invoke-virtual {v3, v1}, Landroid/preference/ListPreference;->setOrder(I)V

    .line 124
    invoke-virtual {v0, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 127
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 128
    invoke-interface {v0, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {v3, v5}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 130
    :cond_4
    invoke-static {p0}, Le/e/a/SettingsSummary217;->refresh(Landroid/preference/PreferenceActivity;)V

    .line 131
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 132
    sget-object v1, Le/e/a/SettingsSummary217;->LISTENERS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    if-eqz v2, :cond_5

    .line 133
    invoke-interface {v0, v2}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 134
    :cond_5
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 135
    new-instance v3, Le/e/a/SettingsSummary217$1;

    invoke-direct {v3, v2}, Le/e/a/SettingsSummary217$1;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 144
    invoke-interface {v0, v3}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 145
    invoke-virtual {v1, p0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    return-void
.end method

.method static description(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 55
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "back_playback"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 74
    const-string p1, "Behavior on Back during playback inside nicoid"

    const-string v0, "\u5728nicoid\u5167\u64ad\u653e\u6642\u8fd4\u56de\u7684\u884c\u70ba"

    .line 73
    const-string v1, "nicoid\u5185\u3067\u518d\u751f\u4e2d\u306b\u623b\u308b\u3068\u304d\u306e\u52d5\u4f5c"

    invoke-static {p0, v1, p1, v0}, Le/e/a/SettingsSummary217;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 55
    :sswitch_1
    const-string v0, "nicoid_external_link_back"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 64
    const-string p1, "Playback and screen behavior on Back from an external link"

    .line 65
    const-string/jumbo v0, "\u5f9e\u5916\u90e8\u9023\u7d50\u958b\u555f\u5f71\u7247\u6642\u8fd4\u56de\u7684\u64ad\u653e\u8207\u756b\u9762\u884c\u70ba"

    .line 63
    const-string v1, "\u5916\u90e8\u30ea\u30f3\u30af\u304b\u3089\u958b\u3044\u305f\u52d5\u753b\u3067\u623b\u308b\u3068\u304d\u306e\u518d\u751f\u30fb\u753b\u9762\u306e\u52d5\u4f5c"

    invoke-static {p0, v1, p1, v0}, Le/e/a/SettingsSummary217;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 55
    :sswitch_2
    const-string v0, "videolist_tap"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 58
    const-string p1, "Action when tapping a video in a list"

    const-string/jumbo v0, "\u9ede\u64ca\u5f71\u7247\u6e05\u55ae\u6642\u57f7\u884c\u7684\u64cd\u4f5c"

    .line 57
    const-string v1, "\u52d5\u753b\u4e00\u89a7\u3092\u30bf\u30c3\u30d7\u3057\u305f\u3068\u304d\u306b\u5b9f\u884c\u3059\u308b\u64cd\u4f5c"

    invoke-static {p0, v1, p1, v0}, Le/e/a/SettingsSummary217;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 55
    :sswitch_3
    const-string v0, "app_switch_playback"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 68
    const-string p1, "Playback behavior when switching to another app"

    const-string v0, "\u5207\u63db\u81f3\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u6642\u7684\u64ad\u653e\u884c\u70ba"

    .line 67
    const-string v1, "\u4ed6\u306e\u30a2\u30d7\u30ea\u3078\u5207\u308a\u66ff\u3048\u305f\u3068\u304d\u306e\u518d\u751f\u65b9\u6cd5"

    invoke-static {p0, v1, p1, v0}, Le/e/a/SettingsSummary217;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 55
    :sswitch_4
    const-string v0, "intent_type"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 61
    const-string p1, "How to open video links from other apps"

    const-string/jumbo v0, "\u5f9e\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u958b\u555f\u5f71\u7247\u9023\u7d50\u7684\u65b9\u5f0f"

    .line 60
    const-string v1, "\u4ed6\u306e\u30a2\u30d7\u30ea\u304b\u3089\u52d5\u753b\u30ea\u30f3\u30af\u3092\u958b\u304f\u3068\u304d\u306e\u8d77\u52d5\u65b9\u6cd5"

    invoke-static {p0, v1, p1, v0}, Le/e/a/SettingsSummary217;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 55
    :sswitch_5
    const-string v0, "nicoid_app_resume_playback"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 71
    const-string p1, "Playback behavior when returning to nicoid"

    const-string/jumbo v0, "\u8fd4\u56denicoid\u6642\u7684\u64ad\u653e\u884c\u70ba"

    .line 70
    const-string v1, "nicoid\u3078\u5fa9\u5e30\u3057\u305f\u3068\u304d\u306e\u518d\u751f\u65b9\u6cd5"

    invoke-static {p0, v1, p1, v0}, Le/e/a/SettingsSummary217;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 75
    :cond_0
    :goto_0
    const-string p0, ""

    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x5d33712e -> :sswitch_5
        -0x457a2d03 -> :sswitch_4
        -0x1f976758 -> :sswitch_3
        0x3c7789fd -> :sswitch_2
        0x3fd8eb35 -> :sswitch_1
        0x5d029673 -> :sswitch_0
    .end sparse-switch
.end method

.method static display(Landroid/preference/PreferenceActivity;Landroid/preference/ListPreference;Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 79
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v0

    .line 80
    const-string v1, ""

    if-nez v0, :cond_0

    .line 81
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2, p2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 82
    invoke-virtual {p1, v2}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_0

    .line 83
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object p1

    aget-object v0, p1, v2

    :cond_0
    if-eqz v0, :cond_1

    .line 85
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 86
    :cond_1
    invoke-static {p0, p2}, Le/e/a/SettingsSummary217;->description(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    return-object p0

    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo p2, "\uff1a"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 3

    .line 27
    const-string v0, "nicoid-settings217"

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 31
    :try_start_0
    invoke-static {p0}, Le/e/a/SettingsSummary217;->attach(Landroid/preference/PreferenceActivity;)V

    .line 32
    const-string p0, "Installed external Back setting and six summaries"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 34
    const-string v1, "Could not install settings"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/ref/WeakReference;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 6

    .line 137
    sget-object p1, Le/e/a/SettingsSummary217;->KEYS:[Ljava/lang/String;

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_0

    return-void

    :cond_0
    aget-object v2, p1, v1

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 139
    sget-object p1, Le/e/a/SettingsSummary217;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/SettingsSummary217$0;

    invoke-direct {p2, p0}, Le/e/a/SettingsSummary217$0;-><init>(Ljava/lang/ref/WeakReference;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method static synthetic lambda$1(Ljava/lang/ref/WeakReference;)V
    .registers 2

    .line 140
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/preference/PreferenceActivity;

    if-eqz p0, :cond_0

    .line 141
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Le/e/a/SettingsSummary217;->refresh(Landroid/preference/PreferenceActivity;)V

    :cond_0
    return-void
.end method

.method static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 6

    const/4 v0, 0x0

    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    const/4 v1, 0x0

    .line 40
    :goto_0
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-lt v1, v2, :cond_0

    return-object v0

    .line 41
    :cond_0
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    if-ne v2, p1, :cond_1

    return-object p0

    .line 43
    :cond_1
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_2

    .line 44
    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/SettingsSummary217;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    if-eqz v2, :cond_2

    return-object v2

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method static refresh(Landroid/preference/PreferenceActivity;)V
    .registers 7

    .line 90
    sget-object v0, Le/e/a/SettingsSummary217;->KEYS:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v1, :cond_0

    return-void

    :cond_0
    aget-object v3, v0, v2

    .line 91
    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    .line 92
    instance-of v5, v4, Landroid/preference/ListPreference;

    if-eqz v5, :cond_1

    move-object v5, v4

    check-cast v5, Landroid/preference/ListPreference;

    invoke-static {p0, v5, v3}, Le/e/a/SettingsSummary217;->display(Landroid/preference/PreferenceActivity;Landroid/preference/ListPreference;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 52
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
