.class public Ll/z850;
.super Lcom/google/common/collect/l;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/l<",
        "TK;>;"
    }
.end annotation


# instance fields
.field public transient i:[J

.field public transient j:I

.field public transient k:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/z850;-><init>(IF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(IF)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/l;-><init>(IF)V

    return-void
.end method


# virtual methods
.method public final E(I)I
    .locals 2

    .line 1
    iget-object p0, p0, Ll/z850;->i:[J

    .line 2
    .line 3
    aget-wide v0, p0, p1

    .line 4
    .line 5
    const/16 p0, 0x20

    .line 6
    .line 7
    ushr-long p0, v0, p0

    .line 8
    .line 9
    long-to-int p0, p0

    .line 10
    return p0
.end method

.method public final F(I)I
    .locals 2

    .line 1
    iget-object p0, p0, Ll/z850;->i:[J

    .line 2
    .line 3
    aget-wide v0, p0, p1

    .line 4
    .line 5
    long-to-int p0, v0

    .line 6
    return p0
.end method

.method public final G(II)V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/z850;->i:[J

    .line 2
    .line 3
    aget-wide v0, p0, p1

    .line 4
    .line 5
    const-wide v2, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v0, v2

    .line 11
    int-to-long v2, p2

    .line 12
    const/16 p2, 0x20

    .line 13
    .line 14
    shl-long/2addr v2, p2

    .line 15
    or-long/2addr v0, v2

    .line 16
    aput-wide v0, p0, p1

    .line 17
    .line 18
    return-void
.end method

.method public final H(II)V
    .locals 1

    .line 1
    const/4 v0, -0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iput p2, p0, Ll/z850;->j:I

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/z850;->I(II)V

    .line 8
    .line 9
    .line 10
    :goto_0
    if-ne p2, v0, :cond_1

    .line 11
    .line 12
    iput p1, p0, Ll/z850;->k:I

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    invoke-virtual {p0, p2, p1}, Ll/z850;->G(II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final I(II)V
    .locals 6

    .line 1
    iget-object p0, p0, Ll/z850;->i:[J

    .line 2
    .line 3
    aget-wide v0, p0, p1

    .line 4
    .line 5
    const-wide v2, -0x100000000L

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v0, v2

    .line 11
    int-to-long v2, p2

    .line 12
    const-wide v4, 0xffffffffL

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    and-long/2addr v2, v4

    .line 18
    or-long/2addr v0, v2

    .line 19
    aput-wide v0, p0, p1

    .line 20
    .line 21
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/google/common/collect/l;->a()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x2

    .line 5
    iput v0, p0, Ll/z850;->j:I

    .line 6
    .line 7
    iput v0, p0, Ll/z850;->k:I

    .line 8
    .line 9
    return-void
.end method

.method public e()I
    .locals 1

    .line 1
    iget p0, p0, Ll/z850;->j:I

    .line 2
    .line 3
    const/4 v0, -0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, -0x1

    .line 7
    :cond_0
    return p0
.end method

.method public n(IF)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Lcom/google/common/collect/l;->n(IF)V

    .line 2
    .line 3
    .line 4
    const/4 p2, -0x2

    .line 5
    iput p2, p0, Ll/z850;->j:I

    .line 6
    .line 7
    iput p2, p0, Ll/z850;->k:I

    .line 8
    .line 9
    new-array p1, p1, [J

    .line 10
    .line 11
    iput-object p1, p0, Ll/z850;->i:[J

    .line 12
    .line 13
    const-wide/16 v0, -0x1

    .line 14
    .line 15
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->fill([JJ)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public o(ILjava/lang/Object;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;II)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/google/common/collect/l;->o(ILjava/lang/Object;II)V

    .line 2
    .line 3
    .line 4
    iget p2, p0, Ll/z850;->k:I

    .line 5
    .line 6
    invoke-virtual {p0, p2, p1}, Ll/z850;->H(II)V

    .line 7
    .line 8
    .line 9
    const/4 p2, -0x2

    .line 10
    invoke-virtual {p0, p1, p2}, Ll/z850;->H(II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public p(I)V
    .locals 3

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
    invoke-virtual {p0, p1}, Ll/z850;->E(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p0, p1}, Ll/z850;->F(I)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {p0, v1, v2}, Ll/z850;->H(II)V

    .line 16
    .line 17
    .line 18
    if-ge p1, v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/z850;->E(I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p0, v1, p1}, Ll/z850;->H(II)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/z850;->F(I)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0, p1, v0}, Ll/z850;->H(II)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-super {p0, p1}, Lcom/google/common/collect/l;->p(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public s(I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z850;->F(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, -0x2

    .line 6
    if-ne p0, p1, :cond_0

    .line 7
    .line 8
    const/4 p0, -0x1

    .line 9
    :cond_0
    return p0
.end method

.method public t(II)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/common/collect/l;->C()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    return p2

    .line 8
    :cond_0
    return p1
.end method

.method public y(I)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/google/common/collect/l;->y(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/z850;->i:[J

    .line 5
    .line 6
    array-length v1, v0

    .line 7
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/z850;->i:[J

    .line 12
    .line 13
    const-wide/16 v2, -0x1

    .line 14
    .line 15
    invoke-static {v0, v1, p1, v2, v3}, Ljava/util/Arrays;->fill([JIIJ)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
