.class public final Le/e/a/CommentFrames;
.super Ljava/lang/Object;
.source "CommentFrames.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/view/Choreographer$FrameCallback;


# static fields
.field private static final ACTIVE:Ljava/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/IdentityHashMap<",
            "Landroid/view/TextureView;",
            "Le/e/a/CommentFrames;",
            ">;"
        }
    .end annotation
.end field

.field private static final EARLY_TOLERANCE_NS:J = 0x7a120L

.field private static final MAIN:Landroid/os/Handler;


# instance fields
.field private choreographer:Landroid/view/Choreographer;

.field private final draw:Ljava/lang/Runnable;

.field private drawCount:J

.field private maxDrawNs:J

.field private nextDueNs:J

.field private final periodNs:J

.field private statsStartNs:J

.field private totalDrawNs:J

.field private final view:Landroid/view/TextureView;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 13
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/CommentFrames;->MAIN:Landroid/os/Handler;

    .line 14
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    return-void
.end method

.method private constructor <init>(Landroid/view/TextureView;Ljava/lang/Runnable;I)V
    .registers 6

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Le/e/a/CommentFrames;->view:Landroid/view/TextureView;

    .line 25
    iput-object p2, p0, Le/e/a/CommentFrames;->draw:Ljava/lang/Runnable;

    .line 26
    const/16 p1, 0x78

    invoke-static {p1, p3}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 p2, 0x1

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-long p1, p1

    const-wide/32 v0, 0x3b9aca00

    div-long/2addr v0, p1

    iput-wide v0, p0, Le/e/a/CommentFrames;->periodNs:J

    .line 27
    return-void
.end method

.method private static cancel(Le/e/a/CommentFrames;)V
    .registers 2

    .line 45
    if-nez p0, :cond_0

    return-void

    .line 46
    :cond_0
    sget-object v0, Le/e/a/CommentFrames;->MAIN:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 47
    iget-object v0, p0, Le/e/a/CommentFrames;->choreographer:Landroid/view/Choreographer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/CommentFrames;->choreographer:Landroid/view/Choreographer;

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 48
    :cond_1
    return-void
.end method

.method private drawAndMeasure()V
    .registers 11

    .line 94
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 95
    iget-object v2, p0, Le/e/a/CommentFrames;->draw:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 96
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    .line 97
    iget-wide v4, p0, Le/e/a/CommentFrames;->statsStartNs:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    iput-wide v0, p0, Le/e/a/CommentFrames;->statsStartNs:J

    .line 98
    :cond_0
    sub-long v0, v2, v0

    .line 99
    iget-wide v4, p0, Le/e/a/CommentFrames;->drawCount:J

    const-wide/16 v8, 0x1

    add-long/2addr v4, v8

    iput-wide v4, p0, Le/e/a/CommentFrames;->drawCount:J

    .line 100
    iget-wide v4, p0, Le/e/a/CommentFrames;->totalDrawNs:J

    add-long/2addr v4, v0

    iput-wide v4, p0, Le/e/a/CommentFrames;->totalDrawNs:J

    .line 101
    iget-wide v4, p0, Le/e/a/CommentFrames;->maxDrawNs:J

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/CommentFrames;->maxDrawNs:J

    .line 102
    iget-wide v0, p0, Le/e/a/CommentFrames;->statsStartNs:J

    sub-long v0, v2, v0

    .line 103
    const-wide v4, 0x2540be400L

    cmp-long v4, v0, v4

    if-ltz v4, :cond_1

    .line 104
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "drawsPerSec="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v8, p0, Le/e/a/CommentFrames;->drawCount:J

    long-to-float v5, v8

    long-to-float v0, v0

    const v1, 0x4e6e6b28    # 1.0E9f

    div-float/2addr v0, v1

    div-float/2addr v5, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " drawWholeAvgMs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Le/e/a/CommentFrames;->totalDrawNs:J

    long-to-float v1, v4

    iget-wide v4, p0, Le/e/a/CommentFrames;->drawCount:J

    long-to-float v4, v4

    const v5, 0x49742400    # 1000000.0f

    mul-float/2addr v4, v5

    div-float/2addr v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " drawWholeMaxMs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v8, p0, Le/e/a/CommentFrames;->maxDrawNs:J

    long-to-float v1, v8

    div-float/2addr v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "nicoid-frame-total"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    iput-wide v2, p0, Le/e/a/CommentFrames;->statsStartNs:J

    .line 108
    iput-wide v6, p0, Le/e/a/CommentFrames;->maxDrawNs:J

    iput-wide v6, p0, Le/e/a/CommentFrames;->totalDrawNs:J

    iput-wide v6, p0, Le/e/a/CommentFrames;->drawCount:J

    .line 110
    :cond_1
    return-void
