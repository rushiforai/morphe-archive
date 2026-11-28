.class final Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;
.super Ljava/lang/Object;
.source "AbstractService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/AbstractService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "StateSnapshot"
.end annotation


# instance fields
.field final failure:Ljava/lang/Throwable;

.field final shutdownWhenStartupFinishes:Z

.field final state:Lcom/google/common/util/concurrent/Service$State;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/Service$State;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "internalState"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 589
    invoke-direct {p0, p1, v0, v1}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;-><init>(Lcom/google/common/util/concurrent/Service$State;ZLjava/lang/Throwable;)V

    return-void
.end method

.method constructor <init>(Lcom/google/common/util/concurrent/Service$State;ZLjava/lang/Throwable;)V
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "internalState",
            "shutdownWhenStartupFinishes",
            "failure"
        }
    .end annotation

    .line 593
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_0

    .line 594
    sget-object v2, Lcom/google/common/util/concurrent/Service$State;->STARTING:Lcom/google/common/util/concurrent/Service$State;

    if-eq p1, v2, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    const-string v3, "shutdownWhenStartupFinishes can only be set if state is STARTING. Got %s instead."

    invoke-static {v2, v3, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    if-eqz p3, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    move v2, v0

    .line 598
    :goto_1
    sget-object v3, Lcom/google/common/util/concurrent/Service$State;->FAILED:Lcom/google/common/util/concurrent/Service$State;

    if-ne p1, v3, :cond_2

    move v3, v1

    goto :goto_2

    :cond_2
    move v3, v0

    :goto_2
    if-ne v2, v3, :cond_3

    move v0, v1

    :cond_3
    const-string v1, "A failure cause should be set if and only if the state is failed.  Got %s and %s instead."

    invoke-static {v0, v1, p1, p3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 604
    iput-object p1, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    .line 605
    iput-boolean p2, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->shutdownWhenStartupFinishes:Z

    .line 606
    iput-object p3, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->failure:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method externalState()Lcom/google/common/util/concurrent/Service$State;
    .registers 3

    .line 613
    iget-boolean v0, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->shutdownWhenStartupFinishes:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    sget-object v1, Lcom/google/common/util/concurrent/Service$State;->STARTING:Lcom/google/common/util/concurrent/Service$State;

    if-ne v0, v1, :cond_0

    .line 614
    sget-object p0, Lcom/google/common/util/concurrent/Service$State;->STOPPING:Lcom/google/common/util/concurrent/Service$State;

    return-object p0

    .line 616
    :cond_0
    iget-object p0, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    return-object p0
.end method

.method failureCause()Ljava/lang/Throwable;
    .registers 4

    .line 624
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    sget-object v1, Lcom/google/common/util/concurrent/Service$State;->FAILED:Lcom/google/common/util/concurrent/Service$State;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "failureCause() is only valid if the service has failed, service is %s"

    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 629
    iget-object p0, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->failure:Ljava/lang/Throwable;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Throwable;

    return-object p0
.end method
