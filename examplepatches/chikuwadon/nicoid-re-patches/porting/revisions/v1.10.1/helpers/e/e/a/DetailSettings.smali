.class public final Le/e/a/DetailSettings;
.super Ljava/lang/Object;
.source "DetailSettings.java"


# static fields
.field public static final FOLLOW:Ljava/lang/String; = "video_info_follow_button"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 6

    .line 7
    invoke-static {p0}, Le/e/a/SettingsTools;->install(Landroid/preference/PreferenceActivity;)V

    .line 8
    const-string v0, "popup_double_tap_seek"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_51

    new-instance v1, Landroid/preference/CheckBoxPreference;

    invoke-direct {v1, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    const-string v0, "Double tap to seek in popup"

    const-string v3, "\u6d6e\u52d5\u64ad\u653e\u8f15\u89f8\u5169\u6b21\u8df3\u8f49"

    const-string v4, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u3067\u30c0\u30d6\u30eb\u30bf\u30c3\u30d7\u30b7\u30fc\u30af"

    invoke-static {p0, v4, v0, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "Use the normal seek interval. Close with \u00d7 at top right"

    const-string v3, "\u4f7f\u7528\u4e00\u822c\u64ad\u653e\u7684\u8df3\u8f49\u79d2\u6578\uff0c\u53f3\u4e0a\u89d2\u00d7\u95dc\u9589"

    const-string v4, "\u901a\u5e38\u518d\u751f\u3068\u540c\u3058\u79d2\u6570\u3067\u30b7\u30fc\u30af\u3057\u307e\u3059\u3002\u53f3\u4e0a\u306e\u00d7\u3067\u7d42\u4e86\u3057\u307e\u3059"

    invoke-static {p0, v4, v0, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/PopupGestures;->enabled(Landroid/content/Context;)Z

    move-result v0

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    const-string v0, "player"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    instance-of v3, v0, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_47

    check-cast v0, Landroid/preference/PreferenceGroup;

    goto :goto_48

    :cond_47
    move-object v0, v2

    :goto_48
    if-nez v0, :cond_4e

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    :cond_4e
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 9
    :cond_51
    const-string v0, "player_controls_outside_video"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-nez v1, :cond_a2

    new-instance v1, Landroid/preference/CheckBoxPreference;

    invoke-direct {v1, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    const-string v0, "Always show controls outside the video"

    const-string v3, "\u5728\u5f71\u7247\u5916\u5074\u6301\u7e8c\u986f\u793a\u64cd\u4f5c\u5217"

    const-string v4, "\u64cd\u4f5c\u90e8\u3092\u52d5\u753b\u306e\u5916\u5074\u306b\u5e38\u6642\u8868\u793a"

    invoke-static {p0, v4, v0, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "Keep the seek bar and player controls visible without covering the picture"

    const-string v3, "\u6301\u7e8c\u986f\u793a\u9032\u5ea6\u8207\u64cd\u4f5c\u5217\uff0c\u4e0d\u906e\u64cb\u5f71\u7247"

    const-string v4, "\u30b7\u30fc\u30af\u30d0\u30fc\u3068\u64cd\u4f5c\u30dc\u30bf\u30f3\u304c\u52d5\u753b\u306b\u91cd\u306a\u3089\u306a\u3044\u3088\u3046\u306b\u8868\u793a\u3057\u307e\u3059"

    invoke-static {p0, v4, v0, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/PlayerControlsDock;->enabled(Landroid/content/Context;)Z

    move-result v0

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    const-string v0, "quality_mode"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-nez v0, :cond_91

    move-object v0, v2

    goto :goto_99

    :cond_91
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    invoke-static {v3, v0}, Le/e/a/DetailSettings;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v0

    :goto_99
    if-nez v0, :cond_9f

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    :cond_9f
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 11
    :cond_a2
    const-string v0, "startup_screen"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_b6

    const-string v1, "\u8d77\u52d5\u6642\u306e\u753b\u9762"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-static {v0}, Le/e/a/Ranking190;->startupSettings(Landroid/preference/Preference;)V

    .line 12
    :cond_b6
    const-string v0, "video_info_follow_button"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-nez v1, :cond_103

    new-instance v1, Landroid/preference/CheckBoxPreference;

    invoke-direct {v1, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    const-string v3, "\u6295\u7a3f\u8005\u306e\u30d5\u30a9\u30ed\u30fc\u30dc\u30bf\u30f3\u3092\u8868\u793a"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v3, "\u52d5\u753b\u60c5\u5831\u306b\u30d5\u30a9\u30ed\u30fc\u30dc\u30bf\u30f3\u3092\u8868\u793a\u3057\u307e\u3059"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v3}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v3, v0, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    const-string v0, "comment_size_percent"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-nez v0, :cond_f2

    goto :goto_fa

    :cond_f2
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    invoke-static {v2, v0}, Le/e/a/DetailSettings;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    :goto_fa
    if-nez v2, :cond_100

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    :cond_100
    invoke-virtual {v2, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 13
    :cond_103
    return-void
.end method

.method private static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 5

    .line 5
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_9

    const/4 p0, 0x0

    return-object p0

    :cond_9
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    if-ne v1, p1, :cond_10

    return-object p0

    :cond_10
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_1d

    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1, p1}, Le/e/a/DetailSettings;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-eqz v1, :cond_1d

    return-object v1

    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
