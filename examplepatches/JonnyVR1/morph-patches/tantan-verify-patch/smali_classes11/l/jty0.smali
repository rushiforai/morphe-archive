.class public final Ll/jty0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kry0;


# static fields
.field public static final X:Ljava/lang/Object;

.field public static Y:Ljava/util/concurrent/ExecutorService;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "releaseExecutorLock"
    .end annotation

    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public static Z:I
    .annotation build Landroidx/annotation/GuardedBy;
        value = "releaseExecutorLock"
    .end annotation
.end field


# instance fields
.field public A:J

.field public B:I

.field public C:Z

.field public D:Z

.field public E:J

.field public F:F

.field public G:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public H:I

.field public I:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public J:Z

.field public K:Z

.field public L:Z

.field public M:I

.field public N:Ll/z8y0;

.field public O:Ll/dsy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public P:J

.field public Q:Z

.field public R:Z

.field public S:J

.field public T:J

.field public U:Landroid/os/Handler;

.field public final V:Ll/hsy0;

.field public final W:Ll/xry0;

.field public final a:Ll/ury0;

.field public final b:Ll/tty0;

.field public final c:Lcom/google/android/gms/internal/ads/zzgaa;

.field public final d:Lcom/google/android/gms/internal/ads/zzgaa;

.field public final e:Ll/bjv0;

.field public final f:Ll/sry0;

.field public final g:Ljava/util/ArrayDeque;

.field public h:Ll/hty0;

.field public final i:Ll/ksy0;

.field public final j:Ll/ksy0;

.field public final k:Ll/esy0;

.field public l:Ll/voy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public m:Ll/nqy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public n:Ll/gsy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public o:Ll/gsy0;

.field public p:Ll/gpu0;

.field public q:Landroid/media/AudioTrack;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public r:Ll/zoy0;

.field public s:Ll/w3y0;

.field public t:Ll/jsy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public u:Ll/jsy0;

.field public v:Ll/iet0;

.field public w:Z

.field public x:J

.field public y:J

