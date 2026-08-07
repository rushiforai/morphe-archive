.class Lcom/tencent/liteav/screencapture/a$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/screencapture/c$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/screencapture/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/screencapture/a;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/screencapture/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/a$1;->a:Lcom/tencent/liteav/screencapture/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$1;->a:Lcom/tencent/liteav/screencapture/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/screencapture/a;->a(Lcom/tencent/liteav/screencapture/a;)Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, -0x1b59

    .line 8
    .line 9
    const-string v2, "Screen recording stopped. It may be preempted by other apps"

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$1;->a:Lcom/tencent/liteav/screencapture/a;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tencent/liteav/screencapture/a;->b(Lcom/tencent/liteav/screencapture/a;)Lcom/tencent/liteav/screencapture/a$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a$1;->a:Lcom/tencent/liteav/screencapture/a;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {p0, v1}, Lcom/tencent/liteav/screencapture/a;->a(Lcom/tencent/liteav/screencapture/a;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    invoke-interface {v0, p0}, Lcom/tencent/liteav/screencapture/a$a;->onScreenCaptureStopped(I)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public a(Z)V
    .locals 2

    .line 37
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$1;->a:Lcom/tencent/liteav/screencapture/a;

    invoke-static {v0}, Lcom/tencent/liteav/screencapture/a;->c(Lcom/tencent/liteav/screencapture/a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$1;->a:Lcom/tencent/liteav/screencapture/a;

    invoke-virtual {v0, p1}, Lcom/tencent/liteav/screencapture/a;->b(Z)V

    .line 39
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$1;->a:Lcom/tencent/liteav/screencapture/a;

    invoke-static {p1}, Lcom/tencent/liteav/screencapture/a;->d(Lcom/tencent/liteav/screencapture/a;)I

    move-result v0

    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a$1;->a:Lcom/tencent/liteav/screencapture/a;

    invoke-static {p0}, Lcom/tencent/liteav/screencapture/a;->e(Lcom/tencent/liteav/screencapture/a;)I

    move-result p0

    const/16 v1, 0x69

    invoke-virtual {p1, v1, v0, p0}, Lcom/tencent/liteav/screencapture/a;->b(III)V

    :cond_0
    return-void
.end method

.method public a(ZZ)V
    .locals 0

    .line 33
    iget-object p2, p0, Lcom/tencent/liteav/screencapture/a$1;->a:Lcom/tencent/liteav/screencapture/a;

    if-eqz p1, :cond_0

    const/16 p0, 0x6a

    .line 34
    invoke-virtual {p2, p0}, Lcom/tencent/liteav/screencapture/a;->b(I)V

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 35
    invoke-static {p2, p1}, Lcom/tencent/liteav/screencapture/a;->a(Lcom/tencent/liteav/screencapture/a;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;

    .line 36
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a$1;->a:Lcom/tencent/liteav/screencapture/a;

    invoke-static {p0}, Lcom/tencent/liteav/screencapture/a;->a(Lcom/tencent/liteav/screencapture/a;)Ljava/lang/ref/WeakReference;

    move-result-object p0

    const/16 p1, -0x51c

    const-string p2, "Failed to share screen"

    invoke-static {p0, p1, p2}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILjava/lang/String;)V

    return-void
.end method
