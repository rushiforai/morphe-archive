.class Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic a:Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver$1;->a:Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver$1;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver$1;->a:Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver$1;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->a(Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
