.class Lcom/leanplum/internal/RequestSenderTimer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/RequestSenderTimer;->createTimerOperation()Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/internal/RequestSenderTimer;


# direct methods
.method public constructor <init>(Lcom/leanplum/internal/RequestSenderTimer;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/RequestSenderTimer$1;->this$0:Lcom/leanplum/internal/RequestSenderTimer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    iget-object v0, p0, Lcom/leanplum/internal/RequestSenderTimer$1;->this$0:Lcom/leanplum/internal/RequestSenderTimer;

    # invokes: Lcom/leanplum/internal/RequestSenderTimer;->sendAllRequestsWithHeartbeat()V
    invoke-static {v0}, Lcom/leanplum/internal/RequestSenderTimer;->access$000(Lcom/leanplum/internal/RequestSenderTimer;)V

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/internal/RequestSenderTimer$1;->this$0:Lcom/leanplum/internal/RequestSenderTimer;

    # getter for: Lcom/leanplum/internal/RequestSenderTimer;->timerOperation:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/leanplum/internal/RequestSenderTimer;->access$100(Lcom/leanplum/internal/RequestSenderTimer;)Ljava/lang/Runnable;

    move-result-object v1

    iget-object p0, p0, Lcom/leanplum/internal/RequestSenderTimer$1;->this$0:Lcom/leanplum/internal/RequestSenderTimer;

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestSenderTimer;->getIntervalMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lcom/leanplum/internal/OperationQueue;->addOperationAfterDelay(Ljava/lang/Runnable;J)Z

    return-void
.end method
