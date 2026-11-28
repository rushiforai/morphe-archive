.class public final Le/e/a/CommentPresentation;
.super Ljava/lang/Object;
.source "CommentPresentation.java"


# static fields
.field private static final ACTIVE:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/TextureView;",
            "Le/e/a/CommentPresentation;",
            ">;"
        }
    .end annotation
.end field

.field private static final DIAGNOSTICS:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final DIAGNOSTIC_LIMIT:I = 0x78

.field private static final LOG_PERIOD_NS:J = 0x12a05f200L

.field private static final LONG_POST_GAP_NS:J = 0x17d7840L

.field private static final MODE_SAMPLE_NS:J = 0xee6b280L

.field private static final TAG:Ljava/lang/String; = "nicoid-comment-present"


# instance fields
.field private attempts:I

.field private drawNs:J

.field private drawStart:J

.field private hardwareSurface:Landroid/view/Surface;

.field private lastPost:J

.field private lockNs:J

.field private locked:I

.field private longPostGaps:I

.field private maxPostGapNs:J

.field private mode:Ljava/lang/String;

.field private nextGeometrySample116:J

.field private nextModeSample:J

.field private periodStart:J

.field private postNs:J

.field private posted:I

.field private softwareFailureReported:Z

.field private final texture:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/SurfaceTexture;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 27
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentPresentation;->ACTIVE:Ljava/util/WeakHashMap;

    .line 29
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    sput-object v0, Le/e/a/CommentPresentation;->DIAGNOSTICS:Ljava/util/ArrayDeque;

    return-void
.end method

