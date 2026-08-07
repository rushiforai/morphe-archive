.class public Ll/vjm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final p:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static q:Ll/vjm;

.field public static r:Ll/rjm;

.field public static s:Z


# instance fields
.field public final a:Ll/oxi0;

.field public final b:Ll/tjm;

.field public final c:Ll/gb5;

.field public final d:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/hsb;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/hsb<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/hym;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/hym<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/hsb;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/hsb<",
            "Ll/by3;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/hym;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/hym<",
            "Ll/by3;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/shm;

.field public j:Ll/xkm;

.field public k:Ll/bl90;

.field public l:Ll/xl90;

.field public m:Ll/xc80;

.field public n:Ll/zc80;

.field public o:Ll/dq0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Ll/vjm;

    .line 2
    .line 3
    sput-object v0, Ll/vjm;->p:Ljava/lang/Class;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Ll/tjm;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/i9j;->d()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v0, "ImagePipelineConfig()"

    .line 11
    .line 12
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/tjm;

    .line 20
    .line 21
    iput-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/tjm;->n()Ll/ujm;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ll/ujm;->G()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    new-instance v1, Ll/tof;

    .line 34
    .line 35
    invoke-interface {p1}, Ll/tjm;->H()Ll/d7f;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {v2}, Ll/d7f;->a()Ljava/util/concurrent/Executor;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-direct {v1, v2}, Ll/tof;-><init>(Ljava/util/concurrent/Executor;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    new-instance v1, Ll/pxi0;

    .line 48
    .line 49
    invoke-interface {p1}, Ll/tjm;->H()Ll/d7f;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-interface {v2}, Ll/d7f;->a()Ljava/util/concurrent/Executor;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-direct {v1, v2}, Ll/pxi0;-><init>(Ljava/util/concurrent/Executor;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iput-object v1, p0, Ll/vjm;->a:Ll/oxi0;

    .line 61
    .line 62
    new-instance v1, Ll/gb5;

    .line 63
    .line 64
    invoke-interface {p1}, Ll/tjm;->j()Ll/hb5;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-direct {v1, p1}, Ll/gb5;-><init>(Ll/hb5;)V

    .line 69
    .line 70
    .line 71
    iput-object v1, p0, Ll/vjm;->c:Ll/gb5;

    .line 72
    .line 73
    invoke-static {}, Ll/i9j;->d()Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_2

    .line 78
    .line 79
    invoke-static {}, Ll/i9j;->b()V

    .line 80
    .line 81
    .line 82
    :cond_2
    invoke-interface {v0}, Ll/tjm;->A()Ll/a7h0;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Ll/vjm;->d:Ll/a7h0;

    .line 87
    .line 88
    return-void
.end method

.method public static m()Ll/vjm;
    .locals 2

    .line 1
    sget-object v0, Ll/vjm;->q:Ll/vjm;

    .line 2
    .line 3
    const-string v1, "ImagePipelineFactory was not initialized!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/wn80;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/vjm;

    .line 10
    .line 11
    return-object v0
.end method

.method public static declared-synchronized r(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-class v0, Ll/vjm;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const-string v1, "ImagePipelineFactory#initialize"

    .line 11
    .line 12
    invoke-static {v1}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    invoke-static {p0}, Ll/sjm;->K(Landroid/content/Context;)Ll/sjm$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/sjm$a;->a()Ll/sjm;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Ll/vjm;->s(Ll/tjm;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/i9j;->d()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-static {}, Ll/i9j;->b()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    .line 38
    :cond_1
    monitor-exit v0

    .line 39
    return-void

    .line 40
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw p0
.end method

.method public static declared-synchronized s(Ll/tjm;)V
    .locals 3

    .line 1
    const-class v0, Ll/vjm;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/vjm;->q:Ll/vjm;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    sget-object v1, Ll/vjm;->p:Ljava/lang/Class;

    .line 9
    .line 10
    const-string v2, "ImagePipelineFactory has already been initialized! `ImagePipelineFactory.initialize(...)` should only be called once to avoid unexpected behavior."

    .line 11
    .line 12
    invoke-static {v1, v2}, Ll/huf;->u(Ljava/lang/Class;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-boolean v1, Ll/vjm;->s:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    :try_start_1
    new-instance v1, Ll/vjm;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/vjm;-><init>(Ll/tjm;)V

    .line 26
    .line 27
    .line 28
    sput-object v1, Ll/vjm;->q:Ll/vjm;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    .line 30
    monitor-exit v0

    .line 31
    return-void

    .line 32
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    throw p0
.end method


# virtual methods
.method public final a()Ll/rjm;
    .locals 14

    .line 1
    new-instance v0, Ll/rjm;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vjm;->q()Ll/xl90;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/vjm;->b:Ll/tjm;

    .line 8
    .line 9
    invoke-interface {v2}, Ll/tjm;->q()Ljava/util/Set;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, p0, Ll/vjm;->b:Ll/tjm;

    .line 14
    .line 15
    invoke-interface {v3}, Ll/tjm;->a()Ljava/util/Set;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    iget-object v4, p0, Ll/vjm;->b:Ll/tjm;

    .line 20
    .line 21
    invoke-interface {v4}, Ll/tjm;->l()Ll/a7h0;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {p0}, Ll/vjm;->e()Ll/hym;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-virtual {p0}, Ll/vjm;->i()Ll/hym;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    iget-object v7, p0, Ll/vjm;->d:Ll/a7h0;

    .line 34
    .line 35
    iget-object v8, p0, Ll/vjm;->b:Ll/tjm;

    .line 36
    .line 37
    invoke-interface {v8}, Ll/tjm;->C()Ll/cy3;

    .line 38
    .line 39
    .line 40
    move-result-object v8

    .line 41
    iget-object v9, p0, Ll/vjm;->a:Ll/oxi0;

    .line 42
    .line 43
    iget-object v10, p0, Ll/vjm;->b:Ll/tjm;

    .line 44
    .line 45
    invoke-interface {v10}, Ll/tjm;->n()Ll/ujm;

    .line 46
    .line 47
    .line 48
    move-result-object v10

    .line 49
    invoke-virtual {v10}, Ll/ujm;->u()Ll/a7h0;

    .line 50
    .line 51
    .line 52
    move-result-object v10

    .line 53
    iget-object v11, p0, Ll/vjm;->b:Ll/tjm;

    .line 54
    .line 55
    invoke-interface {v11}, Ll/tjm;->n()Ll/ujm;

    .line 56
    .line 57
    .line 58
    move-result-object v11

    .line 59
    invoke-virtual {v11}, Ll/ujm;->I()Ll/a7h0;

    .line 60
    .line 61
    .line 62
    move-result-object v11

    .line 63
    iget-object v12, p0, Ll/vjm;->b:Ll/tjm;

    .line 64
    .line 65
    invoke-interface {v12}, Ll/tjm;->G()Ll/e94;

    .line 66
    .line 67
    .line 68
    const/4 v12, 0x0

    .line 69
    iget-object v13, p0, Ll/vjm;->b:Ll/tjm;

    .line 70
    .line 71
    invoke-direct/range {v0 .. v13}, Ll/rjm;-><init>(Ll/xl90;Ljava/util/Set;Ljava/util/Set;Ll/a7h0;Ll/mpy;Ll/mpy;Ll/a7h0;Ll/cy3;Ll/oxi0;Ll/a7h0;Ll/a7h0;Ll/e94;Ll/tjm;)V

    .line 72
    .line 73
    .line 74
    return-object v0
.end method

.method public b(Landroid/content/Context;)Ll/rce;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vjm;->c()Ll/dq0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-interface {p0, p1}, Ll/dq0;->a(Landroid/content/Context;)Ll/rce;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final c()Ll/dq0;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/vjm;->o:Ll/dq0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vjm;->n()Ll/xc80;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/tjm;->H()Ll/d7f;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p0}, Ll/vjm;->d()Ll/hsb;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 20
    .line 21
    invoke-interface {v0}, Ll/tjm;->n()Ll/ujm;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/ujm;->j()Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 30
    .line 31
    invoke-interface {v0}, Ll/tjm;->n()Ll/ujm;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/ujm;->w()Z

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 40
    .line 41
    invoke-interface {v0}, Ll/tjm;->n()Ll/ujm;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/ujm;->c()I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 50
    .line 51
    invoke-interface {v0}, Ll/tjm;->n()Ll/ujm;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/ujm;->d()I

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 60
    .line 61
    invoke-interface {v0}, Ll/tjm;->u()Ll/vqe0;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    invoke-static/range {v1 .. v8}, Ll/eq0;->a(Ll/xc80;Ll/d7f;Ll/hsb;ZZIILjava/util/concurrent/ExecutorService;)Ll/dq0;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Ll/vjm;->o:Ll/dq0;

    .line 70
    .line 71
    :cond_0
    iget-object p0, p0, Ll/vjm;->o:Ll/dq0;

    .line 72
    .line 73
    return-object p0
.end method

.method public d()Ll/hsb;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/hsb<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vjm;->e:Ll/hsb;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/tjm;->B()Ll/m23;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/tjm;->y()Ll/a7h0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/tjm;->m()Ll/gqy;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 24
    .line 25
    invoke-interface {v0}, Ll/tjm;->s()Ll/mpy$a;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 30
    .line 31
    invoke-interface {v0}, Ll/tjm;->n()Ll/ujm;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/ujm;->s()Z

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 40
    .line 41
    invoke-interface {v0}, Ll/tjm;->n()Ll/ujm;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/ujm;->r()Z

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 50
    .line 51
    invoke-interface {v0}, Ll/tjm;->e()Ll/hsb$b;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    invoke-interface/range {v1 .. v7}, Ll/m23;->a(Ll/a7h0;Ll/gqy;Ll/mpy$a;ZZLl/hsb$b;)Ll/hsb;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Ll/vjm;->e:Ll/hsb;

    .line 60
    .line 61
    :cond_0
    iget-object p0, p0, Ll/vjm;->e:Ll/hsb;

    .line 62
    .line 63
    return-object p0
.end method

.method public e()Ll/hym;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/hym<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vjm;->f:Ll/hym;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vjm;->d()Ll/hsb;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/vjm;->b:Ll/tjm;

    .line 10
    .line 11
    invoke-interface {v1}, Ll/tjm;->k()Ll/mhm;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v0, v1}, Ll/iym;->a(Ll/mpy;Ll/mhm;)Ll/hym;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/vjm;->f:Ll/hym;

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Ll/vjm;->f:Ll/hym;

    .line 22
    .line 23
    return-object p0
.end method

.method public f()Ll/gb5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vjm;->c:Ll/gb5;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ll/a7h0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vjm;->d:Ll/a7h0;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ll/hsb;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/hsb<",
            "Ll/by3;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vjm;->g:Ll/hsb;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/tjm;->h()Ll/a7h0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/vjm;->b:Ll/tjm;

    .line 12
    .line 13
    invoke-interface {v1}, Ll/tjm;->m()Ll/gqy;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/vjm;->b:Ll/tjm;

    .line 18
    .line 19
    invoke-interface {v2}, Ll/tjm;->r()Ll/mpy$a;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v0, v1, v2}, Ll/m0f;->a(Ll/a7h0;Ll/gqy;Ll/mpy$a;)Ll/hsb;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/vjm;->g:Ll/hsb;

    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Ll/vjm;->g:Ll/hsb;

    .line 30
    .line 31
    return-object p0
.end method

.method public i()Ll/hym;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/hym<",
            "Ll/by3;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vjm;->h:Ll/hym;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/tjm;->b()Ll/mpy;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/tjm;->b()Ll/mpy;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/vjm;->h()Ll/hsb;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    iget-object v1, p0, Ll/vjm;->b:Ll/tjm;

    .line 25
    .line 26
    invoke-interface {v1}, Ll/tjm;->k()Ll/mhm;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v0, v1}, Ll/p0f;->a(Ll/mpy;Ll/mhm;)Ll/hym;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Ll/vjm;->h:Ll/hym;

    .line 35
    .line 36
    :cond_1
    iget-object p0, p0, Ll/vjm;->h:Ll/hym;

    .line 37
    .line 38
    return-object p0
.end method

.method public final j()Ll/shm;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vjm;->i:Ll/shm;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/tjm;->g()Ll/shm;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/tjm;->g()Ll/shm;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/vjm;->i:Ll/shm;

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/vjm;->c()Ll/dq0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-interface {v0}, Ll/dq0;->c()Ll/shm;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v0}, Ll/dq0;->b()Ll/shm;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v1, 0x0

    .line 38
    move-object v0, v1

    .line 39
    :goto_0
    iget-object v2, p0, Ll/vjm;->b:Ll/tjm;

    .line 40
    .line 41
    invoke-interface {v2}, Ll/tjm;->x()Ll/thm;

    .line 42
    .line 43
    .line 44
    new-instance v2, Ll/npd;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/vjm;->o()Ll/zc80;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-direct {v2, v1, v0, v3}, Ll/npd;-><init>(Ll/shm;Ll/shm;Ll/zc80;)V

    .line 51
    .line 52
    .line 53
    iput-object v2, p0, Ll/vjm;->i:Ll/shm;

    .line 54
    .line 55
    :cond_2
    :goto_1
    iget-object p0, p0, Ll/vjm;->i:Ll/shm;

    .line 56
    .line 57
    return-object p0
