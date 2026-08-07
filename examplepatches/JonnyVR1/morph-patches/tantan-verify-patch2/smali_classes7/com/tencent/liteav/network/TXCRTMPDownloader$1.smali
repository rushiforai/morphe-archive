.class Lcom/tencent/liteav/network/TXCRTMPDownloader$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/network/TXCRTMPDownloader;->reconnect(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Lcom/tencent/liteav/network/TXCRTMPDownloader;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/TXCRTMPDownloader;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXCRTMPDownloader$1;->b:Lcom/tencent/liteav/network/TXCRTMPDownloader;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/liteav/network/TXCRTMPDownloader$1;->a:Z

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/network/TXCRTMPDownloader$1;->b:Lcom/tencent/liteav/network/TXCRTMPDownloader;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/tencent/liteav/network/TXCRTMPDownloader$1;->a:Z

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/tencent/liteav/network/TXCRTMPDownloader;->access$600(Lcom/tencent/liteav/network/TXCRTMPDownloader;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
