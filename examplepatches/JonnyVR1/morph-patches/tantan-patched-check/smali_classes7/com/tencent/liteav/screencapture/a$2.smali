.class Lcom/tencent/liteav/screencapture/a$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/screencapture/a;->a(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Lcom/tencent/liteav/screencapture/a;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/screencapture/a;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/a$2;->b:Lcom/tencent/liteav/screencapture/a;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/liteav/screencapture/a$2;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$2;->b:Lcom/tencent/liteav/screencapture/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/screencapture/a;->b(Lcom/tencent/liteav/screencapture/a;)Lcom/tencent/liteav/screencapture/a$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/a$2;->b:Lcom/tencent/liteav/screencapture/a;

    .line 8
    .line 9
    iget-boolean v1, v1, Lcom/tencent/liteav/screencapture/a;->i:Z

    .line 10
    .line 11
    iget-boolean v2, p0, Lcom/tencent/liteav/screencapture/a$2;->a:Z

    .line 12
    .line 13
    if-eq v1, v2, :cond_1

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/tencent/liteav/screencapture/a$a;->onScreenCaptureResumed()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-interface {v0}, Lcom/tencent/liteav/screencapture/a$a;->onScreenCapturePaused()V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$2;->b:Lcom/tencent/liteav/screencapture/a;

    .line 27
    .line 28
    iget-boolean p0, p0, Lcom/tencent/liteav/screencapture/a$2;->a:Z

    .line 29
    .line 30
    iput-boolean p0, v0, Lcom/tencent/liteav/screencapture/a;->i:Z

    .line 31
    .line 32
    return-void
.end method
