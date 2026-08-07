.class public Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private realTipInfo:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    invoke-direct {v0}, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;-><init>()V

    iput-object v0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;->realTipInfo:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    return-void
.end method

.method public constructor <init>(Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;->realTipInfo:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p1, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 10
    .line 11
    invoke-direct {p1}, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;->realTipInfo:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;->realTipInfo:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;->getContent()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRealTipInfo()Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;->realTipInfo:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTriggerTip()Lcom/momo/mcamera/mask/TriggerTip;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;->realTipInfo:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;->getTriggerTip()Lcom/momo/mcamera/mask/TriggerTip;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public isFaceTrack()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;->realTipInfo:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;->isFaceTrack()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;->realTipInfo:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;->setContent(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFaceTrack(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;->realTipInfo:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;->setFaceTrack(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTriggerTip(Lcom/momo/mcamera/mask/TriggerTip;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/bean/TipInfo;->realTipInfo:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;->setTriggerTip(Lcom/momo/mcamera/mask/TriggerTip;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
