.class public final Ll/vbr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/ebr0;

.field public final b:Ll/rbr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ll/ubr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Z

.field public e:Landroid/view/Surface;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public j:I

.field public k:J

.field public l:J

.field public m:J

.field public n:J

.field public o:J

.field public p:J

.field public q:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ebr0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ebr0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/vbr0;->a:Ll/ebr0;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget v1, Ll/mpw0;->a:I

    .line 19
    .line 20
    invoke-static {p1}, Ll/tbr0;->b(Landroid/content/Context;)Ll/rbr0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    invoke-static {p1}, Ll/sbr0;->b(Landroid/content/Context;)Ll/rbr0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move-object v1, v0

    .line 32
    :cond_1
    :goto_0
    iput-object v1, p0, Ll/vbr0;->b:Ll/rbr0;

    .line 33
    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    invoke-static {}, Ll/ubr0;->a()Ll/ubr0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :cond_2
    iput-object v0, p0, Ll/vbr0;->c:Ll/ubr0;

    .line 41
    .line 42
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    iput-wide v0, p0, Ll/vbr0;->k:J

    .line 48
    .line 49
    iput-wide v0, p0, Ll/vbr0;->l:J

    .line 50
    .line 51
    const/high16 p1, -0x40800000    # -1.0f

    .line 52
    .line 53
    iput p1, p0, Ll/vbr0;->f:F

    .line 54
    .line 55
    const/high16 p1, 0x3f800000    # 1.0f

    .line 56
    .line 57
    iput p1, p0, Ll/vbr0;->i:F

    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    iput p1, p0, Ll/vbr0;->j:I

    .line 61
    .line 62
    return-void
.end method

