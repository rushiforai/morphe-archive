.class final Lapp/yydarlinker/deepseekcaptions/ApiProfiles;
.super Ljava/lang/Object;
.source "ApiProfiles.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;
    }
.end annotation


# static fields
.field static final LEGACY:Ljava/lang/String; = "default"

.field static final LOCK:Ljava/lang/Object;

.field private static final editors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;",
            ">;>;"
        }
    .end annotation
.end field

.field private static flushing:Z

.field private static volatile revision:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 9
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->editors:Ljava/util/List;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static active(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 29
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->index(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "active"

    const-string v2, "default"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :catchall_11
    move-exception p0

    monitor-exit v0
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw p0
.end method

.method static changed(Landroid/content/Context;)V
    .registers 6

    .line 76
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    sget-wide v1, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    sput-wide v1, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision:J

    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_2d

    .line 77
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->liveEditors()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;

    invoke-interface {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;->profileChanged()V

    goto :goto_13

    .line 78
    :cond_23
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->onCredentialsChanged(Landroid/content/Context;)V

    .line 79
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ContextualBatchApiClient;->resetRejection()V

    .line 80
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->refreshConfiguration(Landroid/content/Context;)V

    return-void

    :catchall_2d
    move-exception p0

    .line 76
    :try_start_2e
    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_2d

    throw p0
.end method

.method static clearKey(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    .line 111
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 112
    :try_start_3
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    monitor-exit v0

    return-void

    .line 113
    :cond_f
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->clear(Landroid/content/Context;Ljava/lang/String;)V

    .line 114
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_21

    .line 115
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_20

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->changed(Landroid/content/Context;)V

    :cond_20
    return-void

    :catchall_21
    move-exception p0

    .line 114
    :try_start_22
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_21

    throw p0
.end method

.method static create(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 45
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    if-nez p1, :cond_8

    .line 46
    :try_start_5
    const-string p1, ""

    goto :goto_c

    :cond_8
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    :goto_c
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_8b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x3c

    if-gt v1, v2, :cond_8b

    .line 47
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->size()I

    move-result v1

    const/16 v2, 0x1e

    if-ge v1, v2, :cond_7f

    .line 48
    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->validate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    .line 50
    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->values(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "base_url"

    invoke-interface {v2, v3, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string v2, "model"

    const-string v3, ""

    invoke-interface {p2, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_4b
    .catchall {:try_start_5 .. :try_end_4b} :catchall_97

    .line 51
    :try_start_4b
    new-instance p2, Lorg/json/JSONObject;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->index(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "names"

    const-string v4, "{}"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p2, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->index(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "names"

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_74
    .catch Lorg/json/JSONException; {:try_start_4b .. :try_end_74} :catch_76
    .catchall {:try_start_4b .. :try_end_74} :catchall_97

    .line 53
    :try_start_74
    monitor-exit v0

    return-object v1

    :catch_76
    move-exception p0

    .line 52
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Invalid API profiles"

    invoke-direct {p1, p2, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    .line 47
    :cond_7f
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "profile_limit"

    invoke-static {p0, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 46
    :cond_8b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "profile_name_error"

    invoke-static {p0, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_97
    move-exception p0

    .line 54
    monitor-exit v0
    :try_end_99
    .catchall {:try_start_74 .. :try_end_99} :catchall_97

    throw p0
.end method

.method static delete(Landroid/content/Context;Ljava/lang/String;)V
    .registers 10

    .line 86
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 87
    :try_start_3
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v1

    .line 88
    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_be

    .line 89
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_b2

    .line 90
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 91
    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_c6

    .line 93
    :try_start_1f
    new-instance v4, Lorg/json/JSONObject;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->index(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v6, "names"

    const-string v7, "{}"

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 94
    invoke-virtual {v4, p1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 95
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->index(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "names"

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v5, v6, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 96
    const-string v5, "default"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_52

    const-string v5, "legacy_deleted"

    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    :cond_52
    if-eqz v2, :cond_67

    .line 97
    const-string v3, "active"

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v4, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 98
    :cond_67
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_6a
    .catch Lorg/json/JSONException; {:try_start_1f .. :try_end_6a} :catch_a9
    .catchall {:try_start_1f .. :try_end_6a} :catchall_c6

    .line 100
    :try_start_6a
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->clear(Landroid/content/Context;Ljava/lang/String;)V

    .line 101
    const-string v1, "default"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_93

    .line 103
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->values(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v1, "base_url"

    invoke-interface {p1, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v1, "model"

    invoke-interface {p1, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v1, "prompt"

    invoke-interface {p1, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_a2

    .line 104
    :cond_93
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->values(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 105
    :goto_a2
    monitor-exit v0
    :try_end_a3
    .catchall {:try_start_6a .. :try_end_a3} :catchall_c6

    if-eqz v2, :cond_a8

    .line 107
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->changed(Landroid/content/Context;)V

    :cond_a8
    return-void

    :catch_a9
    move-exception p0

    .line 99
    :try_start_aa
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid API profiles"

    invoke-direct {p1, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    .line 89
    :cond_b2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "profile_keep_one"

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 88
    :cond_be
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unknown API profile"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_c6
    move-exception p0

    .line 105
    monitor-exit v0
    :try_end_c8
    .catchall {:try_start_aa .. :try_end_c8} :catchall_c6

    throw p0
.end method

.method static flushCurrent()Z
    .registers 1

    const/4 v0, 0x0

    .line 58
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushCurrent(Z)Z

    move-result v0

    return v0
.end method

.method private static flushCurrent(Z)Z
    .registers 7

    const/4 v0, 0x1

    .line 61
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushing:Z

    const/4 v1, 0x0

    .line 62
    :try_start_4
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->liveEditors()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_37

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;

    if-eqz p0, :cond_2e

    .line 63
    instance-of v4, v3, Landroid/preference/Preference;

    if-eqz v4, :cond_2e

    const-string v4, "deepseek_caption_api_key"

    move-object v5, v3

    check-cast v5, Landroid/preference/Preference;

    invoke-virtual {v5}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2e

    goto :goto_c

    .line 64
    :cond_2e
    invoke-interface {v3}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;->flushProfile()Z

    move-result v3
    :try_end_32
    .catchall {:try_start_4 .. :try_end_32} :catchall_3a

    if-nez v3, :cond_c

    .line 65
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushing:Z

    return v1

    :cond_37
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushing:Z

    return v0

    :catchall_3a
    move-exception p0

    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushing:Z

    throw p0
.end method

.method static flushExceptKey()Z
    .registers 1

    const/4 v0, 0x1

    .line 59
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushCurrent(Z)Z

    move-result v0

    return v0
.end method

.method static flushing()Z
    .registers 1

    .line 14
    sget-boolean v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushing:Z

    return v0
.end method

.method private static index(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 28
    const-string v0, "caption_api_profiles"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$register$0(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;Ljava/lang/ref/WeakReference;)Z
    .registers 3

    .line 17
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_d

    goto :goto_f

    :cond_d
    const/4 p0, 0x0

    return p0

    :cond_f
    :goto_f
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$unregister$1(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;Ljava/lang/ref/WeakReference;)Z
    .registers 3

    .line 18
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_d

    goto :goto_f

    :cond_d
    const/4 p0, 0x0

    return p0

    :cond_f
    :goto_f
    const/4 p0, 0x1

    return p0
.end method

.method static list(Landroid/content/Context;)Ljava/util/LinkedHashMap;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 32
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 33
    :try_start_3
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->index(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "legacy_deleted"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_20

    const-string v2, "default"

    const-string v3, "profile_default"

    invoke-static {p0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    :cond_20
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->index(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v2, "names"

    const-string v3, "{}"

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_2c
    .catchall {:try_start_3 .. :try_end_2c} :catchall_54

    .line 35
    :try_start_2c
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p0

    :goto_35
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_49

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_48
    .catch Lorg/json/JSONException; {:try_start_2c .. :try_end_48} :catch_4b
    .catchall {:try_start_2c .. :try_end_48} :catchall_54

    goto :goto_35

    .line 37
    :cond_49
    :try_start_49
    monitor-exit v0

    return-object v1

    :catch_4b
    move-exception p0

    .line 36
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Invalid saved API profiles"

    invoke-direct {v1, v2, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catchall_54
    move-exception p0

    .line 38
    monitor-exit v0
    :try_end_56
    .catchall {:try_start_49 .. :try_end_56} :catchall_54

    throw p0
.end method

.method private static liveEditors()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;",
            ">;"
        }
    .end annotation

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v1

    :try_start_8
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->editors:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_e
    :goto_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;

    if-eqz v3, :cond_e

    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->usable(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    :cond_2c
    monitor-exit v1

    return-object v0

    :catchall_2e
    move-exception v0

    monitor-exit v1
    :try_end_30
    .catchall {:try_start_8 .. :try_end_30} :catchall_2e

    throw v0
.end method

.method static register(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V
    .registers 4

    .line 17
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->editors:Ljava/util/List;

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticLambda1;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/List;Ljava/util/function/Predicate;)Z

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_17
    move-exception p0

    monitor-exit v0
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_17

    throw p0
.end method

.method static rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    .line 39
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    if-nez p2, :cond_8

    .line 40
    :try_start_5
    const-string p2, ""

    goto :goto_c

    :cond_8
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    :goto_c
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_60

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x3c

    if-gt v1, v2, :cond_60

    .line 41
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1
    :try_end_22
    .catchall {:try_start_5 .. :try_end_22} :catchall_6c

    if-eqz v1, :cond_58

    .line 42
    :try_start_24
    new-instance v1, Lorg/json/JSONObject;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->index(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "names"

    const-string v4, "{}"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->index(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "names"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_4d
    .catch Lorg/json/JSONException; {:try_start_24 .. :try_end_4d} :catch_4f
    .catchall {:try_start_24 .. :try_end_4d} :catchall_6c

    .line 44
    :try_start_4d
    monitor-exit v0

    return-void

    :catch_4f
    move-exception p0

    .line 43
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Invalid API profiles"

    invoke-direct {p1, p2, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    .line 41
    :cond_58
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unknown API profile"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 40
    :cond_60
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "profile_name_error"

    invoke-static {p0, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_6c
    move-exception p0

    .line 44
    monitor-exit v0
    :try_end_6e
    .catchall {:try_start_4d .. :try_end_6e} :catchall_6c

    throw p0
.end method

.method static revision()J
    .registers 2

    .line 13
    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision:J

    return-wide v0
.end method

.method static select(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 6

    .line 68
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3d

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1a

    monitor-exit v0

    return v2

    :cond_1a
    monitor-exit v0
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_45

    .line 70
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushCurrent()Z

    move-result v1

    if-nez v1, :cond_23

    const/4 p0, 0x0

    return p0

    .line 71
    :cond_23
    monitor-enter v0

    :try_start_24
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->index(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "active"

    invoke-interface {v1, v3, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit v0
    :try_end_36
    .catchall {:try_start_24 .. :try_end_36} :catchall_3a

    .line 72
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->changed(Landroid/content/Context;)V

    return v2

    :catchall_3a
    move-exception p0

    .line 71
    :try_start_3b
    monitor-exit v0
    :try_end_3c
    .catchall {:try_start_3b .. :try_end_3c} :catchall_3a

    throw p0

    .line 68
    :cond_3d
    :try_start_3d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unknown API profile"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_45
    move-exception p0

    monitor-exit v0
    :try_end_47
    .catchall {:try_start_3d .. :try_end_47} :catchall_45

    throw p0
.end method

.method static unregister(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V
    .registers 4

    .line 18
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->editors:Ljava/util/List;

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticLambda2;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/List;Ljava/util/function/Predicate;)Z

    monitor-exit v0

    return-void

    :catchall_f
    move-exception p0

    monitor-exit v0
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw p0
.end method

.method private static usable(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)Z
    .registers 3

    .line 20
    instance-of v0, p0, Landroid/preference/Preference;

    const/4 v1, 0x1

    if-nez v0, :cond_6

    return v1

    .line 21
    :cond_6
    check-cast p0, Landroid/preference/Preference;

    invoke-virtual {p0}, Landroid/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    .line 22
    :goto_c
    instance-of v0, p0, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_31

    .line 23
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_25

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_23

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result p0

    if-nez p0, :cond_23

    return v1

    :cond_23
    const/4 p0, 0x0

    return p0

    .line 24
    :cond_25
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-ne v0, p0, :cond_2f

    goto :goto_31

    :cond_2f
    move-object p0, v0

    goto :goto_c

    :cond_31
    :goto_31
    return v1
.end method

.method static values(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 2

    .line 31
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->values(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static values(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;
    .registers 4

    .line 30
    const-string v0, "default"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string p1, "deepseek_caption_translator"

    goto :goto_19

    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "caption_profile_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_19
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method
