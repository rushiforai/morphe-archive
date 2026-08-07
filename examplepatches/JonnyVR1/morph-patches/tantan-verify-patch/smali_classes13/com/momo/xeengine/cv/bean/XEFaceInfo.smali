.class public Lcom/momo/xeengine/cv/bean/XEFaceInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public cameraMatrix:[F

.field public dst_warp_points:[F

.field public expression:I

.field public faceBounds:[F

.field public faceMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

.field public faceRigEulerVector:Lcom/momo/xeengine/sensor/Vector3f;

.field public facerigStates:[F

.field public landmarks106:[F

.field public landmarks137:[F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public landmarks222:[F

.field public landmarks68:[F

.field public landmarks96:[F

.field public liquefyInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;",
            ">;"
        }
    .end annotation
.end field

.field public meType:I

.field public modelViewMatrix:[F

.field public mouthMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

.field public pitch:F

.field public projectionMatrix:[F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public roll:F

.field public rotationMatrix:[F

.field public rotationVector:[F

.field public skin_threshold:[F

.field public src_warp_points:[F

.field public trackId:I

.field public translationVector:[F

.field public yaw:F


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
.method public getCameraMatrix()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->cameraMatrix:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getDst_warp_points()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->dst_warp_points:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getExpression()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->expression:I

    .line 2
    .line 3
    return p0
.end method

.method public getFaceBounds()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceBounds:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getFaceMask()Lcom/momo/xeengine/cv/bean/XEFaceMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFaceRigEulerVector()Lcom/momo/xeengine/sensor/Vector3f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceRigEulerVector:Lcom/momo/xeengine/sensor/Vector3f;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFacerigStates()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->facerigStates:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getLandmarks137()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks137:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getLandmarks68()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks68:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getLandmarks96()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks96:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiquefyInfos()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->liquefyInfos:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMeType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->meType:I

    .line 2
    .line 3
    return p0
.end method

.method public getModelViewMatrix()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->modelViewMatrix:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getMouthMask()Lcom/momo/xeengine/cv/bean/XEFaceMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->mouthMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPitch()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->pitch:F

    .line 2
    .line 3
    return p0
.end method

.method public getProjectionMatrix()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->projectionMatrix:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoll()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->roll:F

    .line 2
    .line 3
    return p0
.end method

.method public getRotationMatrix()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->rotationMatrix:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getRotationVector()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->rotationVector:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getSkin_threshold()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->skin_threshold:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getSrc_warp_points()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->src_warp_points:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrackId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->trackId:I

    .line 2
    .line 3
    return p0
.end method

.method public getTranslationVector()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->translationVector:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getYaw()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->yaw:F

    .line 2
    .line 3
    return p0
.end method

.method public setCameraMatrix([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->cameraMatrix:[F

    .line 2
    .line 3
    return-void
.end method

.method public setDst_warp_points([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->dst_warp_points:[F

    .line 2
    .line 3
    return-void
.end method

.method public setExpression(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->expression:I

    .line 2
    .line 3
    return-void
.end method

.method public setFaceBounds([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceBounds:[F

    .line 2
    .line 3
    return-void
.end method

.method public setFaceMask(Lcom/momo/xeengine/cv/bean/XEFaceMask;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 2
    .line 3
    return-void
.end method

.method public setFaceRigEulerVector(Lcom/momo/xeengine/sensor/Vector3f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceRigEulerVector:Lcom/momo/xeengine/sensor/Vector3f;

    .line 2
    .line 3
    return-void
.end method

.method public setFacerigStates([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->facerigStates:[F

    .line 2
    .line 3
    return-void
.end method

.method public setLandmarks137([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks137:[F

    .line 2
    .line 3
    return-void
.end method

.method public setLandmarks68([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks68:[F

    .line 2
    .line 3
    return-void
.end method

.method public setLandmarks96([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks96:[F

    .line 2
    .line 3
    return-void
.end method

.method public setLiquefyInfos(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->liquefyInfos:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setMeType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->meType:I

    .line 2
    .line 3
    return-void
.end method

.method public setModelViewMatrix([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->modelViewMatrix:[F

    .line 2
    .line 3
    return-void
.end method

.method public setMouthMask(Lcom/momo/xeengine/cv/bean/XEFaceMask;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->mouthMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 2
    .line 3
    return-void
.end method

.method public setPitch(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->pitch:F

    .line 2
    .line 3
    return-void
.end method

.method public setProjectionMatrix([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->projectionMatrix:[F

    .line 2
    .line 3
    return-void
.end method

.method public setRoll(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->roll:F

    .line 2
    .line 3
    return-void
.end method

.method public setRotationMatrix([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->rotationMatrix:[F

    .line 2
    .line 3
    return-void
.end method

.method public setRotationVector([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->rotationVector:[F

    .line 2
    .line 3
    return-void
.end method

.method public setSkin_threshold([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->skin_threshold:[F

    .line 2
    .line 3
    return-void
.end method

.method public setSrc_warp_points([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->src_warp_points:[F

    .line 2
    .line 3
    return-void
.end method

.method public setTrackId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->trackId:I

    .line 2
    .line 3
    return-void
.end method

.method public setTranslationVector([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->translationVector:[F

    .line 2
    .line 3
    return-void
.end method

.method public setYaw(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->yaw:F

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
    const-string v1, "XEFaceInfo{modelViewMatrix="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->modelViewMatrix:[F

    .line 9
    .line 10
    invoke-static {p0}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const/16 p0, 0x7d

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method
