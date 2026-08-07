.class public final Ll/fo50$a$d;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fo50$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TT2;>;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/fo50$a;


# direct methods
.method public constructor <init>(Ll/fo50$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

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
    iget-object v0, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/fo50$a;->d:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    iput-boolean v2, v1, Ll/fo50$a;->j:Z

    .line 10
    .line 11
    iget-boolean v1, v1, Ll/fo50$a;->i:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    new-instance v1, Ljava/util/ArrayList;

    .line 16
    .line 17
    iget-object v2, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

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
    iget-object v2, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

    .line 29
    .line 30
    iget-object v2, v2, Ll/fo50$a;->g:Ljava/util/Map;

    .line 31
    .line 32
    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

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
    iget-object p0, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

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
    iget-object p0, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fo50$a;->b(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT2;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/fo50$a;->d:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    :try_start_1
    iget-object v1, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

    .line 7
    .line 8
    iget v2, v1, Ll/fo50$a;->f:I

    .line 9
    .line 10
    add-int/lit8 v3, v2, 0x1

    .line 11
    .line 12
    iput v3, v1, Ll/fo50$a;->f:I

    .line 13
    .line 14
    iget-object v1, v1, Ll/fo50$a;->h:Ljava/util/Map;

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
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 24
    :try_start_2
    iget-object v0, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

    .line 25
    .line 26
    iget-object v0, v0, Ll/fo50$a;->k:Ll/fo50;

    .line 27
    .line 28
    iget-object v0, v0, Ll/fo50;->d:Ll/qcj;

    .line 29
    .line 30
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lrx/c;

    .line 35
    .line 36
    new-instance v1, Ll/fo50$a$c;

    .line 37
    .line 38
    iget-object v3, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

    .line 39
    .line 40
    invoke-direct {v1, v3, v2}, Ll/fo50$a$c;-><init>(Ll/fo50$a;I)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

    .line 44
    .line 45
    iget-object v2, v2, Ll/fo50$a;->c:Ll/ft5;

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
    iget-object v0, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

    .line 54
    .line 55
    iget-object v0, v0, Ll/fo50$a;->d:Ljava/lang/Object;

    .line 56
    .line 57
    monitor-enter v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 58
    :try_start_3
    new-instance v1, Ljava/util/ArrayList;

    .line 59
    .line 60
    iget-object v2, p0, Ll/fo50$a$d;->e:Ll/fo50$a;

    .line 61
    .line 62
    iget-object v2, v2, Ll/fo50$a;->g:Ljava/util/Map;

    .line 63
    .line 64
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 69
    .line 70
    .line 71
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 72
    :try_start_4
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_0

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Ll/bb50;

    .line 87
    .line 88
    invoke-interface {v1, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :catchall_0
    move-exception p1

    .line 93
    goto :goto_1

    .line 94
    :cond_0
    return-void

    .line 95
    :catchall_1
    move-exception p1

    .line 96
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 97
    :try_start_6
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 98
    :catchall_2
    move-exception p1

    .line 99
    :try_start_7
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 100
    :try_start_8
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 101
    :goto_1
    invoke-static {p1, p0}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method
