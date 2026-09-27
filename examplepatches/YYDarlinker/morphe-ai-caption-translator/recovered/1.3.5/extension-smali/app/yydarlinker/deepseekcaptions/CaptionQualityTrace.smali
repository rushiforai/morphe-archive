.class final Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;
.super Ljava/lang/Object;
.source "CaptionQualityTrace.java"


# static fields
.field private static final MAX_CHARS:I = 0x8ca0

.field private static final MAX_RECORDS:I = 0x6

.field private static final PREFS:Ljava/lang/String; = "caption_quality_evidence"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized clear(Landroid/content/Context;)V
    .registers 4

    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;

    monitor-enter v0

    if-eqz p0, :cond_1b

    .line 60
    :try_start_5
    const-string v1, "caption_quality_evidence"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_1b

    :catchall_18
    move-exception p0

    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_5 .. :try_end_1a} :catchall_18

    throw p0

    :cond_1b
    :goto_1b
    monitor-exit v0

    return-void
.end method

.method static digest(Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 36
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    if-nez p0, :cond_a

    const-string p0, ""

    :cond_a
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_1c
    if-ge v3, v1, :cond_39

    aget-byte v4, p0, v3

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v6, "%02x"

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v4, v7, v2

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_1c

    :cond_39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_3d
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_3d} :catch_3e

    return-object p0

    .line 38
    :catch_3e
    const-string p0, "unavailable"

    return-object p0
.end method

