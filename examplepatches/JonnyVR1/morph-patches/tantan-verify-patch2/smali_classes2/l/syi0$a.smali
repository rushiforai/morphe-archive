.class public Ll/syi0$a;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/syi0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pud<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic c:Ll/syi0;


# direct methods
.method public constructor <init>(Ll/syi0;Ll/z06;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/syi0$a;->c:Ll/syi0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/pud;-><init>(Ll/z06;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/syi0;Ll/z06;Ll/tyi0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2}, Ll/syi0$a;-><init>(Ll/syi0;Ll/z06;)V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/z06;->a()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/syi0$a;->p()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p1}, Ll/z06;->onFailure(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/syi0$a;->p()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h(Ljava/lang/Object;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2}, Ll/ji2;->d(I)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/syi0$a;->p()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final p()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/syi0$a;->c:Ll/syi0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/syi0$a;->c:Ll/syi0;

    .line 5
    .line 6
    invoke-static {v1}, Ll/syi0;->e(Ll/syi0;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Landroid/util/Pair;

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    iget-object v2, p0, Ll/syi0$a;->c:Ll/syi0;

    .line 19
    .line 20
    invoke-static {v2}, Ll/syi0;->d(Ll/syi0;)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    add-int/lit8 v3, v3, -0x1

    .line 25
    .line 26
    invoke-static {v2, v3}, Ll/syi0;->f(Ll/syi0;I)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/syi0$a;->c:Ll/syi0;

    .line 36
    .line 37
    invoke-static {v0}, Ll/syi0;->c(Ll/syi0;)Ljava/util/concurrent/Executor;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v2, Ll/syi0$a$a;

    .line 42
    .line 43
    invoke-direct {v2, p0, v1}, Ll/syi0$a$a;-><init>(Ll/syi0$a;Landroid/util/Pair;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void

    .line 50
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    throw p0
.end method
