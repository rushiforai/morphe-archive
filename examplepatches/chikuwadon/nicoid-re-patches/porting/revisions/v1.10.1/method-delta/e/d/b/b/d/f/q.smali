.class public final Le/d/b/b/d/f/q;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Le/d/b/b/d/f/l;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Le/d/b/b/d/f/l;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    iput-object p1, p0, Le/d/b/b/d/f/q;->a:Le/d/b/b/d/f/l;

    iput-object p2, p0, Le/d/b/b/d/f/q;->b:Ljava/lang/String;

    iput-object p3, p0, Le/d/b/b/d/f/q;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-object v0, p0, Le/d/b/b/d/f/q;->a:Le/d/b/b/d/f/l;

    .line 1
    iget-object v0, v0, Le/d/b/b/d/f/l;->H:Ljava/util/Map;

    .line 2
    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Le/d/b/b/d/f/q;->a:Le/d/b/b/d/f/l;

    .line 3
    iget-object v1, v1, Le/d/b/b/d/f/l;->H:Ljava/util/Map;

    .line 4
    iget-object v2, p0, Le/d/b/b/d/f/q;->b:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/d/b/b/d/a$e;

    monitor-exit v0
    :try_end_12
    .catchall {:try_start_5 .. :try_end_12} :catchall_a1

    const/4 v0, 0x1

    if-eqz v1, :cond_8b

    iget-object v2, p0, Le/d/b/b/d/f/q;->a:Le/d/b/b/d/f/l;

    .line 5
    iget-object v2, v2, Le/d/b/b/d/f/l;->F:Lcom/google/android/gms/cast/CastDevice;

    .line 6
    iget-object v2, p0, Le/d/b/b/d/f/q;->c:Ljava/lang/String;

    check-cast v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService$a;

    const/4 v3, 0x0

    .line 7
    :try_start_1e
    new-instance v4, Lorg/json/JSONObject;

    invoke-static {v2}, Le/e/a/CastReceiverDiagnostics;->received(Ljava/lang/String;)V

    invoke-direct {v4, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_26} :catch_2f

    :try_start_26
    const-string v2, "type"

    invoke-virtual {v4, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_2c} :catch_2d

    goto :goto_35

    :catch_2d
    move-exception v2

    goto :goto_31

    :catch_2f
    move-exception v2

    move-object v4, v3

    :goto_31
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v2, -0x1

    :goto_35
    if-nez v4, :cond_38

    goto :goto_8a

    :cond_38
    if-eqz v2, :cond_74

    if-eq v2, v0, :cond_52

    const/4 v3, 0x2

    if-eq v2, v3, :cond_49

    const/4 v0, 0x3

    if-eq v2, v0, :cond_43

    goto :goto_8a

    :cond_43
    :try_start_43
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService$a;->a:Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    invoke-static {v0, v4}, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->a(Lcom/sauzask/nicoid/NicoidChormecastSenderService;Lorg/json/JSONObject;)V

    goto :goto_8a

    :cond_49
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService$a;->a:Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    invoke-static {v0}, Le/e/a/v0;->a(Z)Z

    invoke-static {v1, v0}, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->a(Lcom/sauzask/nicoid/NicoidChormecastSenderService;Z)Z

    goto :goto_8a

    :cond_52
    const-string v0, "mpposition"

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->O:I

    const-string v0, "mpisplay"

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->P:Z

    const-string v0, "iscomment"

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->Q:Z

    sget-object v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->K:Le/e/a/l3/a;

    if-eqz v0, :cond_8a

    sget-object v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->K:Le/e/a/l3/a;

    invoke-interface {v0, v4}, Le/e/a/l3/a;->a(Lorg/json/JSONObject;)V

    goto :goto_8a

    :cond_74
    const-string v0, "mpduration"

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->N:I

    sget-object v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->K:Le/e/a/l3/a;

    if-eqz v0, :cond_8a

    sget-object v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->K:Le/e/a/l3/a;

    invoke-interface {v0, v4}, Le/e/a/l3/a;->b(Lorg/json/JSONObject;)V
    :try_end_85
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_85} :catch_86

    goto :goto_8a

    :catch_86
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_8a
    :goto_8a
    return-void

    .line 8
    :cond_8b
    sget-object v1, Le/d/b/b/d/f/l;->b0:Le/d/b/b/d/f/b;

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 9
    iget-object v3, p0, Le/d/b/b/d/f/q;->b:Ljava/lang/String;

    aput-object v3, v0, v2

    .line 10
    invoke-virtual {v1}, Le/d/b/b/d/f/b;->a()Z

    move-result v2

    if-nez v2, :cond_9b

    goto :goto_a0

    :cond_9b
    const-string v2, "Discarded message for unknown namespace \'%s\'"

    invoke-virtual {v1, v2, v0}, Le/d/b/b/d/f/b;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    :goto_a0
    return-void

    :catchall_a1
    move-exception v1

    .line 11
    :try_start_a2
    monitor-exit v0
    :try_end_a3
    .catchall {:try_start_a2 .. :try_end_a3} :catchall_a1

    throw v1
.end method
