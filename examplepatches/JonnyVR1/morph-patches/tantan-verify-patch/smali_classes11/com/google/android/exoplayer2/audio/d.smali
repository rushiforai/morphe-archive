.class public final Lcom/google/android/exoplayer2/audio/d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/audio/d$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public A:J

.field public B:J

.field public C:J

.field public D:J

.field public E:Z

.field public F:J

.field public G:J

.field public final a:Lcom/google/android/exoplayer2/audio/d$a;

.field public final b:[J

.field public c:Landroid/media/AudioTrack;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:I

.field public e:I

.field public f:Ll/pd1;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:I

.field public h:Z

.field public i:J

.field public j:F

.field public k:Z

.field public l:J

.field public m:J

.field public n:Ljava/lang/reflect/Method;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public o:J

.field public p:Z

.field public q:Z

.field public r:J

.field public s:J

.field public t:J

.field public u:J

.field public v:J

.field public w:I

.field public x:I

.field public y:J

.field public z:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/audio/d$a;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/google/android/exoplayer2/audio/d$a;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/d;->a:Lcom/google/android/exoplayer2/audio/d$a;

    .line 11
    .line 12
    sget p1, Ll/bmk0;->a:I

    .line 13
    .line 14
    const/16 v0, 0x12

    .line 15
    .line 16
    if-lt p1, v0, :cond_0

    .line 17
    .line 18
    :try_start_0
    const-class p1, Landroid/media/AudioTrack;

    .line 19
    .line 20
    const-string v0, "getLatency"

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p1, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/d;->n:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    :catch_0
    :cond_0
    const/16 p1, 0xa

    .line 30
    .line 31
    new-array p1, p1, [J

    .line 32
    .line 33
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/d;->b:[J

    .line 34
    .line 35
    return-void
.end method

.method public static n(I)Z
    .locals 2

    .line 1
    sget v0, Ll/bmk0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x17

    .line 4
    .line 5
    if-ge v0, v1, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x5

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x6

    .line 11
    if-ne p0, v0, :cond_1

    .line 12
    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    const/4 p0, 0x0

    .line 16
    return p0
.end method


# virtual methods
.method public final a()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/d;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/d;->c:Landroid/media/AudioTrack;

    .line 6
    .line 7
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/media/AudioTrack;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x2

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/d;->d()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    const-wide/16 v2, 0x0

    .line 25
    .line 26
    cmp-long p0, v0, v2

    .line 27
    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public b(J)I
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/d;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget v2, p0, Lcom/google/android/exoplayer2/audio/d;->d:I

    .line 6
    .line 7
    int-to-long v2, v2

    .line 8
    mul-long/2addr v0, v2

    .line 9
    sub-long/2addr p1, v0

    .line 10
    long-to-int p1, p1

    .line 11
    iget p0, p0, Lcom/google/android/exoplayer2/audio/d;->e:I

    .line 12
    .line 13
    sub-int/2addr p0, p1

    .line 14
    return p0
.end method

.method public c(Z)J
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/google/android/exoplayer2/audio/d;->c:Landroid/media/AudioTrack;

    .line 4
    .line 5
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Landroid/media/AudioTrack;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/media/AudioTrack;->getPlayState()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x3

    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/d;->l()V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    const-wide/16 v3, 0x3e8

    .line 26
    .line 27
    div-long/2addr v1, v3

    .line 28
    iget-object v5, v0, Lcom/google/android/exoplayer2/audio/d;->f:Ll/pd1;

    .line 29
    .line 30
    invoke-static {v5}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    check-cast v5, Ll/pd1;

    .line 35
    .line 36
    invoke-virtual {v5}, Ll/pd1;->d()Z

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    if-eqz v6, :cond_1

    .line 41
    .line 42
    invoke-virtual {v5}, Ll/pd1;->b()J

    .line 43
    .line 44
    .line 45
    move-result-wide v7

    .line 46
    iget v9, v0, Lcom/google/android/exoplayer2/audio/d;->g:I

    .line 47
    .line 48
    invoke-static {v7, v8, v9}, Ll/bmk0;->V0(JI)J

    .line 49
    .line 50
    .line 51
    move-result-wide v7

    .line 52
    invoke-virtual {v5}, Ll/pd1;->c()J

    .line 53
    .line 54
    .line 55
    move-result-wide v9

    .line 56
    sub-long v9, v1, v9

    .line 57
    .line 58
    iget v5, v0, Lcom/google/android/exoplayer2/audio/d;->j:F

    .line 59
    .line 60
    invoke-static {v9, v10, v5}, Ll/bmk0;->d0(JF)J

    .line 61
    .line 62
    .line 63
    move-result-wide v9

    .line 64
    add-long/2addr v7, v9

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    iget v5, v0, Lcom/google/android/exoplayer2/audio/d;->x:I

    .line 67
    .line 68
    if-nez v5, :cond_2

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/d;->e()J

    .line 71
    .line 72
    .line 73
    move-result-wide v7

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    iget-wide v7, v0, Lcom/google/android/exoplayer2/audio/d;->l:J

    .line 76
    .line 77
    add-long/2addr v7, v1

    .line 78
    iget v5, v0, Lcom/google/android/exoplayer2/audio/d;->j:F

    .line 79
    .line 80
    invoke-static {v7, v8, v5}, Ll/bmk0;->d0(JF)J

    .line 81
    .line 82
    .line 83
    move-result-wide v7

    .line 84
    :goto_0
    if-nez p1, :cond_3

    .line 85
    .line 86
    iget-wide v9, v0, Lcom/google/android/exoplayer2/audio/d;->o:J

    .line 87
    .line 88
    sub-long/2addr v7, v9

    .line 89
    const-wide/16 v9, 0x0

    .line 90
    .line 91
    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->max(JJ)J

    .line 92
    .line 93
    .line 94
    move-result-wide v7

    .line 95
    :cond_3
    :goto_1
    iget-boolean v5, v0, Lcom/google/android/exoplayer2/audio/d;->E:Z

    .line 96
    .line 97
    if-eq v5, v6, :cond_4

    .line 98
    .line 99
    iget-wide v9, v0, Lcom/google/android/exoplayer2/audio/d;->D:J

    .line 100
    .line 101
    iput-wide v9, v0, Lcom/google/android/exoplayer2/audio/d;->G:J

    .line 102
    .line 103
    iget-wide v9, v0, Lcom/google/android/exoplayer2/audio/d;->C:J

    .line 104
    .line 105
    iput-wide v9, v0, Lcom/google/android/exoplayer2/audio/d;->F:J

    .line 106
    .line 107
    :cond_4
    iget-wide v9, v0, Lcom/google/android/exoplayer2/audio/d;->G:J

    .line 108
    .line 109
    sub-long v9, v1, v9

    .line 110
    .line 111
    const-wide/32 v11, 0xf4240

    .line 112
    .line 113
    .line 114
    cmp-long v5, v9, v11

    .line 115
    .line 116
    if-gez v5, :cond_5

    .line 117
    .line 118
    iget-wide v13, v0, Lcom/google/android/exoplayer2/audio/d;->F:J

    .line 119
    .line 120
    iget v5, v0, Lcom/google/android/exoplayer2/audio/d;->j:F

    .line 121
    .line 122
    invoke-static {v9, v10, v5}, Ll/bmk0;->d0(JF)J

    .line 123
    .line 124
    .line 125
    move-result-wide v15

    .line 126
    add-long/2addr v13, v15

    .line 127
    mul-long/2addr v9, v3

    .line 128
    div-long/2addr v9, v11

    .line 129
    mul-long/2addr v7, v9

    .line 130
    sub-long v9, v3, v9

    .line 131
    .line 132
    mul-long/2addr v9, v13

    .line 133
    add-long/2addr v7, v9

    .line 134
    div-long/2addr v7, v3

    .line 135
    :cond_5
    iget-boolean v3, v0, Lcom/google/android/exoplayer2/audio/d;->k:Z

    .line 136
    .line 137
    if-nez v3, :cond_6

    .line 138
    .line 139
    iget-wide v3, v0, Lcom/google/android/exoplayer2/audio/d;->C:J

    .line 140
    .line 141
    cmp-long v5, v7, v3

    .line 142
    .line 143
    if-lez v5, :cond_6

    .line 144
    .line 145
    const/4 v5, 0x1

    .line 146
    iput-boolean v5, v0, Lcom/google/android/exoplayer2/audio/d;->k:Z

    .line 147
    .line 148
    sub-long v3, v7, v3

    .line 149
    .line 150
    invoke-static {v3, v4}, Ll/bmk0;->l1(J)J

    .line 151
    .line 152
    .line 153
    move-result-wide v3

    .line 154
    iget v5, v0, Lcom/google/android/exoplayer2/audio/d;->j:F

    .line 155
    .line 156
    invoke-static {v3, v4, v5}, Ll/bmk0;->i0(JF)J

    .line 157
    .line 158
    .line 159
    move-result-wide v3

    .line 160
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 161
    .line 162
    .line 163
    move-result-wide v9

    .line 164
    invoke-static {v3, v4}, Ll/bmk0;->l1(J)J

    .line 165
    .line 166
    .line 167
    move-result-wide v3

    .line 168
    sub-long/2addr v9, v3

    .line 169
    iget-object v3, v0, Lcom/google/android/exoplayer2/audio/d;->a:Lcom/google/android/exoplayer2/audio/d$a;

    .line 170
    .line 171
    invoke-interface {v3, v9, v10}, Lcom/google/android/exoplayer2/audio/d$a;->c(J)V

    .line 172
    .line 173
    .line 174
    :cond_6
    iput-wide v1, v0, Lcom/google/android/exoplayer2/audio/d;->D:J

    .line 175
    .line 176
    iput-wide v7, v0, Lcom/google/android/exoplayer2/audio/d;->C:J

    .line 177
    .line 178
    iput-boolean v6, v0, Lcom/google/android/exoplayer2/audio/d;->E:Z

    .line 179
    .line 180
    return-wide v7
.end method

.method public final d()J
    .locals 6

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/google/android/exoplayer2/audio/d;->y:J

    .line 6
    .line 7
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmp-long v4, v2, v4

    .line 13
    .line 14
    if-eqz v4, :cond_0

    .line 15
    .line 16
    const-wide/16 v4, 0x3e8

    .line 17
    .line 18
    mul-long/2addr v0, v4

    .line 19
    sub-long/2addr v0, v2

    .line 20
    iget v2, p0, Lcom/google/android/exoplayer2/audio/d;->j:F

    .line 21
    .line 22
    invoke-static {v0, v1, v2}, Ll/bmk0;->d0(JF)J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    iget v2, p0, Lcom/google/android/exoplayer2/audio/d;->g:I

    .line 27
    .line 28
    invoke-static {v0, v1, v2}, Ll/bmk0;->B(JI)J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iget-wide v2, p0, Lcom/google/android/exoplayer2/audio/d;->B:J

    .line 33
    .line 34
    iget-wide v4, p0, Lcom/google/android/exoplayer2/audio/d;->A:J

    .line 35
    .line 36
    add-long/2addr v4, v0

    .line 37
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    return-wide v0

    .line 42
    :cond_0
    iget-wide v2, p0, Lcom/google/android/exoplayer2/audio/d;->s:J

    .line 43
    .line 44
    sub-long v2, v0, v2

    .line 45
    .line 46
    const-wide/16 v4, 0x5

    .line 47
    .line 48
    cmp-long v2, v2, v4

    .line 49
    .line 50
    if-ltz v2, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/audio/d;->u(J)V

    .line 53
    .line 54
    .line 55
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->s:J

    .line 56
    .line 57
    :cond_1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->t:J

    .line 58
    .line 59
    iget-wide v2, p0, Lcom/google/android/exoplayer2/audio/d;->u:J

    .line 60
    .line 61
    const/16 p0, 0x20

    .line 62
    .line 63
    shl-long/2addr v2, p0

    .line 64
    add-long/2addr v0, v2

    .line 65
    return-wide v0
.end method

.method public final e()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/d;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget p0, p0, Lcom/google/android/exoplayer2/audio/d;->g:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Ll/bmk0;->V0(JI)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public f(J)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/d;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->A:J

    .line 6
    .line 7
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    const-wide/16 v2, 0x3e8

    .line 12
    .line 13
    mul-long/2addr v0, v2

    .line 14
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->y:J

    .line 15
    .line 16
    iput-wide p1, p0, Lcom/google/android/exoplayer2/audio/d;->B:J

    .line 17
    .line 18
    return-void
.end method

.method public g(J)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/audio/d;->c(Z)J

    .line 3
    .line 4
    .line 5
    move-result-wide v1

    .line 6
    iget v3, p0, Lcom/google/android/exoplayer2/audio/d;->g:I

    .line 7
    .line 8
    invoke-static {v1, v2, v3}, Ll/bmk0;->B(JI)J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    cmp-long p1, p1, v1

    .line 13
    .line 14
    if-gtz p1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/d;->a()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return v0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public h()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/d;->c:Landroid/media/AudioTrack;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/media/AudioTrack;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/media/AudioTrack;->getPlayState()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x3

    .line 14
    if-ne p0, v0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public i(J)Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->z:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    cmp-long p1, p1, v0

    .line 15
    .line 16
    if-lez p1, :cond_0

    .line 17
    .line 18
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 19
    .line 20
    .line 21
    move-result-wide p1

    .line 22
    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->z:J

    .line 23
    .line 24
    sub-long/2addr p1, v0

    .line 25
    const-wide/16 v0, 0xc8

    .line 26
    .line 27
    cmp-long p0, p1, v0

    .line 28
    .line 29
    if-ltz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public j(J)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/d;->c:Landroid/media/AudioTrack;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/media/AudioTrack;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/audio/d;->h:Z

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    const/4 v3, 0x0

    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    iput-boolean v3, p0, Lcom/google/android/exoplayer2/audio/d;->p:Z

    .line 23
    .line 24
    return v3

    .line 25
    :cond_0
    if-ne v0, v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/d;->d()J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    const-wide/16 v6, 0x0

    .line 32
    .line 33
    cmp-long v1, v4, v6

    .line 34
    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    return v3

    .line 38
    :cond_1
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/audio/d;->p:Z

    .line 39
    .line 40
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/audio/d;->g(J)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/audio/d;->p:Z

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    if-eq v0, v2, :cond_2

    .line 51
    .line 52
    iget-object p1, p0, Lcom/google/android/exoplayer2/audio/d;->a:Lcom/google/android/exoplayer2/audio/d$a;

    .line 53
    .line 54
    iget p2, p0, Lcom/google/android/exoplayer2/audio/d;->e:I

    .line 55
    .line 56
    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->i:J

    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bmk0;->l1(J)J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    invoke-interface {p1, p2, v0, v1}, Lcom/google/android/exoplayer2/audio/d$a;->d(IJ)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return v2
.end method

.method public final k(J)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/d;->f:Ll/pd1;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/pd1;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2}, Ll/pd1;->e(J)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {v0}, Ll/pd1;->c()J

    .line 17
    .line 18
    .line 19
    move-result-wide v5

    .line 20
    invoke-virtual {v0}, Ll/pd1;->b()J

    .line 21
    .line 22
    .line 23
    move-result-wide v3

    .line 24
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/d;->e()J

    .line 25
    .line 26
    .line 27
    move-result-wide v9

    .line 28
    sub-long v1, v5, p1

    .line 29
    .line 30
    invoke-static {v1, v2}, Ljava/lang/Math;->abs(J)J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    const-wide/32 v7, 0x4c4b40

    .line 35
    .line 36
    .line 37
    cmp-long v1, v1, v7

    .line 38
    .line 39
    if-lez v1, :cond_1

    .line 40
    .line 41
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/d;->a:Lcom/google/android/exoplayer2/audio/d$a;

    .line 42
    .line 43
    move-wide v7, p1

    .line 44
    invoke-interface/range {v2 .. v10}, Lcom/google/android/exoplayer2/audio/d$a;->b(JJJJ)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ll/pd1;->f()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    move-wide v11, v7

    .line 52
    move-wide v7, p1

    .line 53
    move-wide p1, v11

    .line 54
    iget v1, p0, Lcom/google/android/exoplayer2/audio/d;->g:I

    .line 55
    .line 56
    invoke-static {v3, v4, v1}, Ll/bmk0;->V0(JI)J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    sub-long/2addr v1, v9

    .line 61
    invoke-static {v1, v2}, Ljava/lang/Math;->abs(J)J

    .line 62
    .line 63
    .line 64
    move-result-wide v1

    .line 65
    cmp-long p1, v1, p1

    .line 66
    .line 67
    if-lez p1, :cond_2

    .line 68
    .line 69
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/d;->a:Lcom/google/android/exoplayer2/audio/d$a;

    .line 70
    .line 71
    invoke-interface/range {v2 .. v10}, Lcom/google/android/exoplayer2/audio/d$a;->a(JJJJ)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ll/pd1;->f()V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    invoke-virtual {v0}, Ll/pd1;->a()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final l()V
    .locals 11

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    iget-wide v2, p0, Lcom/google/android/exoplayer2/audio/d;->m:J

    .line 9
    .line 10
    sub-long v2, v0, v2

    .line 11
    .line 12
    const-wide/16 v4, 0x7530

    .line 13
    .line 14
    cmp-long v2, v2, v4

    .line 15
    .line 16
    if-ltz v2, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/d;->e()J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    const-wide/16 v4, 0x0

    .line 23
    .line 24
    cmp-long v6, v2, v4

    .line 25
    .line 26
    if-nez v6, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    iget-object v6, p0, Lcom/google/android/exoplayer2/audio/d;->b:[J

    .line 30
    .line 31
    iget v7, p0, Lcom/google/android/exoplayer2/audio/d;->w:I

    .line 32
    .line 33
    iget v8, p0, Lcom/google/android/exoplayer2/audio/d;->j:F

    .line 34
    .line 35
    invoke-static {v2, v3, v8}, Ll/bmk0;->i0(JF)J

    .line 36
    .line 37
    .line 38
    move-result-wide v2

    .line 39
    sub-long/2addr v2, v0

    .line 40
    aput-wide v2, v6, v7

    .line 41
    .line 42
    iget v2, p0, Lcom/google/android/exoplayer2/audio/d;->w:I

    .line 43
    .line 44
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    const/16 v3, 0xa

    .line 47
    .line 48
    rem-int/2addr v2, v3

    .line 49
    iput v2, p0, Lcom/google/android/exoplayer2/audio/d;->w:I

    .line 50
    .line 51
    iget v2, p0, Lcom/google/android/exoplayer2/audio/d;->x:I

    .line 52
    .line 53
    if-ge v2, v3, :cond_1

    .line 54
    .line 55
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    iput v2, p0, Lcom/google/android/exoplayer2/audio/d;->x:I

    .line 58
    .line 59
    :cond_1
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->m:J

    .line 60
    .line 61
    iput-wide v4, p0, Lcom/google/android/exoplayer2/audio/d;->l:J

    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    :goto_0
    iget v3, p0, Lcom/google/android/exoplayer2/audio/d;->x:I

    .line 65
    .line 66
    if-ge v2, v3, :cond_2

    .line 67
    .line 68
    iget-wide v4, p0, Lcom/google/android/exoplayer2/audio/d;->l:J

    .line 69
    .line 70
    iget-object v6, p0, Lcom/google/android/exoplayer2/audio/d;->b:[J

    .line 71
    .line 72
    aget-wide v7, v6, v2

    .line 73
    .line 74
    int-to-long v9, v3

    .line 75
    div-long/2addr v7, v9

    .line 76
    add-long/2addr v4, v7

    .line 77
    iput-wide v4, p0, Lcom/google/android/exoplayer2/audio/d;->l:J

    .line 78
    .line 79
    add-int/lit8 v2, v2, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/audio/d;->h:Z

    .line 83
    .line 84
    if-eqz v2, :cond_3

    .line 85
    .line 86
    :goto_1
    return-void

    .line 87
    :cond_3
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/audio/d;->k(J)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/audio/d;->m(J)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final m(J)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/d;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/d;->n:Ljava/lang/reflect/Method;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-wide v1, p0, Lcom/google/android/exoplayer2/audio/d;->r:J

    .line 10
    .line 11
    sub-long v1, p1, v1

    .line 12
    .line 13
    const-wide/32 v3, 0x7a120

    .line 14
    .line 15
    .line 16
    cmp-long v1, v1, v3

    .line 17
    .line 18
    if-ltz v1, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    :try_start_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/d;->c:Landroid/media/AudioTrack;

    .line 22
    .line 23
    invoke-static {v2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-static {v0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    int-to-long v2, v0

    .line 44
    const-wide/16 v4, 0x3e8

    .line 45
    .line 46
    mul-long/2addr v2, v4

    .line 47
    iget-wide v4, p0, Lcom/google/android/exoplayer2/audio/d;->i:J

    .line 48
    .line 49
    sub-long/2addr v2, v4

    .line 50
    iput-wide v2, p0, Lcom/google/android/exoplayer2/audio/d;->o:J

    .line 51
    .line 52
    const-wide/16 v4, 0x0

    .line 53
    .line 54
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 55
    .line 56
    .line 57
    move-result-wide v2

    .line 58
    iput-wide v2, p0, Lcom/google/android/exoplayer2/audio/d;->o:J

    .line 59
    .line 60
    const-wide/32 v6, 0x4c4b40

    .line 61
    .line 62
    .line 63
    cmp-long v0, v2, v6

    .line 64
    .line 65
    if-lez v0, :cond_0

    .line 66
    .line 67
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/d;->a:Lcom/google/android/exoplayer2/audio/d$a;

    .line 68
    .line 69
    invoke-interface {v0, v2, v3}, Lcom/google/android/exoplayer2/audio/d$a;->e(J)V

    .line 70
    .line 71
    .line 72
    iput-wide v4, p0, Lcom/google/android/exoplayer2/audio/d;->o:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catch_0
    iput-object v1, p0, Lcom/google/android/exoplayer2/audio/d;->n:Ljava/lang/reflect/Method;

    .line 76
    .line 77
    :cond_0
    :goto_0
    iput-wide p1, p0, Lcom/google/android/exoplayer2/audio/d;->r:J

    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public o()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/d;->q()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->y:J

    .line 5
    .line 6
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/d;->f:Ll/pd1;

    .line 16
    .line 17
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/pd1;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/pd1;->g()V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public p()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/d;->q()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/d;->c:Landroid/media/AudioTrack;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/d;->f:Ll/pd1;

    .line 8
    .line 9
    return-void
.end method

.method public final q()V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->l:J

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, p0, Lcom/google/android/exoplayer2/audio/d;->x:I

    .line 7
    .line 8
    iput v2, p0, Lcom/google/android/exoplayer2/audio/d;->w:I

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->m:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->D:J

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->G:J

    .line 15
    .line 16
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/audio/d;->k:Z

    .line 17
    .line 18
    return-void
.end method

.method public r(Landroid/media/AudioTrack;ZIII)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/d;->c:Landroid/media/AudioTrack;

    .line 2
    .line 3
    iput p4, p0, Lcom/google/android/exoplayer2/audio/d;->d:I

    .line 4
    .line 5
    iput p5, p0, Lcom/google/android/exoplayer2/audio/d;->e:I

    .line 6
    .line 7
    new-instance v0, Ll/pd1;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/pd1;-><init>(Landroid/media/AudioTrack;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/d;->f:Ll/pd1;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getSampleRate()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/google/android/exoplayer2/audio/d;->g:I

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    invoke-static {p3}, Lcom/google/android/exoplayer2/audio/d;->n(I)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    const/4 p2, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move p2, p1

    .line 32
    :goto_0
    iput-boolean p2, p0, Lcom/google/android/exoplayer2/audio/d;->h:Z

    .line 33
    .line 34
    invoke-static {p3}, Ll/bmk0;->C0(I)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    iput-boolean p2, p0, Lcom/google/android/exoplayer2/audio/d;->q:Z

    .line 39
    .line 40
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    if-eqz p2, :cond_1

    .line 46
    .line 47
    div-int/2addr p5, p4

    .line 48
    int-to-long p2, p5

    .line 49
    iget p4, p0, Lcom/google/android/exoplayer2/audio/d;->g:I

    .line 50
    .line 51
    invoke-static {p2, p3, p4}, Ll/bmk0;->V0(JI)J

    .line 52
    .line 53
    .line 54
    move-result-wide p2

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    move-wide p2, v0

    .line 57
    :goto_1
    iput-wide p2, p0, Lcom/google/android/exoplayer2/audio/d;->i:J

    .line 58
    .line 59
    const-wide/16 p2, 0x0

    .line 60
    .line 61
    iput-wide p2, p0, Lcom/google/android/exoplayer2/audio/d;->t:J

    .line 62
    .line 63
    iput-wide p2, p0, Lcom/google/android/exoplayer2/audio/d;->u:J

    .line 64
    .line 65
    iput-wide p2, p0, Lcom/google/android/exoplayer2/audio/d;->v:J

    .line 66
    .line 67
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/audio/d;->p:Z

    .line 68
    .line 69
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->y:J

    .line 70
    .line 71
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->z:J

    .line 72
    .line 73
    iput-wide p2, p0, Lcom/google/android/exoplayer2/audio/d;->r:J

    .line 74
    .line 75
    iput-wide p2, p0, Lcom/google/android/exoplayer2/audio/d;->o:J

    .line 76
    .line 77
    const/high16 p1, 0x3f800000    # 1.0f

    .line 78
    .line 79
    iput p1, p0, Lcom/google/android/exoplayer2/audio/d;->j:F

    .line 80
    .line 81
    return-void
.end method

.method public s(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/audio/d;->j:F

    .line 2
    .line 3
    iget-object p1, p0, Lcom/google/android/exoplayer2/audio/d;->f:Ll/pd1;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/pd1;->g()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/d;->q()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/d;->f:Ll/pd1;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/pd1;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/pd1;->g()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final u(J)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/d;->c:Landroid/media/AudioTrack;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/media/AudioTrack;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    if-ne v1, v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    int-to-long v2, v0

    .line 22
    const-wide v4, 0xffffffffL

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    and-long/2addr v2, v4

    .line 28
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/d;->h:Z

    .line 29
    .line 30
    const-wide/16 v4, 0x0

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v0, 0x2

    .line 35
    if-ne v1, v0, :cond_1

    .line 36
    .line 37
    cmp-long v0, v2, v4

    .line 38
    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-wide v6, p0, Lcom/google/android/exoplayer2/audio/d;->t:J

    .line 42
    .line 43
    iput-wide v6, p0, Lcom/google/android/exoplayer2/audio/d;->v:J

    .line 44
    .line 45
    :cond_1
    iget-wide v6, p0, Lcom/google/android/exoplayer2/audio/d;->v:J

    .line 46
    .line 47
    add-long/2addr v2, v6

    .line 48
    :cond_2
    sget v0, Ll/bmk0;->a:I

    .line 49
    .line 50
    const/16 v6, 0x1d

    .line 51
    .line 52
    if-gt v0, v6, :cond_5

    .line 53
    .line 54
    cmp-long v0, v2, v4

    .line 55
    .line 56
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    if-nez v0, :cond_4

    .line 62
    .line 63
    iget-wide v8, p0, Lcom/google/android/exoplayer2/audio/d;->t:J

    .line 64
    .line 65
    cmp-long v0, v8, v4

    .line 66
    .line 67
    if-lez v0, :cond_4

    .line 68
    .line 69
    const/4 v0, 0x3

    .line 70
    if-ne v1, v0, :cond_4

    .line 71
    .line 72
    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/d;->z:J

    .line 73
    .line 74
    cmp-long v0, v0, v6

    .line 75
    .line 76
    if-nez v0, :cond_3

    .line 77
    .line 78
    iput-wide p1, p0, Lcom/google/android/exoplayer2/audio/d;->z:J

    .line 79
    .line 80
    :cond_3
    :goto_0
    return-void

    .line 81
    :cond_4
    iput-wide v6, p0, Lcom/google/android/exoplayer2/audio/d;->z:J

    .line 82
    .line 83
    :cond_5
    iget-wide p1, p0, Lcom/google/android/exoplayer2/audio/d;->t:J

    .line 84
    .line 85
    cmp-long p1, p1, v2

    .line 86
    .line 87
    if-lez p1, :cond_6

    .line 88
    .line 89
    iget-wide p1, p0, Lcom/google/android/exoplayer2/audio/d;->u:J

    .line 90
    .line 91
    const-wide/16 v0, 0x1

    .line 92
    .line 93
    add-long/2addr p1, v0

    .line 94
    iput-wide p1, p0, Lcom/google/android/exoplayer2/audio/d;->u:J

    .line 95
    .line 96
    :cond_6
    iput-wide v2, p0, Lcom/google/android/exoplayer2/audio/d;->t:J

    .line 97
    .line 98
    return-void
.end method
