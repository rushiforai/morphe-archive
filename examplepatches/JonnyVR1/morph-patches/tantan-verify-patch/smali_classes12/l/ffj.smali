.class public abstract Ll/ffj;
.super Ll/vej;
.source "SourceFile"


# instance fields
.field protected A:Z

.field private B:Ljava/lang/String;

.field private C:Z

.field protected x:Ll/kej;

.field protected y:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/cfj;",
            ">;"
        }
    .end annotation
.end field

.field protected z:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/vej;-><init>()V

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
    iput-object v0, p0, Ll/ffj;->z:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/ffj;->C:Z

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/ffj;->y:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/ffj;->B:Ljava/lang/String;

    .line 26
    .line 27
    return-void
.end method

.method private I()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/vej;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public declared-synchronized H(Ll/cfj;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ffj;->z:Ljava/lang/Object;

    .line 3
    .line 4
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    :try_start_1
    iget-object v1, p0, Ll/ffj;->y:Ljava/util/List;

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
    iget-object v1, p0, Ll/ffj;->y:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 26
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :goto_0
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 29
    :try_start_4
    throw p1

    .line 30
    :catchall_1
    move-exception p1

    .line 31
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 32
    throw p1
.end method

.method public J()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ffj;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ffj;->z:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public L()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/cfj;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ffj;->y:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public M()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ffj;->x:Ll/kej;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/kej;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ll/kej;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-direct {v0, v1, v2}, Ll/kej;-><init>(II)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/ffj;->x:Ll/kej;

    .line 22
    .line 23
    iget-boolean v1, p0, Ll/ffj;->C:Z

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/kej;->e(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/ffj;->x:Ll/kej;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {v0, v1, v2}, Ll/kej;->a(II)V

    .line 39
    .line 40
    .line 41
    const v0, 0x8d40

    .line 42
    .line 43
    .line 44
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    const v2, 0x8cd5

    .line 49
    .line 50
    .line 51
    if-eq v1, v2, :cond_4

    .line 52
    .line 53
    iget-boolean v3, p0, Ll/ffj;->C:Z

    .line 54
    .line 55
    if-eqz v3, :cond_3

    .line 56
    .line 57
    iget-object v1, p0, Ll/ffj;->x:Ll/kej;

    .line 58
    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    invoke-virtual {v1}, Ll/kej;->b()V

    .line 62
    .line 63
    .line 64
    :cond_1
    new-instance v1, Ll/kej;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    invoke-direct {v1, v3, v4}, Ll/kej;-><init>(II)V

    .line 75
    .line 76
    .line 77
    iput-object v1, p0, Ll/ffj;->x:Ll/kej;

    .line 78
    .line 79
    const/4 v3, 0x0

    .line 80
    iput-boolean v3, p0, Ll/ffj;->C:Z

    .line 81
    .line 82
    invoke-virtual {v1, v3}, Ll/kej;->e(Z)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Ll/ffj;->x:Ll/kej;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    invoke-virtual {v1, v3, v4}, Ll/kej;->a(II)V

    .line 96
    .line 97
    .line 98
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-ne v0, v2, :cond_2

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    invoke-static {v0, v1, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 134
    .line 135
    .line 136
    :cond_4
    :goto_0
    return-void
.end method

.method public N()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ffj;->A:Z

    .line 3
    .line 4
    return-void
.end method

.method public O(Ll/cfj;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ffj;->z:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/ffj;->y:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public P()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ffj;->x:Ll/kej;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/kej;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/vej;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ffj;->x:Ll/kej;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/kej;->b()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/ffj;->x:Ll/kej;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public k()V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ffj;->x:Ll/kej;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ffj;->M()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/ffj;->x:Ll/kej;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/kej;->c()[I

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/ffj;->M()V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    return-void

    .line 50
    :cond_2
    :goto_0
    iget-boolean v0, p0, Ll/ffj;->A:Z

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, Ll/ffj;->x:Ll/kej;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/kej;->c()[I

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    aget v0, v0, v1

    .line 62
    .line 63
    const v2, 0x8d40

    .line 64
    .line 65
    .line 66
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/vej;->o()F

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    invoke-virtual {p0}, Ll/vej;->n()F

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    invoke-virtual {p0}, Ll/vej;->m()F

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    invoke-virtual {p0}, Ll/vej;->l()F

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    invoke-static {v0, v3, v4, v5}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 86
    .line 87
    .line 88
    const/16 v0, 0x4100

    .line 89
    .line 90
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ll/ffj;->J()V

    .line 94
    .line 95
    .line 96
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 97
    .line 98
    .line 99
    const/4 v0, 0x1

    .line 100
    goto :goto_1

    .line 101
    :cond_3
    move v0, v1

    .line 102
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 103
    .line 104
    .line 105
    iget-object v2, p0, Ll/ffj;->z:Ljava/lang/Object;

    .line 106
    .line 107
    monitor-enter v2

    .line 108
    :try_start_0
    iget-object v3, p0, Ll/ffj;->y:Ljava/util/List;

    .line 109
    .line 110
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    :cond_4
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    if-eqz v4, :cond_5

    .line 119
    .line 120
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    check-cast v4, Ll/cfj;

    .line 125
    .line 126
    if-eqz v4, :cond_4

    .line 127
    .line 128
    iget-object v5, p0, Ll/ffj;->x:Ll/kej;

    .line 129
    .line 130
    if-eqz v5, :cond_4

    .line 131
    .line 132
    invoke-virtual {v5}, Ll/kej;->d()[I

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    aget v5, v5, v1

    .line 137
    .line 138
    invoke-interface {v4, v5, p0, v0}, Ll/cfj;->b(ILl/ffj;Z)V

    .line 139
    .line 140
    .line 141
    goto :goto_2

    .line 142
    :catchall_0
    move-exception p0

    .line 143
    goto :goto_3

    .line 144
    :cond_5
    monitor-exit v2

    .line 145
    return-void

    .line 146
    :goto_3
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    throw p0
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ffj;->M()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
