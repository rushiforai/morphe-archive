.class Lcom/google/common/collect/FluentIterable$3$1;
.super Lcom/google/common/collect/AbstractIndexedListIterator;
.source "FluentIterable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/FluentIterable$3;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/AbstractIndexedListIterator<",
        "Ljava/util/Iterator<",
        "+TT;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/FluentIterable$3;

.field final synthetic val$inputs:[Ljava/lang/Iterable;


# direct methods
.method constructor <init>(Lcom/google/common/collect/FluentIterable$3;I[Ljava/lang/Iterable;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010
        }
        names = {
            "this$0",
            "size",
            "val$inputs"
        }
    .end annotation

    .line 305
    iput-object p3, p0, Lcom/google/common/collect/FluentIterable$3$1;->val$inputs:[Ljava/lang/Iterable;

    iput-object p1, p0, Lcom/google/common/collect/FluentIterable$3$1;->this$0:Lcom/google/common/collect/FluentIterable$3;

    invoke-direct {p0, p2}, Lcom/google/common/collect/AbstractIndexedListIterator;-><init>(I)V

    return-void
.end method


# virtual methods
.method bridge synthetic get(I)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "i"
        }
    .end annotation

    .line 305
    invoke-virtual {p0, p1}, Lcom/google/common/collect/FluentIterable$3$1;->get(I)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method get(I)Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "i"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Iterator<",
            "+TT;>;"
        }
    .end annotation

    .line 308
    iget-object p0, p0, Lcom/google/common/collect/FluentIterable$3$1;->val$inputs:[Ljava/lang/Iterable;

    aget-object p0, p0, p1

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method
