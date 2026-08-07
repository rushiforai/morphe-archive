.class public Lcom/momocv/facefeatures/FaceFeaturesParams;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momocv/facefeatures/FaceFeaturesParams$BigFeatureVersion;
    }
.end annotation


# instance fields
.field public big_features_version_:I

.field public constraint_euler_angles_:[F

.field public extact_single_frame_:Z

.field public feature_strict_:Z

.field public multi_euler_angles_:[[F

.field public multi_landmarks_96_:[[F

.field public multi_tracking_id_:[I

.field public quality_detect_switch_:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x5f3759ee

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lcom/momocv/facefeatures/FaceFeaturesParams;->big_features_version_:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/momocv/facefeatures/FaceFeaturesParams;->feature_strict_:Z

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    iput-boolean v1, p0, Lcom/momocv/facefeatures/FaceFeaturesParams;->quality_detect_switch_:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/momocv/facefeatures/FaceFeaturesParams;->extact_single_frame_:Z

    .line 16
    .line 17
    return-void
.end method
