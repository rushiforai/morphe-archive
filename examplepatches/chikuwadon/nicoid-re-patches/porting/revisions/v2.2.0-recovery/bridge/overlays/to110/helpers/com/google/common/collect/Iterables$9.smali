.class Lcom/google/common/collect/Iterables$9;
.super Lcom/google/common/collect/FluentIterable;
.source "Iterables.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Iterables;->mergeSorted(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/lang/Iterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/FluentIterable<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic val$comparator:Ljava/util/Comparator;

.field final synthetic val$iterables:Ljava/lang/Iterable;


# direct methods
.method constructor <init>(Ljava/lang/Iterable;Ljava/util/Comparator;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010
        }
        names = {
            "val$iterables",
            "val$comparator"
        }
    .end annotation

    .line 1070
    iput-object p1, p0, Lcom/google/common/collect/Iterables$9;->val$iterables:Ljava/lang/Iterable;

    iput-object p2, p0, Lcom/google/common/collect/Iterables$9;->val$comparator:Ljava/util/Comparator;

    invoke-direct {p0}, Lcom/google/common/collect/FluentIterable;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 1073
    iget-object v0, p0, Lcom/google/common/collect/Iterables$9;->val$iterables:Ljava/lang/Iterable;

    new-instance v1, Lcom/google/common/collect/FluentIterable$2$0;

    invoke-direct {v1}, Lcom/google/common/collect/FluentIterable$2$0;-><init>()V

    .line 1074
    invoke-static {v0, v1}, Lcom/google/common/collect/Iterables;->transform(Ljava/lang/Iterable;Lcom/google/common/base/Function;)Ljava/lang/Iterable;

    move-result-object v0

    iget-object p0, p0, Lcom/google/common/collect/Iterables$9;->val$comparator:Ljava/util/Comparator;

    .line 1073
    invoke-static {v0, p0}, Lcom/google/common/collect/Iterators;->mergeSorted(Ljava/lang/Iterable;Ljava/util/Comparator;)Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method
