.class Lcom/tencent/liteav/beauty/b/x$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/beauty/b/x;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/beauty/b/x;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/beauty/b/x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/x$1;->a:Lcom/tencent/liteav/beauty/b/x;

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
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/x$1;->a:Lcom/tencent/liteav/beauty/b/x;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/beauty/b/x;->a(Lcom/tencent/liteav/beauty/b/x;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/x$1;->a:Lcom/tencent/liteav/beauty/b/x;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/tencent/liteav/beauty/b/x;->b(Lcom/tencent/liteav/beauty/b/x;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/x$1;->a:Lcom/tencent/liteav/beauty/b/x;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tencent/liteav/beauty/b/x;->a(Lcom/tencent/liteav/beauty/b/x;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 20
    .line 21
    .line 22
    monitor-exit v0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method
