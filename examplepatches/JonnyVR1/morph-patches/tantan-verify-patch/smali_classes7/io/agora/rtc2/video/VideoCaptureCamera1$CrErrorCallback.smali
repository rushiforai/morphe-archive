.class Lio/agora/rtc2/video/VideoCaptureCamera1$CrErrorCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/VideoCaptureCamera1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CrErrorCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/video/VideoCaptureCamera1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$CrErrorCallback;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onError(ILandroid/hardware/Camera;)V
    .locals 4

    .line 1
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$000()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "Camera ErrorCallback id: "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p2, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/16 p2, 0x64

    .line 23
    .line 24
    const/4 v0, 0x3

    .line 25
    const/4 v2, 0x1

    .line 26
    const/4 v3, 0x2

    .line 27
    if-eq p1, v3, :cond_1

    .line 28
    .line 29
    if-eq p1, p2, :cond_1

    .line 30
    .line 31
    if-eq p1, v2, :cond_1

    .line 32
    .line 33
    if-ne p1, v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-void

    .line 37
    :cond_1
    :goto_0
    if-ne p1, v3, :cond_2

    .line 38
    .line 39
    iget-object p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$CrErrorCallback;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 40
    .line 41
    invoke-static {p2, v2}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$102(Lio/agora/rtc2/video/VideoCaptureCamera1;Z)Z

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x6

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    if-ne p1, p2, :cond_3

    .line 47
    .line 48
    iget-object p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$CrErrorCallback;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 49
    .line 50
    invoke-virtual {p2}, Lio/agora/rtc2/video/VideoCaptureCamera1;->deallocate()V

    .line 51
    .line 52
    .line 53
    const/4 v0, 0x5

    .line 54
    goto :goto_1

    .line 55
    :cond_3
    iget-object p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$CrErrorCallback;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 56
    .line 57
    if-ne p1, v0, :cond_4

    .line 58
    .line 59
    invoke-static {p2, v2}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$102(Lio/agora/rtc2/video/VideoCaptureCamera1;Z)Z

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_4
    invoke-virtual {p2}, Lio/agora/rtc2/video/VideoCaptureCamera1;->deallocate()V

    .line 64
    .line 65
    .line 66
    const/16 v0, 0x385

    .line 67
    .line 68
    :goto_1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$CrErrorCallback;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 69
    .line 70
    new-instance p2, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p0, v0, p1}, Lio/agora/rtc2/video/VideoCapture;->onError(ILjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
