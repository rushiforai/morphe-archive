.class Lcom/momo/rtcbase/CameraEnumerationAndroid$1;
.super Lcom/momo/rtcbase/CameraEnumerationAndroid$ClosestComparator;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/CameraEnumerationAndroid;->getClosestSupportedFramerateRange(Ljava/util/List;I)Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/momo/rtcbase/CameraEnumerationAndroid$ClosestComparator<",
        "Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;",
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
    iput p1, p0, Lcom/momo/rtcbase/CameraEnumerationAndroid$1;->val$requestedFps:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/CameraEnumerationAndroid$ClosestComparator;-><init>(Lcom/momo/rtcbase/CameraEnumerationAndroid$1;)V

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
.method public diff(Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;)I
    .locals 4

    .line 1
    iget v0, p1, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->min:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/16 v2, 0x1f40

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {p0, v0, v2, v3, v1}, Lcom/momo/rtcbase/CameraEnumerationAndroid$1;->progressivePenalty(IIII)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Lcom/momo/rtcbase/CameraEnumerationAndroid$1;->val$requestedFps:I

    .line 12
    .line 13
    mul-int/lit16 v1, v1, 0x3e8

    .line 14
    .line 15
    iget p1, p1, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->max:I

    .line 16
    .line 17
    sub-int/2addr v1, p1

    .line 18
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/16 v1, 0x1388

    .line 23
    .line 24
    const/4 v2, 0x3

    .line 25
    invoke-direct {p0, p1, v1, v3, v2}, Lcom/momo/rtcbase/CameraEnumerationAndroid$1;->progressivePenalty(IIII)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    add-int/2addr v0, p0

    .line 30
    return v0
.end method

.method public bridge synthetic diff(Ljava/lang/Object;)I
    .locals 0

    .line 31
    check-cast p1, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    invoke-virtual {p0, p1}, Lcom/momo/rtcbase/CameraEnumerationAndroid$1;->diff(Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;)I

    move-result p0

    return p0
.end method
