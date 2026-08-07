.class public Ltech/sud/runtime/core/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/runtime/core/d$a;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/Object;

.field private b:Z

.field private c:Z

.field private d:Z

.field private e:Z

.field private f:Z

.field private final g:F

.field private final h:Ltech/sud/runtime/core/g;

.field private final i:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private j:J

.field private k:J

.field private l:Ltech/sud/runtime/component/e/d;

.field private final m:Ltech/sud/runtime/core/c;

.field private final n:Landroid/view/View;

.field private o:Ltech/sud/runtime/core/d$a;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/g;Landroid/view/View;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<G",
            "LViewC:Landroid/view/View;",
            ":",
            "Ltech/sud/runtime/core/c;",
            ">(",
            "Ltech/sud/runtime/core/g;",
            "TG",
            "LViewC;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ltech/sud/runtime/core/d;->b:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Ltech/sud/runtime/core/d;->c:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Ltech/sud/runtime/core/d;->d:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Ltech/sud/runtime/core/d;->e:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Ltech/sud/runtime/core/d;->f:Z

    .line 21
    .line 22
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ltech/sud/runtime/core/d;->i:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 28
    .line 29
    const-wide/32 v1, 0xfe502a

    .line 30
    .line 31
    .line 32
    iput-wide v1, p0, Ltech/sud/runtime/core/d;->j:J

    .line 33
    .line 34
    new-instance v1, Ltech/sud/runtime/core/d$a;

    .line 35
    .line 36
    invoke-direct {v1}, Ltech/sud/runtime/core/d$a;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Ltech/sud/runtime/core/d;->o:Ltech/sud/runtime/core/d$a;

    .line 40
    .line 41
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 58
    .line 59
    iput v1, p0, Ltech/sud/runtime/core/d;->g:F

    .line 60
    .line 61
    iput-object p1, p0, Ltech/sud/runtime/core/d;->h:Ltech/sud/runtime/core/g;

    .line 62
    .line 63
    move-object v2, p2

    .line 64
    check-cast v2, Ltech/sud/runtime/core/c;

    .line 65
    .line 66
    iput-object v2, p0, Ltech/sud/runtime/core/d;->m:Ltech/sud/runtime/core/c;

    .line 67
    .line 68
    iput-object p2, p0, Ltech/sud/runtime/core/d;->n:Landroid/view/View;

    .line 69
    .line 70
    const/4 p1, 0x2

    .line 71
    invoke-interface {v2, p1}, Ltech/sud/runtime/core/c;->setEGLContextClientVersion(I)V

    .line 72
    .line 73
    .line 74
    const/4 p1, 0x1

    .line 75
    invoke-virtual {p2, p1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 76
    .line 77
    .line 78
    const/16 v7, 0x10

    .line 79
    .line 80
    const/16 v8, 0x8

    .line 81
    .line 82
    const/16 v3, 0x8

    .line 83
    .line 84
    const/16 v4, 0x8

    .line 85
    .line 86
    const/16 v5, 0x8

    .line 87
    .line 88
    const/16 v6, 0x8

    .line 89
    .line 90
    invoke-interface/range {v2 .. v8}, Ltech/sud/runtime/core/c;->setEGLConfigChooser(IIIIII)V

    .line 91
    .line 92
    .line 93
    new-instance p2, Ltech/sud/runtime/core/d$1;

    .line 94
    .line 95
    invoke-direct {p2, p0}, Ltech/sud/runtime/core/d$1;-><init>(Ltech/sud/runtime/core/d;)V

    .line 96
    .line 97
    .line 98
    invoke-interface {v2, p2}, Ltech/sud/runtime/core/c;->setEGLContextFactory(Landroid/opengl/GLSurfaceView$EGLContextFactory;)V

    .line 99
    .line 100
    .line 101
    iput-boolean v0, p0, Ltech/sud/runtime/core/d;->b:Z

    .line 102
    .line 103
    iput-boolean p1, p0, Ltech/sud/runtime/core/d;->f:Z

    .line 104
    .line 105
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 106
    .line 107
    .line 108
    move-result-wide v0

    .line 109
    iput-wide v0, p0, Ltech/sud/runtime/core/d;->k:J

    .line 110
    .line 111
    invoke-interface {v2, p0}, Ltech/sud/runtime/core/c;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    .line 112
    .line 113
    .line 114
    invoke-interface {v2, p1}, Ltech/sud/runtime/core/c;->setRenderMode(I)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method private a(II)V
    .locals 2

    .line 46
    iget-boolean v0, p0, Ltech/sud/runtime/core/d;->e:Z

    if-eqz v0, :cond_0

    return-void

    .line 47
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/core/d;->h:Ltech/sud/runtime/core/g;

    iget-object p0, p0, Ltech/sud/runtime/core/d;->n:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Ltech/sud/runtime/component/c/h;->a(Landroid/content/Context;)I

    move-result p0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, p1, p2, p0, v1}, Ltech/sud/runtime/core/g;->a(IIIF)V

    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/core/d;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ltech/sud/runtime/core/d;->j()V

    return-void
