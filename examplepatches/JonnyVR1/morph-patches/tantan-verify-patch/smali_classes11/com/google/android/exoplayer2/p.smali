.class public final Lcom/google/android/exoplayer2/p;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Lcom/google/android/exoplayer2/c0$b;

.field public final b:Lcom/google/android/exoplayer2/c0$d;

.field public final c:Ll/dk0;

.field public final d:Ll/sxk;

.field public e:J

.field public f:I

.field public g:Z

.field public h:Ll/eyx;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Ll/eyx;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Ll/eyx;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k:I

.field public l:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public m:J


# direct methods
.method public constructor <init>(Ll/dk0;Ll/sxk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/p;->c:Ll/dk0;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/exoplayer2/p;->d:Ll/sxk;

    .line 7
    .line 8
    new-instance p1, Lcom/google/android/exoplayer2/c0$b;

    .line 9
    .line 10
    invoke-direct {p1}, Lcom/google/android/exoplayer2/c0$b;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 14
    .line 15
    new-instance p1, Lcom/google/android/exoplayer2/c0$d;

    .line 16
    .line 17
    invoke-direct {p1}, Lcom/google/android/exoplayer2/c0$d;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 21
    .line 22
    return-void
.end method

.method public static D(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;JJLcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/source/i$b;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p7}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 2
    .line 3
    .line 4
    iget v0, p7, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 5
    .line 6
    invoke-virtual {p0, v0, p6}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    :goto_0
    invoke-static {p7}, Lcom/google/android/exoplayer2/p;->z(Lcom/google/android/exoplayer2/c0$b;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget v1, p6, Lcom/google/android/exoplayer2/c0$d;->p:I

    .line 20
    .line 21
    if-gt v0, v1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-virtual {p0, v0, p7, p1}, Lcom/google/android/exoplayer2/c0;->k(ILcom/google/android/exoplayer2/c0$b;Z)Lcom/google/android/exoplayer2/c0$b;

    .line 25
    .line 26
    .line 27
    iget-object p1, p7, Lcom/google/android/exoplayer2/c0$b;->b:Ljava/lang/Object;

    .line 28
    .line 29
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p0, p1, p7}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 37
    .line 38
    .line 39
    move-wide v0, p2

    .line 40
    invoke-virtual {p7, v0, v1}, Lcom/google/android/exoplayer2/c0$b;->h(J)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    const/4 p0, -0x1

    .line 45
    if-ne p2, p0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p7, v0, v1}, Lcom/google/android/exoplayer2/c0$b;->g(J)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    new-instance p2, Lcom/google/android/exoplayer2/source/i$b;

    .line 52
    .line 53
    invoke-direct {p2, p1, p4, p5, p0}, Lcom/google/android/exoplayer2/source/i$b;-><init>(Ljava/lang/Object;JI)V

    .line 54
    .line 55
    .line 56
    return-object p2

    .line 57
    :cond_1
    invoke-virtual {p7, p2}, Lcom/google/android/exoplayer2/c0$b;->n(I)I

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    new-instance p0, Lcom/google/android/exoplayer2/source/i$b;

    .line 62
    .line 63
    invoke-direct/range {p0 .. p5}, Lcom/google/android/exoplayer2/source/i$b;-><init>(Ljava/lang/Object;IIJ)V

    .line 64
    .line 65
    .line 66
    return-object p0
.end method

