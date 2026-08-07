.class public Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lcom/immomo/velib/anim/model/VideoEffectModel;

    invoke-direct {v0}, Lcom/immomo/velib/anim/model/VideoEffectModel;-><init>()V

    iput-object v0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    return-void
.end method

.method public constructor <init>(Lcom/immomo/velib/anim/model/VideoEffectModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    new-instance p1, Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 7
    .line 8
    invoke-direct {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 15
    .line 16
    return-void
.end method

.method public static getConfigPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getConfigPath(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static parseByPath(Ljava/lang/String;)Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->parseByPath(Ljava/lang/String;)Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;-><init>(Lcom/immomo/velib/anim/model/VideoEffectModel;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public getAlphaType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getAlphaType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getAvatar()Lcom/immomo/velib/anim/model/Element;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getAvatar()Lcom/immomo/velib/anim/model/Element;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getElements()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/Element;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getElements()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLocation()Lcom/immomo/velib/anim/model/Location;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getLocation()Lcom/immomo/velib/anim/model/Location;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPostProcessing()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/PostProcessingModel;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getPostProcessing()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRealVidelEffectModel()Lcom/immomo/velib/anim/model/VideoEffectModel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    return-object p0
.end method

.method public getText()Lcom/immomo/velib/anim/model/Element;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getText()Lcom/immomo/velib/anim/model/Element;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getVideo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getVideo()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getVideoFolder()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getVideoFolder()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setAlphaType(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->setAlphaType(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAvatar(Lcom/immomo/velib/anim/model/Element;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->setAvatar(Lcom/immomo/velib/anim/model/Element;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setElements(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/Element;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->setElements(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->setHeight(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLocation(Lcom/immomo/velib/anim/model/Location;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->setLocation(Lcom/immomo/velib/anim/model/Location;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPostProcessing(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/PostProcessingModel;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->setPostProcessing(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setText(Lcom/immomo/velib/anim/model/Element;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->setText(Lcom/immomo/velib/anim/model/Element;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setVideo(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->setVideo(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setVideoFolder(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->setVideoFolder(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->realVideoEffectModel:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->setWidth(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
