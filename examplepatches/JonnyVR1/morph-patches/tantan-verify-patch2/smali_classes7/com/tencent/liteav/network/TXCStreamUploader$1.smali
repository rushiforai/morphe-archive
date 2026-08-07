.class Lcom/tencent/liteav/network/TXCStreamUploader$1;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/network/TXCStreamUploader;->start(Ljava/lang/String;ZI)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/network/TXCStreamUploader;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/TXCStreamUploader;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXCStreamUploader$1;->a:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v1, 0x65

    .line 4
    .line 5
    if-eq v0, v1, :cond_3

    .line 6
    .line 7
    const/16 p1, 0x67

    .line 8
    .line 9
    if-eq v0, p1, :cond_2

    .line 10
    .line 11
    const/16 p1, 0x68

    .line 12
    .line 13
    if-eq v0, p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/network/TXCStreamUploader$1;->a:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$200(Lcom/tencent/liteav/network/TXCStreamUploader;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/tencent/liteav/network/TXCStreamUploader$1;->a:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$300(Lcom/tencent/liteav/network/TXCStreamUploader;)Landroid/os/Handler;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/tencent/liteav/network/TXCStreamUploader$1;->a:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$300(Lcom/tencent/liteav/network/TXCStreamUploader;)Landroid/os/Handler;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-wide/16 v0, 0x7d0

    .line 36
    .line 37
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    return-void

    .line 41
    :cond_2
    iget-object p0, p0, Lcom/tencent/liteav/network/TXCStreamUploader$1;->a:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 42
    .line 43
    invoke-static {p0}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$100(Lcom/tencent/liteav/network/TXCStreamUploader;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_3
    iget-object p0, p0, Lcom/tencent/liteav/network/TXCStreamUploader$1;->a:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 48
    .line 49
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v0, Ljava/lang/String;

    .line 52
    .line 53
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 54
    .line 55
    const/4 v1, 0x2

    .line 56
    const/4 v2, 0x0

    .line 57
    if-ne p1, v1, :cond_4

    .line 58
    .line 59
    const/4 p1, 0x1

    .line 60
    goto :goto_1

    .line 61
    :cond_4
    move p1, v2

    .line 62
    :goto_1
    invoke-static {p0, v0, p1, v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$000(Lcom/tencent/liteav/network/TXCStreamUploader;Ljava/lang/String;ZI)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
