.class public final Ll/ej3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bsf;
.implements Ll/p45;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ej3$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final j:Ll/p45$a;

.field public static final k:Ll/ll80;


# instance fields
.field public final a:Ll/zrf;

.field public final b:I

.field public final c:Lcom/google/android/exoplayer2/k;

.field public final d:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ll/ej3$a;",
            ">;"
        }
    .end annotation
.end field

.field public e:Z

.field public f:Ll/p45$b;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:J

.field public h:Ll/mke0;

.field public i:[Lcom/google/android/exoplayer2/k;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/dj3;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/dj3;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ej3;->j:Ll/p45$a;

    .line 7
    .line 8
    new-instance v0, Ll/ll80;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/ll80;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/ej3;->k:Ll/ll80;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Ll/zrf;ILcom/google/android/exoplayer2/k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ej3;->a:Ll/zrf;

    .line 5
    .line 6
    iput p2, p0, Ll/ej3;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/ej3;->c:Lcom/google/android/exoplayer2/k;

    .line 9
    .line 10
    new-instance p1, Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/ej3;->d:Landroid/util/SparseArray;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic f(ILcom/google/android/exoplayer2/k;ZLjava/util/List;Ll/qfj0;Ll/bf80;)Ll/p45;
    .locals 6

    .line 1
    iget-object p5, p1, Lcom/google/android/exoplayer2/k;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p5}, Ll/kb00;->r(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {p5}, Ll/kb00;->q(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p5

    .line 15
    if-eqz p5, :cond_1

    .line 16
    .line 17
    new-instance p2, Ll/rhx;

    .line 18
    .line 19
    const/4 p3, 0x1

    .line 20
    invoke-direct {p2, p3}, Ll/rhx;-><init>(I)V

    .line 21
    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_1
    if-eqz p2, :cond_2

    .line 25
    .line 26
    const/4 p2, 0x4

    .line 27
    :goto_0
    move v1, p2

    .line 28
    goto :goto_1

    .line 29
    :cond_2
    const/4 p2, 0x0

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    new-instance v0, Ll/d6j;

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    const/4 v3, 0x0

    .line 35
    move-object v4, p3

    .line 36
    move-object v5, p4

    .line 37
    invoke-direct/range {v0 .. v5}, Ll/d6j;-><init>(ILl/h0j0;Ll/yej0;Ljava/util/List;Ll/qfj0;)V

    .line 38
    .line 39
    .line 40
    move-object p2, v0

    .line 41
    :goto_2
    new-instance p3, Ll/ej3;

    .line 42
    .line 43
    invoke-direct {p3, p2, p0, p1}, Ll/ej3;-><init>(Ll/zrf;ILcom/google/android/exoplayer2/k;)V

    .line 44
    .line 45
    .line 46
    return-object p3
.end method


# virtual methods
.method public a(Ll/asf;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ej3;->a:Ll/zrf;

    .line 2
    .line 3
    sget-object v0, Ll/ej3;->k:Ll/ll80;

    .line 4
    .line 5
    invoke-interface {p0, p1, v0}, Ll/zrf;->h(Ll/asf;Ll/ll80;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 p1, 0x0

    .line 10
    const/4 v0, 0x1

    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    move v1, v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v1, p1

    .line 16
    :goto_0
    invoke-static {v1}, Ll/w11;->g(Z)V

    .line 17
    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    return p1
.end method

.method public b(II)Ll/qfj0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ej3;->d:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/ej3$a;

    .line 8
    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/ej3;->i:[Lcom/google/android/exoplayer2/k;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/ej3$a;

    .line 22
    .line 23
    iget v1, p0, Ll/ej3;->b:I

    .line 24
    .line 25
    if-ne p2, v1, :cond_1

    .line 26
    .line 27
    iget-object v1, p0, Ll/ej3;->c:Lcom/google/android/exoplayer2/k;

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const/4 v1, 0x0

    .line 31
    :goto_1
    invoke-direct {v0, p1, p2, v1}, Ll/ej3$a;-><init>(IILcom/google/android/exoplayer2/k;)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Ll/ej3;->f:Ll/p45$b;

    .line 35
    .line 36
    iget-wide v1, p0, Ll/ej3;->g:J

    .line 37
    .line 38
    invoke-virtual {v0, p2, v1, v2}, Ll/ej3$a;->g(Ll/p45$b;J)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/ej3;->d:Landroid/util/SparseArray;

    .line 42
    .line 43
    invoke-virtual {p0, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-object v0
.end method

.method public c(Ll/p45$b;JJ)V
    .locals 6
    .param p1    # Ll/p45$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/ej3;->f:Ll/p45$b;

    .line 2
    .line 3
    iput-wide p4, p0, Ll/ej3;->g:J

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/ej3;->e:Z

    .line 6
    .line 7
    iget-object v1, p0, Ll/ej3;->a:Ll/zrf;

    .line 8
    .line 9
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    const-wide/16 v4, 0x0

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-interface {v1, p0}, Ll/zrf;->b(Ll/bsf;)V

    .line 19
    .line 20
    .line 21
    cmp-long p1, p2, v2

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Ll/ej3;->a:Ll/zrf;

    .line 26
    .line 27
    invoke-interface {p1, v4, v5, p2, p3}, Ll/zrf;->a(JJ)V

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, Ll/ej3;->e:Z

    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    cmp-long v0, p2, v2

    .line 35
    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    move-wide p2, v4

    .line 39
    :cond_2
    invoke-interface {v1, v4, v5, p2, p3}, Ll/zrf;->a(JJ)V

    .line 40
    .line 41
    .line 42
    const/4 p2, 0x0

    .line 43
    :goto_0
    iget-object p3, p0, Ll/ej3;->d:Landroid/util/SparseArray;

    .line 44
    .line 45
    invoke-virtual {p3}, Landroid/util/SparseArray;->size()I

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    if-ge p2, p3, :cond_3

    .line 50
    .line 51
    iget-object p3, p0, Ll/ej3;->d:Landroid/util/SparseArray;

    .line 52
    .line 53
    invoke-virtual {p3, p2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    check-cast p3, Ll/ej3$a;

    .line 58
    .line 59
    invoke-virtual {p3, p1, p4, p5}, Ll/ej3$a;->g(Ll/p45$b;J)V

    .line 60
    .line 61
    .line 62
    add-int/lit8 p2, p2, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    return-void
.end method

.method public d()Ll/r45;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ej3;->h:Ll/mke0;

    .line 2
    .line 3
    instance-of v0, p0, Ll/r45;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/r45;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public e()[Lcom/google/android/exoplayer2/k;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ej3;->i:[Lcom/google/android/exoplayer2/k;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ll/mke0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ej3;->h:Ll/mke0;

    .line 2
    .line 3
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ej3;->d:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-array v0, v0, [Lcom/google/android/exoplayer2/k;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    iget-object v2, p0, Ll/ej3;->d:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-ge v1, v2, :cond_0

    .line 17
    .line 18
    iget-object v2, p0, Ll/ej3;->d:Landroid/util/SparseArray;

    .line 19
    .line 20
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ll/ej3$a;

    .line 25
    .line 26
    iget-object v2, v2, Ll/ej3$a;->e:Lcom/google/android/exoplayer2/k;

    .line 27
    .line 28
    invoke-static {v2}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/google/android/exoplayer2/k;

    .line 33
    .line 34
    aput-object v2, v0, v1

    .line 35
    .line 36
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iput-object v0, p0, Ll/ej3;->i:[Lcom/google/android/exoplayer2/k;

    .line 40
    .line 41
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ej3;->a:Ll/zrf;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/zrf;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
