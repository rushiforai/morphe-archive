.class final Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;
.super Ljava/lang/Object;
.source "RebuildController.java"

# interfaces
.implements Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Job"
.end annotation


# instance fields
.field volatile cancelled:Z

.field volatile connection:Ljava/net/HttpURLConnection;

.field final index:I

.field final priority:Z

.field volatile sent:Z

.field final session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

.field final traceId:J


# direct methods
.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;I)V
    .registers 4

    const/4 v0, 0x0

    .line 114
    invoke-direct {p0, p1, p2, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;-><init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;IZ)V

    return-void
.end method

.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;IZ)V
    .registers 6

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->-$$Nest$sfgetIDS()Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v0

    iput-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->traceId:J

    .line 118
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    .line 119
    iput p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    .line 120
    iput-boolean p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->priority:Z

    return-void
.end method


# virtual methods
.method public isCancelled()Z
    .registers 2

    .line 124
    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->cancelled:Z

    if-nez v0, :cond_f

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result p0

    if-nez p0, :cond_d

    goto :goto_f

    :cond_d
    const/4 p0, 0x0

    return p0

    :cond_f
    :goto_f
    const/4 p0, 0x1

    return p0
.end method

.method public onConnection(Ljava/net/HttpURLConnection;)V
    .registers 4

    .line 128
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->connection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->connections:Ljava/util/Set;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->connection:Ljava/net/HttpURLConnection;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 129
    :cond_d
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->connection:Ljava/net/HttpURLConnection;

    if-eqz p1, :cond_21

    .line 131
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->connections:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 132
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->isCancelled()Z

    move-result p0

    if-eqz p0, :cond_21

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_21
    return-void
.end method

.method public onQualityEvidence(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    .line 145
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->displayTextDebugEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    .line 148
    :cond_b
    :try_start_b
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_14} :catch_7e

    .line 149
    :try_start_14
    iget p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    if-ltz p1, :cond_7b

    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-object p1, p1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    if-eqz p1, :cond_7b

    .line 150
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-object p1, p1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    .line 151
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 152
    iget v2, p1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->from:I

    :goto_31
    iget v3, p1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->to:I

    if-gt v2, v3, :cond_68

    .line 153
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-object v3, v3, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->source:Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    iget-object v3, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    .line 154
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 156
    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    move-result-object v4

    iget-wide v5, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->start:J

    .line 157
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONArray;->put(J)Lorg/json/JSONArray;

    move-result-object v4

    iget-wide v5, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->end:J

    .line 158
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONArray;->put(J)Lorg/json/JSONArray;

    move-result-object v4

    iget v5, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->cue:I

    .line 159
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    move-result-object v4

    iget-object v3, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->precision:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    .line 160
    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v3

    .line 154
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v2, v2, 0x1

    goto :goto_31

    .line 162
    :cond_68
    const-string p1, "diagnostic_only_source_times"

    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 163
    const-string p1, "diagnostic_only_request_purpose"

    iget-boolean v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->priority:Z

    if-eqz v1, :cond_76

    const-string v1, "focus"

    goto :goto_78

    :cond_76
    const-string v1, "prefetch"

    :goto_78
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7b
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_7b} :catch_7d

    :cond_7b
    move-object v4, v0

    goto :goto_7f

    :catch_7d
    move-object p1, v0

    :catch_7e
    move-object v4, p1

    .line 167
    :goto_7f
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-object p1, p1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->config:Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    iget-object v1, p1, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    iget-wide v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->traceId:J

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ";session="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-wide v5, p3, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {p1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p3, ";block="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object v5, p2

    invoke-static/range {v0 .. v6}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->record(Landroid/content/Context;Ljava/lang/String;JLorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onRequestBodySent()V
    .registers 2

    const/4 v0, 0x1

    .line 137
    iput-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->sent:Z

    return-void
.end method

.method trace(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    .line 141
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "session="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-wide v2, v2, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ";request="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->traceId:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ";block="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ";"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p1, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
