.class Lcom/google/common/graph/Traverser$2;
.super Lcom/google/common/graph/Traverser;
.source "Traverser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/graph/Traverser;->forTree(Lcom/google/common/graph/SuccessorsFunction;)Lcom/google/common/graph/Traverser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/graph/Traverser<",
        "TN;>;"
    }
.end annotation


# instance fields
.field final synthetic val$tree:Lcom/google/common/graph/SuccessorsFunction;


# direct methods
.method constructor <init>(Lcom/google/common/graph/SuccessorsFunction;Lcom/google/common/graph/SuccessorsFunction;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x1010
        }
        names = {
            "successorFunction",
            "val$tree"
        }
    .end annotation

    .line 185
    iput-object p2, p0, Lcom/google/common/graph/Traverser$2;->val$tree:Lcom/google/common/graph/SuccessorsFunction;

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/google/common/graph/Traverser;-><init>(Lcom/google/common/graph/SuccessorsFunction;Lcom/google/common/graph/Traverser$1;)V

    return-void
.end method


# virtual methods
.method newTraversal()Lcom/google/common/graph/Traverser$Traversal;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/Traverser$Traversal<",
            "TN;>;"
        }
    .end annotation

    .line 188
    iget-object p0, p0, Lcom/google/common/graph/Traverser$2;->val$tree:Lcom/google/common/graph/SuccessorsFunction;

    invoke-static {p0}, Lcom/google/common/graph/Traverser$Traversal;->inTree(Lcom/google/common/graph/SuccessorsFunction;)Lcom/google/common/graph/Traverser$Traversal;

    move-result-object p0

    return-object p0
.end method
