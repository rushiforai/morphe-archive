.class public Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0xb59ce4be1ef907aL


# instance fields
.field count:I

.field final items:[B

.field final lock:Ljava/util/concurrent/locks/ReentrantLock;

.field private final notEmpty:Ljava/util/concurrent/locks/Condition;

.field private final notFull:Ljava/util/concurrent/locks/Condition;

.field putIndex:I

.field takeIndex:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    .line 72
    invoke-direct {p0, p1, v0}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;-><init>(IZ)V

    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-lez p1, :cond_0

    .line 67
    new-array p1, p1, [B

    iput-object p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 68
    new-instance p1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {p1, p2}, Ljava/util/concurrent/locks/ReentrantLock;-><init>(Z)V

    iput-object p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 69
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object p2

    iput-object p2, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 70
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object p1

    iput-object p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notFull:Ljava/util/concurrent/locks/Condition;

    return-void

    .line 71
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(IZLjava/util/Collection;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Ljava/util/Collection<",
            "Ljava/lang/Byte;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;-><init>(IZ)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 7
    .line 8
    .line 9
    :try_start_0
    invoke-interface {p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    const/4 v0, 0x0

    .line 14
    move v1, v0

    .line 15
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ljava/lang/Byte;

    .line 26
    .line 27
    invoke-static {v2}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->checkNotNull(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object v3, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 31
    .line 32
    add-int/lit8 v4, v1, 0x1

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Byte;->byteValue()B

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    aput-byte v2, v3, v1
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    move v1, v4

    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_2

    .line 44
    :cond_0
    :try_start_1
    iput v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 45
    .line 46
    if-ne v1, p1, :cond_1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    move v0, v1

    .line 50
    :goto_1
    iput v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->putIndex:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :catch_0
    :try_start_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 57
    .line 58
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 59
    .line 60
    .line 61
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 62
    :goto_2
    invoke-virtual {p2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 63
    .line 64
    .line 65
    throw p0
.end method

.method private static checkNotNull(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private dequeue()B
    .locals 4

    .line 43
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 44
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    aget-byte v2, v0, v1

    const/4 v3, 0x0

    .line 45
    aput-byte v3, v0, v1

    .line 46
    invoke-virtual {p0, v1}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->inc(I)I

    move-result v0

    iput v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 47
    iget v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 48
    iget-object p0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notFull:Ljava/util/concurrent/locks/Condition;

    invoke-interface {p0}, Ljava/util/concurrent/locks/Condition;->signal()V

    return v2
.end method

.method private dequeue([BI)I
    .locals 4

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 2
    .line 3
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 4
    .line 5
    array-length v2, v0

    .line 6
    iget v3, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 7
    .line 8
    sub-int/2addr v2, v3

    .line 9
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    array-length v2, p1

    .line 14
    sub-int/2addr v2, p2

    .line 15
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget v2, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 20
    .line 21
    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 22
    .line 23
    .line 24
    iget p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 25
    .line 26
    invoke-virtual {p0, p1, v1}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->inc(II)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 31
    .line 32
    iget p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 33
    .line 34
    sub-int/2addr p1, v1

    .line 35
    iput p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 36
    .line 37
    iget-object p0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notFull:Ljava/util/concurrent/locks/Condition;

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/concurrent/locks/Condition;->signal()V

    .line 40
    .line 41
    .line 42
    return v1
.end method

.method private enqueue([BI)I
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->putIndex:I

    .line 5
    .line 6
    sub-int/2addr v0, v1

    .line 7
    array-length v1, p1

    .line 8
    sub-int/2addr v1, p2

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 14
    .line 15
    iget v2, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->putIndex:I

    .line 16
    .line 17
    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 18
    .line 19
    .line 20
    iget p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->putIndex:I

    .line 21
    .line 22
    invoke-virtual {p0, p1, v0}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->inc(II)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->putIndex:I

    .line 27
    .line 28
    iget p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 29
    .line 30
    add-int/2addr p1, v0

    .line 31
    iput p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 32
    .line 33
    return v0
.end method

.method private enqueue(B)V
    .locals 2

    .line 34
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->putIndex:I

    aput-byte p1, v0, v1

    .line 35
    invoke-virtual {p0, v1}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->inc(I)I

    move-result p1

    iput p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->putIndex:I

    .line 36
    iget p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 37
    iget-object p0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notEmpty:Ljava/util/concurrent/locks/Condition;

    invoke-interface {p0}, Ljava/util/concurrent/locks/Condition;->signal()V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 6

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 2
    .line 3
    iget-object v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget v2, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 9
    .line 10
    if-lez v2, :cond_1

    .line 11
    .line 12
    iget v3, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->putIndex:I

    .line 13
    .line 14
    iget v4, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 15
    .line 16
    :cond_0
    const/4 v5, 0x0

    .line 17
    aput-byte v5, v0, v4

    .line 18
    .line 19
    invoke-virtual {p0, v4}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->inc(I)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-ne v4, v3, :cond_0

    .line 24
    .line 25
    iput v3, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 26
    .line 27
    iput v5, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 28
    .line 29
    :goto_0
    if-lez v2, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notFull:Ljava/util/concurrent/locks/Condition;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ljava/util/concurrent/locks/ReentrantLock;->hasWaiters(Ljava/util/concurrent/locks/Condition;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notFull:Ljava/util/concurrent/locks/Condition;

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    .line 44
    add-int/lit8 v2, v2, -0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :goto_1
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 54
    .line 55
    .line 56
    throw p0
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 6
    .line 7
    iget-object v2, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    iget v3, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 13
    .line 14
    if-lez v3, :cond_3

    .line 15
    .line 16
    iget v3, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->putIndex:I

    .line 17
    .line 18
    iget v4, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 19
    .line 20
    :cond_1
    aget-byte v5, v1, v4

    .line 21
    .line 22
    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    invoke-virtual {p1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    if-eqz v5, :cond_2

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_2
    :try_start_1
    invoke-virtual {p0, v4}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->inc(I)I

    .line 38
    .line 39
    .line 40
    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    if-ne v4, v3, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_3
    :goto_0
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 47
    .line 48
    .line 49
    return v0

    .line 50
    :goto_1
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 51
    .line 52
    .line 53
    throw p0
.end method

.method public final dec(I)I
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 4
    .line 5
    array-length p1, p0

    .line 6
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 7
    .line 8
    return p1
.end method

.method public final inc(I)I
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    iget-object p0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 4
    .line 5
    array-length p0, p0

    .line 6
    if-ne p1, p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    return p1
.end method

.method public final inc(II)I
    .locals 0

    .line 11
    iget-object p0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    array-length p0, p0

    add-int/2addr p1, p2

    if-lt p1, p0, :cond_0

    .line 12
    rem-int/2addr p1, p0

    :cond_0
    return p1
.end method

.method public final itemAt(I)B
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 2
    .line 3
    aget-byte p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method public offer(B)Z
    .locals 3

    .line 56
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    invoke-static {v0}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->checkNotNull(Ljava/lang/Object;)V

    .line 57
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 58
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 59
    :try_start_0
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    iget-object v2, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    array-length v2, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v1, v2, :cond_0

    .line 60
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    const/4 p0, 0x0

    return p0

    .line 61
    :cond_0
    :try_start_1
    invoke-direct {p0, p1}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->enqueue(B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    const/4 p0, 0x1

    return p0

    :catchall_0
    move-exception p0

    .line 63
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 64
    throw p0
.end method

.method public offer(BJLjava/util/concurrent/TimeUnit;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->checkNotNull(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide p2

    .line 12
    iget-object p4, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 13
    .line 14
    invoke-virtual {p4}, Ljava/util/concurrent/locks/ReentrantLock;->lockInterruptibly()V

    .line 15
    .line 16
    .line 17
    :goto_0
    :try_start_0
    iget v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 18
    .line 19
    iget-object v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 20
    .line 21
    array-length v1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    if-ne v0, v1, :cond_1

    .line 23
    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    cmp-long v0, p2, v0

    .line 27
    .line 28
    if-gtz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :cond_0
    :try_start_1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notFull:Ljava/util/concurrent/locks/Condition;

    .line 36
    .line 37
    invoke-interface {v0, p2, p3}, Ljava/util/concurrent/locks/Condition;->awaitNanos(J)J

    .line 38
    .line 39
    .line 40
    move-result-wide p2

    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    invoke-direct {p0, p1}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->enqueue(B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    .line 46
    .line 47
    invoke-virtual {p4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x1

    .line 51
    return p0

    .line 52
    :goto_1
    invoke-virtual {p4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 53
    .line 54
    .line 55
    throw p0
.end method

.method public offerBuffer([B)Z
    .locals 5

    .line 1
    invoke-static {p1}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->checkNotNull(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 7
    .line 8
    .line 9
    :try_start_0
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 10
    .line 11
    iget-object v2, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 12
    .line 13
    array-length v3, v2

    .line 14
    const/4 v4, 0x0

    .line 15
    if-eq v1, v3, :cond_2

    .line 16
    .line 17
    array-length v3, p1

    .line 18
    add-int/2addr v1, v3

    .line 19
    array-length v2, v2

    .line 20
    if-le v1, v2, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    array-length v1, p1

    .line 24
    if-ge v4, v1, :cond_1

    .line 25
    .line 26
    invoke-direct {p0, p1, v4}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->enqueue([BI)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    add-int/2addr v4, v1

    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_2

    .line 34
    :cond_1
    iget-object p0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_2
    :goto_1
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 45
    .line 46
    .line 47
    return v4

    .line 48
    :goto_2
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 49
    .line 50
    .line 51
    throw p0
.end method

.method public peek()B
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->itemAt(I)B

    .line 9
    .line 10
    .line 11
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 13
    .line 14
    .line 15
    return p0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 18
    .line 19
    .line 20
    throw p0
.end method

.method public poll()B
    .locals 2

    .line 46
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 47
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 48
    :try_start_0
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    if-nez v1, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->dequeue()B

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :goto_0
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return p0

    :catchall_0
    move-exception p0

    .line 50
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 51
    throw p0
.end method

.method public poll(JLjava/util/concurrent/TimeUnit;)B
    .locals 2

    .line 1
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    iget-object p3, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/util/concurrent/locks/ReentrantLock;->lockInterruptibly()V

    .line 8
    .line 9
    .line 10
    :goto_0
    :try_start_0
    iget v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    cmp-long v0, p1, v0

    .line 17
    .line 18
    if-gtz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_0
    :try_start_1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 26
    .line 27
    invoke-interface {v0, p1, p2}, Ljava/util/concurrent/locks/Condition;->awaitNanos(J)J

    .line 28
    .line 29
    .line 30
    move-result-wide p1

    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    invoke-direct {p0}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->dequeue()B

    .line 35
    .line 36
    .line 37
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    invoke-virtual {p3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 39
    .line 40
    .line 41
    return p0

    .line 42
    :goto_1
    invoke-virtual {p3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p0
.end method

.method public put(B)V
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->checkNotNull(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lockInterruptibly()V

    .line 11
    .line 12
    .line 13
    :goto_0
    :try_start_0
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 14
    .line 15
    iget-object v2, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 16
    .line 17
    array-length v2, v2

    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notFull:Ljava/util/concurrent/locks/Condition;

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->await()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    invoke-direct {p0, p1}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->enqueue(B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :goto_1
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 36
    .line 37
    .line 38
    throw p0
.end method

.method public remainingCapacity()I
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 7
    .line 8
    array-length v1, v1

    .line 9
    iget p0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    sub-int/2addr v1, p0

    .line 12
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 13
    .line 14
    .line 15
    return v1

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 18
    .line 19
    .line 20
    throw p0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 6
    .line 7
    iget-object v2, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    iget v3, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 13
    .line 14
    if-lez v3, :cond_3

    .line 15
    .line 16
    iget v3, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->putIndex:I

    .line 17
    .line 18
    iget v4, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 19
    .line 20
    :cond_1
    aget-byte v5, v1, v4

    .line 21
    .line 22
    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    invoke-virtual {p1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-eqz v5, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0, v4}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->removeAt(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto :goto_0

    .line 42
    :cond_2
    :try_start_1
    invoke-virtual {p0, v4}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->inc(I)I

    .line 43
    .line 44
    .line 45
    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    if-ne v4, v3, :cond_1

    .line 47
    .line 48
    :cond_3
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 49
    .line 50
    .line 51
    return v0

    .line 52
    :goto_0
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 53
    .line 54
    .line 55
    throw p0
.end method

.method public removeAt(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 2
    .line 3
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne p1, v1, :cond_0

    .line 7
    .line 8
    aput-byte v2, v0, v1

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->inc(I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 15
    .line 16
    iget p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 17
    .line 18
    add-int/lit8 p1, p1, -0x1

    .line 19
    .line 20
    iput p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->putIndex:I

    .line 24
    .line 25
    :goto_0
    invoke-virtual {p0, p1}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->inc(I)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eq v3, v1, :cond_1

    .line 30
    .line 31
    aget-byte v4, v0, v3

    .line 32
    .line 33
    aput-byte v4, v0, p1

    .line 34
    .line 35
    move p1, v3

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    aput-byte v2, v0, p1

    .line 38
    .line 39
    iput p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->putIndex:I

    .line 40
    .line 41
    iget p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 42
    .line 43
    add-int/lit8 p1, p1, -0x1

    .line 44
    .line 45
    iput p1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 46
    .line 47
    :goto_1
    iget-object p0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notFull:Ljava/util/concurrent/locks/Condition;

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/concurrent/locks/Condition;->signal()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public size()I
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget p0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 9
    .line 10
    .line 11
    return p0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 14
    .line 15
    .line 16
    throw p0
.end method

.method public take()B
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lockInterruptibly()V

    .line 4
    .line 5
    .line 6
    :goto_0
    :try_start_0
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->await()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    invoke-direct {p0}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->dequeue()B

    .line 19
    .line 20
    .line 21
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 23
    .line 24
    .line 25
    return p0

    .line 26
    :goto_1
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 27
    .line 28
    .line 29
    throw p0
.end method

.method public takeBuffer([BI)I
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lockInterruptibly()V

    .line 4
    .line 5
    .line 6
    :goto_0
    :try_start_0
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->await()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    invoke-direct {p0, p1, p2}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->dequeue([BI)I

    .line 19
    .line 20
    .line 21
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 23
    .line 24
    .line 25
    return p0

    .line 26
    :goto_1
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 27
    .line 28
    .line 29
    throw p0
.end method

.method public toArray()[B
    .locals 6

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 2
    .line 3
    iget-object v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget v2, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 9
    .line 10
    new-array v3, v2, [B

    .line 11
    .line 12
    array-length v4, v0

    .line 13
    iget p0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 14
    .line 15
    sub-int/2addr v4, p0

    .line 16
    const/4 v5, 0x0

    .line 17
    if-gt v2, v4, :cond_0

    .line 18
    .line 19
    invoke-static {v0, p0, v3, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    invoke-static {v0, p0, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 26
    .line 27
    .line 28
    sub-int/2addr v2, v4

    .line 29
    invoke-static {v0, v5, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return-object v3

    .line 36
    :goto_1
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 37
    .line 38
    .line 39
    throw p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget v1, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->count:I

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const-string p0, "[]"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 13
    .line 14
    .line 15
    return-object p0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const/16 v3, 0x5b

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v3, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeIndex:I

    .line 29
    .line 30
    :goto_0
    iget-object v4, p0, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->items:[B

    .line 31
    .line 32
    aget-byte v4, v4, v3

    .line 33
    .line 34
    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    if-ne v4, p0, :cond_1

    .line 39
    .line 40
    const-string v4, "(this Collection)"

    .line 41
    .line 42
    :cond_1
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    add-int/lit8 v1, v1, -0x1

    .line 46
    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    const/16 p0, 0x5d

    .line 50
    .line 51
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 59
    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_2
    const/16 v4, 0x2c

    .line 63
    .line 64
    :try_start_2
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const/16 v4, 0x20

    .line 68
    .line 69
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v3}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->inc(I)I

    .line 73
    .line 74
    .line 75
    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 76
    goto :goto_0

    .line 77
    :goto_1
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 78
    .line 79
    .line 80
    throw p0
.end method
