.class public final Ll/fo50$a$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fo50$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TT1;>;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/fo50$a;


# direct methods
.method public constructor <init>(Ll/fo50$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/fo50$a;->d:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    iput-boolean v2, v1, Ll/fo50$a;->i:Z

    .line 10
    .line 11
    iget-boolean v1, v1, Ll/fo50$a;->j:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    new-instance v1, Ljava/util/ArrayList;

    .line 16
    .line 17
    iget-object v2, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 18
    .line 19
    iget-object v2, v2, Ll/fo50$a;->g:Ljava/util/Map;

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 29
    .line 30
    iget-object v2, v2, Ll/fo50$a;->g:Ljava/util/Map;

    .line 31
    .line 32
    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 36
    .line 37
    iget-object v2, v2, Ll/fo50$a;->h:Ljava/util/Map;

    .line 38
    .line 39
    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    const/4 v1, 0x0

    .line 46
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    iget-object p0, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Ll/fo50$a;->a(Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    throw p0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fo50$a;->b(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT1;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/yqe0;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Ll/yqe0;-><init>(Ll/bb50;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 11
    .line 12
    iget-object v2, v2, Ll/fo50$a;->d:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    :try_start_1
    iget-object v3, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 16
    .line 17
    iget v4, v3, Ll/fo50$a;->e:I

    .line 18
    .line 19
    add-int/lit8 v5, v4, 0x1

    .line 20
    .line 21
    iput v5, v3, Ll/fo50$a;->e:I

    .line 22
    .line 23
    iget-object v3, v3, Ll/fo50$a;->g:Ljava/util/Map;

    .line 24
    .line 25
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-interface {v3, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 33
    :try_start_2
    new-instance v2, Ll/fo50$b;

    .line 34
    .line 35
    iget-object v3, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 36
    .line 37
    iget-object v3, v3, Ll/fo50$a;->a:Lrx/subscriptions/RefCountSubscription;

    .line 38
    .line 39
    invoke-direct {v2, v0, v3}, Ll/fo50$b;-><init>(Lrx/c;Lrx/subscriptions/RefCountSubscription;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v2}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v2, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 47
    .line 48
    iget-object v2, v2, Ll/fo50$a;->k:Ll/fo50;

    .line 49
    .line 50
    iget-object v2, v2, Ll/fo50;->c:Ll/qcj;

    .line 51
    .line 52
    invoke-interface {v2, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lrx/c;

    .line 57
    .line 58
    new-instance v3, Ll/fo50$a$a;

    .line 59
    .line 60
    iget-object v5, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 61
    .line 62
    invoke-direct {v3, v5, v4}, Ll/fo50$a$a;-><init>(Ll/fo50$a;I)V

    .line 63
    .line 64
    .line 65
    iget-object v4, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 66
    .line 67
    iget-object v4, v4, Ll/fo50$a;->c:Ll/ft5;

    .line 68
    .line 69
    invoke-virtual {v4, v3}, Ll/ft5;->a(Ll/kcg0;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2, v3}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 76
    .line 77
    iget-object v2, v2, Ll/fo50$a;->k:Ll/fo50;

    .line 78
    .line 79
    iget-object v2, v2, Ll/fo50;->e:Ll/rcj;

    .line 80
    .line 81
    invoke-interface {v2, p1, v0}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object v0, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 86
    .line 87
    iget-object v0, v0, Ll/fo50$a;->d:Ljava/lang/Object;

    .line 88
    .line 89
    monitor-enter v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 90
    :try_start_3
    new-instance v2, Ljava/util/ArrayList;

    .line 91
    .line 92
    iget-object v3, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 93
    .line 94
    iget-object v3, v3, Ll/fo50$a;->h:Ljava/util/Map;

    .line 95
    .line 96
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 101
    .line 102
    .line 103
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 104
    :try_start_4
    iget-object v0, p0, Ll/fo50$a$b;->e:Ll/fo50$a;

    .line 105
    .line 106
    iget-object v0, v0, Ll/fo50$a;->b:Ll/gcg0;

    .line 107
    .line 108
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_0

    .line 120
    .line 121
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-interface {v1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 126
    .line 127
    .line 128
    goto :goto_0

    .line 129
    :catchall_0
    move-exception p1

    .line 130
    goto :goto_1

    .line 131
    :cond_0
    return-void

    .line 132
    :catchall_1
    move-exception p1

    .line 133
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 134
    :try_start_6
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 135
    :catchall_2
    move-exception p1

    .line 136
    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 137
    :try_start_8
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 138
    :goto_1
    invoke-static {p1, p0}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method
