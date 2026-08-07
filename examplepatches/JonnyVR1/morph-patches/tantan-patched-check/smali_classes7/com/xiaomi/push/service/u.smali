.class public Lcom/xiaomi/push/service/u;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a([BJ)Landroid/content/Intent;
    .locals 3

    .line 1295
    invoke-static {p0}, Lcom/xiaomi/push/service/u;->a([B)Lcom/xiaomi/push/hb;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1296
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.xiaomi.mipush.RECEIVE_MESSAGE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1297
    const-string v2, "mipush_payload"

    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 1298
    const-string p0, "mrt"

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1299
    iget-object p0, v0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    invoke-virtual {v1, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    return-object v1
.end method

.method public static a(Landroid/content/Context;Lcom/xiaomi/push/hb;)Lcom/xiaomi/push/hb;
    .locals 1

    const/4 v0, 0x0

    .line 1361
    invoke-static {p0, p1, v0}, Lcom/xiaomi/push/service/u;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;Ljava/util/Map;)Lcom/xiaomi/push/hb;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;Lcom/xiaomi/push/hb;Ljava/util/Map;)Lcom/xiaomi/push/hb;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/xiaomi/push/hb;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/xiaomi/push/hb;"
        }
    .end annotation

    .line 1362
    new-instance v0, Lcom/xiaomi/push/gv;

    invoke-direct {v0}, Lcom/xiaomi/push/gv;-><init>()V

    .line 1363
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/gv;->b(Ljava/lang/String;)Lcom/xiaomi/push/gv;

    .line 1364
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1365
    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/xiaomi/push/gv;->a(Ljava/lang/String;)Lcom/xiaomi/push/gv;

    .line 1366
    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->a()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/xiaomi/push/gv;->a(J)Lcom/xiaomi/push/gv;

    .line 1367
    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->b()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1368
    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/gv;->c(Ljava/lang/String;)Lcom/xiaomi/push/gv;

    .line 1369
    :cond_0
    invoke-static {p0, p1}, Lcom/xiaomi/push/m;->b(Landroid/content/Context;Lcom/xiaomi/push/hb;)S

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/gv;->a(S)Lcom/xiaomi/push/gv;

    .line 1370
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/xiaomi/push/gf;->f:Lcom/xiaomi/push/gf;

    .line 1371
    invoke-static {v1, v2, v0, v3}, Lcom/xiaomi/push/service/w;->a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;

    move-result-object v0

    .line 1372
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1373
    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->a()Lcom/xiaomi/push/gs;

    move-result-object v1

    invoke-static {v1}, Lcom/xiaomi/push/service/au;->a(Lcom/xiaomi/push/gs;)Lcom/xiaomi/push/gs;

    move-result-object v1

    .line 1374
    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 1375
    const-string v3, "channel_id"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 1376
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    const-string v4, "mat"

    invoke-virtual {v1, v4, v3}, Lcom/xiaomi/push/gs;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 1377
    iget-object p1, p1, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 1378
    invoke-static {p0, p1, v2}, Lcom/xiaomi/push/service/f;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    .line 1379
    const-string p1, "cs"

    invoke-virtual {v1, p1, p0}, Lcom/xiaomi/push/gs;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    if-eqz p2, :cond_3

    .line 1380
    :try_start_0
    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result p0

    if-lez p0, :cond_3

    .line 1381
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 1382
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, p1, v2}, Lcom/xiaomi/push/gs;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 1383
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "error adding params to ack message :"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 1384
    :cond_3
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/hb;->a(Lcom/xiaomi/push/gs;)Lcom/xiaomi/push/hb;

    return-object v0
.end method

