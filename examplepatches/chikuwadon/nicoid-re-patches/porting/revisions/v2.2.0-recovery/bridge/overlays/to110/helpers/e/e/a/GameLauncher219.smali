.class public final Le/e/a/GameLauncher219;
.super Ljava/lang/Object;
.source "GameLauncher219.java"


# static fields
.field private static final KEY:Ljava/lang/String; = "nicoid_bike_run_unlocked"

.field private static final ROW:Ljava/lang/String; = "nicoid_bike_run_launcher"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ensure(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V
    .registers 7

    .line 19
    if-eqz p1, :cond_3

    const-string v0, "nicoid_bike_run_launcher"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-nez v1, :cond_3

    .line 20
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "nicoid_bike_run_unlocked"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p1}, Landroid/preference/Preference;->getParent()Landroid/preference/PreferenceGroup;

    move-result-object v1

    .line 22
    if-nez v1, :cond_1

    return-void

    .line 23
    :cond_1
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 24
    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 25
    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setPersistent(Z)V

    .line 26
    const-string v0, "Bike Run"

    const-string/jumbo v3, "\u81ea\u884c\u8eca\u8dd1\u9177"

    const-string/jumbo v4, "\u81ea\u8ee2\u8eca\u30e9\u30f3"

    invoke-static {p0, v4, v0, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 27
    const-string v0, "Pedal to the metal! Jump and wheelie your way past trouble and see how far you can ride."

    const-string/jumbo v3, "\u8e29\u4e0b\u8e0f\u677f\uff0c\u51fa\u767c\u56c9\uff01\u8df3\u8e8d\u3001\u7ff9\u524d\u8f2a\uff0c\u95d6\u904e\u91cd\u91cd\u969c\u7919\uff0c\u6311\u6230\u81ea\u5df1\u7684\u6700\u9060\u7d00\u9304\u3002"

    const-string v4, "\u30da\u30c0\u30eb\u3092\u8e0f\u3093\u3067\u3001\u3044\u3056\u51fa\u767a\uff01 \u30b8\u30e3\u30f3\u30d7\u3068\u30a6\u30a3\u30ea\u30fc\u3067\u30d4\u30f3\u30c1\u3092\u5207\u308a\u629c\u3051\u3001\u81ea\u5206\u306e\u6700\u9577\u8a18\u9332\u306b\u6311\u3082\u3046\u3002"

    invoke-static {p0, v4, v0, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 31
    invoke-virtual {p1}, Landroid/preference/Preference;->getOrder()I

    move-result p1

    .line 32
    const v0, 0x7fffffff

    if-ge p1, v0, :cond_2

    .line 33
    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v2, p1}, Landroid/preference/Preference;->setOrder(I)V

    .line 35
    :cond_2
    new-instance p1, Le/e/a/GameLauncher219$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Le/e/a/GameLauncher219$$ExternalSyntheticLambda0;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v2, p1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 39
    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 40
    return-void

    .line 20
    :cond_3
    :goto_0
    return-void
.end method

.method static synthetic lambda$ensure$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 36
    invoke-static {p0}, Le/e/a/BikeRunSelector;->open(Landroid/app/Activity;)V

    .line 37
    const/4 p0, 0x1

    return p0
.end method

.method public static unlock(Landroid/preference/PreferenceActivity;)V
    .registers 4

    .line 13
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "nicoid_bike_run_unlocked"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 14
    const-string v0, "nicoid_patch_version"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/GameLauncher219;->ensure(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V

    .line 15
    invoke-static {p0}, Le/e/a/BikeRunSelector;->open(Landroid/app/Activity;)V

    .line 16
    return-void
.end method
