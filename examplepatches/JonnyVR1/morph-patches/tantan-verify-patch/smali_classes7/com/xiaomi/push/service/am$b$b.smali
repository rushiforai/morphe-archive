.class Lcom/xiaomi/push/service/am$b$b;
.super Lcom/xiaomi/push/service/XMPushService$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/am$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/service/am$b;

.field a:Ljava/lang/String;

.field b:I

.field b:Ljava/lang/String;

.field c:I


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/am$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/service/am$b$b;->a:Lcom/xiaomi/push/service/am$b;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService$j;-><init>(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(IILjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/XMPushService$j;
    .locals 0

    .line 50
    iput p1, p0, Lcom/xiaomi/push/service/am$b$b;->b:I

    .line 51
    iput p2, p0, Lcom/xiaomi/push/service/am$b$b;->c:I

    .line 52
    iput-object p4, p0, Lcom/xiaomi/push/service/am$b$b;->b:Ljava/lang/String;

    .line 53
    iput-object p3, p0, Lcom/xiaomi/push/service/am$b$b;->a:Ljava/lang/String;

    return-object p0
.end method

.method public a()Ljava/lang/String;
    .locals 0

    .line 49
    const-string p0, "notify job"

    return-object p0
.end method

.method public a()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/am$b$b;->a:Lcom/xiaomi/push/service/am$b;

    .line 2
    .line 3
    iget v1, p0, Lcom/xiaomi/push/service/am$b$b;->b:I

    .line 4
    .line 5
    iget v2, p0, Lcom/xiaomi/push/service/am$b$b;->c:I

    .line 6
    .line 7
    iget-object v3, p0, Lcom/xiaomi/push/service/am$b$b;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, v3}, Lcom/xiaomi/push/service/am$b;->a(Lcom/xiaomi/push/service/am$b;IILjava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/xiaomi/push/service/am$b$b;->a:Lcom/xiaomi/push/service/am$b;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget v0, p0, Lcom/xiaomi/push/service/am$b$b;->b:I

    .line 18
    .line 19
    iget v2, p0, Lcom/xiaomi/push/service/am$b$b;->c:I

    .line 20
    .line 21
    iget-object v3, p0, Lcom/xiaomi/push/service/am$b$b;->a:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b$b;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1, v0, v2, v3, p0}, Lcom/xiaomi/push/service/am$b;->a(Lcom/xiaomi/push/service/am$b;IILjava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v0, " ignore notify client :"

    .line 32
    .line 33
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, v1, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Ll/ouq0;->w(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
