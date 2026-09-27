.class public abstract Lkotlin/collections/AbstractIterator;
.super Ljava/lang/Object;
.source "AbstractIterator.kt"

# interfaces
.implements Ljava/util/Iterator;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "TT;>;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010(\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0008&\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u0008\u0012\u0004\u0012\u0002H\u00010\u0002B\t\u0008F\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\n\u0010\t\u001a\u00020\nH\u0096\u0082\u0004J\u000f\u0010\u000b\u001a\u00028\u0000H\u0096\u0082\u0004\u00a2\u0006\u0002\u0010\u000cJ\n\u0010\r\u001a\u00020\nH\u0082\u0080\u0004J\n\u0010\u000e\u001a\u00020\u000fH\u00a4\u0080\u0004J\u0017\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00028\u0000H\u0084\u0080\u0004\u00a2\u0006\u0002\u0010\u0012J\n\u0010\u0013\u001a\u00020\u000fH\u0084\u0080\u0004R\u000f\u0010\u0005\u001a\u00020\u0006X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u0013\u0010\u0007\u001a\u0004\u0018\u00018\u0000X\u0082\u008e\u0008\u00a2\u0006\u0004\n\u0002\u0010\u0008\u00a8\u0006\u0014"
    }
    d2 = {
        "Lkotlin/collections/AbstractIterator;",
        "T",
        "",
        "<init>",
        "()V",
        "state",
        "",
        "nextValue",
        "Ljava/lang/Object;",
        "hasNext",
        "",
        "next",
        "()Ljava/lang/Object;",
        "tryToComputeNext",
        "computeNext",
        "",
        "setNext",
        "value",
        "(Ljava/lang/Object;)V",
        "done",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private nextValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private state:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final tryToComputeNext()Z
    .registers 2

    const/4 v0, 0x3

    .line 54
    iput v0, p0, Lkotlin/collections/AbstractIterator;->state:I

    .line 55
    invoke-virtual {p0}, Lkotlin/collections/AbstractIterator;->computeNext()V

    .line 56
    iget p0, p0, Lkotlin/collections/AbstractIterator;->state:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_c

    return v0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method protected abstract computeNext()V
.end method

.method protected final done()V
    .registers 2

    const/4 v0, 0x2

    .line 83
    iput v0, p0, Lkotlin/collections/AbstractIterator;->state:I

    return-void
.end method

.method public hasNext()Z
    .registers 2

    .line 31
    iget v0, p0, Lkotlin/collections/AbstractIterator;->state:I

    if-eqz v0, :cond_15

    const/4 p0, 0x1

    if-eq v0, p0, :cond_14

    const/4 p0, 0x2

    if-ne v0, p0, :cond_c

    const/4 p0, 0x0

    return p0

    .line 35
    :cond_c
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "hasNext called when the iterator is in the FAILED state."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_14
    return p0

    .line 34
    :cond_15
    invoke-direct {p0}, Lkotlin/collections/AbstractIterator;->tryToComputeNext()Z

    move-result p0

    return p0
.end method

.method public next()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 40
    iget v0, p0, Lkotlin/collections/AbstractIterator;->state:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_b

    .line 41
    iput v2, p0, Lkotlin/collections/AbstractIterator;->state:I

    .line 43
    iget-object p0, p0, Lkotlin/collections/AbstractIterator;->nextValue:Ljava/lang/Object;

    return-object p0

    :cond_b
    const/4 v1, 0x2

    if-eq v0, v1, :cond_19

    .line 45
    invoke-direct {p0}, Lkotlin/collections/AbstractIterator;->tryToComputeNext()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 48
    iput v2, p0, Lkotlin/collections/AbstractIterator;->state:I

    .line 50
    iget-object p0, p0, Lkotlin/collections/AbstractIterator;->nextValue:Ljava/lang/Object;

    return-object p0

    .line 46
    :cond_19
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public remove()V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method protected final setNext(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 75
    iput-object p1, p0, Lkotlin/collections/AbstractIterator;->nextValue:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 76
    iput p1, p0, Lkotlin/collections/AbstractIterator;->state:I

    return-void
.end method
