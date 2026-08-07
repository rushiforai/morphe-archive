.class public Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefFaceInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Face106"
.end annotation


# instance fields
.field ID:I

.field action:I

.field eye_dist:F

.field pitch:F

.field points_array:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

.field rect:Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;

.field roll:F

.field score:F

.field visibility_array:[F

.field yaw:F


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
.method public getAction()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->action:I

    .line 2
    .line 3
    return p0
.end method

.method public getEye_dist()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->eye_dist:F

    .line 2
    .line 3
    return p0
.end method

.method public getID()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->ID:I

    .line 2
    .line 3
    return p0
.end method

.method public getPitch()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->pitch:F

    .line 2
    .line 3
    return p0
.end method

.method public getPoints_array()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->points_array:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRect()Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->rect:Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoll()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->roll:F

    .line 2
    .line 3
    return p0
.end method

.method public getScore()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->score:F

    .line 2
    .line 3
    return p0
.end method

.method public getVisibility_array()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->visibility_array:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getYaw()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->yaw:F

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
    const-string v1, "Face106{rect="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->rect:Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", score="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->score:F

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", points_array="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->points_array:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 29
    .line 30
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, ", visibility_array="

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->visibility_array:[F

    .line 43
    .line 44
    invoke-static {v1}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v1, ", yaw="

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->yaw:F

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, ", pitch="

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->pitch:F

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v1, ", roll="

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->roll:F

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v1, ", eye_dist="

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->eye_dist:F

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v1, ", action="

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->action:I

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v1, ", ID="

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->ID:I

    .line 107
    .line 108
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const/16 p0, 0x7d

    .line 112
    .line 113
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    return-object p0
.end method
