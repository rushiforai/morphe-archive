.class Lcom/xiaomi/push/service/am$b$c$2;
.super Lcom/xiaomi/push/service/XMPushService$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/am$b$c;->binderDied()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/service/am$b$c;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/am$b$c;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/service/am$b$c$2;->a:Lcom/xiaomi/push/service/am$b$c;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/xiaomi/push/service/XMPushService$j;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 44
    const-string p0, "check peer job"

    return-object p0
.end method

.method public a()V
    .locals 7

    .line 1
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/xiaomi/push/service/am$b$c$2;->a:Lcom/xiaomi/push/service/am$b$c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/xiaomi/push/service/am$b$c;->a:Lcom/xiaomi/push/service/am$b;

    .line 8
    .line 9
    iget-object v2, v1, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v2, v1}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/am$b;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/xiaomi/push/service/am$b$c$2;->a:Lcom/xiaomi/push/service/am$b$c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/xiaomi/push/service/am$b$c;->b:Lcom/xiaomi/push/service/am$b;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/xiaomi/push/service/am$b;->a(Lcom/xiaomi/push/service/am$b;)Lcom/xiaomi/push/service/XMPushService;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b$c$2;->a:Lcom/xiaomi/push/service/am$b$c;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b$c;->a:Lcom/xiaomi/push/service/am$b;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    .line 36
    .line 37
    const/4 v5, 0x0

    .line 38
    const/4 v6, 0x0

    .line 39
    const/4 v4, 0x2

    .line 40
    invoke-virtual/range {v1 .. v6}, Lcom/xiaomi/push/service/XMPushService;->a(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
