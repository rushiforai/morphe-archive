.class public Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;
.super Lcom/immomo/velib/player/VideoEffectView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$RenderMode;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/velib/player/VideoEffectView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/immomo/velib/player/VideoEffectView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/velib/player/VideoEffectView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/velib/player/VideoEffectView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public prepare()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/immomo/velib/player/VideoEffectView;->prepare()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setCompletionListener(Ll/y9m;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-super {p0, p1}, Lcom/immomo/velib/player/VideoEffectView;->setCompletionListener(Lcom/immomo/velib/player/d$b;)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$a;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$a;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/y9m;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, v0}, Lcom/immomo/velib/player/VideoEffectView;->setCompletionListener(Lcom/immomo/velib/player/d$b;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setOnErrorListener(Ll/z9m;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-super {p0, p1}, Lcom/immomo/velib/player/VideoEffectView;->setOnErrorListener(Lcom/immomo/velib/player/d$c;)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$b;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$b;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/z9m;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, v0}, Lcom/immomo/velib/player/VideoEffectView;->setOnErrorListener(Lcom/immomo/velib/player/d$c;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setOnPrepareListener(Lcom/immomo/velib/player/d$d;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-super {p0, p1}, Lcom/immomo/velib/player/VideoEffectView;->setOnPreparedListener(Lcom/immomo/velib/player/d$d;)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$c;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$c;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Lcom/immomo/velib/player/d$d;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, v0}, Lcom/immomo/velib/player/VideoEffectView;->setOnPreparedListener(Lcom/immomo/velib/player/d$d;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setRenderMode(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$RenderMode;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$d;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_1

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    if-eq p1, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v1

    .line 17
    :cond_1
    :goto_0
    invoke-super {p0, v0}, Lcom/immomo/velib/player/VideoEffectView;->setRenderMode(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setVideoEffectConfig(Ll/sdl0;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ll/sdl0;->c()Lcom/immomo/velib/player/a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    invoke-virtual {p0, p1}, Lcom/immomo/velib/player/VideoEffectView;->setEffectConfig(Lcom/immomo/velib/player/a;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public start()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/immomo/velib/player/VideoEffectView;->start()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public stop()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/immomo/velib/player/VideoEffectView;->stop()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
