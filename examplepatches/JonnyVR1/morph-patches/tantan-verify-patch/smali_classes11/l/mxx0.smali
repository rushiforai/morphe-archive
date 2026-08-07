.class public final Ll/mxx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/q9y0;


# instance fields
.field public final a:Ll/c6z0;

.field public final b:J

.field public final c:J

.field public final d:J

.field public final e:J

.field public final f:J

.field public g:I

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 9

    .line 1
    new-instance v0, Ll/c6z0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/high16 v2, 0x10000

    .line 5
    .line 6
    invoke-direct {v0, v1, v2}, Ll/c6z0;-><init>(ZI)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    const/16 v1, 0x9c4

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const-string v3, "bufferForPlaybackMs"

    .line 16
    .line 17
    const-string v4, "0"

    .line 18
    .line 19
    invoke-static {v1, v2, v3, v4}, Ll/mxx0;->d(IILjava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/16 v5, 0x1388

    .line 23
    .line 24
    const-string v6, "bufferForPlaybackAfterRebufferMs"

    .line 25
    .line 26
    invoke-static {v5, v2, v6, v4}, Ll/mxx0;->d(IILjava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const v7, 0xc350

    .line 30
    .line 31
    .line 32
    const-string v8, "minBufferMs"

    .line 33
    .line 34
    invoke-static {v7, v1, v8, v3}, Ll/mxx0;->d(IILjava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v7, v5, v8, v6}, Ll/mxx0;->d(IILjava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const-string v1, "maxBufferMs"

    .line 41
    .line 42
    invoke-static {v7, v7, v1, v8}, Ll/mxx0;->d(IILjava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const-string v1, "backBufferDurationMs"

    .line 46
    .line 47
    invoke-static {v2, v2, v1, v4}, Ll/mxx0;->d(IILjava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Ll/mxx0;->a:Ll/c6z0;

    .line 51
    .line 52
    const-wide/32 v0, 0xc350

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    iput-wide v2, p0, Ll/mxx0;->b:J

    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 62
    .line 63
    .line 64
    move-result-wide v0

    .line 65
    iput-wide v0, p0, Ll/mxx0;->c:J

    .line 66
    .line 67
    const-wide/16 v0, 0x9c4

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    iput-wide v0, p0, Ll/mxx0;->d:J

    .line 74
    .line 75
    const-wide/16 v0, 0x1388

    .line 76
    .line 77
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 78
    .line 79
    .line 80
    move-result-wide v0

    .line 81
    iput-wide v0, p0, Ll/mxx0;->e:J

    .line 82
    .line 83
    const/high16 v0, 0xc80000

    .line 84
    .line 85
    iput v0, p0, Ll/mxx0;->g:I

    .line 86
    .line 87
    const-wide/16 v0, 0x0

    .line 88
    .line 89
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 90
    .line 91
    .line 92
    move-result-wide v0

    .line 93
    iput-wide v0, p0, Ll/mxx0;->f:J

    .line 94
    .line 95
    return-void
.end method

.method public static d(IILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p2, " cannot be less than "

    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    if-lt p0, p1, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    :goto_0
    invoke-static {p0, p2}, Ll/lev0;->e(ZLjava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final a(Ll/d0u0;Ll/kzy0;[Ll/vey0;Ll/q2z0;[Ll/n5z0;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    move p2, p1

    .line 3
    :goto_0
    array-length p4, p3

    .line 4
    const/4 p4, 0x2

    .line 5
    const/high16 v0, 0xc80000

    .line 6
    .line 7
    if-ge p1, p4, :cond_2

    .line 8
    .line 9
    aget-object p4, p5, p1

    .line 10
    .line 11
    if-eqz p4, :cond_1

    .line 12
    .line 13
    aget-object p4, p3, p1

    .line 14
    .line 15
    invoke-interface {p4}, Ll/vey0;->c()I

    .line 16
    .line 17
    .line 18
    move-result p4

    .line 19
    const/4 v1, 0x1

    .line 20
    if-eq p4, v1, :cond_0

    .line 21
    .line 22
    const/high16 v0, 0x7d00000

    .line 23
    .line 24
    :cond_0
    add-int/2addr p2, v0

    .line 25
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Ll/mxx0;->g:I

    .line 33
    .line 34
    iget-object p0, p0, Ll/mxx0;->a:Ll/c6z0;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/c6z0;->f(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final b(Ll/d0u0;Ll/kzy0;JFZJ)Z
    .locals 0

    .line 1
    invoke-static {p3, p4, p5}, Ll/mpw0;->E(JF)J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    if-eqz p6, :cond_0

    .line 6
    .line 7
    iget-wide p3, p0, Ll/mxx0;->e:J

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-wide p3, p0, Ll/mxx0;->d:J

    .line 11
    .line 12
    :goto_0
    const-wide p5, -0x7fffffffffffffffL    # -4.9E-324

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    cmp-long p5, p7, p5

    .line 18
    .line 19
    if-eqz p5, :cond_1

    .line 20
    .line 21
    const-wide/16 p5, 0x2

    .line 22
    .line 23
    div-long/2addr p7, p5

    .line 24
    invoke-static {p7, p8, p3, p4}, Ljava/lang/Math;->min(JJ)J

    .line 25
    .line 26
    .line 27
    move-result-wide p3

    .line 28
    :cond_1
    const-wide/16 p5, 0x0

    .line 29
    .line 30
    cmp-long p5, p3, p5

    .line 31
    .line 32
    if-lez p5, :cond_3

    .line 33
    .line 34
    cmp-long p1, p1, p3

    .line 35
    .line 36
    if-gez p1, :cond_3

    .line 37
    .line 38
    iget-object p1, p0, Ll/mxx0;->a:Ll/c6z0;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/c6z0;->a()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iget p0, p0, Ll/mxx0;->g:I

    .line 45
    .line 46
    if-lt p1, p0, :cond_2

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    return p0

    .line 51
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 52
    return p0
.end method

.method public final c(JJF)Z
    .locals 5

    .line 1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 2
    .line 3
    cmpl-float p1, p5, p1

    .line 4
    .line 5
    iget-object p2, p0, Ll/mxx0;->a:Ll/c6z0;

    .line 6
    .line 7
    invoke-virtual {p2}, Ll/c6z0;->a()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget v0, p0, Ll/mxx0;->g:I

    .line 12
    .line 13
    iget-wide v1, p0, Ll/mxx0;->b:J

    .line 14
    .line 15
    if-lez p1, :cond_0

    .line 16
    .line 17
    invoke-static {v1, v2, p5}, Ll/mpw0;->D(JF)J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    iget-wide v3, p0, Ll/mxx0;->c:J

    .line 22
    .line 23
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    :cond_0
    const-wide/32 v3, 0x7a120

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    cmp-long p1, p3, v1

    .line 35
    .line 36
    const/4 p5, 0x0

    .line 37
    if-gez p1, :cond_2

    .line 38
    .line 39
    if-ge p2, v0, :cond_1

    .line 40
    .line 41
    const/4 p5, 0x1

    .line 42
    :cond_1
    iput-boolean p5, p0, Ll/mxx0;->h:Z

    .line 43
    .line 44
    if-nez p5, :cond_4

    .line 45
    .line 46
    cmp-long p1, p3, v3

    .line 47
    .line 48
    if-gez p1, :cond_4

    .line 49
    .line 50
    const-string p1, "DefaultLoadControl"

    .line 51
    .line 52
    const-string p2, "Target buffer size reached with less than 500ms of buffered media data."

    .line 53
    .line 54
    invoke-static {p1, p2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    iget-wide v1, p0, Ll/mxx0;->c:J

    .line 59
    .line 60
    cmp-long p1, p3, v1

    .line 61
    .line 62
    if-gez p1, :cond_3

    .line 63
    .line 64
    if-lt p2, v0, :cond_4

    .line 65
    .line 66
    :cond_3
    iput-boolean p5, p0, Ll/mxx0;->h:Z

    .line 67
    .line 68
    :cond_4
    :goto_0
    iget-boolean p0, p0, Ll/mxx0;->h:Z

    .line 69
    .line 70
    return p0
.end method

.method public final e(Z)V
    .locals 1

    .line 1
    const/high16 v0, 0xc80000

    .line 2
    .line 3
    iput v0, p0, Ll/mxx0;->g:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/mxx0;->h:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/mxx0;->a:Ll/c6z0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/c6z0;->e()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final zza()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/mxx0;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final zzb()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/mxx0;->e(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final zzc()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/mxx0;->e(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final zzd()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/mxx0;->e(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final zzf()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final zzi()Ll/c6z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mxx0;->a:Ll/c6z0;

    .line 2
    .line 3
    return-object p0
.end method
