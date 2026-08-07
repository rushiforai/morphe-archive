.class public abstract Ll/gfj;
.super Ll/wej;
.source "SourceFile"


# instance fields
.field protected dirty:Z

.field public enableDepthBuffer:Z

.field private filterKey:Ljava/lang/String;

.field public glFrameBuffer:Ll/lej;

.field public inputFrameBuffer:Ll/lej;

.field protected isFloatTexture:Z

.field protected listLock:Ljava/lang/Object;

.field protected renderTargets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/dfj;",
            ">;"
        }
    .end annotation
.end field

.field private sizeChanged:Z

.field protected targets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/dfj;",
            ">;"
        }
    .end annotation
.end field

.field public useCache:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/wej;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/gfj;->useCache:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/gfj;->enableDepthBuffer:Z

    .line 9
    .line 10
    new-instance v1, Ljava/lang/Object;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/gfj;->isFloatTexture:Z

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/gfj;->renderTargets:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/gfj;->filterKey:Ljava/lang/String;

    .line 38
    .line 39
    return-void
.end method

.method private drawIndeed()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->drawFrame()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public declared-synchronized addTarget(Ll/dfj;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 3
    .line 4
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    :try_start_1
    iget-object v1, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    :try_start_2
    iget-object v1, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Ll/gfj;->sizeChanged:Z

    .line 27
    .line 28
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-boolean v1, p0, Ll/gfj;->useCache:Z

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Ll/sej;->f(Z)V

    .line 35
    .line 36
    .line 37
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 38
    monitor-exit p0

    .line 39
    return-void

    .line 40
    :goto_0
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 41
    :try_start_4
    throw p1

    .line 42
    :catchall_1
    move-exception p1

    .line 43
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 44
    throw p1
.end method

.method public clearTarget()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/gfj;->renderTargets:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/lej;->e()V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput-object v1, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public drawFrame()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_6

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_6

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/gfj;->initFBO()V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-boolean v0, p0, Ll/gfj;->dirty:Z

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    iget-object v0, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 34
    .line 35
    monitor-enter v0

    .line 36
    :try_start_0
    iget-boolean v2, p0, Ll/gfj;->sizeChanged:Z

    .line 37
    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    iget-object v2, p0, Ll/gfj;->renderTargets:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Ll/gfj;->renderTargets:Ljava/util/List;

    .line 46
    .line 47
    iget-object v3, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    iput-boolean v1, p0, Ll/gfj;->sizeChanged:Z

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto :goto_1

    .line 57
    :cond_2
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    invoke-virtual {p0}, Ll/gfj;->lockRenderBuffer()V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    aget v0, v0, v1

    .line 68
    .line 69
    const v2, 0x8d40

    .line 70
    .line 71
    .line 72
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    invoke-static {v0, v3, v4, v5}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 92
    .line 93
    .line 94
    const/16 v0, 0x4100

    .line 95
    .line 96
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/gfj;->drawSub()V

    .line 100
    .line 101
    .line 102
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ll/gfj;->unlockInputRenderBuffer()V

    .line 106
    .line 107
    .line 108
    const/4 v0, 0x1

    .line 109
    goto :goto_2

    .line 110
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 111
    throw p0

    .line 112
    :cond_3
    move v0, v1

    .line 113
    :goto_2
    iget-object v2, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 114
    .line 115
    monitor-enter v2

    .line 116
    :try_start_2
    iget-object v3, p0, Ll/gfj;->renderTargets:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    :cond_4
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 123
    .line 124
    .line 125
    move-result v4

    .line 126
    if-eqz v4, :cond_5

    .line 127
    .line 128
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    check-cast v4, Ll/dfj;

    .line 133
    .line 134
    if-eqz v4, :cond_4

    .line 135
    .line 136
    iget-object v5, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 137
    .line 138
    if-eqz v5, :cond_4

    .line 139
    .line 140
    invoke-virtual {v5}, Ll/lej;->i()[I

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    aget v5, v5, v1

    .line 145
    .line 146
    invoke-interface {v4, v5, p0, v0}, Ll/dfj;->newTextureReady(ILl/gfj;Z)V

    .line 147
    .line 148
    .line 149
    goto :goto_3

    .line 150
    :catchall_1
    move-exception p0

    .line 151
    goto :goto_4

    .line 152
    :cond_5
    monitor-exit v2

    .line 153
    return-void

    .line 154
    :goto_4
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 155
    throw p0

    .line 156
    :cond_6
    invoke-virtual {p0}, Ll/gfj;->unlockInputRenderBuffer()V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public drawSub()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gfj;->drawIndeed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getFilterKey()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gfj;->filterKey:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLockObject()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRenderTargets()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/dfj;",
            ">;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/gfj;->sizeChanged:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/gfj;->renderTargets:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/gfj;->renderTargets:Ljava/util/List;

    .line 11
    .line 12
    iget-object v1, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Ll/gfj;->sizeChanged:Z

    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/gfj;->renderTargets:Ljava/util/List;

    .line 21
    .line 22
    return-object p0
.end method

.method public getTargets()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/dfj;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextOutID()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/lej;->i()[I

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    aget p0, p0, v0

    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    return v0
.end method

.method public handleSizeChange()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gfj;->initFBO()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public initFBO()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/gfj;->useCache:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v0, v0, Ll/sej;->c:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v0, v1, v2}, Ll/sej;->c(II)Ll/lej;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 44
    .line 45
    .line 46
    :cond_2
    new-instance v0, Ll/lej;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-direct {v0, v1, v2}, Ll/lej;-><init>(II)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 60
    .line 61
    :goto_0
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 62
    .line 63
    iget-boolean v1, p0, Ll/gfj;->isFloatTexture:Z

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ll/lej;->k(Z)V

    .line 66
    .line 67
    .line 68
    iget-boolean v0, p0, Ll/gfj;->enableDepthBuffer:Z

    .line 69
    .line 70
    iget-object v1, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 71
    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    invoke-virtual {v1, v0, v2}, Ll/lej;->a(II)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_3
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {v1, v0, v2}, Ll/lej;->b(II)V

    .line 95
    .line 96
    .line 97
    :goto_1
    const v0, 0x8d40

    .line 98
    .line 99
    .line 100
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    const v2, 0x8cd5

    .line 105
    .line 106
    .line 107
    if-eq v1, v2, :cond_7

    .line 108
    .line 109
    iget-boolean v3, p0, Ll/gfj;->isFloatTexture:Z

    .line 110
    .line 111
    if-eqz v3, :cond_6

    .line 112
    .line 113
    iget-object v1, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 114
    .line 115
    if-eqz v1, :cond_4

    .line 116
    .line 117
    invoke-virtual {v1}, Ll/lej;->e()V

    .line 118
    .line 119
    .line 120
    :cond_4
    new-instance v1, Ll/lej;

    .line 121
    .line 122
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 127
    .line 128
    .line 129
    move-result v4

    .line 130
    invoke-direct {v1, v3, v4}, Ll/lej;-><init>(II)V

    .line 131
    .line 132
    .line 133
    iput-object v1, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 134
    .line 135
    const/4 v3, 0x0

    .line 136
    iput-boolean v3, p0, Ll/gfj;->isFloatTexture:Z

    .line 137
    .line 138
    invoke-virtual {v1, v3}, Ll/lej;->k(Z)V

    .line 139
    .line 140
    .line 141
    iget-object v1, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    invoke-virtual {v1, v3, v4}, Ll/lej;->b(II)V

    .line 152
    .line 153
    .line 154
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-ne v0, v2, :cond_5

    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 186
    .line 187
    .line 188
    move-result p0

    .line 189
    invoke-static {v0, v1, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 190
    .line 191
    .line 192
    :cond_7
    :goto_2
    return-void
.end method

.method public lockRenderBuffer()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    iget v1, v0, Ll/lej;->h:I

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/gfj;->renderTargets:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iput v1, v0, Ll/lej;->h:I

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/lej;->j()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public markAsDirty()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/gfj;->dirty:Z

    .line 3
    .line 4
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public removeTarget(Ll/dfj;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/gfj;->sizeChanged:Z

    .line 6
    .line 7
    iget-object v1, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-boolean p0, p0, Ll/gfj;->useCache:Z

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/sej;->f(Z)V

    .line 19
    .line 20
    .line 21
    monitor-exit v0

    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0
.end method

.method public setFilterKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gfj;->filterKey:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFloatTexture(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/gfj;->isFloatTexture:Z

    .line 2
    .line 3
    return-void
.end method

.method public unlockInputRenderBuffer()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gfj;->inputFrameBuffer:Ll/lej;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, v0, Ll/lej;->h:I

    .line 6
    .line 7
    add-int/lit8 v1, v1, -0x1

    .line 8
    .line 9
    iput v1, v0, Ll/lej;->h:I

    .line 10
    .line 11
    iget-object v2, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    if-gtz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/lej;->l()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/gfj;->inputFrameBuffer:Ll/lej;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Ll/lej;->h:I

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public unlockRenderBuffer()V
    .locals 0

    .line 1
    return-void
.end method
