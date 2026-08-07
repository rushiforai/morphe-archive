.class public Lcom/tantanapp/ijk/media/player/ffmpeg/TTFFmpegApi;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->loadLibrariesOnce(Lcom/tantanapp/ijk/media/player/IjkLibLoader;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native ttffmpegapi([Ljava/lang/String;)I
.end method
