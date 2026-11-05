.class public final Le/e/a/SettingsPlacement233;
.super Ljava/lang/Object;
.source "SettingsPlacement233.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/preference/PreferenceActivity;)V
    .registers 4

    .line 6
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    const-string v0, "double_tap_seek_seconds"

    const/16 v1, 0x96

    const-string v2, "player"

    invoke-static {p0, v0, v2, v1}, Le/e/a/SettingsPlacement233;->move(Landroid/preference/PreferenceActivity;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "popup_double_tap_seek"

    const/16 v1, 0x97

    invoke-static {p0, v0, v2, v1}, Le/e/a/SettingsPlacement233;->move(Landroid/preference/PreferenceActivity;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "gesture_horizontal_seek"

    const/16 v1, 0x98

    invoke-static {p0, v0, v2, v1}, Le/e/a/SettingsPlacement233;->move(Landroid/preference/PreferenceActivity;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "gesture_vertical_options"

    const/16 v1, 0x99

    invoke-static {p0, v0, v2, v1}, Le/e/a/SettingsPlacement233;->move(Landroid/preference/PreferenceActivity;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "google_cast"

    const/16 v1, 0x14

    const-string v2, "comment_cast_min"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsPlacement233;->move(Landroid/preference/PreferenceActivity;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "setting_whole"

    const/16 v1, 0x12c

    const-string v2, "multiple_video_tabs"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsPlacement233;->move(Landroid/preference/PreferenceActivity;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public static finish(Landroid/preference/PreferenceActivity;)V
    .registers 1

    .line 7
    invoke-static {p0}, Le/e/a/HorizontalSeek233;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/SettingsPlacement233;->apply(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method static move(Landroid/preference/PreferenceActivity;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 5

    .line 5
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    invoke-virtual {p0, p2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p0

    if-eqz p1, :cond_26

    instance-of p2, p0, Landroid/preference/PreferenceGroup;

    if-nez p2, :cond_13

    goto :goto_26

    :cond_13
    invoke-static {v0, p1}, Le/e/a/SettingsTools;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object p2

    check-cast p0, Landroid/preference/PreferenceGroup;

    if-eq p2, p0, :cond_23

    if-eqz p2, :cond_20

    invoke-virtual {p2, p1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_20
    invoke-virtual {p0, p1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    :cond_23
    invoke-virtual {p1, p3}, Landroid/preference/Preference;->setOrder(I)V

    :cond_26
    :goto_26
    return-void
.end method
