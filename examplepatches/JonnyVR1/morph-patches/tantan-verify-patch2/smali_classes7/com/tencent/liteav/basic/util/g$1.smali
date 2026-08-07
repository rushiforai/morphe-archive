.class Lcom/tencent/liteav/basic/util/g$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/basic/util/g;->a(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/Runnable;

.field final synthetic b:[Z

.field final synthetic c:Lcom/tencent/liteav/basic/util/g;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/util/g;Ljava/lang/Runnable;[Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/basic/util/g$1;->c:Lcom/tencent/liteav/basic/util/g;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/basic/util/g$1;->a:Ljava/lang/Runnable;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/basic/util/g$1;->b:[Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/util/g$1;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/liteav/basic/util/g$1;->b:[Z

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    aput-boolean v2, v0, v1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/liteav/basic/util/g$1;->c:Lcom/tencent/liteav/basic/util/g;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tencent/liteav/basic/util/g;->a(Lcom/tencent/liteav/basic/util/g;)Landroid/os/Handler;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    monitor-enter v0

    .line 19
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/basic/util/g$1;->c:Lcom/tencent/liteav/basic/util/g;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/tencent/liteav/basic/util/g;->a(Lcom/tencent/liteav/basic/util/g;)Landroid/os/Handler;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 26
    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method