.method public static synthetic a(Lcom/google/android/exoplayer2/p;Lcom/google/common/collect/ImmutableList$a;Lcom/google/android/exoplayer2/source/i$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/p;->c:Ll/dk0;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableList$a;->m()Lcom/google/common/collect/ImmutableList;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1, p2}, Ll/dk0;->m0(Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static z(Lcom/google/android/exoplayer2/c0$b;)Z
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c0$b;->f()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_5

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/c0$b;->t(I)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-nez v3, :cond_5

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c0$b;->r()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/c0$b;->u(I)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_5

    .line 26
    .line 27
    const-wide/16 v3, 0x0

    .line 28
    .line 29
    invoke-virtual {p0, v3, v4}, Lcom/google/android/exoplayer2/c0$b;->h(J)I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    const/4 v6, -0x1

    .line 34
    if-eq v5, v6, :cond_1

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_1
    iget-wide v5, p0, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 38
    .line 39
    cmp-long v5, v5, v3

    .line 40
    .line 41
    if-nez v5, :cond_2

    .line 42
    .line 43
    return v2

    .line 44
    :cond_2
    add-int/lit8 v5, v0, -0x1

    .line 45
    .line 46
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer2/c0$b;->t(I)Z

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    if-eqz v5, :cond_3

    .line 51
    .line 52
    const/4 v5, 0x2

    .line 53
    goto :goto_0

    .line 54
    :cond_3
    move v5, v2

    .line 55
    :goto_0
    sub-int/2addr v0, v5

    .line 56
    move v5, v1

    .line 57
    :goto_1
    if-gt v5, v0, :cond_4

    .line 58
    .line 59
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer2/c0$b;->l(I)J

    .line 60
    .line 61
    .line 62
    move-result-wide v6

    .line 63
    add-long/2addr v3, v6

    .line 64
    add-int/lit8 v5, v5, 0x1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_4
    iget-wide v5, p0, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 68
    .line 69
    cmp-long p0, v5, v3

    .line 70
    .line 71
    if-gtz p0, :cond_5

    .line 72
    .line 73
    return v2

    .line 74
    :cond_5
    :goto_2
    return v1
.end method


# virtual methods
.method public final A()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 6
    .line 7
    :goto_0
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v2, v1, Ll/eyx;->f:Ll/gyx;

    .line 10
    .line 11
    iget-object v2, v2, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Lcom/google/common/collect/ImmutableList$a;->i(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$a;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ll/eyx;->j()Ll/eyx;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 22
    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    iget-object v1, v1, Ll/eyx;->f:Ll/gyx;

    .line 28
    .line 29
    iget-object v1, v1, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 30
    .line 31
    :goto_1
    iget-object v2, p0, Lcom/google/android/exoplayer2/p;->d:Ll/sxk;

    .line 32
    .line 33
    new-instance v3, Ll/hyx;

    .line 34
    .line 35
    invoke-direct {v3, p0, v0, v1}, Ll/hyx;-><init>(Lcom/google/android/exoplayer2/p;Lcom/google/common/collect/ImmutableList$a;Lcom/google/android/exoplayer2/source/i$b;)V

    .line 36
    .line 37
    .line 38
    invoke-interface {v2, v3}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public B(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/eyx;->s(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public C(Ll/eyx;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    move v2, v1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move v2, v0

    .line 8
    :goto_0
    invoke-static {v2}, Ll/w11;->g(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 12
    .line 13
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    iput-object p1, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 21
    .line 22
    :goto_1
    invoke-virtual {p1}, Ll/eyx;->j()Ll/eyx;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-eqz v2, :cond_3

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/eyx;->j()Ll/eyx;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v2, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 33
    .line 34
    if-ne p1, v2, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 39
    .line 40
    move v0, v1

    .line 41
    :cond_2
    invoke-virtual {p1}, Ll/eyx;->t()V

    .line 42
    .line 43
    .line 44
    iget v2, p0, Lcom/google/android/exoplayer2/p;->k:I

    .line 45
    .line 46
    sub-int/2addr v2, v1

    .line 47
    iput v2, p0, Lcom/google/android/exoplayer2/p;->k:I

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_3
    iget-object p1, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {p1, v1}, Ll/eyx;->w(Ll/eyx;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/p;->A()V

    .line 57
    .line 58
    .line 59
    return v0
.end method

.method public E(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;J)Lcom/google/android/exoplayer2/source/i$b;
    .locals 10

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/p;->F(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v4

    .line 5
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 6
    .line 7
    invoke-virtual {p1, p2, v0}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 11
    .line 12
    iget v0, v0, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 13
    .line 14
    iget-object v1, p0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 15
    .line 16
    invoke-virtual {p1, v0, v1}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x0

    .line 24
    move v2, v1

    .line 25
    :goto_0
    iget-object v3, p0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 26
    .line 27
    iget v3, v3, Lcom/google/android/exoplayer2/c0$d;->o:I

    .line 28
    .line 29
    if-lt v0, v3, :cond_2

    .line 30
    .line 31
    iget-object v3, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 32
    .line 33
    const/4 v6, 0x1

    .line 34
    invoke-virtual {p1, v0, v3, v6}, Lcom/google/android/exoplayer2/c0;->k(ILcom/google/android/exoplayer2/c0$b;Z)Lcom/google/android/exoplayer2/c0$b;

    .line 35
    .line 36
    .line 37
    iget-object v3, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/c0$b;->f()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-lez v3, :cond_0

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    move v6, v1

    .line 47
    :goto_1
    or-int/2addr v2, v6

    .line 48
    iget-object v3, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 49
    .line 50
    iget-wide v7, v3, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 51
    .line 52
    invoke-virtual {v3, v7, v8}, Lcom/google/android/exoplayer2/c0$b;->h(J)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    const/4 v7, -0x1

    .line 57
    if-eq v3, v7, :cond_1

    .line 58
    .line 59
    iget-object p2, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 60
    .line 61
    iget-object p2, p2, Lcom/google/android/exoplayer2/c0$b;->b:Ljava/lang/Object;

    .line 62
    .line 63
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    :cond_1
    if-eqz v2, :cond_3

    .line 68
    .line 69
    if-eqz v6, :cond_2

    .line 70
    .line 71
    iget-object v3, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 72
    .line 73
    iget-wide v6, v3, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 74
    .line 75
    const-wide/16 v8, 0x0

    .line 76
    .line 77
    cmp-long v3, v6, v8

    .line 78
    .line 79
    if-eqz v3, :cond_3

    .line 80
    .line 81
    :cond_2
    move-object v1, p2

    .line 82
    goto :goto_2

    .line 83
    :cond_3
    add-int/lit8 v0, v0, -0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :goto_2
    iget-object v6, p0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 87
    .line 88
    iget-object v7, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 89
    .line 90
    move-object v0, p1

    .line 91
    move-wide v2, p3

    .line 92
    invoke-static/range {v0 .. v7}, Lcom/google/android/exoplayer2/p;->D(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;JJLcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/source/i$b;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0
.end method

.method public final F(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;)J
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 8
    .line 9
    iget-object v1, p0, Lcom/google/android/exoplayer2/p;->l:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v2, -0x1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eq v1, v2, :cond_0

    .line 19
    .line 20
    iget-object v3, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 21
    .line 22
    invoke-virtual {p1, v1, v3}, Lcom/google/android/exoplayer2/c0;->j(ILcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget v1, v1, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 27
    .line 28
    if-ne v1, v0, :cond_0

    .line 29
    .line 30
    iget-wide p0, p0, Lcom/google/android/exoplayer2/p;->m:J

    .line 31
    .line 32
    return-wide p0

    .line 33
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 34
    .line 35
    :goto_0
    if-eqz v1, :cond_2

    .line 36
    .line 37
    iget-object v3, v1, Ll/eyx;->b:Ljava/lang/Object;

    .line 38
    .line 39
    invoke-virtual {v3, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    iget-object p0, v1, Ll/eyx;->f:Ll/gyx;

    .line 46
    .line 47
    iget-object p0, p0, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 48
    .line 49
    iget-wide p0, p0, Ll/fyx;->d:J

    .line 50
    .line 51
    return-wide p0

    .line 52
    :cond_1
    invoke-virtual {v1}, Ll/eyx;->j()Ll/eyx;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    goto :goto_0

    .line 57
    :cond_2
    iget-object v1, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 58
    .line 59
    :goto_1
    if-eqz v1, :cond_4

    .line 60
    .line 61
    iget-object v3, v1, Ll/eyx;->b:Ljava/lang/Object;

    .line 62
    .line 63
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eq v3, v2, :cond_3

    .line 68
    .line 69
    iget-object v4, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 70
    .line 71
    invoke-virtual {p1, v3, v4}, Lcom/google/android/exoplayer2/c0;->j(ILcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    iget v3, v3, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 76
    .line 77
    if-ne v3, v0, :cond_3

    .line 78
    .line 79
    iget-object p0, v1, Ll/eyx;->f:Ll/gyx;

    .line 80
    .line 81
    iget-object p0, p0, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 82
    .line 83
    iget-wide p0, p0, Ll/fyx;->d:J

    .line 84
    .line 85
    return-wide p0

    .line 86
    :cond_3
    invoke-virtual {v1}, Ll/eyx;->j()Ll/eyx;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    goto :goto_1

    .line 91
    :cond_4
    iget-wide v0, p0, Lcom/google/android/exoplayer2/p;->e:J

    .line 92
    .line 93
    const-wide/16 v2, 0x1

    .line 94
    .line 95
    add-long/2addr v2, v0

    .line 96
    iput-wide v2, p0, Lcom/google/android/exoplayer2/p;->e:J

    .line 97
    .line 98
    iget-object p1, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 99
    .line 100
    if-nez p1, :cond_5

    .line 101
    .line 102
    iput-object p2, p0, Lcom/google/android/exoplayer2/p;->l:Ljava/lang/Object;

    .line 103
    .line 104
    iput-wide v0, p0, Lcom/google/android/exoplayer2/p;->m:J

    .line 105
    .line 106
    :cond_5
    return-wide v0
.end method

.method public G()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, v0, Ll/eyx;->f:Ll/gyx;

    .line 6
    .line 7
    iget-boolean v1, v1, Ll/gyx;->i:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/eyx;->q()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 18
    .line 19
    iget-object v0, v0, Ll/eyx;->f:Ll/gyx;

    .line 20
    .line 21
    iget-wide v0, v0, Ll/gyx;->e:J

    .line 22
    .line 23
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    cmp-long v0, v0, v2

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget p0, p0, Lcom/google/android/exoplayer2/p;->k:I

    .line 33
    .line 34
    const/16 v0, 0x64

    .line 35
    .line 36
    if-ge p0, v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method public final H(Lcom/google/android/exoplayer2/c0;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v2, v0, Ll/eyx;->b:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    move v3, v2

    .line 14
    :goto_0
    iget-object v4, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 15
    .line 16
    iget-object v5, p0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 17
    .line 18
    iget v6, p0, Lcom/google/android/exoplayer2/p;->f:I

    .line 19
    .line 20
    iget-boolean v7, p0, Lcom/google/android/exoplayer2/p;->g:Z

    .line 21
    .line 22
    move-object v2, p1

    .line 23
    invoke-virtual/range {v2 .. v7}, Lcom/google/android/exoplayer2/c0;->h(ILcom/google/android/exoplayer2/c0$b;Lcom/google/android/exoplayer2/c0$d;IZ)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    :goto_1
    invoke-virtual {v0}, Ll/eyx;->j()Ll/eyx;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p1, v0, Ll/eyx;->f:Ll/gyx;

    .line 34
    .line 35
    iget-boolean p1, p1, Ll/gyx;->g:Z

    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/eyx;->j()Ll/eyx;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    invoke-virtual {v0}, Ll/eyx;->j()Ll/eyx;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const/4 v4, -0x1

    .line 49
    if-eq v3, v4, :cond_4

    .line 50
    .line 51
    if-nez p1, :cond_2

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    iget-object v4, p1, Ll/eyx;->b:Ljava/lang/Object;

    .line 55
    .line 56
    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-eq v4, v3, :cond_3

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_3
    move-object v0, p1

    .line 64
    move-object p1, v2

    .line 65
    goto :goto_0

    .line 66
    :cond_4
    :goto_2
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/p;->C(Ll/eyx;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iget-object v3, v0, Ll/eyx;->f:Ll/gyx;

    .line 71
    .line 72
    invoke-virtual {p0, v2, v3}, Lcom/google/android/exoplayer2/p;->t(Lcom/google/android/exoplayer2/c0;Ll/gyx;)Ll/gyx;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    iput-object p0, v0, Ll/eyx;->f:Ll/gyx;

    .line 77
    .line 78
    xor-int/lit8 p0, p1, 0x1

    .line 79
    .line 80
    return p0
.end method

.method public I(Lcom/google/android/exoplayer2/c0;JJ)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_8

    .line 6
    .line 7
    iget-object v3, v0, Ll/eyx;->f:Ll/gyx;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, v3}, Lcom/google/android/exoplayer2/p;->t(Lcom/google/android/exoplayer2/c0;Ll/gyx;)Ll/gyx;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    goto :goto_2

    .line 16
    :cond_0
    invoke-virtual {p0, p1, v1, p2, p3}, Lcom/google/android/exoplayer2/p;->j(Lcom/google/android/exoplayer2/c0;Ll/eyx;J)Ll/gyx;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    if-nez v4, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/p;->C(Ll/eyx;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    :goto_1
    xor-int/2addr p0, v2

    .line 27
    return p0

    .line 28
    :cond_1
    invoke-virtual {p0, v3, v4}, Lcom/google/android/exoplayer2/p;->e(Ll/gyx;Ll/gyx;)Z

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    if-nez v5, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/p;->C(Ll/eyx;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    goto :goto_1

    .line 39
    :cond_2
    move-object v1, v4

    .line 40
    :goto_2
    iget-wide v4, v3, Ll/gyx;->c:J

    .line 41
    .line 42
    invoke-virtual {v1, v4, v5}, Ll/gyx;->a(J)Ll/gyx;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    iput-object v4, v0, Ll/eyx;->f:Ll/gyx;

    .line 47
    .line 48
    iget-wide v3, v3, Ll/gyx;->e:J

    .line 49
    .line 50
    iget-wide v5, v1, Ll/gyx;->e:J

    .line 51
    .line 52
    invoke-virtual {p0, v3, v4, v5, v6}, Lcom/google/android/exoplayer2/p;->d(JJ)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-nez v3, :cond_7

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/eyx;->A()V

    .line 59
    .line 60
    .line 61
    iget-wide p1, v1, Ll/gyx;->e:J

    .line 62
    .line 63
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    cmp-long p3, p1, v3

    .line 69
    .line 70
    if-nez p3, :cond_3

    .line 71
    .line 72
    const-wide p1, 0x7fffffffffffffffL

    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    goto :goto_3

    .line 78
    :cond_3
    invoke-virtual {v0, p1, p2}, Ll/eyx;->z(J)J

    .line 79
    .line 80
    .line 81
    move-result-wide p1

    .line 82
    :goto_3
    iget-object p3, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 83
    .line 84
    const/4 v1, 0x0

    .line 85
    if-ne v0, p3, :cond_5

    .line 86
    .line 87
    iget-object p3, v0, Ll/eyx;->f:Ll/gyx;

    .line 88
    .line 89
    iget-boolean p3, p3, Ll/gyx;->f:Z

    .line 90
    .line 91
    if-nez p3, :cond_5

    .line 92
    .line 93
    const-wide/high16 v3, -0x8000000000000000L

    .line 94
    .line 95
    cmp-long p3, p4, v3

    .line 96
    .line 97
    if-eqz p3, :cond_4

    .line 98
    .line 99
    cmp-long p1, p4, p1

    .line 100
    .line 101
    if-ltz p1, :cond_5

    .line 102
    .line 103
    :cond_4
    move p1, v2

    .line 104
    goto :goto_4

    .line 105
    :cond_5
    move p1, v1

    .line 106
    :goto_4
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/p;->C(Ll/eyx;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-nez p0, :cond_6

    .line 111
    .line 112
    if-nez p1, :cond_6

    .line 113
    .line 114
    return v2

    .line 115
    :cond_6
    return v1

    .line 116
    :cond_7
    invoke-virtual {v0}, Ll/eyx;->j()Ll/eyx;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    move-object v7, v1

    .line 121
    move-object v1, v0

    .line 122
    move-object v0, v7

    .line 123
    goto :goto_0

    .line 124
    :cond_8
    return v2
.end method

.method public J(Lcom/google/android/exoplayer2/c0;I)Z
    .locals 0

    .line 1
    iput p2, p0, Lcom/google/android/exoplayer2/p;->f:I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/p;->H(Lcom/google/android/exoplayer2/c0;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public K(Lcom/google/android/exoplayer2/c0;Z)Z
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/google/android/exoplayer2/p;->g:Z

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/p;->H(Lcom/google/android/exoplayer2/c0;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b()Ll/eyx;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 8
    .line 9
    if-ne v0, v2, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/eyx;->j()Ll/eyx;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/eyx;->t()V

    .line 20
    .line 21
    .line 22
    iget v0, p0, Lcom/google/android/exoplayer2/p;->k:I

    .line 23
    .line 24
    add-int/lit8 v0, v0, -0x1

    .line 25
    .line 26
    iput v0, p0, Lcom/google/android/exoplayer2/p;->k:I

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    iput-object v1, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 33
    .line 34
    iget-object v1, v0, Ll/eyx;->b:Ljava/lang/Object;

    .line 35
    .line 36
    iput-object v1, p0, Lcom/google/android/exoplayer2/p;->l:Ljava/lang/Object;

    .line 37
    .line 38
    iget-object v0, v0, Ll/eyx;->f:Ll/gyx;

    .line 39
    .line 40
    iget-object v0, v0, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 41
    .line 42
    iget-wide v0, v0, Ll/fyx;->d:J

    .line 43
    .line 44
    iput-wide v0, p0, Lcom/google/android/exoplayer2/p;->m:J

    .line 45
    .line 46
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/eyx;->j()Ll/eyx;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/p;->A()V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 58
    .line 59
    return-object p0
.end method

.method public c()Ll/eyx;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/eyx;->j()Ll/eyx;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/eyx;->j()Ll/eyx;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/p;->A()V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 29
    .line 30
    return-object p0
.end method

.method public final d(JJ)Z
    .locals 2

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long p0, p1, v0

    if-eqz p0, :cond_1

    cmp-long p0, p1, p3

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public final e(Ll/gyx;Ll/gyx;)Z
    .locals 4

    .line 1
    iget-wide v0, p1, Ll/gyx;->b:J

    .line 2
    .line 3
    iget-wide v2, p2, Ll/gyx;->b:J

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 10
    .line 11
    iget-object p1, p2, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public f()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/p;->k:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 7
    .line 8
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/eyx;

    .line 13
    .line 14
    iget-object v1, v0, Ll/eyx;->b:Ljava/lang/Object;

    .line 15
    .line 16
    iput-object v1, p0, Lcom/google/android/exoplayer2/p;->l:Ljava/lang/Object;

    .line 17
    .line 18
    iget-object v1, v0, Ll/eyx;->f:Ll/gyx;

    .line 19
    .line 20
    iget-object v1, v1, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 21
    .line 22
    iget-wide v1, v1, Ll/fyx;->d:J

    .line 23
    .line 24
    iput-wide v1, p0, Lcom/google/android/exoplayer2/p;->m:J

    .line 25
    .line 26
    :goto_0
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/eyx;->t()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ll/eyx;->j()Ll/eyx;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v0, 0x0

    .line 37
    iput-object v0, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    iput v0, p0, Lcom/google/android/exoplayer2/p;->k:I

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/p;->A()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public g([Lcom/google/android/exoplayer2/y;Ll/cgj0;Ll/oj0;Lcom/google/android/exoplayer2/q;Ll/gyx;Ll/dgj0;)Ll/eyx;
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide v0, 0xe8d4a51000L

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    move-object/from16 v9, p5

    .line 11
    .line 12
    :goto_0
    move-wide v4, v0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-virtual {v0}, Ll/eyx;->l()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iget-object v2, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 19
    .line 20
    iget-object v2, v2, Ll/eyx;->f:Ll/gyx;

    .line 21
    .line 22
    iget-wide v2, v2, Ll/gyx;->e:J

    .line 23
    .line 24
    add-long/2addr v0, v2

    .line 25
    move-object/from16 v9, p5

    .line 26
    .line 27
    iget-wide v2, v9, Ll/gyx;->b:J

    .line 28
    .line 29
    sub-long/2addr v0, v2

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    new-instance v2, Ll/eyx;

    .line 32
    .line 33
    move-object v3, p1

    .line 34
    move-object v6, p2

    .line 35
    move-object v7, p3

    .line 36
    move-object v8, p4

    .line 37
    move-object/from16 v10, p6

    .line 38
    .line 39
    invoke-direct/range {v2 .. v10}, Ll/eyx;-><init>([Lcom/google/android/exoplayer2/y;JLl/cgj0;Ll/oj0;Lcom/google/android/exoplayer2/q;Ll/gyx;Ll/dgj0;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    invoke-virtual {p1, v2}, Ll/eyx;->w(Ll/eyx;)V

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_1
    iput-object v2, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 51
    .line 52
    iput-object v2, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 53
    .line 54
    :goto_2
    const/4 p1, 0x0

    .line 55
    iput-object p1, p0, Lcom/google/android/exoplayer2/p;->l:Ljava/lang/Object;

    .line 56
    .line 57
    iput-object v2, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 58
    .line 59
    iget p1, p0, Lcom/google/android/exoplayer2/p;->k:I

    .line 60
    .line 61
    add-int/lit8 p1, p1, 0x1

    .line 62
    .line 63
    iput p1, p0, Lcom/google/android/exoplayer2/p;->k:I

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/p;->A()V

    .line 66
    .line 67
    .line 68
    return-object v2
.end method

.method public final h(Ll/fe80;)Ll/gyx;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v1, p1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 2
    .line 3
    iget-object v2, p1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 4
    .line 5
    iget-wide v3, p1, Ll/fe80;->c:J

    .line 6
    .line 7
    iget-wide v5, p1, Ll/fe80;->r:J

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer2/p;->m(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJ)Ll/gyx;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final i(Lcom/google/android/exoplayer2/c0;Ll/eyx;J)Ll/gyx;
    .locals 16
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v9, p2

    .line 6
    .line 7
    iget-object v10, v9, Ll/eyx;->f:Ll/gyx;

    .line 8
    .line 9
    iget-object v2, v10, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 10
    .line 11
    iget-object v2, v2, Ll/fyx;->a:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    iget-object v3, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 18
    .line 19
    iget-object v4, v0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 20
    .line 21
    iget v5, v0, Lcom/google/android/exoplayer2/p;->f:I

    .line 22
    .line 23
    iget-boolean v6, v0, Lcom/google/android/exoplayer2/p;->g:Z

    .line 24
    .line 25
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/exoplayer2/c0;->h(ILcom/google/android/exoplayer2/c0$b;Lcom/google/android/exoplayer2/c0$d;IZ)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v3, -0x1

    .line 30
    const/4 v11, 0x0

    .line 31
    if-ne v2, v3, :cond_0

    .line 32
    .line 33
    return-object v11

    .line 34
    :cond_0
    iget-object v3, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 35
    .line 36
    const/4 v4, 0x1

    .line 37
    invoke-virtual {v1, v2, v3, v4}, Lcom/google/android/exoplayer2/c0;->k(ILcom/google/android/exoplayer2/c0$b;Z)Lcom/google/android/exoplayer2/c0$b;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget v4, v3, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 42
    .line 43
    iget-object v3, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/google/android/exoplayer2/c0$b;->b:Ljava/lang/Object;

    .line 46
    .line 47
    invoke-static {v3}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iget-object v5, v10, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 52
    .line 53
    iget-wide v5, v5, Ll/fyx;->d:J

    .line 54
    .line 55
    iget-object v7, v0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 56
    .line 57
    invoke-virtual {v1, v4, v7}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    iget v7, v7, Lcom/google/android/exoplayer2/c0$d;->o:I

    .line 62
    .line 63
    const-wide v12, -0x7fffffffffffffffL    # -4.9E-324

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    const-wide/16 v14, 0x0

    .line 69
    .line 70
    if-ne v7, v2, :cond_3

    .line 71
    .line 72
    iget-object v2, v0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 73
    .line 74
    iget-object v3, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 75
    .line 76
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    move-wide/from16 v7, p3

    .line 82
    .line 83
    invoke-static {v14, v15, v7, v8}, Ljava/lang/Math;->max(JJ)J

    .line 84
    .line 85
    .line 86
    move-result-wide v7

    .line 87
    invoke-virtual/range {v1 .. v8}, Lcom/google/android/exoplayer2/c0;->o(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IJJ)Landroid/util/Pair;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    if-nez v2, :cond_1

    .line 92
    .line 93
    return-object v11

    .line 94
    :cond_1
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 95
    .line 96
    iget-object v1, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 97
    .line 98
    check-cast v1, Ljava/lang/Long;

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 101
    .line 102
    .line 103
    move-result-wide v14

    .line 104
    invoke-virtual {v9}, Ll/eyx;->j()Ll/eyx;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    if-eqz v1, :cond_2

    .line 109
    .line 110
    iget-object v2, v1, Ll/eyx;->b:Ljava/lang/Object;

    .line 111
    .line 112
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-eqz v2, :cond_2

    .line 117
    .line 118
    iget-object v1, v1, Ll/eyx;->f:Ll/gyx;

    .line 119
    .line 120
    iget-object v1, v1, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 121
    .line 122
    iget-wide v5, v1, Ll/fyx;->d:J

    .line 123
    .line 124
    :goto_0
    move-object v2, v3

    .line 125
    move-wide v3, v14

    .line 126
    move-wide v14, v12

    .line 127
    goto :goto_1

    .line 128
    :cond_2
    iget-wide v5, v0, Lcom/google/android/exoplayer2/p;->e:J

    .line 129
    .line 130
    const-wide/16 v1, 0x1

    .line 131
    .line 132
    add-long/2addr v1, v5

    .line 133
    iput-wide v1, v0, Lcom/google/android/exoplayer2/p;->e:J

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_3
    move-object v2, v3

    .line 137
    move-wide v3, v14

    .line 138
    :goto_1
    iget-object v7, v0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 139
    .line 140
    iget-object v8, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 141
    .line 142
    move-object/from16 v1, p1

    .line 143
    .line 144
    invoke-static/range {v1 .. v8}, Lcom/google/android/exoplayer2/p;->D(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;JJLcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/source/i$b;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    cmp-long v5, v14, v12

    .line 149
    .line 150
    if-eqz v5, :cond_4

    .line 151
    .line 152
    iget-wide v5, v10, Ll/gyx;->c:J

    .line 153
    .line 154
    cmp-long v5, v5, v12

    .line 155
    .line 156
    if-eqz v5, :cond_4

    .line 157
    .line 158
    iget-object v5, v10, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 159
    .line 160
    iget-object v5, v5, Ll/fyx;->a:Ljava/lang/Object;

    .line 161
    .line 162
    invoke-virtual {v0, v5, v1}, Lcom/google/android/exoplayer2/p;->u(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0;)Z

    .line 163
    .line 164
    .line 165
    move-result v5

    .line 166
    invoke-virtual {v2}, Ll/fyx;->b()Z

    .line 167
    .line 168
    .line 169
    move-result v6

    .line 170
    if-eqz v6, :cond_5

    .line 171
    .line 172
    if-eqz v5, :cond_5

    .line 173
    .line 174
    iget-wide v14, v10, Ll/gyx;->c:J

    .line 175
    .line 176
    :cond_4
    :goto_2
    move-wide v5, v3

    .line 177
    move-wide v3, v14

    .line 178
    goto :goto_3

    .line 179
    :cond_5
    if-eqz v5, :cond_4

    .line 180
    .line 181
    iget-wide v3, v10, Ll/gyx;->c:J

    .line 182
    .line 183
    goto :goto_2

    .line 184
    :goto_3
    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer2/p;->m(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJ)Ll/gyx;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    return-object v0
.end method

.method public final j(Lcom/google/android/exoplayer2/c0;Ll/eyx;J)Ll/gyx;
    .locals 5
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p2, Ll/eyx;->f:Ll/gyx;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/eyx;->l()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iget-wide v3, v0, Ll/gyx;->e:J

    .line 8
    .line 9
    add-long/2addr v1, v3

    .line 10
    sub-long/2addr v1, p3

    .line 11
    iget-boolean p3, v0, Ll/gyx;->g:Z

    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, v1, v2}, Lcom/google/android/exoplayer2/p;->i(Lcom/google/android/exoplayer2/c0;Ll/eyx;J)Ll/gyx;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-virtual {p0, p1, p2, v1, v2}, Lcom/google/android/exoplayer2/p;->k(Lcom/google/android/exoplayer2/c0;Ll/eyx;J)Ll/gyx;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final k(Lcom/google/android/exoplayer2/c0;Ll/eyx;J)Ll/gyx;
    .locals 11
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v8, p2, Ll/eyx;->f:Ll/gyx;

    .line 2
    .line 3
    iget-object v9, v8, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 4
    .line 5
    iget-object v3, v9, Ll/fyx;->a:Ljava/lang/Object;

    .line 6
    .line 7
    iget-object v4, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 8
    .line 9
    invoke-virtual {p1, v3, v4}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v9}, Ll/fyx;->b()Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    const/4 v4, -0x1

    .line 17
    if-eqz v3, :cond_4

    .line 18
    .line 19
    iget v3, v9, Ll/fyx;->b:I

    .line 20
    .line 21
    iget-object v2, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/c0$b;->d(I)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/4 v10, 0x0

    .line 28
    if-ne v2, v4, :cond_0

    .line 29
    .line 30
    return-object v10

    .line 31
    :cond_0
    iget-object v4, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 32
    .line 33
    iget v5, v9, Ll/fyx;->c:I

    .line 34
    .line 35
    invoke-virtual {v4, v3, v5}, Lcom/google/android/exoplayer2/c0$b;->o(II)I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-ge v4, v2, :cond_1

    .line 40
    .line 41
    iget-object v2, v9, Ll/fyx;->a:Ljava/lang/Object;

    .line 42
    .line 43
    iget-wide v5, v8, Ll/gyx;->c:J

    .line 44
    .line 45
    iget-wide v7, v9, Ll/fyx;->d:J

    .line 46
    .line 47
    move-object v0, p0

    .line 48
    move-object v1, p1

    .line 49
    invoke-virtual/range {v0 .. v8}, Lcom/google/android/exoplayer2/p;->n(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;IIJJ)Ll/gyx;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    return-object v0

    .line 54
    :cond_1
    iget-wide v0, v8, Ll/gyx;->c:J

    .line 55
    .line 56
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    cmp-long v2, v0, v2

    .line 62
    .line 63
    if-nez v2, :cond_3

    .line 64
    .line 65
    iget-object v1, p0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 66
    .line 67
    iget-object v2, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 68
    .line 69
    iget v3, v2, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 70
    .line 71
    const-wide/16 v4, 0x0

    .line 72
    .line 73
    move-wide v6, p3

    .line 74
    invoke-static {v4, v5, p3, p4}, Ljava/lang/Math;->max(JJ)J

    .line 75
    .line 76
    .line 77
    move-result-wide v6

    .line 78
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    move-object v0, p1

    .line 84
    invoke-virtual/range {v0 .. v7}, Lcom/google/android/exoplayer2/c0;->o(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IJJ)Landroid/util/Pair;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    if-nez v1, :cond_2

    .line 89
    .line 90
    return-object v10

    .line 91
    :cond_2
    iget-object v0, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v0, Ljava/lang/Long;

    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 96
    .line 97
    .line 98
    move-result-wide v0

    .line 99
    :cond_3
    iget-object v3, v9, Ll/fyx;->a:Ljava/lang/Object;

    .line 100
    .line 101
    iget v4, v9, Ll/fyx;->b:I

    .line 102
    .line 103
    invoke-virtual {p0, p1, v3, v4}, Lcom/google/android/exoplayer2/p;->p(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;I)J

    .line 104
    .line 105
    .line 106
    move-result-wide v3

    .line 107
    iget-object v2, v9, Ll/fyx;->a:Ljava/lang/Object;

    .line 108
    .line 109
    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 110
    .line 111
    .line 112
    move-result-wide v3

    .line 113
    iget-wide v5, v8, Ll/gyx;->c:J

    .line 114
    .line 115
    iget-wide v7, v9, Ll/fyx;->d:J

    .line 116
    .line 117
    move-object v0, p0

    .line 118
    move-object v1, p1

    .line 119
    invoke-virtual/range {v0 .. v8}, Lcom/google/android/exoplayer2/p;->o(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;JJJ)Ll/gyx;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    return-object v0

    .line 124
    :cond_4
    move-wide v6, p3

    .line 125
    iget v1, v9, Ll/fyx;->e:I

    .line 126
    .line 127
    if-eq v1, v4, :cond_5

    .line 128
    .line 129
    iget-object v3, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 130
    .line 131
    invoke-virtual {v3, v1}, Lcom/google/android/exoplayer2/c0$b;->t(I)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-eqz v1, :cond_5

    .line 136
    .line 137
    invoke-virtual/range {p0 .. p4}, Lcom/google/android/exoplayer2/p;->i(Lcom/google/android/exoplayer2/c0;Ll/eyx;J)Ll/gyx;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    return-object v0

    .line 142
    :cond_5
    iget-object v1, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 143
    .line 144
    iget v2, v9, Ll/fyx;->e:I

    .line 145
    .line 146
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/c0$b;->n(I)I

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    iget-object v1, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 151
    .line 152
    iget v2, v9, Ll/fyx;->e:I

    .line 153
    .line 154
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/c0$b;->u(I)Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-eqz v1, :cond_6

    .line 159
    .line 160
    iget-object v1, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 161
    .line 162
    iget v2, v9, Ll/fyx;->e:I

    .line 163
    .line 164
    invoke-virtual {v1, v2, v4}, Lcom/google/android/exoplayer2/c0$b;->k(II)I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    const/4 v2, 0x3

    .line 169
    if-ne v1, v2, :cond_6

    .line 170
    .line 171
    const/4 v1, 0x1

    .line 172
    goto :goto_0

    .line 173
    :cond_6
    const/4 v1, 0x0

    .line 174
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 175
    .line 176
    iget v3, v9, Ll/fyx;->e:I

    .line 177
    .line 178
    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/c0$b;->d(I)I

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    if-eq v4, v2, :cond_8

    .line 183
    .line 184
    if-eqz v1, :cond_7

    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_7
    iget-object v2, v9, Ll/fyx;->a:Ljava/lang/Object;

    .line 188
    .line 189
    iget v3, v9, Ll/fyx;->e:I

    .line 190
    .line 191
    iget-wide v5, v8, Ll/gyx;->e:J

    .line 192
    .line 193
    iget-wide v7, v9, Ll/fyx;->d:J

    .line 194
    .line 195
    move-object v0, p0

    .line 196
    move-object v1, p1

    .line 197
    invoke-virtual/range {v0 .. v8}, Lcom/google/android/exoplayer2/p;->n(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;IIJJ)Ll/gyx;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    return-object v0

    .line 202
    :cond_8
    :goto_1
    iget-object v2, v9, Ll/fyx;->a:Ljava/lang/Object;

    .line 203
    .line 204
    iget v3, v9, Ll/fyx;->e:I

    .line 205
    .line 206
    invoke-virtual {p0, p1, v2, v3}, Lcom/google/android/exoplayer2/p;->p(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;I)J

    .line 207
    .line 208
    .line 209
    move-result-wide v3

    .line 210
    iget-object v2, v9, Ll/fyx;->a:Ljava/lang/Object;

    .line 211
    .line 212
    iget-wide v5, v8, Ll/gyx;->e:J

    .line 213
    .line 214
    iget-wide v7, v9, Ll/fyx;->d:J

    .line 215
    .line 216
    move-object v0, p0

    .line 217
    move-object v1, p1

    .line 218
    invoke-virtual/range {v0 .. v8}, Lcom/google/android/exoplayer2/p;->o(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;JJJ)Ll/gyx;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    return-object v0
.end method

.method public l()Ll/eyx;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 2
    .line 3
    return-object p0
.end method

.method public final m(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJ)Ll/gyx;
    .locals 10
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Ll/fyx;->b()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v3, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget v4, p2, Ll/fyx;->b:I

    .line 17
    .line 18
    iget v5, p2, Ll/fyx;->c:I

    .line 19
    .line 20
    iget-wide v8, p2, Ll/fyx;->d:J

    .line 21
    .line 22
    move-object v1, p0

    .line 23
    move-object v2, p1

    .line 24
    move-wide v6, p3

    .line 25
    invoke-virtual/range {v1 .. v9}, Lcom/google/android/exoplayer2/p;->n(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;IIJJ)Ll/gyx;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    iget-wide v8, p2, Ll/fyx;->d:J

    .line 31
    .line 32
    move-object v1, p0

    .line 33
    move-object v2, p1

    .line 34
    move-wide v6, p3

    .line 35
    move-wide v4, p5

    .line 36
    invoke-virtual/range {v1 .. v9}, Lcom/google/android/exoplayer2/p;->o(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;JJJ)Ll/gyx;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public final n(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;IIJJ)Ll/gyx;
    .locals 14

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/source/i$b;

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    move-wide/from16 v4, p7

    .line 10
    .line 11
    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/i$b;-><init>(Ljava/lang/Object;IIJ)V

    .line 12
    .line 13
    .line 14
    iget-object v1, v0, Ll/fyx;->a:Ljava/lang/Object;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 17
    .line 18
    invoke-virtual {p1, v1, v2}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget v1, v0, Ll/fyx;->b:I

    .line 23
    .line 24
    iget v2, v0, Ll/fyx;->c:I

    .line 25
    .line 26
    invoke-virtual {p1, v1, v2}, Lcom/google/android/exoplayer2/c0$b;->e(II)J

    .line 27
    .line 28
    .line 29
    move-result-wide v8

    .line 30
    iget-object p1, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 31
    .line 32
    move/from16 v2, p3

    .line 33
    .line 34
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer2/c0$b;->n(I)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    const-wide/16 v1, 0x0

    .line 39
    .line 40
    if-ne v3, p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/c0$b;->j()J

    .line 45
    .line 46
    .line 47
    move-result-wide v3

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    move-wide v3, v1

    .line 50
    :goto_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 51
    .line 52
    iget p1, v0, Ll/fyx;->b:I

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/c0$b;->u(I)Z

    .line 55
    .line 56
    .line 57
    move-result v10

    .line 58
    const-wide p0, -0x7fffffffffffffffL    # -4.9E-324

    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    cmp-long p0, v8, p0

    .line 64
    .line 65
    if-eqz p0, :cond_1

    .line 66
    .line 67
    cmp-long p0, v3, v8

    .line 68
    .line 69
    if-ltz p0, :cond_1

    .line 70
    .line 71
    const-wide/16 p0, 0x1

    .line 72
    .line 73
    sub-long p0, v8, p0

    .line 74
    .line 75
    invoke-static {v1, v2, p0, p1}, Ljava/lang/Math;->max(JJ)J

    .line 76
    .line 77
    .line 78
    move-result-wide v3

    .line 79
    :cond_1
    move-object v1, v0

    .line 80
    move-wide v2, v3

    .line 81
    new-instance v0, Ll/gyx;

    .line 82
    .line 83
    const/4 v12, 0x0

    .line 84
    const/4 v13, 0x0

    .line 85
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    const/4 v11, 0x0

    .line 91
    move-wide/from16 v4, p5

    .line 92
    .line 93
    invoke-direct/range {v0 .. v13}, Ll/gyx;-><init>(Lcom/google/android/exoplayer2/source/i$b;JJJJZZZZ)V

    .line 94
    .line 95
    .line 96
    return-object v0
.end method

.method public final o(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;JJJ)Ll/gyx;
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-wide/from16 v3, p3

    .line 8
    .line 9
    iget-object v5, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 10
    .line 11
    invoke-virtual {v1, v2, v5}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 12
    .line 13
    .line 14
    iget-object v5, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 15
    .line 16
    invoke-virtual {v5, v3, v4}, Lcom/google/android/exoplayer2/c0$b;->g(J)I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    const/4 v6, 0x0

    .line 21
    const/4 v7, 0x1

    .line 22
    const/4 v8, -0x1

    .line 23
    if-eq v5, v8, :cond_0

    .line 24
    .line 25
    iget-object v9, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 26
    .line 27
    invoke-virtual {v9, v5}, Lcom/google/android/exoplayer2/c0$b;->t(I)Z

    .line 28
    .line 29
    .line 30
    move-result v9

    .line 31
    if-eqz v9, :cond_0

    .line 32
    .line 33
    move v9, v7

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v9, v6

    .line 36
    :goto_0
    iget-object v10, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 37
    .line 38
    if-ne v5, v8, :cond_1

    .line 39
    .line 40
    invoke-virtual {v10}, Lcom/google/android/exoplayer2/c0$b;->f()I

    .line 41
    .line 42
    .line 43
    move-result v10

    .line 44
    if-lez v10, :cond_2

    .line 45
    .line 46
    iget-object v10, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 47
    .line 48
    invoke-virtual {v10}, Lcom/google/android/exoplayer2/c0$b;->r()I

    .line 49
    .line 50
    .line 51
    move-result v11

    .line 52
    invoke-virtual {v10, v11}, Lcom/google/android/exoplayer2/c0$b;->u(I)Z

    .line 53
    .line 54
    .line 55
    move-result v10

    .line 56
    if-eqz v10, :cond_2

    .line 57
    .line 58
    move v10, v7

    .line 59
    goto :goto_1

    .line 60
    :cond_1
    invoke-virtual {v10, v5}, Lcom/google/android/exoplayer2/c0$b;->u(I)Z

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    if-eqz v10, :cond_2

    .line 65
    .line 66
    iget-object v10, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 67
    .line 68
    invoke-virtual {v10, v5}, Lcom/google/android/exoplayer2/c0$b;->i(I)J

    .line 69
    .line 70
    .line 71
    move-result-wide v10

    .line 72
    iget-object v12, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 73
    .line 74
    iget-wide v13, v12, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 75
    .line 76
    cmp-long v10, v10, v13

    .line 77
    .line 78
    if-nez v10, :cond_2

    .line 79
    .line 80
    invoke-virtual {v12, v5}, Lcom/google/android/exoplayer2/c0$b;->s(I)Z

    .line 81
    .line 82
    .line 83
    move-result v10

    .line 84
    if-eqz v10, :cond_2

    .line 85
    .line 86
    move v10, v7

    .line 87
    move v5, v8

    .line 88
    goto :goto_1

    .line 89
    :cond_2
    move v10, v6

    .line 90
    :goto_1
    new-instance v12, Lcom/google/android/exoplayer2/source/i$b;

    .line 91
    .line 92
    move-wide/from16 v13, p7

    .line 93
    .line 94
    invoke-direct {v12, v2, v13, v14, v5}, Lcom/google/android/exoplayer2/source/i$b;-><init>(Ljava/lang/Object;JI)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v12}, Lcom/google/android/exoplayer2/p;->v(Lcom/google/android/exoplayer2/source/i$b;)Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    invoke-virtual {v0, v1, v12}, Lcom/google/android/exoplayer2/p;->x(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;)Z

    .line 102
    .line 103
    .line 104
    move-result v23

    .line 105
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/android/exoplayer2/p;->w(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;Z)Z

    .line 106
    .line 107
    .line 108
    move-result v24

    .line 109
    if-eq v5, v8, :cond_3

    .line 110
    .line 111
    iget-object v1, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 112
    .line 113
    invoke-virtual {v1, v5}, Lcom/google/android/exoplayer2/c0$b;->u(I)Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_3

    .line 118
    .line 119
    if-nez v9, :cond_3

    .line 120
    .line 121
    move/from16 v21, v7

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_3
    move/from16 v21, v6

    .line 125
    .line 126
    :goto_2
    const-wide v13, -0x7fffffffffffffffL    # -4.9E-324

    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    if-eq v5, v8, :cond_4

    .line 132
    .line 133
    if-nez v9, :cond_4

    .line 134
    .line 135
    iget-object v1, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 136
    .line 137
    invoke-virtual {v1, v5}, Lcom/google/android/exoplayer2/c0$b;->i(I)J

    .line 138
    .line 139
    .line 140
    move-result-wide v8

    .line 141
    :goto_3
    move-wide/from16 v17, v8

    .line 142
    .line 143
    goto :goto_4

    .line 144
    :cond_4
    if-eqz v10, :cond_5

    .line 145
    .line 146
    iget-object v1, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 147
    .line 148
    iget-wide v8, v1, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_5
    move-wide/from16 v17, v13

    .line 152
    .line 153
    :goto_4
    cmp-long v1, v17, v13

    .line 154
    .line 155
    if-eqz v1, :cond_7

    .line 156
    .line 157
    const-wide/high16 v8, -0x8000000000000000L

    .line 158
    .line 159
    cmp-long v1, v17, v8

    .line 160
    .line 161
    if-nez v1, :cond_6

    .line 162
    .line 163
    goto :goto_5

    .line 164
    :cond_6
    move-wide/from16 v19, v17

    .line 165
    .line 166
    goto :goto_6

    .line 167
    :cond_7
    :goto_5
    iget-object v0, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 168
    .line 169
    iget-wide v0, v0, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 170
    .line 171
    move-wide/from16 v19, v0

    .line 172
    .line 173
    :goto_6
    cmp-long v0, v19, v13

    .line 174
    .line 175
    if-eqz v0, :cond_a

    .line 176
    .line 177
    cmp-long v0, v3, v19

    .line 178
    .line 179
    if-ltz v0, :cond_a

    .line 180
    .line 181
    if-nez v24, :cond_8

    .line 182
    .line 183
    if-nez v10, :cond_9

    .line 184
    .line 185
    :cond_8
    move v6, v7

    .line 186
    :cond_9
    int-to-long v0, v6

    .line 187
    sub-long v0, v19, v0

    .line 188
    .line 189
    const-wide/16 v3, 0x0

    .line 190
    .line 191
    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 192
    .line 193
    .line 194
    move-result-wide v0

    .line 195
    move-wide v13, v0

    .line 196
    goto :goto_7

    .line 197
    :cond_a
    move-wide v13, v3

    .line 198
    :goto_7
    new-instance v11, Ll/gyx;

    .line 199
    .line 200
    move-wide/from16 v15, p5

    .line 201
    .line 202
    move/from16 v22, v2

    .line 203
    .line 204
    invoke-direct/range {v11 .. v24}, Ll/gyx;-><init>(Lcom/google/android/exoplayer2/source/i$b;JJJJZZZZ)V

    .line 205
    .line 206
    .line 207
    return-object v11
.end method

.method public final p(Lcom/google/android/exoplayer2/c0;Ljava/lang/Object;I)J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 7
    .line 8
    invoke-virtual {p1, p3}, Lcom/google/android/exoplayer2/c0$b;->i(I)J

    .line 9
    .line 10
    .line 11
    move-result-wide p1

    .line 12
    const-wide/high16 v0, -0x8000000000000000L

    .line 13
    .line 14
    cmp-long v0, p1, v0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-wide p0, p0, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 21
    .line 22
    return-wide p0

    .line 23
    :cond_0
    invoke-virtual {p0, p3}, Lcom/google/android/exoplayer2/c0$b;->l(I)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    add-long/2addr p1, v0

    .line 28
    return-wide p1
.end method

.method public q(JLl/fe80;)Ll/gyx;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p3}, Lcom/google/android/exoplayer2/p;->h(Ll/fe80;)Ll/gyx;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p3, p3, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 11
    .line 12
    invoke-virtual {p0, p3, v0, p1, p2}, Lcom/google/android/exoplayer2/p;->j(Lcom/google/android/exoplayer2/c0;Ll/eyx;J)Ll/gyx;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public r()Ll/eyx;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/p;->h:Ll/eyx;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Ll/eyx;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/p;->i:Ll/eyx;

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Lcom/google/android/exoplayer2/c0;Ll/gyx;)Ll/gyx;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v2, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 8
    .line 9
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/p;->v(Lcom/google/android/exoplayer2/source/i$b;)Z

    .line 10
    .line 11
    .line 12
    move-result v11

    .line 13
    invoke-virtual {v0, v1, v3}, Lcom/google/android/exoplayer2/p;->x(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;)Z

    .line 14
    .line 15
    .line 16
    move-result v12

    .line 17
    invoke-virtual {v0, v1, v3, v11}, Lcom/google/android/exoplayer2/p;->w(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;Z)Z

    .line 18
    .line 19
    .line 20
    move-result v13

    .line 21
    iget-object v4, v2, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 22
    .line 23
    iget-object v4, v4, Ll/fyx;->a:Ljava/lang/Object;

    .line 24
    .line 25
    iget-object v5, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 26
    .line 27
    invoke-virtual {v1, v4, v5}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3}, Ll/fyx;->b()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    const/4 v6, -0x1

    .line 40
    if-nez v1, :cond_1

    .line 41
    .line 42
    iget v1, v3, Ll/fyx;->e:I

    .line 43
    .line 44
    if-ne v1, v6, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object v7, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 48
    .line 49
    invoke-virtual {v7, v1}, Lcom/google/android/exoplayer2/c0$b;->i(I)J

    .line 50
    .line 51
    .line 52
    move-result-wide v7

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    :goto_0
    move-wide v7, v4

    .line 55
    :goto_1
    invoke-virtual {v3}, Ll/fyx;->b()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-object v1, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 62
    .line 63
    iget v4, v3, Ll/fyx;->b:I

    .line 64
    .line 65
    iget v5, v3, Ll/fyx;->c:I

    .line 66
    .line 67
    invoke-virtual {v1, v4, v5}, Lcom/google/android/exoplayer2/c0$b;->e(II)J

    .line 68
    .line 69
    .line 70
    move-result-wide v4

    .line 71
    goto :goto_3

    .line 72
    :cond_2
    cmp-long v1, v7, v4

    .line 73
    .line 74
    if-eqz v1, :cond_4

    .line 75
    .line 76
    const-wide/high16 v4, -0x8000000000000000L

    .line 77
    .line 78
    cmp-long v1, v7, v4

    .line 79
    .line 80
    if-nez v1, :cond_3

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_3
    move-wide v4, v7

    .line 84
    goto :goto_3

    .line 85
    :cond_4
    :goto_2
    iget-object v1, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 86
    .line 87
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/c0$b;->m()J

    .line 88
    .line 89
    .line 90
    move-result-wide v4

    .line 91
    :goto_3
    invoke-virtual {v3}, Ll/fyx;->b()Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_5

    .line 96
    .line 97
    iget-object v0, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 98
    .line 99
    iget v1, v3, Ll/fyx;->b:I

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/c0$b;->u(I)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    :goto_4
    move v10, v0

    .line 106
    goto :goto_5

    .line 107
    :cond_5
    iget v1, v3, Ll/fyx;->e:I

    .line 108
    .line 109
    if-eq v1, v6, :cond_6

    .line 110
    .line 111
    iget-object v0, v0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/c0$b;->u(I)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_6

    .line 118
    .line 119
    const/4 v0, 0x1

    .line 120
    goto :goto_4

    .line 121
    :cond_6
    const/4 v0, 0x0

    .line 122
    goto :goto_4

    .line 123
    :goto_5
    new-instance v0, Ll/gyx;

    .line 124
    .line 125
    iget-wide v14, v2, Ll/gyx;->b:J

    .line 126
    .line 127
    iget-wide v1, v2, Ll/gyx;->c:J

    .line 128
    .line 129
    move-wide v6, v7

    .line 130
    move-wide v8, v4

    .line 131
    move-wide v4, v1

    .line 132
    move-object v1, v3

    .line 133
    move-wide v2, v14

    .line 134
    invoke-direct/range {v0 .. v13}, Ll/gyx;-><init>(Lcom/google/android/exoplayer2/source/i$b;JJJJZZZZ)V

    .line 135
    .line 136
    .line 137
    return-object v0
.end method

.method public final u(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 2
    .line 3
    invoke-virtual {p2, p1, v0}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/c0$b;->f()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p2, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/c0$b;->r()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-lez p1, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Lcom/google/android/exoplayer2/c0$b;->u(I)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    if-gt p1, v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/c0$b;->i(I)J

    .line 33
    .line 34
    .line 35
    move-result-wide p0

    .line 36
    const-wide/high16 v1, -0x8000000000000000L

    .line 37
    .line 38
    cmp-long p0, p0, v1

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    :cond_0
    return v0

    .line 43
    :cond_1
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public final v(Lcom/google/android/exoplayer2/source/i$b;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/fyx;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    iget p0, p1, Ll/fyx;->e:I

    .line 8
    .line 9
    const/4 p1, -0x1

    .line 10
    if-ne p0, p1, :cond_0

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

.method public final w(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;Z)Z
    .locals 6

    .line 1
    iget-object p2, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 8
    .line 9
    invoke-virtual {p1, v1, p2}, Lcom/google/android/exoplayer2/c0;->j(ILcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget p2, p2, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 16
    .line 17
    invoke-virtual {p1, p2, v0}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iget-boolean p2, p2, Lcom/google/android/exoplayer2/c0$d;->i:Z

    .line 22
    .line 23
    if-nez p2, :cond_0

    .line 24
    .line 25
    iget-object v2, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 26
    .line 27
    iget-object v3, p0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 28
    .line 29
    iget v4, p0, Lcom/google/android/exoplayer2/p;->f:I

    .line 30
    .line 31
    iget-boolean v5, p0, Lcom/google/android/exoplayer2/p;->g:Z

    .line 32
    .line 33
    move-object v0, p1

    .line 34
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/c0;->v(ILcom/google/android/exoplayer2/c0$b;Lcom/google/android/exoplayer2/c0$d;IZ)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    if-eqz p3, :cond_0

    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return p0
.end method

.method public final x(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;)Z
    .locals 3

    .line 1
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/p;->v(Lcom/google/android/exoplayer2/source/i$b;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/google/android/exoplayer2/p;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 12
    .line 13
    invoke-virtual {p1, v0, v2}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v0, v0, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 18
    .line 19
    iget-object p2, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iget-object p0, p0, Lcom/google/android/exoplayer2/p;->b:Lcom/google/android/exoplayer2/c0$d;

    .line 26
    .line 27
    invoke-virtual {p1, v0, p0}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget p0, p0, Lcom/google/android/exoplayer2/c0$d;->p:I

    .line 32
    .line 33
    if-ne p0, p2, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    return v1
.end method

.method public y(Lcom/google/android/exoplayer2/source/h;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/p;->j:Ll/eyx;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method
