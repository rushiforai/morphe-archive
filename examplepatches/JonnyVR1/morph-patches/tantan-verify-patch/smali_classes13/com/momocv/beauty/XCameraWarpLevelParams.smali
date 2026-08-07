.class public Lcom/momocv/beauty/XCameraWarpLevelParams;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public brows_thickness_:F

.field public cheekbone_width_:F

.field public chin_length_:F

.field public chin_size_:F

.field public chin_width_:F

.field public extern_ratio_:F

.field public eye_distance_:F

.field public eye_height_:F

.field public eye_size_:F

.field public eye_tilt_ratio_:F

.field public face_width_:F

.field public fat_face_:F

.field public fat_face_small_chin_:F

.field public forehead_ud_:F

.field public height_bbox_ratio_:F

.field public jaw_width_:F

.field public lip_size_:F

.field public lip_thickness_:F

.field public mm_thin_face_:F

.field public nose_lift_:F

.field public nose_ridge_width_:F

.field public nose_size_:F

.field public nose_tip_size_:F

.field public nose_width_:F

.field public params:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public short_face_:F

.field public small_face_:F

.field public thinface_euler_switch_:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->face_width_:F

    .line 6
    .line 7
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->chin_size_:F

    .line 8
    .line 9
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->chin_length_:F

    .line 10
    .line 11
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->chin_width_:F

    .line 12
    .line 13
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_size_:F

    .line 14
    .line 15
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_height_:F

    .line 16
    .line 17
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_lift_:F

    .line 18
    .line 19
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->lip_thickness_:F

    .line 20
    .line 21
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->lip_size_:F

    .line 22
    .line 23
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_tilt_ratio_:F

    .line 24
    .line 25
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_distance_:F

    .line 26
    .line 27
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_size_:F

    .line 28
    .line 29
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_width_:F

    .line 30
    .line 31
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_ridge_width_:F

    .line 32
    .line 33
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_tip_size_:F

    .line 34
    .line 35
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->forehead_ud_:F

    .line 36
    .line 37
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->mm_thin_face_:F

    .line 38
    .line 39
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->brows_thickness_:F

    .line 40
    .line 41
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->short_face_:F

    .line 42
    .line 43
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->fat_face_:F

    .line 44
    .line 45
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->fat_face_small_chin_:F

    .line 46
    .line 47
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->cheekbone_width_:F

    .line 48
    .line 49
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->jaw_width_:F

    .line 50
    .line 51
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->extern_ratio_:F

    .line 52
    .line 53
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->height_bbox_ratio_:F

    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    iput-boolean v1, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->thinface_euler_switch_:Z

    .line 57
    .line 58
    iput v0, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->small_face_:F

    .line 59
    .line 60
    return-void
.end method
