.class public final Le/e/a/UiText;
.super Ljava/lang/Object;
.source "UiText.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static preferences(Landroid/preference/Preference;)V
    .registers 8

    .line 14
    if-nez p0, :cond_3

    return-void

    .line 15
    :cond_3
    invoke-virtual {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiText;->text(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 18
    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 19
    invoke-virtual {p0}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v1

    .line 20
    const-string v2, "default_playback_speed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_4a

    const-string v2, "app_switch_playback"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4a

    .line 21
    const-string v2, "back_playback"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4a

    const-string v2, "quality_mode"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4a

    .line 22
    const-string v2, "startup_screen"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4a

    const-string v2, "mobile_quality_mode"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4a

    .line 20
    move v0, v3

    goto :goto_4b

    :cond_4a
    move v0, v4

    .line 23
    :goto_4b
    instance-of v2, p0, Landroid/preference/ListPreference;

    if-eqz v2, :cond_67

    .line 24
    move-object v5, p0

    check-cast v5, Landroid/preference/ListPreference;

    invoke-virtual {v5}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v5

    .line 25
    if-eqz v1, :cond_65

    if-eqz v5, :cond_65

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_65

    goto :goto_66

    :cond_65
    move v4, v3

    :goto_66
    or-int/2addr v0, v4

    .line 27
    :cond_67
    if-eqz v0, :cond_6e

    if-eqz v2, :cond_6e

    const-string v0, "%s"

    goto :goto_72

    :cond_6e
    invoke-static {v1}, Le/e/a/UiText;->text(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    :goto_72
    invoke-virtual {p0, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 28
    if-eqz v2, :cond_96

    .line 29
    move-object v0, p0

    check-cast v0, Landroid/preference/ListPreference;

    .line 30
    invoke-virtual {v0}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    .line 31
    if-eqz v1, :cond_96

    .line 32
    array-length v2, v1

    new-array v2, v2, [Ljava/lang/CharSequence;

    .line 33
    move v4, v3

    :goto_84
    array-length v5, v1

    if-lt v4, v5, :cond_8b

    .line 34
    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    goto :goto_96

    .line 33
    :cond_8b
    aget-object v5, v1, v4

    invoke-static {v5}, Le/e/a/UiText;->text(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    aput-object v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_84

    .line 38
    :cond_96
    :goto_96
    instance-of v0, p0, Landroid/preference/PreferenceGroup;

    if-eqz v0, :cond_ae

    .line 39
    check-cast p0, Landroid/preference/PreferenceGroup;

    .line 40
    nop

    :goto_9d
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    if-lt v3, v0, :cond_a4

    goto :goto_ae

    :cond_a4
    invoke-virtual {p0, v3}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiText;->preferences(Landroid/preference/Preference;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_9d

    .line 42
    :cond_ae
    :goto_ae
    return-void
.end method

.method private static text(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "source"    # Ljava/lang/CharSequence;

    .line 11
    if-nez p0, :cond_4

    const/4 v0, 0x0

    goto :goto_c

    :cond_4
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_c
    return-object v0
.end method
