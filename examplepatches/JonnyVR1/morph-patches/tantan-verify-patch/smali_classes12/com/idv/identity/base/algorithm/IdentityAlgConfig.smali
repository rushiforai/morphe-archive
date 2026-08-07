.class public Lcom/idv/identity/base/algorithm/IdentityAlgConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final BGR:I = 0x2

.field public static final BGRA:I = 0x1

.field public static final FACE_BLINK_LIVENESS:Ljava/lang/String; = "faceBlinkLiveness"

.field public static final FACE_FAR_NEAR_LIVENESS:Ljava/lang/String; = "faceFarNearLiveness"

.field public static final FACE_PHOTINUS_LIVENESS:Ljava/lang/String; = "PhotinusLiveness"

.field public static final NV21:I = 0x0

.field public static final OPEN_MOUTH_LIVENESS:Ljava/lang/String; = "OpenMouthLiveness"

.field public static final RGB:I = 0x4

.field public static final RGBA:I = 0x3

.field public static final SHAKE_HEAD_LIVENESS:Ljava/lang/String; = "shakeHeadLiveness"


# instance fields
.field public detectImageFormat:I

.field public isOpenDegrade:Z

.field public isOpenQualityCheck:Z

.field public livenessCombinations:Ljava/lang/String;

.field public maxFarThreshold:F

.field public maxNearThreshold:F

.field public minFarThreshold:F

.field public minNearThreshold:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x3e19999a    # 0.15f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->minFarThreshold:F

    .line 8
    .line 9
    const v0, 0x3e3851ec    # 0.18f

    .line 10
    .line 11
    .line 12
    iput v0, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->maxFarThreshold:F

    .line 13
    .line 14
    const v0, 0x3ee66666    # 0.45f

    .line 15
    .line 16
    .line 17
    iput v0, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->maxNearThreshold:F

    .line 18
    .line 19
    const v0, 0x3ebd70a4    # 0.37f

    .line 20
    .line 21
    .line 22
    iput v0, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->minNearThreshold:F

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->isOpenQualityCheck:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->isOpenDegrade:Z

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "IdentityAlgConfig{detectImageFormat="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->detectImageFormat:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", minFarThreshold="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->minFarThreshold:F

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", maxFarThreshold="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->maxFarThreshold:F

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", maxNearThreshold="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->maxNearThreshold:F

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", minNearThreshold="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->minNearThreshold:F

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", livenessCombinations=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->livenessCombinations:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "\', isOpenQualityCheck="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean p0, p0, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->isOpenQualityCheck:Z

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const/16 p0, 0x7d

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method
