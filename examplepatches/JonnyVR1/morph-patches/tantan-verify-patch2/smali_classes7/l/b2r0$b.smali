.class Ll/b2r0$b;
.super Lcom/xiaomi/push/service/XMPushService$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/b2r0;->Q(ILjava/lang/Exception;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic d:I

.field final synthetic e:Ljava/lang/Exception;

.field final synthetic f:Ll/b2r0;


# direct methods
.method public constructor <init>(Ll/b2r0;IILjava/lang/Exception;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b2r0$b;->f:Ll/b2r0;

    .line 2
    .line 3
    iput p3, p0, Ll/b2r0$b;->d:I

    .line 4
    .line 5
    iput-object p4, p0, Ll/b2r0$b;->e:Ljava/lang/Exception;

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
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "shutdown the connection. "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/b2r0$b;->d:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/b2r0$b;->e:Ljava/lang/Exception;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public a()V
    .locals 2

    .line 28
    iget-object v0, p0, Ll/b2r0$b;->f:Ll/b2r0;

    iget-object v0, v0, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    iget v1, p0, Ll/b2r0$b;->d:I

    iget-object p0, p0, Ll/b2r0$b;->e:Ljava/lang/Exception;

    invoke-virtual {v0, v1, p0}, Lcom/xiaomi/push/service/XMPushService;->a(ILjava/lang/Exception;)V

    return-void
.end method
