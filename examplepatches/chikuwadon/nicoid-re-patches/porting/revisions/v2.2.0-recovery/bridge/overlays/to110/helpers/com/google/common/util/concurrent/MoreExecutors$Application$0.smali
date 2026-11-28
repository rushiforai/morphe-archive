.class public final synthetic Lcom/google/common/util/concurrent/MoreExecutors$Application$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/util/concurrent/ExecutorService;

.field public final synthetic f$1:J

.field public final synthetic f$2:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/ExecutorService;JLjava/util/concurrent/TimeUnit;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/MoreExecutors$Application$0;->f$0:Ljava/util/concurrent/ExecutorService;

    iput-wide p2, p0, Lcom/google/common/util/concurrent/MoreExecutors$Application$0;->f$1:J

    iput-object p4, p0, Lcom/google/common/util/concurrent/MoreExecutors$Application$0;->f$2:Ljava/util/concurrent/TimeUnit;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lcom/google/common/util/concurrent/MoreExecutors$Application$0;->f$0:Ljava/util/concurrent/ExecutorService;

    iget-wide v1, p0, Lcom/google/common/util/concurrent/MoreExecutors$Application$0;->f$1:J

    iget-object p0, p0, Lcom/google/common/util/concurrent/MoreExecutors$Application$0;->f$2:Ljava/util/concurrent/TimeUnit;

    invoke-static {v0, v1, v2, p0}, Lcom/google/common/util/concurrent/MoreExecutors$Application;->lambda$addDelayedShutdownHook$0(Ljava/util/concurrent/ExecutorService;JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method
