.class public Lorg/junit/experimental/results/PrintableResult;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private result:Lorg/junit/runner/Result;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/junit/runner/notification/Failure;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/junit/experimental/results/FailureList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/junit/experimental/results/FailureList;-><init>(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/junit/experimental/results/FailureList;->result()Lorg/junit/runner/Result;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-direct {p0, p1}, Lorg/junit/experimental/results/PrintableResult;-><init>(Lorg/junit/runner/Result;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private constructor <init>(Lorg/junit/runner/Result;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lorg/junit/experimental/results/PrintableResult;->result:Lorg/junit/runner/Result;

    return-void
.end method

.method public static testResult(Ljava/lang/Class;)Lorg/junit/experimental/results/PrintableResult;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Lorg/junit/experimental/results/PrintableResult;"
        }
    .end annotation

    .line 16
    invoke-static {p0}, Lorg/junit/runner/Request;->aClass(Ljava/lang/Class;)Lorg/junit/runner/Request;

    move-result-object p0

    invoke-static {p0}, Lorg/junit/experimental/results/PrintableResult;->testResult(Lorg/junit/runner/Request;)Lorg/junit/experimental/results/PrintableResult;

    move-result-object p0

    return-object p0
.end method

.method public static testResult(Lorg/junit/runner/Request;)Lorg/junit/experimental/results/PrintableResult;
    .locals 2

    .line 1
    new-instance v0, Lorg/junit/experimental/results/PrintableResult;

    .line 2
    .line 3
    new-instance v1, Lorg/junit/runner/JUnitCore;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/junit/runner/JUnitCore;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1, p0}, Lorg/junit/runner/JUnitCore;->run(Lorg/junit/runner/Request;)Lorg/junit/runner/Result;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-direct {v0, p0}, Lorg/junit/experimental/results/PrintableResult;-><init>(Lorg/junit/runner/Result;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method


# virtual methods
.method public failureCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/experimental/results/PrintableResult;->result:Lorg/junit/runner/Result;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/junit/runner/Result;->getFailures()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lorg/junit/internal/TextListener;

    .line 7
    .line 8
    new-instance v2, Ljava/io/PrintStream;

    .line 9
    .line 10
    invoke-direct {v2, v0}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {v1, v2}, Lorg/junit/internal/TextListener;-><init>(Ljava/io/PrintStream;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lorg/junit/experimental/results/PrintableResult;->result:Lorg/junit/runner/Result;

    .line 17
    .line 18
    invoke-virtual {v1, p0}, Lorg/junit/internal/TextListener;->testRunFinished(Lorg/junit/runner/Result;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
