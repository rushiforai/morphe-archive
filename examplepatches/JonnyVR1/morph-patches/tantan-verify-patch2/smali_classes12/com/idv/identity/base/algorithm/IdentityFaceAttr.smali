.class public Lcom/idv/identity/base/algorithm/IdentityFaceAttr;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field df:Ljava/text/DecimalFormat;

.field public eyeBlink:Z

.field public faceNum:I

.field public faceRegion:Landroid/graphics/RectF;

.field public leftEyeOpen:I

.field public occlusion:F

.field public ratio:F

.field public rightEyeOpen:I

.field public score:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "#.######"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->df:Ljava/text/DecimalFormat;

    return-void
.end method

.method public constructor <init>(FFFIII)V
    .locals 2

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "#.######"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->df:Ljava/text/DecimalFormat;

    .line 32
    iput p1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->ratio:F

    .line 33
    iput p2, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->score:F

    .line 34
    iput p3, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->occlusion:F

    .line 35
    iput p4, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->rightEyeOpen:I

    .line 36
    iput p5, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->leftEyeOpen:I

    .line 37
    iput p6, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->faceNum:I

    return-void
.end method

.method public constructor <init>(Landroid/graphics/RectF;FFFIII)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/text/DecimalFormat;

    .line 5
    .line 6
    const-string v1, "#.######"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->df:Ljava/text/DecimalFormat;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->faceRegion:Landroid/graphics/RectF;

    .line 14
    .line 15
    iput p2, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->ratio:F

    .line 16
    .line 17
    iput p3, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->score:F

    .line 18
    .line 19
    iput p4, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->occlusion:F

    .line 20
    .line 21
    iput p5, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->rightEyeOpen:I

    .line 22
    .line 23
    iput p6, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->leftEyeOpen:I

    .line 24
    .line 25
    iput p7, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->faceNum:I

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public getFaceNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->faceNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getFaceRegion()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->faceRegion:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOcclusion()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->occlusion:F

    .line 2
    .line 3
    return p0
.end method

.method public getRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->ratio:F

    .line 2
    .line 3
    return p0
.end method

.method public getScore()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->score:F

    .line 2
    .line 3
    return p0
.end method

.method public isEyeBlink()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->eyeBlink:Z

    .line 2
    .line 3
    return p0
.end method

.method public isLeftEyeOpen()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->leftEyeOpen:I

    .line 2
    .line 3
    return p0
.end method

.method public isRightEyeOpen()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->rightEyeOpen:I

    .line 2
    .line 3
    return p0
.end method

.method public setEyeBlink(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->eyeBlink:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFaceNum(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->faceNum:I

    .line 2
    .line 3
    return-void
.end method

.method public setFaceRegion(Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->faceRegion:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-void
.end method

.method public setLeftEyeOpen(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->leftEyeOpen:I

    .line 2
    .line 3
    return-void
.end method

.method public setOcclusion(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->occlusion:F

    .line 2
    .line 3
    return-void
.end method

.method public setRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->ratio:F

    .line 2
    .line 3
    return-void
.end method

.method public setRightEyeOpen(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->rightEyeOpen:I

    .line 2
    .line 3
    return-void
.end method

.method public setScore(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->score:F

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "IdentityFaceAttr{face_ratio="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->ratio:F

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", occlusion="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->df:Ljava/text/DecimalFormat;

    .line 19
    .line 20
    iget v2, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->occlusion:F

    .line 21
    .line 22
    float-to-double v2, v2

    .line 23
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, ", faceRegion="

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->faceRegion:Landroid/graphics/RectF;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/graphics/RectF;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v1, ", score="

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget v1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->score:F

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, ", rightEyeOpen="

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget v1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->rightEyeOpen:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v1, ", leftEyeOpen="

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget v1, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->leftEyeOpen:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v1, ", faceNum="

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget p0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceAttr;->faceNum:I

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const/16 p0, 0x7d

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0
.end method
