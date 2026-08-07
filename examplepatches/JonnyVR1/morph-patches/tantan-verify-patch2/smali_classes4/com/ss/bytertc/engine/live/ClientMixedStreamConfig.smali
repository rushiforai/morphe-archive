.class public Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public useAudioMixer:Z

.field public videoFormat:Lcom/ss/bytertc/engine/live/MixedStreamClientMixVideoFormat;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;->useAudioMixer:Z

    .line 6
    .line 7
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamClientMixVideoFormat;->MIXED_STREAM_CLIENT_MIX_VIDEO_FORMAT_YUV_I420:Lcom/ss/bytertc/engine/live/MixedStreamClientMixVideoFormat;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;->videoFormat:Lcom/ss/bytertc/engine/live/MixedStreamClientMixVideoFormat;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getClientMixedStreamConfigUseAudioMixer()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;->useAudioMixer:Z

    .line 2
    .line 3
    return p0
.end method

.method public getClientMixedStreamConfigVideoFormat()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;->videoFormat:Lcom/ss/bytertc/engine/live/MixedStreamClientMixVideoFormat;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamClientMixVideoFormat;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