.end method

.method private isCurrent()Z
    .registers 4

    .line 57
    sget-object v0, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    monitor-enter v0

    :try_start_0
    sget-object v1, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    iget-object v2, p0, Le/e/a/CommentFrames;->view:Landroid/view/TextureView;

    invoke-virtual {v1, v2}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method static nextDeadline(JJJ)J
    .registers 10

    .line 114
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    add-long/2addr p2, p4

    return-wide p2

    .line 115
    :cond_0
    sub-long v2, p2, p0

    div-long/2addr v2, p4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    .line 116
    mul-long/2addr v0, p4

    add-long/2addr p0, v0

    .line 117
    cmp-long v0, p0, p2

    if-lez v0, :cond_1

    goto :goto_0

    :cond_1
    add-long p0, p2, p4

    :goto_0
    return-wide p0
.end method

.method public static start(Landroid/view/TextureView;Ljava/lang/Runnable;I)V
    .registers 4

    .line 30
    if-eqz p0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    .line 31
    :cond_0
    new-instance v0, Le/e/a/CommentFrames;

    invoke-direct {v0, p0, p1, p2}, Le/e/a/CommentFrames;-><init>(Landroid/view/TextureView;Ljava/lang/Runnable;I)V

    .line 32
    sget-object p1, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    monitor-enter p1

    .line 33
    :try_start_0
    sget-object p2, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    invoke-virtual {p2, p0, v0}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Le/e/a/CommentFrames;

    invoke-static {p2}, Le/e/a/CommentFrames;->cancel(Le/e/a/CommentFrames;)V

    .line 34
    sget-object p2, Le/e/a/CommentFrames;->MAIN:Landroid/os/Handler;

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result p2

    if-nez p2, :cond_1

    sget-object p2, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    invoke-virtual {p2, p0}, Ljava/util/IdentityHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    :cond_1
    monitor-exit p1

    .line 36
    return-void

    .line 35
    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 30
    :cond_2
    :goto_0
    return-void
.end method

