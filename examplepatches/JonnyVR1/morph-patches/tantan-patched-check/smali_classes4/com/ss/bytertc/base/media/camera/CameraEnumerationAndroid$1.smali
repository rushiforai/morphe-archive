.class Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$1;
.super Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$ClosestComparator;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;->getClosestSupportedFramerateRange(Ljava/util/List;I)Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$ClosestComparator<",
        "Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;",
        ">;"
    }
.end annotation


# static fields
.field private static final MAX_FPS_DIFF_THRESHOLD:I = 0x1388

.field private static final MAX_FPS_HIGH_DIFF_WEIGHT:I = 0x3

.field private static final MAX_FPS_LOW_DIFF_WEIGHT:I = 0x1

.field private static final MIN_FPS_HIGH_VALUE_WEIGHT:I = 0x4

.field private static final MIN_FPS_LOW_VALUE_WEIGHT:I = 0x1

.field private static final MIN_FPS_THRESHOLD:I = 0x1f40


# instance fields
.field final synthetic val$requestedFps:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$1;->val$requestedFps:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$ClosestComparator;-><init>(Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$1;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private progressivePenalty(IIII)I
    .locals 0

    if-ge p1, p2, :cond_0

    mul-int/2addr p1, p3

    return p1

    :cond_0
    mul-int/2addr p3, p2

    sub-int/2addr p1, p2

    mul-int/2addr p1, p4

    add-int/2addr p3, p1

    return p3
.end method


# virtual methods
.method public diff(Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;)I
    .locals 5

    .line 1
    iget v0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$1;->val$requestedFps:I

    .line 2
    .line 3
    mul-int/lit16 v0, v0, 0x3e8

    .line 4
    .line 5
    iget v1, p1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->min:I

    .line 6
    .line 7
    sub-int/2addr v0, v1

    .line 8
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/16 v1, 0x1388

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, 0x3

    .line 16
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$1;->progressivePenalty(IIII)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget v4, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$1;->val$requestedFps:I

    .line 21
    .line 22
    mul-int/lit16 v4, v4, 0x3e8

    .line 23
    .line 24
    iget p1, p1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->max:I

    .line 25
    .line 26
    sub-int/2addr v4, p1

    .line 27
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$1;->progressivePenalty(IIII)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    add-int/2addr v0, p0

    .line 36
    return v0
.end method

.method public bridge synthetic diff(Ljava/lang/Object;)I
    .locals 0

    .line 37
    check-cast p1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    invoke-virtual {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$1;->diff(Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;)I

    move-result p0

    return p0
.end method
