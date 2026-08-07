.class Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;->onPlayProgress(JJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/audio/g;

.field final synthetic b:J

.field final synthetic c:J

.field final synthetic d:Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;Lcom/tencent/liteav/audio/g;JJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$3;->d:Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$3;->a:Lcom/tencent/liteav/audio/g;

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$3;->b:J

    .line 6
    .line 7
    iput-wide p5, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$3;->c:J

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$3;->a:Lcom/tencent/liteav/audio/g;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-wide v1, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$3;->b:J

    .line 6
    .line 7
    iget-wide v3, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$3;->c:J

    .line 8
    .line 9
    invoke-interface {v0, v1, v2, v3, v4}, Lcom/tencent/liteav/audio/g;->onPlayProgress(JJ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
