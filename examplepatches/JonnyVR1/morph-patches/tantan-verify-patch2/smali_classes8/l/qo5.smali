.class public final Ll/qo5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/b$h;


# instance fields
.field public final a:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qo5;->a:Ljava/lang/Iterable;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lrx/b$j;)V
    .locals 9

    .line 1
    new-instance v2, Ll/ft5;

    .line 2
    .line 3
    invoke-direct {v2}, Ll/ft5;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, v2}, Lrx/b$j;->onSubscribe(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    :try_start_0
    iget-object v0, p0, Ll/qo5;->a:Ljava/lang/Iterable;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 15
    if-nez v6, :cond_0

    .line 16
    .line 17
    new-instance p0, Ljava/lang/NullPointerException;

    .line 18
    .line 19
    const-string v0, "The source iterator returned is null"

    .line 20
    .line 21
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1, p0}, Lrx/b$j;->onError(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    new-instance v5, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 29
    .line 30
    const/4 v7, 0x1

    .line 31
    invoke-direct {v5, v7}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 32
    .line 33
    .line 34
    new-instance v3, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 35
    .line 36
    invoke-direct {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-virtual {v2}, Ll/ft5;->isUnsubscribed()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    goto/16 :goto_1

    .line 46
    .line 47
    :cond_1
    const/4 v1, 0x0

    .line 48
    :try_start_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_9

    .line 59
    .line 60
    invoke-virtual {v3, v1, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_9

    .line 65
    .line 66
    invoke-interface {p1}, Lrx/b$j;->onCompleted()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    invoke-virtual {v2}, Ll/ft5;->isUnsubscribed()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    :try_start_2
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    move-object v8, v0

    .line 82
    check-cast v8, Lrx/b;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 83
    .line 84
    invoke-virtual {v2}, Ll/ft5;->isUnsubscribed()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_4
    if-nez v8, :cond_6

    .line 92
    .line 93
    invoke-virtual {v2}, Ll/ft5;->unsubscribe()V

    .line 94
    .line 95
    .line 96
    new-instance p0, Ljava/lang/NullPointerException;

    .line 97
    .line 98
    const-string v0, "A completable source is null"

    .line 99
    .line 100
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v3, v1, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_5

    .line 108
    .line 109
    invoke-interface {p1, p0}, Lrx/b$j;->onError(Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_5
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_6
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 118
    .line 119
    .line 120
    new-instance v0, Ll/qo5$a;

    .line 121
    .line 122
    move-object v1, p0

    .line 123
    move-object v4, p1

    .line 124
    invoke-direct/range {v0 .. v5}, Ll/qo5$a;-><init>(Ll/qo5;Ll/ft5;Ljava/util/concurrent/atomic/AtomicBoolean;Lrx/b$j;Ljava/util/concurrent/atomic/AtomicInteger;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v8, v0}, Lrx/b;->n(Lrx/b$j;)V

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :catchall_0
    move-exception v0

    .line 132
    move-object v4, p1

    .line 133
    move-object p0, v0

    .line 134
    invoke-virtual {v2}, Ll/ft5;->unsubscribe()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v3, v1, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_7

    .line 142
    .line 143
    invoke-interface {v4, p0}, Lrx/b$j;->onError(Ljava/lang/Throwable;)V

    .line 144
    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_7
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :catchall_1
    move-exception v0

    .line 152
    move-object v4, p1

    .line 153
    move-object p0, v0

    .line 154
    invoke-virtual {v2}, Ll/ft5;->unsubscribe()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v3, v1, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eqz p1, :cond_8

    .line 162
    .line 163
    invoke-interface {v4, p0}, Lrx/b$j;->onError(Ljava/lang/Throwable;)V

    .line 164
    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_8
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 168
    .line 169
    .line 170
    :cond_9
    :goto_1
    return-void

    .line 171
    :catchall_2
    move-exception v0

    .line 172
    move-object v4, p1

    .line 173
    move-object p0, v0

    .line 174
    invoke-interface {v4, p0}, Lrx/b$j;->onError(Ljava/lang/Throwable;)V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/b$j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qo5;->a(Lrx/b$j;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