.method public static synthetic b(Ll/vbr0;Landroid/view/Display;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/Display;->getRefreshRate()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    float-to-double v0, p1

    .line 8
    const-wide v2, 0x41cdcd6500000000L    # 1.0E9

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    div-double/2addr v2, v0

    .line 14
    double-to-long v0, v2

    .line 15
    iput-wide v0, p0, Ll/vbr0;->k:J

    .line 16
    .line 17
    const-wide/16 v2, 0x50

    .line 18
    .line 19
    mul-long/2addr v0, v2

    .line 20
    const-wide/16 v2, 0x64

    .line 21
    .line 22
    div-long/2addr v0, v2

    .line 23
    iput-wide v0, p0, Ll/vbr0;->l:J

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string p1, "VideoFrameReleaseHelper"

    .line 27
    .line 28
    const-string v0, "Unable to query display refresh rate"

    .line 29
    .line 30
    invoke-static {p1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    iput-wide v0, p0, Ll/vbr0;->k:J

    .line 39
    .line 40
    iput-wide v0, p0, Ll/vbr0;->l:J

    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public final a(J)J
    .locals 10

    .line 1
    iget-wide v0, p0, Ll/vbr0;->p:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/vbr0;->a:Ll/ebr0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/ebr0;->g()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/vbr0;->a:Ll/ebr0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/ebr0;->c()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iget-wide v2, p0, Ll/vbr0;->q:J

    .line 24
    .line 25
    iget-wide v4, p0, Ll/vbr0;->m:J

    .line 26
    .line 27
    iget-wide v6, p0, Ll/vbr0;->p:J

    .line 28
    .line 29
    sub-long/2addr v4, v6

    .line 30
    mul-long/2addr v0, v4

    .line 31
    iget v4, p0, Ll/vbr0;->i:F

    .line 32
    .line 33
    long-to-float v0, v0

    .line 34
    div-float/2addr v0, v4

    .line 35
    float-to-long v0, v0

    .line 36
    add-long/2addr v2, v0

    .line 37
    sub-long v0, p1, v2

    .line 38
    .line 39
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    const-wide/32 v4, 0x1312d00

    .line 44
    .line 45
    .line 46
    cmp-long v0, v0, v4

    .line 47
    .line 48
    if-lez v0, :cond_0

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/vbr0;->l()V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    move-wide p1, v2

    .line 55
    :cond_1
    :goto_0
    iget-wide v0, p0, Ll/vbr0;->m:J

    .line 56
    .line 57
    iput-wide v0, p0, Ll/vbr0;->n:J

    .line 58
    .line 59
    iput-wide p1, p0, Ll/vbr0;->o:J

    .line 60
    .line 61
    iget-object v0, p0, Ll/vbr0;->c:Ll/ubr0;

    .line 62
    .line 63
    if-eqz v0, :cond_5

    .line 64
    .line 65
    iget-wide v1, p0, Ll/vbr0;->k:J

    .line 66
    .line 67
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    cmp-long v1, v1, v3

    .line 73
    .line 74
    if-nez v1, :cond_2

    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_2
    iget-wide v0, v0, Ll/ubr0;->a:J

    .line 78
    .line 79
    cmp-long v2, v0, v3

    .line 80
    .line 81
    if-eqz v2, :cond_5

    .line 82
    .line 83
    iget-wide v2, p0, Ll/vbr0;->k:J

    .line 84
    .line 85
    sub-long v4, p1, v0

    .line 86
    .line 87
    div-long/2addr v4, v2

    .line 88
    mul-long/2addr v4, v2

    .line 89
    add-long/2addr v0, v4

    .line 90
    cmp-long v4, p1, v0

    .line 91
    .line 92
    if-gtz v4, :cond_3

    .line 93
    .line 94
    sub-long v2, v0, v2

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_3
    add-long/2addr v2, v0

    .line 98
    move-wide v8, v2

    .line 99
    move-wide v2, v0

    .line 100
    move-wide v0, v8

    .line 101
    :goto_1
    iget-wide v4, p0, Ll/vbr0;->l:J

    .line 102
    .line 103
    sub-long v6, v0, p1

    .line 104
    .line 105
    sub-long/2addr p1, v2

    .line 106
    cmp-long p0, v6, p1

    .line 107
    .line 108
    if-gez p0, :cond_4

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_4
    move-wide v0, v2

    .line 112
    :goto_2
    sub-long/2addr v0, v4

    .line 113
    return-wide v0

    .line 114
    :cond_5
    :goto_3
    return-wide p1
.end method

.method public final c(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/vbr0;->f:F

    .line 2
    .line 3
    iget-object p1, p0, Ll/vbr0;->a:Ll/ebr0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/ebr0;->f()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/vbr0;->m()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final d(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/vbr0;->n:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iput-wide v0, p0, Ll/vbr0;->p:J

    .line 10
    .line 11
    iget-wide v0, p0, Ll/vbr0;->o:J

    .line 12
    .line 13
    iput-wide v0, p0, Ll/vbr0;->q:J

    .line 14
    .line 15
    :cond_0
    iget-wide v0, p0, Ll/vbr0;->m:J

    .line 16
    .line 17
    const-wide/16 v2, 0x1

    .line 18
    .line 19
    add-long/2addr v0, v2

    .line 20
    iput-wide v0, p0, Ll/vbr0;->m:J

    .line 21
    .line 22
    iget-object v0, p0, Ll/vbr0;->a:Ll/ebr0;

    .line 23
    .line 24
    const-wide/16 v1, 0x3e8

    .line 25
    .line 26
    mul-long/2addr p1, v1

    .line 27
    invoke-virtual {v0, p1, p2}, Ll/ebr0;->e(J)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/vbr0;->m()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final e(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/vbr0;->i:F

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vbr0;->l()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Ll/vbr0;->n(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final f()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vbr0;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/vbr0;->d:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/vbr0;->l()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/vbr0;->b:Ll/rbr0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/vbr0;->c:Ll/ubr0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ll/ubr0;->b()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/vbr0;->b:Ll/rbr0;

    .line 20
    .line 21
    new-instance v1, Ll/obr0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/obr0;-><init>(Ll/vbr0;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1}, Ll/rbr0;->a(Ll/obr0;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, v0}, Ll/vbr0;->n(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final h()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/vbr0;->d:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/vbr0;->b:Ll/rbr0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Ll/rbr0;->zza()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/vbr0;->c:Ll/ubr0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ll/ubr0;->c()V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/vbr0;->k()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final i(Landroid/view/Surface;)V
    .locals 3
    .param p1    # Landroid/view/Surface;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    invoke-static {p1}, Ll/pbr0;->a(Landroid/view/Surface;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/vbr0;->e:Landroid/view/Surface;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-ne v2, v0, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    :cond_0
    if-ne v1, p1, :cond_1

    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    invoke-virtual {p0}, Ll/vbr0;->k()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/vbr0;->e:Landroid/view/Surface;

    .line 20
    .line 21
    invoke-virtual {p0, v2}, Ll/vbr0;->n(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final j(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/vbr0;->j:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Ll/vbr0;->j:I

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-virtual {p0, p1}, Ll/vbr0;->n(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final k()V
    .locals 3

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1e

    .line 4
    .line 5
    if-lt v0, v1, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/vbr0;->e:Landroid/view/Surface;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget v1, p0, Ll/vbr0;->j:I

    .line 12
    .line 13
    const/high16 v2, -0x80000000

    .line 14
    .line 15
    if-eq v1, v2, :cond_1

    .line 16
    .line 17
    iget v1, p0, Ll/vbr0;->h:F

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    cmpl-float v1, v1, v2

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iput v2, p0, Ll/vbr0;->h:F

    .line 26
    .line 27
    invoke-static {v0, v2}, Ll/qbr0;->a(Landroid/view/Surface;F)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/vbr0;->m:J

    .line 4
    .line 5
    const-wide/16 v0, -0x1

    .line 6
    .line 7
    iput-wide v0, p0, Ll/vbr0;->p:J

    .line 8
    .line 9
    iput-wide v0, p0, Ll/vbr0;->n:J

    .line 10
    .line 11
    return-void
.end method

.method public final m()V
    .locals 7

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1e

    .line 4
    .line 5
    if-lt v0, v1, :cond_7

    .line 6
    .line 7
    iget-object v0, p0, Ll/vbr0;->e:Landroid/view/Surface;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    iget-object v0, p0, Ll/vbr0;->a:Ll/ebr0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/ebr0;->g()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/vbr0;->a:Ll/ebr0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/ebr0;->a()F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget v0, p0, Ll/vbr0;->f:F

    .line 28
    .line 29
    :goto_0
    iget v2, p0, Ll/vbr0;->g:F

    .line 30
    .line 31
    cmpl-float v3, v0, v2

    .line 32
    .line 33
    if-eqz v3, :cond_7

    .line 34
    .line 35
    const/high16 v3, -0x40800000    # -1.0f

    .line 36
    .line 37
    cmpl-float v4, v0, v3

    .line 38
    .line 39
    if-eqz v4, :cond_4

    .line 40
    .line 41
    cmpl-float v2, v2, v3

    .line 42
    .line 43
    if-eqz v2, :cond_4

    .line 44
    .line 45
    iget-object v1, p0, Ll/vbr0;->a:Ll/ebr0;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/ebr0;->g()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    const/high16 v2, 0x3f800000    # 1.0f

    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Ll/vbr0;->a:Ll/ebr0;

    .line 56
    .line 57
    invoke-virtual {v1}, Ll/ebr0;->d()J

    .line 58
    .line 59
    .line 60
    move-result-wide v3

    .line 61
    const-wide v5, 0x12a05f200L

    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    cmp-long v1, v3, v5

    .line 67
    .line 68
    if-ltz v1, :cond_2

    .line 69
    .line 70
    const v2, 0x3ca3d70a    # 0.02f

    .line 71
    .line 72
    .line 73
    :cond_2
    iget v1, p0, Ll/vbr0;->g:F

    .line 74
    .line 75
    sub-float v1, v0, v1

    .line 76
    .line 77
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    cmpl-float v1, v1, v2

    .line 82
    .line 83
    if-ltz v1, :cond_3

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_3
    return-void

    .line 87
    :cond_4
    if-nez v4, :cond_6

    .line 88
    .line 89
    iget-object v2, p0, Ll/vbr0;->a:Ll/ebr0;

    .line 90
    .line 91
    invoke-virtual {v2}, Ll/ebr0;->b()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-lt v2, v1, :cond_5

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_5
    return-void

    .line 99
    :cond_6
    :goto_1
    iput v0, p0, Ll/vbr0;->g:F

    .line 100
    .line 101
    const/4 v0, 0x0

    .line 102
    invoke-virtual {p0, v0}, Ll/vbr0;->n(Z)V

    .line 103
    .line 104
    .line 105
    :cond_7
    :goto_2
    return-void
.end method

.method public final n(Z)V
    .locals 4

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1e

    .line 4
    .line 5
    if-lt v0, v1, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Ll/vbr0;->e:Landroid/view/Surface;

    .line 8
    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    iget v1, p0, Ll/vbr0;->j:I

    .line 12
    .line 13
    const/high16 v2, -0x80000000

    .line 14
    .line 15
    if-ne v1, v2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-boolean v1, p0, Ll/vbr0;->d:Z

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget v1, p0, Ll/vbr0;->g:F

    .line 24
    .line 25
    const/high16 v3, -0x40800000    # -1.0f

    .line 26
    .line 27
    cmpl-float v3, v1, v3

    .line 28
    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    iget v2, p0, Ll/vbr0;->i:F

    .line 32
    .line 33
    mul-float/2addr v2, v1

    .line 34
    :cond_1
    if-nez p1, :cond_2

    .line 35
    .line 36
    iget p1, p0, Ll/vbr0;->h:F

    .line 37
    .line 38
    cmpl-float p1, p1, v2

    .line 39
    .line 40
    if-eqz p1, :cond_3

    .line 41
    .line 42
    :cond_2
    iput v2, p0, Ll/vbr0;->h:F

    .line 43
    .line 44
    invoke-static {v0, v2}, Ll/qbr0;->a(Landroid/view/Surface;F)V

    .line 45
    .line 46
    .line 47
    :cond_3
    :goto_0
    return-void
.end method
