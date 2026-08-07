.class public abstract Lcom/momo/mcamera/util/fft/FourierTransform;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field protected static final LINAVG:I = 0x1

.field protected static final LOGAVG:I = 0x2

.field protected static final NOAVG:I = 0x3

.field protected static final TWO_PI:F = 6.2831855f


# instance fields
.field protected averages:[F

.field protected avgPerOctave:I

.field protected bandWidth:F

.field protected imag:[F

.field protected octaves:I

.field protected real:[F

.field protected sampleRate:I

.field protected spectrum:[F

.field protected timeSize:I

.field protected whichAverage:I


# direct methods
.method public constructor <init>(IF)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    .line 5
    .line 6
    float-to-int p2, p2

    .line 7
    iput p2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->sampleRate:I

    .line 8
    .line 9
    int-to-float p1, p1

    .line 10
    const/high16 v0, 0x40000000    # 2.0f

    .line 11
    .line 12
    div-float p1, v0, p1

    .line 13
    .line 14
    int-to-float p2, p2

    .line 15
    div-float/2addr p2, v0

    .line 16
    mul-float/2addr p1, p2

    .line 17
    iput p1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->bandWidth:F

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/momo/mcamera/util/fft/FourierTransform;->noAverages()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/momo/mcamera/util/fft/FourierTransform;->allocateArrays()V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public abstract allocateArrays()V
.end method

.method public avgSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->averages:[F

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public calcAvg(FF)F
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/util/fft/FourierTransform;->freqToIndex(F)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p2}, Lcom/momo/mcamera/util/fft/FourierTransform;->freqToIndex(F)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 v0, 0x0

    .line 10
    move v1, p1

    .line 11
    :goto_0
    if-gt v1, p2, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 14
    .line 15
    aget v2, v2, v1

    .line 16
    .line 17
    add-float/2addr v0, v2

    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sub-int/2addr p2, p1

    .line 22
    add-int/lit8 p2, p2, 0x1

    .line 23
    .line 24
    int-to-float p0, p2

    .line 25
    div-float/2addr v0, p0

    .line 26
    return v0
.end method

.method public fillSpectrum()V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 4
    .line 5
    array-length v3, v2

    .line 6
    if-ge v1, v3, :cond_0

    .line 7
    .line 8
    iget-object v3, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 9
    .line 10
    aget v3, v3, v1

    .line 11
    .line 12
    mul-float/2addr v3, v3

    .line 13
    iget-object v4, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 14
    .line 15
    aget v4, v4, v1

    .line 16
    .line 17
    mul-float/2addr v4, v4

    .line 18
    add-float/2addr v3, v4

    .line 19
    float-to-double v3, v3

    .line 20
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    .line 21
    .line 22
    .line 23
    move-result-wide v3

    .line 24
    double-to-float v3, v3

    .line 25
    aput v3, v2, v1

    .line 26
    .line 27
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->whichAverage:I

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    const/4 v4, 0x1

    .line 34
    if-ne v1, v4, :cond_2

    .line 35
    .line 36
    array-length v1, v2

    .line 37
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->averages:[F

    .line 38
    .line 39
    array-length v2, v2

    .line 40
    div-int/2addr v1, v2

    .line 41
    move v2, v0

    .line 42
    :goto_1
    iget-object v4, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->averages:[F

    .line 43
    .line 44
    array-length v4, v4

    .line 45
    if-ge v2, v4, :cond_5

    .line 46
    .line 47
    move v4, v0

    .line 48
    move v5, v3

    .line 49
    :goto_2
    if-ge v4, v1, :cond_1

    .line 50
    .line 51
    mul-int v6, v2, v1

    .line 52
    .line 53
    add-int/2addr v6, v4

    .line 54
    iget-object v7, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 55
    .line 56
    array-length v8, v7

    .line 57
    if-ge v6, v8, :cond_1

    .line 58
    .line 59
    aget v6, v7, v6

    .line 60
    .line 61
    add-float/2addr v5, v6

    .line 62
    add-int/lit8 v4, v4, 0x1

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 66
    .line 67
    int-to-float v4, v4

    .line 68
    div-float/2addr v5, v4

    .line 69
    iget-object v4, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->averages:[F

    .line 70
    .line 71
    aput v5, v4, v2

    .line 72
    .line 73
    add-int/lit8 v2, v2, 0x1

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    const/4 v2, 0x2

    .line 77
    if-ne v1, v2, :cond_5

    .line 78
    .line 79
    move v1, v0

    .line 80
    :goto_3
    iget v5, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->octaves:I

    .line 81
    .line 82
    if-ge v1, v5, :cond_5

    .line 83
    .line 84
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    .line 85
    .line 86
    if-nez v1, :cond_3

    .line 87
    .line 88
    move v8, v3

    .line 89
    goto :goto_4

    .line 90
    :cond_3
    iget v8, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->sampleRate:I

    .line 91
    .line 92
    div-int/2addr v8, v2

    .line 93
    int-to-float v8, v8

    .line 94
    sub-int/2addr v5, v1

    .line 95
    int-to-double v9, v5

    .line 96
    invoke-static {v6, v7, v9, v10}, Ljava/lang/Math;->pow(DD)D

    .line 97
    .line 98
    .line 99
    move-result-wide v9

    .line 100
    double-to-float v5, v9

    .line 101
    div-float/2addr v8, v5

    .line 102
    :goto_4
    iget v5, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->sampleRate:I

    .line 103
    .line 104
    div-int/2addr v5, v2

    .line 105
    int-to-float v5, v5

    .line 106
    iget v9, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->octaves:I

    .line 107
    .line 108
    sub-int/2addr v9, v1

    .line 109
    sub-int/2addr v9, v4

    .line 110
    int-to-double v9, v9

    .line 111
    invoke-static {v6, v7, v9, v10}, Ljava/lang/Math;->pow(DD)D

    .line 112
    .line 113
    .line 114
    move-result-wide v6

    .line 115
    double-to-float v6, v6

    .line 116
    div-float/2addr v5, v6

    .line 117
    sub-float/2addr v5, v8

    .line 118
    iget v6, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->avgPerOctave:I

    .line 119
    .line 120
    int-to-float v6, v6

    .line 121
    div-float/2addr v5, v6

    .line 122
    move v6, v0

    .line 123
    :goto_5
    iget v7, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->avgPerOctave:I

    .line 124
    .line 125
    if-ge v6, v7, :cond_4

    .line 126
    .line 127
    mul-int/2addr v7, v1

    .line 128
    add-int/2addr v7, v6

    .line 129
    iget-object v9, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->averages:[F

    .line 130
    .line 131
    add-float v10, v8, v5

    .line 132
    .line 133
    invoke-virtual {p0, v8, v10}, Lcom/momo/mcamera/util/fft/FourierTransform;->calcAvg(FF)F

    .line 134
    .line 135
    .line 136
    move-result v8

    .line 137
    aput v8, v9, v7

    .line 138
    .line 139
    add-int/lit8 v6, v6, 0x1

    .line 140
    .line 141
    move v8, v10

    .line 142
    goto :goto_5

    .line 143
    :cond_4
    add-int/lit8 v1, v1, 0x1

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_5
    return-void
.end method

.method public abstract forward([F)V
.end method

.method public forward([FI)V
    .locals 3

    .line 1
    array-length v0, p1

    .line 2
    sub-int/2addr v0, p2

    .line 3
    iget v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-array v0, v1, [F

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {p1, p2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/util/fft/FourierTransform;->forward([F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public freqToIndex(F)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/util/fft/FourierTransform;->getBandWidth()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    div-float/2addr v0, v1

    .line 8
    cmpg-float v0, p1, v0

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->sampleRate:I

    .line 15
    .line 16
    div-int/lit8 v0, v0, 0x2

    .line 17
    .line 18
    int-to-float v0, v0

    .line 19
    invoke-virtual {p0}, Lcom/momo/mcamera/util/fft/FourierTransform;->getBandWidth()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    div-float/2addr v2, v1

    .line 24
    sub-float/2addr v0, v2

    .line 25
    cmpl-float v0, p1, v0

    .line 26
    .line 27
    if-lez v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 30
    .line 31
    array-length p0, p0

    .line 32
    add-int/lit8 p0, p0, -0x1

    .line 33
    .line 34
    return p0

    .line 35
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->sampleRate:I

    .line 36
    .line 37
    int-to-float v0, v0

    .line 38
    div-float/2addr p1, v0

    .line 39
    iget p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    .line 40
    .line 41
    int-to-float p0, p0

    .line 42
    mul-float/2addr p0, p1

    .line 43
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0
.end method

.method public getAverageBandWidth(I)F
    .locals 8

    .line 1
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->whichAverage:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 7
    .line 8
    array-length p1, p1

    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->averages:[F

    .line 10
    .line 11
    array-length v0, v0

    .line 12
    div-int/2addr p1, v0

    .line 13
    int-to-float p1, p1

    .line 14
    invoke-virtual {p0}, Lcom/momo/mcamera/util/fft/FourierTransform;->getBandWidth()F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    mul-float/2addr p1, p0

    .line 19
    return p1

    .line 20
    :cond_0
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x2

    .line 22
    if-ne v0, v3, :cond_2

    .line 23
    .line 24
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->avgPerOctave:I

    .line 25
    .line 26
    div-int/2addr p1, v0

    .line 27
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 28
    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->sampleRate:I

    .line 33
    .line 34
    div-int/2addr v0, v3

    .line 35
    int-to-float v0, v0

    .line 36
    iget v2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->octaves:I

    .line 37
    .line 38
    sub-int/2addr v2, p1

    .line 39
    int-to-double v6, v2

    .line 40
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 41
    .line 42
    .line 43
    move-result-wide v6

    .line 44
    double-to-float v2, v6

    .line 45
    div-float v2, v0, v2

    .line 46
    .line 47
    :goto_0
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->sampleRate:I

    .line 48
    .line 49
    div-int/2addr v0, v3

    .line 50
    int-to-float v0, v0

    .line 51
    iget v3, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->octaves:I

    .line 52
    .line 53
    sub-int/2addr v3, p1

    .line 54
    sub-int/2addr v3, v1

    .line 55
    int-to-double v6, v3

    .line 56
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 57
    .line 58
    .line 59
    move-result-wide v3

    .line 60
    double-to-float p1, v3

    .line 61
    div-float/2addr v0, p1

    .line 62
    sub-float/2addr v0, v2

    .line 63
    iget p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->avgPerOctave:I

    .line 64
    .line 65
    int-to-float p0, p0

    .line 66
    div-float/2addr v0, p0

    .line 67
    return v0

    .line 68
    :cond_2
    return v2
.end method

.method public getAverageCenterFrequency(I)F
    .locals 9

    .line 1
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->whichAverage:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne v0, v2, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 8
    .line 9
    array-length v0, v0

    .line 10
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->averages:[F

    .line 11
    .line 12
    array-length v2, v2

    .line 13
    div-int/2addr v0, v2

    .line 14
    mul-int/2addr p1, v0

    .line 15
    div-int/2addr v0, v1

    .line 16
    add-int/2addr p1, v0

    .line 17
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/util/fft/FourierTransform;->indexToFreq(I)F

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 v3, 0x0

    .line 23
    if-ne v0, v1, :cond_2

    .line 24
    .line 25
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->avgPerOctave:I

    .line 26
    .line 27
    div-int v4, p1, v0

    .line 28
    .line 29
    rem-int/2addr p1, v0

    .line 30
    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    .line 31
    .line 32
    if-nez v4, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->sampleRate:I

    .line 36
    .line 37
    div-int/2addr v0, v1

    .line 38
    int-to-float v0, v0

    .line 39
    iget v3, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->octaves:I

    .line 40
    .line 41
    sub-int/2addr v3, v4

    .line 42
    int-to-double v7, v3

    .line 43
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    .line 44
    .line 45
    .line 46
    move-result-wide v7

    .line 47
    double-to-float v3, v7

    .line 48
    div-float v3, v0, v3

    .line 49
    .line 50
    :goto_0
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->sampleRate:I

    .line 51
    .line 52
    div-int/2addr v0, v1

    .line 53
    int-to-float v0, v0

    .line 54
    iget v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->octaves:I

    .line 55
    .line 56
    sub-int/2addr v1, v4

    .line 57
    sub-int/2addr v1, v2

    .line 58
    int-to-double v1, v1

    .line 59
    invoke-static {v5, v6, v1, v2}, Ljava/lang/Math;->pow(DD)D

    .line 60
    .line 61
    .line 62
    move-result-wide v1

    .line 63
    double-to-float v1, v1

    .line 64
    div-float/2addr v0, v1

    .line 65
    sub-float/2addr v0, v3

    .line 66
    iget p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->avgPerOctave:I

    .line 67
    .line 68
    int-to-float p0, p0

    .line 69
    div-float/2addr v0, p0

    .line 70
    int-to-float p0, p1

    .line 71
    mul-float/2addr p0, v0

    .line 72
    add-float/2addr v3, p0

    .line 73
    const/high16 p0, 0x40000000    # 2.0f

    .line 74
    .line 75
    div-float/2addr v0, p0

    .line 76
    add-float/2addr v3, v0

    .line 77
    :cond_2
    return v3
.end method

.method public getAvg(I)F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->averages:[F

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    aget p0, p0, p1

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public getBand(I)F
    .locals 1

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 5
    .line 6
    array-length v0, p0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    if-le p1, v0, :cond_1

    .line 10
    .line 11
    array-length p1, p0

    .line 12
    add-int/lit8 p1, p1, -0x1

    .line 13
    .line 14
    :cond_1
    aget p0, p0, p1

    .line 15
    .line 16
    return p0
.end method

.method public getBandWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->bandWidth:F

    .line 2
    .line 3
    return p0
.end method

.method public getFreq(F)F
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/util/fft/FourierTransform;->freqToIndex(F)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/util/fft/FourierTransform;->getBand(I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getSpectrumImaginary()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getSpectrumReal()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public indexToFreq(I)F
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/util/fft/FourierTransform;->getBandWidth()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x3e800000    # 0.25f

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    mul-float/2addr v0, v1

    .line 10
    return v0

    .line 11
    :cond_0
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 12
    .line 13
    array-length v2, v2

    .line 14
    add-int/lit8 v2, v2, -0x1

    .line 15
    .line 16
    if-ne p1, v2, :cond_1

    .line 17
    .line 18
    iget p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->sampleRate:I

    .line 19
    .line 20
    div-int/lit8 p0, p0, 0x2

    .line 21
    .line 22
    int-to-float p0, p0

    .line 23
    const/high16 p1, 0x40000000    # 2.0f

    .line 24
    .line 25
    div-float p1, v0, p1

    .line 26
    .line 27
    sub-float/2addr p0, p1

    .line 28
    mul-float/2addr v0, v1

    .line 29
    add-float/2addr p0, v0

    .line 30
    return p0

    .line 31
    :cond_1
    int-to-float p0, p1

    .line 32
    mul-float/2addr p0, v0

    .line 33
    return p0
.end method

.method public abstract inverse([F)V
.end method

.method public inverse([F[F[F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/util/fft/FourierTransform;->setComplex([F[F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p3}, Lcom/momo/mcamera/util/fft/FourierTransform;->inverse([F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public linAverages(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    div-int/lit8 v0, v0, 0x2

    .line 5
    .line 6
    if-le p1, v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-array p1, p1, [F

    .line 10
    .line 11
    iput-object p1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->averages:[F

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput p1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->whichAverage:I

    .line 15
    .line 16
    return-void
.end method

.method public logAverages(II)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->sampleRate:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    const/high16 v1, 0x40000000    # 2.0f

    .line 5
    .line 6
    div-float/2addr v0, v1

    .line 7
    const/4 v2, 0x1

    .line 8
    iput v2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->octaves:I

    .line 9
    .line 10
    :goto_0
    div-float/2addr v0, v1

    .line 11
    int-to-float v3, p1

    .line 12
    cmpl-float v3, v0, v3

    .line 13
    .line 14
    if-lez v3, :cond_0

    .line 15
    .line 16
    iget v3, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->octaves:I

    .line 17
    .line 18
    add-int/2addr v3, v2

    .line 19
    iput v3, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->octaves:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iput p2, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->avgPerOctave:I

    .line 23
    .line 24
    iget p1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->octaves:I

    .line 25
    .line 26
    mul-int/2addr p1, p2

    .line 27
    new-array p1, p1, [F

    .line 28
    .line 29
    iput-object p1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->averages:[F

    .line 30
    .line 31
    const/4 p1, 0x2

    .line 32
    iput p1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->whichAverage:I

    .line 33
    .line 34
    return-void
.end method

.method public noAverages()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    iput-object v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->averages:[F

    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    iput v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->whichAverage:I

    .line 8
    .line 9
    return-void
.end method

.method public abstract scaleBand(IF)V
.end method

.method public scaleFreq(FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/util/fft/FourierTransform;->freqToIndex(F)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/util/fft/FourierTransform;->scaleBand(IF)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public abstract setBand(IF)V
.end method

.method public setComplex([F[F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->real:[F

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    array-length v2, p1

    .line 5
    if-eq v1, v2, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 8
    .line 9
    array-length v1, v1

    .line 10
    array-length v2, p2

    .line 11
    if-eq v1, v2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    array-length v1, p1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->imag:[F

    .line 20
    .line 21
    array-length p1, p2

    .line 22
    invoke-static {p2, v2, p0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setFreq(FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/util/fft/FourierTransform;->freqToIndex(F)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/util/fft/FourierTransform;->setBand(IF)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public specSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->spectrum:[F

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public timeSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/util/fft/FourierTransform;->timeSize:I

    .line 2
    .line 3
    return p0
.end method
