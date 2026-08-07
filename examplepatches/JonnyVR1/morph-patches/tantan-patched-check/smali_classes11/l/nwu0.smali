.class public final Ll/nwu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wsu0;


# instance fields
.field public b:I

.field public c:F

.field public d:F

.field public e:Ll/mqu0;

.field public f:Ll/mqu0;

.field public g:Ll/mqu0;

.field public h:Ll/mqu0;

.field public i:Z

.field public j:Ll/hvu0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k:Ljava/nio/ByteBuffer;

.field public l:Ljava/nio/ShortBuffer;

.field public m:Ljava/nio/ByteBuffer;

.field public n:J

.field public o:J

.field public p:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/nwu0;->c:F

    .line 7
    .line 8
    iput v0, p0, Ll/nwu0;->d:F

    .line 9
    .line 10
    sget-object v0, Ll/mqu0;->e:Ll/mqu0;

    .line 11
    .line 12
    iput-object v0, p0, Ll/nwu0;->e:Ll/mqu0;

    .line 13
    .line 14
    iput-object v0, p0, Ll/nwu0;->f:Ll/mqu0;

    .line 15
    .line 16
    iput-object v0, p0, Ll/nwu0;->g:Ll/mqu0;

    .line 17
    .line 18
    iput-object v0, p0, Ll/nwu0;->h:Ll/mqu0;

    .line 19
    .line 20
    sget-object v0, Ll/wsu0;->a:Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    iput-object v0, p0, Ll/nwu0;->k:Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, p0, Ll/nwu0;->l:Ljava/nio/ShortBuffer;

    .line 29
    .line 30
    iput-object v0, p0, Ll/nwu0;->m:Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    const/4 v0, -0x1

    .line 33
    iput v0, p0, Ll/nwu0;->b:I

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final a(Ljava/nio/ByteBuffer;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->hasRemaining()Z

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
    iget-object v0, p0, Ll/nwu0;->j:Ll/hvu0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-wide v3, p0, Ll/nwu0;->n:J

    .line 22
    .line 23
    int-to-long v5, v2

    .line 24
    add-long/2addr v3, v5

    .line 25
    iput-wide v3, p0, Ll/nwu0;->n:J

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/hvu0;->f(Ljava/nio/ShortBuffer;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    add-int/2addr p0, v2

    .line 35
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final b(Ll/mqu0;)Ll/mqu0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzds;
        }
    .end annotation

    .line 1
    iget v0, p1, Ll/mqu0;->c:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget v0, p0, Ll/nwu0;->b:I

    .line 7
    .line 8
    const/4 v2, -0x1

    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    iget v0, p1, Ll/mqu0;->a:I

    .line 12
    .line 13
    :cond_0
    iput-object p1, p0, Ll/nwu0;->e:Ll/mqu0;

    .line 14
    .line 15
    new-instance v2, Ll/mqu0;

    .line 16
    .line 17
    iget p1, p1, Ll/mqu0;->b:I

    .line 18
    .line 19
    invoke-direct {v2, v0, p1, v1}, Ll/mqu0;-><init>(III)V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Ll/nwu0;->f:Ll/mqu0;

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    iput-boolean p1, p0, Ll/nwu0;->i:Z

    .line 26
    .line 27
    return-object v2

    .line 28
    :cond_1
    new-instance p0, Lcom/google/android/gms/internal/ads/zzds;

    .line 29
    .line 30
    const-string v0, "Unhandled input format:"

    .line 31
    .line 32
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/internal/ads/zzds;-><init>(Ljava/lang/String;Ll/mqu0;)V

    .line 33
    .line 34
    .line 35
    throw p0
.end method

.method public final c(J)J
    .locals 9

    .line 1
    iget-wide v4, p0, Ll/nwu0;->o:J

    .line 2
    .line 3
    const-wide/16 v0, 0x400

    .line 4
    .line 5
    cmp-long v0, v4, v0

    .line 6
    .line 7
    if-ltz v0, :cond_1

    .line 8
    .line 9
    iget-wide v0, p0, Ll/nwu0;->n:J

    .line 10
    .line 11
    iget-object v2, p0, Ll/nwu0;->j:Ll/hvu0;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2}, Ll/hvu0;->b()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    int-to-long v2, v2

    .line 21
    sub-long v2, v0, v2

    .line 22
    .line 23
    iget-object v0, p0, Ll/nwu0;->h:Ll/mqu0;

    .line 24
    .line 25
    iget v0, v0, Ll/mqu0;->a:I

    .line 26
    .line 27
    iget-object p0, p0, Ll/nwu0;->g:Ll/mqu0;

    .line 28
    .line 29
    iget p0, p0, Ll/mqu0;->a:I

    .line 30
    .line 31
    if-ne v0, p0, :cond_0

    .line 32
    .line 33
    sget-object v6, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 34
    .line 35
    move-wide v0, p1

    .line 36
    invoke-static/range {v0 .. v6}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 37
    .line 38
    .line 39
    move-result-wide p0

    .line 40
    return-wide p0

    .line 41
    :cond_0
    move-wide v7, p1

    .line 42
    move p1, v0

    .line 43
    move-wide v0, v7

    .line 44
    int-to-long p1, p1

    .line 45
    mul-long/2addr v2, p1

    .line 46
    int-to-long p0, p0

    .line 47
    mul-long/2addr v4, p0

    .line 48
    sget-object v6, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 49
    .line 50
    invoke-static/range {v0 .. v6}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 51
    .line 52
    .line 53
    move-result-wide p0

    .line 54
    return-wide p0

    .line 55
    :cond_1
    move-wide v0, p1

    .line 56
    iget p0, p0, Ll/nwu0;->c:F

    .line 57
    .line 58
    float-to-double p0, p0

    .line 59
    long-to-double v0, v0

    .line 60
    mul-double/2addr p0, v0

    .line 61
    double-to-long p0, p0

    .line 62
    return-wide p0
