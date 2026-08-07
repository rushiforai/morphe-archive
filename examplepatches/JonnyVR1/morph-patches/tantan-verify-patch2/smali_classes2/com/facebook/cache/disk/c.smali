.class public Lcom/facebook/cache/disk/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iii;
.implements Ll/d5e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/cache/disk/c$c;,
        Lcom/facebook/cache/disk/c$b;
    }
.end annotation


# static fields
.field public static final r:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final s:J

.field public static final t:J


# instance fields
.field public final a:J

.field public final b:J

.field public final c:Ljava/util/concurrent/CountDownLatch;

.field public d:J

.field public final e:Lcom/facebook/cache/common/CacheEventListener;

.field public final f:Ljava/util/Set;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:J

.field public final h:J

.field public final i:Lcom/facebook/common/statfs/StatFsHelper;

.field public final j:Lcom/facebook/cache/disk/b;

.field public final k:Ll/v2f;

.field public final l:Lcom/facebook/cache/common/CacheErrorLogger;

.field public final m:Z

.field public final n:Lcom/facebook/cache/disk/c$b;

.field public final o:Ll/pa5;

.field public final p:Ljava/lang/Object;

.field public q:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Lcom/facebook/cache/disk/c;

    .line 2
    .line 3
    sput-object v0, Lcom/facebook/cache/disk/c;->r:Ljava/lang/Class;

    .line 4
    .line 5
    const-wide/32 v0, 0x6ddd00

    .line 6
    .line 7
    .line 8
    sput-wide v0, Lcom/facebook/cache/disk/c;->s:J

    .line 9
    .line 10
    const-wide/32 v0, 0x1b7740

    .line 11
    .line 12
    .line 13
    sput-wide v0, Lcom/facebook/cache/disk/c;->t:J

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Lcom/facebook/cache/disk/b;Ll/v2f;Lcom/facebook/cache/disk/c$c;Lcom/facebook/cache/common/CacheEventListener;Lcom/facebook/cache/common/CacheErrorLogger;Ll/e5e;Ljava/util/concurrent/Executor;Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/facebook/cache/disk/c;->p:Ljava/lang/Object;

    .line 10
    .line 11
    iget-wide v0, p3, Lcom/facebook/cache/disk/c$c;->b:J

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/facebook/cache/disk/c;->a:J

    .line 14
    .line 15
    iget-wide v0, p3, Lcom/facebook/cache/disk/c$c;->c:J

    .line 16
    .line 17
    iput-wide v0, p0, Lcom/facebook/cache/disk/c;->b:J

    .line 18
    .line 19
    iput-wide v0, p0, Lcom/facebook/cache/disk/c;->d:J

    .line 20
    .line 21
    invoke-static {}, Lcom/facebook/common/statfs/StatFsHelper;->d()Lcom/facebook/common/statfs/StatFsHelper;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/facebook/cache/disk/c;->i:Lcom/facebook/common/statfs/StatFsHelper;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/facebook/cache/disk/c;->j:Lcom/facebook/cache/disk/b;

    .line 28
    .line 29
    iput-object p2, p0, Lcom/facebook/cache/disk/c;->k:Ll/v2f;

    .line 30
    .line 31
    const-wide/16 p1, -0x1

    .line 32
    .line 33
    iput-wide p1, p0, Lcom/facebook/cache/disk/c;->g:J

    .line 34
    .line 35
    iput-object p4, p0, Lcom/facebook/cache/disk/c;->e:Lcom/facebook/cache/common/CacheEventListener;

    .line 36
    .line 37
    iget-wide p1, p3, Lcom/facebook/cache/disk/c$c;->a:J

    .line 38
    .line 39
    iput-wide p1, p0, Lcom/facebook/cache/disk/c;->h:J

    .line 40
    .line 41
    iput-object p5, p0, Lcom/facebook/cache/disk/c;->l:Lcom/facebook/cache/common/CacheErrorLogger;

    .line 42
    .line 43
    new-instance p1, Lcom/facebook/cache/disk/c$b;

    .line 44
    .line 45
    invoke-direct {p1}, Lcom/facebook/cache/disk/c$b;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lcom/facebook/cache/disk/c;->n:Lcom/facebook/cache/disk/c$b;

    .line 49
    .line 50
    invoke-static {}, Ll/bph0;->a()Ll/bph0;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/facebook/cache/disk/c;->o:Ll/pa5;

    .line 55
    .line 56
    iput-boolean p8, p0, Lcom/facebook/cache/disk/c;->m:Z

    .line 57
    .line 58
    new-instance p1, Ljava/util/HashSet;

    .line 59
    .line 60
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 64
    .line 65
    if-eqz p6, :cond_0

    .line 66
    .line 67
    invoke-interface {p6, p0}, Ll/e5e;->a(Ll/d5e;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    if-eqz p8, :cond_1

    .line 71
    .line 72
    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    .line 73
    .line 74
    const/4 p2, 0x1

    .line 75
    invoke-direct {p1, p2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 76
    .line 77
    .line 78
    iput-object p1, p0, Lcom/facebook/cache/disk/c;->c:Ljava/util/concurrent/CountDownLatch;

    .line 79
    .line 80
    new-instance p1, Lcom/facebook/cache/disk/c$a;

    .line 81
    .line 82
    invoke-direct {p1, p0}, Lcom/facebook/cache/disk/c$a;-><init>(Lcom/facebook/cache/disk/c;)V

    .line 83
    .line 84
    .line 85
    invoke-interface {p7, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    .line 90
    .line 91
    const/4 p2, 0x0

    .line 92
    invoke-direct {p1, p2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 93
    .line 94
    .line 95
    iput-object p1, p0, Lcom/facebook/cache/disk/c;->c:Ljava/util/concurrent/CountDownLatch;

    .line 96
    .line 97
    return-void
.end method

.method public static bridge synthetic f(Lcom/facebook/cache/disk/c;)Ljava/util/concurrent/CountDownLatch;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/cache/disk/c;->c:Ljava/util/concurrent/CountDownLatch;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/facebook/cache/disk/c;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/cache/disk/c;->p:Ljava/lang/Object;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/facebook/cache/disk/c;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/facebook/cache/disk/c;->q:Z

    return-void
.end method

.method public static bridge synthetic i(Lcom/facebook/cache/disk/c;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/facebook/cache/disk/c;->o()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public a(Ll/by3;Ll/rkq0;)Ll/dy2;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/cve0;->a()Ll/cve0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/cve0;->d(Ll/by3;)Ll/cve0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/facebook/cache/disk/c;->e:Lcom/facebook/cache/common/CacheEventListener;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v1, v0}, Lcom/facebook/cache/common/CacheEventListener;->b(Lcom/facebook/cache/common/a;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/facebook/cache/disk/c;->p:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-enter v1

    .line 19
    :try_start_0
    invoke-static {p1}, Ll/dy3;->a(Ll/by3;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 24
    invoke-virtual {v0, v2}, Ll/cve0;->j(Ljava/lang/String;)Ll/cve0;

    .line 25
    .line 26
    .line 27
    :try_start_1
    invoke-virtual {p0, v2, p1}, Lcom/facebook/cache/disk/c;->q(Ljava/lang/String;Ll/by3;)Lcom/facebook/cache/disk/b$b;

    .line 28
    .line 29
    .line 30
    move-result-object v1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 31
    :try_start_2
    invoke-interface {v1, p2, p1}, Lcom/facebook/cache/disk/b$b;->a(Ll/rkq0;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1, p1, v2}, Lcom/facebook/cache/disk/c;->j(Lcom/facebook/cache/disk/b$b;Ll/by3;Ljava/lang/String;)Ll/dy2;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p1}, Ll/dy2;->size()J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    invoke-virtual {v0, v2, v3}, Ll/cve0;->i(J)Ll/cve0;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    iget-object v2, p0, Lcom/facebook/cache/disk/c;->n:Lcom/facebook/cache/disk/c$b;

    .line 47
    .line 48
    invoke-virtual {v2}, Lcom/facebook/cache/disk/c$b;->b()J

    .line 49
    .line 50
    .line 51
    move-result-wide v2

    .line 52
    invoke-virtual {p2, v2, v3}, Ll/cve0;->f(J)Ll/cve0;

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Lcom/facebook/cache/disk/c;->e:Lcom/facebook/cache/common/CacheEventListener;

    .line 56
    .line 57
    if-eqz p2, :cond_1

    .line 58
    .line 59
    invoke-interface {p2, v0}, Lcom/facebook/cache/common/CacheEventListener;->e(Lcom/facebook/cache/common/a;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :catchall_0
    move-exception p1

    .line 64
    goto :goto_2

    .line 65
    :cond_1
    :goto_0
    :try_start_3
    invoke-interface {v1}, Lcom/facebook/cache/disk/b$b;->cleanUp()Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-nez p2, :cond_2

    .line 70
    .line 71
    sget-object p2, Lcom/facebook/cache/disk/c;->r:Ljava/lang/Class;

    .line 72
    .line 73
    const-string v1, "Failed to delete temp file"

    .line 74
    .line 75
    invoke-static {p2, v1}, Ll/huf;->d(Ljava/lang/Class;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :catchall_1
    move-exception p0

    .line 80
    goto :goto_4

    .line 81
    :catch_0
    move-exception p1

    .line 82
    goto :goto_3

    .line 83
    :cond_2
    :goto_1
    invoke-virtual {v0}, Ll/cve0;->b()V

    .line 84
    .line 85
    .line 86
    return-object p1

    .line 87
    :goto_2
    :try_start_4
    invoke-interface {v1}, Lcom/facebook/cache/disk/b$b;->cleanUp()Z

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-nez p2, :cond_3

    .line 92
    .line 93
    sget-object p2, Lcom/facebook/cache/disk/c;->r:Ljava/lang/Class;

    .line 94
    .line 95
    const-string v1, "Failed to delete temp file"

    .line 96
    .line 97
    invoke-static {p2, v1}, Ll/huf;->d(Ljava/lang/Class;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_3
    throw p1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 101
    :goto_3
    :try_start_5
    invoke-virtual {v0, p1}, Ll/cve0;->h(Ljava/io/IOException;)Ll/cve0;

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/facebook/cache/disk/c;->e:Lcom/facebook/cache/common/CacheEventListener;

    .line 105
    .line 106
    if-eqz p0, :cond_4

    .line 107
    .line 108
    invoke-interface {p0, v0}, Lcom/facebook/cache/common/CacheEventListener;->f(Lcom/facebook/cache/common/a;)V

    .line 109
    .line 110
    .line 111
    :cond_4
    sget-object p0, Lcom/facebook/cache/disk/c;->r:Ljava/lang/Class;

    .line 112
    .line 113
    const-string p2, "Failed inserting a file into the cache"

    .line 114
    .line 115
    invoke-static {p0, p2, p1}, Ll/huf;->e(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 116
    .line 117
    .line 118
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 119
    :goto_4
    invoke-virtual {v0}, Ll/cve0;->b()V

    .line 120
    .line 121
    .line 122
    throw p0

    .line 123
    :catchall_2
    move-exception p0

    .line 124
    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 125
    throw p0
.end method

.method public b(Ll/by3;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/facebook/cache/disk/c;->p:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/facebook/cache/disk/c;->m(Ll/by3;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    return v2

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    :try_start_1
    invoke-static {p1}, Ll/dy3;->b(Ll/by3;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    move v4, v1

    .line 21
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-ge v4, v5, :cond_2

    .line 26
    .line 27
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    check-cast v5, Ljava/lang/String;

    .line 32
    .line 33
    iget-object v6, p0, Lcom/facebook/cache/disk/c;->j:Lcom/facebook/cache/disk/b;

    .line 34
    .line 35
    invoke-interface {v6, v5, p1}, Lcom/facebook/cache/disk/b;->c(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-eqz v6, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 42
    .line 43
    invoke-interface {p0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    .line 45
    .line 46
    :try_start_2
    monitor-exit v0

    .line 47
    return v2

    .line 48
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    monitor-exit v0

    .line 52
    return v1

    .line 53
    :catch_0
    monitor-exit v0

    .line 54
    return v1

    .line 55
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 56
    throw p0
.end method

.method public c(Ll/by3;)Ll/dy2;
    .locals 8

    .line 1
    invoke-static {}, Ll/cve0;->a()Ll/cve0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/cve0;->d(Ll/by3;)Ll/cve0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    :try_start_0
    iget-object v2, p0, Lcom/facebook/cache/disk/c;->p:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    :try_start_1
    invoke-static {p1}, Ll/dy3;->b(Ll/by3;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const/4 v4, 0x0

    .line 18
    move-object v5, v1

    .line 19
    move-object v6, v5

    .line 20
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v7

    .line 24
    if-ge v4, v7, :cond_1

    .line 25
    .line 26
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    check-cast v5, Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v5}, Ll/cve0;->j(Ljava/lang/String;)Ll/cve0;

    .line 33
    .line 34
    .line 35
    iget-object v6, p0, Lcom/facebook/cache/disk/c;->j:Lcom/facebook/cache/disk/b;

    .line 36
    .line 37
    invoke-interface {v6, v5, p1}, Lcom/facebook/cache/disk/b;->f(Ljava/lang/String;Ljava/lang/Object;)Ll/dy2;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    if-eqz v6, :cond_0

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception p1

    .line 48
    goto :goto_3

    .line 49
    :cond_1
    :goto_1
    if-nez v6, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Lcom/facebook/cache/disk/c;->e:Lcom/facebook/cache/common/CacheEventListener;

    .line 52
    .line 53
    if-eqz p1, :cond_2

    .line 54
    .line 55
    invoke-interface {p1, v0}, Lcom/facebook/cache/common/CacheEventListener;->d(Lcom/facebook/cache/common/a;)V

    .line 56
    .line 57
    .line 58
    :cond_2
    iget-object p1, p0, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 59
    .line 60
    invoke-interface {p1, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_3
    invoke-static {v5}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/facebook/cache/disk/c;->e:Lcom/facebook/cache/common/CacheEventListener;

    .line 68
    .line 69
    if-eqz p1, :cond_4

    .line 70
    .line 71
    invoke-interface {p1, v0}, Lcom/facebook/cache/common/CacheEventListener;->g(Lcom/facebook/cache/common/a;)V

    .line 72
    .line 73
    .line 74
    :cond_4
    iget-object p1, p0, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 75
    .line 76
    invoke-interface {p1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    :goto_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    invoke-virtual {v0}, Ll/cve0;->b()V

    .line 81
    .line 82
    .line 83
    return-object v6

    .line 84
    :goto_3
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 85
    :try_start_3
    throw p1
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 86
    :catchall_1
    move-exception p0

    .line 87
    goto :goto_4

    .line 88
    :catch_0
    move-exception p1

    .line 89
    :try_start_4
    iget-object v2, p0, Lcom/facebook/cache/disk/c;->l:Lcom/facebook/cache/common/CacheErrorLogger;

    .line 90
    .line 91
    sget-object v3, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->GENERIC_IO:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    .line 92
    .line 93
    sget-object v4, Lcom/facebook/cache/disk/c;->r:Ljava/lang/Class;

    .line 94
    .line 95
    const-string v5, "getResource"

    .line 96
    .line 97
    invoke-interface {v2, v3, v4, v5, p1}, Lcom/facebook/cache/common/CacheErrorLogger;->a(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, p1}, Ll/cve0;->h(Ljava/io/IOException;)Ll/cve0;

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lcom/facebook/cache/disk/c;->e:Lcom/facebook/cache/common/CacheEventListener;

    .line 104
    .line 105
    if-eqz p0, :cond_5

    .line 106
    .line 107
    invoke-interface {p0, v0}, Lcom/facebook/cache/common/CacheEventListener;->a(Lcom/facebook/cache/common/a;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 108
    .line 109
    .line 110
    :cond_5
    invoke-virtual {v0}, Ll/cve0;->b()V

    .line 111
    .line 112
    .line 113
    return-object v1

    .line 114
    :goto_4
    invoke-virtual {v0}, Ll/cve0;->b()V

    .line 115
    .line 116
    .line 117
    throw p0
.end method

.method public d(Ll/by3;)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    iget-object v2, p0, Lcom/facebook/cache/disk/c;->p:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 6
    :try_start_1
    invoke-static {p1}, Ll/dy3;->b(Ll/by3;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    move v4, v0

    .line 11
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    if-ge v4, v5, :cond_1

    .line 16
    .line 17
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    check-cast v5, Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 22
    .line 23
    :try_start_2
    iget-object v1, p0, Lcom/facebook/cache/disk/c;->j:Lcom/facebook/cache/disk/b;

    .line 24
    .line 25
    invoke-interface {v1, v5, p1}, Lcom/facebook/cache/disk/b;->e(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 32
    .line 33
    invoke-interface {v1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 38
    return v1

    .line 39
    :catchall_0
    move-exception v1

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 42
    .line 43
    move-object v1, v5

    .line 44
    goto :goto_0

    .line 45
    :catchall_1
    move-exception v3

    .line 46
    move-object v5, v1

    .line 47
    move-object v1, v3

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 50
    return v0

    .line 51
    :goto_1
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 52
    :try_start_5
    throw v1
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 53
    :catch_0
    move-exception v1

    .line 54
    goto :goto_2

    .line 55
    :catch_1
    move-exception v2

    .line 56
    move-object v5, v1

    .line 57
    move-object v1, v2

    .line 58
    :goto_2
    invoke-static {}, Ll/cve0;->a()Ll/cve0;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2, p1}, Ll/cve0;->d(Ll/by3;)Ll/cve0;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1, v5}, Ll/cve0;->j(Ljava/lang/String;)Ll/cve0;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1, v1}, Ll/cve0;->h(Ljava/io/IOException;)Ll/cve0;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p0, p0, Lcom/facebook/cache/disk/c;->e:Lcom/facebook/cache/common/CacheEventListener;

    .line 75
    .line 76
    if-eqz p0, :cond_2

    .line 77
    .line 78
    invoke-interface {p0, p1}, Lcom/facebook/cache/common/CacheEventListener;->a(Lcom/facebook/cache/common/a;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    invoke-virtual {p1}, Ll/cve0;->b()V

    .line 82
    .line 83
    .line 84
    return v0
.end method

.method public e(Ll/by3;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/facebook/cache/disk/c;->p:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {p1}, Ll/dy3;->b(Ll/by3;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v1, v2, :cond_0

    .line 14
    .line 15
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p0, Lcom/facebook/cache/disk/c;->j:Lcom/facebook/cache/disk/b;

    .line 22
    .line 23
    invoke-interface {v3, v2}, Lcom/facebook/cache/disk/b;->remove(Ljava/lang/String;)J

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 27
    .line 28
    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :catch_0
    move-exception p1

    .line 37
    :try_start_1
    iget-object p0, p0, Lcom/facebook/cache/disk/c;->l:Lcom/facebook/cache/common/CacheErrorLogger;

    .line 38
    .line 39
    sget-object v1, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->DELETE_FILE:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    .line 40
    .line 41
    sget-object v2, Lcom/facebook/cache/disk/c;->r:Ljava/lang/Class;

    .line 42
    .line 43
    new-instance v3, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v4, "delete: "

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-interface {p0, v1, v2, v3, p1}, Lcom/facebook/cache/common/CacheErrorLogger;->a(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    monitor-exit v0

    .line 68
    return-void

    .line 69
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    throw p0
.end method

.method public final j(Lcom/facebook/cache/disk/b$b;Ll/by3;Ljava/lang/String;)Ll/dy2;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/facebook/cache/disk/c;->p:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-interface {p1, p2}, Lcom/facebook/cache/disk/b$b;->b(Ljava/lang/Object;)Ll/dy2;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p2, p0, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 9
    .line 10
    invoke-interface {p2, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/facebook/cache/disk/c;->n:Lcom/facebook/cache/disk/c$b;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/dy2;->size()J

    .line 16
    .line 17
    .line 18
    move-result-wide p2

    .line 19
    const-wide/16 v1, 0x1

    .line 20
    .line 21
    invoke-virtual {p0, p2, p3, v1, v2}, Lcom/facebook/cache/disk/c$b;->c(JJ)V

    .line 22
    .line 23
    .line 24
    monitor-exit v0

    .line 25
    return-object p1

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public final k(JLcom/facebook/cache/common/CacheEventListener$EvictionReason;)V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-wide/from16 v2, p1

    .line 4
    .line 5
    :try_start_0
    iget-object v0, v1, Lcom/facebook/cache/disk/c;->j:Lcom/facebook/cache/disk/b;

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/facebook/cache/disk/b;->g()Ljava/util/Collection;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v1, v0}, Lcom/facebook/cache/disk/c;->l(Ljava/util/Collection;)Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    iget-object v4, v1, Lcom/facebook/cache/disk/c;->n:Lcom/facebook/cache/disk/c$b;

    .line 16
    .line 17
    invoke-virtual {v4}, Lcom/facebook/cache/disk/c$b;->b()J

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    sub-long v6, v4, v2

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v10, 0x0

    .line 28
    const-wide/16 v11, 0x0

    .line 29
    .line 30
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v13

    .line 34
    if-eqz v13, :cond_3

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v13

    .line 40
    check-cast v13, Lcom/facebook/cache/disk/b$a;

    .line 41
    .line 42
    cmp-long v14, v11, v6

    .line 43
    .line 44
    if-lez v14, :cond_0

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    iget-object v14, v1, Lcom/facebook/cache/disk/c;->j:Lcom/facebook/cache/disk/b;

    .line 48
    .line 49
    invoke-interface {v14, v13}, Lcom/facebook/cache/disk/b;->a(Lcom/facebook/cache/disk/b$a;)J

    .line 50
    .line 51
    .line 52
    move-result-wide v14

    .line 53
    const-wide/16 v16, 0x0

    .line 54
    .line 55
    iget-object v8, v1, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 56
    .line 57
    invoke-interface {v13}, Lcom/facebook/cache/disk/b$a;->getId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v9

    .line 61
    invoke-interface {v8, v9}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    cmp-long v8, v14, v16

    .line 65
    .line 66
    if-lez v8, :cond_2

    .line 67
    .line 68
    add-int/lit8 v10, v10, 0x1

    .line 69
    .line 70
    add-long/2addr v11, v14

    .line 71
    invoke-static {}, Ll/cve0;->a()Ll/cve0;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    invoke-interface {v13}, Lcom/facebook/cache/disk/b$a;->getId()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v9

    .line 79
    invoke-virtual {v8, v9}, Ll/cve0;->j(Ljava/lang/String;)Ll/cve0;

    .line 80
    .line 81
    .line 82
    move-result-object v8

    .line 83
    move-object/from16 v9, p3

    .line 84
    .line 85
    invoke-virtual {v8, v9}, Ll/cve0;->g(Lcom/facebook/cache/common/CacheEventListener$EvictionReason;)Ll/cve0;

    .line 86
    .line 87
    .line 88
    move-result-object v8

    .line 89
    invoke-virtual {v8, v14, v15}, Ll/cve0;->i(J)Ll/cve0;

    .line 90
    .line 91
    .line 92
    move-result-object v8

    .line 93
    sub-long v13, v4, v11

    .line 94
    .line 95
    invoke-virtual {v8, v13, v14}, Ll/cve0;->f(J)Ll/cve0;

    .line 96
    .line 97
    .line 98
    move-result-object v8

    .line 99
    invoke-virtual {v8, v2, v3}, Ll/cve0;->e(J)Ll/cve0;

    .line 100
    .line 101
    .line 102
    move-result-object v8

    .line 103
    iget-object v13, v1, Lcom/facebook/cache/disk/c;->e:Lcom/facebook/cache/common/CacheEventListener;

    .line 104
    .line 105
    if-eqz v13, :cond_1

    .line 106
    .line 107
    invoke-interface {v13, v8}, Lcom/facebook/cache/common/CacheEventListener;->c(Lcom/facebook/cache/common/a;)V

    .line 108
    .line 109
    .line 110
    :cond_1
    invoke-virtual {v8}, Ll/cve0;->b()V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_2
    move-object/from16 v9, p3

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_3
    :goto_1
    iget-object v0, v1, Lcom/facebook/cache/disk/c;->n:Lcom/facebook/cache/disk/c$b;

    .line 118
    .line 119
    neg-long v2, v11

    .line 120
    neg-int v4, v10

    .line 121
    int-to-long v4, v4

    .line 122
    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/facebook/cache/disk/c$b;->c(JJ)V

    .line 123
    .line 124
    .line 125
    iget-object v0, v1, Lcom/facebook/cache/disk/c;->j:Lcom/facebook/cache/disk/b;

    .line 126
    .line 127
    invoke-interface {v0}, Lcom/facebook/cache/disk/b;->d()V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :catch_0
    move-exception v0

    .line 132
    iget-object v1, v1, Lcom/facebook/cache/disk/c;->l:Lcom/facebook/cache/common/CacheErrorLogger;

    .line 133
    .line 134
    sget-object v2, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->EVICTION:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    .line 135
    .line 136
    sget-object v3, Lcom/facebook/cache/disk/c;->r:Ljava/lang/Class;

    .line 137
    .line 138
    new-instance v4, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    const-string v5, "evictAboveSize: "

    .line 141
    .line 142
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-interface {v1, v2, v3, v4, v0}, Lcom/facebook/cache/common/CacheErrorLogger;->a(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 157
    .line 158
    .line 159
    throw v0
.end method

.method public final l(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/facebook/cache/disk/b$a;",
            ">;)",
            "Ljava/util/Collection<",
            "Lcom/facebook/cache/disk/b$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/facebook/cache/disk/c;->o:Ll/pa5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pa5;->now()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    sget-wide v2, Lcom/facebook/cache/disk/c;->s:J

    .line 8
    .line 9
    add-long/2addr v0, v2

    .line 10
    new-instance v2, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 17
    .line 18
    .line 19
    new-instance v3, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-eqz v4, :cond_1

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    check-cast v4, Lcom/facebook/cache/disk/b$a;

    .line 43
    .line 44
    invoke-interface {v4}, Lcom/facebook/cache/disk/b$a;->getTimestamp()J

    .line 45
    .line 46
    .line 47
    move-result-wide v5

    .line 48
    cmp-long v5, v5, v0

    .line 49
    .line 50
    if-lez v5, :cond_0

    .line 51
    .line 52
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    iget-object p0, p0, Lcom/facebook/cache/disk/c;->k:Ll/v2f;

    .line 61
    .line 62
    invoke-interface {p0}, Ll/v2f;->get()Lcom/facebook/cache/disk/e;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {v3, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 70
    .line 71
    .line 72
    return-object v2
.end method

.method public m(Ll/by3;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/facebook/cache/disk/c;->p:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {p1}, Ll/dy3;->b(Ll/by3;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v1, 0x0

    .line 9
    move v2, v1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-ge v2, v3, :cond_1

    .line 15
    .line 16
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    check-cast v3, Ljava/lang/String;

    .line 21
    .line 22
    iget-object v4, p0, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 23
    .line 24
    invoke-interface {v4, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    monitor-exit v0

    .line 32
    return p0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    monitor-exit v0

    .line 39
    return v1

    .line 40
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    throw p0
.end method

.method public final n()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/facebook/cache/disk/c;->p:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/cache/disk/c;->o()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    invoke-virtual {p0}, Lcom/facebook/cache/disk/c;->r()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/facebook/cache/disk/c;->n:Lcom/facebook/cache/disk/c$b;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/facebook/cache/disk/c$b;->b()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    iget-wide v4, p0, Lcom/facebook/cache/disk/c;->d:J

    .line 18
    .line 19
    cmp-long v4, v2, v4

    .line 20
    .line 21
    if-lez v4, :cond_0

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Lcom/facebook/cache/disk/c;->n:Lcom/facebook/cache/disk/c$b;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/facebook/cache/disk/c$b;->e()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/facebook/cache/disk/c;->o()Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    iget-wide v4, p0, Lcom/facebook/cache/disk/c;->d:J

    .line 37
    .line 38
    cmp-long v1, v2, v4

    .line 39
    .line 40
    if-lez v1, :cond_1

    .line 41
    .line 42
    const-wide/16 v1, 0x9

    .line 43
    .line 44
    mul-long/2addr v4, v1

    .line 45
    const-wide/16 v1, 0xa

    .line 46
    .line 47
    div-long/2addr v4, v1

    .line 48
    sget-object v1, Lcom/facebook/cache/common/CacheEventListener$EvictionReason;->CACHE_FULL:Lcom/facebook/cache/common/CacheEventListener$EvictionReason;

    .line 49
    .line 50
    invoke-virtual {p0, v4, v5, v1}, Lcom/facebook/cache/disk/c;->k(JLcom/facebook/cache/common/CacheEventListener$EvictionReason;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    monitor-exit v0

    .line 54
    return-void

    .line 55
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0
.end method

.method public final o()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/facebook/cache/disk/c;->o:Ll/pa5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pa5;->now()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Lcom/facebook/cache/disk/c;->n:Lcom/facebook/cache/disk/c$b;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/facebook/cache/disk/c$b;->d()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    iget-wide v2, p0, Lcom/facebook/cache/disk/c;->g:J

    .line 16
    .line 17
    const-wide/16 v4, -0x1

    .line 18
    .line 19
    cmp-long v4, v2, v4

    .line 20
    .line 21
    if-eqz v4, :cond_1

    .line 22
    .line 23
    sub-long/2addr v0, v2

    .line 24
    sget-wide v2, Lcom/facebook/cache/disk/c;->t:J

    .line 25
    .line 26
    cmp-long v0, v0, v2

    .line 27
    .line 28
    if-lez v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0

    .line 33
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/facebook/cache/disk/c;->p()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public final p()Z
    .locals 24

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcom/facebook/cache/disk/c;->o:Ll/pa5;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/pa5;->now()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    sget-wide v4, Lcom/facebook/cache/disk/c;->s:J

    .line 10
    .line 11
    add-long/2addr v4, v2

    .line 12
    iget-boolean v0, v1, Lcom/facebook/cache/disk/c;->m:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, v1, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, v1, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-boolean v0, v1, Lcom/facebook/cache/disk/c;->m:Z

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    new-instance v0, Ljava/util/HashSet;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v0, 0x0

    .line 38
    :goto_0
    :try_start_0
    iget-object v8, v1, Lcom/facebook/cache/disk/c;->j:Lcom/facebook/cache/disk/b;

    .line 39
    .line 40
    invoke-interface {v8}, Lcom/facebook/cache/disk/b;->g()Ljava/util/Collection;

    .line 41
    .line 42
    .line 43
    move-result-object v8

    .line 44
    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object v8
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 48
    const-wide/16 v9, 0x0

    .line 49
    .line 50
    const-wide/16 v11, -0x1

    .line 51
    .line 52
    const/4 v7, 0x0

    .line 53
    const/4 v13, 0x0

    .line 54
    const/4 v14, 0x0

    .line 55
    const/4 v15, 0x0

    .line 56
    const/16 v16, 0x0

    .line 57
    .line 58
    :goto_1
    :try_start_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v17

    .line 62
    const/16 v18, 0x1

    .line 63
    .line 64
    if-eqz v17, :cond_4

    .line 65
    .line 66
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v17

    .line 70
    check-cast v17, Lcom/facebook/cache/disk/b$a;

    .line 71
    .line 72
    add-int/lit8 v14, v14, 0x1

    .line 73
    .line 74
    invoke-interface/range {v17 .. v17}, Lcom/facebook/cache/disk/b$a;->getSize()J

    .line 75
    .line 76
    .line 77
    move-result-wide v19

    .line 78
    add-long v9, v9, v19

    .line 79
    .line 80
    invoke-interface/range {v17 .. v17}, Lcom/facebook/cache/disk/b$a;->getTimestamp()J

    .line 81
    .line 82
    .line 83
    move-result-wide v19

    .line 84
    cmp-long v19, v19, v4

    .line 85
    .line 86
    if-lez v19, :cond_2

    .line 87
    .line 88
    add-int/lit8 v15, v15, 0x1

    .line 89
    .line 90
    int-to-long v6, v7

    .line 91
    invoke-interface/range {v17 .. v17}, Lcom/facebook/cache/disk/b$a;->getSize()J

    .line 92
    .line 93
    .line 94
    move-result-wide v20

    .line 95
    add-long v6, v6, v20

    .line 96
    .line 97
    long-to-int v7, v6

    .line 98
    invoke-interface/range {v17 .. v17}, Lcom/facebook/cache/disk/b$a;->getTimestamp()J

    .line 99
    .line 100
    .line 101
    move-result-wide v20

    .line 102
    move-wide/from16 v22, v4

    .line 103
    .line 104
    sub-long v4, v20, v2

    .line 105
    .line 106
    invoke-static {v4, v5, v11, v12}, Ljava/lang/Math;->max(JJ)J

    .line 107
    .line 108
    .line 109
    move-result-wide v4

    .line 110
    move-wide v11, v4

    .line 111
    move/from16 v13, v18

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :catch_0
    move-exception v0

    .line 115
    goto/16 :goto_3

    .line 116
    .line 117
    :cond_2
    move-wide/from16 v22, v4

    .line 118
    .line 119
    iget-boolean v4, v1, Lcom/facebook/cache/disk/c;->m:Z

    .line 120
    .line 121
    if-eqz v4, :cond_3

    .line 122
    .line 123
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    invoke-interface/range {v17 .. v17}, Lcom/facebook/cache/disk/b$a;->getId()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    :cond_3
    :goto_2
    move-wide/from16 v4, v22

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_4
    if-eqz v13, :cond_5

    .line 137
    .line 138
    iget-object v4, v1, Lcom/facebook/cache/disk/c;->l:Lcom/facebook/cache/common/CacheErrorLogger;

    .line 139
    .line 140
    sget-object v5, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->READ_INVALID_ENTRY:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    .line 141
    .line 142
    sget-object v6, Lcom/facebook/cache/disk/c;->r:Ljava/lang/Class;

    .line 143
    .line 144
    new-instance v8, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    const-string v13, "Future timestamp found in "

    .line 150
    .line 151
    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string v13, " files , with a total size of "

    .line 158
    .line 159
    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    const-string v7, " bytes, and a maximum time delta of "

    .line 166
    .line 167
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v8, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v7, "ms"

    .line 174
    .line 175
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v7

    .line 182
    const/4 v8, 0x0

    .line 183
    invoke-interface {v4, v5, v6, v7, v8}, Lcom/facebook/cache/common/CacheErrorLogger;->a(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 184
    .line 185
    .line 186
    :cond_5
    iget-object v4, v1, Lcom/facebook/cache/disk/c;->n:Lcom/facebook/cache/disk/c$b;

    .line 187
    .line 188
    invoke-virtual {v4}, Lcom/facebook/cache/disk/c$b;->a()J

    .line 189
    .line 190
    .line 191
    move-result-wide v4

    .line 192
    int-to-long v6, v14

    .line 193
    cmp-long v4, v4, v6

    .line 194
    .line 195
    if-nez v4, :cond_6

    .line 196
    .line 197
    iget-object v4, v1, Lcom/facebook/cache/disk/c;->n:Lcom/facebook/cache/disk/c$b;

    .line 198
    .line 199
    invoke-virtual {v4}, Lcom/facebook/cache/disk/c$b;->b()J

    .line 200
    .line 201
    .line 202
    move-result-wide v4

    .line 203
    cmp-long v4, v4, v9

    .line 204
    .line 205
    if-eqz v4, :cond_8

    .line 206
    .line 207
    :cond_6
    iget-boolean v4, v1, Lcom/facebook/cache/disk/c;->m:Z

    .line 208
    .line 209
    if-eqz v4, :cond_7

    .line 210
    .line 211
    iget-object v4, v1, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 212
    .line 213
    if-eq v4, v0, :cond_7

    .line 214
    .line 215
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    iget-object v4, v1, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 219
    .line 220
    invoke-interface {v4}, Ljava/util/Set;->clear()V

    .line 221
    .line 222
    .line 223
    iget-object v4, v1, Lcom/facebook/cache/disk/c;->f:Ljava/util/Set;

    .line 224
    .line 225
    invoke-interface {v4, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 226
    .line 227
    .line 228
    :cond_7
    iget-object v0, v1, Lcom/facebook/cache/disk/c;->n:Lcom/facebook/cache/disk/c$b;

    .line 229
    .line 230
    invoke-virtual {v0, v9, v10, v6, v7}, Lcom/facebook/cache/disk/c$b;->f(JJ)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 231
    .line 232
    .line 233
    :cond_8
    iput-wide v2, v1, Lcom/facebook/cache/disk/c;->g:J

    .line 234
    .line 235
    return v18

    .line 236
    :catch_1
    move-exception v0

    .line 237
    const/16 v16, 0x0

    .line 238
    .line 239
    :goto_3
    iget-object v1, v1, Lcom/facebook/cache/disk/c;->l:Lcom/facebook/cache/common/CacheErrorLogger;

    .line 240
    .line 241
    sget-object v2, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->GENERIC_IO:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    .line 242
    .line 243
    sget-object v3, Lcom/facebook/cache/disk/c;->r:Ljava/lang/Class;

    .line 244
    .line 245
    new-instance v4, Ljava/lang/StringBuilder;

    .line 246
    .line 247
    const-string v5, "calcFileCacheSize: "

    .line 248
    .line 249
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v5

    .line 256
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v4

    .line 263
    invoke-interface {v1, v2, v3, v4, v0}, Lcom/facebook/cache/common/CacheErrorLogger;->a(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 264
    .line 265
    .line 266
    return v16
.end method

.method public final q(Ljava/lang/String;Ll/by3;)Lcom/facebook/cache/disk/b$b;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/facebook/cache/disk/c;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/facebook/cache/disk/c;->j:Lcom/facebook/cache/disk/b;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2}, Lcom/facebook/cache/disk/b;->b(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/cache/disk/b$b;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final r()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/facebook/cache/disk/c;->j:Lcom/facebook/cache/disk/b;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/facebook/cache/disk/b;->isExternal()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/facebook/common/statfs/StatFsHelper$StorageType;->EXTERNAL:Lcom/facebook/common/statfs/StatFsHelper$StorageType;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v0, Lcom/facebook/common/statfs/StatFsHelper$StorageType;->INTERNAL:Lcom/facebook/common/statfs/StatFsHelper$StorageType;

    .line 13
    .line 14
    :goto_0
    iget-object v1, p0, Lcom/facebook/cache/disk/c;->i:Lcom/facebook/common/statfs/StatFsHelper;

    .line 15
    .line 16
    iget-wide v2, p0, Lcom/facebook/cache/disk/c;->b:J

    .line 17
    .line 18
    iget-object v4, p0, Lcom/facebook/cache/disk/c;->n:Lcom/facebook/cache/disk/c$b;

    .line 19
    .line 20
    invoke-virtual {v4}, Lcom/facebook/cache/disk/c$b;->b()J

    .line 21
    .line 22
    .line 23
    move-result-wide v4

    .line 24
    sub-long/2addr v2, v4

    .line 25
    invoke-virtual {v1, v0, v2, v3}, Lcom/facebook/common/statfs/StatFsHelper;->f(Lcom/facebook/common/statfs/StatFsHelper$StorageType;J)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-wide v0, p0, Lcom/facebook/cache/disk/c;->a:J

    .line 32
    .line 33
    iput-wide v0, p0, Lcom/facebook/cache/disk/c;->d:J

    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-wide v0, p0, Lcom/facebook/cache/disk/c;->b:J

    .line 37
    .line 38
    iput-wide v0, p0, Lcom/facebook/cache/disk/c;->d:J

    .line 39
    .line 40
    return-void
.end method
