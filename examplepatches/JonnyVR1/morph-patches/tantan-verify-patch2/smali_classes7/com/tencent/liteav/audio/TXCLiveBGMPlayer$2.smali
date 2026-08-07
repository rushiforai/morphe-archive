.class Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;->onPlayEnd(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/audio/g;

.field final synthetic b:I

.field final synthetic c:Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;Lcom/tencent/liteav/audio/g;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$2;->c:Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$2;->a:Lcom/tencent/liteav/audio/g;

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$2;->b:I

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
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$2;->a:Lcom/tencent/liteav/audio/g;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$2;->b:I

    .line 6
    .line 7
    invoke-interface {v0, p0}, Lcom/tencent/liteav/audio/g;->onPlayEnd(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