.end method

.method public final d(F)V
    .locals 1

    .line 1
    iget v0, p0, Ll/nwu0;->d:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/nwu0;->d:F

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Ll/nwu0;->i:Z

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final e(F)V
    .locals 1

    .line 1
    iget v0, p0, Ll/nwu0;->c:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/nwu0;->c:F

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Ll/nwu0;->i:Z

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final zzb()Ljava/nio/ByteBuffer;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/nwu0;->j:Ll/hvu0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/hvu0;->a()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lez v1, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Ll/nwu0;->k:Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v2, v1, :cond_0

    .line 18
    .line 19
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iput-object v2, p0, Ll/nwu0;->k:Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iput-object v2, p0, Ll/nwu0;->l:Ljava/nio/ShortBuffer;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v2, p0, Ll/nwu0;->k:Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Ll/nwu0;->l:Ljava/nio/ShortBuffer;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object v2, p0, Ll/nwu0;->l:Ljava/nio/ShortBuffer;

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ll/hvu0;->d(Ljava/nio/ShortBuffer;)V

    .line 53
    .line 54
    .line 55
    iget-wide v2, p0, Ll/nwu0;->o:J

    .line 56
    .line 57
    int-to-long v4, v1

    .line 58
    add-long/2addr v2, v4

    .line 59
    iput-wide v2, p0, Ll/nwu0;->o:J

    .line 60
    .line 61
    iget-object v0, p0, Ll/nwu0;->k:Ljava/nio/ByteBuffer;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/nwu0;->k:Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    iput-object v0, p0, Ll/nwu0;->m:Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    :cond_1
    iget-object v0, p0, Ll/nwu0;->m:Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    sget-object v1, Ll/wsu0;->a:Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    iput-object v1, p0, Ll/nwu0;->m:Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    return-object v0
.end method

.method public final zzc()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/nwu0;->zzg()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/nwu0;->e:Ll/mqu0;

    .line 8
    .line 9
    iput-object v0, p0, Ll/nwu0;->g:Ll/mqu0;

    .line 10
    .line 11
    iget-object v1, p0, Ll/nwu0;->f:Ll/mqu0;

    .line 12
    .line 13
    iput-object v1, p0, Ll/nwu0;->h:Ll/mqu0;

    .line 14
    .line 15
    iget-boolean v2, p0, Ll/nwu0;->i:Z

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    new-instance v3, Ll/hvu0;

    .line 20
    .line 21
    iget v4, v0, Ll/mqu0;->a:I

    .line 22
    .line 23
    iget v5, v0, Ll/mqu0;->b:I

    .line 24
    .line 25
    iget v6, p0, Ll/nwu0;->c:F

    .line 26
    .line 27
    iget v7, p0, Ll/nwu0;->d:F

    .line 28
    .line 29
    iget v8, v1, Ll/mqu0;->a:I

    .line 30
    .line 31
    invoke-direct/range {v3 .. v8}, Ll/hvu0;-><init>(IIFFI)V

    .line 32
    .line 33
    .line 34
    iput-object v3, p0, Ll/nwu0;->j:Ll/hvu0;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v0, p0, Ll/nwu0;->j:Ll/hvu0;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/hvu0;->c()V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    sget-object v0, Ll/wsu0;->a:Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    iput-object v0, p0, Ll/nwu0;->m:Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    const-wide/16 v0, 0x0

    .line 49
    .line 50
    iput-wide v0, p0, Ll/nwu0;->n:J

    .line 51
    .line 52
    iput-wide v0, p0, Ll/nwu0;->o:J

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    iput-boolean v0, p0, Ll/nwu0;->p:Z

    .line 56
    .line 57
    return-void
