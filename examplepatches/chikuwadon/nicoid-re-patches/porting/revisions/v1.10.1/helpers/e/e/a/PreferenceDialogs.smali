.class public final Le/e/a/PreferenceDialogs;
.super Ljava/lang/Object;
.source "PreferenceDialogs.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Landroid/preference/PreferenceActivity;)V
    .registers 1

    .line 6
    invoke-static {p0}, Le/e/a/PlaybackBar221;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PreferenceDialogs;->walk(Landroid/preference/Preference;)V

    return-void
.end method

.method static synthetic lambda$0(Landroid/preference/Preference$OnPreferenceChangeListener;Landroid/preference/ListPreference;Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 4

    if-eqz p0, :cond_a

    .line 9
    invoke-interface {p0, p2, p3}, Landroid/preference/Preference$OnPreferenceChangeListener;->onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    const-string p0, "%s"

    invoke-virtual {p1, p0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Landroid/preference/Preference$OnPreferenceClickListener;Landroid/preference/Preference;)Z
    .registers 3

    if-eqz p0, :cond_a

    .line 10
    invoke-interface {p0, p1}, Landroid/preference/Preference$OnPreferenceClickListener;->onPreferenceClick(Landroid/preference/Preference;)Z

    move-result p0

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    check-cast p1, Landroid/preference/DialogPreference;

    invoke-virtual {p1}, Landroid/preference/DialogPreference;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    instance-of v0, p1, Landroid/app/AlertDialog;

    if-eqz v0, :cond_1a

    check-cast p1, Landroid/app/AlertDialog;

    invoke-static {p1}, Le/e/a/PlaybackSession;->styleDialog(Landroid/app/AlertDialog;)V

    :cond_1a
    return p0
.end method

.method private static walk(Landroid/preference/Preference;)V
    .registers 4

    .line 8
    instance-of v0, p0, Landroid/preference/PreferenceGroup;

    if-eqz v0, :cond_19

    move-object v0, p0

    check-cast v0, Landroid/preference/PreferenceGroup;

    const/4 v1, 0x0

    :goto_8
    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-lt v1, v2, :cond_f

    goto :goto_19

    :cond_f
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    invoke-static {v2}, Le/e/a/PreferenceDialogs;->walk(Landroid/preference/Preference;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 9
    :cond_19
    :goto_19
    instance-of v0, p0, Landroid/preference/ListPreference;

    if-eqz v0, :cond_5c

    const-string v0, "quality_mode"

    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4d

    const-string v0, "mobile_quality_mode"

    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4d

    const-string v0, "app_switch_playback"

    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4d

    const-string v0, "back_playback"

    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    :cond_4d
    move-object v0, p0

    check-cast v0, Landroid/preference/ListPreference;

    invoke-virtual {v0}, Landroid/preference/ListPreference;->getOnPreferenceChangeListener()Landroid/preference/Preference$OnPreferenceChangeListener;

    move-result-object v1

    new-instance v2, Le/e/a/PreferenceDialogs$$ExternalSyntheticLambda2;

    invoke-direct {v2, v1, v0}, Le/e/a/PreferenceDialogs$$ExternalSyntheticLambda2;-><init>(Landroid/preference/Preference$OnPreferenceChangeListener;Landroid/preference/ListPreference;)V

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 10
    :cond_5c
    instance-of v0, p0, Landroid/preference/DialogPreference;

    if-eqz v0, :cond_6c

    invoke-virtual {p0}, Landroid/preference/Preference;->getOnPreferenceClickListener()Landroid/preference/Preference$OnPreferenceClickListener;

    move-result-object v0

    new-instance v1, Le/e/a/PreferenceDialogs$$ExternalSyntheticLambda3;

    invoke-direct {v1, v0}, Le/e/a/PreferenceDialogs$$ExternalSyntheticLambda3;-><init>(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {p0, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    :cond_6c
    return-void
.end method
