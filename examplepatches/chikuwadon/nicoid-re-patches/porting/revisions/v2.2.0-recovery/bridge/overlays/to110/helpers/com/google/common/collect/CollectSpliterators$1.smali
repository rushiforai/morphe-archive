.class Lcom/google/common/collect/CollectSpliterators$1;
.super Ljava/lang/Object;
.source "CollectSpliterators.java"

# interfaces
.implements Ljava/util/Spliterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/CollectSpliterators;->map(Ljava/util/Spliterator;Ljava/util/function/Function;)Ljava/util/Spliterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Spliterator<",
        "TOutElementT;>;"
    }
.end annotation


# instance fields
.field final synthetic val$fromSpliterator:Ljava/util/Spliterator;

.field final synthetic val$function:Ljava/util/function/Function;


# direct methods
.method constructor <init>(Ljava/util/Spliterator;Ljava/util/function/Function;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010
        }
        names = {
            "val$fromSpliterator",
            "val$function"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 122
    iput-object p1, p0, Lcom/google/common/collect/CollectSpliterators$1;->val$fromSpliterator:Ljava/util/Spliterator;

    iput-object p2, p0, Lcom/google/common/collect/CollectSpliterators$1;->val$function:Ljava/util/function/Function;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$forEachRemaining$0(Ljava/util/function/Consumer;Ljava/util/function/Function;Ljava/lang/Object;)V
    .registers 3

    .line 132
    invoke-interface {p1, p2}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$tryAdvance$0(Ljava/util/function/Consumer;Ljava/util/function/Function;Ljava/lang/Object;)V
    .registers 3

    .line 127
    invoke-interface {p1, p2}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public characteristics()I
    .registers 1

    .line 148
    iget-object p0, p0, Lcom/google/common/collect/CollectSpliterators$1;->val$fromSpliterator:Ljava/util/Spliterator;

    invoke-interface {p0}, Ljava/util/Spliterator;->characteristics()I

    move-result p0

    and-int/lit16 p0, p0, -0x106

    return p0
.end method

.method public estimateSize()J
    .registers 3

    .line 143
    iget-object p0, p0, Lcom/google/common/collect/CollectSpliterators$1;->val$fromSpliterator:Ljava/util/Spliterator;

    invoke-interface {p0}, Ljava/util/Spliterator;->estimateSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public forEachRemaining(Ljava/util/function/Consumer;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "action"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "-TOutElementT;>;)V"
        }
    .end annotation

    .line 132
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$1;->val$fromSpliterator:Ljava/util/Spliterator;

    iget-object p0, p0, Lcom/google/common/collect/CollectSpliterators$1;->val$function:Ljava/util/function/Function;

    new-instance v1, Lcom/google/common/collect/CollectSpliterators$1$0;

    invoke-direct {v1, p1, p0}, Lcom/google/common/collect/CollectSpliterators$1$0;-><init>(Ljava/util/function/Consumer;Ljava/util/function/Function;)V

    invoke-interface {v0, v1}, Ljava/util/Spliterator;->forEachRemaining(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public tryAdvance(Ljava/util/function/Consumer;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "action"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "-TOutElementT;>;)Z"
        }
    .end annotation

    .line 126
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$1;->val$fromSpliterator:Ljava/util/Spliterator;

    iget-object p0, p0, Lcom/google/common/collect/CollectSpliterators$1;->val$function:Ljava/util/function/Function;

    new-instance v1, Lcom/google/common/collect/CollectSpliterators$1$1;

    invoke-direct {v1, p1, p0}, Lcom/google/common/collect/CollectSpliterators$1$1;-><init>(Ljava/util/function/Consumer;Ljava/util/function/Function;)V

    invoke-interface {v0, v1}, Ljava/util/Spliterator;->tryAdvance(Ljava/util/function/Consumer;)Z

    move-result p0

    return p0
.end method

.method public trySplit()Ljava/util/Spliterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Spliterator<",
            "TOutElementT;>;"
        }
    .end annotation

    .line 137
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$1;->val$fromSpliterator:Ljava/util/Spliterator;

    invoke-interface {v0}, Ljava/util/Spliterator;->trySplit()Ljava/util/Spliterator;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 138
    iget-object p0, p0, Lcom/google/common/collect/CollectSpliterators$1;->val$function:Ljava/util/function/Function;

    invoke-static {v0, p0}, Lcom/google/common/collect/CollectSpliterators;->map(Ljava/util/Spliterator;Ljava/util/function/Function;)Ljava/util/Spliterator;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method
