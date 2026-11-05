.class public final Le/e/a/CommentMotionRules;
.super Ljava/lang/Object;
.source "CommentMotionRules.java"


# instance fields
.field private actual:I

.field private advance:J

.field private generation:J

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

    .line 4
    return-void
.end method


# virtual methods
.method public declared-synchronized frame(JIFZ)V
    .registers 16

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

    :goto_11
    const/4 v0, 0x0

    cmpl-float v5, p4, v0

    if-lez v5, :cond_23

    invoke-static {p4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-nez v5, :cond_23

    invoke-static {p4}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v5

    if-nez v5, :cond_23

    goto :goto_25

    :cond_23
    const/high16 p4, 0x3f800000    # 1.0f

    .line 7
    :goto_25
    iget v5, p0, Le/e/a/CommentMotionRules;->actual:I

    if-ltz v5, :cond_4d

    iget v5, p0, Le/e/a/CommentMotionRules;->actual:I

    if-eq p3, v5, :cond_4d

    iget v5, p0, Le/e/a/CommentMotionRules;->actual:I

    add-int/lit16 v5, v5, -0xfa

    if-lt p3, v5, :cond_4b

    iget v5, p0, Le/e/a/CommentMotionRules;->actual:I

    sub-int v5, p3, v5

    int-to-float v5, v5

    if-eqz p5, :cond_40

    iget-boolean v6, p0, Le/e/a/CommentMotionRules;->playing:Z

    if-eqz v6, :cond_40

    long-to-float v0, v3

    mul-float/2addr v0, p4

    :cond_40
    sub-float/2addr v5, v0

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v5, 0x43c80000    # 400.0f

    cmpl-float v0, v0, v5

    if-lez v0, :cond_4d

    :cond_4b
    const/4 v0, 0x1

    goto :goto_4e

    :cond_4d
    const/4 v0, 0x0

    .line 8
    :goto_4e
    const/high16 v5, 0x41200000    # 10.0f

    if-eqz v0, :cond_63

    iget-wide v0, p0, Le/e/a/CommentMotionRules;->generation:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Le/e/a/CommentMotionRules;->generation:J

    iget-object v0, p0, Le/e/a/CommentMotionRules;->starts:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    int-to-float v0, p3

    div-float/2addr v0, v5

    iput v0, p0, Le/e/a/CommentMotionRules;->visual:F

    goto :goto_94

    .line 9
    :cond_63
    iget v0, p0, Le/e/a/CommentMotionRules;->actual:I

    if-gez v0, :cond_6c

    int-to-float v0, p3

    div-float/2addr v0, v5

    iput v0, p0, Le/e/a/CommentMotionRules;->visual:F

    goto :goto_94

    .line 10
    :cond_6c
    if-eqz p5, :cond_94

    iget-boolean v0, p0, Le/e/a/CommentMotionRules;->playing:Z

    if-eqz v0, :cond_94

    iget v0, p0, Le/e/a/CommentMotionRules;->actual:I

    if-eq p3, v0, :cond_78

    iput-wide p1, p0, Le/e/a/CommentMotionRules;->advance:J

    :cond_78
    iget-wide v6, p0, Le/e/a/CommentMotionRules;->now:J

    iget-wide v8, p0, Le/e/a/CommentMotionRules;->advance:J

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x64

    sub-long/2addr v8, v6

    invoke-static {v1, v2, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iget v2, p0, Le/e/a/CommentMotionRules;->visual:F

    iget v6, p0, Le/e/a/CommentMotionRules;->actual:I

    if-eq p3, v6, :cond_8b

    goto :goto_8f

    :cond_8b
    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    :goto_8f
    long-to-float v0, v3

    div-float/2addr v0, v5

    add-float/2addr v2, v0

    iput v2, p0, Le/e/a/CommentMotionRules;->visual:F

    .line 11
    :cond_94
    :goto_94
    iput p3, p0, Le/e/a/CommentMotionRules;->actual:I

    iput-wide p1, p0, Le/e/a/CommentMotionRules;->now:J

    iput-boolean p5, p0, Le/e/a/CommentMotionRules;->playing:Z

    iput p4, p0, Le/e/a/CommentMotionRules;->rate:F
    :try_end_9c
    .catchall {:try_start_1 .. :try_end_9c} :catchall_9e

    .line 12
    monitor-exit p0

    return-void

    .line 5
    :catchall_9e
    move-exception p1

    :try_start_9f
    monitor-exit p0
    :try_end_a0
    .catchall {:try_start_9f .. :try_end_a0} :catchall_9e

    throw p1
.end method

.method public declared-synchronized generation()J
    .registers 3

    monitor-enter p0

    .line 13
    :try_start_1
    iget-wide v0, p0, Le/e/a/CommentMotionRules;->generation:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    .line 13
    :catchall_5
    move-exception v0

    :try_start_6
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_6 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public declared-synchronized position()F
    .registers 2

    monitor-enter p0

    .line 14
    :try_start_1
    iget v0, p0, Le/e/a/CommentMotionRules;->visual:F
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    .line 14
    :catchall_5
    move-exception v0

    :try_start_6
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_6 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public declared-synchronized start(Ljava/lang/Object;F)F
    .registers 5

    monitor-enter p0

    .line 15
    :try_start_1
    iget-object v0, p0, Le/e/a/CommentMotionRules;->starts:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result p1
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_35

    monitor-exit p0

    return p1

    :cond_11
    :try_start_11
    iget v0, p0, Le/e/a/CommentMotionRules;->actual:I

    int-to-float v0, v0

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr v0, v1

    sub-float/2addr v0, p2

    iget p2, p0, Le/e/a/CommentMotionRules;->rate:F

    const v1, 0x3dcccccd    # 0.1f

    invoke-static {v1, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    div-float/2addr v0, p2

    iget p2, p0, Le/e/a/CommentMotionRules;->visual:F

    sub-float/2addr p2, v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_33

    iget-object v0, p0, Le/e/a/CommentMotionRules;->starts:Ljava/util/WeakHashMap;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_33
    .catchall {:try_start_11 .. :try_end_33} :catchall_35

    :cond_33
    monitor-exit p0

    return p2

    .line 15
    :catchall_35
    move-exception p1

    :try_start_36
    monitor-exit p0
    :try_end_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_35

    throw p1
.end method
