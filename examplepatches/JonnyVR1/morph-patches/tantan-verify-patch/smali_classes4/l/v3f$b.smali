.class public Ll/v3f$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/v3f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "O:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field a:Ljava/lang/String;

.field b:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ll/jcg0<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field c:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final d:Ll/dm80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dm80<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final e:Ll/hc2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/hc2<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final f:Ll/t21;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/t21<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final g:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ll/v3f$e<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field final synthetic h:Ll/v3f;


# direct methods
.method public constructor <init>(Ll/v3f;Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/v3f$b;->h:Ll/v3f;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/v3f$b$a;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/v3f$b$a;-><init>(Ll/v3f$b;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/v3f$b;->g:Ljava/lang/ThreadLocal;

    .line 12
    .line 13
    iput-object p2, p0, Ll/v3f$b;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1}, Ll/v3f;->e(Ll/v3f;)Ll/qsw;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    invoke-static {p1}, Ll/v3f;->e(Ll/v3f;)Ll/qsw;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1, p0}, Ll/qsw;->b(Ll/v3f$b;)Ll/dm80;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p1, 0x0

    .line 31
    :goto_0
    iput-object p1, p0, Ll/v3f$b;->d:Ll/dm80;

    .line 32
    .line 33
    new-instance p1, Ll/hc2;

    .line 34
    .line 35
    invoke-direct {p1, p0}, Ll/hc2;-><init>(Ll/v3f$b;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/v3f$b;->e:Ll/hc2;

    .line 39
    .line 40
    new-instance p1, Ll/t21;

    .line 41
    .line 42
    invoke-direct {p1, p0}, Ll/t21;-><init>(Ll/v3f$b;)V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Ll/v3f$b;->f:Ll/t21;

    .line 46
    .line 47
    return-void
.end method

.method private a(Ll/jcg0;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jcg0<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/v3f$b;->h:Ll/v3f;

    .line 4
    .line 5
    invoke-static {v0}, Ll/v3f;->f(Ll/v3f;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-direct {p0, p1, p2, v0}, Ll/v3f$b;->n(Ll/jcg0;Ljava/lang/Object;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private k(Ljava/lang/Object;Ll/v3f$e;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/v3f$e<",
            "TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Error;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/v3f$b;->l(Ljava/lang/Object;Ll/v3f$e;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/v3f$b;->h:Ll/v3f;

    .line 8
    .line 9
    invoke-static {p1}, Ll/v3f;->c(Ll/v3f;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/v3f$b;->h:Ll/v3f;

    .line 16
    .line 17
    invoke-static {p1}, Ll/v3f;->d(Ll/v3f;)Ll/wzv;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget-object p2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 22
    .line 23
    iget-object p0, p0, Ll/v3f$b;->a:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v1, "No subscribers registered for event "

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p1, p2, p0}, Ll/wzv;->a(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method private l(Ljava/lang/Object;Ll/v3f$e;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/v3f$e<",
            "TT;>;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/v3f$b;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Ll/v3f$b;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Ll/jcg0;

    .line 29
    .line 30
    iput-object p1, p2, Ll/v3f$e;->e:Ljava/lang/Object;

    .line 31
    .line 32
    iput-object v2, p2, Ll/v3f$e;->d:Ll/jcg0;

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    :try_start_0
    iget-boolean v4, p2, Ll/v3f$e;->c:Z

    .line 36
    .line 37
    invoke-direct {p0, v2, p1, v4}, Ll/v3f$b;->n(Ll/jcg0;Ljava/lang/Object;Z)V

    .line 38
    .line 39
    .line 40
    iget-boolean v2, p2, Ll/v3f$e;->f:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    iput-object v3, p2, Ll/v3f$e;->e:Ljava/lang/Object;

    .line 43
    .line 44
    iput-object v3, p2, Ll/v3f$e;->d:Ll/jcg0;

    .line 45
    .line 46
    iput-boolean v1, p2, Ll/v3f$e;->f:Z

    .line 47
    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    iput-object v3, p2, Ll/v3f$e;->e:Ljava/lang/Object;

    .line 53
    .line 54
    iput-object v3, p2, Ll/v3f$e;->d:Ll/jcg0;

    .line 55
    .line 56
    iput-boolean v1, p2, Ll/v3f$e;->f:Z

    .line 57
    .line 58
    throw p0

    .line 59
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 60
    return p0

    .line 61
    :cond_2
    return v1
.end method

.method private n(Ll/jcg0;Ljava/lang/Object;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jcg0<",
            "TT;>;TT;Z)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/v3f$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p1, Ll/jcg0;->d:Lcom/tantan/eventbus/ThreadMode;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_7

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_5

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_3

    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    if-eq v0, v1, :cond_1

    .line 22
    .line 23
    const/4 p3, 0x5

    .line 24
    if-ne v0, p3, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Ll/v3f$b;->f:Ll/t21;

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Ll/t21;->a(Ll/jcg0;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object p0, p1, Ll/jcg0;->d:Lcom/tantan/eventbus/ThreadMode;

    .line 33
    .line 34
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "Unknown thread mode: "

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    if-eqz p3, :cond_2

    .line 49
    .line 50
    iget-object p0, p0, Ll/v3f$b;->e:Ll/hc2;

    .line 51
    .line 52
    invoke-virtual {p0, p1, p2}, Ll/hc2;->a(Ll/jcg0;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    invoke-virtual {p0, p1, p2}, Ll/v3f$b;->f(Ll/jcg0;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    iget-object p3, p0, Ll/v3f$b;->d:Ll/dm80;

    .line 61
    .line 62
    if-eqz p3, :cond_4

    .line 63
    .line 64
    invoke-interface {p3, p1, p2}, Ll/dm80;->a(Ll/jcg0;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_4
    invoke-virtual {p0, p1, p2}, Ll/v3f$b;->f(Ll/jcg0;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_5
    if-eqz p3, :cond_6

    .line 73
    .line 74
    invoke-virtual {p0, p1, p2}, Ll/v3f$b;->f(Ll/jcg0;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_6
    iget-object p0, p0, Ll/v3f$b;->d:Ll/dm80;

    .line 79
    .line 80
    invoke-interface {p0, p1, p2}, Ll/dm80;->a(Ll/jcg0;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_7
    invoke-virtual {p0, p1, p2}, Ll/v3f$b;->f(Ll/jcg0;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method


# virtual methods
.method public b()Ljava/util/concurrent/ExecutorService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v3f$b;->h:Ll/v3f;

    .line 2
    .line 3
    invoke-static {p0}, Ll/v3f;->b(Ll/v3f;)Ljava/util/concurrent/ExecutorService;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Ll/wzv;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v3f$b;->h:Ll/v3f;

    .line 2
    .line 3
    invoke-static {p0}, Ll/v3f;->d(Ll/v3f;)Ll/wzv;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v3f$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/cr60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cr60<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/cr60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    iget-object p1, p1, Ll/cr60;->b:Ll/jcg0;

    .line 4
    .line 5
    iget-boolean v1, p1, Ll/jcg0;->h:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/v3f$b;->f(Ll/jcg0;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public f(Ll/jcg0;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jcg0<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Ll/jcg0;->b:Ll/ab50;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ll/ab50;->onChanged(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TO;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/tantan/eventbus/ThreadMode;->POSTING:Lcom/tantan/eventbus/ThreadMode;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1, v1}, Ll/v3f$b;->h(Lcom/tantan/eventbus/ThreadMode;IZ)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public declared-synchronized h(Lcom/tantan/eventbus/ThreadMode;IZ)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/eventbus/ThreadMode;",
            "IZ)TO;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ll/ncg0;

    .line 3
    .line 4
    invoke-direct {v0, p1, p2, p3}, Ll/ncg0;-><init>(Lcom/tantan/eventbus/ThreadMode;IZ)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ll/jcg0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/v3f$b;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p1, p0, v1, v0}, Ll/jcg0;-><init>(Ll/v3f$b;Ljava/lang/String;Ll/ncg0;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/v3f$b;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/v3f$b;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_3

    .line 28
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/v3f$b;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v1, 0x0

    .line 35
    :goto_1
    if-gt v1, v0, :cond_3

    .line 36
    .line 37
    if-eq v1, v0, :cond_2

    .line 38
    .line 39
    iget-object v2, p0, Ll/v3f$b;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 40
    .line 41
    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Ll/jcg0;

    .line 46
    .line 47
    iget v2, v2, Ll/jcg0;->e:I

    .line 48
    .line 49
    if-le p2, v2, :cond_1

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    :goto_2
    iget-object p2, p0, Ll/v3f$b;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 56
    .line 57
    invoke-virtual {p2, v1, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    :cond_3
    iget-object p2, p0, Ll/v3f$b;->h:Ll/v3f;

    .line 61
    .line 62
    invoke-static {p2}, Ll/v3f;->a(Ll/v3f;)Ll/cu6;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-interface {p2, p1, p3}, Ll/cu6;->a(Ll/jcg0;Z)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    if-eqz p3, :cond_4

    .line 71
    .line 72
    iget-object p3, p0, Ll/v3f$b;->c:Ljava/lang/Object;

    .line 73
    .line 74
    invoke-direct {p0, p1, p3}, Ll/v3f$b;->a(Ll/jcg0;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .line 76
    .line 77
    :cond_4
    monitor-exit p0

    .line 78
    return-object p2

    .line 79
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    throw p1
.end method

.method public i(Z)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TO;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/tantan/eventbus/ThreadMode;->POSTING:Lcom/tantan/eventbus/ThreadMode;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1, p1}, Ll/v3f$b;->h(Lcom/tantan/eventbus/ThreadMode;IZ)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public j(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/v3f$b;->g:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/v3f$e;

    .line 8
    .line 9
    iget-object v1, v0, Ll/v3f$e;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    iget-boolean p1, v0, Ll/v3f$e;->b:Z

    .line 15
    .line 16
    if-nez p1, :cond_2

    .line 17
    .line 18
    iget-object p1, p0, Ll/v3f$b;->h:Ll/v3f;

    .line 19
    .line 20
    invoke-static {p1}, Ll/v3f;->f(Ll/v3f;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput-boolean p1, v0, Ll/v3f$e;->c:Z

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    iput-boolean p1, v0, Ll/v3f$e;->b:Z

    .line 28
    .line 29
    iget-boolean p1, v0, Ll/v3f$e;->f:Z

    .line 30
    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    :goto_0
    const/4 p1, 0x0

    .line 34
    :try_start_0
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_0

    .line 39
    .line 40
    invoke-interface {v1, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-direct {p0, v2, v0}, Ll/v3f$b;->k(Ljava/lang/Object;Ll/v3f$e;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    iput-boolean p1, v0, Ll/v3f$e;->b:Z

    .line 51
    .line 52
    iput-boolean p1, v0, Ll/v3f$e;->c:Z

    .line 53
    .line 54
    return-void

    .line 55
    :goto_1
    iput-boolean p1, v0, Ll/v3f$e;->b:Z

    .line 56
    .line 57
    iput-boolean p1, v0, Ll/v3f$e;->c:Z

    .line 58
    .line 59
    throw p0

    .line 60
    :cond_1
    new-instance p0, Lcom/tantan/eventbus/EventBusException;

    .line 61
    .line 62
    const-string p1, "Internal error. Abort state was not reset"

    .line 63
    .line 64
    invoke-direct {p0, p1}, Lcom/tantan/eventbus/EventBusException;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    throw p0

    .line 68
    :cond_2
    return-void
.end method

.method public m(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/v3f$b;->c:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v3f$b;->j(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public declared-synchronized o(Ll/jcg0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jcg0<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/v3f$b;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p1, Ll/jcg0;->h:Z

    .line 14
    .line 15
    iget-object v0, p0, Ll/v3f$b;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p1
.end method
