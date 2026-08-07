.class public Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/SimulcastConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "StreamLayerConfig"
.end annotation


# instance fields
.field public dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public enable:Z

.field public framerate:I

.field final synthetic this$0:Lio/agora/rtc2/SimulcastConfig;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/SimulcastConfig;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;->this$0:Lio/agora/rtc2/SimulcastConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/4 v0, 0x0

    invoke-direct {p1, v0, v0}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    iput-object p1, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    iput v0, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;->framerate:I

    iput-boolean v0, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;->enable:Z

    return-void
.end method

.method public constructor <init>(Lio/agora/rtc2/SimulcastConfig;Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;IZ)V
    .locals 0

    .line 2
    iput-object p1, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;->this$0:Lio/agora/rtc2/SimulcastConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    iput p3, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;->framerate:I

    iput-boolean p4, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;->enable:Z

    return-void
.end method


# virtual methods
.method public getDimensionsHeight()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "StreamLayerConfig"
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    iget p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;->height:I

    return p0
.end method

.method public getDimensionsWidth()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "StreamLayerConfig"
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    iget p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;->width:I

    return p0
.end method

.method public getFramerate()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "StreamLayerConfig"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;->framerate:I

    return p0
.end method

.method public isEnabled()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "StreamLayerConfig"
    .end annotation

    iget-boolean p0, p0, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;->enable:Z

    return p0
.end method
