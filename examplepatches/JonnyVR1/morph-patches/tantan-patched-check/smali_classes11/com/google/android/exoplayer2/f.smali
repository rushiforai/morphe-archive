.class public final Lcom/google/android/exoplayer2/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/f$b;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:F

.field public final b:F

.field public final c:J

.field public final d:F

.field public final e:J

.field public final f:J

.field public final g:F

.field public h:J

.field public i:J

.field public j:J

.field public k:J

.field public l:J

.field public m:J

.field public n:F

.field public o:F

.field public p:F

.field public q:J

.field public r:J

.field public s:J


# direct methods
.method public constructor <init>(FFJFJJF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/google/android/exoplayer2/f;->a:F

    .line 5
    .line 6
    iput p2, p0, Lcom/google/android/exoplayer2/f;->b:F

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/google/android/exoplayer2/f;->c:J

    .line 9
    .line 10
    iput p5, p0, Lcom/google/android/exoplayer2/f;->d:F

    .line 11
    .line 12
    iput-wide p6, p0, Lcom/google/android/exoplayer2/f;->e:J

    .line 13
    .line 14
    iput-wide p8, p0, Lcom/google/android/exoplayer2/f;->f:J

    .line 15
    .line 16
    iput p10, p0, Lcom/google/android/exoplayer2/f;->g:F

    .line 17
    .line 18
    const-wide p3, -0x7fffffffffffffffL    # -4.9E-324

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    iput-wide p3, p0, Lcom/google/android/exoplayer2/f;->h:J

    .line 24
    .line 25
    iput-wide p3, p0, Lcom/google/android/exoplayer2/f;->i:J

    .line 26
    .line 27
    iput-wide p3, p0, Lcom/google/android/exoplayer2/f;->k:J

    .line 28
    .line 29
    iput-wide p3, p0, Lcom/google/android/exoplayer2/f;->l:J

    .line 30
    .line 31
    iput p1, p0, Lcom/google/android/exoplayer2/f;->o:F

    .line 32
    .line 33
    iput p2, p0, Lcom/google/android/exoplayer2/f;->n:F

    .line 34
    .line 35
    const/high16 p1, 0x3f800000    # 1.0f

    .line 36
    .line 37
    iput p1, p0, Lcom/google/android/exoplayer2/f;->p:F

    .line 38
    .line 39
    iput-wide p3, p0, Lcom/google/android/exoplayer2/f;->q:J

    .line 40
    .line 41
    iput-wide p3, p0, Lcom/google/android/exoplayer2/f;->j:J

    .line 42
    .line 43
    iput-wide p3, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 44
    .line 45
    iput-wide p3, p0, Lcom/google/android/exoplayer2/f;->r:J

    .line 46
    .line 47
    iput-wide p3, p0, Lcom/google/android/exoplayer2/f;->s:J

    .line 48
    .line 49
    return-void
.end method

.method public synthetic constructor <init>(FFJFJJFLcom/google/android/exoplayer2/f$a;)V
    .locals 0

    .line 50
    invoke-direct/range {p0 .. p10}, Lcom/google/android/exoplayer2/f;-><init>(FFJFJJF)V

    return-void
.end method

.method public static h(JJF)J
    .locals 0

    .line 1
    long-to-float p0, p0

    mul-float/2addr p0, p4

    const/high16 p1, 0x3f800000    # 1.0f

    sub-float/2addr p1, p4

    long-to-float p2, p2

    mul-float/2addr p1, p2

    add-float/2addr p0, p1

    float-to-long p0, p0

    return-wide p0
.end method


# virtual methods
.method public a(Lcom/google/android/exoplayer2/n$g;)V
    .locals 3

    .line 1
    iget-wide v0, p1, Lcom/google/android/exoplayer2/n$g;->a:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ll/bmk0;->J0(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Lcom/google/android/exoplayer2/f;->h:J

    .line 8
    .line 9
    iget-wide v0, p1, Lcom/google/android/exoplayer2/n$g;->b:J

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bmk0;->J0(J)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Lcom/google/android/exoplayer2/f;->k:J

    .line 16
    .line 17
    iget-wide v0, p1, Lcom/google/android/exoplayer2/n$g;->c:J

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bmk0;->J0(J)J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iput-wide v0, p0, Lcom/google/android/exoplayer2/f;->l:J

    .line 24
    .line 25
    iget v0, p1, Lcom/google/android/exoplayer2/n$g;->d:F

    .line 26
    .line 27
    const v1, -0x800001

    .line 28
    .line 29
    .line 30
    cmpl-float v2, v0, v1

    .line 31
    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget v0, p0, Lcom/google/android/exoplayer2/f;->a:F

    .line 36
    .line 37
    :goto_0
    iput v0, p0, Lcom/google/android/exoplayer2/f;->o:F

    .line 38
    .line 39
    iget p1, p1, Lcom/google/android/exoplayer2/n$g;->e:F

    .line 40
    .line 41
    cmpl-float v1, p1, v1

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    iget p1, p0, Lcom/google/android/exoplayer2/f;->b:F

    .line 47
    .line 48
    :goto_1
    iput p1, p0, Lcom/google/android/exoplayer2/f;->n:F

    .line 49
    .line 50
    const/high16 v1, 0x3f800000    # 1.0f

    .line 51
    .line 52
    cmpl-float v0, v0, v1

    .line 53
    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    cmpl-float p1, p1, v1

    .line 57
    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    iput-wide v0, p0, Lcom/google/android/exoplayer2/f;->h:J

    .line 66
    .line 67
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/f;->g()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public b(JJ)F
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/f;->h:J

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
    const/high16 v1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer2/f;->i(JJ)V

    .line 16
    .line 17
    .line 18
    iget-wide p3, p0, Lcom/google/android/exoplayer2/f;->q:J

    .line 19
    .line 20
    cmp-long p3, p3, v2

    .line 21
    .line 22
    if-eqz p3, :cond_1

    .line 23
    .line 24
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 25
    .line 26
    .line 27
    move-result-wide p3

    .line 28
    iget-wide v2, p0, Lcom/google/android/exoplayer2/f;->q:J

    .line 29
    .line 30
    sub-long/2addr p3, v2

    .line 31
    iget-wide v2, p0, Lcom/google/android/exoplayer2/f;->c:J

    .line 32
    .line 33
    cmp-long p3, p3, v2

    .line 34
    .line 35
    if-gez p3, :cond_1

    .line 36
    .line 37
    iget p0, p0, Lcom/google/android/exoplayer2/f;->p:F

    .line 38
    .line 39
    return p0

    .line 40
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 41
    .line 42
    .line 43
    move-result-wide p3

    .line 44
    iput-wide p3, p0, Lcom/google/android/exoplayer2/f;->q:J

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/f;->f(J)V

    .line 47
    .line 48
    .line 49
    iget-wide p3, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 50
    .line 51
    sub-long/2addr p1, p3

    .line 52
    invoke-static {p1, p2}, Ljava/lang/Math;->abs(J)J

    .line 53
    .line 54
    .line 55
    move-result-wide p3

    .line 56
    iget-wide v2, p0, Lcom/google/android/exoplayer2/f;->e:J

    .line 57
    .line 58
    cmp-long p3, p3, v2

    .line 59
    .line 60
    if-gez p3, :cond_2

    .line 61
    .line 62
    iput v1, p0, Lcom/google/android/exoplayer2/f;->p:F

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    iget p3, p0, Lcom/google/android/exoplayer2/f;->d:F

    .line 66
    .line 67
    long-to-float p1, p1

    .line 68
    mul-float/2addr p3, p1

    .line 69
    add-float/2addr p3, v1

    .line 70
    iget p1, p0, Lcom/google/android/exoplayer2/f;->o:F

    .line 71
    .line 72
    iget p2, p0, Lcom/google/android/exoplayer2/f;->n:F

    .line 73
    .line 74
    invoke-static {p3, p1, p2}, Ll/bmk0;->p(FFF)F

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iput p1, p0, Lcom/google/android/exoplayer2/f;->p:F

    .line 79
    .line 80
    :goto_0
    iget p0, p0, Lcom/google/android/exoplayer2/f;->p:F

    .line 81
    .line 82
    return p0
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d()V
    .locals 7

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v4, v0, v2

    .line 9
    .line 10
    if-nez v4, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-wide v4, p0, Lcom/google/android/exoplayer2/f;->f:J

    .line 14
    .line 15
    add-long/2addr v0, v4

    .line 16
    iput-wide v0, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 17
    .line 18
    iget-wide v4, p0, Lcom/google/android/exoplayer2/f;->l:J

    .line 19
    .line 20
    cmp-long v6, v4, v2

    .line 21
    .line 22
    if-eqz v6, :cond_1

    .line 23
    .line 24
    cmp-long v0, v0, v4

    .line 25
    .line 26
    if-lez v0, :cond_1

    .line 27
    .line 28
    iput-wide v4, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 29
    .line 30
    :cond_1
    iput-wide v2, p0, Lcom/google/android/exoplayer2/f;->q:J

    .line 31
    .line 32
    return-void
.end method

.method public e(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/f;->i:J

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/f;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(J)V
    .locals 12

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/f;->r:J

    .line 2
    .line 3
    const-wide/16 v2, 0x3

    .line 4
    .line 5
    iget-wide v4, p0, Lcom/google/android/exoplayer2/f;->s:J

    .line 6
    .line 7
    mul-long/2addr v4, v2

    .line 8
    add-long v10, v0, v4

    .line 9
    .line 10
    iget-wide v0, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 11
    .line 12
    cmp-long v0, v0, v10

    .line 13
    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    iget-wide p1, p0, Lcom/google/android/exoplayer2/f;->c:J

    .line 19
    .line 20
    invoke-static {p1, p2}, Ll/bmk0;->J0(J)J

    .line 21
    .line 22
    .line 23
    move-result-wide p1

    .line 24
    iget v0, p0, Lcom/google/android/exoplayer2/f;->p:F

    .line 25
    .line 26
    sub-float/2addr v0, v1

    .line 27
    long-to-float p1, p1

    .line 28
    mul-float/2addr v0, p1

    .line 29
    float-to-long v2, v0

    .line 30
    iget p2, p0, Lcom/google/android/exoplayer2/f;->n:F

    .line 31
    .line 32
    sub-float/2addr p2, v1

    .line 33
    mul-float/2addr p2, p1

    .line 34
    float-to-long p1, p2

    .line 35
    add-long/2addr v2, p1

    .line 36
    iget-wide p1, p0, Lcom/google/android/exoplayer2/f;->j:J

    .line 37
    .line 38
    iget-wide v0, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 39
    .line 40
    sub-long/2addr v0, v2

    .line 41
    const/4 v2, 0x3

    .line 42
    new-array v2, v2, [J

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    aput-wide v10, v2, v3

    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    aput-wide p1, v2, v3

    .line 49
    .line 50
    const/4 p1, 0x2

    .line 51
    aput-wide v0, v2, p1

    .line 52
    .line 53
    invoke-static {v2}, Lcom/google/common/primitives/Longs;->h([J)J

    .line 54
    .line 55
    .line 56
    move-result-wide p1

    .line 57
    iput-wide p1, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    iget v0, p0, Lcom/google/android/exoplayer2/f;->p:F

    .line 61
    .line 62
    sub-float/2addr v0, v1

    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget v1, p0, Lcom/google/android/exoplayer2/f;->d:F

    .line 69
    .line 70
    div-float/2addr v0, v1

    .line 71
    float-to-long v0, v0

    .line 72
    sub-long v6, p1, v0

    .line 73
    .line 74
    iget-wide v8, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 75
    .line 76
    invoke-static/range {v6 .. v11}, Ll/bmk0;->r(JJJ)J

    .line 77
    .line 78
    .line 79
    move-result-wide p1

    .line 80
    iput-wide p1, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 81
    .line 82
    iget-wide v0, p0, Lcom/google/android/exoplayer2/f;->l:J

    .line 83
    .line 84
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    cmp-long v2, v0, v2

    .line 90
    .line 91
    if-eqz v2, :cond_1

    .line 92
    .line 93
    cmp-long p1, p1, v0

    .line 94
    .line 95
    if-lez p1, :cond_1

    .line 96
    .line 97
    iput-wide v0, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 98
    .line 99
    :cond_1
    return-void
.end method

.method public final g()V
    .locals 7

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/f;->h:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v4, v0, v2

    .line 9
    .line 10
    if-eqz v4, :cond_2

    .line 11
    .line 12
    iget-wide v4, p0, Lcom/google/android/exoplayer2/f;->i:J

    .line 13
    .line 14
    cmp-long v6, v4, v2

    .line 15
    .line 16
    if-eqz v6, :cond_0

    .line 17
    .line 18
    move-wide v0, v4

    .line 19
    :cond_0
    iget-wide v4, p0, Lcom/google/android/exoplayer2/f;->k:J

    .line 20
    .line 21
    cmp-long v6, v4, v2

    .line 22
    .line 23
    if-eqz v6, :cond_1

    .line 24
    .line 25
    cmp-long v6, v0, v4

    .line 26
    .line 27
    if-gez v6, :cond_1

    .line 28
    .line 29
    move-wide v0, v4

    .line 30
    :cond_1
    iget-wide v4, p0, Lcom/google/android/exoplayer2/f;->l:J

    .line 31
    .line 32
    cmp-long v6, v4, v2

    .line 33
    .line 34
    if-eqz v6, :cond_3

    .line 35
    .line 36
    cmp-long v6, v0, v4

    .line 37
    .line 38
    if-lez v6, :cond_3

    .line 39
    .line 40
    move-wide v0, v4

    .line 41
    goto :goto_0

    .line 42
    :cond_2
    move-wide v0, v2

    .line 43
    :cond_3
    :goto_0
    iget-wide v4, p0, Lcom/google/android/exoplayer2/f;->j:J

    .line 44
    .line 45
    cmp-long v4, v4, v0

    .line 46
    .line 47
    if-nez v4, :cond_4

    .line 48
    .line 49
    return-void

    .line 50
    :cond_4
    iput-wide v0, p0, Lcom/google/android/exoplayer2/f;->j:J

    .line 51
    .line 52
    iput-wide v0, p0, Lcom/google/android/exoplayer2/f;->m:J

    .line 53
    .line 54
    iput-wide v2, p0, Lcom/google/android/exoplayer2/f;->r:J

    .line 55
    .line 56
    iput-wide v2, p0, Lcom/google/android/exoplayer2/f;->s:J

    .line 57
    .line 58
    iput-wide v2, p0, Lcom/google/android/exoplayer2/f;->q:J

    .line 59
    .line 60
    return-void
.end method

.method public final i(JJ)V
    .locals 2

    .line 1
    sub-long/2addr p1, p3

    .line 2
    iget-wide p3, p0, Lcom/google/android/exoplayer2/f;->r:J

    .line 3
    .line 4
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    cmp-long v0, p3, v0

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iput-wide p1, p0, Lcom/google/android/exoplayer2/f;->r:J

    .line 14
    .line 15
    const-wide/16 p1, 0x0

    .line 16
    .line 17
    iput-wide p1, p0, Lcom/google/android/exoplayer2/f;->s:J

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget v0, p0, Lcom/google/android/exoplayer2/f;->g:F

    .line 21
    .line 22
    invoke-static {p3, p4, p1, p2, v0}, Lcom/google/android/exoplayer2/f;->h(JJF)J

    .line 23
    .line 24
    .line 25
    move-result-wide p3

    .line 26
    invoke-static {p1, p2, p3, p4}, Ljava/lang/Math;->max(JJ)J

    .line 27
    .line 28
    .line 29
    move-result-wide p3

    .line 30
    iput-wide p3, p0, Lcom/google/android/exoplayer2/f;->r:J

    .line 31
    .line 32
    sub-long/2addr p1, p3

    .line 33
    invoke-static {p1, p2}, Ljava/lang/Math;->abs(J)J

    .line 34
    .line 35
    .line 36
    move-result-wide p1

    .line 37
    iget-wide p3, p0, Lcom/google/android/exoplayer2/f;->s:J

    .line 38
    .line 39
    iget v0, p0, Lcom/google/android/exoplayer2/f;->g:F

    .line 40
    .line 41
    invoke-static {p3, p4, p1, p2, v0}, Lcom/google/android/exoplayer2/f;->h(JJF)J

    .line 42
    .line 43
    .line 44
    move-result-wide p1

    .line 45
    iput-wide p1, p0, Lcom/google/android/exoplayer2/f;->s:J

    .line 46
    .line 47
    return-void
.end method