.end method

.method public k()Ll/rjm;
    .locals 1

    .line 1
    sget-object v0, Ll/vjm;->r:Ll/rjm;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vjm;->a()Ll/rjm;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sput-object p0, Ll/vjm;->r:Ll/rjm;

    .line 10
    .line 11
    :cond_0
    sget-object p0, Ll/vjm;->r:Ll/rjm;

    .line 12
    .line 13
    return-object p0
.end method

.method public final l()Ll/xkm;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/vjm;->j:Ll/xkm;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/tjm;->w()Ll/xkm;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/tjm;->v()Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/tjm;->n()Ll/ujm;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/ujm;->J()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    new-instance v0, Ll/apf0;

    .line 34
    .line 35
    iget-object v1, p0, Ll/vjm;->b:Ll/tjm;

    .line 36
    .line 37
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ll/ujm;->m()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-direct {v0, v1}, Ll/apf0;-><init>(I)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/vjm;->j:Ll/xkm;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    new-instance v2, Ll/fs10;

    .line 52
    .line 53
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 54
    .line 55
    invoke-interface {v0}, Ll/tjm;->n()Ll/ujm;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ll/ujm;->m()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 64
    .line 65
    invoke-interface {v0}, Ll/tjm;->n()Ll/ujm;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ll/ujm;->y()Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 74
    .line 75
    invoke-interface {v0}, Ll/tjm;->w()Ll/xkm;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 80
    .line 81
    invoke-interface {v0}, Ll/tjm;->v()Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v6

    .line 85
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 86
    .line 87
    invoke-interface {v0}, Ll/tjm;->n()Ll/ujm;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/ujm;->F()Z

    .line 92
    .line 93
    .line 94
    move-result v7

    .line 95
    invoke-direct/range {v2 .. v7}, Ll/fs10;-><init>(IZLl/xkm;Ljava/lang/Integer;Z)V

    .line 96
    .line 97
    .line 98
    iput-object v2, p0, Ll/vjm;->j:Ll/xkm;

    .line 99
    .line 100
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/vjm;->j:Ll/xkm;

    .line 101
    .line 102
    return-object p0
