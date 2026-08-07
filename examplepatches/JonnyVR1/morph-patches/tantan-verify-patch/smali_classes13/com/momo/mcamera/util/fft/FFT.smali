.class public Lcom/momo/mcamera/util/fft/FFT;
.super Lcom/momo/mcamera/util/fft/FourierTransform;
.source "SourceFile"


# static fields
.field public static final ACCURACY_HIGH:I = 0x800

.field public static final ACCURACY_HIGHEST:I = 0x1000

.field public static final ACCURACY_LOW:I = 0x200

.field public static final ACCURACY_LOWEST:I = 0x100

.field public static final ACCURACY_MIDEUM:I = 0x400


# instance fields
.field private coslookup:[F

.field private reverse:[I

.field private sinlookup:[F


# direct methods
.method public constructor <init>(IF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/util/fft/FourierTransform;-><init>(IF)V

    .line 2
    .line 3
    .line 4
    add-int/lit8 p2, p1, -0x1

    .line 5
    .line 6
    and-int/2addr p1, p2

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/momo/mcamera/util/fft/FFT;->buildReverseTable()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/momo/mcamera/util/fft/FFT;->buildTrigTables()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "FFT: timeSize must be a power of two."

    .line 17
    .line 18
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    throw p0
.end method

.method private bitReverseComplex()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    new-array v0, v0, [F

    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 7
    .line 8
    array-length v1, v1

    .line 9
    new-array v1, v1, [F

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    iget-object v3, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 13
    .line 14
    array-length v4, v3

    .line 15
    if-ge v2, v4, :cond_0

    .line 16
    .line 17
    iget-object v4, p0, Lcom/momo/mcamera/util/fft/FFT;->reverse:[I

    .line 18
    .line 19
    aget v4, v4, v2

    .line 20
    .line 21
    aget v3, v3, v4

    .line 22
    .line 23
    aput v3, v0, v2

    .line 24
    .line 25
    iget-object v3, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 26
    .line 27
    aget v3, v3, v4

    .line 28
    .line 29
    aput v3, v1, v2

    .line 30
    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iput-object v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 35
    .line 36
    iput-object v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 37
    .line 38
    return-void
.end method

.method private bitReverseSamples([FI)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    .line 3
    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 7
    .line 8
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/FFT;->reverse:[I

    .line 9
    .line 10
    aget v2, v2, v0

    .line 11
    .line 12
    add-int/2addr v2, p2

    .line 13
    aget v2, p1, v2

    .line 14
    .line 15
    aput v2, v1, v0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    aput v2, v1, v0

    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method private buildReverseTable()V
    .locals 8

    .line 1
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    iput-object v1, p0, Lcom/momo/mcamera/util/fft/FFT;->reverse:[I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    aput v2, v1, v2

    .line 9
    .line 10
    div-int/lit8 v1, v0, 0x2

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    :goto_0
    if-ge v3, v0, :cond_1

    .line 14
    .line 15
    move v4, v2

    .line 16
    :goto_1
    if-ge v4, v3, :cond_0

    .line 17
    .line 18
    iget-object v5, p0, Lcom/momo/mcamera/util/fft/FFT;->reverse:[I

    .line 19
    .line 20
    add-int v6, v4, v3

    .line 21
    .line 22
    aget v7, v5, v4

    .line 23
    .line 24
    add-int/2addr v7, v1

    .line 25
    aput v7, v5, v6

    .line 26
    .line 27
    add-int/lit8 v4, v4, 0x1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    shl-int/lit8 v3, v3, 0x1

    .line 31
    .line 32
    shr-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void
.end method

.method private buildTrigTables()V
    .locals 7

    .line 1
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    .line 2
    .line 3
    new-array v1, v0, [F

    .line 4
    .line 5
    iput-object v1, p0, Lcom/momo/mcamera/util/fft/FFT;->sinlookup:[F

    .line 6
    .line 7
    new-array v1, v0, [F

    .line 8
    .line 9
    iput-object v1, p0, Lcom/momo/mcamera/util/fft/FFT;->coslookup:[F

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    :goto_0
    if-ge v1, v0, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/FFT;->sinlookup:[F

    .line 15
    .line 16
    const v3, -0x3fb6f025

    .line 17
    .line 18
    .line 19
    int-to-float v4, v1

    .line 20
    div-float/2addr v3, v4

    .line 21
    float-to-double v3, v3

    .line 22
    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide v5

    .line 26
    double-to-float v5, v5

    .line 27
    aput v5, v2, v1

    .line 28
    .line 29
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/FFT;->coslookup:[F

    .line 30
    .line 31
    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    .line 32
    .line 33
    .line 34
    move-result-wide v3

    .line 35
    double-to-float v3, v3

    .line 36
    aput v3, v2, v1

    .line 37
    .line 38
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method

.method private cos(I)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/FFT;->coslookup:[F

    .line 2
    .line 3
    aget p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method private fft()V
    .locals 14

    .line 1
    const/4 v0, 0x1

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 3
    .line 4
    array-length v1, v1

    .line 5
    if-ge v0, v1, :cond_2

    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/momo/mcamera/util/fft/FFT;->cos(I)F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-direct {p0, v0}, Lcom/momo/mcamera/util/fft/FFT;->sin(I)F

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/high16 v3, 0x3f800000    # 1.0f

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    const/4 v5, 0x0

    .line 19
    :goto_1
    if-ge v5, v0, :cond_1

    .line 20
    .line 21
    move v6, v5

    .line 22
    :goto_2
    iget-object v7, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 23
    .line 24
    array-length v8, v7

    .line 25
    if-ge v6, v8, :cond_0

    .line 26
    .line 27
    add-int v8, v6, v0

    .line 28
    .line 29
    aget v9, v7, v8

    .line 30
    .line 31
    mul-float v10, v3, v9

    .line 32
    .line 33
    iget-object v11, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 34
    .line 35
    aget v12, v11, v8

    .line 36
    .line 37
    mul-float v13, v4, v12

    .line 38
    .line 39
    sub-float/2addr v10, v13

    .line 40
    mul-float/2addr v12, v3

    .line 41
    mul-float/2addr v9, v4

    .line 42
    add-float/2addr v12, v9

    .line 43
    aget v9, v7, v6

    .line 44
    .line 45
    sub-float/2addr v9, v10

    .line 46
    aput v9, v7, v8

    .line 47
    .line 48
    aget v9, v11, v6

    .line 49
    .line 50
    sub-float/2addr v9, v12

    .line 51
    aput v9, v11, v8

    .line 52
    .line 53
    aget v8, v7, v6

    .line 54
    .line 55
    add-float/2addr v8, v10

    .line 56
    aput v8, v7, v6

    .line 57
    .line 58
    aget v7, v11, v6

    .line 59
    .line 60
    add-float/2addr v7, v12

    .line 61
    aput v7, v11, v6

    .line 62
    .line 63
    mul-int/lit8 v7, v0, 0x2

    .line 64
    .line 65
    add-int/2addr v6, v7

    .line 66
    goto :goto_2

    .line 67
    :cond_0
    mul-float v6, v3, v1

    .line 68
    .line 69
    mul-float v7, v4, v2

    .line 70
    .line 71
    sub-float/2addr v6, v7

    .line 72
    mul-float/2addr v3, v2

    .line 73
    mul-float/2addr v4, v1

    .line 74
    add-float/2addr v4, v3

    .line 75
    add-int/lit8 v5, v5, 0x1

    .line 76
    .line 77
    move v3, v6

    .line 78
    goto :goto_1

    .line 79
    :cond_1
    mul-int/lit8 v0, v0, 0x2

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    return-void
.end method

.method private sin(I)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/FFT;->sinlookup:[F

    .line 2
    .line 3
    aget p0, p0, p1

    .line 4
    .line 5
    return p0
.end method


# virtual methods
.method public allocateArrays()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    .line 2
    .line 3
    div-int/lit8 v1, v0, 0x2

    .line 4
    .line 5
    add-int/lit8 v1, v1, 0x1

    .line 6
    .line 7
    new-array v1, v1, [F

    .line 8
    .line 9
    iput-object v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 10
    .line 11
    new-array v1, v0, [F

    .line 12
    .line 13
    iput-object v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 14
    .line 15
    new-array v0, v0, [F

    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 18
    .line 19
    return-void
.end method

.method public forward([F)V
    .locals 2

    .line 27
    array-length v0, p1

    iget v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    if-eq v0, v1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, p1, v0}, Lcom/momo/mcamera/util/fft/FFT;->bitReverseSamples([FI)V

    .line 29
    invoke-direct {p0}, Lcom/momo/mcamera/util/fft/FFT;->fft()V

    .line 30
    invoke-virtual {p0}, Lcom/momo/mcamera/util/fft/FourierTransform;->fillSpectrum()V

    return-void
.end method

.method public forward([FI)V
    .locals 2

    .line 23
    array-length v0, p1

    sub-int/2addr v0, p2

    iget v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    if-ge v0, v1, :cond_0

    return-void

    .line 24
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/util/fft/FFT;->bitReverseSamples([FI)V

    .line 25
    invoke-direct {p0}, Lcom/momo/mcamera/util/fft/FFT;->fft()V

    .line 26
    invoke-virtual {p0}, Lcom/momo/mcamera/util/fft/FourierTransform;->fillSpectrum()V

    return-void
.end method

.method public forward([F[F)V
    .locals 2

    .line 1
    array-length v0, p1

    .line 2
    iget v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    .line 3
    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    array-length v0, p2

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/util/fft/FourierTransform;->setComplex([F[F)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/momo/mcamera/util/fft/FFT;->bitReverseComplex()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/momo/mcamera/util/fft/FFT;->fft()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/momo/mcamera/util/fft/FourierTransform;->fillSpectrum()V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public inverse([F)V
    .locals 5

    .line 1
    array-length v0, p1

    .line 2
    iget-object v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 3
    .line 4
    array-length v1, v1

    .line 5
    if-le v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    move v1, v0

    .line 10
    :goto_0
    iget v2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    .line 11
    .line 12
    if-ge v1, v2, :cond_1

    .line 13
    .line 14
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 15
    .line 16
    aget v3, v2, v1

    .line 17
    .line 18
    const/high16 v4, -0x40800000    # -1.0f

    .line 19
    .line 20
    mul-float/2addr v3, v4

    .line 21
    aput v3, v2, v1

    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-direct {p0}, Lcom/momo/mcamera/util/fft/FFT;->bitReverseComplex()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/momo/mcamera/util/fft/FFT;->fft()V

    .line 30
    .line 31
    .line 32
    :goto_1
    array-length v1, p1

    .line 33
    if-ge v0, v1, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 36
    .line 37
    aget v2, v1, v0

    .line 38
    .line 39
    array-length v1, v1

    .line 40
    int-to-float v1, v1

    .line 41
    div-float/2addr v2, v1

    .line 42
    aput v2, p1, v0

    .line 43
    .line 44
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    :goto_2
    return-void
.end method

.method public scaleBand(IF)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p2, v0

    .line 3
    .line 4
    if-gez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 8
    .line 9
    aget v1, v0, p1

    .line 10
    .line 11
    mul-float/2addr v1, p2

    .line 12
    aput v1, v0, p1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 15
    .line 16
    aget v2, v1, p1

    .line 17
    .line 18
    mul-float/2addr v2, p2

    .line 19
    aput v2, v1, p1

    .line 20
    .line 21
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 22
    .line 23
    aget v3, v2, p1

    .line 24
    .line 25
    mul-float/2addr v3, p2

    .line 26
    aput v3, v2, p1

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    .line 31
    .line 32
    div-int/lit8 p2, p0, 0x2

    .line 33
    .line 34
    if-eq p1, p2, :cond_1

    .line 35
    .line 36
    sub-int p2, p0, p1

    .line 37
    .line 38
    aget v2, v0, p1

    .line 39
    .line 40
    aput v2, v0, p2

    .line 41
    .line 42
    sub-int/2addr p0, p1

    .line 43
    aget p1, v1, p1

    .line 44
    .line 45
    neg-float p1, p1

    .line 46
    aput p1, v1, p0

    .line 47
    .line 48
    :cond_1
    :goto_0
    return-void
.end method

.method public setBand(IF)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p2, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 8
    .line 9
    aget v2, v1, p1

    .line 10
    .line 11
    cmpl-float v3, v2, v0

    .line 12
    .line 13
    if-nez v3, :cond_1

    .line 14
    .line 15
    iget-object v3, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 16
    .line 17
    aget v3, v3, p1

    .line 18
    .line 19
    cmpl-float v0, v3, v0

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    aput p2, v1, p1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 26
    .line 27
    aput p2, v0, p1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 31
    .line 32
    aget v3, v0, p1

    .line 33
    .line 34
    div-float/2addr v2, v3

    .line 35
    aput v2, v1, p1

    .line 36
    .line 37
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 38
    .line 39
    aget v3, v2, p1

    .line 40
    .line 41
    aget v4, v0, p1

    .line 42
    .line 43
    div-float/2addr v3, v4

    .line 44
    aput v3, v2, p1

    .line 45
    .line 46
    aput p2, v0, p1

    .line 47
    .line 48
    aget v3, v1, p1

    .line 49
    .line 50
    mul-float/2addr v3, p2

    .line 51
    aput v3, v1, p1

    .line 52
    .line 53
    aget p2, v2, p1

    .line 54
    .line 55
    aget v0, v0, p1

    .line 56
    .line 57
    mul-float/2addr p2, v0

    .line 58
    aput p2, v2, p1

    .line 59
    .line 60
    :goto_0
    if-eqz p1, :cond_2

    .line 61
    .line 62
    iget p2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    .line 63
    .line 64
    div-int/lit8 v0, p2, 0x2

    .line 65
    .line 66
    if-eq p1, v0, :cond_2

    .line 67
    .line 68
    sub-int v0, p2, p1

    .line 69
    .line 70
    aget v2, v1, p1

    .line 71
    .line 72
    aput v2, v1, v0

    .line 73
    .line 74
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 75
    .line 76
    sub-int/2addr p2, p1

    .line 77
    aget p1, p0, p1

    .line 78
    .line 79
    neg-float p1, p1

    .line 80
    aput p1, p0, p2

    .line 81
    .line 82
    :cond_2
    :goto_1
    return-void
.end method
