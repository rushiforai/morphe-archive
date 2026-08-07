.class Lcom/xiaomi/push/service/XMPushService$d;
.super Lcom/xiaomi/push/service/XMPushService$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/XMPushService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/service/XMPushService;

.field private a:Ll/w0r0;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;Ll/w0r0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService$d;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    const/16 p1, 0x8

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService$j;-><init>(I)V

    .line 6
    .line 7
    .line 8
    iput-object p2, p0, Lcom/xiaomi/push/service/XMPushService$d;->a:Ll/w0r0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 33
    const-string p0, "receive a message."

    return-object p0
.end method

.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$d;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService;)Lcom/xiaomi/push/service/ak;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService$d;->a:Ll/w0r0;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/ak;->a(Ll/w0r0;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$d;->a:Ll/w0r0;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/xiaomi/push/service/e;->a(Ll/w0r0;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/xiaomi/push/service/XMPushService$d;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 21
    .line 22
    new-instance v0, Lcom/xiaomi/push/service/at$a;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/xiaomi/push/service/at$a;-><init>()V

    .line 25
    .line 26
    .line 27
    const-wide/16 v1, 0x3a98

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1, v2}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;J)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
