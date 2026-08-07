.class public Lcom/immomo/mediabase/AudioParameter;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private numChannels:I

.field private sampleBits:I

.field private samplingRate:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/immomo/mediabase/AudioParameter;->reset()V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public copyOf(Lcom/immomo/mediabase/AudioParameter;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget v0, p1, Lcom/immomo/mediabase/AudioParameter;->numChannels:I

    .line 4
    .line 5
    iput v0, p0, Lcom/immomo/mediabase/AudioParameter;->numChannels:I

    .line 6
    .line 7
    iget v0, p1, Lcom/immomo/mediabase/AudioParameter;->samplingRate:I

    .line 8
    .line 9
    iput v0, p0, Lcom/immomo/mediabase/AudioParameter;->samplingRate:I

    .line 10
    .line 11
    iget p1, p1, Lcom/immomo/mediabase/AudioParameter;->sampleBits:I

    .line 12
    .line 13
    iput p1, p0, Lcom/immomo/mediabase/AudioParameter;->sampleBits:I

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public getNumChannels()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/AudioParameter;->numChannels:I

    .line 2
    .line 3
    return p0
.end method

.method public getSampleBits()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/AudioParameter;->sampleBits:I

    .line 2
    .line 3
    return p0
.end method

.method public getSamplingRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/AudioParameter;->samplingRate:I

    .line 2
    .line 3
    return p0
.end method

.method public isEqual(Lcom/immomo/mediabase/AudioParameter;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/immomo/mediabase/AudioParameter;->getNumChannels()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Lcom/immomo/mediabase/AudioParameter;->numChannels:I

    .line 10
    .line 11
    if-ne v1, v2, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/immomo/mediabase/AudioParameter;->getSamplingRate()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget v2, p0, Lcom/immomo/mediabase/AudioParameter;->samplingRate:I

    .line 18
    .line 19
    if-ne v1, v2, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/immomo/mediabase/AudioParameter;->getSampleBits()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget p0, p0, Lcom/immomo/mediabase/AudioParameter;->sampleBits:I

    .line 26
    .line 27
    if-ne p1, p0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    return v0
.end method

.method public reset()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/immomo/mediabase/AudioParameter;->numChannels:I

    .line 3
    .line 4
    iput v0, p0, Lcom/immomo/mediabase/AudioParameter;->samplingRate:I

    .line 5
    .line 6
    const/16 v0, 0x10

    .line 7
    .line 8
    iput v0, p0, Lcom/immomo/mediabase/AudioParameter;->sampleBits:I

    .line 9
    .line 10
    return-void
.end method

.method public setNumChannels(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediabase/AudioParameter;->numChannels:I

    .line 2
    .line 3
    return-void
.end method

.method public setSampleBits(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediabase/AudioParameter;->sampleBits:I

    .line 2
    .line 3
    return-void
.end method

.method public setSamplingRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediabase/AudioParameter;->samplingRate:I

    .line 2
    .line 3
    return-void
.end method
