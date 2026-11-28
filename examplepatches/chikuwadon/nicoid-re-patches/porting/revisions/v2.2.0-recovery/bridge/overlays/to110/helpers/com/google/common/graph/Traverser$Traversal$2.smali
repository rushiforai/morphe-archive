.class Lcom/google/common/graph/Traverser$Traversal$2;
.super Lcom/google/common/graph/Traverser$Traversal;
.source "Traverser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/graph/Traverser$Traversal;->inTree(Lcom/google/common/graph/SuccessorsFunction;)Lcom/google/common/graph/Traverser$Traversal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/graph/Traverser$Traversal<",
        "TN;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/google/common/graph/SuccessorsFunction;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "successorFunction"
        }
    .end annotation

    .line 392
    invoke-direct {p0, p1}, Lcom/google/common/graph/Traverser$Traversal;-><init>(Lcom/google/common/graph/SuccessorsFunction;)V

    return-void
.end method


# virtual methods
.method visitNext(Ljava/util/Deque;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "horizon"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Deque<",
            "Ljava/util/Iterator<",
            "+TN;>;>;)TN;"
        }
    .end annotation

    .line 395
    invoke-interface {p1}, Ljava/util/Deque;->getFirst()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Iterator;

    .line 396
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 397
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 399
    :cond_0
    invoke-interface {p1}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    const/4 p0, 0x0

    return-object p0
.end method
