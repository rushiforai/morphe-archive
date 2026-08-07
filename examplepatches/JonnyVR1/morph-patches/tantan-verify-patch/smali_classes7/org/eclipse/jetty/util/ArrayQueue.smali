.class public Lorg/eclipse/jetty/util/ArrayQueue;
.super Ljava/util/AbstractList;
.source "SourceFile"

# interfaces
.implements Ljava/util/Queue;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractList<",
        "TE;>;",
        "Ljava/util/Queue<",
        "TE;>;"
    }
.end annotation


# static fields
.field public static final DEFAULT_CAPACITY:I = 0x40

.field public static final DEFAULT_GROWTH:I = 0x20


# instance fields
.field protected _elements:[Ljava/lang/Object;

.field protected final _growCapacity:I

.field protected final _lock:Ljava/lang/Object;

.field protected _nextE:I

.field protected _nextSlot:I

.field protected _size:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x40

    const/4 v1, -0x1

    .line 18
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/util/ArrayQueue;-><init>(II)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, -0x1

    .line 16
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jetty/util/ArrayQueue;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    const/4 v0, 0x0

    .line 17
    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jetty/util/ArrayQueue;-><init>(IILjava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(IILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 2
    .line 3
    .line 4
    if-nez p3, :cond_0

    .line 5
    .line 6
    move-object p3, p0

    .line 7
    :cond_0
    iput-object p3, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 8
    .line 9
    iput p2, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_growCapacity:I

    .line 10
    .line 11
    new-array p1, p1, [Ljava/lang/Object;

    .line 12
    .line 13
    iput-object p1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 14
    .line 15
    return-void
.end method

.method private at(I)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method private dequeue()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/util/ArrayQueue;->at(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 8
    .line 9
    iget v2, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    aput-object v3, v1, v2

    .line 13
    .line 14
    iget v3, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 15
    .line 16
    add-int/lit8 v3, v3, -0x1

    .line 17
    .line 18
    iput v3, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 19
    .line 20
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    iput v2, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 23
    .line 24
    array-length v1, v1

    .line 25
    if-ne v2, v1, :cond_0

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    iput v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 29
    .line 30
    :cond_0
    return-object v0
.end method

.method private enqueue(Ljava/lang/Object;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 4
    .line 5
    array-length v1, v1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ArrayQueue;->grow()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return v2

    .line 16
    :cond_0
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    add-int/2addr v0, v1

    .line 20
    iput v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 21
    .line 22
    iget-object v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 23
    .line 24
    iget v3, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 25
    .line 26
    add-int/lit8 v4, v3, 0x1

    .line 27
    .line 28
    iput v4, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 29
    .line 30
    aput-object p1, v0, v3

    .line 31
    .line 32
    array-length p1, v0

    .line 33
    if-ne v4, p1, :cond_1

    .line 34
    .line 35
    iput v2, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 36
    .line 37
    :cond_1
    return v1
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .line 1
    const-string v0, "!(0<"

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    if-ltz p1, :cond_7

    .line 7
    .line 8
    :try_start_0
    iget v2, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 9
    .line 10
    if-gt p1, v2, :cond_7

    .line 11
    .line 12
    iget-object v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 13
    .line 14
    array-length v0, v0

    .line 15
    if-ne v2, v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ArrayQueue;->grow()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 25
    .line 26
    const-string p1, "Full"

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    throw p0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_2

    .line 34
    :cond_1
    :goto_0
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 35
    .line 36
    if-ne p1, v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/util/ArrayQueue;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    iget v2, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 43
    .line 44
    add-int/2addr v2, p1

    .line 45
    iget-object p1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 46
    .line 47
    array-length v3, p1

    .line 48
    if-lt v2, v3, :cond_3

    .line 49
    .line 50
    array-length v3, p1

    .line 51
    sub-int/2addr v2, v3

    .line 52
    :cond_3
    const/4 v3, 0x1

    .line 53
    add-int/2addr v0, v3

    .line 54
    iput v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 55
    .line 56
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 57
    .line 58
    add-int/2addr v0, v3

    .line 59
    iput v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 60
    .line 61
    array-length v4, p1

    .line 62
    const/4 v5, 0x0

    .line 63
    if-ne v0, v4, :cond_4

    .line 64
    .line 65
    iput v5, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 66
    .line 67
    :cond_4
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 68
    .line 69
    if-ge v2, v0, :cond_5

    .line 70
    .line 71
    add-int/lit8 v3, v2, 0x1

    .line 72
    .line 73
    sub-int/2addr v0, v2

    .line 74
    invoke-static {p1, v2, p1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 78
    .line 79
    aput-object p2, p0, v2

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_5
    if-lez v0, :cond_6

    .line 83
    .line 84
    invoke-static {p1, v5, p1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 88
    .line 89
    array-length v0, p1

    .line 90
    sub-int/2addr v0, v3

    .line 91
    aget-object v0, p1, v0

    .line 92
    .line 93
    aput-object v0, p1, v5

    .line 94
    .line 95
    :cond_6
    iget-object p1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 96
    .line 97
    add-int/lit8 v0, v2, 0x1

    .line 98
    .line 99
    array-length v4, p1

    .line 100
    sub-int/2addr v4, v2

    .line 101
    sub-int/2addr v4, v3

    .line 102
    invoke-static {p1, v2, p1, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 106
    .line 107
    aput-object p2, p0, v2

    .line 108
    .line 109
    :goto_1
    monitor-exit v1

    .line 110
    return-void

    .line 111
    :cond_7
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    .line 112
    .line 113
    new-instance v2, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string p1, "<="

    .line 122
    .line 123
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    iget p0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 127
    .line 128
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string p0, ")"

    .line 132
    .line 133
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-direct {p2, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    throw p2

    .line 144
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 145
    throw p0
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 146
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ArrayQueue;->offer(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    .line 147
    :cond_0
    const-string p0, "Full"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public addUnsafe(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/util/ArrayQueue;->enqueue(Ljava/lang/Object;)Z

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
    const-string p0, "Full"

    .line 9
    .line 10
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public clear()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 6
    .line 7
    iput v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 8
    .line 9
    iput v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public element()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ArrayQueue;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    iget v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 11
    .line 12
    invoke-direct {p0, v1}, Lorg/eclipse/jetty/util/ArrayQueue;->at(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    monitor-exit v0

    .line 17
    return-object p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 21
    .line 22
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 23
    .line 24
    .line 25
    throw p0

    .line 26
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method

.method public get(I)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 1
    const-string v0, "!(0<"

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    if-ltz p1, :cond_0

    .line 7
    .line 8
    :try_start_0
    iget v2, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 9
    .line 10
    if-ge p1, v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ArrayQueue;->getUnsafe(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    monitor-exit v1

    .line 17
    return-object p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    .line 21
    .line 22
    new-instance v3, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p1, "<="

    .line 31
    .line 32
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget p0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 36
    .line 37
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p0, ")"

    .line 41
    .line 42
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-direct {v2, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw v2

    .line 53
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    throw p0
.end method

.method public getCapacity()I
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 5
    .line 6
    array-length p0, p0

    .line 7
    monitor-exit v0

    .line 8
    return p0

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method

.method public getUnsafe(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    iget-object p1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 5
    .line 6
    array-length p1, p1

    .line 7
    rem-int/2addr v0, p1

    .line 8
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/util/ArrayQueue;->at(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public grow()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_growCapacity:I

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-gtz v1, :cond_0

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return v2

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 14
    .line 15
    array-length v4, v3

    .line 16
    add-int/2addr v4, v1

    .line 17
    new-array v1, v4, [Ljava/lang/Object;

    .line 18
    .line 19
    array-length v4, v3

    .line 20
    iget v5, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 21
    .line 22
    sub-int/2addr v4, v5

    .line 23
    if-lez v4, :cond_1

    .line 24
    .line 25
    invoke-static {v3, v5, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget v3, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 29
    .line 30
    if-eqz v3, :cond_2

    .line 31
    .line 32
    iget-object v3, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 33
    .line 34
    iget v5, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 35
    .line 36
    invoke-static {v3, v2, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iput-object v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 40
    .line 41
    iput v2, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 42
    .line 43
    iget v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 44
    .line 45
    iput v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    monitor-exit v0

    .line 49
    return p0

    .line 50
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    throw p0
.end method

.method public isEmpty()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget p0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    monitor-exit v0

    .line 12
    return p0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/util/ArrayQueue;->enqueue(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    monitor-exit v0

    .line 9
    return p0

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
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
    iget-object v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ArrayQueue;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    monitor-exit v0

    .line 12
    return-object p0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 16
    .line 17
    invoke-direct {p0, v1}, Lorg/eclipse/jetty/util/ArrayQueue;->at(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    monitor-exit v0

    .line 22
    return-object p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public poll()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    monitor-exit v0

    .line 10
    return-object p0

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jetty/util/ArrayQueue;->dequeue()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    monitor-exit v0

    .line 18
    return-object p0

    .line 19
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public remove()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 126
    iget-object v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    monitor-enter v0

    .line 127
    :try_start_0
    iget v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    if-eqz v1, :cond_0

    .line 128
    invoke-direct {p0}, Lorg/eclipse/jetty/util/ArrayQueue;->dequeue()Ljava/lang/Object;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    goto :goto_0

    .line 129
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0

    .line 130
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 1
    const-string v0, "!(0<"

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    if-ltz p1, :cond_2

    .line 7
    .line 8
    :try_start_0
    iget v2, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 9
    .line 10
    if-ge p1, v2, :cond_2

    .line 11
    .line 12
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 13
    .line 14
    add-int/2addr v0, p1

    .line 15
    iget-object p1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 16
    .line 17
    array-length p1, p1

    .line 18
    rem-int/2addr v0, p1

    .line 19
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/util/ArrayQueue;->at(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget v2, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    iget-object v3, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 26
    .line 27
    const/4 v4, 0x1

    .line 28
    if-ge v0, v2, :cond_0

    .line 29
    .line 30
    add-int/lit8 v5, v0, 0x1

    .line 31
    .line 32
    sub-int/2addr v2, v0

    .line 33
    :try_start_1
    invoke-static {v3, v5, v3, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 37
    .line 38
    sub-int/2addr v0, v4

    .line 39
    iput v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 40
    .line 41
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 42
    .line 43
    sub-int/2addr v0, v4

    .line 44
    iput v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_2

    .line 49
    :cond_0
    add-int/lit8 v2, v0, 0x1

    .line 50
    .line 51
    array-length v5, v3

    .line 52
    sub-int/2addr v5, v0

    .line 53
    sub-int/2addr v5, v4

    .line 54
    invoke-static {v3, v2, v3, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 55
    .line 56
    .line 57
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    .line 59
    iget-object v2, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 60
    .line 61
    if-lez v0, :cond_1

    .line 62
    .line 63
    :try_start_2
    array-length v3, v2

    .line 64
    sub-int/2addr v3, v4

    .line 65
    const/4 v5, 0x0

    .line 66
    aget-object v6, v2, v5

    .line 67
    .line 68
    aput-object v6, v2, v3

    .line 69
    .line 70
    sub-int/2addr v0, v4

    .line 71
    invoke-static {v2, v4, v2, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 72
    .line 73
    .line 74
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 75
    .line 76
    sub-int/2addr v0, v4

    .line 77
    iput v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    array-length v0, v2

    .line 81
    sub-int/2addr v0, v4

    .line 82
    iput v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextSlot:I

    .line 83
    .line 84
    :goto_0
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 85
    .line 86
    sub-int/2addr v0, v4

    .line 87
    iput v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 88
    .line 89
    :goto_1
    monitor-exit v1

    .line 90
    return-object p1

    .line 91
    :cond_2
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    .line 92
    .line 93
    new-instance v3, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string p1, "<="

    .line 102
    .line 103
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget p0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 107
    .line 108
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string p0, ")"

    .line 112
    .line 113
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-direct {v2, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    throw v2

    .line 124
    :goto_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 125
    throw p0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)TE;"
        }
    .end annotation

    .line 1
    const-string v0, "!(0<"

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    if-ltz p1, :cond_1

    .line 7
    .line 8
    :try_start_0
    iget v2, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 9
    .line 10
    if-ge p1, v2, :cond_1

    .line 11
    .line 12
    iget v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_nextE:I

    .line 13
    .line 14
    add-int/2addr v0, p1

    .line 15
    iget-object p1, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 16
    .line 17
    array-length v2, p1

    .line 18
    if-lt v0, v2, :cond_0

    .line 19
    .line 20
    array-length p1, p1

    .line 21
    sub-int/2addr v0, p1

    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/util/ArrayQueue;->at(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_elements:[Ljava/lang/Object;

    .line 30
    .line 31
    aput-object p2, p0, v0

    .line 32
    .line 33
    monitor-exit v1

    .line 34
    return-object p1

    .line 35
    :cond_1
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    .line 36
    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p1, "<="

    .line 46
    .line 47
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget p0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 51
    .line 52
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p0, ")"

    .line 56
    .line 57
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-direct {p2, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    throw p2

    .line 68
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    throw p0
.end method

.method public size()I
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget p0, p0, Lorg/eclipse/jetty/util/ArrayQueue;->_size:I

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method
