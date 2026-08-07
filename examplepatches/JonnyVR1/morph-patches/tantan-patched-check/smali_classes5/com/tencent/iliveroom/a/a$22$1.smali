.class Lcom/tencent/iliveroom/a/a$22$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a$22;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/a$22;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a$22;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$22$1;->a:Lcom/tencent/iliveroom/a/a$22;

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
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "TRTCAdapter: callback finish when stop effect, id:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$22$1;->a:Lcom/tencent/iliveroom/a/a$22;

    .line 9
    .line 10
    iget v1, v1, Lcom/tencent/iliveroom/a/a$22;->a:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "TRTCAdapter-ext"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$22$1;->a:Lcom/tencent/iliveroom/a/a$22;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$22;->b:Lcom/tencent/iliveroom/a/a;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->d:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget p0, p0, Lcom/tencent/iliveroom/a/a$22;->a:I

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;->onEffectPlayFinish(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method
