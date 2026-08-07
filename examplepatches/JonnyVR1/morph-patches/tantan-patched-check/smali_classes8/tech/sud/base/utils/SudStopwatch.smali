.class public Ltech/sud/base/utils/SudStopwatch;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private elapsedTime:J

.field private isRunning:Z

.field private startTime:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getElapsedTimeInMillis()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltech/sud/base/utils/SudStopwatch;->elapsedTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public reset()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ltech/sud/base/utils/SudStopwatch;->isRunning:Z

    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ltech/sud/base/utils/SudStopwatch;->startTime:J

    .line 7
    .line 8
    iput-wide v0, p0, Ltech/sud/base/utils/SudStopwatch;->elapsedTime:J

    .line 9
    .line 10
    return-void
.end method

.method public start()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ltech/sud/base/utils/SudStopwatch;->isRunning:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ltech/sud/base/utils/SudStopwatch;->isRunning:Z

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/32 v2, 0xf4240

    .line 14
    .line 15
    .line 16
    div-long/2addr v0, v2

    .line 17
    iput-wide v0, p0, Ltech/sud/base/utils/SudStopwatch;->startTime:J

    .line 18
    .line 19
    return-void
.end method

.method public stop()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ltech/sud/base/utils/SudStopwatch;->isRunning:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Ltech/sud/base/utils/SudStopwatch;->isRunning:Z

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/32 v2, 0xf4240

    .line 14
    .line 15
    .line 16
    div-long/2addr v0, v2

    .line 17
    iget-wide v2, p0, Ltech/sud/base/utils/SudStopwatch;->elapsedTime:J

    .line 18
    .line 19
    iget-wide v4, p0, Ltech/sud/base/utils/SudStopwatch;->startTime:J

    .line 20
    .line 21
    sub-long/2addr v0, v4

    .line 22
    add-long/2addr v0, v2

    .line 23
    iput-wide v0, p0, Ltech/sud/base/utils/SudStopwatch;->elapsedTime:J

    .line 24
    .line 25
    return-void
.end method
