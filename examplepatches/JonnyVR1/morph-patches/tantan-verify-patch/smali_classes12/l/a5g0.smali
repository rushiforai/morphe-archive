.class public Ll/a5g0;
.super Ll/l5g0;
.source "SourceFile"

# interfaces
.implements Ll/ham;
.implements Ll/d5w;


# instance fields
.field public H:Z

.field I:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/c5g0;",
            ">;"
        }
    .end annotation
.end field

.field J:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/g6x;",
            ">;"
        }
    .end annotation
.end field

.field K:I

.field L:Landroid/graphics/PointF;

.field private M:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/xej;",
            ">;"
        }
    .end annotation
.end field

.field private N:Ll/kt2;

.field private O:Landroid/content/Context;

.field private P:Ll/kt2;

.field private Q:Ll/zmi;

.field private R:Landroid/media/SoundPool;

.field private S:Landroid/media/MediaPlayer;

.field private T:J

.field private U:I

.field private V:I

.field private W:F

.field private X:F

.field private Y:Z

.field private Z:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/w4g0;",
            ">;"
        }
    .end annotation
.end field

.field a0:Ll/yqe;

.field private b0:Ll/z5x;

.field private c0:Ll/av2;

.field private d0:I

.field private e0:J

.field private f0:Ll/iqf0;

