.class Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$h;
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
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$h;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

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
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$h;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    iget v5, v0, Ll/jc00;->f:I

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    move v2, p2

    .line 7
    move v3, p3

    .line 8
    move-object v4, p4

    .line 9
    invoke-virtual/range {v0 .. v5}, Ll/jc00;->G0([BIILjava/lang/Object;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
