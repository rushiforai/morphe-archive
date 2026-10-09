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
    .param p0, "preference"    # Landroid/preference/Preference;

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

    .line 17
    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 18
    .local v0, "key":Ljava/lang/String;
    const-string v1, "default_playback_speed"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_35

    const-string v1, "app_switch_playback"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_35

    .line 19
    const-string v1, "back_playback"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_35

    const-string v1, "quality_mode"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    goto :goto_35

    :cond_33
    const/4 v1, 0x0

    goto :goto_36

    :cond_35
    :goto_35
    const/4 v1, 0x1

    .line 20
    .local v1, "selectedEntry":Z
    :goto_36
    if-eqz v1, :cond_3f

    instance-of v2, p0, Landroid/preference/ListPreference;

    if-eqz v2, :cond_3f

    const-string v2, "%s"

    goto :goto_47

    :cond_3f
    invoke-virtual {p0}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Le/e/a/UiText;->text(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    :goto_47
    invoke-virtual {p0, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 21
    instance-of v2, p0, Landroid/preference/ListPreference;

    if-eqz v2, :cond_6c

    .line 22
    move-object v2, p0

    check-cast v2, Landroid/preference/ListPreference;

    .line 23
    .local v2, "list":Landroid/preference/ListPreference;
    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v3

    .line 24
    .local v3, "entries":[Ljava/lang/CharSequence;
    if-eqz v3, :cond_6c

    .line 25
    array-length v4, v3

    new-array v4, v4, [Ljava/lang/CharSequence;

    .line 26
    .local v4, "translated":[Ljava/lang/CharSequence;
    const/4 v5, 0x0

    .local v5, "n":I
    :goto_5b
    array-length v6, v3

    if-ge v5, v6, :cond_69

    aget-object v6, v3, v5

    invoke-static {v6}, Le/e/a/UiText;->text(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v6

    aput-object v6, v4, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_5b

    .line 27
    .end local v5    # "n":I
    :cond_69
    invoke-virtual {v2, v4}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 31
    .end local v2    # "list":Landroid/preference/ListPreference;
    .end local v3    # "entries":[Ljava/lang/CharSequence;
    .end local v4    # "translated":[Ljava/lang/CharSequence;
    :cond_6c
    instance-of v2, p0, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_84

    .line 32
    move-object v2, p0

    check-cast v2, Landroid/preference/PreferenceGroup;

    .line 33
    .local v2, "group":Landroid/preference/PreferenceGroup;
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_74
    invoke-virtual {v2}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v4

    if-ge v3, v4, :cond_84

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v4

    invoke-static {v4}, Le/e/a/UiText;->preferences(Landroid/preference/Preference;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_74

    .line 35
    .end local v2    # "group":Landroid/preference/PreferenceGroup;
    .end local v3    # "n":I
    :cond_84
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
