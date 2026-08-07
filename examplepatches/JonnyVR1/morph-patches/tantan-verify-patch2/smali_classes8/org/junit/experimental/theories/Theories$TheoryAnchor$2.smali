.class Lorg/junit/experimental/theories/Theories$TheoryAnchor$2;
.super Lorg/junit/runners/model/Statement;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/experimental/theories/Theories$TheoryAnchor;->methodCompletesWithParameters(Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/experimental/theories/internal/Assignments;Ljava/lang/Object;)Lorg/junit/runners/model/Statement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/experimental/theories/Theories$TheoryAnchor;

.field final synthetic val$complete:Lorg/junit/experimental/theories/internal/Assignments;

.field final synthetic val$freshInstance:Ljava/lang/Object;

.field final synthetic val$method:Lorg/junit/runners/model/FrameworkMethod;


# direct methods
.method public constructor <init>(Lorg/junit/experimental/theories/Theories$TheoryAnchor;Lorg/junit/experimental/theories/internal/Assignments;Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$2;->this$0:Lorg/junit/experimental/theories/Theories$TheoryAnchor;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$2;->val$complete:Lorg/junit/experimental/theories/internal/Assignments;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$2;->val$method:Lorg/junit/runners/model/FrameworkMethod;

    .line 6
    .line 7
    iput-object p4, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$2;->val$freshInstance:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {p0}, Lorg/junit/runners/model/Statement;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public evaluate()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$2;->val$complete:Lorg/junit/experimental/theories/internal/Assignments;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/junit/experimental/theories/internal/Assignments;->getMethodArguments()[Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$2;->this$0:Lorg/junit/experimental/theories/Theories$TheoryAnchor;

    .line 8
    .line 9
    invoke-static {v1}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->access$000(Lorg/junit/experimental/theories/Theories$TheoryAnchor;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-static {v0}, Lorg/junit/Assume;->assumeNotNull([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v1, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$2;->val$method:Lorg/junit/runners/model/FrameworkMethod;

    .line 19
    .line 20
    iget-object p0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$2;->val$freshInstance:Ljava/lang/Object;

    .line 21
    .line 22
    invoke-virtual {v1, p0, v0}, Lorg/junit/runners/model/FrameworkMethod;->invokeExplosively(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    return-void
.end method
