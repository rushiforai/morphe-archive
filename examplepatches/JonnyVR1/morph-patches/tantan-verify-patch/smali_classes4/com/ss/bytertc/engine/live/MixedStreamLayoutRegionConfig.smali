.class public Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public alpha:D

.field public alternateImageFillMode:Lcom/ss/bytertc/engine/live/MixedStreamAlternateImageFillMode;

.field public alternateImageURL:Ljava/lang/String;

.field public applySpatialAudio:Z

.field public cornerRadius:D

.field public height:I

.field public imageWaterMark:[B

.field public imageWaterMarkConfig:Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionImageWaterMarkConfig;

.field public isLocalUser:Z

.field public locationX:I

.field public locationY:I

.field public mediaType:Lcom/ss/bytertc/engine/live/MixedStreamMediaType;

.field public regionContentType:Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionType;

.field public renderMode:Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

.field public roomID:Ljava/lang/String;

.field public sourceCrop:Lcom/ss/bytertc/engine/live/SourceCrop;

.field public spatialPosition:Lcom/ss/bytertc/engine/data/Position;

.field public streamType:Lcom/ss/bytertc/engine/live/MixedStreamVideoType;

.field public userID:Ljava/lang/String;

.field public width:I

.field public zOrder:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->userID:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->roomID:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->locationX:I

    .line 12
    .line 13
    iput v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->locationY:I

    .line 14
    .line 15
    const/16 v2, 0x168

    .line 16
    .line 17
    iput v2, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->width:I

    .line 18
    .line 19
    const/16 v2, 0x280

    .line 20
    .line 21
    iput v2, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->height:I

    .line 22
    .line 23
    iput v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->zOrder:I

    .line 24
    .line 25
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 26
    .line 27
    iput-wide v2, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->alpha:D

    .line 28
    .line 29
    const-wide/16 v2, 0x0

    .line 30
    .line 31
    iput-wide v2, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->cornerRadius:D

    .line 32
    .line 33
    sget-object v2, Lcom/ss/bytertc/engine/live/MixedStreamMediaType;->MIXED_STREAM_MEDIA_TYPE_AUDIO_AND_VIDEO:Lcom/ss/bytertc/engine/live/MixedStreamMediaType;

    .line 34
    .line 35
    iput-object v2, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->mediaType:Lcom/ss/bytertc/engine/live/MixedStreamMediaType;

    .line 36
    .line 37
    sget-object v2, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;->MIXED_STREAM_RENDER_MODE_HIDDEN:Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 38
    .line 39
    iput-object v2, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->renderMode:Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 40
    .line 41
    iput-boolean v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->isLocalUser:Z

    .line 42
    .line 43
    sget-object v2, Lcom/ss/bytertc/engine/live/MixedStreamVideoType;->MIXED_STREAM_VIDEO_TYPE_MAIN:Lcom/ss/bytertc/engine/live/MixedStreamVideoType;

    .line 44
    .line 45
    iput-object v2, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->streamType:Lcom/ss/bytertc/engine/live/MixedStreamVideoType;

    .line 46
    .line 47
    sget-object v2, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionType;->MIXED_STREAM_LAYOUT_REGION_TYPE_VIDEO_STREAM:Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionType;

    .line 48
    .line 49
    iput-object v2, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->regionContentType:Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionType;

    .line 50
    .line 51
    const/4 v2, 0x0

    .line 52
    iput-object v2, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->imageWaterMark:[B

    .line 53
    .line 54
    new-instance v2, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionImageWaterMarkConfig;

    .line 55
    .line 56
    invoke-direct {v2, v1, v1}, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionImageWaterMarkConfig;-><init>(II)V

    .line 57
    .line 58
    .line 59
    iput-object v2, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->imageWaterMarkConfig:Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionImageWaterMarkConfig;

    .line 60
    .line 61
    sget-object v1, Lcom/ss/bytertc/engine/live/MixedStreamAlternateImageFillMode;->FIT:Lcom/ss/bytertc/engine/live/MixedStreamAlternateImageFillMode;

    .line 62
    .line 63
    iput-object v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->alternateImageFillMode:Lcom/ss/bytertc/engine/live/MixedStreamAlternateImageFillMode;

    .line 64
    .line 65
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->alternateImageURL:Ljava/lang/String;

    .line 66
    .line 67
    new-instance v0, Lcom/ss/bytertc/engine/data/Position;

    .line 68
    .line 69
    invoke-direct {v0}, Lcom/ss/bytertc/engine/data/Position;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->spatialPosition:Lcom/ss/bytertc/engine/data/Position;

    .line 73
    .line 74
    const/4 v0, 0x1

    .line 75
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->applySpatialAudio:Z

    .line 76
    .line 77
    new-instance v0, Lcom/ss/bytertc/engine/live/SourceCrop;

    .line 78
    .line 79
    invoke-direct {v0}, Lcom/ss/bytertc/engine/live/SourceCrop;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->sourceCrop:Lcom/ss/bytertc/engine/live/SourceCrop;

    .line 83
    .line 84
    return-void
.end method
