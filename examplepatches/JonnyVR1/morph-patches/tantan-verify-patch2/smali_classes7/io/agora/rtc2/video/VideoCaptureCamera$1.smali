.class Lio/agora/rtc2/video/VideoCaptureCamera$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/rtc2/video/VideoCaptureCamera;->getClosestFramerateRange(Ljava/util/List;I)Lio/agora/rtc2/video/VideoCapture$FramerateRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lio/agora/rtc2/video/VideoCapture$FramerateRange;",
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
.field final synthetic val$targetFramerate:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera$1;->val$targetFramerate:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
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
.method public compare(Lio/agora/rtc2/video/VideoCapture$FramerateRange;Lio/agora/rtc2/video/VideoCapture$FramerateRange;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lio/agora/rtc2/video/VideoCaptureCamera$1;->diff(Lio/agora/rtc2/video/VideoCapture$FramerateRange;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p2}, Lio/agora/rtc2/video/VideoCaptureCamera$1;->diff(Lio/agora/rtc2/video/VideoCapture$FramerateRange;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sub-int/2addr p1, p0

    .line 10
    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 11
    check-cast p1, Lio/agora/rtc2/video/VideoCapture$FramerateRange;

    check-cast p2, Lio/agora/rtc2/video/VideoCapture$FramerateRange;

    invoke-virtual {p0, p1, p2}, Lio/agora/rtc2/video/VideoCaptureCamera$1;->compare(Lio/agora/rtc2/video/VideoCapture$FramerateRange;Lio/agora/rtc2/video/VideoCapture$FramerateRange;)I

    move-result p0

    return p0
.end method

.method public diff(Lio/agora/rtc2/video/VideoCapture$FramerateRange;)I
    .locals 4

    .line 1
    iget v0, p1, Lio/agora/rtc2/video/VideoCapture$FramerateRange;->min:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/16 v2, 0x1f40

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {p0, v0, v2, v3, v1}, Lio/agora/rtc2/video/VideoCaptureCamera$1;->progressivePenalty(IIII)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera$1;->val$targetFramerate:I

    .line 12
    .line 13
    iget p1, p1, Lio/agora/rtc2/video/VideoCapture$FramerateRange;->max:I

    .line 14
    .line 15
    sub-int/2addr v1, p1

    .line 16
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/16 v1, 0x1388

    .line 21
    .line 22
    const/4 v2, 0x3

    .line 23
    invoke-direct {p0, p1, v1, v3, v2}, Lio/agora/rtc2/video/VideoCaptureCamera$1;->progressivePenalty(IIII)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    add-int/2addr v0, p0

    .line 28
    return v0
.end method
