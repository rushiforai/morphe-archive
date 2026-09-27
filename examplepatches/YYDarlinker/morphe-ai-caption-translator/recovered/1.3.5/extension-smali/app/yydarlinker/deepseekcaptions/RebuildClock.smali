.class final Lapp/yydarlinker/deepseekcaptions/RebuildClock;
.super Ljava/lang/Object;
.source "RebuildClock.java"


# instance fields
.field private at:J

.field private confirmed:J

.field private epoch:J

.field private known:Z

.field private lastOutput:J


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method declared-synchronized confirmed()J
    .registers 3

    monitor-enter p0

    .line 59
    :try_start_1
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->confirmed:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    :catchall_5
    move-exception v0

    :try_start_6
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_6 .. :try_end_7} :catchall_5

    throw v0
.end method

.method declared-synchronized fresh(J)Z
    .registers 5

    monitor-enter p0

    .line 63
    :try_start_1
    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->known:Z

    if-eqz v0, :cond_10

    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->at:J
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_13

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x708

    cmp-long p1, p1, v0

    if-gtz p1, :cond_10

    const/4 p1, 0x1

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    monitor-exit p0

    return p1

    :catchall_13
    move-exception p1

    :try_start_14
    monitor-exit p0
    :try_end_15
    .catchall {:try_start_14 .. :try_end_15} :catchall_13

    throw p1
.end method

.method declared-synchronized position(JJJFI)J
    .registers 16

    monitor-enter p0

    .line 30
    :try_start_1
    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->known:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_75

    const-wide/16 v1, 0x0

    if-nez v0, :cond_9

    monitor-exit p0

    return-wide v1

    .line 31
    :cond_9
    :try_start_9
    iget-wide v3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->confirmed:J

    .line 32
    iget-wide v5, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->epoch:J

    cmp-long v0, p5, v5

    if-ltz v0, :cond_37

    cmp-long v0, p5, v1

    if-lez v0, :cond_37

    cmp-long v0, p5, p1

    if-gtz v0, :cond_37

    sub-long v0, p1, p5

    const-wide/16 v5, 0x5dc

    cmp-long v0, v0, v5

    if-gtz v0, :cond_37

    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->at:J

    sub-long v0, p1, v0

    cmp-long v0, v0, v5

    if-gtz v0, :cond_37

    sub-long v0, p3, v3

    .line 38
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    const-wide/16 v5, 0x708

    cmp-long v0, v0, v5

    if-gtz v0, :cond_37

    const/4 v0, 0x1

    goto :goto_38

    :cond_37
    const/4 v0, 0x0

    :goto_38
    const/4 v1, 0x2

    if-eqz v0, :cond_62

    const/4 v2, 0x3

    if-ne p8, v2, :cond_5f

    .line 40
    invoke-static {p7}, Lapp/yydarlinker/deepseekcaptions/RebuildClock$$ExternalSyntheticBackport0;->m(F)Z

    move-result v2

    if-eqz v2, :cond_5f

    const/4 v2, 0x0

    cmpl-float v2, p7, v2

    if-lez v2, :cond_5f

    const/high16 v2, 0x40800000    # 4.0f

    cmpg-float v2, p7, v2

    if-gtz v2, :cond_5f

    const-wide/16 v2, 0x320

    sub-long/2addr p1, p5

    .line 41
    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    long-to-float p1, p1

    mul-float/2addr p1, p7

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    int-to-long p1, p1

    add-long/2addr p3, p1

    goto :goto_63

    :cond_5f
    if-ne p8, v1, :cond_62

    goto :goto_63

    :cond_62
    move-wide p3, v3

    :goto_63
    if-eqz v0, :cond_6b

    if-ne p8, v1, :cond_6b

    .line 46
    iput-wide p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->lastOutput:J
    :try_end_69
    .catchall {:try_start_9 .. :try_end_69} :catchall_75

    .line 47
    monitor-exit p0

    return-wide p3

    .line 49
    :cond_6b
    :try_start_6b
    iget-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->lastOutput:J

    invoke-static {p1, p2, p3, p4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->lastOutput:J
    :try_end_73
    .catchall {:try_start_6b .. :try_end_73} :catchall_75

    .line 50
    monitor-exit p0

    return-wide p1

    :catchall_75
    move-exception p1

    :try_start_76
    monitor-exit p0
    :try_end_77
    .catchall {:try_start_76 .. :try_end_77} :catchall_75

    throw p1
.end method

.method declared-synchronized presentation(J)J
    .registers 13

    monitor-enter p0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-wide/16 v4, -0x1

    const-wide/16 v6, 0x0

    move-object v1, p0

    move-wide v2, p1

    .line 55
    :try_start_9
    invoke-virtual/range {v1 .. v9}, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->position(JJJFI)J

    move-result-wide p0
    :try_end_d
    .catchall {:try_start_9 .. :try_end_d} :catchall_f

    monitor-exit v1

    return-wide p0

    :catchall_f
    move-exception v0

    move-object p0, v0

    :try_start_11
    monitor-exit v1
    :try_end_12
    .catchall {:try_start_11 .. :try_end_12} :catchall_f

    throw p0
.end method

.method declared-synchronized reset(J)V
    .registers 5

    monitor-enter p0

    const-wide/16 v0, 0x0

    .line 9
    :try_start_3
    iput-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->confirmed:J

    .line 10
    iput-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->at:J

    .line 11
    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->epoch:J

    .line 12
    iput-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->lastOutput:J

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->known:Z
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_10

    .line 14
    monitor-exit p0

    return-void

    :catchall_10
    move-exception p1

    :try_start_11
    monitor-exit p0
    :try_end_12
    .catchall {:try_start_11 .. :try_end_12} :catchall_10

    throw p1
.end method

.method declared-synchronized update(JJ)Z
    .registers 13

    monitor-enter p0

    const-wide/16 v0, 0x0

    .line 17
    :try_start_3
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    .line 18
    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->known:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_2e

    iget-wide v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->confirmed:J

    const-wide/16 v4, 0xfa

    sub-long v4, v2, v4

    cmp-long v0, p1, v4

    if-ltz v0, :cond_2c

    sub-long v2, p1, v2

    iget-wide v4, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->at:J

    sub-long v4, p3, v4

    const-wide/16 v6, 0x4

    mul-long/2addr v4, v6

    const-wide/16 v6, 0x1f4

    add-long/2addr v4, v6

    const-wide/16 v6, 0x9c4

    .line 21
    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-lez v0, :cond_2e

    :cond_2c
    move v0, v1

    goto :goto_2f

    :cond_2e
    const/4 v0, 0x0

    .line 22
    :goto_2f
    iget-boolean v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->known:Z

    if-eqz v2, :cond_35

    if-eqz v0, :cond_37

    :cond_35
    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->lastOutput:J

    .line 23
    :cond_37
    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->confirmed:J

    .line 24
    iput-wide p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->at:J

    .line 25
    iput-boolean v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->known:Z
    :try_end_3d
    .catchall {:try_start_3 .. :try_end_3d} :catchall_3f

    .line 26
    monitor-exit p0

    return v0

    :catchall_3f
    move-exception p1

    :try_start_40
    monitor-exit p0
    :try_end_41
    .catchall {:try_start_40 .. :try_end_41} :catchall_3f

    throw p1
.end method
