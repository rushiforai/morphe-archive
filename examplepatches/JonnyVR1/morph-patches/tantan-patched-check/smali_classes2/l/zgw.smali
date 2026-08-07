.class public Ll/zgw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hsb;
.implements Ll/mpy;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/hsb<",
        "TK;TV;>;",
        "Ll/mpy<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/hsb$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/hsb$b<",
            "TK;>;"
        }
    .end annotation
.end field

.field public final b:Ll/gsb;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gsb<",
            "TK;",
            "Ll/hsb$a<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field

.field public final c:Ll/gsb;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gsb<",
            "TK;",
            "Ll/hsb$a<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/Map;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ll/x0l0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/x0l0<",
            "TV;>;"
        }
    .end annotation
.end field

.field public final f:Ll/mpy$a;

.field public final g:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ll/npy;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/npy;

.field public i:J

.field public final j:Z

.field public final k:Z


# direct methods
.method public constructor <init>(Ll/x0l0;Ll/mpy$a;Ll/a7h0;Ll/hsb$b;ZZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x0l0<",
            "TV;>;",
            "Ll/mpy$a;",
            "Ll/a7h0<",
            "Ll/npy;",
            ">;",
            "Ll/hsb$b<",
            "TK;>;ZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zgw;->d:Ljava/util/Map;

    .line 10
    .line 11
    iput-object p1, p0, Ll/zgw;->e:Ll/x0l0;

    .line 12
    .line 13
    new-instance v0, Ll/gsb;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/zgw;->A(Ll/x0l0;)Ll/x0l0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v0, v1}, Ll/gsb;-><init>(Ll/x0l0;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/zgw;->b:Ll/gsb;

    .line 23
    .line 24
    new-instance v0, Ll/gsb;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/zgw;->A(Ll/x0l0;)Ll/x0l0;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-direct {v0, p1}, Ll/gsb;-><init>(Ll/x0l0;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/zgw;->c:Ll/gsb;

    .line 34
    .line 35
    iput-object p2, p0, Ll/zgw;->f:Ll/mpy$a;

    .line 36
    .line 37
    iput-object p3, p0, Ll/zgw;->g:Ll/a7h0;

    .line 38
    .line 39
    invoke-interface {p3}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ll/npy;

    .line 44
    .line 45
    const-string p2, "mMemoryCacheParamsSupplier returned null"

    .line 46
    .line 47
    invoke-static {p1, p2}, Ll/wn80;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Ll/npy;

    .line 52
    .line 53
    iput-object p1, p0, Ll/zgw;->h:Ll/npy;

    .line 54
    .line 55
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 56
    .line 57
    .line 58
    move-result-wide p1

    .line 59
    iput-wide p1, p0, Ll/zgw;->i:J

    .line 60
    .line 61
    iput-object p4, p0, Ll/zgw;->a:Ll/hsb$b;

    .line 62
    .line 63
    iput-boolean p5, p0, Ll/zgw;->j:Z

    .line 64
    .line 65
    iput-boolean p6, p0, Ll/zgw;->k:Z

    .line 66
    .line 67
    return-void
.end method

.method public static bridge synthetic g(Ll/zgw;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/zgw;->j:Z

    return p0
.end method

.method public static bridge synthetic h(Ll/zgw;Ll/hsb$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zgw;->y(Ll/hsb$a;)V

    return-void
.end method

.method public static s(Ll/hsb$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/hsb$a<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/hsb$a;->e:Ll/hsb$b;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/hsb$a;->a:Ljava/lang/Object;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-interface {v0, p0, v1}, Ll/hsb$b;->a(Ljava/lang/Object;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static u(Ll/hsb$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/hsb$a<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/hsb$a;->e:Ll/hsb$b;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/hsb$a;->a:Ljava/lang/Object;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {v0, p0, v1}, Ll/hsb$b;->a(Ljava/lang/Object;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public final A(Ll/x0l0;)Ll/x0l0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x0l0<",
            "TV;>;)",
            "Ll/x0l0<",
            "Ll/hsb$a<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/zgw$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/zgw$a;-><init>(Ll/zgw;Ll/x0l0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public a(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    iget-object v0, p0, Ll/zgw;->b:Ll/gsb;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/gsb;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/hsb$a;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/zgw;->b:Ll/gsb;

    .line 16
    .line 17
    invoke-virtual {v1, p1, v0}, Ll/gsb;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

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
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p1
.end method

.method public b(Ljava/lang/Object;Ll/fb5;)Ll/fb5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ll/fb5<",
            "TV;>;)",
            "Ll/fb5<",
            "TV;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zgw;->a:Ll/hsb$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ll/zgw;->f(Ljava/lang/Object;Ll/fb5;Ll/hsb$b;)Ll/fb5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public declared-synchronized c(Ll/up80;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/up80<",
            "TK;>;)Z"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/zgw;->c:Ll/gsb;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ll/gsb;->e(Ll/up80;)Ljava/util/ArrayList;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    xor-int/lit8 p1, p1, 0x1

    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return p1

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw p1
.end method

.method public declared-synchronized contains(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/zgw;->c:Ll/gsb;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ll/gsb;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit p0

    .line 9
    return p1

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw p1
.end method

.method public d(Ll/up80;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/up80<",
            "TK;>;)I"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/zgw;->b:Ll/gsb;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ll/gsb;->j(Ll/up80;)Ljava/util/ArrayList;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Ll/zgw;->c:Ll/gsb;

    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ll/gsb;->j(Ll/up80;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/zgw;->o(Ljava/util/ArrayList;)V

    .line 15
    .line 16
    .line 17
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    invoke-virtual {p0, p1}, Ll/zgw;->q(Ljava/util/ArrayList;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/zgw;->t(Ljava/util/ArrayList;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/zgw;->v()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/zgw;->r()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p1
.end method

.method public e(Ljava/lang/Object;)Ll/fb5;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ll/fb5<",
            "TV;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    iget-object v0, p0, Ll/zgw;->b:Ll/gsb;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/gsb;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/hsb$a;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v2, p0, Ll/zgw;->c:Ll/gsb;

    .line 17
    .line 18
    invoke-virtual {v2, p1}, Ll/gsb;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ll/hsb$a;

    .line 23
    .line 24
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    iget v2, p1, Ll/hsb$a;->c:I

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    move v1, v3

    .line 33
    :cond_0
    invoke-static {v1}, Ll/wn80;->i(Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p1, Ll/hsb$a;->b:Ll/fb5;

    .line 37
    .line 38
    move v1, v3

    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const/4 p1, 0x0

    .line 43
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-static {v0}, Ll/zgw;->u(Ll/hsb$a;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    return-object p1

    .line 50
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    throw p1
.end method

.method public f(Ljava/lang/Object;Ll/fb5;Ll/hsb$b;)Ll/fb5;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ll/fb5<",
            "TV;>;",
            "Ll/hsb$b<",
            "TK;>;)",
            "Ll/fb5<",
            "TV;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/zgw;->v()V

    .line 8
    .line 9
    .line 10
    monitor-enter p0

    .line 11
    :try_start_0
    iget-object v0, p0, Ll/zgw;->b:Ll/gsb;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/gsb;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/hsb$a;

    .line 18
    .line 19
    iget-object v1, p0, Ll/zgw;->c:Ll/gsb;

    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ll/gsb;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ll/hsb$a;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Ll/zgw;->n(Ll/hsb$a;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v1}, Ll/zgw;->x(Ll/hsb$a;)Ll/fb5;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_2

    .line 40
    :cond_0
    move-object v1, v2

    .line 41
    :goto_0
    invoke-virtual {p2}, Ll/fb5;->B()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    iget-object v4, p0, Ll/zgw;->e:Ll/x0l0;

    .line 46
    .line 47
    invoke-interface {v4, v3}, Ll/x0l0;->a(Ljava/lang/Object;)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-virtual {p0, v3}, Ll/zgw;->i(I)Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v4, :cond_2

    .line 56
    .line 57
    iget-boolean v2, p0, Ll/zgw;->j:Z

    .line 58
    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    invoke-static {p1, p2, v3, p3}, Ll/hsb$a;->a(Ljava/lang/Object;Ll/fb5;ILl/hsb$b;)Ll/hsb$a;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    invoke-static {p1, p2, p3}, Ll/hsb$a;->b(Ljava/lang/Object;Ll/fb5;Ll/hsb$b;)Ll/hsb$a;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    :goto_1
    iget-object p3, p0, Ll/zgw;->c:Ll/gsb;

    .line 71
    .line 72
    invoke-virtual {p3, p1, p2}, Ll/gsb;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p2}, Ll/zgw;->w(Ll/hsb$a;)Ll/fb5;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    :cond_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    invoke-static {v1}, Ll/fb5;->v(Ll/fb5;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v0}, Ll/zgw;->u(Ll/hsb$a;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/zgw;->r()V

    .line 87
    .line 88
    .line 89
    return-object v2

    .line 90
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    throw p1
.end method

.method public get(Ljava/lang/Object;)Ll/fb5;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ll/fb5<",
            "TV;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    iget-object v0, p0, Ll/zgw;->b:Ll/gsb;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/gsb;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/hsb$a;

    .line 12
    .line 13
    iget-object v1, p0, Ll/zgw;->c:Ll/gsb;

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Ll/gsb;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ll/hsb$a;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/zgw;->w(Ll/hsb$a;)Ll/fb5;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p1

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    const/4 p1, 0x0

    .line 31
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    invoke-static {v0}, Ll/zgw;->u(Ll/hsb$a;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/zgw;->v()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/zgw;->r()V

    .line 39
    .line 40
    .line 41
    return-object p1

    .line 42
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    throw p1
.end method

.method public final declared-synchronized i(I)Z
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/zgw;->h:Ll/npy;

    .line 3
    .line 4
    iget v0, v0, Ll/npy;->e:I

    .line 5
    .line 6
    if-gt p1, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/zgw;->k()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Ll/zgw;->h:Ll/npy;

    .line 13
    .line 14
    iget v1, v1, Ll/npy;->b:I

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    sub-int/2addr v1, v2

    .line 18
    if-gt v0, v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/zgw;->l()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Ll/zgw;->h:Ll/npy;

    .line 25
    .line 26
    iget v1, v1, Ll/npy;->a:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    sub-int/2addr v1, p1

    .line 29
    if-gt v0, v1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    const/4 v2, 0x0

    .line 35
    :goto_0
    monitor-exit p0

    .line 36
    return v2

    .line 37
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw p1
.end method

.method public final declared-synchronized j(Ll/hsb$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hsb$a<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    iget v0, p1, Ll/hsb$a;->c:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    move v0, v1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    invoke-static {v0}, Ll/wn80;->i(Z)V

    .line 14
    .line 15
    .line 16
    iget v0, p1, Ll/hsb$a;->c:I

    .line 17
    .line 18
    sub-int/2addr v0, v1

    .line 19
    iput v0, p1, Ll/hsb$a;->c:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p1
.end method

.method public declared-synchronized k()I
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/zgw;->c:Ll/gsb;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/gsb;->c()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object v1, p0, Ll/zgw;->b:Ll/gsb;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/gsb;->c()I

    .line 11
    .line 12
    .line 13
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    sub-int/2addr v0, v1

    .line 15
    monitor-exit p0

    .line 16
    return v0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v0
.end method

.method public declared-synchronized l()I
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/zgw;->c:Ll/gsb;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/gsb;->f()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object v1, p0, Ll/zgw;->b:Ll/gsb;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/gsb;->f()I

    .line 11
    .line 12
    .line 13
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    sub-int/2addr v0, v1

    .line 15
    monitor-exit p0

    .line 16
    return v0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v0
.end method

.method public final declared-synchronized m(Ll/hsb$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hsb$a<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    iget-boolean v0, p1, Ll/hsb$a;->d:Z

    .line 6
    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-static {v0}, Ll/wn80;->i(Z)V

    .line 10
    .line 11
    .line 12
    iget v0, p1, Ll/hsb$a;->c:I

    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    iput v0, p1, Ll/hsb$a;->c:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw p1
.end method

.method public final declared-synchronized n(Ll/hsb$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hsb$a<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    iget-boolean v0, p1, Ll/hsb$a;->d:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    xor-int/2addr v0, v1

    .line 9
    invoke-static {v0}, Ll/wn80;->i(Z)V

    .line 10
    .line 11
    .line 12
    iput-boolean v1, p1, Ll/hsb$a;->d:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw p1
.end method

.method public final declared-synchronized o(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/hsb$a<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/hsb$a;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/zgw;->n(Ll/hsb$a;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p1

    .line 27
    :cond_0
    monitor-exit p0

    .line 28
    return-void
.end method

.method public final declared-synchronized p(Ll/hsb$a;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hsb$a<",
            "TK;TV;>;)Z"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p1, Ll/hsb$a;->d:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget v0, p1, Ll/hsb$a;->c:I

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/zgw;->b:Ll/gsb;

    .line 11
    .line 12
    iget-object v1, p1, Ll/hsb$a;->a:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-virtual {v0, v1, p1}, Ll/gsb;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    monitor-exit p0

    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    monitor-exit p0

    .line 23
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p1
.end method

.method public final q(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/hsb$a<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/hsb$a;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/zgw;->x(Ll/hsb$a;)Ll/fb5;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public r()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/zgw;->h:Ll/npy;

    .line 3
    .line 4
    iget v1, v0, Ll/npy;->d:I

    .line 5
    .line 6
    iget v0, v0, Ll/npy;->b:I

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/zgw;->k()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    sub-int/2addr v0, v2

    .line 13
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/zgw;->h:Ll/npy;

    .line 18
    .line 19
    iget v2, v1, Ll/npy;->c:I

    .line 20
    .line 21
    iget v1, v1, Ll/npy;->a:I

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/zgw;->l()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    sub-int/2addr v1, v3

    .line 28
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {p0, v0, v1}, Ll/zgw;->z(II)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/zgw;->o(Ljava/util/ArrayList;)V

    .line 37
    .line 38
    .line 39
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    invoke-virtual {p0, v0}, Ll/zgw;->q(Ljava/util/ArrayList;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/zgw;->t(Ljava/util/ArrayList;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    throw v0
.end method

.method public final t(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/hsb$a<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ll/hsb$a;

    .line 18
    .line 19
    invoke-static {p1}, Ll/zgw;->u(Ll/hsb$a;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final declared-synchronized v()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Ll/zgw;->i:J

    .line 3
    .line 4
    iget-object v2, p0, Ll/zgw;->h:Ll/npy;

    .line 5
    .line 6
    iget-wide v2, v2, Ll/npy;->f:J

    .line 7
    .line 8
    add-long/2addr v0, v2

    .line 9
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :cond_0
    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iput-wide v0, p0, Ll/zgw;->i:J

    .line 24
    .line 25
    iget-object v0, p0, Ll/zgw;->g:Ll/a7h0;

    .line 26
    .line 27
    invoke-interface {v0}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/npy;

    .line 32
    .line 33
    const-string v1, "mMemoryCacheParamsSupplier returned null"

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/wn80;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/npy;

    .line 40
    .line 41
    iput-object v0, p0, Ll/zgw;->h:Ll/npy;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    .line 43
    monitor-exit p0

    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception v0

    .line 46
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 47
    throw v0
.end method

.method public final declared-synchronized w(Ll/hsb$a;)Ll/fb5;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hsb$a<",
            "TK;TV;>;)",
            "Ll/fb5<",
            "TV;>;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1}, Ll/zgw;->m(Ll/hsb$a;)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p1, Ll/hsb$a;->b:Ll/fb5;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/fb5;->B()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/zgw$b;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/zgw$b;-><init>(Ll/zgw;Ll/hsb$a;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/fb5;->Z(Ljava/lang/Object;Ll/w4d0;)Ll/fb5;

    .line 17
    .line 18
    .line 19
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    monitor-exit p0

    .line 21
    return-object p1

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p1
.end method

.method public final declared-synchronized x(Ll/hsb$a;)Ll/fb5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hsb$a<",
            "TK;TV;>;)",
            "Ll/fb5<",
            "TV;>;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    iget-boolean v0, p1, Ll/hsb$a;->d:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v0, p1, Ll/hsb$a;->c:I

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Ll/hsb$a;->b:Ll/fb5;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    :goto_0
    monitor-exit p0

    .line 20
    return-object p1

    .line 21
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw p1
.end method

.method public final y(Ll/hsb$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hsb$a<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    invoke-virtual {p0, p1}, Ll/zgw;->j(Ll/hsb$a;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/zgw;->p(Ll/hsb$a;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, p1}, Ll/zgw;->x(Ll/hsb$a;)Ll/fb5;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    invoke-static {v1}, Ll/fb5;->v(Ll/fb5;)V

    .line 18
    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    :goto_0
    invoke-static {p1}, Ll/zgw;->s(Ll/hsb$a;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/zgw;->v()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/zgw;->r()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p1
.end method

.method public final declared-synchronized z(II)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList<",
            "Ll/hsb$a<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget-object v0, p0, Ll/zgw;->b:Ll/gsb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/gsb;->c()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-gt v0, p1, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/zgw;->b:Ll/gsb;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/gsb;->f()I

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    if-gt v0, p2, :cond_0

    .line 26
    .line 27
    monitor-exit p0

    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    :goto_0
    iget-object v1, p0, Ll/zgw;->b:Ll/gsb;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/gsb;->c()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-gt v1, p1, :cond_1

    .line 44
    .line 45
    iget-object v1, p0, Ll/zgw;->b:Ll/gsb;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/gsb;->f()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-le v1, p2, :cond_2

    .line 52
    .line 53
    :cond_1
    iget-object v1, p0, Ll/zgw;->b:Ll/gsb;

    .line 54
    .line 55
    invoke-virtual {v1}, Ll/gsb;->d()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    if-nez v1, :cond_4

    .line 60
    .line 61
    iget-boolean p1, p0, Ll/zgw;->k:Z

    .line 62
    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    iget-object p1, p0, Ll/zgw;->b:Ll/gsb;

    .line 66
    .line 67
    invoke-virtual {p1}, Ll/gsb;->k()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    .line 69
    .line 70
    :cond_2
    monitor-exit p0

    .line 71
    return-object v0

    .line 72
    :cond_3
    :try_start_2
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 73
    .line 74
    const-string p2, "key is null, but exclusiveEntries count: %d, size: %d"

    .line 75
    .line 76
    iget-object v0, p0, Ll/zgw;->b:Ll/gsb;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/gsb;->c()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v1, p0, Ll/zgw;->b:Ll/gsb;

    .line 87
    .line 88
    invoke-virtual {v1}, Ll/gsb;->f()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    throw p1

    .line 108
    :cond_4
    iget-object v2, p0, Ll/zgw;->b:Ll/gsb;

    .line 109
    .line 110
    invoke-virtual {v2, v1}, Ll/gsb;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    iget-object v2, p0, Ll/zgw;->c:Ll/gsb;

    .line 114
    .line 115
    invoke-virtual {v2, v1}, Ll/gsb;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    check-cast v1, Ll/hsb$a;

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :goto_1
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 126
    throw p1
.end method