.field public z:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/jty0;->X:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/fsy0;Ll/ity0;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object p2, Ll/w3y0;->b:Ll/w3y0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jty0;->s:Ll/w3y0;

    .line 7
    .line 8
    invoke-static {p1}, Ll/fsy0;->a(Ll/fsy0;)Ll/zoy0;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iput-object p2, p0, Ll/jty0;->r:Ll/zoy0;

    .line 13
    .line 14
    invoke-static {p1}, Ll/fsy0;->f(Ll/fsy0;)Ll/hsy0;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    iput-object p2, p0, Ll/jty0;->V:Ll/hsy0;

    .line 19
    .line 20
    sget p2, Ll/mpw0;->a:I

    .line 21
    .line 22
    invoke-static {p1}, Ll/fsy0;->b(Ll/fsy0;)Ll/esy0;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iput-object p2, p0, Ll/jty0;->k:Ll/esy0;

    .line 27
    .line 28
    invoke-static {p1}, Ll/fsy0;->g(Ll/fsy0;)Ll/xry0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/jty0;->W:Ll/xry0;

    .line 36
    .line 37
    new-instance p1, Ll/bjv0;

    .line 38
    .line 39
    sget-object p2, Ll/mfv0;->a:Ll/mfv0;

    .line 40
    .line 41
    invoke-direct {p1, p2}, Ll/bjv0;-><init>(Ll/mfv0;)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Ll/jty0;->e:Ll/bjv0;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/bjv0;->e()Z

    .line 47
    .line 48
    .line 49
    new-instance p1, Ll/sry0;

    .line 50
    .line 51
    new-instance p2, Ll/msy0;

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-direct {p2, p0, v0}, Ll/msy0;-><init>(Ll/jty0;Ll/lsy0;)V

    .line 55
    .line 56
    .line 57
    invoke-direct {p1, p2}, Ll/sry0;-><init>(Ll/qry0;)V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Ll/jty0;->f:Ll/sry0;

    .line 61
    .line 62
    new-instance p1, Ll/ury0;

    .line 63
    .line 64
    invoke-direct {p1}, Ll/ury0;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Ll/jty0;->a:Ll/ury0;

    .line 68
    .line 69
    new-instance p2, Ll/tty0;

    .line 70
    .line 71
    invoke-direct {p2}, Ll/tty0;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object p2, p0, Ll/jty0;->b:Ll/tty0;

    .line 75
    .line 76
    new-instance v0, Ll/sxu0;

    .line 77
    .line 78
    invoke-direct {v0}, Ll/sxu0;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {v0, p1, p2}, Lcom/google/android/gms/internal/ads/zzgaa;->zzo(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Ll/jty0;->c:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 86
    .line 87
    new-instance p1, Ll/sty0;

    .line 88
    .line 89
    invoke-direct {p1}, Ll/sty0;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-static {p1}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Ll/jty0;->d:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 97
    .line 98
    const/high16 p1, 0x3f800000    # 1.0f

    .line 99
    .line 100
    iput p1, p0, Ll/jty0;->F:F

    .line 101
    .line 102
    const/4 p1, 0x0

    .line 103
    iput p1, p0, Ll/jty0;->M:I

    .line 104
    .line 105
    new-instance p2, Ll/z8y0;

    .line 106
    .line 107
    const/4 v0, 0x0

    .line 108
    invoke-direct {p2, p1, v0}, Ll/z8y0;-><init>(IF)V

    .line 109
    .line 110
    .line 111
    iput-object p2, p0, Ll/jty0;->N:Ll/z8y0;

    .line 112
    .line 113
    new-instance v1, Ll/jsy0;

    .line 114
    .line 115
    sget-object v2, Ll/iet0;->d:Ll/iet0;

    .line 116
    .line 117
    const-wide/16 v5, 0x0

    .line 118
    .line 119
    const/4 v7, 0x0

    .line 120
    const-wide/16 v3, 0x0

    .line 121
    .line 122
    invoke-direct/range {v1 .. v7}, Ll/jsy0;-><init>(Ll/iet0;JJLl/isy0;)V

    .line 123
    .line 124
    .line 125
    iput-object v1, p0, Ll/jty0;->u:Ll/jsy0;

    .line 126
    .line 127
    iput-object v2, p0, Ll/jty0;->v:Ll/iet0;

    .line 128
    .line 129
    iput-boolean p1, p0, Ll/jty0;->w:Z

    .line 130
    .line 131
    new-instance p1, Ljava/util/ArrayDeque;

    .line 132
    .line 133
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 134
    .line 135
    .line 136
    iput-object p1, p0, Ll/jty0;->g:Ljava/util/ArrayDeque;

    .line 137
    .line 138
    new-instance p1, Ll/ksy0;

    .line 139
    .line 140
    const-wide/16 v0, 0x64

    .line 141
    .line 142
    invoke-direct {p1, v0, v1}, Ll/ksy0;-><init>(J)V

    .line 143
    .line 144
    .line 145
    iput-object p1, p0, Ll/jty0;->i:Ll/ksy0;

    .line 146
    .line 147
    new-instance p1, Ll/ksy0;

    .line 148
    .line 149
    invoke-direct {p1, v0, v1}, Ll/ksy0;-><init>(J)V

    .line 150
    .line 151
    .line 152
    iput-object p1, p0, Ll/jty0;->j:Ll/ksy0;

    .line 153
    .line 154
    return-void
.end method

.method public static M(Landroid/media/AudioTrack;)Z
    .locals 2

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/emd;->a(Landroid/media/AudioTrack;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static bridge synthetic q(Ll/jty0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/jty0;->P:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic s(Ll/jty0;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jty0;->z()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static bridge synthetic t(Ll/jty0;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jty0;->A()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static bridge synthetic u(Ll/jty0;)Landroid/media/AudioTrack;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic v(Ll/jty0;)Ll/nqy0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jty0;->m:Ll/nqy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w(Ll/jty0;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/jty0;->T:J

    .line 2
    .line 3
    const-wide/32 v2, 0xf4240

    .line 4
    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    if-ltz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/jty0;->m:Ll/nqy0;

    .line 11
    .line 12
    check-cast v0, Ll/oty0;

    .line 13
    .line 14
    iget-object v0, v0, Ll/oty0;->a:Ll/pty0;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-static {v0, v1}, Ll/pty0;->V0(Ll/pty0;Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const-wide/16 v0, 0x0

    .line 21
    .line 22
    iput-wide v0, p0, Ll/jty0;->T:J

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic x(Landroid/media/AudioTrack;Ll/nqy0;Landroid/os/Handler;Ll/jqy0;Ll/bjv0;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Landroid/media/AudioTrack;->flush()V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/AudioTrack;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Thread;->isAlive()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    new-instance p0, Ll/zry0;

    .line 25
    .line 26
    invoke-direct {p0, p1, p3}, Ll/zry0;-><init>(Ll/nqy0;Ll/jqy0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-virtual {p4}, Ll/bjv0;->e()Z

    .line 33
    .line 34
    .line 35
    sget-object p0, Ll/jty0;->X:Ljava/lang/Object;

    .line 36
    .line 37
    monitor-enter p0

    .line 38
    :try_start_1
    sget p1, Ll/jty0;->Z:I

    .line 39
    .line 40
    add-int/lit8 p1, p1, -0x1

    .line 41
    .line 42
    sput p1, Ll/jty0;->Z:I

    .line 43
    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    sget-object p1, Ll/jty0;->Y:Ljava/util/concurrent/ExecutorService;

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 49
    .line 50
    .line 51
    sput-object v0, Ll/jty0;->Y:Ljava/util/concurrent/ExecutorService;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catchall_0
    move-exception p1

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    :goto_0
    monitor-exit p0

    .line 57
    return-void

    .line 58
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    throw p1

    .line 60
    :catchall_1
    move-exception p0

    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Ljava/lang/Thread;->isAlive()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    new-instance v1, Ll/zry0;

    .line 78
    .line 79
    invoke-direct {v1, p1, p3}, Ll/zry0;-><init>(Ll/nqy0;Ll/jqy0;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 83
    .line 84
    .line 85
    :cond_2
    invoke-virtual {p4}, Ll/bjv0;->e()Z

    .line 86
    .line 87
    .line 88
    sget-object p1, Ll/jty0;->X:Ljava/lang/Object;

    .line 89
    .line 90
    monitor-enter p1

    .line 91
    :try_start_2
    sget p2, Ll/jty0;->Z:I

    .line 92
    .line 93
    add-int/lit8 p2, p2, -0x1

    .line 94
    .line 95
    sput p2, Ll/jty0;->Z:I

    .line 96
    .line 97
    if-nez p2, :cond_3

    .line 98
    .line 99
    sget-object p2, Ll/jty0;->Y:Ljava/util/concurrent/ExecutorService;

    .line 100
    .line 101
    invoke-interface {p2}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 102
    .line 103
    .line 104
    sput-object v0, Ll/jty0;->Y:Ljava/util/concurrent/ExecutorService;

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :catchall_2
    move-exception p0

    .line 108
    goto :goto_3

    .line 109
    :cond_3
    :goto_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 110
    throw p0

    .line 111
    :goto_3
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 112
    throw p0
.end method

.method public static bridge synthetic y(Ll/jty0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jty0;->L:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public final A()J
    .locals 7

    .line 1
    iget-object v0, p0, Ll/jty0;->o:Ll/gsy0;

    .line 2
    .line 3
    iget v1, v0, Ll/gsy0;->c:I

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-wide v1, p0, Ll/jty0;->z:J

    .line 8
    .line 9
    iget p0, v0, Ll/gsy0;->d:I

    .line 10
    .line 11
    int-to-long v3, p0

    .line 12
    sget p0, Ll/mpw0;->a:I

    .line 13
    .line 14
    add-long/2addr v1, v3

    .line 15
    const-wide/16 v5, -0x1

    .line 16
    .line 17
    add-long/2addr v1, v5

    .line 18
    div-long/2addr v1, v3

    .line 19
    return-wide v1

    .line 20
    :cond_0
    iget-wide v0, p0, Ll/jty0;->A:J

    .line 21
    .line 22
    return-wide v0
.end method

.method public final B(Ll/gsy0;)Landroid/media/AudioTrack;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzpx;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/jty0;->s:Ll/w3y0;

    .line 2
    .line 3
    iget v1, p0, Ll/jty0;->M:I

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Ll/gsy0;->a(Ll/w3y0;I)Landroid/media/AudioTrack;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzpx; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    move-exception p1

    .line 11
    iget-object p0, p0, Ll/jty0;->m:Ll/nqy0;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-interface {p0, p1}, Ll/nqy0;->b(Ljava/lang/Exception;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    throw p1
.end method

.method public final C(J)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/jty0;->N()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/jty0;->V:Ll/hsy0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/jty0;->v:Ll/iet0;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/hsy0;->c(Ll/iet0;)Ll/iet0;

    .line 12
    .line 13
    .line 14
    :goto_0
    move-object v3, v1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    sget-object v1, Ll/iet0;->d:Ll/iet0;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :goto_1
    iput-object v3, p0, Ll/jty0;->v:Ll/iet0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/jty0;->N()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Ll/jty0;->V:Ll/hsy0;

    .line 28
    .line 29
    iget-boolean v1, p0, Ll/jty0;->w:Z

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/hsy0;->d(Z)Z

    .line 32
    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_1
    const/4 v1, 0x0

    .line 36
    :goto_2
    iput-boolean v1, p0, Ll/jty0;->w:Z

    .line 37
    .line 38
    iget-object v0, p0, Ll/jty0;->g:Ljava/util/ArrayDeque;

    .line 39
    .line 40
    new-instance v2, Ll/jsy0;

    .line 41
    .line 42
    const-wide/16 v4, 0x0

    .line 43
    .line 44
    invoke-static {v4, v5, p1, p2}, Ljava/lang/Math;->max(JJ)J

    .line 45
    .line 46
    .line 47
    move-result-wide v4

    .line 48
    iget-object p1, p0, Ll/jty0;->o:Ll/gsy0;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/jty0;->A()J

    .line 51
    .line 52
    .line 53
    move-result-wide v6

    .line 54
    iget p1, p1, Ll/gsy0;->e:I

    .line 55
    .line 56
    invoke-static {v6, v7, p1}, Ll/mpw0;->G(JI)J

    .line 57
    .line 58
    .line 59
    move-result-wide v6

    .line 60
    const/4 v8, 0x0

    .line 61
    invoke-direct/range {v2 .. v8}, Ll/jsy0;-><init>(Ll/iet0;JJLl/isy0;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/jty0;->I()V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/jty0;->m:Ll/nqy0;

    .line 71
    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    iget-boolean p0, p0, Ll/jty0;->w:Z

    .line 75
    .line 76
    check-cast p1, Ll/oty0;

    .line 77
    .line 78
    iget-object p1, p1, Ll/oty0;->a:Ll/pty0;

    .line 79
    .line 80
    invoke-static {p1}, Ll/pty0;->U0(Ll/pty0;)Ll/fqy0;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1, p0}, Ll/fqy0;->w(Z)V

    .line 85
    .line 86
    .line 87
    :cond_2
    return-void
.end method

.method public final D()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jty0;->o:Ll/gsy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gsy0;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/jty0;->Q:Z

    .line 12
    .line 13
    return-void
.end method

.method public final E()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/jty0;->K:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/jty0;->K:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/jty0;->f:Ll/sry0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/jty0;->A()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-virtual {v0, v1, v2}, Ll/sry0;->b(J)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/media/AudioTrack;->stop()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final F(J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzqa;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jty0;->p:Ll/gpu0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gpu0;->h()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    :goto_0
    iget-object v0, p0, Ll/jty0;->p:Ll/gpu0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/gpu0;->g()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/jty0;->p:Ll/gpu0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/gpu0;->b()Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, v0, p1, p2}, Ll/jty0;->J(Ljava/nio/ByteBuffer;J)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iget-object v0, p0, Ll/jty0;->G:Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    iget-object v0, p0, Ll/jty0;->p:Ll/gpu0;

    .line 50
    .line 51
    iget-object v1, p0, Ll/jty0;->G:Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/gpu0;->e(Ljava/nio/ByteBuffer;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    :goto_1
    return-void

    .line 58
    :cond_3
    iget-object v0, p0, Ll/jty0;->G:Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    if-nez v0, :cond_4

    .line 61
    .line 62
    sget-object v0, Ll/wsu0;->a:Ljava/nio/ByteBuffer;

    .line 63
    .line 64
    :cond_4
    invoke-virtual {p0, v0, p1, p2}, Ll/jty0;->J(Ljava/nio/ByteBuffer;J)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final G(Ll/iet0;)V
    .locals 7

    .line 1
    new-instance v0, Ll/jsy0;

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    const/4 v6, 0x0

    .line 9
    move-wide v4, v2

    .line 10
    move-object v1, p1

    .line 11
    invoke-direct/range {v0 .. v6}, Ll/jsy0;-><init>(Ll/iet0;JJLl/isy0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/jty0;->L()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iput-object v0, p0, Ll/jty0;->t:Ll/jsy0;

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iput-object v0, p0, Ll/jty0;->u:Ll/jsy0;

    .line 24
    .line 25
    return-void
.end method

.method public final H()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jty0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget v0, Ll/mpw0;->a:I

    .line 9
    .line 10
    iget-object v0, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 11
    .line 12
    iget p0, p0, Ll/jty0;->F:F

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Landroid/media/AudioTrack;->setVolume(F)I

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final I()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jty0;->o:Ll/gsy0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/gsy0;->i:Ll/gpu0;

    .line 4
    .line 5
    iput-object v0, p0, Ll/jty0;->p:Ll/gpu0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/gpu0;->c()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final J(Ljava/nio/ByteBuffer;J)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzqa;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    goto/16 :goto_4

    .line 8
    .line 9
    :cond_0
    iget-object p2, p0, Ll/jty0;->I:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    const/4 p3, 0x0

    .line 12
    const/4 v0, 0x1

    .line 13
    if-eqz p2, :cond_2

    .line 14
    .line 15
    if-ne p2, p1, :cond_1

    .line 16
    .line 17
    move p2, v0

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    move p2, p3

    .line 20
    :goto_0
    invoke-static {p2}, Ll/lev0;->d(Z)V

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_2
    iput-object p1, p0, Ll/jty0;->I:Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    sget p2, Ll/mpw0;->a:I

    .line 27
    .line 28
    :goto_1
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    sget v1, Ll/mpw0;->a:I

    .line 33
    .line 34
    iget-object v1, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 35
    .line 36
    invoke-virtual {v1, p1, p2, v0}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 41
    .line 42
    .line 43
    move-result-wide v2

    .line 44
    iput-wide v2, p0, Ll/jty0;->P:J

    .line 45
    .line 46
    const-wide/16 v2, 0x0

    .line 47
    .line 48
    if-gez v1, :cond_9

    .line 49
    .line 50
    sget p1, Ll/mpw0;->a:I

    .line 51
    .line 52
    const/16 p2, 0x18

    .line 53
    .line 54
    if-lt p1, p2, :cond_3

    .line 55
    .line 56
    const/4 p1, -0x6

    .line 57
    if-eq v1, p1, :cond_4

    .line 58
    .line 59
    :cond_3
    const/16 p1, -0x20

    .line 60
    .line 61
    if-ne v1, p1, :cond_6

    .line 62
    .line 63
    :cond_4
    invoke-virtual {p0}, Ll/jty0;->A()J

    .line 64
    .line 65
    .line 66
    move-result-wide p1

    .line 67
    cmp-long p1, p1, v2

    .line 68
    .line 69
    if-lez p1, :cond_5

    .line 70
    .line 71
    :goto_2
    move p3, v0

    .line 72
    goto :goto_3

    .line 73
    :cond_5
    iget-object p1, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 74
    .line 75
    invoke-static {p1}, Ll/jty0;->M(Landroid/media/AudioTrack;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_6

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/jty0;->D()V

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_6
    :goto_3
    new-instance p1, Lcom/google/android/gms/internal/ads/zzqa;

    .line 86
    .line 87
    iget-object p2, p0, Ll/jty0;->o:Ll/gsy0;

    .line 88
    .line 89
    iget-object p2, p2, Ll/gsy0;->a:Ll/sqr0;

    .line 90
    .line 91
    invoke-direct {p1, v1, p2, p3}, Lcom/google/android/gms/internal/ads/zzqa;-><init>(ILl/sqr0;Z)V

    .line 92
    .line 93
    .line 94
    iget-object p2, p0, Ll/jty0;->m:Ll/nqy0;

    .line 95
    .line 96
    if-eqz p2, :cond_7

    .line 97
    .line 98
    invoke-interface {p2, p1}, Ll/nqy0;->b(Ljava/lang/Exception;)V

    .line 99
    .line 100
    .line 101
    :cond_7
    iget-boolean p2, p1, Lcom/google/android/gms/internal/ads/zzqa;->zzb:Z

    .line 102
    .line 103
    if-nez p2, :cond_8

    .line 104
    .line 105
    iget-object p0, p0, Ll/jty0;->j:Ll/ksy0;

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Ll/ksy0;->b(Ljava/lang/Exception;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_8
    sget-object p2, Ll/zoy0;->c:Ll/zoy0;

    .line 112
    .line 113
    iput-object p2, p0, Ll/jty0;->r:Ll/zoy0;

    .line 114
    .line 115
    throw p1

    .line 116
    :cond_9
    iget-object v4, p0, Ll/jty0;->j:Ll/ksy0;

    .line 117
    .line 118
    invoke-virtual {v4}, Ll/ksy0;->a()V

    .line 119
    .line 120
    .line 121
    iget-object v4, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 122
    .line 123
    invoke-static {v4}, Ll/jty0;->M(Landroid/media/AudioTrack;)Z

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    if-eqz v4, :cond_b

    .line 128
    .line 129
    iget-wide v4, p0, Ll/jty0;->A:J

    .line 130
    .line 131
    cmp-long v2, v4, v2

    .line 132
    .line 133
    if-lez v2, :cond_a

    .line 134
    .line 135
    iput-boolean p3, p0, Ll/jty0;->R:Z

    .line 136
    .line 137
    :cond_a
    iget-boolean v2, p0, Ll/jty0;->L:Z

    .line 138
    .line 139
    if-eqz v2, :cond_b

    .line 140
    .line 141
    iget-object v2, p0, Ll/jty0;->m:Ll/nqy0;

    .line 142
    .line 143
    if-eqz v2, :cond_b

    .line 144
    .line 145
    if-ge v1, p2, :cond_b

    .line 146
    .line 147
    check-cast v2, Ll/oty0;

    .line 148
    .line 149
    iget-object v2, v2, Ll/oty0;->a:Ll/pty0;

    .line 150
    .line 151
    invoke-static {v2}, Ll/pty0;->T0(Ll/pty0;)Ll/sey0;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    if-eqz v3, :cond_b

    .line 156
    .line 157
    invoke-static {v2}, Ll/pty0;->T0(Ll/pty0;)Ll/sey0;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-interface {v2}, Ll/sey0;->zza()V

    .line 162
    .line 163
    .line 164
    :cond_b
    iget-object v2, p0, Ll/jty0;->o:Ll/gsy0;

    .line 165
    .line 166
    iget v2, v2, Ll/gsy0;->c:I

    .line 167
    .line 168
    if-nez v2, :cond_c

    .line 169
    .line 170
    iget-wide v3, p0, Ll/jty0;->z:J

    .line 171
    .line 172
    int-to-long v5, v1

    .line 173
    add-long/2addr v3, v5

    .line 174
    iput-wide v3, p0, Ll/jty0;->z:J

    .line 175
    .line 176
    :cond_c
    if-ne v1, p2, :cond_f

    .line 177
    .line 178
    if-eqz v2, :cond_e

    .line 179
    .line 180
    iget-object p2, p0, Ll/jty0;->G:Ljava/nio/ByteBuffer;

    .line 181
    .line 182
    if-ne p1, p2, :cond_d

    .line 183
    .line 184
    move p3, v0

    .line 185
    :cond_d
    invoke-static {p3}, Ll/lev0;->f(Z)V

    .line 186
    .line 187
    .line 188
    iget-wide p1, p0, Ll/jty0;->A:J

    .line 189
    .line 190
    iget p3, p0, Ll/jty0;->B:I

    .line 191
    .line 192
    int-to-long v0, p3

    .line 193
    iget p3, p0, Ll/jty0;->H:I

    .line 194
    .line 195
    int-to-long v2, p3

    .line 196
    mul-long/2addr v0, v2

    .line 197
    add-long/2addr p1, v0

    .line 198
    iput-wide p1, p0, Ll/jty0;->A:J

    .line 199
    .line 200
    :cond_e
    const/4 p1, 0x0

    .line 201
    iput-object p1, p0, Ll/jty0;->I:Ljava/nio/ByteBuffer;

    .line 202
    .line 203
    :cond_f
    :goto_4
    return-void
.end method

.method public final K()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzqa;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jty0;->p:Ll/gpu0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gpu0;->h()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-wide/high16 v1, -0x8000000000000000L

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/4 v4, 0x1

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ll/jty0;->I:Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return v4

    .line 18
    :cond_0
    invoke-virtual {p0, v0, v1, v2}, Ll/jty0;->J(Ljava/nio/ByteBuffer;J)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/jty0;->I:Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    return v4

    .line 26
    :cond_1
    return v3

    .line 27
    :cond_2
    iget-object v0, p0, Ll/jty0;->p:Ll/gpu0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/gpu0;->d()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1, v2}, Ll/jty0;->F(J)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/jty0;->p:Ll/gpu0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/gpu0;->g()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_4

    .line 42
    .line 43
    iget-object p0, p0, Ll/jty0;->I:Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    return v3

    .line 54
    :cond_3
    return v4

    .line 55
    :cond_4
    return v3
.end method

.method public final L()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final N()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jty0;->o:Ll/gsy0;

    .line 2
    .line 3
    iget v0, p0, Ll/gsy0;->c:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/gsy0;->a:Ll/sqr0;

    .line 8
    .line 9
    iget p0, p0, Ll/sqr0;->A:I

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final a(Ll/sqr0;)I
    .locals 3

    .line 1
    const-string v0, "audio/raw"

    .line 2
    .line 3
    iget-object v1, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x2

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget p0, p1, Ll/sqr0;->A:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/mpw0;->h(I)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    iget p1, p1, Ll/sqr0;->A:I

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    new-instance p0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v0, "Invalid PCM encoding: "

    .line 26
    .line 27
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p1, "DefaultAudioSink"

    .line 38
    .line 39
    invoke-static {p1, p0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return v1

    .line 43
    :cond_0
    if-eq p1, v2, :cond_1

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    return v2

    .line 48
    :cond_2
    iget-object v0, p0, Ll/jty0;->r:Ll/zoy0;

    .line 49
    .line 50
    iget-object p0, p0, Ll/jty0;->s:Ll/w3y0;

    .line 51
    .line 52
    invoke-virtual {v0, p1, p0}, Ll/zoy0;->a(Ll/sqr0;Ll/w3y0;)Landroid/util/Pair;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    if-eqz p0, :cond_3

    .line 57
    .line 58
    return v2

    .line 59
    :cond_3
    return v1
.end method

.method public final b(Ll/sqr0;)Ll/fpy0;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/jty0;->Q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/fpy0;->d:Ll/fpy0;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/jty0;->W:Ll/xry0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/jty0;->s:Ll/w3y0;

    .line 11
    .line 12
    invoke-virtual {v0, p1, p0}, Ll/xry0;->a(Ll/sqr0;Ll/w3y0;)Ll/fpy0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final c(Ll/sqr0;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jty0;->a(Ll/sqr0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final d(Ljava/nio/ByteBuffer;JI)Z
    .locals 30
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzpx;,
            Lcom/google/android/gms/internal/ads/zzqa;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-wide/from16 v3, p2

    .line 6
    .line 7
    move/from16 v5, p4

    .line 8
    .line 9
    iget-object v0, v1, Ll/jty0;->G:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    const/4 v7, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    if-ne v2, v0, :cond_1

    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v0, v7

    .line 19
    :goto_0
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, v1, Ll/jty0;->n:Ll/gsy0;

    .line 23
    .line 24
    const/4 v8, 0x0

    .line 25
    if-eqz v0, :cond_6

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/jty0;->K()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    return v7

    .line 34
    :cond_2
    iget-object v0, v1, Ll/jty0;->n:Ll/gsy0;

    .line 35
    .line 36
    iget-object v9, v1, Ll/jty0;->o:Ll/gsy0;

    .line 37
    .line 38
    iget v10, v9, Ll/gsy0;->c:I

    .line 39
    .line 40
    iget v11, v0, Ll/gsy0;->c:I

    .line 41
    .line 42
    if-ne v10, v11, :cond_3

    .line 43
    .line 44
    iget v10, v9, Ll/gsy0;->g:I

    .line 45
    .line 46
    iget v11, v0, Ll/gsy0;->g:I

    .line 47
    .line 48
    if-ne v10, v11, :cond_3

    .line 49
    .line 50
    iget v10, v9, Ll/gsy0;->e:I

    .line 51
    .line 52
    iget v11, v0, Ll/gsy0;->e:I

    .line 53
    .line 54
    if-ne v10, v11, :cond_3

    .line 55
    .line 56
    iget v10, v9, Ll/gsy0;->f:I

    .line 57
    .line 58
    iget v11, v0, Ll/gsy0;->f:I

    .line 59
    .line 60
    if-ne v10, v11, :cond_3

    .line 61
    .line 62
    iget v9, v9, Ll/gsy0;->d:I

    .line 63
    .line 64
    iget v10, v0, Ll/gsy0;->d:I

    .line 65
    .line 66
    if-ne v9, v10, :cond_3

    .line 67
    .line 68
    iput-object v0, v1, Ll/jty0;->o:Ll/gsy0;

    .line 69
    .line 70
    iput-object v8, v1, Ll/jty0;->n:Ll/gsy0;

    .line 71
    .line 72
    iget-object v0, v1, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    invoke-static {v0}, Ll/jty0;->M(Landroid/media/AudioTrack;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_5

    .line 81
    .line 82
    iget-object v0, v1, Ll/jty0;->o:Ll/gsy0;

    .line 83
    .line 84
    iget-boolean v0, v0, Ll/gsy0;->k:Z

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_3
    invoke-virtual {v1}, Ll/jty0;->E()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Ll/jty0;->g()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    return v7

    .line 97
    :cond_4
    invoke-virtual {v1}, Ll/jty0;->zzf()V

    .line 98
    .line 99
    .line 100
    :cond_5
    :goto_1
    invoke-virtual {v1, v3, v4}, Ll/jty0;->C(J)V

    .line 101
    .line 102
    .line 103
    :cond_6
    invoke-virtual {v1}, Ll/jty0;->L()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    const/16 v9, 0x1f

    .line 108
    .line 109
    if-eqz v0, :cond_7

    .line 110
    .line 111
    goto/16 :goto_6

    .line 112
    .line 113
    :cond_7
    :try_start_0
    iget-object v0, v1, Ll/jty0;->e:Ll/bjv0;

    .line 114
    .line 115
    invoke-virtual {v0}, Ll/bjv0;->d()Z

    .line 116
    .line 117
    .line 118
    move-result v0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzpx; {:try_start_0 .. :try_end_0} :catch_1

    .line 119
    if-nez v0, :cond_8

    .line 120
    .line 121
    return v7

    .line 122
    :cond_8
    :try_start_1
    iget-object v0, v1, Ll/jty0;->o:Ll/gsy0;

    .line 123
    .line 124
    if-eqz v0, :cond_9

    .line 125
    .line 126
    invoke-virtual {v1, v0}, Ll/jty0;->B(Ll/gsy0;)Landroid/media/AudioTrack;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    goto :goto_3

    .line 131
    :catch_0
    move-exception v0

    .line 132
    move-object v11, v0

    .line 133
    goto :goto_2

    .line 134
    :cond_9
    throw v8
    :try_end_1
    .catch Lcom/google/android/gms/internal/ads/zzpx; {:try_start_1 .. :try_end_1} :catch_0

    .line 135
    :goto_2
    :try_start_2
    iget-object v0, v1, Ll/jty0;->o:Ll/gsy0;

    .line 136
    .line 137
    iget v12, v0, Ll/gsy0;->h:I

    .line 138
    .line 139
    const v13, 0xf4240

    .line 140
    .line 141
    .line 142
    if-le v12, v13, :cond_2b

    .line 143
    .line 144
    new-instance v14, Ll/gsy0;

    .line 145
    .line 146
    iget-object v15, v0, Ll/gsy0;->a:Ll/sqr0;

    .line 147
    .line 148
    iget v12, v0, Ll/gsy0;->b:I

    .line 149
    .line 150
    iget v13, v0, Ll/gsy0;->c:I

    .line 151
    .line 152
    iget v8, v0, Ll/gsy0;->d:I

    .line 153
    .line 154
    iget v7, v0, Ll/gsy0;->e:I

    .line 155
    .line 156
    iget v6, v0, Ll/gsy0;->f:I

    .line 157
    .line 158
    iget v10, v0, Ll/gsy0;->g:I

    .line 159
    .line 160
    iget-object v0, v0, Ll/gsy0;->i:Ll/gpu0;

    .line 161
    .line 162
    const/16 v25, 0x0

    .line 163
    .line 164
    const/16 v26, 0x0

    .line 165
    .line 166
    const v22, 0xf4240

    .line 167
    .line 168
    .line 169
    const/16 v24, 0x0

    .line 170
    .line 171
    move-object/from16 v23, v0

    .line 172
    .line 173
    move/from16 v20, v6

    .line 174
    .line 175
    move/from16 v19, v7

    .line 176
    .line 177
    move/from16 v18, v8

    .line 178
    .line 179
    move/from16 v21, v10

    .line 180
    .line 181
    move/from16 v16, v12

    .line 182
    .line 183
    move/from16 v17, v13

    .line 184
    .line 185
    invoke-direct/range {v14 .. v26}, Ll/gsy0;-><init>(Ll/sqr0;IIIIIIILl/gpu0;ZZZ)V
    :try_end_2
    .catch Lcom/google/android/gms/internal/ads/zzpx; {:try_start_2 .. :try_end_2} :catch_1

    .line 186
    .line 187
    .line 188
    :try_start_3
    invoke-virtual {v1, v14}, Ll/jty0;->B(Ll/gsy0;)Landroid/media/AudioTrack;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    iput-object v14, v1, Ll/jty0;->o:Ll/gsy0;
    :try_end_3
    .catch Lcom/google/android/gms/internal/ads/zzpx; {:try_start_3 .. :try_end_3} :catch_2

    .line 193
    .line 194
    :goto_3
    :try_start_4
    iput-object v0, v1, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 195
    .line 196
    invoke-static {v0}, Ll/jty0;->M(Landroid/media/AudioTrack;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-eqz v0, :cond_b

    .line 201
    .line 202
    iget-object v0, v1, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 203
    .line 204
    iget-object v6, v1, Ll/jty0;->h:Ll/hty0;

    .line 205
    .line 206
    if-nez v6, :cond_a

    .line 207
    .line 208
    new-instance v6, Ll/hty0;

    .line 209
    .line 210
    invoke-direct {v6, v1}, Ll/hty0;-><init>(Ll/jty0;)V

    .line 211
    .line 212
    .line 213
    iput-object v6, v1, Ll/jty0;->h:Ll/hty0;

    .line 214
    .line 215
    goto :goto_4

    .line 216
    :catch_1
    move-exception v0

    .line 217
    goto/16 :goto_14

    .line 218
    .line 219
    :cond_a
    :goto_4
    iget-object v6, v1, Ll/jty0;->h:Ll/hty0;

    .line 220
    .line 221
    invoke-virtual {v6, v0}, Ll/hty0;->a(Landroid/media/AudioTrack;)V

    .line 222
    .line 223
    .line 224
    iget-object v0, v1, Ll/jty0;->o:Ll/gsy0;

    .line 225
    .line 226
    iget-boolean v0, v0, Ll/gsy0;->k:Z

    .line 227
    .line 228
    :cond_b
    sget v0, Ll/mpw0;->a:I

    .line 229
    .line 230
    if-lt v0, v9, :cond_c

    .line 231
    .line 232
    iget-object v6, v1, Ll/jty0;->l:Ll/voy0;

    .line 233
    .line 234
    if-eqz v6, :cond_c

    .line 235
    .line 236
    iget-object v7, v1, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 237
    .line 238
    invoke-static {v7, v6}, Ll/csy0;->a(Landroid/media/AudioTrack;Ll/voy0;)V

    .line 239
    .line 240
    .line 241
    :cond_c
    iget-object v6, v1, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 242
    .line 243
    invoke-virtual {v6}, Landroid/media/AudioTrack;->getAudioSessionId()I

    .line 244
    .line 245
    .line 246
    move-result v6

    .line 247
    iput v6, v1, Ll/jty0;->M:I

    .line 248
    .line 249
    iget-object v10, v1, Ll/jty0;->f:Ll/sry0;

    .line 250
    .line 251
    iget-object v11, v1, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 252
    .line 253
    iget-object v6, v1, Ll/jty0;->o:Ll/gsy0;

    .line 254
    .line 255
    iget v7, v6, Ll/gsy0;->c:I

    .line 256
    .line 257
    const/4 v8, 0x2

    .line 258
    if-ne v7, v8, :cond_d

    .line 259
    .line 260
    const/4 v12, 0x1

    .line 261
    goto :goto_5

    .line 262
    :cond_d
    const/4 v12, 0x0

    .line 263
    :goto_5
    iget v13, v6, Ll/gsy0;->g:I

    .line 264
    .line 265
    iget v14, v6, Ll/gsy0;->d:I

    .line 266
    .line 267
    iget v15, v6, Ll/gsy0;->h:I

    .line 268
    .line 269
    invoke-virtual/range {v10 .. v15}, Ll/sry0;->d(Landroid/media/AudioTrack;ZIII)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v1}, Ll/jty0;->H()V

    .line 273
    .line 274
    .line 275
    iget-object v6, v1, Ll/jty0;->N:Ll/z8y0;

    .line 276
    .line 277
    iget v6, v6, Ll/z8y0;->a:I

    .line 278
    .line 279
    iget-object v6, v1, Ll/jty0;->O:Ll/dsy0;

    .line 280
    .line 281
    if-eqz v6, :cond_e

    .line 282
    .line 283
    const/16 v7, 0x17

    .line 284
    .line 285
    if-lt v0, v7, :cond_e

    .line 286
    .line 287
    iget-object v0, v1, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 288
    .line 289
    invoke-static {v0, v6}, Ll/bsy0;->a(Landroid/media/AudioTrack;Ll/dsy0;)V

    .line 290
    .line 291
    .line 292
    :cond_e
    const/4 v6, 0x1

    .line 293
    iput-boolean v6, v1, Ll/jty0;->D:Z

    .line 294
    .line 295
    iget-object v0, v1, Ll/jty0;->m:Ll/nqy0;

    .line 296
    .line 297
    if-eqz v0, :cond_f

    .line 298
    .line 299
    iget-object v6, v1, Ll/jty0;->o:Ll/gsy0;

    .line 300
    .line 301
    invoke-virtual {v6}, Ll/gsy0;->b()Ll/jqy0;

    .line 302
    .line 303
    .line 304
    move-result-object v6

    .line 305
    check-cast v0, Ll/oty0;

    .line 306
    .line 307
    iget-object v0, v0, Ll/oty0;->a:Ll/pty0;

    .line 308
    .line 309
    invoke-static {v0}, Ll/pty0;->U0(Ll/pty0;)Ll/fqy0;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    invoke-virtual {v0, v6}, Ll/fqy0;->c(Ll/jqy0;)V
    :try_end_4
    .catch Lcom/google/android/gms/internal/ads/zzpx; {:try_start_4 .. :try_end_4} :catch_1

    .line 314
    .line 315
    .line 316
    :cond_f
    :goto_6
    iget-object v0, v1, Ll/jty0;->i:Ll/ksy0;

    .line 317
    .line 318
    invoke-virtual {v0}, Ll/ksy0;->a()V

    .line 319
    .line 320
    .line 321
    iget-boolean v0, v1, Ll/jty0;->D:Z

    .line 322
    .line 323
    const-wide/16 v6, 0x0

    .line 324
    .line 325
    if-eqz v0, :cond_10

    .line 326
    .line 327
    invoke-static {v6, v7, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 328
    .line 329
    .line 330
    move-result-wide v10

    .line 331
    iput-wide v10, v1, Ll/jty0;->E:J

    .line 332
    .line 333
    const/4 v8, 0x0

    .line 334
    iput-boolean v8, v1, Ll/jty0;->C:Z

    .line 335
    .line 336
    iput-boolean v8, v1, Ll/jty0;->D:Z

    .line 337
    .line 338
    invoke-virtual {v1, v3, v4}, Ll/jty0;->C(J)V

    .line 339
    .line 340
    .line 341
    iget-boolean v0, v1, Ll/jty0;->L:Z

    .line 342
    .line 343
    if-eqz v0, :cond_10

    .line 344
    .line 345
    invoke-virtual {v1}, Ll/jty0;->zzi()V

    .line 346
    .line 347
    .line 348
    :cond_10
    iget-object v0, v1, Ll/jty0;->f:Ll/sry0;

    .line 349
    .line 350
    invoke-virtual {v1}, Ll/jty0;->A()J

    .line 351
    .line 352
    .line 353
    move-result-wide v10

    .line 354
    invoke-virtual {v0, v10, v11}, Ll/sry0;->j(J)Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    if-nez v0, :cond_11

    .line 359
    .line 360
    const/16 v27, 0x0

    .line 361
    .line 362
    return v27

    .line 363
    :cond_11
    iget-object v0, v1, Ll/jty0;->G:Ljava/nio/ByteBuffer;

    .line 364
    .line 365
    if-nez v0, :cond_28

    .line 366
    .line 367
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    .line 368
    .line 369
    .line 370
    move-result-object v0

    .line 371
    sget-object v8, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 372
    .line 373
    if-ne v0, v8, :cond_12

    .line 374
    .line 375
    const/4 v0, 0x1

    .line 376
    goto :goto_7

    .line 377
    :cond_12
    const/4 v0, 0x0

    .line 378
    :goto_7
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 379
    .line 380
    .line 381
    invoke-virtual {v2}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 382
    .line 383
    .line 384
    move-result v0

    .line 385
    if-nez v0, :cond_13

    .line 386
    .line 387
    const/16 v28, 0x1

    .line 388
    .line 389
    return v28

    .line 390
    :cond_13
    iget-object v0, v1, Ll/jty0;->o:Ll/gsy0;

    .line 391
    .line 392
    iget v8, v0, Ll/gsy0;->c:I

    .line 393
    .line 394
    if-eqz v8, :cond_20

    .line 395
    .line 396
    iget v8, v1, Ll/jty0;->B:I

    .line 397
    .line 398
    if-nez v8, :cond_20

    .line 399
    .line 400
    iget v0, v0, Ll/gsy0;->g:I

    .line 401
    .line 402
    const/4 v8, -0x2

    .line 403
    const/16 v10, 0x10

    .line 404
    .line 405
    const/4 v11, -0x1

    .line 406
    const/16 v12, 0x400

    .line 407
    .line 408
    packed-switch v0, :pswitch_data_0

    .line 409
    .line 410
    .line 411
    :pswitch_0
    const-string v1, "Unexpected audio encoding: "

    .line 412
    .line 413
    invoke-static {v1, v0}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 414
    .line 415
    .line 416
    :goto_8
    const/16 v27, 0x0

    .line 417
    .line 418
    return v27

    .line 419
    :pswitch_1
    invoke-static {v2}, Ll/xfr0;->b(Ljava/nio/ByteBuffer;)I

    .line 420
    .line 421
    .line 422
    move-result v0

    .line 423
    :goto_9
    const/16 v28, 0x1

    .line 424
    .line 425
    goto/16 :goto_11

    .line 426
    .line 427
    :pswitch_2
    sget-object v0, Ll/idr0;->a:[I

    .line 428
    .line 429
    new-array v0, v10, [B

    .line 430
    .line 431
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 432
    .line 433
    .line 434
    move-result v8

    .line 435
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 436
    .line 437
    .line 438
    invoke-virtual {v2, v8}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 439
    .line 440
    .line 441
    new-instance v8, Ll/dfw0;

    .line 442
    .line 443
    invoke-direct {v8, v0, v10}, Ll/dfw0;-><init>([BI)V

    .line 444
    .line 445
    .line 446
    invoke-static {v8}, Ll/idr0;->a(Ll/dfw0;)Ll/hdr0;

    .line 447
    .line 448
    .line 449
    move-result-object v0

    .line 450
    iget v0, v0, Ll/hdr0;->c:I

    .line 451
    .line 452
    goto :goto_9

    .line 453
    :goto_a
    :pswitch_3
    move v0, v12

    .line 454
    goto :goto_9

    .line 455
    :pswitch_4
    const/16 v0, 0x200

    .line 456
    .line 457
    goto :goto_9

    .line 458
    :pswitch_5
    sget-object v0, Ll/fdr0;->a:[I

    .line 459
    .line 460
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 461
    .line 462
    .line 463
    move-result v0

    .line 464
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 465
    .line 466
    .line 467
    move-result v9

    .line 468
    add-int/lit8 v9, v9, -0xa

    .line 469
    .line 470
    move v12, v0

    .line 471
    :goto_b
    if-gt v12, v9, :cond_15

    .line 472
    .line 473
    add-int/lit8 v13, v12, 0x4

    .line 474
    .line 475
    invoke-static {v2, v13}, Ll/mpw0;->w(Ljava/nio/ByteBuffer;I)I

    .line 476
    .line 477
    .line 478
    move-result v13

    .line 479
    and-int/2addr v13, v8

    .line 480
    const v14, -0x78d9046

    .line 481
    .line 482
    .line 483
    if-ne v13, v14, :cond_14

    .line 484
    .line 485
    sub-int/2addr v12, v0

    .line 486
    goto :goto_c

    .line 487
    :cond_14
    add-int/lit8 v12, v12, 0x1

    .line 488
    .line 489
    goto :goto_b

    .line 490
    :cond_15
    move v12, v11

    .line 491
    :goto_c
    if-ne v12, v11, :cond_16

    .line 492
    .line 493
    const/4 v0, 0x0

    .line 494
    goto :goto_9

    .line 495
    :cond_16
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 496
    .line 497
    .line 498
    move-result v0

    .line 499
    add-int/2addr v0, v12

    .line 500
    add-int/lit8 v0, v0, 0x7

    .line 501
    .line 502
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 503
    .line 504
    .line 505
    move-result v0

    .line 506
    and-int/lit16 v0, v0, 0xff

    .line 507
    .line 508
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 509
    .line 510
    .line 511
    move-result v8

    .line 512
    add-int/2addr v8, v12

    .line 513
    const/16 v9, 0xbb

    .line 514
    .line 515
    if-ne v0, v9, :cond_17

    .line 516
    .line 517
    const/16 v0, 0x9

    .line 518
    .line 519
    goto :goto_d

    .line 520
    :cond_17
    const/16 v0, 0x8

    .line 521
    .line 522
    :goto_d
    add-int/2addr v8, v0

    .line 523
    invoke-virtual {v2, v8}, Ljava/nio/ByteBuffer;->get(I)B

    .line 524
    .line 525
    .line 526
    move-result v0

    .line 527
    shr-int/lit8 v0, v0, 0x4

    .line 528
    .line 529
    and-int/lit8 v0, v0, 0x7

    .line 530
    .line 531
    const/16 v8, 0x28

    .line 532
    .line 533
    shl-int v0, v8, v0

    .line 534
    .line 535
    mul-int/2addr v0, v10

    .line 536
    goto :goto_9

    .line 537
    :pswitch_6
    const/16 v0, 0x800

    .line 538
    .line 539
    goto :goto_9

    .line 540
    :pswitch_7
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 541
    .line 542
    .line 543
    move-result v0

    .line 544
    invoke-static {v2, v0}, Ll/mpw0;->w(Ljava/nio/ByteBuffer;I)I

    .line 545
    .line 546
    .line 547
    move-result v0

    .line 548
    invoke-static {v0}, Ll/wfr0;->c(I)I

    .line 549
    .line 550
    .line 551
    move-result v0

    .line 552
    if-eq v0, v11, :cond_18

    .line 553
    .line 554
    goto/16 :goto_9

    .line 555
    .line 556
    :cond_18
    invoke-static {}, Ll/fig0;->a()V

    .line 557
    .line 558
    .line 559
    const/4 v10, 0x0

    .line 560
    return v10

    .line 561
    :pswitch_8
    const/4 v10, 0x0

    .line 562
    sget-object v0, Ll/mer0;->a:[I

    .line 563
    .line 564
    invoke-virtual {v2, v10}, Ljava/nio/ByteBuffer;->getInt(I)I

    .line 565
    .line 566
    .line 567
    move-result v0

    .line 568
    const v13, -0xde4bec0

    .line 569
    .line 570
    .line 571
    if-eq v0, v13, :cond_1e

    .line 572
    .line 573
    invoke-virtual {v2, v10}, Ljava/nio/ByteBuffer;->getInt(I)I

    .line 574
    .line 575
    .line 576
    move-result v0

    .line 577
    const v13, -0x17bd3b8f

    .line 578
    .line 579
    .line 580
    if-ne v0, v13, :cond_19

    .line 581
    .line 582
    goto/16 :goto_a

    .line 583
    .line 584
    :cond_19
    invoke-virtual {v2, v10}, Ljava/nio/ByteBuffer;->getInt(I)I

    .line 585
    .line 586
    .line 587
    move-result v0

    .line 588
    const v10, 0x25205864

    .line 589
    .line 590
    .line 591
    if-ne v0, v10, :cond_1a

    .line 592
    .line 593
    const/16 v0, 0x1000

    .line 594
    .line 595
    goto/16 :goto_9

    .line 596
    .line 597
    :cond_1a
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 598
    .line 599
    .line 600
    move-result v0

    .line 601
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 602
    .line 603
    .line 604
    move-result v10

    .line 605
    if-eq v10, v8, :cond_1d

    .line 606
    .line 607
    if-eq v10, v11, :cond_1c

    .line 608
    .line 609
    if-eq v10, v9, :cond_1b

    .line 610
    .line 611
    add-int/lit8 v8, v0, 0x4

    .line 612
    .line 613
    add-int/lit8 v0, v0, 0x5

    .line 614
    .line 615
    invoke-virtual {v2, v8}, Ljava/nio/ByteBuffer;->get(I)B

    .line 616
    .line 617
    .line 618
    move-result v8

    .line 619
    const/16 v28, 0x1

    .line 620
    .line 621
    and-int/lit8 v8, v8, 0x1

    .line 622
    .line 623
    shl-int/lit8 v8, v8, 0x6

    .line 624
    .line 625
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 626
    .line 627
    .line 628
    move-result v0

    .line 629
    and-int/lit16 v0, v0, 0xfc

    .line 630
    .line 631
    const/16 v29, 0x2

    .line 632
    .line 633
    :goto_e
    shr-int/lit8 v0, v0, 0x2

    .line 634
    .line 635
    or-int/2addr v0, v8

    .line 636
    const/16 v28, 0x1

    .line 637
    .line 638
    goto :goto_10

    .line 639
    :cond_1b
    const/16 v29, 0x2

    .line 640
    .line 641
    add-int/lit8 v8, v0, 0x5

    .line 642
    .line 643
    invoke-virtual {v2, v8}, Ljava/nio/ByteBuffer;->get(I)B

    .line 644
    .line 645
    .line 646
    move-result v8

    .line 647
    and-int/lit8 v8, v8, 0x7

    .line 648
    .line 649
    shl-int/lit8 v8, v8, 0x4

    .line 650
    .line 651
    add-int/lit8 v0, v0, 0x6

    .line 652
    .line 653
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 654
    .line 655
    .line 656
    move-result v0

    .line 657
    :goto_f
    and-int/lit8 v0, v0, 0x3c

    .line 658
    .line 659
    goto :goto_e

    .line 660
    :cond_1c
    const/16 v29, 0x2

    .line 661
    .line 662
    add-int/lit8 v8, v0, 0x4

    .line 663
    .line 664
    invoke-virtual {v2, v8}, Ljava/nio/ByteBuffer;->get(I)B

    .line 665
    .line 666
    .line 667
    move-result v8

    .line 668
    and-int/lit8 v8, v8, 0x7

    .line 669
    .line 670
    shl-int/lit8 v8, v8, 0x4

    .line 671
    .line 672
    add-int/lit8 v0, v0, 0x7

    .line 673
    .line 674
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 675
    .line 676
    .line 677
    move-result v0

    .line 678
    goto :goto_f

    .line 679
    :cond_1d
    const/16 v29, 0x2

    .line 680
    .line 681
    add-int/lit8 v8, v0, 0x4

    .line 682
    .line 683
    add-int/lit8 v0, v0, 0x5

    .line 684
    .line 685
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 686
    .line 687
    .line 688
    move-result v0

    .line 689
    const/16 v28, 0x1

    .line 690
    .line 691
    and-int/lit8 v0, v0, 0x1

    .line 692
    .line 693
    shl-int/lit8 v0, v0, 0x6

    .line 694
    .line 695
    invoke-virtual {v2, v8}, Ljava/nio/ByteBuffer;->get(I)B

    .line 696
    .line 697
    .line 698
    move-result v8

    .line 699
    and-int/lit16 v8, v8, 0xfc

    .line 700
    .line 701
    shr-int/lit8 v8, v8, 0x2

    .line 702
    .line 703
    or-int/2addr v0, v8

    .line 704
    :goto_10
    add-int/lit8 v0, v0, 0x1

    .line 705
    .line 706
    mul-int/lit8 v0, v0, 0x20

    .line 707
    .line 708
    goto :goto_11

    .line 709
    :cond_1e
    const/16 v28, 0x1

    .line 710
    .line 711
    move v0, v12

    .line 712
    goto :goto_11

    .line 713
    :pswitch_9
    const/16 v28, 0x1

    .line 714
    .line 715
    invoke-static {v2}, Ll/fdr0;->a(Ljava/nio/ByteBuffer;)I

    .line 716
    .line 717
    .line 718
    move-result v0

    .line 719
    :goto_11
    iput v0, v1, Ll/jty0;->B:I

    .line 720
    .line 721
    if-eqz v0, :cond_1f

    .line 722
    .line 723
    goto :goto_12

    .line 724
    :cond_1f
    return v28

    .line 725
    :cond_20
    :goto_12
    iget-object v0, v1, Ll/jty0;->t:Ll/jsy0;

    .line 726
    .line 727
    if-eqz v0, :cond_22

    .line 728
    .line 729
    invoke-virtual {v1}, Ll/jty0;->K()Z

    .line 730
    .line 731
    .line 732
    move-result v0

    .line 733
    if-nez v0, :cond_21

    .line 734
    .line 735
    const/16 v27, 0x0

    .line 736
    .line 737
    return v27

    .line 738
    :cond_21
    invoke-virtual {v1, v3, v4}, Ll/jty0;->C(J)V

    .line 739
    .line 740
    .line 741
    const/4 v8, 0x0

    .line 742
    iput-object v8, v1, Ll/jty0;->t:Ll/jsy0;

    .line 743
    .line 744
    :cond_22
    iget-wide v8, v1, Ll/jty0;->E:J

    .line 745
    .line 746
    iget-object v0, v1, Ll/jty0;->o:Ll/gsy0;

    .line 747
    .line 748
    invoke-virtual {v1}, Ll/jty0;->z()J

    .line 749
    .line 750
    .line 751
    move-result-wide v10

    .line 752
    iget-object v12, v1, Ll/jty0;->b:Ll/tty0;

    .line 753
    .line 754
    invoke-virtual {v12}, Ll/tty0;->i()J

    .line 755
    .line 756
    .line 757
    move-result-wide v12

    .line 758
    sub-long/2addr v10, v12

    .line 759
    iget-object v0, v0, Ll/gsy0;->a:Ll/sqr0;

    .line 760
    .line 761
    iget v0, v0, Ll/sqr0;->z:I

    .line 762
    .line 763
    invoke-static {v10, v11, v0}, Ll/mpw0;->G(JI)J

    .line 764
    .line 765
    .line 766
    move-result-wide v10

    .line 767
    add-long/2addr v8, v10

    .line 768
    iget-boolean v0, v1, Ll/jty0;->C:Z

    .line 769
    .line 770
    if-nez v0, :cond_24

    .line 771
    .line 772
    sub-long v10, v8, v3

    .line 773
    .line 774
    invoke-static {v10, v11}, Ljava/lang/Math;->abs(J)J

    .line 775
    .line 776
    .line 777
    move-result-wide v10

    .line 778
    const-wide/32 v12, 0x30d40

    .line 779
    .line 780
    .line 781
    cmp-long v0, v10, v12

    .line 782
    .line 783
    if-lez v0, :cond_24

    .line 784
    .line 785
    iget-object v0, v1, Ll/jty0;->m:Ll/nqy0;

    .line 786
    .line 787
    if-eqz v0, :cond_23

    .line 788
    .line 789
    new-instance v10, Lcom/google/android/gms/internal/ads/zzpz;

    .line 790
    .line 791
    invoke-direct {v10, v3, v4, v8, v9}, Lcom/google/android/gms/internal/ads/zzpz;-><init>(JJ)V

    .line 792
    .line 793
    .line 794
    invoke-interface {v0, v10}, Ll/nqy0;->b(Ljava/lang/Exception;)V

    .line 795
    .line 796
    .line 797
    :cond_23
    const/4 v10, 0x1

    .line 798
    iput-boolean v10, v1, Ll/jty0;->C:Z

    .line 799
    .line 800
    :cond_24
    iget-boolean v0, v1, Ll/jty0;->C:Z

    .line 801
    .line 802
    if-eqz v0, :cond_26

    .line 803
    .line 804
    invoke-virtual {v1}, Ll/jty0;->K()Z

    .line 805
    .line 806
    .line 807
    move-result v0

    .line 808
    const/4 v10, 0x0

    .line 809
    if-nez v0, :cond_25

    .line 810
    .line 811
    return v10

    .line 812
    :cond_25
    sub-long v8, v3, v8

    .line 813
    .line 814
    iget-wide v11, v1, Ll/jty0;->E:J

    .line 815
    .line 816
    add-long/2addr v11, v8

    .line 817
    iput-wide v11, v1, Ll/jty0;->E:J

    .line 818
    .line 819
    iput-boolean v10, v1, Ll/jty0;->C:Z

    .line 820
    .line 821
    invoke-virtual {v1, v3, v4}, Ll/jty0;->C(J)V

    .line 822
    .line 823
    .line 824
    iget-object v0, v1, Ll/jty0;->m:Ll/nqy0;

    .line 825
    .line 826
    if-eqz v0, :cond_26

    .line 827
    .line 828
    cmp-long v6, v8, v6

    .line 829
    .line 830
    if-eqz v6, :cond_26

    .line 831
    .line 832
    check-cast v0, Ll/oty0;

    .line 833
    .line 834
    iget-object v0, v0, Ll/oty0;->a:Ll/pty0;

    .line 835
    .line 836
    invoke-virtual {v0}, Ll/pty0;->W0()V

    .line 837
    .line 838
    .line 839
    :cond_26
    iget-object v0, v1, Ll/jty0;->o:Ll/gsy0;

    .line 840
    .line 841
    iget v0, v0, Ll/gsy0;->c:I

    .line 842
    .line 843
    if-nez v0, :cond_27

    .line 844
    .line 845
    iget-wide v6, v1, Ll/jty0;->x:J

    .line 846
    .line 847
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 848
    .line 849
    .line 850
    move-result v0

    .line 851
    int-to-long v8, v0

    .line 852
    add-long/2addr v6, v8

    .line 853
    iput-wide v6, v1, Ll/jty0;->x:J

    .line 854
    .line 855
    goto :goto_13

    .line 856
    :cond_27
    iget-wide v6, v1, Ll/jty0;->y:J

    .line 857
    .line 858
    iget v0, v1, Ll/jty0;->B:I

    .line 859
    .line 860
    int-to-long v8, v0

    .line 861
    int-to-long v10, v5

    .line 862
    mul-long/2addr v8, v10

    .line 863
    add-long/2addr v6, v8

    .line 864
    iput-wide v6, v1, Ll/jty0;->y:J

    .line 865
    .line 866
    :goto_13
    iput-object v2, v1, Ll/jty0;->G:Ljava/nio/ByteBuffer;

    .line 867
    .line 868
    iput v5, v1, Ll/jty0;->H:I

    .line 869
    .line 870
    :cond_28
    invoke-virtual {v1, v3, v4}, Ll/jty0;->F(J)V

    .line 871
    .line 872
    .line 873
    iget-object v0, v1, Ll/jty0;->G:Ljava/nio/ByteBuffer;

    .line 874
    .line 875
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 876
    .line 877
    .line 878
    move-result v0

    .line 879
    if-nez v0, :cond_29

    .line 880
    .line 881
    const/4 v8, 0x0

    .line 882
    iput-object v8, v1, Ll/jty0;->G:Ljava/nio/ByteBuffer;

    .line 883
    .line 884
    const/4 v10, 0x0

    .line 885
    iput v10, v1, Ll/jty0;->H:I

    .line 886
    .line 887
    const/16 v28, 0x1

    .line 888
    .line 889
    return v28

    .line 890
    :cond_29
    const/4 v10, 0x0

    .line 891
    const/16 v28, 0x1

    .line 892
    .line 893
    iget-object v0, v1, Ll/jty0;->f:Ll/sry0;

    .line 894
    .line 895
    invoke-virtual {v1}, Ll/jty0;->A()J

    .line 896
    .line 897
    .line 898
    move-result-wide v2

    .line 899
    invoke-virtual {v0, v2, v3}, Ll/sry0;->i(J)Z

    .line 900
    .line 901
    .line 902
    move-result v0

    .line 903
    if-eqz v0, :cond_2a

    .line 904
    .line 905
    const-string v0, "DefaultAudioSink"

    .line 906
    .line 907
    const-string v2, "Resetting stalled audio track"

    .line 908
    .line 909
    invoke-static {v0, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 910
    .line 911
    .line 912
    invoke-virtual {v1}, Ll/jty0;->zzf()V

    .line 913
    .line 914
    .line 915
    return v28

    .line 916
    :cond_2a
    return v10

    .line 917
    :catch_2
    move-exception v0

    .line 918
    :try_start_5
    invoke-virtual {v11, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 919
    .line 920
    .line 921
    :cond_2b
    invoke-virtual {v1}, Ll/jty0;->D()V

    .line 922
    .line 923
    .line 924
    throw v11
    :try_end_5
    .catch Lcom/google/android/gms/internal/ads/zzpx; {:try_start_5 .. :try_end_5} :catch_1

    .line 925
    :goto_14
    iget-boolean v2, v0, Lcom/google/android/gms/internal/ads/zzpx;->zzb:Z

    .line 926
    .line 927
    if-nez v2, :cond_2c

    .line 928
    .line 929
    iget-object v1, v1, Ll/jty0;->i:Ll/ksy0;

    .line 930
    .line 931
    invoke-virtual {v1, v0}, Ll/ksy0;->b(Ljava/lang/Exception;)V

    .line 932
    .line 933
    .line 934
    goto/16 :goto_8

    .line 935
    .line 936
    :cond_2c
    throw v0

    .line 937
    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_9
        :pswitch_9
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_3
        :pswitch_6
        :pswitch_6
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_9
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final e(Ll/sqr0;I[I)V
    .locals 19
    .param p3    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzpw;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    const-string v1, "audio/raw"

    .line 6
    .line 7
    iget-object v3, v2, Ll/sqr0;->l:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v4, -0x1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iget v1, v2, Ll/sqr0;->A:I

    .line 17
    .line 18
    invoke-static {v1}, Ll/mpw0;->h(I)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-static {v1}, Ll/lev0;->d(Z)V

    .line 23
    .line 24
    .line 25
    iget v1, v2, Ll/sqr0;->A:I

    .line 26
    .line 27
    iget v5, v2, Ll/sqr0;->y:I

    .line 28
    .line 29
    invoke-static {v1, v5}, Ll/mpw0;->A(II)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    new-instance v5, Ll/mqw0;

    .line 34
    .line 35
    invoke-direct {v5}, Ll/mqw0;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v6, v0, Ll/jty0;->c:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 39
    .line 40
    invoke-virtual {v5, v6}, Ll/mqw0;->i(Ljava/lang/Iterable;)Ll/mqw0;

    .line 41
    .line 42
    .line 43
    iget-object v6, v0, Ll/jty0;->V:Ll/hsy0;

    .line 44
    .line 45
    invoke-virtual {v6}, Ll/hsy0;->e()[Ll/wsu0;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    invoke-virtual {v5, v6}, Ll/mqw0;->h([Ljava/lang/Object;)Ll/mqw0;

    .line 50
    .line 51
    .line 52
    new-instance v6, Ll/gpu0;

    .line 53
    .line 54
    invoke-virtual {v5}, Ll/mqw0;->j()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-direct {v6, v5}, Ll/gpu0;-><init>(Lcom/google/android/gms/internal/ads/zzgaa;)V

    .line 59
    .line 60
    .line 61
    iget-object v5, v0, Ll/jty0;->p:Ll/gpu0;

    .line 62
    .line 63
    invoke-virtual {v6, v5}, Ll/gpu0;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    if-eqz v5, :cond_0

    .line 68
    .line 69
    iget-object v6, v0, Ll/jty0;->p:Ll/gpu0;

    .line 70
    .line 71
    :cond_0
    iget-object v5, v0, Ll/jty0;->b:Ll/tty0;

    .line 72
    .line 73
    iget v7, v2, Ll/sqr0;->B:I

    .line 74
    .line 75
    iget v8, v2, Ll/sqr0;->C:I

    .line 76
    .line 77
    invoke-virtual {v5, v7, v8}, Ll/tty0;->k(II)V

    .line 78
    .line 79
    .line 80
    iget-object v5, v0, Ll/jty0;->a:Ll/ury0;

    .line 81
    .line 82
    move-object/from16 v7, p3

    .line 83
    .line 84
    invoke-virtual {v5, v7}, Ll/ury0;->i([I)V

    .line 85
    .line 86
    .line 87
    new-instance v5, Ll/mqu0;

    .line 88
    .line 89
    iget v7, v2, Ll/sqr0;->z:I

    .line 90
    .line 91
    iget v8, v2, Ll/sqr0;->y:I

    .line 92
    .line 93
    iget v9, v2, Ll/sqr0;->A:I

    .line 94
    .line 95
    invoke-direct {v5, v7, v8, v9}, Ll/mqu0;-><init>(III)V

    .line 96
    .line 97
    .line 98
    :try_start_0
    invoke-virtual {v6, v5}, Ll/gpu0;->a(Ll/mqu0;)Ll/mqu0;

    .line 99
    .line 100
    .line 101
    move-result-object v5
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzds; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    iget v7, v5, Ll/mqu0;->c:I

    .line 103
    .line 104
    iget v8, v5, Ll/mqu0;->a:I

    .line 105
    .line 106
    iget v5, v5, Ll/mqu0;->b:I

    .line 107
    .line 108
    invoke-static {v5}, Ll/mpw0;->v(I)I

    .line 109
    .line 110
    .line 111
    move-result v9

    .line 112
    invoke-static {v7, v5}, Ll/mpw0;->A(II)I

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    move-object v10, v6

    .line 117
    move v6, v5

    .line 118
    move v5, v1

    .line 119
    const/4 v1, 0x0

    .line 120
    goto :goto_0

    .line 121
    :catch_0
    move-exception v0

    .line 122
    new-instance v1, Lcom/google/android/gms/internal/ads/zzpw;

    .line 123
    .line 124
    invoke-direct {v1, v0, v2}, Lcom/google/android/gms/internal/ads/zzpw;-><init>(Ljava/lang/Throwable;Ll/sqr0;)V

    .line 125
    .line 126
    .line 127
    throw v1

    .line 128
    :cond_1
    new-instance v6, Ll/gpu0;

    .line 129
    .line 130
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-direct {v6, v1}, Ll/gpu0;-><init>(Lcom/google/android/gms/internal/ads/zzgaa;)V

    .line 135
    .line 136
    .line 137
    iget v8, v2, Ll/sqr0;->z:I

    .line 138
    .line 139
    sget-object v1, Ll/fpy0;->d:Ll/fpy0;

    .line 140
    .line 141
    iget-object v1, v0, Ll/jty0;->r:Ll/zoy0;

    .line 142
    .line 143
    iget-object v5, v0, Ll/jty0;->s:Ll/w3y0;

    .line 144
    .line 145
    invoke-virtual {v1, v2, v5}, Ll/zoy0;->a(Ll/sqr0;Ll/w3y0;)Landroid/util/Pair;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    if-eqz v1, :cond_c

    .line 150
    .line 151
    iget-object v5, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 152
    .line 153
    check-cast v5, Ljava/lang/Integer;

    .line 154
    .line 155
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 156
    .line 157
    .line 158
    move-result v7

    .line 159
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 160
    .line 161
    check-cast v1, Ljava/lang/Integer;

    .line 162
    .line 163
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 164
    .line 165
    .line 166
    move-result v9

    .line 167
    const/4 v1, 0x2

    .line 168
    move v5, v4

    .line 169
    move-object v10, v6

    .line 170
    move v6, v5

    .line 171
    :goto_0
    const-string v11, ") for: "

    .line 172
    .line 173
    if-eqz v7, :cond_b

    .line 174
    .line 175
    if-eqz v9, :cond_a

    .line 176
    .line 177
    invoke-static {v8, v9, v7}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 178
    .line 179
    .line 180
    move-result v11

    .line 181
    const/4 v12, -0x2

    .line 182
    const/4 v13, 0x1

    .line 183
    if-eq v11, v12, :cond_2

    .line 184
    .line 185
    move v12, v13

    .line 186
    goto :goto_1

    .line 187
    :cond_2
    const/4 v12, 0x0

    .line 188
    :goto_1
    invoke-static {v12}, Ll/lev0;->f(Z)V

    .line 189
    .line 190
    .line 191
    if-eq v6, v4, :cond_3

    .line 192
    .line 193
    move v12, v6

    .line 194
    goto :goto_2

    .line 195
    :cond_3
    move v12, v13

    .line 196
    :goto_2
    iget v14, v2, Ll/sqr0;->h:I

    .line 197
    .line 198
    const v15, 0x3d090

    .line 199
    .line 200
    .line 201
    if-eqz v1, :cond_8

    .line 202
    .line 203
    const-wide/32 v16, 0xf4240

    .line 204
    .line 205
    .line 206
    if-eq v1, v13, :cond_7

    .line 207
    .line 208
    const/4 v13, 0x5

    .line 209
    const/16 v3, 0x8

    .line 210
    .line 211
    if-ne v7, v13, :cond_4

    .line 212
    .line 213
    const v15, 0x7a120

    .line 214
    .line 215
    .line 216
    goto :goto_3

    .line 217
    :cond_4
    if-ne v7, v3, :cond_5

    .line 218
    .line 219
    const v15, 0xf4240

    .line 220
    .line 221
    .line 222
    move v7, v3

    .line 223
    :cond_5
    :goto_3
    if-eq v14, v4, :cond_6

    .line 224
    .line 225
    sget-object v13, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    .line 226
    .line 227
    invoke-static {v14, v3, v13}, Ll/otw0;->a(IILjava/math/RoundingMode;)I

    .line 228
    .line 229
    .line 230
    move-result v3

    .line 231
    goto :goto_4

    .line 232
    :cond_6
    invoke-static {v7}, Ll/lty0;->b(I)I

    .line 233
    .line 234
    .line 235
    move-result v3

    .line 236
    :goto_4
    int-to-long v13, v15

    .line 237
    move/from16 v18, v4

    .line 238
    .line 239
    move/from16 p3, v5

    .line 240
    .line 241
    int-to-long v4, v3

    .line 242
    mul-long/2addr v13, v4

    .line 243
    div-long v13, v13, v16

    .line 244
    .line 245
    invoke-static {v13, v14}, Ll/utw0;->a(J)I

    .line 246
    .line 247
    .line 248
    move-result v3

    .line 249
    goto :goto_5

    .line 250
    :cond_7
    move/from16 v18, v4

    .line 251
    .line 252
    move/from16 p3, v5

    .line 253
    .line 254
    invoke-static {v7}, Ll/lty0;->b(I)I

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    int-to-long v3, v3

    .line 259
    const-wide/32 v13, 0x2faf080

    .line 260
    .line 261
    .line 262
    mul-long/2addr v3, v13

    .line 263
    div-long v3, v3, v16

    .line 264
    .line 265
    invoke-static {v3, v4}, Ll/utw0;->a(J)I

    .line 266
    .line 267
    .line 268
    move-result v3

    .line 269
    goto :goto_5

    .line 270
    :cond_8
    move/from16 v18, v4

    .line 271
    .line 272
    move/from16 p3, v5

    .line 273
    .line 274
    mul-int/lit8 v3, v11, 0x4

    .line 275
    .line 276
    invoke-static {v15, v8, v12}, Ll/lty0;->a(III)I

    .line 277
    .line 278
    .line 279
    move-result v4

    .line 280
    const v5, 0xb71b0

    .line 281
    .line 282
    .line 283
    invoke-static {v5, v8, v12}, Ll/lty0;->a(III)I

    .line 284
    .line 285
    .line 286
    move-result v5

    .line 287
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 288
    .line 289
    .line 290
    move-result v3

    .line 291
    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    .line 292
    .line 293
    .line 294
    move-result v3

    .line 295
    :goto_5
    int-to-double v3, v3

    .line 296
    double-to-int v3, v3

    .line 297
    invoke-static {v11, v3}, Ljava/lang/Math;->max(II)I

    .line 298
    .line 299
    .line 300
    move-result v3

    .line 301
    add-int/2addr v3, v12

    .line 302
    add-int/lit8 v3, v3, -0x1

    .line 303
    .line 304
    div-int/2addr v3, v12

    .line 305
    mul-int/2addr v3, v12

    .line 306
    const/4 v4, 0x0

    .line 307
    iput-boolean v4, v0, Ll/jty0;->Q:Z

    .line 308
    .line 309
    move v4, v1

    .line 310
    new-instance v1, Ll/gsy0;

    .line 311
    .line 312
    const/4 v12, 0x0

    .line 313
    const/4 v13, 0x0

    .line 314
    const/4 v11, 0x0

    .line 315
    move v5, v6

    .line 316
    move v6, v8

    .line 317
    move v8, v7

    .line 318
    move v7, v9

    .line 319
    move v9, v3

    .line 320
    move/from16 v3, p3

    .line 321
    .line 322
    invoke-direct/range {v1 .. v13}, Ll/gsy0;-><init>(Ll/sqr0;IIIIIIILl/gpu0;ZZZ)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v0}, Ll/jty0;->L()Z

    .line 326
    .line 327
    .line 328
    move-result v2

    .line 329
    if-eqz v2, :cond_9

    .line 330
    .line 331
    iput-object v1, v0, Ll/jty0;->n:Ll/gsy0;

    .line 332
    .line 333
    return-void

    .line 334
    :cond_9
    iput-object v1, v0, Ll/jty0;->o:Ll/gsy0;

    .line 335
    .line 336
    return-void

    .line 337
    :cond_a
    move v4, v1

    .line 338
    new-instance v0, Lcom/google/android/gms/internal/ads/zzpw;

    .line 339
    .line 340
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v1

    .line 344
    new-instance v3, Ljava/lang/StringBuilder;

    .line 345
    .line 346
    const-string v5, "Invalid output channel config (mode="

    .line 347
    .line 348
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/ads/zzpw;-><init>(Ljava/lang/String;Ll/sqr0;)V

    .line 365
    .line 366
    .line 367
    throw v0

    .line 368
    :cond_b
    move v4, v1

    .line 369
    new-instance v0, Lcom/google/android/gms/internal/ads/zzpw;

    .line 370
    .line 371
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object v1

    .line 375
    new-instance v3, Ljava/lang/StringBuilder;

    .line 376
    .line 377
    const-string v5, "Invalid output encoding (mode="

    .line 378
    .line 379
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    .line 387
    .line 388
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/ads/zzpw;-><init>(Ljava/lang/String;Ll/sqr0;)V

    .line 396
    .line 397
    .line 398
    throw v0

    .line 399
    :cond_c
    new-instance v0, Lcom/google/android/gms/internal/ads/zzpw;

    .line 400
    .line 401
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v1

    .line 405
    const-string v3, "Unable to configure passthrough for: "

    .line 406
    .line 407
    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object v1

    .line 411
    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/ads/zzpw;-><init>(Ljava/lang/String;Ll/sqr0;)V

    .line 412
    .line 413
    .line 414
    throw v0
.end method

.method public final f(Landroid/media/AudioDeviceInfo;)V
    .locals 1
    .param p1    # Landroid/media/AudioDeviceInfo;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x17
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    new-instance v0, Ll/dsy0;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/dsy0;-><init>(Landroid/media/AudioDeviceInfo;)V

    .line 8
    .line 9
    .line 10
    move-object p1, v0

    .line 11
    :goto_0
    iput-object p1, p0, Ll/jty0;->O:Ll/dsy0;

    .line 12
    .line 13
    iget-object p0, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/bsy0;->a(Landroid/media/AudioTrack;Ll/dsy0;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public final g()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/jty0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/jty0;->f:Ll/sry0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/jty0;->A()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-virtual {v0, v1, v2}, Ll/sry0;->g(J)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final h(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jty0;->w:Z

    .line 2
    .line 3
    iget-object p1, p0, Ll/jty0;->v:Ll/iet0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/jty0;->G(Ll/iet0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final i(F)V
    .locals 1

    .line 1
    iget v0, p0, Ll/jty0;->F:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/jty0;->F:F

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/jty0;->H()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final j(II)V
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1d
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/jty0;->M(Landroid/media/AudioTrack;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final k(Ll/z8y0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jty0;->N:Ll/z8y0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/z8y0;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/jty0;->N:Ll/z8y0;

    .line 15
    .line 16
    iget v0, v0, Ll/z8y0;->a:I

    .line 17
    .line 18
    :cond_1
    iput-object p1, p0, Ll/jty0;->N:Ll/z8y0;

    .line 19
    .line 20
    return-void
.end method

.method public final l(Ll/voy0;)V
    .locals 0
    .param p1    # Ll/voy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/jty0;->l:Ll/voy0;

    .line 2
    .line 3
    return-void
.end method

.method public final m(Ll/mfv0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jty0;->f:Ll/sry0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sry0;->e(Ll/mfv0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final n(Ll/w3y0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jty0;->s:Ll/w3y0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/w3y0;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-object p1, p0, Ll/jty0;->s:Ll/w3y0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/jty0;->zzf()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final o(Ll/iet0;)V
    .locals 5

    .line 1
    new-instance v0, Ll/iet0;

    .line 2
    .line 3
    iget v1, p1, Ll/iet0;->a:F

    .line 4
    .line 5
    const/high16 v2, 0x41000000    # 8.0f

    .line 6
    .line 7
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const v3, 0x3dcccccd    # 0.1f

    .line 12
    .line 13
    .line 14
    invoke-static {v3, v1}, Ljava/lang/Math;->max(FF)F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iget v4, p1, Ll/iet0;->b:F

    .line 19
    .line 20
    invoke-static {v4, v2}, Ljava/lang/Math;->min(FF)F

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-direct {v0, v1, v2}, Ll/iet0;-><init>(FF)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/jty0;->v:Ll/iet0;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/jty0;->G(Ll/iet0;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final p(Ll/nqy0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jty0;->m:Ll/nqy0;

    .line 2
    .line 3
    return-void
.end method

.method public final r()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/jty0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/jty0;->J:Z

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/jty0;->g()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    return v2

    .line 21
    :cond_1
    return v1
.end method

.method public final z()J
    .locals 5

    .line 1
    iget-object v0, p0, Ll/jty0;->o:Ll/gsy0;

    .line 2
    .line 3
    iget v1, v0, Ll/gsy0;->c:I

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-wide v1, p0, Ll/jty0;->x:J

    .line 8
    .line 9
    iget p0, v0, Ll/gsy0;->b:I

    .line 10
    .line 11
    int-to-long v3, p0

    .line 12
    div-long/2addr v1, v3

    .line 13
    return-wide v1

    .line 14
    :cond_0
    iget-wide v0, p0, Ll/jty0;->y:J

    .line 15
    .line 16
    return-wide v0
.end method

.method public final zzb(Z)J
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/jty0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/jty0;->D:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/jty0;->f:Ll/sry0;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/sry0;->a(Z)J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget-object p1, p0, Ll/jty0;->o:Ll/gsy0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/jty0;->A()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    iget p1, p1, Ll/gsy0;->e:I

    .line 26
    .line 27
    invoke-static {v2, v3, p1}, Ll/mpw0;->G(JI)J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    :goto_0
    iget-object p1, p0, Ll/jty0;->g:Ljava/util/ArrayDeque;

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Ll/jty0;->g:Ljava/util/ArrayDeque;

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->getFirst()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ll/jsy0;

    .line 50
    .line 51
    iget-wide v2, p1, Ll/jsy0;->c:J

    .line 52
    .line 53
    cmp-long p1, v0, v2

    .line 54
    .line 55
    if-ltz p1, :cond_1

    .line 56
    .line 57
    iget-object p1, p0, Ll/jty0;->g:Ljava/util/ArrayDeque;

    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Ll/jsy0;

    .line 64
    .line 65
    iput-object p1, p0, Ll/jty0;->u:Ll/jsy0;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iget-object p1, p0, Ll/jty0;->u:Ll/jsy0;

    .line 69
    .line 70
    iget-wide v2, p1, Ll/jsy0;->c:J

    .line 71
    .line 72
    sub-long v2, v0, v2

    .line 73
    .line 74
    iget-object p1, p1, Ll/jsy0;->a:Ll/iet0;

    .line 75
    .line 76
    sget-object v4, Ll/iet0;->d:Ll/iet0;

    .line 77
    .line 78
    invoke-virtual {p1, v4}, Ll/iet0;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_2

    .line 83
    .line 84
    iget-object p1, p0, Ll/jty0;->u:Ll/jsy0;

    .line 85
    .line 86
    iget-wide v0, p1, Ll/jsy0;->b:J

    .line 87
    .line 88
    add-long/2addr v0, v2

    .line 89
    goto :goto_1

    .line 90
    :cond_2
    iget-object p1, p0, Ll/jty0;->g:Ljava/util/ArrayDeque;

    .line 91
    .line 92
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_3

    .line 97
    .line 98
    iget-object p1, p0, Ll/jty0;->V:Ll/hsy0;

    .line 99
    .line 100
    invoke-virtual {p1, v2, v3}, Ll/hsy0;->a(J)J

    .line 101
    .line 102
    .line 103
    move-result-wide v0

    .line 104
    iget-object p1, p0, Ll/jty0;->u:Ll/jsy0;

    .line 105
    .line 106
    iget-wide v2, p1, Ll/jsy0;->b:J

    .line 107
    .line 108
    add-long/2addr v0, v2

    .line 109
    goto :goto_1

    .line 110
    :cond_3
    iget-object p1, p0, Ll/jty0;->g:Ljava/util/ArrayDeque;

    .line 111
    .line 112
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->getFirst()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    check-cast p1, Ll/jsy0;

    .line 117
    .line 118
    iget-wide v2, p1, Ll/jsy0;->c:J

    .line 119
    .line 120
    sub-long/2addr v2, v0

    .line 121
    iget-object v0, p0, Ll/jty0;->u:Ll/jsy0;

    .line 122
    .line 123
    iget-object v0, v0, Ll/jsy0;->a:Ll/iet0;

    .line 124
    .line 125
    iget v0, v0, Ll/iet0;->a:F

    .line 126
    .line 127
    invoke-static {v2, v3, v0}, Ll/mpw0;->D(JF)J

    .line 128
    .line 129
    .line 130
    move-result-wide v0

    .line 131
    iget-wide v2, p1, Ll/jsy0;->b:J

    .line 132
    .line 133
    sub-long v0, v2, v0

    .line 134
    .line 135
    :goto_1
    iget-object p1, p0, Ll/jty0;->V:Ll/hsy0;

    .line 136
    .line 137
    invoke-virtual {p1}, Ll/hsy0;->b()J

    .line 138
    .line 139
    .line 140
    move-result-wide v2

    .line 141
    iget-object p1, p0, Ll/jty0;->o:Ll/gsy0;

    .line 142
    .line 143
    iget p1, p1, Ll/gsy0;->e:I

    .line 144
    .line 145
    invoke-static {v2, v3, p1}, Ll/mpw0;->G(JI)J

    .line 146
    .line 147
    .line 148
    move-result-wide v4

    .line 149
    add-long/2addr v0, v4

    .line 150
    iget-wide v4, p0, Ll/jty0;->S:J

    .line 151
    .line 152
    cmp-long p1, v2, v4

    .line 153
    .line 154
    if-lez p1, :cond_5

    .line 155
    .line 156
    iget-object p1, p0, Ll/jty0;->o:Ll/gsy0;

    .line 157
    .line 158
    iget p1, p1, Ll/gsy0;->e:I

    .line 159
    .line 160
    sub-long v4, v2, v4

    .line 161
    .line 162
    invoke-static {v4, v5, p1}, Ll/mpw0;->G(JI)J

    .line 163
    .line 164
    .line 165
    move-result-wide v4

    .line 166
    iput-wide v2, p0, Ll/jty0;->S:J

    .line 167
    .line 168
    iget-wide v2, p0, Ll/jty0;->T:J

    .line 169
    .line 170
    add-long/2addr v2, v4

    .line 171
    iput-wide v2, p0, Ll/jty0;->T:J

    .line 172
    .line 173
    iget-object p1, p0, Ll/jty0;->U:Landroid/os/Handler;

    .line 174
    .line 175
    if-nez p1, :cond_4

    .line 176
    .line 177
    new-instance p1, Landroid/os/Handler;

    .line 178
    .line 179
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    invoke-direct {p1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 184
    .line 185
    .line 186
    iput-object p1, p0, Ll/jty0;->U:Landroid/os/Handler;

    .line 187
    .line 188
    :cond_4
    iget-object p1, p0, Ll/jty0;->U:Landroid/os/Handler;

    .line 189
    .line 190
    const/4 v2, 0x0

    .line 191
    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Ll/jty0;->U:Landroid/os/Handler;

    .line 195
    .line 196
    new-instance v2, Ll/asy0;

    .line 197
    .line 198
    invoke-direct {v2, p0}, Ll/asy0;-><init>(Ll/jty0;)V

    .line 199
    .line 200
    .line 201
    const-wide/16 v3, 0x64

    .line 202
    .line 203
    invoke-virtual {p1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 204
    .line 205
    .line 206
    :cond_5
    return-wide v0

    .line 207
    :cond_6
    :goto_2
    const-wide/high16 p0, -0x8000000000000000L

    .line 208
    .line 209
    return-wide p0
.end method

.method public final zzc()Ll/iet0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jty0;->v:Ll/iet0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzf()V
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/jty0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    iput-wide v2, p0, Ll/jty0;->x:J

    .line 11
    .line 12
    iput-wide v2, p0, Ll/jty0;->y:J

    .line 13
    .line 14
    iput-wide v2, p0, Ll/jty0;->z:J

    .line 15
    .line 16
    iput-wide v2, p0, Ll/jty0;->A:J

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/jty0;->R:Z

    .line 20
    .line 21
    iput v0, p0, Ll/jty0;->B:I

    .line 22
    .line 23
    new-instance v4, Ll/jsy0;

    .line 24
    .line 25
    iget-object v5, p0, Ll/jty0;->v:Ll/iet0;

    .line 26
    .line 27
    const-wide/16 v8, 0x0

    .line 28
    .line 29
    const/4 v10, 0x0

    .line 30
    const-wide/16 v6, 0x0

    .line 31
    .line 32
    invoke-direct/range {v4 .. v10}, Ll/jsy0;-><init>(Ll/iet0;JJLl/isy0;)V

    .line 33
    .line 34
    .line 35
    iput-object v4, p0, Ll/jty0;->u:Ll/jsy0;

    .line 36
    .line 37
    iput-wide v2, p0, Ll/jty0;->E:J

    .line 38
    .line 39
    iput-object v1, p0, Ll/jty0;->t:Ll/jsy0;

    .line 40
    .line 41
    iget-object v4, p0, Ll/jty0;->g:Ljava/util/ArrayDeque;

    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/util/ArrayDeque;->clear()V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Ll/jty0;->G:Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    iput v0, p0, Ll/jty0;->H:I

    .line 49
    .line 50
    iput-object v1, p0, Ll/jty0;->I:Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    iput-boolean v0, p0, Ll/jty0;->K:Z

    .line 53
    .line 54
    iput-boolean v0, p0, Ll/jty0;->J:Z

    .line 55
    .line 56
    iget-object v0, p0, Ll/jty0;->b:Ll/tty0;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/tty0;->j()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/jty0;->I()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/jty0;->f:Ll/sry0;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/sry0;->h()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_0

    .line 71
    .line 72
    iget-object v0, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 75
    .line 76
    .line 77
    :cond_0
    iget-object v0, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 78
    .line 79
    invoke-static {v0}, Ll/jty0;->M(Landroid/media/AudioTrack;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    iget-object v0, p0, Ll/jty0;->h:Ll/hty0;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    iget-object v4, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 91
    .line 92
    invoke-virtual {v0, v4}, Ll/hty0;->b(Landroid/media/AudioTrack;)V

    .line 93
    .line 94
    .line 95
    :cond_1
    sget v0, Ll/mpw0;->a:I

    .line 96
    .line 97
    iget-object v0, p0, Ll/jty0;->o:Ll/gsy0;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/gsy0;->b()Ll/jqy0;

    .line 100
    .line 101
    .line 102
    move-result-object v8

    .line 103
    iget-object v0, p0, Ll/jty0;->n:Ll/gsy0;

    .line 104
    .line 105
    if-eqz v0, :cond_2

    .line 106
    .line 107
    iput-object v0, p0, Ll/jty0;->o:Ll/gsy0;

    .line 108
    .line 109
    iput-object v1, p0, Ll/jty0;->n:Ll/gsy0;

    .line 110
    .line 111
    :cond_2
    iget-object v0, p0, Ll/jty0;->f:Ll/sry0;

    .line 112
    .line 113
    invoke-virtual {v0}, Ll/sry0;->c()V

    .line 114
    .line 115
    .line 116
    iget-object v5, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 117
    .line 118
    iget-object v9, p0, Ll/jty0;->e:Ll/bjv0;

    .line 119
    .line 120
    iget-object v6, p0, Ll/jty0;->m:Ll/nqy0;

    .line 121
    .line 122
    invoke-virtual {v9}, Ll/bjv0;->c()Z

    .line 123
    .line 124
    .line 125
    new-instance v7, Landroid/os/Handler;

    .line 126
    .line 127
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-direct {v7, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 132
    .line 133
    .line 134
    sget-object v10, Ll/jty0;->X:Ljava/lang/Object;

    .line 135
    .line 136
    monitor-enter v10

    .line 137
    :try_start_0
    sget-object v0, Ll/jty0;->Y:Ljava/util/concurrent/ExecutorService;

    .line 138
    .line 139
    if-nez v0, :cond_3

    .line 140
    .line 141
    const-string v0, "ExoPlayer:AudioTrackReleaseThread"

    .line 142
    .line 143
    invoke-static {v0}, Ll/mpw0;->d(Ljava/lang/String;)Ljava/util/concurrent/ExecutorService;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    sput-object v0, Ll/jty0;->Y:Ljava/util/concurrent/ExecutorService;

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :catchall_0
    move-exception v0

    .line 151
    move-object p0, v0

    .line 152
    goto :goto_1

    .line 153
    :cond_3
    :goto_0
    sget v0, Ll/jty0;->Z:I

    .line 154
    .line 155
    add-int/lit8 v0, v0, 0x1

    .line 156
    .line 157
    sput v0, Ll/jty0;->Z:I

    .line 158
    .line 159
    sget-object v0, Ll/jty0;->Y:Ljava/util/concurrent/ExecutorService;

    .line 160
    .line 161
    new-instance v4, Ll/yry0;

    .line 162
    .line 163
    invoke-direct/range {v4 .. v9}, Ll/yry0;-><init>(Landroid/media/AudioTrack;Ll/nqy0;Landroid/os/Handler;Ll/jqy0;Ll/bjv0;)V

    .line 164
    .line 165
    .line 166
    invoke-interface {v0, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 167
    .line 168
    .line 169
    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    iput-object v1, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 171
    .line 172
    goto :goto_2

    .line 173
    :goto_1
    :try_start_1
    monitor-exit v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 174
    throw p0

    .line 175
    :cond_4
    :goto_2
    iget-object v0, p0, Ll/jty0;->j:Ll/ksy0;

    .line 176
    .line 177
    invoke-virtual {v0}, Ll/ksy0;->a()V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Ll/jty0;->i:Ll/ksy0;

    .line 181
    .line 182
    invoke-virtual {v0}, Ll/ksy0;->a()V

    .line 183
    .line 184
    .line 185
    iput-wide v2, p0, Ll/jty0;->S:J

    .line 186
    .line 187
    iput-wide v2, p0, Ll/jty0;->T:J

    .line 188
    .line 189
    iget-object p0, p0, Ll/jty0;->U:Landroid/os/Handler;

    .line 190
    .line 191
    if-eqz p0, :cond_5

    .line 192
    .line 193
    invoke-virtual {p0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 194
    .line 195
    .line 196
    :cond_5
    return-void
.end method

.method public final zzg()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/jty0;->C:Z

    .line 3
    .line 4
    return-void
.end method

.method public final zzh()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/jty0;->L:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jty0;->L()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ll/jty0;->f:Ll/sry0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/sry0;->k()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 19
    .line 20
    invoke-static {v0}, Ll/jty0;->M(Landroid/media/AudioTrack;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/media/AudioTrack;->pause()V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public final zzi()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/jty0;->L:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jty0;->L()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/jty0;->f:Ll/sry0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/sry0;->f()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/jty0;->q:Landroid/media/AudioTrack;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/media/AudioTrack;->play()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final zzj()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzqa;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/jty0;->J:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jty0;->L()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/jty0;->K()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/jty0;->E()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Ll/jty0;->J:Z

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final zzk()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/jty0;->zzf()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jty0;->c:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    move v3, v2

    .line 12
    :goto_0
    if-ge v3, v1, :cond_0

    .line 13
    .line 14
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    check-cast v4, Ll/wsu0;

    .line 19
    .line 20
    invoke-interface {v4}, Ll/wsu0;->zzf()V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Ll/jty0;->d:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    move v3, v2

    .line 33
    :goto_1
    if-ge v3, v1, :cond_1

    .line 34
    .line 35
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Ll/wsu0;

    .line 40
    .line 41
    invoke-interface {v4}, Ll/wsu0;->zzf()V

    .line 42
    .line 43
    .line 44
    add-int/lit8 v3, v3, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    iget-object v0, p0, Ll/jty0;->p:Ll/gpu0;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/gpu0;->f()V

    .line 52
    .line 53
    .line 54
    :cond_2
    iput-boolean v2, p0, Ll/jty0;->L:Z

    .line 55
    .line 56
    iput-boolean v2, p0, Ll/jty0;->Q:Z

    .line 57
    .line 58
    return-void
.end method

.method public final zzm(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/jty0;->M:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Ll/jty0;->M:I

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jty0;->zzf()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
