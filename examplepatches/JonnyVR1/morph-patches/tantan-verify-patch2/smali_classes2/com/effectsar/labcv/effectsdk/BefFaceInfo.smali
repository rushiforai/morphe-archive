.class public Lcom/effectsar/labcv/effectsdk/BefFaceInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;,
        Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;,
        Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;,
        Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;,
        Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;,
        Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;
    }
.end annotation


# instance fields
.field private attris:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;

.field private extras:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;

.field private face106s:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;

.field private faceMask:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;

.field private mouthMask:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;

.field private teethMask:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;


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
.method public getAttris()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->attris:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public getExtras()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->extras:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public getFace106s()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->face106s:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;

    .line 8
    .line 9
    return-object p0
.end method

.method public getFaceMaskInfo()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->faceMask:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public getMouthMaskInfo()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->mouthMask:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public getTeethMaskInfo()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->teethMask:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "BefFaceInfo{face106s="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->face106s:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;

    .line 9
    .line 10
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", extras="

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->extras:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;

    .line 23
    .line 24
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ", attris="

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->attris:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;

    .line 37
    .line 38
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, ", mouthMask="

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->mouthMask:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;

    .line 51
    .line 52
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v1, ", teethMask="

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->teethMask:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;

    .line 65
    .line 66
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", faceMask="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->faceMask:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceMaskInfo;

    .line 79
    .line 80
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const/16 p0, 0x7d

    .line 88
    .line 89
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0
.end method
