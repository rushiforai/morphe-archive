.class public final Ll/ebr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/dbr0;

.field public b:Ll/dbr0;

.field public c:Z

.field public d:J

.field public e:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dbr0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/dbr0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 10
    .line 11
    new-instance v0, Ll/dbr0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/dbr0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ebr0;->b:Ll/dbr0;

    .line 17
    .line 18
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    iput-wide v0, p0, Ll/ebr0;->d:J

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a()F
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dbr0;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dbr0;->a()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    long-to-double v0, v0

    .line 16
    const-wide v2, 0x41cdcd6500000000L    # 1.0E9

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    div-double/2addr v2, v0

    .line 22
    double-to-float p0, v2

    .line 23
    return p0

    .line 24
    :cond_0
    const/high16 p0, -0x40800000    # -1.0f

    .line 25
    .line 26
    return p0
.end method

.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ebr0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final c()J
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dbr0;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dbr0;->a()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    return-wide v0

    .line 16
    :cond_0
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    return-wide v0
.end method

.method public final d()J
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dbr0;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dbr0;->b()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    return-wide v0

    .line 16
    :cond_0
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    return-wide v0
.end method

.method public final e(J)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/dbr0;->c(J)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/dbr0;->f()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iput-boolean v2, p0, Ll/ebr0;->c:Z

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v3, p0, Ll/ebr0;->d:J

    .line 20
    .line 21
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    cmp-long v0, v3, v5

    .line 27
    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    iget-boolean v0, p0, Ll/ebr0;->c:Z

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/ebr0;->b:Ll/dbr0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/dbr0;->e()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Ll/ebr0;->b:Ll/dbr0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/dbr0;->d()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/ebr0;->b:Ll/dbr0;

    .line 48
    .line 49
    iget-wide v3, p0, Ll/ebr0;->d:J

    .line 50
    .line 51
    invoke-virtual {v0, v3, v4}, Ll/dbr0;->c(J)V

    .line 52
    .line 53
    .line 54
    :cond_2
    iput-boolean v1, p0, Ll/ebr0;->c:Z

    .line 55
    .line 56
    iget-object v0, p0, Ll/ebr0;->b:Ll/dbr0;

    .line 57
    .line 58
    invoke-virtual {v0, p1, p2}, Ll/dbr0;->c(J)V

    .line 59
    .line 60
    .line 61
    :cond_3
    :goto_0
    iget-boolean v0, p0, Ll/ebr0;->c:Z

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    iget-object v0, p0, Ll/ebr0;->b:Ll/dbr0;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/dbr0;->f()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_4

    .line 72
    .line 73
    iget-object v0, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 74
    .line 75
    iget-object v3, p0, Ll/ebr0;->b:Ll/dbr0;

    .line 76
    .line 77
    iput-object v3, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 78
    .line 79
    iput-object v0, p0, Ll/ebr0;->b:Ll/dbr0;

    .line 80
    .line 81
    iput-boolean v2, p0, Ll/ebr0;->c:Z

    .line 82
    .line 83
    :cond_4
    iput-wide p1, p0, Ll/ebr0;->d:J

    .line 84
    .line 85
    iget-object p1, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 86
    .line 87
    invoke-virtual {p1}, Ll/dbr0;->f()Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_5

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_5
    iget p1, p0, Ll/ebr0;->e:I

    .line 95
    .line 96
    add-int/lit8 v2, p1, 0x1

    .line 97
    .line 98
    :goto_1
    iput v2, p0, Ll/ebr0;->e:I

    .line 99
    .line 100
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dbr0;->d()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ebr0;->b:Ll/dbr0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/dbr0;->d()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/ebr0;->c:Z

    .line 13
    .line 14
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    iput-wide v1, p0, Ll/ebr0;->d:J

    .line 20
    .line 21
    iput v0, p0, Ll/ebr0;->e:I

    .line 22
    .line 23
    return-void
.end method

.method public final g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ebr0;->a:Ll/dbr0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dbr0;->f()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
