.class public final Ll/ofr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:J

.field public final k:Ll/nfr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final l:Lcom/google/android/gms/internal/ads/zzby;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(IIIIIIIJLl/nfr0;Lcom/google/android/gms/internal/ads/zzby;)V
    .locals 0
    .param p10    # Ll/nfr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p11    # Lcom/google/android/gms/internal/ads/zzby;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/ofr0;->a:I

    iput p2, p0, Ll/ofr0;->b:I

    iput p3, p0, Ll/ofr0;->c:I

    iput p4, p0, Ll/ofr0;->d:I

    iput p5, p0, Ll/ofr0;->e:I

    invoke-static {p5}, Ll/ofr0;->i(I)I

    move-result p1

    iput p1, p0, Ll/ofr0;->f:I

    iput p6, p0, Ll/ofr0;->g:I

    iput p7, p0, Ll/ofr0;->h:I

    invoke-static {p7}, Ll/ofr0;->h(I)I

    move-result p1

    iput p1, p0, Ll/ofr0;->i:I

    iput-wide p8, p0, Ll/ofr0;->j:J

    iput-object p10, p0, Ll/ofr0;->k:Ll/nfr0;

    iput-object p11, p0, Ll/ofr0;->l:Lcom/google/android/gms/internal/ads/zzby;

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dfw0;

    .line 5
    .line 6
    array-length v1, p1

    .line 7
    invoke-direct {v0, p1, v1}, Ll/dfw0;-><init>([BI)V

    .line 8
    .line 9
    .line 10
    mul-int/lit8 p2, p2, 0x8

    .line 11
    .line 12
    invoke-virtual {v0, p2}, Ll/dfw0;->k(I)V

    .line 13
    .line 14
    .line 15
    const/16 p1, 0x10

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ll/dfw0;->d(I)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    iput p2, p0, Ll/ofr0;->a:I

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/dfw0;->d(I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Ll/ofr0;->b:I

    .line 28
    .line 29
    const/16 p1, 0x18

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ll/dfw0;->d(I)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iput p2, p0, Ll/ofr0;->c:I

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ll/dfw0;->d(I)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Ll/ofr0;->d:I

    .line 42
    .line 43
    const/16 p1, 0x14

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ll/dfw0;->d(I)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iput p1, p0, Ll/ofr0;->e:I

    .line 50
    .line 51
    invoke-static {p1}, Ll/ofr0;->i(I)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iput p1, p0, Ll/ofr0;->f:I

    .line 56
    .line 57
    const/4 p1, 0x3

    .line 58
    invoke-virtual {v0, p1}, Ll/dfw0;->d(I)I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    add-int/lit8 p1, p1, 0x1

    .line 63
    .line 64
    iput p1, p0, Ll/ofr0;->g:I

    .line 65
    .line 66
    const/4 p1, 0x5

    .line 67
    invoke-virtual {v0, p1}, Ll/dfw0;->d(I)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    add-int/lit8 p1, p1, 0x1

    .line 72
    .line 73
    iput p1, p0, Ll/ofr0;->h:I

    .line 74
    .line 75
    invoke-static {p1}, Ll/ofr0;->h(I)I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iput p1, p0, Ll/ofr0;->i:I

    .line 80
    .line 81
    const/4 p1, 0x4

    .line 82
    invoke-virtual {v0, p1}, Ll/dfw0;->d(I)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    const/16 p2, 0x20

    .line 87
    .line 88
    invoke-virtual {v0, p2}, Ll/dfw0;->d(I)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    sget v1, Ll/mpw0;->a:I

    .line 93
    .line 94
    int-to-long v0, v0

    .line 95
    int-to-long v2, p1

    .line 96
    const-wide v4, 0xffffffffL

    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    and-long/2addr v2, v4

    .line 102
    shl-long p1, v2, p2

    .line 103
    .line 104
    and-long/2addr v0, v4

    .line 105
    or-long/2addr p1, v0

    .line 106
    iput-wide p1, p0, Ll/ofr0;->j:J

    .line 107
    .line 108
    const/4 p1, 0x0

    .line 109
    iput-object p1, p0, Ll/ofr0;->k:Ll/nfr0;

    .line 110
    .line 111
    iput-object p1, p0, Ll/ofr0;->l:Lcom/google/android/gms/internal/ads/zzby;

    .line 112
    .line 113
    return-void
.end method

.method public static h(I)I
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    if-eq p0, v0, :cond_4

    .line 4
    .line 5
    const/16 v0, 0xc

    .line 6
    .line 7
    if-eq p0, v0, :cond_3

    .line 8
    .line 9
    const/16 v0, 0x10

    .line 10
    .line 11
    if-eq p0, v0, :cond_2

    .line 12
    .line 13
    const/16 v0, 0x14

    .line 14
    .line 15
    if-eq p0, v0, :cond_1

    .line 16
    .line 17
    const/16 v0, 0x18

    .line 18
    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    const/4 p0, -0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x6

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x5

    .line 26
    return p0

    .line 27
    :cond_2
    const/4 p0, 0x4

    .line 28
    return p0

    .line 29
    :cond_3
    const/4 p0, 0x2

    .line 30
    return p0

    .line 31
    :cond_4
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public static i(I)I
    .locals 0

    .line 1
    sparse-switch p0, :sswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p0, -0x1

    .line 5
    return p0

    .line 6
    :sswitch_0
    const/4 p0, 0x3

    .line 7
    return p0

    .line 8
    :sswitch_1
    const/4 p0, 0x2

    .line 9
    return p0

    .line 10
    :sswitch_2
    const/16 p0, 0xb

    .line 11
    .line 12
    return p0

    .line 13
    :sswitch_3
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :sswitch_4
    const/16 p0, 0xa

    .line 16
    .line 17
    return p0

    .line 18
    :sswitch_5
    const/16 p0, 0x9

    .line 19
    .line 20
    return p0

    .line 21
    :sswitch_6
    const/16 p0, 0x8

    .line 22
    .line 23
    return p0

    .line 24
    :sswitch_7
    const/4 p0, 0x7

    .line 25
    return p0

    .line 26
    :sswitch_8
    const/4 p0, 0x6

    .line 27
    return p0

    .line 28
    :sswitch_9
    const/4 p0, 0x5

    .line 29
    return p0

    .line 30
    :sswitch_a
    const/4 p0, 0x4

    .line 31
    return p0

    .line 32
    nop

    .line 33
    :sswitch_data_0
    .sparse-switch
        0x1f40 -> :sswitch_a
        0x3e80 -> :sswitch_9
        0x5622 -> :sswitch_8
        0x5dc0 -> :sswitch_7
        0x7d00 -> :sswitch_6
        0xac44 -> :sswitch_5
        0xbb80 -> :sswitch_4
        0x15888 -> :sswitch_3
        0x17700 -> :sswitch_2
        0x2b110 -> :sswitch_1
        0x2ee00 -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public final a()J
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/ofr0;->j:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    return-wide v0

    .line 15
    :cond_0
    const-wide/32 v2, 0xf4240

    .line 16
    .line 17
    .line 18
    mul-long/2addr v0, v2

    .line 19
    iget p0, p0, Ll/ofr0;->e:I

    .line 20
    .line 21
    int-to-long v2, p0

    .line 22
    div-long/2addr v0, v2

    .line 23
    return-wide v0
.end method

.method public final b(J)J
    .locals 4

    .line 1
    iget v0, p0, Ll/ofr0;->e:I

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    mul-long/2addr p1, v0

    .line 5
    iget-wide v0, p0, Ll/ofr0;->j:J

    .line 6
    .line 7
    const-wide/32 v2, 0xf4240

    .line 8
    .line 9
    .line 10
    div-long/2addr p1, v2

    .line 11
    const-wide/16 v2, -0x1

    .line 12
    .line 13
    add-long/2addr v0, v2

    .line 14
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    .line 21
    .line 22
    .line 23
    move-result-wide p0

    .line 24
    return-wide p0
.end method

.method public final c([BLcom/google/android/gms/internal/ads/zzby;)Ll/sqr0;
    .locals 2
    .param p2    # Lcom/google/android/gms/internal/ads/zzby;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x4

    .line 2
    const/16 v1, -0x80

    .line 3
    .line 4
    aput-byte v1, p1, v0

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ll/ofr0;->d(Lcom/google/android/gms/internal/ads/zzby;)Lcom/google/android/gms/internal/ads/zzby;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    new-instance v0, Ll/znr0;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/znr0;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "audio/flac"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 18
    .line 19
    .line 20
    iget v1, p0, Ll/ofr0;->d:I

    .line 21
    .line 22
    if-gtz v1, :cond_0

    .line 23
    .line 24
    const/4 v1, -0x1

    .line 25
    :cond_0
    invoke-virtual {v0, v1}, Ll/znr0;->o(I)Ll/znr0;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Ll/ofr0;->g:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/znr0;->k0(I)Ll/znr0;

    .line 31
    .line 32
    .line 33
    iget v1, p0, Ll/ofr0;->e:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/znr0;->x(I)Ll/znr0;

    .line 36
    .line 37
    .line 38
    iget p0, p0, Ll/ofr0;->h:I

    .line 39
    .line 40
    invoke-static {p0}, Ll/mpw0;->z(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {v0, p0}, Ll/znr0;->q(I)Ll/znr0;

    .line 45
    .line 46
    .line 47
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, p2}, Ll/znr0;->p(Lcom/google/android/gms/internal/ads/zzby;)Ll/znr0;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ll/znr0;->D()Ll/sqr0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public final d(Lcom/google/android/gms/internal/ads/zzby;)Lcom/google/android/gms/internal/ads/zzby;
    .locals 0
    .param p1    # Lcom/google/android/gms/internal/ads/zzby;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ofr0;->l:Lcom/google/android/gms/internal/ads/zzby;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/zzby;->d(Lcom/google/android/gms/internal/ads/zzby;)Lcom/google/android/gms/internal/ads/zzby;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final e(Ljava/util/List;)Ll/ofr0;
    .locals 13

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/zzby;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ads/zzby;-><init>(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ofr0;->d(Lcom/google/android/gms/internal/ads/zzby;)Lcom/google/android/gms/internal/ads/zzby;

    .line 7
    .line 8
    .line 9
    move-result-object v12

    .line 10
    new-instance v1, Ll/ofr0;

    .line 11
    .line 12
    iget v2, p0, Ll/ofr0;->a:I

    .line 13
    .line 14
    iget v3, p0, Ll/ofr0;->b:I

    .line 15
    .line 16
    iget v4, p0, Ll/ofr0;->c:I

    .line 17
    .line 18
    iget v5, p0, Ll/ofr0;->d:I

    .line 19
    .line 20
    iget v6, p0, Ll/ofr0;->e:I

    .line 21
    .line 22
    iget v7, p0, Ll/ofr0;->g:I

    .line 23
    .line 24
    iget v8, p0, Ll/ofr0;->h:I

    .line 25
    .line 26
    iget-wide v9, p0, Ll/ofr0;->j:J

    .line 27
    .line 28
    iget-object v11, p0, Ll/ofr0;->k:Ll/nfr0;

    .line 29
    .line 30
    invoke-direct/range {v1 .. v12}, Ll/ofr0;-><init>(IIIIIIIJLl/nfr0;Lcom/google/android/gms/internal/ads/zzby;)V

    .line 31
    .line 32
    .line 33
    return-object v1
.end method

.method public final f(Ll/nfr0;)Ll/ofr0;
    .locals 12
    .param p1    # Ll/nfr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v11, p0, Ll/ofr0;->l:Lcom/google/android/gms/internal/ads/zzby;

    .line 2
    .line 3
    new-instance v0, Ll/ofr0;

    .line 4
    .line 5
    iget v1, p0, Ll/ofr0;->a:I

    .line 6
    .line 7
    iget v2, p0, Ll/ofr0;->b:I

    .line 8
    .line 9
    iget v3, p0, Ll/ofr0;->c:I

    .line 10
    .line 11
    iget v4, p0, Ll/ofr0;->d:I

    .line 12
    .line 13
    iget v5, p0, Ll/ofr0;->e:I

    .line 14
    .line 15
    iget v6, p0, Ll/ofr0;->g:I

    .line 16
    .line 17
    iget v7, p0, Ll/ofr0;->h:I

    .line 18
    .line 19
    iget-wide v8, p0, Ll/ofr0;->j:J

    .line 20
    .line 21
    move-object v10, p1

    .line 22
    invoke-direct/range {v0 .. v11}, Ll/ofr0;-><init>(IIIIIIIJLl/nfr0;Lcom/google/android/gms/internal/ads/zzby;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public final g(Ljava/util/List;)Ll/ofr0;
    .locals 12

    .line 1
    invoke-static {p1}, Ll/ygr0;->b(Ljava/util/List;)Lcom/google/android/gms/internal/ads/zzby;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/ofr0;->d(Lcom/google/android/gms/internal/ads/zzby;)Lcom/google/android/gms/internal/ads/zzby;

    .line 6
    .line 7
    .line 8
    move-result-object v11

    .line 9
    new-instance v0, Ll/ofr0;

    .line 10
    .line 11
    iget v1, p0, Ll/ofr0;->a:I

    .line 12
    .line 13
    iget v2, p0, Ll/ofr0;->b:I

    .line 14
    .line 15
    iget v3, p0, Ll/ofr0;->c:I

    .line 16
    .line 17
    iget v4, p0, Ll/ofr0;->d:I

    .line 18
    .line 19
    iget v5, p0, Ll/ofr0;->e:I

    .line 20
    .line 21
    iget v6, p0, Ll/ofr0;->g:I

    .line 22
    .line 23
    iget v7, p0, Ll/ofr0;->h:I

    .line 24
    .line 25
    iget-wide v8, p0, Ll/ofr0;->j:J

    .line 26
    .line 27
    iget-object v10, p0, Ll/ofr0;->k:Ll/nfr0;

    .line 28
    .line 29
    invoke-direct/range {v0 .. v11}, Ll/ofr0;-><init>(IIIIIIIJLl/nfr0;Lcom/google/android/gms/internal/ads/zzby;)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method
