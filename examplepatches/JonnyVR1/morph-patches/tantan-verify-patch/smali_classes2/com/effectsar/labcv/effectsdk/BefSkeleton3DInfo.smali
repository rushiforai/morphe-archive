.class public Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo$TargetInfo;
    }
.end annotation


# static fields
.field static final SKELETON_3D_EXTENDED_JOINT_NUM:I = 0x40

.field static final SKELETON_3D_HEATMAP_KEYPOINT_NUM:I = 0x1b

.field static final SKELETON_3D_MAX_TARGET_NUM:I = 0x5


# instance fields
.field focal_length:F

.field targetInfos:[Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo$TargetInfo;

.field target_num:I

.field tracking:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    new-array v0, v0, [Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo$TargetInfo;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->targetInfos:[Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo$TargetInfo;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    :goto_0
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->targetInfos:[Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo$TargetInfo;

    .line 11
    .line 12
    array-length v2, v1

    .line 13
    if-ge v0, v2, :cond_0

    .line 14
    .line 15
    new-instance v2, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo$TargetInfo;

    .line 16
    .line 17
    invoke-direct {v2}, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo$TargetInfo;-><init>()V

    .line 18
    .line 19
    .line 20
    aput-object v2, v1, v0

    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method


# virtual methods
.method public getFocal_length()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->focal_length:F

    .line 2
    .line 3
    return p0
.end method

.method public getTargetInfos()[Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo$TargetInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->targetInfos:[Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo$TargetInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTarget_num()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->target_num:I

    .line 2
    .line 3
    return p0
.end method

.method public getTracking()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->tracking:I

    .line 2
    .line 3
    return p0
.end method

.method public setFocal_length(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->focal_length:F

    .line 2
    .line 3
    return-void
.end method

.method public setTargetInfos([Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo$TargetInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->targetInfos:[Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo$TargetInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setTarget_num(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->target_num:I

    .line 2
    .line 3
    return-void
.end method

.method public setTracking(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->tracking:I

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "BefSkeleton3DInfo{targetInfos="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->targetInfos:[Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo$TargetInfo;

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
    const-string v1, ", target_num="

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->target_num:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ", focal_length="

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->focal_length:F

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, ", tracking="

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefSkeleton3DInfo;->tracking:I

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const/16 p0, 0x7d

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method