.method private constructor <init>(Landroid/view/TextureView;Landroid/graphics/SurfaceTexture;Ljava/lang/String;)V
    .registers 5

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/CommentPresentation;->texture:Ljava/lang/ref/WeakReference;

    .line 42
    iput-object p3, p0, Le/e/a/CommentPresentation;->mode:Ljava/lang/String;

    .line 43
    invoke-virtual {p1}, Landroid/view/TextureView;->isHardwareAccelerated()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "other"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 45
    :try_start_0
    new-instance v0, Landroid/view/Surface;

    invoke-direct {v0, p2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, p0, Le/e/a/CommentPresentation;->hardwareSurface:Landroid/view/Surface;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    goto :goto_0

    .line 46
    :catch_0
    move-exception p2

    .line 47
    const-string v0, "create"

    invoke-direct {p0, v0, p2}, Le/e/a/CommentPresentation;->hardwareFailure(Ljava/lang/String;Ljava/lang/RuntimeException;)V

    .line 50
    :cond_0
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "start mode="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " backend="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-direct {p0}, Le/e/a/CommentPresentation;->backend()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " view="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 51
    invoke-virtual {p1}, Landroid/view/TextureView;->getWidth()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "x"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Landroid/view/TextureView;->getHeight()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " acceleratedWindow="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 52
    invoke-virtual {p1}, Landroid/view/TextureView;->isHardwareAccelerated()Z

    move-result p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 50
    invoke-static {p1}, Le/e/a/CommentPresentation;->event(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public static appendDiagnostics(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 98
    sget-object v0, Le/e/a/CommentPresentation;->DIAGNOSTICS:Ljava/util/ArrayDeque;

    monitor-enter v0

    .line 99
    :try_start_0
    sget-object v1, Le/e/a/CommentPresentation;->DIAGNOSTICS:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    monitor-exit v0

    return-object p0

    .line 100
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "\n\nComment presentation diagnostics:\n"

    .line 101
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 102
    sget-object v1, Le/e/a/CommentPresentation;->DIAGNOSTICS:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 103
    :cond_1
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    monitor-exit v0

    return-object p0

    .line 104
    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private backend()Ljava/lang/String;
    .registers 2

    .line 94
    iget-object v0, p0, Le/e/a/CommentPresentation;->hardwareSurface:Landroid/view/Surface;

    if-nez v0, :cond_0

    const-string v0, "software"

    goto :goto_0

    :cond_0
    const-string v0, "hardware"

    :goto_0
    return-object v0
.end method

.method private disableHardware(Ljava/lang/String;Ljava/lang/RuntimeException;)V
    .registers 3

    .line 222
    invoke-direct {p0, p1, p2}, Le/e/a/CommentPresentation;->hardwareFailure(Ljava/lang/String;Ljava/lang/RuntimeException;)V

    .line 223
    invoke-direct {p0}, Le/e/a/CommentPresentation;->releaseSurface()V

    .line 224
    const-wide/16 p1, 0x0

    invoke-direct {p0, p1, p2}, Le/e/a/CommentPresentation;->resetWindow(J)V

    .line 225
    iput-wide p1, p0, Le/e/a/CommentPresentation;->lastPost:J

    .line 226
    return-void
.end method

.method private static event(Ljava/lang/String;)V
    .registers 6

    .line 108
    const-string v0, "nicoid-comment-present"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    sget-object v0, Le/e/a/CommentPresentation;->DIAGNOSTICS:Ljava/util/ArrayDeque;

    monitor-enter v0

    .line 110
    :try_start_0
    sget-object v1, Le/e/a/CommentPresentation;->DIAGNOSTICS:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->size()I

    move-result v1

    const/16 v2, 0x78

    if-ne v1, v2, :cond_0

    sget-object v1, Le/e/a/CommentPresentation;->DIAGNOSTICS:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    .line 111
    :cond_0
    sget-object v1, Le/e/a/CommentPresentation;->DIAGNOSTICS:Ljava/util/ArrayDeque;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 112
    monitor-exit v0

    .line 113
    return-void

    .line 112
    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private hardwareFailure(Ljava/lang/String;Ljava/lang/RuntimeException;)V
    .registers 5

    .line 229
    const-string v0, "nicoid-comment-present"

    const-string v1, "Comment hardware producer failed, reverting to software"

    invoke-static {v0, v1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/CommentPresentation;->mode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " fallback=software phase="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " error="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 231
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 230
    invoke-static {p1}, Le/e/a/CommentPresentation;->event(Ljava/lang/String;)V

    .line 232
    return-void
.end method

.method private static isFullscreen(Landroid/view/TextureView;Landroid/app/Activity;)Z
    .registers 7

    .line 82
    invoke-virtual {p0}, Landroid/view/TextureView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 83
    return v2

    .line 84
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    .line 85
    const/4 v0, 0x1

    if-eqz p1, :cond_2

    const-string v1, "isFullScreen"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_1

    .line 86
    const-string v1, "isLandscape"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_1
    return v0

    .line 87
    :cond_2
    invoke-virtual {p0}, Landroid/view/TextureView;->getRootView()Landroid/view/View;

    move-result-object p1

    .line 88
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    if-lez v1, :cond_3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    if-lez v1, :cond_3

    .line 89
    invoke-virtual {p0}, Landroid/view/TextureView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    const v4, 0x3f666666    # 0.9f

    mul-float/2addr v3, v4

    cmpl-float v1, v1, v3

    if-ltz v1, :cond_3

    .line 90
    invoke-virtual {p0}, Landroid/view/TextureView;->getHeight()I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    int-to-float p1, p1

    const/high16 v1, 0x3f400000    # 0.75f

    mul-float/2addr p1, v1

    cmpl-float p0, p0, p1

    if-ltz p0, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    nop

    .line 88
    :goto_0
    return v2
.end method

.method public static lock(Landroid/view/TextureView;)Landroid/graphics/Canvas;
    .registers 12

    .line 117
    invoke-virtual {p0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    .line 118
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 119
    invoke-static {p0}, Le/e/a/CommentPresentation;->release(Landroid/view/TextureView;)V

    .line 120
    return-object v1

    .line 122
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    .line 123
    sget-object v4, Le/e/a/CommentPresentation;->ACTIVE:Ljava/util/WeakHashMap;

    invoke-virtual {v4, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/CommentPresentation;

    .line 124
    const-wide/32 v5, 0xee6b280

    const-wide/16 v7, 0x0

    if-eqz v4, :cond_2

    iget-object v9, v4, Le/e/a/CommentPresentation;->texture:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    if-eq v9, v0, :cond_1

    goto :goto_0

    .line 129
    :cond_1
    iget-wide v9, v4, Le/e/a/CommentPresentation;->nextModeSample:J

    cmp-long v0, v2, v9

    if-ltz v0, :cond_3

    .line 130
    add-long/2addr v5, v2

    iput-wide v5, v4, Le/e/a/CommentPresentation;->nextModeSample:J

    .line 131
    invoke-static {p0}, Le/e/a/CommentPresentation;->playbackMode(Landroid/view/TextureView;)Ljava/lang/String;

    move-result-object v0

    .line 132
    iget-object v5, v4, Le/e/a/CommentPresentation;->mode:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 134
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mode="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v4, Le/e/a/CommentPresentation;->mode:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "->"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " backend="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {v4}, Le/e/a/CommentPresentation;->backend()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " view="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 135
    invoke-virtual {p0}, Landroid/view/TextureView;->getWidth()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/view/TextureView;->getHeight()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 134
    invoke-static {v5}, Le/e/a/CommentPresentation;->event(Ljava/lang/String;)V

    .line 136
    iput-object v0, v4, Le/e/a/CommentPresentation;->mode:Ljava/lang/String;

    .line 137
    invoke-direct {v4, v2, v3}, Le/e/a/CommentPresentation;->resetWindow(J)V

    .line 138
    iput-wide v7, v4, Le/e/a/CommentPresentation;->lastPost:J

    goto :goto_1

    .line 125
    :cond_2
    :goto_0
    invoke-static {p0}, Le/e/a/CommentPresentation;->release(Landroid/view/TextureView;)V

    .line 126
    new-instance v4, Le/e/a/CommentPresentation;

    invoke-static {p0}, Le/e/a/CommentPresentation;->playbackMode(Landroid/view/TextureView;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v4, p0, v0, v9}, Le/e/a/CommentPresentation;-><init>(Landroid/view/TextureView;Landroid/graphics/SurfaceTexture;Ljava/lang/String;)V

    .line 127
    add-long/2addr v5, v2

    iput-wide v5, v4, Le/e/a/CommentPresentation;->nextModeSample:J

    .line 128
    sget-object v0, Le/e/a/CommentPresentation;->ACTIVE:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    :cond_3
    :goto_1
    iget-wide v5, v4, Le/e/a/CommentPresentation;->periodStart:J

    cmp-long v0, v5, v7

    if-nez v0, :cond_4

    iput-wide v2, v4, Le/e/a/CommentPresentation;->periodStart:J

    .line 142
    :cond_4
    iget v0, v4, Le/e/a/CommentPresentation;->attempts:I

    add-int/lit8 v0, v0, 0x1

    iput v0, v4, Le/e/a/CommentPresentation;->attempts:I

    .line 143
    const-string v0, "nicoid.comments.lockCanvas"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 146
    :try_start_0
    iget-object v0, v4, Le/e/a/CommentPresentation;->hardwareSurface:Landroid/view/Surface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v5, "lock"

    if-nez v0, :cond_5

    .line 148
    :try_start_1
    invoke-virtual {p0}, Landroid/view/TextureView;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 152
    :goto_2
    goto :goto_4

    .line 149
    :catch_0
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    .line 150
    :goto_3
    :try_start_2
    invoke-direct {v4, v5, v0}, Le/e/a/CommentPresentation;->reportSoftwareFailure(Ljava/lang/String;Ljava/lang/RuntimeException;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 151
    goto :goto_2

    .line 155
    :cond_5
    :try_start_3
    iget-object v0, v4, Le/e/a/CommentPresentation;->hardwareSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->lockHardwareCanvas()Landroid/graphics/Canvas;

    move-result-object v1
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 160
    goto :goto_4

    .line 156
    :catch_2
    move-exception v0

    .line 158
    :try_start_4
    invoke-direct {v4, v5, v0}, Le/e/a/CommentPresentation;->disableHardware(Ljava/lang/String;Ljava/lang/RuntimeException;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 159
    nop

    .line 163
    :goto_4
    iget-wide v5, v4, Le/e/a/CommentPresentation;->periodStart:J

    cmp-long v0, v5, v7

    if-eqz v0, :cond_6

    iget-wide v5, v4, Le/e/a/CommentPresentation;->lockNs:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v7

    sub-long/2addr v7, v2

    add-long/2addr v5, v7

    iput-wide v5, v4, Le/e/a/CommentPresentation;->lockNs:J

    .line 164
    :cond_6
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 165
    nop

    .line 166
    if-eqz v1, :cond_7

    .line 167
    invoke-direct {v4, p0, v1, v2, v3}, Le/e/a/CommentPresentation;->sampleGeometry116(Landroid/view/TextureView;Landroid/graphics/Canvas;J)V

    iget p0, v4, Le/e/a/CommentPresentation;->locked:I

    add-int/lit8 p0, p0, 0x1

    iput p0, v4, Le/e/a/CommentPresentation;->locked:I

    .line 168
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iput-wide v2, v4, Le/e/a/CommentPresentation;->drawStart:J

    .line 169
    const-string p0, "nicoid.comments.paint"

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    goto :goto_5

    .line 171
    :cond_7
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    invoke-direct {v4, p0, v2, v3}, Le/e/a/CommentPresentation;->report(Landroid/view/TextureView;J)V

    .line 173
    :goto_5
    return-object v1

    .line 163
    :catchall_0
    move-exception p0

    iget-wide v0, v4, Le/e/a/CommentPresentation;->periodStart:J

    cmp-long v0, v0, v7

    if-eqz v0, :cond_8

    iget-wide v0, v4, Le/e/a/CommentPresentation;->lockNs:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    sub-long/2addr v5, v2

    add-long/2addr v0, v5

    iput-wide v0, v4, Le/e/a/CommentPresentation;->lockNs:J

    .line 164
    :cond_8
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 165
    throw p0
.end method

.method private static playbackMode(Landroid/view/TextureView;)Ljava/lang/String;
    .registers 5

    .line 56
    move-object v0, p0

    :goto_0
    if-eqz v0, :cond_2

    .line 57
    const-string v1, "nicoid-retained-mini-player"

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p0, "mini"

    return-object p0

    .line 58
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 59
    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/view/View;

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    .line 60
    :goto_1
    goto :goto_0

    .line 61
    :cond_2
    invoke-virtual {p0}, Landroid/view/TextureView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 62
    :goto_2
    const-string v1, "other"

    if-eqz v0, :cond_9

    .line 63
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 64
    const-string p0, "popup"

    return-object p0

    .line 66
    :cond_3
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_6

    .line 67
    check-cast v0, Landroid/app/Activity;

    .line 68
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 69
    invoke-static {p0, v0}, Le/e/a/CommentPresentation;->isFullscreen(Landroid/view/TextureView;Landroid/app/Activity;)Z

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "fullscreen"

    goto :goto_3

    :cond_4
    const-string p0, "normal"

    :goto_3
    return-object p0

    .line 71
    :cond_5
    return-object v1

    .line 73
    :cond_6
    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-nez v2, :cond_7

    goto :goto_4

    .line 74
    :cond_7
    move-object v2, v0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    .line 75
    if-ne v2, v0, :cond_8

    goto :goto_4

    .line 76
    :cond_8
    nop

    .line 77
    move-object v0, v2

    goto :goto_2

    .line 78
    :cond_9
    :goto_4
    return-object v1
.end method

.method public static post(Landroid/view/TextureView;Landroid/graphics/Canvas;)V
    .registers 13

    .line 177
    sget-object v0, Le/e/a/CommentPresentation;->ACTIVE:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/CommentPresentation;

    .line 178
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    .line 179
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 180
    iget-wide v3, v0, Le/e/a/CommentPresentation;->drawNs:J

    iget-wide v5, v0, Le/e/a/CommentPresentation;->drawStart:J

    sub-long v5, v1, v5

    add-long/2addr v3, v5

    iput-wide v3, v0, Le/e/a/CommentPresentation;->drawNs:J

    .line 181
    const-string v3, "nicoid.comments.postCanvas"

    invoke-static {v3}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 183
    const-wide/16 v3, 0x0

    :try_start_0
    iget-object v5, v0, Le/e/a/CommentPresentation;->hardwareSurface:Landroid/view/Surface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v6, "post"

    if-nez v5, :cond_1

    .line 185
    :try_start_1
    invoke-virtual {p0, p1}, Landroid/view/TextureView;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 189
    goto :goto_1

    .line 186
    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 187
    :goto_0
    :try_start_2
    invoke-direct {v0, v6, p1}, Le/e/a/CommentPresentation;->reportSoftwareFailure(Ljava/lang/String;Ljava/lang/RuntimeException;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 207
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    .line 208
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 209
    iget-wide v7, v0, Le/e/a/CommentPresentation;->periodStart:J

    cmp-long p1, v7, v3

    if-eqz p1, :cond_0

    .line 210
    iget-wide v3, v0, Le/e/a/CommentPresentation;->postNs:J

    sub-long v1, v5, v1

    add-long/2addr v3, v1

    iput-wide v3, v0, Le/e/a/CommentPresentation;->postNs:J

    .line 211
    invoke-direct {v0, p0, v5, v6}, Le/e/a/CommentPresentation;->report(Landroid/view/TextureView;J)V

    .line 188
    :cond_0
    return-void

    .line 192
    :cond_1
    :try_start_3
    iget-object v5, v0, Le/e/a/CommentPresentation;->hardwareSurface:Landroid/view/Surface;

    invoke-virtual {v5, p1}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 196
    nop

    .line 198
    :goto_1
    :try_start_4
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    .line 199
    iget-wide v7, v0, Le/e/a/CommentPresentation;->lastPost:J

    cmp-long p1, v7, v3

    if-eqz p1, :cond_2

    .line 200
    iget-wide v7, v0, Le/e/a/CommentPresentation;->lastPost:J

    sub-long v7, v5, v7

    .line 201
    iget-wide v9, v0, Le/e/a/CommentPresentation;->maxPostGapNs:J

    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v9

    iput-wide v9, v0, Le/e/a/CommentPresentation;->maxPostGapNs:J

    .line 202
    const-wide/32 v9, 0x17d7840

    cmp-long p1, v7, v9

    if-ltz p1, :cond_2

    iget p1, v0, Le/e/a/CommentPresentation;->longPostGaps:I

    add-int/lit8 p1, p1, 0x1

    iput p1, v0, Le/e/a/CommentPresentation;->longPostGaps:I

    .line 204
    :cond_2
    iput-wide v5, v0, Le/e/a/CommentPresentation;->lastPost:J

    .line 205
    iget p1, v0, Le/e/a/CommentPresentation;->posted:I

    add-int/lit8 p1, p1, 0x1

    iput p1, v0, Le/e/a/CommentPresentation;->posted:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 207
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    .line 208
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 209
    iget-wide v7, v0, Le/e/a/CommentPresentation;->periodStart:J

    cmp-long p1, v7, v3

    if-eqz p1, :cond_3

    .line 210
    iget-wide v3, v0, Le/e/a/CommentPresentation;->postNs:J

    sub-long v1, v5, v1

    add-long/2addr v3, v1

    iput-wide v3, v0, Le/e/a/CommentPresentation;->postNs:J

    .line 211
    invoke-direct {v0, p0, v5, v6}, Le/e/a/CommentPresentation;->report(Landroid/view/TextureView;J)V

    .line 213
    :cond_3
    nop

    .line 214
    return-void

    .line 193
    :catch_2
    move-exception p1

    .line 194
    :try_start_5
    invoke-direct {v0, v6, p1}, Le/e/a/CommentPresentation;->disableHardware(Ljava/lang/String;Ljava/lang/RuntimeException;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 207
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    .line 208
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 209
    iget-wide v7, v0, Le/e/a/CommentPresentation;->periodStart:J

    cmp-long p1, v7, v3

    if-eqz p1, :cond_4

    .line 210
    iget-wide v3, v0, Le/e/a/CommentPresentation;->postNs:J

    sub-long v1, v5, v1

    add-long/2addr v3, v1

    iput-wide v3, v0, Le/e/a/CommentPresentation;->postNs:J

    .line 211
    invoke-direct {v0, p0, v5, v6}, Le/e/a/CommentPresentation;->report(Landroid/view/TextureView;J)V

    .line 195
    :cond_4
    return-void

    .line 207
    :catchall_0
    move-exception p1

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    .line 208
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 209
    iget-wide v7, v0, Le/e/a/CommentPresentation;->periodStart:J

    cmp-long v3, v7, v3

    if-eqz v3, :cond_5

    .line 210
    iget-wide v3, v0, Le/e/a/CommentPresentation;->postNs:J

    sub-long v1, v5, v1

    add-long/2addr v3, v1

    iput-wide v3, v0, Le/e/a/CommentPresentation;->postNs:J

    .line 211
    invoke-direct {v0, p0, v5, v6}, Le/e/a/CommentPresentation;->report(Landroid/view/TextureView;J)V

    .line 213
    :cond_5
    throw p1
.end method

.method public static release(Landroid/view/TextureView;)V
    .registers 2

    .line 217
    sget-object v0, Le/e/a/CommentPresentation;->ACTIVE:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/CommentPresentation;

    .line 218
    if-eqz p0, :cond_0

    invoke-direct {p0}, Le/e/a/CommentPresentation;->releaseSurface()V

    .line 219
    :cond_0
    return-void
.end method

.method private releaseSurface()V
    .registers 3

    .line 242
    iget-object v0, p0, Le/e/a/CommentPresentation;->hardwareSurface:Landroid/view/Surface;

    .line 243
    const/4 v1, 0x0

    iput-object v1, p0, Le/e/a/CommentPresentation;->hardwareSurface:Landroid/view/Surface;

    .line 244
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 245
    :cond_0
    return-void
.end method

.method private report(Landroid/view/TextureView;J)V
    .registers 10

    .line 248
    iget-wide v0, p0, Le/e/a/CommentPresentation;->periodStart:J

    sub-long v0, p2, v0

    .line 249
    iget-wide v2, p0, Le/e/a/CommentPresentation;->periodStart:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    const-wide v2, 0x12a05f200L

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    goto/16 :goto_0

    .line 250
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Le/e/a/CommentPresentation;->mode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " backend="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Le/e/a/CommentPresentation;->backend()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " view="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 251
    invoke-virtual {p1}, Landroid/view/TextureView;->getWidth()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/view/TextureView;->getHeight()I

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, " attempts="

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v2, p0, Le/e/a/CommentPresentation;->attempts:I

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, " locked="

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v2, p0, Le/e/a/CommentPresentation;->locked:I

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, " posted="

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v2, p0, Le/e/a/CommentPresentation;->posted:I

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, " postedPerSec="

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v2, p0, Le/e/a/CommentPresentation;->posted:I

    int-to-float v2, v2

    const v3, 0x4e6e6b28    # 1.0E9f

    mul-float/2addr v2, v3

    long-to-float v0, v0

    div-float/2addr v2, v0

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " lockAvgMs="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-wide v0, p0, Le/e/a/CommentPresentation;->lockNs:J

    long-to-float v0, v0

    iget v1, p0, Le/e/a/CommentPresentation;->attempts:I

    .line 254
    const/4 v2, 0x1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    const v3, 0x49742400    # 1000000.0f

    mul-float/2addr v1, v3

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " paintAvgMs="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-wide v0, p0, Le/e/a/CommentPresentation;->drawNs:J

    long-to-float v0, v0

    iget v1, p0, Le/e/a/CommentPresentation;->locked:I

    .line 255
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v3

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " postAvgMs="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-wide v0, p0, Le/e/a/CommentPresentation;->postNs:J

    long-to-float v0, v0

    iget v1, p0, Le/e/a/CommentPresentation;->locked:I

    .line 256
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v3

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " postMaxGapMs="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-wide v0, p0, Le/e/a/CommentPresentation;->maxPostGapNs:J

    long-to-float v0, v0

    div-float/2addr v0, v3

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " postGapsOver25ms="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v0, p0, Le/e/a/CommentPresentation;->longPostGaps:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 250
    invoke-static {p1}, Le/e/a/CommentPresentation;->event(Ljava/lang/String;)V

    .line 259
    invoke-direct {p0, p2, p3}, Le/e/a/CommentPresentation;->resetWindow(J)V

    .line 260
    return-void

    .line 249
    :cond_1
    :goto_0
    return-void
.end method

.method private reportSoftwareFailure(Ljava/lang/String;Ljava/lang/RuntimeException;)V
    .registers 5

    .line 235
    iget-boolean v0, p0, Le/e/a/CommentPresentation;->softwareFailureReported:Z

    if-eqz v0, :cond_0

    return-void

    .line 236
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentPresentation;->softwareFailureReported:Z

    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/CommentPresentation;->mode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " software="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " error="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 238
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 237
    invoke-static {p1}, Le/e/a/CommentPresentation;->event(Ljava/lang/String;)V

    .line 239
    return-void
.end method

.method private resetWindow(J)V
    .registers 3

    .line 263
    iput-wide p1, p0, Le/e/a/CommentPresentation;->periodStart:J

    .line 264
    const/4 p1, 0x0

    iput p1, p0, Le/e/a/CommentPresentation;->longPostGaps:I

    iput p1, p0, Le/e/a/CommentPresentation;->posted:I

    iput p1, p0, Le/e/a/CommentPresentation;->locked:I

    iput p1, p0, Le/e/a/CommentPresentation;->attempts:I

    .line 265
    const-wide/16 p1, 0x0

    iput-wide p1, p0, Le/e/a/CommentPresentation;->maxPostGapNs:J

    iput-wide p1, p0, Le/e/a/CommentPresentation;->postNs:J

    iput-wide p1, p0, Le/e/a/CommentPresentation;->drawNs:J

    iput-wide p1, p0, Le/e/a/CommentPresentation;->lockNs:J

    .line 266
    return-void
.end method

.method private sampleGeometry116(Landroid/view/TextureView;Landroid/graphics/Canvas;J)V
    .registers 12

    iget-wide v0, p0, Le/e/a/CommentPresentation;->nextGeometrySample116:J

    cmp-long v2, p3, v0

    if-ltz v2, :cond_1

    const-wide/32 v0, 0x77359400

    add-long/2addr v0, p3

    iput-wide v0, p0, Le/e/a/CommentPresentation;->nextGeometrySample116:J

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "geometry mode="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Le/e/a/CommentPresentation;->mode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " view="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "x"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " canvas="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/graphics/Canvas;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/graphics/Canvas;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " hardware="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/graphics/Canvas;->isHardwareAccelerated()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " scale="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " alpha="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " transform="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/TextureView;->getTransform(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Matrix;->toShortString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " refreshHz="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/Display;->getRefreshRate()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CommentPresentation;->event(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_1
    :goto_0
    return-void
.end method