.end method

.method public n()Ll/xc80;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vjm;->m:Ll/xc80;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/tjm;->i()Ll/aj80;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/vjm;->o()Ll/zc80;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Ll/vjm;->f()Ll/gb5;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v0, v1, v2}, Ll/yc80;->a(Ll/aj80;Ll/zc80;Ll/gb5;)Ll/xc80;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/vjm;->m:Ll/xc80;

    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Ll/vjm;->m:Ll/xc80;

    .line 26
    .line 27
    return-object p0
.end method

.method public o()Ll/zc80;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vjm;->n:Ll/zc80;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/vjm;->b:Ll/tjm;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/tjm;->i()Ll/aj80;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/vjm;->b:Ll/tjm;

    .line 12
    .line 13
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/ujm;->H()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget-object v2, p0, Ll/vjm;->b:Ll/tjm;

    .line 22
    .line 23
    invoke-interface {v2}, Ll/tjm;->n()Ll/ujm;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ll/ujm;->t()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object v3, p0, Ll/vjm;->b:Ll/tjm;

    .line 32
    .line 33
    invoke-interface {v3}, Ll/tjm;->n()Ll/ujm;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v3}, Ll/ujm;->o()Ll/bd80;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-static {v0, v1, v2, v3}, Ll/ad80;->a(Ll/aj80;ZZLl/bd80;)Ll/zc80;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Ll/vjm;->n:Ll/zc80;

    .line 46
    .line 47
    :cond_0
    iget-object p0, p0, Ll/vjm;->n:Ll/zc80;

    .line 48
    .line 49
    return-object p0