.method static declared-synchronized record(Landroid/content/Context;Ljava/lang/String;JLorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .registers 16

    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;

    monitor-enter v0

    if-eqz p0, :cond_13d

    .line 8
    :try_start_5
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->displayTextDebugEnabled(Landroid/content/Context;)Z

    move-result v1
    :try_end_9
    .catchall {:try_start_5 .. :try_end_9} :catchall_13a

    if-nez v1, :cond_d

    goto/16 :goto_13d

    .line 10
    :cond_d
    :try_start_d
    const-string v1, "caption_quality_evidence"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 11
    new-instance v3, Lorg/json/JSONArray;

    const-string v4, "records"

    const-string v5, "[]"

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 12
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "at"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v5, v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "request"

    invoke-virtual {v5, v6, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object p2

    const-string p3, "settings"

    const/16 v5, 0x2bc

    .line 13
    invoke-static {p6, p1, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p6

    invoke-virtual {p2, p3, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    .line 14
    new-instance p3, Lorg/json/JSONObject;

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p6

    invoke-direct {p3, p6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const p6, 0x1f400

    if-eqz p4, :cond_62

    .line 15
    const-string v5, "source"

    invoke-virtual {p4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, p1, p6}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_62
    if-eqz p5, :cond_73

    .line 16
    invoke-virtual {p5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_73

    const-string v5, "response"

    invoke-static {p5, p1, p6}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p6

    invoke-virtual {p3, v5, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 17
    :cond_73
    const-string p6, "quality"

    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p0, p6, p3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->append(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    const/16 p0, 0x2ee0

    if-eqz p4, :cond_8d

    .line 18
    const-string p3, "source"

    invoke-virtual {p4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4, p1, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_8d
    if-eqz p5, :cond_9e

    .line 19
    invoke-virtual {p5}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_9e

    const-string p3, "response"

    invoke-static {p5, p1, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 20
    :cond_9e
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const p3, 0x8ca0

    if-le p0, p3, :cond_e1

    .line 21
    const-string p0, "source"

    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    const/16 p4, 0x960

    if-eqz p0, :cond_c4

    const-string p0, "source"

    const-string p5, "source"

    invoke-virtual {p2, p5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    invoke-static {p5, p1, p4}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p2, p0, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    :cond_c4
    const-string p0, "response"

    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_db

    const-string p0, "response"

    const-string p5, "response"

    invoke-virtual {p2, p5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    invoke-static {p5, p1, p4}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 23
    :cond_db
    const-string p0, "truncated"

    const/4 p1, 0x1

    invoke-virtual {p2, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 26
    :cond_e1
    invoke-virtual {v4, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    .line 27
    :goto_ec
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result p1

    if-ge v2, p1, :cond_127

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result p1

    const/4 p2, 0x6

    if-ge p1, p2, :cond_127

    .line 28
    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p1

    if-nez p1, :cond_100

    goto :goto_124

    .line 29
    :cond_100
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p4

    const-string p2, "at"

    const-wide/16 v5, 0x0

    invoke-virtual {p1, p2, v5, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v5

    sub-long/2addr p4, v5

    const-wide/32 v5, 0x5265c00

    cmp-long p2, p4, v5

    if-lez p2, :cond_115

    goto :goto_124

    .line 30
    :cond_115
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr p0, p2

    if-le p0, p3, :cond_121

    goto :goto_127

    :cond_121
    invoke-virtual {v4, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :goto_124
    add-int/lit8 v2, v2, 0x1

    goto :goto_ec

    .line 32
    :cond_127
    :goto_127
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "records"

    invoke-virtual {v4}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_138
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_138} :catch_138
    .catchall {:try_start_d .. :try_end_138} :catchall_13a

    .line 34
    :catch_138
    monitor-exit v0

    return-void

    :catchall_13a
    move-exception p0

    :try_start_13b
    monitor-exit v0
    :try_end_13c
    .catchall {:try_start_13b .. :try_end_13c} :catchall_13a

    throw p0

    .line 8
    :cond_13d
    :goto_13d
    monitor-exit v0

    return-void
.end method

.method static redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .registers 6

    if-nez p0, :cond_4

    .line 41
    const-string p0, ""

    :cond_4
    const-string v0, "\\/"

    const-string v1, "/"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    if-eqz p1, :cond_33

    .line 42
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_33

    .line 43
    const-string v0, "[redacted]"

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 44
    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-le v1, v2, :cond_33

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 46
    :cond_33
    const-string p1, "(?i)https?://[^\\s\\\"<>]+"

    const-string v0, "[URL redacted]"

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "(?i)(bearer\\s+|sk-)[A-Za-z0-9_.-]{8,}"

    const-string v0, "[credential redacted]"

    .line 47
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    if-gt p1, p2, :cond_4a

    return-object p0

    :cond_4a
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " [truncated]"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static declared-synchronized text(Landroid/content/Context;)Ljava/lang/String;
    .registers 12

    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;

    monitor-enter v0

    if-eqz p0, :cond_93

    .line 51
    :try_start_5
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->displayTextDebugEnabled(Landroid/content/Context;)Z

    move-result v1
    :try_end_9
    .catchall {:try_start_5 .. :try_end_9} :catchall_97

    if-nez v1, :cond_d

    goto/16 :goto_93

    .line 52
    :cond_d
    :try_start_d
    new-instance v1, Lorg/json/JSONArray;

    const-string v2, "caption_quality_evidence"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v4, "records"

    const-string v5, "[]"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 53
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    move v4, v3

    :goto_27
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_4d

    .line 54
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_4a

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-string v8, "at"

    const-wide/16 v9, 0x0

    invoke-virtual {v5, v8, v9, v10}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v8

    sub-long/2addr v6, v8

    const-wide/32 v8, 0x5265c00

    cmp-long v6, v6, v8

    if-gtz v6, :cond_4a

    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_4a
    add-int/lit8 v4, v4, 0x1

    goto :goto_27

    .line 56
    :cond_4d
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-eq v4, v1, :cond_6e

    const-string v1, "caption_quality_evidence"

    invoke-virtual {p0, v1, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "records"

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 57
    :cond_6e
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-nez p0, :cond_77

    const-string p0, ""

    goto :goto_8d

    :cond_77
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\n\n[Quality evidence / local, opt-in, bounded, 24h]\n"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x2

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_8d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_8d} :catch_8f
    .catchall {:try_start_d .. :try_end_8d} :catchall_97

    :goto_8d
    monitor-exit v0

    return-object p0

    .line 58
    :catch_8f
    :try_start_8f
    const-string p0, ""
    :try_end_91
    .catchall {:try_start_8f .. :try_end_91} :catchall_97

    monitor-exit v0

    return-object p0

    .line 51
    :cond_93
    :goto_93
    :try_start_93
    const-string p0, ""
    :try_end_95
    .catchall {:try_start_93 .. :try_end_95} :catchall_97

    monitor-exit v0

    return-object p0

    :catchall_97
    move-exception p0

    :try_start_98
    monitor-exit v0
    :try_end_99
    .catchall {:try_start_98 .. :try_end_99} :catchall_97

    throw p0
.end method
