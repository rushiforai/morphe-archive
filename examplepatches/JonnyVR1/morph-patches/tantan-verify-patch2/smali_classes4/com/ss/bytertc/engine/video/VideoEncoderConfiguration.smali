.class public Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;
    }
.end annotation


# instance fields
.field public dimensions:Lcom/ss/bytertc/engine/video/VideoDimensions;

.field public frameRate:Lcom/ss/bytertc/engine/video/FrameRate;

.field public kBitrate:I

.field public kMinBitrate:I

.field public orientationMode:Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/video/VideoDimensions;Lcom/ss/bytertc/engine/video/FrameRate;IILcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration;->dimensions:Lcom/ss/bytertc/engine/video/VideoDimensions;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration;->frameRate:Lcom/ss/bytertc/engine/video/FrameRate;

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration;->kBitrate:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration;->kMinBitrate:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration;->orientationMode:Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "VideoEncoderConfiguration{dimensions="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration;->dimensions:Lcom/ss/bytertc/engine/video/VideoDimensions;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", frameRate="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration;->frameRate:Lcom/ss/bytertc/engine/video/FrameRate;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", bitrate="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration;->kBitrate:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", minBitrate="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration;->kMinBitrate:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", orienttationMode="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration;->orientationMode:Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/16 p0, 0x7d

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
