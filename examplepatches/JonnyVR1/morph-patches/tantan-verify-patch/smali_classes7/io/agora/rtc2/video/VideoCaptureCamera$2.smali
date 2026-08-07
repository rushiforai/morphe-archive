.class Lio/agora/rtc2/video/VideoCaptureCamera$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/rtc2/video/VideoCaptureCamera;->findBestFrameRateRangePreferFPS(Ljava/util/List;I)Lio/agora/rtc2/video/VideoCapture$FramerateRange;
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


# virtual methods
.method public compare(Lio/agora/rtc2/video/VideoCapture$FramerateRange;Lio/agora/rtc2/video/VideoCapture$FramerateRange;)I
    .locals 1

    .line 1
    iget p0, p1, Lio/agora/rtc2/video/VideoCapture$FramerateRange;->min:I

    .line 2
    .line 3
    iget v0, p2, Lio/agora/rtc2/video/VideoCapture$FramerateRange;->min:I

    .line 4
    .line 5
    sub-int/2addr p0, v0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    iget p0, p1, Lio/agora/rtc2/video/VideoCapture$FramerateRange;->max:I

    .line 9
    .line 10
    iget p1, p2, Lio/agora/rtc2/video/VideoCapture$FramerateRange;->max:I

    .line 11
    .line 12
    sub-int/2addr p0, p1

    .line 13
    :cond_0
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 14
    check-cast p1, Lio/agora/rtc2/video/VideoCapture$FramerateRange;

    check-cast p2, Lio/agora/rtc2/video/VideoCapture$FramerateRange;

    invoke-virtual {p0, p1, p2}, Lio/agora/rtc2/video/VideoCaptureCamera$2;->compare(Lio/agora/rtc2/video/VideoCapture$FramerateRange;Lio/agora/rtc2/video/VideoCapture$FramerateRange;)I

    move-result p0

    return p0
.end method
