.class Lcom/tencent/liteav/d$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->i(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

.field final synthetic b:Z

.field final synthetic c:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;Lcom/tencent/rtmp/ui/TXCloudVideoView;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$8;->c:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/d$8;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/tencent/liteav/d$8;->b:Z

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d$8;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/tencent/liteav/d$8;->b:Z

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->stop(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
