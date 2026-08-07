.class Lcom/tencent/liteav/screencapture/a$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/screencapture/a;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/os/Handler;

.field final synthetic b:Landroid/os/HandlerThread;

.field final synthetic c:Lcom/tencent/liteav/screencapture/a;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/screencapture/a;Landroid/os/Handler;Landroid/os/HandlerThread;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/a$3;->c:Lcom/tencent/liteav/screencapture/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/screencapture/a$3;->a:Landroid/os/Handler;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/screencapture/a$3;->b:Landroid/os/HandlerThread;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$3;->c:Lcom/tencent/liteav/screencapture/a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/screencapture/a;->a:Landroid/os/Handler;

    .line 4
    .line 5
    new-instance v1, Lcom/tencent/liteav/screencapture/a$3$1;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/tencent/liteav/screencapture/a$3$1;-><init>(Lcom/tencent/liteav/screencapture/a$3;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method
