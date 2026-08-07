.class Lcom/xiaomi/push/service/XMPushService$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z1r0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/XMPushService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService$1;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/g2r0;)V
    .locals 1

    .line 40
    iget-object p0, p0, Lcom/xiaomi/push/service/XMPushService$1;->a:Lcom/xiaomi/push/service/XMPushService;

    new-instance v0, Lcom/xiaomi/push/service/XMPushService$m;

    invoke-direct {v0, p0, p1}, Lcom/xiaomi/push/service/XMPushService$m;-><init>(Lcom/xiaomi/push/service/XMPushService;Ll/g2r0;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    return-void
.end method

.method public a(Ll/w0r0;)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/xiaomi/push/service/e;->a(Ll/w0r0;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/xiaomi/push/service/at;->a()Lcom/xiaomi/push/service/at;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p1}, Ll/w0r0;->D()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$1;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/xiaomi/push/service/XMPushService;->a()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    int-to-long v5, v0

    .line 26
    invoke-virtual/range {v1 .. v6}, Lcom/xiaomi/push/service/at;->a(Ljava/lang/String;JJ)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Lcom/xiaomi/push/service/XMPushService$1;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 30
    .line 31
    new-instance v0, Lcom/xiaomi/push/service/XMPushService$d;

    .line 32
    .line 33
    invoke-direct {v0, p0, p1}, Lcom/xiaomi/push/service/XMPushService$d;-><init>(Lcom/xiaomi/push/service/XMPushService;Ll/w0r0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
