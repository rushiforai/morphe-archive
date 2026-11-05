.class public final Le/e/a/CommentClockRules;
.super Ljava/lang/Object;
.source "CommentClockRules.java"


# instance fields
.field private anchor:J

.field private displayed:D

.field private lastTime:J

.field private sample:J

.field private speed:F


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Le/e/a/CommentClockRules;->sample:J

    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Le/e/a/CommentClockRules;->speed:F

    return-void
.end method


# virtual methods
.method public declared-synchronized position(JZFJ)I
    .registers 23
    .param p1, "raw"    # J
    .param p3, "playing"    # Z
    .param p4, "rate"    # F
    .param p5, "now"    # J

    move-object/from16 v1, p0

    move-wide/from16 v2, p5

    monitor-enter p0

    .line 9
    const-wide/16 v4, 0x0

    move-wide/from16 v6, p1

    :try_start_9
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    .end local p1    # "raw":J
    .local v8, "raw":J
    const/4 v0, 0x0

    cmpl-float v0, p4, v0

    if-lez v0, :cond_21

    invoke-static/range {p4 .. p4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_21

    invoke-static/range {p4 .. p4}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v0

    if-nez v0, :cond_21

    move/from16 v0, p4

    goto :goto_23

    .end local p0    # "this":Le/e/a/CommentClockRules;
    :cond_21
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .end local p4    # "rate":F
    .local v0, "rate":F
    :goto_23
    iget-wide v6, v1, Le/e/a/CommentClockRules;->displayed:D

    iget-wide v10, v1, Le/e/a/CommentClockRules;->lastTime:J

    sub-long v10, v2, v10

    invoke-static {v4, v5, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    long-to-float v10, v10

    iget v11, v1, Le/e/a/CommentClockRules;->speed:F

    mul-float v10, v10, v11

    float-to-double v10, v10

    add-double/2addr v6, v10

    .line 11
    .local v6, "predicted":D
    iget-wide v10, v1, Le/e/a/CommentClockRules;->sample:J

    cmp-long v12, v10, v4

    if-ltz v12, :cond_66

    if-eqz p3, :cond_66

    iget v10, v1, Le/e/a/CommentClockRules;->speed:F

    cmpl-float v10, v0, v10

    if-nez v10, :cond_66

    iget-wide v10, v1, Le/e/a/CommentClockRules;->lastTime:J

    cmp-long v12, v2, v10

    if-ltz v12, :cond_66

    iget-wide v10, v1, Le/e/a/CommentClockRules;->sample:J

    cmp-long v12, v8, v10

    if-eqz v12, :cond_5d

    long-to-double v10, v8

    sub-double/2addr v10, v6

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v10

    const-wide v12, 0x406f400000000000L    # 250.0

    cmpl-double v14, v10, v12

    if-gtz v14, :cond_66

    :cond_5d
    iget-wide v10, v1, Le/e/a/CommentClockRules;->sample:J

    cmp-long v12, v8, v10

    if-gez v12, :cond_64

    goto :goto_66

    :cond_64
    const/4 v10, 0x0

    goto :goto_67

    :cond_66
    :goto_66
    const/4 v10, 0x1

    .line 12
    .local v10, "reset":Z
    :goto_67
    if-eqz v10, :cond_6f

    long-to-double v11, v8

    iput-wide v11, v1, Le/e/a/CommentClockRules;->displayed:D

    iput-wide v2, v1, Le/e/a/CommentClockRules;->anchor:J

    goto :goto_86

    .line 13
    :cond_6f
    iget-wide v11, v1, Le/e/a/CommentClockRules;->sample:J

    cmp-long v13, v8, v11

    if-eqz v13, :cond_84

    long-to-double v11, v8

    sub-double/2addr v11, v6

    const-wide v13, 0x3fc999999999999aL    # 0.2

    mul-double v11, v11, v13

    add-double/2addr v11, v6

    iput-wide v11, v1, Le/e/a/CommentClockRules;->displayed:D

    iput-wide v2, v1, Le/e/a/CommentClockRules;->anchor:J

    goto :goto_86

    .line 14
    :cond_84
    iput-wide v6, v1, Le/e/a/CommentClockRules;->displayed:D

    .line 16
    :goto_86
    long-to-double v11, v8

    iget-wide v13, v1, Le/e/a/CommentClockRules;->displayed:D

    long-to-float v15, v8

    iget-wide v4, v1, Le/e/a/CommentClockRules;->anchor:J

    sub-long v4, v2, v4

    move-wide/from16 p1, v6

    const-wide/16 v6, 0x0

    .end local v6    # "predicted":D
    .local p1, "predicted":D
    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    const-wide/16 v6, 0x64

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-float v4, v4

    mul-float v4, v4, v0

    add-float/2addr v15, v4

    float-to-double v4, v15

    invoke-static {v13, v14, v4, v5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    invoke-static {v11, v12, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    iput-wide v4, v1, Le/e/a/CommentClockRules;->displayed:D

    .line 17
    iput-wide v8, v1, Le/e/a/CommentClockRules;->sample:J

    iput-wide v2, v1, Le/e/a/CommentClockRules;->lastTime:J

    iput v0, v1, Le/e/a/CommentClockRules;->speed:F

    .line 18
    iget-wide v4, v1, Le/e/a/CommentClockRules;->displayed:D

    const-wide v6, 0x41dfffffffc00000L    # 2.147483647E9

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4
    :try_end_bc
    .catchall {:try_start_9 .. :try_end_bc} :catchall_bf

    double-to-int v4, v4

    monitor-exit p0

    return v4

    .line 8
    .end local v0    # "rate":F
    .end local v8    # "raw":J
    .end local v10    # "reset":Z
    .end local p1    # "predicted":D
    .end local p3    # "playing":Z
    .end local p5    # "now":J
    :catchall_bf
    move-exception v0

    :try_start_c0
    monitor-exit p0
    :try_end_c1
    .catchall {:try_start_c0 .. :try_end_c1} :catchall_bf

    throw v0
.end method
