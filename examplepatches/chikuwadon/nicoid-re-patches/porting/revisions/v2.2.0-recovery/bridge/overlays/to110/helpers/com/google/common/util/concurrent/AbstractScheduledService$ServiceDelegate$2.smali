.class public final synthetic Lcom/google/common/util/concurrent/AbstractScheduledService$ServiceDelegate$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/google/common/util/concurrent/AbstractScheduledService$ServiceDelegate;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/util/concurrent/AbstractScheduledService$ServiceDelegate;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/AbstractScheduledService$ServiceDelegate$2;->f$0:Lcom/google/common/util/concurrent/AbstractScheduledService$ServiceDelegate;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 1

    .line 0
    iget-object p0, p0, Lcom/google/common/util/concurrent/AbstractScheduledService$ServiceDelegate$2;->f$0:Lcom/google/common/util/concurrent/AbstractScheduledService$ServiceDelegate;

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractScheduledService$ServiceDelegate;->lambda$doStop$0$com-google-common-util-concurrent-AbstractScheduledService$ServiceDelegate()V

    return-void
.end method
