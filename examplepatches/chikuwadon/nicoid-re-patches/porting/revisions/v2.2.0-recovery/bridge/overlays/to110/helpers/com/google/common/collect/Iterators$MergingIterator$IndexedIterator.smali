.class final Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;
.super Ljava/lang/Object;
.source "Iterators.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Iterators$MergingIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "IndexedIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final index:I

.field final iterator:Lcom/google/common/collect/PeekingIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/PeekingIterator<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/PeekingIterator;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "iterator",
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/PeekingIterator<",
            "TE;>;I)V"
        }
    .end annotation

    .line 1327
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1328
    iput-object p1, p0, Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;->iterator:Lcom/google/common/collect/PeekingIterator;

    .line 1329
    iput p2, p0, Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;->index:I

    return-void
.end method
