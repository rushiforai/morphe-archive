.class public final Le/e/a/NoMini;
.super Ljava/lang/Object;
.source "NoMini.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static canDrawOverlays(Landroid/content/Context;)Z
    .registers 3

    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_f

    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_d

    goto :goto_f

    :cond_d
    const/4 p0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 p0, 0x1

    :goto_10
    return p0
.end method

.method public static migrate(Landroid/content/Context;)V
    .registers 7

    .line 5
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "back_playback"

    const-string v1, "app_switch_playback"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_d
    const/4 v2, 0x2

    if-ge v1, v2, :cond_2e

    aget-object v2, v0, v1

    const-string v3, "mini"

    const-string v4, "none"

    invoke-interface {p0, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3, v2, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    :cond_2e
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 15

    .line 6
    invoke-static {p0}, Le/e/a/NoMini;->migrate(Landroid/content/Context;)V

    const-string v0, "back_playback"

    const-string v1, "app_switch_playback"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_d
    const/4 v3, 0x2

    if-ge v2, v3, :cond_75

    aget-object v3, v0, v2

    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    instance-of v4, v3, Landroid/preference/ListPreference;

    if-nez v4, :cond_1b

    :cond_1a
    goto :goto_72

    :cond_1b
    check-cast v3, Landroid/preference/ListPreference;

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v5

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    const/4 v8, 0x0

    :goto_30
    array-length v9, v4

    const-string v10, "mini"

    if-ge v8, v9, :cond_4a

    aget-object v9, v4, v8

    invoke-virtual {v10, v9}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_47

    aget-object v9, v4, v8

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    aget-object v9, v5, v8

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_47
    add-int/lit8 v8, v8, 0x1

    goto :goto_30

    :cond_4a
    new-array v4, v1, [Ljava/lang/CharSequence;

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    new-array v4, v1, [Ljava/lang/CharSequence;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    const-string v4, "none"

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1a

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    :goto_72
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 7
    :cond_75
    const-string v12, "comment_hide"

    const-string v13, "comment_limit_extended"

    const-string v3, "comment_size_percent"

    const-string v4, "comment_fps"

    const-string v5, "comment_opacity_percent"

    const-string v6, "comment_shadow"

    const-string v7, "comment_shadow_tenths"

    const-string v8, "comment_rows"

    const-string v9, "comment_duration_seconds"

    const-string v10, "share_ng_level"

    const-string v11, "comment_cast_min"

    filled-new-array/range {v3 .. v13}, [Ljava/lang/String;

    move-result-object v0

    :goto_8f
    const/16 v2, 0xb

    if-ge v1, v2, :cond_a1

    aget-object v2, v0, v1

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-eqz v2, :cond_9e

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setOrder(I)V

    :cond_9e
    add-int/lit8 v1, v1, 0x1

    goto :goto_8f

    :cond_a1
    return-void
.end method
