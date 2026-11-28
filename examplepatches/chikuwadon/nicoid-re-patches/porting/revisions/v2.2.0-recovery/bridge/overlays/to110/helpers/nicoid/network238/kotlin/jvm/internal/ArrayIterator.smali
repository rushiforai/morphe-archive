.class final Lnicoid/network238/kotlin/jvm/internal/ArrayIterator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# instance fields
.field private final array:[Ljava/lang/Object;

.field private index:I


# direct methods
.method public constructor <init>([Ljava/lang/Object;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/jvm/internal/ArrayIterator;->array:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .line 10
    iget v0, p0, Lnicoid/network238/kotlin/jvm/internal/ArrayIterator;->index:I

    iget-object v1, p0, Lnicoid/network238/kotlin/jvm/internal/ArrayIterator;->array:[Ljava/lang/Object;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 4

    .line 11
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/ArrayIterator;->array:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/jvm/internal/ArrayIterator;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lnicoid/network238/kotlin/jvm/internal/ArrayIterator;->index:I

    aget-object v0, v0, v1
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    iget v1, p0, Lnicoid/network238/kotlin/jvm/internal/ArrayIterator;->index:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lnicoid/network238/kotlin/jvm/internal/ArrayIterator;->index:I

    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public remove()V
    .registers 3

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation is not supported for read-only collection"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
