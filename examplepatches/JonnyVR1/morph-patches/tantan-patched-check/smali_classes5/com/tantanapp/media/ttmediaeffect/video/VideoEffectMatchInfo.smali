.class public Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private realEffectMatchInfo:Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;


# direct methods
.method public constructor <init>(Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;->realEffectMatchInfo:Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p1, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    invoke-direct {p1, v0, v0, v0}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;->realEffectMatchInfo:Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    invoke-direct {v0, p1, p2, p3}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;->realEffectMatchInfo:Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;->realEffectMatchInfo:Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getImgId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;->realEffectMatchInfo:Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getImgId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRealEffectMatchInfo()Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;->realEffectMatchInfo:Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;->realEffectMatchInfo:Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getText()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;->realEffectMatchInfo:Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->setId(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setImgId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;->realEffectMatchInfo:Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->setImgId(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;->realEffectMatchInfo:Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->setText(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
