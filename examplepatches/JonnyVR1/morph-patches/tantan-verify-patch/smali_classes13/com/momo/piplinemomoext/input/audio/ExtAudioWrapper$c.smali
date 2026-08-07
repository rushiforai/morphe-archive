.class Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;


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
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$c;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onError(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "Mediaplayer Error"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p2, " "

    .line 16
    .line 17
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string p3, "ExtAudioWrapper"

    .line 28
    .line 29
    invoke-virtual {p1, p3, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$c;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 33
    .line 34
    const/4 p2, -0x1

    .line 35
    invoke-static {p1, p2}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->s2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;I)I

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$c;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->u:Ll/gb1;

    .line 41
    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    const/4 p3, 0x0

    .line 46
    invoke-interface {p0, p1, p2, p3}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 47
    .line 48
    .line 49
    :cond_0
    const/4 p0, 0x1

    .line 50
    return p0
.end method
