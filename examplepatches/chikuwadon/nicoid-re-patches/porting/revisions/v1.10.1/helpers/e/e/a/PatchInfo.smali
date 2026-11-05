.class public final Le/e/a/PatchInfo;
.super Ljava/lang/Object;
.source "PatchInfo.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ensure(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Landroid/preference/Preference;
    .registers 4

    .line 6
    const-string p1, "nicoid_patch_version"

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 7
    if-nez v0, :cond_2f

    new-instance v0, Landroid/preference/Preference;

    invoke-direct {v0, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string p1, "\u30d1\u30c3\u30c1\u30d0\u30fc\u30b8\u30e7\u30f3"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string p1, "about"

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    instance-of v1, p1, Landroid/preference/PreferenceGroup;

    if-eqz v1, :cond_26

    check-cast p1, Landroid/preference/PreferenceGroup;

    goto :goto_2a

    :cond_26
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object p1

    :goto_2a
    if-eqz p1, :cond_2f

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 8
    :cond_2f
    invoke-static {}, Le/e/a/PatchVersion237;->display()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-object v0
.end method
