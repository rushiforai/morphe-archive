.class Lcom/tencent/iliveroom/a/a$34;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->destroy()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$34;->a:Lcom/tencent/iliveroom/a/a;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$34;->a:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7fffffff

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-interface {v0, v1, v2}, Lcom/tencent/liteav/audio/TXAudioEffectManager;->setMusicObserver(ILcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$34;->a:Lcom/tencent/iliveroom/a/a;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/c/e;->a()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$34;->a:Lcom/tencent/iliveroom/a/a;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tencent/iliveroom/a/a;->p(Lcom/tencent/iliveroom/a/a;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