.end method

.method public final p()Ll/bl90;
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/vjm;->k:Ll/bl90;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 8
    .line 9
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/ujm;->q()Ll/ujm$d;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 18
    .line 19
    invoke-interface {v1}, Ll/tjm;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 24
    .line 25
    invoke-interface {v1}, Ll/tjm;->i()Ll/aj80;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ll/aj80;->k()Ll/wq3;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v0}, Ll/vjm;->j()Ll/shm;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 38
    .line 39
    invoke-interface {v1}, Ll/tjm;->c()Ll/t4b0;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 44
    .line 45
    invoke-interface {v1}, Ll/tjm;->F()Lcom/facebook/imagepipeline/core/DownsampleMode;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 50
    .line 51
    invoke-interface {v1}, Ll/tjm;->D()Z

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 56
    .line 57
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Ll/ujm;->B()Z

    .line 62
    .line 63
    .line 64
    move-result v9

    .line 65
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 66
    .line 67
    invoke-interface {v1}, Ll/tjm;->H()Ll/d7f;

    .line 68
    .line 69
    .line 70
    move-result-object v10

    .line 71
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 72
    .line 73
    invoke-interface {v1}, Ll/tjm;->i()Ll/aj80;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iget-object v11, v0, Ll/vjm;->b:Ll/tjm;

    .line 78
    .line 79
    invoke-interface {v11}, Ll/tjm;->z()I

    .line 80
    .line 81
    .line 82
    move-result v11

    .line 83
    invoke-virtual {v1, v11}, Ll/aj80;->i(I)Ll/fj80;

    .line 84
    .line 85
    .line 86
    move-result-object v11

    .line 87
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 88
    .line 89
    invoke-interface {v1}, Ll/tjm;->i()Ll/aj80;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ll/aj80;->j()Ll/ij80;

    .line 94
    .line 95
    .line 96
    move-result-object v12

    .line 97
    invoke-virtual {v0}, Ll/vjm;->e()Ll/hym;

    .line 98
    .line 99
    .line 100
    move-result-object v13

    .line 101
    invoke-virtual {v0}, Ll/vjm;->i()Ll/hym;

    .line 102
    .line 103
    .line 104
    move-result-object v14

    .line 105
    iget-object v15, v0, Ll/vjm;->d:Ll/a7h0;

    .line 106
    .line 107
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 108
    .line 109
    invoke-interface {v1}, Ll/tjm;->C()Ll/cy3;

    .line 110
    .line 111
    .line 112
    move-result-object v16

    .line 113
    invoke-virtual {v0}, Ll/vjm;->n()Ll/xc80;

    .line 114
    .line 115
    .line 116
    move-result-object v17

    .line 117
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 118
    .line 119
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v1}, Ll/ujm;->g()I

    .line 124
    .line 125
    .line 126
    move-result v18

    .line 127
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 128
    .line 129
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v1}, Ll/ujm;->f()I

    .line 134
    .line 135
    .line 136
    move-result v19

    .line 137
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 138
    .line 139
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v1}, Ll/ujm;->e()Z

    .line 144
    .line 145
    .line 146
    move-result v20

    .line 147
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 148
    .line 149
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v1}, Ll/ujm;->m()I

    .line 154
    .line 155
    .line 156
    move-result v21

    .line 157
    invoke-virtual {v0}, Ll/vjm;->f()Ll/gb5;

    .line 158
    .line 159
    .line 160
    move-result-object v22

    .line 161
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 162
    .line 163
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v1}, Ll/ujm;->l()Z

    .line 168
    .line 169
    .line 170
    move-result v23

    .line 171
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 172
    .line 173
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {v1}, Ll/ujm;->v()I

    .line 178
    .line 179
    .line 180
    move-result v24

    .line 181
    invoke-interface/range {v2 .. v24}, Ll/ujm$d;->a(Landroid/content/Context;Ll/wq3;Ll/shm;Ll/t4b0;Lcom/facebook/imagepipeline/core/DownsampleMode;ZZLl/d7f;Ll/fj80;Ll/ij80;Ll/mpy;Ll/mpy;Ll/a7h0;Ll/cy3;Ll/xc80;IIZILl/gb5;ZI)Ll/bl90;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    iput-object v1, v0, Ll/vjm;->k:Ll/bl90;

    .line 186
    .line 187
    :cond_0
    iget-object v0, v0, Ll/vjm;->k:Ll/bl90;

    .line 188
    .line 189
    return-object v0
