.class public Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private face3DGame:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "face3DGame"
    .end annotation
.end field

.field facePositions:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "facePosition"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/FacePositions;",
            ">;"
        }
    .end annotation
.end field

.field private gameScore:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "gameScore"
    .end annotation
.end field

.field private soundPitchShift:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "soundPitchShift"
    .end annotation
.end field

.field private triggerPlayStatus:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "triggerPlayStatus"
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
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->triggerPlayStatus:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getFacePositions()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/FacePositions;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->facePositions:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGameScore()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->gameScore:I

    .line 2
    .line 3
    return p0
.end method

.method public getSoundPitchShift()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->soundPitchShift:I

    .line 2
    .line 3
    return p0
.end method

.method public getTriggerPlayStatus()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->triggerPlayStatus:I

    .line 2
    .line 3
    return p0
.end method

.method public isFace3DGame()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->face3DGame:Z

    .line 2
    .line 3
    return p0
.end method

.method public setFace3DGame(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->face3DGame:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFacePositions(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/FacePositions;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->facePositions:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setGameScore(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->gameScore:I

    .line 2
    .line 3
    return-void
.end method

.method public setSoundPitchShift(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->soundPitchShift:I

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerPlayStatus(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->triggerPlayStatus:I

    .line 2
    .line 3
    return-void
.end method
