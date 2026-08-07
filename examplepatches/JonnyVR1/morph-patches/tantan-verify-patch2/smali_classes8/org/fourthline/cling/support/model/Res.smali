.class public Lorg/fourthline/cling/support/model/Res;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected bitrate:Ljava/lang/Long;

.field protected bitsPerSample:Ljava/lang/Long;

.field protected colorDepth:Ljava/lang/Long;

.field protected duration:Ljava/lang/String;

.field protected importUri:Ljava/net/URI;

.field protected nrAudioChannels:Ljava/lang/Long;

.field protected protection:Ljava/lang/String;

.field protected protocolInfo:Lorg/fourthline/cling/support/model/ProtocolInfo;

.field protected resolution:Ljava/lang/String;

.field protected sampleFrequency:Ljava/lang/Long;

.field protected size:Ljava/lang/Long;

.field protected value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)V
    .locals 3

    move-object v0, p1

    .line 29
    new-instance p1, Lorg/fourthline/cling/support/model/ProtocolInfo;

    sget-object v1, Lorg/fourthline/cling/support/model/Protocol;->HTTP_GET:Lorg/fourthline/cling/support/model/Protocol;

    const-string v2, "*"

    invoke-direct {p1, v1, v2, v0, v2}, Lorg/fourthline/cling/support/model/ProtocolInfo;-><init>(Lorg/fourthline/cling/support/model/Protocol;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct/range {p0 .. p5}, Lorg/fourthline/cling/support/model/Res;-><init>(Lorg/fourthline/cling/support/model/ProtocolInfo;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Lorg/fourthline/cling/support/model/ProtocolInfo;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->importUri:Ljava/net/URI;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/support/model/Res;->protocolInfo:Lorg/fourthline/cling/support/model/ProtocolInfo;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/fourthline/cling/support/model/Res;->size:Ljava/lang/Long;

    .line 9
    .line 10
    iput-object p4, p0, Lorg/fourthline/cling/support/model/Res;->duration:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Lorg/fourthline/cling/support/model/Res;->bitrate:Ljava/lang/Long;

    .line 13
    .line 14
    iput-object p6, p0, Lorg/fourthline/cling/support/model/Res;->sampleFrequency:Ljava/lang/Long;

    .line 15
    .line 16
    iput-object p7, p0, Lorg/fourthline/cling/support/model/Res;->bitsPerSample:Ljava/lang/Long;

    .line 17
    .line 18
    iput-object p8, p0, Lorg/fourthline/cling/support/model/Res;->nrAudioChannels:Ljava/lang/Long;

    .line 19
    .line 20
    iput-object p9, p0, Lorg/fourthline/cling/support/model/Res;->colorDepth:Ljava/lang/Long;

    .line 21
    .line 22
    iput-object p10, p0, Lorg/fourthline/cling/support/model/Res;->protection:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p11, p0, Lorg/fourthline/cling/support/model/Res;->resolution:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p12, p0, Lorg/fourthline/cling/support/model/Res;->value:Ljava/lang/String;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/ProtocolInfo;Ljava/lang/Long;Ljava/lang/String;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->protocolInfo:Lorg/fourthline/cling/support/model/ProtocolInfo;

    .line 34
    iput-object p2, p0, Lorg/fourthline/cling/support/model/Res;->size:Ljava/lang/Long;

    .line 35
    iput-object p3, p0, Lorg/fourthline/cling/support/model/Res;->value:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/ProtocolInfo;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->protocolInfo:Lorg/fourthline/cling/support/model/ProtocolInfo;

    .line 38
    iput-object p2, p0, Lorg/fourthline/cling/support/model/Res;->size:Ljava/lang/Long;

    .line 39
    iput-object p3, p0, Lorg/fourthline/cling/support/model/Res;->duration:Ljava/lang/String;

    .line 40
    iput-object p4, p0, Lorg/fourthline/cling/support/model/Res;->bitrate:Ljava/lang/Long;

    .line 41
    iput-object p5, p0, Lorg/fourthline/cling/support/model/Res;->value:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/seamless/util/MimeType;Ljava/lang/Long;Ljava/lang/String;)V
    .locals 1

    .line 31
    new-instance v0, Lorg/fourthline/cling/support/model/ProtocolInfo;

    invoke-direct {v0, p1}, Lorg/fourthline/cling/support/model/ProtocolInfo;-><init>(Lorg/seamless/util/MimeType;)V

    invoke-direct {p0, v0, p2, p3}, Lorg/fourthline/cling/support/model/Res;-><init>(Lorg/fourthline/cling/support/model/ProtocolInfo;Ljava/lang/Long;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lorg/seamless/util/MimeType;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)V
    .locals 1

    move-object v0, p1

    .line 30
    new-instance p1, Lorg/fourthline/cling/support/model/ProtocolInfo;

    invoke-direct {p1, v0}, Lorg/fourthline/cling/support/model/ProtocolInfo;-><init>(Lorg/seamless/util/MimeType;)V

    invoke-direct/range {p0 .. p5}, Lorg/fourthline/cling/support/model/Res;-><init>(Lorg/fourthline/cling/support/model/ProtocolInfo;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBitrate()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Res;->bitrate:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBitsPerSample()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Res;->bitsPerSample:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getColorDepth()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Res;->colorDepth:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDuration()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Res;->duration:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImportUri()Ljava/net/URI;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Res;->importUri:Ljava/net/URI;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNrAudioChannels()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Res;->nrAudioChannels:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProtection()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Res;->protection:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProtocolInfo()Lorg/fourthline/cling/support/model/ProtocolInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Res;->protocolInfo:Lorg/fourthline/cling/support/model/ProtocolInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResolution()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Res;->resolution:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResolutionX()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/Res;->getResolution()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/Res;->getResolution()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v2, "x"

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    array-length v0, v0

    .line 19
    const/4 v3, 0x2

    .line 20
    if-ne v0, v3, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/Res;->getResolution()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    aget-object p0, p0, v1

    .line 31
    .line 32
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0

    .line 41
    :cond_0
    return v1
.end method

.method public getResolutionY()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/Res;->getResolution()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/Res;->getResolution()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "x"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    array-length v0, v0

    .line 18
    const/4 v2, 0x2

    .line 19
    if-ne v0, v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/Res;->getResolution()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 v0, 0x1

    .line 30
    aget-object p0, p0, v0

    .line 31
    .line 32
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public getSampleFrequency()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Res;->sampleFrequency:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSize()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Res;->size:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Res;->value:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setBitrate(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->bitrate:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setBitsPerSample(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->bitsPerSample:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setColorDepth(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->colorDepth:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setDuration(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->duration:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setImportUri(Ljava/net/URI;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->importUri:Ljava/net/URI;

    .line 2
    .line 3
    return-void
.end method

.method public setNrAudioChannels(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->nrAudioChannels:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setProtection(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->protection:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setProtocolInfo(Lorg/fourthline/cling/support/model/ProtocolInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->protocolInfo:Lorg/fourthline/cling/support/model/ProtocolInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setResolution(II)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p1, "x"

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->resolution:Ljava/lang/String;

    .line 22
    .line 23
    return-void
.end method

.method public setResolution(Ljava/lang/String;)V
    .locals 0

    .line 24
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->resolution:Ljava/lang/String;

    return-void
.end method

.method public setSampleFrequency(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->sampleFrequency:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setSize(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->size:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/Res;->value:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
