.class public Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final buffer:Ljava/nio/ByteBuffer;

.field public height:I

.field public timestampDtsUs:J

.field public timestampUs:J

.field public videoCodecType:Lcom/ss/bytertc/engine/data/VideoCodecType;

.field public videoPictureType:Lcom/ss/bytertc/engine/data/VideoPictureType;

.field public videoRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

.field public width:I


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;JJIILcom/ss/bytertc/engine/data/VideoCodecType;Lcom/ss/bytertc/engine/data/VideoPictureType;Lcom/ss/bytertc/engine/data/VideoRotation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->buffer:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->timestampUs:J

    .line 7
    .line 8
    iput-wide p4, p0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->timestampDtsUs:J

    .line 9
    .line 10
    iput p6, p0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->width:I

    .line 11
    .line 12
    iput p7, p0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->height:I

    .line 13
    .line 14
    iput-object p8, p0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->videoCodecType:Lcom/ss/bytertc/engine/data/VideoCodecType;

    .line 15
    .line 16
    iput-object p9, p0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->videoPictureType:Lcom/ss/bytertc/engine/data/VideoPictureType;

    .line 17
    .line 18
    iput-object p10, p0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;->videoRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 19
    .line 20
    return-void
.end method
