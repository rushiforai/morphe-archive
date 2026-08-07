.class public Lcom/tencent/could/component/common/ai/net/ThreadManager$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/RejectedExecutionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/component/common/ai/net/ThreadManager;-><init>()V
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
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager$3;->a:Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public rejectedExecution(Ljava/lang/Runnable;Ljava/util/concurrent/ThreadPoolExecutor;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager$3;->a:Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/could/component/common/ai/net/ThreadManager;->addTask(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
