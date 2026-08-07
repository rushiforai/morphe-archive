.class Ltv/danmaku/ijk/media/player/AndroidMediaPlayer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/AndroidMediaPlayer$1;->this$0:Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/AndroidMediaPlayer$1;->this$0:Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;

    .line 2
    .line 3
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;->access$000(Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;)Landroid/media/MediaPlayer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/AndroidMediaPlayer$1;->this$0:Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;

    .line 10
    .line 11
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;->access$100(Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/AndroidMediaPlayer$1;->this$0:Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;

    .line 18
    .line 19
    invoke-static {p0}, Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;->access$000(Ltv/danmaku/ijk/media/player/AndroidMediaPlayer;)Landroid/media/MediaPlayer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->release()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
