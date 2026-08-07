.class public Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/AdditionalInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TipInfo"
.end annotation


# instance fields
.field private content:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "content"
    .end annotation
.end field

.field private isFaceTrack:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "isFaceTrack"
    .end annotation
.end field

.field private triggerTip:Lcom/momo/mcamera/mask/TriggerTip;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "triggerTip"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;->content:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTriggerTip()Lcom/momo/mcamera/mask/TriggerTip;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;->triggerTip:Lcom/momo/mcamera/mask/TriggerTip;

    .line 2
    .line 3
    return-object p0
.end method

.method public isFaceTrack()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;->isFaceTrack:Z

    .line 2
    .line 3
    return p0
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;->content:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFaceTrack(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;->isFaceTrack:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerTip(Lcom/momo/mcamera/mask/TriggerTip;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;->triggerTip:Lcom/momo/mcamera/mask/TriggerTip;

    .line 2
    .line 3
    return-void
.end method
