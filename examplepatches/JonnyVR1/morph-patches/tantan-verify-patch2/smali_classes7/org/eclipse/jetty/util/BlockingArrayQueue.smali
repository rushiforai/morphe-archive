.class public Lorg/eclipse/jetty/util/BlockingArrayQueue;
.super Ljava/util/AbstractList;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/BlockingQueue;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractList<",
        "TE;>;",
        "Ljava/util/concurrent/BlockingQueue<",
        "TE;>;"
    }
.end annotation


# instance fields
.field public final DEFAULT_CAPACITY:I

.field public final DEFAULT_GROWTH:I

.field private volatile _capacity:I

.field private _elements:[Ljava/lang/Object;

.field private final _growCapacity:I

.field private _head:I

.field private final _headLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private final _limit:I

.field private final _notEmpty:Ljava/util/concurrent/locks/Condition;

.field private final _size:Ljava/util/concurrent/atomic/AtomicInteger;

.field private _space0:J

.field private _space1:J

.field private _space2:J

.field private _space3:J

.field private _space4:J

.field private _space5:J

.field private _space6:J

.field private _space7:J

.field private _tail:I

.field private final _tailLock:Ljava/util/concurrent/locks/ReentrantLock;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 80
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    const/16 v0, 0x80

    .line 81
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->DEFAULT_CAPACITY:I

    const/16 v1, 0x40

    .line 82
    iput v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->DEFAULT_GROWTH:I

    .line 83
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 84
    new-instance v2, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v2}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 85
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 86
    new-instance v2, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v2}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 87
    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 88
    iput v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_growCapacity:I

    .line 89
    array-length v0, v0

    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    const v0, 0x7fffffff

    .line 90
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_limit:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 58
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    const/16 v0, 0x80

    .line 59
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->DEFAULT_CAPACITY:I

    const/16 v0, 0x40

    .line 60
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->DEFAULT_GROWTH:I

    .line 61
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 62
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 63
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 64
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 65
    new-array v0, p1, [Ljava/lang/Object;

    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 66
    array-length v0, v0

    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    const/4 v0, -0x1

    .line 67
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_growCapacity:I

    .line 68
    iput p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_limit:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 69
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    const/16 v0, 0x80

    .line 70
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->DEFAULT_CAPACITY:I

    const/16 v0, 0x40

    .line 71
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->DEFAULT_GROWTH:I

    .line 72
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 73
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 74
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 75
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 76
    new-array p1, p1, [Ljava/lang/Object;

    iput-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 77
    array-length p1, p1

    iput p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 78
    iput p2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_growCapacity:I

    const p1, 0x7fffffff

    .line 79
    iput p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_limit:I

    return-void
.end method

.method public constructor <init>(III)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x80

    .line 5
    .line 6
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->DEFAULT_CAPACITY:I

    .line 7
    .line 8
    const/16 v0, 0x40

    .line 9
    .line 10
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->DEFAULT_GROWTH:I

    .line 11
    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 31
    .line 32
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 38
    .line 39
    if-gt p1, p3, :cond_0

    .line 40
    .line 41
    new-array p1, p1, [Ljava/lang/Object;

    .line 42
    .line 43
    iput-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 44
    .line 45
    array-length p1, p1

    .line 46
    iput p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 47
    .line 48
    iput p2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_growCapacity:I

    .line 49
    .line 50
    iput p3, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_limit:I

    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    throw p0
.end method

.method private grow()Z
    .locals 7

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_growCapacity:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-gtz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15
    .line 16
    .line 17
    :try_start_1
    iget v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 18
    .line 19
    iget v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 20
    .line 21
    iget v3, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 22
    .line 23
    iget v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_growCapacity:I

    .line 24
    .line 25
    add-int/2addr v3, v4

    .line 26
    new-array v3, v3, [Ljava/lang/Object;

    .line 27
    .line 28
    if-ge v0, v2, :cond_1

    .line 29
    .line 30
    sub-int/2addr v2, v0

    .line 31
    iget-object v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 32
    .line 33
    invoke-static {v4, v0, v3, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    goto :goto_2

    .line 39
    :cond_1
    if-gt v0, v2, :cond_3

    .line 40
    .line 41
    iget-object v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-lez v4, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    move v2, v1

    .line 51
    goto :goto_1

    .line 52
    :cond_3
    :goto_0
    iget v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 53
    .line 54
    add-int/2addr v4, v2

    .line 55
    sub-int/2addr v4, v0

    .line 56
    iget v5, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 57
    .line 58
    sub-int/2addr v5, v0

    .line 59
    iget-object v6, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 60
    .line 61
    invoke-static {v6, v0, v3, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 65
    .line 66
    invoke-static {v0, v1, v3, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 67
    .line 68
    .line 69
    move v2, v4

    .line 70
    :goto_1
    iput-object v3, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 71
    .line 72
    array-length v0, v3

    .line 73
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 74
    .line 75
    iput v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 76
    .line 77
    iput v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    .line 79
    :try_start_2
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 87
    .line 88
    .line 89
    const/4 p0, 0x1

    .line 90
    return p0

    .line 91
    :catchall_1
    move-exception v0

    .line 92
    goto :goto_3

    .line 93
    :goto_2
    :try_start_3
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 96
    .line 97
    .line 98
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 99
    :goto_3
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 100
    .line 101
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 102
    .line 103
    .line 104
    throw v0
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .line 1
    const-string v0, "!(0<"

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 14
    .line 15
    .line 16
    if-ltz p1, :cond_6

    .line 17
    .line 18
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-gt p1, v1, :cond_6

    .line 25
    .line 26
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-ne p1, v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/util/BlockingArrayQueue;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto/16 :goto_2

    .line 40
    .line 41
    :cond_0
    iget v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 42
    .line 43
    iget v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 44
    .line 45
    if-ne v0, v1, :cond_2

    .line 46
    .line 47
    invoke-direct {p0}, Lorg/eclipse/jetty/util/BlockingArrayQueue;->grow()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 55
    .line 56
    const-string p2, "full"

    .line 57
    .line 58
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw p1

    .line 62
    :cond_2
    :goto_0
    iget v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 63
    .line 64
    add-int/2addr v0, p1

    .line 65
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 66
    .line 67
    if-lt v0, p1, :cond_3

    .line 68
    .line 69
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 70
    .line 71
    sub-int/2addr v0, p1

    .line 72
    :cond_3
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 75
    .line 76
    .line 77
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 78
    .line 79
    const/4 v1, 0x1

    .line 80
    add-int/2addr p1, v1

    .line 81
    iget v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 82
    .line 83
    rem-int/2addr p1, v2

    .line 84
    iput p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 85
    .line 86
    if-ge v0, p1, :cond_4

    .line 87
    .line 88
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 89
    .line 90
    add-int/lit8 v2, v0, 0x1

    .line 91
    .line 92
    sub-int/2addr p1, v0

    .line 93
    invoke-static {v1, v0, v1, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 97
    .line 98
    aput-object p2, p1, v0

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_4
    if-lez p1, :cond_5

    .line 102
    .line 103
    iget-object v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 104
    .line 105
    const/4 v3, 0x0

    .line 106
    invoke-static {v2, v3, v2, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 110
    .line 111
    iget v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 112
    .line 113
    sub-int/2addr v2, v1

    .line 114
    aget-object v2, p1, v2

    .line 115
    .line 116
    aput-object v2, p1, v3

    .line 117
    .line 118
    :cond_5
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 119
    .line 120
    add-int/lit8 v2, v0, 0x1

    .line 121
    .line 122
    iget v3, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 123
    .line 124
    sub-int/2addr v3, v0

    .line 125
    sub-int/2addr v3, v1

    .line 126
    invoke-static {p1, v0, p1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 130
    .line 131
    aput-object p2, p1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 132
    .line 133
    :goto_1
    :try_start_2
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 134
    .line 135
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 139
    .line 140
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :catchall_1
    move-exception p1

    .line 145
    goto :goto_3

    .line 146
    :cond_6
    :try_start_3
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    .line 147
    .line 148
    new-instance v1, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string p1, "<="

    .line 157
    .line 158
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 162
    .line 163
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    const-string p1, ")"

    .line 167
    .line 168
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 179
    :goto_2
    :try_start_4
    iget-object p2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 180
    .line 181
    invoke-virtual {p2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 182
    .line 183
    .line 184
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 185
    :goto_3
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 186
    .line 187
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 188
    .line 189
    .line 190
    throw p1
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 191
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/BlockingArrayQueue;->offer(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public clear()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    :try_start_1
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 13
    .line 14
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 15
    .line 16
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 19
    .line 20
    .line 21
    :try_start_2
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    goto :goto_0

    .line 34
    :catchall_1
    move-exception v0

    .line 35
    :try_start_3
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 38
    .line 39
    .line 40
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 41
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw v0
.end method

.method public drainTo(Ljava/util/Collection;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "-TE;>;)I"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public drainTo(Ljava/util/Collection;I)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "-TE;>;I)I"
        }
    .end annotation

    .line 7
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public element()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/BlockingArrayQueue;->peek()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-static {}, Ll/mor;->a()V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public get(I)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 1
    const-string v0, "!(0<"

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    .line 12
    .line 13
    if-ltz p1, :cond_1

    .line 14
    .line 15
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ge p1, v1, :cond_1

    .line 22
    .line 23
    iget v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 24
    .line 25
    add-int/2addr v0, p1

    .line 26
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 27
    .line 28
    if-lt v0, p1, :cond_0

    .line 29
    .line 30
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 31
    .line 32
    sub-int/2addr v0, p1

    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 37
    .line 38
    aget-object p1, p1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    .line 40
    :try_start_2
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 48
    .line 49
    .line 50
    return-object p1

    .line 51
    :catchall_1
    move-exception p1

    .line 52
    goto :goto_2

    .line 53
    :cond_1
    :try_start_3
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    .line 54
    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p1, "<="

    .line 64
    .line 65
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 69
    .line 70
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string p1, ")"

    .line 74
    .line 75
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-direct {v1, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 86
    :goto_1
    :try_start_4
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 89
    .line 90
    .line 91
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 92
    :goto_2
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 95
    .line 96
    .line 97
    throw p1
.end method

.method public getCapacity()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 2
    .line 3
    return p0
.end method

.method public getLimit()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_limit:I

    .line 2
    .line 3
    return p0
.end method

.method public isEmpty()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 7
    .line 8
    .line 9
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_limit:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-lt v0, v1, :cond_0

    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 23
    .line 24
    .line 25
    return v2

    .line 26
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 33
    .line 34
    if-ne v0, v1, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    .line 40
    .line 41
    :try_start_2
    invoke-direct {p0}, Lorg/eclipse/jetty/util/BlockingArrayQueue;->grow()Z

    .line 42
    .line 43
    .line 44
    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 45
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 46
    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    :try_start_3
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p1

    .line 54
    goto :goto_3

    .line 55
    :cond_1
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :catchall_1
    move-exception p1

    .line 60
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 63
    .line 64
    .line 65
    throw p1

    .line 66
    :cond_2
    :goto_1
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 67
    .line 68
    iget v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 69
    .line 70
    aput-object p1, v0, v1

    .line 71
    .line 72
    const/4 p1, 0x1

    .line 73
    add-int/2addr v1, p1

    .line 74
    iget v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 75
    .line 76
    rem-int/2addr v1, v0

    .line 77
    iput v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 78
    .line 79
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 82
    .line 83
    .line 84
    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 85
    if-nez v0, :cond_3

    .line 86
    .line 87
    move v2, p1

    .line 88
    :cond_3
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 91
    .line 92
    .line 93
    if-eqz v2, :cond_4

    .line 94
    .line 95
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 98
    .line 99
    .line 100
    :try_start_4
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 101
    .line 102
    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 106
    .line 107
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :catchall_2
    move-exception p1

    .line 112
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 113
    .line 114
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 115
    .line 116
    .line 117
    throw p1

    .line 118
    :cond_4
    :goto_2
    return p1

    .line 119
    :goto_3
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 120
    .line 121
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 122
    .line 123
    .line 124
    throw p1
.end method

.method public offer(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 125
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public peek()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-lez v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 25
    .line 26
    iget v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 27
    .line 28
    aget-object v1, v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 36
    .line 37
    .line 38
    return-object v1

    .line 39
    :goto_1
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 42
    .line 43
    .line 44
    throw v0
.end method

.method public poll()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 89
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 90
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-lez v0, :cond_2

    .line 91
    iget v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 92
    iget-object v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    aget-object v3, v2, v0

    .line 93
    aput-object v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    .line 94
    iget v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    rem-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 95
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-lez v0, :cond_1

    .line 96
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_notEmpty:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_1
    :goto_0
    move-object v1, v3

    .line 97
    :cond_2
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-object v1

    :goto_1
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    iget-object p3, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/util/concurrent/locks/ReentrantLock;->lockInterruptibly()V

    .line 8
    .line 9
    .line 10
    :goto_0
    :try_start_0
    iget-object p3, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 13
    .line 14
    .line 15
    move-result p3
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    const/4 v0, 0x0

    .line 17
    if-nez p3, :cond_1

    .line 18
    .line 19
    const-wide/16 v1, 0x0

    .line 20
    .line 21
    cmp-long p3, p1, v1

    .line 22
    .line 23
    if-gtz p3, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return-object v0

    .line 31
    :cond_0
    :try_start_1
    iget-object p3, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 32
    .line 33
    invoke-interface {p3, p1, p2}, Ljava/util/concurrent/locks/Condition;->awaitNanos(J)J

    .line 34
    .line 35
    .line 36
    move-result-wide p1
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_2

    .line 40
    :catch_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    :try_start_2
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 43
    .line 44
    iget p2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 45
    .line 46
    aget-object p3, p1, p2

    .line 47
    .line 48
    aput-object v0, p1, p2

    .line 49
    .line 50
    add-int/lit8 p2, p2, 0x1

    .line 51
    .line 52
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 53
    .line 54
    rem-int/2addr p2, p1

    .line 55
    iput p2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 56
    .line 57
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-lez p1, :cond_2

    .line 64
    .line 65
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 66
    .line 67
    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 68
    .line 69
    .line 70
    :cond_2
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 73
    .line 74
    .line 75
    return-object p3

    .line 76
    :goto_1
    :try_start_3
    iget-object p2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 77
    .line 78
    invoke-interface {p2}, Ljava/util/concurrent/locks/Condition;->signal()V

    .line 79
    .line 80
    .line 81
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 82
    :goto_2
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 83
    .line 84
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 85
    .line 86
    .line 87
    throw p1
.end method

.method public put(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/BlockingArrayQueue;->add(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "full"

    .line 9
    .line 10
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public remainingCapacity()I
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    :try_start_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/BlockingArrayQueue;->getCapacity()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/BlockingArrayQueue;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 19
    sub-int/2addr v0, v1

    .line 20
    :try_start_2
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_0

    .line 33
    :catchall_1
    move-exception v0

    .line 34
    :try_start_3
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 37
    .line 38
    .line 39
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 40
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public remove()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 167
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/BlockingArrayQueue;->poll()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    return-object p0

    .line 168
    :cond_0
    invoke-static {}, Ll/mor;->a()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 1
    const-string v0, "!(0<"

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    .line 12
    .line 13
    if-ltz p1, :cond_3

    .line 14
    .line 15
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ge p1, v1, :cond_3

    .line 22
    .line 23
    iget v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 24
    .line 25
    add-int/2addr v0, p1

    .line 26
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 27
    .line 28
    if-lt v0, p1, :cond_0

    .line 29
    .line 30
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 31
    .line 32
    sub-int/2addr v0, p1

    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    goto/16 :goto_3

    .line 36
    .line 37
    :cond_0
    :goto_0
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 38
    .line 39
    aget-object v1, p1, v0

    .line 40
    .line 41
    iget v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 42
    .line 43
    const/4 v3, 0x1

    .line 44
    if-ge v0, v2, :cond_1

    .line 45
    .line 46
    add-int/lit8 v4, v0, 0x1

    .line 47
    .line 48
    sub-int/2addr v2, v0

    .line 49
    invoke-static {p1, v4, p1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 50
    .line 51
    .line 52
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 53
    .line 54
    sub-int/2addr p1, v3

    .line 55
    iput p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 56
    .line 57
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_1
    add-int/lit8 v2, v0, 0x1

    .line 64
    .line 65
    iget v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 66
    .line 67
    sub-int/2addr v4, v0

    .line 68
    sub-int/2addr v4, v3

    .line 69
    invoke-static {p1, v2, p1, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 70
    .line 71
    .line 72
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 73
    .line 74
    if-lez p1, :cond_2

    .line 75
    .line 76
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 77
    .line 78
    iget v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 79
    .line 80
    iget-object v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 81
    .line 82
    const/4 v4, 0x0

    .line 83
    aget-object v5, v2, v4

    .line 84
    .line 85
    aput-object v5, p1, v0

    .line 86
    .line 87
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 88
    .line 89
    sub-int/2addr p1, v3

    .line 90
    invoke-static {v2, v3, v2, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    .line 92
    .line 93
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 94
    .line 95
    sub-int/2addr p1, v3

    .line 96
    iput p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_2
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 100
    .line 101
    sub-int/2addr p1, v3

    .line 102
    iput p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tail:I

    .line 103
    .line 104
    :goto_1
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 105
    .line 106
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 107
    .line 108
    .line 109
    :goto_2
    :try_start_2
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 110
    .line 111
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 115
    .line 116
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 117
    .line 118
    .line 119
    return-object v1

    .line 120
    :catchall_1
    move-exception p1

    .line 121
    goto :goto_4

    .line 122
    :cond_3
    :try_start_3
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    .line 123
    .line 124
    new-instance v2, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string p1, "<="

    .line 133
    .line 134
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 138
    .line 139
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string p1, ")"

    .line 143
    .line 144
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-direct {v1, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 155
    :goto_3
    :try_start_4
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 158
    .line 159
    .line 160
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 161
    :goto_4
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 162
    .line 163
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 164
    .line 165
    .line 166
    throw p1
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)TE;"
        }
    .end annotation

    .line 1
    const-string v0, "!(0<"

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 14
    .line 15
    .line 16
    if-ltz p1, :cond_1

    .line 17
    .line 18
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-ge p1, v1, :cond_1

    .line 25
    .line 26
    iget v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 27
    .line 28
    add-int/2addr v0, p1

    .line 29
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 30
    .line 31
    if-lt v0, p1, :cond_0

    .line 32
    .line 33
    iget p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 34
    .line 35
    sub-int/2addr v0, p1

    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :goto_0
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 40
    .line 41
    aget-object v1, p1, v0

    .line 42
    .line 43
    aput-object p2, p1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    .line 45
    :try_start_2
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 53
    .line 54
    .line 55
    return-object v1

    .line 56
    :catchall_1
    move-exception p1

    .line 57
    goto :goto_2

    .line 58
    :cond_1
    :try_start_3
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    .line 59
    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string p1, "<="

    .line 69
    .line 70
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 74
    .line 75
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string p1, ")"

    .line 79
    .line 80
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 91
    :goto_1
    :try_start_4
    iget-object p2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 92
    .line 93
    invoke-virtual {p2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 94
    .line 95
    .line 96
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 97
    :goto_2
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_tailLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 98
    .line 99
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 100
    .line 101
    .line 102
    throw p1
.end method

.method public size()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public sumOfSpace()J
    .locals 8

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space0:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long v4, v0, v2

    .line 6
    .line 7
    iput-wide v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space0:J

    .line 8
    .line 9
    iget-wide v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space1:J

    .line 10
    .line 11
    add-long v6, v4, v2

    .line 12
    .line 13
    iput-wide v6, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space1:J

    .line 14
    .line 15
    add-long/2addr v0, v4

    .line 16
    iget-wide v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space2:J

    .line 17
    .line 18
    add-long v6, v4, v2

    .line 19
    .line 20
    iput-wide v6, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space2:J

    .line 21
    .line 22
    add-long/2addr v0, v4

    .line 23
    iget-wide v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space3:J

    .line 24
    .line 25
    add-long v6, v4, v2

    .line 26
    .line 27
    iput-wide v6, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space3:J

    .line 28
    .line 29
    add-long/2addr v0, v4

    .line 30
    iget-wide v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space4:J

    .line 31
    .line 32
    add-long v6, v4, v2

    .line 33
    .line 34
    iput-wide v6, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space4:J

    .line 35
    .line 36
    add-long/2addr v0, v4

    .line 37
    iget-wide v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space5:J

    .line 38
    .line 39
    add-long v6, v4, v2

    .line 40
    .line 41
    iput-wide v6, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space5:J

    .line 42
    .line 43
    add-long/2addr v0, v4

    .line 44
    iget-wide v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space6:J

    .line 45
    .line 46
    add-long v6, v4, v2

    .line 47
    .line 48
    iput-wide v6, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space6:J

    .line 49
    .line 50
    add-long/2addr v0, v4

    .line 51
    iget-wide v4, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space7:J

    .line 52
    .line 53
    add-long/2addr v2, v4

    .line 54
    iput-wide v2, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_space7:J

    .line 55
    .line 56
    add-long/2addr v0, v4

    .line 57
    return-wide v0
.end method

.method public take()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lockInterruptibly()V

    .line 4
    .line 5
    .line 6
    :goto_0
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_2

    .line 22
    :catch_0
    move-exception v0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :try_start_1
    iget v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 25
    .line 26
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_elements:[Ljava/lang/Object;

    .line 27
    .line 28
    aget-object v2, v1, v0

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    aput-object v3, v1, v0

    .line 32
    .line 33
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    iget v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_capacity:I

    .line 36
    .line 37
    rem-int/2addr v0, v1

    .line 38
    iput v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_head:I

    .line 39
    .line 40
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-lez v0, :cond_1

    .line 47
    .line 48
    iget-object v0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 56
    .line 57
    .line 58
    return-object v2

    .line 59
    :goto_1
    :try_start_2
    iget-object v1, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_notEmpty:Ljava/util/concurrent/locks/Condition;

    .line 60
    .line 61
    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->signal()V

    .line 62
    .line 63
    .line 64
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 65
    :goto_2
    iget-object p0, p0, Lorg/eclipse/jetty/util/BlockingArrayQueue;->_headLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 68
    .line 69
    .line 70
    throw v0
.end method
