.class public Ll/t660;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/String; = "l.t660"

.field public static b:Ljava/util/concurrent/ExecutorService;

.field public static c:Ljava/util/concurrent/ExecutorService;

.field public static d:Ll/vpl;

.field public static e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/concurrent/Future;",
            ">;"
        }
    .end annotation
.end field

.field public static f:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/t660;->b:Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/t660;->c:Ljava/util/concurrent/ExecutorService;

    .line 12
    .line 13
    invoke-static {}, Ll/i1c;->e()Ll/i1c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll/t660;->d:Ll/vpl;

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    sput-object v0, Ll/t660;->e:Ljava/util/List;

    .line 25
    .line 26
    const-wide/16 v0, 0x1f4

    .line 27
    .line 28
    sput-wide v0, Ll/t660;->f:J

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/t660;->r(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b()Ll/vpl;
    .locals 1

    .line 1
    sget-object v0, Ll/t660;->d:Ll/vpl;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic c()V
    .locals 0

    .line 1
    invoke-static {}, Ll/t660;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/t660;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic e()V
    .locals 0

    .line 1
    invoke-static {}, Ll/t660;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f(Ljava/lang/String;I)Ljava/lang/Runnable;
    .locals 1

    .line 1
    new-instance v0, Ll/t660$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/t660$b;-><init>(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static g(Ljava/lang/String;I)Ljava/lang/Runnable;
    .locals 1

    .line 1
    new-instance v0, Ll/t660$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/t660$a;-><init>(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static h(I)Ljava/lang/Runnable;
    .locals 1

    .line 1
    new-instance v0, Ll/t660$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/t660$c;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static i()V
    .locals 2

    .line 1
    invoke-static {}, Ll/v11;->c()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/t660;->e:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/util/concurrent/Future;

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/concurrent/Future;->isDone()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-void
.end method

.method public static j(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    sget-object v0, Ll/t660;->c:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Ll/t660$e;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/t660$e;-><init>(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object v0, Ll/t660;->e:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static k(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    sget-object v0, Ll/t660;->b:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Ll/t660$d;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/t660$d;-><init>(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object v0, Ll/t660;->e:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static l()V
    .locals 4

    .line 1
    invoke-static {}, Ll/v11;->c()V

    .line 2
    .line 3
    .line 4
    sget-wide v0, Ll/t660;->f:J

    .line 5
    .line 6
    const-wide/16 v2, 0x7d00

    .line 7
    .line 8
    cmp-long v2, v0, v2

    .line 9
    .line 10
    if-ltz v2, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/t660;->n()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-wide/16 v2, 0x2

    .line 17
    .line 18
    mul-long/2addr v0, v2

    .line 19
    sput-wide v0, Ll/t660;->f:J

    .line 20
    .line 21
    invoke-static {}, Ll/t660;->o()V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x32

    .line 25
    .line 26
    invoke-static {v0}, Ll/t660;->h(I)Ljava/lang/Runnable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Ll/t660;->j(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static m()V
    .locals 3

    .line 1
    invoke-static {}, Ll/r660;->e()Ll/r660;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-wide v1, Ll/t660;->f:J

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/r660;->i(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static n()V
    .locals 2

    .line 1
    invoke-static {}, Ll/r660;->e()Ll/r660;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/r660;->j()V

    .line 6
    .line 7
    .line 8
    const-wide/16 v0, 0x1f4

    .line 9
    .line 10
    sput-wide v0, Ll/t660;->f:J

    .line 11
    .line 12
    return-void
.end method

.method public static o()V
    .locals 3

    .line 1
    sget-object v0, Ll/t660;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/util/concurrent/Future;

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/concurrent/Future;->isDone()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method

.method public static p(I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/v11;->c()V

    .line 2
    .line 3
    .line 4
    const-string v0, "at_once_logs"

    .line 5
    .line 6
    invoke-static {v0, p0}, Ll/t660;->f(Ljava/lang/String;I)Ljava/lang/Runnable;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Ll/t660;->j(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static q(I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/v11;->c()V

    .line 2
    .line 3
    .line 4
    const-string v0, "normal_logs"

    .line 5
    .line 6
    invoke-static {v0, p0}, Ll/t660;->g(Ljava/lang/String;I)Ljava/lang/Runnable;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Ll/t660;->k(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static r(Ljava/lang/String;I)V
    .locals 6

    .line 1
    sget-object v0, Ll/t660;->d:Ll/vpl;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jj5;->c(Ll/vpl;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-gt v1, v0, :cond_2

    .line 9
    .line 10
    sget-object v2, Ll/t660;->d:Ll/vpl;

    .line 11
    .line 12
    invoke-interface {v2, p0, p1}, Ll/vpl;->a(Ljava/lang/String;I)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-static {v2}, Ll/te5;->a(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-nez v3, :cond_1

    .line 21
    .line 22
    invoke-static {v2}, Ll/d3k0;->a(Ljava/util/List;)Lcom/google/gson/JsonArray;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v4, "https://report.tantanapp.com/v1/online/android"

    .line 27
    .line 28
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-static {v4, v3, v5}, Ll/d3k0;->b(Ljava/lang/String;Lcom/google/gson/JsonArray;I)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-eqz v3, :cond_0

    .line 37
    .line 38
    sget-object v3, Ll/t660;->a:Ljava/lang/String;

    .line 39
    .line 40
    new-instance v4, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v5, "upload success"

    .line 43
    .line 44
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-static {v3, v4}, Ll/wu80;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget-object v3, Ll/t660;->d:Ll/vpl;

    .line 58
    .line 59
    invoke-interface {v3, v2, p0}, Ll/vpl;->d(Ljava/util/List;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_0
    sget-object p0, Ll/t660;->a:Ljava/lang/String;

    .line 64
    .line 65
    const-string p1, "upload fail"

    .line 66
    .line 67
    invoke-static {p0, p1}, Ll/wu80;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Ll/t660;->m()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    :goto_1
    add-int/2addr v1, p1

    .line 75
    goto :goto_0

    .line 76
    :cond_2
    return-void
.end method
