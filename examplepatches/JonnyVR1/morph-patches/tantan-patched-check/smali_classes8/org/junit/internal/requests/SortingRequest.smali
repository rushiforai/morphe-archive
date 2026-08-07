.class public Lorg/junit/internal/requests/SortingRequest;
.super Lorg/junit/runner/Request;
.source "SourceFile"


# instance fields
.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lorg/junit/runner/Description;",
            ">;"
        }
    .end annotation
.end field

.field private final request:Lorg/junit/runner/Request;


# direct methods
.method public constructor <init>(Lorg/junit/runner/Request;Ljava/util/Comparator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Request;",
            "Ljava/util/Comparator<",
            "Lorg/junit/runner/Description;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lorg/junit/runner/Request;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/junit/internal/requests/SortingRequest;->request:Lorg/junit/runner/Request;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/junit/internal/requests/SortingRequest;->comparator:Ljava/util/Comparator;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getRunner()Lorg/junit/runner/Runner;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/junit/internal/requests/SortingRequest;->request:Lorg/junit/runner/Request;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/junit/runner/Request;->getRunner()Lorg/junit/runner/Runner;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lorg/junit/runner/manipulation/Sorter;

    .line 8
    .line 9
    iget-object p0, p0, Lorg/junit/internal/requests/SortingRequest;->comparator:Ljava/util/Comparator;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lorg/junit/runner/manipulation/Sorter;-><init>(Ljava/util/Comparator;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v0}, Lorg/junit/runner/manipulation/Sorter;->apply(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method
