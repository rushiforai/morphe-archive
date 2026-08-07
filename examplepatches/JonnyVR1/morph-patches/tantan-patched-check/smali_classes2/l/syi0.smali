.class public Ll/syi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/syi0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final b:I

.field public c:I

.field public final d:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Landroid/util/Pair<",
            "Ll/z06<",
            "TT;>;",
            "Ll/yk90;",
            ">;>;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(ILjava/util/concurrent/Executor;Ll/wk90;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/concurrent/Executor;",
            "Ll/wk90<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/syi0;->b:I

    .line 5
    .line 6
    invoke-static {p2}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Ljava/util/concurrent/Executor;

    .line 11
    .line 12
    iput-object p1, p0, Ll/syi0;->e:Ljava/util/concurrent/Executor;

    .line 13
    .line 14
    invoke-static {p3}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ll/wk90;

    .line 19
    .line 20
    iput-object p1, p0, Ll/syi0;->a:Ll/wk90;

    .line 21
    .line 22
    new-instance p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/syi0;->d:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    iput p1, p0, Ll/syi0;->c:I

    .line 31
    .line 32
    return-void
.end method

.method public static bridge synthetic c(Ll/syi0;)Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/syi0;->e:Ljava/util/concurrent/Executor;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/syi0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/syi0;->c:I

    return p0
.end method

.method public static bridge synthetic e(Ll/syi0;)Ljava/util/concurrent/ConcurrentLinkedQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/syi0;->d:Ljava/util/concurrent/ConcurrentLinkedQueue;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/syi0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/syi0;->c:I

    return-void
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "TT;>;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "ThrottlingProducer"

    .line 6
    .line 7
    invoke-interface {v0, p2, v1}, Ll/cl90;->d(Ll/yk90;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    monitor-enter p0

    .line 11
    :try_start_0
    iget v0, p0, Ll/syi0;->c:I

    .line 12
    .line 13
    iget v1, p0, Ll/syi0;->b:I

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    if-lt v0, v1, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/syi0;->d:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 19
    .line 20
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p1

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    add-int/2addr v0, v2

    .line 31
    iput v0, p0, Ll/syi0;->c:I

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2}, Ll/syi0;->g(Ll/z06;Ll/yk90;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void

    .line 41
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    throw p1
.end method

.method public g(Ll/z06;Ll/yk90;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "TT;>;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "ThrottlingProducer"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {v0, p2, v1, v2}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/syi0;->a:Ll/wk90;

    .line 12
    .line 13
    new-instance v1, Ll/syi0$a;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1, v2}, Ll/syi0$a;-><init>(Ll/syi0;Ll/z06;Ll/tyi0;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, v1, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
