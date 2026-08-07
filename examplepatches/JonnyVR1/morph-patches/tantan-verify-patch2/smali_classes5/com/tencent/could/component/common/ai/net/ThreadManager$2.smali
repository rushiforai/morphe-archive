.class public Lcom/tencent/could/component/common/ai/net/ThreadManager$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/component/common/ai/net/ThreadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/could/component/common/ai/net/ThreadManager;


# direct methods
.method public constructor <init>(Lcom/tencent/could/component/common/ai/net/ThreadManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager$2;->a:Lcom/tencent/could/component/common/ai/net/ThreadManager;

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
    .locals 4

    .line 1
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager$2;->a:Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->a:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/Runnable;

    .line 10
    .line 11
    instance-of v1, v0, Lcom/tencent/could/component/common/ai/net/HttpTask;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager$2;->a:Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 16
    .line 17
    move-object v2, v0

    .line 18
    check-cast v2, Lcom/tencent/could/component/common/ai/net/HttpTask;

    .line 19
    .line 20
    iput-object v2, v1, Lcom/tencent/could/component/common/ai/net/ThreadManager;->d:Lcom/tencent/could/component/common/ai/net/HttpTask;

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :catch_0
    move-exception v0

    .line 24
    goto :goto_2

    .line 25
    :cond_0
    :goto_1
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager$2;->a:Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/tencent/could/component/common/ai/net/ThreadManager;->b:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :goto_2
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v3, "network error , message: "

    .line 40
    .line 41
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v2, "ThreadManager"

    .line 56
    .line 57
    invoke-virtual {v1, v2, v0}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0
.end method
