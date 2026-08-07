.class public Lcom/momo/mcamera/mask/TriggerTip;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private content:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "content"
    .end annotation
.end field

.field private contentDuration:I

.field private frameCount:I

.field private imageFolder:Ljava/lang/String;

.field private imagePosition:Lcom/momo/mcamera/mask/bean/TipsImagePosition;

.field private imageType:Ljava/lang/String;

.field private loopCount:I

.field private preferFrameRate:I

.field private triggerType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "triggerType"
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
    iget-object p0, p0, Lcom/momo/mcamera/mask/TriggerTip;->content:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentDuration()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/TriggerTip;->contentDuration:I

    .line 2
    .line 3
    return p0
.end method

.method public getFrameCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/TriggerTip;->frameCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getImageFolder()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/TriggerTip;->imageFolder:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImagePosition()Lcom/momo/mcamera/mask/bean/TipsImagePosition;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/TriggerTip;->imagePosition:Lcom/momo/mcamera/mask/bean/TipsImagePosition;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImageType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/TriggerTip;->imageType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLoopCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/TriggerTip;->loopCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getPreferFrameRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/TriggerTip;->preferFrameRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getTriggerType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/TriggerTip;->triggerType:I

    .line 2
    .line 3
    return p0
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/TriggerTip;->content:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setContentDuration(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerTip;->contentDuration:I

    .line 2
    .line 3
    return-void
.end method

.method public setFrameCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerTip;->frameCount:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageFolder(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/TriggerTip;->imageFolder:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setImagePosition(Lcom/momo/mcamera/mask/bean/TipsImagePosition;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/TriggerTip;->imagePosition:Lcom/momo/mcamera/mask/bean/TipsImagePosition;

    .line 2
    .line 3
    return-void
.end method

.method public setImageType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/TriggerTip;->imageType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLoopCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerTip;->loopCount:I

    .line 2
    .line 3
    return-void
.end method

.method public setPreferFrameRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerTip;->preferFrameRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerTip;->triggerType:I

    .line 2
    .line 3
    return-void
.end method
