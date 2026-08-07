.class public final Ll/soi0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/f2e0;


# direct methods
.method public static a(Ljava/util/concurrent/Callable;)Ll/jni0;
    .locals 1
    .param p0    # Ljava/util/concurrent/Callable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;)",
            "Ll/jni0<",
            "TTResult;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/soi0;->f()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0}, Ll/soi0;->b(Ll/f2e0;Ljava/util/concurrent/Callable;)Ll/jni0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static b(Ll/f2e0;Ljava/util/concurrent/Callable;)Ll/jni0;
    .locals 1
    .param p1    # Ljava/util/concurrent/Callable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/f2e0;",
            "Ljava/util/concurrent/Callable<",
            "TTResult;>;)",
            "Ll/jni0<",
            "TTResult;>;"
        }
    .end annotation

    .line 1
    const-string v0, "Callback must not be null"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/soi0;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/enc0;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/enc0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Ll/enc0;->x(Lrx/c;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Ll/anc0;

    .line 23
    .line 24
    invoke-direct {p1, v0}, Ll/anc0;-><init>(Ll/enc0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/f2e0$a;->b(Ll/x20;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public static c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 5
    .line 6
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw p0
.end method

.method public static d(Ljava/lang/Exception;)Ll/jni0;
    .locals 1
    .param p0    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Exception;",
            ")",
            "Ll/jni0<",
            "TTResult;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/enc0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/enc0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/enc0;->v(Ljava/lang/Exception;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static e(Ljava/lang/Object;)Ll/jni0;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(TTResult;)",
            "Ll/jni0<",
            "TTResult;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/enc0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/enc0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/enc0;->w(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static f()Ll/f2e0;
    .locals 1

    .line 1
    sget-object v0, Ll/soi0;->a:Ll/f2e0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/rx/rxthread/FastIoScheduler;->b:Ll/f2e0;

    .line 6
    .line 7
    sput-object v0, Ll/soi0;->a:Ll/f2e0;

    .line 8
    .line 9
    :cond_0
    sget-object v0, Ll/soi0;->a:Ll/f2e0;

    .line 10
    .line 11
    return-object v0
.end method

.method public static g(Ll/f2e0;Ljava/util/Collection;)Ll/jni0;
    .locals 5
    .param p1    # Ljava/util/Collection;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f2e0;",
            "Ljava/util/Collection<",
            "+",
            "Ll/jni0<",
            "*>;>;)",
            "Ll/jni0<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_3

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string p0, "null tasks are not accepted"

    .line 28
    .line 29
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-object v0

    .line 33
    :cond_1
    new-instance v1, Ll/enc0;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/enc0;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v2, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Ll/jni0;

    .line 62
    .line 63
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    new-instance v4, Ll/roi0;

    .line 67
    .line 68
    invoke-direct {v4, v3}, Ll/roi0;-><init>(Ll/jni0;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v4}, Lrx/b;->e(Ljava/util/concurrent/Callable;)Lrx/b;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    invoke-static {v2}, Lrx/b;->g(Ljava/lang/Iterable;)Lrx/b;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p1, v0}, Lrx/b;->b(Lrx/c;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {v1, p1}, Ll/enc0;->x(Lrx/c;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    new-instance p1, Ll/anc0;

    .line 102
    .line 103
    invoke-direct {p1, v1}, Ll/anc0;-><init>(Ll/enc0;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, p1}, Ll/f2e0$a;->b(Ll/x20;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    return-object v1

    .line 110
    :cond_3
    invoke-static {v0}, Ll/soi0;->e(Ljava/lang/Object;)Ll/jni0;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0
.end method

.method public static h(Ll/f2e0;Ljava/util/Collection;)Ll/jni0;
    .locals 1
    .param p1    # Ljava/util/Collection;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f2e0;",
            "Ljava/util/Collection<",
            "+",
            "Ll/jni0<",
            "*>;>;)",
            "Ll/jni0<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/soi0;->g(Ll/f2e0;Ljava/util/Collection;)Ll/jni0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-static {p0}, Ll/soi0;->e(Ljava/lang/Object;)Ll/jni0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static varargs i(Ll/f2e0;[Ll/jni0;)Ll/jni0;
    .locals 1
    .param p1    # [Ll/jni0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f2e0;",
            "[",
            "Ll/jni0<",
            "*>;)",
            "Ll/jni0<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p0, p1}, Ll/soi0;->h(Ll/f2e0;Ljava/util/Collection;)Ll/jni0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    invoke-static {p0}, Ll/soi0;->e(Ljava/lang/Object;)Ll/jni0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
