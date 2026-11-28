.class final enum Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller$1;
.super Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;
.source "ClosingFuture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    const/4 v0, 0x0

    .line 2373
    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/util/concurrent/ClosingFuture$ReachabilityFenceCaller;-><init>(Ljava/lang/String;ILcom/google/common/util/concurrent/ClosingFuture$1;)V

    return-void
.end method


# virtual methods
.method reachabilityFence(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 2384
    # getter for: Lcom/google/common/util/concurrent/ClosingFuture;->IS_REACHABILITY_FENCE_METHOD_USABLE:Z
    invoke-static {}, Lcom/google/common/util/concurrent/ClosingFuture;->access$3500()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 2385
    invoke-static {p1}, Ljava/lang/ref/Reference;->reachabilityFence(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
