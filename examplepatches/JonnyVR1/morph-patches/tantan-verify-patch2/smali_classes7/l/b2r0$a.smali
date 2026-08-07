.class Ll/b2r0$a;
.super Lcom/xiaomi/push/service/XMPushService$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/b2r0;->A(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic d:J

.field final synthetic e:J

.field final synthetic f:Ll/b2r0;


# direct methods
.method public constructor <init>(Ll/b2r0;IJJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b2r0$a;->f:Ll/b2r0;

    .line 2
    .line 3
    iput-wide p3, p0, Ll/b2r0$a;->d:J

    .line 4
    .line 5
    iput-wide p5, p0, Ll/b2r0$a;->e:J

    .line 6
    .line 7
    invoke-direct {p0, p2}, Lcom/xiaomi/push/service/XMPushService$j;-><init>(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 3

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "check the ping-pong."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Ll/b2r0$a;->e:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public a()V
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b2r0$a;->f:Ll/b2r0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/u1r0;->D()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/b2r0$a;->f:Ll/b2r0;

    .line 13
    .line 14
    iget-wide v1, p0, Ll/b2r0$a;->d:J

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Ll/u1r0;->r(J)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/b2r0$a;->f:Ll/b2r0;

    .line 23
    .line 24
    iget-object v0, v0, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/xiaomi/push/service/m;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/m;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/xiaomi/push/service/m;->b()V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/b2r0$a;->f:Ll/b2r0;

    .line 34
    .line 35
    iget-object p0, p0, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 36
    .line 37
    const/16 v0, 0x16

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/push/service/XMPushService;->a(ILjava/lang/Exception;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
