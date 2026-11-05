.class public final Le/e/a/PlaybackDefaults229;
.super Ljava/lang/Object;
.source "PlaybackDefaults229.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static initialize(Landroid/content/Context;)V
    .registers 1

    if-eqz p0, :cond_9

    .line 5
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaybackDefaults229;->initializePrefs(Landroid/content/SharedPreferences;)V

    :cond_9
    return-void
.end method

.method static initializePrefs(Landroid/content/SharedPreferences;)V
    .registers 5

    .line 7
    const-string v0, "app_switch_playback"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_12

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "none"

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_13

    :cond_12
    const/4 v1, 0x0

    .line 8
    :goto_13
    const-string v0, "back_playback"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_26

    if-nez v1, :cond_21

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    :cond_21
    const-string v2, "background"

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 9
    :cond_26
    const-string v0, "gesture_swipe_background"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_40

    if-nez v1, :cond_34

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    :cond_34
    const-string v2, "gesture_swipe_popup"

    const/4 v3, 0x0

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    invoke-interface {v1, v0, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    :cond_40
    if-eqz v1, :cond_45

    .line 10
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_45
    return-void
.end method

.method static mini(Landroid/content/SharedPreferences;)Z
    .registers 3

    .line 12
    const-string v0, "gesture_swipe_popup"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "gesture_swipe_background"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 6

    const/4 v0, 0x0

    if-eqz p0, :cond_25

    if-nez p1, :cond_6

    goto :goto_25

    :cond_6
    const/4 v1, 0x0

    .line 13
    :goto_7
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-lt v1, v2, :cond_e

    return-object v0

    :cond_e
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    if-ne v2, p1, :cond_15

    return-object p0

    :cond_15
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_22

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/PlaybackDefaults229;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    if-eqz v2, :cond_22

    return-object v2

    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_25
    :goto_25
    return-object v0
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 17

    move-object/from16 v0, p0

    .line 14
    invoke-static/range {p0 .. p0}, Le/e/a/PlaybackDefaults229;->initialize(Landroid/content/Context;)V

    invoke-virtual/range {p0 .. p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    if-nez v1, :cond_c

    return-void

    :cond_c
    const-string v2, "setting_whole"

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-nez v3, :cond_17

    return-void

    :cond_17
    check-cast v2, Landroid/preference/PreferenceGroup;

    .line 15
    const-string v3, "app_switch_playback"

    const-string v4, "back_playback"

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const-string v4, "When switching apps"

    const-string v5, "\u5207\u63db\u61c9\u7528\u7a0b\u5f0f\u6642\u7684\u884c\u70ba"

    const-string v6, "\u30a2\u30d7\u30ea\u5207\u66ff\u6642\u306e\u52d5\u4f5c"

    invoke-static {v0, v6, v4, v5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "When going back during playback"

    const-string v6, "\u64ad\u653e\u6642\u8fd4\u56de\u7684\u884c\u70ba"

    const-string v7, "\u518d\u751f\u4e2d\u306b\u623b\u308b\u5834\u5408\u306e\u52d5\u4f5c"

    invoke-static {v0, v7, v5, v6}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    new-array v6, v5, [Landroid/preference/ListPreference;

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_3e
    const/4 v9, 0x1

    if-lt v8, v5, :cond_c3

    .line 17
    const-string v3, "videolist_tap"

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v10

    if-eqz v10, :cond_74

    invoke-static {v1, v10}, Le/e/a/PlaybackDefaults229;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v0

    if-eq v0, v2, :cond_74

    invoke-static {v1, v10}, Le/e/a/PlaybackDefaults229;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v0

    if-eqz v0, :cond_58

    invoke-virtual {v0, v10}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_58
    instance-of v3, v0, Landroid/preference/PreferenceCategory;

    if-eqz v3, :cond_6b

    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v3

    if-nez v3, :cond_6b

    invoke-static {v1, v0}, Le/e/a/PlaybackDefaults229;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-eqz v1, :cond_6b

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_6b
    const v0, 0x7fffffff

    invoke-virtual {v10, v0}, Landroid/preference/Preference;->setOrder(I)V

    invoke-virtual {v2, v10}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 18
    :cond_74
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    :goto_7a
    invoke-virtual {v2}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_b9

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_8b

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v9

    :cond_8b
    add-int/lit8 v1, v0, 0x1

    aget-object v3, v6, v7

    invoke-virtual {v11, v1, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    add-int/2addr v0, v5

    aget-object v1, v6, v9

    invoke-virtual {v11, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    const/4 v0, 0x0

    :goto_99
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_a0

    return-void

    :cond_a0
    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/preference/Preference;

    mul-int/lit8 v3, v0, 0xa

    invoke-virtual {v1, v3}, Landroid/preference/Preference;->setOrder(I)V

    aget-object v3, v6, v7

    if-eq v1, v3, :cond_b3

    aget-object v3, v6, v9

    if-ne v1, v3, :cond_b6

    :cond_b3
    invoke-virtual {v2, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    :cond_b6
    add-int/lit8 v0, v0, 0x1

    goto :goto_99

    :cond_b9
    invoke-virtual {v2, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_7a

    .line 16
    :cond_c3
    aget-object v10, v3, v8

    invoke-virtual {v0, v10}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v10

    instance-of v11, v10, Landroid/preference/ListPreference;

    if-eqz v11, :cond_d1

    move-object v11, v10

    check-cast v11, Landroid/preference/ListPreference;

    goto :goto_d6

    :cond_d1
    new-instance v11, Landroid/preference/ListPreference;

    invoke-direct {v11, v0}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    :goto_d6
    invoke-static {v1, v10}, Le/e/a/PlaybackDefaults229;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v12

    if-eqz v12, :cond_df

    invoke-virtual {v12, v10}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_df
    aget-object v10, v3, v8

    invoke-virtual {v11, v10}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    aget-object v10, v4, v8

    invoke-virtual {v11, v10}, Landroid/preference/ListPreference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {v11}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v10

    const-string v12, "background"

    const-string v13, "none"

    if-nez v10, :cond_132

    const/4 v10, 0x3

    new-array v14, v10, [Ljava/lang/CharSequence;

    const-string v15, "Do nothing"

    const-string v10, "\u4e0d\u57f7\u884c\u4efb\u4f55\u52d5\u4f5c"

    const-string v5, "\u4f55\u3082\u3057\u306a\u3044"

    invoke-static {v0, v5, v15, v10}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v14, v7

    const-string v5, "Background playback"

    const-string v10, "\u80cc\u666f\u64ad\u653e"

    const-string v15, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    invoke-static {v0, v15, v5, v10}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v14, v9

    const-string v5, "Popup playback"

    const-string v10, "\u61f8\u6d6e\u64ad\u653e"

    const-string v15, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    invoke-static {v0, v15, v5, v10}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v10, 0x2

    aput-object v5, v14, v10

    invoke-virtual {v11, v14}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/CharSequence;

    aput-object v13, v5, v7

    aput-object v12, v5, v9

    const-string v9, "popup"

    aput-object v9, v5, v10

    invoke-virtual {v11, v5}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    const-string v5, "%s"

    invoke-virtual {v11, v5}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_133

    :cond_132
    const/4 v10, 0x2

    :goto_133
    if-nez v8, :cond_136

    move-object v12, v13

    :cond_136
    invoke-virtual {v11, v12}, Landroid/preference/ListPreference;->setDefaultValue(Ljava/lang/Object;)V

    aput-object v11, v6, v8

    add-int/lit8 v8, v8, 0x1

    const/4 v5, 0x2

    goto/16 :goto_3e
.end method
