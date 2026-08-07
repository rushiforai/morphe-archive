.class Lcom/tencent/liteav/network/TXCStreamDownloader$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/network/TXCStreamDownloader;->onRestartDownloader()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/network/TXCStreamDownloader;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/TXCStreamDownloader;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$1;->a:Lcom/tencent/liteav/network/TXCStreamDownloader;

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
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$1;->a:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/liteav/network/TXCStreamDownloader;->stop()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$1;->a:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$000(Lcom/tencent/liteav/network/TXCStreamDownloader;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget-object v0, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$1;->a:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$100(Lcom/tencent/liteav/network/TXCStreamDownloader;)Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    iget-object v0, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$1;->a:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$200(Lcom/tencent/liteav/network/TXCStreamDownloader;)I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    iget-object v0, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$1;->a:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$300(Lcom/tencent/liteav/network/TXCStreamDownloader;)Z

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    iget-object p0, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$1;->a:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$400(Lcom/tencent/liteav/network/TXCStreamDownloader;)Z

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    invoke-virtual/range {v1 .. v6}, Lcom/tencent/liteav/network/TXCStreamDownloader;->start(Ljava/lang/String;ZIZZ)I

    .line 37
    .line 38
    .line 39
    return-void
.end method
