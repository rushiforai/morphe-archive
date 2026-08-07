.class public Ll/ey5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mke0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:J

.field public final b:J

.field public final c:I

.field public final d:J

.field public final e:I

.field public final f:J

.field public final g:Z


# direct methods
.method public constructor <init>(JJIIZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/ey5;->a:J

    .line 5
    .line 6
    iput-wide p3, p0, Ll/ey5;->b:J

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    if-ne p6, v0, :cond_0

    .line 10
    .line 11
    const/4 p6, 0x1

    .line 12
    :cond_0
    iput p6, p0, Ll/ey5;->c:I

    .line 13
    .line 14
    iput p5, p0, Ll/ey5;->e:I

    .line 15
    .line 16
    iput-boolean p7, p0, Ll/ey5;->g:Z

    .line 17
    .line 18
    const-wide/16 p6, -0x1

    .line 19
    .line 20
    cmp-long v0, p1, p6

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iput-wide p6, p0, Ll/ey5;->d:J

    .line 25
    .line 26
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    iput-wide p1, p0, Ll/ey5;->f:J

    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    sub-long p6, p1, p3

    .line 35
    .line 36
    iput-wide p6, p0, Ll/ey5;->d:J

    .line 37
    .line 38
    invoke-static {p1, p2, p3, p4, p5}, Ll/ey5;->f(JJI)J

    .line 39
    .line 40
    .line 41
    move-result-wide p1

    .line 42
    iput-wide p1, p0, Ll/ey5;->f:J

    .line 43
    .line 44
    return-void
.end method

.method public static f(JJI)J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    sub-long/2addr p0, p2

    .line 4
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    .line 5
    .line 6
    .line 7
    move-result-wide p0

    .line 8
    const-wide/32 p2, 0x7a1200

    .line 9
    .line 10
    .line 11
    mul-long/2addr p0, p2

    .line 12
    int-to-long p2, p4

    .line 13
    div-long/2addr p0, p2

    .line 14
    return-wide p0
.end method


# virtual methods
.method public final a(J)J
    .locals 5

    .line 1
    iget v0, p0, Ll/ey5;->e:I

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    mul-long/2addr p1, v0

    .line 5
    const-wide/32 v0, 0x7a1200

    .line 6
    .line 7
    .line 8
    div-long/2addr p1, v0

    .line 9
    iget v0, p0, Ll/ey5;->c:I

    .line 10
    .line 11
    int-to-long v1, v0

    .line 12
    div-long/2addr p1, v1

    .line 13
    int-to-long v1, v0

    .line 14
    mul-long/2addr p1, v1

    .line 15
    iget-wide v1, p0, Ll/ey5;->d:J

    .line 16
    .line 17
    const-wide/16 v3, -0x1

    .line 18
    .line 19
    cmp-long v3, v1, v3

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    int-to-long v3, v0

    .line 24
    sub-long/2addr v1, v3

    .line 25
    invoke-static {p1, p2, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 26
    .line 27
    .line 28
    move-result-wide p1

    .line 29
    :cond_0
    const-wide/16 v0, 0x0

    .line 30
    .line 31
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 32
    .line 33
    .line 34
    move-result-wide p1

    .line 35
    iget-wide v0, p0, Ll/ey5;->b:J

    .line 36
    .line 37
    add-long/2addr v0, p1

    .line 38
    return-wide v0
.end method

.method public b(J)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey5;->b:J

    .line 2
    .line 3
    iget p0, p0, Ll/ey5;->e:I

    .line 4
    .line 5
    invoke-static {p1, p2, v0, v1, p0}, Ll/ey5;->f(JJI)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public d(J)Ll/mke0$a;
    .locals 9

    .line 1
    iget-wide v0, p0, Ll/ey5;->d:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/ey5;->g:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance p1, Ll/mke0$a;

    .line 14
    .line 15
    new-instance p2, Ll/oke0;

    .line 16
    .line 17
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    iget-wide v2, p0, Ll/ey5;->b:J

    .line 20
    .line 21
    invoke-direct {p2, v0, v1, v2, v3}, Ll/oke0;-><init>(JJ)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p1, p2}, Ll/mke0$a;-><init>(Ll/oke0;)V

    .line 25
    .line 26
    .line 27
    return-object p1

    .line 28
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/ey5;->a(J)J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    invoke-virtual {p0, v0, v1}, Ll/ey5;->b(J)J

    .line 33
    .line 34
    .line 35
    move-result-wide v4

    .line 36
    new-instance v6, Ll/oke0;

    .line 37
    .line 38
    invoke-direct {v6, v4, v5, v0, v1}, Ll/oke0;-><init>(JJ)V

    .line 39
    .line 40
    .line 41
    iget-wide v7, p0, Ll/ey5;->d:J

    .line 42
    .line 43
    cmp-long v2, v7, v2

    .line 44
    .line 45
    if-eqz v2, :cond_2

    .line 46
    .line 47
    cmp-long p1, v4, p1

    .line 48
    .line 49
    if-gez p1, :cond_2

    .line 50
    .line 51
    iget p1, p0, Ll/ey5;->c:I

    .line 52
    .line 53
    int-to-long v2, p1

    .line 54
    add-long/2addr v2, v0

    .line 55
    iget-wide v4, p0, Ll/ey5;->a:J

    .line 56
    .line 57
    cmp-long p2, v2, v4

    .line 58
    .line 59
    if-ltz p2, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    int-to-long p1, p1

    .line 63
    add-long/2addr v0, p1

    .line 64
    invoke-virtual {p0, v0, v1}, Ll/ey5;->b(J)J

    .line 65
    .line 66
    .line 67
    move-result-wide p0

    .line 68
    new-instance p2, Ll/oke0;

    .line 69
    .line 70
    invoke-direct {p2, p0, p1, v0, v1}, Ll/oke0;-><init>(JJ)V

    .line 71
    .line 72
    .line 73
    new-instance p0, Ll/mke0$a;

    .line 74
    .line 75
    invoke-direct {p0, v6, p2}, Ll/mke0$a;-><init>(Ll/oke0;Ll/oke0;)V

    .line 76
    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_2
    :goto_0
    new-instance p0, Ll/mke0$a;

    .line 80
    .line 81
    invoke-direct {p0, v6}, Ll/mke0$a;-><init>(Ll/oke0;)V

    .line 82
    .line 83
    .line 84
    return-object p0
.end method

.method public e()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/ey5;->d:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/ey5;->g:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey5;->f:J

    .line 2
    .line 3
    return-wide v0
.end method
