.class Lcom/xiaomi/push/b$a;
.super Lcom/xiaomi/push/service/XMPushService$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/b;->a(Lcom/xiaomi/push/service/am$c;Lcom/xiaomi/push/service/am$c;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic d:Lcom/xiaomi/push/b;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/b;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/b$a;->d:Lcom/xiaomi/push/b;

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

    .line 7
    const-string p0, "Handling bind stats"

    return-object p0
.end method

.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/b$a;->d:Lcom/xiaomi/push/b;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/xiaomi/push/b;->b(Lcom/xiaomi/push/b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
