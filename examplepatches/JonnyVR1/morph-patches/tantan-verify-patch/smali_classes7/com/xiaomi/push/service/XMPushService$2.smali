.class Lcom/xiaomi/push/service/XMPushService$2;
.super Lcom/xiaomi/push/service/XMPushService$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/XMPushService;->d(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/service/XMPushService;

.field final synthetic a:Ljava/lang/String;

.field final synthetic a:[B

.field final synthetic b:I


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;IILjava/lang/String;[B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService$2;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    iput p3, p0, Lcom/xiaomi/push/service/XMPushService$2;->b:I

    .line 4
    .line 5
    iput-object p4, p0, Lcom/xiaomi/push/service/XMPushService$2;->a:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/xiaomi/push/service/XMPushService$2;->a:[B

    .line 8
    .line 9
    invoke-direct {p0, p2}, Lcom/xiaomi/push/service/XMPushService$j;-><init>(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 62
    const-string p0, "clear account cache."

    return-object p0
.end method

.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$2;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/xiaomi/push/service/q;->a(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "5"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget v0, p0, Lcom/xiaomi/push/service/XMPushService$2;->b:I

    .line 16
    .line 17
    invoke-static {v0}, Ll/m6r0;->b(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$2;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService;)Ll/v1r0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Ll/v1r0;->a()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ll/v1r0;->c(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v1, "clear account and start registration. "

    .line 36
    .line 37
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService$2;->a:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$2;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService$2;->a:[B

    .line 55
    .line 56
    iget-object p0, p0, Lcom/xiaomi/push/service/XMPushService$2;->a:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v0, v1, p0}, Lcom/xiaomi/push/service/XMPushService;->a([BLjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
