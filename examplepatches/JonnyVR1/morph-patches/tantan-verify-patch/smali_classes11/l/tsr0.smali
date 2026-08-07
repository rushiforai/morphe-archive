.class public final Ll/tsr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/sgr0;

.field public b:J

.field public c:Z

.field public d:I

.field public e:J

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:J

.field public l:J

.field public m:Z


# direct methods
.method public constructor <init>(Ll/sgr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tsr0;->a:Ll/sgr0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/tsr0;->b:J

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Ll/tsr0;->f(I)V

    .line 5
    .line 6
    .line 7
    iput-boolean p1, p0, Ll/tsr0;->i:Z

    .line 8
    .line 9
    return-void
.end method

.method public final b(JIZ)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/tsr0;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/tsr0;->g:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-boolean p1, p0, Ll/tsr0;->c:Z

    .line 11
    .line 12
    iput-boolean p1, p0, Ll/tsr0;->m:Z

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Ll/tsr0;->j:Z

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    iget-boolean v0, p0, Ll/tsr0;->h:Z

    .line 19
    .line 20
    if-nez v0, :cond_3

    .line 21
    .line 22
    iget-boolean v0, p0, Ll/tsr0;->g:Z

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_2
    return-void

    .line 28
    :cond_3
    :goto_1
    if-eqz p4, :cond_4

    .line 29
    .line 30
    iget-boolean p4, p0, Ll/tsr0;->i:Z

    .line 31
    .line 32
    if-eqz p4, :cond_4

    .line 33
    .line 34
    iget-wide v0, p0, Ll/tsr0;->b:J

    .line 35
    .line 36
    sub-long/2addr p1, v0

    .line 37
    long-to-int p1, p1

    .line 38
    add-int/2addr p3, p1

    .line 39
    invoke-virtual {p0, p3}, Ll/tsr0;->f(I)V

    .line 40
    .line 41
    .line 42
    :cond_4
    iget-wide p1, p0, Ll/tsr0;->b:J

    .line 43
    .line 44
    iput-wide p1, p0, Ll/tsr0;->k:J

    .line 45
    .line 46
    iget-wide p1, p0, Ll/tsr0;->e:J

    .line 47
    .line 48
    iput-wide p1, p0, Ll/tsr0;->l:J

    .line 49
    .line 50
    iget-boolean p1, p0, Ll/tsr0;->c:Z

    .line 51
    .line 52
    iput-boolean p1, p0, Ll/tsr0;->m:Z

    .line 53
    .line 54
    const/4 p1, 0x1

    .line 55
    iput-boolean p1, p0, Ll/tsr0;->i:Z

    .line 56
    .line 57
    return-void
.end method

.method public final c([BII)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/tsr0;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    add-int/lit8 v0, p2, 0x2

    .line 6
    .line 7
    iget v1, p0, Ll/tsr0;->d:I

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    if-ge v0, p3, :cond_1

    .line 11
    .line 12
    aget-byte p1, p1, v0

    .line 13
    .line 14
    and-int/lit16 p1, p1, 0x80

    .line 15
    .line 16
    const/4 p2, 0x0

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move p1, p2

    .line 22
    :goto_0
    iput-boolean p1, p0, Ll/tsr0;->g:Z

    .line 23
    .line 24
    iput-boolean p2, p0, Ll/tsr0;->f:Z

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    sub-int/2addr p3, p2

    .line 28
    add-int/2addr v1, p3

    .line 29
    iput v1, p0, Ll/tsr0;->d:I

    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/tsr0;->f:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/tsr0;->g:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/tsr0;->h:Z

    .line 7
    .line 8
    iput-boolean v0, p0, Ll/tsr0;->i:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/tsr0;->j:Z

    .line 11
    .line 12
    return-void
.end method

.method public final e(JIIJZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/tsr0;->g:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/tsr0;->h:Z

    .line 5
    .line 6
    iput-wide p5, p0, Ll/tsr0;->e:J

    .line 7
    .line 8
    iput v0, p0, Ll/tsr0;->d:I

    .line 9
    .line 10
    iput-wide p1, p0, Ll/tsr0;->b:J

    .line 11
    .line 12
    const/16 p1, 0x20

    .line 13
    .line 14
    const/4 p2, 0x1

    .line 15
    if-lt p4, p1, :cond_4

    .line 16
    .line 17
    const/16 p1, 0x28

    .line 18
    .line 19
    if-ne p4, p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-boolean p1, p0, Ll/tsr0;->i:Z

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    iget-boolean p1, p0, Ll/tsr0;->j:Z

    .line 27
    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    if-eqz p7, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, p3}, Ll/tsr0;->f(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iput-boolean v0, p0, Ll/tsr0;->i:Z

    .line 36
    .line 37
    :cond_2
    const/16 p1, 0x23

    .line 38
    .line 39
    if-le p4, p1, :cond_3

    .line 40
    .line 41
    const/16 p1, 0x27

    .line 42
    .line 43
    if-ne p4, p1, :cond_4

    .line 44
    .line 45
    :cond_3
    iget-boolean p1, p0, Ll/tsr0;->j:Z

    .line 46
    .line 47
    xor-int/2addr p1, p2

    .line 48
    iput-boolean p1, p0, Ll/tsr0;->h:Z

    .line 49
    .line 50
    iput-boolean p2, p0, Ll/tsr0;->j:Z

    .line 51
    .line 52
    :cond_4
    :goto_0
    const/16 p1, 0x10

    .line 53
    .line 54
    if-lt p4, p1, :cond_5

    .line 55
    .line 56
    const/16 p1, 0x15

    .line 57
    .line 58
    if-gt p4, p1, :cond_5

    .line 59
    .line 60
    move p1, p2

    .line 61
    goto :goto_1

    .line 62
    :cond_5
    move p1, v0

    .line 63
    :goto_1
    iput-boolean p1, p0, Ll/tsr0;->c:Z

    .line 64
    .line 65
    if-nez p1, :cond_6

    .line 66
    .line 67
    const/16 p1, 0x9

    .line 68
    .line 69
    if-gt p4, p1, :cond_7

    .line 70
    .line 71
    :cond_6
    move v0, p2

    .line 72
    :cond_7
    iput-boolean v0, p0, Ll/tsr0;->f:Z

    .line 73
    .line 74
    return-void
.end method

.method public final f(I)V
    .locals 8

    .line 1
    iget-wide v1, p0, Ll/tsr0;->l:J

    .line 2
    .line 3
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v0, v1, v3

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean v3, p0, Ll/tsr0;->m:Z

    .line 14
    .line 15
    iget-wide v4, p0, Ll/tsr0;->b:J

    .line 16
    .line 17
    iget-wide v6, p0, Ll/tsr0;->k:J

    .line 18
    .line 19
    sub-long/2addr v4, v6

    .line 20
    iget-object v0, p0, Ll/tsr0;->a:Ll/sgr0;

    .line 21
    .line 22
    long-to-int v4, v4

    .line 23
    const/4 v6, 0x0

    .line 24
    move v5, p1

    .line 25
    invoke-interface/range {v0 .. v6}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
