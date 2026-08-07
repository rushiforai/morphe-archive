.class public final Ll/rsr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/sgr0;

.field public final b:Landroid/util/SparseArray;

.field public final c:Landroid/util/SparseArray;

.field public final d:Ll/b5x0;

.field public final e:[B

.field public f:I

.field public g:J

.field public h:J

.field public final i:Ll/qsr0;

.field public final j:Ll/qsr0;

.field public k:Z

.field public l:J

.field public m:J

.field public n:Z

.field public o:Z


# direct methods
.method public constructor <init>(Ll/sgr0;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rsr0;->a:Ll/sgr0;

    .line 5
    .line 6
    new-instance p1, Landroid/util/SparseArray;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/rsr0;->b:Landroid/util/SparseArray;

    .line 12
    .line 13
    new-instance p1, Landroid/util/SparseArray;

    .line 14
    .line 15
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/rsr0;->c:Landroid/util/SparseArray;

    .line 19
    .line 20
    new-instance p1, Ll/qsr0;

    .line 21
    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-direct {p1, p2}, Ll/qsr0;-><init>(Ll/psr0;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/rsr0;->i:Ll/qsr0;

    .line 27
    .line 28
    new-instance p1, Ll/qsr0;

    .line 29
    .line 30
    invoke-direct {p1, p2}, Ll/qsr0;-><init>(Ll/psr0;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/rsr0;->j:Ll/qsr0;

    .line 34
    .line 35
    const/16 p1, 0x80

    .line 36
    .line 37
    new-array p1, p1, [B

    .line 38
    .line 39
    iput-object p1, p0, Ll/rsr0;->e:[B

    .line 40
    .line 41
    new-instance p2, Ll/b5x0;

    .line 42
    .line 43
    const/4 p3, 0x0

    .line 44
    invoke-direct {p2, p1, p3, p3}, Ll/b5x0;-><init>([BII)V

    .line 45
    .line 46
    .line 47
    iput-object p2, p0, Ll/rsr0;->d:Ll/b5x0;

    .line 48
    .line 49
    iput-boolean p3, p0, Ll/rsr0;->k:Z

    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public final a(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/rsr0;->g:J

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Ll/rsr0;->g(I)V

    .line 5
    .line 6
    .line 7
    iput-boolean p1, p0, Ll/rsr0;->k:Z

    .line 8
    .line 9
    return-void
.end method

.method public final b(Ll/j1x0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rsr0;->c:Landroid/util/SparseArray;

    .line 2
    .line 3
    iget v0, p1, Ll/j1x0;->a:I

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final c(Ll/p2x0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rsr0;->b:Landroid/util/SparseArray;

    .line 2
    .line 3
    iget v0, p1, Ll/p2x0;->d:I

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/rsr0;->k:Z

    .line 3
    .line 4
    return-void
.end method

.method public final e(JIJZ)V
    .locals 0

    .line 1
    iput p3, p0, Ll/rsr0;->f:I

    .line 2
    .line 3
    iput-wide p4, p0, Ll/rsr0;->h:J

    .line 4
    .line 5
    iput-wide p1, p0, Ll/rsr0;->g:J

    .line 6
    .line 7
    iput-boolean p6, p0, Ll/rsr0;->o:Z

    .line 8
    .line 9
    return-void
.end method

.method public final f(JIZ)Z
    .locals 4

    .line 1
    iget v0, p0, Ll/rsr0;->f:I

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-eqz p4, :cond_1

    .line 11
    .line 12
    iget-boolean p4, p0, Ll/rsr0;->k:Z

    .line 13
    .line 14
    if-eqz p4, :cond_1

    .line 15
    .line 16
    iget-wide v0, p0, Ll/rsr0;->g:J

    .line 17
    .line 18
    sub-long/2addr p1, v0

    .line 19
    long-to-int p1, p1

    .line 20
    add-int/2addr p3, p1

    .line 21
    invoke-virtual {p0, p3}, Ll/rsr0;->g(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-wide p1, p0, Ll/rsr0;->g:J

    .line 25
    .line 26
    iput-wide p1, p0, Ll/rsr0;->l:J

    .line 27
    .line 28
    iget-wide p1, p0, Ll/rsr0;->h:J

    .line 29
    .line 30
    iput-wide p1, p0, Ll/rsr0;->m:J

    .line 31
    .line 32
    iput-boolean v2, p0, Ll/rsr0;->n:Z

    .line 33
    .line 34
    iput-boolean v3, p0, Ll/rsr0;->k:Z

    .line 35
    .line 36
    :goto_0
    iget-boolean p1, p0, Ll/rsr0;->o:Z

    .line 37
    .line 38
    iget-boolean p2, p0, Ll/rsr0;->n:Z

    .line 39
    .line 40
    iget p3, p0, Ll/rsr0;->f:I

    .line 41
    .line 42
    const/4 p4, 0x5

    .line 43
    if-eq p3, p4, :cond_2

    .line 44
    .line 45
    if-eqz p1, :cond_3

    .line 46
    .line 47
    if-ne p3, v3, :cond_3

    .line 48
    .line 49
    :cond_2
    move v2, v3

    .line 50
    :cond_3
    or-int p1, p2, v2

    .line 51
    .line 52
    iput-boolean p1, p0, Ll/rsr0;->n:Z

    .line 53
    .line 54
    return p1
.end method

.method public final g(I)V
    .locals 8

    .line 1
    iget-wide v1, p0, Ll/rsr0;->m:J

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
    iget-boolean v3, p0, Ll/rsr0;->n:Z

    .line 14
    .line 15
    iget-wide v4, p0, Ll/rsr0;->g:J

    .line 16
    .line 17
    iget-wide v6, p0, Ll/rsr0;->l:J

    .line 18
    .line 19
    sub-long/2addr v4, v6

    .line 20
    iget-object v0, p0, Ll/rsr0;->a:Ll/sgr0;

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
