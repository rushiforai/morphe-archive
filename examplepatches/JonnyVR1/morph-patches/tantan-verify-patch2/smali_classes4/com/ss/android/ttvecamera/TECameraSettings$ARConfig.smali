.class public final Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttvecamera/TECameraSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ARConfig"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$PlaneFindingMode;,
        Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$LightEstimationMode;,
        Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$FocusMode;,
        Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$DepthMode;,
        Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$CloudAnchorMode;,
        Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$AugmentedFaceMode;
    }
.end annotation


# instance fields
.field public a:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$AugmentedFaceMode;

.field public b:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$CloudAnchorMode;

.field public c:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$DepthMode;

.field public d:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$FocusMode;

.field public e:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$LightEstimationMode;

.field public f:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$PlaneFindingMode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$AugmentedFaceMode;->DISABLED:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$AugmentedFaceMode;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->a:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$AugmentedFaceMode;

    .line 7
    .line 8
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$CloudAnchorMode;->DISABLED:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$CloudAnchorMode;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->b:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$CloudAnchorMode;

    .line 11
    .line 12
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$DepthMode;->DISABLED:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$DepthMode;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->c:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$DepthMode;

    .line 15
    .line 16
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$FocusMode;->FIXED:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$FocusMode;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->d:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$FocusMode;

    .line 19
    .line 20
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$LightEstimationMode;->DISABLED:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$LightEstimationMode;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->e:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$LightEstimationMode;

    .line 23
    .line 24
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$PlaneFindingMode;->DISABLED:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$PlaneFindingMode;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->f:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$PlaneFindingMode;

    .line 27
    .line 28
    return-void
.end method
