.class public final Lrx/subjects/ReplaySubject$b;
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
    name = "b"
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

.field public volatile b:I

.field public final c:[Ljava/lang/Object;

.field public d:[Ljava/lang/Object;

.field public e:I

.field public volatile f:Z

.field public g:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lrx/subjects/ReplaySubject$b;->a:I

    .line 5
    .line 6
    add-int/lit8 p1, p1, 0x1

    .line 7
    .line 8
    new-array p1, p1, [Ljava/lang/Object;

    .line 9
    .line 10
    iput-object p1, p0, Lrx/subjects/ReplaySubject$b;->c:[Ljava/lang/Object;

    .line 11
    .line 12
    iput-object p1, p0, Lrx/subjects/ReplaySubject$b;->d:[Ljava/lang/Object;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Lrx/subjects/ReplaySubject$ReplayProducer;)V
    .locals 20
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
    iget v3, v0, Lrx/subjects/ReplaySubject$b;->a:I

    .line 16
    .line 17
    const/4 v5, 0x1

    .line 18
    :cond_1
    iget-object v6, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 19
    .line 20
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 21
    .line 22
    .line 23
    move-result-wide v6

    .line 24
    iget-object v8, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->node:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v8, [Ljava/lang/Object;

    .line 27
    .line 28
    if-nez v8, :cond_2

    .line 29
    .line 30
    iget-object v8, v0, Lrx/subjects/ReplaySubject$b;->c:[Ljava/lang/Object;

    .line 31
    .line 32
    :cond_2
    iget v9, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->tailIndex:I

    .line 33
    .line 34
    iget v10, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->index:I

    .line 35
    .line 36
    const-wide/16 v13, 0x0

    .line 37
    .line 38
    :goto_0
    cmp-long v15, v13, v6

    .line 39
    .line 40
    const/16 v16, 0x0

    .line 41
    .line 42
    const/16 v17, 0x1

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    if-eqz v15, :cond_9

    .line 46
    .line 47
    invoke-virtual {v2}, Ll/gcg0;->isUnsubscribed()Z

    .line 48
    .line 49
    .line 50
    move-result v18

    .line 51
    if-eqz v18, :cond_3

    .line 52
    .line 53
    iput-object v4, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->node:Ljava/lang/Object;

    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    const-wide/16 v18, 0x0

    .line 57
    .line 58
    iget-boolean v11, v0, Lrx/subjects/ReplaySubject$b;->f:Z

    .line 59
    .line 60
    iget v12, v0, Lrx/subjects/ReplaySubject$b;->b:I

    .line 61
    .line 62
    if-ne v10, v12, :cond_4

    .line 63
    .line 64
    move/from16 v12, v17

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_4
    move/from16 v12, v16

    .line 68
    .line 69
    :goto_1
    if-eqz v11, :cond_6

    .line 70
    .line 71
    if-eqz v12, :cond_6

    .line 72
    .line 73
    iput-object v4, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->node:Ljava/lang/Object;

    .line 74
    .line 75
    iget-object v0, v0, Lrx/subjects/ReplaySubject$b;->g:Ljava/lang/Throwable;

    .line 76
    .line 77
    if-eqz v0, :cond_5

    .line 78
    .line 79
    invoke-interface {v2, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_5
    invoke-interface {v2}, Ll/bb50;->onCompleted()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_6
    if-eqz v12, :cond_7

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_7
    if-ne v9, v3, :cond_8

    .line 91
    .line 92
    aget-object v4, v8, v9

    .line 93
    .line 94
    check-cast v4, [Ljava/lang/Object;

    .line 95
    .line 96
    move-object v8, v4

    .line 97
    move/from16 v9, v16

    .line 98
    .line 99
    :cond_8
    aget-object v4, v8, v9

    .line 100
    .line 101
    invoke-interface {v2, v4}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    const-wide/16 v11, 0x1

    .line 105
    .line 106
    add-long/2addr v13, v11

    .line 107
    add-int/lit8 v9, v9, 0x1

    .line 108
    .line 109
    add-int/lit8 v10, v10, 0x1

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_9
    const-wide/16 v18, 0x0

    .line 113
    .line 114
    :goto_2
    if-nez v15, :cond_d

    .line 115
    .line 116
    invoke-virtual {v2}, Ll/gcg0;->isUnsubscribed()Z

    .line 117
    .line 118
    .line 119
    move-result v11

    .line 120
    if-eqz v11, :cond_a

    .line 121
    .line 122
    iput-object v4, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->node:Ljava/lang/Object;

    .line 123
    .line 124
    return-void

    .line 125
    :cond_a
    iget-boolean v11, v0, Lrx/subjects/ReplaySubject$b;->f:Z

    .line 126
    .line 127
    iget v12, v0, Lrx/subjects/ReplaySubject$b;->b:I

    .line 128
    .line 129
    if-ne v10, v12, :cond_b

    .line 130
    .line 131
    move/from16 v16, v17

    .line 132
    .line 133
    :cond_b
    if-eqz v11, :cond_d

    .line 134
    .line 135
    if-eqz v16, :cond_d

    .line 136
    .line 137
    iput-object v4, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->node:Ljava/lang/Object;

    .line 138
    .line 139
    iget-object v0, v0, Lrx/subjects/ReplaySubject$b;->g:Ljava/lang/Throwable;

    .line 140
    .line 141
    if-eqz v0, :cond_c

    .line 142
    .line 143
    invoke-interface {v2, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_c
    invoke-interface {v2}, Ll/bb50;->onCompleted()V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_d
    cmp-long v4, v13, v18

    .line 152
    .line 153
    if-eqz v4, :cond_e

    .line 154
    .line 155
    const-wide v11, 0x7fffffffffffffffL

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    cmp-long v4, v6, v11

    .line 161
    .line 162
    if-eqz v4, :cond_e

    .line 163
    .line 164
    iget-object v4, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 165
    .line 166
    invoke-static {v4, v13, v14}, Ll/rc2;->i(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 167
    .line 168
    .line 169
    :cond_e
    iput v10, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->index:I

    .line 170
    .line 171
    iput v9, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->tailIndex:I

    .line 172
    .line 173
    iput-object v8, v1, Lrx/subjects/ReplaySubject$ReplayProducer;->node:Ljava/lang/Object;

    .line 174
    .line 175
    neg-int v4, v5

    .line 176
    invoke-virtual {v1, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    if-nez v5, :cond_1

    .line 181
    .line 182
    :goto_3
    return-void
.end method

.method public complete()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lrx/subjects/ReplaySubject$b;->f:Z

    .line 3
    .line 4
    return-void
.end method

.method public error(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lrx/subjects/ReplaySubject$b;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-object p1, p0, Lrx/subjects/ReplaySubject$b;->g:Ljava/lang/Throwable;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lrx/subjects/ReplaySubject$b;->f:Z

    .line 13
    .line 14
    return-void
.end method

.method public next(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lrx/subjects/ReplaySubject$b;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Lrx/subjects/ReplaySubject$b;->e:I

    .line 7
    .line 8
    iget-object v1, p0, Lrx/subjects/ReplaySubject$b;->d:[Ljava/lang/Object;

    .line 9
    .line 10
    array-length v2, v1

    .line 11
    const/4 v3, 0x1

    .line 12
    sub-int/2addr v2, v3

    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    array-length v2, v1

    .line 16
    new-array v2, v2, [Ljava/lang/Object;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    aput-object p1, v2, v4

    .line 20
    .line 21
    iput v3, p0, Lrx/subjects/ReplaySubject$b;->e:I

    .line 22
    .line 23
    aput-object v2, v1, v0

    .line 24
    .line 25
    iput-object v2, p0, Lrx/subjects/ReplaySubject$b;->d:[Ljava/lang/Object;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    aput-object p1, v1, v0

    .line 29
    .line 30
    add-int/2addr v0, v3

    .line 31
    iput v0, p0, Lrx/subjects/ReplaySubject$b;->e:I

    .line 32
    .line 33
    :goto_0
    iget p1, p0, Lrx/subjects/ReplaySubject$b;->b:I

    .line 34
    .line 35
    add-int/2addr p1, v3

    .line 36
    iput p1, p0, Lrx/subjects/ReplaySubject$b;->b:I

    .line 37
    .line 38
    return-void
.end method
