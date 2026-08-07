.class public Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public enableVolumeIndication:Z

.field public isAddVolumeValue:Z

.field public mediaType:Lcom/ss/bytertc/engine/live/MixedStreamMediaType;

.field public pushStreamMode:Lcom/ss/bytertc/engine/live/MixedStreamPushMode;

.field public seiContentMode:Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

.field public seiPayloadType:I

.field public seiPayloadUuid:Ljava/lang/String;

.field public talkVolume:I

.field public volumeIndicationInterval:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->enableVolumeIndication:Z

    .line 6
    .line 7
    const/high16 v1, 0x40000000    # 2.0f

    .line 8
    .line 9
    iput v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->volumeIndicationInterval:F

    .line 10
    .line 11
    iput v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->talkVolume:I

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->isAddVolumeValue:Z

    .line 14
    .line 15
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;->MIXED_STREAM_SEI_CONTENT_MODE_DEFAULT:Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->seiContentMode:Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 18
    .line 19
    const/16 v0, 0x64

    .line 20
    .line 21
    iput v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->seiPayloadType:I

    .line 22
    .line 23
    const-string v0, ""

    .line 24
    .line 25
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->seiPayloadUuid:Ljava/lang/String;

    .line 26
    .line 27
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamMediaType;->MIXED_STREAM_MEDIA_TYPE_AUDIO_AND_VIDEO:Lcom/ss/bytertc/engine/live/MixedStreamMediaType;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->mediaType:Lcom/ss/bytertc/engine/live/MixedStreamMediaType;

    .line 30
    .line 31
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamPushMode;->ON_STREAM:Lcom/ss/bytertc/engine/live/MixedStreamPushMode;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->pushStreamMode:Lcom/ss/bytertc/engine/live/MixedStreamPushMode;

    .line 34
    .line 35
    return-void
.end method
