.class public Lcom/momo/mcamera/util/fft/Spectrum;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mAmplitudes:[F

.field private mFrequencies:[I

.field private mSignalSamples:[S


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>([S[F[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/mcamera/util/fft/Spectrum;->mSignalSamples:[S

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/mcamera/util/fft/Spectrum;->mAmplitudes:[F

    .line 7
    .line 8
    iput-object p3, p0, Lcom/momo/mcamera/util/fft/Spectrum;->mFrequencies:[I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getAmplitudes()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/Spectrum;->mAmplitudes:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getFrequencies()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/Spectrum;->mFrequencies:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public getSignalSamples()[S
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/Spectrum;->mSignalSamples:[S

    .line 2
    .line 3
    return-object p0
.end method

.method public setAmplitudes([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/util/fft/Spectrum;->mAmplitudes:[F

    .line 2
    .line 3
    return-void
.end method

.method public setFrequencies([I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/util/fft/Spectrum;->mFrequencies:[I

    .line 2
    .line 3
    return-void
.end method

.method public setSignalSamples([S)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/util/fft/Spectrum;->mSignalSamples:[S

    .line 2
    .line 3
    return-void
.end method
