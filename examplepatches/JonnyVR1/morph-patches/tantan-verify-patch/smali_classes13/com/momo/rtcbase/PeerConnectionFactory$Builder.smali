.class public Lcom/momo/rtcbase/PeerConnectionFactory$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/PeerConnectionFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private audioDecoderFactoryFactory:Lcom/momo/rtcbase/AudioDecoderFactoryFactory;

.field private audioDeviceModule:Lcom/momo/rtcbase/audio/AudioDeviceModule;

.field private audioEncoderFactoryFactory:Lcom/momo/rtcbase/AudioEncoderFactoryFactory;

.field private audioProcessingFactory:Lcom/momo/rtcbase/AudioProcessingFactory;

.field private fecControllerFactoryFactory:Lcom/momo/rtcbase/FecControllerFactoryFactoryInterface;

.field private mediaTransportFactoryFactory:Lcom/momo/rtcbase/MediaTransportFactoryFactory;

.field private options:Lcom/momo/rtcbase/PeerConnectionFactory$Options;

.field private videoDecoderFactory:Lcom/momo/rtcbase/VideoDecoderFactory;

.field private videoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/audio/LegacyAudioDeviceModule;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/rtcbase/audio/LegacyAudioDeviceModule;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->audioDeviceModule:Lcom/momo/rtcbase/audio/AudioDeviceModule;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/rtcbase/BuiltinAudioEncoderFactoryFactory;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/momo/rtcbase/BuiltinAudioEncoderFactoryFactory;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->audioEncoderFactoryFactory:Lcom/momo/rtcbase/AudioEncoderFactoryFactory;

    .line 17
    .line 18
    new-instance v0, Lcom/momo/rtcbase/BuiltinAudioDecoderFactoryFactory;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/momo/rtcbase/BuiltinAudioDecoderFactoryFactory;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->audioDecoderFactoryFactory:Lcom/momo/rtcbase/AudioDecoderFactoryFactory;

    .line 24
    .line 25
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/rtcbase/PeerConnectionFactory$1;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public createPeerConnectionFactory()Lcom/momo/rtcbase/PeerConnectionFactory;
    .locals 11

    .line 1
    new-instance v0, Lcom/momo/rtcbase/PeerConnectionFactory;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->options:Lcom/momo/rtcbase/PeerConnectionFactory$Options;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->audioDeviceModule:Lcom/momo/rtcbase/audio/AudioDeviceModule;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->audioEncoderFactoryFactory:Lcom/momo/rtcbase/AudioEncoderFactoryFactory;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->audioDecoderFactoryFactory:Lcom/momo/rtcbase/AudioDecoderFactoryFactory;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->videoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->videoDecoderFactory:Lcom/momo/rtcbase/VideoDecoderFactory;

    .line 14
    .line 15
    iget-object v7, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->audioProcessingFactory:Lcom/momo/rtcbase/AudioProcessingFactory;

    .line 16
    .line 17
    iget-object v8, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->fecControllerFactoryFactory:Lcom/momo/rtcbase/FecControllerFactoryFactoryInterface;

    .line 18
    .line 19
    iget-object v9, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->mediaTransportFactoryFactory:Lcom/momo/rtcbase/MediaTransportFactoryFactory;

    .line 20
    .line 21
    const/4 v10, 0x0

    .line 22
    invoke-direct/range {v0 .. v10}, Lcom/momo/rtcbase/PeerConnectionFactory;-><init>(Lcom/momo/rtcbase/PeerConnectionFactory$Options;Lcom/momo/rtcbase/audio/AudioDeviceModule;Lcom/momo/rtcbase/AudioEncoderFactoryFactory;Lcom/momo/rtcbase/AudioDecoderFactoryFactory;Lcom/momo/rtcbase/VideoEncoderFactory;Lcom/momo/rtcbase/VideoDecoderFactory;Lcom/momo/rtcbase/AudioProcessingFactory;Lcom/momo/rtcbase/FecControllerFactoryFactoryInterface;Lcom/momo/rtcbase/MediaTransportFactoryFactory;Lcom/momo/rtcbase/PeerConnectionFactory$1;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public setAudioDecoderFactoryFactory(Lcom/momo/rtcbase/AudioDecoderFactoryFactory;)Lcom/momo/rtcbase/PeerConnectionFactory$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->audioDecoderFactoryFactory:Lcom/momo/rtcbase/AudioDecoderFactoryFactory;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "PeerConnectionFactory.Builder does not accept a null AudioDecoderFactoryFactory."

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public setAudioDeviceModule(Lcom/momo/rtcbase/audio/AudioDeviceModule;)Lcom/momo/rtcbase/PeerConnectionFactory$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->audioDeviceModule:Lcom/momo/rtcbase/audio/AudioDeviceModule;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAudioEncoderFactoryFactory(Lcom/momo/rtcbase/AudioEncoderFactoryFactory;)Lcom/momo/rtcbase/PeerConnectionFactory$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->audioEncoderFactoryFactory:Lcom/momo/rtcbase/AudioEncoderFactoryFactory;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "PeerConnectionFactory.Builder does not accept a null AudioEncoderFactoryFactory."

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public setAudioProcessingFactory(Lcom/momo/rtcbase/AudioProcessingFactory;)Lcom/momo/rtcbase/PeerConnectionFactory$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->audioProcessingFactory:Lcom/momo/rtcbase/AudioProcessingFactory;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "PeerConnectionFactory builder does not accept a null AudioProcessingFactory."

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public setFecControllerFactoryFactoryInterface(Lcom/momo/rtcbase/FecControllerFactoryFactoryInterface;)Lcom/momo/rtcbase/PeerConnectionFactory$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->fecControllerFactoryFactory:Lcom/momo/rtcbase/FecControllerFactoryFactoryInterface;

    .line 2
    .line 3
    return-object p0
.end method

.method public setMediaTransportFactoryFactory(Lcom/momo/rtcbase/MediaTransportFactoryFactory;)Lcom/momo/rtcbase/PeerConnectionFactory$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->mediaTransportFactoryFactory:Lcom/momo/rtcbase/MediaTransportFactoryFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public setOptions(Lcom/momo/rtcbase/PeerConnectionFactory$Options;)Lcom/momo/rtcbase/PeerConnectionFactory$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->options:Lcom/momo/rtcbase/PeerConnectionFactory$Options;

    .line 2
    .line 3
    return-object p0
.end method

.method public setVideoDecoderFactory(Lcom/momo/rtcbase/VideoDecoderFactory;)Lcom/momo/rtcbase/PeerConnectionFactory$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->videoDecoderFactory:Lcom/momo/rtcbase/VideoDecoderFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public setVideoEncoderFactory(Lcom/momo/rtcbase/VideoEncoderFactory;)Lcom/momo/rtcbase/PeerConnectionFactory$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$Builder;->videoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;

    .line 2
    .line 3
    return-object p0
.end method
