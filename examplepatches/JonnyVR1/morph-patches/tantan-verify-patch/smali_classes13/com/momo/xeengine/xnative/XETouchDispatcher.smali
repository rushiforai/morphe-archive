.class public Lcom/momo/xeengine/xnative/XETouchDispatcher;
.super Lcom/momo/xeengine/xnative/XETouchDispatcherNative;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/event/ITouchEventHandler;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private eventDispatcherIns:J

.field protected executor:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/xnative/XETouchDispatcherNative;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->eventDispatcherIns:J

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/xnative/XETouchDispatcher;I[I[F[F)V
    .locals 7

    .line 1
    iget-wide v1, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->eventDispatcherIns:J

    .line 2
    .line 3
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move v3, p1

    .line 11
    move-object v4, p2

    .line 12
    move-object v5, p3

    .line 13
    move-object v6, p4

    .line 14
    invoke-virtual/range {v0 .. v6}, Lcom/momo/xeengine/xnative/XETouchDispatcherNative;->nativeHandleTouchesEnd(JI[I[F[F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/momo/xeengine/xnative/XETouchDispatcher;I[I[F[F)V
    .locals 7

    .line 1
    iget-wide v1, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->eventDispatcherIns:J

    .line 2
    .line 3
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move v3, p1

    .line 11
    move-object v4, p2

    .line 12
    move-object v5, p3

    .line 13
    move-object v6, p4

    .line 14
    invoke-virtual/range {v0 .. v6}, Lcom/momo/xeengine/xnative/XETouchDispatcherNative;->nativeHandleTouchesMove(JI[I[F[F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/momo/xeengine/xnative/XETouchDispatcher;I[I[F[F)V
    .locals 7

    .line 1
    iget-wide v1, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->eventDispatcherIns:J

    .line 2
    .line 3
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move v3, p1

    .line 11
    move-object v4, p2

    .line 12
    move-object v5, p3

    .line 13
    move-object v6, p4

    .line 14
    invoke-virtual/range {v0 .. v6}, Lcom/momo/xeengine/xnative/XETouchDispatcherNative;->nativeHandleTouchesBegin(JI[I[F[F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public handleTouchEvent(Landroid/view/MotionEvent;FF)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    new-array v4, v3, [I

    .line 10
    .line 11
    new-array v5, v3, [F

    .line 12
    .line 13
    new-array v6, v3, [F

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_0
    if-ge v1, v3, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    aput v2, v4, v1

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    mul-float/2addr v2, p2

    .line 29
    aput v2, v5, v1

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    mul-float/2addr v2, p3

    .line 36
    aput v2, v6, v1

    .line 37
    .line 38
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    if-eqz v0, :cond_2

    .line 42
    .line 43
    const/4 p1, 0x1

    .line 44
    if-eq v0, p1, :cond_1

    .line 45
    .line 46
    const/4 p1, 0x2

    .line 47
    if-eq v0, p1, :cond_3

    .line 48
    .line 49
    const/4 p1, 0x3

    .line 50
    if-eq v0, p1, :cond_1

    .line 51
    .line 52
    const/4 p1, 0x5

    .line 53
    if-eq v0, p1, :cond_2

    .line 54
    .line 55
    const/4 p1, 0x6

    .line 56
    if-eq v0, p1, :cond_1

    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    move-object v2, p0

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    move-object v2, p0

    .line 62
    goto :goto_2

    .line 63
    :cond_3
    iget-object p1, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 64
    .line 65
    new-instance v1, Ll/wlq0;

    .line 66
    .line 67
    move-object v2, p0

    .line 68
    invoke-direct/range {v1 .. v6}, Ll/wlq0;-><init>(Lcom/momo/xeengine/xnative/XETouchDispatcher;I[I[F[F)V

    .line 69
    .line 70
    .line 71
    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :goto_1
    iget-object p0, v2, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 76
    .line 77
    new-instance v1, Ll/vlq0;

    .line 78
    .line 79
    invoke-direct/range {v1 .. v6}, Ll/vlq0;-><init>(Lcom/momo/xeengine/xnative/XETouchDispatcher;I[I[F[F)V

    .line 80
    .line 81
    .line 82
    invoke-interface {p0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :goto_2
    iget-object p0, v2, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 87
    .line 88
    new-instance v1, Ll/ulq0;

    .line 89
    .line 90
    invoke-direct/range {v1 .. v6}, Ll/ulq0;-><init>(Lcom/momo/xeengine/xnative/XETouchDispatcher;I[I[F[F)V

    .line 91
    .line 92
    .line 93
    invoke-interface {p0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public handleTouchEvent(Landroid/view/MotionEvent;Landroid/view/View;)V
    .locals 4

    .line 97
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    .line 98
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    int-to-float p2, p2

    .line 99
    iget-wide v1, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->eventDispatcherIns:J

    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/xnative/XETouchDispatcherNative;->nativeGetWindowWidth(J)I

    move-result v1

    int-to-float v1, v1

    .line 100
    iget-wide v2, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->eventDispatcherIns:J

    invoke-virtual {p0, v2, v3}, Lcom/momo/xeengine/xnative/XETouchDispatcherNative;->nativeGetWindowHeight(J)I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v0

    div-float/2addr v2, p2

    .line 101
    invoke-virtual {p0, p1, v1, v2}, Lcom/momo/xeengine/xnative/XETouchDispatcher;->handleTouchEvent(Landroid/view/MotionEvent;FF)V

    return-void
.end method

.method public handleTouchHitTest()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->eventDispatcherIns:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/momo/xeengine/xnative/XETouchDispatcherNative;->nativeHandleTouchHitTest(J)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->eventDispatcherIns:J

    .line 7
    .line 8
    return-void
.end method
