.class public Lcom/tencent/liteav/basic/util/h;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/basic/util/h$a;
    }
.end annotation


# instance fields
.field private a:I

.field private b:Z

.field private c:Lcom/tencent/liteav/basic/util/h$a;


# direct methods
.method public constructor <init>(Landroid/os/Looper;Lcom/tencent/liteav/basic/util/h$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/tencent/liteav/basic/util/h;->b:Z

    .line 6
    .line 7
    iput-object p2, p0, Lcom/tencent/liteav/basic/util/h;->c:Lcom/tencent/liteav/basic/util/h$a;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    :goto_0
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 16
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_0

    .line 17
    :cond_0
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/util/h;->b:Z

    return-void
.end method

.method public a(II)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/util/h;->a()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lcom/tencent/liteav/basic/util/h;->a:I

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    iput-boolean p2, p0, Lcom/tencent/liteav/basic/util/h;->b:Z

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    int-to-long v0, p1

    .line 11
    invoke-virtual {p0, p2, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/tencent/liteav/basic/util/h;->c:Lcom/tencent/liteav/basic/util/h$a;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Lcom/tencent/liteav/basic/util/h$a;->onTimeout()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-boolean p1, p0, Lcom/tencent/liteav/basic/util/h;->b:Z

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget p1, p0, Lcom/tencent/liteav/basic/util/h;->a:I

    .line 13
    .line 14
    int-to-long v0, p1

    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method
