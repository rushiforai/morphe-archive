.class public final Lkotlin/ranges/IntProgressionIterator;
.super Lkotlin/collections/IntIterator;
.source "ProgressionIterators.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u0000\u0018\u00002\u00020\u0001B!\u0008F\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\n\u0010\u000b\u001a\u00020\u000cH\u0096\u0082\u0004J\n\u0010\u000e\u001a\u00020\u0003H\u0096\u0080\u0004R\u0015\u0010\u0005\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u000f\u0010\n\u001a\u00020\u0003X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000b\u001a\u00020\u000cX\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\r\u001a\u00020\u0003X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000f"
    }
    d2 = {
        "Lkotlin/ranges/IntProgressionIterator;",
        "Lkotlin/collections/IntIterator;",
        "first",
        "",
        "last",
        "step",
        "<init>",
        "(III)V",
        "getStep",
        "()I",
        "finalElement",
        "hasNext",
        "",
        "next",
        "nextInt",
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
.field private final finalElement:I

.field private hasNext:Z

.field private next:I

.field private final step:I


# direct methods
.method public constructor <init>(III)V
    .registers 6

    .line 40
    invoke-direct {p0}, Lkotlin/collections/IntIterator;-><init>()V

    iput p3, p0, Lkotlin/ranges/IntProgressionIterator;->step:I

    .line 41
    iput p2, p0, Lkotlin/ranges/IntProgressionIterator;->finalElement:I

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-lez p3, :cond_e

    if-gt p1, p2, :cond_11

    goto :goto_12

    :cond_e
    if-lt p1, p2, :cond_11

    goto :goto_12

    :cond_11
    move v0, v1

    .line 42
    :goto_12
    iput-boolean v0, p0, Lkotlin/ranges/IntProgressionIterator;->hasNext:Z

    if-eqz v0, :cond_17

    goto :goto_18

    :cond_17
    move p1, p2

    .line 43
    :goto_18
    iput p1, p0, Lkotlin/ranges/IntProgressionIterator;->next:I

    return-void
.end method


# virtual methods
.method public final getStep()I
    .registers 1

    .line 40
    iget p0, p0, Lkotlin/ranges/IntProgressionIterator;->step:I

    return p0
.end method

.method public hasNext()Z
    .registers 1

    .line 45
    iget-boolean p0, p0, Lkotlin/ranges/IntProgressionIterator;->hasNext:Z

    return p0
.end method

.method public nextInt()I
    .registers 3

    .line 48
    iget v0, p0, Lkotlin/ranges/IntProgressionIterator;->next:I

    .line 49
    iget v1, p0, Lkotlin/ranges/IntProgressionIterator;->finalElement:I

    if-ne v0, v1, :cond_14

    .line 50
    iget-boolean v1, p0, Lkotlin/ranges/IntProgressionIterator;->hasNext:Z

    if-eqz v1, :cond_e

    const/4 v1, 0x0

    .line 51
    iput-boolean v1, p0, Lkotlin/ranges/IntProgressionIterator;->hasNext:Z

    return v0

    .line 50
    :cond_e
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0

    .line 54
    :cond_14
    iget v1, p0, Lkotlin/ranges/IntProgressionIterator;->step:I

    add-int/2addr v1, v0

    iput v1, p0, Lkotlin/ranges/IntProgressionIterator;->next:I

    return v0
.end method
