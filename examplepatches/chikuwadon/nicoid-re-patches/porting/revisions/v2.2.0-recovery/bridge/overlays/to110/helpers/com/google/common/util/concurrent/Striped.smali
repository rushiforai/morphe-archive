.class public abstract Lcom/google/common/util/concurrent/Striped;
.super Ljava/lang/Object;
.source "Striped.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/Striped$CompactStriped;,
        Lcom/google/common/util/concurrent/Striped$SmallLazyStriped;,
        Lcom/google/common/util/concurrent/Striped$LargeLazyStriped;,
        Lcom/google/common/util/concurrent/Striped$PaddedSemaphore;,
        Lcom/google/common/util/concurrent/Striped$PaddedLock;,
        Lcom/google/common/util/concurrent/Striped$PowerOfTwoStriped;,
        Lcom/google/common/util/concurrent/Striped$WeakSafeCondition;,
        Lcom/google/common/util/concurrent/Striped$WeakSafeLock;,
        Lcom/google/common/util/concurrent/Striped$WeakSafeReadWriteLock;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<",
        "L:Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final ALL_SET:I = -0x1

.field private static final LARGE_LAZY_CUTOFF:I = 0x400


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/util/concurrent/Striped$1;)V
    .registers 2

    .line 87
    invoke-direct {p0}, Lcom/google/common/util/concurrent/Striped;-><init>()V

    return-void
.end method

.method static synthetic access$200(I)I
    .registers 1

    .line 87
    invoke-static {p0}, Lcom/google/common/util/concurrent/Striped;->ceilToPowerOfTwo(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$300(I)I
    .registers 1

    .line 87
    invoke-static {p0}, Lcom/google/common/util/concurrent/Striped;->smear(I)I

    move-result p0

    return p0
.end method

.method private static ceilToPowerOfTwo(I)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "x"
        }
    .end annotation

    .line 512
    sget-object v0, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    invoke-static {p0, v0}, Lcom/google/common/math/IntMath;->log2(ILjava/math/RoundingMode;)I

    move-result p0

    const/4 v0, 0x1

    shl-int/2addr v0, p0

    return v0
.end method

.method public static custom(ILcom/google/common/base/Supplier;)Lcom/google/common/util/concurrent/Striped;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "stripes",
            "supplier"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            ">(I",
            "Lcom/google/common/base/Supplier<",
            "T",
            "L;",
            ">;)",
            "Lcom/google/common/util/concurrent/Striped<",
            "T",
            "L;",
            ">;"
        }
    .end annotation

    .line 198
    new-instance v0, Lcom/google/common/util/concurrent/Striped$CompactStriped;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/google/common/util/concurrent/Striped$CompactStriped;-><init>(ILcom/google/common/base/Supplier;Lcom/google/common/util/concurrent/Striped$1;)V

    return-object v0
.end method

.method static synthetic lambda$lazyWeakLock$0()Ljava/util/concurrent/locks/Lock;
    .registers 2

    .line 220
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>(Z)V

    return-object v0
.end method

.method static synthetic lambda$lazyWeakSemaphore$0(I)Ljava/util/concurrent/Semaphore;
    .registers 3

    .line 258
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    return-object v0
.end method

.method static synthetic lambda$semaphore$0(I)Ljava/util/concurrent/Semaphore;
    .registers 2

    .line 246
    new-instance v0, Lcom/google/common/util/concurrent/Striped$PaddedSemaphore;

    invoke-direct {v0, p0}, Lcom/google/common/util/concurrent/Striped$PaddedSemaphore;-><init>(I)V

    return-object v0
.end method

.method static lazyWeakCustom(ILcom/google/common/base/Supplier;)Lcom/google/common/util/concurrent/Striped;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "stripes",
            "supplier"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            ">(I",
            "Lcom/google/common/base/Supplier<",
            "T",
            "L;",
            ">;)",
            "Lcom/google/common/util/concurrent/Striped<",
            "T",
            "L;",
            ">;"
        }
    .end annotation

    const/16 v0, 0x400

    if-ge p0, v0, :cond_0

    .line 233
    new-instance v0, Lcom/google/common/util/concurrent/Striped$SmallLazyStriped;

    invoke-direct {v0, p0, p1}, Lcom/google/common/util/concurrent/Striped$SmallLazyStriped;-><init>(ILcom/google/common/base/Supplier;)V

    return-object v0

    .line 234
    :cond_0
    new-instance v0, Lcom/google/common/util/concurrent/Striped$LargeLazyStriped;

    invoke-direct {v0, p0, p1}, Lcom/google/common/util/concurrent/Striped$LargeLazyStriped;-><init>(ILcom/google/common/base/Supplier;)V

    return-object v0
.end method

.method public static lazyWeakLock(I)Lcom/google/common/util/concurrent/Striped;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stripes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/util/concurrent/Striped<",
            "Ljava/util/concurrent/locks/Lock;",
            ">;"
        }
    .end annotation

    .line 220
    new-instance v0, Lcom/google/common/util/concurrent/Striped$5;

    invoke-direct {v0}, Lcom/google/common/util/concurrent/Striped$5;-><init>()V

    invoke-static {p0, v0}, Lcom/google/common/util/concurrent/Striped;->lazyWeakCustom(ILcom/google/common/base/Supplier;)Lcom/google/common/util/concurrent/Striped;

    move-result-object p0

    return-object p0
