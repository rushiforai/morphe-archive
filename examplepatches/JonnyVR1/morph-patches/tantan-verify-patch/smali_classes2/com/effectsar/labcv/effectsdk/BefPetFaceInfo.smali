.class public Lcom/effectsar/labcv/effectsdk/BefPetFaceInfo;
.super Lcom/effectsar/labcv/effectsdk/BefFaceInfo;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/BefPetFaceInfo$PetFace;
    }
.end annotation


# instance fields
.field private faceCount:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/effectsar/labcv/effectsdk/BefPetFaceInfo;->faceCount:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getFace90()[Lcom/effectsar/labcv/effectsdk/BefPetFaceInfo$PetFace;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->getFace106s()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, [Lcom/effectsar/labcv/effectsdk/BefPetFaceInfo$PetFace;

    .line 6
    .line 7
    return-object p0
.end method

.method public getFaceCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefPetFaceInfo;->faceCount:I

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "BefPetFaceInfo{faces="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->getFace106s()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const/16 p0, 0x7d

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method
