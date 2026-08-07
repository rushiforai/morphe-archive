.class Lcom/tencent/liteav/network/TXCFLVDownloader$1;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/network/TXCFLVDownloader;->startInternal()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/network/TXCFLVDownloader;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/TXCFLVDownloader;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXCFLVDownloader$1;->a:Lcom/tencent/liteav/network/TXCFLVDownloader;

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
    .locals 1

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v0, 0x6a

    .line 4
    .line 5
    if-eq p1, v0, :cond_0

    .line 6
    .line 7
    packed-switch p1, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :pswitch_0
    iget-object p0, p0, Lcom/tencent/liteav/network/TXCFLVDownloader$1;->a:Lcom/tencent/liteav/network/TXCFLVDownloader;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/tencent/liteav/network/TXCFLVDownloader;->access$300(Lcom/tencent/liteav/network/TXCFLVDownloader;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :pswitch_1
    iget-object p0, p0, Lcom/tencent/liteav/network/TXCFLVDownloader$1;->a:Lcom/tencent/liteav/network/TXCFLVDownloader;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/tencent/liteav/network/TXCFLVDownloader;->access$200(Lcom/tencent/liteav/network/TXCFLVDownloader;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :pswitch_2
    iget-object p0, p0, Lcom/tencent/liteav/network/TXCFLVDownloader$1;->a:Lcom/tencent/liteav/network/TXCFLVDownloader;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/tencent/liteav/network/TXCFLVDownloader;->access$100(Lcom/tencent/liteav/network/TXCFLVDownloader;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :pswitch_3
    iget-object p0, p0, Lcom/tencent/liteav/network/TXCFLVDownloader$1;->a:Lcom/tencent/liteav/network/TXCFLVDownloader;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/tencent/liteav/network/TXCFLVDownloader;->access$000(Lcom/tencent/liteav/network/TXCFLVDownloader;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    :catch_0
    :goto_0
    return-void

    .line 43
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
