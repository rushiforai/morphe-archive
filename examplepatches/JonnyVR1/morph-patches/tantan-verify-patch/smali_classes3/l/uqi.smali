.class public Ll/uqi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z = false

.field public static b:J = 0x0L

.field public static c:Z = false

.field public static d:Z = false

.field public static e:Z = true

.field public static f:J

.field public static g:J

.field public static h:J

.field public static i:J

.field public static j:J

.field public static k:J

.field public static l:Z

.field public static m:Z

.field public static n:Ljava/util/concurrent/atomic/AtomicInteger;

.field public static o:Z

.field public static p:Z

.field public static q:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Lcom/p1/mobile/putong/util/launch/LaunchStep;",
            "Ll/t4g0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/uqi;->n:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    sput-boolean v1, Ll/uqi;->o:Z

    .line 10
    .line 11
    sput-boolean v1, Ll/uqi;->p:Z

    .line 12
    .line 13
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    sput-object v0, Ll/uqi;->q:Ljava/util/LinkedHashMap;

    .line 19
    .line 20
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

.method public static a(Z)V
    .locals 2

    .line 1
    sget-boolean v0, Ll/uqi;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-boolean v0, Ll/uqi;->e:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sput-boolean p0, Ll/uqi;->d:Z

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sput-boolean v1, Ll/uqi;->d:Z

    .line 14
    .line 15
    :goto_0
    sput-boolean v1, Ll/uqi;->e:Z

    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public static b()V
    .locals 8

    .line 1
    sget-object v0, Ll/uqi;->q:Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->AdConsum:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/t4g0;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-wide v1, v0, Ll/t4g0;->d:J

    .line 15
    .line 16
    iget-wide v3, v0, Ll/t4g0;->c:J

    .line 17
    .line 18
    sub-long/2addr v1, v3

    .line 19
    sget-object v0, Ll/uqi;->q:Ljava/util/LinkedHashMap;

    .line 20
    .line 21
    sget-object v3, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PutongArriveImgload:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 22
    .line 23
    invoke-virtual {v0, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/t4g0;

    .line 28
    .line 29
    sget-object v4, Ll/uqi;->q:Ljava/util/LinkedHashMap;

    .line 30
    .line 31
    sget-object v5, Lcom/p1/mobile/putong/util/launch/LaunchStep;->AppStartArriveImgload:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 32
    .line 33
    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    check-cast v4, Ll/t4g0;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    if-nez v4, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-wide v6, v0, Ll/t4g0;->d:J

    .line 45
    .line 46
    sub-long/2addr v6, v1

    .line 47
    iput-wide v6, v0, Ll/t4g0;->d:J

    .line 48
    .line 49
    iget-wide v6, v4, Ll/t4g0;->d:J

    .line 50
    .line 51
    sub-long/2addr v6, v1

    .line 52
    iput-wide v6, v4, Ll/t4g0;->d:J

    .line 53
    .line 54
    sget-object v1, Ll/uqi;->q:Ljava/util/LinkedHashMap;

    .line 55
    .line 56
    invoke-virtual {v1, v3, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    sget-object v0, Ll/uqi;->q:Ljava/util/LinkedHashMap;

    .line 60
    .line 61
    invoke-virtual {v0, v5, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    :cond_2
    :goto_0
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/util/launch/LaunchStep;)Ll/t4g0;
    .locals 6

    .line 1
    sget-object v0, Ll/uqi;->q:Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/t4g0;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-class v1, Ll/uqi;

    .line 12
    .line 13
    monitor-enter v1

    .line 14
    :try_start_0
    sget-object v0, Ll/uqi;->q:Ljava/util/LinkedHashMap;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/t4g0;

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    new-instance v0, Ll/t4g0;

    .line 25
    .line 26
    sget-object v2, Ll/uqi;->n:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-direct {v0, v2}, Ll/t4g0;-><init>(I)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 36
    .line 37
    .line 38
    move-result-wide v2

    .line 39
    sget-wide v4, Lcom/p1/mobile/putong/app/TantanApp;->m:J

    .line 40
    .line 41
    sub-long/2addr v2, v4

    .line 42
    iput-wide v2, v0, Ll/t4g0;->e:J

    .line 43
    .line 44
    sget-object v2, Ll/uqi;->q:Ljava/util/LinkedHashMap;

    .line 45
    .line 46
    invoke-virtual {v2, p0, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    :goto_0
    monitor-exit v1

    .line 53
    return-object v0

    .line 54
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw p0

    .line 56
    :cond_1
    return-object v0
.end method

.method public static d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V
    .locals 4

    .line 1
    invoke-static {p0}, Ll/uqi;->c(Lcom/p1/mobile/putong/util/launch/LaunchStep;)Ll/t4g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    sget-object v2, Ll/uqi;->n:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {p0, v0, v1, v2}, Ll/t4g0;->a(JI)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    sget-wide v2, Lcom/p1/mobile/putong/app/TantanApp;->m:J

    .line 29
    .line 30
    sub-long/2addr v0, v2

    .line 31
    iput-wide v0, p0, Ll/t4g0;->f:J

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/uqi;->g(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static varargs f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V
    .locals 3

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-static {v2}, Ll/uqi;->g(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/uqi;->c(Lcom/p1/mobile/putong/util/launch/LaunchStep;)Ll/t4g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-virtual {p0, v0, v1}, Ll/t4g0;->b(J)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static h()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Ll/uqi;->g:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    sput-wide v0, Ll/uqi;->h:J

    .line 9
    .line 10
    return-void
.end method

.method public static i()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sput-wide v0, Ll/uqi;->g:J

    .line 6
    .line 7
    sget-wide v2, Lcom/p1/mobile/putong/app/TantanApp;->f:J

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    sput-wide v0, Ll/uqi;->f:J

    .line 11
    .line 12
    return-void
.end method

.method public static j()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Ll/uqi;->b:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    sput-wide v0, Ll/uqi;->i:J

    .line 9
    .line 10
    return-void
.end method

.method public static k()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sput-wide v0, Ll/uqi;->b:J

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    sput-boolean v0, Ll/uqi;->a:Z

    .line 9
    .line 10
    return-void
.end method

.method public static l(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ll/uqi;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public static m(JLjava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/uqi;->q:Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    :try_start_0
    const-class p0, Ll/uqi;

    .line 12
    .line 13
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    :try_start_1
    new-instance p1, Ljava/util/LinkedHashSet;

    .line 15
    .line 16
    sget-object v0, Ll/uqi;->q:Ljava/util/LinkedHashMap;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-direct {p1, v0}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    :try_start_2
    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 30
    :catch_0
    move-exception p0

    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    new-instance p1, Ljava/util/HashSet;

    .line 35
    .line 36
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    :cond_0
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Ljava/util/Map$Entry;

    .line 54
    .line 55
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ll/t4g0;

    .line 60
    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    new-instance v1, Ll/pf60;

    .line 64
    .line 65
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/util/launch/LaunchStep;->getStepName()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-wide v2, v0, Ll/t4g0;->d:J

    .line 76
    .line 77
    iget-wide v4, v0, Ll/t4g0;->c:J

    .line 78
    .line 79
    sub-long/2addr v2, v4

    .line 80
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-direct {v1, p1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_1
    return-void
.end method

.method public static n(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 10
    .param p0    # Lcom/p1/mobile/putong/newui/main/base/TabName;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    sget-boolean v1, Ll/uqi;->c:Z

    .line 3
    .line 4
    if-nez v1, :cond_1

    .line 5
    .line 6
    sget-boolean v1, Ll/uqi;->d:Z

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    sget-boolean v1, Ll/uqi;->a:Z

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    sget-wide v1, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->i:J

    .line 15
    .line 16
    sget-wide v3, Lcom/p1/mobile/putong/app/TantanApp;->h:J

    .line 17
    .line 18
    cmp-long v1, v1, v3

    .line 19
    .line 20
    if-ltz v1, :cond_1

    .line 21
    .line 22
    sget-wide v1, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->i:J

    .line 23
    .line 24
    sget-wide v3, Lcom/p1/mobile/putong/app/TantanApp;->h:J

    .line 25
    .line 26
    sub-long/2addr v1, v3

    .line 27
    const-wide/16 v3, 0xbb8

    .line 28
    .line 29
    cmp-long v1, v1, v3

    .line 30
    .line 31
    if-gez v1, :cond_1

    .line 32
    .line 33
    sget-boolean v1, Ll/uqi;->l:Z

    .line 34
    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    sget-wide v4, Ll/uqi;->h:J

    .line 40
    .line 41
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 42
    .line 43
    .line 44
    move-result-wide v6

    .line 45
    sget-wide v8, Ll/uqi;->b:J

    .line 46
    .line 47
    sub-long/2addr v6, v8

    .line 48
    add-long/2addr v4, v6

    .line 49
    goto :goto_1

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    goto/16 :goto_3

    .line 52
    .line 53
    :cond_0
    sget-wide v4, Ll/uqi;->j:J

    .line 54
    .line 55
    cmp-long v1, v4, v2

    .line 56
    .line 57
    if-lez v1, :cond_2

    .line 58
    .line 59
    sget-wide v4, Ll/uqi;->k:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    .line 61
    cmp-long v1, v4, v2

    .line 62
    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    :cond_1
    :goto_0
    invoke-static {}, Ll/uqb0;->s0()V

    .line 66
    .line 67
    .line 68
    sput-boolean v0, Ll/uqi;->m:Z

    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    :try_start_1
    sget-wide v4, Ll/uqi;->h:J

    .line 72
    .line 73
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 74
    .line 75
    .line 76
    move-result-wide v6

    .line 77
    sget-wide v8, Ll/uqi;->b:J

    .line 78
    .line 79
    sub-long/2addr v6, v8

    .line 80
    add-long/2addr v4, v6

    .line 81
    sget-wide v6, Ll/uqi;->k:J

    .line 82
    .line 83
    sget-wide v8, Ll/uqi;->j:J

    .line 84
    .line 85
    sub-long/2addr v6, v8

    .line 86
    sub-long/2addr v4, v6

    .line 87
    :goto_1
    sget-wide v6, Ll/uqi;->f:J

    .line 88
    .line 89
    const-wide/16 v8, 0x7530

    .line 90
    .line 91
    cmp-long v1, v6, v8

    .line 92
    .line 93
    if-gez v1, :cond_3

    .line 94
    .line 95
    move-wide v2, v6

    .line 96
    :cond_3
    add-long/2addr v4, v2

    .line 97
    sput-boolean v0, Ll/uqi;->c:Z

    .line 98
    .line 99
    new-instance v1, Ll/q4f;

    .line 100
    .line 101
    invoke-direct {v1}, Ll/q4f;-><init>()V

    .line 102
    .line 103
    .line 104
    const-string v2, "e_OpenAppDuration"

    .line 105
    .line 106
    iput-object v2, v1, Ll/q4f;->s:Ljava/lang/String;

    .line 107
    .line 108
    sget-object v2, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 109
    .line 110
    iput-object v2, v1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 111
    .line 112
    const-string v2, "p_suggest_users_home_view"

    .line 113
    .line 114
    iput-object v2, v1, Ll/q4f;->n:Ljava/lang/String;

    .line 115
    .line 116
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->NewMainCreate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 117
    .line 118
    invoke-static {v2}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 119
    .line 120
    .line 121
    sget-boolean v2, Ll/uqi;->l:Z

    .line 122
    .line 123
    if-nez v2, :cond_4

    .line 124
    .line 125
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PutongArriveImgloadNoAd:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 126
    .line 127
    invoke-static {v2}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 128
    .line 129
    .line 130
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->AppStartArriveImgloadNoAd:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 131
    .line 132
    invoke-static {v2}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 133
    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PutongArriveImgload:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 137
    .line 138
    invoke-static {v2}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 139
    .line 140
    .line 141
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->AppStartArriveImgload:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 142
    .line 143
    invoke-static {v2}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 144
    .line 145
    .line 146
    :goto_2
    new-instance v2, Ljava/util/ArrayList;

    .line 147
    .line 148
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 149
    .line 150
    .line 151
    new-instance v3, Ll/pf60;

    .line 152
    .line 153
    const-string v6, "duration"

    .line 154
    .line 155
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 156
    .line 157
    .line 158
    move-result-object v7

    .line 159
    invoke-direct {v3, v6, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    new-instance v3, Ll/pf60;

    .line 166
    .line 167
    const-string v6, "app_dur"

    .line 168
    .line 169
    sget-wide v7, Ll/uqi;->h:J

    .line 170
    .line 171
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 172
    .line 173
    .line 174
    move-result-object v7

    .line 175
    invoke-direct {v3, v6, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    new-instance v3, Ll/pf60;

    .line 182
    .line 183
    const-string v6, "splash_dur"

    .line 184
    .line 185
    sget-wide v7, Ll/uqi;->i:J

    .line 186
    .line 187
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 188
    .line 189
    .line 190
    move-result-object v7

    .line 191
    invoke-direct {v3, v6, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    new-instance v3, Ll/pf60;

    .line 198
    .line 199
    const-string v6, "tab_type"

    .line 200
    .line 201
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-direct {v3, v6, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    new-instance p0, Ll/pf60;

    .line 212
    .line 213
    const-string v3, "show_ad"

    .line 214
    .line 215
    sget-boolean v6, Ll/uqi;->l:Z

    .line 216
    .line 217
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 218
    .line 219
    .line 220
    move-result-object v6

    .line 221
    invoke-direct {p0, v3, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 222
    .line 223
    .line 224
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    new-instance p0, Ll/pf60;

    .line 228
    .line 229
    const-string v3, "tantan_app_dur"

    .line 230
    .line 231
    sget-wide v6, Ll/uqi;->f:J

    .line 232
    .line 233
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 234
    .line 235
    .line 236
    move-result-object v6

    .line 237
    invoke-direct {p0, v3, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 238
    .line 239
    .line 240
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    new-instance p0, Ll/pf60;

    .line 244
    .line 245
    const-string v3, "is_home_imag_pre"

    .line 246
    .line 247
    sget-boolean v6, Ll/uqi;->o:Z

    .line 248
    .line 249
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 250
    .line 251
    .line 252
    move-result-object v6

    .line 253
    invoke-direct {p0, v3, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 254
    .line 255
    .line 256
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    new-instance p0, Ll/pf60;

    .line 260
    .line 261
    const-string v3, "oms_lable_ready"

    .line 262
    .line 263
    sget-boolean v6, Ll/uqi;->p:Z

    .line 264
    .line 265
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 266
    .line 267
    .line 268
    move-result-object v6

    .line 269
    invoke-direct {p0, v3, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 270
    .line 271
    .line 272
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    sget-boolean p0, Ll/uqi;->l:Z

    .line 276
    .line 277
    if-eqz p0, :cond_5

    .line 278
    .line 279
    invoke-static {}, Ll/uqi;->b()V

    .line 280
    .line 281
    .line 282
    :cond_5
    invoke-static {v4, v5, v2}, Ll/uqi;->m(JLjava/util/List;)V

    .line 283
    .line 284
    .line 285
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 286
    .line 287
    .line 288
    move-result p0

    .line 289
    new-array p0, p0, [Ll/pf60;

    .line 290
    .line 291
    invoke-interface {v2, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    check-cast p0, [Ll/pf60;

    .line 296
    .line 297
    invoke-static {v1, p0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 298
    .line 299
    .line 300
    goto/16 :goto_0

    .line 301
    .line 302
    :goto_3
    invoke-static {}, Ll/uqb0;->s0()V

    .line 303
    .line 304
    .line 305
    sput-boolean v0, Ll/uqi;->m:Z

    .line 306
    .line 307
    throw p0
.end method
