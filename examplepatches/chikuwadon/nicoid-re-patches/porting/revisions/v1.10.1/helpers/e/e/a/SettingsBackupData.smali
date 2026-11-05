.class final Le/e/a/SettingsBackupData;
.super Ljava/lang/Object;
.source "SettingsBackupData.java"


# static fields
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


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/SettingsBackupData;->TYPES:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/SettingsBackupData;->VALUES:Ljava/util/Map;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static decode(Lorg/json/JSONObject;)Ljava/util/Map;
    .registers 9
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

    .line 8
    const-string v0, "format"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "nicoid-re-settings"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c6

    const-string v0, "version"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1c6

    const-string v0, "settings"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    :cond_26
    :goto_26
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3b

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_33

    return-object v0

    :cond_33
    new-instance p0, Ljava/io/IOException;

    const-string v0, "No matching settings"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3b
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Le/e/a/SettingsBackupData;->portable(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_26

    sget-object v3, Le/e/a/SettingsBackupData;->TYPES:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_50

    goto :goto_26

    :cond_50
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "type"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Le/e/a/SettingsBackupData;->TYPES:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, "value"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1be

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_1ce

    :cond_75
    goto/16 :goto_1b6

    :sswitch_77
    const-string v5, "float"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_75

    instance-of v4, v7, Ljava/lang/Number;

    if-eqz v4, :cond_a1

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    move-object v3, v7

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {v3}, Le/e/a/SettingsBackupData$$ExternalSyntheticBackport0;->m(F)Z

    move-result v3

    if-eqz v3, :cond_9b

    :cond_99
    :goto_99
    goto/16 :goto_1ab

    :cond_9b
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0

    :cond_a1
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Invalid numeric setting"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :sswitch_a9
    const-string v3, "boolean"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_75

    instance-of v3, v7, Ljava/lang/Boolean;

    if-eqz v3, :cond_b6

    goto :goto_99

    :cond_b6
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0

    :sswitch_bc
    const-string v3, "long"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_75

    invoke-static {v7}, Le/e/a/SettingsBackupData;->integer(Ljava/lang/Object;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    goto/16 :goto_1ab

    :sswitch_ce
    const-string v5, "set"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_75

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    const/4 v4, 0x0

    :goto_e0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lt v4, v5, :cond_e7

    goto :goto_99

    :cond_e7
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    instance-of v6, v5, Ljava/lang/String;

    if-eqz v6, :cond_f7

    check-cast v5, Ljava/lang/String;

    invoke-interface {v7, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_e0

    :cond_f7
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0

    :sswitch_fd
    const-string v3, "int"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_75

    invoke-static {v7}, Le/e/a/SettingsBackupData;->integer(Ljava/lang/Object;)J

    move-result-wide v3

    const-wide/32 v5, -0x80000000

    cmp-long v7, v3, v5

    if-ltz v7, :cond_17d

    const-wide/32 v5, 0x7fffffff

    cmp-long v7, v3, v5

    if-gtz v7, :cond_17d

    long-to-int v4, v3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const-string v3, "search_range_"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_149

    move-object v4, v7

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ltz v4, :cond_141

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string v5, "mode"

    invoke-virtual {v2, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_13b

    const/4 v5, 0x3

    goto :goto_13e

    :cond_13b
    const v5, 0x5b8dbb

    :goto_13e
    if-gt v4, v5, :cond_141

    goto :goto_149

    :cond_141
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Invalid search range"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_149
    :goto_149
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_99

    const-string v3, "search_"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_99

    move-object v3, v7

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ltz v3, :cond_175

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const-string v4, "search_Sort"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_16f

    const/16 v4, 0xc

    goto :goto_171

    :cond_16f
    const/16 v4, 0x8

    :goto_171
    if-gt v3, v4, :cond_175

    goto/16 :goto_99

    :cond_175
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Invalid search filter"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_17d
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Integer overflow"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :sswitch_185
    const-string v3, "string"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_75

    instance-of v3, v7, Ljava/lang/String;

    if-eqz v3, :cond_1b0

    sget-object v3, Le/e/a/SettingsBackupData;->VALUES:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    if-eqz v3, :cond_99

    invoke-interface {v3, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a3

    goto/16 :goto_99

    :cond_1a3
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Unsupported setting value"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :goto_1ab
    invoke-interface {v0, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_26

    :cond_1b0
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0

    :goto_1b6
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Unknown setting type"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1be
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Invalid setting type"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1c6
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Unsupported settings file"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :sswitch_data_1ce
    .sparse-switch
        -0x352a9fef -> :sswitch_185
        0x197ef -> :sswitch_fd
        0x1bc62 -> :sswitch_ce
        0x32c67c -> :sswitch_bc
        0x3db6c28 -> :sswitch_a9
        0x5d0225c -> :sswitch_77
    .end sparse-switch
.end method

.method static encode(Ljava/util/Map;)Lorg/json/JSONObject;
    .registers 8
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

    .line 6
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    new-instance v1, Ljava/util/TreeSet;

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_12
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_33

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "format"

    const-string v2, "nicoid-re-settings"

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "version"

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "settings"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    :cond_33
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Le/e/a/SettingsBackupData;->portable(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_12

    sget-object v3, Le/e/a/SettingsBackupData;->TYPES:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_48

    goto :goto_12

    :cond_48
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/lang/Boolean;

    if-eqz v4, :cond_53

    const-string v4, "boolean"

    goto :goto_71

    :cond_53
    instance-of v4, v3, Ljava/lang/Integer;

    if-eqz v4, :cond_5a

    const-string v4, "int"

    goto :goto_71

    :cond_5a
    instance-of v4, v3, Ljava/lang/Long;

    if-eqz v4, :cond_61

    const-string v4, "long"

    goto :goto_71

    :cond_61
    instance-of v4, v3, Ljava/lang/Float;

    if-eqz v4, :cond_68

    const-string v4, "float"

    goto :goto_71

    :cond_68
    instance-of v4, v3, Ljava/util/Set;

    if-eqz v4, :cond_6f

    const-string v4, "set"

    goto :goto_71

    :cond_6f
    const-string v4, "string"

    :goto_71
    instance-of v5, v3, Ljava/util/Set;

    if-eqz v5, :cond_82

    new-instance v5, Lorg/json/JSONArray;

    new-instance v6, Ljava/util/TreeSet;

    check-cast v3, Ljava/util/Set;

    invoke-direct {v6, v3}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    invoke-direct {v5, v6}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    move-object v3, v5

    :cond_82
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "type"

    invoke-virtual {v5, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "value"

    invoke-virtual {v4, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_12
.end method

.method static integer(Ljava/lang/Object;)J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 7
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_1d

    :try_start_4
    new-instance v0, Ljava/math/BigDecimal;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/math/BigDecimal;->longValueExact()J

    move-result-wide v0
    :try_end_11
    .catch Ljava/lang/ArithmeticException; {:try_start_4 .. :try_end_11} :catch_14
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_11} :catch_12

    return-wide v0

    :catch_12
    move-exception p0

    goto :goto_15

    :catch_14
    move-exception p0

    :goto_15
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid integral setting"

    invoke-direct {v0, v1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :cond_1d
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Invalid numeric setting"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static portable(Ljava/lang/String;)Z
    .registers 2

    .line 5
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
