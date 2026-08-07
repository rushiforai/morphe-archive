.class public Lio/agora/base/internal/video/YuvConverterStats;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;
    }
.end annotation


# static fields
.field private static final CONFIDENCE_LEVEL_99_Z:F = 2.576f

.field private static final STATS_SAMPLE_COUNT:J = 0xf0L

.field private static final TAG:Ljava/lang/String; = "YuvConverterStats"


# instance fields
.field private calAvgUs:I

.field private calLowerBound:F

.field private calMaxUs:I

.field private calUpperBound:F

.field private final height:I

.field private final method:Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;

.field private final timeSpentUsCache:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final width:I


# direct methods
.method public constructor <init>(IILio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lio/agora/base/internal/video/YuvConverterStats;->timeSpentUsCache:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lio/agora/base/internal/video/YuvConverterStats;->calLowerBound:F

    .line 13
    .line 14
    iput v0, p0, Lio/agora/base/internal/video/YuvConverterStats;->calUpperBound:F

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lio/agora/base/internal/video/YuvConverterStats;->calAvgUs:I

    .line 18
    .line 19
    iput v0, p0, Lio/agora/base/internal/video/YuvConverterStats;->calMaxUs:I

    .line 20
    .line 21
    iput p1, p0, Lio/agora/base/internal/video/YuvConverterStats;->width:I

    .line 22
    .line 23
    iput p2, p0, Lio/agora/base/internal/video/YuvConverterStats;->height:I

    .line 24
    .line 25
    iput-object p3, p0, Lio/agora/base/internal/video/YuvConverterStats;->method:Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;

    .line 26
    .line 27
    return-void
.end method

.method private static CalculateConfidenceBound([I)[F
    .locals 5

    .line 1
    invoke-static {p0}, Lio/agora/base/internal/video/YuvConverterStats;->CalculateMean([I)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0, v0}, Lio/agora/base/internal/video/YuvConverterStats;->CalculateStandardDeviation([IF)F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    float-to-double v1, v1

    .line 10
    array-length p0, p0

    .line 11
    int-to-double v3, p0

    .line 12
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide v3

    .line 16
    div-double/2addr v1, v3

    .line 17
    const-wide v3, 0x40049ba5e0000000L    # 2.5759999752044678

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    mul-double/2addr v1, v3

    .line 23
    double-to-float p0, v1

    .line 24
    sub-float v1, v0, p0

    .line 25
    .line 26
    add-float/2addr v0, p0

    .line 27
    const/4 p0, 0x2

    .line 28
    new-array p0, p0, [F

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    aput v1, p0, v2

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    aput v0, p0, v1

    .line 35
    .line 36
    return-object p0
.end method

.method private static CalculateMax([I)I
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v1, v0, :cond_0

    .line 5
    .line 6
    aget v3, p0, v1

    .line 7
    .line 8
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return v2
.end method

.method private static CalculateMean([I)F
    .locals 6

    .line 1
    array-length v0, p0

    .line 2
    const-wide/16 v1, 0x0

    .line 3
    .line 4
    const/4 v3, 0x0

    .line 5
    :goto_0
    if-ge v3, v0, :cond_0

    .line 6
    .line 7
    aget v4, p0, v3

    .line 8
    .line 9
    int-to-long v4, v4

    .line 10
    add-long/2addr v1, v4

    .line 11
    add-int/lit8 v3, v3, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    long-to-float v0, v1

    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    mul-float/2addr v0, v1

    .line 18
    array-length p0, p0

    .line 19
    int-to-float p0, p0

    .line 20
    div-float/2addr v0, p0

    .line 21
    return v0
.end method

.method private static CalculateStandardDeviation([IF)F
    .locals 8

    .line 1
    array-length v0, p0

    .line 2
    const-wide/16 v1, 0x0

    .line 3
    .line 4
    const/4 v3, 0x0

    .line 5
    :goto_0
    if-ge v3, v0, :cond_0

    .line 6
    .line 7
    aget v4, p0, v3

    .line 8
    .line 9
    int-to-float v4, v4

    .line 10
    sub-float/2addr v4, p1

    .line 11
    float-to-double v4, v4

    .line 12
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    .line 13
    .line 14
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 15
    .line 16
    .line 17
    move-result-wide v4

    .line 18
    double-to-long v4, v4

    .line 19
    add-long/2addr v1, v4

    .line 20
    add-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    long-to-float p1, v1

    .line 24
    const/high16 v0, 0x3f800000    # 1.0f

    .line 25
    .line 26
    mul-float/2addr p1, v0

    .line 27
    array-length p0, p0

    .line 28
    add-int/lit8 p0, p0, -0x1

    .line 29
    .line 30
    int-to-float p0, p0

    .line 31
    div-float/2addr p1, p0

    .line 32
    float-to-double p0, p1

    .line 33
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 34
    .line 35
    .line 36
    move-result-wide p0

    .line 37
    double-to-float p0, p0

    .line 38
    return p0
.end method

.method private getAvgUs()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/YuvConverterStats;->calAvgUs:I

    .line 2
    .line 3
    return p0
.end method

.method private getMaxUs()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/YuvConverterStats;->calMaxUs:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public getHeight()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/YuvConverterStats;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getMethod()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/YuvConverterStats;->method:Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;

    .line 2
    .line 3
    iget p0, p0, Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;->value:I

    .line 4
    .line 5
    return p0
.end method

.method public getWidth()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/YuvConverterStats;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public stats(I)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/YuvConverterStats;->timeSpentUsCache:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lio/agora/base/internal/video/YuvConverterStats;->timeSpentUsCache:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    int-to-long v0, p1

    .line 17
    const-wide/16 v2, 0xf0

    .line 18
    .line 19
    cmp-long p1, v0, v2

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    if-ltz p1, :cond_3

    .line 23
    .line 24
    iget-object p1, p0, Lio/agora/base/internal/video/YuvConverterStats;->timeSpentUsCache:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    new-array p1, p1, [I

    .line 31
    .line 32
    move v1, v0

    .line 33
    :goto_0
    iget-object v2, p0, Lio/agora/base/internal/video/YuvConverterStats;->timeSpentUsCache:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-ge v1, v2, :cond_0

    .line 40
    .line 41
    iget-object v2, p0, Lio/agora/base/internal/video/YuvConverterStats;->timeSpentUsCache:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    aput v2, p1, v1

    .line 54
    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-static {p1}, Lio/agora/base/internal/video/YuvConverterStats;->CalculateMean([I)F

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-static {p1}, Lio/agora/base/internal/video/YuvConverterStats;->CalculateMax([I)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    iget v3, p0, Lio/agora/base/internal/video/YuvConverterStats;->calLowerBound:F

    .line 67
    .line 68
    cmpg-float v3, v1, v3

    .line 69
    .line 70
    if-ltz v3, :cond_1

    .line 71
    .line 72
    iget v3, p0, Lio/agora/base/internal/video/YuvConverterStats;->calUpperBound:F

    .line 73
    .line 74
    cmpl-float v3, v1, v3

    .line 75
    .line 76
    if-lez v3, :cond_2

    .line 77
    .line 78
    :cond_1
    invoke-static {p1}, Lio/agora/base/internal/video/YuvConverterStats;->CalculateConfidenceBound([I)[F

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    aget v0, p1, v0

    .line 83
    .line 84
    iput v0, p0, Lio/agora/base/internal/video/YuvConverterStats;->calLowerBound:F

    .line 85
    .line 86
    const/4 v0, 0x1

    .line 87
    aget p1, p1, v0

    .line 88
    .line 89
    iput p1, p0, Lio/agora/base/internal/video/YuvConverterStats;->calUpperBound:F

    .line 90
    .line 91
    float-to-int p1, v1

    .line 92
    iput p1, p0, Lio/agora/base/internal/video/YuvConverterStats;->calAvgUs:I

    .line 93
    .line 94
    iput v2, p0, Lio/agora/base/internal/video/YuvConverterStats;->calMaxUs:I

    .line 95
    .line 96
    new-instance p1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v1, "method="

    .line 99
    .line 100
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Lio/agora/base/internal/video/YuvConverterStats;->method:Lio/agora/base/internal/video/YuvConverterStats$YuvConvertMethod;

    .line 104
    .line 105
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v1, ", calAvgUs="

    .line 109
    .line 110
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget v1, p0, Lio/agora/base/internal/video/YuvConverterStats;->calAvgUs:I

    .line 114
    .line 115
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v1, ", calMaxUs="

    .line 119
    .line 120
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget v1, p0, Lio/agora/base/internal/video/YuvConverterStats;->calMaxUs:I

    .line 124
    .line 125
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    const-string v1, "YuvConverterStats"

    .line 133
    .line 134
    invoke-static {v1, p1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_2
    iget-object p0, p0, Lio/agora/base/internal/video/YuvConverterStats;->timeSpentUsCache:Ljava/util/List;

    .line 138
    .line 139
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 140
    .line 141
    .line 142
    :cond_3
    return v0
.end method
