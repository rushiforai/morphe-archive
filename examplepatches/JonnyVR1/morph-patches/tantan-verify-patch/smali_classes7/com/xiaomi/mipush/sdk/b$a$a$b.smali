.class Lcom/xiaomi/mipush/sdk/b$a$a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/b$a$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/mipush/sdk/b$a$a;


# direct methods
.method public constructor <init>(Lcom/xiaomi/mipush/sdk/b$a$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/b$a$a$b;->a:Lcom/xiaomi/mipush/sdk/b$a$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/b$a$a$b;->a:Lcom/xiaomi/mipush/sdk/b$a$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/xiaomi/mipush/sdk/b$a$a;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/b$a$a$b;->a:Lcom/xiaomi/mipush/sdk/b$a$a;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/b$a$a;->g(Lcom/xiaomi/mipush/sdk/b$a$a;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/b$a$a;->a(Lcom/xiaomi/mipush/sdk/b$a$a;)Ljava/util/concurrent/ScheduledFuture;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/b$a$a$b;->a:Lcom/xiaomi/mipush/sdk/b$a$a;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/b$a$a;->a(Lcom/xiaomi/mipush/sdk/b$a$a;)Ljava/util/concurrent/ScheduledFuture;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/b$a$a$b;->a:Lcom/xiaomi/mipush/sdk/b$a$a;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-static {p0, v0}, Lcom/xiaomi/mipush/sdk/b$a$a;->b(Lcom/xiaomi/mipush/sdk/b$a$a;Ljava/util/concurrent/ScheduledFuture;)Ljava/util/concurrent/ScheduledFuture;

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method
