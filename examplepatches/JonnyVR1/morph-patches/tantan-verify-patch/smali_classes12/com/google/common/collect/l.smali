.class public Lcom/google/common/collect/l;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/l$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public transient a:[Ljava/lang/Object;

.field public transient b:[I

.field public transient c:I

.field public transient d:I

.field public transient e:[I

.field public transient f:[J

.field public transient g:F

.field public transient h:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    const/high16 v1, 0x3f800000    # 1.0f

    .line 38
    invoke-virtual {p0, v0, v1}, Lcom/google/common/collect/l;->n(IF)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    .line 39
    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/l;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(IF)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/l;->n(IF)V

    return-void
.end method

.method public constructor <init>(Lcom/google/common/collect/l;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/l<",
            "+TK;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/google/common/collect/l;->C()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/google/common/collect/l;->n(IF)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/google/common/collect/l;->e()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    :goto_0
    const/4 v1, -0x1

    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/google/common/collect/l;->i(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p1, v0}, Lcom/google/common/collect/l;->k(I)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {p0, v1, v2}, Lcom/google/common/collect/l;->u(Ljava/lang/Object;I)I

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lcom/google/common/collect/l;->s(I)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-void
.end method

.method public static D(JI)J
    .locals 4

    .line 1
    const-wide v0, -0x100000000L

    and-long/2addr p0, v0

    const-wide v0, 0xffffffffL

    int-to-long v2, p2

    and-long/2addr v0, v2

    or-long/2addr p0, v0

    return-wide p0
.end method

.method public static b()Lcom/google/common/collect/l;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/l<",
            "TK;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/common/collect/l;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/common/collect/l;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(I)Lcom/google/common/collect/l;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lcom/google/common/collect/l<",
            "TK;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/common/collect/l;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/google/common/collect/l;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static h(J)I
    .locals 1

    .line 1
    const/16 v0, 0x20

    ushr-long/2addr p0, v0

    long-to-int p0, p0

    return p0
.end method

.method public static j(J)I
    .locals 0

    .line 1
    long-to-int p0, p0

    return p0
.end method

.method public static q(I)[J
    .locals 2

    .line 1
    new-array p0, p0, [J

    .line 2
    .line 3
    const-wide/16 v0, -0x1

    .line 4
    .line 5
    invoke-static {p0, v0, v1}, Ljava/util/Arrays;->fill([JJ)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public static r(I)[I
    .locals 1

    .line 1
    new-array p0, p0, [I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-static {p0, v0}, Ljava/util/Arrays;->fill([II)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public final A(I)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/l;->e:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/high16 v1, 0x40000000    # 2.0f

    .line 5
    .line 6
    if-lt v0, v1, :cond_0

    .line 7
    .line 8
    const p1, 0x7fffffff

    .line 9
    .line 10
    .line 11
    iput p1, p0, Lcom/google/common/collect/l;->h:I

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    int-to-float v0, p1

    .line 15
    iget v1, p0, Lcom/google/common/collect/l;->g:F

    .line 16
    .line 17
    mul-float/2addr v0, v1

    .line 18
    float-to-int v0, v0

    .line 19
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    invoke-static {p1}, Lcom/google/common/collect/l;->r(I)[I

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v1, p0, Lcom/google/common/collect/l;->f:[J

    .line 26
    .line 27
    array-length v2, p1

    .line 28
    add-int/lit8 v2, v2, -0x1

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    :goto_0
    iget v4, p0, Lcom/google/common/collect/l;->c:I

    .line 32
    .line 33
    if-ge v3, v4, :cond_1

    .line 34
    .line 35
    aget-wide v4, v1, v3

    .line 36
    .line 37
    invoke-static {v4, v5}, Lcom/google/common/collect/l;->h(J)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    and-int v5, v4, v2

    .line 42
    .line 43
    aget v6, p1, v5

    .line 44
    .line 45
    aput v3, p1, v5

    .line 46
    .line 47
    int-to-long v4, v4

    .line 48
    const/16 v7, 0x20

    .line 49
    .line 50
    shl-long/2addr v4, v7

    .line 51
    const-wide v7, 0xffffffffL

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    int-to-long v9, v6

    .line 57
    and-long v6, v9, v7

    .line 58
    .line 59
    or-long/2addr v4, v6

    .line 60
    aput-wide v4, v1, v3

    .line 61
    .line 62
    add-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iput v0, p0, Lcom/google/common/collect/l;->h:I

    .line 66
    .line 67
    iput-object p1, p0, Lcom/google/common/collect/l;->e:[I

    .line 68
    .line 69
    return-void
.end method

.method public B(II)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/common/collect/l;->c:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/xn80;->n(II)I

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/common/collect/l;->b:[I

    .line 7
    .line 8
    aput p2, p0, p1

    .line 9
    .line 10
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/common/collect/l;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public a()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/google/common/collect/l;->d:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/google/common/collect/l;->d:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/common/collect/l;->a:[Ljava/lang/Object;

    .line 8
    .line 9
    iget v1, p0, Lcom/google/common/collect/l;->c:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-static {v0, v3, v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/google/common/collect/l;->b:[I

    .line 17
    .line 18
    iget v1, p0, Lcom/google/common/collect/l;->c:I

    .line 19
    .line 20
    invoke-static {v0, v3, v1, v3}, Ljava/util/Arrays;->fill([IIII)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/google/common/collect/l;->e:[I

    .line 24
    .line 25
    const/4 v1, -0x1

    .line 26
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/google/common/collect/l;->f:[J

    .line 30
    .line 31
    const-wide/16 v1, -0x1

    .line 32
    .line 33
    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->fill([JJ)V

    .line 34
    .line 35
    .line 36
    iput v3, p0, Lcom/google/common/collect/l;->c:I

    .line 37
    .line 38
    return-void
.end method

.method public d(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/l;->f:[J

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    if-le p1, v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/google/common/collect/l;->y(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget v0, p0, Lcom/google/common/collect/l;->h:I

    .line 10
    .line 11
    if-lt p1, v0, :cond_1

    .line 12
    .line 13
    add-int/lit8 p1, p1, -0x1

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->highestOneBit(I)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    shl-int/lit8 p1, p1, 0x1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {p0, p1}, Lcom/google/common/collect/l;->A(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/common/collect/l;->c:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public f(Ljava/lang/Object;)I
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/l;->m(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, -0x1

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/l;->b:[I

    .line 11
    .line 12
    aget p0, p0, p1

    .line 13
    .line 14
    return p0
.end method

.method public g(I)Lcom/google/common/collect/k$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/collect/k$a<",
            "TK;>;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/common/collect/l;->c:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/xn80;->n(II)I

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/google/common/collect/l$a;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/l$a;-><init>(Lcom/google/common/collect/l;I)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public i(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TK;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/common/collect/l;->c:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/xn80;->n(II)I

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/common/collect/l;->a:[Ljava/lang/Object;

    .line 7
    .line 8
    aget-object p0, p0, p1

    .line 9
    .line 10
    return-object p0
.end method

.method public k(I)I
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/common/collect/l;->c:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/xn80;->n(II)I

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/common/collect/l;->b:[I

    .line 7
    .line 8
    aget p0, p0, p1

    .line 9
    .line 10
    return p0
.end method

.method public final l()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/l;->e:[I

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    add-int/lit8 p0, p0, -0x1

    .line 5
    .line 6
    return p0
.end method

.method public m(Ljava/lang/Object;)I
    .locals 5

    .line 1
    invoke-static {p1}, Ll/bzk;->d(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/google/common/collect/l;->e:[I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/common/collect/l;->l()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    and-int/2addr v2, v0

    .line 12
    aget v1, v1, v2

    .line 13
    .line 14
    :goto_0
    const/4 v2, -0x1

    .line 15
    if-eq v1, v2, :cond_1

    .line 16
    .line 17
    iget-object v2, p0, Lcom/google/common/collect/l;->f:[J

    .line 18
    .line 19
    aget-wide v3, v2, v1

    .line 20
    .line 21
    invoke-static {v3, v4}, Lcom/google/common/collect/l;->h(J)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-ne v2, v0, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Lcom/google/common/collect/l;->a:[Ljava/lang/Object;

    .line 28
    .line 29
    aget-object v2, v2, v1

    .line 30
    .line 31
    invoke-static {p1, v2}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    return v1

    .line 38
    :cond_0
    invoke-static {v3, v4}, Lcom/google/common/collect/l;->j(J)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return v2
.end method

.method public n(IF)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ltz p1, :cond_0

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
    const-string v3, "Initial capacity must be non-negative"

    .line 9
    .line 10
    invoke-static {v2, v3}, Ll/xn80;->e(ZLjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    cmpl-float v2, p2, v2

    .line 15
    .line 16
    if-lez v2, :cond_1

    .line 17
    .line 18
    move v0, v1

    .line 19
    :cond_1
    const-string v2, "Illegal load factor"

    .line 20
    .line 21
    invoke-static {v0, v2}, Ll/xn80;->e(ZLjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    float-to-double v2, p2

    .line 25
    invoke-static {p1, v2, v3}, Ll/bzk;->a(ID)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-static {v0}, Lcom/google/common/collect/l;->r(I)[I

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iput-object v2, p0, Lcom/google/common/collect/l;->e:[I

    .line 34
    .line 35
    iput p2, p0, Lcom/google/common/collect/l;->g:F

    .line 36
    .line 37
    new-array v2, p1, [Ljava/lang/Object;

    .line 38
    .line 39
    iput-object v2, p0, Lcom/google/common/collect/l;->a:[Ljava/lang/Object;

    .line 40
    .line 41
    new-array v2, p1, [I

    .line 42
    .line 43
    iput-object v2, p0, Lcom/google/common/collect/l;->b:[I

    .line 44
    .line 45
    invoke-static {p1}, Lcom/google/common/collect/l;->q(I)[J

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/google/common/collect/l;->f:[J

    .line 50
    .line 51
    int-to-float p1, v0

    .line 52
    mul-float/2addr p1, p2

    .line 53
    float-to-int p1, p1

    .line 54
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput p1, p0, Lcom/google/common/collect/l;->h:I

    .line 59
    .line 60
    return-void
.end method

.method public o(ILjava/lang/Object;II)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;II)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/l;->f:[J

    .line 2
    .line 3
    int-to-long v1, p4

    .line 4
    const/16 p4, 0x20

    .line 5
    .line 6
    shl-long/2addr v1, p4

    .line 7
    const-wide v3, 0xffffffffL

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    or-long/2addr v1, v3

    .line 13
    aput-wide v1, v0, p1

    .line 14
    .line 15
    iget-object p4, p0, Lcom/google/common/collect/l;->a:[Ljava/lang/Object;

    .line 16
    .line 17
    aput-object p2, p4, p1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/google/common/collect/l;->b:[I

    .line 20
    .line 21
    aput p3, p0, p1

    .line 22
    .line 23
    return-void
.end method

.method public p(I)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/google/common/collect/l;->C()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    iget-object v1, p0, Lcom/google/common/collect/l;->a:[Ljava/lang/Object;

    .line 8
    .line 9
    const-wide/16 v2, -0x1

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    const/4 v5, 0x0

    .line 13
    if-ge p1, v0, :cond_2

    .line 14
    .line 15
    aget-object v6, v1, v0

    .line 16
    .line 17
    aput-object v6, v1, p1

    .line 18
    .line 19
    iget-object v6, p0, Lcom/google/common/collect/l;->b:[I

    .line 20
    .line 21
    aget v7, v6, v0

    .line 22
    .line 23
    aput v7, v6, p1

    .line 24
    .line 25
    aput-object v5, v1, v0

    .line 26
    .line 27
    aput v4, v6, v0

    .line 28
    .line 29
    iget-object v1, p0, Lcom/google/common/collect/l;->f:[J

    .line 30
    .line 31
    aget-wide v4, v1, v0

    .line 32
    .line 33
    aput-wide v4, v1, p1

    .line 34
    .line 35
    aput-wide v2, v1, v0

    .line 36
    .line 37
    invoke-static {v4, v5}, Lcom/google/common/collect/l;->h(J)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {p0}, Lcom/google/common/collect/l;->l()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    and-int/2addr v1, v2

    .line 46
    iget-object v2, p0, Lcom/google/common/collect/l;->e:[I

    .line 47
    .line 48
    aget v3, v2, v1

    .line 49
    .line 50
    if-ne v3, v0, :cond_0

    .line 51
    .line 52
    aput p1, v2, v1

    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/google/common/collect/l;->f:[J

    .line 56
    .line 57
    aget-wide v4, v1, v3

    .line 58
    .line 59
    invoke-static {v4, v5}, Lcom/google/common/collect/l;->j(J)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-ne v1, v0, :cond_1

    .line 64
    .line 65
    iget-object p0, p0, Lcom/google/common/collect/l;->f:[J

    .line 66
    .line 67
    invoke-static {v4, v5, p1}, Lcom/google/common/collect/l;->D(JI)J

    .line 68
    .line 69
    .line 70
    move-result-wide v0

    .line 71
    aput-wide v0, p0, v3

    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    move v3, v1

    .line 75
    goto :goto_0

    .line 76
    :cond_2
    aput-object v5, v1, p1

    .line 77
    .line 78
    iget-object v0, p0, Lcom/google/common/collect/l;->b:[I

    .line 79
    .line 80
    aput v4, v0, p1

    .line 81
    .line 82
    iget-object p0, p0, Lcom/google/common/collect/l;->f:[J

    .line 83
    .line 84
    aput-wide v2, p0, p1

    .line 85
    .line 86
    return-void
.end method

.method public s(I)I
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    iget p0, p0, Lcom/google/common/collect/l;->c:I

    .line 4
    .line 5
    if-ge p1, p0, :cond_0

    .line 6
    .line 7
    return p1

    .line 8
    :cond_0
    const/4 p0, -0x1

    .line 9
    return p0
.end method

.method public t(II)I
    .locals 0

    .line 1
    add-int/lit8 p1, p1, -0x1

    return p1
.end method

.method public u(Ljava/lang/Object;I)I
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I)I"
        }
    .end annotation

    .line 1
    const-string v0, "count"

    .line 2
    .line 3
    invoke-static {p2, v0}, Ll/se5;->d(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/common/collect/l;->f:[J

    .line 7
    .line 8
    iget-object v1, p0, Lcom/google/common/collect/l;->a:[Ljava/lang/Object;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/google/common/collect/l;->b:[I

    .line 11
    .line 12
    invoke-static {p1}, Ll/bzk;->d(Ljava/lang/Object;)I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    invoke-virtual {p0}, Lcom/google/common/collect/l;->l()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    and-int/2addr v4, v3

    .line 21
    iget v5, p0, Lcom/google/common/collect/l;->c:I

    .line 22
    .line 23
    iget-object v6, p0, Lcom/google/common/collect/l;->e:[I

    .line 24
    .line 25
    aget v7, v6, v4

    .line 26
    .line 27
    const/4 v8, -0x1

    .line 28
    if-ne v7, v8, :cond_0

    .line 29
    .line 30
    aput v5, v6, v4

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    aget-wide v9, v0, v7

    .line 34
    .line 35
    invoke-static {v9, v10}, Lcom/google/common/collect/l;->h(J)I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-ne v4, v3, :cond_1

    .line 40
    .line 41
    aget-object v4, v1, v7

    .line 42
    .line 43
    invoke-static {p1, v4}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-eqz v4, :cond_1

    .line 48
    .line 49
    aget p0, v2, v7

    .line 50
    .line 51
    aput p2, v2, v7

    .line 52
    .line 53
    return p0

    .line 54
    :cond_1
    invoke-static {v9, v10}, Lcom/google/common/collect/l;->j(J)I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-ne v4, v8, :cond_4

    .line 59
    .line 60
    invoke-static {v9, v10, v5}, Lcom/google/common/collect/l;->D(JI)J

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    aput-wide v1, v0, v7

    .line 65
    .line 66
    :goto_1
    const v0, 0x7fffffff

    .line 67
    .line 68
    .line 69
    const/4 v1, 0x0

    .line 70
    if-eq v5, v0, :cond_3

    .line 71
    .line 72
    add-int/lit8 v0, v5, 0x1

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Lcom/google/common/collect/l;->z(I)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v5, p1, p2, v3}, Lcom/google/common/collect/l;->o(ILjava/lang/Object;II)V

    .line 78
    .line 79
    .line 80
    iput v0, p0, Lcom/google/common/collect/l;->c:I

    .line 81
    .line 82
    iget p1, p0, Lcom/google/common/collect/l;->h:I

    .line 83
    .line 84
    if-lt v5, p1, :cond_2

    .line 85
    .line 86
    iget-object p1, p0, Lcom/google/common/collect/l;->e:[I

    .line 87
    .line 88
    array-length p1, p1

    .line 89
    mul-int/lit8 p1, p1, 0x2

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Lcom/google/common/collect/l;->A(I)V

    .line 92
    .line 93
    .line 94
    :cond_2
    iget p1, p0, Lcom/google/common/collect/l;->d:I

    .line 95
    .line 96
    add-int/lit8 p1, p1, 0x1

    .line 97
    .line 98
    iput p1, p0, Lcom/google/common/collect/l;->d:I

    .line 99
    .line 100
    return v1

    .line 101
    :cond_3
    const-string p0, "Cannot contain more than Integer.MAX_VALUE elements!"

    .line 102
    .line 103
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return v1

    .line 107
    :cond_4
    move v7, v4

    .line 108
    goto :goto_0
.end method

.method public v(Ljava/lang/Object;)I
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bzk;->d(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/l;->w(Ljava/lang/Object;I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final w(Ljava/lang/Object;I)I
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/google/common/collect/l;->l()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/2addr v0, p2

    .line 6
    iget-object v1, p0, Lcom/google/common/collect/l;->e:[I

    .line 7
    .line 8
    aget v1, v1, v0

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, -0x1

    .line 12
    if-ne v1, v3, :cond_0

    .line 13
    .line 14
    return v2

    .line 15
    :cond_0
    move v4, v3

    .line 16
    :goto_0
    iget-object v5, p0, Lcom/google/common/collect/l;->f:[J

    .line 17
    .line 18
    aget-wide v6, v5, v1

    .line 19
    .line 20
    invoke-static {v6, v7}, Lcom/google/common/collect/l;->h(J)I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    if-ne v5, p2, :cond_2

    .line 25
    .line 26
    iget-object v5, p0, Lcom/google/common/collect/l;->a:[Ljava/lang/Object;

    .line 27
    .line 28
    aget-object v5, v5, v1

    .line 29
    .line 30
    invoke-static {p1, v5}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    if-eqz v5, :cond_2

    .line 35
    .line 36
    iget-object p1, p0, Lcom/google/common/collect/l;->b:[I

    .line 37
    .line 38
    aget p1, p1, v1

    .line 39
    .line 40
    if-ne v4, v3, :cond_1

    .line 41
    .line 42
    iget-object p2, p0, Lcom/google/common/collect/l;->e:[I

    .line 43
    .line 44
    iget-object v2, p0, Lcom/google/common/collect/l;->f:[J

    .line 45
    .line 46
    aget-wide v3, v2, v1

    .line 47
    .line 48
    invoke-static {v3, v4}, Lcom/google/common/collect/l;->j(J)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    aput v2, p2, v0

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget-object p2, p0, Lcom/google/common/collect/l;->f:[J

    .line 56
    .line 57
    aget-wide v2, p2, v4

    .line 58
    .line 59
    aget-wide v5, p2, v1

    .line 60
    .line 61
    invoke-static {v5, v6}, Lcom/google/common/collect/l;->j(J)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    invoke-static {v2, v3, v0}, Lcom/google/common/collect/l;->D(JI)J

    .line 66
    .line 67
    .line 68
    move-result-wide v2

    .line 69
    aput-wide v2, p2, v4

    .line 70
    .line 71
    :goto_1
    invoke-virtual {p0, v1}, Lcom/google/common/collect/l;->p(I)V

    .line 72
    .line 73
    .line 74
    iget p2, p0, Lcom/google/common/collect/l;->c:I

    .line 75
    .line 76
    add-int/lit8 p2, p2, -0x1

    .line 77
    .line 78
    iput p2, p0, Lcom/google/common/collect/l;->c:I

    .line 79
    .line 80
    iget p2, p0, Lcom/google/common/collect/l;->d:I

    .line 81
    .line 82
    add-int/lit8 p2, p2, 0x1

    .line 83
    .line 84
    iput p2, p0, Lcom/google/common/collect/l;->d:I

    .line 85
    .line 86
    return p1

    .line 87
    :cond_2
    iget-object v4, p0, Lcom/google/common/collect/l;->f:[J

    .line 88
    .line 89
    aget-wide v5, v4, v1

    .line 90
    .line 91
    invoke-static {v5, v6}, Lcom/google/common/collect/l;->j(J)I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    if-ne v4, v3, :cond_3

    .line 96
    .line 97
    return v2

    .line 98
    :cond_3
    move v8, v4

    .line 99
    move v4, v1

    .line 100
    move v1, v8

    .line 101
    goto :goto_0
.end method

.method public x(I)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/l;->a:[Ljava/lang/Object;

    .line 2
    .line 3
    aget-object v0, v0, p1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/google/common/collect/l;->f:[J

    .line 6
    .line 7
    aget-wide v2, v1, p1

    .line 8
    .line 9
    invoke-static {v2, v3}, Lcom/google/common/collect/l;->h(J)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, v0, p1}, Lcom/google/common/collect/l;->w(Ljava/lang/Object;I)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public y(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/l;->a:[Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/google/common/collect/l;->a:[Ljava/lang/Object;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/common/collect/l;->b:[I

    .line 10
    .line 11
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([II)[I

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/google/common/collect/l;->b:[I

    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/common/collect/l;->f:[J

    .line 18
    .line 19
    array-length v1, v0

    .line 20
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-le p1, v1, :cond_0

    .line 25
    .line 26
    const-wide/16 v2, -0x1

    .line 27
    .line 28
    invoke-static {v0, v1, p1, v2, v3}, Ljava/util/Arrays;->fill([JIIJ)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iput-object v0, p0, Lcom/google/common/collect/l;->f:[J

    .line 32
    .line 33
    return-void
.end method

.method public final z(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/l;->f:[J

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    if-le p1, v0, :cond_1

    .line 5
    .line 6
    ushr-int/lit8 p1, v0, 0x1

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    add-int/2addr p1, v0

    .line 14
    if-gez p1, :cond_0

    .line 15
    .line 16
    const p1, 0x7fffffff

    .line 17
    .line 18
    .line 19
    :cond_0
    if-eq p1, v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/google/common/collect/l;->y(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method