.end method

.method public final zzd()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nwu0;->j:Ll/hvu0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/hvu0;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/nwu0;->p:Z

    .line 10
    .line 11
    return-void
.end method

.method public final zzf()V
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    iput v0, p0, Ll/nwu0;->c:F

    .line 4
    .line 5
    iput v0, p0, Ll/nwu0;->d:F

    .line 6
    .line 7
    sget-object v0, Ll/mqu0;->e:Ll/mqu0;

    .line 8
    .line 9
    iput-object v0, p0, Ll/nwu0;->e:Ll/mqu0;

    .line 10
    .line 11
    iput-object v0, p0, Ll/nwu0;->f:Ll/mqu0;

    .line 12
    .line 13
    iput-object v0, p0, Ll/nwu0;->g:Ll/mqu0;

    .line 14
    .line 15
    iput-object v0, p0, Ll/nwu0;->h:Ll/mqu0;

    .line 16
    .line 17
    sget-object v0, Ll/wsu0;->a:Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    iput-object v0, p0, Ll/nwu0;->k:Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, p0, Ll/nwu0;->l:Ljava/nio/ShortBuffer;

    .line 26
    .line 27
    iput-object v0, p0, Ll/nwu0;->m:Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    const/4 v0, -0x1

    .line 30
    iput v0, p0, Ll/nwu0;->b:I

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Ll/nwu0;->i:Z

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    iput-object v1, p0, Ll/nwu0;->j:Ll/hvu0;

    .line 37
    .line 38
    const-wide/16 v1, 0x0

    .line 39
    .line 40
    iput-wide v1, p0, Ll/nwu0;->n:J

    .line 41
    .line 42
    iput-wide v1, p0, Ll/nwu0;->o:J

    .line 43
    .line 44
    iput-boolean v0, p0, Ll/nwu0;->p:Z

    .line 45
    .line 46
    return-void
.end method

.method public final zzg()Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/nwu0;->f:Ll/mqu0;

    .line 2
    .line 3
    iget v0, v0, Ll/mqu0;->a:I

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    iget v0, p0, Ll/nwu0;->c:F

    .line 10
    .line 11
    const/high16 v1, -0x40800000    # -1.0f

    .line 12
    .line 13
    add-float/2addr v0, v1

    .line 14
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const v3, 0x38d1b717    # 1.0E-4f

    .line 19
    .line 20
    .line 21
    cmpl-float v0, v0, v3

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    if-gez v0, :cond_0

    .line 25
    .line 26
    iget v0, p0, Ll/nwu0;->d:F

    .line 27
    .line 28
    add-float/2addr v0, v1

    .line 29
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    cmpl-float v0, v0, v3

    .line 34
    .line 35
    if-gez v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Ll/nwu0;->f:Ll/mqu0;

    .line 38
    .line 39
    iget v0, v0, Ll/mqu0;->a:I

    .line 40
    .line 41
    iget-object p0, p0, Ll/nwu0;->e:Ll/mqu0;

    .line 42
    .line 43
    iget p0, p0, Ll/mqu0;->a:I

    .line 44
    .line 45
    if-ne v0, p0, :cond_0

    .line 46
    .line 47
    return v2

    .line 48
    :cond_0
    return v4

    .line 49
    :cond_1
    return v2
.end method

.method public final zzh()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/nwu0;->p:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object p0, p0, Ll/nwu0;->j:Ll/hvu0;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hvu0;->a()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    return v0

    .line 19
    :cond_1
    return v1
.end method
