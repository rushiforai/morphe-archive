.class final Lorg/junit/experimental/max/MaxHistory$RememberingListener;
.super Lorg/junit/runner/notification/RunListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/experimental/max/MaxHistory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "RememberingListener"
.end annotation


# instance fields
.field private overallStart:J

.field private starts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/junit/runner/Description;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/junit/experimental/max/MaxHistory;


# direct methods
.method private constructor <init>(Lorg/junit/experimental/max/MaxHistory;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->this$0:Lorg/junit/experimental/max/MaxHistory;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/junit/runner/notification/RunListener;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iput-wide v0, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->overallStart:J

    .line 11
    .line 12
    new-instance p1, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->starts:Ljava/util/Map;

    .line 18
    .line 19
    return-void
.end method

.method public synthetic constructor <init>(Lorg/junit/experimental/max/MaxHistory;Lorg/junit/experimental/max/MaxHistory$1;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lorg/junit/experimental/max/MaxHistory$RememberingListener;-><init>(Lorg/junit/experimental/max/MaxHistory;)V

    return-void
.end method


# virtual methods
.method public testFailure(Lorg/junit/runner/notification/Failure;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->this$0:Lorg/junit/experimental/max/MaxHistory;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/junit/runner/notification/Failure;->getDescription()Lorg/junit/runner/Description;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-wide v1, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->overallStart:J

    .line 8
    .line 9
    invoke-virtual {v0, p1, v1, v2}, Lorg/junit/experimental/max/MaxHistory;->putTestFailureTimestamp(Lorg/junit/runner/Description;J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public testFinished(Lorg/junit/runner/Description;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->starts:Ljava/util/Map;

    .line 6
    .line 7
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    iget-object p0, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->this$0:Lorg/junit/experimental/max/MaxHistory;

    .line 18
    .line 19
    sub-long/2addr v0, v2

    .line 20
    invoke-virtual {p0, p1, v0, v1}, Lorg/junit/experimental/max/MaxHistory;->putTestDuration(Lorg/junit/runner/Description;J)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public testRunFinished(Lorg/junit/runner/Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->this$0:Lorg/junit/experimental/max/MaxHistory;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/junit/experimental/max/MaxHistory;->access$000(Lorg/junit/experimental/max/MaxHistory;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public testStarted(Lorg/junit/runner/Description;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->starts:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method
