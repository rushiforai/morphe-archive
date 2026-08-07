.class Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/velib/player/d$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;->setOnErrorListener(Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnErrorListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

.field final synthetic val$listener:Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnErrorListener;


# direct methods
.method public constructor <init>(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnErrorListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$2;->this$0:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$2;->val$listener:Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnErrorListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onError(Lcom/immomo/velib/player/d;II)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$2;->val$listener:Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnErrorListener;

    .line 2
    .line 3
    invoke-interface {p0, p2, p3}, Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnErrorListener;->onError(II)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public abstract synthetic onError(Lcom/immomo/velib/player/d;ILjava/lang/String;)Z
.end method
