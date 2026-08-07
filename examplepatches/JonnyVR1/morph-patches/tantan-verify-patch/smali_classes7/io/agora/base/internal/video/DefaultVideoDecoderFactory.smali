.class public Lio/agora/base/internal/video/DefaultVideoDecoderFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/video/VideoDecoderFactory;


# static fields
.field private static final TAG:Ljava/lang/String; = "DefaultVideoDecoderFactory"


# instance fields
.field private final hardwareVideoDecoderFactory:Lio/agora/base/internal/video/VideoDecoderFactory;

.field private final softwareVideoDecoderFactory:Lio/agora/base/internal/video/VideoDecoderFactory;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/EglBase$Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lio/agora/base/internal/video/SoftwareVideoDecoderFactory;

    .line 5
    .line 6
    invoke-direct {v0}, Lio/agora/base/internal/video/SoftwareVideoDecoderFactory;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lio/agora/base/internal/video/DefaultVideoDecoderFactory;->softwareVideoDecoderFactory:Lio/agora/base/internal/video/VideoDecoderFactory;

    .line 10
    .line 11
    new-instance v0, Lio/agora/base/internal/video/HardwareVideoDecoderFactory;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Lio/agora/base/internal/video/HardwareVideoDecoderFactory;-><init>(Lio/agora/base/internal/video/EglBase$Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lio/agora/base/internal/video/DefaultVideoDecoderFactory;->hardwareVideoDecoderFactory:Lio/agora/base/internal/video/VideoDecoderFactory;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Lio/agora/base/internal/video/VideoDecoderFactory;)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Lio/agora/base/internal/video/SoftwareVideoDecoderFactory;

    invoke-direct {v0}, Lio/agora/base/internal/video/SoftwareVideoDecoderFactory;-><init>()V

    iput-object v0, p0, Lio/agora/base/internal/video/DefaultVideoDecoderFactory;->softwareVideoDecoderFactory:Lio/agora/base/internal/video/VideoDecoderFactory;

    .line 21
    iput-object p1, p0, Lio/agora/base/internal/video/DefaultVideoDecoderFactory;->hardwareVideoDecoderFactory:Lio/agora/base/internal/video/VideoDecoderFactory;

    return-void
.end method


# virtual methods
.method public createDecoder(Lio/agora/base/internal/video/VideoCodecInfo;)Lio/agora/base/internal/video/VideoDecoder;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/DefaultVideoDecoderFactory;->softwareVideoDecoderFactory:Lio/agora/base/internal/video/VideoDecoderFactory;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Lio/agora/base/internal/video/VideoDecoderFactory;->createDecoder(Lio/agora/base/internal/video/VideoCodecInfo;)Lio/agora/base/internal/video/VideoDecoder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lio/agora/base/internal/video/DefaultVideoDecoderFactory;->hardwareVideoDecoderFactory:Lio/agora/base/internal/video/VideoDecoderFactory;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Lio/agora/base/internal/video/VideoDecoderFactory;->createDecoder(Lio/agora/base/internal/video/VideoCodecInfo;)Lio/agora/base/internal/video/VideoDecoder;

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
    new-instance p1, Lio/agora/base/internal/video/VideoDecoderFallback;

    .line 18
    .line 19
    invoke-direct {p1, v0, p0}, Lio/agora/base/internal/video/VideoDecoderFallback;-><init>(Lio/agora/base/internal/video/VideoDecoder;Lio/agora/base/internal/video/VideoDecoder;)V

    .line 20
    .line 21
    .line 22
    return-object p1

    .line 23
    :cond_0
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const-string p1, "hardware"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const-string p1, "software"

    .line 29
    .line 30
    :goto_0
    const-string v1, "using decoder:"

    .line 31
    .line 32
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string v1, "DefaultVideoDecoderFactory"

    .line 37
    .line 38
    invoke-static {v1, p1}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_2
    return-object v0
.end method

.method public createDecoder(Lio/agora/base/internal/video/VideoCodecInfo;Z)Lio/agora/base/internal/video/VideoDecoder;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    if-nez p2, :cond_0

    .line 45
    iget-object p0, p0, Lio/agora/base/internal/video/DefaultVideoDecoderFactory;->softwareVideoDecoderFactory:Lio/agora/base/internal/video/VideoDecoderFactory;

    invoke-interface {p0, p1}, Lio/agora/base/internal/video/VideoDecoderFactory;->createDecoder(Lio/agora/base/internal/video/VideoCodecInfo;)Lio/agora/base/internal/video/VideoDecoder;

    move-result-object p0

    return-object p0

    .line 46
    :cond_0
    invoke-virtual {p0, p1}, Lio/agora/base/internal/video/DefaultVideoDecoderFactory;->createDecoder(Lio/agora/base/internal/video/VideoCodecInfo;)Lio/agora/base/internal/video/VideoDecoder;

    move-result-object p0

    return-object p0
.end method

.method public createDecoder(Ljava/lang/String;)Lio/agora/base/internal/video/VideoDecoder;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 47
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Deprecated and not implemented."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getSupportedCodecs()[Lio/agora/base/internal/video/VideoCodecInfo;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lio/agora/base/internal/video/DefaultVideoDecoderFactory;->softwareVideoDecoderFactory:Lio/agora/base/internal/video/VideoDecoderFactory;

    .line 7
    .line 8
    invoke-interface {v1}, Lio/agora/base/internal/video/VideoDecoderFactory;->getSupportedCodecs()[Lio/agora/base/internal/video/VideoCodecInfo;

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
    iget-object p0, p0, Lio/agora/base/internal/video/DefaultVideoDecoderFactory;->hardwareVideoDecoderFactory:Lio/agora/base/internal/video/VideoDecoderFactory;

    .line 20
    .line 21
    invoke-interface {p0}, Lio/agora/base/internal/video/VideoDecoderFactory;->getSupportedCodecs()[Lio/agora/base/internal/video/VideoCodecInfo;

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
    new-array p0, p0, [Lio/agora/base/internal/video/VideoCodecInfo;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/util/AbstractCollection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, [Lio/agora/base/internal/video/VideoCodecInfo;

    .line 43
    .line 44
    return-object p0
.end method
