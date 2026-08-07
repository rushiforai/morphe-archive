.class public Lcom/momocv/beauty/BodyWarpParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# instance fields
.field public body_keypoints_:[[Lcom/momocv/MMJoint;

.field public body_warp_gradual_switch_:Z

.field public body_warp_gradual_thresh_:F

.field public body_warp_params_group_:[Lcom/momocv/beauty/BodyWarpGroup;

.field public image_height_:I

.field public image_width_:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momocv/BaseParams;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momocv/beauty/BodyWarpParams;->image_width_:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momocv/beauty/BodyWarpParams;->image_height_:I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/momocv/beauty/BodyWarpParams;->body_warp_gradual_switch_:Z

    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    iput v0, p0, Lcom/momocv/beauty/BodyWarpParams;->body_warp_gradual_thresh_:F

    .line 15
    .line 16
    return-void
.end method
