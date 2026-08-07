.class public final Ll/gkj0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:I

.field public final b:Ll/h0j0;

.field public final c:Ll/ig60;

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:J

.field public h:J

.field public i:J


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/gkj0;->a:I

    .line 5
    .line 6
    new-instance p1, Ll/h0j0;

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    invoke-direct {p1, v0, v1}, Ll/h0j0;-><init>(J)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/gkj0;->b:Ll/h0j0;

    .line 14
    .line 15
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    iput-wide v0, p0, Ll/gkj0;->g:J

    .line 21
    .line 22
    iput-wide v0, p0, Ll/gkj0;->h:J

    .line 23
    .line 24
    iput-wide v0, p0, Ll/gkj0;->i:J

    .line 25
    .line 26
    new-instance p1, Ll/ig60;

    .line 27
    .line 28
    invoke-direct {p1}, Ll/ig60;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/gkj0;->c:Ll/ig60;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public final a(Ll/asf;)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gkj0;->c:Ll/ig60;

    .line 2
    .line 3
    sget-object v1, Ll/bmk0;->f:[B

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/ig60;->R([B)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/gkj0;->d:Z

    .line 10
    .line 11
    invoke-interface {p1}, Ll/asf;->h()V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/gkj0;->i:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()Ll/h0j0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gkj0;->b:Ll/h0j0;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/gkj0;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public e(Ll/asf;Ll/ll80;I)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-gtz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gkj0;->a(Ll/asf;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0

    .line 8
    :cond_0
    iget-boolean v0, p0, Ll/gkj0;->f:Z

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3}, Ll/gkj0;->h(Ll/asf;Ll/ll80;I)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_1
    iget-wide v0, p0, Ll/gkj0;->h:J

    .line 18
    .line 19
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    cmp-long v0, v0, v2

    .line 25
    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/gkj0;->a(Ll/asf;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_2
    iget-boolean v0, p0, Ll/gkj0;->e:Z

    .line 34
    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2, p3}, Ll/gkj0;->f(Ll/asf;Ll/ll80;I)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_3
    iget-wide p2, p0, Ll/gkj0;->g:J

    .line 43
    .line 44
    cmp-long v0, p2, v2

    .line 45
    .line 46
    if-nez v0, :cond_4

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/gkj0;->a(Ll/asf;)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0

    .line 53
    :cond_4
    iget-object v0, p0, Ll/gkj0;->b:Ll/h0j0;

    .line 54
    .line 55
    invoke-virtual {v0, p2, p3}, Ll/h0j0;->b(J)J

    .line 56
    .line 57
    .line 58
    move-result-wide p2

    .line 59
    iget-object v0, p0, Ll/gkj0;->b:Ll/h0j0;

    .line 60
    .line 61
    iget-wide v4, p0, Ll/gkj0;->h:J

    .line 62
    .line 63
    invoke-virtual {v0, v4, v5}, Ll/h0j0;->b(J)J

    .line 64
    .line 65
    .line 66
    move-result-wide v0

    .line 67
    sub-long/2addr v0, p2

    .line 68
    iput-wide v0, p0, Ll/gkj0;->i:J

    .line 69
    .line 70
    const-wide/16 p2, 0x0

    .line 71
    .line 72
    cmp-long p2, v0, p2

    .line 73
    .line 74
    if-gez p2, :cond_5

    .line 75
    .line 76
    new-instance p2, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string p3, "Invalid duration: "

    .line 79
    .line 80
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-wide v0, p0, Ll/gkj0;->i:J

    .line 84
    .line 85
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string p3, ". Using TIME_UNSET instead."

    .line 89
    .line 90
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    const-string p3, "TsDurationReader"

    .line 98
    .line 99
    invoke-static {p3, p2}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iput-wide v2, p0, Ll/gkj0;->i:J

    .line 103
    .line 104
    :cond_5
    invoke-virtual {p0, p1}, Ll/gkj0;->a(Ll/asf;)I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    return p0
.end method

.method public final f(Ll/asf;Ll/ll80;I)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/gkj0;->a:I

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    invoke-interface {p1}, Ll/asf;->getLength()J

    .line 5
    .line 6
    .line 7
    move-result-wide v2

    .line 8
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    long-to-int v0, v0

    .line 13
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    const-wide/16 v3, 0x0

    .line 18
    .line 19
    cmp-long v1, v1, v3

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iput-wide v3, p2, Ll/ll80;->a:J

    .line 25
    .line 26
    return v2

    .line 27
    :cond_0
    iget-object p2, p0, Ll/gkj0;->c:Ll/ig60;

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Ll/ig60;->Q(I)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p1}, Ll/asf;->h()V

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Ll/gkj0;->c:Ll/ig60;

    .line 36
    .line 37
    invoke-virtual {p2}, Ll/ig60;->e()[B

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-interface {p1, p2, v1, v0}, Ll/asf;->f([BII)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/gkj0;->c:Ll/ig60;

    .line 46
    .line 47
    invoke-virtual {p0, p1, p3}, Ll/gkj0;->g(Ll/ig60;I)J

    .line 48
    .line 49
    .line 50
    move-result-wide p1

    .line 51
    iput-wide p1, p0, Ll/gkj0;->g:J

    .line 52
    .line 53
    iput-boolean v2, p0, Ll/gkj0;->e:Z

    .line 54
    .line 55
    return v1
.end method

.method public final g(Ll/ig60;I)J
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Ll/ig60;->g()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    :goto_0
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    if-ge p0, v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    aget-byte v3, v3, p0

    .line 21
    .line 22
    const/16 v4, 0x47

    .line 23
    .line 24
    if-eq v3, v4, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    invoke-static {p1, p0, p2}, Ll/kkj0;->c(Ll/ig60;II)J

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    cmp-long v1, v3, v1

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    return-wide v3

    .line 36
    :cond_1
    :goto_1
    add-int/lit8 p0, p0, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    return-wide v1
.end method

.method public final h(Ll/asf;Ll/ll80;I)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/asf;->getLength()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget v2, p0, Ll/gkj0;->a:I

    .line 6
    .line 7
    int-to-long v2, v2

    .line 8
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    long-to-int v2, v2

    .line 13
    int-to-long v3, v2

    .line 14
    sub-long/2addr v0, v3

    .line 15
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    cmp-long v3, v3, v0

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    iput-wide v0, p2, Ll/ll80;->a:J

    .line 25
    .line 26
    return v4

    .line 27
    :cond_0
    iget-object p2, p0, Ll/gkj0;->c:Ll/ig60;

    .line 28
    .line 29
    invoke-virtual {p2, v2}, Ll/ig60;->Q(I)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p1}, Ll/asf;->h()V

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Ll/gkj0;->c:Ll/ig60;

    .line 36
    .line 37
    invoke-virtual {p2}, Ll/ig60;->e()[B

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-interface {p1, p2, v0, v2}, Ll/asf;->f([BII)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/gkj0;->c:Ll/ig60;

    .line 46
    .line 47
    invoke-virtual {p0, p1, p3}, Ll/gkj0;->i(Ll/ig60;I)J

    .line 48
    .line 49
    .line 50
    move-result-wide p1

    .line 51
    iput-wide p1, p0, Ll/gkj0;->h:J

    .line 52
    .line 53
    iput-boolean v4, p0, Ll/gkj0;->f:Z

    .line 54
    .line 55
    return v0
.end method

.method public final i(Ll/ig60;I)J
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Ll/ig60;->g()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/lit16 v1, v0, -0xbc

    .line 10
    .line 11
    :goto_0
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    if-lt v1, p0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-static {v4, p0, v0, v1}, Ll/kkj0;->b([BIII)Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-nez v4, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    invoke-static {p1, v1, p2}, Ll/kkj0;->c(Ll/ig60;II)J

    .line 30
    .line 31
    .line 32
    move-result-wide v4

    .line 33
    cmp-long v2, v4, v2

    .line 34
    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    return-wide v4

    .line 38
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, -0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    return-wide v2
.end method
