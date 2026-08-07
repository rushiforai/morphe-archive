.class public Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BefGazeEstimation"
.end annotation


# instance fields
.field faceId:J

.field head_r:[F

.field head_t:[F

.field leye_gaze:[F

.field leye_gaze_2d:[F

.field leye_pos:[F

.field leye_pos2d:[F

.field mid_gaze:[F

.field reye_gaze:[F

.field reye_gaze2d:[F

.field reye_pos:[F

.field reye_pos2d:[F

.field valid:Z


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
.method public getFaceId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->faceId:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getHead_r()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->head_r:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getHead_t()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->head_t:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getLeye_gaze()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->leye_gaze:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getLeye_gaze_2d()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->leye_gaze_2d:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getLeye_pos()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->leye_pos:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getLeye_pos2d()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->leye_pos2d:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getMid_gaze()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->mid_gaze:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getReye_gaze()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->reye_gaze:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getReye_gaze2d()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->reye_gaze2d:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getReye_pos()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->reye_pos:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getReye_pos2d()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->reye_pos2d:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public isValid()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;->valid:Z

    .line 2
    .line 3
    return p0
.end method
