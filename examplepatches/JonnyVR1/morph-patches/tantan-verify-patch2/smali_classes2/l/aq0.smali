.class public Ll/aq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xp0;


# instance fields
.field public final a:Ll/cq0;

.field public final b:Ll/oq0;

.field public final c:Ll/jq0;

.field public final d:Landroid/graphics/Rect;

.field public final e:[I

.field public final f:[I

.field public final g:I

.field public final h:[Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

.field public final i:Landroid/graphics/Rect;

.field public final j:Landroid/graphics/Rect;

.field public final k:Z

.field public final l:Landroid/graphics/Paint;

.field public m:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Ll/cq0;Ll/oq0;Landroid/graphics/Rect;Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/aq0;->i:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/aq0;->j:Landroid/graphics/Rect;

    .line 17
    .line 18
    iput-object p1, p0, Ll/aq0;->a:Ll/cq0;

    .line 19
    .line 20
    iput-object p2, p0, Ll/aq0;->b:Ll/oq0;

    .line 21
    .line 22
    invoke-virtual {p2}, Ll/oq0;->d()Ll/jq0;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iput-object p2, p0, Ll/aq0;->c:Ll/jq0;

    .line 27
    .line 28
    invoke-interface {p2}, Ll/jq0;->getFrameDurations()[I

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/aq0;->e:[I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ll/cq0;->a([I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ll/cq0;->c([I)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput v1, p0, Ll/aq0;->g:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ll/cq0;->b([I)[I

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Ll/aq0;->f:[I

    .line 48
    .line 49
    invoke-static {p2, p3}, Ll/aq0;->j(Ll/jq0;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Ll/aq0;->d:Landroid/graphics/Rect;

    .line 54
    .line 55
    iput-boolean p4, p0, Ll/aq0;->k:Z

    .line 56
    .line 57
    invoke-interface {p2}, Ll/jq0;->getFrameCount()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    new-array p1, p1, [Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

    .line 62
    .line 63
    iput-object p1, p0, Ll/aq0;->h:[Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

    .line 64
    .line 65
    const/4 p1, 0x0

    .line 66
    :goto_0
    iget-object p2, p0, Ll/aq0;->c:Ll/jq0;

    .line 67
    .line 68
    invoke-interface {p2}, Ll/jq0;->getFrameCount()I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-ge p1, p2, :cond_0

    .line 73
    .line 74
    iget-object p2, p0, Ll/aq0;->h:[Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

    .line 75
    .line 76
    iget-object p3, p0, Ll/aq0;->c:Ll/jq0;

    .line 77
    .line 78
    invoke-interface {p3, p1}, Ll/jq0;->getFrameInfo(I)Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    aput-object p3, p2, p1

    .line 83
    .line 84
    add-int/lit8 p1, p1, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_0
    new-instance p1, Landroid/graphics/Paint;

    .line 88
    .line 89
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object p1, p0, Ll/aq0;->l:Landroid/graphics/Paint;

    .line 93
    .line 94
    new-instance p0, Landroid/graphics/PorterDuffXfermode;

    .line 95
    .line 96
    sget-object p2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 97
    .line 98
    invoke-direct {p0, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public static j(Ll/jq0;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/jq0;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-interface {p0}, Ll/jq0;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-direct {p1, v0, v0, v1, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 15
    .line 16
    .line 17
    return-object p1

    .line 18
    :cond_0
    new-instance v1, Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-interface {p0}, Ll/jq0;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-interface {p0}, Ll/jq0;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-direct {v1, v0, v0, v2, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 45
    .line 46
    .line 47
    return-object v1
.end method


# virtual methods
.method public a(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aq0;->e:[I

    .line 2
    .line 3
    aget p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aq0;->d:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c()Ll/oq0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aq0;->b:Ll/oq0;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/aq0;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public e(ILandroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aq0;->c:Ll/jq0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/jq0;->getFrame(I)Ll/nq0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    :try_start_0
    invoke-interface {p1}, Ll/nq0;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_2

    .line 12
    .line 13
    invoke-interface {p1}, Ll/nq0;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-gtz v0, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    iget-object v0, p0, Ll/aq0;->c:Ll/jq0;

    .line 21
    .line 22
    invoke-interface {v0}, Ll/jq0;->doesRenderSupportScaling()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, p2, p1}, Ll/aq0;->n(Landroid/graphics/Canvas;Ll/nq0;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_2

    .line 34
    :cond_1
    invoke-virtual {p0, p2, p1}, Ll/aq0;->m(Landroid/graphics/Canvas;Ll/nq0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    .line 36
    .line 37
    :goto_0
    invoke-interface {p1}, Ll/nq0;->dispose()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    :goto_1
    invoke-interface {p1}, Ll/nq0;->dispose()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :goto_2
    invoke-interface {p1}, Ll/nq0;->dispose()V

    .line 46
    .line 47
    .line 48
    throw p0
.end method

.method public f(Landroid/graphics/Rect;)Ll/xp0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/aq0;->c:Ll/jq0;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/aq0;->j(Ll/jq0;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/aq0;->d:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance v0, Ll/aq0;

    .line 17
    .line 18
    iget-object v1, p0, Ll/aq0;->a:Ll/cq0;

    .line 19
    .line 20
    iget-object v2, p0, Ll/aq0;->b:Ll/oq0;

    .line 21
    .line 22
    iget-boolean p0, p0, Ll/aq0;->k:Z

    .line 23
    .line 24
    invoke-direct {v0, v1, v2, p1, p0}, Ll/aq0;-><init>(Ll/cq0;Ll/oq0;Landroid/graphics/Rect;Z)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aq0;->d:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFrameCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aq0;->c:Ll/jq0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/jq0;->getFrameCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFrameInfo(I)Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aq0;->h:[Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aq0;->c:Ll/jq0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/jq0;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLoopCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aq0;->c:Ll/jq0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/jq0;->getLoopCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aq0;->c:Ll/jq0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/jq0;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h(ILandroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/aq0;->c:Ll/jq0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/jq0;->getFrame(I)Ll/nq0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/aq0;->c:Ll/jq0;

    .line 8
    .line 9
    invoke-interface {v1, p1}, Ll/jq0;->getFrameInfo(I)Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v2, p0, Ll/aq0;->c:Ll/jq0;

    .line 18
    .line 19
    add-int/lit8 p1, p1, -0x1

    .line 20
    .line 21
    invoke-interface {v2, p1}, Ll/jq0;->getFrameInfo(I)Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    :try_start_0
    invoke-interface {v0}, Ll/nq0;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-lez v2, :cond_3

    .line 30
    .line 31
    invoke-interface {v0}, Ll/nq0;->getHeight()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-gtz v2, :cond_1

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_1
    iget-object v2, p0, Ll/aq0;->c:Ll/jq0;

    .line 39
    .line 40
    invoke-interface {v2}, Ll/jq0;->doesRenderSupportScaling()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0, p2, v0, v1, p1}, Ll/aq0;->p(Landroid/graphics/Canvas;Ll/nq0;Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    goto :goto_3

    .line 52
    :cond_2
    invoke-virtual {p0, p2, v0, v1, p1}, Ll/aq0;->o(Landroid/graphics/Canvas;Ll/nq0;Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    .line 55
    :goto_1
    invoke-interface {v0}, Ll/nq0;->dispose()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    :goto_2
    invoke-interface {v0}, Ll/nq0;->dispose()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :goto_3
    invoke-interface {v0}, Ll/nq0;->dispose()V

    .line 64
    .line 65
    .line 66
    throw p0
.end method

.method public final declared-synchronized i()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/aq0;->m:Landroid/graphics/Bitmap;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/aq0;->m:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method public final k(Landroid/graphics/Canvas;FFLcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;)V
    .locals 4

    .line 1
    iget-object v0, p4, Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;->g:Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo$DisposalMethod;

    .line 2
    .line 3
    sget-object v1, Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo$DisposalMethod;->DISPOSE_TO_BACKGROUND:Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo$DisposalMethod;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget v0, p4, Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;->d:I

    .line 8
    .line 9
    int-to-float v0, v0

    .line 10
    mul-float/2addr v0, p2

    .line 11
    float-to-double v0, v0

    .line 12
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    double-to-int v0, v0

    .line 17
    iget v1, p4, Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;->e:I

    .line 18
    .line 19
    int-to-float v1, v1

    .line 20
    mul-float/2addr v1, p3

    .line 21
    float-to-double v1, v1

    .line 22
    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    double-to-int v1, v1

    .line 27
    iget v2, p4, Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;->b:I

    .line 28
    .line 29
    int-to-float v2, v2

    .line 30
    mul-float/2addr v2, p2

    .line 31
    float-to-double v2, v2

    .line 32
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    double-to-int p2, v2

    .line 37
    iget p4, p4, Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;->c:I

    .line 38
    .line 39
    int-to-float p4, p4

    .line 40
    mul-float/2addr p4, p3

    .line 41
    float-to-double p3, p4

    .line 42
    invoke-static {p3, p4}, Ljava/lang/Math;->ceil(D)D

    .line 43
    .line 44
    .line 45
    move-result-wide p3

    .line 46
    double-to-int p3, p3

    .line 47
    new-instance p4, Landroid/graphics/Rect;

    .line 48
    .line 49
    add-int/2addr v0, p2

    .line 50
    add-int/2addr v1, p3

    .line 51
    invoke-direct {p4, p2, p3, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/aq0;->l:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {p1, p4, p0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public final declared-synchronized l(II)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/aq0;->m:Landroid/graphics/Bitmap;

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lt v0, p1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/aq0;->m:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-ge v0, p2, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ll/aq0;->i()V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Ll/aq0;->m:Landroid/graphics/Bitmap;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 31
    .line 32
    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Ll/aq0;->m:Landroid/graphics/Bitmap;

    .line 37
    .line 38
    :cond_2
    iget-object p1, p0, Ll/aq0;->m:Landroid/graphics/Bitmap;

    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    invoke-virtual {p1, p2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/aq0;->m:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    monitor-exit p0

    .line 47
    return-object p1

    .line 48
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    throw p1
.end method

.method public final m(Landroid/graphics/Canvas;Ll/nq0;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/aq0;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p2}, Ll/nq0;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-interface {p2}, Ll/nq0;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-interface {p2}, Ll/nq0;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    int-to-float v2, v2

    .line 34
    int-to-float v0, v0

    .line 35
    div-float/2addr v2, v0

    .line 36
    invoke-interface {p2}, Ll/nq0;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    int-to-float v0, v0

    .line 41
    int-to-float v1, v1

    .line 42
    div-float/2addr v0, v1

    .line 43
    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-interface {p2}, Ll/nq0;->getWidth()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    int-to-float v1, v1

    .line 52
    div-float/2addr v1, v0

    .line 53
    float-to-int v1, v1

    .line 54
    invoke-interface {p2}, Ll/nq0;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    int-to-float v2, v2

    .line 59
    div-float/2addr v2, v0

    .line 60
    float-to-int v2, v2

    .line 61
    invoke-interface {p2}, Ll/nq0;->getXOffset()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    int-to-float v3, v3

    .line 66
    div-float/2addr v3, v0

    .line 67
    float-to-int v3, v3

    .line 68
    invoke-interface {p2}, Ll/nq0;->getYOffset()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    int-to-float v4, v4

    .line 73
    div-float/2addr v4, v0

    .line 74
    float-to-int v0, v4

    .line 75
    goto :goto_0

    .line 76
    :cond_0
    invoke-interface {p2}, Ll/nq0;->getWidth()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-interface {p2}, Ll/nq0;->getHeight()I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    invoke-interface {p2}, Ll/nq0;->getXOffset()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    invoke-interface {p2}, Ll/nq0;->getYOffset()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    :goto_0
    monitor-enter p0

    .line 93
    :try_start_0
    invoke-virtual {p0, v1, v2}, Ll/aq0;->l(II)Landroid/graphics/Bitmap;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    iput-object v4, p0, Ll/aq0;->m:Landroid/graphics/Bitmap;

    .line 98
    .line 99
    invoke-interface {p2, v1, v2, v4}, Ll/nq0;->renderFrame(IILandroid/graphics/Bitmap;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 103
    .line 104
    .line 105
    int-to-float p2, v3

    .line 106
    int-to-float v0, v0

    .line 107
    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 108
    .line 109
    .line 110
    iget-object p2, p0, Ll/aq0;->m:Landroid/graphics/Bitmap;

    .line 111
    .line 112
    const/4 v0, 0x0

    .line 113
    const/4 v1, 0x0

    .line 114
    invoke-virtual {p1, p2, v1, v1, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 118
    .line 119
    .line 120
    monitor-exit p0

    .line 121
    return-void

    .line 122
    :catchall_0
    move-exception p1

    .line 123
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    throw p1
.end method

.method public final n(Landroid/graphics/Canvas;Ll/nq0;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/aq0;->d:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-double v0, v0

    .line 8
    iget-object v2, p0, Ll/aq0;->c:Ll/jq0;

    .line 9
    .line 10
    invoke-interface {v2}, Ll/jq0;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    int-to-double v2, v2

    .line 15
    div-double/2addr v0, v2

    .line 16
    iget-object v2, p0, Ll/aq0;->d:Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    int-to-double v2, v2

    .line 23
    iget-object v4, p0, Ll/aq0;->c:Ll/jq0;

    .line 24
    .line 25
    invoke-interface {v4}, Ll/jq0;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    int-to-double v4, v4

    .line 30
    div-double/2addr v2, v4

    .line 31
    invoke-interface {p2}, Ll/nq0;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    int-to-double v4, v4

    .line 36
    mul-double/2addr v4, v0

    .line 37
    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    .line 38
    .line 39
    .line 40
    move-result-wide v4

    .line 41
    long-to-int v4, v4

    .line 42
    invoke-interface {p2}, Ll/nq0;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    int-to-double v5, v5

    .line 47
    mul-double/2addr v5, v2

    .line 48
    invoke-static {v5, v6}, Ljava/lang/Math;->round(D)J

    .line 49
    .line 50
    .line 51
    move-result-wide v5

    .line 52
    long-to-int v5, v5

    .line 53
    invoke-interface {p2}, Ll/nq0;->getXOffset()I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    int-to-double v6, v6

    .line 58
    mul-double/2addr v6, v0

    .line 59
    double-to-int v0, v6

    .line 60
    invoke-interface {p2}, Ll/nq0;->getYOffset()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    int-to-double v6, v1

    .line 65
    mul-double/2addr v6, v2

    .line 66
    double-to-int v1, v6

    .line 67
    monitor-enter p0

    .line 68
    :try_start_0
    iget-object v2, p0, Ll/aq0;->d:Landroid/graphics/Rect;

    .line 69
    .line 70
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    iget-object v3, p0, Ll/aq0;->d:Landroid/graphics/Rect;

    .line 75
    .line 76
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    invoke-virtual {p0, v2, v3}, Ll/aq0;->l(II)Landroid/graphics/Bitmap;

    .line 81
    .line 82
    .line 83
    iget-object v6, p0, Ll/aq0;->m:Landroid/graphics/Bitmap;

    .line 84
    .line 85
    if-eqz v6, :cond_0

    .line 86
    .line 87
    invoke-interface {p2, v4, v5, v6}, Ll/nq0;->renderFrame(IILandroid/graphics/Bitmap;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :catchall_0
    move-exception p1

    .line 92
    goto :goto_1

    .line 93
    :cond_0
    :goto_0
    iget-object p2, p0, Ll/aq0;->i:Landroid/graphics/Rect;

    .line 94
    .line 95
    const/4 v4, 0x0

    .line 96
    invoke-virtual {p2, v4, v4, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 97
    .line 98
    .line 99
    iget-object p2, p0, Ll/aq0;->j:Landroid/graphics/Rect;

    .line 100
    .line 101
    add-int/2addr v2, v0

    .line 102
    add-int/2addr v3, v1

    .line 103
    invoke-virtual {p2, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Ll/aq0;->m:Landroid/graphics/Bitmap;

    .line 107
    .line 108
    if-eqz p2, :cond_1

    .line 109
    .line 110
    iget-object v0, p0, Ll/aq0;->i:Landroid/graphics/Rect;

    .line 111
    .line 112
    iget-object v1, p0, Ll/aq0;->j:Landroid/graphics/Rect;

    .line 113
    .line 114
    const/4 v2, 0x0

    .line 115
    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 116
    .line 117
    .line 118
    :cond_1
    monitor-exit p0

    .line 119
    return-void

    .line 120
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    throw p1
.end method

.method public final o(Landroid/graphics/Canvas;Ll/nq0;Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/aq0;->d:Landroid/graphics/Rect;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Ll/aq0;->d:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-gtz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    int-to-float v0, v0

    .line 25
    iget-object v1, p0, Ll/aq0;->d:Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    int-to-float v1, v1

    .line 32
    div-float/2addr v0, v1

    .line 33
    if-eqz p4, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, p1, v0, v0, p4}, Ll/aq0;->k(Landroid/graphics/Canvas;FFLcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-interface {p2}, Ll/nq0;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result p4

    .line 42
    invoke-interface {p2}, Ll/nq0;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    new-instance v2, Landroid/graphics/Rect;

    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    invoke-direct {v2, v3, v3, p4, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 50
    .line 51
    .line 52
    int-to-float v3, p4

    .line 53
    mul-float/2addr v3, v0

    .line 54
    float-to-int v3, v3

    .line 55
    int-to-float v4, v1

    .line 56
    mul-float/2addr v4, v0

    .line 57
    float-to-int v4, v4

    .line 58
    invoke-interface {p2}, Ll/nq0;->getXOffset()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    int-to-float v5, v5

    .line 63
    mul-float/2addr v5, v0

    .line 64
    float-to-int v5, v5

    .line 65
    invoke-interface {p2}, Ll/nq0;->getYOffset()I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    int-to-float v6, v6

    .line 70
    mul-float/2addr v6, v0

    .line 71
    float-to-int v0, v6

    .line 72
    new-instance v6, Landroid/graphics/Rect;

    .line 73
    .line 74
    add-int/2addr v3, v5

    .line 75
    add-int/2addr v4, v0

    .line 76
    invoke-direct {v6, v5, v0, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 77
    .line 78
    .line 79
    iget-object p3, p3, Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;->f:Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo$BlendOperation;

    .line 80
    .line 81
    sget-object v0, Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo$BlendOperation;->NO_BLEND:Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo$BlendOperation;

    .line 82
    .line 83
    if-ne p3, v0, :cond_2

    .line 84
    .line 85
    iget-object p3, p0, Ll/aq0;->l:Landroid/graphics/Paint;

    .line 86
    .line 87
    invoke-virtual {p1, v6, p3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    monitor-enter p0

    .line 91
    :try_start_0
    invoke-virtual {p0, p4, v1}, Ll/aq0;->l(II)Landroid/graphics/Bitmap;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    invoke-interface {p2, p4, v1, p3}, Ll/nq0;->renderFrame(IILandroid/graphics/Bitmap;)V

    .line 96
    .line 97
    .line 98
    const/4 p2, 0x0

    .line 99
    invoke-virtual {p1, p3, v2, v6, p2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 100
    .line 101
    .line 102
    monitor-exit p0

    .line 103
    return-void

    .line 104
    :catchall_0
    move-exception p1

    .line 105
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    throw p1

    .line 107
    :cond_3
    :goto_0
    return-void
.end method

.method public final p(Landroid/graphics/Canvas;Ll/nq0;Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/aq0;->c:Ll/jq0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/jq0;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/aq0;->c:Ll/jq0;

    .line 8
    .line 9
    invoke-interface {v1}, Ll/jq0;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v2, v0

    .line 14
    int-to-float v3, v1

    .line 15
    invoke-interface {p2}, Ll/nq0;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-interface {p2}, Ll/nq0;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    invoke-interface {p2}, Ll/nq0;->getXOffset()I

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    invoke-interface {p2}, Ll/nq0;->getYOffset()I

    .line 28
    .line 29
    .line 30
    move-result v7

    .line 31
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v8

    .line 35
    int-to-float v8, v8

    .line 36
    cmpl-float v8, v2, v8

    .line 37
    .line 38
    if-gtz v8, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result v8

    .line 44
    int-to-float v8, v8

    .line 45
    cmpl-float v8, v3, v8

    .line 46
    .line 47
    if-lez v8, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 51
    .line 52
    move v1, v0

    .line 53
    goto :goto_2

    .line 54
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    div-float v4, v2, v3

    .line 71
    .line 72
    if-le v0, v1, :cond_2

    .line 73
    .line 74
    int-to-float v0, v0

    .line 75
    div-float v1, v0, v4

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    int-to-float v1, v1

    .line 79
    mul-float v0, v1, v4

    .line 80
    .line 81
    :goto_1
    div-float/2addr v0, v2

    .line 82
    div-float/2addr v1, v3

    .line 83
    invoke-interface {p2}, Ll/nq0;->getWidth()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    int-to-float v2, v2

    .line 88
    mul-float/2addr v2, v0

    .line 89
    float-to-double v2, v2

    .line 90
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 91
    .line 92
    .line 93
    move-result-wide v2

    .line 94
    double-to-int v4, v2

    .line 95
    invoke-interface {p2}, Ll/nq0;->getHeight()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    int-to-float v2, v2

    .line 100
    mul-float/2addr v2, v1

    .line 101
    float-to-double v2, v2

    .line 102
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 103
    .line 104
    .line 105
    move-result-wide v2

    .line 106
    double-to-int v5, v2

    .line 107
    invoke-interface {p2}, Ll/nq0;->getXOffset()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    int-to-float v2, v2

    .line 112
    mul-float/2addr v2, v0

    .line 113
    float-to-double v2, v2

    .line 114
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 115
    .line 116
    .line 117
    move-result-wide v2

    .line 118
    double-to-int v6, v2

    .line 119
    invoke-interface {p2}, Ll/nq0;->getYOffset()I

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    int-to-float v2, v2

    .line 124
    mul-float/2addr v2, v1

    .line 125
    float-to-double v2, v2

    .line 126
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 127
    .line 128
    .line 129
    move-result-wide v2

    .line 130
    double-to-int v7, v2

    .line 131
    :goto_2
    new-instance v2, Landroid/graphics/Rect;

    .line 132
    .line 133
    const/4 v3, 0x0

    .line 134
    invoke-direct {v2, v3, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 135
    .line 136
    .line 137
    new-instance v3, Landroid/graphics/Rect;

    .line 138
    .line 139
    add-int v8, v6, v4

    .line 140
    .line 141
    add-int v9, v7, v5

    .line 142
    .line 143
    invoke-direct {v3, v6, v7, v8, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 144
    .line 145
    .line 146
    if-eqz p4, :cond_3

    .line 147
    .line 148
    invoke-virtual {p0, p1, v0, v1, p4}, Ll/aq0;->k(Landroid/graphics/Canvas;FFLcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;)V

    .line 149
    .line 150
    .line 151
    :cond_3
    iget-object p3, p3, Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;->f:Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo$BlendOperation;

    .line 152
    .line 153
    sget-object p4, Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo$BlendOperation;->NO_BLEND:Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo$BlendOperation;

    .line 154
    .line 155
    if-ne p3, p4, :cond_4

    .line 156
    .line 157
    iget-object p3, p0, Ll/aq0;->l:Landroid/graphics/Paint;

    .line 158
    .line 159
    invoke-virtual {p1, v3, p3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 160
    .line 161
    .line 162
    :cond_4
    monitor-enter p0

    .line 163
    :try_start_0
    invoke-virtual {p0, v4, v5}, Ll/aq0;->l(II)Landroid/graphics/Bitmap;

    .line 164
    .line 165
    .line 166
    move-result-object p3

    .line 167
    invoke-interface {p2, v4, v5, p3}, Ll/nq0;->renderFrame(IILandroid/graphics/Bitmap;)V

    .line 168
    .line 169
    .line 170
    const/4 p2, 0x0

    .line 171
    invoke-virtual {p1, p3, v2, v3, p2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 172
    .line 173
    .line 174
    monitor-exit p0

    .line 175
    return-void

    .line 176
    :catchall_0
    move-exception p1

    .line 177
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 178
    throw p1
.end method
