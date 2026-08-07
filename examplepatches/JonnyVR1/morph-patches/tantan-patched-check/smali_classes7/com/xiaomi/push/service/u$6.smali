.class final Lcom/xiaomi/push/service/u$6;
.super Lcom/xiaomi/push/service/XMPushService$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/hb;

.field final synthetic a:Lcom/xiaomi/push/service/XMPushService;

.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/xiaomi/push/service/u$6;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/xiaomi/push/service/u$6;->a:Lcom/xiaomi/push/hb;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/xiaomi/push/service/u$6;->a:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/xiaomi/push/service/u$6;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService$j;-><init>(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 45
    const-string p0, "send wrong message ack for message."

    return-object p0
.end method

.method public a()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/u$6;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/xiaomi/push/service/u$6;->a:Lcom/xiaomi/push/hb;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/xiaomi/push/service/u;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;)Lcom/xiaomi/push/hb;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    .line 10
    .line 11
    const-string v2, "error"

    .line 12
    .line 13
    iget-object v3, p0, Lcom/xiaomi/push/service/u$6;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/push/gs;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, v0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    .line 19
    .line 20
    const-string v2, "reason"

    .line 21
    .line 22
    iget-object v3, p0, Lcom/xiaomi/push/service/u$6;->b:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/push/gs;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/xiaomi/push/service/u$6;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 28
    .line 29
    invoke-static {v1, v0}, Lcom/xiaomi/push/service/w;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V
    :try_end_0
    .catch Lcom/xiaomi/push/fi; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception v0

    .line 34
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/xiaomi/push/service/u$6;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 38
    .line 39
    const/16 v1, 0xa

    .line 40
    .line 41
    invoke-virtual {p0, v1, v0}, Lcom/xiaomi/push/service/XMPushService;->a(ILjava/lang/Exception;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
