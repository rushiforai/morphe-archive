.class public Lorg/junit/internal/runners/statements/InvokeMethod;
.super Lorg/junit/runners/model/Statement;
.source "SourceFile"


# instance fields
.field private final target:Ljava/lang/Object;

.field private final testMethod:Lorg/junit/runners/model/FrameworkMethod;


# direct methods
.method public constructor <init>(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/junit/runners/model/Statement;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/junit/internal/runners/statements/InvokeMethod;->testMethod:Lorg/junit/runners/model/FrameworkMethod;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/junit/internal/runners/statements/InvokeMethod;->target:Ljava/lang/Object;

    .line 7
    .line 8
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
    iget-object v0, p0, Lorg/junit/internal/runners/statements/InvokeMethod;->testMethod:Lorg/junit/runners/model/FrameworkMethod;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/junit/internal/runners/statements/InvokeMethod;->target:Ljava/lang/Object;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    new-array v1, v1, [Ljava/lang/Object;

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Lorg/junit/runners/model/FrameworkMethod;->invokeExplosively(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method
