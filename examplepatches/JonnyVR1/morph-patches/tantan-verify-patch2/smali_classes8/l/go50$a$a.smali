.class public final Ll/go50$a$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/go50$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/go50$a$a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TT",
        "Left;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/go50$a;


# direct methods
.method public constructor <init>(Ll/go50$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/go50$a$a;->e:Ll/go50$a;

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
    iget-object v0, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/go50$a;->c:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 7
    .line 8
    iget-object v1, v1, Ll/go50$a;->f:Ljava/util/Map;

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
    iget-object p1, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 21
    .line 22
    iget-object p1, p1, Ll/go50$a;->f:Ljava/util/Map;

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
    iget-object p1, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 31
    .line 32
    iget-boolean p1, p1, Ll/go50$a;->d:Z

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
    iget-object v0, p0, Ll/go50$a$a;->e:Ll/go50$a;

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
    iget-object p0, p0, Ll/go50$a$a;->e:Ll/go50$a;

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
    iget-object v0, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/go50$a;->c:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    iput-boolean v2, v1, Ll/go50$a;->d:Z

    .line 10
    .line 11
    iget-boolean v3, v1, Ll/go50$a;->g:Z

    .line 12
    .line 13
    if-nez v3, :cond_1

    .line 14
    .line 15
    iget-object v1, v1, Ll/go50$a;->f:Ljava/util/Map;

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
    iget-object v0, p0, Ll/go50$a$a;->e:Ll/go50$a;

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
    iget-object p0, p0, Ll/go50$a$a;->e:Ll/go50$a;

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
    iget-object v0, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/go50$a;->b:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/go50$a$a;->e:Ll/go50$a;

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
            "(TT",
            "Left;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/go50$a;->c:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 7
    .line 8
    iget v2, v1, Ll/go50$a;->e:I

    .line 9
    .line 10
    add-int/lit8 v3, v2, 0x1

    .line 11
    .line 12
    iput v3, v1, Ll/go50$a;->e:I

    .line 13
    .line 14
    iget-object v1, v1, Ll/go50$a;->f:Ljava/util/Map;

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
    iget-object v1, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 24
    .line 25
    iget v3, v1, Ll/go50$a;->h:I

    .line 26
    .line 27
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 28
    :try_start_1
    iget-object v0, v1, Ll/go50$a;->j:Ll/go50;

    .line 29
    .line 30
    iget-object v0, v0, Ll/go50;->c:Ll/qcj;

    .line 31
    .line 32
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lrx/c;

    .line 37
    .line 38
    new-instance v1, Ll/go50$a$a$a;

    .line 39
    .line 40
    invoke-direct {v1, p0, v2}, Ll/go50$a$a$a;-><init>(Ll/go50$a$a;I)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 44
    .line 45
    iget-object v2, v2, Ll/go50$a;->a:Ll/ft5;

    .line 46
    .line 47
    invoke-virtual {v2, v1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    new-instance v0, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 59
    .line 60
    iget-object v1, v1, Ll/go50$a;->c:Ljava/lang/Object;

    .line 61
    .line 62
    monitor-enter v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 63
    :try_start_2
    iget-object v2, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 64
    .line 65
    iget-object v2, v2, Ll/go50$a;->i:Ljava/util/Map;

    .line 66
    .line 67
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-eqz v4, :cond_1

    .line 80
    .line 81
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Ljava/util/Map$Entry;

    .line 86
    .line 87
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    check-cast v5, Ljava/lang/Integer;

    .line 92
    .line 93
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    if-ge v5, v3, :cond_0

    .line 98
    .line 99
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :catchall_0
    move-exception p1

    .line 108
    goto :goto_2

    .line 109
    :cond_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 110
    :try_start_3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_2

    .line 119
    .line 120
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iget-object v2, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 125
    .line 126
    iget-object v2, v2, Ll/go50$a;->j:Ll/go50;

    .line 127
    .line 128
    iget-object v2, v2, Ll/go50;->e:Ll/rcj;

    .line 129
    .line 130
    invoke-interface {v2, p1, v1}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    iget-object v2, p0, Ll/go50$a$a;->e:Ll/go50$a;

    .line 135
    .line 136
    iget-object v2, v2, Ll/go50$a;->b:Ll/gcg0;

    .line 137
    .line 138
    invoke-interface {v2, v1}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 139
    .line 140
    .line 141
    goto :goto_1

    .line 142
    :catchall_1
    move-exception p1

    .line 143
    goto :goto_3

    .line 144
    :cond_2
    return-void

    .line 145
    :goto_2
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 146
    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 147
    :goto_3
    invoke-static {p1, p0}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :catchall_2
    move-exception p0

    .line 152
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 153
    throw p0
.end method
