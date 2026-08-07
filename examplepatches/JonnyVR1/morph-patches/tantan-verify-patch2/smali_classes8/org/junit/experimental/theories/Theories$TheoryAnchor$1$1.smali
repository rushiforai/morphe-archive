.class Lorg/junit/experimental/theories/Theories$TheoryAnchor$1$1;
.super Lorg/junit/runners/model/Statement;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;->methodBlock(Lorg/junit/runners/model/FrameworkMethod;)Lorg/junit/runners/model/Statement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;

.field final synthetic val$statement:Lorg/junit/runners/model/Statement;


# direct methods
.method public constructor <init>(Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;Lorg/junit/runners/model/Statement;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1$1;->this$1:Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1$1;->val$statement:Lorg/junit/runners/model/Statement;

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/junit/runners/model/Statement;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public evaluate()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1$1;->val$statement:Lorg/junit/runners/model/Statement;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/junit/runners/model/Statement;->evaluate()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1$1;->this$1:Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;

    .line 7
    .line 8
    iget-object v0, v0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;->this$0:Lorg/junit/experimental/theories/Theories$TheoryAnchor;

    .line 9
    .line 10
    invoke-virtual {v0}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->handleDataPointSuccess()V
    :try_end_0
    .catch Lorg/junit/internal/AssumptionViolatedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :goto_0
    iget-object p0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1$1;->this$1:Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;

    .line 19
    .line 20
    iget-object v1, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;->this$0:Lorg/junit/experimental/theories/Theories$TheoryAnchor;

    .line 21
    .line 22
    iget-object p0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;->val$complete:Lorg/junit/experimental/theories/internal/Assignments;

    .line 23
    .line 24
    invoke-static {v1}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->access$000(Lorg/junit/experimental/theories/Theories$TheoryAnchor;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {p0, v2}, Lorg/junit/experimental/theories/internal/Assignments;->getArgumentStrings(Z)[Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v1, v0, p0}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->reportParameterizedError(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    goto :goto_2

    .line 36
    :goto_1
    iget-object p0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1$1;->this$1:Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;

    .line 37
    .line 38
    iget-object p0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;->this$0:Lorg/junit/experimental/theories/Theories$TheoryAnchor;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->handleAssumptionViolation(Lorg/junit/internal/AssumptionViolatedException;)V

    .line 41
    .line 42
    .line 43
    :goto_2
    return-void
.end method
