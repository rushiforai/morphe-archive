.class public Lcom/xiaomi/push/service/aw;
.super Lcom/xiaomi/push/service/XMPushService$j;
.source "SourceFile"


# instance fields
.field private a:Lcom/xiaomi/push/service/XMPushService;

.field private a:Ll/w0r0;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;Ll/w0r0;)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/XMPushService$j;-><init>(I)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lcom/xiaomi/push/service/aw;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 6
    .line 7
    iput-object p2, p0, Lcom/xiaomi/push/service/aw;->a:Ll/w0r0;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 49
    const-string p0, "send a message."

    return-object p0
.end method

.method public a()V
    .locals 5

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/aw;->a:Ll/w0r0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {v0}, Lcom/xiaomi/push/service/e;->a(Ll/w0r0;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/xiaomi/push/service/aw;->a:Ll/w0r0;

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    iget-object v3, p0, Lcom/xiaomi/push/service/aw;->a:Ll/w0r0;

    .line 18
    .line 19
    invoke-virtual {v3}, Ll/w0r0;->b()J

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    sub-long/2addr v1, v3

    .line 24
    invoke-virtual {v0, v1, v2}, Ll/w0r0;->A(J)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-exception v0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/xiaomi/push/service/aw;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/xiaomi/push/service/aw;->a:Ll/w0r0;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/XMPushService;->a(Ll/w0r0;)V
    :try_end_0
    .catch Lcom/xiaomi/push/fi; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void

    .line 38
    :goto_1
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/xiaomi/push/service/aw;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 42
    .line 43
    const/16 v1, 0xa

    .line 44
    .line 45
    invoke-virtual {p0, v1, v0}, Lcom/xiaomi/push/service/XMPushService;->a(ILjava/lang/Exception;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
