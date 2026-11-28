.class Lcom/google/common/collect/Iterables$6$1;
.super Ljava/lang/Object;
.source "Iterables.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Iterables$6;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "TT;>;"
    }
.end annotation


# instance fields
.field atStart:Z

.field final synthetic this$0:Lcom/google/common/collect/Iterables$6;

.field final synthetic val$iterator:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Iterables$6;Ljava/util/Iterator;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$iterator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 944
    iput-object p2, p0, Lcom/google/common/collect/Iterables$6$1;->val$iterator:Ljava/util/Iterator;

    iput-object p1, p0, Lcom/google/common/collect/Iterables$6$1;->this$0:Lcom/google/common/collect/Iterables$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    .line 945
    iput-boolean p1, p0, Lcom/google/common/collect/Iterables$6$1;->atStart:Z

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 1

    .line 949
    iget-object p0, p0, Lcom/google/common/collect/Iterables$6$1;->val$iterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    return p0
.end method

.method public next()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 955
    iget-object v0, p0, Lcom/google/common/collect/Iterables$6$1;->val$iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    .line 956
    iput-boolean v1, p0, Lcom/google/common/collect/Iterables$6$1;->atStart:Z

    return-object v0
.end method

.method public remove()V
    .registers 2

    .line 962
    iget-boolean v0, p0, Lcom/google/common/collect/Iterables$6$1;->atStart:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lcom/google/common/collect/CollectPreconditions;->checkRemove(Z)V

    .line 963
    iget-object p0, p0, Lcom/google/common/collect/Iterables$6$1;->val$iterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    return-void
.end method
