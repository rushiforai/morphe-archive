.class Lkotlin/concurrent/atomics/AtomicArraysKt__AtomicArrays_jvmKt;
.super Lkotlin/concurrent/atomics/AtomicArraysKt__AtomicArrays_commonKt;
.source "AtomicArrays.jvm.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000V\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0005\u001a%\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u00a2\u0006\u0002\u0010\u0003\u001a%\u0010\u0008\u001a\u00020\u0002*\u00020\u0001H\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u00a2\u0006\u0002\u0010\u0003\u001a%\u0010\u0000\u001a\u00020\t*\u00020\nH\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u00a2\u0006\u0002\u0010\u000b\u001a%\u0010\u0008\u001a\u00020\n*\u00020\tH\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u00a2\u0006\u0002\u0010\u000b\u001a7\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\r0\u000c\"\u0004\u0008\u0000\u0010\r*\u0008\u0012\u0004\u0012\u0002H\r0\u000eH\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u00a2\u0006\u0002\u0010\u000f\u001a7\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u0002H\r0\u000e\"\u0004\u0008\u0000\u0010\r*\u0008\u0012\u0004\u0012\u0002H\r0\u000cH\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u00a2\u0006\u0002\u0010\u000f\u001aU\u0010\u0010\u001a\u00020\u0011*\u00020\u00022\u0006\u0010\u0012\u001a\u00020\u00132\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00130\u0015H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0017b\u0002\u0008\u0007b\u0002\u0008\u0018\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0002 \u0002\u00a2\u0006\u0002\u0010\u0016\u001aU\u0010\u0019\u001a\u00020\u0013*\u00020\u00022\u0006\u0010\u0012\u001a\u00020\u00132\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00130\u0015H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0017b\u0002\u0008\u0007b\u0002\u0008\u0018\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0002 \u0002\u00a2\u0006\u0002\u0010\u001a\u001aU\u0010\u001b\u001a\u00020\u0013*\u00020\u00022\u0006\u0010\u0012\u001a\u00020\u00132\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00130\u0015H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0017b\u0002\u0008\u0007b\u0002\u0008\u0018\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0002 \u0002\u00a2\u0006\u0002\u0010\u001a\u001aU\u0010\u0010\u001a\u00020\u0011*\u00020\n2\u0006\u0010\u0012\u001a\u00020\u00132\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u001c0\u0015H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0017b\u0002\u0008\u0007b\u0002\u0008\u0018\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0002 \u0002\u00a2\u0006\u0002\u0010\u001d\u001aU\u0010\u0019\u001a\u00020\u001c*\u00020\n2\u0006\u0010\u0012\u001a\u00020\u00132\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u001c0\u0015H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0017b\u0002\u0008\u0007b\u0002\u0008\u0018\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0002 \u0002\u00a2\u0006\u0002\u0010\u001e\u001aU\u0010\u001b\u001a\u00020\u001c*\u00020\n2\u0006\u0010\u0012\u001a\u00020\u00132\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u001c0\u0015H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0017b\u0002\u0008\u0007b\u0002\u0008\u0018\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0002 \u0002\u00a2\u0006\u0002\u0010\u001e\u001aa\u0010\u0010\u001a\u00020\u0011\"\u0004\u0008\u0000\u0010\r*\u0008\u0012\u0004\u0012\u0002H\r0\u000e2\u0006\u0010\u0012\u001a\u00020\u00132\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u0002H\r\u0012\u0004\u0012\u0002H\r0\u0015H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0017b\u0002\u0008\u0007b\u0002\u0008\u0018\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0002 \u0002\u00a2\u0006\u0002\u0010\u001f\u001aa\u0010\u0019\u001a\u0002H\r\"\u0004\u0008\u0000\u0010\r*\u0008\u0012\u0004\u0012\u0002H\r0\u000e2\u0006\u0010\u0012\u001a\u00020\u00132\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u0002H\r\u0012\u0004\u0012\u0002H\r0\u0015H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0017b\u0002\u0008\u0007b\u0002\u0008\u0018\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0002 \u0002\u00a2\u0006\u0002\u0010 \u001aa\u0010\u001b\u001a\u0002H\r\"\u0004\u0008\u0000\u0010\r*\u0008\u0012\u0004\u0012\u0002H\r0\u000e2\u0006\u0010\u0012\u001a\u00020\u00132\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u0002H\r\u0012\u0004\u0012\u0002H\r0\u0015H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0017b\u0002\u0008\u0007b\u0002\u0008\u0018\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0002 \u0002\u00a2\u0006\u0002\u0010 \u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006!"
    }
    d2 = {
        "asJavaAtomicArray",
        "Ljava/util/concurrent/atomic/AtomicIntegerArray;",
        "Lkotlin/concurrent/atomics/AtomicIntArray;",
        "(Ljava/util/concurrent/atomic/AtomicIntegerArray;)Ljava/util/concurrent/atomic/AtomicIntegerArray;",
        "Lkotlin/SinceKotlin;",
        "version",
        "2.1",
        "Lkotlin/concurrent/atomics/ExperimentalAtomicApi;",
        "asKotlinAtomicArray",
        "Ljava/util/concurrent/atomic/AtomicLongArray;",
        "Lkotlin/concurrent/atomics/AtomicLongArray;",
        "(Ljava/util/concurrent/atomic/AtomicLongArray;)Ljava/util/concurrent/atomic/AtomicLongArray;",
        "Ljava/util/concurrent/atomic/AtomicReferenceArray;",
        "T",
        "Lkotlin/concurrent/atomics/AtomicArray;",
        "(Ljava/util/concurrent/atomic/AtomicReferenceArray;)Ljava/util/concurrent/atomic/AtomicReferenceArray;",
        "updateAt",
        "",
        "index",
        "",
        "transform",
        "Lkotlin/Function1;",
        "(Ljava/util/concurrent/atomic/AtomicIntegerArray;ILkotlin/jvm/functions/Function1;)V",
        "2.2",
        "Lkotlin/internal/InlineOnly;",
        "updateAndFetchAt",
        "(Ljava/util/concurrent/atomic/AtomicIntegerArray;ILkotlin/jvm/functions/Function1;)I",
        "fetchAndUpdateAt",
        "",
        "(Ljava/util/concurrent/atomic/AtomicLongArray;ILkotlin/jvm/functions/Function1;)V",
        "(Ljava/util/concurrent/atomic/AtomicLongArray;ILkotlin/jvm/functions/Function1;)J",
        "(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILkotlin/jvm/functions/Function1;)V",
        "(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILkotlin/jvm/functions/Function1;)Ljava/lang/Object;",
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

    invoke-direct {p0}, Lkotlin/concurrent/atomics/AtomicArraysKt__AtomicArrays_commonKt;-><init>()V

    return-void
.end method

.method public static final asJavaAtomicArray(Ljava/util/concurrent/atomic/AtomicIntegerArray;)Ljava/util/concurrent/atomic/AtomicIntegerArray;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final asJavaAtomicArray(Ljava/util/concurrent/atomic/AtomicLongArray;)Ljava/util/concurrent/atomic/AtomicLongArray;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final asJavaAtomicArray(Ljava/util/concurrent/atomic/AtomicReferenceArray;)Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "TT;>;)",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final asKotlinAtomicArray(Ljava/util/concurrent/atomic/AtomicIntegerArray;)Ljava/util/concurrent/atomic/AtomicIntegerArray;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final asKotlinAtomicArray(Ljava/util/concurrent/atomic/AtomicLongArray;)Ljava/util/concurrent/atomic/AtomicLongArray;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final asKotlinAtomicArray(Ljava/util/concurrent/atomic/AtomicReferenceArray;)Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "TT;>;)",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method private static final fetchAndUpdateAt(Ljava/util/concurrent/atomic/AtomicIntegerArray;ILkotlin/jvm/functions/Function1;)I
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicIntegerArray;",
            "I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transform"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 143
    :cond_a
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicIntegerArray;->get(I)I

    move-result v0

    .line 144
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    .line 145
    invoke-virtual {p0, p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerArray;->compareAndSet(III)Z

    move-result v1

    if-eqz v1, :cond_a

    return v0
.end method

.method private static final fetchAndUpdateAt(Ljava/util/concurrent/atomic/AtomicLongArray;ILkotlin/jvm/functions/Function1;)J
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicLongArray;",
            "I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;)J"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transform"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 228
    :goto_a
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicLongArray;->get(I)J

    move-result-wide v3

    .line 229
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    move-object v1, p0

    move v2, p1

    .line 230
    invoke-virtual/range {v1 .. v6}, Ljava/util/concurrent/atomic/AtomicLongArray;->compareAndSet(IJJ)Z

    move-result p0

    if-eqz p0, :cond_25

    return-wide v3

    :cond_25
    move-object p0, v1

    move p1, v2

    goto :goto_a
.end method

.method private static final fetchAndUpdateAt(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILkotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "TT;>;I",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transform"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 313
    :cond_a
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 314
    invoke-interface {p2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 315
    invoke-static {p0, p1, v0, v1}, Lkotlin/concurrent/atomics/AtomicsKt__Atomics_jvmKt$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    return-object v0
.end method

.method private static final updateAndFetchAt(Ljava/util/concurrent/atomic/AtomicIntegerArray;ILkotlin/jvm/functions/Function1;)I
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicIntegerArray;",
            "I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transform"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 113
    :cond_a
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicIntegerArray;->get(I)I

    move-result v0

    .line 114
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    .line 115
    invoke-virtual {p0, p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerArray;->compareAndSet(III)Z

    move-result v0

    if-eqz v0, :cond_a

    return v1
.end method

.method private static final updateAndFetchAt(Ljava/util/concurrent/atomic/AtomicLongArray;ILkotlin/jvm/functions/Function1;)J
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicLongArray;",
            "I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;)J"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transform"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 198
    :goto_a
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicLongArray;->get(I)J

    move-result-wide v3

    .line 199
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    move-object v1, p0

    move v2, p1

    .line 200
    invoke-virtual/range {v1 .. v6}, Ljava/util/concurrent/atomic/AtomicLongArray;->compareAndSet(IJJ)Z

    move-result p0

    if-eqz p0, :cond_25

    return-wide v5

    :cond_25
    move-object p0, v1

    move p1, v2

    goto :goto_a
.end method

.method private static final updateAndFetchAt(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILkotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "TT;>;I",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transform"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 283
    :cond_a
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 284
    invoke-interface {p2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 285
    invoke-static {p0, p1, v0, v1}, Lkotlin/concurrent/atomics/AtomicsKt__Atomics_jvmKt$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    return-object v1
.end method

.method private static final updateAt(Ljava/util/concurrent/atomic/AtomicIntegerArray;ILkotlin/jvm/functions/Function1;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicIntegerArray;",
            "I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transform"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    :cond_a
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicIntegerArray;->get(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerArray;->compareAndSet(III)Z

    move-result v0

    if-eqz v0, :cond_a

    return-void
.end method

.method private static final updateAt(Ljava/util/concurrent/atomic/AtomicLongArray;ILkotlin/jvm/functions/Function1;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicLongArray;",
            "I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transform"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 171
    :goto_a
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicLongArray;->get(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    move-object v1, p0

    move v2, p1

    invoke-virtual/range {v1 .. v6}, Ljava/util/concurrent/atomic/AtomicLongArray;->compareAndSet(IJJ)Z

    move-result p0

    if-eqz p0, :cond_25

    return-void

    :cond_25
    move-object p0, v1

    move p1, v2

    goto :goto_a
.end method

.method private static final updateAt(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILkotlin/jvm/functions/Function1;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "TT;>;I",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;+TT;>;)V"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transform"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 256
    :cond_a
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0, p1, v0, v1}, Lkotlin/concurrent/atomics/AtomicsKt__Atomics_jvmKt$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    return-void
.end method
