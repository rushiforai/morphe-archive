.class public final Le/e/a/StartupTabs120;
.super Ljava/lang/Object;
.source "StartupTabs120.java"


# static fields
.field private static final TABS:Ljava/lang/String; = "saved-tabs"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static intent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .registers 6

    .line 29
    const-string v0, "saved-tabs"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    invoke-static {p0, p1}, Le/e/a/Ranking190;->startupIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    .line 30
    :cond_d
    instance-of p1, p0, Landroid/app/Activity;

    const/4 v0, 0x0

    if-nez p1, :cond_13

    return-object v0

    .line 31
    :cond_13
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 32
    const-string v1, "multiple_video_tabs"

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_21

    return-object v0

    .line 33
    :cond_21
    new-instance v1, Le/e/a/SavedTabs227;

    const-string v2, "nicoid_video_tabs_v1"

    const-string v3, "{}"

    invoke-interface {p1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Le/e/a/SavedTabs227;-><init>(Ljava/lang/String;)V

    .line 34
    iget-object p1, v1, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {v1, p1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object p1

    .line 35
    if-nez p1, :cond_37

    goto :goto_3d

    :cond_37
    check-cast p0, Landroid/app/Activity;

    invoke-static {p0, p1}, Le/e/a/TabRoutes228;->intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;

    move-result-object v0

    :goto_3d
    return-object v0
.end method

.method public static settings(Landroid/preference/Preference;)V
    .registers 7

    .line 16
    instance-of v0, p0, Landroid/preference/ListPreference;

    if-nez v0, :cond_5

    return-void

    .line 17
    :cond_5
    check-cast p0, Landroid/preference/ListPreference;

    .line 18
    invoke-virtual {p0}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_63

    invoke-virtual {p0}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_14

    goto :goto_63

    .line 19
    :cond_14
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 20
    const-string v1, "saved-tabs"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    return-void

    .line 21
    :cond_2a
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p0}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 22
    const/4 v5, 0x0

    invoke-virtual {v0, v5, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 23
    invoke-virtual {p0}, Landroid/preference/ListPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v3, "Last opened tab"

    const-string v4, "\u4e0a\u6b21\u958b\u555f\u7684\u5206\u9801"

    const-string v5, "\u6700\u5f8c\u306b\u958b\u3044\u305f\u30bf\u30d6"

    invoke-static {v1, v5, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 24
    new-array v3, v3, [Ljava/lang/CharSequence;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 25
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    return-void

    .line 26
    return-void

    .line 18
    :cond_63
    :goto_63
    return-void
.end method
