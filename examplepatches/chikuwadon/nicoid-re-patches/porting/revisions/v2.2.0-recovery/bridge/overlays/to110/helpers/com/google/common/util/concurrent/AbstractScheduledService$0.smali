.class public final synthetic Lcom/google/common/util/concurrent/AbstractScheduledService$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# instance fields
.field public final synthetic f$0:Lcom/google/common/util/concurrent/AbstractScheduledService;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/util/concurrent/AbstractScheduledService;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/AbstractScheduledService$0;->f$0:Lcom/google/common/util/concurrent/AbstractScheduledService;

    return-void
.end method


# virtual methods
.method public final newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/util/concurrent/AbstractScheduledService$0;->f$0:Lcom/google/common/util/concurrent/AbstractScheduledService;

    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/AbstractScheduledService;->lambda$executor$0$com-google-common-util-concurrent-AbstractScheduledService(Ljava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object p0

    return-object p0
.end method
