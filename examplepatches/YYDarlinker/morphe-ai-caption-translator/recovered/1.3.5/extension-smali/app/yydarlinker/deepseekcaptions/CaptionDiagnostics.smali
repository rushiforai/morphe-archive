.class final Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;
.super Ljava/lang/Object;
.source "CaptionDiagnostics.java"


# static fields
.field private static final DECISIONS:Ljava/lang/String; = "timing_and_protocol_decisions"

.field private static final DETAIL:Ljava/lang/String; = "detail"

.field private static final HISTORY:Ljava/lang/String; = "history"

.field private static final MAX_HISTORY:I = 0x1f40

.field private static final PREFS:Ljava/lang/String; = "deepseek_caption_diagnostics"

.field private static final STAGE:Ljava/lang/String; = "stage"

.field private static final TIME:Ljava/lang/String; = "time"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static clear(Landroid/content/Context;)V
    .registers 2

    .line 53
    :try_start_0
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_f
    .catchall {:try_start_0 .. :try_end_f} :catchall_f

    .line 54
    :catchall_f
    :try_start_f
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->clear(Landroid/content/Context;)V
    :try_end_12
    .catchall {:try_start_f .. :try_end_12} :catchall_12

    .line 55
    :catchall_12
    :try_start_12
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->clear(Landroid/content/Context;)V
    :try_end_15
    .catchall {:try_start_12 .. :try_end_15} :catchall_15

    .line 56
    :catchall_15
    :try_start_15
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->clear(Landroid/content/Context;)V
    :try_end_18
    .catchall {:try_start_15 .. :try_end_18} :catchall_18

    :catchall_18
    return-void
.end method

