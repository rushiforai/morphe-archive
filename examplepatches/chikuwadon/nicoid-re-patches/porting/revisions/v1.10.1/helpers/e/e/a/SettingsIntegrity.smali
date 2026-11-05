.class public final Le/e/a/SettingsIntegrity;
.super Ljava/lang/Object;
.source "SettingsIntegrity.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(I)Ljava/lang/String;
    .registers 1

    .line 34
    invoke-static {p0}, Le/e/a/SettingsIntegrity;->limitValue(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static casts(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 5

    .line 19
    const-string v0, "google_cast"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 20
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_d

    check-cast v1, Landroid/preference/PreferenceGroup;

    goto :goto_1d

    .line 21
    :cond_d
    new-instance v1, Landroid/preference/PreferenceCategory;

    invoke-direct {v1, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceCategory;->setKey(Ljava/lang/String;)V

    const-string v0, "Google Cast"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 22
    :goto_1d
    const-string p1, "google_cast_connect"

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-nez v0, :cond_42

    new-instance v0, Landroid/preference/Preference;

    invoke-direct {v0, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string p1, "\u63a5\u7d9a"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string p1, "\u63a5\u7d9a\u3059\u308b\u7aef\u672b\u3092\u9078\u629e"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 23
    :cond_42
    new-instance p1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {p1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.sauzask.nicoid.NicoidChromecastReceiverSelect"

    invoke-virtual {p1, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/preference/Preference;->setIntent(Landroid/content/Intent;)V

    .line 24
    const-string p1, "google_cast_disconnect"

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-nez v0, :cond_77

    new-instance v0, Landroid/preference/Preference;

    invoke-direct {v0, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string p1, "\u63a5\u7d9a\u89e3\u9664"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string p1, "Google Cast \u306e\u63a5\u7d9a\u3092\u89e3\u9664"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 25
    :cond_77
    new-instance p1, Le/e/a/SettingsIntegrity$$ExternalSyntheticLambda2;

    invoke-direct {p1, p0}, Le/e/a/SettingsIntegrity$$ExternalSyntheticLambda2;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, p1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 26
    return-void
.end method

.method private static commentKeys(Landroid/preference/PreferenceGroup;Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/preference/PreferenceGroup;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 40
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_8

    return-void

    :cond_8
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2d

    const-string v3, "comment_"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2a

    const-string v3, "share_ng_level"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2a

    const-string v3, "legacy_comment_limit"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2d

    :cond_2a
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2d
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_36

    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1, p1}, Le/e/a/SettingsIntegrity;->commentKeys(Landroid/preference/PreferenceGroup;Ljava/util/List;)V

    :cond_36
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private static comments(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 7

    .line 28
    const-string v0, "comment_fetch_limit"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 29
    if-nez v1, :cond_e

    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    goto :goto_f

    :cond_e
    move-object v2, v1

    :goto_f
    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u53d6\u5f97\u6570"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 30
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v3, v0, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Le/e/a/SettingsIntegrity;->limitLabel(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 31
    new-instance v0, Le/e/a/SettingsIntegrity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, v3}, Le/e/a/SettingsIntegrity$$ExternalSyntheticLambda1;-><init>(Landroid/preference/PreferenceActivity;Landroid/content/SharedPreferences;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 32
    const-string v0, "comment"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p0

    if-nez v1, :cond_45

    instance-of v0, p0, Landroid/preference/PreferenceGroup;

    if-eqz v0, :cond_42

    move-object p1, p0

    check-cast p1, Landroid/preference/PreferenceGroup;

    :cond_42
    invoke-virtual {p1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 33
    :cond_45
    return-void
.end method

.method public static ensure(Landroid/preference/PreferenceActivity;)V
    .registers 9

    .line 10
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_a

    invoke-static {p0}, Le/e/a/CastSettings219;->apply(Landroid/preference/PreferenceActivity;)V

    return-void

    .line 11
    :cond_a
    const-string v1, "remove_ad_option"

    invoke-static {v0, v1}, Le/e/a/SettingsIntegrity;->remove(Landroid/preference/PreferenceGroup;Ljava/lang/String;)V

    const-string v1, "labs"

    invoke-static {v0, v1}, Le/e/a/SettingsIntegrity;->remove(Landroid/preference/PreferenceGroup;Ljava/lang/String;)V

    invoke-static {p0}, Le/e/a/ThemeChoice;->settings(Landroid/preference/PreferenceActivity;)V

    .line 12
    const-string v1, "play_mode"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 13
    instance-of v3, v2, Landroid/preference/ListPreference;

    const-string v4, "0"

    if-eqz v3, :cond_26

    check-cast v2, Landroid/preference/ListPreference;

    goto :goto_42

    .line 14
    :cond_26
    new-instance v2, Landroid/preference/ListPreference;

    invoke-direct {v2, p0}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Landroid/preference/ListPreference;->setDefaultValue(Ljava/lang/Object;)V

    const-string v3, "setting_whole"

    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    instance-of v5, v3, Landroid/preference/PreferenceGroup;

    if-eqz v5, :cond_3e

    check-cast v3, Landroid/preference/PreferenceGroup;

    goto :goto_3f

    :cond_3e
    move-object v3, v0

    :goto_3f
    invoke-virtual {v3, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 15
    :goto_42
    invoke-static {p0, v0}, Le/e/a/SettingsIntegrity;->comments(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    invoke-static {p0, v0}, Le/e/a/SettingsIntegrity;->casts(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    invoke-static {p0}, Le/e/a/CastControls218;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0, v0}, Le/e/a/SettingsIntegrity;->moveComments(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    .line 16
    const-string v0, "\u518d\u751f\u30e2\u30fc\u30c9"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v0, 0x2

    new-array v3, v0, [Ljava/lang/CharSequence;

    const-string v5, "\u30b9\u30c8\u30ea\u30fc\u30df\u30f3\u30b0"

    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v3, v6

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5"

    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x1

    aput-object v5, v3, v7

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    new-array v0, v0, [Ljava/lang/CharSequence;

    aput-object v4, v0, v6

    const-string v3, "1"

    aput-object v3, v0, v7

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CachePlaybackPolicy;->acquire(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_89

    move-object v4, v3

    :cond_89
    invoke-virtual {v2, v4}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    invoke-static {v0}, Le/e/a/SettingsIntegrity;->modeLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/SettingsIntegrity$$ExternalSyntheticLambda3;

    invoke-direct {v0}, Le/e/a/SettingsIntegrity$$ExternalSyntheticLambda3;-><init>()V

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    invoke-static {p0}, Le/e/a/SettingsIntegrity;->stripSummaries(Landroid/preference/PreferenceActivity;)V

    .line 17
    invoke-static {p0}, Le/e/a/CastSettings219;->apply(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method static synthetic lambda$0(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 3

    .line 16
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    const-string v0, "1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    const/4 p0, 0x0

    return p0

    :cond_16
    move-object v0, p0

    check-cast v0, Landroid/preference/ListPreference;

    invoke-virtual {v0, p1}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    invoke-static {p1}, Le/e/a/SettingsIntegrity;->modeLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 3

    .line 25
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "com.sauzask.nicoid.NicoidChormecastSenderService"

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->stopService(Landroid/content/Intent;)Z

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$2(Landroid/preference/PreferenceActivity;Landroid/content/SharedPreferences;Landroid/preference/Preference;)Z
    .registers 9

    .line 31
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/16 v1, 0x18

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const-string v1, ""

    const/16 v2, 0x12

    invoke-static {p0, v1, v2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/SeekBar;

    invoke-direct {v2, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x14

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setMax(I)V

    const-string v4, "comment_fetch_limit"

    const/4 v5, 0x0

    invoke-interface {p1, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    div-int/lit16 v4, v4, 0x1f4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getProgress()I

    move-result v3

    mul-int/lit16 v3, v3, 0x1f4

    invoke-static {v3}, Le/e/a/SettingsIntegrity;->limitValue(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Le/e/a/SettingsIntegrity$1;

    invoke-direct {v3, v1}, Le/e/a/SettingsIntegrity$1;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p2}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string v0, "OK"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le/e/a/SettingsIntegrity$$ExternalSyntheticLambda0;

    invoke-direct {v1, v2, p1, p2}, Le/e/a/SettingsIntegrity$$ExternalSyntheticLambda0;-><init>(Landroid/widget/SeekBar;Landroid/content/SharedPreferences;Landroid/preference/Preference;)V

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$3(Landroid/widget/SeekBar;Landroid/content/SharedPreferences;Landroid/preference/Preference;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 31
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result p0

    mul-int/lit16 p0, p0, 0x1f4

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p3, "comment_fetch_limit"

    invoke-interface {p1, p3, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p0}, Le/e/a/SettingsIntegrity;->limitLabel(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private static limitLabel(I)Ljava/lang/String;
    .registers 3

    .line 35
    if-nez p0, :cond_9

    const-string p0, "\u6a19\u6e96\uff08\u8ffd\u52a0\u53d6\u5f97\u306a\u3057\uff09"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_2b

    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x2710

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v1, 0x0

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "\u4ef6"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_2b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "\uff1a"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\u6a19\u6e96\u306e\u53d6\u5f97\u7d50\u679c\u306b\u904e\u53bb\u306e\u30b3\u30e1\u30f3\u30c8\u3092\u8ffd\u52a0\u3057\u307e\u3059\u3002\u53d6\u5f97\u53ef\u80fd\u306a\u4ef6\u6570\u306f\u52d5\u753b\u3068\u30b5\u30fc\u30d0\u30fc\u306e\u5fdc\u7b54\u306b\u4f9d\u5b58\u3057\u307e\u3059\u3002"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/SettingsIntegrity;->noFinalStop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static limitValue(I)Ljava/lang/String;
    .registers 3

    .line 34
    if-nez p0, :cond_9

    const-string p0, "\u6a19\u6e96\uff08\u8ffd\u52a0\u53d6\u5f97\u306a\u3057\uff09"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_2b

    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x2710

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v1, 0x0

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "\u4ef6"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_2b
    return-object p0
.end method

.method private static modeLabel(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 36
    invoke-static {p0}, Le/e/a/CachePlaybackPolicy;->acquire(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_9

    const-string p0, "\u30ad\u30e3\u30c3\u30b7\u30e5\uff1a\u901a\u4fe1\u3057\u306a\u304c\u3089\u518d\u751f\u3057\u3001\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u3067\u52d5\u753b\u3092\u4fdd\u5b58\u3057\u307e\u3059\u3002\u53d6\u5f97\u6e08\u307f\u306e\u52d5\u753b\u306f\u4fdd\u5b58\u3057\u305f\u30c7\u30fc\u30bf\u3092\u518d\u5229\u7528\u3057\u307e\u3059\u3002"

    goto :goto_b

    :cond_9
    const-string p0, "\u30b9\u30c8\u30ea\u30fc\u30df\u30f3\u30b0\uff1a\u901a\u4fe1\u3057\u306a\u304c\u3089\u52d5\u753b\u3092\u518d\u751f\u3057\u307e\u3059\u3002\u53d6\u5f97\u6e08\u307f\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u304c\u3042\u308c\u3070\u518d\u5229\u7528\u3057\u307e\u3059\u3002"

    :goto_b
    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/SettingsIntegrity;->noFinalStop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static moveComments(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 24

    .line 39
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "comment"

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-nez v3, :cond_f

    return-void

    :cond_f
    check-cast v2, Landroid/preference/PreferenceGroup;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v1, v3}, Le/e/a/SettingsIntegrity;->commentKeys(Landroid/preference/PreferenceGroup;Ljava/util/List;)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1d
    :goto_1d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_9b

    const-string v20, "comment_cast_min"

    const-string v21, "share_ng_level"

    const-string v6, "comment_fetch_limit"

    const-string v7, "legacy_comment_limit"

    const-string v8, "comment_hide"

    const-string v9, "comment_opacity_percent"

    const-string v10, "comment_alpha"

    const-string v11, "comment_size_percent"

    const-string v12, "comment_size_level"

    const-string v13, "comment_bold"

    const-string v14, "comment_rows"

    const-string v15, "comment_duration_seconds"

    const-string v16, "comment_shadow_tenths"

    const-string v17, "comment_shadow_dp"

    const-string v18, "comment_shadow"

    const-string v19, "comment_fps"

    filled-new-array/range {v6 .. v21}, [Ljava/lang/String;

    move-result-object v5

    const/4 v1, 0x0

    :goto_48
    const/16 v2, 0x10

    if-lt v1, v2, :cond_8b

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/16 v1, 0xc8

    :cond_52
    :goto_52
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_59

    return-void

    :cond_59
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "comment_appearance_editor"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_73

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    if-eqz v4, :cond_52

    const/16 v6, -0xa

    invoke-virtual {v4, v6}, Landroid/preference/Preference;->setOrder(I)V

    goto :goto_52

    :cond_73
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7e

    goto :goto_52

    :cond_7e
    invoke-virtual {v0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    if-eqz v3, :cond_52

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setOrder(I)V

    move v1, v4

    goto :goto_52

    :cond_8b
    aget-object v2, v5, v1

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-eqz v2, :cond_98

    mul-int/lit8 v4, v1, 0xa

    invoke-virtual {v2, v4}, Landroid/preference/Preference;->setOrder(I)V

    :cond_98
    add-int/lit8 v1, v1, 0x1

    goto :goto_48

    :cond_9b
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    if-nez v5, :cond_a9

    goto/16 :goto_1d

    :cond_a9
    invoke-static {v1, v5}, Le/e/a/SettingsTools;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v6

    if-eqz v6, :cond_1d

    if-eq v6, v2, :cond_1d

    invoke-virtual {v6, v5}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    invoke-virtual {v2}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setOrder(I)V

    invoke-virtual {v2, v5}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    goto/16 :goto_1d
.end method

.method static noFinalStop(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 37
    if-nez p0, :cond_4

    const/4 p0, 0x0

    goto :goto_10

    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v0, "[\u3002.]$"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_10
    return-object p0
.end method

.method private static remove(Landroid/preference/PreferenceGroup;Ljava/lang/String;)V
    .registers 5

    .line 41
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_6
    if-gez v0, :cond_9

    return-void

    :cond_9
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_24

    :cond_1b
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_24

    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1, p1}, Le/e/a/SettingsIntegrity;->remove(Landroid/preference/PreferenceGroup;Ljava/lang/String;)V

    :cond_24
    :goto_24
    add-int/lit8 v0, v0, -0x1

    goto :goto_6
.end method

.method public static stripSummaries(Landroid/preference/PreferenceActivity;)V
    .registers 6

    .line 38
    const-string v0, "comment_cast_min"

    const-string v1, "nicoid_share_debug"

    const-string v2, "play_mode"

    const-string v3, "comment_fps"

    const-string v4, "comment_fetch_limit"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_f
    const/4 v2, 0x5

    if-lt v1, v2, :cond_13

    return-void

    :cond_13
    aget-object v2, v0, v1

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-eqz v2, :cond_30

    invoke-virtual {v2}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_30

    invoke-virtual {v2}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le/e/a/SettingsIntegrity;->noFinalStop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_f
.end method
