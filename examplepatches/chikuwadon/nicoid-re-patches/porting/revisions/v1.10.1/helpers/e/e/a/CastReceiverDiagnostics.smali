.class public final Le/e/a/CastReceiverDiagnostics;
.super Ljava/lang/Object;
.source "CastReceiverDiagnostics.java"


# static fields
.field private static last:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized received(Ljava/lang/String;)V
    .registers 12

    const-class v0, Le/e/a/CastReceiverDiagnostics;

    monitor-enter v0

    .line 8
    :try_start_3
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v2, "Cast receiver:"

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x7

    .line 9
    new-array v3, v2, [Ljava/lang/String;

    const-string v4, "type"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "mpisplay"

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const-string v4, "iscomment"

    const/4 v6, 0x2

    aput-object v4, v3, v6

    const-string v4, "playerState"

    const/4 v6, 0x3

    aput-object v4, v3, v6

    const-string v4, "idleReason"

    const/4 v6, 0x4

    aput-object v4, v3, v6

    const-string v4, "errorCode"

    const/4 v6, 0x5

    aput-object v4, v3, v6

    const-string v4, "code"

    const/4 v6, 0x6

    aput-object v4, v3, v6

    :goto_35
    if-lt v5, v2, :cond_64

    .line 14
    const-string v2, "mpposition"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Ljava/lang/Number;

    if-eqz v2, :cond_52

    const-string v2, " position10s="

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x2710

    div-long/2addr v1, v3

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 15
    :cond_52
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Le/e/a/CastReceiverDiagnostics;->last:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a9

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    sput-object p0, Le/e/a/CastReceiverDiagnostics;->last:Ljava/lang/String;

    goto :goto_a9

    .line 9
    :cond_64
    aget-object v4, v3, v5

    .line 10
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 11
    instance-of v7, v6, Ljava/lang/Number;

    const/16 v8, 0x3d

    const/16 v9, 0x20

    if-nez v7, :cond_93

    instance-of v7, v6, Ljava/lang/Boolean;

    if-eqz v7, :cond_77

    goto :goto_93

    .line 12
    :cond_77
    instance-of v7, v6, Ljava/lang/String;

    if-eqz v7, :cond_9f

    move-object v7, v6

    check-cast v7, Ljava/lang/String;

    const-string v10, "[A-Z_]{1,40}"

    invoke-virtual {v7, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9f

    invoke-virtual {p0, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_9f

    .line 11
    :cond_93
    :goto_93
    invoke-virtual {p0, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    :try_end_9f
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_9f} :catch_a4
    .catchall {:try_start_3 .. :try_end_9f} :catchall_a2

    :cond_9f
    :goto_9f
    add-int/lit8 v5, v5, 0x1

    goto :goto_35

    :catchall_a2
    move-exception p0

    goto :goto_ab

    .line 16
    :catch_a4
    :try_start_a4
    const-string p0, "Cast receiver: non-JSON message"

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V
    :try_end_a9
    .catchall {:try_start_a4 .. :try_end_a9} :catchall_a2

    .line 17
    :cond_a9
    :goto_a9
    monitor-exit v0

    return-void

    :goto_ab
    monitor-exit v0

    throw p0
.end method
