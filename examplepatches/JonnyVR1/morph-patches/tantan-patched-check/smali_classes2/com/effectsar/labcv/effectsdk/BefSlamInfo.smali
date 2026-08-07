.class public Lcom/effectsar/labcv/effectsdk/BefSlamInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/BefSlamInfo$Points;,
        Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraIntrinsic;,
        Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamClickFlag;,
        Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraInfo;,
        Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuData;,
        Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuInfo;,
        Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;,
        Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;
    }
.end annotation


# instance fields
.field public cameraPose:Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;

.field public featurePoints:[Lcom/effectsar/labcv/effectsdk/BefSlamInfo$Points;

.field public intrinsic:Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraIntrinsic;

.field public isClicked:Z

.field public planeInfo:Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;

.field public planePose:Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;


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