.method public static stop(Landroid/view/TextureView;)V
    .registers 3

    .line 39
    sget-object v0, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    monitor-enter v0

    .line 40
    :try_start_0
    sget-object v1, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    invoke-virtual {v1, p0}, Ljava/util/IdentityHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/CommentFrames;

    invoke-static {p0}, Le/e/a/CommentFrames;->cancel(Le/e/a/CommentFrames;)V

    .line 41
    monitor-exit v0

    .line 42
    return-void

    .line 41
    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private stopIfCurrent()V
    .registers 4

    .line 51
    sget-object v0, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    monitor-enter v0

    .line 52
    :try_start_0
    sget-object v1, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    iget-object v2, p0, Le/e/a/CommentFrames;->view:Landroid/view/TextureView;

    invoke-virtual {v1, v2}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_0

    sget-object v1, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    iget-object v2, p0, Le/e/a/CommentFrames;->view:Landroid/view/TextureView;

    invoke-virtual {v1, v2}, Ljava/util/IdentityHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CommentFrames;

    invoke-static {v1}, Le/e/a/CommentFrames;->cancel(Le/e/a/CommentFrames;)V

    .line 53
    :cond_0
    monitor-exit v0

    .line 54
    return-void

    .line 53
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public doFrame(J)V
    .registers 10

    .line 74
    invoke-direct {p0}, Le/e/a/CommentFrames;->isCurrent()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 75
    :cond_0
    iget-object v0, p0, Le/e/a/CommentFrames;->view:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Le/e/a/CommentFrames;->view:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->isAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 79
    :cond_1
    iget-wide v0, p0, Le/e/a/CommentFrames;->nextDueNs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2

    const-wide/32 v0, 0x7a120

    add-long/2addr v0, p1

    iget-wide v4, p0, Le/e/a/CommentFrames;->nextDueNs:J

    cmp-long v0, v0, v4

    if-ltz v0, :cond_5

    .line 80
    :cond_2
    iget-object v0, p0, Le/e/a/CommentFrames;->view:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->isShown()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Le/e/a/CommentFrames;->view:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_3

    .line 81
    invoke-direct {p0}, Le/e/a/CommentFrames;->drawAndMeasure()V

    goto :goto_0

    .line 83
    :cond_3
    iput-wide v2, p0, Le/e/a/CommentFrames;->maxDrawNs:J

    iput-wide v2, p0, Le/e/a/CommentFrames;->totalDrawNs:J

    iput-wide v2, p0, Le/e/a/CommentFrames;->drawCount:J

    iput-wide v2, p0, Le/e/a/CommentFrames;->statsStartNs:J

    .line 85
    :goto_0
    invoke-direct {p0}, Le/e/a/CommentFrames;->isCurrent()Z

    move-result v0

    if-nez v0, :cond_4

    return-void

    .line 86
    :cond_4
    iget-wide v1, p0, Le/e/a/CommentFrames;->nextDueNs:J

    iget-wide v5, p0, Le/e/a/CommentFrames;->periodNs:J

    move-wide v3, p1

    invoke-static/range {v1 .. v6}, Le/e/a/CommentFrames;->nextDeadline(JJJ)J

    move-result-wide p1

    iput-wide p1, p0, Le/e/a/CommentFrames;->nextDueNs:J

    .line 88
    :cond_5
    sget-object p1, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    monitor-enter p1

    .line 89
    :try_start_0
    sget-object p2, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    iget-object v0, p0, Le/e/a/CommentFrames;->view:Landroid/view/TextureView;

    invoke-virtual {p2, v0}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, p0, :cond_6

    iget-object p2, p0, Le/e/a/CommentFrames;->choreographer:Landroid/view/Choreographer;

    invoke-virtual {p2, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 90
    :cond_6
    monitor-exit p1

    .line 91
    return-void

    .line 90
    :catchall_0
    move-exception v0

    move-object p2, v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2

    .line 76
    :cond_7
    :goto_1
    invoke-direct {p0}, Le/e/a/CommentFrames;->stopIfCurrent()V

    .line 77
    return-void
.end method

.method public run()V
    .registers 4

    .line 61
    invoke-direct {p0}, Le/e/a/CommentFrames;->isCurrent()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 62
    :cond_0
    iget-object v0, p0, Le/e/a/CommentFrames;->view:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Le/e/a/CommentFrames;->view:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->isAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 66
    :cond_1
    sget-object v0, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    monitor-enter v0

    .line 67
    :try_start_0
    sget-object v1, Le/e/a/CommentFrames;->ACTIVE:Ljava/util/IdentityHashMap;

    iget-object v2, p0, Le/e/a/CommentFrames;->view:Landroid/view/TextureView;

    invoke-virtual {v1, v2}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p0, :cond_2

    monitor-exit v0

    return-void

    .line 68
    :cond_2
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v1

    iput-object v1, p0, Le/e/a/CommentFrames;->choreographer:Landroid/view/Choreographer;

    .line 69
    iget-object v1, p0, Le/e/a/CommentFrames;->choreographer:Landroid/view/Choreographer;

    invoke-virtual {v1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 70
    monitor-exit v0

    .line 71
    return-void

    .line 70
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 63
    :cond_3
    :goto_0
    invoke-direct {p0}, Le/e/a/CommentFrames;->stopIfCurrent()V

    .line 64
    return-void
.end method