.end method

.method public final q()Ll/xl90;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/ujm;->x()Z

    .line 10
    .line 11
    .line 12
    move-result v10

    .line 13
    iget-object v1, v0, Ll/vjm;->l:Ll/xl90;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance v2, Ll/xl90;

    .line 18
    .line 19
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 20
    .line 21
    invoke-interface {v1}, Ll/tjm;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v0}, Ll/vjm;->p()Ll/bl90;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 38
    .line 39
    invoke-interface {v1}, Ll/tjm;->o()Ll/vj20;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 44
    .line 45
    invoke-interface {v1}, Ll/tjm;->D()Z

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 50
    .line 51
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ll/ujm;->L()Z

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    iget-object v8, v0, Ll/vjm;->a:Ll/oxi0;

    .line 60
    .line 61
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 62
    .line 63
    invoke-interface {v1}, Ll/tjm;->F()Lcom/facebook/imagepipeline/core/DownsampleMode;

    .line 64
    .line 65
    .line 66
    move-result-object v9

    .line 67
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 68
    .line 69
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, Ll/ujm;->K()Z

    .line 74
    .line 75
    .line 76
    move-result v11

    .line 77
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 78
    .line 79
    invoke-interface {v1}, Ll/tjm;->f()Z

    .line 80
    .line 81
    .line 82
    move-result v12

    .line 83
    invoke-virtual {v0}, Ll/vjm;->l()Ll/xkm;

    .line 84
    .line 85
    .line 86
    move-result-object v13

    .line 87
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 88
    .line 89
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ll/ujm;->E()Z

    .line 94
    .line 95
    .line 96
    move-result v14

    .line 97
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 98
    .line 99
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1}, Ll/ujm;->C()Z

    .line 104
    .line 105
    .line 106
    move-result v15

    .line 107
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 108
    .line 109
    invoke-interface {v1}, Ll/tjm;->n()Ll/ujm;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v1}, Ll/ujm;->a()Z

    .line 114
    .line 115
    .line 116
    move-result v16

    .line 117
    iget-object v1, v0, Ll/vjm;->b:Ll/tjm;

    .line 118
    .line 119
    invoke-interface {v1}, Ll/tjm;->E()Ljava/util/Set;

    .line 120
    .line 121
    .line 122
    move-result-object v17

    .line 123
    invoke-direct/range {v2 .. v17}, Ll/xl90;-><init>(Landroid/content/ContentResolver;Ll/bl90;Ll/vj20;ZZLl/oxi0;Lcom/facebook/imagepipeline/core/DownsampleMode;ZZZLl/xkm;ZZZLjava/util/Set;)V

    .line 124
    .line 125
    .line 126
    iput-object v2, v0, Ll/vjm;->l:Ll/xl90;

    .line 127
    .line 128
    :cond_0
    iget-object v0, v0, Ll/vjm;->l:Ll/xl90;

    .line 129
    .line 130
    return-object v0
.end method
