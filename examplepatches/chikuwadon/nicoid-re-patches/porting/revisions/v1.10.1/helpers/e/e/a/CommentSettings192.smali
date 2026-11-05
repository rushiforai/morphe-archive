.class public final Le/e/a/CommentSettings192;
.super Ljava/lang/Object;
.source "CommentSettings192.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentSettings192$Editor;,
        Le/e/a/CommentSettings192$MarkSeek;,
        Le/e/a/CommentSettings192$Preview;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    invoke-static {p0}, Le/e/a/CommentSettings194;->show(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static settings(Landroid/preference/PreferenceActivity;)V
    .registers 13

    .line 5
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    const-string v10, "comment_rows"

    const-string v11, "comment_bold"

    const-string v1, "comment_size_percent"

    const-string v2, "comment_font_weight"

    const-string v3, "comment_size_level"

    const-string v4, "comment_opacity_percent"

    const-string v5, "comment_alpha"

    const-string v6, "comment_shadow_tenths"

    const-string v7, "comment_shadow_dp"

    const-string v8, "comment_shadow"

    const-string v9, "comment_duration_seconds"

    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_22
    const/16 v3, 0xb

    if-lt v2, v3, :cond_67

    const-string v1, "comment_appearance_editor"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-eqz v2, :cond_2f

    return-void

    :cond_2f
    const-string v2, "comment"

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    new-instance v3, Landroid/preference/Preference;

    invoke-direct {v3, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v1, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u8a2d\u5b9a"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v1, "\u30d7\u30ec\u30d3\u30e5\u30fc\u3092\u898b\u306a\u304c\u3089\u6587\u5b57\u3068\u5f71\u3001\u8868\u793a\u6642\u9593\u3001\u6700\u5927\u884c\u6570\u3092\u8abf\u6574\u3057\u307e\u3059"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    const/16 v1, -0xa

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setOrder(I)V

    new-instance v1, Le/e/a/CommentSettings192$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Le/e/a/CommentSettings192$$ExternalSyntheticLambda0;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    instance-of p0, v2, Landroid/preference/PreferenceGroup;

    if-eqz p0, :cond_63

    move-object v0, v2

    check-cast v0, Landroid/preference/PreferenceGroup;

    :cond_63
    invoke-virtual {v0, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void

    :cond_67
    aget-object v3, v1, v2

    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    if-eqz v3, :cond_78

    invoke-static {v0, v3}, Le/e/a/SettingsTools;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v4

    if-eqz v4, :cond_78

    invoke-virtual {v4, v3}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_78
    add-int/lit8 v2, v2, 0x1

    goto :goto_22
.end method
