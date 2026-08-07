.class public Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/CameraCapturerConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CaptureFormat"
.end annotation


# instance fields
.field public fps:I

.field public height:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x3c0

    iput v0, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;->width:I

    const/16 v0, 0x21c

    iput v0, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;->height:I

    const/16 v0, 0xf

    iput v0, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;->fps:I

    return-void
.end method

.method public constructor <init>(III)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;->width:I

    iput p2, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;->height:I

    iput p3, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;->fps:I

    return-void
.end method


# virtual methods
.method public getFps()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "CaptureFormat"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;->fps:I

    return p0
.end method

.method public getHeight()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "CaptureFormat"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;->height:I

    return p0
.end method

.method public getWidth()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "CaptureFormat"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;->width:I

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CaptureFormat{width="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", fps="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CaptureFormat;->fps:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
