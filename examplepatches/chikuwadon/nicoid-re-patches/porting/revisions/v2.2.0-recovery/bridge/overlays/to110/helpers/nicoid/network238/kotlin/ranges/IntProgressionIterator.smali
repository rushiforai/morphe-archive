.class public final Lnicoid/network238/kotlin/ranges/IntProgressionIterator;
.super Lnicoid/network238/kotlin/collections/IntIterator;
.source "SourceFile"


# instance fields
.field private final finalElement:I

.field private hasNext:Z

.field private next:I

.field private final step:I


# direct methods
.method public constructor <init>(III)V
    .registers 4

    .line 39
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/IntIterator;-><init>()V

    iput p3, p0, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;->step:I

    .line 40
    iput p2, p0, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;->finalElement:I

    if-lez p3, :cond_0

    if-gt p1, p2, :cond_1

    goto :goto_0

    :cond_0
    if-lt p1, p2, :cond_1

    :goto_0
    const/4 p3, 0x1

    goto :goto_1

    :cond_1
    const/4 p3, 0x0

    .line 41
    :goto_1
    iput-boolean p3, p0, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;->hasNext:Z

    if-nez p3, :cond_2

    move p1, p2

    .line 42
    :cond_2
    iput p1, p0, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;->next:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .line 44
    iget-boolean v0, p0, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;->hasNext:Z

    return v0
.end method

.method public nextInt()I
    .registers 3

    .line 47
    iget v0, p0, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;->next:I

    .line 48
    iget v1, p0, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;->finalElement:I

    if-ne v0, v1, :cond_1

    .line 49
    iget-boolean v1, p0, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;->hasNext:Z

    if-eqz v1, :cond_0

    .line 50
    const/4 v1, 0x0

    iput-boolean v1, p0, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;->hasNext:Z

    return v0

    .line 49
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 53
    :cond_1
    iget v1, p0, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;->step:I

    add-int/2addr v1, v0

    iput v1, p0, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;->next:I

    return v0
.end method
