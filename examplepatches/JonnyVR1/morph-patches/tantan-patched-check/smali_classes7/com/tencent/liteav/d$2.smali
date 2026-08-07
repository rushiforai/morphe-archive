.class Lcom/tencent/liteav/d$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->a(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

.field final synthetic b:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$2;->b:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/d$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

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
    iget-object v0, p0, Lcom/tencent/liteav/d$2;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tencent/liteav/d$2;->b:Lcom/tencent/liteav/d;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-boolean v1, v1, Lcom/tencent/liteav/g;->K:Z

    .line 12
    .line 13
    iget-object v2, p0, Lcom/tencent/liteav/d$2;->b:Lcom/tencent/liteav/d;

    .line 14
    .line 15
    invoke-static {v2}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-boolean v2, v2, Lcom/tencent/liteav/g;->L:Z

    .line 20
    .line 21
    iget-object p0, p0, Lcom/tencent/liteav/d$2;->b:Lcom/tencent/liteav/d;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tencent/liteav/d;->e(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/k;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, v1, v2, p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->start(ZZLcom/tencent/liteav/k;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
