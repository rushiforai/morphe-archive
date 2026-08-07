.class public Lcom/momocv/beauty/BeautyWarpParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momocv/beauty/BeautyWarpParams$WarpType;
    }
.end annotation


# instance fields
.field public euler_angle_:[[F

.field public face_warp_gradual_switch_:Z

.field public face_warp_gradual_thresh_:I

.field public image_height_:I

.field public image_width_:I

.field public is_stable_:Z

.field public landmarks104_:[[F

.field public landmarks106_:[[F

.field public landmarks222_:[[F

.field public landmarks240_:[[F

.field public multifaces_switch_:Z

.field public warp_level1_:[F

.field public warp_level2_:[F

.field public warp_level_group_:[Lcom/momocv/beauty/XCameraWarpLevelParams;

.field public warp_type_:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momocv/BaseParams;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momocv/beauty/BeautyWarpParams;->image_width_:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momocv/beauty/BeautyWarpParams;->image_height_:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Lcom/momocv/beauty/BeautyWarpParams;->is_stable_:Z

    .line 11
    .line 12
    iput v0, p0, Lcom/momocv/beauty/BeautyWarpParams;->warp_type_:I

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/momocv/beauty/BeautyWarpParams;->multifaces_switch_:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/momocv/beauty/BeautyWarpParams;->face_warp_gradual_switch_:Z

    .line 17
    .line 18
    const/16 v0, 0xa

    .line 19
    .line 20
    iput v0, p0, Lcom/momocv/beauty/BeautyWarpParams;->face_warp_gradual_thresh_:I

    .line 21
    .line 22
    return-void
.end method
