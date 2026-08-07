.class public final Ll/b1z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/izy0;
.implements Ll/ser0;
.implements Ll/t6z0;
.implements Ll/y6z0;
.implements Ll/d2z0;


# static fields
.field public static final M:Ljava/util/Map;

.field public static final N:Ll/sqr0;


# instance fields
.field public A:Z

.field public B:Z

.field public C:I

.field public D:Z

.field public E:J

.field public F:J

.field public G:Z

.field public H:I

.field public I:Z

.field public J:Z

.field public final K:Ll/s6z0;

.field public final L:Ll/c6z0;

.field public final a:Landroid/net/Uri;

.field public final b:Ll/fex0;

.field public final c:Ll/huy0;

.field public final d:Ll/l0z0;

.field public final e:Ll/zty0;

.field public final f:Ll/x0z0;

.field public final g:J

.field public final h:Ll/a7z0;

.field public final i:Ll/q0z0;

.field public final j:Ll/bjv0;

.field public final k:Ljava/lang/Runnable;

.field public final l:Ljava/lang/Runnable;

.field public final m:Landroid/os/Handler;

.field public final n:Z

.field public o:Ll/hzy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public p:Lcom/google/android/gms/internal/ads/zzaga;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public q:[Ll/e2z0;

.field public r:[Ll/z0z0;

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Ll/a1z0;

.field public w:Ll/bgr0;

.field public x:J

.field public y:Z

.field public z:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Icy-MetaData"

    .line 7
    .line 8
    const-string v2, "1"

    .line 9
    .line 10
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll/b1z0;->M:Ljava/util/Map;

    .line 18
    .line 19
    new-instance v0, Ll/znr0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/znr0;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v1, "icy"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 27
    .line 28
    .line 29
    const-string v1, "application/x-icy"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ll/znr0;->D()Ll/sqr0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Ll/b1z0;->N:Ll/sqr0;

    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Ll/fex0;Ll/q0z0;Ll/huy0;Ll/zty0;Ll/s6z0;Ll/l0z0;Ll/x0z0;Ll/c6z0;Ljava/lang/String;IJ)V
    .locals 0
    .param p10    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b1z0;->a:Landroid/net/Uri;

    .line 5
    .line 6
    iput-object p2, p0, Ll/b1z0;->b:Ll/fex0;

    .line 7
    .line 8
    iput-object p4, p0, Ll/b1z0;->c:Ll/huy0;

    .line 9
    .line 10
    iput-object p5, p0, Ll/b1z0;->e:Ll/zty0;

    .line 11
    .line 12
    iput-object p6, p0, Ll/b1z0;->K:Ll/s6z0;

    .line 13
    .line 14
    iput-object p7, p0, Ll/b1z0;->d:Ll/l0z0;

    .line 15
    .line 16
    iput-object p8, p0, Ll/b1z0;->f:Ll/x0z0;

    .line 17
    .line 18
    iput-object p9, p0, Ll/b1z0;->L:Ll/c6z0;

    .line 19
    .line 20
    int-to-long p1, p11

    .line 21
    iput-wide p1, p0, Ll/b1z0;->g:J

    .line 22
    .line 23
    new-instance p1, Ll/a7z0;

    .line 24
    .line 25
    const-string p2, "ProgressiveMediaPeriod"

    .line 26
    .line 27
    invoke-direct {p1, p2}, Ll/a7z0;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/b1z0;->h:Ll/a7z0;

    .line 31
    .line 32
    iput-object p3, p0, Ll/b1z0;->i:Ll/q0z0;

    .line 33
    .line 34
    iput-wide p12, p0, Ll/b1z0;->x:J

    .line 35
    .line 36
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    cmp-long p3, p12, p1

    .line 42
    .line 43
    const/4 p4, 0x1

    .line 44
    const/4 p5, 0x0

    .line 45
    if-eqz p3, :cond_0

    .line 46
    .line 47
    move p3, p4

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    move p3, p5

    .line 50
    :goto_0
    iput-boolean p3, p0, Ll/b1z0;->n:Z

    .line 51
    .line 52
    new-instance p3, Ll/bjv0;

    .line 53
    .line 54
    sget-object p6, Ll/mfv0;->a:Ll/mfv0;

    .line 55
    .line 56
    invoke-direct {p3, p6}, Ll/bjv0;-><init>(Ll/mfv0;)V

    .line 57
    .line 58
    .line 59
    iput-object p3, p0, Ll/b1z0;->j:Ll/bjv0;

    .line 60
    .line 61
    new-instance p3, Ll/s0z0;

    .line 62
    .line 63
    invoke-direct {p3, p0}, Ll/s0z0;-><init>(Ll/b1z0;)V

    .line 64
    .line 65
    .line 66
    iput-object p3, p0, Ll/b1z0;->k:Ljava/lang/Runnable;

    .line 67
    .line 68
    new-instance p3, Ll/t0z0;

    .line 69
    .line 70
    invoke-direct {p3, p0}, Ll/t0z0;-><init>(Ll/b1z0;)V

    .line 71
    .line 72
    .line 73
    iput-object p3, p0, Ll/b1z0;->l:Ljava/lang/Runnable;

    .line 74
    .line 75
    const/4 p3, 0x0

    .line 76
    invoke-static {p3}, Ll/mpw0;->L(Landroid/os/Handler$Callback;)Landroid/os/Handler;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    iput-object p3, p0, Ll/b1z0;->m:Landroid/os/Handler;

    .line 81
    .line 82
    new-array p3, p5, [Ll/z0z0;

    .line 83
    .line 84
    iput-object p3, p0, Ll/b1z0;->r:[Ll/z0z0;

    .line 85
    .line 86
    new-array p3, p5, [Ll/e2z0;

    .line 87
    .line 88
    iput-object p3, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 89
    .line 90
    iput-wide p1, p0, Ll/b1z0;->F:J

    .line 91
    .line 92
    iput p4, p0, Ll/b1z0;->z:I

    .line 93
    .line 94
    return-void
.end method

.method public static bridge synthetic K(Ll/b1z0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/b1z0;->g:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic L(Ll/b1z0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/b1z0;->x:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic M(Ll/b1z0;Z)J
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/b1z0;->z(Z)J

    .line 3
    .line 4
    .line 5
    move-result-wide p0

    .line 6
    return-wide p0
.end method

.method public static bridge synthetic N(Ll/b1z0;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b1z0;->m:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic O()Ll/sqr0;
    .locals 1

    .line 1
    sget-object v0, Ll/b1z0;->N:Ll/sqr0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic Q(Ll/b1z0;)Lcom/google/android/gms/internal/ads/zzaga;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b1z0;->p:Lcom/google/android/gms/internal/ads/zzaga;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic R(Ll/b1z0;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b1z0;->l:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic S()Ljava/util/Map;
    .locals 1

    .line 1
    sget-object v0, Ll/b1z0;->M:Ljava/util/Map;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic o(Ll/b1z0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b1z0;->C()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic p(Ll/b1z0;Lcom/google/android/gms/internal/ads/zzaga;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b1z0;->p:Lcom/google/android/gms/internal/ads/zzaga;

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic q(Ll/b1z0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/r0z0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r0z0;-><init>(Ll/b1z0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/b1z0;->m:Landroid/os/Handler;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final A(Ll/z0z0;)Ll/sgr0;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_1

    .line 6
    .line 7
    iget-object v2, p0, Ll/b1z0;->r:[Ll/z0z0;

    .line 8
    .line 9
    aget-object v2, v2, v1

    .line 10
    .line 11
    invoke-virtual {p1, v2}, Ll/z0z0;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 18
    .line 19
    aget-object p0, p0, v1

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v1, p0, Ll/b1z0;->L:Ll/c6z0;

    .line 26
    .line 27
    iget-object v2, p0, Ll/b1z0;->c:Ll/huy0;

    .line 28
    .line 29
    iget-object v3, p0, Ll/b1z0;->e:Ll/zty0;

    .line 30
    .line 31
    new-instance v4, Ll/e2z0;

    .line 32
    .line 33
    invoke-direct {v4, v1, v2, v3}, Ll/e2z0;-><init>(Ll/c6z0;Ll/huy0;Ll/zty0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v4, p0}, Ll/e2z0;->J(Ll/d2z0;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/b1z0;->r:[Ll/z0z0;

    .line 40
    .line 41
    add-int/lit8 v2, v0, 0x1

    .line 42
    .line 43
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, [Ll/z0z0;

    .line 48
    .line 49
    aput-object p1, v1, v0

    .line 50
    .line 51
    sget p1, Ll/mpw0;->a:I

    .line 52
    .line 53
    iput-object v1, p0, Ll/b1z0;->r:[Ll/z0z0;

    .line 54
    .line 55
    iget-object p1, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 56
    .line 57
    invoke-static {p1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, [Ll/e2z0;

    .line 62
    .line 63
    aput-object v4, p1, v0

    .line 64
    .line 65
    iput-object p1, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 66
    .line 67
    return-object v4
.end method

.method public final B()V
    .locals 1
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "trackState",
            "seekMap"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/b1z0;->t:Z

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/b1z0;->v:Ll/a1z0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/b1z0;->w:Ll/bgr0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final C()V
    .locals 12

    .line 1
    iget-boolean v0, p0, Ll/b1z0;->J:Z

    .line 2
    .line 3
    if-nez v0, :cond_9

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/b1z0;->t:Z

    .line 6
    .line 7
    if-nez v0, :cond_9

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/b1z0;->s:Z

    .line 10
    .line 11
    if-eqz v0, :cond_9

    .line 12
    .line 13
    iget-object v0, p0, Ll/b1z0;->w:Ll/bgr0;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_4

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 20
    .line 21
    array-length v1, v0

    .line 22
    const/4 v2, 0x0

    .line 23
    move v3, v2

    .line 24
    :goto_0
    if-ge v3, v1, :cond_1

    .line 25
    .line 26
    aget-object v4, v0, v3

    .line 27
    .line 28
    invoke-virtual {v4}, Ll/e2z0;->A()Ll/sqr0;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    if-eqz v4, :cond_9

    .line 33
    .line 34
    add-int/lit8 v3, v3, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object v0, p0, Ll/b1z0;->j:Ll/bjv0;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/bjv0;->c()Z

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 43
    .line 44
    array-length v0, v0

    .line 45
    new-array v1, v0, [Ll/t2u0;

    .line 46
    .line 47
    new-array v3, v0, [Z

    .line 48
    .line 49
    move v4, v2

    .line 50
    :goto_1
    const/4 v5, 0x1

    .line 51
    if-ge v4, v0, :cond_8

    .line 52
    .line 53
    iget-object v6, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 54
    .line 55
    aget-object v6, v6, v4

    .line 56
    .line 57
    invoke-virtual {v6}, Ll/e2z0;->A()Ll/sqr0;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    iget-object v7, v6, Ll/sqr0;->l:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v7}, Ll/a8t0;->g(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v8

    .line 70
    if-nez v8, :cond_2

    .line 71
    .line 72
    invoke-static {v7}, Ll/a8t0;->h(Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    if-eqz v7, :cond_3

    .line 77
    .line 78
    :cond_2
    move v7, v5

    .line 79
    goto :goto_2

    .line 80
    :cond_3
    move v7, v2

    .line 81
    :goto_2
    aput-boolean v7, v3, v4

    .line 82
    .line 83
    iget-boolean v9, p0, Ll/b1z0;->u:Z

    .line 84
    .line 85
    or-int/2addr v7, v9

    .line 86
    iput-boolean v7, p0, Ll/b1z0;->u:Z

    .line 87
    .line 88
    iget-object v7, p0, Ll/b1z0;->p:Lcom/google/android/gms/internal/ads/zzaga;

    .line 89
    .line 90
    if-eqz v7, :cond_7

    .line 91
    .line 92
    if-nez v8, :cond_4

    .line 93
    .line 94
    iget-object v9, p0, Ll/b1z0;->r:[Ll/z0z0;

    .line 95
    .line 96
    aget-object v9, v9, v4

    .line 97
    .line 98
    iget-boolean v9, v9, Ll/z0z0;->b:Z

    .line 99
    .line 100
    if-eqz v9, :cond_6

    .line 101
    .line 102
    :cond_4
    iget-object v9, v6, Ll/sqr0;->j:Lcom/google/android/gms/internal/ads/zzby;

    .line 103
    .line 104
    if-nez v9, :cond_5

    .line 105
    .line 106
    new-instance v9, Lcom/google/android/gms/internal/ads/zzby;

    .line 107
    .line 108
    new-array v5, v5, [Lcom/google/android/gms/internal/ads/zzbx;

    .line 109
    .line 110
    aput-object v7, v5, v2

    .line 111
    .line 112
    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    invoke-direct {v9, v10, v11, v5}, Lcom/google/android/gms/internal/ads/zzby;-><init>(J[Lcom/google/android/gms/internal/ads/zzbx;)V

    .line 118
    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_5
    new-array v5, v5, [Lcom/google/android/gms/internal/ads/zzbx;

    .line 122
    .line 123
    aput-object v7, v5, v2

    .line 124
    .line 125
    invoke-virtual {v9, v5}, Lcom/google/android/gms/internal/ads/zzby;->c([Lcom/google/android/gms/internal/ads/zzbx;)Lcom/google/android/gms/internal/ads/zzby;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    :goto_3
    invoke-virtual {v6}, Ll/sqr0;->b()Ll/znr0;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    invoke-virtual {v5, v9}, Ll/znr0;->p(Lcom/google/android/gms/internal/ads/zzby;)Ll/znr0;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v5}, Ll/znr0;->D()Ll/sqr0;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    :cond_6
    if-eqz v8, :cond_7

    .line 141
    .line 142
    iget v5, v6, Ll/sqr0;->f:I

    .line 143
    .line 144
    const/4 v8, -0x1

    .line 145
    if-ne v5, v8, :cond_7

    .line 146
    .line 147
    iget v5, v6, Ll/sqr0;->g:I

    .line 148
    .line 149
    if-ne v5, v8, :cond_7

    .line 150
    .line 151
    iget v5, v7, Lcom/google/android/gms/internal/ads/zzaga;->zza:I

    .line 152
    .line 153
    if-eq v5, v8, :cond_7

    .line 154
    .line 155
    invoke-virtual {v6}, Ll/sqr0;->b()Ll/znr0;

    .line 156
    .line 157
    .line 158
    move-result-object v6

    .line 159
    invoke-virtual {v6, v5}, Ll/znr0;->j0(I)Ll/znr0;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v6}, Ll/znr0;->D()Ll/sqr0;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    :cond_7
    iget-object v5, p0, Ll/b1z0;->c:Ll/huy0;

    .line 167
    .line 168
    invoke-interface {v5, v6}, Ll/huy0;->a(Ll/sqr0;)I

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    invoke-virtual {v6, v5}, Ll/sqr0;->c(I)Ll/sqr0;

    .line 173
    .line 174
    .line 175
    move-result-object v5

    .line 176
    new-instance v6, Ll/t2u0;

    .line 177
    .line 178
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v7

    .line 182
    filled-new-array {v5}, [Ll/sqr0;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    invoke-direct {v6, v7, v5}, Ll/t2u0;-><init>(Ljava/lang/String;[Ll/sqr0;)V

    .line 187
    .line 188
    .line 189
    aput-object v6, v1, v4

    .line 190
    .line 191
    add-int/lit8 v4, v4, 0x1

    .line 192
    .line 193
    goto/16 :goto_1

    .line 194
    .line 195
    :cond_8
    new-instance v0, Ll/a1z0;

    .line 196
    .line 197
    new-instance v2, Ll/q2z0;

    .line 198
    .line 199
    invoke-direct {v2, v1}, Ll/q2z0;-><init>([Ll/t2u0;)V

    .line 200
    .line 201
    .line 202
    invoke-direct {v0, v2, v3}, Ll/a1z0;-><init>(Ll/q2z0;[Z)V

    .line 203
    .line 204
    .line 205
    iput-object v0, p0, Ll/b1z0;->v:Ll/a1z0;

    .line 206
    .line 207
    iput-boolean v5, p0, Ll/b1z0;->t:Z

    .line 208
    .line 209
    iget-object v0, p0, Ll/b1z0;->o:Ll/hzy0;

    .line 210
    .line 211
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 212
    .line 213
    .line 214
    invoke-interface {v0, p0}, Ll/hzy0;->d(Ll/izy0;)V

    .line 215
    .line 216
    .line 217
    :cond_9
    :goto_4
    return-void
.end method

.method public final D(I)V
    .locals 13

    .line 1
    invoke-virtual {p0}, Ll/b1z0;->B()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b1z0;->v:Ll/a1z0;

    .line 5
    .line 6
    iget-object v1, v0, Ll/a1z0;->d:[Z

    .line 7
    .line 8
    aget-boolean v2, v1, p1

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    iget-object v0, v0, Ll/a1z0;->a:Ll/q2z0;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/q2z0;->b(I)Ll/t2u0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v0, v2}, Ll/t2u0;->b(I)Ll/sqr0;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    iget-object v0, p0, Ll/b1z0;->d:Ll/l0z0;

    .line 24
    .line 25
    iget-object v2, v6, Ll/sqr0;->l:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v2}, Ll/a8t0;->b(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    iget-wide v2, p0, Ll/b1z0;->E:J

    .line 32
    .line 33
    move-wide v7, v2

    .line 34
    new-instance v3, Ll/gzy0;

    .line 35
    .line 36
    invoke-static {v7, v8}, Ll/mpw0;->I(J)J

    .line 37
    .line 38
    .line 39
    move-result-wide v9

    .line 40
    const-wide v11, -0x7fffffffffffffffL    # -4.9E-324

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    const/4 v4, 0x1

    .line 46
    const/4 v7, 0x0

    .line 47
    const/4 v8, 0x0

    .line 48
    invoke-direct/range {v3 .. v12}, Ll/gzy0;-><init>(IILl/sqr0;ILjava/lang/Object;JJ)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v3}, Ll/l0z0;->c(Ll/gzy0;)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x1

    .line 55
    aput-boolean p0, v1, p1

    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public final E(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/b1z0;->B()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b1z0;->v:Ll/a1z0;

    .line 5
    .line 6
    iget-object v0, v0, Ll/a1z0;->b:[Z

    .line 7
    .line 8
    iget-boolean v1, p0, Ll/b1z0;->G:Z

    .line 9
    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    aget-boolean v0, v0, p1

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 17
    .line 18
    aget-object p1, v0, p1

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p1, v0}, Ll/e2z0;->M(Z)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const-wide/16 v1, 0x0

    .line 29
    .line 30
    iput-wide v1, p0, Ll/b1z0;->F:J

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/b1z0;->G:Z

    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    iput-boolean p1, p0, Ll/b1z0;->B:Z

    .line 36
    .line 37
    iput-wide v1, p0, Ll/b1z0;->E:J

    .line 38
    .line 39
    iput v0, p0, Ll/b1z0;->H:I

    .line 40
    .line 41
    iget-object p1, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 42
    .line 43
    array-length v1, p1

    .line 44
    move v2, v0

    .line 45
    :goto_0
    if-ge v2, v1, :cond_1

    .line 46
    .line 47
    aget-object v3, p1, v2

    .line 48
    .line 49
    invoke-virtual {v3, v0}, Ll/e2z0;->H(Z)V

    .line 50
    .line 51
    .line 52
    add-int/lit8 v2, v2, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iget-object p1, p0, Ll/b1z0;->o:Ll/hzy0;

    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    invoke-interface {p1, p0}, Ll/g2z0;->c(Ll/h2z0;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    :goto_1
    return-void
.end method

.method public final F()V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v2, v1, Ll/b1z0;->a:Landroid/net/Uri;

    .line 4
    .line 5
    iget-object v3, v1, Ll/b1z0;->b:Ll/fex0;

    .line 6
    .line 7
    new-instance v0, Ll/w0z0;

    .line 8
    .line 9
    iget-object v4, v1, Ll/b1z0;->i:Ll/q0z0;

    .line 10
    .line 11
    iget-object v6, v1, Ll/b1z0;->j:Ll/bjv0;

    .line 12
    .line 13
    move-object/from16 v5, p0

    .line 14
    .line 15
    invoke-direct/range {v0 .. v6}, Ll/w0z0;-><init>(Ll/b1z0;Landroid/net/Uri;Ll/fex0;Ll/q0z0;Ll/ser0;Ll/bjv0;)V

    .line 16
    .line 17
    .line 18
    iget-boolean v2, v1, Ll/b1z0;->t:Z

    .line 19
    .line 20
    if-eqz v2, :cond_3

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/b1z0;->G()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-static {v2}, Ll/lev0;->f(Z)V

    .line 27
    .line 28
    .line 29
    iget-wide v2, v1, Ll/b1z0;->x:J

    .line 30
    .line 31
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    cmp-long v6, v2, v4

    .line 37
    .line 38
    if-eqz v6, :cond_1

    .line 39
    .line 40
    iget-wide v6, v1, Ll/b1z0;->F:J

    .line 41
    .line 42
    cmp-long v2, v6, v2

    .line 43
    .line 44
    if-gtz v2, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const/4 v0, 0x1

    .line 48
    iput-boolean v0, v1, Ll/b1z0;->I:Z

    .line 49
    .line 50
    iput-wide v4, v1, Ll/b1z0;->F:J

    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    :goto_0
    iget-object v2, v1, Ll/b1z0;->w:Ll/bgr0;

    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    iget-wide v6, v1, Ll/b1z0;->F:J

    .line 59
    .line 60
    invoke-interface {v2, v6, v7}, Ll/bgr0;->a(J)Ll/zfr0;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iget-object v2, v2, Ll/zfr0;->a:Ll/cgr0;

    .line 65
    .line 66
    iget-wide v6, v1, Ll/b1z0;->F:J

    .line 67
    .line 68
    iget-wide v2, v2, Ll/cgr0;->b:J

    .line 69
    .line 70
    invoke-static {v0, v2, v3, v6, v7}, Ll/w0z0;->f(Ll/w0z0;JJ)V

    .line 71
    .line 72
    .line 73
    iget-object v2, v1, Ll/b1z0;->q:[Ll/e2z0;

    .line 74
    .line 75
    array-length v3, v2

    .line 76
    const/4 v6, 0x0

    .line 77
    :goto_1
    if-ge v6, v3, :cond_2

    .line 78
    .line 79
    aget-object v7, v2, v6

    .line 80
    .line 81
    iget-wide v8, v1, Ll/b1z0;->F:J

    .line 82
    .line 83
    invoke-virtual {v7, v8, v9}, Ll/e2z0;->I(J)V

    .line 84
    .line 85
    .line 86
    add-int/lit8 v6, v6, 0x1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_2
    iput-wide v4, v1, Ll/b1z0;->F:J

    .line 90
    .line 91
    :cond_3
    invoke-virtual {v1}, Ll/b1z0;->y()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    iput v2, v1, Ll/b1z0;->H:I

    .line 96
    .line 97
    iget-object v2, v1, Ll/b1z0;->h:Ll/a7z0;

    .line 98
    .line 99
    iget v3, v1, Ll/b1z0;->z:I

    .line 100
    .line 101
    invoke-static {v3}, Ll/s6z0;->a(I)I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    invoke-virtual {v2, v0, v1, v3}, Ll/a7z0;->a(Ll/x6z0;Ll/t6z0;I)J

    .line 106
    .line 107
    .line 108
    move-result-wide v10

    .line 109
    invoke-static {v0}, Ll/w0z0;->d(Ll/w0z0;)Ll/akx0;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    iget-object v2, v1, Ll/b1z0;->d:Ll/l0z0;

    .line 114
    .line 115
    new-instance v4, Ll/bzy0;

    .line 116
    .line 117
    invoke-static {v0}, Ll/w0z0;->a(Ll/w0z0;)J

    .line 118
    .line 119
    .line 120
    move-result-wide v5

    .line 121
    iget-object v8, v7, Ll/akx0;->a:Landroid/net/Uri;

    .line 122
    .line 123
    sget-object v9, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 124
    .line 125
    const-wide/16 v12, 0x0

    .line 126
    .line 127
    const-wide/16 v14, 0x0

    .line 128
    .line 129
    invoke-direct/range {v4 .. v15}, Ll/bzy0;-><init>(JLl/akx0;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 130
    .line 131
    .line 132
    invoke-static {v0}, Ll/w0z0;->c(Ll/w0z0;)J

    .line 133
    .line 134
    .line 135
    move-result-wide v5

    .line 136
    iget-wide v0, v1, Ll/b1z0;->x:J

    .line 137
    .line 138
    new-instance v7, Ll/gzy0;

    .line 139
    .line 140
    invoke-static {v5, v6}, Ll/mpw0;->I(J)J

    .line 141
    .line 142
    .line 143
    move-result-wide v13

    .line 144
    invoke-static {v0, v1}, Ll/mpw0;->I(J)J

    .line 145
    .line 146
    .line 147
    move-result-wide v15

    .line 148
    const/4 v8, 0x1

    .line 149
    const/4 v9, -0x1

    .line 150
    const/4 v10, 0x0

    .line 151
    const/4 v11, 0x0

    .line 152
    const/4 v12, 0x0

    .line 153
    invoke-direct/range {v7 .. v16}, Ll/gzy0;-><init>(IILl/sqr0;ILjava/lang/Object;JJ)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v2, v4, v7}, Ll/l0z0;->g(Ll/bzy0;Ll/gzy0;)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public final G()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/b1z0;->F:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long p0, v0, v2

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public final H()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/b1z0;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/b1z0;->G()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public final I(ILl/l9y0;Ll/evx0;I)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/b1z0;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x3

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Ll/b1z0;->D(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 13
    .line 14
    aget-object v0, v0, p1

    .line 15
    .line 16
    iget-boolean v2, p0, Ll/b1z0;->I:Z

    .line 17
    .line 18
    invoke-virtual {v0, p2, p3, p4, v2}, Ll/e2z0;->y(Ll/l9y0;Ll/evx0;IZ)I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-ne p2, v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/b1z0;->E(I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return p2
.end method

.method public final J(IJ)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/b1z0;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Ll/b1z0;->D(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 13
    .line 14
    aget-object v0, v0, p1

    .line 15
    .line 16
    iget-boolean v2, p0, Ll/b1z0;->I:Z

    .line 17
    .line 18
    invoke-virtual {v0, p2, p3, v2}, Ll/e2z0;->w(JZ)I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    invoke-virtual {v0, p2}, Ll/e2z0;->K(I)V

    .line 23
    .line 24
    .line 25
    if-nez p2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/b1z0;->E(I)V

    .line 28
    .line 29
    .line 30
    return v1

    .line 31
    :cond_1
    return p2
.end method

.method public final P()Ll/sgr0;
    .locals 3

    .line 1
    new-instance v0, Ll/z0z0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-direct {v0, v1, v2}, Ll/z0z0;-><init>(IZ)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/b1z0;->A(Ll/z0z0;)Ll/sgr0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final a(Ll/gay0;)Z
    .locals 1

    .line 1
    iget-boolean p1, p0, Ll/b1z0;->I:Z

    .line 2
    .line 3
    if-nez p1, :cond_2

    .line 4
    .line 5
    iget-object p1, p0, Ll/b1z0;->h:Ll/a7z0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/a7z0;->k()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-boolean v0, p0, Ll/b1z0;->G:Z

    .line 14
    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    iget-boolean v0, p0, Ll/b1z0;->t:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget v0, p0, Ll/b1z0;->C:I

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/b1z0;->j:Ll/bjv0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/bjv0;->e()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p1}, Ll/a7z0;->l()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/b1z0;->F()V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_1
    return v0

    .line 43
    :cond_2
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public final b(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public final c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/b1z0;->s:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/b1z0;->m:Landroid/os/Handler;

    .line 5
    .line 6
    iget-object p0, p0, Ll/b1z0;->k:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final bridge synthetic d(Ll/x6z0;JJZ)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    check-cast v1, Ll/w0z0;

    .line 6
    .line 7
    invoke-static {v1}, Ll/w0z0;->e(Ll/w0z0;)Ll/xsx0;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    new-instance v3, Ll/bzy0;

    .line 12
    .line 13
    invoke-static {v1}, Ll/w0z0;->a(Ll/w0z0;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v4

    .line 17
    invoke-static {v1}, Ll/w0z0;->d(Ll/w0z0;)Ll/akx0;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    invoke-virtual {v2}, Ll/xsx0;->k()Landroid/net/Uri;

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    invoke-virtual {v2}, Ll/xsx0;->l()Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object v8

    .line 29
    invoke-virtual {v2}, Ll/xsx0;->j()J

    .line 30
    .line 31
    .line 32
    move-result-wide v13

    .line 33
    move-wide/from16 v9, p2

    .line 34
    .line 35
    move-wide/from16 v11, p4

    .line 36
    .line 37
    invoke-direct/range {v3 .. v14}, Ll/bzy0;-><init>(JLl/akx0;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Ll/w0z0;->a(Ll/w0z0;)J

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/w0z0;->c(Ll/w0z0;)J

    .line 44
    .line 45
    .line 46
    move-result-wide v1

    .line 47
    iget-wide v4, v0, Ll/b1z0;->x:J

    .line 48
    .line 49
    new-instance v6, Ll/gzy0;

    .line 50
    .line 51
    invoke-static {v1, v2}, Ll/mpw0;->I(J)J

    .line 52
    .line 53
    .line 54
    move-result-wide v12

    .line 55
    invoke-static {v4, v5}, Ll/mpw0;->I(J)J

    .line 56
    .line 57
    .line 58
    move-result-wide v14

    .line 59
    const/4 v7, 0x1

    .line 60
    const/4 v8, -0x1

    .line 61
    const/4 v9, 0x0

    .line 62
    const/4 v10, 0x0

    .line 63
    const/4 v11, 0x0

    .line 64
    invoke-direct/range {v6 .. v15}, Ll/gzy0;-><init>(IILl/sqr0;ILjava/lang/Object;JJ)V

    .line 65
    .line 66
    .line 67
    iget-object v1, v0, Ll/b1z0;->d:Ll/l0z0;

    .line 68
    .line 69
    invoke-virtual {v1, v3, v6}, Ll/l0z0;->d(Ll/bzy0;Ll/gzy0;)V

    .line 70
    .line 71
    .line 72
    if-nez p6, :cond_1

    .line 73
    .line 74
    iget-object v1, v0, Ll/b1z0;->q:[Ll/e2z0;

    .line 75
    .line 76
    array-length v2, v1

    .line 77
    const/4 v3, 0x0

    .line 78
    move v4, v3

    .line 79
    :goto_0
    if-ge v4, v2, :cond_0

    .line 80
    .line 81
    aget-object v5, v1, v4

    .line 82
    .line 83
    invoke-virtual {v5, v3}, Ll/e2z0;->H(Z)V

    .line 84
    .line 85
    .line 86
    add-int/lit8 v4, v4, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    iget v1, v0, Ll/b1z0;->C:I

    .line 90
    .line 91
    if-lez v1, :cond_1

    .line 92
    .line 93
    iget-object v1, v0, Ll/b1z0;->o:Ll/hzy0;

    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    .line 97
    .line 98
    invoke-interface {v1, v0}, Ll/g2z0;->c(Ll/h2z0;)V

    .line 99
    .line 100
    .line 101
    :cond_1
    return-void
.end method

.method public final e([Ll/n5z0;[Z[Ll/f2z0;[ZJ)J
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/b1z0;->B()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b1z0;->v:Ll/a1z0;

    .line 5
    .line 6
    iget-object v1, v0, Ll/a1z0;->a:Ll/q2z0;

    .line 7
    .line 8
    iget-object v0, v0, Ll/a1z0;->c:[Z

    .line 9
    .line 10
    iget v2, p0, Ll/b1z0;->C:I

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    move v4, v3

    .line 14
    :goto_0
    array-length v5, p1

    .line 15
    if-ge v4, v5, :cond_2

    .line 16
    .line 17
    aget-object v5, p3, v4

    .line 18
    .line 19
    if-eqz v5, :cond_1

    .line 20
    .line 21
    aget-object v6, p1, v4

    .line 22
    .line 23
    if-eqz v6, :cond_0

    .line 24
    .line 25
    aget-boolean v6, p2, v4

    .line 26
    .line 27
    if-nez v6, :cond_1

    .line 28
    .line 29
    :cond_0
    check-cast v5, Ll/y0z0;

    .line 30
    .line 31
    invoke-static {v5}, Ll/y0z0;->c(Ll/y0z0;)I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    aget-boolean v6, v0, v5

    .line 36
    .line 37
    invoke-static {v6}, Ll/lev0;->f(Z)V

    .line 38
    .line 39
    .line 40
    iget v6, p0, Ll/b1z0;->C:I

    .line 41
    .line 42
    add-int/lit8 v6, v6, -0x1

    .line 43
    .line 44
    iput v6, p0, Ll/b1z0;->C:I

    .line 45
    .line 46
    aput-boolean v3, v0, v5

    .line 47
    .line 48
    const/4 v5, 0x0

    .line 49
    aput-object v5, p3, v4

    .line 50
    .line 51
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget-boolean p2, p0, Ll/b1z0;->n:Z

    .line 55
    .line 56
    const/4 v4, 0x1

    .line 57
    if-nez p2, :cond_3

    .line 58
    .line 59
    iget-boolean p2, p0, Ll/b1z0;->A:Z

    .line 60
    .line 61
    if-eqz p2, :cond_4

    .line 62
    .line 63
    if-nez v2, :cond_3

    .line 64
    .line 65
    :goto_1
    move p2, v4

    .line 66
    goto :goto_2

    .line 67
    :cond_3
    move p2, v3

    .line 68
    goto :goto_2

    .line 69
    :cond_4
    const-wide/16 v5, 0x0

    .line 70
    .line 71
    cmp-long p2, p5, v5

    .line 72
    .line 73
    if-eqz p2, :cond_5

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_5
    move p2, v3

    .line 77
    move-wide p5, v5

    .line 78
    :goto_2
    move v2, v3

    .line 79
    :goto_3
    array-length v5, p1

    .line 80
    if-ge v2, v5, :cond_a

    .line 81
    .line 82
    aget-object v5, p3, v2

    .line 83
    .line 84
    if-nez v5, :cond_9

    .line 85
    .line 86
    aget-object v5, p1, v2

    .line 87
    .line 88
    if-eqz v5, :cond_9

    .line 89
    .line 90
    invoke-interface {v5}, Ll/r5z0;->zzc()I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    if-ne v6, v4, :cond_6

    .line 95
    .line 96
    move v6, v4

    .line 97
    goto :goto_4

    .line 98
    :cond_6
    move v6, v3

    .line 99
    :goto_4
    invoke-static {v6}, Ll/lev0;->f(Z)V

    .line 100
    .line 101
    .line 102
    invoke-interface {v5, v3}, Ll/r5z0;->zza(I)I

    .line 103
    .line 104
    .line 105
    move-result v6

    .line 106
    if-nez v6, :cond_7

    .line 107
    .line 108
    move v6, v4

    .line 109
    goto :goto_5

    .line 110
    :cond_7
    move v6, v3

    .line 111
    :goto_5
    invoke-static {v6}, Ll/lev0;->f(Z)V

    .line 112
    .line 113
    .line 114
    invoke-interface {v5}, Ll/r5z0;->zze()Ll/t2u0;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-virtual {v1, v5}, Ll/q2z0;->a(Ll/t2u0;)I

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    aget-boolean v6, v0, v5

    .line 123
    .line 124
    xor-int/2addr v6, v4

    .line 125
    invoke-static {v6}, Ll/lev0;->f(Z)V

    .line 126
    .line 127
    .line 128
    iget v6, p0, Ll/b1z0;->C:I

    .line 129
    .line 130
    add-int/2addr v6, v4

    .line 131
    iput v6, p0, Ll/b1z0;->C:I

    .line 132
    .line 133
    aput-boolean v4, v0, v5

    .line 134
    .line 135
    new-instance v6, Ll/y0z0;

    .line 136
    .line 137
    invoke-direct {v6, p0, v5}, Ll/y0z0;-><init>(Ll/b1z0;I)V

    .line 138
    .line 139
    .line 140
    aput-object v6, p3, v2

    .line 141
    .line 142
    aput-boolean v4, p4, v2

    .line 143
    .line 144
    if-nez p2, :cond_9

    .line 145
    .line 146
    iget-object p2, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 147
    .line 148
    aget-object p2, p2, v5

    .line 149
    .line 150
    invoke-virtual {p2}, Ll/e2z0;->v()I

    .line 151
    .line 152
    .line 153
    move-result v5

    .line 154
    if-eqz v5, :cond_8

    .line 155
    .line 156
    invoke-virtual {p2, p5, p6, v4}, Ll/e2z0;->g(JZ)Z

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    if-nez p2, :cond_8

    .line 161
    .line 162
    move p2, v4

    .line 163
    goto :goto_6

    .line 164
    :cond_8
    move p2, v3

    .line 165
    :cond_9
    :goto_6
    add-int/lit8 v2, v2, 0x1

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_a
    iget p1, p0, Ll/b1z0;->C:I

    .line 169
    .line 170
    if-nez p1, :cond_d

    .line 171
    .line 172
    iput-boolean v3, p0, Ll/b1z0;->G:Z

    .line 173
    .line 174
    iput-boolean v3, p0, Ll/b1z0;->B:Z

    .line 175
    .line 176
    iget-object p1, p0, Ll/b1z0;->h:Ll/a7z0;

    .line 177
    .line 178
    invoke-virtual {p1}, Ll/a7z0;->l()Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    iget-object p2, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 183
    .line 184
    if-eqz p1, :cond_c

    .line 185
    .line 186
    array-length p1, p2

    .line 187
    :goto_7
    if-ge v3, p1, :cond_b

    .line 188
    .line 189
    aget-object p3, p2, v3

    .line 190
    .line 191
    invoke-virtual {p3}, Ll/e2z0;->C()V

    .line 192
    .line 193
    .line 194
    add-int/lit8 v3, v3, 0x1

    .line 195
    .line 196
    goto :goto_7

    .line 197
    :cond_b
    iget-object p1, p0, Ll/b1z0;->h:Ll/a7z0;

    .line 198
    .line 199
    invoke-virtual {p1}, Ll/a7z0;->g()V

    .line 200
    .line 201
    .line 202
    goto :goto_a

    .line 203
    :cond_c
    array-length p1, p2

    .line 204
    move p3, v3

    .line 205
    :goto_8
    if-ge p3, p1, :cond_f

    .line 206
    .line 207
    aget-object p4, p2, p3

    .line 208
    .line 209
    invoke-virtual {p4, v3}, Ll/e2z0;->H(Z)V

    .line 210
    .line 211
    .line 212
    add-int/lit8 p3, p3, 0x1

    .line 213
    .line 214
    goto :goto_8

    .line 215
    :cond_d
    if-eqz p2, :cond_f

    .line 216
    .line 217
    invoke-virtual {p0, p5, p6}, Ll/b1z0;->l(J)J

    .line 218
    .line 219
    .line 220
    move-result-wide p5

    .line 221
    :goto_9
    array-length p1, p3

    .line 222
    if-ge v3, p1, :cond_f

    .line 223
    .line 224
    aget-object p1, p3, v3

    .line 225
    .line 226
    if-eqz p1, :cond_e

    .line 227
    .line 228
    aput-boolean v4, p4, v3

    .line 229
    .line 230
    :cond_e
    add-int/lit8 v3, v3, 0x1

    .line 231
    .line 232
    goto :goto_9

    .line 233
    :cond_f
    :goto_a
    iput-boolean v4, p0, Ll/b1z0;->A:Z

    .line 234
    .line 235
    return-wide p5
.end method

.method public final f(JLl/gfy0;)J
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v3, p3

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/b1z0;->B()V

    .line 8
    .line 9
    .line 10
    iget-object v4, v0, Ll/b1z0;->w:Ll/bgr0;

    .line 11
    .line 12
    invoke-interface {v4}, Ll/bgr0;->zzh()Z

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    const-wide/16 v5, 0x0

    .line 17
    .line 18
    if-nez v4, :cond_0

    .line 19
    .line 20
    return-wide v5

    .line 21
    :cond_0
    iget-object v0, v0, Ll/b1z0;->w:Ll/bgr0;

    .line 22
    .line 23
    invoke-interface {v0, v1, v2}, Ll/bgr0;->a(J)Ll/zfr0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v4, v0, Ll/zfr0;->a:Ll/cgr0;

    .line 28
    .line 29
    iget-object v0, v0, Ll/zfr0;->b:Ll/cgr0;

    .line 30
    .line 31
    iget-wide v7, v3, Ll/gfy0;->a:J

    .line 32
    .line 33
    cmp-long v9, v7, v5

    .line 34
    .line 35
    if-nez v9, :cond_2

    .line 36
    .line 37
    iget-wide v7, v3, Ll/gfy0;->b:J

    .line 38
    .line 39
    cmp-long v7, v7, v5

    .line 40
    .line 41
    if-nez v7, :cond_1

    .line 42
    .line 43
    return-wide v1

    .line 44
    :cond_1
    move-wide v7, v5

    .line 45
    :cond_2
    iget-wide v9, v4, Ll/cgr0;->a:J

    .line 46
    .line 47
    sget v4, Ll/mpw0;->a:I

    .line 48
    .line 49
    sub-long v11, v1, v7

    .line 50
    .line 51
    xor-long/2addr v7, v1

    .line 52
    xor-long v13, v1, v11

    .line 53
    .line 54
    iget-wide v3, v3, Ll/gfy0;->b:J

    .line 55
    .line 56
    add-long v15, v1, v3

    .line 57
    .line 58
    xor-long v17, v1, v15

    .line 59
    .line 60
    xor-long/2addr v3, v15

    .line 61
    and-long/2addr v7, v13

    .line 62
    cmp-long v7, v7, v5

    .line 63
    .line 64
    if-gez v7, :cond_3

    .line 65
    .line 66
    const-wide/high16 v11, -0x8000000000000000L

    .line 67
    .line 68
    :cond_3
    and-long v3, v17, v3

    .line 69
    .line 70
    cmp-long v3, v3, v5

    .line 71
    .line 72
    if-gez v3, :cond_4

    .line 73
    .line 74
    const-wide v15, 0x7fffffffffffffffL

    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    :cond_4
    cmp-long v3, v11, v9

    .line 80
    .line 81
    const/4 v4, 0x1

    .line 82
    const/4 v5, 0x0

    .line 83
    if-gtz v3, :cond_5

    .line 84
    .line 85
    cmp-long v3, v9, v15

    .line 86
    .line 87
    if-gtz v3, :cond_5

    .line 88
    .line 89
    move v3, v4

    .line 90
    goto :goto_0

    .line 91
    :cond_5
    move v3, v5

    .line 92
    :goto_0
    iget-wide v6, v0, Ll/cgr0;->a:J

    .line 93
    .line 94
    cmp-long v0, v11, v6

    .line 95
    .line 96
    if-gtz v0, :cond_6

    .line 97
    .line 98
    cmp-long v0, v6, v15

    .line 99
    .line 100
    if-gtz v0, :cond_6

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_6
    move v4, v5

    .line 104
    :goto_1
    if-eqz v3, :cond_7

    .line 105
    .line 106
    if-eqz v4, :cond_7

    .line 107
    .line 108
    sub-long v3, v9, v1

    .line 109
    .line 110
    sub-long v0, v6, v1

    .line 111
    .line 112
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    .line 113
    .line 114
    .line 115
    move-result-wide v2

    .line 116
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 117
    .line 118
    .line 119
    move-result-wide v0

    .line 120
    cmp-long v0, v2, v0

    .line 121
    .line 122
    if-gtz v0, :cond_9

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_7
    if-eqz v3, :cond_8

    .line 126
    .line 127
    :goto_2
    return-wide v9

    .line 128
    :cond_8
    if-eqz v4, :cond_a

    .line 129
    .line 130
    :cond_9
    return-wide v6

    .line 131
    :cond_a
    return-wide v11
.end method

.method public final g(JZ)V
    .locals 5

    .line 1
    iget-boolean p3, p0, Ll/b1z0;->n:Z

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/b1z0;->B()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/b1z0;->G()Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-nez p3, :cond_1

    .line 14
    .line 15
    iget-object p3, p0, Ll/b1z0;->v:Ll/a1z0;

    .line 16
    .line 17
    iget-object p3, p3, Ll/a1z0;->c:[Z

    .line 18
    .line 19
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 20
    .line 21
    array-length v0, v0

    .line 22
    const/4 v1, 0x0

    .line 23
    move v2, v1

    .line 24
    :goto_0
    if-ge v2, v0, :cond_1

    .line 25
    .line 26
    iget-object v3, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 27
    .line 28
    aget-object v3, v3, v2

    .line 29
    .line 30
    aget-boolean v4, p3, v2

    .line 31
    .line 32
    invoke-virtual {v3, p1, p2, v1, v4}, Ll/e2z0;->B(JZZ)V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    :goto_1
    return-void
.end method

.method public final bridge synthetic h(Ll/x6z0;JJLjava/io/IOException;I)Ll/v6z0;
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p6

    .line 4
    .line 5
    move-object/from16 v2, p1

    .line 6
    .line 7
    check-cast v2, Ll/w0z0;

    .line 8
    .line 9
    invoke-static {v2}, Ll/w0z0;->e(Ll/w0z0;)Ll/xsx0;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    new-instance v4, Ll/bzy0;

    .line 14
    .line 15
    invoke-static {v2}, Ll/w0z0;->a(Ll/w0z0;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v5

    .line 19
    invoke-static {v2}, Ll/w0z0;->d(Ll/w0z0;)Ll/akx0;

    .line 20
    .line 21
    .line 22
    move-result-object v7

    .line 23
    invoke-virtual {v3}, Ll/xsx0;->k()Landroid/net/Uri;

    .line 24
    .line 25
    .line 26
    move-result-object v8

    .line 27
    invoke-virtual {v3}, Ll/xsx0;->l()Ljava/util/Map;

    .line 28
    .line 29
    .line 30
    move-result-object v9

    .line 31
    invoke-virtual {v3}, Ll/xsx0;->j()J

    .line 32
    .line 33
    .line 34
    move-result-wide v14

    .line 35
    move-wide/from16 v10, p2

    .line 36
    .line 37
    move-wide/from16 v12, p4

    .line 38
    .line 39
    invoke-direct/range {v4 .. v15}, Ll/bzy0;-><init>(JLl/akx0;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 40
    .line 41
    .line 42
    invoke-static {v2}, Ll/w0z0;->c(Ll/w0z0;)J

    .line 43
    .line 44
    .line 45
    sget v3, Ll/mpw0;->a:I

    .line 46
    .line 47
    instance-of v3, v1, Lcom/google/android/gms/internal/ads/zzcc;

    .line 48
    .line 49
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    if-nez v3, :cond_0

    .line 55
    .line 56
    instance-of v3, v1, Ljava/io/FileNotFoundException;

    .line 57
    .line 58
    if-nez v3, :cond_0

    .line 59
    .line 60
    instance-of v3, v1, Lcom/google/android/gms/internal/ads/zzho;

    .line 61
    .line 62
    if-nez v3, :cond_0

    .line 63
    .line 64
    instance-of v3, v1, Lcom/google/android/gms/internal/ads/zzzj;

    .line 65
    .line 66
    if-nez v3, :cond_0

    .line 67
    .line 68
    move-object v3, v1

    .line 69
    :goto_0
    if-eqz v3, :cond_2

    .line 70
    .line 71
    instance-of v7, v3, Lcom/google/android/gms/internal/ads/zzgx;

    .line 72
    .line 73
    if-eqz v7, :cond_1

    .line 74
    .line 75
    move-object v7, v3

    .line 76
    check-cast v7, Lcom/google/android/gms/internal/ads/zzgx;

    .line 77
    .line 78
    iget v7, v7, Lcom/google/android/gms/internal/ads/zzgx;->zza:I

    .line 79
    .line 80
    const/16 v8, 0x7d8

    .line 81
    .line 82
    if-ne v7, v8, :cond_1

    .line 83
    .line 84
    :cond_0
    move-wide v7, v5

    .line 85
    goto :goto_1

    .line 86
    :cond_1
    invoke-virtual {v3}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    goto :goto_0

    .line 91
    :cond_2
    add-int/lit8 v3, p7, -0x1

    .line 92
    .line 93
    mul-int/lit16 v3, v3, 0x3e8

    .line 94
    .line 95
    const/16 v7, 0x1388

    .line 96
    .line 97
    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    int-to-long v7, v3

    .line 102
    :goto_1
    cmp-long v3, v7, v5

    .line 103
    .line 104
    if-nez v3, :cond_3

    .line 105
    .line 106
    sget-object v3, Ll/a7z0;->g:Ll/v6z0;

    .line 107
    .line 108
    goto :goto_6

    .line 109
    :cond_3
    invoke-virtual {v0}, Ll/b1z0;->y()I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    iget v9, v0, Ll/b1z0;->H:I

    .line 114
    .line 115
    const/4 v10, 0x0

    .line 116
    const/4 v11, 0x1

    .line 117
    if-le v3, v9, :cond_4

    .line 118
    .line 119
    move v9, v11

    .line 120
    goto :goto_2

    .line 121
    :cond_4
    move v9, v10

    .line 122
    :goto_2
    iget-boolean v12, v0, Ll/b1z0;->D:Z

    .line 123
    .line 124
    if-nez v12, :cond_8

    .line 125
    .line 126
    iget-object v12, v0, Ll/b1z0;->w:Ll/bgr0;

    .line 127
    .line 128
    if-eqz v12, :cond_5

    .line 129
    .line 130
    invoke-interface {v12}, Ll/bgr0;->zza()J

    .line 131
    .line 132
    .line 133
    move-result-wide v12

    .line 134
    cmp-long v5, v12, v5

    .line 135
    .line 136
    if-eqz v5, :cond_5

    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_5
    iget-boolean v3, v0, Ll/b1z0;->t:Z

    .line 140
    .line 141
    if-eqz v3, :cond_6

    .line 142
    .line 143
    invoke-virtual {v0}, Ll/b1z0;->H()Z

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    if-nez v5, :cond_6

    .line 148
    .line 149
    iput-boolean v11, v0, Ll/b1z0;->G:Z

    .line 150
    .line 151
    sget-object v3, Ll/a7z0;->f:Ll/v6z0;

    .line 152
    .line 153
    goto :goto_6

    .line 154
    :cond_6
    iput-boolean v3, v0, Ll/b1z0;->B:Z

    .line 155
    .line 156
    const-wide/16 v5, 0x0

    .line 157
    .line 158
    iput-wide v5, v0, Ll/b1z0;->E:J

    .line 159
    .line 160
    iput v10, v0, Ll/b1z0;->H:I

    .line 161
    .line 162
    iget-object v3, v0, Ll/b1z0;->q:[Ll/e2z0;

    .line 163
    .line 164
    array-length v11, v3

    .line 165
    move v12, v10

    .line 166
    :goto_3
    if-ge v12, v11, :cond_7

    .line 167
    .line 168
    aget-object v13, v3, v12

    .line 169
    .line 170
    invoke-virtual {v13, v10}, Ll/e2z0;->H(Z)V

    .line 171
    .line 172
    .line 173
    add-int/lit8 v12, v12, 0x1

    .line 174
    .line 175
    goto :goto_3

    .line 176
    :cond_7
    invoke-static {v2, v5, v6, v5, v6}, Ll/w0z0;->f(Ll/w0z0;JJ)V

    .line 177
    .line 178
    .line 179
    goto :goto_5

    .line 180
    :cond_8
    :goto_4
    iput v3, v0, Ll/b1z0;->H:I

    .line 181
    .line 182
    :goto_5
    invoke-static {v9, v7, v8}, Ll/a7z0;->b(ZJ)Ll/v6z0;

    .line 183
    .line 184
    .line 185
    move-result-object v3

    .line 186
    :goto_6
    invoke-virtual {v3}, Ll/v6z0;->c()Z

    .line 187
    .line 188
    .line 189
    move-result v5

    .line 190
    xor-int/lit8 v6, v5, 0x1

    .line 191
    .line 192
    iget-object v7, v0, Ll/b1z0;->d:Ll/l0z0;

    .line 193
    .line 194
    invoke-static {v2}, Ll/w0z0;->c(Ll/w0z0;)J

    .line 195
    .line 196
    .line 197
    move-result-wide v8

    .line 198
    iget-wide v10, v0, Ll/b1z0;->x:J

    .line 199
    .line 200
    invoke-static {v8, v9}, Ll/mpw0;->I(J)J

    .line 201
    .line 202
    .line 203
    move-result-wide v18

    .line 204
    invoke-static {v10, v11}, Ll/mpw0;->I(J)J

    .line 205
    .line 206
    .line 207
    move-result-wide v20

    .line 208
    new-instance v12, Ll/gzy0;

    .line 209
    .line 210
    const/16 v16, 0x0

    .line 211
    .line 212
    const/16 v17, 0x0

    .line 213
    .line 214
    const/4 v13, 0x1

    .line 215
    const/4 v14, -0x1

    .line 216
    const/4 v15, 0x0

    .line 217
    invoke-direct/range {v12 .. v21}, Ll/gzy0;-><init>(IILl/sqr0;ILjava/lang/Object;JJ)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v7, v4, v12, v1, v6}, Ll/l0z0;->f(Ll/bzy0;Ll/gzy0;Ljava/io/IOException;Z)V

    .line 221
    .line 222
    .line 223
    if-nez v5, :cond_9

    .line 224
    .line 225
    invoke-static {v2}, Ll/w0z0;->a(Ll/w0z0;)J

    .line 226
    .line 227
    .line 228
    :cond_9
    return-object v3
.end method

.method public final i(II)Ll/sgr0;
    .locals 1

    .line 1
    new-instance p2, Ll/z0z0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p2, p1, v0}, Ll/z0z0;-><init>(IZ)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/b1z0;->A(Ll/z0z0;)Ll/sgr0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final j(Ll/bgr0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/u0z0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/u0z0;-><init>(Ll/b1z0;Ll/bgr0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/b1z0;->m:Landroid/os/Handler;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final k(Ll/hzy0;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b1z0;->o:Ll/hzy0;

    .line 2
    .line 3
    iget-object p1, p0, Ll/b1z0;->j:Ll/bjv0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/bjv0;->e()Z

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/b1z0;->F()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final l(J)J
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/b1z0;->B()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b1z0;->v:Ll/a1z0;

    .line 5
    .line 6
    iget-object v0, v0, Ll/a1z0;->b:[Z

    .line 7
    .line 8
    iget-object v1, p0, Ll/b1z0;->w:Ll/bgr0;

    .line 9
    .line 10
    invoke-interface {v1}, Ll/bgr0;->zzh()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    if-eq v2, v1, :cond_0

    .line 16
    .line 17
    const-wide/16 p1, 0x0

    .line 18
    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    iput-boolean v1, p0, Ll/b1z0;->B:Z

    .line 21
    .line 22
    iput-wide p1, p0, Ll/b1z0;->E:J

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/b1z0;->G()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    iput-wide p1, p0, Ll/b1z0;->F:J

    .line 31
    .line 32
    return-wide p1

    .line 33
    :cond_1
    iget v2, p0, Ll/b1z0;->z:I

    .line 34
    .line 35
    const/4 v3, 0x7

    .line 36
    if-eq v2, v3, :cond_4

    .line 37
    .line 38
    iget-object v2, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 39
    .line 40
    array-length v2, v2

    .line 41
    move v3, v1

    .line 42
    :goto_0
    if-ge v3, v2, :cond_7

    .line 43
    .line 44
    iget-object v4, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 45
    .line 46
    aget-object v4, v4, v3

    .line 47
    .line 48
    iget-boolean v5, p0, Ll/b1z0;->n:Z

    .line 49
    .line 50
    if-eqz v5, :cond_2

    .line 51
    .line 52
    invoke-virtual {v4}, Ll/e2z0;->u()I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    invoke-virtual {v4, v5}, Ll/e2z0;->N(I)Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    invoke-virtual {v4, p1, p2, v1}, Ll/e2z0;->g(JZ)Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    :goto_1
    if-nez v4, :cond_3

    .line 66
    .line 67
    aget-boolean v4, v0, v3

    .line 68
    .line 69
    if-nez v4, :cond_4

    .line 70
    .line 71
    iget-boolean v4, p0, Ll/b1z0;->u:Z

    .line 72
    .line 73
    if-nez v4, :cond_3

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_4
    :goto_2
    iput-boolean v1, p0, Ll/b1z0;->G:Z

    .line 80
    .line 81
    iput-wide p1, p0, Ll/b1z0;->F:J

    .line 82
    .line 83
    iput-boolean v1, p0, Ll/b1z0;->I:Z

    .line 84
    .line 85
    iget-object v0, p0, Ll/b1z0;->h:Ll/a7z0;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/a7z0;->l()Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_6

    .line 92
    .line 93
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 94
    .line 95
    array-length v2, v0

    .line 96
    :goto_3
    if-ge v1, v2, :cond_5

    .line 97
    .line 98
    aget-object v3, v0, v1

    .line 99
    .line 100
    invoke-virtual {v3}, Ll/e2z0;->C()V

    .line 101
    .line 102
    .line 103
    add-int/lit8 v1, v1, 0x1

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_5
    iget-object p0, p0, Ll/b1z0;->h:Ll/a7z0;

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/a7z0;->g()V

    .line 109
    .line 110
    .line 111
    return-wide p1

    .line 112
    :cond_6
    invoke-virtual {v0}, Ll/a7z0;->h()V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 116
    .line 117
    array-length v0, p0

    .line 118
    move v2, v1

    .line 119
    :goto_4
    if-ge v2, v0, :cond_7

    .line 120
    .line 121
    aget-object v3, p0, v2

    .line 122
    .line 123
    invoke-virtual {v3, v1}, Ll/e2z0;->H(Z)V

    .line 124
    .line 125
    .line 126
    add-int/lit8 v2, v2, 0x1

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :cond_7
    return-wide p1
.end method

.method public final bridge synthetic m(Ll/x6z0;JJ)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Ll/b1z0;->x:J

    .line 4
    .line 5
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmp-long v1, v1, v3

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    iget-object v1, v0, Ll/b1z0;->w:Ll/bgr0;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-interface {v1}, Ll/bgr0;->zzh()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v2}, Ll/b1z0;->z(Z)J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    const-wide/high16 v5, -0x8000000000000000L

    .line 28
    .line 29
    cmp-long v5, v3, v5

    .line 30
    .line 31
    if-nez v5, :cond_0

    .line 32
    .line 33
    const-wide/16 v3, 0x0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-wide/16 v5, 0x2710

    .line 37
    .line 38
    add-long/2addr v3, v5

    .line 39
    :goto_0
    iput-wide v3, v0, Ll/b1z0;->x:J

    .line 40
    .line 41
    iget-object v5, v0, Ll/b1z0;->f:Ll/x0z0;

    .line 42
    .line 43
    iget-boolean v6, v0, Ll/b1z0;->y:Z

    .line 44
    .line 45
    invoke-interface {v5, v3, v4, v1, v6}, Ll/x0z0;->c(JZZ)V

    .line 46
    .line 47
    .line 48
    :cond_1
    move-object/from16 v1, p1

    .line 49
    .line 50
    check-cast v1, Ll/w0z0;

    .line 51
    .line 52
    invoke-static {v1}, Ll/w0z0;->e(Ll/w0z0;)Ll/xsx0;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    new-instance v4, Ll/bzy0;

    .line 57
    .line 58
    invoke-static {v1}, Ll/w0z0;->a(Ll/w0z0;)J

    .line 59
    .line 60
    .line 61
    move-result-wide v5

    .line 62
    invoke-static {v1}, Ll/w0z0;->d(Ll/w0z0;)Ll/akx0;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    invoke-virtual {v3}, Ll/xsx0;->k()Landroid/net/Uri;

    .line 67
    .line 68
    .line 69
    move-result-object v8

    .line 70
    invoke-virtual {v3}, Ll/xsx0;->l()Ljava/util/Map;

    .line 71
    .line 72
    .line 73
    move-result-object v9

    .line 74
    invoke-virtual {v3}, Ll/xsx0;->j()J

    .line 75
    .line 76
    .line 77
    move-result-wide v14

    .line 78
    move-wide/from16 v10, p2

    .line 79
    .line 80
    move-wide/from16 v12, p4

    .line 81
    .line 82
    invoke-direct/range {v4 .. v15}, Ll/bzy0;-><init>(JLl/akx0;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/w0z0;->a(Ll/w0z0;)J

    .line 86
    .line 87
    .line 88
    iget-object v3, v0, Ll/b1z0;->d:Ll/l0z0;

    .line 89
    .line 90
    invoke-static {v1}, Ll/w0z0;->c(Ll/w0z0;)J

    .line 91
    .line 92
    .line 93
    move-result-wide v5

    .line 94
    iget-wide v7, v0, Ll/b1z0;->x:J

    .line 95
    .line 96
    new-instance v9, Ll/gzy0;

    .line 97
    .line 98
    invoke-static {v5, v6}, Ll/mpw0;->I(J)J

    .line 99
    .line 100
    .line 101
    move-result-wide v15

    .line 102
    invoke-static {v7, v8}, Ll/mpw0;->I(J)J

    .line 103
    .line 104
    .line 105
    move-result-wide v17

    .line 106
    const/4 v10, 0x1

    .line 107
    const/4 v11, -0x1

    .line 108
    const/4 v12, 0x0

    .line 109
    const/4 v13, 0x0

    .line 110
    const/4 v14, 0x0

    .line 111
    invoke-direct/range {v9 .. v18}, Ll/gzy0;-><init>(IILl/sqr0;ILjava/lang/Object;JJ)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v3, v4, v9}, Ll/l0z0;->e(Ll/bzy0;Ll/gzy0;)V

    .line 115
    .line 116
    .line 117
    iput-boolean v2, v0, Ll/b1z0;->I:Z

    .line 118
    .line 119
    iget-object v1, v0, Ll/b1z0;->o:Ll/hzy0;

    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 122
    .line 123
    .line 124
    invoke-interface {v1, v0}, Ll/g2z0;->c(Ll/h2z0;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public final n(Ll/sqr0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/b1z0;->m:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object p0, p0, Ll/b1z0;->k:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic r()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/b1z0;->J:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/b1z0;->o:Ll/hzy0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, p0}, Ll/g2z0;->c(Ll/h2z0;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic s()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/b1z0;->D:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic t(Ll/bgr0;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/b1z0;->p:Lcom/google/android/gms/internal/ads/zzaga;

    .line 2
    .line 3
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    move-object v0, p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ll/agr0;

    .line 13
    .line 14
    const-wide/16 v3, 0x0

    .line 15
    .line 16
    invoke-direct {v0, v1, v2, v3, v4}, Ll/agr0;-><init>(JJ)V

    .line 17
    .line 18
    .line 19
    :goto_0
    iput-object v0, p0, Ll/b1z0;->w:Ll/bgr0;

    .line 20
    .line 21
    invoke-interface {p1}, Ll/bgr0;->zza()J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    cmp-long v0, v3, v1

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-wide v3, p0, Ll/b1z0;->x:J

    .line 30
    .line 31
    cmp-long v0, v3, v1

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    new-instance v0, Ll/v0z0;

    .line 36
    .line 37
    iget-object v3, p0, Ll/b1z0;->w:Ll/bgr0;

    .line 38
    .line 39
    invoke-direct {v0, p0, v3}, Ll/v0z0;-><init>(Ll/b1z0;Ll/bgr0;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/b1z0;->w:Ll/bgr0;

    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Ll/b1z0;->w:Ll/bgr0;

    .line 45
    .line 46
    invoke-interface {v0}, Ll/bgr0;->zza()J

    .line 47
    .line 48
    .line 49
    move-result-wide v3

    .line 50
    iput-wide v3, p0, Ll/b1z0;->x:J

    .line 51
    .line 52
    iget-boolean v0, p0, Ll/b1z0;->D:Z

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    const/4 v4, 0x1

    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    invoke-interface {p1}, Ll/bgr0;->zza()J

    .line 59
    .line 60
    .line 61
    move-result-wide v5

    .line 62
    cmp-long v0, v5, v1

    .line 63
    .line 64
    if-nez v0, :cond_2

    .line 65
    .line 66
    move v3, v4

    .line 67
    :cond_2
    iput-boolean v3, p0, Ll/b1z0;->y:Z

    .line 68
    .line 69
    if-eq v4, v3, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    const/4 v4, 0x7

    .line 73
    :goto_1
    iput v4, p0, Ll/b1z0;->z:I

    .line 74
    .line 75
    iget-object v0, p0, Ll/b1z0;->f:Ll/x0z0;

    .line 76
    .line 77
    iget-wide v1, p0, Ll/b1z0;->x:J

    .line 78
    .line 79
    invoke-interface {p1}, Ll/bgr0;->zzh()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iget-boolean v3, p0, Ll/b1z0;->y:Z

    .line 84
    .line 85
    invoke-interface {v0, v1, v2, p1, v3}, Ll/x0z0;->c(JZZ)V

    .line 86
    .line 87
    .line 88
    iget-boolean p1, p0, Ll/b1z0;->t:Z

    .line 89
    .line 90
    if-nez p1, :cond_4

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/b1z0;->C()V

    .line 93
    .line 94
    .line 95
    :cond_4
    return-void
.end method

.method public final u()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/b1z0;->z:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/s6z0;->a(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Ll/b1z0;->h:Ll/a7z0;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/a7z0;->i(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final v(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 2
    .line 3
    aget-object p1, v0, p1

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/e2z0;->E()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/b1z0;->u()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final w()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/b1z0;->t:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 6
    .line 7
    array-length v1, v0

    .line 8
    const/4 v2, 0x0

    .line 9
    :goto_0
    if-ge v2, v1, :cond_0

    .line 10
    .line 11
    aget-object v3, v0, v2

    .line 12
    .line 13
    invoke-virtual {v3}, Ll/e2z0;->F()V

    .line 14
    .line 15
    .line 16
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Ll/b1z0;->h:Ll/a7z0;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ll/a7z0;->j(Ll/y6z0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/b1z0;->m:Landroid/os/Handler;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Ll/b1z0;->o:Ll/hzy0;

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    iput-boolean v0, p0, Ll/b1z0;->J:Z

    .line 34
    .line 35
    return-void
.end method

.method public final x(I)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/b1z0;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 8
    .line 9
    aget-object p1, v0, p1

    .line 10
    .line 11
    iget-boolean p0, p0, Ll/b1z0;->I:Z

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ll/e2z0;->M(Z)Z

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

.method public final y()I
    .locals 4

    .line 1
    iget-object p0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v1, v0, :cond_0

    .line 7
    .line 8
    aget-object v3, p0, v1

    .line 9
    .line 10
    invoke-virtual {v3}, Ll/e2z0;->x()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    add-int/2addr v2, v3

    .line 15
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return v2
.end method

.method public final z(Z)J
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const-wide/high16 v1, -0x8000000000000000L

    .line 3
    .line 4
    :goto_0
    iget-object v3, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 5
    .line 6
    array-length v4, v3

    .line 7
    if-ge v0, v4, :cond_2

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object v4, p0, Ll/b1z0;->v:Ll/a1z0;

    .line 12
    .line 13
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    iget-object v4, v4, Ll/a1z0;->c:[Z

    .line 17
    .line 18
    aget-boolean v4, v4, v0

    .line 19
    .line 20
    if-eqz v4, :cond_1

    .line 21
    .line 22
    :cond_0
    aget-object v3, v3, v0

    .line 23
    .line 24
    invoke-virtual {v3}, Ll/e2z0;->z()J

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    return-wide v1
.end method

.method public final zzL()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    if-ge v2, v1, :cond_0

    .line 6
    .line 7
    aget-object v3, v0, v2

    .line 8
    .line 9
    invoke-virtual {v3}, Ll/e2z0;->G()V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v2, v2, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Ll/b1z0;->i:Ll/q0z0;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/q0z0;->zze()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final zzb()J
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/b1z0;->B()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/b1z0;->I:Z

    .line 5
    .line 6
    const-wide/high16 v1, -0x8000000000000000L

    .line 7
    .line 8
    if-nez v0, :cond_7

    .line 9
    .line 10
    iget v0, p0, Ll/b1z0;->C:I

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/b1z0;->G()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-wide v0, p0, Ll/b1z0;->F:J

    .line 22
    .line 23
    return-wide v0

    .line 24
    :cond_1
    iget-boolean v0, p0, Ll/b1z0;->u:Z

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    const-wide v4, 0x7fffffffffffffffL

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    iget-object v0, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 35
    .line 36
    array-length v0, v0

    .line 37
    move v6, v3

    .line 38
    move-wide v7, v4

    .line 39
    :goto_0
    if-ge v6, v0, :cond_4

    .line 40
    .line 41
    iget-object v9, p0, Ll/b1z0;->v:Ll/a1z0;

    .line 42
    .line 43
    iget-object v10, v9, Ll/a1z0;->b:[Z

    .line 44
    .line 45
    aget-boolean v10, v10, v6

    .line 46
    .line 47
    if-eqz v10, :cond_2

    .line 48
    .line 49
    iget-object v9, v9, Ll/a1z0;->c:[Z

    .line 50
    .line 51
    aget-boolean v9, v9, v6

    .line 52
    .line 53
    if-eqz v9, :cond_2

    .line 54
    .line 55
    iget-object v9, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 56
    .line 57
    aget-object v9, v9, v6

    .line 58
    .line 59
    invoke-virtual {v9}, Ll/e2z0;->L()Z

    .line 60
    .line 61
    .line 62
    move-result v9

    .line 63
    if-nez v9, :cond_2

    .line 64
    .line 65
    iget-object v9, p0, Ll/b1z0;->q:[Ll/e2z0;

    .line 66
    .line 67
    aget-object v9, v9, v6

    .line 68
    .line 69
    invoke-virtual {v9}, Ll/e2z0;->z()J

    .line 70
    .line 71
    .line 72
    move-result-wide v9

    .line 73
    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->min(JJ)J

    .line 74
    .line 75
    .line 76
    move-result-wide v7

    .line 77
    :cond_2
    add-int/lit8 v6, v6, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    move-wide v7, v4

    .line 81
    :cond_4
    cmp-long v0, v7, v4

    .line 82
    .line 83
    if-nez v0, :cond_5

    .line 84
    .line 85
    invoke-virtual {p0, v3}, Ll/b1z0;->z(Z)J

    .line 86
    .line 87
    .line 88
    move-result-wide v7

    .line 89
    :cond_5
    cmp-long v0, v7, v1

    .line 90
    .line 91
    if-nez v0, :cond_6

    .line 92
    .line 93
    iget-wide v0, p0, Ll/b1z0;->E:J

    .line 94
    .line 95
    return-wide v0

    .line 96
    :cond_6
    return-wide v7

    .line 97
    :cond_7
    :goto_1
    return-wide v1
.end method

.method public final zzc()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/b1z0;->zzb()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public final zzd()J
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/b1z0;->B:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/b1z0;->I:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/b1z0;->y()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget v1, p0, Ll/b1z0;->H:I

    .line 14
    .line 15
    if-le v0, v1, :cond_1

    .line 16
    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Ll/b1z0;->B:Z

    .line 19
    .line 20
    iget-wide v0, p0, Ll/b1z0;->E:J

    .line 21
    .line 22
    return-wide v0

    .line 23
    :cond_1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    return-wide v0
.end method

.method public final zzh()Ll/q2z0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b1z0;->B()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/b1z0;->v:Ll/a1z0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/a1z0;->a:Ll/q2z0;

    .line 7
    .line 8
    return-object p0
.end method

.method public final zzk()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/b1z0;->u()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/b1z0;->I:Z

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-boolean p0, p0, Ll/b1z0;->t:Z

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string p0, "Loading finished before preparation is complete."

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    throw p0

    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public final zzp()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b1z0;->h:Ll/a7z0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/a7z0;->l()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/b1z0;->j:Ll/bjv0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/bjv0;->d()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method
