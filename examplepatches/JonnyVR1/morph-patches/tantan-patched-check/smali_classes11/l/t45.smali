.class public Ll/t45;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xwd0;
.implements Lcom/google/android/exoplayer2/source/r;
.implements Lcom/google/android/exoplayer2/upstream/Loader$b;
.implements Lcom/google/android/exoplayer2/upstream/Loader$f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/t45$a;,
        Ll/t45$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/u45;",
        ">",
        "Ljava/lang/Object;",
        "Ll/xwd0;",
        "Lcom/google/android/exoplayer2/source/r;",
        "Lcom/google/android/exoplayer2/upstream/Loader$b<",
        "Ll/o45;",
        ">;",
        "Lcom/google/android/exoplayer2/upstream/Loader$f;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:I

.field public final b:[I

.field public final c:[Lcom/google/android/exoplayer2/k;

.field public final d:[Z

.field public final e:Ll/u45;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final f:Lcom/google/android/exoplayer2/source/r$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/source/r$a<",
            "Ll/t45<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public final g:Lcom/google/android/exoplayer2/source/j$a;

.field public final h:Lcom/google/android/exoplayer2/upstream/c;

.field public final i:Lcom/google/android/exoplayer2/upstream/Loader;

.field public final j:Ll/q45;

.field public final k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/cq2;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/cq2;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Lcom/google/android/exoplayer2/source/q;

.field public final n:[Lcom/google/android/exoplayer2/source/q;

.field public final o:Ll/eq2;

.field public p:Ll/o45;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public q:Lcom/google/android/exoplayer2/k;

.field public r:Ll/t45$b;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/t45$b<",
            "TT;>;"
        }
    .end annotation
.end field

.field public s:J

.field public t:J

.field public u:I

.field public v:Ll/cq2;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public w:Z


# direct methods
.method public constructor <init>(I[I[Lcom/google/android/exoplayer2/k;Ll/u45;Lcom/google/android/exoplayer2/source/r$a;Ll/oj0;JLcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;Lcom/google/android/exoplayer2/upstream/c;Lcom/google/android/exoplayer2/source/j$a;)V
    .locals 1
    .param p2    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # [Lcom/google/android/exoplayer2/k;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[I[",
            "Lcom/google/android/exoplayer2/k;",
            "TT;",
            "Lcom/google/android/exoplayer2/source/r$a<",
            "Ll/t45<",
            "TT;>;>;",
            "Ll/oj0;",
            "J",
            "Lcom/google/android/exoplayer2/drm/c;",
            "Lcom/google/android/exoplayer2/drm/b$a;",
            "Lcom/google/android/exoplayer2/upstream/c;",
            "Lcom/google/android/exoplayer2/source/j$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/t45;->a:I

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    new-array p2, v0, [I

    .line 10
    .line 11
    :cond_0
    iput-object p2, p0, Ll/t45;->b:[I

    .line 12
    .line 13
    if-nez p3, :cond_1

    .line 14
    .line 15
    new-array p3, v0, [Lcom/google/android/exoplayer2/k;

    .line 16
    .line 17
    :cond_1
    iput-object p3, p0, Ll/t45;->c:[Lcom/google/android/exoplayer2/k;

    .line 18
    .line 19
    iput-object p4, p0, Ll/t45;->e:Ll/u45;

    .line 20
    .line 21
    iput-object p5, p0, Ll/t45;->f:Lcom/google/android/exoplayer2/source/r$a;

    .line 22
    .line 23
    iput-object p12, p0, Ll/t45;->g:Lcom/google/android/exoplayer2/source/j$a;

    .line 24
    .line 25
    iput-object p11, p0, Ll/t45;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 26
    .line 27
    new-instance p3, Lcom/google/android/exoplayer2/upstream/Loader;

    .line 28
    .line 29
    const-string p4, "ChunkSampleStream"

    .line 30
    .line 31
    invoke-direct {p3, p4}, Lcom/google/android/exoplayer2/upstream/Loader;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iput-object p3, p0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 35
    .line 36
    new-instance p3, Ll/q45;

    .line 37
    .line 38
    invoke-direct {p3}, Ll/q45;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p3, p0, Ll/t45;->j:Ll/q45;

    .line 42
    .line 43
    new-instance p3, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object p3, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    iput-object p3, p0, Ll/t45;->l:Ljava/util/List;

    .line 55
    .line 56
    array-length p2, p2

    .line 57
    new-array p3, p2, [Lcom/google/android/exoplayer2/source/q;

    .line 58
    .line 59
    iput-object p3, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 60
    .line 61
    new-array p3, p2, [Z

    .line 62
    .line 63
    iput-object p3, p0, Ll/t45;->d:[Z

    .line 64
    .line 65
    add-int/lit8 p3, p2, 0x1

    .line 66
    .line 67
    new-array p4, p3, [I

    .line 68
    .line 69
    new-array p3, p3, [Lcom/google/android/exoplayer2/source/q;

    .line 70
    .line 71
    invoke-static {p6, p9, p10}, Lcom/google/android/exoplayer2/source/q;->k(Ll/oj0;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;)Lcom/google/android/exoplayer2/source/q;

    .line 72
    .line 73
    .line 74
    move-result-object p5

    .line 75
    iput-object p5, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 76
    .line 77
    aput p1, p4, v0

    .line 78
    .line 79
    aput-object p5, p3, v0

    .line 80
    .line 81
    :goto_0
    if-ge v0, p2, :cond_2

    .line 82
    .line 83
    invoke-static {p6}, Lcom/google/android/exoplayer2/source/q;->l(Ll/oj0;)Lcom/google/android/exoplayer2/source/q;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p5, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 88
    .line 89
    aput-object p1, p5, v0

    .line 90
    .line 91
    add-int/lit8 p5, v0, 0x1

    .line 92
    .line 93
    aput-object p1, p3, p5

    .line 94
    .line 95
    iget-object p1, p0, Ll/t45;->b:[I

    .line 96
    .line 97
    aget p1, p1, v0

    .line 98
    .line 99
    aput p1, p4, p5

    .line 100
    .line 101
    move v0, p5

    .line 102
    goto :goto_0

    .line 103
    :cond_2
    new-instance p1, Ll/eq2;

    .line 104
    .line 105
    invoke-direct {p1, p4, p3}, Ll/eq2;-><init>([I[Lcom/google/android/exoplayer2/source/q;)V

    .line 106
    .line 107
    .line 108
    iput-object p1, p0, Ll/t45;->o:Ll/eq2;

    .line 109
    .line 110
    iput-wide p7, p0, Ll/t45;->s:J

    .line 111
    .line 112
    iput-wide p7, p0, Ll/t45;->t:J

    .line 113
    .line 114
    return-void
.end method

.method public static synthetic u(Ll/t45;)Ll/cq2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t45;->v:Ll/cq2;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v(Ll/t45;)[Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t45;->d:[Z

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w(Ll/t45;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t45;->b:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic x(Ll/t45;)[Lcom/google/android/exoplayer2/k;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t45;->c:[Lcom/google/android/exoplayer2/k;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y(Ll/t45;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/t45;->t:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic z(Ll/t45;)Lcom/google/android/exoplayer2/source/j$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t45;->g:Lcom/google/android/exoplayer2/source/j$a;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final A(I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/t45;->N(II)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iget v1, p0, Ll/t45;->u:I

    .line 7
    .line 8
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-lez p1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-static {v1, v0, p1}, Ll/bmk0;->U0(Ljava/util/List;II)V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Ll/t45;->u:I

    .line 20
    .line 21
    sub-int/2addr v0, p1

    .line 22
    iput v0, p0, Ll/t45;->u:I

    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final B(I)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    :goto_0
    const/4 v1, -0x1

    .line 19
    if-ge p1, v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/t45;->F(I)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move p1, v1

    .line 32
    :goto_1
    if-ne p1, v1, :cond_2

    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    invoke-virtual {p0}, Ll/t45;->E()Ll/cq2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-wide v5, v0, Ll/o45;->h:J

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/t45;->C(I)Ll/cq2;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object v0, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    iget-wide v0, p0, Ll/t45;->t:J

    .line 54
    .line 55
    iput-wide v0, p0, Ll/t45;->s:J

    .line 56
    .line 57
    :cond_3
    const/4 v0, 0x0

    .line 58
    iput-boolean v0, p0, Ll/t45;->w:Z

    .line 59
    .line 60
    iget-object v1, p0, Ll/t45;->g:Lcom/google/android/exoplayer2/source/j$a;

    .line 61
    .line 62
    iget v2, p0, Ll/t45;->a:I

    .line 63
    .line 64
    iget-wide v3, p1, Ll/o45;->g:J

    .line 65
    .line 66
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/exoplayer2/source/j$a;->w(IJJ)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final C(I)Ll/cq2;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/cq2;

    .line 8
    .line 9
    iget-object v1, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v1, p1, v2}, Ll/bmk0;->U0(Ljava/util/List;II)V

    .line 16
    .line 17
    .line 18
    iget p1, p0, Ll/t45;->u:I

    .line 19
    .line 20
    iget-object v1, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Ll/t45;->u:I

    .line 31
    .line 32
    iget-object p1, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1}, Ll/cq2;->i(I)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer2/source/q;->u(I)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object p1, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 43
    .line 44
    array-length v2, p1

    .line 45
    if-ge v1, v2, :cond_0

    .line 46
    .line 47
    aget-object p1, p1, v1

    .line 48
    .line 49
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/cq2;->i(I)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer2/source/q;->u(I)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    return-object v0
.end method

.method public D()Ll/u45;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t45;->e:Ll/u45;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E()Ll/cq2;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/cq2;

    .line 14
    .line 15
    return-object p0
.end method

.method public final F(I)Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/cq2;

    .line 8
    .line 9
    iget-object v0, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p1, v1}, Ll/cq2;->i(I)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v3, 0x1

    .line 21
    if-le v0, v2, :cond_0

    .line 22
    .line 23
    return v3

    .line 24
    :cond_0
    move v0, v1

    .line 25
    :cond_1
    iget-object v2, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 26
    .line 27
    array-length v4, v2

    .line 28
    if-ge v0, v4, :cond_2

    .line 29
    .line 30
    aget-object v2, v2, v0

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/cq2;->i(I)I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-le v2, v4, :cond_1

    .line 43
    .line 44
    return v3

    .line 45
    :cond_2
    return v1
.end method

.method public final G(Ll/o45;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Ll/cq2;

    .line 2
    .line 3
    return p0
.end method

.method public H()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/t45;->s:J

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

.method public final I()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Ll/t45;->u:I

    .line 8
    .line 9
    add-int/lit8 v1, v1, -0x1

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/t45;->N(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    :goto_0
    iget v1, p0, Ll/t45;->u:I

    .line 16
    .line 17
    if-gt v1, v0, :cond_0

    .line 18
    .line 19
    add-int/lit8 v2, v1, 0x1

    .line 20
    .line 21
    iput v2, p0, Ll/t45;->u:I

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ll/t45;->J(I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public final J(I)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/cq2;

    .line 8
    .line 9
    iget-object v2, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 10
    .line 11
    iget-object v0, p0, Ll/t45;->q:Lcom/google/android/exoplayer2/k;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Lcom/google/android/exoplayer2/k;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/t45;->g:Lcom/google/android/exoplayer2/source/j$a;

    .line 20
    .line 21
    iget v1, p0, Ll/t45;->a:I

    .line 22
    .line 23
    iget v3, p1, Ll/o45;->e:I

    .line 24
    .line 25
    iget-object v4, p1, Ll/o45;->f:Ljava/lang/Object;

    .line 26
    .line 27
    iget-wide v5, p1, Ll/o45;->g:J

    .line 28
    .line 29
    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer2/source/j$a;->h(ILcom/google/android/exoplayer2/k;ILjava/lang/Object;J)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iput-object v2, p0, Ll/t45;->q:Lcom/google/android/exoplayer2/k;

    .line 33
    .line 34
    return-void
.end method

.method public K(Ll/o45;JJZ)V
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/t45;->p:Ll/o45;

    .line 3
    .line 4
    iput-object v0, p0, Ll/t45;->v:Ll/cq2;

    .line 5
    .line 6
    new-instance v1, Ll/mtv;

    .line 7
    .line 8
    iget-wide v2, p1, Ll/o45;->a:J

    .line 9
    .line 10
    iget-object v4, p1, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/o45;->f()Landroid/net/Uri;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    invoke-virtual {p1}, Ll/o45;->e()Ljava/util/Map;

    .line 17
    .line 18
    .line 19
    move-result-object v6

    .line 20
    invoke-virtual {p1}, Ll/o45;->b()J

    .line 21
    .line 22
    .line 23
    move-result-wide v11

    .line 24
    move-wide v7, p2

    .line 25
    move-wide/from16 v9, p4

    .line 26
    .line 27
    invoke-direct/range {v1 .. v12}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/t45;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 31
    .line 32
    iget-wide v2, p1, Ll/o45;->a:J

    .line 33
    .line 34
    invoke-interface {v0, v2, v3}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 35
    .line 36
    .line 37
    move-object v2, v1

    .line 38
    iget-object v1, p0, Ll/t45;->g:Lcom/google/android/exoplayer2/source/j$a;

    .line 39
    .line 40
    iget v3, p1, Ll/o45;->c:I

    .line 41
    .line 42
    iget v4, p0, Ll/t45;->a:I

    .line 43
    .line 44
    iget-object v5, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 45
    .line 46
    iget v6, p1, Ll/o45;->e:I

    .line 47
    .line 48
    iget-object v7, p1, Ll/o45;->f:Ljava/lang/Object;

    .line 49
    .line 50
    iget-wide v8, p1, Ll/o45;->g:J

    .line 51
    .line 52
    iget-wide v10, p1, Ll/o45;->h:J

    .line 53
    .line 54
    invoke-virtual/range {v1 .. v11}, Lcom/google/android/exoplayer2/source/j$a;->k(Ll/mtv;IILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJ)V

    .line 55
    .line 56
    .line 57
    if-nez p6, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/t45;->H()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/t45;->Q()V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    invoke-virtual/range {p0 .. p1}, Ll/t45;->G(Ll/o45;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_1

    .line 74
    .line 75
    iget-object p1, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    add-int/lit8 p1, p1, -0x1

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Ll/t45;->C(I)Ll/cq2;

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_1

    .line 93
    .line 94
    iget-wide v0, p0, Ll/t45;->t:J

    .line 95
    .line 96
    iput-wide v0, p0, Ll/t45;->s:J

    .line 97
    .line 98
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/t45;->f:Lcom/google/android/exoplayer2/source/r$a;

    .line 99
    .line 100
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/r$a;->j(Lcom/google/android/exoplayer2/source/r;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    return-void
.end method

.method public L(Ll/o45;JJ)V
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/t45;->p:Ll/o45;

    .line 3
    .line 4
    iget-object v0, p0, Ll/t45;->e:Ll/u45;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ll/u45;->j(Ll/o45;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/mtv;

    .line 10
    .line 11
    iget-wide v2, p1, Ll/o45;->a:J

    .line 12
    .line 13
    iget-object v4, p1, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/o45;->f()Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    invoke-virtual {p1}, Ll/o45;->e()Ljava/util/Map;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    invoke-virtual {p1}, Ll/o45;->b()J

    .line 24
    .line 25
    .line 26
    move-result-wide v11

    .line 27
    move-wide v7, p2

    .line 28
    move-wide/from16 v9, p4

    .line 29
    .line 30
    invoke-direct/range {v1 .. v12}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/t45;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 34
    .line 35
    iget-wide v2, p1, Ll/o45;->a:J

    .line 36
    .line 37
    invoke-interface {v0, v2, v3}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 38
    .line 39
    .line 40
    move-object v2, v1

    .line 41
    iget-object v1, p0, Ll/t45;->g:Lcom/google/android/exoplayer2/source/j$a;

    .line 42
    .line 43
    iget v3, p1, Ll/o45;->c:I

    .line 44
    .line 45
    iget v4, p0, Ll/t45;->a:I

    .line 46
    .line 47
    iget-object v5, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 48
    .line 49
    iget v6, p1, Ll/o45;->e:I

    .line 50
    .line 51
    iget-object v7, p1, Ll/o45;->f:Ljava/lang/Object;

    .line 52
    .line 53
    iget-wide v8, p1, Ll/o45;->g:J

    .line 54
    .line 55
    iget-wide v10, p1, Ll/o45;->h:J

    .line 56
    .line 57
    invoke-virtual/range {v1 .. v11}, Lcom/google/android/exoplayer2/source/j$a;->n(Ll/mtv;IILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJ)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/t45;->f:Lcom/google/android/exoplayer2/source/r$a;

    .line 61
    .line 62
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/r$a;->j(Lcom/google/android/exoplayer2/source/r;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public M(Ll/o45;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;
    .locals 29

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/o45;->b()J

    .line 6
    .line 7
    .line 8
    move-result-wide v12

    .line 9
    invoke-virtual/range {p0 .. p1}, Ll/t45;->G(Ll/o45;)Z

    .line 10
    .line 11
    .line 12
    move-result v14

    .line 13
    iget-object v2, v0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v15, 0x1

    .line 20
    sub-int/2addr v2, v15

    .line 21
    const-wide/16 v3, 0x0

    .line 22
    .line 23
    cmp-long v3, v12, v3

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    if-eqz v14, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ll/t45;->F(I)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-nez v3, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move v3, v4

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    :goto_0
    move v3, v15

    .line 40
    :goto_1
    new-instance v17, Ll/mtv;

    .line 41
    .line 42
    move v5, v3

    .line 43
    move v6, v4

    .line 44
    iget-wide v3, v1, Ll/o45;->a:J

    .line 45
    .line 46
    move v7, v5

    .line 47
    iget-object v5, v1, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 48
    .line 49
    move v8, v6

    .line 50
    invoke-virtual {v1}, Ll/o45;->f()Landroid/net/Uri;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    move v9, v7

    .line 55
    invoke-virtual {v1}, Ll/o45;->e()Ljava/util/Map;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    move-wide/from16 v10, p4

    .line 60
    .line 61
    move v15, v2

    .line 62
    move-object/from16 v2, v17

    .line 63
    .line 64
    move/from16 v17, v14

    .line 65
    .line 66
    move v14, v9

    .line 67
    move-wide/from16 v8, p2

    .line 68
    .line 69
    invoke-direct/range {v2 .. v13}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 70
    .line 71
    .line 72
    new-instance v3, Ll/ktx;

    .line 73
    .line 74
    iget v4, v1, Ll/o45;->c:I

    .line 75
    .line 76
    iget v5, v0, Ll/t45;->a:I

    .line 77
    .line 78
    iget-object v6, v1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 79
    .line 80
    iget v7, v1, Ll/o45;->e:I

    .line 81
    .line 82
    iget-object v8, v1, Ll/o45;->f:Ljava/lang/Object;

    .line 83
    .line 84
    iget-wide v9, v1, Ll/o45;->g:J

    .line 85
    .line 86
    invoke-static {v9, v10}, Ll/bmk0;->l1(J)J

    .line 87
    .line 88
    .line 89
    move-result-wide v9

    .line 90
    iget-wide v11, v1, Ll/o45;->h:J

    .line 91
    .line 92
    invoke-static {v11, v12}, Ll/bmk0;->l1(J)J

    .line 93
    .line 94
    .line 95
    move-result-wide v11

    .line 96
    invoke-direct/range {v3 .. v12}, Ll/ktx;-><init>(IILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJ)V

    .line 97
    .line 98
    .line 99
    new-instance v4, Lcom/google/android/exoplayer2/upstream/c$c;

    .line 100
    .line 101
    move-object/from16 v5, p6

    .line 102
    .line 103
    move/from16 v6, p7

    .line 104
    .line 105
    invoke-direct {v4, v2, v3, v5, v6}, Lcom/google/android/exoplayer2/upstream/c$c;-><init>(Ll/mtv;Ll/ktx;Ljava/io/IOException;I)V

    .line 106
    .line 107
    .line 108
    iget-object v3, v0, Ll/t45;->e:Ll/u45;

    .line 109
    .line 110
    iget-object v6, v0, Ll/t45;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 111
    .line 112
    invoke-interface {v3, v1, v14, v4, v6}, Ll/u45;->e(Ll/o45;ZLcom/google/android/exoplayer2/upstream/c$c;Lcom/google/android/exoplayer2/upstream/c;)Z

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-eqz v3, :cond_4

    .line 117
    .line 118
    if-eqz v14, :cond_3

    .line 119
    .line 120
    sget-object v3, Lcom/google/android/exoplayer2/upstream/Loader;->f:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 121
    .line 122
    if-eqz v17, :cond_5

    .line 123
    .line 124
    invoke-virtual {v0, v15}, Ll/t45;->C(I)Ll/cq2;

    .line 125
    .line 126
    .line 127
    move-result-object v7

    .line 128
    if-ne v7, v1, :cond_2

    .line 129
    .line 130
    const/4 v15, 0x1

    .line 131
    goto :goto_2

    .line 132
    :cond_2
    const/4 v15, 0x0

    .line 133
    :goto_2
    invoke-static {v15}, Ll/w11;->g(Z)V

    .line 134
    .line 135
    .line 136
    iget-object v7, v0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    .line 139
    .line 140
    .line 141
    move-result v7

    .line 142
    if-eqz v7, :cond_5

    .line 143
    .line 144
    iget-wide v7, v0, Ll/t45;->t:J

    .line 145
    .line 146
    iput-wide v7, v0, Ll/t45;->s:J

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_3
    const-string v3, "ChunkSampleStream"

    .line 150
    .line 151
    const-string v7, "Ignoring attempt to cancel non-cancelable load."

    .line 152
    .line 153
    invoke-static {v3, v7}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_4
    const/4 v3, 0x0

    .line 157
    :cond_5
    :goto_3
    if-nez v3, :cond_7

    .line 158
    .line 159
    iget-object v3, v0, Ll/t45;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 160
    .line 161
    invoke-interface {v3, v4}, Lcom/google/android/exoplayer2/upstream/c;->a(Lcom/google/android/exoplayer2/upstream/c$c;)J

    .line 162
    .line 163
    .line 164
    move-result-wide v3

    .line 165
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    cmp-long v7, v3, v7

    .line 171
    .line 172
    if-eqz v7, :cond_6

    .line 173
    .line 174
    const/4 v8, 0x0

    .line 175
    invoke-static {v8, v3, v4}, Lcom/google/android/exoplayer2/upstream/Loader;->h(ZJ)Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    goto :goto_4

    .line 180
    :cond_6
    sget-object v3, Lcom/google/android/exoplayer2/upstream/Loader;->g:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 181
    .line 182
    :cond_7
    :goto_4
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/upstream/Loader$c;->c()Z

    .line 183
    .line 184
    .line 185
    move-result v4

    .line 186
    xor-int/lit8 v28, v4, 0x1

    .line 187
    .line 188
    iget-object v7, v0, Ll/t45;->g:Lcom/google/android/exoplayer2/source/j$a;

    .line 189
    .line 190
    iget v8, v1, Ll/o45;->c:I

    .line 191
    .line 192
    iget v9, v0, Ll/t45;->a:I

    .line 193
    .line 194
    iget-object v10, v1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 195
    .line 196
    iget v11, v1, Ll/o45;->e:I

    .line 197
    .line 198
    iget-object v12, v1, Ll/o45;->f:Ljava/lang/Object;

    .line 199
    .line 200
    iget-wide v13, v1, Ll/o45;->g:J

    .line 201
    .line 202
    move-object/from16 v16, v7

    .line 203
    .line 204
    iget-wide v6, v1, Ll/o45;->h:J

    .line 205
    .line 206
    move-object/from16 v17, v2

    .line 207
    .line 208
    move-object/from16 v27, v5

    .line 209
    .line 210
    move-wide/from16 v25, v6

    .line 211
    .line 212
    move/from16 v18, v8

    .line 213
    .line 214
    move/from16 v19, v9

    .line 215
    .line 216
    move-object/from16 v20, v10

    .line 217
    .line 218
    move/from16 v21, v11

    .line 219
    .line 220
    move-object/from16 v22, v12

    .line 221
    .line 222
    move-wide/from16 v23, v13

    .line 223
    .line 224
    invoke-virtual/range {v16 .. v28}, Lcom/google/android/exoplayer2/source/j$a;->p(Ll/mtv;IILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJLjava/io/IOException;Z)V

    .line 225
    .line 226
    .line 227
    if-nez v4, :cond_8

    .line 228
    .line 229
    const/4 v2, 0x0

    .line 230
    iput-object v2, v0, Ll/t45;->p:Ll/o45;

    .line 231
    .line 232
    iget-object v2, v0, Ll/t45;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 233
    .line 234
    iget-wide v4, v1, Ll/o45;->a:J

    .line 235
    .line 236
    invoke-interface {v2, v4, v5}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 237
    .line 238
    .line 239
    iget-object v1, v0, Ll/t45;->f:Lcom/google/android/exoplayer2/source/r$a;

    .line 240
    .line 241
    invoke-interface {v1, v0}, Lcom/google/android/exoplayer2/source/r$a;->j(Lcom/google/android/exoplayer2/source/r;)V

    .line 242
    .line 243
    .line 244
    :cond_8
    return-object v3
.end method

.method public final N(II)I
    .locals 2

    .line 1
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    iget-object v0, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 10
    .line 11
    if-ge p2, v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/cq2;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Ll/cq2;->i(I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-le v0, p1, :cond_0

    .line 25
    .line 26
    add-int/lit8 p2, p2, -0x1

    .line 27
    .line 28
    return p2

    .line 29
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    add-int/lit8 p0, p0, -0x1

    .line 34
    .line 35
    return p0
.end method

.method public O()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/t45;->P(Ll/t45$b;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public P(Ll/t45$b;)V
    .locals 3
    .param p1    # Ll/t45$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/t45$b<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/t45;->r:Ll/t45$b;

    .line 2
    .line 3
    iget-object p1, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/source/q;->Q()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 9
    .line 10
    array-length v0, p1

    .line 11
    const/4 v1, 0x0

    .line 12
    :goto_0
    if-ge v1, v0, :cond_0

    .line 13
    .line 14
    aget-object v2, p1, v1

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/q;->Q()V

    .line 17
    .line 18
    .line 19
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p1, p0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/upstream/Loader;->m(Lcom/google/android/exoplayer2/upstream/Loader$f;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final Q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/q;->U()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 7
    .line 8
    array-length v0, p0

    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    if-ge v1, v0, :cond_0

    .line 11
    .line 12
    aget-object v2, p0, v1

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/q;->U()V

    .line 15
    .line 16
    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void
.end method

.method public R(J)V
    .locals 8

    .line 1
    iput-wide p1, p0, Ll/t45;->t:J

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t45;->H()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iput-wide p1, p0, Ll/t45;->s:J

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    move v1, v0

    .line 14
    :goto_0
    iget-object v2, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-ge v1, v2, :cond_3

    .line 21
    .line 22
    iget-object v2, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Ll/cq2;

    .line 29
    .line 30
    iget-wide v3, v2, Ll/o45;->g:J

    .line 31
    .line 32
    cmp-long v3, v3, p1

    .line 33
    .line 34
    if-nez v3, :cond_1

    .line 35
    .line 36
    iget-wide v4, v2, Ll/cq2;->k:J

    .line 37
    .line 38
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    cmp-long v4, v4, v6

    .line 44
    .line 45
    if-nez v4, :cond_1

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_1
    if-lez v3, :cond_2

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    :goto_1
    const/4 v2, 0x0

    .line 55
    :goto_2
    iget-object v1, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 56
    .line 57
    const/4 v3, 0x1

    .line 58
    if-eqz v2, :cond_4

    .line 59
    .line 60
    invoke-virtual {v2, v0}, Ll/cq2;->i(I)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/source/q;->X(I)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    invoke-virtual {p0}, Ll/t45;->f()J

    .line 70
    .line 71
    .line 72
    move-result-wide v4

    .line 73
    cmp-long v2, p1, v4

    .line 74
    .line 75
    if-gez v2, :cond_5

    .line 76
    .line 77
    move v2, v3

    .line 78
    goto :goto_3

    .line 79
    :cond_5
    move v2, v0

    .line 80
    :goto_3
    invoke-virtual {v1, p1, p2, v2}, Lcom/google/android/exoplayer2/source/q;->Y(JZ)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    :goto_4
    if-eqz v1, :cond_7

    .line 85
    .line 86
    iget-object v1, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-virtual {p0, v1, v0}, Ll/t45;->N(II)I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    iput v1, p0, Ll/t45;->u:I

    .line 97
    .line 98
    iget-object p0, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 99
    .line 100
    array-length v1, p0

    .line 101
    :goto_5
    if-ge v0, v1, :cond_6

    .line 102
    .line 103
    aget-object v2, p0, v0

    .line 104
    .line 105
    invoke-virtual {v2, p1, p2, v3}, Lcom/google/android/exoplayer2/source/q;->Y(JZ)Z

    .line 106
    .line 107
    .line 108
    add-int/lit8 v0, v0, 0x1

    .line 109
    .line 110
    goto :goto_5

    .line 111
    :cond_6
    return-void

    .line 112
    :cond_7
    iput-wide p1, p0, Ll/t45;->s:J

    .line 113
    .line 114
    iput-boolean v0, p0, Ll/t45;->w:Z

    .line 115
    .line 116
    iget-object p1, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 117
    .line 118
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 119
    .line 120
    .line 121
    iput v0, p0, Ll/t45;->u:I

    .line 122
    .line 123
    iget-object p1, p0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-eqz p1, :cond_9

    .line 130
    .line 131
    iget-object p1, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/source/q;->r()V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 137
    .line 138
    array-length p2, p1

    .line 139
    :goto_6
    if-ge v0, p2, :cond_8

    .line 140
    .line 141
    aget-object v1, p1, v0

    .line 142
    .line 143
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/source/q;->r()V

    .line 144
    .line 145
    .line 146
    add-int/lit8 v0, v0, 0x1

    .line 147
    .line 148
    goto :goto_6

    .line 149
    :cond_8
    iget-object p0, p0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/upstream/Loader;->f()V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_9
    iget-object p1, p0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 156
    .line 157
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/Loader;->g()V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0}, Ll/t45;->Q()V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public S(JI)Ll/t45$a;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI)",
            "Ll/t45<",
            "TT;>.a;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 3
    .line 4
    array-length v1, v1

    .line 5
    if-ge v0, v1, :cond_1

    .line 6
    .line 7
    iget-object v1, p0, Ll/t45;->b:[I

    .line 8
    .line 9
    aget v1, v1, v0

    .line 10
    .line 11
    if-ne v1, p3, :cond_0

    .line 12
    .line 13
    iget-object p3, p0, Ll/t45;->d:[Z

    .line 14
    .line 15
    aget-boolean p3, p3, v0

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    xor-int/2addr p3, v1

    .line 19
    invoke-static {p3}, Ll/w11;->g(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p3, p0, Ll/t45;->d:[Z

    .line 23
    .line 24
    aput-boolean v1, p3, v0

    .line 25
    .line 26
    iget-object p3, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 27
    .line 28
    aget-object p3, p3, v0

    .line 29
    .line 30
    invoke-virtual {p3, p1, p2, v1}, Lcom/google/android/exoplayer2/source/q;->Y(JZ)Z

    .line 31
    .line 32
    .line 33
    new-instance p1, Ll/t45$a;

    .line 34
    .line 35
    iget-object p2, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 36
    .line 37
    aget-object p2, p2, v0

    .line 38
    .line 39
    invoke-direct {p1, p0, p0, p2, v0}, Ll/t45$a;-><init>(Ll/t45;Ll/t45;Lcom/google/android/exoplayer2/source/q;I)V

    .line 40
    .line 41
    .line 42
    return-object p1

    .line 43
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public a()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/q;->M()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/t45;->e:Ll/u45;

    .line 20
    .line 21
    invoke-interface {p0}, Ll/u45;->a()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public b()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/t45;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/t45;->w:Z

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/google/android/exoplayer2/source/q;->K(Z)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public c(J)Z
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/t45;->w:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v1, :cond_8

    .line 7
    .line 8
    iget-object v1, v0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_8

    .line 15
    .line 16
    iget-object v1, v0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/upstream/Loader;->i()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    goto/16 :goto_4

    .line 25
    .line 26
    :cond_0
    invoke-virtual {v0}, Ll/t45;->H()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 33
    .line 34
    iget-wide v4, v0, Ll/t45;->s:J

    .line 35
    .line 36
    :goto_0
    move-object v11, v3

    .line 37
    move-wide v9, v4

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iget-object v3, v0, Ll/t45;->l:Ljava/util/List;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/t45;->E()Ll/cq2;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    iget-wide v4, v4, Ll/o45;->h:J

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :goto_1
    iget-object v6, v0, Ll/t45;->e:Ll/u45;

    .line 49
    .line 50
    iget-object v12, v0, Ll/t45;->j:Ll/q45;

    .line 51
    .line 52
    move-wide/from16 v7, p1

    .line 53
    .line 54
    invoke-interface/range {v6 .. v12}, Ll/u45;->h(JJLjava/util/List;Ll/q45;)V

    .line 55
    .line 56
    .line 57
    iget-object v3, v0, Ll/t45;->j:Ll/q45;

    .line 58
    .line 59
    iget-boolean v4, v3, Ll/q45;->b:Z

    .line 60
    .line 61
    iget-object v5, v3, Ll/q45;->a:Ll/o45;

    .line 62
    .line 63
    invoke-virtual {v3}, Ll/q45;->a()V

    .line 64
    .line 65
    .line 66
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    const/4 v3, 0x1

    .line 72
    if-eqz v4, :cond_2

    .line 73
    .line 74
    iput-wide v6, v0, Ll/t45;->s:J

    .line 75
    .line 76
    iput-boolean v3, v0, Ll/t45;->w:Z

    .line 77
    .line 78
    return v3

    .line 79
    :cond_2
    if-nez v5, :cond_3

    .line 80
    .line 81
    return v2

    .line 82
    :cond_3
    iput-object v5, v0, Ll/t45;->p:Ll/o45;

    .line 83
    .line 84
    invoke-virtual {v0, v5}, Ll/t45;->G(Ll/o45;)Z

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    if-eqz v4, :cond_6

    .line 89
    .line 90
    move-object v4, v5

    .line 91
    check-cast v4, Ll/cq2;

    .line 92
    .line 93
    if-eqz v1, :cond_5

    .line 94
    .line 95
    iget-wide v8, v4, Ll/o45;->g:J

    .line 96
    .line 97
    iget-wide v10, v0, Ll/t45;->s:J

    .line 98
    .line 99
    cmp-long v1, v8, v10

    .line 100
    .line 101
    if-eqz v1, :cond_4

    .line 102
    .line 103
    iget-object v1, v0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 104
    .line 105
    invoke-virtual {v1, v10, v11}, Lcom/google/android/exoplayer2/source/q;->a0(J)V

    .line 106
    .line 107
    .line 108
    iget-object v1, v0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 109
    .line 110
    array-length v8, v1

    .line 111
    :goto_2
    if-ge v2, v8, :cond_4

    .line 112
    .line 113
    aget-object v9, v1, v2

    .line 114
    .line 115
    iget-wide v10, v0, Ll/t45;->s:J

    .line 116
    .line 117
    invoke-virtual {v9, v10, v11}, Lcom/google/android/exoplayer2/source/q;->a0(J)V

    .line 118
    .line 119
    .line 120
    add-int/lit8 v2, v2, 0x1

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_4
    iput-wide v6, v0, Ll/t45;->s:J

    .line 124
    .line 125
    :cond_5
    iget-object v1, v0, Ll/t45;->o:Ll/eq2;

    .line 126
    .line 127
    invoke-virtual {v4, v1}, Ll/cq2;->k(Ll/eq2;)V

    .line 128
    .line 129
    .line 130
    iget-object v1, v0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 131
    .line 132
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_6
    instance-of v1, v5, Ll/gum;

    .line 137
    .line 138
    if-eqz v1, :cond_7

    .line 139
    .line 140
    move-object v1, v5

    .line 141
    check-cast v1, Ll/gum;

    .line 142
    .line 143
    iget-object v2, v0, Ll/t45;->o:Ll/eq2;

    .line 144
    .line 145
    invoke-virtual {v1, v2}, Ll/gum;->g(Ll/p45$b;)V

    .line 146
    .line 147
    .line 148
    :cond_7
    :goto_3
    iget-object v1, v0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 149
    .line 150
    iget-object v2, v0, Ll/t45;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 151
    .line 152
    iget v4, v5, Ll/o45;->c:I

    .line 153
    .line 154
    invoke-interface {v2, v4}, Lcom/google/android/exoplayer2/upstream/c;->d(I)I

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    invoke-virtual {v1, v5, v0, v2}, Lcom/google/android/exoplayer2/upstream/Loader;->n(Lcom/google/android/exoplayer2/upstream/Loader$e;Lcom/google/android/exoplayer2/upstream/Loader$b;I)J

    .line 159
    .line 160
    .line 161
    move-result-wide v10

    .line 162
    iget-object v12, v0, Ll/t45;->g:Lcom/google/android/exoplayer2/source/j$a;

    .line 163
    .line 164
    new-instance v13, Ll/mtv;

    .line 165
    .line 166
    iget-wide v7, v5, Ll/o45;->a:J

    .line 167
    .line 168
    iget-object v9, v5, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 169
    .line 170
    move-object v6, v13

    .line 171
    invoke-direct/range {v6 .. v11}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;J)V

    .line 172
    .line 173
    .line 174
    iget v14, v5, Ll/o45;->c:I

    .line 175
    .line 176
    iget v15, v0, Ll/t45;->a:I

    .line 177
    .line 178
    iget-object v0, v5, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 179
    .line 180
    iget v1, v5, Ll/o45;->e:I

    .line 181
    .line 182
    iget-object v2, v5, Ll/o45;->f:Ljava/lang/Object;

    .line 183
    .line 184
    iget-wide v6, v5, Ll/o45;->g:J

    .line 185
    .line 186
    iget-wide v4, v5, Ll/o45;->h:J

    .line 187
    .line 188
    move-object/from16 v16, v0

    .line 189
    .line 190
    move/from16 v17, v1

    .line 191
    .line 192
    move-object/from16 v18, v2

    .line 193
    .line 194
    move-wide/from16 v21, v4

    .line 195
    .line 196
    move-wide/from16 v19, v6

    .line 197
    .line 198
    invoke-virtual/range {v12 .. v22}, Lcom/google/android/exoplayer2/source/j$a;->t(Ll/mtv;IILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJ)V

    .line 199
    .line 200
    .line 201
    return v3

    .line 202
    :cond_8
    :goto_4
    return v2
.end method

.method public d()J
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/t45;->w:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-wide/high16 v0, -0x8000000000000000L

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/t45;->H()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-wide v0, p0, Ll/t45;->s:J

    .line 15
    .line 16
    return-wide v0

    .line 17
    :cond_1
    iget-wide v0, p0, Ll/t45;->t:J

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/t45;->E()Ll/cq2;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Ll/crx;->h()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    iget-object v2, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/4 v3, 0x1

    .line 37
    if-le v2, v3, :cond_3

    .line 38
    .line 39
    iget-object v2, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    add-int/lit8 v3, v3, -0x2

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Ll/cq2;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    const/4 v2, 0x0

    .line 55
    :goto_0
    if-eqz v2, :cond_4

    .line 56
    .line 57
    iget-wide v2, v2, Ll/o45;->h:J

    .line 58
    .line 59
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    :cond_4
    iget-object p0, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->z()J

    .line 66
    .line 67
    .line 68
    move-result-wide v2

    .line 69
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    return-wide v0
.end method

.method public e(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/t45;->H()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Ll/t45;->p:Ll/o45;

    .line 25
    .line 26
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/o45;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/t45;->G(Ll/o45;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    add-int/lit8 v1, v1, -0x1

    .line 45
    .line 46
    invoke-virtual {p0, v1}, Ll/t45;->F(I)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object v1, p0, Ll/t45;->e:Ll/u45;

    .line 54
    .line 55
    iget-object v2, p0, Ll/t45;->l:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v1, p1, p2, v0, v2}, Ll/u45;->c(JLl/o45;Ljava/util/List;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_3

    .line 62
    .line 63
    iget-object p1, p0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/Loader;->f()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v0}, Ll/t45;->G(Ll/o45;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_3

    .line 73
    .line 74
    check-cast v0, Ll/cq2;

    .line 75
    .line 76
    iput-object v0, p0, Ll/t45;->v:Ll/cq2;

    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    iget-object v0, p0, Ll/t45;->e:Ll/u45;

    .line 80
    .line 81
    iget-object v1, p0, Ll/t45;->l:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {v0, p1, p2, v1}, Ll/u45;->d(JLjava/util/List;)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iget-object p2, p0, Ll/t45;->k:Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-ge p1, p2, :cond_3

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ll/t45;->B(I)V

    .line 96
    .line 97
    .line 98
    :cond_3
    :goto_0
    return-void
.end method

.method public f()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/t45;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v0, p0, Ll/t45;->s:J

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-boolean v0, p0, Ll/t45;->w:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-wide/high16 v0, -0x8000000000000000L

    .line 15
    .line 16
    return-wide v0

    .line 17
    :cond_1
    invoke-virtual {p0}, Ll/t45;->E()Ll/cq2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-wide v0, p0, Ll/o45;->h:J

    .line 22
    .line 23
    return-wide v0
.end method

.method public g(JLl/nke0;)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t45;->e:Ll/u45;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/u45;->g(JLl/nke0;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public isLoading()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t45;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/q;->S()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 7
    .line 8
    array-length v1, v0

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_0

    .line 11
    .line 12
    aget-object v3, v0, v2

    .line 13
    .line 14
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/source/q;->S()V

    .line 15
    .line 16
    .line 17
    add-int/lit8 v2, v2, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/t45;->e:Ll/u45;

    .line 21
    .line 22
    invoke-interface {v0}, Ll/u45;->release()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/t45;->r:Ll/t45$b;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-interface {v0, p0}, Ll/t45$b;->b(Ll/t45;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public k(J)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/t45;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 10
    .line 11
    iget-boolean v2, p0, Ll/t45;->w:Z

    .line 12
    .line 13
    invoke-virtual {v0, p1, p2, v2}, Lcom/google/android/exoplayer2/source/q;->E(JZ)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iget-object p2, p0, Ll/t45;->v:Ll/cq2;

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-virtual {p2, v1}, Ll/cq2;->i(I)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iget-object v0, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sub-int/2addr p2, v0

    .line 32
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    :cond_1
    iget-object p2, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 37
    .line 38
    invoke-virtual {p2, p1}, Lcom/google/android/exoplayer2/source/q;->d0(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/t45;->I()V

    .line 42
    .line 43
    .line 44
    return p1
.end method

.method public l(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;I)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/t45;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x3

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Ll/t45;->v:Ll/cq2;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v2}, Ll/cq2;->i(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v2, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-gt v0, v2, :cond_1

    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    invoke-virtual {p0}, Ll/t45;->I()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 31
    .line 32
    iget-boolean p0, p0, Ll/t45;->w:Z

    .line 33
    .line 34
    invoke-virtual {v0, p1, p2, p3, p0}, Lcom/google/android/exoplayer2/source/q;->R(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;IZ)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public bridge synthetic n(Lcom/google/android/exoplayer2/upstream/Loader$e;JJZ)V
    .locals 0

    .line 1
    check-cast p1, Ll/o45;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p6}, Ll/t45;->K(Ll/o45;JJZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic o(Lcom/google/android/exoplayer2/upstream/Loader$e;JJ)V
    .locals 0

    .line 1
    check-cast p1, Ll/o45;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/t45;->L(Ll/o45;JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic q(Lcom/google/android/exoplayer2/upstream/Loader$e;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;
    .locals 0

    .line 1
    check-cast p1, Ll/o45;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p7}, Ll/t45;->M(Ll/o45;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public t(JZ)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/t45;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/q;->x()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-virtual {v1, p1, p2, p3, v2}, Lcom/google/android/exoplayer2/source/q;->q(JZZ)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/source/q;->x()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-le p1, v0, :cond_1

    .line 27
    .line 28
    iget-object p2, p0, Ll/t45;->m:Lcom/google/android/exoplayer2/source/q;

    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/source/q;->y()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    const/4 p2, 0x0

    .line 35
    :goto_0
    iget-object v2, p0, Ll/t45;->n:[Lcom/google/android/exoplayer2/source/q;

    .line 36
    .line 37
    array-length v3, v2

    .line 38
    if-ge p2, v3, :cond_1

    .line 39
    .line 40
    aget-object v2, v2, p2

    .line 41
    .line 42
    iget-object v3, p0, Ll/t45;->d:[Z

    .line 43
    .line 44
    aget-boolean v3, v3, p2

    .line 45
    .line 46
    invoke-virtual {v2, v0, v1, p3, v3}, Lcom/google/android/exoplayer2/source/q;->q(JZZ)V

    .line 47
    .line 48
    .line 49
    add-int/lit8 p2, p2, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {p0, p1}, Ll/t45;->A(I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
