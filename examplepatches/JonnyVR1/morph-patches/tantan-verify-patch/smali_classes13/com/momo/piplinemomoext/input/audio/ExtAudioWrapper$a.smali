.class Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;


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
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPrepared(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 4

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
    const-string v1, "Mediaplayer onPrepared"

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    invoke-static {p1, v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->s2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;I)I

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->t2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    const-wide/16 v2, 0x0

    .line 25
    .line 26
    cmp-long p1, v0, v2

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w0(J)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->q()V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->u2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->u:Ll/gb1;

    .line 48
    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    const/4 p1, 0x1

    .line 52
    const/4 v0, 0x0

    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-interface {p0, v1, p1, v0}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method
