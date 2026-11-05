.class public final Le/e/a/ContentFilter;
.super Ljava/lang/Object;
.source "ContentFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ContentFilter$Rules;
    }
.end annotation


# static fields
.field private static final CHANNELS:Ljava/lang/String; = "nicoid_content_channels"

.field private static final KEY:Ljava/lang/String; = "nicoid_content_keywords"

.field private static final STORE:Ljava/lang/String; = "nicoid_content_rules_v2"

.field private static volatile compiled:Le/e/a/ContentFilter$Rules;

.field private static volatile rowOwner:Ljava/lang/reflect/Field;

.field private static volatile rowValue:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static blocked(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 3

    .line 13
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/ContentFilter;->blocked(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static blocked(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3

    .line 13
    invoke-static {p0}, Le/e/a/ContentFilter;->rules(Landroid/content/Context;)Le/e/a/ContentFilter$Rules;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Le/e/a/ContentFilter$Rules;->blocked(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static category(Landroid/content/Context;I)Ljava/lang/String;
    .registers 4

    .line 14
    if-nez p1, :cond_9

    const-string p1, "Video titles"

    const-string v0, "\u5f71\u7247\u6a19\u984c"

    const-string v1, "\u52d5\u753b\u30bf\u30a4\u30c8\u30eb"

    goto :goto_f

    :cond_9
    const-string p1, "Uploaders / channels"

    const-string v0, "\u6295\u7a3f\u8005\uff0f\u983b\u9053\u540d\u7a31"

    const-string v1, "\u6295\u7a3f\u8005\u30fb\u30c1\u30e3\u30f3\u30cd\u30eb\u540d"

    :goto_f
    invoke-static {p0, v1, p1, v0}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static confirmOwner(Landroid/content/Context;Ljava/lang/String;)V
    .registers 12

    .line 10
    const/4 v0, 0x0

    if-eqz p1, :cond_8b

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_f

    goto/16 :goto_8b

    :cond_f
    invoke-static {p0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    instance-of v2, v1, Landroid/app/Activity;

    if-nez v2, :cond_18

    return-void

    :cond_18
    invoke-static {p0}, Le/e/a/ContentFilter;->stored(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v2

    :goto_1c
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    const-string v4, "mode"

    const-string v5, "exact"

    const-string v6, "value"

    const-string v7, "category"

    const/4 v8, 0x1

    if-lt v0, v3, :cond_2d

    const/4 v0, 0x0

    goto :goto_4e

    :cond_2d
    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_88

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    if-ne v9, v8, :cond_88

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_88

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_88

    move-object v0, v3

    :goto_4e
    if-nez v0, :cond_74

    :try_start_50
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v6, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "enabled"

    invoke-virtual {p1, v0, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {p1, v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_74
    check-cast v1, Landroid/app/Activity;

    new-instance p1, Le/e/a/ContentFilter$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0}, Le/e/a/ContentFilter$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2, v0, v8, p1}, Le/e/a/FilterUi110;->edit(Landroid/app/Activity;Lorg/json/JSONArray;Lorg/json/JSONObject;ILjava/lang/Runnable;)V
    :try_end_7e
    .catch Lorg/json/JSONException; {:try_start_50 .. :try_end_7e} :catch_7f

    goto :goto_87

    :catch_7f
    move-exception p0

    const-string p1, "nicoid-filter"

    const-string v0, "Unable to prepare rule editor"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_87
    return-void

    :cond_88
    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    :cond_8b
    :goto_8b
    const-string p1, "Uploader name unavailable"

    const-string v1, "\u7121\u6cd5\u53d6\u5f97\u6295\u7a3f\u8005\u540d\u7a31"

    const-string v2, "\u6295\u7a3f\u8005\u540d\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, v2, p1, v1}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static filter(Ljava/lang/Object;)V
    .registers 1

    invoke-static {p0}, Le/e/a/ContentFilterId193;->filter(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 6
    invoke-static {p0}, Le/e/a/ContentFilter;->list(Landroid/preference/PreferenceActivity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Landroid/content/Context;)V
    .registers 4

    .line 10
    const-string v0, "Saved to NG list"

    const-string v1, "\u5df2\u5132\u5b58\u81f3 NG \u6e05\u55ae"

    const-string v2, "NG\u30ea\u30b9\u30c8\u306b\u4fdd\u5b58\u3057\u307e\u3057\u305f"

    invoke-static {p0, v2, v0, v1}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private static list(Landroid/preference/PreferenceActivity;)V
    .registers 1

    .line 16
    invoke-static {p0}, Le/e/a/FilterUi110;->show(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method private static mode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 15
    const-string v0, "regex"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const-string p1, "Regular expression"

    const-string v0, "\u6b63\u898f\u8868\u793a\u5f0f"

    const-string v1, "\u6b63\u898f\u8868\u73fe"

    :goto_e
    invoke-static {p0, v1, p1, v0}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_29

    :cond_13
    const-string v0, "exact"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_22

    const-string p1, "Exact match"

    const-string v0, "\u5b8c\u5168\u76f8\u7b26"

    const-string v1, "\u5b8c\u5168\u4e00\u81f4"

    goto :goto_e

    :cond_22
    const-string p1, "Partial match"

    const-string v0, "\u90e8\u5206\u76f8\u7b26"

    const-string v1, "\u90e8\u5206\u4e00\u81f4"

    goto :goto_e

    :goto_29
    return-object p0
.end method

.method public static owner(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 10

    .line 21
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    .line 22
    :cond_5
    invoke-static {p0}, Le/e/a/ContentFilterId193;->remember(Lorg/json/JSONObject;)V

    invoke-static {p0}, Le/e/a/PaidVideos;->remember(Lorg/json/JSONObject;)V

    .line 23
    const-string v1, "user"

    const-string v2, "channel"

    const-string v3, "owner"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_17
    const/4 v4, 0x3

    if-lt v3, v4, :cond_2d

    .line 33
    const-string v1, "ownerName"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2c

    const-string v1, "uploaderName"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_2c
    return-object v1

    .line 23
    :cond_2d
    aget-object v4, v1, v3

    .line 24
    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 25
    if-nez v4, :cond_36

    goto :goto_4d

    .line 26
    :cond_36
    const-string v5, "nickname"

    const-string v6, "name"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    :goto_3f
    const/4 v7, 0x2

    if-lt v6, v7, :cond_50

    .line 30
    invoke-static {v4}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v4

    .line 31
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_4d

    return-object v4

    .line 23
    :cond_4d
    :goto_4d
    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    .line 26
    :cond_50
    aget-object v7, v5, v6

    .line 27
    invoke-virtual {v4, v7, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 28
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_5d

    return-object v7

    .line 26
    :cond_5d
    add-int/lit8 v6, v6, 0x1

    goto :goto_3f
.end method

.method public static rememberHistory(Lorg/json/JSONObject;)V
    .registers 6

    invoke-static {p0}, Le/e/a/HistoryLimit120;->remember(Lorg/json/JSONObject;)V

    .line 37
    const-string v0, "registeredAt"

    invoke-static {p0}, Le/e/a/ContentFilterId193;->history(Lorg/json/JSONObject;)V

    invoke-static {p0}, Le/e/a/HistorySupport;->enrichCached(Lorg/json/JSONObject;)V

    .line 39
    :try_start_b
    const-string v1, "e.e.a.ModernPlayback"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "latestWatch"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 40
    if-nez v1, :cond_21

    :goto_20
    goto :goto_28

    :cond_21
    const-string v2, "video"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    goto :goto_20

    .line 41
    :goto_28
    if-eqz v2, :cond_7b

    const-string v3, "videourl"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "id"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Le/e/a/HistoryRules;->same(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7b

    .line 42
    const-string v3, "isPaymentRequired"

    invoke-static {v1}, Le/e/a/PaidVideos;->watchRequired(Lorg/json/JSONObject;)Z

    move-result v4

    invoke-virtual {p0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 43
    invoke-static {p0}, Le/e/a/ContentFilterId193;->remember(Lorg/json/JSONObject;)V

    invoke-static {p0}, Le/e/a/PaidVideos;->remember(Lorg/json/JSONObject;)V

    .line 44
    invoke-static {v1}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5a

    const-string v3, "ownerName"

    invoke-virtual {p0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 46
    :cond_5a
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_69

    const-string v1, "postedAt"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    :cond_69
    const-string v0, "count"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_7b

    const-string v1, "videoCounts"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_76
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_b .. :try_end_76} :catch_79
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_76} :catch_77

    goto :goto_7a

    .line 49
    :catch_77
    move-exception p0

    goto :goto_7a

    :catch_79
    move-exception p0

    :goto_7a
    nop

    .line 50
    :cond_7b
    return-void
.end method

.method public static restoreHistory(Ljava/lang/Object;Lorg/json/JSONObject;)V
    .registers 4

    .line 52
    invoke-static {p1}, Le/e/a/PaidVideos;->remember(Lorg/json/JSONObject;)V

    .line 53
    invoke-static {p0, p1}, Le/e/a/HistorySupport;->captureLocal(Ljava/lang/Object;Lorg/json/JSONObject;)V

    .line 54
    :try_start_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "y"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-static {p1}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_17
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_6 .. :try_end_17} :catch_18

    .line 56
    return-void

    .line 55
    :catch_18
    move-exception p0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Unsupported history row"

    invoke-direct {p1, v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static rules(Landroid/content/Context;)Le/e/a/ContentFilter$Rules;
    .registers 4

    .line 12
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "nicoid_content_rules_v2"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_13

    const-string p0, "[]"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1b

    :cond_13
    invoke-static {p0}, Le/e/a/ContentFilter;->stored(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_1b
    sget-object v0, Le/e/a/ContentFilter;->compiled:Le/e/a/ContentFilter$Rules;

    if-eqz v0, :cond_28

    iget-object v1, v0, Le/e/a/ContentFilter$Rules;->snapshot:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_28

    return-object v0

    :cond_28
    new-instance v0, Le/e/a/ContentFilter$Rules;

    invoke-direct {v0, p0}, Le/e/a/ContentFilter$Rules;-><init>(Ljava/lang/String;)V

    sput-object v0, Le/e/a/ContentFilter;->compiled:Le/e/a/ContentFilter$Rules;

    return-object v0
.end method

.method static save(Landroid/content/Context;Lorg/json/JSONArray;)V
    .registers 3

    .line 8
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "nicoid_content_rules_v2"

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 p0, 0x0

    sput-object p0, Le/e/a/ContentFilter;->compiled:Le/e/a/ContentFilter$Rules;

    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 7

    .line 6
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    const-string v1, "nicoid_content_filter"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/PreferenceCategory;

    if-nez v2, :cond_47

    new-instance v3, Landroid/preference/PreferenceCategory;

    invoke-direct {v3, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v1}, Landroid/preference/PreferenceCategory;->setKey(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_1b
    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v4

    if-lt v2, v4, :cond_2d

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v3, v1}, Landroid/preference/PreferenceCategory;->setOrder(I)V

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    move-object v2, v3

    goto :goto_47

    :cond_2d
    invoke-virtual {v0, v2}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v4

    mul-int/lit8 v5, v2, 0x2

    invoke-virtual {v4, v5}, Landroid/preference/Preference;->setOrder(I)V

    const-string v5, "comment"

    invoke-virtual {v4}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_44

    add-int/lit8 v1, v2, 0x1

    :cond_44
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    :cond_47
    :goto_47
    const-string v0, "Other"

    const-string v1, "\u5176\u4ed6"

    const-string v3, "\u305d\u306e\u4ed6"

    invoke-static {p0, v3, v0, v1}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "nicoid_filter_list"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-nez v1, :cond_a2

    new-instance v1, Landroid/preference/Preference;

    invoke-direct {v1, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v0, "Content filter"

    const-string v3, "\u5167\u5bb9\u7be9\u9078"

    const-string v4, "\u30b3\u30f3\u30c6\u30f3\u30c4\u30d5\u30a3\u30eb\u30bf\u30fc"

    invoke-static {p0, v4, v0, v3}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/ContentFilter;->stored(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " rules: hide videos matching registered conditions"

    const-string v4, "\u9805\uff1a\u96b1\u85cf\u7b26\u5408\u5df2\u767b\u9304\u689d\u4ef6\u7684\u5f71\u7247"

    const-string v5, "\u4ef6\uff1a\u767b\u9332\u3057\u305f\u6761\u4ef6\u306b\u4e00\u81f4\u3059\u308b\u52d5\u753b\u3092\u975e\u8868\u793a"

    invoke-static {p0, v5, v3, v4}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/ContentFilter$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Le/e/a/ContentFilter$$ExternalSyntheticLambda0;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v2, v1}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    :cond_a2
    return-void
.end method

.method static stored(Landroid/content/Context;)Lorg/json/JSONArray;
    .registers 11

    .line 7
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "nicoid_content_rules_v2"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1f

    :try_start_c
    new-instance p0, Lorg/json/JSONArray;

    const-string v2, "[]"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_17} :catch_18

    return-object p0

    :catch_18
    move-exception p0

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    return-object p0

    :cond_1f
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_26
    const/4 v4, 0x2

    if-lt v3, v4, :cond_2a

    :goto_29
    goto :goto_72

    :cond_2a
    if-nez v3, :cond_2f

    :try_start_2c
    const-string v4, "nicoid_content_keywords"

    goto :goto_31

    :cond_2f
    const-string v4, "nicoid_content_channels"

    :goto_31
    const-string v5, ""

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Le/e/a/ContentFilterRules;->keywords(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    const/4 v6, 0x0

    :goto_3d
    if-lt v6, v5, :cond_42

    add-int/lit8 v3, v3, 0x1

    goto :goto_26

    :cond_42
    aget-object v7, v4, v6

    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    const-string v9, "category"

    invoke-virtual {v8, v9, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "value"

    invoke-virtual {v8, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "mode"

    const-string v9, "partial"

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "enabled"

    const/4 v9, 0x1

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "date"

    invoke-virtual {v7, v8, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v1, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_6d} :catch_70

    add-int/lit8 v6, v6, 0x1

    goto :goto_3d

    :catch_70
    move-exception v0

    goto :goto_29

    :goto_72
    invoke-static {p0, v1}, Le/e/a/ContentFilter;->save(Landroid/content/Context;Lorg/json/JSONArray;)V

    return-object v1
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 5
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
