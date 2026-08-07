.class public Lcom/ss/bytertc/engine/video/RTCWatermarkConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public positionInLandscapeMode:Lcom/ss/bytertc/engine/video/ByteWatermark;

.field public positionInPortraitMode:Lcom/ss/bytertc/engine/video/ByteWatermark;

.field public visibleInPreview:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/video/RTCWatermarkConfig;->visibleInPreview:Z

    return-void
.end method

.method public constructor <init>(ZLcom/ss/bytertc/engine/video/ByteWatermark;Lcom/ss/bytertc/engine/video/ByteWatermark;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/video/RTCWatermarkConfig;->visibleInPreview:Z

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/video/RTCWatermarkConfig;->positionInLandscapeMode:Lcom/ss/bytertc/engine/video/ByteWatermark;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/ss/bytertc/engine/video/RTCWatermarkConfig;->positionInPortraitMode:Lcom/ss/bytertc/engine/video/ByteWatermark;

    .line 9
    .line 10
    return-void
.end method