.end method

.method private b(Landroid/view/MotionEvent;)V
    .locals 14

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
    move-result v1

    .line 9
    if-gez v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v2, 0x5

    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v4, 0x1

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    if-eq v0, v4, :cond_3

    .line 18
    .line 19
    const/4 v5, 0x2

    .line 20
    if-eq v0, v5, :cond_1

    .line 21
    .line 22
    const/4 v5, 0x3

    .line 23
    if-eq v0, v5, :cond_1

    .line 24
    .line 25
    if-eq v0, v2, :cond_3

    .line 26
    .line 27
    const/4 v1, 0x6

    .line 28
    if-eq v0, v1, :cond_3

    .line 29
    .line 30
    :goto_0
    return-void

    .line 31
    :cond_1
    new-array v4, v1, [I

    .line 32
    .line 33
    new-array v5, v1, [F

    .line 34
    .line 35
    new-array v6, v1, [F

    .line 36
    .line 37
    :goto_1
    if-ge v3, v1, :cond_2

    .line 38
    .line 39
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 40
    .line 41
    .line 42
    move-result v7

    .line 43
    aput v7, v4, v3

    .line 44
    .line 45
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    aput v7, v5, v3

    .line 50
    .line 51
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    aput v7, v6, v3

    .line 56
    .line 57
    add-int/lit8 v3, v3, 0x1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    move-object v9, v4

    .line 61
    :goto_2
    move-object v10, v5

    .line 62
    move-object v11, v6

    .line 63
    goto :goto_3

    .line 64
    :cond_3
    new-array v1, v4, [I

    .line 65
    .line 66
    new-array v5, v4, [F

    .line 67
    .line 68
    new-array v6, v4, [F

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    aput v7, v1, v3

    .line 79
    .line 80
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    aput v7, v5, v3

    .line 85
    .line 86
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    aput v4, v6, v3

    .line 91
    .line 92
    move-object v9, v1

    .line 93
    goto :goto_2

    .line 94
    :goto_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 95
    .line 96
    .line 97
    move-result-wide v3

    .line 98
    long-to-double v3, v3

    .line 99
    const-wide v5, 0x408f400000000000L    # 1000.0

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    div-double v12, v3, v5

    .line 105
    .line 106
    iget-object v7, p0, Ltech/sud/runtime/core/d;->h:Ltech/sud/runtime/core/g;

    .line 107
    .line 108
    rem-int/lit8 v8, v0, 0x5

    .line 109
    .line 110
    invoke-virtual/range {v7 .. v13}, Ltech/sud/runtime/core/g;->a(I[I[F[FD)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public static synthetic b(Ltech/sud/runtime/core/d;)V
    .locals 0

    .line 126
    invoke-direct {p0}, Ltech/sud/runtime/core/d;->i()V

    return-void
.end method

.method public static synthetic c(Ltech/sud/runtime/core/d;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ltech/sud/runtime/core/d;->h()V

    return-void
.end method

.method private g()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltech/sud/runtime/core/d;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Ltech/sud/runtime/core/d;->h:Ltech/sud/runtime/core/g;

    .line 8
    .line 9
    invoke-virtual {p0}, Ltech/sud/runtime/core/g;->e()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private h()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ltech/sud/runtime/core/d;->c:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Ltech/sud/runtime/core/d;->e:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ltech/sud/runtime/core/d;->h:Ltech/sud/runtime/core/g;

    .line 9
    .line 10
    invoke-virtual {p0}, Ltech/sud/runtime/core/g;->f()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private i()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltech/sud/runtime/core/d;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ltech/sud/runtime/core/d;->h:Ltech/sud/runtime/core/g;

    .line 6
    .line 7
    invoke-virtual {v0}, Ltech/sud/runtime/core/g;->g()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ltech/sud/runtime/core/d;->c:Z

    .line 12
    .line 13
    return-void
.end method

.method private j()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltech/sud/runtime/core/d;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ltech/sud/runtime/core/d;->e:Z

    .line 7
    .line 8
    iget-object p0, p0, Ltech/sud/runtime/core/d;->h:Ltech/sud/runtime/core/g;

    .line 9
    .line 10
    invoke-virtual {p0}, Ltech/sud/runtime/core/g;->h()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ltech/sud/runtime/core/d;->d:Z

    .line 6
    .line 7
    iput-boolean v1, p0, Ltech/sud/runtime/core/d;->b:Z

    .line 8
    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    iget-object v0, p0, Ltech/sud/runtime/core/d;->m:Ltech/sud/runtime/core/c;

    .line 11
    .line 12
    new-instance v1, Ltech/sud/runtime/core/d$2;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ltech/sud/runtime/core/d$2;-><init>(Ltech/sud/runtime/core/d;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, v1}, Ltech/sud/runtime/core/c;->queueEvent(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 21
    .line 22
    monitor-enter v1

    .line 23
    :try_start_1
    iget-object p0, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 26
    .line 27
    .line 28
    monitor-exit v1

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw p0

    .line 33
    :catchall_1
    move-exception p0

    .line 34
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 35
    throw p0
.end method

.method public a(I)V
    .locals 4

    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    :goto_0
    move p1, v0

    goto :goto_1

    :cond_0
    const/16 v0, 0x3c

    if-le p1, v0, :cond_1

    goto :goto_0

    :cond_1
    :goto_1
    int-to-double v0, p1

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    div-double/2addr v2, v0

    const-wide v0, 0x41cdcd6500000000L    # 1.0E9

    mul-double/2addr v2, v0

    double-to-long v0, v2

    .line 45
    iput-wide v0, p0, Ltech/sud/runtime/core/d;->j:J

    return-void
.end method

.method public a(Landroid/view/MotionEvent;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Ltech/sud/runtime/core/d;->b(Landroid/view/MotionEvent;)V

    .line 43
    iget-object p0, p0, Ltech/sud/runtime/core/d;->l:Ltech/sud/runtime/component/e/d;

    if-eqz p0, :cond_0

    .line 44
    invoke-virtual {p0}, Ltech/sud/runtime/component/e/d;->b()V

    :cond_0
    return-void
.end method

.method public a(Ltech/sud/runtime/component/e/d;)V
    .locals 0

    .line 37
    iput-object p1, p0, Ltech/sud/runtime/core/d;->l:Ltech/sud/runtime/component/e/d;

    return-void
.end method

.method public a(Z)V
    .locals 1

    .line 38
    iget-object v0, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    monitor-enter v0

    .line 39
    :try_start_0
    iput-boolean p1, p0, Ltech/sud/runtime/core/d;->f:Z

    .line 40
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    .line 41
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public b()V
    .locals 2

    .line 114
    iget-object v0, p0, Ltech/sud/runtime/core/d;->m:Ltech/sud/runtime/core/c;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ltech/sud/runtime/core/c;->setRenderMode(I)V

    .line 115
    iget-object v0, p0, Ltech/sud/runtime/core/d;->m:Ltech/sud/runtime/core/c;

    new-instance v1, Ltech/sud/runtime/core/d$3;

    invoke-direct {v1, p0}, Ltech/sud/runtime/core/d$3;-><init>(Ltech/sud/runtime/core/d;)V

    invoke-interface {v0, v1}, Ltech/sud/runtime/core/c;->queueEvent(Ljava/lang/Runnable;)V

    .line 116
    iget-object v0, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 117
    :try_start_0
    iput-boolean v1, p0, Ltech/sud/runtime/core/d;->b:Z

    .line 118
    iget-object p0, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 119
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    .line 120
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public b(Z)V
    .locals 1

    .line 121
    iget-object v0, p0, Ltech/sud/runtime/core/d;->i:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    if-eqz p1, :cond_0

    .line 122
    iget-object p1, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    monitor-enter p1

    .line 123
    :try_start_0
    iget-object p0, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 124
    monitor-exit p1

    return-void

    :catchall_0
    move-exception p0

    .line 125
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_0
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ltech/sud/runtime/core/d;->b:Z

    .line 6
    .line 7
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 8
    iget-object v0, p0, Ltech/sud/runtime/core/d;->m:Ltech/sud/runtime/core/c;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-interface {v0, v1}, Ltech/sud/runtime/core/c;->setRenderMode(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltech/sud/runtime/core/d;->m:Ltech/sud/runtime/core/c;

    .line 15
    .line 16
    new-instance v1, Ltech/sud/runtime/core/d$4;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ltech/sud/runtime/core/d$4;-><init>(Ltech/sud/runtime/core/d;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {v0, v1}, Ltech/sud/runtime/core/c;->queueEvent(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 25
    .line 26
    monitor-enter v1

    .line 27
    :try_start_1
    iget-object p0, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 30
    .line 31
    .line 32
    monitor-exit v1

    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p0

    .line 37
    :catchall_1
    move-exception p0

    .line 38
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 39
    throw p0
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Ltech/sud/runtime/core/d;->d:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public e()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltech/sud/runtime/core/d;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()Ltech/sud/runtime/core/d$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/d;->o:Ltech/sud/runtime/core/d$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 6

    .line 1
    iget-boolean p1, p0, Ltech/sud/runtime/core/d;->e:Z

    .line 2
    .line 3
    if-nez p1, :cond_7

    .line 4
    .line 5
    iget-boolean p1, p0, Ltech/sud/runtime/core/d;->c:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_5

    .line 10
    .line 11
    :cond_0
    iget-object p1, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter p1

    .line 14
    :try_start_0
    iget-boolean v0, p0, Ltech/sud/runtime/core/d;->b:Z

    .line 15
    .line 16
    if-nez v0, :cond_6

    .line 17
    .line 18
    iget-boolean v0, p0, Ltech/sud/runtime/core/d;->f:Z

    .line 19
    .line 20
    if-nez v0, :cond_6

    .line 21
    .line 22
    iget-boolean v0, p0, Ltech/sud/runtime/core/d;->d:Z

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    goto :goto_3

    .line 27
    :cond_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 28
    iget-object p1, p0, Ltech/sud/runtime/core/d;->i:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    goto :goto_5

    .line 37
    :cond_2
    iget-object v0, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 38
    .line 39
    monitor-enter v0

    .line 40
    :try_start_1
    iget-boolean p1, p0, Ltech/sud/runtime/core/d;->b:Z

    .line 41
    .line 42
    if-nez p1, :cond_5

    .line 43
    .line 44
    iget-boolean p1, p0, Ltech/sud/runtime/core/d;->f:Z

    .line 45
    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_3
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 50
    invoke-direct {p0}, Ltech/sud/runtime/core/d;->g()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 55
    .line 56
    .line 57
    move-result-wide v0

    .line 58
    iget-wide v2, p0, Ltech/sud/runtime/core/d;->k:J

    .line 59
    .line 60
    sub-long/2addr v0, v2

    .line 61
    iget-wide v2, p0, Ltech/sud/runtime/core/d;->j:J

    .line 62
    .line 63
    cmp-long v4, v0, v2

    .line 64
    .line 65
    if-gez v4, :cond_4

    .line 66
    .line 67
    sub-long/2addr v2, v0

    .line 68
    const-wide/32 v0, 0xf4240

    .line 69
    .line 70
    .line 71
    cmp-long v4, v2, v0

    .line 72
    .line 73
    if-lez v4, :cond_4

    .line 74
    .line 75
    :try_start_2
    iget-object v4, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 76
    .line 77
    monitor-enter v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 78
    :try_start_3
    iget-object v5, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 79
    .line 80
    div-long/2addr v2, v0

    .line 81
    invoke-virtual {v5, v2, v3}, Ljava/lang/Object;->wait(J)V

    .line 82
    .line 83
    .line 84
    monitor-exit v4

    .line 85
    goto :goto_0

    .line 86
    :catchall_0
    move-exception v0

    .line 87
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 88
    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 89
    :catch_0
    move-exception v0

    .line 90
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 91
    .line 92
    .line 93
    :cond_4
    :goto_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 94
    .line 95
    .line 96
    move-result-wide v0

    .line 97
    iput-wide v0, p0, Ltech/sud/runtime/core/d;->k:J

    .line 98
    .line 99
    iget-object p0, p0, Ltech/sud/runtime/core/d;->o:Ltech/sud/runtime/core/d$a;

    .line 100
    .line 101
    iput-boolean p1, p0, Ltech/sud/runtime/core/d$a;->a:Z

    .line 102
    .line 103
    return-void

    .line 104
    :catchall_1
    move-exception p0

    .line 105
    goto :goto_2

    .line 106
    :cond_5
    :goto_1
    :try_start_5
    monitor-exit v0

    .line 107
    return-void

    .line 108
    :goto_2
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 109
    throw p0

    .line 110
    :catchall_2
    move-exception p0

    .line 111
    goto :goto_4

    .line 112
    :cond_6
    :goto_3
    :try_start_6
    monitor-exit p1

    .line 113
    return-void

    .line 114
    :goto_4
    monitor-exit p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 115
    throw p0

    .line 116
    :cond_7
    :goto_5
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3}, Ltech/sud/runtime/core/d;->a(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p1

    .line 4
    const/4 p2, 0x0

    .line 5
    :try_start_0
    iput-boolean p2, p0, Ltech/sud/runtime/core/d;->f:Z

    .line 6
    .line 7
    iget-object p0, p0, Ltech/sud/runtime/core/d;->a:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 10
    .line 11
    .line 12
    monitor-exit p1

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    throw p0
.end method
