.class Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;
.super Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;->loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

.field final synthetic val$listener:Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;


# direct methods
.method public constructor <init>(Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;->this$0:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;->val$listener:Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public loadResError(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->loadResError(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;->val$listener:Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;->loadResError(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onFinished()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;->val$listener:Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;->onFinished()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onLoadSuccess()V
    .locals 0

    .line 16
    invoke-super {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onLoadSuccess()V

    .line 17
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;->val$listener:Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    if-eqz p0, :cond_0

    .line 18
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;->onLoadSuccess()V

    :cond_0
    return-void
.end method

.method public onLoadSuccess(Lcom/immomo/svgaplayer/SVGAVideoEntity;)V
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/SVGAVideoEntity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onLoadSuccess(Lcom/immomo/svgaplayer/SVGAVideoEntity;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;->val$listener:Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;->fromMomoEntity(Lcom/immomo/svgaplayer/SVGAVideoEntity;)Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;->onLoadSuccess(Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;->val$listener:Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;->onPause()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onRepeat()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onRepeat()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;->val$listener:Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;->onRepeat()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;->val$listener:Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;->onStart()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onStep(ID)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onStep(ID)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;->val$listener:Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;->onStep(ID)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
