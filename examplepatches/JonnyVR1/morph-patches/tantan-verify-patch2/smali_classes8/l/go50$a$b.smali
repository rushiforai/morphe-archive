.class public final Ll/go50$a$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/go50$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/go50$a$b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TTRight;>;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/go50$a;


# direct methods
.method public constructor <init>(Ll/go50$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public g(ILl/kcg0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/go50$a;->c:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 7
    .line 8
    iget-object v1, v1, Ll/go50$a;->i:Ljava/util/Map;

    .line 9
    .line 10
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 21
    .line 22
    iget-object p1, p1, Ll/go50$a;->i:Ljava/util/Map;

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 31
    .line 32
    iget-boolean p1, p1, Ll/go50$a;->g:Z

    .line 33
    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    const/4 p1, 0x0

    .line 41
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    iget-object v0, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    iget-object p1, v0, Ll/go50$a;->b:Ll/gcg0;

    .line 47
    .line 48
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 52
    .line 53
    iget-object p0, p0, Ll/go50$a;->b:Ll/gcg0;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    iget-object p0, v0, Ll/go50$a;->a:Ll/ft5;

    .line 60
    .line 61
    invoke-virtual {p0, p2}, Ll/ft5;->d(Ll/kcg0;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    throw p0
.end method

.method public onCompleted()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/go50$a;->c:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    iput-boolean v2, v1, Ll/go50$a;->g:Z

    .line 10
    .line 11
    iget-boolean v3, v1, Ll/go50$a;->d:Z

    .line 12
    .line 13
    if-nez v3, :cond_1

    .line 14
    .line 15
    iget-object v1, v1, Ll/go50$a;->i:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v2, 0x0

    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    iget-object v0, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 30
    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    iget-object v0, v0, Ll/go50$a;->b:Ll/gcg0;

    .line 34
    .line 35
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 39
    .line 40
    iget-object p0, p0, Ll/go50$a;->b:Ll/gcg0;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    iget-object v0, v0, Ll/go50$a;->a:Ll/ft5;

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ll/ft5;->d(Ll/kcg0;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    throw p0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/go50$a;->b:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 9
    .line 10
    iget-object p0, p0, Ll/go50$a;->b:Ll/gcg0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTRight;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/go50$a;->c:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 7
    .line 8
    iget v2, v1, Ll/go50$a;->h:I

    .line 9
    .line 10
    add-int/lit8 v3, v2, 0x1

    .line 11
    .line 12
    iput v3, v1, Ll/go50$a;->h:I

    .line 13
    .line 14
    iget-object v1, v1, Ll/go50$a;->i:Ljava/util/Map;

    .line 15
    .line 16
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-interface {v1, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 24
    .line 25
    iget v1, v1, Ll/go50$a;->e:I

    .line 26
    .line 27
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 28
    new-instance v0, Ll/wqe0;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/wqe0;-><init>()V

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 34
    .line 35
    iget-object v3, v3, Ll/go50$a;->a:Ll/ft5;

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 38
    .line 39
    .line 40
    :try_start_1
    iget-object v0, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 41
    .line 42
    iget-object v0, v0, Ll/go50$a;->j:Ll/go50;

    .line 43
    .line 44
    iget-object v0, v0, Ll/go50;->d:Ll/qcj;

    .line 45
    .line 46
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    new-instance v3, Ll/go50$a$b$a;

    .line 53
    .line 54
    invoke-direct {v3, p0, v2}, Ll/go50$a$b$a;-><init>(Ll/go50$a$b;I)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 58
    .line 59
    iget-object v2, v2, Ll/go50$a;->a:Ll/ft5;

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Ll/ft5;->a(Ll/kcg0;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v3}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    new-instance v0, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 73
    .line 74
    iget-object v2, v2, Ll/go50$a;->c:Ljava/lang/Object;

    .line 75
    .line 76
    monitor-enter v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 77
    :try_start_2
    iget-object v3, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 78
    .line 79
    iget-object v3, v3, Ll/go50$a;->f:Ljava/util/Map;

    .line 80
    .line 81
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    if-eqz v4, :cond_1

    .line 94
    .line 95
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    check-cast v4, Ljava/util/Map$Entry;

    .line 100
    .line 101
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    check-cast v5, Ljava/lang/Integer;

    .line 106
    .line 107
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 108
    .line 109
    .line 110
    move-result v5

    .line 111
    if-ge v5, v1, :cond_0

    .line 112
    .line 113
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :catchall_0
    move-exception p1

    .line 122
    goto :goto_2

    .line 123
    :cond_1
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 124
    :try_start_3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-eqz v1, :cond_2

    .line 133
    .line 134
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    iget-object v2, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 139
    .line 140
    iget-object v2, v2, Ll/go50$a;->j:Ll/go50;

    .line 141
    .line 142
    iget-object v2, v2, Ll/go50;->e:Ll/rcj;

    .line 143
    .line 144
    invoke-interface {v2, v1, p1}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iget-object v2, p0, Ll/go50$a$b;->e:Ll/go50$a;

    .line 149
    .line 150
    iget-object v2, v2, Ll/go50$a;->b:Ll/gcg0;

    .line 151
    .line 152
    invoke-interface {v2, v1}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 153
    .line 154
    .line 155
    goto :goto_1

    .line 156
    :catchall_1
    move-exception p1

    .line 157
    goto :goto_3

    .line 158
    :cond_2
    return-void

    .line 159
    :goto_2
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 160
    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 161
    :goto_3
    invoke-static {p1, p0}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :catchall_2
    move-exception p0

    .line 166
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 167
    throw p0
.end method
