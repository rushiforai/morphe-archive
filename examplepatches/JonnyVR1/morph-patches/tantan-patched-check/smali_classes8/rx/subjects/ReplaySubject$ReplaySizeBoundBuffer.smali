.class public final Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/subjects/ReplaySubject$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/subjects/ReplaySubject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ReplaySizeBoundBuffer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/subjects/ReplaySubject$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:I

.field public volatile b:Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node<",
            "TT;>;"
        }
    .end annotation
.end field

.field public c:Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node<",
            "TT;>;"
        }
    .end annotation
.end field

.field public d:I

.field public volatile e:Z

.field public f:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->a:I

    .line 5
    .line 6
    new-instance p1, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p1, v0}, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;-><init>(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->c:Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;

    .line 13
    .line 14
    iput-object p1, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->b:Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(Lrx/subjects/ReplaySubject$ReplayProducer;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/ReplaySubject$ReplayProducer<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    goto/16 :goto_3

    .line 12
    .line 13
    :cond_0
    iget-object v2, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->actual:Ll/gcg0;

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    :cond_1
    iget-object v5, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 17
    .line 18
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 19
    .line 20
    .line 21
    move-result-wide v5

    .line 22
    iget-object v7, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->node:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v7, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;

    .line 25
    .line 26
    const-wide/16 v8, 0x0

    .line 27
    .line 28
    if-nez v7, :cond_2

    .line 29
    .line 30
    iget-object v7, v0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->b:Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;

    .line 31
    .line 32
    :cond_2
    move-wide v10, v8

    .line 33
    :goto_0
    cmp-long v12, v10, v5

    .line 34
    .line 35
    const/4 v13, 0x0

    .line 36
    const/4 v14, 0x0

    .line 37
    if-eqz v12, :cond_8

    .line 38
    .line 39
    invoke-virtual {v2}, Ll/gcg0;->isUnsubscribed()Z

    .line 40
    .line 41
    .line 42
    move-result v15

    .line 43
    if-eqz v15, :cond_3

    .line 44
    .line 45
    iput-object v14, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->node:Ljava/lang/Object;

    .line 46
    .line 47
    return-void

    .line 48
    :cond_3
    iget-boolean v15, v0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->e:Z

    .line 49
    .line 50
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v16

    .line 54
    move-object/from16 v3, v16

    .line 55
    .line 56
    check-cast v3, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;

    .line 57
    .line 58
    if-nez v3, :cond_4

    .line 59
    .line 60
    const/16 v16, 0x1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_4
    move/from16 v16, v13

    .line 64
    .line 65
    :goto_1
    if-eqz v15, :cond_6

    .line 66
    .line 67
    if-eqz v16, :cond_6

    .line 68
    .line 69
    iput-object v14, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->node:Ljava/lang/Object;

    .line 70
    .line 71
    iget-object v0, v0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->f:Ljava/lang/Throwable;

    .line 72
    .line 73
    if-eqz v0, :cond_5

    .line 74
    .line 75
    invoke-interface {v2, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_5
    invoke-interface {v2}, Ll/bb50;->onCompleted()V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_6
    if-eqz v16, :cond_7

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_7
    iget-object v7, v3, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;->value:Ljava/lang/Object;

    .line 87
    .line 88
    invoke-interface {v2, v7}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    const-wide/16 v12, 0x1

    .line 92
    .line 93
    add-long/2addr v10, v12

    .line 94
    move-object v7, v3

    .line 95
    goto :goto_0

    .line 96
    :cond_8
    :goto_2
    if-nez v12, :cond_c

    .line 97
    .line 98
    invoke-virtual {v2}, Ll/gcg0;->isUnsubscribed()Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-eqz v3, :cond_9

    .line 103
    .line 104
    iput-object v14, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->node:Ljava/lang/Object;

    .line 105
    .line 106
    return-void

    .line 107
    :cond_9
    iget-boolean v3, v0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->e:Z

    .line 108
    .line 109
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v12

    .line 113
    if-nez v12, :cond_a

    .line 114
    .line 115
    const/4 v13, 0x1

    .line 116
    :cond_a
    if-eqz v3, :cond_c

    .line 117
    .line 118
    if-eqz v13, :cond_c

    .line 119
    .line 120
    iput-object v14, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->node:Ljava/lang/Object;

    .line 121
    .line 122
    iget-object v0, v0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->f:Ljava/lang/Throwable;

    .line 123
    .line 124
    if-eqz v0, :cond_b

    .line 125
    .line 126
    invoke-interface {v2, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_b
    invoke-interface {v2}, Ll/bb50;->onCompleted()V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_c
    cmp-long v3, v10, v8

    .line 135
    .line 136
    if-eqz v3, :cond_d

    .line 137
    .line 138
    const-wide v8, 0x7fffffffffffffffL

    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    cmp-long v3, v5, v8

    .line 144
    .line 145
    if-eqz v3, :cond_d

    .line 146
    .line 147
    iget-object v3, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 148
    .line 149
    invoke-static {v3, v10, v11}, Ll/rc2;->i(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 150
    .line 151
    .line 152
    :cond_d
    iput-object v7, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->node:Ljava/lang/Object;

    .line 153
    .line 154
    neg-int v3, v4

    .line 155
    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 156
    .line 157
    .line 158
    move-result v4

    .line 159
    if-nez v4, :cond_1

    .line 160
    .line 161
    :goto_3
    return-void
.end method

.method public complete()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->e:Z

    .line 3
    .line 4
    return-void
.end method

.method public error(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->f:Ljava/lang/Throwable;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->e:Z

    .line 5
    .line 6
    return-void
.end method

.method public next(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->c:Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->c:Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;

    .line 12
    .line 13
    iget p1, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->d:I

    .line 14
    .line 15
    iget v0, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->a:I

    .line 16
    .line 17
    if-ne p1, v0, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->b:Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;

    .line 26
    .line 27
    iput-object p1, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->b:Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer$Node;

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 31
    .line 32
    iput p1, p0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;->d:I

    .line 33
    .line 34
    return-void
.end method
