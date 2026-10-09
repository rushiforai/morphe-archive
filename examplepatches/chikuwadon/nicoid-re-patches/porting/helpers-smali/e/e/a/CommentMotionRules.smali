.class public final Le/e/a/CommentMotionRules;
.super Ljava/lang/Object;
.source "CommentMotionRules.java"


# instance fields
.field private actual:I

.field private advance:J

.field private now:J

.field private playing:Z

.field private rate:F

.field private final starts:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private visual:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const/4 v0, -0x1

    iput v0, p0, Le/e/a/CommentMotionRules;->actual:I

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Le/e/a/CommentMotionRules;->rate:F

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/CommentMotionRules;->starts:Ljava/util/WeakHashMap;

    return-void
.end method


# virtual methods
.method public declared-synchronized frame(JIFZ)V
    .registers 16
    .param p1, "time"    # J
    .param p3, "videoPosition"    # I
    .param p4, "speed"    # F
    .param p5, "running"    # Z

    monitor-enter p0

    .line 6
    :try_start_1
    iget v0, p0, Le/e/a/CommentMotionRules;->actual:I

    const-wide/16 v1, 0x0

    if-gez v0, :cond_9

    move-wide v3, v1

    goto :goto_11

    :cond_9
    iget-wide v3, p0, Le/e/a/CommentMotionRules;->now:J

    sub-long v3, p1, v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    .local v3, "dt":J
    :goto_11
    const/4 v0, 0x0

    cmpl-float v5, p4, v0

    if-lez v5, :cond_24

    invoke-static {p4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-nez v5, :cond_24

    invoke-static {p4}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v5

    if-nez v5, :cond_24

    move v5, p4

    goto :goto_26

    .end local p0    # "this":Le/e/a/CommentMotionRules;
    :cond_24
    const/high16 v5, 0x3f800000    # 1.0f

    .line 7
    .end local p4    # "speed":F
    .local v5, "speed":F
    :goto_26
    iget p4, p0, Le/e/a/CommentMotionRules;->actual:I

    if-ltz p4, :cond_4d

    iget p4, p0, Le/e/a/CommentMotionRules;->actual:I

    if-eq p3, p4, :cond_4d

    iget p4, p0, Le/e/a/CommentMotionRules;->actual:I

    if-lt p3, p4, :cond_4b

    iget p4, p0, Le/e/a/CommentMotionRules;->actual:I

    sub-int p4, p3, p4

    int-to-float p4, p4

    if-eqz p5, :cond_40

    iget-boolean v6, p0, Le/e/a/CommentMotionRules;->playing:Z

    if-eqz v6, :cond_40

    long-to-float v0, v3

    mul-float v0, v0, v5

    :cond_40
    sub-float/2addr p4, v0

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p4

    const/high16 v0, 0x43c80000    # 400.0f

    cmpl-float p4, p4, v0

    if-lez p4, :cond_4d

    :cond_4b
    const/4 p4, 0x1

    goto :goto_4e

    :cond_4d
    const/4 p4, 0x0

    .line 8
    .local p4, "seek":Z
    :goto_4e
    const/high16 v0, 0x41200000    # 10.0f

    if-eqz p4, :cond_5c

    iget-object v1, p0, Le/e/a/CommentMotionRules;->starts:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->clear()V

    int-to-float v1, p3

    div-float/2addr v1, v0

    iput v1, p0, Le/e/a/CommentMotionRules;->visual:F

    goto :goto_88

    .line 9
    :cond_5c
    iget v6, p0, Le/e/a/CommentMotionRules;->actual:I

    if-gez v6, :cond_65

    int-to-float v1, p3

    div-float/2addr v1, v0

    iput v1, p0, Le/e/a/CommentMotionRules;->visual:F

    goto :goto_88

    .line 10
    :cond_65
    if-eqz p5, :cond_88

    iget-boolean v6, p0, Le/e/a/CommentMotionRules;->playing:Z

    if-eqz v6, :cond_88

    iget v6, p0, Le/e/a/CommentMotionRules;->actual:I

    if-eq p3, v6, :cond_71

    iput-wide p1, p0, Le/e/a/CommentMotionRules;->advance:J

    :cond_71
    iget-wide v6, p0, Le/e/a/CommentMotionRules;->now:J

    iget-wide v8, p0, Le/e/a/CommentMotionRules;->advance:J

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x64

    sub-long/2addr v8, v6

    invoke-static {v1, v2, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    .local v1, "remaining":J
    iget v6, p0, Le/e/a/CommentMotionRules;->visual:F

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    long-to-float v7, v7

    div-float/2addr v7, v0

    add-float/2addr v6, v7

    iput v6, p0, Le/e/a/CommentMotionRules;->visual:F

    .line 11
    .end local v1    # "remaining":J
    :cond_88
    :goto_88
    iput p3, p0, Le/e/a/CommentMotionRules;->actual:I

    iput-wide p1, p0, Le/e/a/CommentMotionRules;->now:J

    iput-boolean p5, p0, Le/e/a/CommentMotionRules;->playing:Z

    iput v5, p0, Le/e/a/CommentMotionRules;->rate:F
    :try_end_90
    .catchall {:try_start_1 .. :try_end_90} :catchall_92

    .line 12
    monitor-exit p0

    return-void

    .line 5
    .end local v3    # "dt":J
    .end local v5    # "speed":F
    .end local p1    # "time":J
    .end local p3    # "videoPosition":I
    .end local p4    # "seek":Z
    .end local p5    # "running":Z
    :catchall_92
    move-exception p1

    :try_start_93
    monitor-exit p0
    :try_end_94
    .catchall {:try_start_93 .. :try_end_94} :catchall_92

    throw p1
.end method

.method public declared-synchronized position()F
    .registers 2

    monitor-enter p0

    .line 13
    :try_start_1
    iget v0, p0, Le/e/a/CommentMotionRules;->visual:F
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    .line 13
    .end local p0    # "this":Le/e/a/CommentMotionRules;
    :catchall_5
    move-exception v0

    :try_start_6
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_6 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public declared-synchronized start(Ljava/lang/Object;F)F
    .registers 8
    .param p1, "comment"    # Ljava/lang/Object;
    .param p2, "timestamp"    # F

    monitor-enter p0

    .line 14
    :try_start_1
    iget-object v0, p0, Le/e/a/CommentMotionRules;->starts:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    .local v0, "start":Ljava/lang/Float;
    if-eqz v0, :cond_11

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_35

    monitor-exit p0

    return v1

    .end local p0    # "this":Le/e/a/CommentMotionRules;
    :cond_11
    :try_start_11
    iget v1, p0, Le/e/a/CommentMotionRules;->actual:I

    int-to-float v1, v1

    const/high16 v2, 0x41200000    # 10.0f

    div-float/2addr v1, v2

    sub-float/2addr v1, p2

    iget v2, p0, Le/e/a/CommentMotionRules;->rate:F

    const v3, 0x3dcccccd    # 0.1f

    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    div-float/2addr v1, v2

    .local v1, "age":F
    iget v2, p0, Le/e/a/CommentMotionRules;->visual:F

    sub-float/2addr v2, v1

    .local v2, "mapped":F
    const/4 v3, 0x0

    cmpl-float v3, v1, v3

    if-ltz v3, :cond_33

    iget-object v3, p0, Le/e/a/CommentMotionRules;->starts:Ljava/util/WeakHashMap;

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v3, p1, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_33
    .catchall {:try_start_11 .. :try_end_33} :catchall_35

    :cond_33
    monitor-exit p0

    return v2

    .line 14
    .end local v0    # "start":Ljava/lang/Float;
    .end local v1    # "age":F
    .end local v2    # "mapped":F
    .end local p1    # "comment":Ljava/lang/Object;
    .end local p2    # "timestamp":F
    :catchall_35
    move-exception p1

    :try_start_36
    monitor-exit p0
    :try_end_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_35

    throw p1
.end method
