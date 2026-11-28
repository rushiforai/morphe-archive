.class Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/collections/AbstractList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IteratorImpl"
.end annotation


# instance fields
.field private index:I

.field final synthetic this$0:Lnicoid/network238/kotlin/collections/AbstractList;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/collections/AbstractList;)V
    .registers 2

    .line 76
    iput-object p1, p0, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->this$0:Lnicoid/network238/kotlin/collections/AbstractList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected final getIndex()I
    .registers 2

    .line 78
    iget v0, p0, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->index:I

    return v0
.end method

.method public hasNext()Z
    .registers 3

    .line 80
    iget v0, p0, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->index:I

    iget-object v1, p0, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->this$0:Lnicoid/network238/kotlin/collections/AbstractList;

    invoke-virtual {v1}, Lnicoid/network238/kotlin/collections/AbstractCollection;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 4

    .line 83
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->this$0:Lnicoid/network238/kotlin/collections/AbstractList;

    iget v1, p0, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->index:I

    invoke-virtual {v0, v1}, Lnicoid/network238/kotlin/collections/AbstractList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 83
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .registers 3

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation is not supported for read-only collection"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected final setIndex(I)V
    .registers 2

    .line 78
    iput p1, p0, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->index:I

    return-void
.end method
