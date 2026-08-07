.class public Lcom/facebook/cache/disk/c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/cache/disk/c;-><init>(Lcom/facebook/cache/disk/b;Ll/v2f;Lcom/facebook/cache/disk/c$c;Lcom/facebook/cache/common/CacheEventListener;Lcom/facebook/cache/common/CacheErrorLogger;Ll/e5e;Ljava/util/concurrent/Executor;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/facebook/cache/disk/c;


# direct methods
.method public constructor <init>(Lcom/facebook/cache/disk/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/cache/disk/c$a;->a:Lcom/facebook/cache/disk/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/facebook/cache/disk/c$a;->a:Lcom/facebook/cache/disk/c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/facebook/cache/disk/c;->g(Lcom/facebook/cache/disk/c;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/facebook/cache/disk/c$a;->a:Lcom/facebook/cache/disk/c;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/facebook/cache/disk/c;->i(Lcom/facebook/cache/disk/c;)Z

    .line 11
    .line 12
    .line 13
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    iget-object v0, p0, Lcom/facebook/cache/disk/c$a;->a:Lcom/facebook/cache/disk/c;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-static {v0, v1}, Lcom/facebook/cache/disk/c;->h(Lcom/facebook/cache/disk/c;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/facebook/cache/disk/c$a;->a:Lcom/facebook/cache/disk/c;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/facebook/cache/disk/c;->f(Lcom/facebook/cache/disk/c;)Ljava/util/concurrent/CountDownLatch;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw p0
.end method
