.class public final Le/e/a/CastSettings219;
.super Ljava/lang/Object;
.source "CastSettings219.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/preference/PreferenceActivity;)V
    .registers 4

    .line 7
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 8
    :cond_7
    const-string v1, "comment_cast_min"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    const-string v2, "google_cast"

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p0

    if-eqz v1, :cond_2e

    .line 9
    instance-of v2, p0, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_2e

    check-cast p0, Landroid/preference/PreferenceGroup;

    invoke-static {v0, v1}, Le/e/a/PlayerGestures219;->findParent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    if-eqz v2, :cond_2e

    if-eq v2, p0, :cond_2e

    invoke-virtual {v2, v1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    const/16 v2, 0x14

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setOrder(I)V

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 10
    :cond_2e
    invoke-static {v0}, Le/e/a/CastSettings219;->labels(Landroid/preference/Preference;)V

    return-void
.end method

.method static labels(Landroid/preference/Preference;)V
    .registers 3

    .line 12
    invoke-virtual {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_15

    invoke-virtual {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CastSettings219;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    :cond_15
    invoke-virtual {p0}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_2a

    invoke-virtual {p0}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CastSettings219;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_2a
    instance-of v0, p0, Landroid/preference/PreferenceGroup;

    if-eqz v0, :cond_42

    check-cast p0, Landroid/preference/PreferenceGroup;

    const/4 v0, 0x0

    :goto_31
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_38

    goto :goto_42

    :cond_38
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    invoke-static {v1}, Le/e/a/CastSettings219;->labels(Landroid/preference/Preference;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_31

    :cond_42
    :goto_42
    return-void
.end method

.method public static text(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    if-nez p0, :cond_4

    const/4 p0, 0x0

    goto :goto_c

    .line 6
    :cond_4
    const-string v0, "\u30ad\u30e3\u30b9\u30c8"

    const-string v1, "Cast"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :goto_c
    return-object p0
.end method
