.class Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;


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
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$g;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onMediaDateCallback([BIILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$g;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->v2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;->getStreamerType()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x2

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$g;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 15
    .line 16
    iget v7, v2, Ll/jc00;->f:I

    .line 17
    .line 18
    move-object v3, p1

    .line 19
    move v4, p2

    .line 20
    move v5, p3

    .line 21
    move-object v6, p4

    .line 22
    invoke-virtual/range {v2 .. v7}, Ll/jc00;->G0([BIILjava/lang/Object;I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
