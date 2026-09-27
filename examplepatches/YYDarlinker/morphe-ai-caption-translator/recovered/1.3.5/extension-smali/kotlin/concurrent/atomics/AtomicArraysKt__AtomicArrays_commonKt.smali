.class Lkotlin/concurrent/atomics/AtomicArraysKt__AtomicArrays_commonKt;
.super Ljava/lang/Object;
.source "AtomicArrays.common.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAtomicArrays.common.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AtomicArrays.common.kt\nkotlin/concurrent/atomics/AtomicArraysKt__AtomicArrays_commonKt\n*L\n1#1,769:1\n667#1:770\n*S KotlinDebug\n*F\n+ 1 AtomicArrays.common.kt\nkotlin/concurrent/atomics/AtomicArraysKt__AtomicArrays_commonKt\n*L\n679#1:770\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u001a@\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0012\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u0005H\u0087\u0088\u0004b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\tb\u0002\u0008\n\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u0006\u001a-\u0010\u000b\u001a\u00020\u0003*\u00020\u00012\u0006\u0010\u000c\u001a\u00020\u0003H\u0087\u0080\u0004b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\tb\u0002\u0008\n\u00a2\u0006\u0002\u0010\r\u001a-\u0010\u000e\u001a\u00020\u0003*\u00020\u00012\u0006\u0010\u000c\u001a\u00020\u0003H\u0087\u0080\u0004b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\tb\u0002\u0008\n\u00a2\u0006\u0002\u0010\r\u001a-\u0010\u000f\u001a\u00020\u0003*\u00020\u00012\u0006\u0010\u000c\u001a\u00020\u0003H\u0087\u0080\u0004b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\tb\u0002\u0008\n\u00a2\u0006\u0002\u0010\r\u001a-\u0010\u0010\u001a\u00020\u0003*\u00020\u00012\u0006\u0010\u000c\u001a\u00020\u0003H\u0087\u0080\u0004b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\tb\u0002\u0008\n\u00a2\u0006\u0002\u0010\r\u001a@\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0002\u001a\u00020\u00032\u0012\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00130\u0005H\u0087\u0088\u0004b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\tb\u0002\u0008\n\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u0014\u001a-\u0010\u000b\u001a\u00020\u0013*\u00020\u00122\u0006\u0010\u000c\u001a\u00020\u0003H\u0087\u0080\u0004b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\tb\u0002\u0008\n\u00a2\u0006\u0002\u0010\u0015\u001a-\u0010\u000e\u001a\u00020\u0013*\u00020\u00122\u0006\u0010\u000c\u001a\u00020\u0003H\u0087\u0080\u0004b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\tb\u0002\u0008\n\u00a2\u0006\u0002\u0010\u0015\u001a-\u0010\u000f\u001a\u00020\u0013*\u00020\u00122\u0006\u0010\u000c\u001a\u00020\u0003H\u0087\u0080\u0004b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\tb\u0002\u0008\n\u00a2\u0006\u0002\u0010\u0015\u001a-\u0010\u0010\u001a\u00020\u0013*\u00020\u00122\u0006\u0010\u000c\u001a\u00020\u0003H\u0087\u0080\u0004b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\tb\u0002\u0008\n\u00a2\u0006\u0002\u0010\u0015\u001aN\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u0002H\u00180\u0017\"\u0006\u0008\u0000\u0010\u0018\u0018\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0012\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u0002H\u00180\u0005H\u0087\u0088\u0004b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\tb\u0002\u0008\n\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u0019\u001a9\u0010\u001a\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H\u00180\u0017\"\u0006\u0008\u0000\u0010\u0018\u0018\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0087\u0088\u0004b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\u001cb\u0002\u0008\n\u00a2\u0006\u0002\u0010\u001b\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u001d"
    }
    d2 = {
        "AtomicIntArray",
        "Lkotlin/concurrent/atomics/AtomicIntArray;",
        "size",
        "",
        "init",
        "Lkotlin/Function1;",
        "(ILkotlin/jvm/functions/Function1;)Ljava/util/concurrent/atomic/AtomicIntegerArray;",
        "Lkotlin/SinceKotlin;",
        "version",
        "2.1",
        "Lkotlin/concurrent/atomics/ExperimentalAtomicApi;",
        "fetchAndIncrementAt",
        "index",
        "(Ljava/util/concurrent/atomic/AtomicIntegerArray;I)I",
        "incrementAndFetchAt",
        "decrementAndFetchAt",
        "fetchAndDecrementAt",
        "AtomicLongArray",
        "Lkotlin/concurrent/atomics/AtomicLongArray;",
        "",
        "(ILkotlin/jvm/functions/Function1;)Ljava/util/concurrent/atomic/AtomicLongArray;",
        "(Ljava/util/concurrent/atomic/AtomicLongArray;I)J",
        "AtomicArray",
        "Lkotlin/concurrent/atomics/AtomicArray;",
        "T",
        "(ILkotlin/jvm/functions/Function1;)Ljava/util/concurrent/atomic/AtomicReferenceArray;",
        "atomicArrayOfNulls",
        "(I)Ljava/util/concurrent/atomic/AtomicReferenceArray;",
        "2.2",
        "kotlin-stdlib"
    }
    k = 0x5
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x31
    xs = "kotlin/concurrent/atomics/AtomicArraysKt"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final synthetic AtomicArray(ILkotlin/jvm/functions/Function1;)Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "+TT;>;)",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "init"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 667
    const-string v0, "T"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    new-array v0, p0, [Ljava/lang/Object;

    :goto_d
    if-ge v1, p0, :cond_1c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    :cond_1c
    new-instance p0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-direct {p0, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>([Ljava/lang/Object;)V

    return-object p0
.end method

.method public static final AtomicIntArray(ILkotlin/jvm/functions/Function1;)Ljava/util/concurrent/atomic/AtomicIntegerArray;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/concurrent/atomic/AtomicIntegerArray;"
        }
    .end annotation

    const-string v0, "init"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 149
    new-array v0, p0, [I

    const/4 v1, 0x0

    :goto_8
    if-ge v1, p0, :cond_1d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_1d
    new-instance p0, Ljava/util/concurrent/atomic/AtomicIntegerArray;

    invoke-direct {p0, v0}, Ljava/util/concurrent/atomic/AtomicIntegerArray;-><init>([I)V

    return-object p0
.end method

.method public static final AtomicLongArray(ILkotlin/jvm/functions/Function1;)Ljava/util/concurrent/atomic/AtomicLongArray;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;)",
            "Ljava/util/concurrent/atomic/AtomicLongArray;"
        }
    .end annotation

    const-string v0, "init"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 418
    new-array v0, p0, [J

    const/4 v1, 0x0

    :goto_8
    if-ge v1, p0, :cond_1d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    aput-wide v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_1d
    new-instance p0, Ljava/util/concurrent/atomic/AtomicLongArray;

    invoke-direct {p0, v0}, Ljava/util/concurrent/atomic/AtomicLongArray;-><init>([J)V

    return-object p0
.end method

.method public static final synthetic atomicArrayOfNulls(I)Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "TT;>;"
        }
    .end annotation

    .line 770
    const-string v0, "T?"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    new-array v0, p0, [Ljava/lang/Object;

    :goto_8
    if-ge v1, p0, :cond_10

    const/4 v2, 0x0

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_10
    new-instance p0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-direct {p0, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>([Ljava/lang/Object;)V

    return-object p0
.end method

.method public static final decrementAndFetchAt(Ljava/util/concurrent/atomic/AtomicIntegerArray;I)I
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, -0x1

    .line 182
    invoke-virtual {p0, p1, v0}, Ljava/util/concurrent/atomic/AtomicIntegerArray;->addAndGet(II)I

    move-result p0

    return p0
.end method

.method public static final decrementAndFetchAt(Ljava/util/concurrent/atomic/AtomicLongArray;I)J
    .registers 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v0, -0x1

    .line 451
    invoke-virtual {p0, p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicLongArray;->addAndGet(IJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final fetchAndDecrementAt(Ljava/util/concurrent/atomic/AtomicIntegerArray;I)I
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, -0x1

    .line 193
    invoke-virtual {p0, p1, v0}, Ljava/util/concurrent/atomic/AtomicIntegerArray;->getAndAdd(II)I

    move-result p0

    return p0
.end method

.method public static final fetchAndDecrementAt(Ljava/util/concurrent/atomic/AtomicLongArray;I)J
    .registers 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v0, -0x1

    .line 462
    invoke-virtual {p0, p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicLongArray;->getAndAdd(IJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final fetchAndIncrementAt(Ljava/util/concurrent/atomic/AtomicIntegerArray;I)I
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 160
    invoke-virtual {p0, p1, v0}, Ljava/util/concurrent/atomic/AtomicIntegerArray;->getAndAdd(II)I

    move-result p0

    return p0
.end method

.method public static final fetchAndIncrementAt(Ljava/util/concurrent/atomic/AtomicLongArray;I)J
    .registers 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v0, 0x1

    .line 429
    invoke-virtual {p0, p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicLongArray;->getAndAdd(IJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final incrementAndFetchAt(Ljava/util/concurrent/atomic/AtomicIntegerArray;I)I
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 171
    invoke-virtual {p0, p1, v0}, Ljava/util/concurrent/atomic/AtomicIntegerArray;->addAndGet(II)I

    move-result p0

    return p0
.end method

.method public static final incrementAndFetchAt(Ljava/util/concurrent/atomic/AtomicLongArray;I)J
    .registers 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v0, 0x1

    .line 440
    invoke-virtual {p0, p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicLongArray;->addAndGet(IJ)J

    move-result-wide p0

    return-wide p0
.end method
