.class public Lcom/momo/rtcbase/DefaultVideoEncoderFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoEncoderFactory;


# instance fields
.field private final hardwareVideoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;

.field private final softwareVideoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/EglBase$Context;ZZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/SoftwareVideoEncoderFactory;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/rtcbase/SoftwareVideoEncoderFactory;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/rtcbase/DefaultVideoEncoderFactory;->softwareVideoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2, p3}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;-><init>(Lcom/momo/rtcbase/EglBase$Context;ZZ)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/rtcbase/DefaultVideoEncoderFactory;->hardwareVideoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Lcom/momo/rtcbase/VideoEncoderFactory;)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Lcom/momo/rtcbase/SoftwareVideoEncoderFactory;

    invoke-direct {v0}, Lcom/momo/rtcbase/SoftwareVideoEncoderFactory;-><init>()V

    iput-object v0, p0, Lcom/momo/rtcbase/DefaultVideoEncoderFactory;->softwareVideoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;

    .line 21
    iput-object p1, p0, Lcom/momo/rtcbase/DefaultVideoEncoderFactory;->hardwareVideoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;

    return-void
.end method


# virtual methods
.method public createEncoder(Lcom/momo/rtcbase/VideoCodecInfo;)Lcom/momo/rtcbase/VideoEncoder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/DefaultVideoEncoderFactory;->softwareVideoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Lcom/momo/rtcbase/VideoEncoderFactory;->createEncoder(Lcom/momo/rtcbase/VideoCodecInfo;)Lcom/momo/rtcbase/VideoEncoder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/momo/rtcbase/DefaultVideoEncoderFactory;->hardwareVideoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Lcom/momo/rtcbase/VideoEncoderFactory;->createEncoder(Lcom/momo/rtcbase/VideoCodecInfo;)Lcom/momo/rtcbase/VideoEncoder;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance p1, Lcom/momo/rtcbase/VideoEncoderFallback;

    .line 18
    .line 19
    invoke-direct {p1, v0, p0}, Lcom/momo/rtcbase/VideoEncoderFallback;-><init>(Lcom/momo/rtcbase/VideoEncoder;Lcom/momo/rtcbase/VideoEncoder;)V

    .line 20
    .line 21
    .line 22
    return-object p1

    .line 23
    :cond_0
    if-eqz p0, :cond_1

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    return-object v0
.end method

.method public getSupportedCodecs()[Lcom/momo/rtcbase/VideoCodecInfo;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/rtcbase/DefaultVideoEncoderFactory;->softwareVideoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;

    .line 7
    .line 8
    invoke-interface {v1}, Lcom/momo/rtcbase/VideoEncoderFactory;->getSupportedCodecs()[Lcom/momo/rtcbase/VideoCodecInfo;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/momo/rtcbase/DefaultVideoEncoderFactory;->hardwareVideoEncoderFactory:Lcom/momo/rtcbase/VideoEncoderFactory;

    .line 20
    .line 21
    invoke-interface {p0}, Lcom/momo/rtcbase/VideoEncoderFactory;->getSupportedCodecs()[Lcom/momo/rtcbase/VideoCodecInfo;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    new-array p0, p0, [Lcom/momo/rtcbase/VideoCodecInfo;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/util/AbstractCollection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, [Lcom/momo/rtcbase/VideoCodecInfo;

    .line 43
    .line 44
    return-object p0
.end method