.end method

.method public static lazyWeakReadWriteLock(I)Lcom/google/common/util/concurrent/Striped;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stripes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/util/concurrent/Striped<",
            "Ljava/util/concurrent/locks/ReadWriteLock;",
            ">;"
        }
    .end annotation

    .line 280
    new-instance v0, Lcom/google/common/util/concurrent/Striped$0;

    invoke-direct {v0}, Lcom/google/common/util/concurrent/Striped$0;-><init>()V

    invoke-static {p0, v0}, Lcom/google/common/util/concurrent/Striped;->lazyWeakCustom(ILcom/google/common/base/Supplier;)Lcom/google/common/util/concurrent/Striped;

    move-result-object p0

    return-object p0
.end method

.method public static lazyWeakSemaphore(II)Lcom/google/common/util/concurrent/Striped;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "stripes",
            "permits"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/google/common/util/concurrent/Striped<",
            "Ljava/util/concurrent/Semaphore;",
            ">;"
        }
    .end annotation

    .line 258
    new-instance v0, Lcom/google/common/util/concurrent/Striped$4;

    invoke-direct {v0, p1}, Lcom/google/common/util/concurrent/Striped$4;-><init>(I)V

    invoke-static {p0, v0}, Lcom/google/common/util/concurrent/Striped;->lazyWeakCustom(ILcom/google/common/base/Supplier;)Lcom/google/common/util/concurrent/Striped;

    move-result-object p0

    return-object p0
.end method

.method public static lock(I)Lcom/google/common/util/concurrent/Striped;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stripes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/util/concurrent/Striped<",
            "Ljava/util/concurrent/locks/Lock;",
            ">;"
        }
    .end annotation

    .line 209
    new-instance v0, Lcom/google/common/util/concurrent/Striped$2;

    invoke-direct {v0}, Lcom/google/common/util/concurrent/Striped$2;-><init>()V

    invoke-static {p0, v0}, Lcom/google/common/util/concurrent/Striped;->custom(ILcom/google/common/base/Supplier;)Lcom/google/common/util/concurrent/Striped;

    move-result-object p0

    return-object p0
.end method

.method public static readWriteLock(I)Lcom/google/common/util/concurrent/Striped;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stripes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/util/concurrent/Striped<",
            "Ljava/util/concurrent/locks/ReadWriteLock;",
            ">;"
        }
    .end annotation

    .line 269
    new-instance v0, Lcom/google/common/util/concurrent/Striped$6;

    invoke-direct {v0}, Lcom/google/common/util/concurrent/Striped$6;-><init>()V

    invoke-static {p0, v0}, Lcom/google/common/util/concurrent/Striped;->custom(ILcom/google/common/base/Supplier;)Lcom/google/common/util/concurrent/Striped;

    move-result-object p0

    return-object p0
.end method

.method public static semaphore(II)Lcom/google/common/util/concurrent/Striped;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "stripes",
            "permits"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/google/common/util/concurrent/Striped<",
            "Ljava/util/concurrent/Semaphore;",
            ">;"
        }
    .end annotation

    .line 246
    new-instance v0, Lcom/google/common/util/concurrent/Striped$3;

    invoke-direct {v0, p1}, Lcom/google/common/util/concurrent/Striped$3;-><init>(I)V

    invoke-static {p0, v0}, Lcom/google/common/util/concurrent/Striped;->custom(ILcom/google/common/base/Supplier;)Lcom/google/common/util/concurrent/Striped;

    move-result-object p0

    return-object p0
.end method

.method private static smear(I)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hashCode"
        }
    .end annotation

    ushr-int/lit8 v0, p0, 0x14

    ushr-int/lit8 v1, p0, 0xc

    xor-int/2addr v0, v1

    xor-int/2addr p0, v0

    ushr-int/lit8 v0, p0, 0x7

    xor-int/2addr v0, p0

    ushr-int/lit8 p0, p0, 0x4

    xor-int/2addr v0, p0

    return v0
.end method


# virtual methods
.method public bulkGet(Ljava/lang/Iterable;)Ljava/lang/Iterable;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "keys"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Iterable<",
            "T",
            "L;",
            ">;"
        }
    .end annotation

    .line 143
    invoke-static {p1}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p1

    .line 144
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0

    .line 147
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [I

    const/4 v1, 0x0

    move v2, v1

    .line 148
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 149
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/google/common/util/concurrent/Striped;->indexFor(Ljava/lang/Object;)I

    move-result v3

    aput v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 151
    :cond_1
    invoke-static {v0}, Ljava/util/Arrays;->sort([I)V

    .line 153
    aget v2, v0, v1

    .line 154
    invoke-virtual {p0, v2}, Lcom/google/common/util/concurrent/Striped;->getAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p1, v1, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x1

    .line 155
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_3

    .line 156
    aget v3, v0, v1

    if-ne v3, v2, :cond_2

    add-int/lit8 v3, v1, -0x1

    .line 158
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p1, v1, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 160
    :cond_2
    invoke-virtual {p0, v3}, Lcom/google/common/util/concurrent/Striped;->getAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move v2, v3

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 183
    :cond_3
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public abstract get(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")T",
            "L;"
        }
    .end annotation
.end method

.method public abstract getAt(I)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)T",
            "L;"
        }
    .end annotation
.end method

.method abstract indexFor(Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation
.end method

.method public abstract size()I
.end method
