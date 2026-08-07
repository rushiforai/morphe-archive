.class Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/EglRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "StatisticsInfo"
.end annotation


# instance fields
.field private frameDrawn:I

.field private framesDrawTimeNs:J

.field private framesDropped:J

.field private framesReceived:J

.field private framesRendered:J

.field private renderSwapBufferTimeNs:J

.field private renderTimeNs:J

.field private statisticsLock:Ljava/lang/Object;

.field private statisticsStartTimeNs:J

.field final synthetic this$0:Lio/agora/base/internal/video/EglRenderer;

.field private vsyncNum:J

.field private vsyncRenderJankCount:J


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/EglRenderer;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->statisticsStartTimeNs:J

    .line 9
    .line 10
    iput-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesReceived:J

    .line 11
    .line 12
    iput-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesDropped:J

    .line 13
    .line 14
    iput-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesRendered:J

    .line 15
    .line 16
    iput-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesDrawTimeNs:J

    .line 17
    .line 18
    iput-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->renderTimeNs:J

    .line 19
    .line 20
    iput-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->renderSwapBufferTimeNs:J

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->frameDrawn:I

    .line 24
    .line 25
    new-instance p1, Ljava/lang/Object;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->statisticsLock:Ljava/lang/Object;

    .line 31
    .line 32
    iput-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->vsyncNum:J

    .line 33
    .line 34
    iput-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->vsyncRenderJankCount:J

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic access$1600(Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->resetStatistics(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2100(Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->updateFrameReceived()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2300(Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;JJJJ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->updateFramesHasDrawn(JJJJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2700(Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->updateFramesDropped()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2900(Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;Lio/agora/base/internal/video/EglRenderer$VsyncStats;ZJJ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->updateEveryVsyncStatistics(Lio/agora/base/internal/video/EglRenderer$VsyncStats;ZJJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->logStatistics()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;)I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->frameDrawn:I

    .line 2
    .line 3
    return p0
.end method

.method private averageTimeAsString(JJ)Ljava/lang/String;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p0, p3, v0

    .line 4
    .line 5
    if-gtz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "NA"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    div-long/2addr p1, p3

    .line 16
    const-wide/16 p3, 0x3e8

    .line 17
    .line 18
    div-long/2addr p1, p3

    .line 19
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p1, " us"

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method private logStatistics()V
    .locals 13

    .line 1
    const-string v0, "logStatistics Duration: "

    .line 2
    .line 3
    new-instance v1, Ljava/text/DecimalFormat;

    .line 4
    .line 5
    const-string v2, "#.0"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    iget-object v4, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->statisticsLock:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v4

    .line 17
    :try_start_0
    iget-wide v5, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->statisticsStartTimeNs:J

    .line 18
    .line 19
    sub-long v5, v2, v5

    .line 20
    .line 21
    const-wide/16 v7, 0x0

    .line 22
    .line 23
    cmp-long v7, v5, v7

    .line 24
    .line 25
    if-gtz v7, :cond_0

    .line 26
    .line 27
    monitor-exit v4

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :cond_0
    iget-wide v7, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesRendered:J

    .line 33
    .line 34
    const-wide/32 v9, 0x3b9aca00

    .line 35
    .line 36
    .line 37
    mul-long/2addr v7, v9

    .line 38
    long-to-float v7, v7

    .line 39
    long-to-float v8, v5

    .line 40
    div-float/2addr v7, v8

    .line 41
    iget-wide v11, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesReceived:J

    .line 42
    .line 43
    mul-long/2addr v11, v9

    .line 44
    long-to-float v9, v11

    .line 45
    div-float/2addr v9, v8

    .line 46
    iget-object v8, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 47
    .line 48
    new-instance v10, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v10, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const-wide/32 v11, 0xf4240

    .line 54
    .line 55
    .line 56
    div-long/2addr v5, v11

    .line 57
    invoke-virtual {v10, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v0, " ms. Frames received: "

    .line 61
    .line 62
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget-wide v5, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesReceived:J

    .line 66
    .line 67
    invoke-virtual {v10, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v0, ". Dropped: "

    .line 71
    .line 72
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget-wide v5, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesDropped:J

    .line 76
    .line 77
    invoke-virtual {v10, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v0, ". Rendered: "

    .line 81
    .line 82
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-wide v5, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesRendered:J

    .line 86
    .line 87
    invoke-virtual {v10, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v0, ". vsync jank:"

    .line 91
    .line 92
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    iget-wide v5, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->vsyncRenderJankCount:J

    .line 96
    .line 97
    invoke-virtual {v10, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v0, ". received fps: "

    .line 101
    .line 102
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    float-to-double v5, v9

    .line 106
    invoke-virtual {v1, v5, v6}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v0, ". Render fps: "

    .line 114
    .line 115
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    float-to-double v5, v7

    .line 119
    invoke-virtual {v1, v5, v6}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v0, ". Average frame draw time: "

    .line 127
    .line 128
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    iget-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesDrawTimeNs:J

    .line 132
    .line 133
    iget-wide v5, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesRendered:J

    .line 134
    .line 135
    invoke-direct {p0, v0, v1, v5, v6}, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->averageTimeAsString(JJ)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v0, ". Average render time: "

    .line 143
    .line 144
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    iget-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->renderTimeNs:J

    .line 148
    .line 149
    iget-wide v5, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesRendered:J

    .line 150
    .line 151
    invoke-direct {p0, v0, v1, v5, v6}, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->averageTimeAsString(JJ)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v0, ". Average swapBuffer time: "

    .line 159
    .line 160
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    iget-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->renderSwapBufferTimeNs:J

    .line 164
    .line 165
    iget-wide v5, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesRendered:J

    .line 166
    .line 167
    invoke-direct {p0, v0, v1, v5, v6}, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->averageTimeAsString(JJ)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v0, "."

    .line 175
    .line 176
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-static {v8, v0}, Lio/agora/base/internal/video/EglRenderer;->access$1000(Lio/agora/base/internal/video/EglRenderer;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    invoke-direct {p0, v2, v3}, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->resetStatistics(J)V

    .line 187
    .line 188
    .line 189
    monitor-exit v4

    .line 190
    return-void

    .line 191
    :goto_0
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    throw p0
.end method

.method private resetStatistics(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->statisticsLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->statisticsStartTimeNs:J

    .line 5
    .line 6
    const-wide/16 p1, 0x0

    .line 7
    .line 8
    iput-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesReceived:J

    .line 9
    .line 10
    iput-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesDropped:J

    .line 11
    .line 12
    iput-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesRendered:J

    .line 13
    .line 14
    iput-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesDrawTimeNs:J

    .line 15
    .line 16
    iput-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->renderTimeNs:J

    .line 17
    .line 18
    iput-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->renderSwapBufferTimeNs:J

    .line 19
    .line 20
    iput-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->vsyncRenderJankCount:J

    .line 21
    .line 22
    monitor-exit v0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method

.method private updateEveryVsyncStatistics(Lio/agora/base/internal/video/EglRenderer$VsyncStats;ZJJ)V
    .locals 2

    .line 1
    iget-object p5, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->statisticsLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p5

    .line 4
    :try_start_0
    sget-object p6, Lio/agora/base/internal/video/EglRenderer$VsyncStats;->NORMAL:Lio/agora/base/internal/video/EglRenderer$VsyncStats;

    .line 5
    .line 6
    const-wide/16 v0, 0x1

    .line 7
    .line 8
    if-ne p1, p6, :cond_0

    .line 9
    .line 10
    if-nez p2, :cond_2

    .line 11
    .line 12
    iget-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->vsyncRenderJankCount:J

    .line 13
    .line 14
    add-long/2addr p1, v0

    .line 15
    iput-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->vsyncRenderJankCount:J

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    if-eqz p2, :cond_1

    .line 21
    .line 22
    sub-long/2addr p3, v0

    .line 23
    :cond_1
    iget-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->vsyncRenderJankCount:J

    .line 24
    .line 25
    add-long/2addr p1, p3

    .line 26
    iput-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->vsyncRenderJankCount:J

    .line 27
    .line 28
    :cond_2
    :goto_0
    monitor-exit p5

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit p5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method private updateFrameReceived()V
    .locals 5

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->statisticsLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesReceived:J

    .line 5
    .line 6
    const-wide/16 v3, 0x1

    .line 7
    .line 8
    add-long/2addr v1, v3

    .line 9
    iput-wide v1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesReceived:J

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method private updateFramesDropped()V
    .locals 5

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->statisticsLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesDropped:J

    .line 5
    .line 6
    const-wide/16 v3, 0x1

    .line 7
    .line 8
    add-long/2addr v1, v3

    .line 9
    iput-wide v1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesDropped:J

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method private updateFramesHasDrawn(JJJJ)V
    .locals 5

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->statisticsLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesRendered:J

    .line 5
    .line 6
    const-wide/16 v3, 0x1

    .line 7
    .line 8
    add-long/2addr v1, v3

    .line 9
    iput-wide v1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesRendered:J

    .line 10
    .line 11
    iget-wide v1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesDrawTimeNs:J

    .line 12
    .line 13
    sub-long p3, p1, p3

    .line 14
    .line 15
    add-long/2addr v1, p3

    .line 16
    iput-wide v1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->framesDrawTimeNs:J

    .line 17
    .line 18
    iget-wide p3, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->renderTimeNs:J

    .line 19
    .line 20
    sub-long p5, p1, p5

    .line 21
    .line 22
    add-long/2addr p3, p5

    .line 23
    iput-wide p3, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->renderTimeNs:J

    .line 24
    .line 25
    iget-wide p3, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->renderSwapBufferTimeNs:J

    .line 26
    .line 27
    sub-long/2addr p1, p7

    .line 28
    add-long/2addr p3, p1

    .line 29
    iput-wide p3, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->renderSwapBufferTimeNs:J

    .line 30
    .line 31
    iget p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->frameDrawn:I

    .line 32
    .line 33
    add-int/lit8 p1, p1, 0x1

    .line 34
    .line 35
    iput p1, p0, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->frameDrawn:I

    .line 36
    .line 37
    monitor-exit v0

    .line 38
    return-void

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    throw p0
.end method
