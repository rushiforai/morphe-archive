.class Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;


# direct methods
.method public constructor <init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$f;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onSeekComplete(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "ExtAudioWrapper"

    .line 6
    .line 7
    const-string v1, "Mediaplayer onSeekComplete"

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$f;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->u:Ll/gb1;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x3

    .line 19
    const/4 v0, 0x0

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-interface {p0, v1, p1, v0}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
