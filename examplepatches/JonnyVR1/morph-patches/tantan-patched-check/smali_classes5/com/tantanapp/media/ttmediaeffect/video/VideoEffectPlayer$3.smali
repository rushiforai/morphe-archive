.class Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/velib/player/d$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;->setPositionChangedListener(Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnRenderPositionChangedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

.field final synthetic val$listener:Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnRenderPositionChangedListener;


# direct methods
.method public constructor <init>(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnRenderPositionChangedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$3;->this$0:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$3;->val$listener:Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnRenderPositionChangedListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public renderPositionChanged(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$3;->val$listener:Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnRenderPositionChangedListener;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnRenderPositionChangedListener;->onRenderPositionChanged(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
