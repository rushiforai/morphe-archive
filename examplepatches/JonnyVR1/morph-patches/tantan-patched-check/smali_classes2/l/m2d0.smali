.class public Ll/m2d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ComponentCallbacks2;
.implements Ll/ier;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/m2d0$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/content/ComponentCallbacks2;",
        "Ll/ier;"
    }
.end annotation


# static fields
.field private static final l:Ll/p2d0;

.field private static final m:Ll/p2d0;

.field private static final n:Ll/p2d0;


# instance fields
.field protected final a:Lcom/bumptech/glide/a;

.field protected final b:Landroid/content/Context;

.field final c:Ll/fer;

.field private final d:Ll/e3d0;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final e:Ll/o2d0;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final f:Ll/fli0;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final g:Ljava/lang/Runnable;

.field private final h:Lcom/bumptech/glide/manager/c;

.field private final i:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ll/l2d0<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private j:Ll/p2d0;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private k:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-static {v0}, Ll/p2d0;->m0(Ljava/lang/Class;)Ll/p2d0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/lr2;->R()Ll/lr2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/p2d0;

    .line 12
    .line 13
    sput-object v0, Ll/m2d0;->l:Ll/p2d0;

    .line 14
    .line 15
    const-class v0, Ll/bnj;

    .line 16
    .line 17
    invoke-static {v0}, Ll/p2d0;->m0(Ljava/lang/Class;)Ll/p2d0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/lr2;->R()Ll/lr2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/p2d0;

    .line 26
    .line 27
    sput-object v0, Ll/m2d0;->m:Ll/p2d0;

    .line 28
    .line 29
    sget-object v0, Ll/d4e;->c:Ll/d4e;

    .line 30
    .line 31
    invoke-static {v0}, Ll/p2d0;->n0(Ll/d4e;)Ll/p2d0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v1, Lcom/bumptech/glide/Priority;->LOW:Lcom/bumptech/glide/Priority;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/lr2;->Z(Lcom/bumptech/glide/Priority;)Ll/lr2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/p2d0;

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-virtual {v0, v1}, Ll/lr2;->g0(Z)Ll/lr2;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ll/p2d0;

    .line 49
    .line 50
    sput-object v0, Ll/m2d0;->n:Ll/p2d0;

    .line 51
    .line 52
    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/a;Ll/fer;Ll/o2d0;Landroid/content/Context;)V
    .locals 7
    .param p1    # Lcom/bumptech/glide/a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/fer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/o2d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 89
    new-instance v4, Ll/e3d0;

    invoke-direct {v4}, Ll/e3d0;-><init>()V

    .line 90
    invoke-virtual {p1}, Lcom/bumptech/glide/a;->g()Lcom/bumptech/glide/manager/d;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v6, p4

    .line 91
    invoke-direct/range {v0 .. v6}, Ll/m2d0;-><init>(Lcom/bumptech/glide/a;Ll/fer;Ll/o2d0;Ll/e3d0;Lcom/bumptech/glide/manager/d;Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/a;Ll/fer;Ll/o2d0;Ll/e3d0;Lcom/bumptech/glide/manager/d;Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/fli0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/fli0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/m2d0;->f:Ll/fli0;

    .line 10
    .line 11
    new-instance v0, Ll/m2d0$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/m2d0$a;-><init>(Ll/m2d0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/m2d0;->g:Ljava/lang/Runnable;

    .line 17
    .line 18
    iput-object p1, p0, Ll/m2d0;->a:Lcom/bumptech/glide/a;

    .line 19
    .line 20
    iput-object p2, p0, Ll/m2d0;->c:Ll/fer;

    .line 21
    .line 22
    iput-object p3, p0, Ll/m2d0;->e:Ll/o2d0;

    .line 23
    .line 24
    iput-object p4, p0, Ll/m2d0;->d:Ll/e3d0;

    .line 25
    .line 26
    iput-object p6, p0, Ll/m2d0;->b:Landroid/content/Context;

    .line 27
    .line 28
    invoke-virtual {p6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    new-instance p6, Ll/m2d0$b;

    .line 33
    .line 34
    invoke-direct {p6, p0, p4}, Ll/m2d0$b;-><init>(Ll/m2d0;Ll/e3d0;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p5, p3, p6}, Lcom/bumptech/glide/manager/d;->a(Landroid/content/Context;Lcom/bumptech/glide/manager/c$a;)Lcom/bumptech/glide/manager/c;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    iput-object p3, p0, Ll/m2d0;->h:Lcom/bumptech/glide/manager/c;

    .line 42
    .line 43
    invoke-static {}, Ll/ylk0;->r()Z

    .line 44
    .line 45
    .line 46
    move-result p4

    .line 47
    if-eqz p4, :cond_0

    .line 48
    .line 49
    invoke-static {v0}, Ll/ylk0;->v(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-interface {p2, p0}, Ll/fer;->b(Ll/ier;)V

    .line 54
    .line 55
    .line 56
    :goto_0
    invoke-interface {p2, p3}, Ll/fer;->b(Ll/ier;)V

    .line 57
    .line 58
    .line 59
    new-instance p2, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/bumptech/glide/a;->i()Lcom/bumptech/glide/c;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    invoke-virtual {p3}, Lcom/bumptech/glide/c;->c()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    invoke-direct {p2, p3}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>(Ljava/util/Collection;)V

    .line 70
    .line 71
    .line 72
    iput-object p2, p0, Ll/m2d0;->i:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/bumptech/glide/a;->i()Lcom/bumptech/glide/c;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p2}, Lcom/bumptech/glide/c;->d()Ll/p2d0;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {p0, p2}, Ll/m2d0;->y(Ll/p2d0;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/a;->o(Ll/m2d0;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method private B(Ll/cli0;)V
    .locals 2
    .param p1    # Ll/cli0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cli0<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/m2d0;->A(Ll/cli0;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-interface {p1}, Ll/cli0;->c()Ll/y1d0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/m2d0;->a:Lcom/bumptech/glide/a;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/a;->p(Ll/cli0;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    invoke-interface {p1, p0}, Ll/cli0;->g(Ll/y1d0;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v1}, Ll/y1d0;->clear()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized A(Ll/cli0;)Z
    .locals 3
    .param p1    # Ll/cli0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cli0<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-interface {p1}, Ll/cli0;->c()Ll/y1d0;

    .line 3
    .line 4
    .line 5
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return v1

    .line 11
    :cond_0
    :try_start_1
    iget-object v2, p0, Ll/m2d0;->d:Ll/e3d0;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ll/e3d0;->a(Ll/y1d0;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/m2d0;->f:Ll/fli0;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/fli0;->m(Ll/cli0;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-interface {p1, v0}, Ll/cli0;->g(Ll/y1d0;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    .line 27
    .line 28
    monitor-exit p0

    .line 29
    return v1

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    monitor-exit p0

    .line 33
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 36
    throw p1
.end method

.method public b(Ljava/lang/Class;)Ll/a2d0;
    .locals 3
    .param p1    # Ljava/lang/Class;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<ResourceType:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TResourceType;>;)",
            "Ll/a2d0<",
            "TResourceType;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/a2d0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/m2d0;->a:Lcom/bumptech/glide/a;

    .line 4
    .line 5
    iget-object v2, p0, Ll/m2d0;->b:Landroid/content/Context;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p1, v2}, Ll/a2d0;-><init>(Lcom/bumptech/glide/a;Ll/m2d0;Ljava/lang/Class;Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public declared-synchronized d()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/m2d0;->w()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ll/m2d0;->f:Ll/fli0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/fli0;->d()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw v0
.end method

.method public f()Ll/a2d0;
    .locals 1
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/a2d0<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    const-class v0, Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/m2d0;->b(Ljava/lang/Class;)Ll/a2d0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Ll/m2d0;->l:Ll/p2d0;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public h()Ll/a2d0;
    .locals 1
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/a2d0<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 1
    const-class v0, Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/m2d0;->b(Ljava/lang/Class;)Ll/a2d0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m()Ll/a2d0;
    .locals 1
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/a2d0<",
            "Ll/bnj;",
            ">;"
        }
    .end annotation

    .line 1
    const-class v0, Ll/bnj;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/m2d0;->b(Ljava/lang/Class;)Ll/a2d0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Ll/m2d0;->m:Ll/p2d0;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public n(Ll/cli0;)V
    .locals 0
    .param p1    # Ll/cli0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cli0<",
            "*>;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-direct {p0, p1}, Ll/m2d0;->B(Ll/cli0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/l2d0<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m2d0;->i:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    return-void
.end method

.method public declared-synchronized onDestroy()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/m2d0;->f:Ll/fli0;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/fli0;->onDestroy()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/m2d0;->f:Ll/fli0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/fli0;->f()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ll/cli0;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ll/m2d0;->n(Ll/cli0;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    iget-object v0, p0, Ll/m2d0;->f:Ll/fli0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/fli0;->b()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/m2d0;->d:Ll/e3d0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/e3d0;->b()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/m2d0;->c:Ll/fer;

    .line 46
    .line 47
    invoke-interface {v0, p0}, Ll/fer;->a(Ll/ier;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/m2d0;->c:Ll/fer;

    .line 51
    .line 52
    iget-object v1, p0, Ll/m2d0;->h:Lcom/bumptech/glide/manager/c;

    .line 53
    .line 54
    invoke-interface {v0, v1}, Ll/fer;->a(Ll/ier;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/m2d0;->g:Ljava/lang/Runnable;

    .line 58
    .line 59
    invoke-static {v0}, Ll/ylk0;->w(Ljava/lang/Runnable;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/m2d0;->a:Lcom/bumptech/glide/a;

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Lcom/bumptech/glide/a;->s(Ll/m2d0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    .line 66
    .line 67
    monitor-exit p0

    .line 68
    return-void

    .line 69
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    throw v0
.end method

.method public onLowMemory()V
    .locals 0

    .line 1
    return-void
.end method

.method public declared-synchronized onStart()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/m2d0;->x()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ll/m2d0;->f:Ll/fli0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/fli0;->onStart()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw v0
.end method

.method public onTrimMemory(I)V
    .locals 1

    .line 1
    const/16 v0, 0x3c

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-boolean p1, p0, Ll/m2d0;->k:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/m2d0;->v()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public declared-synchronized p()Ll/p2d0;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/m2d0;->j:Ll/p2d0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-object v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public q(Ljava/lang/Class;)Ll/aij0;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ll/aij0<",
            "*TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m2d0;->a:Lcom/bumptech/glide/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bumptech/glide/a;->i()Lcom/bumptech/glide/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/c;->e(Ljava/lang/Class;)Ll/aij0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public r(Ljava/io/File;)Ll/a2d0;
    .locals 0
    .param p1    # Ljava/io/File;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ll/a2d0<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/m2d0;->h()Ll/a2d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a2d0;->A0(Ljava/io/File;)Ll/a2d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public s(Ljava/lang/Integer;)Ll/a2d0;
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation

        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Landroidx/annotation/RawRes;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            ")",
            "Ll/a2d0<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/m2d0;->h()Ll/a2d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a2d0;->B0(Ljava/lang/Integer;)Ll/a2d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public t(Ljava/lang/String;)Ll/a2d0;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/a2d0<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/m2d0;->h()Ll/a2d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3
    .line 4
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 5
    .line 6
    .line 7
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "{tracker="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/m2d0;->d:Ll/e3d0;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, ", treeNode="

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/m2d0;->e:Ll/o2d0;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v1, "}"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    monitor-exit p0

    .line 44
    return-object v0

    .line 45
    :catchall_0
    move-exception v0

    .line 46
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    throw v0
.end method

.method public declared-synchronized u()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/m2d0;->d:Ll/e3d0;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/e3d0;->c()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v0
.end method

.method public declared-synchronized v()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/m2d0;->u()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ll/m2d0;->e:Ll/o2d0;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/o2d0;->a()Ljava/util/Set;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ll/m2d0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/m2d0;->u()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    monitor-exit p0

    .line 34
    return-void

    .line 35
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw v0
.end method

.method public declared-synchronized w()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/m2d0;->d:Ll/e3d0;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/e3d0;->d()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v0
.end method

.method public declared-synchronized x()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/m2d0;->d:Ll/e3d0;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/e3d0;->f()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v0
.end method

.method public declared-synchronized y(Ll/p2d0;)V
    .locals 0
    .param p1    # Ll/p2d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Ll/lr2;->c()Ll/lr2;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Ll/p2d0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/lr2;->b()Ll/lr2;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ll/p2d0;

    .line 13
    .line 14
    iput-object p1, p0, Ll/m2d0;->j:Ll/p2d0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw p1
.end method

.method public declared-synchronized z(Ll/cli0;Ll/y1d0;)V
    .locals 1
    .param p1    # Ll/cli0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/y1d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cli0<",
            "*>;",
            "Ll/y1d0;",
            ")V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/m2d0;->f:Ll/fli0;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ll/fli0;->h(Ll/cli0;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/m2d0;->d:Ll/e3d0;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ll/e3d0;->g(Ll/y1d0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw p1
.end method
