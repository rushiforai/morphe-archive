.class Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;->onPlayStart(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/audio/g;

.field final synthetic b:Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;Lcom/tencent/liteav/audio/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$1;->b:Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$1;->a:Lcom/tencent/liteav/audio/g;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer$1;->a:Lcom/tencent/liteav/audio/g;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/tencent/liteav/audio/g;->onPlayStart()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