.field private g0:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/l5g0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/a5g0;->H:Z

    .line 6
    .line 7
    iput v0, p0, Ll/a5g0;->K:I

    .line 8
    .line 9
    new-instance v1, Landroid/graphics/PointF;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {v1, v2, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/a5g0;->L:Landroid/graphics/PointF;

    .line 16
    .line 17
    const-wide/16 v1, 0x0

    .line 18
    .line 19
    iput-wide v1, p0, Ll/a5g0;->T:J

    .line 20
    .line 21
    iput v0, p0, Ll/a5g0;->U:I

    .line 22
    .line 23
    iput v0, p0, Ll/a5g0;->V:I

    .line 24
    .line 25
    const/high16 v3, 0x3f800000    # 1.0f

    .line 26
    .line 27
    iput v3, p0, Ll/a5g0;->W:F

    .line 28
    .line 29
    iput v3, p0, Ll/a5g0;->X:F

    .line 30
    .line 31
    iput-boolean v0, p0, Ll/a5g0;->Y:Z

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    iput-object v3, p0, Ll/a5g0;->b0:Ll/z5x;

    .line 35
    .line 36
    iput-object v3, p0, Ll/a5g0;->c0:Ll/av2;

    .line 37
    .line 38
    iput v0, p0, Ll/a5g0;->d0:I

    .line 39
    .line 40
    iput-wide v1, p0, Ll/a5g0;->e0:J

    .line 41
    .line 42
    iput-object v3, p0, Ll/a5g0;->f0:Ll/iqf0;

    .line 43
    .line 44
    new-instance v0, Ljava/util/HashMap;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Ll/a5g0;->g0:Ljava/util/Map;

    .line 50
    .line 51
    iput-object p1, p0, Ll/a5g0;->O:Landroid/content/Context;

    .line 52
    .line 53
    new-instance p1, Ll/zmi;

    .line 54
    .line 55
    invoke-direct {p1}, Ll/zmi;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Ll/a5g0;->Q:Ll/zmi;

    .line 59
    .line 60
    new-instance p1, Ll/kt2;

    .line 61
    .line 62
    invoke-direct {p1}, Ll/kt2;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object p1, p0, Ll/a5g0;->N:Ll/kt2;

    .line 66
    .line 67
    invoke-virtual {p1, p0}, Ll/hfj;->C(Ll/efj;)V

    .line 68
    .line 69
    .line 70
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 71
    .line 72
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object p1, p0, Ll/a5g0;->I:Ljava/util/concurrent/ConcurrentHashMap;

    .line 76
    .line 77
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 78
    .line 79
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Ll/a5g0;->J:Ljava/util/concurrent/ConcurrentHashMap;

    .line 83
    .line 84
    iget-object p1, p0, Ll/a5g0;->N:Ll/kt2;

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Ll/pgk;->R(Ll/kt2;)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/a5g0;->N:Ll/kt2;

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Ll/pgk;->S(Ll/kt2;)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Ll/a5g0;->N:Ll/kt2;

    .line 95
    .line 96
    iput-object p1, p0, Ll/a5g0;->P:Ll/kt2;

    .line 97
    .line 98
    new-instance p1, Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 101
    .line 102
    .line 103
    iput-object p1, p0, Ll/a5g0;->M:Ljava/util/List;

    .line 104
    .line 105
    new-instance p1, Landroid/media/SoundPool;

    .line 106
    .line 107
    const/4 v0, 0x5

    .line 108
    const/4 v1, 0x3

    .line 109
    invoke-direct {p1, v0, v1, v0}, Landroid/media/SoundPool;-><init>(III)V

    .line 110
    .line 111
    .line 112
    iput-object p1, p0, Ll/a5g0;->R:Landroid/media/SoundPool;

    .line 113
    .line 114
    return-void
.end method

.method private declared-synchronized W()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "media"

    .line 3
    .line 4
    const-string v1, "[SoundPool]clear all soundInfo "

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/a5g0;->g0:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method


# virtual methods
.method public K()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/hfj;->K()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public X()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a5g0;->W()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/a5g0;->R:Landroid/media/SoundPool;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/a5g0;->S:Landroid/media/MediaPlayer;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/a5g0;->S:Landroid/media/MediaPlayer;

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public c(ILl/hfj;Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/hfj;->I()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget v1, p0, Ll/a5g0;->U:I

    .line 7
    .line 8
    const/high16 v2, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, p0, Ll/a5g0;->U:I

    .line 17
    .line 18
    iput v2, p0, Ll/a5g0;->W:F

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_3

    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-lez v1, :cond_1

    .line 28
    .line 29
    iget v1, p0, Ll/a5g0;->U:I

    .line 30
    .line 31
    int-to-float v1, v1

    .line 32
    mul-float/2addr v1, v2

    .line 33
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    int-to-float v3, v3

    .line 38
    div-float/2addr v1, v3

    .line 39
    iput v1, p0, Ll/a5g0;->W:F

    .line 40
    .line 41
    :cond_1
    :goto_0
    iget v1, p0, Ll/a5g0;->V:I

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iput v1, p0, Ll/a5g0;->V:I

    .line 50
    .line 51
    iput v2, p0, Ll/a5g0;->X:F

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-lez v1, :cond_3

    .line 59
    .line 60
    iget v1, p0, Ll/a5g0;->V:I

    .line 61
    .line 62
    int-to-float v1, v1

    .line 63
    mul-float/2addr v1, v2

    .line 64
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    int-to-float v2, v2

    .line 69
    div-float/2addr v1, v2

    .line 70
    iput v1, p0, Ll/a5g0;->X:F

    .line 71
    .line 72
    :cond_3
    :goto_1
    iget-boolean v1, p0, Ll/a5g0;->H:Z

    .line 73
    .line 74
    if-eqz v1, :cond_5

    .line 75
    .line 76
    iget-wide v1, p0, Ll/a5g0;->T:J

    .line 77
    .line 78
    const-wide/16 v3, 0x0

    .line 79
    .line 80
    cmp-long v1, v1, v3

    .line 81
    .line 82
    if-nez v1, :cond_4

    .line 83
    .line 84
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 85
    .line 86
    .line 87
    move-result-wide v1

    .line 88
    iput-wide v1, p0, Ll/a5g0;->T:J

    .line 89
    .line 90
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 91
    .line 92
    .line 93
    move-result-wide v1

    .line 94
    iget-wide v3, p0, Ll/a5g0;->T:J

    .line 95
    .line 96
    sub-long/2addr v1, v3

    .line 97
    invoke-virtual {p0, v1, v2}, Ll/a5g0;->setTimeStamp(J)V

    .line 98
    .line 99
    .line 100
    :cond_5
    iget-object v1, p0, Ll/a5g0;->M:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_6

    .line 111
    .line 112
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    check-cast v2, Ll/xej;

    .line 117
    .line 118
    invoke-virtual {v2}, Ll/xej;->f()V

    .line 119
    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_6
    iget-object v1, p0, Ll/a5g0;->M:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 125
    .line 126
    .line 127
    invoke-super {p0, p1, p2, p3}, Ll/pgk;->c(ILl/hfj;Z)V

    .line 128
    .line 129
    .line 130
    monitor-exit v0

    .line 131
    return-void

    .line 132
    :goto_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    throw p0
.end method

.method public declared-synchronized f()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/a5g0;->I:Ljava/util/concurrent/ConcurrentHashMap;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ll/c5g0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/c5g0;->W()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ll/c5g0;->f()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_2

    .line 33
    :cond_0
    iget-object v0, p0, Ll/a5g0;->a0:Ll/yqe;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/yqe;->f()V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-super {p0}, Ll/pgk;->f()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/a5g0;->N:Ll/kt2;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/hfj;->f()V

    .line 48
    .line 49
    .line 50
    :cond_2
    invoke-virtual {p0}, Ll/a5g0;->X()V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/a5g0;->Z:Ljava/util/List;

    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Ll/a5g0;->Z:Ljava/util/List;

    .line 62
    .line 63
    :cond_3
    iget-object v0, p0, Ll/a5g0;->f0:Ll/iqf0;

    .line 64
    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/pgk;->f()V

    .line 68
    .line 69
    .line 70
    iput-object v1, p0, Ll/a5g0;->f0:Ll/iqf0;

    .line 71
    .line 72
    :cond_4
    iget-object v0, p0, Ll/a5g0;->M:Ljava/util/List;

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-lez v0, :cond_5

    .line 81
    .line 82
    iget-object v0, p0, Ll/a5g0;->M:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_5

    .line 93
    .line 94
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    check-cast v1, Ll/xej;

    .line 99
    .line 100
    invoke-virtual {v1}, Ll/xej;->f()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_5
    monitor-exit p0

    .line 105
    return-void

    .line 106
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 107
    throw v0
.end method

.method public setTimeStamp(J)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/a5g0;->I:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/c5g0;

    .line 22
    .line 23
    invoke-virtual {v1, p1, p2}, Ll/c5g0;->setTimeStamp(J)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-boolean v0, p0, Ll/a5g0;->H:Z

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ll/lrw;->j()Ll/lrw;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/lrw;->h()Lcom/immomo/components/interfaces/IProcessOutput;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/l5g0;->d(Lcom/immomo/components/interfaces/IProcessOutput;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Ll/a5g0;->a0:Ll/yqe;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    iget-wide v0, p0, Ll/a5g0;->e0:J

    .line 47
    .line 48
    const-wide/16 v2, 0x0

    .line 49
    .line 50
    cmp-long v0, v0, v2

    .line 51
    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 55
    .line 56
    .line 57
    move-result-wide v0

    .line 58
    iput-wide v0, p0, Ll/a5g0;->e0:J

    .line 59
    .line 60
    :cond_2
    iget-object v0, p0, Ll/a5g0;->a0:Ll/yqe;

    .line 61
    .line 62
    iget-wide v1, p0, Ll/a5g0;->e0:J

    .line 63
    .line 64
    sub-long/2addr p1, v1

    .line 65
    invoke-virtual {v0, p1, p2}, Ll/yqe;->setTimeStamp(J)V

    .line 66
    .line 67
    .line 68
    :cond_3
    return-void
.end method
