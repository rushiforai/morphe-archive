.class public final Lcom/google/android/exoplayer2/source/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/h;
.implements Lcom/google/android/exoplayer2/source/h$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/b$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Lcom/google/android/exoplayer2/source/h;

.field public b:Lcom/google/android/exoplayer2/source/h$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:[Lcom/google/android/exoplayer2/source/b$a;

.field public d:J

.field public e:J

.field public f:J

.field public g:Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/h;ZJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    new-array p1, p1, [Lcom/google/android/exoplayer2/source/b$a;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/b;->c:[Lcom/google/android/exoplayer2/source/b$a;

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    move-wide p1, p3

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    :goto_0
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/b;->d:J

    .line 21
    .line 22
    iput-wide p3, p0, Lcom/google/android/exoplayer2/source/b;->e:J

    .line 23
    .line 24
    iput-wide p5, p0, Lcom/google/android/exoplayer2/source/b;->f:J

    .line 25
    .line 26
    return-void
.end method

.method public static u(J[Ll/u9f;)Z
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p0, p0, v0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    array-length p0, p2

    .line 9
    move v0, p1

    .line 10
    :goto_0
    if-ge v0, p0, :cond_1

    .line 11
    .line 12
    aget-object v1, p2, v0

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v1}, Ll/u9f;->k()Lcom/google/android/exoplayer2/k;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, v1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v2, v1}, Ll/kb00;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return p1
.end method


# virtual methods
.method public final b(JLl/nke0;)Ll/nke0;
    .locals 8

    .line 1
    iget-wide v0, p3, Ll/nke0;->a:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/b;->e:J

    .line 4
    .line 5
    sub-long v4, p1, v2

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    invoke-static/range {v0 .. v5}, Ll/bmk0;->r(JJJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-wide v2, p3, Ll/nke0;->b:J

    .line 14
    .line 15
    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/b;->f:J

    .line 16
    .line 17
    const-wide/high16 v6, -0x8000000000000000L

    .line 18
    .line 19
    cmp-long p0, v4, v6

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const-wide p0, 0x7fffffffffffffffL

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    :goto_0
    move-wide v6, p0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    sub-long p0, v4, p1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :goto_1
    const-wide/16 v4, 0x0

    .line 34
    .line 35
    invoke-static/range {v2 .. v7}, Ll/bmk0;->r(JJJ)J

    .line 36
    .line 37
    .line 38
    move-result-wide p0

    .line 39
    iget-wide v2, p3, Ll/nke0;->a:J

    .line 40
    .line 41
    cmp-long p2, v0, v2

    .line 42
    .line 43
    if-nez p2, :cond_1

    .line 44
    .line 45
    iget-wide v2, p3, Ll/nke0;->b:J

    .line 46
    .line 47
    cmp-long p2, p0, v2

    .line 48
    .line 49
    if-nez p2, :cond_1

    .line 50
    .line 51
    return-object p3

    .line 52
    :cond_1
    new-instance p2, Ll/nke0;

    .line 53
    .line 54
    invoke-direct {p2, v0, v1, p0, p1}, Ll/nke0;-><init>(JJ)V

    .line 55
    .line 56
    .line 57
    return-object p2
.end method

.method public c(J)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/google/android/exoplayer2/source/h;->c(J)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d()J
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/android/exoplayer2/source/h;->d()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/high16 v2, -0x8000000000000000L

    .line 8
    .line 9
    cmp-long v4, v0, v2

    .line 10
    .line 11
    if-eqz v4, :cond_1

    .line 12
    .line 13
    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/b;->f:J

    .line 14
    .line 15
    cmp-long p0, v4, v2

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    cmp-long p0, v0, v4

    .line 20
    .line 21
    if-ltz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-wide v0

    .line 25
    :cond_1
    :goto_0
    return-wide v2
.end method

.method public e(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/google/android/exoplayer2/source/h;->e(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()J
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/android/exoplayer2/source/h;->f()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/high16 v2, -0x8000000000000000L

    .line 8
    .line 9
    cmp-long v4, v0, v2

    .line 10
    .line 11
    if-eqz v4, :cond_1

    .line 12
    .line 13
    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/b;->f:J

    .line 14
    .line 15
    cmp-long p0, v4, v2

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    cmp-long p0, v0, v4

    .line 20
    .line 21
    if-ltz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-wide v0

    .line 25
    :cond_1
    :goto_0
    return-wide v2
.end method

.method public g(JLl/nke0;)J
    .locals 3

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/b;->e:J

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/source/b;->b(JLl/nke0;)Ll/nke0;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 13
    .line 14
    invoke-interface {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/source/h;->g(JLl/nke0;)J

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    return-wide p0
.end method

.method public h(J)J
    .locals 5

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/b;->d:J

    .line 7
    .line 8
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/b;->c:[Lcom/google/android/exoplayer2/source/b$a;

    .line 9
    .line 10
    array-length v1, v0

    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    :goto_0
    if-ge v3, v1, :cond_1

    .line 14
    .line 15
    aget-object v4, v0, v3

    .line 16
    .line 17
    if-eqz v4, :cond_0

    .line 18
    .line 19
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/source/b$a;->c()V

    .line 20
    .line 21
    .line 22
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 26
    .line 27
    invoke-interface {v0, p1, p2}, Lcom/google/android/exoplayer2/source/h;->h(J)J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    cmp-long p1, v0, p1

    .line 32
    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    iget-wide p1, p0, Lcom/google/android/exoplayer2/source/b;->e:J

    .line 36
    .line 37
    cmp-long p1, v0, p1

    .line 38
    .line 39
    if-ltz p1, :cond_3

    .line 40
    .line 41
    iget-wide p0, p0, Lcom/google/android/exoplayer2/source/b;->f:J

    .line 42
    .line 43
    const-wide/high16 v3, -0x8000000000000000L

    .line 44
    .line 45
    cmp-long p2, p0, v3

    .line 46
    .line 47
    if-eqz p2, :cond_2

    .line 48
    .line 49
    cmp-long p0, v0, p0

    .line 50
    .line 51
    if-gtz p0, :cond_3

    .line 52
    .line 53
    :cond_2
    const/4 v2, 0x1

    .line 54
    :cond_3
    invoke-static {v2}, Ll/w11;->g(Z)V

    .line 55
    .line 56
    .line 57
    return-wide v0
.end method

.method public i()J
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/b;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/b;->d:J

    .line 13
    .line 14
    iput-wide v1, p0, Lcom/google/android/exoplayer2/source/b;->d:J

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/b;->i()J

    .line 17
    .line 18
    .line 19
    move-result-wide v5

    .line 20
    cmp-long p0, v5, v1

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    return-wide v5

    .line 25
    :cond_0
    return-wide v3

    .line 26
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 27
    .line 28
    invoke-interface {v0}, Lcom/google/android/exoplayer2/source/h;->i()J

    .line 29
    .line 30
    .line 31
    move-result-wide v3

    .line 32
    cmp-long v0, v3, v1

    .line 33
    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    return-wide v1

    .line 37
    :cond_2
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/b;->e:J

    .line 38
    .line 39
    cmp-long v0, v3, v0

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    const/4 v2, 0x1

    .line 43
    if-ltz v0, :cond_3

    .line 44
    .line 45
    move v0, v2

    .line 46
    goto :goto_0

    .line 47
    :cond_3
    move v0, v1

    .line 48
    :goto_0
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 49
    .line 50
    .line 51
    iget-wide v5, p0, Lcom/google/android/exoplayer2/source/b;->f:J

    .line 52
    .line 53
    const-wide/high16 v7, -0x8000000000000000L

    .line 54
    .line 55
    cmp-long p0, v5, v7

    .line 56
    .line 57
    if-eqz p0, :cond_4

    .line 58
    .line 59
    cmp-long p0, v3, v5

    .line 60
    .line 61
    if-gtz p0, :cond_5

    .line 62
    .line 63
    :cond_4
    move v1, v2

    .line 64
    :cond_5
    invoke-static {v1}, Ll/w11;->g(Z)V

    .line 65
    .line 66
    .line 67
    return-wide v3
.end method

.method public isLoading()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/h;->isLoading()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic j(Lcom/google/android/exoplayer2/source/r;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/b;->o(Lcom/google/android/exoplayer2/source/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Lcom/google/android/exoplayer2/source/h;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/b;->g:Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/b;->b:Lcom/google/android/exoplayer2/source/h$a;

    .line 7
    .line 8
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/google/android/exoplayer2/source/h$a;

    .line 13
    .line 14
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/h$a;->l(Lcom/google/android/exoplayer2/source/h;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public m()Ll/ffj0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/h;->m()Ll/ffj0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/b;->d:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long p0, v0, v2

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public o(Lcom/google/android/exoplayer2/source/h;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/b;->b:Lcom/google/android/exoplayer2/source/h$a;

    .line 2
    .line 3
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/google/android/exoplayer2/source/h$a;

    .line 8
    .line 9
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/r$a;->j(Lcom/google/android/exoplayer2/source/r;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public p(Lcom/google/android/exoplayer2/source/h$a;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/b;->b:Lcom/google/android/exoplayer2/source/h$a;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 4
    .line 5
    invoke-interface {p1, p0, p2, p3}, Lcom/google/android/exoplayer2/source/h;->p(Lcom/google/android/exoplayer2/source/h$a;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q(Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/b;->g:Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;

    .line 2
    .line 3
    return-void
.end method

.method public r([Ll/u9f;[Z[Ll/xwd0;[ZJ)J
    .locals 9

    .line 1
    array-length v0, p3

    .line 2
    new-array v0, v0, [Lcom/google/android/exoplayer2/source/b$a;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/b;->c:[Lcom/google/android/exoplayer2/source/b$a;

    .line 5
    .line 6
    array-length v0, p3

    .line 7
    new-array v4, v0, [Ll/xwd0;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    move v1, v0

    .line 11
    :goto_0
    array-length v2, p3

    .line 12
    const/4 v8, 0x0

    .line 13
    if-ge v1, v2, :cond_1

    .line 14
    .line 15
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/b;->c:[Lcom/google/android/exoplayer2/source/b$a;

    .line 16
    .line 17
    aget-object v3, p3, v1

    .line 18
    .line 19
    check-cast v3, Lcom/google/android/exoplayer2/source/b$a;

    .line 20
    .line 21
    aput-object v3, v2, v1

    .line 22
    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    iget-object v8, v3, Lcom/google/android/exoplayer2/source/b$a;->a:Ll/xwd0;

    .line 26
    .line 27
    :cond_0
    aput-object v8, v4, v1

    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 33
    .line 34
    move-object v2, p1

    .line 35
    move-object v3, p2

    .line 36
    move-object v5, p4

    .line 37
    move-wide v6, p5

    .line 38
    invoke-interface/range {v1 .. v7}, Lcom/google/android/exoplayer2/source/h;->r([Ll/u9f;[Z[Ll/xwd0;[ZJ)J

    .line 39
    .line 40
    .line 41
    move-result-wide p1

    .line 42
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/b;->n()Z

    .line 43
    .line 44
    .line 45
    move-result p4

    .line 46
    if-eqz p4, :cond_2

    .line 47
    .line 48
    iget-wide p4, p0, Lcom/google/android/exoplayer2/source/b;->e:J

    .line 49
    .line 50
    cmp-long p6, v6, p4

    .line 51
    .line 52
    if-nez p6, :cond_2

    .line 53
    .line 54
    invoke-static {p4, p5, v2}, Lcom/google/android/exoplayer2/source/b;->u(J[Ll/u9f;)Z

    .line 55
    .line 56
    .line 57
    move-result p4

    .line 58
    if-eqz p4, :cond_2

    .line 59
    .line 60
    move-wide p4, p1

    .line 61
    goto :goto_1

    .line 62
    :cond_2
    const-wide p4, -0x7fffffffffffffffL    # -4.9E-324

    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    :goto_1
    iput-wide p4, p0, Lcom/google/android/exoplayer2/source/b;->d:J

    .line 68
    .line 69
    cmp-long p4, p1, v6

    .line 70
    .line 71
    if-eqz p4, :cond_4

    .line 72
    .line 73
    iget-wide p4, p0, Lcom/google/android/exoplayer2/source/b;->e:J

    .line 74
    .line 75
    cmp-long p4, p1, p4

    .line 76
    .line 77
    if-ltz p4, :cond_3

    .line 78
    .line 79
    iget-wide p4, p0, Lcom/google/android/exoplayer2/source/b;->f:J

    .line 80
    .line 81
    const-wide/high16 v1, -0x8000000000000000L

    .line 82
    .line 83
    cmp-long p6, p4, v1

    .line 84
    .line 85
    if-eqz p6, :cond_4

    .line 86
    .line 87
    cmp-long p4, p1, p4

    .line 88
    .line 89
    if-gtz p4, :cond_3

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_3
    move p4, v0

    .line 93
    goto :goto_3

    .line 94
    :cond_4
    :goto_2
    const/4 p4, 0x1

    .line 95
    :goto_3
    invoke-static {p4}, Ll/w11;->g(Z)V

    .line 96
    .line 97
    .line 98
    :goto_4
    array-length p4, p3

    .line 99
    if-ge v0, p4, :cond_8

    .line 100
    .line 101
    aget-object p4, v4, v0

    .line 102
    .line 103
    iget-object p5, p0, Lcom/google/android/exoplayer2/source/b;->c:[Lcom/google/android/exoplayer2/source/b$a;

    .line 104
    .line 105
    if-nez p4, :cond_5

    .line 106
    .line 107
    aput-object v8, p5, v0

    .line 108
    .line 109
    goto :goto_5

    .line 110
    :cond_5
    aget-object p6, p5, v0

    .line 111
    .line 112
    if-eqz p6, :cond_6

    .line 113
    .line 114
    iget-object p6, p6, Lcom/google/android/exoplayer2/source/b$a;->a:Ll/xwd0;

    .line 115
    .line 116
    if-eq p6, p4, :cond_7

    .line 117
    .line 118
    :cond_6
    new-instance p6, Lcom/google/android/exoplayer2/source/b$a;

    .line 119
    .line 120
    invoke-direct {p6, p0, p4}, Lcom/google/android/exoplayer2/source/b$a;-><init>(Lcom/google/android/exoplayer2/source/b;Ll/xwd0;)V

    .line 121
    .line 122
    .line 123
    aput-object p6, p5, v0

    .line 124
    .line 125
    :cond_7
    :goto_5
    iget-object p4, p0, Lcom/google/android/exoplayer2/source/b;->c:[Lcom/google/android/exoplayer2/source/b$a;

    .line 126
    .line 127
    aget-object p4, p4, v0

    .line 128
    .line 129
    aput-object p4, p3, v0

    .line 130
    .line 131
    add-int/lit8 v0, v0, 0x1

    .line 132
    .line 133
    goto :goto_4

    .line 134
    :cond_8
    return-wide p1
.end method

.method public s()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/b;->g:Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 6
    .line 7
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/h;->s()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    throw v0
.end method

.method public t(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/source/h;->t(JZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(JJ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/b;->e:J

    .line 2
    .line 3
    iput-wide p3, p0, Lcom/google/android/exoplayer2/source/b;->f:J

    .line 4
    .line 5
    return-void
.end method
