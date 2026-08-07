.class public Lcom/momo/mcamera/mask/Mask;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private folder:Ljava/lang/String;

.field private hiddenTriggerType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "hidingTriggerType"
    .end annotation
.end field

.field private hidingObjectTriggerType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "hidingObjectTriggerType"
    .end annotation
.end field

.field public landmarks:[F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "landmarks"
    .end annotation
.end field

.field private objectTriggerType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "objectTriggerType"
    .end annotation
.end field

.field private strength:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "strength"
    .end annotation
.end field

.field private strengthB:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "strengthB"
    .end annotation
.end field

.field private strengthStep:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "strengthStep"
    .end annotation
.end field

.field private strengthStepB:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "strengthStepB"
    .end annotation
.end field

.field public swapFacialMask:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "swapFacialMask"
    .end annotation
.end field

.field private texturePath:Ljava/lang/String;

.field private triggerType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "triggerType"
    .end annotation
.end field

.field private type:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "type"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/Mask;->triggerType:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/Mask;->hiddenTriggerType:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lcom/momo/mcamera/mask/Mask;->strength:F

    .line 11
    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/Mask;->strengthB:F

    .line 13
    .line 14
    iput v0, p0, Lcom/momo/mcamera/mask/Mask;->strengthStep:F

    .line 15
    .line 16
    iput v0, p0, Lcom/momo/mcamera/mask/Mask;->strengthStepB:F

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public getFolder()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Mask;->folder:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHiddenTriggerType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Mask;->hiddenTriggerType:I

    .line 2
    .line 3
    return p0
.end method

.method public getHidingObjectTriggerType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Mask;->hidingObjectTriggerType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getObjectTriggerType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Mask;->objectTriggerType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStrength()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Mask;->strength:F

    .line 2
    .line 3
    return p0
.end method

.method public getStrengthB()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Mask;->strengthB:F

    .line 2
    .line 3
    return p0
.end method

.method public getStrengthStep()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Mask;->strengthStep:F

    .line 2
    .line 3
    return p0
.end method

.method public getStrengthStepB()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Mask;->strengthStepB:F

    .line 2
    .line 3
    return p0
.end method

.method public getTexturePath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Mask;->texturePath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTriggerType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Mask;->triggerType:I

    .line 2
    .line 3
    return p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Mask;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFolder(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Mask;->folder:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setHiddenTriggerType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Mask;->hiddenTriggerType:I

    .line 2
    .line 3
    return-void
.end method

.method public setHidingObjectTriggerType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Mask;->hidingObjectTriggerType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setObjectTriggerType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Mask;->objectTriggerType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setStrength(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Mask;->strength:F

    .line 2
    .line 3
    return-void
.end method

.method public setStrengthB(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Mask;->strengthB:F

    .line 2
    .line 3
    return-void
.end method

.method public setStrengthStep(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Mask;->strengthStep:F

    .line 2
    .line 3
    return-void
.end method

.method public setStrengthStepB(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Mask;->strengthStepB:F

    .line 2
    .line 3
    return-void
.end method

.method public setTexturePath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Mask;->texturePath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Mask;->triggerType:I

    .line 2
    .line 3
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Mask;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
