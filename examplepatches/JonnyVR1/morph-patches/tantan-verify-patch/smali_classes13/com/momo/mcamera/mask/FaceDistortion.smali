.class public Lcom/momo/mcamera/mask/FaceDistortion;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private strength:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "strength"
    .end annotation
.end field

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
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getStrength()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/FaceDistortion;->strength:F

    .line 2
    .line 3
    return p0
.end method

.method public getTriggerType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/FaceDistortion;->triggerType:I

    .line 2
    .line 3
    return p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceDistortion;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setStrength(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/FaceDistortion;->strength:F

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/FaceDistortion;->triggerType:I

    .line 2
    .line 3
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/FaceDistortion;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
