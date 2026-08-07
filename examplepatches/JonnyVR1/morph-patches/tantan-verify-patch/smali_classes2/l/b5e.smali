.class public Ll/b5e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jii;


# instance fields
.field public a:Ll/c5e;


# direct methods
.method public constructor <init>(Ll/c5e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b5e;->a:Ll/c5e;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Ll/b4e;Lcom/facebook/cache/disk/b;)Lcom/facebook/cache/disk/c;
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, v0}, Ll/b5e;->c(Ll/b4e;Lcom/facebook/cache/disk/b;Ljava/util/concurrent/Executor;)Lcom/facebook/cache/disk/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static c(Ll/b4e;Lcom/facebook/cache/disk/b;Ljava/util/concurrent/Executor;)Lcom/facebook/cache/disk/c;
    .locals 9

    .line 1
    new-instance v0, Lcom/facebook/cache/disk/c$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b4e;->k()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {p0}, Ll/b4e;->j()J

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    invoke-virtual {p0}, Ll/b4e;->f()J

    .line 12
    .line 13
    .line 14
    move-result-wide v5

    .line 15
    invoke-direct/range {v0 .. v6}, Lcom/facebook/cache/disk/c$c;-><init>(JJJ)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Lcom/facebook/cache/disk/c;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/b4e;->h()Ll/v2f;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {p0}, Ll/b4e;->e()Lcom/facebook/cache/common/CacheEventListener;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {p0}, Ll/b4e;->d()Lcom/facebook/cache/common/CacheErrorLogger;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {p0}, Ll/b4e;->g()Ll/e5e;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-virtual {p0}, Ll/b4e;->i()Z

    .line 37
    .line 38
    .line 39
    move-result v8

    .line 40
    move-object v7, p2

    .line 41
    move-object v3, v0

    .line 42
    move-object v0, v1

    .line 43
    move-object v1, p1

    .line 44
    invoke-direct/range {v0 .. v8}, Lcom/facebook/cache/disk/c;-><init>(Lcom/facebook/cache/disk/b;Ll/v2f;Lcom/facebook/cache/disk/c$c;Lcom/facebook/cache/common/CacheEventListener;Lcom/facebook/cache/common/CacheErrorLogger;Ll/e5e;Ljava/util/concurrent/Executor;Z)V

    .line 45
    .line 46
    .line 47
    return-object v0
.end method


# virtual methods
.method public a(Ll/b4e;)Ll/iii;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b5e;->a:Ll/c5e;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/c5e;->a(Ll/b4e;)Lcom/facebook/cache/disk/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/b5e;->b(Ll/b4e;Lcom/facebook/cache/disk/b;)Lcom/facebook/cache/disk/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