.method public static a([B)Lcom/xiaomi/push/hb;
    .locals 1

    .line 1300
    new-instance v0, Lcom/xiaomi/push/hb;

    invoke-direct {v0}, Lcom/xiaomi/push/hb;-><init>()V

    .line 1301
    :try_start_0
    invoke-static {v0, p0}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception p0

    .line 1302
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Landroid/content/Context;Lcom/xiaomi/push/hb;[B)V
    .locals 10

    .line 1306
    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/xiaomi/push/service/x;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;[B)Lcom/xiaomi/push/service/x$c;

    move-result-object v0

    .line 1307
    iget-wide v1, v0, Lcom/xiaomi/push/service/x$c;->a:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    iget-object v1, v0, Lcom/xiaomi/push/service/x$c;->a:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1308
    iget-object v3, v0, Lcom/xiaomi/push/service/x$c;->a:Ljava/lang/String;

    iget-wide v4, v0, Lcom/xiaomi/push/service/x$c;->a:J

    .line 1309
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v2, p0

    .line 1310
    invoke-static/range {v2 .. v9}, Ll/p2r0;->j(Landroid/content/Context;Ljava/lang/String;JZZJ)V

    goto :goto_0

    :cond_0
    move-object v2, p0

    .line 1311
    :goto_0
    invoke-static {v2}, Ll/l4r0;->j(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_1

    iget-boolean p0, v0, Lcom/xiaomi/push/service/x$c;->a:Z

    .line 1312
    invoke-static {v2, p1, p0}, Lcom/xiaomi/push/service/v;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 1313
    invoke-static {v2, p1}, Lcom/xiaomi/push/service/v;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;)V

    .line 1314
    const-string p0, "consume this broadcast by tts"

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return-void

    .line 1315
    :cond_1
    invoke-static {v2, p1, p2}, Lcom/xiaomi/push/service/u;->b(Landroid/content/Context;Lcom/xiaomi/push/hb;[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 1316
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "notify push msg error "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 1317
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method private static a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V
    .locals 2

    .line 1345
    new-instance v0, Lcom/xiaomi/push/service/u$1;

    const/4 v1, 0x4

    invoke-direct {v0, v1, p0, p1}, Lcom/xiaomi/push/service/u$1;-><init>(ILcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    return-void
.end method

.method private static a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;Lcom/xiaomi/push/he;)V
    .locals 2

    .line 1360
    new-instance v0, Lcom/xiaomi/push/service/u$7;

    const/4 v1, 0x4

    invoke-direct {v0, v1, p2, p1, p0}, Lcom/xiaomi/push/service/u$7;-><init>(ILcom/xiaomi/push/he;Lcom/xiaomi/push/hb;Lcom/xiaomi/push/service/XMPushService;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    return-void
.end method

.method private static a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;Ljava/lang/String;)V
    .locals 2

    .line 1358
    new-instance v0, Lcom/xiaomi/push/service/u$5;

    const/4 v1, 0x4

    invoke-direct {v0, v1, p0, p1, p2}, Lcom/xiaomi/push/service/u$5;-><init>(ILcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    return-void
.end method

.method private static a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1359
    new-instance v0, Lcom/xiaomi/push/service/u$6;

    const/4 v1, 0x4

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/xiaomi/push/service/u$6;-><init>(ILcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    return-void
.end method

.method public static a(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;[BLandroid/content/Intent;)V
    .locals 20

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    const-string v3, "receiving an un-recognized notification message. "

    .line 8
    .line 9
    invoke-static {v0}, Lcom/xiaomi/push/service/u;->a([B)Lcom/xiaomi/push/hb;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    const/4 v6, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v7

    .line 24
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v8

    .line 28
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    .line 29
    .line 30
    .line 31
    move-result-object v9

    .line 32
    array-length v10, v0

    .line 33
    invoke-static {v7, v8, v6, v9, v10}, Ll/jxq0;->f(Ljava/lang/String;Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-static {v4}, Lcom/xiaomi/push/service/u;->c(Lcom/xiaomi/push/hb;)Z

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    if-eqz v7, :cond_2

    .line 41
    .line 42
    invoke-static/range {p0 .. p1}, Lcom/xiaomi/push/service/u;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    if-eqz v7, :cond_2

    .line 47
    .line 48
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->e(Lcom/xiaomi/push/hb;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    const-string v6, "5"

    .line 75
    .line 76
    invoke-virtual {v0, v2, v3, v5, v6}, Ll/tzq0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    invoke-static {v1, v4}, Lcom/xiaomi/push/service/u;->c(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    invoke-static {v4}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/hb;)Z

    .line 84
    .line 85
    .line 86
    move-result v7

    .line 87
    if-eqz v7, :cond_4

    .line 88
    .line 89
    invoke-static/range {p0 .. p1}, Lcom/xiaomi/push/service/u;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    if-nez v7, :cond_4

    .line 94
    .line 95
    invoke-static {v4}, Lcom/xiaomi/push/service/u;->b(Lcom/xiaomi/push/hb;)Z

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    if-nez v7, :cond_4

    .line 100
    .line 101
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->e(Lcom/xiaomi/push/hb;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    const-string v6, "6"

    .line 128
    .line 129
    invoke-virtual {v0, v2, v3, v5, v6}, Ll/tzq0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    :cond_3
    invoke-static {v1, v4}, Lcom/xiaomi/push/service/u;->d(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_4
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Z

    .line 137
    .line 138
    .line 139
    move-result v7

    .line 140
    if-eqz v7, :cond_5

    .line 141
    .line 142
    iget-object v7, v4, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {v1, v7}, Lcom/xiaomi/push/g;->p(Landroid/content/Context;Ljava/lang/String;)Z

    .line 145
    .line 146
    .line 147
    move-result v7

    .line 148
    if-nez v7, :cond_6

    .line 149
    .line 150
    :cond_5
    invoke-static {v1, v2}, Lcom/xiaomi/push/service/u;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 151
    .line 152
    .line 153
    move-result v7

    .line 154
    if-eqz v7, :cond_1f

    .line 155
    .line 156
    :cond_6
    sget-object v7, Lcom/xiaomi/push/gf;->a:Lcom/xiaomi/push/gf;

    .line 157
    .line 158
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    .line 159
    .line 160
    .line 161
    move-result-object v8

    .line 162
    const/4 v9, 0x0

    .line 163
    const-string v10, "eventMessageType"

    .line 164
    .line 165
    const-string v11, "messageId"

    .line 166
    .line 167
    if-ne v7, v8, :cond_8

    .line 168
    .line 169
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v13

    .line 173
    const-string v7, "pref_registered_pkg_names"

    .line 174
    .line 175
    invoke-virtual {v1, v7, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 176
    .line 177
    .line 178
    move-result-object v7

    .line 179
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 180
    .line 181
    .line 182
    move-result-object v7

    .line 183
    iget-object v8, v4, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

    .line 184
    .line 185
    invoke-interface {v7, v13, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 186
    .line 187
    .line 188
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 189
    .line 190
    .line 191
    invoke-static {v4}, Lcom/xiaomi/push/service/l;->a(Lcom/xiaomi/push/hb;)Lcom/xiaomi/push/hg;

    .line 192
    .line 193
    .line 194
    move-result-object v7

    .line 195
    invoke-virtual {v7}, Lcom/xiaomi/push/hg;->a()J

    .line 196
    .line 197
    .line 198
    move-result-wide v14

    .line 199
    const-wide/16 v16, 0x0

    .line 200
    .line 201
    cmp-long v8, v14, v16

    .line 202
    .line 203
    if-nez v8, :cond_7

    .line 204
    .line 205
    invoke-virtual {v7}, Lcom/xiaomi/push/hg;->b()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v8

    .line 209
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 210
    .line 211
    .line 212
    move-result v8

    .line 213
    if-nez v8, :cond_7

    .line 214
    .line 215
    invoke-virtual {v7}, Lcom/xiaomi/push/hg;->b()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v7

    .line 219
    invoke-static {v1, v13, v7}, Lcom/xiaomi/push/service/l;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    goto :goto_0

    .line 223
    :cond_7
    const-string v7, "read regSecret failed"

    .line 224
    .line 225
    invoke-static {v7}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    :goto_0
    invoke-static {v1}, Lcom/xiaomi/push/service/r;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/r;

    .line 229
    .line 230
    .line 231
    move-result-object v7

    .line 232
    invoke-virtual {v7, v13}, Lcom/xiaomi/push/service/r;->e(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    invoke-static {v1}, Lcom/xiaomi/push/service/r;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/r;

    .line 236
    .line 237
    .line 238
    move-result-object v7

    .line 239
    invoke-virtual {v7, v13}, Lcom/xiaomi/push/service/r;->f(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 243
    .line 244
    .line 245
    move-result-object v7

    .line 246
    invoke-static {v7}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 247
    .line 248
    .line 249
    move-result-object v12

    .line 250
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v15

    .line 254
    const/16 v16, 0x1773

    .line 255
    .line 256
    const/16 v17, 0x0

    .line 257
    .line 258
    const-string v14, "E100003"

    .line 259
    .line 260
    invoke-virtual/range {v12 .. v17}, Ll/tzq0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v7

    .line 267
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 268
    .line 269
    .line 270
    move-result v7

    .line 271
    if-nez v7, :cond_8

    .line 272
    .line 273
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v7

    .line 277
    invoke-virtual {v2, v11, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 278
    .line 279
    .line 280
    const/16 v7, 0x1770

    .line 281
    .line 282
    invoke-virtual {v2, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 283
    .line 284
    .line 285
    :cond_8
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->c(Lcom/xiaomi/push/hb;)Z

    .line 286
    .line 287
    .line 288
    move-result v7

    .line 289
    if-eqz v7, :cond_9

    .line 290
    .line 291
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 292
    .line 293
    .line 294
    move-result-object v7

    .line 295
    invoke-static {v7}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 296
    .line 297
    .line 298
    move-result-object v12

    .line 299
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v13

    .line 303
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v14

    .line 307
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v15

    .line 311
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 312
    .line 313
    .line 314
    move-result-wide v17

    .line 315
    const/16 v19, 0x0

    .line 316
    .line 317
    const/16 v16, 0x3e9

    .line 318
    .line 319
    invoke-virtual/range {v12 .. v19}, Ll/tzq0;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v7

    .line 326
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 327
    .line 328
    .line 329
    move-result v7

    .line 330
    if-nez v7, :cond_9

    .line 331
    .line 332
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v7

    .line 336
    invoke-virtual {v2, v11, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 337
    .line 338
    .line 339
    const/16 v7, 0x3e8

    .line 340
    .line 341
    invoke-virtual {v2, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 342
    .line 343
    .line 344
    :cond_9
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Z

    .line 345
    .line 346
    .line 347
    move-result v7

    .line 348
    if-eqz v7, :cond_a

    .line 349
    .line 350
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 351
    .line 352
    .line 353
    move-result-object v7

    .line 354
    invoke-static {v7}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 355
    .line 356
    .line 357
    move-result-object v12

    .line 358
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v13

    .line 362
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v14

    .line 366
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v15

    .line 370
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 371
    .line 372
    .line 373
    move-result-wide v17

    .line 374
    const/16 v19, 0x0

    .line 375
    .line 376
    const/16 v16, 0x7d1

    .line 377
    .line 378
    invoke-virtual/range {v12 .. v19}, Ll/tzq0;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    .line 379
    .line 380
    .line 381
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v7

    .line 385
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 386
    .line 387
    .line 388
    move-result v7

    .line 389
    if-nez v7, :cond_a

    .line 390
    .line 391
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v7

    .line 395
    invoke-virtual {v2, v11, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 396
    .line 397
    .line 398
    const/16 v7, 0x7d0

    .line 399
    .line 400
    invoke-virtual {v2, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 401
    .line 402
    .line 403
    :cond_a
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Z

    .line 404
    .line 405
    .line 406
    move-result v7

    .line 407
    if-eqz v7, :cond_b

    .line 408
    .line 409
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 410
    .line 411
    .line 412
    move-result-object v7

    .line 413
    invoke-static {v7}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 414
    .line 415
    .line 416
    move-result-object v12

    .line 417
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object v13

    .line 421
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v14

    .line 425
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v15

    .line 429
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 430
    .line 431
    .line 432
    move-result-wide v17

    .line 433
    const/16 v19, 0x0

    .line 434
    .line 435
    const/16 v16, 0xbb9

    .line 436
    .line 437
    invoke-virtual/range {v12 .. v19}, Ll/tzq0;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    .line 438
    .line 439
    .line 440
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v7

    .line 444
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 445
    .line 446
    .line 447
    move-result v7

    .line 448
    if-nez v7, :cond_b

    .line 449
    .line 450
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object v7

    .line 454
    invoke-virtual {v2, v11, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 455
    .line 456
    .line 457
    const/16 v7, 0xbb8

    .line 458
    .line 459
    invoke-virtual {v2, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 460
    .line 461
    .line 462
    :cond_b
    const-string v7, "com.xiaomi.xmsf"

    .line 463
    .line 464
    const/4 v8, 0x1

    .line 465
    if-eqz v5, :cond_11

    .line 466
    .line 467
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->c()Ljava/lang/String;

    .line 468
    .line 469
    .line 470
    move-result-object v10

    .line 471
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 472
    .line 473
    .line 474
    move-result v10

    .line 475
    if-nez v10, :cond_11

    .line 476
    .line 477
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->d()Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object v10

    .line 481
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 482
    .line 483
    .line 484
    move-result v10

    .line 485
    if-nez v10, :cond_11

    .line 486
    .line 487
    iget v10, v5, Lcom/xiaomi/push/gs;->b:I

    .line 488
    .line 489
    if-eq v10, v8, :cond_11

    .line 490
    .line 491
    iget-object v10, v4, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 492
    .line 493
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    .line 494
    .line 495
    .line 496
    move-result-object v11

    .line 497
    invoke-static {v11}, Lcom/xiaomi/push/service/x;->a(Ljava/util/Map;)Z

    .line 498
    .line 499
    .line 500
    move-result v11

    .line 501
    invoke-static {v1, v10, v11}, Lcom/xiaomi/push/service/x;->a(Landroid/content/Context;Ljava/lang/String;Z)Z

    .line 502
    .line 503
    .line 504
    move-result v10

    .line 505
    if-eqz v10, :cond_c

    .line 506
    .line 507
    goto :goto_2

    .line 508
    :cond_c
    iget-object v2, v5, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 509
    .line 510
    if-eqz v2, :cond_d

    .line 511
    .line 512
    const-string v3, "jobkey"

    .line 513
    .line 514
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    .line 516
    .line 517
    move-result-object v2

    .line 518
    move-object v6, v2

    .line 519
    check-cast v6, Ljava/lang/String;

    .line 520
    .line 521
    :cond_d
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 522
    .line 523
    .line 524
    move-result v2

    .line 525
    if-eqz v2, :cond_e

    .line 526
    .line 527
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object v6

    .line 531
    :cond_e
    iget-object v2, v4, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 532
    .line 533
    invoke-static {v1, v2, v6}, Lcom/xiaomi/push/service/y;->a(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;Ljava/lang/String;)Z

    .line 534
    .line 535
    .line 536
    move-result v2

    .line 537
    if-eqz v2, :cond_f

    .line 538
    .line 539
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 540
    .line 541
    .line 542
    move-result-object v0

    .line 543
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 544
    .line 545
    .line 546
    move-result-object v0

    .line 547
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 548
    .line 549
    .line 550
    move-result-object v2

    .line 551
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 552
    .line 553
    .line 554
    move-result-object v3

    .line 555
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 556
    .line 557
    .line 558
    move-result-object v5

    .line 559
    new-instance v8, Ljava/lang/StringBuilder;

    .line 560
    .line 561
    const-string v9, "1:"

    .line 562
    .line 563
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 564
    .line 565
    .line 566
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 567
    .line 568
    .line 569
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 570
    .line 571
    .line 572
    move-result-object v8

    .line 573
    invoke-virtual {v0, v2, v3, v5, v8}, Ll/tzq0;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 574
    .line 575
    .line 576
    new-instance v0, Ljava/lang/StringBuilder;

    .line 577
    .line 578
    const-string v2, "drop a duplicate message, key="

    .line 579
    .line 580
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 584
    .line 585
    .line 586
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v0

    .line 590
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 591
    .line 592
    .line 593
    goto :goto_1

    .line 594
    :cond_f
    invoke-static {v1}, Ll/l4r0;->j(Landroid/content/Context;)Z

    .line 595
    .line 596
    .line 597
    move-result v2

    .line 598
    if-eqz v2, :cond_10

    .line 599
    .line 600
    invoke-static {v4}, Lcom/xiaomi/push/service/v;->a(Lcom/xiaomi/push/hb;)Z

    .line 601
    .line 602
    .line 603
    move-result v2

    .line 604
    if-eqz v2, :cond_10

    .line 605
    .line 606
    const-string v0, "receive pull down message"

    .line 607
    .line 608
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 609
    .line 610
    .line 611
    goto :goto_1

    .line 612
    :cond_10
    invoke-static {v1, v4, v0}, Lcom/xiaomi/push/service/u;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;[B)V

    .line 613
    .line 614
    .line 615
    :goto_1
    invoke-static {v1, v4}, Lcom/xiaomi/push/service/u;->b(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V

    .line 616
    .line 617
    .line 618
    goto/16 :goto_8

    .line 619
    .line 620
    :cond_11
    :goto_2
    iget-object v0, v4, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 621
    .line 622
    invoke-virtual {v7, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 623
    .line 624
    .line 625
    move-result v0

    .line 626
    if-eqz v0, :cond_12

    .line 627
    .line 628
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Z

    .line 629
    .line 630
    .line 631
    move-result v0

    .line 632
    if-nez v0, :cond_12

    .line 633
    .line 634
    if-eqz v5, :cond_12

    .line 635
    .line 636
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    .line 637
    .line 638
    .line 639
    move-result-object v0

    .line 640
    if-eqz v0, :cond_12

    .line 641
    .line 642
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    .line 643
    .line 644
    .line 645
    move-result-object v0

    .line 646
    const-string v10, "ab"

    .line 647
    .line 648
    invoke-interface {v0, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 649
    .line 650
    .line 651
    move-result v0

    .line 652
    if-eqz v0, :cond_12

    .line 653
    .line 654
    invoke-static {v1, v4}, Lcom/xiaomi/push/service/u;->b(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V

    .line 655
    .line 656
    .line 657
    new-instance v0, Ljava/lang/StringBuilder;

    .line 658
    .line 659
    const-string v2, "receive abtest message. ack it."

    .line 660
    .line 661
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 662
    .line 663
    .line 664
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 665
    .line 666
    .line 667
    move-result-object v2

    .line 668
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 669
    .line 670
    .line 671
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 672
    .line 673
    .line 674
    move-result-object v0

    .line 675
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 676
    .line 677
    .line 678
    goto/16 :goto_8

    .line 679
    .line 680
    :cond_12
    move-object/from16 v0, p1

    .line 681
    .line 682
    invoke-static {v1, v0, v4, v5}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;Lcom/xiaomi/push/hb;Lcom/xiaomi/push/gs;)Z

    .line 683
    .line 684
    .line 685
    move-result v0

    .line 686
    if-eqz v0, :cond_1d

    .line 687
    .line 688
    if-eqz v5, :cond_16

    .line 689
    .line 690
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 691
    .line 692
    .line 693
    move-result-object v0

    .line 694
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 695
    .line 696
    .line 697
    move-result v0

    .line 698
    if-nez v0, :cond_16

    .line 699
    .line 700
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Z

    .line 701
    .line 702
    .line 703
    move-result v0

    .line 704
    if-eqz v0, :cond_13

    .line 705
    .line 706
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 707
    .line 708
    .line 709
    move-result-object v0

    .line 710
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 711
    .line 712
    .line 713
    move-result-object v10

    .line 714
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 715
    .line 716
    .line 717
    move-result-object v11

    .line 718
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 719
    .line 720
    .line 721
    move-result-object v12

    .line 722
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 723
    .line 724
    .line 725
    move-result-object v13

    .line 726
    const/16 v14, 0x7d2

    .line 727
    .line 728
    const/4 v15, 0x0

    .line 729
    invoke-virtual/range {v10 .. v15}, Ll/tzq0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 730
    .line 731
    .line 732
    goto :goto_3

    .line 733
    :cond_13
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Z

    .line 734
    .line 735
    .line 736
    move-result v0

    .line 737
    if-eqz v0, :cond_14

    .line 738
    .line 739
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 740
    .line 741
    .line 742
    move-result-object v0

    .line 743
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 744
    .line 745
    .line 746
    move-result-object v0

    .line 747
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 748
    .line 749
    .line 750
    move-result-object v10

    .line 751
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 752
    .line 753
    .line 754
    move-result-object v11

    .line 755
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 756
    .line 757
    .line 758
    move-result-object v12

    .line 759
    const-string v13, "7"

    .line 760
    .line 761
    invoke-virtual {v0, v10, v11, v12, v13}, Ll/tzq0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 762
    .line 763
    .line 764
    goto :goto_3

    .line 765
    :cond_14
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->c(Lcom/xiaomi/push/hb;)Z

    .line 766
    .line 767
    .line 768
    move-result v0

    .line 769
    if-eqz v0, :cond_15

    .line 770
    .line 771
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 772
    .line 773
    .line 774
    move-result-object v0

    .line 775
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 776
    .line 777
    .line 778
    move-result-object v0

    .line 779
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 780
    .line 781
    .line 782
    move-result-object v10

    .line 783
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 784
    .line 785
    .line 786
    move-result-object v11

    .line 787
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 788
    .line 789
    .line 790
    move-result-object v12

    .line 791
    const-string v13, "8"

    .line 792
    .line 793
    invoke-virtual {v0, v10, v11, v12, v13}, Ll/tzq0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 794
    .line 795
    .line 796
    goto :goto_3

    .line 797
    :cond_15
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->d(Lcom/xiaomi/push/hb;)Z

    .line 798
    .line 799
    .line 800
    move-result v0

    .line 801
    if-eqz v0, :cond_16

    .line 802
    .line 803
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 804
    .line 805
    .line 806
    move-result-object v0

    .line 807
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 808
    .line 809
    .line 810
    move-result-object v10

    .line 811
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 812
    .line 813
    .line 814
    move-result-object v11

    .line 815
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 816
    .line 817
    .line 818
    move-result-object v13

    .line 819
    const/16 v14, 0x1774

    .line 820
    .line 821
    const/4 v15, 0x0

    .line 822
    const-string v12, "E100003"

    .line 823
    .line 824
    invoke-virtual/range {v10 .. v15}, Ll/tzq0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 825
    .line 826
    .line 827
    :cond_16
    :goto_3
    sget-object v0, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 828
    .line 829
    iget-object v10, v4, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    .line 830
    .line 831
    if-ne v0, v10, :cond_1c

    .line 832
    .line 833
    :try_start_0
    invoke-static {v1, v4}, Lcom/xiaomi/push/service/bc;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;)Lcom/xiaomi/push/hq;

    .line 834
    .line 835
    .line 836
    move-result-object v6

    .line 837
    if-nez v6, :cond_17

    .line 838
    .line 839
    new-instance v0, Ljava/lang/StringBuilder;

    .line 840
    .line 841
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 842
    .line 843
    .line 844
    iget-object v3, v4, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    .line 845
    .line 846
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 847
    .line 848
    .line 849
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 850
    .line 851
    .line 852
    move-result-object v0

    .line 853
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/xiaomi/push/hu; {:try_start_0 .. :try_end_0} :catch_0

    .line 854
    .line 855
    .line 856
    goto :goto_5

    .line 857
    :catch_0
    move-exception v0

    .line 858
    goto :goto_4

    .line 859
    :cond_17
    move v9, v8

    .line 860
    goto :goto_5

    .line 861
    :goto_4
    new-instance v3, Ljava/lang/StringBuilder;

    .line 862
    .line 863
    const-string v8, "receive a message which action string is not valid. "

    .line 864
    .line 865
    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 866
    .line 867
    .line 868
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 869
    .line 870
    .line 871
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 872
    .line 873
    .line 874
    move-result-object v0

    .line 875
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 876
    .line 877
    .line 878
    :goto_5
    if-eqz v9, :cond_1c

    .line 879
    .line 880
    instance-of v0, v6, Lcom/xiaomi/push/he;

    .line 881
    .line 882
    if-eqz v0, :cond_1c

    .line 883
    .line 884
    check-cast v6, Lcom/xiaomi/push/he;

    .line 885
    .line 886
    sget-object v0, Lcom/xiaomi/push/gp;->C:Lcom/xiaomi/push/gp;

    .line 887
    .line 888
    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 889
    .line 890
    iget-object v3, v6, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    .line 891
    .line 892
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 893
    .line 894
    .line 895
    move-result v0

    .line 896
    if-eqz v0, :cond_1b

    .line 897
    .line 898
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    .line 899
    .line 900
    .line 901
    move-result-object v0

    .line 902
    if-eqz v0, :cond_1b

    .line 903
    .line 904
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    .line 905
    .line 906
    .line 907
    move-result-object v0

    .line 908
    sget-object v2, Lcom/xiaomi/push/service/an;->Q:Ljava/lang/String;

    .line 909
    .line 910
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 911
    .line 912
    .line 913
    move-result-object v0

    .line 914
    check-cast v0, Ljava/lang/String;

    .line 915
    .line 916
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 917
    .line 918
    .line 919
    move-result v2

    .line 920
    const/4 v3, -0x2

    .line 921
    if-nez v2, :cond_18

    .line 922
    .line 923
    :try_start_1
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 924
    .line 925
    .line 926
    move-result v3
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 927
    goto :goto_6

    .line 928
    :catch_1
    move-exception v0

    .line 929
    new-instance v2, Ljava/lang/StringBuilder;

    .line 930
    .line 931
    const-string v8, "parse notifyId from STRING to INT failed: "

    .line 932
    .line 933
    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 934
    .line 935
    .line 936
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 937
    .line 938
    .line 939
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 940
    .line 941
    .line 942
    move-result-object v0

    .line 943
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 944
    .line 945
    .line 946
    :cond_18
    :goto_6
    const/4 v0, -0x1

    .line 947
    if-lt v3, v0, :cond_19

    .line 948
    .line 949
    new-instance v0, Ljava/lang/StringBuilder;

    .line 950
    .line 951
    const-string v2, "try to retract a message by notifyId="

    .line 952
    .line 953
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 954
    .line 955
    .line 956
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 957
    .line 958
    .line 959
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 960
    .line 961
    .line 962
    move-result-object v0

    .line 963
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 964
    .line 965
    .line 966
    iget-object v0, v4, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 967
    .line 968
    invoke-static {v1, v0, v3}, Lcom/xiaomi/push/service/x;->a(Landroid/content/Context;Ljava/lang/String;I)V

    .line 969
    .line 970
    .line 971
    goto :goto_7

    .line 972
    :cond_19
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    .line 973
    .line 974
    .line 975
    move-result-object v0

    .line 976
    sget-object v2, Lcom/xiaomi/push/service/an;->O:Ljava/lang/String;

    .line 977
    .line 978
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 979
    .line 980
    .line 981
    move-result-object v0

    .line 982
    check-cast v0, Ljava/lang/String;

    .line 983
    .line 984
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    .line 985
    .line 986
    .line 987
    move-result-object v2

    .line 988
    sget-object v3, Lcom/xiaomi/push/service/an;->P:Ljava/lang/String;

    .line 989
    .line 990
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 991
    .line 992
    .line 993
    move-result-object v2

    .line 994
    check-cast v2, Ljava/lang/String;

    .line 995
    .line 996
    const-string v3, "try to retract a message by title&description."

    .line 997
    .line 998
    invoke-static {v3}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 999
    .line 1000
    .line 1001
    iget-object v3, v4, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 1002
    .line 1003
    invoke-static {v1, v3, v0, v2}, Lcom/xiaomi/push/service/x;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1004
    .line 1005
    .line 1006
    :goto_7
    if-eqz v5, :cond_1a

    .line 1007
    .line 1008
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    .line 1009
    .line 1010
    .line 1011
    move-result-object v0

    .line 1012
    if-eqz v0, :cond_1a

    .line 1013
    .line 1014
    invoke-static {v1}, Ll/l4r0;->j(Landroid/content/Context;)Z

    .line 1015
    .line 1016
    .line 1017
    move-result v0

    .line 1018
    if-eqz v0, :cond_1a

    .line 1019
    .line 1020
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    .line 1021
    .line 1022
    .line 1023
    move-result-object v0

    .line 1024
    invoke-static {v0}, Lcom/xiaomi/push/service/ag;->a(Ljava/lang/Object;)Ljava/lang/String;

    .line 1025
    .line 1026
    .line 1027
    move-result-object v0

    .line 1028
    const-string v2, "pulldown"

    .line 1029
    .line 1030
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1031
    .line 1032
    .line 1033
    move-result v0

    .line 1034
    if-eqz v0, :cond_1a

    .line 1035
    .line 1036
    invoke-static {v4}, Lcom/xiaomi/push/service/v;->a(Lcom/xiaomi/push/hb;)V

    .line 1037
    .line 1038
    .line 1039
    :cond_1a
    invoke-static {v1, v4, v6}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;Lcom/xiaomi/push/he;)V

    .line 1040
    .line 1041
    .line 1042
    goto :goto_8

    .line 1043
    :cond_1b
    sget-object v0, Lcom/xiaomi/push/gp;->ah:Lcom/xiaomi/push/gp;

    .line 1044
    .line 1045
    iget-object v0, v0, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 1046
    .line 1047
    invoke-virtual {v6}, Lcom/xiaomi/push/he;->c()Ljava/lang/String;

    .line 1048
    .line 1049
    .line 1050
    move-result-object v3

    .line 1051
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1052
    .line 1053
    .line 1054
    move-result v0

    .line 1055
    if-eqz v0, :cond_1c

    .line 1056
    .line 1057
    invoke-static {v1}, Ll/l4r0;->j(Landroid/content/Context;)Z

    .line 1058
    .line 1059
    .line 1060
    move-result v0

    .line 1061
    if-eqz v0, :cond_1e

    .line 1062
    .line 1063
    invoke-static {v1, v4, v6}, Lcom/xiaomi/push/service/v;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;Lcom/xiaomi/push/he;)V

    .line 1064
    .line 1065
    .line 1066
    goto :goto_8

    .line 1067
    :cond_1c
    const-string v0, "broadcast passthrough message."

    .line 1068
    .line 1069
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 1070
    .line 1071
    .line 1072
    iget-object v0, v4, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 1073
    .line 1074
    invoke-static {v0}, Lcom/xiaomi/push/service/w;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 1075
    .line 1076
    .line 1077
    move-result-object v0

    .line 1078
    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1079
    .line 1080
    .line 1081
    goto :goto_8

    .line 1082
    :cond_1d
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 1083
    .line 1084
    .line 1085
    move-result-object v0

    .line 1086
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 1087
    .line 1088
    .line 1089
    move-result-object v0

    .line 1090
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 1091
    .line 1092
    .line 1093
    move-result-object v2

    .line 1094
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 1095
    .line 1096
    .line 1097
    move-result-object v3

    .line 1098
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 1099
    .line 1100
    .line 1101
    move-result-object v5

    .line 1102
    const-string v6, "9"

    .line 1103
    .line 1104
    invoke-virtual {v0, v2, v3, v5, v6}, Ll/tzq0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1105
    .line 1106
    .line 1107
    :cond_1e
    :goto_8
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    .line 1108
    .line 1109
    .line 1110
    move-result-object v0

    .line 1111
    sget-object v2, Lcom/xiaomi/push/gf;->b:Lcom/xiaomi/push/gf;

    .line 1112
    .line 1113
    if-ne v0, v2, :cond_22

    .line 1114
    .line 1115
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 1116
    .line 1117
    .line 1118
    move-result-object v0

    .line 1119
    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1120
    .line 1121
    .line 1122
    move-result v0

    .line 1123
    if-nez v0, :cond_22

    .line 1124
    .line 1125
    invoke-virtual {v1}, Landroid/app/Service;->stopSelf()V

    .line 1126
    .line 1127
    .line 1128
    goto :goto_9

    .line 1129
    :cond_1f
    iget-object v0, v4, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 1130
    .line 1131
    invoke-static {v1, v0}, Lcom/xiaomi/push/g;->p(Landroid/content/Context;Ljava/lang/String;)Z

    .line 1132
    .line 1133
    .line 1134
    move-result v0

    .line 1135
    if-nez v0, :cond_21

    .line 1136
    .line 1137
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->e(Lcom/xiaomi/push/hb;)Z

    .line 1138
    .line 1139
    .line 1140
    move-result v0

    .line 1141
    if-eqz v0, :cond_20

    .line 1142
    .line 1143
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 1144
    .line 1145
    .line 1146
    move-result-object v0

    .line 1147
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 1148
    .line 1149
    .line 1150
    move-result-object v0

    .line 1151
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 1152
    .line 1153
    .line 1154
    move-result-object v2

    .line 1155
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 1156
    .line 1157
    .line 1158
    move-result-object v3

    .line 1159
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 1160
    .line 1161
    .line 1162
    move-result-object v5

    .line 1163
    const-string v6, "2"

    .line 1164
    .line 1165
    invoke-virtual {v0, v2, v3, v5, v6}, Ll/tzq0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1166
    .line 1167
    .line 1168
    :cond_20
    invoke-static {v1, v4}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V

    .line 1169
    .line 1170
    .line 1171
    return-void

    .line 1172
    :cond_21
    const-string v0, "receive a mipush message, we can see the app, but we can\'t see the receiver."

    .line 1173
    .line 1174
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 1175
    .line 1176
    .line 1177
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->e(Lcom/xiaomi/push/hb;)Z

    .line 1178
    .line 1179
    .line 1180
    move-result v0

    .line 1181
    if-eqz v0, :cond_22

    .line 1182
    .line 1183
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 1184
    .line 1185
    .line 1186
    move-result-object v0

    .line 1187
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 1188
    .line 1189
    .line 1190
    move-result-object v0

    .line 1191
    invoke-virtual {v4}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 1192
    .line 1193
    .line 1194
    move-result-object v1

    .line 1195
    invoke-static {v4}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 1196
    .line 1197
    .line 1198
    move-result-object v2

    .line 1199
    invoke-virtual {v5}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 1200
    .line 1201
    .line 1202
    move-result-object v3

    .line 1203
    const-string v4, "3"

    .line 1204
    .line 1205
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/tzq0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1206
    .line 1207
    .line 1208
    :cond_22
    :goto_9
    return-void
.end method

.method private static a(Lcom/xiaomi/push/service/XMPushService;[BJ)V
    .locals 1

    const/4 v0, 0x0

    .line 1224
    invoke-static {p0, p1, p2, p3, v0}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;[BJLjava/util/Map;)V

    return-void
.end method

.method private static a(Lcom/xiaomi/push/service/XMPushService;[BJLjava/util/Map;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/xiaomi/push/service/XMPushService;",
            "[BJ",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1225
    invoke-static {p1}, Lcom/xiaomi/push/service/u;->a([B)Lcom/xiaomi/push/hb;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 1226
    :cond_0
    iget-object v1, v0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1227
    const-string p0, "receive a mipush message without package name"

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return-void

    .line 1228
    :cond_1
    invoke-virtual {v0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object v1

    if-eqz v1, :cond_4

    if-eqz p4, :cond_4

    .line 1229
    invoke-interface/range {p4 .. p4}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    .line 1230
    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 1231
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    .line 1232
    invoke-interface/range {p4 .. p4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    :cond_2
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 1233
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1234
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v4, 0x1

    goto :goto_0

    :cond_3
    if-eqz v4, :cond_4

    .line 1235
    invoke-static {v0}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    move-result-object v2

    if-eqz v2, :cond_4

    .line 1236
    array-length v3, v2

    if-lez v3, :cond_4

    move-object p1, v2

    .line 1237
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1238
    invoke-static {p1, v2, v3}, Lcom/xiaomi/push/service/u;->a([BJ)Landroid/content/Intent;

    move-result-object v4

    .line 1239
    invoke-static {v0}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    move-result-object v6

    const/4 v10, 0x1

    .line 1240
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    const/4 v9, 0x1

    move-object v5, p0

    move-wide v7, p2

    .line 1241
    invoke-static/range {v5 .. v12}, Ll/p2r0;->j(Landroid/content/Context;Ljava/lang/String;JZZJ)V

    if-eqz v1, :cond_5

    .line 1242
    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_5

    .line 1243
    invoke-virtual {v0}, Lcom/xiaomi/push/hb;->a()Ljava/lang/String;

    move-result-object v7

    .line 1244
    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/xiaomi/push/service/aj;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1245
    invoke-virtual {v0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    move-result-object v9

    filled-new-array {v7, v8, v9}, [Ljava/lang/Object;

    move-result-object v7

    .line 1246
    const-string v8, "receive a message. appid=%1$s, msgid= %2$s, action=%3$s"

    invoke-static {v8, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ll/ouq0;->D(Ljava/lang/String;)V

    :cond_5
    if-eqz v1, :cond_6

    .line 1247
    const-string v7, "mrt"

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v7, v2}, Lcom/xiaomi/push/gs;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 1248
    :cond_6
    sget-object v2, Lcom/xiaomi/push/gf;->e:Lcom/xiaomi/push/gf;

    invoke-virtual {v0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    move-result-object v3

    const-string v7, ""

    if-ne v2, v3, :cond_8

    .line 1249
    invoke-static {p0}, Lcom/xiaomi/push/service/r;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/r;

    move-result-object v3

    iget-object v8, v0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    invoke-virtual {v3, v8}, Lcom/xiaomi/push/service/r;->a(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 1250
    invoke-static {v0}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Z

    move-result v3

    if-nez v3, :cond_8

    if-eqz v1, :cond_7

    .line 1251
    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    move-result-object v7

    .line 1252
    invoke-static {v0}, Lcom/xiaomi/push/service/x;->e(Lcom/xiaomi/push/hb;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 1253
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object p1

    .line 1254
    invoke-virtual {v0}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "1"

    .line 1255
    invoke-virtual {p1, v1, v2, v7, v3}, Ll/tzq0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1256
    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Drop a message for unregistered, msgid="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 1257
    iget-object p1, v0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    invoke-static {p0, v0, p1}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;Ljava/lang/String;)V

    return-void

    .line 1258
    :cond_8
    invoke-virtual {v0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    move-result-object v3

    if-ne v2, v3, :cond_a

    .line 1259
    invoke-static {p0}, Lcom/xiaomi/push/service/r;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/r;

    move-result-object v3

    iget-object v8, v0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    invoke-virtual {v3, v8}, Lcom/xiaomi/push/service/r;->c(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 1260
    invoke-static {v0}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Z

    move-result v3

    if-nez v3, :cond_a

    if-eqz v1, :cond_9

    .line 1261
    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    move-result-object v7

    .line 1262
    invoke-static {v0}, Lcom/xiaomi/push/service/x;->e(Lcom/xiaomi/push/hb;)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 1263
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object p1

    .line 1264
    invoke-virtual {v0}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "2"

    .line 1265
    invoke-virtual {p1, v1, v2, v7, v3}, Ll/tzq0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1266
    :cond_9
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Drop a message for push closed, msgid="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 1267
    iget-object p1, v0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    invoke-static {p0, v0, p1}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;Ljava/lang/String;)V

    return-void

    .line 1268
    :cond_a
    invoke-virtual {v0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    move-result-object v3

    if-ne v2, v3, :cond_c

    .line 1269
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v7, "com.xiaomi.xmsf"

    invoke-static {v3, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c

    .line 1270
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v7, v0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    invoke-static {v3, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c

    .line 1271
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "Receive a message with wrong package name, expect "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1272
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", received "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1273
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 1274
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "package should be "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1275
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", but got "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1276
    const-string v2, "unmatched_package"

    invoke-static {p0, v0, v2, p1}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v1, :cond_b

    .line 1277
    invoke-static {v0}, Lcom/xiaomi/push/service/x;->e(Lcom/xiaomi/push/hb;)Z

    move-result p1

    if-eqz p1, :cond_b

    .line 1278
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    move-result-object p0

    .line 1279
    invoke-virtual {v0}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "3"

    invoke-virtual {p0, p1, v0, v1, v2}, Ll/tzq0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_b
    :goto_1
    return-void

    .line 1280
    :cond_c
    invoke-virtual {v0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    move-result-object v3

    if-ne v2, v3, :cond_d

    .line 1281
    invoke-static {}, Ll/u3r0;->c()I

    move-result v2

    const/16 v3, 0x3e7

    if-ne v2, v3, :cond_d

    .line 1282
    invoke-static {p0, v6}, Ll/u3r0;->l(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 1283
    const-string p1, "Receive the uninstalled dual app message"

    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 1284
    :try_start_0
    invoke-virtual {v0}, Lcom/xiaomi/push/hb;->a()Ljava/lang/String;

    move-result-object p1

    invoke-static {v6, p1}, Lcom/xiaomi/push/service/w;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/hb;

    move-result-object p1

    .line 1285
    invoke-static {p0, p1}, Lcom/xiaomi/push/service/w;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V

    .line 1286
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "uninstall "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " msg sent"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/xiaomi/push/fi; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1287
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Fail to send Message: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/xiaomi/push/fi;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    const/16 v0, 0xa

    .line 1288
    invoke-virtual {p0, v0, p1}, Lcom/xiaomi/push/service/XMPushService;->a(ILjava/lang/Exception;)V

    .line 1289
    :goto_2
    invoke-static {p0, v6}, Lcom/xiaomi/push/service/x;->a(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    :cond_d
    if-eqz v1, :cond_e

    .line 1290
    invoke-virtual {v1}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_e

    .line 1291
    const-string v2, "hide"

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 1292
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "true"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 1293
    invoke-static {p0, v0}, Lcom/xiaomi/push/service/u;->b(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V

    return-void

    .line 1294
    :cond_e
    invoke-static {p0, v6, p1, v4}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;[BLandroid/content/Intent;)V

    return-void
.end method

.method private static a(Landroid/content/Context;Landroid/content/Intent;)Z
    .locals 2

    .line 1385
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/16 v0, 0x20

    const/4 v1, 0x1

    .line 1386
    :try_start_0
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 1387
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_0

    return v1

    :cond_0
    const/4 p0, 0x0

    return p0

    :catch_0
    return v1
.end method

.method private static a(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    .line 1349
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.xiaomi.mipush.miui.CLICK_MESSAGE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1350
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 1351
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.xiaomi.mipush.miui.RECEIVE_MESSAGE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1352
    invoke-virtual {v1, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 1353
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/4 p1, 0x0

    const/16 v2, 0x20

    .line 1354
    :try_start_0
    invoke-virtual {p0, v1, v2}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 1355
    invoke-virtual {p0, v0, v2}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p0

    .line 1356
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    return p1

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0

    .line 1357
    :goto_1
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    return p1
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;[B)Z
    .locals 3

    .line 1318
    invoke-static {p0, p1}, Lcom/xiaomi/push/g;->l(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1319
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.xiaomi.mipush.MESSAGE_ARRIVED"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1320
    const-string v2, "mipush_payload"

    invoke-virtual {v0, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 1321
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 1322
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p2

    .line 1323
    invoke-virtual {p2, v0, v1}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p2

    .line 1324
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_0

    .line 1325
    const-string p2, "broadcast message arrived."

    invoke-static {p2}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 1326
    invoke-static {p1}, Lcom/xiaomi/push/service/w;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception p0

    .line 1327
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "meet error when broadcast message arrived. "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    :cond_0
    return v1
.end method

.method private static a(Lcom/xiaomi/push/hb;)Z
    .locals 2

    .line 1346
    const-string v0, "com.xiaomi.xmsf"

    iget-object v1, p0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1347
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1348
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object p0

    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object p0

    const-string v0, "miui_package_name"

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static a(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;Lcom/xiaomi/push/hb;Lcom/xiaomi/push/gs;)Z
    .locals 6

    const/4 v0, 0x1

    if-eqz p3, :cond_1

    .line 1328
    invoke-virtual {p3}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1329
    invoke-virtual {p3}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object v1

    const-string v2, "__check_alive"

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1330
    invoke-virtual {p3}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object v1

    const-string v2, "__awake"

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1331
    new-instance v1, Lcom/xiaomi/push/he;

    invoke-direct {v1}, Lcom/xiaomi/push/he;-><init>()V

    .line 1332
    invoke-virtual {p2}, Lcom/xiaomi/push/hb;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/xiaomi/push/he;->b(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 1333
    invoke-virtual {v1, p1}, Lcom/xiaomi/push/he;->d(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 1334
    sget-object v3, Lcom/xiaomi/push/gp;->H:Lcom/xiaomi/push/gp;

    iget-object v3, v3, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 1335
    invoke-virtual {p3}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/xiaomi/push/he;->a(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 1336
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, v1, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 1337
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, p1}, Lcom/xiaomi/push/g;->l(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    .line 1338
    iget-object v3, v1, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    const-string v4, "app_running"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p1, :cond_0

    .line 1339
    invoke-virtual {p3}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p1

    .line 1340
    iget-object p3, v1, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    const-string v2, "awaked"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p3, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p1, :cond_0

    const/4 v0, 0x0

    .line 1341
    :cond_0
    invoke-virtual {p2}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Lcom/xiaomi/push/hb;->a()Ljava/lang/String;

    move-result-object p2

    sget-object p3, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 1342
    invoke-static {p1, p2, v1, p3}, Lcom/xiaomi/push/service/w;->a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;

    move-result-object p1

    .line 1343
    :try_start_0
    invoke-static {p0, p1}, Lcom/xiaomi/push/service/w;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V
    :try_end_0
    .catch Lcom/xiaomi/push/fi; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 1344
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return v0
.end method

.method private static b(Landroid/content/Context;Lcom/xiaomi/push/hb;[B)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p1}, Lcom/xiaomi/push/service/x;->a(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-static {p0, v0, p2}, Lcom/xiaomi/push/service/u;->a(Landroid/content/Context;Ljava/lang/String;[B)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-nez p2, :cond_2

    .line 24
    .line 25
    invoke-static {p0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p1}, Lcom/xiaomi/push/service/x;->b(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->a()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v1, "1"

    .line 42
    .line 43
    invoke-virtual {p0, v0, p2, p1, v1}, Ll/tzq0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    :goto_0
    return-void
.end method

.method private static b(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V
    .locals 2

    .line 49
    new-instance v0, Lcom/xiaomi/push/service/u$2;

    const/4 v1, 0x4

    invoke-direct {v0, v1, p0, p1}, Lcom/xiaomi/push/service/u$2;-><init>(ILcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    return-void
.end method

.method private static b(Lcom/xiaomi/push/hb;)Z
    .locals 1

    .line 47
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    move-result-object p0

    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 48
    const-string v0, "notify_effect"

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static c(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V
    .locals 2

    .line 41
    new-instance v0, Lcom/xiaomi/push/service/u$3;

    const/4 v1, 0x4

    invoke-direct {v0, v1, p0, p1}, Lcom/xiaomi/push/service/u$3;-><init>(ILcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    return-void
.end method

.method private static c(Lcom/xiaomi/push/hb;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->a()Ljava/util/Map;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "obslete_ads_message"

    .line 27
    .line 28
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "1"

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method private static d(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/xiaomi/push/service/u$4;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, v1, p0, p1}, Lcom/xiaomi/push/service/u$4;-><init>(ILcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Lcom/xiaomi/push/service/am$b;ZILjava/lang/String;)V
    .locals 0

    if-nez p3, :cond_0

    .line 1303
    invoke-static {p1}, Lcom/xiaomi/push/service/q;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/p;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 1304
    const-string p2, "token-expired"

    invoke-virtual {p2, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 1305
    iget-object p2, p0, Lcom/xiaomi/push/service/p;->f:Ljava/lang/String;

    iget-object p3, p0, Lcom/xiaomi/push/service/p;->d:Ljava/lang/String;

    iget-object p0, p0, Lcom/xiaomi/push/service/p;->e:Ljava/lang/String;

    invoke-static {p1, p2, p3, p0}, Lcom/xiaomi/push/service/q;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/p;

    :cond_0
    return-void
.end method

.method public a(Lcom/xiaomi/push/service/XMPushService;Ll/g2r0;Lcom/xiaomi/push/service/am$b;)V
    .locals 1

    .line 1209
    instance-of p0, p2, Ll/f2r0;

    if-eqz p0, :cond_1

    .line 1210
    move-object p0, p2

    check-cast p0, Ll/f2r0;

    .line 1211
    const-string v0, "s"

    invoke-virtual {p0, v0}, Ll/g2r0;->f(Ljava/lang/String;)Ll/e2r0;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1212
    :try_start_0
    iget-object p3, p3, Lcom/xiaomi/push/service/am$b;->h:Ljava/lang/String;

    invoke-virtual {p0}, Ll/g2r0;->l()Ljava/lang/String;

    move-result-object p0

    invoke-static {p3, p0}, Lcom/xiaomi/push/service/ar;->a(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object p0

    .line 1213
    invoke-virtual {v0}, Ll/e2r0;->k()Ljava/lang/String;

    move-result-object p3

    invoke-static {p0, p3}, Lcom/xiaomi/push/service/ar;->a([BLjava/lang/String;)[B

    move-result-object p0

    .line 1214
    invoke-virtual {p2}, Ll/g2r0;->d()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ll/p2r0;->b(Ljava/lang/String;)I

    move-result p2

    int-to-long p2, p2

    invoke-static {p1, p0, p2, p3}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;[BJ)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 1215
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void

    .line 1216
    :cond_1
    const-string p0, "not a mipush message"

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return-void
.end method

.method public a(Lcom/xiaomi/push/service/XMPushService;Ll/w0r0;Lcom/xiaomi/push/service/am$b;)V
    .locals 3

    .line 1217
    :try_start_0
    iget-object p0, p3, Lcom/xiaomi/push/service/am$b;->h:Ljava/lang/String;

    invoke-virtual {p2, p0}, Ll/w0r0;->q(Ljava/lang/String;)[B

    move-result-object p0

    .line 1218
    invoke-static {p2}, Lcom/xiaomi/push/service/e;->b(Ll/w0r0;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 1219
    new-instance p3, Ljava/util/HashMap;

    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 1220
    const-string v0, "t_im"

    invoke-virtual {p2}, Ll/w0r0;->s()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1221
    const-string v0, "t_rt"

    invoke-virtual {p2}, Ll/w0r0;->b()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    .line 1222
    :goto_0
    invoke-virtual {p2}, Ll/w0r0;->x()I

    move-result p2

    int-to-long v0, p2

    invoke-static {p1, p0, v0, v1, p3}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;[BJLjava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 1223
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    return-void
.end method
