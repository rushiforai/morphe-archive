.class public Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/ScreenCaptureParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoCaptureParameters"
.end annotation


# instance fields
.field public bitrate:I

.field public contentHint:I

.field public framerate:I

.field public height:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->bitrate:I

    const/16 v0, 0xf

    iput v0, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->framerate:I

    const/16 v0, 0x500

    iput v0, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->width:I

    const/16 v0, 0x2d0

    iput v0, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->height:I

    const/4 v0, 0x1

    iput v0, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->contentHint:I

    return-void
.end method


# virtual methods
.method public getBitrate()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "VideoCaptureParameters"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->bitrate:I

    return p0
.end method

.method public getContentHint()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "VideoCaptureParameters"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->contentHint:I

    return p0
.end method

.method public getFramerate()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "VideoCaptureParameters"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->framerate:I

    return p0
.end method

.method public getHeight()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "VideoCaptureParameters"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->height:I

    return p0
.end method

.method public getWidth()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "VideoCaptureParameters"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->width:I

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "VideoCaptureParameters{bitrate="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->bitrate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", framerate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->framerate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", contentHint="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;->contentHint:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
