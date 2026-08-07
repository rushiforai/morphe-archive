.class public Lcom/tantanapp/ijk/media/player/ffmpeg/FFmpegApi;
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
    const-string v0, "libttplayer.so"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->native_profileBegin(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
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

.method public static native av_base64_encode([B)Ljava/lang/String;
.end method

.method public static native exec([Ljava/lang/String;)I
.end method