.method static errorDetail(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 3

    if-nez p0, :cond_5

    .line 131
    const-string p0, "unknown"

    return-object p0

    .line 132
    :cond_5
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 133
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1d

    :cond_15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    :cond_1d
    const/16 p0, 0xdc

    .line 134
    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->sanitize(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static fullText(Landroid/content/Context;)Ljava/lang/String;
    .registers 6

    .line 97
    const-string v0, "history"

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->read(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "quality"

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->read(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 98
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->uiText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n\n[Export manifest; ui=1.3.5; engine=event-rebuild-r2.12; exported_at="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, "; completeness=bounded_not_guaranteed; history_records="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    .line 99
    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->records(Ljava/lang/String;Z)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "; quality_records="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x1

    invoke-static {v1, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->records(Ljava/lang/String;Z)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "; truncation_markers="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    const-string v3, "record truncated"

    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->occurrences(Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    invoke-static {v1, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->occurrences(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    add-int/2addr v4, v3

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "; debug="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->displayTextDebugEnabled(Landroid/content/Context;)Z

    move-result p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, "]\n\n[Extended history: chronological; last 24h; up to 8 MiB per channel]\n"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\n[Extended quality evidence; captured only while debug enabled]\n"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static importantDecision(Ljava/lang/String;)Z
    .registers 2

    .line 110
    const-string v0, "REBUILD_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_20

    const-string v0, "REBUILD_SELECTED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "REBUILD_PRESENTED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "REBUILD_DISPLAY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_eb

    :cond_20
    const-string v0, "SOURCE_RETRY_SCHEDULED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "SOURCE_LOAD_FAILED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "CONTEXTUAL_CORE_ERROR"

    .line 111
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "CONTEXTUAL_SEEK_REPRIORITIZED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "ASR_CUE_TIMING_BASE"

    .line 112
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "ASR_CUE_TIMING_APPLIED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "ASR_REFERENCE_FETCH_FAILED"

    .line 113
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "SOURCE_TIMING_FALLBACK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "SOURCE_TIMING_CALIBRATED"

    .line 114
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "SOURCE_TIMING_CONFIRMED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "ANCHOR_RESPONSE_REJECTED"

    .line 115
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "CONTEXTUAL_BATCH_FAILED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "FIRST_AI_READY"

    .line 116
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "SOURCE_TIMING_BASE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "ASR_LOCAL_TIMING_APPLIED"

    .line 117
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "ASR_LOCAL_TIMING_REJECTED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "ASR_NATIVE_WORD_TIMING_SELECTED"

    .line 118
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "ASR_NATIVE_WORD_TIMING_ALIGNED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "ASR_WORD_TIMING_UNAVAILABLE"

    .line 119
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "ENGINE_MODE_SAVED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "NATIVE_APPLIED_CAPTURE_FAILED"

    .line 120
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "NATIVE_APPLIED_OWNER_REJECTED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "OVERLAY_READABILITY_DEGRADED"

    .line 121
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "ENGINE_SNAPSHOT_ACTIVATED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    const-string v0, "BACKGROUND_ACTIVATION_IGNORED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_e9

    goto :goto_eb

    :cond_e9
    const/4 p0, 0x0

    return p0

    :cond_eb
    :goto_eb
    const/4 p0, 0x1

    return p0
.end method

.method static declared-synchronized mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12

    const-string v0, "\n"

    const-string v1, " | "

    const-class v2, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;

    monitor-enter v2

    if-nez p0, :cond_b

    .line 23
    monitor-exit v2

    return-void

    :cond_b
    const/16 v3, 0x50

    .line 25
    :try_start_d
    invoke-static {p1, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->sanitize(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    .line 26
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v3

    iget-object v3, v3, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    const/16 v4, 0x640

    invoke-static {p2, v3, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p2

    const/16 v3, 0x6a4

    invoke-static {p2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->sanitize(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p2

    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 28
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 29
    const-string v6, "history"

    const-string v7, ""

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 30
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v8, " | "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_4c

    const-string v1, ""

    goto :goto_58

    :cond_4c
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_58
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 31
    const-string v7, "history"

    invoke-static {p0, v7, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->append(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v6, :cond_82

    .line 32
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_6d

    goto :goto_82

    :cond_6d
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\n"

    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_83

    :cond_82
    :goto_82
    move-object p0, v1

    .line 33
    :goto_83
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x0

    const/16 v8, 0x1f40

    if-le v6, v8, :cond_90

    invoke-virtual {p0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 35
    :cond_90
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->importantDecision(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_db

    .line 36
    const-string v6, "timing_and_protocol_decisions"

    const-string v8, ""

    invoke-interface {v5, v6, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 37
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_af

    const-string v0, ""

    goto :goto_bb

    :cond_af
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_bb
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v6, 0xbb8

    if-le v1, v6, :cond_ce

    invoke-virtual {v0, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 39
    :cond_ce
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v6, "timing_and_protocol_decisions"

    invoke-interface {v1, v6, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 41
    :cond_db
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "stage"

    .line 42
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "detail"

    .line 43
    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "time"

    .line 44
    invoke-interface {p1, p2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "history"

    .line 45
    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 46
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_fa
    .catchall {:try_start_d .. :try_end_fa} :catchall_fa

    .line 50
    :catchall_fa
    monitor-exit v2

    return-void
.end method

.method private static occurrences(Ljava/lang/String;Ljava/lang/String;)I
    .registers 5

    const/4 v0, 0x0

    move v1, v0

    .line 107
    :goto_2
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    if-ltz v0, :cond_10

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_2

    :cond_10
    return v1
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 19
    const-string v0, "deepseek_caption_diagnostics"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static records(Ljava/lang/String;Z)I
    .registers 7

    .line 106
    const-string v0, "\n"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_9
    if-ge v1, v0, :cond_25

    aget-object v3, p0, v1

    if-eqz p1, :cond_18

    const-string v4, "{"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_22

    goto :goto_20

    :cond_18
    const-string v4, "^[0-9]+ \\|.*"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_22

    :goto_20
    add-int/lit8 v2, v2, 0x1

    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_25
    return v2
.end method

.method private static sanitize(Ljava/lang/String;I)Ljava/lang/String;
    .registers 4

    if-nez p0, :cond_5

    .line 125
    const-string p0, ""

    return-object p0

    :cond_5
    const/16 v0, 0xd

    const/16 v1, 0x20

    .line 126
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0xa

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 127
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, p1, :cond_1e

    return-object p0

    :cond_1e
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static uiText(Landroid/content/Context;)Ljava/lang/String;
    .registers 18

    move-object/from16 v1, p0

    .line 61
    const-string v0, "\n"

    const-string v2, ""

    .line 0
    const-string v3, "\n\u5c1a\u672a\u6355\u83b7\u5230\u81ea\u52a8\u7ffb\u8bd1\u8bf7\u6c42\u3002\u542f\u7528\u5e76\u586b\u5199 API Key \u540e\uff0c\u64ad\u653e\u89c6\u9891\u5e76\u4ece\u201c\u81ea\u52a8\u7ffb\u8bd1\u201d\u9009\u62e9\u4efb\u610f\u76ee\u6807\u8bed\u8a00\uff0c\u518d\u56de\u6765\u70b9\u201c\u5237\u65b0\u8bca\u65ad\u201d\u3002\n\n"

    const-string v4, "\uff08\u7ea6 "

    const-string v5, "\n\u5c1a\u672a\u6355\u83b7\u5230\u81ea\u52a8\u7ffb\u8bd1\u8bf7\u6c42\u3002\u542f\u7528\u5e76\u586b\u5199 API Key \u540e\uff0c\u64ad\u653e\u89c6\u9891\u5e76\u4ece\u201c\u81ea\u52a8\u7ffb\u8bd1\u201d\u9009\u62e9\u4efb\u610f\u76ee\u6807\u8bed\u8a00\uff0c\u518d\u56de\u6765\u70b9\u201c\u5237\u65b0\u8bca\u65ad\u201d\u3002"

    const-string v6, "\u5f15\u64ce\uff1aEvent rebuild / event-rebuild-r2.12\n\u5f53\u524d\u6a21\u5f0f\uff1a"

    .line 61
    :try_start_e
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 62
    const-string v8, "stage"

    invoke-interface {v7, v8, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 63
    const-string v9, "detail"

    invoke-interface {v7, v9, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 64
    const-string v10, "time"

    const-wide/16 v11, 0x0

    invoke-interface {v7, v10, v11, v12}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v13

    .line 65
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->uiText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    .line 66
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->translates()Z

    move-result v6

    if-eqz v6, :cond_38

    const-string v6, "\u81ea\u52a8\u7ffb\u8bd1"

    goto :goto_3a

    :cond_38
    const-string v6, "\u539f\u5b57\u5e55\uff08\u96f6\u7ffb\u8bd1 API\uff09"

    :goto_3a
    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\n\u663e\u793a\u6587\u672c\u8c03\u8bd5\uff1a"

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->displayTextDebugEnabled(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_4b

    const-string v6, "\u5f00"

    goto :goto_4d

    :cond_4b
    const-string v6, "\u5173"

    :goto_4d
    invoke-static {v1, v6}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    if-eqz v8, :cond_10b

    .line 68
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-eqz v15, :cond_62

    goto/16 :goto_10b

    :cond_62
    cmp-long v3, v13, v11

    if-gtz v3, :cond_69

    const-wide/16 v13, -0x1

    goto :goto_76

    .line 74
    :cond_69
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    sub-long/2addr v15, v13

    const-wide/16 v13, 0x3e8

    div-long v13, v15, v13

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v13

    :goto_76
    cmp-long v3, v13, v11

    if-gez v3, :cond_7c

    move-object v3, v2

    goto :goto_8d

    .line 75
    :cond_7c
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, " \u79d2\u524d\uff09"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 76
    :goto_8d
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    invoke-static {v1, v6}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    const-string v5, "\u6700\u8fd1\u9636\u6bb5\uff1a"

    invoke-static {v1, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v9, :cond_bd

    .line 79
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_bd

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_bd
    if-eqz v10, :cond_cd

    .line 80
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_cd

    .line 81
    const-string v0, "\n\n"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    :cond_cd
    const-string v0, "timing_and_protocol_decisions"

    invoke-interface {v7, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 84
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_e5

    const-string v3, "\n\n\u65f6\u95f4\u53c2\u7167\u4e0e\u5f02\u5e38\uff08\u72ec\u7acb\u4fdd\u7559\uff0c\u542b\u65f6\u95f4\u6233\uff09\uff1a\n"

    invoke-static {v1, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    :cond_e5
    const-string v0, "history"

    invoke-interface {v7, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_ff

    .line 86
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_ff

    .line 87
    const-string v2, "\n\n\u6700\u8fd1\u94fe\u8def\uff1a\n"

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    :cond_ff
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->text(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_10b
    :goto_10b
    if-eqz v10, :cond_127

    .line 70
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_114

    goto :goto_127

    .line 72
    :cond_114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_136

    .line 71
    :cond_127
    :goto_127
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 70
    :goto_136
    invoke-static {v1, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0
    :try_end_13a
    .catchall {:try_start_e .. :try_end_13a} :catchall_13b

    return-object v0

    :catchall_13b
    move-exception v0

    .line 92
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u8bfb\u53d6\u8bca\u65ad\u72b6\u6001\u5931\u8d25\uff1a"

    invoke-static {v1, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
