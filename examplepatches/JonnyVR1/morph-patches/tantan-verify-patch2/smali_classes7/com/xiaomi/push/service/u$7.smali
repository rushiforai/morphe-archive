.class final Lcom/xiaomi/push/service/u$7;
.super Lcom/xiaomi/push/service/XMPushService$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;Lcom/xiaomi/push/he;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/hb;

.field final synthetic a:Lcom/xiaomi/push/he;

.field final synthetic a:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method public constructor <init>(ILcom/xiaomi/push/he;Lcom/xiaomi/push/hb;Lcom/xiaomi/push/service/XMPushService;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/xiaomi/push/service/u$7;->a:Lcom/xiaomi/push/he;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/xiaomi/push/service/u$7;->a:Lcom/xiaomi/push/hb;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/xiaomi/push/service/u$7;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService$j;-><init>(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 109
    const-string p0, "send ack message for clear push message."

    return-object p0
.end method

.method public a()V
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Lcom/xiaomi/push/gw;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/xiaomi/push/gw;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/xiaomi/push/gp;->D:Lcom/xiaomi/push/gp;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/gw;->c(Ljava/lang/String;)Lcom/xiaomi/push/gw;

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/xiaomi/push/service/u$7;->a:Lcom/xiaomi/push/he;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/xiaomi/push/he;->a()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/gw;->a(Ljava/lang/String;)Lcom/xiaomi/push/gw;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/xiaomi/push/service/u$7;->a:Lcom/xiaomi/push/he;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/xiaomi/push/he;->a()Lcom/xiaomi/push/gu;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/gw;->a(Lcom/xiaomi/push/gu;)Lcom/xiaomi/push/gw;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/xiaomi/push/service/u$7;->a:Lcom/xiaomi/push/he;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/xiaomi/push/he;->b()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/gw;->b(Ljava/lang/String;)Lcom/xiaomi/push/gw;

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/xiaomi/push/service/u$7;->a:Lcom/xiaomi/push/he;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/xiaomi/push/he;->d()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/gw;->e(Ljava/lang/String;)Lcom/xiaomi/push/gw;

    .line 47
    .line 48
    .line 49
    const-wide/16 v1, 0x0

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/gw;->a(J)Lcom/xiaomi/push/gw;

    .line 52
    .line 53
    .line 54
    const-string v1, "success clear push message."

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/gw;->d(Ljava/lang/String;)Lcom/xiaomi/push/gw;

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/xiaomi/push/service/u$7;->a:Lcom/xiaomi/push/hb;

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v2, p0, Lcom/xiaomi/push/service/u$7;->a:Lcom/xiaomi/push/hb;

    .line 66
    .line 67
    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->a()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    sget-object v3, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 72
    .line 73
    invoke-static {v1, v2, v0, v3}, Lcom/xiaomi/push/service/w;->b(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-object v1, p0, Lcom/xiaomi/push/service/u$7;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 78
    .line 79
    invoke-static {v1, v0}, Lcom/xiaomi/push/service/w;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V
    :try_end_0
    .catch Lcom/xiaomi/push/fi; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :catch_0
    move-exception v0

    .line 84
    new-instance v1, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string v2, "clear push message. "

    .line 87
    .line 88
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-static {v1}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/xiaomi/push/service/u$7;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 102
    .line 103
    const/16 v1, 0xa

    .line 104
    .line 105
    invoke-virtual {p0, v1, v0}, Lcom/xiaomi/push/service/XMPushService;->a(ILjava/lang/Exception;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method
