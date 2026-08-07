.class public Lcom/ss/android/ttvecamera/cameraalgorithm/TERhythmicMotionParam;
.super Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmParam;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field public cropList:[F

.field public maxAlpha:F

.field public maxVelocity:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmParam;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    iput-object v0, p0, Lcom/ss/android/ttvecamera/cameraalgorithm/TERhythmicMotionParam;->cropList:[F

    .line 8
    .line 9
    sget v0, Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmParam$a;->b:I

    .line 10
    .line 11
    iput v0, p0, Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmParam;->type:I

    .line 12
    .line 13
    return-void
.end method
