.class public Lio/agora/base/internal/video/VideoDecimator;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static FrameCountHistorySize:I = 0x5a

.field private static FrameShitoryWindowMs:I = 0x7d0

.field private static final TAG:Ljava/lang/String; = "VideoDecimator"


# instance fields
.field private dropCount:I

.field private dropNextFrame:Z

.field private enableTemoralDecimation:Z

.field private incomingFrameRate:F

.field private incomingFrameTimes:[J

.field private keepCount:I

.field private maxFrameRate:I

.field private overshootModifier:F

.field private targetFrameRate:F


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x5a

    .line 5
    .line 6
    iput v0, p0, Lio/agora/base/internal/video/VideoDecimator;->maxFrameRate:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lio/agora/base/internal/video/VideoDecimator;->enableTemoralDecimation:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lio/agora/base/internal/video/VideoDecimator;->dropNextFrame:Z

    .line 13
    .line 14
    sget v0, Lio/agora/base/internal/video/VideoDecimator;->FrameCountHistorySize:I

    .line 15
    .line 16
    new-array v0, v0, [J

    .line 17
    .line 18
    iput-object v0, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameTimes:[J

    .line 19
    .line 20
    return-void
.end method

.method private processIncomingFramerate(J)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    move v2, v1

    .line 4
    :goto_0
    sget v3, Lio/agora/base/internal/video/VideoDecimator;->FrameCountHistorySize:I

    .line 5
    .line 6
    sub-int/2addr v3, v1

    .line 7
    const-wide/16 v4, 0x0

    .line 8
    .line 9
    if-ge v2, v3, :cond_1

    .line 10
    .line 11
    iget-object v3, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameTimes:[J

    .line 12
    .line 13
    aget-wide v6, v3, v2

    .line 14
    .line 15
    cmp-long v3, v6, v4

    .line 16
    .line 17
    if-lez v3, :cond_1

    .line 18
    .line 19
    sub-long v6, p1, v6

    .line 20
    .line 21
    sget v3, Lio/agora/base/internal/video/VideoDecimator;->FrameShitoryWindowMs:I

    .line 22
    .line 23
    int-to-long v8, v3

    .line 24
    cmp-long v3, v6, v8

    .line 25
    .line 26
    if-lez v3, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    :goto_1
    const/high16 v3, 0x3f800000    # 1.0f

    .line 35
    .line 36
    if-le v2, v1, :cond_3

    .line 37
    .line 38
    iget-object v6, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameTimes:[J

    .line 39
    .line 40
    sub-int/2addr v2, v1

    .line 41
    aget-wide v1, v6, v2

    .line 42
    .line 43
    sub-long/2addr p1, v1

    .line 44
    iput v3, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameRate:F

    .line 45
    .line 46
    cmp-long v1, p1, v4

    .line 47
    .line 48
    if-lez v1, :cond_2

    .line 49
    .line 50
    int-to-float v0, v0

    .line 51
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 52
    .line 53
    mul-float/2addr v0, v1

    .line 54
    long-to-float p1, p1

    .line 55
    mul-float/2addr p1, v3

    .line 56
    div-float/2addr v0, p1

    .line 57
    iput v0, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameRate:F

    .line 58
    .line 59
    :cond_2
    return-void

    .line 60
    :cond_3
    int-to-float p1, v0

    .line 61
    mul-float/2addr p1, v3

    .line 62
    iput p1, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameRate:F

    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public decimatedFramerate()I
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-direct {p0, v0, v1}, Lio/agora/base/internal/video/VideoDecimator;->processIncomingFramerate(J)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lio/agora/base/internal/video/VideoDecimator;->enableTemoralDecimation:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget p0, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameRate:F

    .line 13
    .line 14
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    iget v0, p0, Lio/agora/base/internal/video/VideoDecimator;->targetFrameRate:F

    .line 20
    .line 21
    float-to-int v0, v0

    .line 22
    iget p0, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameRate:F

    .line 23
    .line 24
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method public dropFrame()Z
    .locals 7

    .line 1
    iget-boolean v0, p0, Lio/agora/base/internal/video/VideoDecimator;->enableTemoralDecimation:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget v0, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameRate:F

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    cmpg-float v3, v0, v2

    .line 11
    .line 12
    if-gtz v3, :cond_1

    .line 13
    .line 14
    return v1

    .line 15
    :cond_1
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget v3, p0, Lio/agora/base/internal/video/VideoDecimator;->targetFrameRate:F

    .line 20
    .line 21
    cmpl-float v4, v3, v2

    .line 22
    .line 23
    const/4 v5, 0x1

    .line 24
    if-nez v4, :cond_2

    .line 25
    .line 26
    return v5

    .line 27
    :cond_2
    int-to-float v4, v0

    .line 28
    cmpl-float v6, v4, v3

    .line 29
    .line 30
    if-lez v6, :cond_8

    .line 31
    .line 32
    iget v6, p0, Lio/agora/base/internal/video/VideoDecimator;->overshootModifier:F

    .line 33
    .line 34
    sub-float/2addr v4, v3

    .line 35
    add-float/2addr v6, v4

    .line 36
    float-to-int v4, v6

    .line 37
    if-gez v4, :cond_3

    .line 38
    .line 39
    iput v2, p0, Lio/agora/base/internal/video/VideoDecimator;->overshootModifier:F

    .line 40
    .line 41
    move v4, v1

    .line 42
    :cond_3
    if-eqz v4, :cond_6

    .line 43
    .line 44
    mul-int/lit8 v2, v4, 0x2

    .line 45
    .line 46
    if-ge v2, v0, :cond_6

    .line 47
    .line 48
    iget v2, p0, Lio/agora/base/internal/video/VideoDecimator;->dropCount:I

    .line 49
    .line 50
    if-eqz v2, :cond_4

    .line 51
    .line 52
    iput v1, p0, Lio/agora/base/internal/video/VideoDecimator;->dropCount:I

    .line 53
    .line 54
    return v5

    .line 55
    :cond_4
    div-int v2, v0, v4

    .line 56
    .line 57
    iget v3, p0, Lio/agora/base/internal/video/VideoDecimator;->keepCount:I

    .line 58
    .line 59
    if-le v3, v2, :cond_5

    .line 60
    .line 61
    rem-int/2addr v0, v4

    .line 62
    neg-int v0, v0

    .line 63
    int-to-float v0, v0

    .line 64
    const/high16 v1, 0x40400000    # 3.0f

    .line 65
    .line 66
    div-float/2addr v0, v1

    .line 67
    iput v0, p0, Lio/agora/base/internal/video/VideoDecimator;->overshootModifier:F

    .line 68
    .line 69
    iput v5, p0, Lio/agora/base/internal/video/VideoDecimator;->keepCount:I

    .line 70
    .line 71
    return v5

    .line 72
    :cond_5
    add-int/2addr v3, v5

    .line 73
    iput v3, p0, Lio/agora/base/internal/video/VideoDecimator;->keepCount:I

    .line 74
    .line 75
    return v1

    .line 76
    :cond_6
    iput v1, p0, Lio/agora/base/internal/video/VideoDecimator;->keepCount:I

    .line 77
    .line 78
    int-to-float v0, v4

    .line 79
    div-float v2, v0, v3

    .line 80
    .line 81
    float-to-int v2, v2

    .line 82
    iget v4, p0, Lio/agora/base/internal/video/VideoDecimator;->dropCount:I

    .line 83
    .line 84
    if-ge v4, v2, :cond_7

    .line 85
    .line 86
    add-int/2addr v4, v5

    .line 87
    iput v4, p0, Lio/agora/base/internal/video/VideoDecimator;->dropCount:I

    .line 88
    .line 89
    return v5

    .line 90
    :cond_7
    div-float v2, v0, v3

    .line 91
    .line 92
    float-to-int v2, v2

    .line 93
    int-to-float v2, v2

    .line 94
    mul-float/2addr v2, v3

    .line 95
    sub-float/2addr v0, v2

    .line 96
    iput v0, p0, Lio/agora/base/internal/video/VideoDecimator;->overshootModifier:F

    .line 97
    .line 98
    iput v1, p0, Lio/agora/base/internal/video/VideoDecimator;->dropCount:I

    .line 99
    .line 100
    :cond_8
    return v1
.end method

.method public dropNextFrame()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/base/internal/video/VideoDecimator;->dropNextFrame:Z

    .line 2
    .line 3
    return p0
.end method

.method public enableTemporalDecimation(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lio/agora/base/internal/video/VideoDecimator;->enableTemoralDecimation:Z

    .line 2
    .line 3
    return-void
.end method

.method public getTargetFrameRate()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/VideoDecimator;->targetFrameRate:F

    .line 2
    .line 3
    float-to-int p0, p0

    .line 4
    return p0
.end method

.method public inputFramerate()I
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-direct {p0, v0, v1}, Lio/agora/base/internal/video/VideoDecimator;->processIncomingFramerate(J)V

    .line 6
    .line 7
    .line 8
    iget p0, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameRate:F

    .line 9
    .line 10
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public needDropNextFrame(Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lio/agora/base/internal/video/VideoDecimator;->dropNextFrame:Z

    .line 2
    .line 3
    return p1
.end method

.method public reset()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lio/agora/base/internal/video/VideoDecimator;->overshootModifier:F

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput v1, p0, Lio/agora/base/internal/video/VideoDecimator;->dropCount:I

    .line 6
    .line 7
    iput v1, p0, Lio/agora/base/internal/video/VideoDecimator;->keepCount:I

    .line 8
    .line 9
    const/high16 v1, 0x41f00000    # 30.0f

    .line 10
    .line 11
    iput v1, p0, Lio/agora/base/internal/video/VideoDecimator;->targetFrameRate:F

    .line 12
    .line 13
    iput v0, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameRate:F

    .line 14
    .line 15
    const/16 v0, 0x5a

    .line 16
    .line 17
    iput v0, p0, Lio/agora/base/internal/video/VideoDecimator;->maxFrameRate:I

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lio/agora/base/internal/video/VideoDecimator;->enableTemoralDecimation:Z

    .line 21
    .line 22
    sget v0, Lio/agora/base/internal/video/VideoDecimator;->FrameCountHistorySize:I

    .line 23
    .line 24
    new-array v0, v0, [J

    .line 25
    .line 26
    iput-object v0, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameTimes:[J

    .line 27
    .line 28
    return-void
.end method

.method public setMaxFramerate(I)I
    .locals 1

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "VideoDecimator"

    .line 4
    .line 5
    const-string p1, "setMaxFramerate invalid max frame rate"

    .line 6
    .line 7
    invoke-static {p0, p1}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, -0x1

    .line 11
    return p0

    .line 12
    :cond_0
    iput p1, p0, Lio/agora/base/internal/video/VideoDecimator;->maxFrameRate:I

    .line 13
    .line 14
    iget v0, p0, Lio/agora/base/internal/video/VideoDecimator;->targetFrameRate:F

    .line 15
    .line 16
    int-to-float p1, p1

    .line 17
    cmpl-float v0, v0, p1

    .line 18
    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    iput p1, p0, Lio/agora/base/internal/video/VideoDecimator;->targetFrameRate:F

    .line 22
    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public setTargetFramerate(F)I
    .locals 4

    .line 1
    float-to-double v0, p1

    .line 2
    const-wide v2, 0x3fb999999999999aL    # 0.1

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    cmpg-double v0, v0, v2

    .line 8
    .line 9
    if-gez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "VideoDecimator"

    .line 12
    .line 13
    const-string p1, "setTargetFramerate invalid frame rate "

    .line 14
    .line 15
    invoke-static {p0, p1}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_0
    iget v0, p0, Lio/agora/base/internal/video/VideoDecimator;->maxFrameRate:I

    .line 21
    .line 22
    int-to-float v1, v0

    .line 23
    cmpl-float v1, p1, v1

    .line 24
    .line 25
    if-lez v1, :cond_1

    .line 26
    .line 27
    int-to-float p1, v0

    .line 28
    iput p1, p0, Lio/agora/base/internal/video/VideoDecimator;->targetFrameRate:F

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iput p1, p0, Lio/agora/base/internal/video/VideoDecimator;->targetFrameRate:F

    .line 32
    .line 33
    :goto_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public updateIncomingFramerate()V
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameTimes:[J

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    aget-wide v4, v2, v3

    .line 9
    .line 10
    const-wide/16 v6, 0x0

    .line 11
    .line 12
    cmp-long v2, v4, v6

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    sget v2, Lio/agora/base/internal/video/VideoDecimator;->FrameCountHistorySize:I

    .line 18
    .line 19
    add-int/lit8 v2, v2, -0x2

    .line 20
    .line 21
    :goto_0
    if-ltz v2, :cond_1

    .line 22
    .line 23
    iget-object v4, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameTimes:[J

    .line 24
    .line 25
    add-int/lit8 v5, v2, 0x1

    .line 26
    .line 27
    aget-wide v6, v4, v2

    .line 28
    .line 29
    aput-wide v6, v4, v5

    .line 30
    .line 31
    add-int/lit8 v2, v2, -0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    :goto_1
    iget-object v2, p0, Lio/agora/base/internal/video/VideoDecimator;->incomingFrameTimes:[J

    .line 35
    .line 36
    aput-wide v0, v2, v3

    .line 37
    .line 38
    invoke-direct {p0, v0, v1}, Lio/agora/base/internal/video/VideoDecimator;->processIncomingFramerate(J)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
