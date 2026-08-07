.class Lorg/junit/runner/Computer$1;
.super Lorg/junit/runners/model/RunnerBuilder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/runner/Computer;->getSuite(Lorg/junit/runners/model/RunnerBuilder;[Ljava/lang/Class;)Lorg/junit/runner/Runner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/runner/Computer;

.field final synthetic val$builder:Lorg/junit/runners/model/RunnerBuilder;


# direct methods
.method public constructor <init>(Lorg/junit/runner/Computer;Lorg/junit/runners/model/RunnerBuilder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/junit/runner/Computer$1;->this$0:Lorg/junit/runner/Computer;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/junit/runner/Computer$1;->val$builder:Lorg/junit/runners/model/RunnerBuilder;

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/junit/runners/model/RunnerBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public runnerForClass(Ljava/lang/Class;)Lorg/junit/runner/Runner;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Lorg/junit/runner/Runner;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/junit/runner/Computer$1;->this$0:Lorg/junit/runner/Computer;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/junit/runner/Computer$1;->val$builder:Lorg/junit/runners/model/RunnerBuilder;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lorg/junit/runner/Computer;->getRunner(Lorg/junit/runners/model/RunnerBuilder;Ljava/lang/Class;)Lorg/junit/runner/Runner;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
