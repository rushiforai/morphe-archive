.class Ltv/danmaku/ijk/media/streamer/ScreenRender;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/nio/ByteBuffer;

.field public b:Ljava/nio/ByteBuffer;

.field c:Ll/pej;

.field d:Ll/qnw;

.field e:Ll/qmq0;

.field f:Ll/iej;

.field g:Ll/jfj;

.field h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

.field i:Ll/qmq0$a;

.field private j:I

.field private k:Landroid/graphics/SurfaceTexture;

.field private l:Ll/jt2;

.field private m:Ll/zej;

.field private n:Lcom/immomo/mediacore/strinf/VideoQuality;

.field private o:I

.field private p:I

.field private q:I

.field private r:I

.field private s:F

.field private t:Landroid/graphics/PointF;

.field private u:Z

.field private v:I

.field private w:I

.field private final x:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final y:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/jt2;Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, -0x3039

    .line 5
    .line 6
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->j:I

    .line 7
    .line 8
    const/16 v0, 0x160

    .line 9
    .line 10
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->o:I

    .line 11
    .line 12
    const/16 v0, 0x280

    .line 13
    .line 14
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->p:I

    .line 15
    .line 16
    const/16 v1, 0x1e0

    .line 17
    .line 18
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->q:I

    .line 19
    .line 20
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->r:I

    .line 21
    .line 22
    const/high16 v0, 0x3f800000    # 1.0f

    .line 23
    .line 24
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->s:F

    .line 25
    .line 26
    new-instance v0, Landroid/graphics/PointF;

    .line 27
    .line 28
    const/high16 v1, 0x41800000    # 16.0f

    .line 29
    .line 30
    const/high16 v2, 0x41100000    # 9.0f

    .line 31
    .line 32
    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->t:Landroid/graphics/PointF;

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->v:I

    .line 39
    .line 40
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->w:I

    .line 41
    .line 42
    if-eqz p2, :cond_0

    .line 43
    .line 44
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 45
    .line 46
    iget v1, p2, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 47
    .line 48
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->o:I

    .line 49
    .line 50
    iget p2, p2, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 51
    .line 52
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->p:I

    .line 53
    .line 54
    :cond_0
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->u:Z

    .line 55
    .line 56
    new-instance p2, Ljava/util/LinkedList;

    .line 57
    .line 58
    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->x:Ljava/util/Queue;

    .line 62
    .line 63
    new-instance p2, Ljava/util/LinkedList;

    .line 64
    .line 65
    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->y:Ljava/util/Queue;

    .line 69
    .line 70
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->w(Ll/jt2;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public static synthetic a(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->o:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic c(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->p:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic e(Ltv/danmaku/ijk/media/streamer/ScreenRender;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->r:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic h(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->q:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic j(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->w:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Ltv/danmaku/ijk/media/streamer/ScreenRender;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->t:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m(Ltv/danmaku/ijk/media/streamer/ScreenRender;)F
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->s:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic n(Ltv/danmaku/ijk/media/streamer/ScreenRender;)Ll/zej;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->m:Ll/zej;

    .line 2
    .line 3
    return-object p0
.end method

.method private v()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->u:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 7
    .line 8
    iget-boolean v0, v0, Ll/jfj;->a:Z

    .line 9
    .line 10
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l:Ll/jt2;

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/gfj;->clearTarget()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l:Ll/jt2;

    .line 23
    .line 24
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 30
    .line 31
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 37
    .line 38
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/gfj;->clearTarget()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 46
    .line 47
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 58
    .line 59
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->m:Ll/zej;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-virtual {v1}, Ll/gfj;->clearTarget()V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 69
    .line 70
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->m:Ll/zej;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    invoke-virtual {v1}, Ll/gfj;->clearTarget()V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l:Ll/jt2;

    .line 80
    .line 81
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 87
    .line 88
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 89
    .line 90
    if-eqz v0, :cond_3

    .line 91
    .line 92
    invoke-virtual {v1}, Ll/gfj;->clearTarget()V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 96
    .line 97
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 103
    .line 104
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 108
    .line 109
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->m:Ll/zej;

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_3
    invoke-virtual {v1}, Ll/gfj;->clearTarget()V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 119
    .line 120
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->m:Ll/zej;

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 123
    .line 124
    .line 125
    :goto_0
    const/4 v0, 0x1

    .line 126
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->u:Z

    .line 127
    .line 128
    return-void
.end method

.method private w(Ll/jt2;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l:Ll/jt2;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p1, Ll/gfj;->useCache:Z

    .line 5
    .line 6
    new-instance p1, Ll/qnw;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/qnw;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d:Ll/qnw;

    .line 12
    .line 13
    iput-boolean v0, p1, Ll/gfj;->useCache:Z

    .line 14
    .line 15
    new-instance p1, Ll/pej;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/pej;-><init>()V

    .line 18
    .line 19
    .line 20
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->o:I

    .line 21
    .line 22
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->p:I

    .line 23
    .line 24
    invoke-virtual {p1, v1, v2}, Ll/pej;->c(II)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d:Ll/qnw;

    .line 28
    .line 29
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l:Ll/jt2;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/zej;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/zej;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->m:Ll/zej;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 43
    .line 44
    new-instance v1, Ll/iej;

    .line 45
    .line 46
    invoke-direct {v1}, Ll/iej;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 50
    .line 51
    iput-boolean v0, v1, Ll/gfj;->useCache:Z

    .line 52
    .line 53
    new-instance v1, Ll/jfj;

    .line 54
    .line 55
    invoke-direct {v1}, Ll/jfj;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 59
    .line 60
    iput-boolean v0, v1, Ll/gfj;->useCache:Z

    .line 61
    .line 62
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d:Ll/qnw;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ll/pej;->b(Ll/wej;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Ll/pej;->k()V

    .line 68
    .line 69
    .line 70
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c:Ll/pej;

    .line 71
    .line 72
    return-void
.end method

.method private y(Ljava/util/Queue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .line 1
    monitor-enter p1

    .line 2
    :goto_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
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
    monitor-exit p1

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method


# virtual methods
.method public A(Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->t:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-void
.end method

.method public B()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->p()Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->k:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    return-void
.end method

.method public o(Ljava/lang/String;)V
    .locals 2

    .line 1
    :goto_0
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ": glError "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "TextureRender"

    .line 28
    .line 29
    invoke-static {v0, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public p()Landroid/graphics/SurfaceTexture;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 6
    .line 7
    .line 8
    aget v0, v1, v2

    .line 9
    .line 10
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->j:I

    .line 11
    .line 12
    const v1, 0x8d65

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 16
    .line 17
    .line 18
    const-string v0, "glBindTexture mTextureID"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->o(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0xde1

    .line 24
    .line 25
    const/16 v1, 0x2801

    .line 26
    .line 27
    const v2, 0x46180400    # 9729.0f

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 31
    .line 32
    .line 33
    const/16 v1, 0x2800

    .line 34
    .line 35
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 36
    .line 37
    .line 38
    const/16 v1, 0x2802

    .line 39
    .line 40
    const v2, 0x812f

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 44
    .line 45
    .line 46
    const/16 v1, 0x2803

    .line 47
    .line 48
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 49
    .line 50
    .line 51
    const-string v0, "glTexParameter"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->o(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 57
    .line 58
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->j:I

    .line 59
    .line 60
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->k:Landroid/graphics/SurfaceTexture;

    .line 64
    .line 65
    return-object v0
.end method

.method public q(ILandroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->x:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->y(Ljava/util/Queue;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c:Ll/pej;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d:Ll/qnw;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, p1, p2}, Ll/qnw;->loadTexture(ILandroid/graphics/SurfaceTexture;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c:Ll/pej;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/pej;->h()V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->y:Ljava/util/Queue;

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->y(Ljava/util/Queue;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->x:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->y(Ljava/util/Queue;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->m:Ll/zej;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public t()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->k:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public u()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public x()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->k:Landroid/graphics/SurfaceTexture;

    .line 3
    .line 4
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c:Ll/pej;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/pej;->d()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c:Ll/pej;

    .line 12
    .line 13
    :cond_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/gfj;->destroy()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 21
    .line 22
    :cond_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/gfj;->destroy()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 30
    .line 31
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 32
    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->destroy()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 39
    .line 40
    :cond_3
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->m:Ll/zej;

    .line 41
    .line 42
    if-eqz v1, :cond_4

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/zej;->destroy()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->m:Ll/zej;

    .line 48
    .line 49
    :cond_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 50
    .line 51
    if-eqz v1, :cond_5

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/qmq0;->destroy()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 57
    .line 58
    :cond_5
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l:Ll/jt2;

    .line 59
    .line 60
    if-eqz v1, :cond_6

    .line 61
    .line 62
    invoke-virtual {v1}, Ll/gfj;->destroy()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l:Ll/jt2;

    .line 66
    .line 67
    :cond_6
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->b:Ljava/nio/ByteBuffer;

    .line 68
    .line 69
    if-eqz v1, :cond_7

    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->b:Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    :cond_7
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->a:Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    if-eqz v1, :cond_8

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 81
    .line 82
    .line 83
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->a:Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    :cond_8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->x:Ljava/util/Queue;

    .line 86
    .line 87
    if-eqz v0, :cond_9

    .line 88
    .line 89
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 90
    .line 91
    .line 92
    :cond_9
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->y:Ljava/util/Queue;

    .line 93
    .line 94
    if-eqz p0, :cond_a

    .line 95
    .line 96
    invoke-interface {p0}, Ljava/util/Collection;->clear()V

    .line 97
    .line 98
    .line 99
    :cond_a
    return-void
.end method

.method public z(Ll/jt2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l:Ll/jt2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/gfj;->clearTarget()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d:Ll/qnw;

    .line 9
    .line 10
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l:Ll/jt2;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c:Ll/pej;

    .line 16
    .line 17
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l:Ll/jt2;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/pej;->a(Ll/wej;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l:Ll/jt2;

    .line 23
    .line 24
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d:Ll/qnw;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l:Ll/jt2;

    .line 30
    .line 31
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
