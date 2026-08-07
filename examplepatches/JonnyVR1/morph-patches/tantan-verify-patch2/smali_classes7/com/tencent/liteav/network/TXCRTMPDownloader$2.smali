.class Lcom/tencent/liteav/network/TXCRTMPDownloader$2;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/network/TXCRTMPDownloader;->startDownload(Ljava/util/Vector;ZZZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/network/TXCRTMPDownloader;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/TXCRTMPDownloader;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXCRTMPDownloader$2;->a:Lcom/tencent/liteav/network/TXCRTMPDownloader;

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
    const/16 v0, 0x65

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/liteav/network/TXCRTMPDownloader$2;->a:Lcom/tencent/liteav/network/TXCRTMPDownloader;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tencent/liteav/network/TXCRTMPDownloader;->access$700(Lcom/tencent/liteav/network/TXCRTMPDownloader;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
