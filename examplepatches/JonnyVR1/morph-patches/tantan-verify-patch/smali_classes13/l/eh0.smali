.class public Ll/eh0;
.super Ll/xfm;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    api = 0xe
.end annotation


# instance fields
.field private Q:I

.field private R:I

.field private S:Ll/q210$a;

.field private T:I

.field private U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ll/q210$a;IZLl/brx;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p5, p6}, Ll/xfm;-><init>(Landroid/content/Context;Ljava/lang/String;ZLl/brx;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/eh0;->Q:I

    .line 6
    .line 7
    iput p1, p0, Ll/eh0;->R:I

    .line 8
    .line 9
    iput-object p3, p0, Ll/eh0;->S:Ll/q210$a;

    .line 10
    .line 11
    iput p4, p0, Ll/eh0;->T:I

    .line 12
    .line 13
    iput-boolean p1, p0, Ll/gfj;->useCache:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public V1(Lcom/momo/piplinemomoext/input/audio/a;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/xfm;->V1(Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public W1(III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/xfm;->W1(III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Y1(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/xfm;->Y1(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Z1()I
    .locals 2

    .line 1
    iget v0, p0, Ll/eh0;->T:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/xfm;->getInputHeight()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/xfm;->getInputWidth()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0}, Ll/xfm;->getInputHeight()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method public a2()I
    .locals 2

    .line 1
    iget v0, p0, Ll/eh0;->T:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/xfm;->getInputWidth()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/xfm;->getInputWidth()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0}, Ll/xfm;->getInputHeight()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method public b2(Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 2
    .line 3
    return-void
.end method

.method public catchErrorLog0()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/xfm;->catchErrorLog0()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/eh0;->T:I

    .line 5
    .line 6
    const/16 v1, 0xd2

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const v3, 0x8002

    .line 10
    .line 11
    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    if-ne v0, v4, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/4 v4, 0x2

    .line 19
    if-eq v0, v4, :cond_2

    .line 20
    .line 21
    const/4 v4, 0x3

    .line 22
    if-eq v0, v4, :cond_2

    .line 23
    .line 24
    const/16 v4, 0x9

    .line 25
    .line 26
    if-ne v0, v4, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/16 v4, 0x8

    .line 30
    .line 31
    if-ne v0, v4, :cond_4

    .line 32
    .line 33
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 34
    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 42
    .line 43
    if-eqz v0, :cond_4

    .line 44
    .line 45
    const/16 v1, 0xd1

    .line 46
    .line 47
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    :cond_4
    return-void
.end method

.method public catchErrorLog1()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/xfm;->catchErrorLog1()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/eh0;->T:I

    .line 5
    .line 6
    const/16 v1, 0xd2

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const v3, 0x8002

    .line 10
    .line 11
    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    if-ne v0, v4, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/4 v4, 0x2

    .line 19
    if-eq v0, v4, :cond_2

    .line 20
    .line 21
    const/4 v4, 0x3

    .line 22
    if-eq v0, v4, :cond_2

    .line 23
    .line 24
    const/16 v4, 0x9

    .line 25
    .line 26
    if-ne v0, v4, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/16 v4, 0x8

    .line 30
    .line 31
    if-ne v0, v4, :cond_4

    .line 32
    .line 33
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 34
    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 42
    .line 43
    if-eqz v0, :cond_4

    .line 44
    .line 45
    const/16 v1, 0xd1

    .line 46
    .line 47
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    :cond_4
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/xfm;->destroy()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "Pipeline_Normal_pip->PIPLINE"

    .line 9
    .line 10
    const-string v1, "zk destroy AidInput"

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public getDuration()J
    .locals 4

    .line 1
    invoke-super {p0}, Ll/xfm;->getDuration()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v3, "------onPrepared aid:duration="

    .line 12
    .line 13
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "Pipeline_Normal_pip->PIPLINE"

    .line 24
    .line 25
    invoke-virtual {p0, v3, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-wide v0
.end method

.method public onBufferingUpdate(Ltv/danmaku/ijk/media/player/IMediaPlayer;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/xfm;->onBufferingUpdate(Ltv/danmaku/ijk/media/player/IMediaPlayer;I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1, p2}, Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;->onBufferingUpdate(Ltv/danmaku/ijk/media/player/IMediaPlayer;I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onCompletion(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/xfm;->onCompletion(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/eh0;->T:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const v2, 0x8002

    .line 8
    .line 9
    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    if-ne v0, v3, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    const/4 v3, 0x3

    .line 17
    if-eq v0, v3, :cond_2

    .line 18
    .line 19
    const/16 v3, 0x9

    .line 20
    .line 21
    if-ne v0, v3, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 v3, 0x2

    .line 25
    if-ne v0, v3, :cond_4

    .line 26
    .line 27
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 28
    .line 29
    if-eqz v0, :cond_4

    .line 30
    .line 31
    const/16 v3, 0xcd

    .line 32
    .line 33
    invoke-interface {v0, v2, v3, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 38
    .line 39
    if-eqz v0, :cond_4

    .line 40
    .line 41
    const/16 v3, 0xce

    .line 42
    .line 43
    invoke-interface {v0, v2, v3, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 48
    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    const/16 v3, 0xcb

    .line 52
    .line 53
    invoke-interface {v0, v2, v3, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    :cond_4
    :goto_2
    iget-object v0, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 57
    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    const-string v0, "aidinput@"

    .line 61
    .line 62
    const-string v1, "onCompletion: call onCompletion interface"

    .line 63
    .line 64
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 68
    .line 69
    invoke-interface {p0, p1}, Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;->onCompletion(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V

    .line 70
    .line 71
    .line 72
    :cond_5
    return-void
.end method

.method public onDrawFrame()V
    .locals 9
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .line 1
    invoke-super {p0}, Ll/xfm;->onDrawFrame()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/eh0;->T:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    const/16 v1, 0x9

    .line 13
    .line 14
    if-ne v0, v1, :cond_2

    .line 15
    .line 16
    :cond_0
    iget-boolean v0, p0, Ll/xfm;->K:Z

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const v2, 0x8002

    .line 26
    .line 27
    .line 28
    const/16 v3, 0xd0

    .line 29
    .line 30
    invoke-interface {v0, v2, v3, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iput-boolean v1, p0, Ll/xfm;->K:Z

    .line 34
    .line 35
    iget-object v0, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v2, "---ktv---onPrepared aid:w="

    .line 46
    .line 47
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v2, ";h="

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 74
    .line 75
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v3, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 79
    .line 80
    iget-object v4, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    const/4 v7, 0x0

    .line 91
    const/4 v8, 0x0

    .line 92
    invoke-interface/range {v3 .. v8}, Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;->onVideoSizeChanged(Ltv/danmaku/ijk/media/player/IMediaPlayer;IIII)V

    .line 93
    .line 94
    .line 95
    :cond_2
    return-void
.end method

.method public onError(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z
    .locals 5

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/xfm;->onError(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, "what:"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p2, ", extra:"

    .line 30
    .line 31
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 42
    .line 43
    invoke-static {v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    iget p2, p0, Ll/eh0;->T:I

    .line 47
    .line 48
    const/16 v1, 0xd2

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    const v3, 0x8002

    .line 52
    .line 53
    .line 54
    if-eqz p2, :cond_4

    .line 55
    .line 56
    const/4 v4, 0x1

    .line 57
    if-ne p2, v4, :cond_0

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_0
    const/4 v4, 0x2

    .line 61
    if-eq p2, v4, :cond_2

    .line 62
    .line 63
    const/4 v4, 0x3

    .line 64
    if-eq p2, v4, :cond_2

    .line 65
    .line 66
    const/16 v4, 0x9

    .line 67
    .line 68
    if-ne p2, v4, :cond_1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    const/16 p1, 0x8

    .line 72
    .line 73
    if-ne p2, p1, :cond_5

    .line 74
    .line 75
    iget-object p1, p0, Ll/eh0;->S:Ll/q210$a;

    .line 76
    .line 77
    if-eqz p1, :cond_5

    .line 78
    .line 79
    invoke-interface {p1, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return v0

    .line 83
    :cond_2
    :goto_0
    iget-object p2, p0, Ll/eh0;->S:Ll/q210$a;

    .line 84
    .line 85
    const/16 v1, 0xd1

    .line 86
    .line 87
    if-eqz p2, :cond_3

    .line 88
    .line 89
    invoke-interface {p2, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    :cond_3
    iget-object p0, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 93
    .line 94
    if-eqz p0, :cond_5

    .line 95
    .line 96
    invoke-interface {p0, p1, v1, p3}, Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;->onInfo(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z

    .line 97
    .line 98
    .line 99
    return v0

    .line 100
    :cond_4
    :goto_1
    iget-object p1, p0, Ll/eh0;->S:Ll/q210$a;

    .line 101
    .line 102
    if-eqz p1, :cond_5

    .line 103
    .line 104
    invoke-interface {p1, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    :cond_5
    return v0
.end method

.method public onInfo(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/xfm;->onInfo(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "onInfo-onInfo: what="

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, ";extra="

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "aidinput@"

    .line 32
    .line 33
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 37
    .line 38
    invoke-interface {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;->onInfo(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z

    .line 39
    .line 40
    .line 41
    :cond_0
    return v0
.end method

.method public onMediaDateCallback([BIILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/xfm;->onMediaDateCallback([BIILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onPrepared(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 4
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/xfm;->onPrepared(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getAudioTrackNum()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object v1, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "onPrepared-onInfo: what=213;extra="

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "aidinput@"

    .line 27
    .line 28
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 32
    .line 33
    const/16 v2, 0xd5

    .line 34
    .line 35
    invoke-interface {v1, p1, v2, v0}, Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;->onInfo(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-interface {v0, p1}, Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;->onPrepared(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget p1, p0, Ll/eh0;->T:I

    .line 46
    .line 47
    const/16 v0, 0xca

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    const v2, 0x8002

    .line 51
    .line 52
    .line 53
    if-eqz p1, :cond_5

    .line 54
    .line 55
    const/4 v3, 0x1

    .line 56
    if-ne p1, v3, :cond_2

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    const/4 v3, 0x2

    .line 60
    if-eq p1, v3, :cond_4

    .line 61
    .line 62
    const/4 v3, 0x3

    .line 63
    if-eq p1, v3, :cond_4

    .line 64
    .line 65
    const/16 v3, 0x9

    .line 66
    .line 67
    if-ne p1, v3, :cond_3

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    const/16 v3, 0x8

    .line 71
    .line 72
    if-ne p1, v3, :cond_6

    .line 73
    .line 74
    iget-object p1, p0, Ll/eh0;->S:Ll/q210$a;

    .line 75
    .line 76
    if-eqz p1, :cond_6

    .line 77
    .line 78
    invoke-interface {p1, v2, v0, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_4
    :goto_0
    iget-object p1, p0, Ll/eh0;->S:Ll/q210$a;

    .line 83
    .line 84
    if-eqz p1, :cond_6

    .line 85
    .line 86
    const/16 v0, 0xcc

    .line 87
    .line 88
    invoke-interface {p1, v2, v0, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_5
    :goto_1
    iget-object p1, p0, Ll/eh0;->S:Ll/q210$a;

    .line 93
    .line 94
    if-eqz p1, :cond_6

    .line 95
    .line 96
    invoke-interface {p1, v2, v0, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    :cond_6
    return-void
.end method

.method public onSeekComplete(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/xfm;->onSeekComplete(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/16 v1, 0xd4

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const v3, 0x8002

    .line 12
    .line 13
    .line 14
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;->onSeekComplete(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public onVideoMediacodecChanged(Ltv/danmaku/ijk/media/player/IMediaPlayer;I)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2}, Ll/xfm;->onVideoMediacodecChanged(Ltv/danmaku/ijk/media/player/IMediaPlayer;I)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/eh0;->T:I

    .line 5
    .line 6
    const/16 v1, 0xd2

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const v3, 0x8002

    .line 10
    .line 11
    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    if-ne v0, v4, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/4 v4, 0x2

    .line 19
    if-eq v0, v4, :cond_2

    .line 20
    .line 21
    const/4 v4, 0x3

    .line 22
    if-eq v0, v4, :cond_2

    .line 23
    .line 24
    const/16 v4, 0x9

    .line 25
    .line 26
    if-ne v0, v4, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/16 v4, 0x8

    .line 30
    .line 31
    if-ne v0, v4, :cond_4

    .line 32
    .line 33
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 34
    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 42
    .line 43
    if-eqz v0, :cond_4

    .line 44
    .line 45
    const/16 v1, 0xd1

    .line 46
    .line 47
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    :cond_4
    :goto_2
    iget-object p0, p0, Ll/eh0;->U:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 59
    .line 60
    if-eqz p0, :cond_5

    .line 61
    .line 62
    invoke-interface {p0, p1, p2}, Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;->onVideoMediacodecChanged(Ltv/danmaku/ijk/media/player/IMediaPlayer;I)V

    .line 63
    .line 64
    .line 65
    :cond_5
    return-void
.end method

.method public onVideoSizeChanged(Ltv/danmaku/ijk/media/player/IMediaPlayer;IIII)V
    .locals 0

    .line 1
    if-eqz p2, :cond_3

    .line 2
    .line 3
    if-eqz p3, :cond_3

    .line 4
    .line 5
    iget p4, p0, Ll/eh0;->Q:I

    .line 6
    .line 7
    if-ne p4, p2, :cond_0

    .line 8
    .line 9
    iget p4, p0, Ll/eh0;->R:I

    .line 10
    .line 11
    if-ne p3, p4, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getVideoDarDen()I

    .line 15
    .line 16
    .line 17
    move-result p4

    .line 18
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getVideoDarNum()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-lez p4, :cond_1

    .line 23
    .line 24
    if-lez p1, :cond_1

    .line 25
    .line 26
    mul-int/2addr p1, p3

    .line 27
    div-int/2addr p1, p4

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move p1, p2

    .line 30
    :goto_0
    iput p2, p0, Ll/eh0;->Q:I

    .line 31
    .line 32
    iput p3, p0, Ll/eh0;->R:I

    .line 33
    .line 34
    iget-object p4, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 35
    .line 36
    if-eqz p4, :cond_2

    .line 37
    .line 38
    invoke-virtual {p4, p2, p3}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 39
    .line 40
    .line 41
    :cond_2
    invoke-virtual {p0, p1, p3}, Ll/qnw;->setRenderSize(II)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance p2, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string p4, "-ktv,onVideoSizeChanged:"

    .line 51
    .line 52
    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p1, ", height:"

    .line 59
    .line 60
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    const-string p2, "Pipeline_Normal_pip->PIPLINE"

    .line 71
    .line 72
    invoke-virtual {p0, p2, p1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    :goto_1
    return-void
.end method

.method public stop()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/xfm;->stop()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/eh0;->T:I

    .line 5
    .line 6
    const/16 v1, 0xd3

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const v3, 0x8002

    .line 10
    .line 11
    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    if-ne v0, v4, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/4 v4, 0x2

    .line 19
    if-eq v0, v4, :cond_2

    .line 20
    .line 21
    const/4 v4, 0x3

    .line 22
    if-eq v0, v4, :cond_2

    .line 23
    .line 24
    const/16 v4, 0x9

    .line 25
    .line 26
    if-ne v0, v4, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/16 v4, 0x8

    .line 30
    .line 31
    if-ne v0, v4, :cond_4

    .line 32
    .line 33
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 34
    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 42
    .line 43
    if-eqz v0, :cond_4

    .line 44
    .line 45
    const/16 v1, 0xcf

    .line 46
    .line 47
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/eh0;->S:Ll/q210$a;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    :cond_4
    return-void
.end method
