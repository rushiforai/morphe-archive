.class Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MediaDateHandler"
.end annotation


# instance fields
.field private mijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

.field pCb:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

.field final synthetic this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;->mijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v1, 0xc9

    .line 4
    .line 5
    if-eq v0, v1, :cond_1

    .line 6
    .line 7
    const/16 v1, 0xca

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    new-instance p0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v0, "Unknown message type "

    .line 14
    .line 15
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget p1, p1, Landroid/os/Message;->what:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "IjkMediaPlayer"

    .line 28
    .line 29
    invoke-static {p1, p0}, Ll/esx;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 34
    .line 35
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2100(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;->pCb:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v1, [B

    .line 46
    .line 47
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 48
    .line 49
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;->mijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 50
    .line 51
    const/4 v2, 0x1

    .line 52
    invoke-interface {v0, v1, v2, p1, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;->onMediaDateCallback([BIILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 57
    .line 58
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2100(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;->pCb:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v1, [B

    .line 69
    .line 70
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 71
    .line 72
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateHandler;->mijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 73
    .line 74
    const/4 v2, 0x0

    .line 75
    invoke-interface {v0, v1, v2, p1, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;->onMediaDateCallback([BIILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method
