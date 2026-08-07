.class public final Ll/siw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/util/concurrent/Executor;

.field public final c:Ll/vhw0;

.field public final d:Ll/xhw0;

.field public final e:Ll/riw0;

.field public final f:Ll/riw0;

.field public g:Lcom/google/android/gms/tasks/Task;

.field public h:Lcom/google/android/gms/tasks/Task;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Ll/vhw0;Ll/xhw0;Ll/piw0;Ll/qiw0;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/siw0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/siw0;->b:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    iput-object p3, p0, Ll/siw0;->c:Ll/vhw0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/siw0;->d:Ll/xhw0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/siw0;->e:Ll/riw0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/siw0;->f:Ll/riw0;

    .line 15
    .line 16
    return-void
.end method

.method public static e(Landroid/content/Context;Ljava/util/concurrent/Executor;Ll/vhw0;Ll/xhw0;)Ll/siw0;
    .locals 7
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/vhw0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/xhw0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/siw0;

    .line 2
    .line 3
    new-instance v5, Ll/piw0;

    .line 4
    .line 5
    invoke-direct {v5}, Ll/piw0;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v6, Ll/qiw0;

    .line 9
    .line 10
    invoke-direct {v6}, Ll/qiw0;-><init>()V

    .line 11
    .line 12
    .line 13
    move-object v1, p0

    .line 14
    move-object v2, p1

    .line 15
    move-object v3, p2

    .line 16
    move-object v4, p3

    .line 17
    invoke-direct/range {v0 .. v6}, Ll/siw0;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Ll/vhw0;Ll/xhw0;Ll/piw0;Ll/qiw0;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, v0, Ll/siw0;->d:Ll/xhw0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xhw0;->d()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    new-instance p0, Ll/miw0;

    .line 29
    .line 30
    invoke-direct {p0, v0}, Ll/miw0;-><init>(Ll/siw0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ll/siw0;->h(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iput-object p0, v0, Ll/siw0;->g:Lcom/google/android/gms/tasks/Task;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object p0, v0, Ll/siw0;->e:Ll/riw0;

    .line 41
    .line 42
    invoke-interface {p0}, Ll/riw0;->zza()Lcom/google/android/gms/internal/ads/n;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Ll/toi0;->f(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iput-object p0, v0, Ll/siw0;->g:Lcom/google/android/gms/tasks/Task;

    .line 51
    .line 52
    :goto_0
    new-instance p0, Ll/niw0;

    .line 53
    .line 54
    invoke-direct {p0, v0}, Ll/niw0;-><init>(Ll/siw0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ll/siw0;->h(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iput-object p0, v0, Ll/siw0;->h:Lcom/google/android/gms/tasks/Task;

    .line 62
    .line 63
    return-object v0
.end method

.method public static g(Lcom/google/android/gms/tasks/Task;Lcom/google/android/gms/internal/ads/n;)Lcom/google/android/gms/internal/ads/n;
    .locals 1
    .param p0    # Lcom/google/android/gms/tasks/Task;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/google/android/gms/internal/ads/n;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/google/android/gms/internal/ads/n;

    .line 13
    .line 14
    return-object p0
.end method


# virtual methods
.method public final a()Lcom/google/android/gms/internal/ads/n;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/siw0;->e:Ll/riw0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/siw0;->g:Lcom/google/android/gms/tasks/Task;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/riw0;->zza()Lcom/google/android/gms/internal/ads/n;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Ll/siw0;->g(Lcom/google/android/gms/tasks/Task;Lcom/google/android/gms/internal/ads/n;)Lcom/google/android/gms/internal/ads/n;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final b()Lcom/google/android/gms/internal/ads/n;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/siw0;->f:Ll/riw0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/siw0;->h:Lcom/google/android/gms/tasks/Task;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/riw0;->zza()Lcom/google/android/gms/internal/ads/n;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Ll/siw0;->g(Lcom/google/android/gms/tasks/Task;Lcom/google/android/gms/internal/ads/n;)Lcom/google/android/gms/internal/ads/n;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic c()Lcom/google/android/gms/internal/ads/n;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/n;->l0()Ll/fzr0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/siw0;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$a;->a()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    const-string v2, "^[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}$"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/16 v2, 0x10

    .line 30
    .line 31
    new-array v2, v2, [B

    .line 32
    .line 33
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v1}, Ljava/util/UUID;->getMostSignificantBits()J

    .line 38
    .line 39
    .line 40
    move-result-wide v4

    .line 41
    invoke-virtual {v3, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/util/UUID;->getLeastSignificantBits()J

    .line 45
    .line 46
    .line 47
    move-result-wide v4

    .line 48
    invoke-virtual {v3, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 49
    .line 50
    .line 51
    const/16 v1, 0xb

    .line 52
    .line 53
    invoke-static {v2, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    :cond_0
    if-eqz v1, :cond_1

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ll/fzr0;->t0(Ljava/lang/String;)Ll/fzr0;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$a;->b()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-virtual {v0, p0}, Ll/fzr0;->s0(Z)Ll/fzr0;

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x6

    .line 70
    invoke-virtual {v0, p0}, Ll/fzr0;->W(I)Ll/fzr0;

    .line 71
    .line 72
    .line 73
    :cond_1
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Lcom/google/android/gms/internal/ads/n;

    .line 78
    .line 79
    return-object p0
.end method

.method public final synthetic d()Lcom/google/android/gms/internal/ads/n;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/siw0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 21
    .line 22
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {p0, v1, v0}, Ll/diw0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/internal/ads/n;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final synthetic f(Ljava/lang/Exception;)V
    .locals 3

    .line 1
    instance-of v0, p1, Ljava/lang/InterruptedException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/siw0;->c:Ll/vhw0;

    .line 13
    .line 14
    const/16 v0, 0x7e9

    .line 15
    .line 16
    const-wide/16 v1, -0x1

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1, v2, p1}, Ll/vhw0;->c(IJLjava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final h(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .param p1    # Ljava/util/concurrent/Callable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/siw0;->b:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/toi0;->c(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ll/oiw0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/oiw0;-><init>(Ll/siw0;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/siw0;->b:Ljava/util/concurrent/Executor;

    .line 13
    .line 14
    invoke-virtual {p1, p0, v0}, Lcom/google/android/gms/tasks/Task;->c(Ljava/util/concurrent/Executor;Ll/fm50;)Lcom/google/android/gms/tasks/Task;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
