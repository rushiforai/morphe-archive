.class public Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lcom/momo/mcamera/mask/AdditionalInfo;

    invoke-direct {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;-><init>()V

    iput-object v0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    return-void
.end method

.method public constructor <init>(Lcom/momo/mcamera/mask/AdditionalInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p1, Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 10
    .line 11
    invoke-direct {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getBackTip()Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo;->getBackTip()Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;-><init>(Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public getFaceAlignmentVersion()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo;->getFaceAlignmentVersion()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFrontTip()Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo;->getFrontTip()Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;-><init>(Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public getRealAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAnimojiDetectEnable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isAnimojiDetectEnable()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isBodyDetectEnable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isBodyDetectEnable()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isBodySegmentDetectEnable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isBodySegmentDetectEnable()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isComic()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isComic()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isExpressionDetectEnable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isExpressionDetectEnable()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isMultiFaceSwitchEnable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isMultiFaceSwitchEnable()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isObjectDetectEnable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isObjectDetectEnable()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setAnimojiDetectEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->setAnimojiDetectEnable(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBackTip(Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;->getRealTipInfo()Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->setBackTip(Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setBodyDetectEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->setBodyDetectEnable(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBodySegmentDetectEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->setBodySegmentDetectEnable(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setComic(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->setComic(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setExpressionDetectEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->setExpressionDetectEnable(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFaceAlignmentVersion(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->setFaceAlignmentVersion(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFrontTip(Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;->getRealTipInfo()Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->setFrontTip(Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setMultiFaceSwitchEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->setMultiFaceSwitchEnable(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setObjectDetectEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->realAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->setObjectDetectEnable(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
