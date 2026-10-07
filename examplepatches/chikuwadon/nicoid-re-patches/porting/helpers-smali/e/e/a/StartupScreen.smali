.class public final Le/e/a/StartupScreen;
.super Ljava/lang/Object;
.source "StartupScreen.java"


# static fields
.field static final IDS:[Ljava/lang/String;

.field static final LABELS:[Ljava/lang/String;

.field private static registered:Z


# direct methods
.method static constructor <clinit>()V
    .registers 24

    .line 11
    const-string v21, "radio"

    const-string v22, "other"

    const-string v0, "home"

    const-string v1, "shorts"

    const-string v2, "all"

    const-string v3, "game"

    const-string v4, "anime"

    const-string v5, "dshv5do5"

    const-string v6, "wnm2mhv0"

    const-string v7, "entertainment"

    const-string v8, "music_sound"

    const-string v9, "1ya6bnqd"

    const-string v10, "dance"

    const-string v11, "6r5jr8nd"

    const-string v12, "commentary_lecture"

    const-string v13, "cooking"

    const-string v14, "traveling_outdoor"

    const-string v15, "nature"

    const-string v16, "vehicle"

    const-string v17, "technology_craft"

    const-string v18, "animal"

    const-string v19, "sports"

    const-string v20, "society_politics_news"

    filled-new-array/range {v0 .. v22}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/StartupScreen;->IDS:[Ljava/lang/String;

    .line 12
    const-string v22, "\u30e9\u30b8\u30aa"

    const-string v23, "\u305d\u306e\u4ed6"

    const-string v1, "\u30db\u30fc\u30e0"

    const-string v2, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b"

    const-string v3, "\u7dcf\u5408"

    const-string v4, "\u30b2\u30fc\u30e0"

    const-string v5, "\u30a2\u30cb\u30e1"

    const-string v6, "\u30dc\u30ab\u30ed"

    const-string v7, "\u97f3\u58f0\u5408\u6210\u5b9f\u6cc1\u30fb\u89e3\u8aac\u30fb\u5287\u5834"

    const-string v8, "\u30a8\u30f3\u30bf\u30e1"

    const-string v9, "\u97f3\u697d"

    const-string v10, "\u6b4c\u3063\u3066\u307f\u305f"

    const-string v11, "\u8e0a\u3063\u3066\u307f\u305f"

    const-string v12, "\u6f14\u594f\u3057\u3066\u307f\u305f"

    const-string v13, "\u89e3\u8aac\u30fb\u8b1b\u5ea7"

    const-string v14, "\u6599\u7406"

    const-string v15, "\u65c5\u884c\u30fb\u30a2\u30a6\u30c8\u30c9\u30a2"

    const-string v16, "\u81ea\u7136"

    const-string v17, "\u4e57\u308a\u7269"

    const-string v18, "\u6280\u8853\u30fb\u5de5\u4f5c"

    const-string v19, "\u52d5\u7269"

    const-string v20, "\u30b9\u30dd\u30fc\u30c4"

    const-string v21, "\u793e\u4f1a\u30fb\u653f\u6cbb\u30fb\u6642\u4e8b"

    filled-new-array/range {v1 .. v23}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/StartupScreen;->LABELS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static index(Ljava/lang/String;)I
    .registers 4

    .line 25
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    sget-object v2, Le/e/a/StartupScreen;->IDS:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_15

    sget-object v2, Le/e/a/StartupScreen;->IDS:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    return v1

    :cond_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_15
    return v0
.end method

.method static open(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 7

    .line 20
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 21
    :cond_7
    const-string v0, "shorts"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "android.intent.action.VIEW"

    if-eqz v0, :cond_23

    new-instance p1, Landroid/content/Intent;

    const-string v0, "nicoid-re://shorts"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p1, v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v0, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    goto :goto_73

    .line 22
    :cond_23
    invoke-static {p1}, Le/e/a/StartupScreen;->index(Ljava/lang/String;)I

    move-result v0

    const/4 v2, 0x2

    if-ge v0, v2, :cond_2b

    return-void

    :cond_2b
    new-instance v2, Landroid/content/Intent;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://sp.nicovideo.jp/api/ranking/genre/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, "?term=24h"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v2, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {v2, p0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v1, "type"

    const/4 v2, 0x6

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    sget-object v2, Le/e/a/StartupScreen;->LABELS:[Ljava/lang/String;

    aget-object v0, v2, v0

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "name"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "subtitle"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    :goto_73
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 24
    return-void
.end method

.method public static register(Landroid/app/Activity;)V
    .registers 2

    .line 13
    sget-boolean v0, Le/e/a/StartupScreen;->registered:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/StartupScreen;->registered:Z

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    new-instance v0, Le/e/a/StartupScreen$1;

    invoke-direct {v0}, Le/e/a/StartupScreen$1;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 19
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 8

    .line 26
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    const-string v0, "startup_screen"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    new-instance v2, Landroid/preference/ListPreference;

    invoke-direct {v2, p0}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    const-string p0, "\u8d77\u52d5\u6642\u306e\u753b\u9762"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setTitle(Ljava/lang/CharSequence;)V

    sget-object p0, Le/e/a/StartupScreen;->LABELS:[Ljava/lang/String;

    array-length p0, p0

    new-array v0, p0, [Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_25
    if-ge v4, p0, :cond_5d

    const/4 v5, 0x2

    if-ge v4, v5, :cond_33

    sget-object v5, Le/e/a/StartupScreen;->LABELS:[Ljava/lang/String;

    aget-object v5, v5, v4

    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_58

    :cond_33
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Le/e/a/StartupScreen;->LABELS:[Ljava/lang/String;

    aget-object v6, v6, v4

    invoke-static {v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " / "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    invoke-static {v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_58
    aput-object v5, v0, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_25

    :cond_5d
    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    sget-object p0, Le/e/a/StartupScreen;->IDS:[Ljava/lang/String;

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    const-string p0, "home"

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setDefaultValue(Ljava/lang/Object;)V

    const-string p0, "%s"

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setOrder(I)V

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method
