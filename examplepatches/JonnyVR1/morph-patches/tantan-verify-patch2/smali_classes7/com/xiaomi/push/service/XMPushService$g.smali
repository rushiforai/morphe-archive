.class public Lcom/xiaomi/push/service/XMPushService$g;
.super Lcom/xiaomi/push/service/XMPushService$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/XMPushService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "g"
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/service/XMPushService;

.field public a:Ljava/lang/Exception;

.field public b:I


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;ILjava/lang/Exception;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService$g;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService$j;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput p2, p0, Lcom/xiaomi/push/service/XMPushService$g;->b:I

    .line 8
    .line 9
    iput-object p3, p0, Lcom/xiaomi/push/service/XMPushService$g;->a:Ljava/lang/Exception;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 11
    const-string p0, "disconnect the connection."

    return-object p0
.end method

.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$g;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    iget v1, p0, Lcom/xiaomi/push/service/XMPushService$g;->b:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/xiaomi/push/service/XMPushService$g;->a:Ljava/lang/Exception;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Lcom/xiaomi/push/service/XMPushService;->a(ILjava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
