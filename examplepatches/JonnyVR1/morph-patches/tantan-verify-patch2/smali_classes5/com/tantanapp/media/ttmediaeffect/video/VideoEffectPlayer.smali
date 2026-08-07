.class public Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;
.super Lcom/immomo/velib/player/VideoEffectView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;,
        Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$LayoutMode;
    }
.end annotation


# static fields
.field public static final RENDER_SURFACE_VIEW:I = 0x0

.field public static final RENDER_TEXTURE_VIEW:I = 0x1


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

.method public setCompletionListener(Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnCompletionListener;)V
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
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$1;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$1;-><init>(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnCompletionListener;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, v0}, Lcom/immomo/velib/player/VideoEffectView;->setCompletionListener(Lcom/immomo/velib/player/d$b;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setOnErrorListener(Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnErrorListener;)V
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
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$2;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$2;-><init>(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnErrorListener;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, v0}, Lcom/immomo/velib/player/VideoEffectView;->setOnErrorListener(Lcom/immomo/velib/player/d$c;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setPositionChangedListener(Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnRenderPositionChangedListener;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-super {p0, p1}, Lcom/immomo/velib/player/VideoEffectView;->setPositionChangedListener(Lcom/immomo/velib/player/d$f;)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$3;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$3;-><init>(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnRenderPositionChangedListener;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, v0}, Lcom/immomo/velib/player/VideoEffectView;->setPositionChangedListener(Lcom/immomo/velib/player/d$f;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setRenderMode(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$4;->$SwitchMap$com$tantanapp$media$ttmediaeffect$video$VideoEffectPlayer$RenderMode:[I

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

.method public setSurfaceLayoutMode(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$LayoutMode;Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$4;->$SwitchMap$com$tantanapp$media$ttmediaeffect$video$VideoEffectPlayer$LayoutMode:[I

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
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;->toMomoLocation(Lcom/tantanapp/media/ttmediaeffect/video/VideoLocation;)Lcom/immomo/velib/anim/model/Location;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-super {p0, v0, p1}, Lcom/immomo/velib/player/VideoEffectView;->setSurfaceLayoutMode(ILcom/immomo/velib/anim/model/Location;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setVideoEffectConfig(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;)V
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
    invoke-virtual {p1}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->toMomoEffectConfig()Lcom/immomo/velib/player/a;

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
