.class Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;


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
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$b;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCompletion(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$b;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    invoke-static {p1, v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->s2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;I)I

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "ExtAudioWrapper"

    .line 12
    .line 13
    const-string v1, "Mediaplayer onCompletion"

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$b;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->u:Ll/gb1;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 p1, 0x2

    .line 25
    const/4 v0, 0x0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-interface {p0, v1, p1, v0}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
