.class public final Ll/a7z0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ll/v6z0;

.field public static final e:Ll/v6z0;

.field public static final f:Ll/v6z0;

.field public static final g:Ll/v6z0;


# instance fields
.field public final a:Ljava/util/concurrent/ExecutorService;

.field public b:Ll/w6z0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ljava/io/IOException;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ll/v6z0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v0, v1, v2, v3, v4}, Ll/v6z0;-><init>(IJLl/u6z0;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/a7z0;->d:Ll/v6z0;

    .line 14
    .line 15
    new-instance v0, Ll/v6z0;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-direct {v0, v1, v2, v3, v4}, Ll/v6z0;-><init>(IJLl/u6z0;)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Ll/a7z0;->e:Ll/v6z0;

    .line 22
    .line 23
    new-instance v0, Ll/v6z0;

    .line 24
    .line 25
    const/4 v1, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v3, v4}, Ll/v6z0;-><init>(IJLl/u6z0;)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Ll/a7z0;->f:Ll/v6z0;

    .line 30
    .line 31
    new-instance v0, Ll/v6z0;

    .line 32
    .line 33
    const/4 v1, 0x3

    .line 34
    invoke-direct {v0, v1, v2, v3, v4}, Ll/v6z0;-><init>(IJLl/u6z0;)V

    .line 35
    .line 36
    .line 37
    sput-object v0, Ll/a7z0;->g:Ll/v6z0;

    .line 38
    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string p1, "ExoPlayer:Loader:ProgressiveMediaPeriod"

    .line 5
    .line 6
    invoke-static {p1}, Ll/mpw0;->d(Ljava/lang/String;)Ljava/util/concurrent/ExecutorService;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/a7z0;->a:Ljava/util/concurrent/ExecutorService;

    .line 11
    .line 12
    return-void
.end method

.method public static b(ZJ)Ll/v6z0;
    .locals 2

    .line 1
    new-instance v0, Ll/v6z0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, p1, p2, v1}, Ll/v6z0;-><init>(IJLl/u6z0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static bridge synthetic c(Ll/a7z0;)Ll/w6z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a7z0;->b:Ll/w6z0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic d(Ll/a7z0;)Ljava/util/concurrent/ExecutorService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a7z0;->a:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic e(Ll/a7z0;Ll/w6z0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a7z0;->b:Ll/w6z0;

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic f(Ll/a7z0;Ljava/io/IOException;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a7z0;->c:Ljava/io/IOException;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final a(Ll/x6z0;Ll/t6z0;I)J
    .locals 8

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    invoke-static {v2}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/a7z0;->c:Ljava/io/IOException;

    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v6

    .line 15
    new-instance v0, Ll/w6z0;

    .line 16
    .line 17
    move-object v1, p0

    .line 18
    move-object v3, p1

    .line 19
    move-object v4, p2

    .line 20
    move v5, p3

    .line 21
    invoke-direct/range {v0 .. v7}, Ll/w6z0;-><init>(Ll/a7z0;Landroid/os/Looper;Ll/x6z0;Ll/t6z0;IJ)V

    .line 22
    .line 23
    .line 24
    const-wide/16 p0, 0x0

    .line 25
    .line 26
    invoke-virtual {v0, p0, p1}, Ll/w6z0;->c(J)V

    .line 27
    .line 28
    .line 29
    return-wide v6
.end method

.method public final g()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/a7z0;->b:Ll/w6z0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Ll/w6z0;->a(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final h()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/a7z0;->c:Ljava/io/IOException;

    .line 3
    .line 4
    return-void
.end method

.method public final i(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/a7z0;->c:Ljava/io/IOException;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/a7z0;->b:Ll/w6z0;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/w6z0;->b(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    throw v0
.end method

.method public final j(Ll/y6z0;)V
    .locals 2
    .param p1    # Ll/y6z0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/a7z0;->b:Ll/w6z0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/w6z0;->a(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ll/a7z0;->a:Ljava/util/concurrent/ExecutorService;

    .line 10
    .line 11
    new-instance v1, Ll/z6z0;

    .line 12
    .line 13
    invoke-direct {v1, p1}, Ll/z6z0;-><init>(Ll/y6z0;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/a7z0;->a:Ljava/util/concurrent/ExecutorService;

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a7z0;->c:Ljava/io/IOException;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a7z0;->b:Ll/w6z0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
