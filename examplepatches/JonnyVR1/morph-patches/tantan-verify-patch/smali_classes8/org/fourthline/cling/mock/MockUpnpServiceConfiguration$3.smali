.class Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$3;
.super Ljava/util/concurrent/AbstractExecutorService;
.source "SourceFile"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;->getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field terminated:Z

.field final synthetic this$0:Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$3;->this$0:Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/concurrent/AbstractExecutorService;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$3;->shutdown()V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$3;->terminated:Z

    .line 5
    .line 6
    return p0
.end method

.method public synthetic close()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/zmg0;->a(Ljava/util/concurrent/ExecutorService;)V

    return-void
.end method

.method public execute(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public isShutdown()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$3;->terminated:Z

    .line 2
    .line 3
    return p0
.end method

.method public isTerminated()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$3;->terminated:Z

    .line 2
    .line 3
    return p0
.end method

.method public shutdown()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$3;->terminated:Z

    .line 3
    .line 4
    return-void
.end method

.method public shutdownNow()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$3;->shutdown()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method
