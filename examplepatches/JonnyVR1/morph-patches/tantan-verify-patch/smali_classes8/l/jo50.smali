.class public final Ll/jo50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jo50$f;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final f:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Lrx/c<",
            "+",
            "Lrx/Notification<",
            "*>;>;",
            "Lrx/c<",
            "*>;>;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final b:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "+",
            "Lrx/Notification<",
            "*>;>;+",
            "Lrx/c<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final c:Z

.field public final d:Z

.field public final e:Ll/f2e0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/jo50$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jo50$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/jo50;->f:Ll/qcj;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lrx/c;Ll/qcj;ZZLl/f2e0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "+",
            "Lrx/Notification<",
            "*>;>;+",
            "Lrx/c<",
            "*>;>;ZZ",
            "Ll/f2e0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jo50;->a:Lrx/c;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jo50;->b:Ll/qcj;

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/jo50;->c:Z

    .line 9
    .line 10
    iput-boolean p4, p0, Ll/jo50;->d:Z

    .line 11
    .line 12
    iput-object p5, p0, Ll/jo50;->e:Ll/f2e0;

    .line 13
    .line 14
    return-void
.end method

.method public static b(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/schedulers/Schedulers;->trampoline()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Ll/jo50;->g(Lrx/c;Ll/f2e0;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static c(Lrx/c;J)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;J)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/schedulers/Schedulers;->trampoline()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, p2, v0}, Ll/jo50;->d(Lrx/c;JLl/f2e0;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static d(Lrx/c;JLl/f2e0;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;J",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    if-ltz v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/jo50$f;

    .line 15
    .line 16
    const-wide/16 v1, 0x1

    .line 17
    .line 18
    sub-long/2addr p1, v1

    .line 19
    invoke-direct {v0, p1, p2}, Ll/jo50$f;-><init>(J)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0, v0, p3}, Ll/jo50;->f(Lrx/c;Ll/qcj;Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string p0, "count >= 0 expected"

    .line 28
    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public static e(Lrx/c;Ll/qcj;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "+",
            "Lrx/Notification<",
            "*>;>;+",
            "Lrx/c<",
            "*>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/jo50;

    .line 2
    .line 3
    const/4 v4, 0x1

    .line 4
    invoke-static {}, Lrx/schedulers/Schedulers;->trampoline()Ll/f2e0;

    .line 5
    .line 6
    .line 7
    move-result-object v5

    .line 8
    const/4 v3, 0x0

    .line 9
    move-object v1, p0

    .line 10
    move-object v2, p1

    .line 11
    invoke-direct/range {v0 .. v5}, Ll/jo50;-><init>(Lrx/c;Ll/qcj;ZZLl/f2e0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static f(Lrx/c;Ll/qcj;Ll/f2e0;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "+",
            "Lrx/Notification<",
            "*>;>;+",
            "Lrx/c<",
            "*>;>;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/jo50;

    .line 2
    .line 3
    const/4 v3, 0x0

    .line 4
    const/4 v4, 0x1

    .line 5
    move-object v1, p0

    .line 6
    move-object v2, p1

    .line 7
    move-object v5, p2

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/jo50;-><init>(Lrx/c;Ll/qcj;ZZLl/f2e0;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static g(Lrx/c;Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/jo50;->f:Ll/qcj;

    .line 2
    .line 3
    invoke-static {p0, v0, p1}, Ll/jo50;->f(Lrx/c;Ll/qcj;Ll/f2e0;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static h(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/jo50;->f:Ll/qcj;

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/jo50;->j(Lrx/c;Ll/qcj;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static i(Lrx/c;J)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;J)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Ll/jo50$f;

    .line 11
    .line 12
    invoke-direct {v0, p1, p2}, Ll/jo50$f;-><init>(J)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/jo50;->j(Lrx/c;Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_1
    const-string p0, "count >= 0 expected"

    .line 21
    .line 22
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public static j(Lrx/c;Ll/qcj;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "+",
            "Lrx/Notification<",
            "*>;>;+",
            "Lrx/c<",
            "*>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/jo50;

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    invoke-static {}, Lrx/schedulers/Schedulers;->trampoline()Ll/f2e0;

    .line 5
    .line 6
    .line 7
    move-result-object v5

    .line 8
    const/4 v3, 0x1

    .line 9
    move-object v1, p0

    .line 10
    move-object v2, p1

    .line 11
    invoke-direct/range {v0 .. v5}, Ll/jo50;-><init>(Lrx/c;Ll/qcj;ZZLl/f2e0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static k(Lrx/c;Ll/qcj;Ll/f2e0;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "+",
            "Lrx/Notification<",
            "*>;>;+",
            "Lrx/c<",
            "*>;>;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/jo50;

    .line 2
    .line 3
    const/4 v3, 0x1

    .line 4
    const/4 v4, 0x0

    .line 5
    move-object v1, p0

    .line 6
    move-object v2, p1

    .line 7
    move-object v5, p2

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/jo50;-><init>(Lrx/c;Ll/qcj;ZZLl/f2e0;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    new-instance v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {v4, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    .line 8
    .line 9
    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/jo50;->e:Ll/f2e0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    new-instance v11, Ll/wqe0;

    .line 22
    .line 23
    invoke-direct {v11}, Ll/wqe0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v11}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 30
    .line 31
    .line 32
    move-result-object v8

    .line 33
    invoke-static {}, Ll/icg0;->a()Ll/gcg0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v8, v1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    new-instance v3, Ll/xk90;

    .line 41
    .line 42
    invoke-direct {v3}, Ll/xk90;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v6, Ll/jo50$b;

    .line 46
    .line 47
    move-object v7, p1

    .line 48
    move-object v10, v2

    .line 49
    move-object v9, v3

    .line 50
    move-object v5, v6

    .line 51
    move-object v6, p0

    .line 52
    invoke-direct/range {v5 .. v11}, Ll/jo50$b;-><init>(Ll/jo50;Ll/gcg0;Lrx/subjects/a;Ll/xk90;Ljava/util/concurrent/atomic/AtomicLong;Ll/wqe0;)V

    .line 53
    .line 54
    .line 55
    move-object v1, v6

    .line 56
    move-object v3, v7

    .line 57
    move-object v6, v5

    .line 58
    iget-object p0, v1, Ll/jo50;->b:Ll/qcj;

    .line 59
    .line 60
    new-instance p1, Ll/jo50$c;

    .line 61
    .line 62
    invoke-direct {p1, v1}, Ll/jo50$c;-><init>(Ll/jo50;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v8, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Lrx/c;

    .line 74
    .line 75
    move-object v5, v0

    .line 76
    new-instance v0, Ll/jo50$d;

    .line 77
    .line 78
    move-object v7, v4

    .line 79
    move-object v4, v2

    .line 80
    move-object v2, p0

    .line 81
    invoke-direct/range {v0 .. v7}, Ll/jo50$d;-><init>(Ll/jo50;Lrx/c;Ll/gcg0;Ljava/util/concurrent/atomic/AtomicLong;Ll/f2e0$a;Ll/x20;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 82
    .line 83
    .line 84
    move-object v2, v4

    .line 85
    move-object v4, v7

    .line 86
    move-object v7, v3

    .line 87
    invoke-virtual {v5, v0}, Ll/f2e0$a;->b(Ll/x20;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    new-instance v0, Ll/jo50$e;

    .line 91
    .line 92
    move-object v3, v9

    .line 93
    invoke-direct/range {v0 .. v6}, Ll/jo50$e;-><init>(Ll/jo50;Ljava/util/concurrent/atomic/AtomicLong;Ll/xk90;Ljava/util/concurrent/atomic/AtomicBoolean;Ll/f2e0$a;Ll/x20;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v7, v0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jo50;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
