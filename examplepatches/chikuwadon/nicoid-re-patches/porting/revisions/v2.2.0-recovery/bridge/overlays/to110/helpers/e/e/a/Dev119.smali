.class public final Le/e/a/Dev119;
.super Ljava/lang/Object;
.source "Dev119.java"


# static fields
.field public static final KEY:Ljava/lang/String; = "nicoid_keep_audio_screen_off"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static installSettings(Landroid/preference/PreferenceActivity;)V
    .registers 6
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 25
    const-string v0, "nicoid_keep_audio_screen_off"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_0

    return-void

    .line 26
    :cond_0
    const-string v1, "setting_whole"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 27
    .local v1, "group":Landroid/preference/Preference;
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-nez v2, :cond_1

    return-void

    .line 28
    :cond_1
    new-instance v2, Landroid/preference/CheckBoxPreference;

    invoke-direct {v2, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    .line 29
    .local v2, "option":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 30
    const-string v0, "Play audio when screen is off"

    const-string/jumbo v3, "\u95dc\u9589\u87a2\u5e55\u6642\u7e7c\u7e8c\u64ad\u653e\u97f3\u8a0a"

    const-string/jumbo v4, "\u753b\u9762OFF\u6642\u3082\u97f3\u58f0\u3092\u518d\u751f"

    invoke-static {p0, v4, v0, v3}, Le/e/a/Dev119;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 31
    const-string v0, "Continue audio during normal playback when the screen turns off"

    const-string v3, "\u4e00\u822c\u64ad\u653e\u6642\u95dc\u9589\u87a2\u5e55\u5f8c\u7e7c\u7e8c\u64ad\u653e\u97f3\u8a0a"

    const-string/jumbo v4, "\u901a\u5e38\u518d\u751f\u4e2d\u306b\u753b\u9762\u3092\u6d88\u3057\u3066\u3082\u97f3\u58f0\u3092\u518d\u751f\u3057\u7d9a\u3051\u307e\u3059"

    invoke-static {p0, v4, v0, v3}, Le/e/a/Dev119;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 35
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 36
    move-object v0, v1

    check-cast v0, Landroid/preference/PreferenceGroup;

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 37
    return-void
.end method

.method public static retainWhenScreenOff(Ljava/lang/Object;)Z
    .registers 13
    .param p0, "fragment"    # Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/ScreenOffAudio216;->arm(Ljava/lang/Object;)V

    .line 47
    const-string v0, "nicoid-screen-audio"

    const/4 v1, 0x0

    if-nez p0, :cond_0

    return v1

    .line 49
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "A1"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 50
    .local v2, "owner":Ljava/lang/reflect/Field;
    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    .line 51
    .local v3, "activity":Landroid/app/Activity;
    if-eqz v3, :cond_7

    invoke-virtual {v3}, Landroid/app/Activity;->isFinishing()Z

    move-result v4

    if-nez v4, :cond_7

    invoke-virtual {v3}, Landroid/app/Activity;->isDestroyed()Z

    move-result v4

    if-nez v4, :cond_7

    .line 52
    invoke-virtual {v3}, Landroid/app/Activity;->isChangingConfigurations()Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    .line 53
    :cond_1
    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "nicoid_keep_audio_screen_off"

    .line 54
    const/4 v6, 0x1

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    .line 55
    .local v4, "enabled":Z
    if-nez v4, :cond_2

    return v1

    .line 56
    :cond_2
    const-string v5, "power"

    invoke-virtual {v3, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/PowerManager;

    .line 57
    .local v5, "power":Landroid/os/PowerManager;
    if-eqz v5, :cond_6

    invoke-virtual {v5}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v6

    if-eqz v6, :cond_3

    goto :goto_0

    .line 58
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "a0"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 59
    .local v6, "video":Ljava/lang/reflect/Field;
    invoke-virtual {v6, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 60
    .local v7, "player":Ljava/lang/Object;
    if-nez v7, :cond_4

    return v1

    .line 61
    :cond_4
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "isPlaying"

    new-array v10, v1, [Ljava/lang/Class;

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 62
    .local v8, "isPlaying":Ljava/lang/reflect/Method;
    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    new-array v10, v1, [Ljava/lang/Object;

    invoke-virtual {v8, v7, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v9

    .line 63
    .local v9, "playing":Z
    invoke-virtual {v5}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v10

    invoke-static {v4, v10, v9, v1}, Le/e/a/Dev119;->shouldRetain(ZZZZ)Z

    move-result v10

    .line 64
    .local v10, "retain":Z
    if-eqz v10, :cond_5

    const-string v11, "Retaining normal playback while display is off"

    invoke-static {v0, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    :cond_5
    return v10

    .line 57
    .end local v6    # "video":Ljava/lang/reflect/Field;
    .end local v7    # "player":Ljava/lang/Object;
    .end local v8    # "isPlaying":Ljava/lang/reflect/Method;
    .end local v9    # "playing":Z
    .end local v10    # "retain":Z
    :cond_6
    :goto_0
    return v1

    .line 52
    .end local v4    # "enabled":Z
    .end local v5    # "power":Landroid/os/PowerManager;
    :cond_7
    :goto_1
    return v1

    .line 67
    .end local v2    # "owner":Ljava/lang/reflect/Field;
    .end local v3    # "activity":Landroid/app/Activity;
    :catch_0
    move-exception v2

    .line 68
    .local v2, "error":Ljava/lang/Exception;
    const-string v3, "Screen-off audio guard skipped"

    invoke-static {v0, v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 69
    return v1
.end method

.method public static shouldRetain(ZZZZ)Z
    .registers 5
    .param p0, "enabled"    # Z
    .param p1, "screenInteractive"    # Z
    .param p2, "playing"    # Z
    .param p3, "finishing"    # Z

    .line 41
    if-eqz p0, :cond_0

    if-nez p1, :cond_0

    if-eqz p2, :cond_0

    if-nez p3, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "japanese"    # Ljava/lang/String;
    .param p2, "english"    # Ljava/lang/String;
    .param p3, "traditional"    # Ljava/lang/String;

    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 21
    .local v0, "language":Ljava/lang/String;
    const-string v1, "ja"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v1, p1

    goto :goto_0

    :cond_0
    const-string v1, "zh"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v1, p3

    goto :goto_0

    :cond_1
    move-object v1, p2

    :goto_0
    return-object v1
.end method
