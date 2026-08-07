.class public Lcom/xiaomi/mipush/sdk/e;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static b:Lcom/xiaomi/mipush/sdk/e;

.field private static c:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static d:Ljava/lang/Object;


# instance fields
.field private a:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/xiaomi/mipush/sdk/e;->d:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;I)Landroid/content/Intent;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/xiaomi/push/service/x;->b(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;I)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private c(Lcom/xiaomi/push/hb;Z[BLjava/lang/String;ILandroid/content/Intent;)Lcom/xiaomi/mipush/sdk/PushMessageHandler$a;
    .locals 26

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v0, p3

    move-object/from16 v5, p4

    move/from16 v8, p5

    .line 1
    const-string v4, "receiving an un-recognized message. "

    const/4 v9, 0x0

    .line 2
    :try_start_0
    iget-object v6, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v6, v2}, Ll/s5r0;->d(Landroid/content/Context;Lcom/xiaomi/push/hb;)Lcom/xiaomi/push/hq;

    move-result-object v6

    if-nez v6, :cond_0

    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v2, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 4
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v0

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "18"

    invoke-virtual {v0, v4, v6, v5, v7}, Ll/tzq0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0, v2, v3}, Ll/k4r0;->f(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V
    :try_end_0
    .catch Lcom/xiaomi/mipush/sdk/l; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/xiaomi/push/hu; {:try_start_0 .. :try_end_0} :catch_0

    return-object v9

    :catch_0
    move-exception v0

    move-object/from16 v16, v9

    goto/16 :goto_19

    :catch_1
    move-exception v0

    move-object/from16 v16, v9

    goto/16 :goto_1a

    .line 6
    :cond_0
    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    move-result-object v4

    .line 7
    const-string v7, "processing a message, action="

    const-string v10, ", hasNotified="

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    filled-new-array {v4, v10, v11}, [Ljava/lang/Object;

    move-result-object v10

    invoke-static {v7, v10}, Ll/ouq0;->p(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 8
    sget-object v7, Lcom/xiaomi/mipush/sdk/e$a;->a:[I

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    aget v4, v7, v4

    const/4 v7, 0x1

    const-wide/16 v10, 0x0

    const/4 v12, 0x0

    packed-switch v4, :pswitch_data_0

    goto/16 :goto_f

    .line 9
    :pswitch_0
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    sget-object v4, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    array-length v0, v0

    invoke-static {v2, v3, v6, v4, v0}, Ll/jxq0;->f(Ljava/lang/String;Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;I)V

    .line 10
    instance-of v0, v6, Lcom/xiaomi/push/gw;

    if-eqz v0, :cond_e

    .line 11
    check-cast v6, Lcom/xiaomi/push/gw;

    .line 12
    invoke-virtual {v6}, Lcom/xiaomi/push/gw;->a()Ljava/lang/String;

    move-result-object v0

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "resp-type:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Lcom/xiaomi/push/gw;->b()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", code:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, v6, Lcom/xiaomi/push/gw;->a:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ll/ouq0;->D(Ljava/lang/String;)V

    .line 14
    sget-object v2, Lcom/xiaomi/push/gp;->E:Lcom/xiaomi/push/gp;

    iget-object v2, v2, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v3, v6, Lcom/xiaomi/push/gw;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    const/16 v3, 0xa

    if-eqz v2, :cond_6

    .line 15
    iget-wide v4, v6, Lcom/xiaomi/push/gw;->a:J

    cmp-long v2, v4, v10

    if-nez v2, :cond_2

    .line 16
    const-class v2, Ll/m5r0;

    monitor-enter v2

    .line 17
    :try_start_1
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v3

    invoke-virtual {v3, v0}, Ll/m5r0;->f(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 18
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v3

    invoke-virtual {v3, v0}, Ll/m5r0;->h(Ljava/lang/String;)V

    .line 19
    const-string v0, "syncing"

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v3

    sget-object v4, Lcom/xiaomi/mipush/sdk/v;->a:Lcom/xiaomi/mipush/sdk/v;

    invoke-virtual {v3, v4}, Ll/m5r0;->b(Lcom/xiaomi/mipush/sdk/v;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 20
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v0

    const-string v3, "synced"

    invoke-virtual {v0, v4, v3}, Ll/m5r0;->d(Lcom/xiaomi/mipush/sdk/v;Ljava/lang/String;)V

    .line 21
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;)V

    .line 22
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearLocalNotificationType(Landroid/content/Context;)V

    .line 23
    invoke-static {}, Lcom/xiaomi/mipush/sdk/PushMessageHandler;->a()V

    .line 24
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/f;->N()V

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    .line 25
    :cond_1
    :goto_0
    monitor-exit v2

    goto/16 :goto_f

    :goto_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 26
    :cond_2
    const-string v2, "syncing"

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v4}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/mipush/sdk/v;->a:Lcom/xiaomi/mipush/sdk/v;

    invoke-virtual {v4, v5}, Ll/m5r0;->b(Lcom/xiaomi/mipush/sdk/v;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 27
    const-class v2, Ll/m5r0;

    monitor-enter v2

    .line 28
    :try_start_2
    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v4}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v4

    invoke-virtual {v4, v0}, Ll/m5r0;->f(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 29
    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v4}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v4

    invoke-virtual {v4, v0}, Ll/m5r0;->a(Ljava/lang/String;)I

    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 30
    iget-object v5, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    if-ge v4, v3, :cond_3

    .line 31
    :try_start_3
    invoke-static {v5}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v3

    invoke-virtual {v3, v0}, Ll/m5r0;->g(Ljava/lang/String;)V

    .line 32
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    move-result-object v1

    invoke-virtual {v1, v7, v0}, Lcom/xiaomi/mipush/sdk/f;->I(ZLjava/lang/String;)V

    goto :goto_2

    :catchall_1
    move-exception v0

    goto :goto_3

    .line 33
    :cond_3
    invoke-static {v5}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v1

    invoke-virtual {v1, v0}, Ll/m5r0;->h(Ljava/lang/String;)V

    .line 34
    :cond_4
    :goto_2
    monitor-exit v2

    goto/16 :goto_f

    :goto_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    .line 35
    :cond_5
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v1}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v1

    invoke-virtual {v1, v0}, Ll/m5r0;->h(Ljava/lang/String;)V

    goto/16 :goto_f

    .line 36
    :cond_6
    sget-object v2, Lcom/xiaomi/push/gp;->F:Lcom/xiaomi/push/gp;

    iget-object v2, v2, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v4, v6, Lcom/xiaomi/push/gw;->d:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 37
    iget-wide v4, v6, Lcom/xiaomi/push/gw;->a:J

    cmp-long v2, v4, v10

    if-nez v2, :cond_8

    .line 38
    const-class v2, Ll/m5r0;

    monitor-enter v2

    .line 39
    :try_start_4
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v3

    invoke-virtual {v3, v0}, Ll/m5r0;->f(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 40
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v3

    invoke-virtual {v3, v0}, Ll/m5r0;->h(Ljava/lang/String;)V

    .line 41
    const-string v0, "syncing"

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v3

    sget-object v4, Lcom/xiaomi/mipush/sdk/v;->b:Lcom/xiaomi/mipush/sdk/v;

    invoke-virtual {v3, v4}, Ll/m5r0;->b(Lcom/xiaomi/mipush/sdk/v;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 42
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v0

    const-string v1, "synced"

    invoke-virtual {v0, v4, v1}, Ll/m5r0;->d(Lcom/xiaomi/mipush/sdk/v;Ljava/lang/String;)V

    goto :goto_4

    :catchall_2
    move-exception v0

    goto :goto_5

    .line 43
    :cond_7
    :goto_4
    monitor-exit v2

    goto/16 :goto_f

    :goto_5
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v0

    .line 44
    :cond_8
    const-string v2, "syncing"

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v4}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/mipush/sdk/v;->b:Lcom/xiaomi/mipush/sdk/v;

    invoke-virtual {v4, v5}, Ll/m5r0;->b(Lcom/xiaomi/mipush/sdk/v;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 45
    const-class v2, Ll/m5r0;

    monitor-enter v2

    .line 46
    :try_start_5
    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v4}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v4

    invoke-virtual {v4, v0}, Ll/m5r0;->f(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 47
    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v4}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v4

    invoke-virtual {v4, v0}, Ll/m5r0;->a(Ljava/lang/String;)I

    move-result v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 48
    iget-object v5, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    if-ge v4, v3, :cond_9

    .line 49
    :try_start_6
    invoke-static {v5}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v3

    invoke-virtual {v3, v0}, Ll/m5r0;->g(Ljava/lang/String;)V

    .line 50
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    move-result-object v1

    invoke-virtual {v1, v12, v0}, Lcom/xiaomi/mipush/sdk/f;->I(ZLjava/lang/String;)V

    goto :goto_6

    :catchall_3
    move-exception v0

    goto :goto_7

    .line 51
    :cond_9
    invoke-static {v5}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v1

    invoke-virtual {v1, v0}, Ll/m5r0;->h(Ljava/lang/String;)V

    .line 52
    :cond_a
    :goto_6
    monitor-exit v2

    goto/16 :goto_f

    :goto_7
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v0

    .line 53
    :cond_b
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v1}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    move-result-object v1

    invoke-virtual {v1, v0}, Ll/m5r0;->h(Ljava/lang/String;)V

    goto/16 :goto_f

    .line 54
    :cond_c
    sget-object v0, Lcom/xiaomi/push/gp;->N:Lcom/xiaomi/push/gp;

    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v2, v6, Lcom/xiaomi/push/gw;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 55
    invoke-direct {v1, v6}, Lcom/xiaomi/mipush/sdk/e;->o(Lcom/xiaomi/push/gw;)V

    goto/16 :goto_f

    .line 56
    :cond_d
    sget-object v0, Lcom/xiaomi/push/gp;->B:Lcom/xiaomi/push/gp;

    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v2, v6, Lcom/xiaomi/push/gw;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 57
    invoke-direct {v1, v6}, Lcom/xiaomi/mipush/sdk/e;->h(Lcom/xiaomi/push/gw;)V

    goto/16 :goto_f

    .line 58
    :cond_e
    instance-of v0, v6, Lcom/xiaomi/push/he;

    if-eqz v0, :cond_2f

    .line 59
    check-cast v6, Lcom/xiaomi/push/he;

    .line 60
    const-string v0, "registration id expired"

    iget-object v2, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 61
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllAlias(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 62
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllTopic(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    .line 63
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllUserAccount(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    .line 64
    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAcceptTime(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 65
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v8, "resp-type:"

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ", "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 67
    invoke-static {v5}, Ll/ouq0;->D(Ljava/lang/String;)V

    .line 68
    iget-object v5, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    sget-object v6, Lcom/xiaomi/push/gt;->a:Lcom/xiaomi/push/gt;

    invoke-static {v5, v6}, Lcom/xiaomi/mipush/sdk/MiPushClient;->reInitialize(Landroid/content/Context;Lcom/xiaomi/push/gt;)V

    .line 69
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 70
    iget-object v6, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v6, v5}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeAlias(Landroid/content/Context;Ljava/lang/String;)V

    .line 71
    iget-object v6, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v6, v5, v9}, Lcom/xiaomi/mipush/sdk/MiPushClient;->setAlias(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    .line 72
    :cond_f
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 73
    iget-object v5, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v5, v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeTopic(Landroid/content/Context;Ljava/lang/String;)V

    .line 74
    iget-object v5, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v5, v2, v9}, Lcom/xiaomi/mipush/sdk/MiPushClient;->subscribe(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    .line 75
    :cond_10
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 76
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3, v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeAccount(Landroid/content/Context;Ljava/lang/String;)V

    .line 77
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3, v2, v9}, Lcom/xiaomi/mipush/sdk/MiPushClient;->setUserAccount(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a

    .line 78
    :cond_11
    const-string v0, ","

    invoke-virtual {v4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 79
    array-length v2, v0

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2f

    .line 80
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeAcceptTime(Landroid/content/Context;)V

    .line 81
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    aget-object v2, v0, v12

    aget-object v0, v0, v7

    invoke-static {v1, v2, v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addAcceptTime(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_f

    .line 82
    :cond_12
    sget-object v0, Lcom/xiaomi/push/gp;->h:Lcom/xiaomi/push/gp;

    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v2, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 83
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_2f

    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    move-result-object v0

    const-string v2, "app_version"

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 84
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    move-result-object v0

    const-string v2, "app_version"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 85
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/xiaomi/mipush/sdk/c;->g(Ljava/lang/String;)V

    goto/16 :goto_f

    .line 86
    :cond_13
    sget-object v0, Lcom/xiaomi/push/gp;->n:Lcom/xiaomi/push/gp;

    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v2, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 87
    new-instance v0, Lcom/xiaomi/push/hd;

    invoke-direct {v0}, Lcom/xiaomi/push/hd;-><init>()V

    .line 88
    :try_start_7
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()[B

    move-result-object v2

    invoke-static {v0, v2}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V

    .line 89
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    move-result-object v1

    .line 90
    invoke-static {v1, v0}, Lcom/xiaomi/push/service/ai;->a(Lcom/xiaomi/push/service/ah;Lcom/xiaomi/push/hd;)V
    :try_end_7
    .catch Lcom/xiaomi/push/hu; {:try_start_7 .. :try_end_7} :catch_5

    goto/16 :goto_f

    .line 91
    :cond_14
    sget-object v0, Lcom/xiaomi/push/gp;->o:Lcom/xiaomi/push/gp;

    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v2, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 92
    new-instance v0, Lcom/xiaomi/push/hc;

    invoke-direct {v0}, Lcom/xiaomi/push/hc;-><init>()V

    .line 93
    :try_start_8
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()[B

    move-result-object v2

    invoke-static {v0, v2}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V

    .line 94
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    move-result-object v1

    .line 95
    invoke-static {v1, v0}, Lcom/xiaomi/push/service/ai;->a(Lcom/xiaomi/push/service/ah;Lcom/xiaomi/push/hc;)V
    :try_end_8
    .catch Lcom/xiaomi/push/hu; {:try_start_8 .. :try_end_8} :catch_5

    goto/16 :goto_f

    .line 96
    :cond_15
    sget-object v0, Lcom/xiaomi/push/gp;->w:Lcom/xiaomi/push/gp;

    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v2, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 97
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0, v6}, Ll/k6r0;->c(Landroid/content/Context;Lcom/xiaomi/push/he;)V

    goto/16 :goto_f

    .line 98
    :cond_16
    sget-object v0, Lcom/xiaomi/push/gp;->x:Lcom/xiaomi/push/gp;

    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v2, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 99
    const-string v0, "receive force sync notification"

    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 100
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0, v12}, Ll/k6r0;->d(Landroid/content/Context;Z)V

    goto/16 :goto_f

    .line 101
    :cond_17
    sget-object v0, Lcom/xiaomi/push/gp;->C:Lcom/xiaomi/push/gp;

    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v2, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "resp-type:"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 104
    invoke-static {v0}, Ll/ouq0;->D(Ljava/lang/String;)V

    .line 105
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_1c

    .line 106
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    move-result-object v0

    sget-object v2, Lcom/xiaomi/push/service/an;->Q:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, -0x2

    if-eqz v0, :cond_18

    .line 107
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    move-result-object v0

    sget-object v3, Lcom/xiaomi/push/service/an;->Q:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 108
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_18

    .line 109
    :try_start_9
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_9 .. :try_end_9} :catch_2

    goto :goto_b

    :catch_2
    move-exception v0

    .line 110
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_18
    :goto_b
    const/4 v0, -0x1

    if-lt v2, v0, :cond_19

    .line 111
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0, v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;I)V

    goto :goto_c

    .line 112
    :cond_19
    const-string v0, ""

    .line 113
    const-string v2, ""

    .line 114
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    move-result-object v3

    sget-object v4, Lcom/xiaomi/push/service/an;->O:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 115
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    move-result-object v0

    sget-object v3, Lcom/xiaomi/push/service/an;->O:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 116
    :cond_1a
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    move-result-object v3

    sget-object v4, Lcom/xiaomi/push/service/an;->P:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 117
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    move-result-object v2

    sget-object v3, Lcom/xiaomi/push/service/an;->P:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 118
    :cond_1b
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3, v0, v2}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    :cond_1c
    :goto_c
    invoke-direct {v1, v6}, Lcom/xiaomi/mipush/sdk/e;->j(Lcom/xiaomi/push/he;)V

    goto/16 :goto_f

    .line 120
    :cond_1d
    sget-object v0, Lcom/xiaomi/push/gp;->K:Lcom/xiaomi/push/gp;

    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v2, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 121
    :try_start_a
    new-instance v0, Lcom/xiaomi/push/hg;

    invoke-direct {v0}, Lcom/xiaomi/push/hg;-><init>()V

    .line 122
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()[B

    move-result-object v2

    invoke-static {v0, v2}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V

    .line 123
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/xiaomi/mipush/sdk/a;->a(Landroid/content/Context;Lcom/xiaomi/push/hg;)V
    :try_end_a
    .catch Lcom/xiaomi/push/hu; {:try_start_a .. :try_end_a} :catch_3

    goto/16 :goto_f

    :catch_3
    move-exception v0

    .line 124
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    goto/16 :goto_f

    .line 125
    :cond_1e
    sget-object v0, Lcom/xiaomi/push/gp;->M:Lcom/xiaomi/push/gp;

    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v2, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 126
    :try_start_b
    new-instance v0, Lcom/xiaomi/push/hm;

    invoke-direct {v0}, Lcom/xiaomi/push/hm;-><init>()V

    .line 127
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()[B

    move-result-object v2

    invoke-static {v0, v2}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V

    .line 128
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/xiaomi/mipush/sdk/a;->b(Landroid/content/Context;Lcom/xiaomi/push/hm;)V
    :try_end_b
    .catch Lcom/xiaomi/push/hu; {:try_start_b .. :try_end_b} :catch_4

    goto/16 :goto_f

    :catch_4
    move-exception v0

    .line 129
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    goto/16 :goto_f

    .line 130
    :cond_1f
    sget-object v0, Lcom/xiaomi/push/gp;->P:Lcom/xiaomi/push/gp;

    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v2, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    goto/16 :goto_f

    .line 131
    :cond_20
    sget-object v0, Lcom/xiaomi/push/gp;->af:Lcom/xiaomi/push/gp;

    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    iget-object v2, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 132
    const-string v0, "receive detect msg"

    invoke-static {v0}, Ll/ouq0;->w(Ljava/lang/String;)V

    .line 133
    invoke-direct {v1, v6}, Lcom/xiaomi/mipush/sdk/e;->q(Lcom/xiaomi/push/he;)V

    goto/16 :goto_f

    .line 134
    :cond_21
    invoke-static {v6}, Lcom/xiaomi/push/service/g;->a(Lcom/xiaomi/push/he;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 135
    const-string v0, "receive notification handle by cpra"

    invoke-static {v0}, Ll/ouq0;->w(Ljava/lang/String;)V

    goto/16 :goto_f

    .line 136
    :pswitch_1
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    sget-object v4, Lcom/xiaomi/push/gf;->j:Lcom/xiaomi/push/gf;

    array-length v0, v0

    invoke-static {v2, v3, v6, v4, v0}, Ll/jxq0;->f(Ljava/lang/String;Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;I)V

    .line 137
    check-cast v6, Lcom/xiaomi/push/ha;

    .line 138
    invoke-virtual {v6}, Lcom/xiaomi/push/ha;->b()Ljava/lang/String;

    move-result-object v0

    .line 139
    invoke-virtual {v6}, Lcom/xiaomi/push/ha;->a()Ljava/util/List;

    move-result-object v2

    .line 140
    iget-wide v3, v6, Lcom/xiaomi/push/ha;->a:J

    cmp-long v3, v3, v10

    if-nez v3, :cond_28

    .line 141
    sget-object v3, Lcom/xiaomi/push/ed;->i:Lcom/xiaomi/push/ed;

    iget-object v3, v3, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_23

    if-eqz v2, :cond_23

    .line 142
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-le v3, v7, :cond_23

    .line 143
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v3, v4, v5}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addAcceptTime(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    const-string v3, "00:00"

    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_22

    const-string v3, "00:00"

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_22

    .line 145
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/xiaomi/mipush/sdk/c;->j(Z)V

    goto :goto_d

    .line 146
    :cond_22
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    move-result-object v3

    invoke-virtual {v3, v12}, Lcom/xiaomi/mipush/sdk/c;->j(Z)V

    .line 147
    :goto_d
    const-string v3, "GMT+08"

    invoke-static {v3}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v3

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v4

    invoke-virtual {v1, v3, v4, v2}, Lcom/xiaomi/mipush/sdk/e;->f(Ljava/util/TimeZone;Ljava/util/TimeZone;Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    goto/16 :goto_e

    .line 148
    :cond_23
    sget-object v3, Lcom/xiaomi/push/ed;->c:Lcom/xiaomi/push/ed;

    iget-object v3, v3, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_24

    if-eqz v2, :cond_24

    .line 149
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_24

    .line 150
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addAlias(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_e

    .line 151
    :cond_24
    sget-object v3, Lcom/xiaomi/push/ed;->d:Lcom/xiaomi/push/ed;

    iget-object v3, v3, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_25

    if-eqz v2, :cond_25

    .line 152
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_25

    .line 153
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeAlias(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_e

    .line 154
    :cond_25
    sget-object v3, Lcom/xiaomi/push/ed;->e:Lcom/xiaomi/push/ed;

    iget-object v3, v3, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_26

    if-eqz v2, :cond_26

    .line 155
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_26

    .line 156
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addAccount(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_e

    .line 157
    :cond_26
    sget-object v3, Lcom/xiaomi/push/ed;->f:Lcom/xiaomi/push/ed;

    iget-object v3, v3, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_27

    if-eqz v2, :cond_27

    .line 158
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_27

    .line 159
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeAccount(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_e

    .line 160
    :cond_27
    sget-object v1, Lcom/xiaomi/push/ed;->j:Lcom/xiaomi/push/ed;

    iget-object v1, v1, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_28

    return-object v9

    .line 161
    :cond_28
    :goto_e
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "resp-cmd:"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Lcom/xiaomi/push/ha;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ll/ouq0;->D(Ljava/lang/String;)V

    .line 162
    iget-wide v3, v6, Lcom/xiaomi/push/ha;->a:J

    iget-object v1, v6, Lcom/xiaomi/push/ha;->d:Ljava/lang/String;

    .line 163
    invoke-virtual {v6}, Lcom/xiaomi/push/ha;->c()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 p0, v0

    move-object/from16 p4, v1

    move-object/from16 p1, v2

    move-wide/from16 p2, v3

    move-object/from16 p5, v5

    move-object/from16 p6, v6

    .line 164
    invoke-static/range {p0 .. p6}, Ll/qmb0;->a(Ljava/lang/String;Ljava/util/List;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;

    move-result-object v0

    return-object v0

    .line 165
    :pswitch_2
    check-cast v6, Lcom/xiaomi/push/ho;

    .line 166
    iget-wide v2, v6, Lcom/xiaomi/push/ho;->a:J

    cmp-long v0, v2, v10

    if-nez v0, :cond_29

    .line 167
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v6}, Lcom/xiaomi/push/ho;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->removeTopic(Landroid/content/Context;Ljava/lang/String;)V

    .line 168
    :cond_29
    invoke-virtual {v6}, Lcom/xiaomi/push/ho;->b()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2a

    .line 169
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 170
    invoke-virtual {v6}, Lcom/xiaomi/push/ho;->b()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    :cond_2a
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "resp-cmd:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/xiaomi/push/ed;->h:Lcom/xiaomi/push/ed;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Lcom/xiaomi/push/ho;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/ouq0;->D(Ljava/lang/String;)V

    .line 172
    iget-object v0, v1, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    iget-wide v1, v6, Lcom/xiaomi/push/ho;->a:J

    iget-object v3, v6, Lcom/xiaomi/push/ho;->d:Ljava/lang/String;

    .line 173
    invoke-virtual {v6}, Lcom/xiaomi/push/ho;->c()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    move-object/from16 p0, v0

    move-wide/from16 p2, v1

    move-object/from16 p4, v3

    move-object/from16 p5, v4

    move-object/from16 p6, v5

    move-object/from16 p1, v9

    .line 174
    invoke-static/range {p0 .. p6}, Ll/qmb0;->a(Ljava/lang/String;Ljava/util/List;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;

    move-result-object v0

    return-object v0

    .line 175
    :pswitch_3
    check-cast v6, Lcom/xiaomi/push/hk;

    .line 176
    iget-wide v2, v6, Lcom/xiaomi/push/hk;->a:J

    cmp-long v0, v2, v10

    if-nez v0, :cond_2b

    .line 177
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v6}, Lcom/xiaomi/push/hk;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addTopic(Landroid/content/Context;Ljava/lang/String;)V

    .line 178
    :cond_2b
    invoke-virtual {v6}, Lcom/xiaomi/push/hk;->b()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2c

    .line 179
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 180
    invoke-virtual {v6}, Lcom/xiaomi/push/hk;->b()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    :cond_2c
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "resp-cmd:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/xiaomi/push/ed;->g:Lcom/xiaomi/push/ed;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Lcom/xiaomi/push/hk;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/ouq0;->D(Ljava/lang/String;)V

    .line 182
    iget-object v0, v1, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    iget-wide v1, v6, Lcom/xiaomi/push/hk;->a:J

    iget-object v3, v6, Lcom/xiaomi/push/hk;->d:Ljava/lang/String;

    .line 183
    invoke-virtual {v6}, Lcom/xiaomi/push/hk;->c()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    move-object/from16 p0, v0

    move-wide/from16 p2, v1

    move-object/from16 p4, v3

    move-object/from16 p5, v4

    move-object/from16 p6, v5

    move-object/from16 p1, v9

    .line 184
    invoke-static/range {p0 .. p6}, Ll/qmb0;->a(Ljava/lang/String;Ljava/util/List;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;

    move-result-object v0

    return-object v0

    .line 185
    :pswitch_4
    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->b()Z

    move-result v0

    if-nez v0, :cond_2d

    .line 186
    const-string v0, "receiving an un-encrypt message(UnRegistration)."

    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    return-object v9

    .line 187
    :cond_2d
    check-cast v6, Lcom/xiaomi/push/hm;

    .line 188
    iget-wide v2, v6, Lcom/xiaomi/push/hm;->a:J

    cmp-long v0, v2, v10

    if-nez v0, :cond_2e

    .line 189
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/c;->e()V

    .line 190
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearExtras(Landroid/content/Context;)V

    .line 191
    :cond_2e
    invoke-static {}, Lcom/xiaomi/mipush/sdk/PushMessageHandler;->a()V

    :catch_5
    :cond_2f
    :goto_f
    return-object v9

    .line 192
    :pswitch_5
    move-object v0, v6

    check-cast v0, Lcom/xiaomi/push/hg;

    .line 193
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    move-result-object v2

    iget-object v2, v2, Lcom/xiaomi/mipush/sdk/c;->d:Ljava/lang/String;

    .line 194
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_34

    invoke-virtual {v0}, Lcom/xiaomi/push/hg;->a()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_30

    goto/16 :goto_11

    .line 195
    :cond_30
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    move-result-object v2

    invoke-virtual {v2}, Lcom/xiaomi/mipush/sdk/f;->b()J

    move-result-wide v2

    cmp-long v4, v2, v10

    if-lez v4, :cond_31

    .line 196
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long/2addr v6, v2

    const-wide/32 v2, 0xdbba0

    cmp-long v2, v6, v2

    if-lez v2, :cond_31

    .line 197
    const-string v0, "The received registration result has expired."

    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 198
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v0

    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "26"

    invoke-virtual {v0, v1, v2, v5, v3}, Ll/tzq0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v9

    .line 199
    :cond_31
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    move-result-object v2

    iput-object v9, v2, Lcom/xiaomi/mipush/sdk/c;->d:Ljava/lang/String;

    .line 200
    iget-wide v2, v0, Lcom/xiaomi/push/hg;->a:J

    cmp-long v2, v2, v10

    .line 201
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    if-nez v2, :cond_32

    .line 202
    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    move-result-object v2

    iget-object v3, v0, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    iget-object v4, v0, Lcom/xiaomi/push/hg;->f:Ljava/lang/String;

    iget-object v6, v0, Lcom/xiaomi/push/hg;->l:Ljava/lang/String;

    invoke-virtual {v2, v3, v4, v6}, Lcom/xiaomi/mipush/sdk/c;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v2}, Ll/psf;->a(Landroid/content/Context;)V

    .line 204
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v2}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v2

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 205
    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v4

    const/16 v6, 0x1776

    const-string v7, "1"

    .line 206
    invoke-virtual/range {v2 .. v7}, Ll/tzq0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_10

    .line 207
    :cond_32
    invoke-static {v3}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v2

    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v4

    const/16 v6, 0x1776

    const-string v7, "2"

    move-object/from16 v5, p4

    invoke-virtual/range {v2 .. v7}, Ll/tzq0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 208
    :goto_10
    iget-object v2, v0, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_33

    .line 209
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 210
    iget-object v2, v0, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_33
    move-object v11, v9

    .line 211
    invoke-virtual {v0}, Lcom/xiaomi/push/hg;->a()Ljava/util/List;

    move-result-object v16

    .line 212
    sget-object v2, Lcom/xiaomi/push/ed;->a:Lcom/xiaomi/push/ed;

    iget-object v10, v2, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    iget-wide v12, v0, Lcom/xiaomi/push/hg;->a:J

    iget-object v14, v0, Lcom/xiaomi/push/hg;->d:Ljava/lang/String;

    const/4 v15, 0x0

    invoke-static/range {v10 .. v16}, Ll/qmb0;->a(Ljava/lang/String;Ljava/util/List;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;

    move-result-object v0

    .line 213
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/f;->X()V

    return-object v0

    .line 214
    :cond_34
    :goto_11
    const-string v0, "bad Registration result:"

    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 215
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v0

    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "21"

    invoke-virtual {v0, v1, v2, v5, v3}, Ll/tzq0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v9

    .line 216
    :pswitch_6
    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->b()Z

    move-result v4

    if-nez v4, :cond_35

    .line 217
    const-string v0, "receiving an un-encrypt message(SendMessage)."

    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    return-object v9

    .line 218
    :cond_35
    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    move-result-object v4

    invoke-virtual {v4}, Lcom/xiaomi/mipush/sdk/c;->w()Z

    move-result v4

    if-eqz v4, :cond_36

    if-nez v3, :cond_36

    .line 219
    const-string v0, "receive a message in pause state. drop it"

    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 220
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v0

    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "12"

    invoke-virtual {v0, v1, v2, v5, v3}, Ll/tzq0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v9

    .line 221
    :cond_36
    check-cast v6, Lcom/xiaomi/push/hi;

    .line 222
    invoke-virtual {v6}, Lcom/xiaomi/push/hi;->a()Lcom/xiaomi/push/gr;

    move-result-object v4

    if-nez v4, :cond_37

    .line 223
    const-string v0, "receive an empty message without push content, drop it"

    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 224
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v0

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "22"

    invoke-virtual {v0, v4, v6, v5, v7}, Ll/tzq0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0, v2, v3}, Ll/k4r0;->g(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V

    return-object v9

    .line 226
    :cond_37
    const-string v7, "notification_click_button"

    move-object/from16 v13, p6

    invoke-virtual {v13, v7, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    if-eqz v3, :cond_3b

    .line 227
    invoke-static {v2}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Z

    move-result v12

    if-eqz v12, :cond_38

    .line 228
    iget-object v12, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v4}, Lcom/xiaomi/push/gr;->a()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object v14

    iget-object v15, v2, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    move-object/from16 v16, v9

    invoke-virtual {v4}, Lcom/xiaomi/push/gr;->b()Ljava/lang/String;

    move-result-object v9

    invoke-static {v12, v13, v14, v15, v9}, Lcom/xiaomi/mipush/sdk/MiPushClient;->reportIgnoreRegMessageClicked(Landroid/content/Context;Ljava/lang/String;Lcom/xiaomi/push/gs;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_13

    :cond_38
    move-object/from16 v16, v9

    .line 229
    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object v9

    if-eqz v9, :cond_39

    .line 230
    new-instance v9, Lcom/xiaomi/push/gs;

    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object v12

    invoke-direct {v9, v12}, Lcom/xiaomi/push/gs;-><init>(Lcom/xiaomi/push/gs;)V

    goto :goto_12

    .line 231
    :cond_39
    new-instance v9, Lcom/xiaomi/push/gs;

    invoke-direct {v9}, Lcom/xiaomi/push/gs;-><init>()V

    .line 232
    :goto_12
    invoke-virtual {v9}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object v12

    if-nez v12, :cond_3a

    .line 233
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v9, v12}, Lcom/xiaomi/push/gs;->a(Ljava/util/Map;)Lcom/xiaomi/push/gs;

    .line 234
    :cond_3a
    invoke-virtual {v9}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object v12

    const-string v13, "notification_click_button"

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    iget-object v12, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v4}, Lcom/xiaomi/push/gr;->a()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v4}, Lcom/xiaomi/push/gr;->b()Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v13, v9, v14}, Lcom/xiaomi/mipush/sdk/MiPushClient;->reportMessageClicked(Landroid/content/Context;Ljava/lang/String;Lcom/xiaomi/push/gs;Ljava/lang/String;)V

    goto :goto_13

    :cond_3b
    move-object/from16 v16, v9

    :goto_13
    if-nez v3, :cond_3d

    .line 236
    invoke-virtual {v6}, Lcom/xiaomi/push/hi;->d()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3c

    iget-object v9, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 237
    invoke-virtual {v6}, Lcom/xiaomi/push/hi;->d()Ljava/lang/String;

    move-result-object v12

    invoke-static {v9, v12}, Lcom/xiaomi/mipush/sdk/MiPushClient;->aliasSetTime(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v12

    cmp-long v9, v12, v10

    if-gez v9, :cond_3c

    .line 238
    iget-object v9, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v6}, Lcom/xiaomi/push/hi;->d()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addAlias(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_14

    .line 239
    :cond_3c
    invoke-virtual {v6}, Lcom/xiaomi/push/hi;->c()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3d

    iget-object v9, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 240
    invoke-virtual {v6}, Lcom/xiaomi/push/hi;->c()Ljava/lang/String;

    move-result-object v12

    invoke-static {v9, v12}, Lcom/xiaomi/mipush/sdk/MiPushClient;->topicSubscribedTime(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v12

    cmp-long v9, v12, v10

    if-gez v9, :cond_3d

    .line 241
    iget-object v9, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v6}, Lcom/xiaomi/push/hi;->c()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/xiaomi/mipush/sdk/MiPushClient;->addTopic(Landroid/content/Context;Ljava/lang/String;)V

    .line 242
    :cond_3d
    :goto_14
    iget-object v9, v2, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    if-eqz v9, :cond_3e

    invoke-virtual {v9}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object v9

    if-eqz v9, :cond_3e

    .line 243
    iget-object v9, v2, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    iget-object v9, v9, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    const-string v10, "jobkey"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    :goto_15
    move-object v10, v9

    goto :goto_16

    :cond_3e
    move-object/from16 v9, v16

    goto :goto_15

    .line 244
    :goto_16
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_3f

    .line 245
    invoke-virtual {v4}, Lcom/xiaomi/push/gr;->a()Ljava/lang/String;

    move-result-object v9

    :cond_3f
    if-nez v3, :cond_40

    .line 246
    iget-object v11, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v11, v9}, Lcom/xiaomi/mipush/sdk/e;->m(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_40

    .line 247
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "drop a duplicate message, key="

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 248
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v0

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v10, "2:"

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v4, v7, v5, v8}, Ll/tzq0;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v9, v16

    goto/16 :goto_18

    .line 249
    :cond_40
    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object v11

    invoke-static {v6, v11, v3}, Ll/qmb0;->b(Lcom/xiaomi/push/hi;Lcom/xiaomi/push/gs;Z)Lcom/xiaomi/mipush/sdk/MiPushMessage;

    move-result-object v11

    .line 250
    invoke-virtual {v11}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getPassThrough()I

    move-result v12

    if-nez v12, :cond_41

    if-nez v3, :cond_41

    .line 251
    invoke-virtual {v11}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getExtra()Ljava/util/Map;

    move-result-object v12

    invoke-static {v12}, Lcom/xiaomi/push/service/x;->a(Ljava/util/Map;)Z

    move-result v12

    if-eqz v12, :cond_41

    .line 252
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v1, v2, v0}, Lcom/xiaomi/push/service/x;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;[B)Lcom/xiaomi/push/service/x$c;

    return-object v16

    .line 253
    :cond_41
    invoke-virtual {v11}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getExtra()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0, v7}, Lcom/xiaomi/push/service/x;->a(Ljava/util/Map;I)Ljava/lang/String;

    move-result-object v23

    .line 254
    const-string v0, "receive a message, msgid="

    invoke-virtual {v4}, Lcom/xiaomi/push/gr;->a()Ljava/lang/String;

    move-result-object v17

    const-string v18, ", jobkey="

    const-string v20, ", btn="

    .line 255
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    const-string v22, ", typeId="

    const-string v24, ", hasNotified="

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v25

    move-object/from16 v19, v9

    filled-new-array/range {v17 .. v25}, [Ljava/lang/Object;

    move-result-object v9

    .line 256
    invoke-static {v0, v9}, Ll/ouq0;->p(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v3, :cond_48

    .line 257
    invoke-virtual {v11}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getExtra()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_48

    invoke-static/range {v23 .. v23}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_48

    .line 258
    invoke-virtual {v11}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getExtra()Ljava/util/Map;

    move-result-object v0

    if-eqz v7, :cond_42

    .line 259
    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object v3

    if-eqz v3, :cond_42

    .line 260
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    move-result-object v3

    .line 261
    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object v6

    invoke-virtual {v6}, Lcom/xiaomi/push/gs;->c()I

    move-result v6

    invoke-virtual {v3, v6, v7}, Lcom/xiaomi/mipush/sdk/f;->o(II)V

    .line 262
    :cond_42
    invoke-static {v2}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Z

    move-result v3

    .line 263
    iget-object v6, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    if-eqz v3, :cond_44

    .line 264
    iget-object v3, v2, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    invoke-static {v6, v3, v0, v7}, Lcom/xiaomi/mipush/sdk/e;->a(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;I)Landroid/content/Intent;

    move-result-object v0

    .line 265
    const-string v3, "eventMessageType"

    invoke-virtual {v0, v3, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 266
    const-string v3, "messageId"

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 267
    const-string v3, "jobkey"

    invoke-virtual {v0, v3, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 268
    invoke-virtual {v4}, Lcom/xiaomi/push/gr;->c()Ljava/lang/String;

    move-result-object v3

    .line 269
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_43

    .line 270
    const-string v4, "payload"

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 271
    :cond_43
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v3, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 272
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0, v2}, Ll/k4r0;->b(Landroid/content/Context;Lcom/xiaomi/push/hb;)V

    .line 273
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v0

    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 274
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v2

    const/16 v4, 0xbbe

    move-object v3, v5

    move-object/from16 v5, v23

    invoke-virtual/range {v0 .. v5}, Ll/tzq0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 275
    const-string v0, "PushMessageProcessor"

    const-string v1, "start business activity succ"

    invoke-static {v0, v1}, Ll/ouq0;->n(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_17

    :cond_44
    move-object/from16 v3, v23

    .line 276
    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9, v0, v7}, Lcom/xiaomi/mipush/sdk/e;->a(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;I)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_46

    .line 277
    sget-object v4, Lcom/xiaomi/push/service/an;->c:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_45

    .line 278
    const-string v4, "key_message"

    invoke-virtual {v0, v4, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 279
    const-string v4, "eventMessageType"

    invoke-virtual {v0, v4, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 280
    const-string v4, "messageId"

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 281
    const-string v4, "jobkey"

    invoke-virtual {v0, v4, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 282
    :cond_45
    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v4, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 283
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0, v2}, Ll/k4r0;->b(Landroid/content/Context;Lcom/xiaomi/push/hb;)V

    .line 284
    const-string v0, "PushMessageProcessor"

    const-string v2, "start activity succ"

    invoke-static {v0, v2}, Ll/ouq0;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v2

    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 286
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v4

    const/16 v6, 0x3ee

    move-object v7, v3

    move-object v3, v0

    invoke-virtual/range {v2 .. v7}, Ll/tzq0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    move-object v3, v7

    .line 287
    sget-object v0, Lcom/xiaomi/push/service/an;->c:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 288
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v0

    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 289
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "13"

    invoke-virtual {v0, v1, v2, v5, v3}, Ll/tzq0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_17

    .line 290
    :cond_46
    const-string v0, "PushMessageProcessor"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "missing target intent for message: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/xiaomi/push/gr;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", typeId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ll/ouq0;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    :cond_47
    :goto_17
    const-string v0, "PushMessageProcessor"

    const-string v1, "pre-def msg process done."

    invoke-static {v0, v1}, Ll/ouq0;->n(Ljava/lang/String;Ljava/lang/String;)V

    return-object v16

    :cond_48
    move-object v9, v11

    .line 292
    :goto_18
    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object v0

    if-nez v0, :cond_49

    if-nez v3, :cond_49

    .line 293
    invoke-direct {v1, v6, v2}, Lcom/xiaomi/mipush/sdk/e;->k(Lcom/xiaomi/push/hi;Lcom/xiaomi/push/hb;)V

    :cond_49
    return-object v9

    .line 294
    :goto_19
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 295
    const-string v0, "receive a message which action string is not valid. is the reg expired?"

    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 296
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v0

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "20"

    invoke-virtual {v0, v4, v6, v5, v7}, Ll/tzq0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0, v2, v3}, Ll/k4r0;->f(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V

    return-object v16

    .line 298
    :goto_1a
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 299
    invoke-direct/range {p0 .. p1}, Lcom/xiaomi/mipush/sdk/e;->i(Lcom/xiaomi/push/hb;)V

    .line 300
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object v0

    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8}, Ll/szq0;->e(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "19"

    invoke-virtual {v0, v4, v6, v5, v7}, Ll/tzq0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    invoke-static {v0, v2, v3}, Ll/k4r0;->f(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V

    return-object v16

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private d(Lcom/xiaomi/push/hb;[B)Lcom/xiaomi/mipush/sdk/PushMessageHandler$a;
    .locals 3

    .line 1
    const-string p2, "message arrived: receiving an un-recognized message. "

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/s5r0;->d(Landroid/content/Context;Lcom/xiaomi/push/hb;)Lcom/xiaomi/push/hq;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    new-instance p0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p1, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/xiaomi/mipush/sdk/l; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/xiaomi/push/hu; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    return-object v0

    .line 30
    :catch_0
    move-exception p0

    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :catch_1
    move-exception p0

    .line 34
    goto/16 :goto_1

    .line 35
    .line 36
    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v2, "message arrived: processing an arrived message, action="

    .line 43
    .line 44
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget-object v1, Lcom/xiaomi/mipush/sdk/e$a;->a:[I

    .line 58
    .line 59
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    aget p2, v1, p2

    .line 64
    .line 65
    const/4 v1, 0x1

    .line 66
    if-eq p2, v1, :cond_1

    .line 67
    .line 68
    return-object v0

    .line 69
    :cond_1
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->b()Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-nez p2, :cond_2

    .line 74
    .line 75
    const-string p0, "message arrived: receiving an un-encrypt message(SendMessage)."

    .line 76
    .line 77
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-object v0

    .line 81
    :cond_2
    check-cast p0, Lcom/xiaomi/push/hi;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/xiaomi/push/hi;->a()Lcom/xiaomi/push/gr;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    if-nez p2, :cond_3

    .line 88
    .line 89
    const-string p0, "message arrived: receive an empty message without push content, drop it"

    .line 90
    .line 91
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-object v0

    .line 95
    :cond_3
    iget-object v2, p1, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    .line 96
    .line 97
    if-eqz v2, :cond_4

    .line 98
    .line 99
    invoke-virtual {v2}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    if-eqz v2, :cond_4

    .line 104
    .line 105
    iget-object v0, p1, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 108
    .line 109
    const-string v2, "jobkey"

    .line 110
    .line 111
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Ljava/lang/String;

    .line 116
    .line 117
    :cond_4
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    const/4 v2, 0x0

    .line 122
    invoke-static {p0, p1, v2}, Ll/qmb0;->b(Lcom/xiaomi/push/hi;Lcom/xiaomi/push/gs;Z)Lcom/xiaomi/mipush/sdk/MiPushMessage;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0, v1}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->setArrivedMessage(Z)V

    .line 127
    .line 128
    .line 129
    new-instance p1, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string v1, "message arrived: receive a message, msgid="

    .line 132
    .line 133
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2}, Lcom/xiaomi/push/gr;->a()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string p2, ", jobkey="

    .line 144
    .line 145
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-object p0

    .line 159
    :goto_0
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 160
    .line 161
    .line 162
    const-string p0, "message arrived: receive a message which action string is not valid. is the reg expired?"

    .line 163
    .line 164
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    return-object v0

    .line 168
    :goto_1
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 169
    .line 170
    .line 171
    const-string p0, "message arrived: receive a message but decrypt failed. report when click."

    .line 172
    .line 173
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    return-object v0
.end method

.method public static e(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/e;
    .locals 1

    .line 1
    sget-object v0, Lcom/xiaomi/mipush/sdk/e;->b:Lcom/xiaomi/mipush/sdk/e;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/xiaomi/mipush/sdk/e;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/xiaomi/mipush/sdk/e;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/xiaomi/mipush/sdk/e;->b:Lcom/xiaomi/mipush/sdk/e;

    .line 11
    .line 12
    :cond_0
    sget-object p0, Lcom/xiaomi/mipush/sdk/e;->b:Lcom/xiaomi/mipush/sdk/e;

    .line 13
    .line 14
    return-object p0
.end method

.method private g()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "mipush_extra"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    const-wide/16 v3, 0x0

    .line 15
    .line 16
    const-string v5, "last_reinitialize"

    .line 17
    .line 18
    invoke-interface {v0, v5, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    sub-long v3, v1, v3

    .line 23
    .line 24
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    const-wide/32 v6, 0x1b7740

    .line 29
    .line 30
    .line 31
    cmp-long v3, v3, v6

    .line 32
    .line 33
    if-lez v3, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 36
    .line 37
    sget-object v3, Lcom/xiaomi/push/gt;->b:Lcom/xiaomi/push/gt;

    .line 38
    .line 39
    invoke-static {p0, v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->reInitialize(Landroid/content/Context;Lcom/xiaomi/push/gt;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p0, v5, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method private h(Lcom/xiaomi/push/gw;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/xiaomi/push/gw;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "receive ack "

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Ll/ouq0;->w(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/xiaomi/push/gw;->a()Ljava/util/Map;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    const-string v2, "real_source"

    .line 29
    .line 30
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_1

    .line 41
    .line 42
    new-instance v2, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v3, "receive ack : messageId = "

    .line 45
    .line 46
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v3, "  realSource = "

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-static {v2}, Ll/ouq0;->w(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 68
    .line 69
    invoke-static {p0}, Ll/nvq0;->d(Landroid/content/Context;)Ll/nvq0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    iget-wide v2, p1, Lcom/xiaomi/push/gw;->a:J

    .line 74
    .line 75
    const-wide/16 v4, 0x0

    .line 76
    .line 77
    cmp-long p1, v2, v4

    .line 78
    .line 79
    if-nez p1, :cond_0

    .line 80
    .line 81
    const/4 p1, 0x1

    .line 82
    goto :goto_0

    .line 83
    :cond_0
    const/4 p1, 0x0

    .line 84
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p0, v0, v1, p1}, Ll/nvq0;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    return-void
.end method

.method private i(Lcom/xiaomi/push/hb;)V
    .locals 4

    .line 1
    const-string v0, "receive a message but decrypt failed. report now."

    .line 2
    .line 3
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/xiaomi/push/he;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v1, v1, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-direct {v0, v1, v2}, Lcom/xiaomi/push/he;-><init>(Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    sget-object v1, Lcom/xiaomi/push/gp;->u:Lcom/xiaomi/push/gp;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/he;->b(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 30
    .line 31
    .line 32
    iget-object p1, p1, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/he;->d(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 35
    .line 36
    .line 37
    new-instance p1, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 45
    .line 46
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getRegId(Landroid/content/Context;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const-string v3, "regid"

    .line 51
    .line 52
    invoke-interface {p1, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 56
    .line 57
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    sget-object p1, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 62
    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-virtual {p0, v0, p1, v2, v1}, Lcom/xiaomi/mipush/sdk/f;->y(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLcom/xiaomi/push/gs;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private j(Lcom/xiaomi/push/he;)V
    .locals 10

    .line 1
    new-instance v1, Lcom/xiaomi/push/gw;

    .line 2
    .line 3
    invoke-direct {v1}, Lcom/xiaomi/push/gw;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/xiaomi/push/gp;->D:Lcom/xiaomi/push/gp;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Lcom/xiaomi/push/gw;->c(Ljava/lang/String;)Lcom/xiaomi/push/gw;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/xiaomi/push/he;->a()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v1, v0}, Lcom/xiaomi/push/gw;->a(Ljava/lang/String;)Lcom/xiaomi/push/gw;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/xiaomi/push/he;->a()Lcom/xiaomi/push/gu;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v1, v0}, Lcom/xiaomi/push/gw;->a(Lcom/xiaomi/push/gu;)Lcom/xiaomi/push/gw;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/xiaomi/push/he;->b()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v1, v0}, Lcom/xiaomi/push/gw;->b(Ljava/lang/String;)Lcom/xiaomi/push/gw;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/xiaomi/push/he;->d()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {v1, p1}, Lcom/xiaomi/push/gw;->e(Ljava/lang/String;)Lcom/xiaomi/push/gw;

    .line 39
    .line 40
    .line 41
    const-wide/16 v2, 0x0

    .line 42
    .line 43
    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/push/gw;->a(J)Lcom/xiaomi/push/gw;

    .line 44
    .line 45
    .line 46
    const-string p1, "success clear push message."

    .line 47
    .line 48
    invoke-virtual {v1, p1}, Lcom/xiaomi/push/gw;->d(Ljava/lang/String;)Lcom/xiaomi/push/gw;

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sget-object v2, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 58
    .line 59
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v7

    .line 65
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 66
    .line 67
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/c;->d()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    const/4 v9, 0x0

    .line 76
    const/4 v3, 0x0

    .line 77
    const/4 v4, 0x1

    .line 78
    const/4 v5, 0x0

    .line 79
    const/4 v6, 0x0

    .line 80
    invoke-virtual/range {v0 .. v9}, Lcom/xiaomi/mipush/sdk/f;->C(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZZLcom/xiaomi/push/gs;ZLjava/lang/String;Ljava/lang/String;Z)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method private k(Lcom/xiaomi/push/hi;Lcom/xiaomi/push/hb;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/xiaomi/push/gs;->a()Lcom/xiaomi/push/gs;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/xiaomi/push/service/au;->a(Lcom/xiaomi/push/gs;)Lcom/xiaomi/push/gs;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    new-instance v1, Lcom/xiaomi/push/gv;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/xiaomi/push/gv;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/xiaomi/push/hi;->b()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Lcom/xiaomi/push/gv;->b(Ljava/lang/String;)Lcom/xiaomi/push/gv;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/xiaomi/push/hi;->a()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Lcom/xiaomi/push/gv;->a(Ljava/lang/String;)Lcom/xiaomi/push/gv;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/xiaomi/push/hi;->a()Lcom/xiaomi/push/gr;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Lcom/xiaomi/push/gr;->a()J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/push/gv;->a(J)Lcom/xiaomi/push/gv;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/xiaomi/push/hi;->c()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_1

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/xiaomi/push/hi;->c()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v1, v2}, Lcom/xiaomi/push/gv;->c(Ljava/lang/String;)Lcom/xiaomi/push/gv;

    .line 60
    .line 61
    .line 62
    :cond_1
    invoke-virtual {p1}, Lcom/xiaomi/push/hi;->d()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_2

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/xiaomi/push/hi;->d()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {v1, p1}, Lcom/xiaomi/push/gv;->d(Ljava/lang/String;)Lcom/xiaomi/push/gv;

    .line 77
    .line 78
    .line 79
    :cond_2
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 80
    .line 81
    invoke-static {p1, p2}, Lcom/xiaomi/push/m;->b(Landroid/content/Context;Lcom/xiaomi/push/hb;)S

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    invoke-virtual {v1, p1}, Lcom/xiaomi/push/gv;->a(S)Lcom/xiaomi/push/gv;

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 89
    .line 90
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    sget-object p1, Lcom/xiaomi/push/gf;->f:Lcom/xiaomi/push/gf;

    .line 95
    .line 96
    invoke-virtual {p0, v1, p1, v0}, Lcom/xiaomi/mipush/sdk/f;->w(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;Lcom/xiaomi/push/gs;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method private l(Ljava/lang/String;JLcom/xiaomi/mipush/sdk/d;)V
    .locals 3

    .line 1
    invoke-static {p4}, Ll/u2r0;->a(Lcom/xiaomi/mipush/sdk/d;)Lcom/xiaomi/mipush/sdk/v;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-wide/16 v1, 0x0

    .line 9
    .line 10
    cmp-long p2, p2, v1

    .line 11
    .line 12
    if-nez p2, :cond_2

    .line 13
    .line 14
    const-class p2, Ll/m5r0;

    .line 15
    .line 16
    monitor-enter p2

    .line 17
    :try_start_0
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 18
    .line 19
    invoke-static {p3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-virtual {p3, p1}, Ll/m5r0;->f(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 30
    .line 31
    invoke-static {p3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    invoke-virtual {p3, p1}, Ll/m5r0;->h(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const-string p1, "syncing"

    .line 39
    .line 40
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 41
    .line 42
    invoke-static {p3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-virtual {p3, v0}, Ll/m5r0;->b(Lcom/xiaomi/mipush/sdk/v;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 57
    .line 58
    invoke-static {p0}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "synced"

    .line 63
    .line 64
    invoke-virtual {p0, v0, p1}, Ll/m5r0;->d(Lcom/xiaomi/mipush/sdk/v;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    :goto_0
    monitor-exit p2

    .line 71
    return-void

    .line 72
    :goto_1
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    throw p0

    .line 74
    :cond_2
    const-string p2, "syncing"

    .line 75
    .line 76
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 77
    .line 78
    invoke-static {p3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-virtual {p3, v0}, Ll/m5r0;->b(Lcom/xiaomi/mipush/sdk/v;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    if-eqz p2, :cond_5

    .line 91
    .line 92
    const-class p2, Ll/m5r0;

    .line 93
    .line 94
    monitor-enter p2

    .line 95
    :try_start_1
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 96
    .line 97
    invoke-static {p3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    invoke-virtual {p3, p1}, Ll/m5r0;->f(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result p3

    .line 105
    if-eqz p3, :cond_4

    .line 106
    .line 107
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 108
    .line 109
    invoke-static {p3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    invoke-virtual {p3, p1}, Ll/m5r0;->a(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 117
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 118
    .line 119
    const/16 v2, 0xa

    .line 120
    .line 121
    if-ge p3, v2, :cond_3

    .line 122
    .line 123
    :try_start_2
    invoke-static {v1}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 124
    .line 125
    .line 126
    move-result-object p3

    .line 127
    invoke-virtual {p3, p1}, Ll/m5r0;->g(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 131
    .line 132
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    const-string p3, "retry"

    .line 137
    .line 138
    invoke-virtual {p0, p1, v0, p4, p3}, Lcom/xiaomi/mipush/sdk/f;->E(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;Lcom/xiaomi/mipush/sdk/d;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    goto :goto_2

    .line 142
    :catchall_1
    move-exception p0

    .line 143
    goto :goto_3

    .line 144
    :cond_3
    invoke-static {v1}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {p0, p1}, Ll/m5r0;->h(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    :cond_4
    :goto_2
    monitor-exit p2

    .line 152
    return-void

    .line 153
    :goto_3
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 154
    throw p0

    .line 155
    :cond_5
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 156
    .line 157
    invoke-static {p0}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-virtual {p0, p1}, Ll/m5r0;->h(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method private static m(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 7

    .line 1
    sget-object v0, Lcom/xiaomi/mipush/sdk/e;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/c;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v1, Lcom/xiaomi/mipush/sdk/e;->c:Ljava/util/Queue;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    const-string v1, "pref_msg_ids"

    .line 17
    .line 18
    const-string v3, ""

    .line 19
    .line 20
    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v3, ","

    .line 25
    .line 26
    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v3, Ljava/util/LinkedList;

    .line 31
    .line 32
    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 33
    .line 34
    .line 35
    sput-object v3, Lcom/xiaomi/mipush/sdk/e;->c:Ljava/util/Queue;

    .line 36
    .line 37
    array-length v3, v1

    .line 38
    move v4, v2

    .line 39
    :goto_0
    if-ge v4, v3, :cond_0

    .line 40
    .line 41
    aget-object v5, v1, v4

    .line 42
    .line 43
    sget-object v6, Lcom/xiaomi/mipush/sdk/e;->c:Ljava/util/Queue;

    .line 44
    .line 45
    invoke-interface {v6, v5}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    add-int/lit8 v4, v4, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    sget-object v1, Lcom/xiaomi/mipush/sdk/e;->c:Ljava/util/Queue;

    .line 54
    .line 55
    invoke-interface {v1, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    monitor-exit v0

    .line 63
    return p0

    .line 64
    :cond_1
    sget-object v1, Lcom/xiaomi/mipush/sdk/e;->c:Ljava/util/Queue;

    .line 65
    .line 66
    invoke-interface {v1, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    sget-object p1, Lcom/xiaomi/mipush/sdk/e;->c:Ljava/util/Queue;

    .line 70
    .line 71
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    const/16 v1, 0x19

    .line 76
    .line 77
    if-le p1, v1, :cond_2

    .line 78
    .line 79
    sget-object p1, Lcom/xiaomi/mipush/sdk/e;->c:Ljava/util/Queue;

    .line 80
    .line 81
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    :cond_2
    sget-object p1, Lcom/xiaomi/mipush/sdk/e;->c:Ljava/util/Queue;

    .line 85
    .line 86
    const-string v1, ","

    .line 87
    .line 88
    invoke-static {p1, v1}, Ll/bvq0;->d(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string v1, "pref_msg_ids"

    .line 97
    .line 98
    invoke-interface {p0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 99
    .line 100
    .line 101
    invoke-static {p0}, Ll/n5r0;->a(Landroid/content/SharedPreferences$Editor;)V

    .line 102
    .line 103
    .line 104
    monitor-exit v0

    .line 105
    return v2

    .line 106
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    throw p0
.end method

.method private n(Lcom/xiaomi/push/hb;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    const/4 p1, 0x0

    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    return p1

    .line 21
    :cond_1
    const-string v0, "push_server_action"

    .line 22
    .line 23
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ljava/lang/String;

    .line 28
    .line 29
    const-string v0, "hybrid_message"

    .line 30
    .line 31
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    const-string v0, "platform_message"

    .line 38
    .line 39
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    return p1

    .line 47
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 48
    return p0
.end method

.method private o(Lcom/xiaomi/push/gw;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ASSEMBLE_PUSH : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/xiaomi/push/gw;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/xiaomi/push/gw;->a()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1}, Lcom/xiaomi/push/gw;->a()Ljava/util/Map;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-eqz v1, :cond_6

    .line 31
    .line 32
    const-string v2, "RegInfo"

    .line 33
    .line 34
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_6

    .line 45
    .line 46
    new-instance v2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v3, "brand:"

    .line 49
    .line 50
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sget-object v4, Lcom/xiaomi/mipush/sdk/q;->c:Lcom/xiaomi/mipush/sdk/q;

    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_0

    .line 71
    .line 72
    const-string v2, "ASSEMBLE_PUSH : receive fcm token sync ack"

    .line 73
    .line 74
    invoke-static {v2}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 78
    .line 79
    sget-object v3, Lcom/xiaomi/mipush/sdk/d;->b:Lcom/xiaomi/mipush/sdk/d;

    .line 80
    .line 81
    invoke-static {v2, v3, v1}, Ll/n1r0;->m(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-wide v1, p1, Lcom/xiaomi/push/gw;->a:J

    .line 85
    .line 86
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/xiaomi/mipush/sdk/e;->l(Ljava/lang/String;JLcom/xiaomi/mipush/sdk/d;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sget-object v4, Lcom/xiaomi/mipush/sdk/q;->a:Lcom/xiaomi/mipush/sdk/q;

    .line 96
    .line 97
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-nez v2, :cond_5

    .line 113
    .line 114
    new-instance v2, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string v5, "channel:"

    .line 117
    .line 118
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    if-eqz v2, :cond_1

    .line 137
    .line 138
    goto/16 :goto_1

    .line 139
    .line 140
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    sget-object v4, Lcom/xiaomi/mipush/sdk/q;->d:Lcom/xiaomi/mipush/sdk/q;

    .line 146
    .line 147
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v6

    .line 151
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-nez v2, :cond_4

    .line 163
    .line 164
    new-instance v2, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    if-eqz v2, :cond_2

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    sget-object v3, Lcom/xiaomi/mipush/sdk/q;->e:Lcom/xiaomi/mipush/sdk/q;

    .line 193
    .line 194
    invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    if-nez v2, :cond_3

    .line 210
    .line 211
    new-instance v2, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v3

    .line 220
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    if-eqz v2, :cond_6

    .line 232
    .line 233
    :cond_3
    const-string v2, "ASSEMBLE_PUSH : receive FTOS token sync ack"

    .line 234
    .line 235
    invoke-static {v2}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 239
    .line 240
    sget-object v3, Lcom/xiaomi/mipush/sdk/d;->d:Lcom/xiaomi/mipush/sdk/d;

    .line 241
    .line 242
    invoke-static {v2, v3, v1}, Ll/n1r0;->m(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    iget-wide v1, p1, Lcom/xiaomi/push/gw;->a:J

    .line 246
    .line 247
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/xiaomi/mipush/sdk/e;->l(Ljava/lang/String;JLcom/xiaomi/mipush/sdk/d;)V

    .line 248
    .line 249
    .line 250
    return-void

    .line 251
    :cond_4
    :goto_0
    const-string v2, "ASSEMBLE_PUSH : receive COS token sync ack"

    .line 252
    .line 253
    invoke-static {v2}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 257
    .line 258
    sget-object v3, Lcom/xiaomi/mipush/sdk/d;->c:Lcom/xiaomi/mipush/sdk/d;

    .line 259
    .line 260
    invoke-static {v2, v3, v1}, Ll/n1r0;->m(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    iget-wide v1, p1, Lcom/xiaomi/push/gw;->a:J

    .line 264
    .line 265
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/xiaomi/mipush/sdk/e;->l(Ljava/lang/String;JLcom/xiaomi/mipush/sdk/d;)V

    .line 266
    .line 267
    .line 268
    return-void

    .line 269
    :cond_5
    :goto_1
    const-string v2, "ASSEMBLE_PUSH : receive hw token sync ack"

    .line 270
    .line 271
    invoke-static {v2}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 275
    .line 276
    sget-object v3, Lcom/xiaomi/mipush/sdk/d;->a:Lcom/xiaomi/mipush/sdk/d;

    .line 277
    .line 278
    invoke-static {v2, v3, v1}, Ll/n1r0;->m(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    iget-wide v1, p1, Lcom/xiaomi/push/gw;->a:J

    .line 282
    .line 283
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/xiaomi/mipush/sdk/e;->l(Ljava/lang/String;JLcom/xiaomi/mipush/sdk/d;)V

    .line 284
    .line 285
    .line 286
    :cond_6
    return-void
.end method

.method private p(Lcom/xiaomi/push/hb;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/xiaomi/push/gs;->a()Lcom/xiaomi/push/gs;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/xiaomi/push/service/au;->a(Lcom/xiaomi/push/gs;)Lcom/xiaomi/push/gs;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    new-instance v1, Lcom/xiaomi/push/gv;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/xiaomi/push/gv;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Lcom/xiaomi/push/gv;->b(Ljava/lang/String;)Lcom/xiaomi/push/gv;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Lcom/xiaomi/push/gv;->a(Ljava/lang/String;)Lcom/xiaomi/push/gv;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/xiaomi/push/gs;->a()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/push/gv;->a(J)Lcom/xiaomi/push/gv;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/xiaomi/push/gs;->b()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-nez v2, :cond_1

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/xiaomi/push/gs;->b()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v1, v2}, Lcom/xiaomi/push/gv;->c(Ljava/lang/String;)Lcom/xiaomi/push/gv;

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 59
    .line 60
    invoke-static {v2, p1}, Lcom/xiaomi/push/m;->b(Landroid/content/Context;Lcom/xiaomi/push/hb;)S

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-virtual {v1, p1}, Lcom/xiaomi/push/gv;->a(S)Lcom/xiaomi/push/gv;

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 68
    .line 69
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    sget-object p1, Lcom/xiaomi/push/gf;->f:Lcom/xiaomi/push/gf;

    .line 74
    .line 75
    const/4 v2, 0x0

    .line 76
    invoke-virtual {p0, v1, p1, v2, v0}, Lcom/xiaomi/mipush/sdk/f;->y(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLcom/xiaomi/push/gs;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private q(Lcom/xiaomi/push/he;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "detect failed because null"

    .line 8
    .line 9
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string v1, "pkgList"

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {v0, v1, v2}, Lcom/xiaomi/push/service/ag;->a(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    const-string p0, "detect failed because empty"

    .line 29
    .line 30
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 35
    .line 36
    invoke-static {v3, v1}, Lcom/xiaomi/push/g;->i(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    if-eqz v1, :cond_4

    .line 41
    .line 42
    const-string v3, "alive"

    .line 43
    .line 44
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    check-cast v4, Ljava/lang/String;

    .line 49
    .line 50
    const-string v5, "notAlive"

    .line 51
    .line 52
    invoke-interface {v1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    if-nez v6, :cond_3

    .line 63
    .line 64
    new-instance v6, Lcom/xiaomi/push/he;

    .line 65
    .line 66
    invoke-direct {v6}, Lcom/xiaomi/push/he;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/xiaomi/push/he;->a()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    invoke-virtual {v6, v7}, Lcom/xiaomi/push/he;->a(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/xiaomi/push/he;->b()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    invoke-virtual {v6, v7}, Lcom/xiaomi/push/he;->b(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1}, Lcom/xiaomi/push/he;->d()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {v6, p1}, Lcom/xiaomi/push/he;->d(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 88
    .line 89
    .line 90
    sget-object p1, Lcom/xiaomi/push/gp;->ag:Lcom/xiaomi/push/gp;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v6, p1}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 95
    .line 96
    .line 97
    new-instance p1, Ljava/util/HashMap;

    .line 98
    .line 99
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object p1, v6, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 103
    .line 104
    invoke-interface {p1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    const-string p1, "reportNotAliveApp"

    .line 108
    .line 109
    const-string v3, "false"

    .line 110
    .line 111
    invoke-static {v0, p1, v3}, Lcom/xiaomi/push/service/ag;->a(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_2

    .line 122
    .line 123
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-nez p1, :cond_2

    .line 128
    .line 129
    iget-object p1, v6, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 130
    .line 131
    invoke-interface {p1, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    :cond_2
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 135
    .line 136
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    sget-object p1, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 141
    .line 142
    const/4 v0, 0x0

    .line 143
    invoke-virtual {p0, v6, p1, v0, v2}, Lcom/xiaomi/mipush/sdk/f;->y(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLcom/xiaomi/push/gs;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_3
    const-string p0, "detect failed because no alive process"

    .line 148
    .line 149
    invoke-static {p0}, Ll/ouq0;->w(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_4
    const-string p0, "detect failed because get status illegal"

    .line 154
    .line 155
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method


# virtual methods
.method public b(Landroid/content/Intent;)Lcom/xiaomi/mipush/sdk/PushMessageHandler$a;
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v7, p1

    .line 4
    .line 5
    const-string v0, "receive message without registration. need re-register!registered?"

    .line 6
    .line 7
    invoke-virtual {v7}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    new-instance v3, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v4, "receive an intent from server, action="

    .line 14
    .line 15
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-static {v3}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const-string v3, "mrt"

    .line 29
    .line 30
    invoke-virtual {v7, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    if-nez v4, :cond_0

    .line 35
    .line 36
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 37
    .line 38
    .line 39
    move-result-wide v4

    .line 40
    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    :cond_0
    const-string v5, "messageId"

    .line 45
    .line 46
    invoke-virtual {v7, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    const-string v6, "eventMessageType"

    .line 51
    .line 52
    const/4 v8, -0x1

    .line 53
    invoke-virtual {v7, v6, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    const-string v8, "com.xiaomi.mipush.RECEIVE_MESSAGE"

    .line 58
    .line 59
    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    const/4 v9, 0x0

    .line 64
    const-string v10, "mipush_payload"

    .line 65
    .line 66
    const/4 v11, 0x0

    .line 67
    if-eqz v8, :cond_10

    .line 68
    .line 69
    invoke-virtual {v7, v10}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const-string v8, "mipush_notified"

    .line 74
    .line 75
    invoke-virtual {v7, v8, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    if-nez v2, :cond_1

    .line 80
    .line 81
    const-string v0, "receiving an empty message, drop"

    .line 82
    .line 83
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 87
    .line 88
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 93
    .line 94
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    const-string v2, "12"

    .line 99
    .line 100
    invoke-virtual {v0, v1, v7, v2}, Ll/tzq0;->d(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-object v11

    .line 104
    :cond_1
    new-instance v9, Lcom/xiaomi/push/hb;

    .line 105
    .line 106
    invoke-direct {v9}, Lcom/xiaomi/push/hb;-><init>()V

    .line 107
    .line 108
    .line 109
    :try_start_0
    invoke-static {v9, v2}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V

    .line 110
    .line 111
    .line 112
    iget-object v10, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 113
    .line 114
    invoke-static {v10}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 115
    .line 116
    .line 117
    move-result-object v10

    .line 118
    invoke-virtual {v9}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 119
    .line 120
    .line 121
    move-result-object v12

    .line 122
    invoke-virtual {v9}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    .line 123
    .line 124
    .line 125
    move-result-object v13

    .line 126
    sget-object v14, Lcom/xiaomi/push/gf;->e:Lcom/xiaomi/push/gf;

    .line 127
    .line 128
    if-ne v13, v14, :cond_3

    .line 129
    .line 130
    if-eqz v12, :cond_3

    .line 131
    .line 132
    invoke-virtual {v10}, Lcom/xiaomi/mipush/sdk/c;->w()Z

    .line 133
    .line 134
    .line 135
    move-result v13

    .line 136
    if-nez v13, :cond_3

    .line 137
    .line 138
    if-nez v8, :cond_3

    .line 139
    .line 140
    invoke-virtual {v12, v3, v4}, Lcom/xiaomi/push/gs;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    const-string v3, "mat"

    .line 144
    .line 145
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 146
    .line 147
    .line 148
    move-result-wide v15

    .line 149
    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    invoke-virtual {v12, v3, v4}, Lcom/xiaomi/push/gs;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-direct {v1, v9}, Lcom/xiaomi/mipush/sdk/e;->n(Lcom/xiaomi/push/hb;)Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-nez v3, :cond_2

    .line 161
    .line 162
    invoke-direct {v1, v9}, Lcom/xiaomi/mipush/sdk/e;->p(Lcom/xiaomi/push/hb;)V

    .line 163
    .line 164
    .line 165
    goto :goto_0

    .line 166
    :catch_0
    move-exception v0

    .line 167
    goto/16 :goto_3

    .line 168
    .line 169
    :catch_1
    move-exception v0

    .line 170
    goto/16 :goto_4

    .line 171
    .line 172
    :cond_2
    const-string v3, "this is a mina\'s message, ack later"

    .line 173
    .line 174
    invoke-static {v3}, Ll/ouq0;->w(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    const-string v3, "__hybrid_message_ts"

    .line 178
    .line 179
    invoke-virtual {v12}, Lcom/xiaomi/push/gs;->a()J

    .line 180
    .line 181
    .line 182
    move-result-wide v15

    .line 183
    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    invoke-virtual {v12, v3, v4}, Lcom/xiaomi/push/gs;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    const-string v3, "__hybrid_device_status"

    .line 191
    .line 192
    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 193
    .line 194
    invoke-static {v4, v9}, Lcom/xiaomi/push/m;->b(Landroid/content/Context;Lcom/xiaomi/push/hb;)S

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    invoke-virtual {v12, v3, v4}, Lcom/xiaomi/push/gs;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    :cond_3
    :goto_0
    invoke-virtual {v9}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    .line 206
    .line 207
    .line 208
    move-result-object v3
    :try_end_0
    .catch Lcom/xiaomi/push/hu; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 209
    const-string v4, ""

    .line 210
    .line 211
    if-ne v3, v14, :cond_7

    .line 212
    .line 213
    :try_start_1
    invoke-virtual {v9}, Lcom/xiaomi/push/hb;->b()Z

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    if-nez v3, :cond_7

    .line 218
    .line 219
    invoke-static {v9}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_5

    .line 224
    .line 225
    const-string v0, "drop an un-encrypted wake-up messages. %1$s, %2$s"

    .line 226
    .line 227
    invoke-virtual {v9}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    if-eqz v12, :cond_4

    .line 232
    .line 233
    invoke-virtual {v12}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v4

    .line 237
    :cond_4
    filled-new-array {v2, v4}, [Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 249
    .line 250
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 255
    .line 256
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    const-string v3, "13: %1$s"

    .line 261
    .line 262
    invoke-virtual {v9}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v4

    .line 266
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v3

    .line 274
    invoke-virtual {v0, v2, v7, v3}, Ll/tzq0;->d(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    goto :goto_1

    .line 278
    :cond_5
    const-string v0, "drop an un-encrypted messages. %1$s, %2$s"

    .line 279
    .line 280
    invoke-virtual {v9}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    if-eqz v12, :cond_6

    .line 285
    .line 286
    invoke-virtual {v12}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v4

    .line 290
    :cond_6
    filled-new-array {v2, v4}, [Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object v2

    .line 294
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 302
    .line 303
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 308
    .line 309
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v2

    .line 313
    const-string v3, "14: %1$s"

    .line 314
    .line 315
    invoke-virtual {v9}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v4

    .line 323
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v3

    .line 327
    invoke-virtual {v0, v2, v7, v3}, Ll/tzq0;->d(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    :goto_1
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 331
    .line 332
    invoke-static {v0, v9, v8}, Ll/k4r0;->c(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V

    .line 333
    .line 334
    .line 335
    return-object v11

    .line 336
    :cond_7
    invoke-virtual {v9}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    .line 337
    .line 338
    .line 339
    move-result-object v3

    .line 340
    if-ne v3, v14, :cond_a

    .line 341
    .line 342
    invoke-virtual {v9}, Lcom/xiaomi/push/hb;->b()Z

    .line 343
    .line 344
    .line 345
    move-result v3

    .line 346
    if-eqz v3, :cond_a

    .line 347
    .line 348
    invoke-static {v9}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Z

    .line 349
    .line 350
    .line 351
    move-result v3

    .line 352
    if-eqz v3, :cond_a

    .line 353
    .line 354
    if-eqz v8, :cond_8

    .line 355
    .line 356
    if-eqz v12, :cond_8

    .line 357
    .line 358
    invoke-virtual {v12}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    .line 359
    .line 360
    .line 361
    move-result-object v3

    .line 362
    if-eqz v3, :cond_8

    .line 363
    .line 364
    invoke-virtual {v12}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    .line 365
    .line 366
    .line 367
    move-result-object v3

    .line 368
    const-string v13, "notify_effect"

    .line 369
    .line 370
    invoke-interface {v3, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 371
    .line 372
    .line 373
    move-result v3

    .line 374
    if-eqz v3, :cond_8

    .line 375
    .line 376
    goto :goto_2

    .line 377
    :cond_8
    const-string v0, "drop a wake-up messages which not has \'notify_effect\' attr. %1$s, %2$s"

    .line 378
    .line 379
    invoke-virtual {v9}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    if-eqz v12, :cond_9

    .line 384
    .line 385
    invoke-virtual {v12}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v4

    .line 389
    :cond_9
    filled-new-array {v2, v4}, [Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    move-result-object v2

    .line 393
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 398
    .line 399
    .line 400
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 401
    .line 402
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 403
    .line 404
    .line 405
    move-result-object v0

    .line 406
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 407
    .line 408
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object v2

    .line 412
    const-string v3, "25: %1$s"

    .line 413
    .line 414
    invoke-virtual {v9}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v4

    .line 418
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 419
    .line 420
    .line 421
    move-result-object v4

    .line 422
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v3

    .line 426
    invoke-virtual {v0, v2, v7, v3}, Ll/tzq0;->d(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 430
    .line 431
    invoke-static {v0, v9, v8}, Ll/k4r0;->e(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V

    .line 432
    .line 433
    .line 434
    return-object v11

    .line 435
    :cond_a
    :goto_2
    invoke-virtual {v10}, Lcom/xiaomi/mipush/sdk/c;->s()Z

    .line 436
    .line 437
    .line 438
    move-result v3

    .line 439
    if-nez v3, :cond_c

    .line 440
    .line 441
    iget-object v3, v9, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    .line 442
    .line 443
    sget-object v4, Lcom/xiaomi/push/gf;->a:Lcom/xiaomi/push/gf;

    .line 444
    .line 445
    if-eq v3, v4, :cond_c

    .line 446
    .line 447
    invoke-static {v9}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Z

    .line 448
    .line 449
    .line 450
    move-result v3

    .line 451
    if-eqz v3, :cond_b

    .line 452
    .line 453
    move-object v4, v2

    .line 454
    move v3, v8

    .line 455
    move-object v2, v9

    .line 456
    invoke-direct/range {v1 .. v7}, Lcom/xiaomi/mipush/sdk/e;->c(Lcom/xiaomi/push/hb;Z[BLjava/lang/String;ILandroid/content/Intent;)Lcom/xiaomi/mipush/sdk/PushMessageHandler$a;

    .line 457
    .line 458
    .line 459
    move-result-object v0

    .line 460
    return-object v0

    .line 461
    :cond_b
    move v3, v8

    .line 462
    move-object v2, v9

    .line 463
    iget-object v4, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 464
    .line 465
    invoke-static {v4, v2, v3}, Ll/k4r0;->h(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V

    .line 466
    .line 467
    .line 468
    invoke-virtual {v10}, Lcom/xiaomi/mipush/sdk/c;->u()Z

    .line 469
    .line 470
    .line 471
    move-result v2

    .line 472
    new-instance v3, Ljava/lang/StringBuilder;

    .line 473
    .line 474
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 475
    .line 476
    .line 477
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 478
    .line 479
    .line 480
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object v0

    .line 484
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 488
    .line 489
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 494
    .line 495
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 496
    .line 497
    .line 498
    move-result-object v3

    .line 499
    const-string v4, "15"

    .line 500
    .line 501
    invoke-virtual {v0, v3, v7, v4}, Ll/tzq0;->d(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    .line 502
    .line 503
    .line 504
    if-eqz v2, :cond_17

    .line 505
    .line 506
    invoke-direct {v1}, Lcom/xiaomi/mipush/sdk/e;->g()V

    .line 507
    .line 508
    .line 509
    goto/16 :goto_6

    .line 510
    .line 511
    :cond_c
    move-object v4, v2

    .line 512
    move v3, v8

    .line 513
    move-object v2, v9

    .line 514
    invoke-virtual {v10}, Lcom/xiaomi/mipush/sdk/c;->s()Z

    .line 515
    .line 516
    .line 517
    move-result v0

    .line 518
    if-eqz v0, :cond_f

    .line 519
    .line 520
    invoke-virtual {v10}, Lcom/xiaomi/mipush/sdk/c;->y()Z

    .line 521
    .line 522
    .line 523
    move-result v0

    .line 524
    if-eqz v0, :cond_f

    .line 525
    .line 526
    iget-object v0, v2, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    .line 527
    .line 528
    sget-object v4, Lcom/xiaomi/push/gf;->b:Lcom/xiaomi/push/gf;

    .line 529
    .line 530
    if-ne v0, v4, :cond_e

    .line 531
    .line 532
    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->b()Z

    .line 533
    .line 534
    .line 535
    move-result v0

    .line 536
    if-eqz v0, :cond_d

    .line 537
    .line 538
    invoke-virtual {v10}, Lcom/xiaomi/mipush/sdk/c;->e()V

    .line 539
    .line 540
    .line 541
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 542
    .line 543
    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearExtras(Landroid/content/Context;)V

    .line 544
    .line 545
    .line 546
    invoke-static {}, Lcom/xiaomi/mipush/sdk/PushMessageHandler;->a()V

    .line 547
    .line 548
    .line 549
    goto/16 :goto_6

    .line 550
    .line 551
    :cond_d
    const-string v0, "receiving an un-encrypt unregistration message"

    .line 552
    .line 553
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 554
    .line 555
    .line 556
    goto/16 :goto_6

    .line 557
    .line 558
    :cond_e
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 559
    .line 560
    invoke-static {v0, v2, v3}, Ll/k4r0;->h(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)V

    .line 561
    .line 562
    .line 563
    iget-object v0, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 564
    .line 565
    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->unregisterPush(Landroid/content/Context;)V

    .line 566
    .line 567
    .line 568
    goto/16 :goto_6

    .line 569
    .line 570
    :cond_f
    invoke-direct/range {v1 .. v7}, Lcom/xiaomi/mipush/sdk/e;->c(Lcom/xiaomi/push/hb;Z[BLjava/lang/String;ILandroid/content/Intent;)Lcom/xiaomi/mipush/sdk/PushMessageHandler$a;

    .line 571
    .line 572
    .line 573
    move-result-object v0
    :try_end_1
    .catch Lcom/xiaomi/push/hu; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 574
    return-object v0

    .line 575
    :goto_3
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 576
    .line 577
    invoke-static {v2}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 578
    .line 579
    .line 580
    move-result-object v2

    .line 581
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 582
    .line 583
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 584
    .line 585
    .line 586
    move-result-object v1

    .line 587
    const-string v3, "17"

    .line 588
    .line 589
    invoke-virtual {v2, v1, v7, v3}, Ll/tzq0;->d(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    .line 590
    .line 591
    .line 592
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 593
    .line 594
    .line 595
    goto/16 :goto_6

    .line 596
    .line 597
    :goto_4
    iget-object v2, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 598
    .line 599
    invoke-static {v2}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 600
    .line 601
    .line 602
    move-result-object v2

    .line 603
    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 604
    .line 605
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 606
    .line 607
    .line 608
    move-result-object v1

    .line 609
    const-string v3, "16"

    .line 610
    .line 611
    invoke-virtual {v2, v1, v7, v3}, Ll/tzq0;->d(Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V

    .line 612
    .line 613
    .line 614
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 615
    .line 616
    .line 617
    goto/16 :goto_6

    .line 618
    .line 619
    :cond_10
    const-string v0, "com.xiaomi.mipush.ERROR"

    .line 620
    .line 621
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 622
    .line 623
    .line 624
    move-result v0

    .line 625
    if-eqz v0, :cond_12

    .line 626
    .line 627
    new-instance v0, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;

    .line 628
    .line 629
    invoke-direct {v0}, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;-><init>()V

    .line 630
    .line 631
    .line 632
    new-instance v1, Lcom/xiaomi/push/hb;

    .line 633
    .line 634
    invoke-direct {v1}, Lcom/xiaomi/push/hb;-><init>()V

    .line 635
    .line 636
    .line 637
    :try_start_2
    invoke-virtual {v7, v10}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    .line 638
    .line 639
    .line 640
    move-result-object v2

    .line 641
    if-eqz v2, :cond_11

    .line 642
    .line 643
    invoke-static {v1, v2}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V
    :try_end_2
    .catch Lcom/xiaomi/push/hu; {:try_start_2 .. :try_end_2} :catch_2

    .line 644
    .line 645
    .line 646
    :catch_2
    :cond_11
    invoke-virtual {v1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    .line 647
    .line 648
    .line 649
    move-result-object v1

    .line 650
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 651
    .line 652
    .line 653
    move-result-object v1

    .line 654
    invoke-virtual {v0, v1}, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;->setCommand(Ljava/lang/String;)V

    .line 655
    .line 656
    .line 657
    const-string v1, "mipush_error_code"

    .line 658
    .line 659
    invoke-virtual {v7, v1, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 660
    .line 661
    .line 662
    move-result v2

    .line 663
    int-to-long v2, v2

    .line 664
    invoke-virtual {v0, v2, v3}, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;->setResultCode(J)V

    .line 665
    .line 666
    .line 667
    const-string v2, "mipush_error_msg"

    .line 668
    .line 669
    invoke-virtual {v7, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 670
    .line 671
    .line 672
    move-result-object v3

    .line 673
    invoke-virtual {v0, v3}, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;->setReason(Ljava/lang/String;)V

    .line 674
    .line 675
    .line 676
    new-instance v3, Ljava/lang/StringBuilder;

    .line 677
    .line 678
    const-string v4, "receive a error message. code = "

    .line 679
    .line 680
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 681
    .line 682
    .line 683
    invoke-virtual {v7, v1, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 684
    .line 685
    .line 686
    move-result v1

    .line 687
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 688
    .line 689
    .line 690
    const-string v1, ", msg= "

    .line 691
    .line 692
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 693
    .line 694
    .line 695
    invoke-virtual {v7, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 696
    .line 697
    .line 698
    move-result-object v1

    .line 699
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 700
    .line 701
    .line 702
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 703
    .line 704
    .line 705
    move-result-object v1

    .line 706
    invoke-static {v1}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 707
    .line 708
    .line 709
    return-object v0

    .line 710
    :cond_12
    const-string v0, "com.xiaomi.mipush.MESSAGE_ARRIVED"

    .line 711
    .line 712
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 713
    .line 714
    .line 715
    move-result v0

    .line 716
    if-eqz v0, :cond_17

    .line 717
    .line 718
    invoke-virtual {v7, v10}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    .line 719
    .line 720
    .line 721
    move-result-object v0

    .line 722
    if-nez v0, :cond_13

    .line 723
    .line 724
    const-string v0, "message arrived: receiving an empty message, drop"

    .line 725
    .line 726
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 727
    .line 728
    .line 729
    return-object v11

    .line 730
    :cond_13
    new-instance v2, Lcom/xiaomi/push/hb;

    .line 731
    .line 732
    invoke-direct {v2}, Lcom/xiaomi/push/hb;-><init>()V

    .line 733
    .line 734
    .line 735
    :try_start_3
    invoke-static {v2, v0}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V

    .line 736
    .line 737
    .line 738
    iget-object v3, v1, Lcom/xiaomi/mipush/sdk/e;->a:Landroid/content/Context;

    .line 739
    .line 740
    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 741
    .line 742
    .line 743
    move-result-object v3

    .line 744
    invoke-static {v2}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Z

    .line 745
    .line 746
    .line 747
    move-result v4

    .line 748
    if-eqz v4, :cond_14

    .line 749
    .line 750
    const-string v0, "message arrived: receive ignore reg message, ignore!"

    .line 751
    .line 752
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 753
    .line 754
    .line 755
    goto :goto_6

    .line 756
    :catch_3
    move-exception v0

    .line 757
    goto :goto_5

    .line 758
    :cond_14
    invoke-virtual {v3}, Lcom/xiaomi/mipush/sdk/c;->s()Z

    .line 759
    .line 760
    .line 761
    move-result v4

    .line 762
    if-nez v4, :cond_15

    .line 763
    .line 764
    const-string v0, "message arrived: receive message without registration. need unregister or re-register!"

    .line 765
    .line 766
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 767
    .line 768
    .line 769
    goto :goto_6

    .line 770
    :cond_15
    invoke-virtual {v3}, Lcom/xiaomi/mipush/sdk/c;->s()Z

    .line 771
    .line 772
    .line 773
    move-result v4

    .line 774
    if-eqz v4, :cond_16

    .line 775
    .line 776
    invoke-virtual {v3}, Lcom/xiaomi/mipush/sdk/c;->y()Z

    .line 777
    .line 778
    .line 779
    move-result v3

    .line 780
    if-eqz v3, :cond_16

    .line 781
    .line 782
    const-string v0, "message arrived: app info is invalidated"

    .line 783
    .line 784
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 785
    .line 786
    .line 787
    goto :goto_6

    .line 788
    :cond_16
    invoke-direct {v1, v2, v0}, Lcom/xiaomi/mipush/sdk/e;->d(Lcom/xiaomi/push/hb;[B)Lcom/xiaomi/mipush/sdk/PushMessageHandler$a;

    .line 789
    .line 790
    .line 791
    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 792
    return-object v0

    .line 793
    :goto_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 794
    .line 795
    const-string v2, "fail to deal with arrived message. "

    .line 796
    .line 797
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 798
    .line 799
    .line 800
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 801
    .line 802
    .line 803
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 804
    .line 805
    .line 806
    move-result-object v0

    .line 807
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 808
    .line 809
    .line 810
    :cond_17
    :goto_6
    return-object v11
.end method

.method public f(Ljava/util/TimeZone;Ljava/util/TimeZone;Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TimeZone;",
            "Ljava/util/TimeZone;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p3

    .line 8
    :cond_0
    invoke-virtual {p1}, Ljava/util/TimeZone;->getRawOffset()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-virtual {p2}, Ljava/util/TimeZone;->getRawOffset()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    sub-int/2addr p0, p1

    .line 17
    div-int/lit16 p0, p0, 0x3e8

    .line 18
    .line 19
    div-int/lit8 p0, p0, 0x3c

    .line 20
    .line 21
    int-to-long p0, p0

    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/String;

    .line 28
    .line 29
    const-string v1, ":"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    aget-object v0, v0, p2

    .line 36
    .line 37
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const/4 v4, 0x1

    .line 52
    aget-object v0, v0, v4

    .line 53
    .line 54
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 55
    .line 56
    .line 57
    move-result-wide v5

    .line 58
    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    aget-object p2, v0, p2

    .line 69
    .line 70
    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 71
    .line 72
    .line 73
    move-result-wide v7

    .line 74
    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    check-cast p2, Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    aget-object p2, p2, v4

    .line 85
    .line 86
    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 87
    .line 88
    .line 89
    move-result-wide p2

    .line 90
    const-wide/16 v0, 0x3c

    .line 91
    .line 92
    mul-long/2addr v2, v0

    .line 93
    add-long/2addr v2, v5

    .line 94
    sub-long/2addr v2, p0

    .line 95
    const-wide/16 v4, 0x5a0

    .line 96
    .line 97
    add-long/2addr v2, v4

    .line 98
    rem-long/2addr v2, v4

    .line 99
    mul-long/2addr v7, v0

    .line 100
    add-long/2addr v7, p2

    .line 101
    sub-long/2addr v7, p0

    .line 102
    add-long/2addr v7, v4

    .line 103
    rem-long/2addr v7, v4

    .line 104
    new-instance p0, Ljava/util/ArrayList;

    .line 105
    .line 106
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .line 108
    .line 109
    div-long p1, v2, v0

    .line 110
    .line 111
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    rem-long/2addr v2, v0

    .line 116
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    const-string p2, "%1$02d:%2$02d"

    .line 125
    .line 126
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    div-long v2, v7, v0

    .line 134
    .line 135
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    rem-long/2addr v7, v0

    .line 140
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 141
    .line 142
    .line 143
    move-result-object p3

    .line 144
    filled-new-array {p1, p3}, [Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    return-object p0
.end method
