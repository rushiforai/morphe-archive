.class Lcom/google/common/base/Optional$1;
.super Lcom/google/common/base/AbstractIterator;
.source "Optional.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/base/Optional;->presentInstances(Ljava/lang/Iterable;)Ljava/lang/Iterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/base/AbstractIterator<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final iterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "+",
            "Lcom/google/common/base/Optional<",
            "+TT;>;>;"
        }
    .end annotation
.end field

.field final synthetic val$optionals:Ljava/lang/Iterable;


# direct methods
.method constructor <init>(Ljava/lang/Iterable;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "val$optionals"
        }
    .end annotation

    .line 350
    iput-object p1, p0, Lcom/google/common/base/Optional$1;->val$optionals:Ljava/lang/Iterable;

    invoke-direct {p0}, Lcom/google/common/base/AbstractIterator;-><init>()V

    .line 352
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Iterator;

    iput-object p1, p0, Lcom/google/common/base/Optional$1;->iterator:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method protected computeNext()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 356
    :cond_0
    iget-object v0, p0, Lcom/google/common/base/Optional$1;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 357
    iget-object v0, p0, Lcom/google/common/base/Optional$1;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/base/Optional;

    .line 358
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->isPresent()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 359
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 362
    :cond_1
    invoke-virtual {p0}, Lcom/google/common/base/Optional$1;->endOfData()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
