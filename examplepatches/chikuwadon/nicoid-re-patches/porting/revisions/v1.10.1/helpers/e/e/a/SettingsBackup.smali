.class public final Le/e/a/SettingsBackup;
.super Ljava/lang/Object;
.source "SettingsBackup.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SettingsBackup$Picker;
    }
.end annotation


# static fields
.field static final MAIN:Landroid/os/Handler;

.field static final TYPES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final VALUES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/SettingsBackup;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/SettingsBackup;->MAIN:Landroid/os/Handler;

    .line 6
    sget-object v0, Le/e/a/SettingsBackupData;->TYPES:Ljava/util/Map;

    sput-object v0, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    sget-object v0, Le/e/a/SettingsBackupData;->VALUES:Ljava/util/Map;

    sput-object v0, Le/e/a/SettingsBackup;->VALUES:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static apply(Landroid/content/SharedPreferences;Ljava/util/Map;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .line 15
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_17

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p0

    return p0

    :cond_17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Ljava/lang/Boolean;

    if-eqz v2, :cond_35

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_c

    :cond_35
    instance-of v2, v0, Ljava/lang/Integer;

    if-eqz v2, :cond_43

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_c

    :cond_43
    instance-of v2, v0, Ljava/lang/Long;

    if-eqz v2, :cond_51

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {p0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto :goto_c

    :cond_51
    instance-of v2, v0, Ljava/lang/Float;

    if-eqz v2, :cond_5f

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    goto :goto_c

    :cond_5f
    instance-of v2, v0, Ljava/util/Set;

    if-eqz v2, :cond_69

    check-cast v0, Ljava/util/Set;

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    goto :goto_c

    :cond_69
    check-cast v0, Ljava/lang/String;

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_c
.end method

.method static collect(Landroid/preference/PreferenceGroup;)V
    .registers 9

    .line 9
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-lt v1, v2, :cond_9

    return-void

    :cond_9
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_17

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2}, Le/e/a/SettingsBackup;->collect(Landroid/preference/PreferenceGroup;)V

    goto :goto_64

    :cond_17
    invoke-virtual {v2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le/e/a/SettingsBackup;->portable(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_64

    const-string v4, "nicoid_backup"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2a

    goto :goto_64

    :cond_2a
    sget-object v4, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    instance-of v5, v2, Landroid/preference/TwoStatePreference;

    if-eqz v5, :cond_33

    const-string v5, "boolean"

    goto :goto_3c

    :cond_33
    instance-of v5, v2, Landroid/preference/MultiSelectListPreference;

    if-eqz v5, :cond_3a

    const-string v5, "set"

    goto :goto_3c

    :cond_3a
    const-string v5, "string"

    :goto_3c
    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    instance-of v4, v2, Landroid/preference/ListPreference;

    if-eqz v4, :cond_64

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    check-cast v2, Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v2

    array-length v5, v2

    const/4 v6, 0x0

    :goto_50
    if-lt v6, v5, :cond_58

    sget-object v2, Le/e/a/SettingsBackup;->VALUES:Ljava/util/Map;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_64

    :cond_58
    aget-object v7, v2, v6

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_50

    :cond_64
    :goto_64
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method static decode(Lorg/json/JSONObject;)Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    invoke-static {p0}, Le/e/a/SettingsBackupData;->decode(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method static encode(Ljava/util/Map;)Lorg/json/JSONObject;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 12
    invoke-static {p0}, Le/e/a/SettingsBackupData;->encode(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 10

    .line 10
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-eqz v0, :cond_c5

    const-string v1, "nicoid_backup"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-eqz v2, :cond_10

    goto/16 :goto_c5

    :cond_10
    const-string v2, "nicoid_backup_placeholder"

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-nez v2, :cond_1e

    const-string v2, "labs"

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    :cond_1e
    if-nez v2, :cond_25

    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v3

    goto :goto_29

    :cond_25
    invoke-virtual {v2}, Landroid/preference/Preference;->getOrder()I

    move-result v3

    :goto_29
    if-eqz v2, :cond_34

    invoke-static {v0, v2}, Le/e/a/SettingsTools;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v4

    if-eqz v4, :cond_34

    invoke-virtual {v4, v2}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_34
    new-instance v2, Landroid/preference/PreferenceCategory;

    invoke-direct {v2, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/preference/PreferenceCategory;->setKey(Ljava/lang/String;)V

    const-string v1, "Settings backup"

    const-string v4, "\u8a2d\u5b9a\u5099\u4efd"

    const-string v5, "\u8a2d\u5b9a\u306e\u30d0\u30c3\u30af\u30a2\u30c3\u30d7"

    invoke-static {p0, v5, v1, v4}, Le/e/a/SettingsBackup;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceCategory;->setOrder(I)V

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    const/4 v1, 0x0

    const/4 v3, 0x0

    :goto_51
    const/4 v4, 0x2

    if-lt v3, v4, :cond_87

    invoke-static {v0}, Le/e/a/SettingsBackup;->collect(Landroid/preference/PreferenceGroup;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_6b
    :goto_6b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_75

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    :cond_75
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const-string v0, "labs_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6b

    invoke-interface {v4, p0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_6b

    :cond_87
    if-nez v3, :cond_8b

    const/4 v4, 0x1

    goto :goto_8c

    :cond_8b
    const/4 v4, 0x0

    :goto_8c
    new-instance v5, Landroid/preference/Preference;

    invoke-direct {v5, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    if-eqz v4, :cond_96

    const-string v6, "nicoid_backup_export"

    goto :goto_98

    :cond_96
    const-string v6, "nicoid_backup_import"

    :goto_98
    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    if-eqz v4, :cond_a0

    const-string v6, "\u8a2d\u5b9a\u3092\u30a8\u30af\u30b9\u30dd\u30fc\u30c8"

    goto :goto_a2

    :cond_a0
    const-string v6, "\u8a2d\u5b9a\u3092\u30a4\u30f3\u30dd\u30fc\u30c8"

    :goto_a2
    if-eqz v4, :cond_a7

    const-string v7, "Export settings"

    goto :goto_a9

    :cond_a7
    const-string v7, "Import settings"

    :goto_a9
    if-eqz v4, :cond_ae

    const-string v8, "\u532f\u51fa\u8a2d\u5b9a"

    goto :goto_b0

    :cond_ae
    const-string v8, "\u532f\u5165\u8a2d\u5b9a"

    :goto_b0
    invoke-static {p0, v6, v7, v8}, Le/e/a/SettingsBackup;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    new-instance v6, Le/e/a/SettingsBackup$$ExternalSyntheticLambda0;

    invoke-direct {v6, v0, p0, v4}, Le/e/a/SettingsBackup$$ExternalSyntheticLambda0;-><init>(Landroid/preference/PreferenceGroup;Landroid/preference/PreferenceActivity;Z)V

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v2, v5}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_51

    :cond_c5
    :goto_c5
    return-void
.end method

.method static known(Landroid/content/SharedPreferences;)V
    .registers 12

    .line 14
    sget-object v0, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    const-string v1, "popup_double_tap_seek"

    const-string v2, "boolean"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/CommentAppearance192;->KEYS:[Ljava/lang/String;

    array-length v1, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_e
    const-string v5, "int"

    if-lt v4, v1, :cond_103

    sget-object v0, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    const-string v1, "comment_shadow"

    const-string v6, "string"

    invoke-interface {v0, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    const-string v1, "player_controls_visibility_mode"

    invoke-interface {v0, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/SettingsBackup;->VALUES:Ljava/util/Map;

    new-instance v4, Ljava/util/HashSet;

    const-string v7, "popup"

    const-string v8, "both"

    const-string v9, "off"

    const-string v10, "normal"

    filled-new-array {v9, v10, v7, v8}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v4, v7}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    const-string v1, "player_button_order_v1"

    invoke-interface {v0, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    const-string v1, "player_buttons_hidden_v1"

    const-string v7, "set"

    invoke-interface {v0, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "search_range_from"

    const-string v1, "search_range_to"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v8

    const/4 v0, 0x0

    :goto_55
    const-string v1, "long"

    const/4 v4, 0x2

    if-lt v0, v4, :cond_f8

    const-string v0, "search_range_max"

    const-string v4, "search_range_mode"

    const-string v8, "search_range_min"

    filled-new-array {v8, v0, v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v0, 0x0

    :goto_65
    const/4 v8, 0x3

    if-lt v0, v8, :cond_ed

    const-string v0, "search_Date"

    const-string v4, "search_Sort"

    const-string v9, "search_Time"

    filled-new-array {v9, v0, v4}, [Ljava/lang/String;

    move-result-object v9

    const/4 v0, 0x0

    :goto_73
    if-lt v0, v8, :cond_e3

    const-string v0, "nicoid_content_keywords"

    const-string v4, "nicoid_content_channels"

    const-string v8, "nicoid_content_filter_rules"

    const-string v9, "nicoid_content_rules_v2"

    filled-new-array {v8, v9, v0, v4}, [Ljava/lang/String;

    move-result-object v4

    :goto_81
    const/4 v0, 0x4

    if-lt v3, v0, :cond_d9

    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_90
    :goto_90
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_97

    return-void

    :cond_97
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map$Entry;

    sget-object v3, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_90

    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    instance-of v8, v3, Ljava/lang/Boolean;

    if-eqz v8, :cond_bb

    move-object v3, v2

    goto :goto_d5

    :cond_bb
    instance-of v8, v3, Ljava/lang/Integer;

    if-eqz v8, :cond_c1

    move-object v3, v5

    goto :goto_d5

    :cond_c1
    instance-of v8, v3, Ljava/lang/Long;

    if-eqz v8, :cond_c7

    move-object v3, v1

    goto :goto_d5

    :cond_c7
    instance-of v8, v3, Ljava/lang/Float;

    if-eqz v8, :cond_ce

    const-string v3, "float"

    goto :goto_d5

    :cond_ce
    instance-of v3, v3, Ljava/util/Set;

    if-eqz v3, :cond_d4

    move-object v3, v7

    goto :goto_d5

    :cond_d4
    move-object v3, v6

    :goto_d5
    invoke-interface {v4, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_90

    :cond_d9
    aget-object v0, v4, v3

    sget-object v8, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    invoke-interface {v8, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_81

    :cond_e3
    aget-object v4, v9, v0

    sget-object v10, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    invoke-interface {v10, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_73

    :cond_ed
    aget-object v8, v4, v0

    sget-object v9, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    invoke-interface {v9, v8, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_65

    :cond_f8
    aget-object v4, v8, v0

    sget-object v9, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    invoke-interface {v9, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_55

    :cond_103
    aget-object v6, v0, v4

    sget-object v7, Le/e/a/SettingsBackup;->TYPES:Ljava/util/Map;

    invoke-interface {v7, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_e
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceGroup;Landroid/preference/PreferenceActivity;ZLandroid/preference/Preference;)Z
    .registers 4

    .line 10
    invoke-static {p0}, Le/e/a/SettingsBackup;->collect(Landroid/preference/PreferenceGroup;)V

    invoke-static {p1, p2}, Le/e/a/SettingsBackup;->pick(Landroid/app/Activity;Z)V

    const/4 p0, 0x1

    return p0
.end method

.method static pick(Landroid/app/Activity;Z)V
    .registers 6

    .line 11
    const-string v0, "settings-backup"

    :try_start_2
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v2

    check-cast v2, Le/e/a/SettingsBackup$Picker;

    if-nez v2, :cond_21

    new-instance v2, Le/e/a/SettingsBackup$Picker;

    invoke-direct {v2}, Le/e/a/SettingsBackup$Picker;-><init>()V

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    invoke-virtual {v1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_21
    invoke-virtual {v2, p1}, Le/e/a/SettingsBackup$Picker;->pick(Z)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_24} :catch_25

    goto :goto_38

    :catch_25
    move-exception p1

    const-string p1, "Unable to open file picker"

    const-string v0, "\u7121\u6cd5\u958b\u555f\u6a94\u6848\u9078\u64c7\u5668"

    const-string v1, "\u30d5\u30a1\u30a4\u30eb\u9078\u629e\u753b\u9762\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, v1, p1, v0}, Le/e/a/SettingsBackup;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_38
    return-void
.end method

.method static portable(Ljava/lang/String;)Z
    .registers 2

    .line 8
    if-eqz p0, :cond_c

    const-string v0, "(?i).*(cookie|session|password|token|auth).*|cache_tree.*|cache_dir|nologin|user_id|login_.*|save_.*|labs_.*|nicoid_patch_version|nicoid_share_debug"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 7
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
