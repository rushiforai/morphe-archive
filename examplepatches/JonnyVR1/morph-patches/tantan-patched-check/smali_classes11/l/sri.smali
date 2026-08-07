.class public final Ll/sri;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zrf;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final o:Ll/esf;


# instance fields
.field public final a:[B

.field public final b:Ll/ig60;

.field public final c:Z

.field public final d:Ll/tri$a;

.field public e:Ll/bsf;

.field public f:Ll/qfj0;

.field public g:I

.field public h:Lcom/google/android/exoplayer2/metadata/Metadata;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Ll/xri;

.field public j:I

.field public k:I

.field public l:Ll/qri;

.field public m:I

.field public n:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/rri;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/rri;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/sri;->o:Ll/esf;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, v0}, Ll/sri;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x2a

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    iput-object v0, p0, Ll/sri;->a:[B

    .line 9
    .line 10
    new-instance v0, Ll/ig60;

    .line 11
    .line 12
    const v1, 0x8000

    .line 13
    .line 14
    .line 15
    new-array v1, v1, [B

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-direct {v0, v1, v2}, Ll/ig60;-><init>([BI)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/sri;->b:Ll/ig60;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    and-int/2addr p1, v0

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v0, v2

    .line 29
    :goto_0
    iput-boolean v0, p0, Ll/sri;->c:Z

    .line 30
    .line 31
    new-instance p1, Ll/tri$a;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/tri$a;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/sri;->d:Ll/tri$a;

    .line 37
    .line 38
    iput v2, p0, Ll/sri;->g:I

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic c()[Ll/zrf;
    .locals 3

    .line 1
    new-instance v0, Ll/sri;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/sri;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    new-array v1, v1, [Ll/zrf;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aput-object v0, v1, v2

    .line 11
    .line 12
    return-object v1
.end method


# virtual methods
.method public a(JJ)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p1, p1, v0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iput p2, p0, Ll/sri;->g:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p1, p0, Ll/sri;->l:Ll/qri;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1, p3, p4}, Ll/ey2;->h(J)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    cmp-long p1, p3, v0

    .line 19
    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_2
    const-wide/16 v0, -0x1

    .line 24
    .line 25
    :goto_1
    iput-wide v0, p0, Ll/sri;->n:J

    .line 26
    .line 27
    iput p2, p0, Ll/sri;->m:I

    .line 28
    .line 29
    iget-object p0, p0, Ll/sri;->b:Ll/ig60;

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Ll/ig60;->Q(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public b(Ll/bsf;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/sri;->e:Ll/bsf;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-interface {p1, v0, v1}, Ll/bsf;->b(II)Ll/qfj0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/sri;->f:Ll/qfj0;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/bsf;->l()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final d(Ll/ig60;Z)J
    .locals 4

    .line 1
    iget-object v0, p0, Ll/sri;->i:Ll/xri;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    :goto_0
    invoke-virtual {p1}, Ll/ig60;->g()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    add-int/lit8 v1, v1, -0x10

    .line 15
    .line 16
    if-gt v0, v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/sri;->i:Ll/xri;

    .line 22
    .line 23
    iget v2, p0, Ll/sri;->k:I

    .line 24
    .line 25
    iget-object v3, p0, Ll/sri;->d:Ll/tri$a;

    .line 26
    .line 27
    invoke-static {p1, v1, v2, v3}, Ll/tri;->d(Ll/ig60;Ll/xri;ILl/tri$a;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/sri;->d:Ll/tri$a;

    .line 37
    .line 38
    iget-wide p0, p0, Ll/tri$a;->a:J

    .line 39
    .line 40
    return-wide p0

    .line 41
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    if-eqz p2, :cond_5

    .line 45
    .line 46
    :goto_1
    invoke-virtual {p1}, Ll/ig60;->g()I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    iget v1, p0, Ll/sri;->j:I

    .line 51
    .line 52
    sub-int/2addr p2, v1

    .line 53
    if-gt v0, p2, :cond_4

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 56
    .line 57
    .line 58
    const/4 p2, 0x0

    .line 59
    :try_start_0
    iget-object v1, p0, Ll/sri;->i:Ll/xri;

    .line 60
    .line 61
    iget v2, p0, Ll/sri;->k:I

    .line 62
    .line 63
    iget-object v3, p0, Ll/sri;->d:Ll/tri$a;

    .line 64
    .line 65
    invoke-static {p1, v1, v2, v3}, Ll/tri;->d(Ll/ig60;Ll/xri;ILl/tri$a;)Z

    .line 66
    .line 67
    .line 68
    move-result v1
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    goto :goto_2

    .line 70
    :catch_0
    move v1, p2

    .line 71
    :goto_2
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-virtual {p1}, Ll/ig60;->g()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-le v2, v3, :cond_2

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_2
    move p2, v1

    .line 83
    :goto_3
    if-eqz p2, :cond_3

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/sri;->d:Ll/tri$a;

    .line 89
    .line 90
    iget-wide p0, p0, Ll/tri$a;->a:J

    .line 91
    .line 92
    return-wide p0

    .line 93
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_4
    invoke-virtual {p1}, Ll/ig60;->g()I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    invoke-virtual {p1, p0}, Ll/ig60;->U(I)V

    .line 101
    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_5
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 105
    .line 106
    .line 107
    :goto_4
    const-wide/16 p0, -0x1

    .line 108
    .line 109
    return-wide p0
.end method

.method public final e(Ll/asf;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/uri;->b(Ll/asf;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Ll/sri;->k:I

    .line 6
    .line 7
    iget-object v0, p0, Ll/sri;->e:Ll/bsf;

    .line 8
    .line 9
    invoke-static {v0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/bsf;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-interface {p1}, Ll/asf;->getLength()J

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    invoke-virtual {p0, v1, v2, v3, v4}, Ll/sri;->g(JJ)Ll/mke0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {v0, p1}, Ll/bsf;->k(Ll/mke0;)V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x5

    .line 31
    iput p1, p0, Ll/sri;->g:I

    .line 32
    .line 33
    return-void
.end method

.method public f(Ll/asf;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p0}, Ll/uri;->c(Ll/asf;Z)Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 3
    .line 4
    .line 5
    invoke-static {p1}, Ll/uri;->a(Ll/asf;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final g(JJ)Ll/mke0;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/sri;->i:Ll/xri;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v2, p0, Ll/sri;->i:Ll/xri;

    .line 7
    .line 8
    iget-object v0, v2, Ll/xri;->k:Ll/xri$a;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance p0, Ll/wri;

    .line 13
    .line 14
    invoke-direct {p0, v2, p1, p2}, Ll/wri;-><init>(Ll/xri;J)V

    .line 15
    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const-wide/16 v0, -0x1

    .line 19
    .line 20
    cmp-long v0, p3, v0

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-wide v0, v2, Ll/xri;->j:J

    .line 25
    .line 26
    const-wide/16 v3, 0x0

    .line 27
    .line 28
    cmp-long v0, v0, v3

    .line 29
    .line 30
    if-lez v0, :cond_1

    .line 31
    .line 32
    new-instance v1, Ll/qri;

    .line 33
    .line 34
    iget v3, p0, Ll/sri;->k:I

    .line 35
    .line 36
    move-wide v4, p1

    .line 37
    move-wide v6, p3

    .line 38
    invoke-direct/range {v1 .. v7}, Ll/qri;-><init>(Ll/xri;IJJ)V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Ll/sri;->l:Ll/qri;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/ey2;->b()Ll/mke0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_1
    new-instance p0, Ll/mke0$b;

    .line 49
    .line 50
    invoke-virtual {v2}, Ll/xri;->f()J

    .line 51
    .line 52
    .line 53
    move-result-wide p1

    .line 54
    invoke-direct {p0, p1, p2}, Ll/mke0$b;-><init>(J)V

    .line 55
    .line 56
    .line 57
    return-object p0
.end method

.method public h(Ll/asf;Ll/ll80;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/sri;->g:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_5

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eq v0, v2, :cond_4

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-eq v0, v2, :cond_3

    .line 11
    .line 12
    const/4 v2, 0x3

    .line 13
    if-eq v0, v2, :cond_2

    .line 14
    .line 15
    const/4 v2, 0x4

    .line 16
    if-eq v0, v2, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x5

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ll/sri;->k(Ll/asf;Ll/ll80;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return p0

    .line 31
    :cond_1
    invoke-virtual {p0, p1}, Ll/sri;->e(Ll/asf;)V

    .line 32
    .line 33
    .line 34
    return v1

    .line 35
    :cond_2
    invoke-virtual {p0, p1}, Ll/sri;->m(Ll/asf;)V

    .line 36
    .line 37
    .line 38
    return v1

    .line 39
    :cond_3
    invoke-virtual {p0, p1}, Ll/sri;->n(Ll/asf;)V

    .line 40
    .line 41
    .line 42
    return v1

    .line 43
    :cond_4
    invoke-virtual {p0, p1}, Ll/sri;->i(Ll/asf;)V

    .line 44
    .line 45
    .line 46
    return v1

    .line 47
    :cond_5
    invoke-virtual {p0, p1}, Ll/sri;->l(Ll/asf;)V

    .line 48
    .line 49
    .line 50
    return v1
.end method

.method public final i(Ll/asf;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sri;->a:[B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    array-length v2, v0

    .line 5
    invoke-interface {p1, v0, v1, v2}, Ll/asf;->f([BII)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ll/asf;->h()V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x2

    .line 12
    iput p1, p0, Ll/sri;->g:I

    .line 13
    .line 14
    return-void
.end method

.method public final j()V
    .locals 11

    .line 1
    iget-wide v0, p0, Ll/sri;->n:J

    .line 2
    .line 3
    const-wide/32 v2, 0xf4240

    .line 4
    .line 5
    .line 6
    mul-long/2addr v0, v2

    .line 7
    iget-object v2, p0, Ll/sri;->i:Ll/xri;

    .line 8
    .line 9
    invoke-static {v2}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Ll/xri;

    .line 14
    .line 15
    iget v2, v2, Ll/xri;->e:I

    .line 16
    .line 17
    int-to-long v2, v2

    .line 18
    div-long v5, v0, v2

    .line 19
    .line 20
    iget-object v0, p0, Ll/sri;->f:Ll/qfj0;

    .line 21
    .line 22
    invoke-static {v0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    move-object v4, v0

    .line 27
    check-cast v4, Ll/qfj0;

    .line 28
    .line 29
    iget v8, p0, Ll/sri;->m:I

    .line 30
    .line 31
    const/4 v9, 0x0

    .line 32
    const/4 v10, 0x0

    .line 33
    const/4 v7, 0x1

    .line 34
    invoke-interface/range {v4 .. v10}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final k(Ll/asf;Ll/ll80;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sri;->f:Ll/qfj0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sri;->i:Ll/xri;

    .line 7
    .line 8
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/sri;->l:Ll/qri;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/ey2;->d()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/sri;->l:Ll/qri;

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Ll/ey2;->c(Ll/asf;Ll/ll80;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    iget-wide v0, p0, Ll/sri;->n:J

    .line 29
    .line 30
    const-wide/16 v2, -0x1

    .line 31
    .line 32
    cmp-long p2, v0, v2

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    if-nez p2, :cond_1

    .line 36
    .line 37
    iget-object p2, p0, Ll/sri;->i:Ll/xri;

    .line 38
    .line 39
    invoke-static {p1, p2}, Ll/tri;->i(Ll/asf;Ll/xri;)J

    .line 40
    .line 41
    .line 42
    move-result-wide p1

    .line 43
    iput-wide p1, p0, Ll/sri;->n:J

    .line 44
    .line 45
    return v0

    .line 46
    :cond_1
    iget-object p2, p0, Ll/sri;->b:Ll/ig60;

    .line 47
    .line 48
    invoke-virtual {p2}, Ll/ig60;->g()I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    const v1, 0x8000

    .line 53
    .line 54
    .line 55
    if-ge p2, v1, :cond_4

    .line 56
    .line 57
    iget-object v4, p0, Ll/sri;->b:Ll/ig60;

    .line 58
    .line 59
    invoke-virtual {v4}, Ll/ig60;->e()[B

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    sub-int/2addr v1, p2

    .line 64
    invoke-interface {p1, v4, p2, v1}, Ll/asf;->read([BII)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    const/4 v1, -0x1

    .line 69
    if-ne p1, v1, :cond_2

    .line 70
    .line 71
    const/4 v4, 0x1

    .line 72
    goto :goto_0

    .line 73
    :cond_2
    move v4, v0

    .line 74
    :goto_0
    iget-object v5, p0, Ll/sri;->b:Ll/ig60;

    .line 75
    .line 76
    if-nez v4, :cond_3

    .line 77
    .line 78
    add-int/2addr p2, p1

    .line 79
    invoke-virtual {v5, p2}, Ll/ig60;->T(I)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    invoke-virtual {v5}, Ll/ig60;->a()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_5

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/sri;->j()V

    .line 90
    .line 91
    .line 92
    return v1

    .line 93
    :cond_4
    move v4, v0

    .line 94
    :cond_5
    :goto_1
    iget-object p1, p0, Ll/sri;->b:Ll/ig60;

    .line 95
    .line 96
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    iget p2, p0, Ll/sri;->m:I

    .line 101
    .line 102
    iget v1, p0, Ll/sri;->j:I

    .line 103
    .line 104
    if-ge p2, v1, :cond_6

    .line 105
    .line 106
    iget-object v5, p0, Ll/sri;->b:Ll/ig60;

    .line 107
    .line 108
    sub-int/2addr v1, p2

    .line 109
    invoke-virtual {v5}, Ll/ig60;->a()I

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    invoke-virtual {v5, p2}, Ll/ig60;->V(I)V

    .line 118
    .line 119
    .line 120
    :cond_6
    iget-object p2, p0, Ll/sri;->b:Ll/ig60;

    .line 121
    .line 122
    invoke-virtual {p0, p2, v4}, Ll/sri;->d(Ll/ig60;Z)J

    .line 123
    .line 124
    .line 125
    move-result-wide v4

    .line 126
    iget-object p2, p0, Ll/sri;->b:Ll/ig60;

    .line 127
    .line 128
    invoke-virtual {p2}, Ll/ig60;->f()I

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    sub-int/2addr p2, p1

    .line 133
    iget-object v1, p0, Ll/sri;->b:Ll/ig60;

    .line 134
    .line 135
    invoke-virtual {v1, p1}, Ll/ig60;->U(I)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/sri;->f:Ll/qfj0;

    .line 139
    .line 140
    iget-object v1, p0, Ll/sri;->b:Ll/ig60;

    .line 141
    .line 142
    invoke-interface {p1, v1, p2}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 143
    .line 144
    .line 145
    iget p1, p0, Ll/sri;->m:I

    .line 146
    .line 147
    add-int/2addr p1, p2

    .line 148
    iput p1, p0, Ll/sri;->m:I

    .line 149
    .line 150
    cmp-long p1, v4, v2

    .line 151
    .line 152
    if-eqz p1, :cond_7

    .line 153
    .line 154
    invoke-virtual {p0}, Ll/sri;->j()V

    .line 155
    .line 156
    .line 157
    iput v0, p0, Ll/sri;->m:I

    .line 158
    .line 159
    iput-wide v4, p0, Ll/sri;->n:J

    .line 160
    .line 161
    :cond_7
    iget-object p1, p0, Ll/sri;->b:Ll/ig60;

    .line 162
    .line 163
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    const/16 p2, 0x10

    .line 168
    .line 169
    if-ge p1, p2, :cond_8

    .line 170
    .line 171
    iget-object p1, p0, Ll/sri;->b:Ll/ig60;

    .line 172
    .line 173
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    iget-object p2, p0, Ll/sri;->b:Ll/ig60;

    .line 178
    .line 179
    invoke-virtual {p2}, Ll/ig60;->e()[B

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    iget-object v1, p0, Ll/sri;->b:Ll/ig60;

    .line 184
    .line 185
    invoke-virtual {v1}, Ll/ig60;->f()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    iget-object v2, p0, Ll/sri;->b:Ll/ig60;

    .line 190
    .line 191
    invoke-virtual {v2}, Ll/ig60;->e()[B

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-static {p2, v1, v2, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 196
    .line 197
    .line 198
    iget-object p2, p0, Ll/sri;->b:Ll/ig60;

    .line 199
    .line 200
    invoke-virtual {p2, v0}, Ll/ig60;->U(I)V

    .line 201
    .line 202
    .line 203
    iget-object p0, p0, Ll/sri;->b:Ll/ig60;

    .line 204
    .line 205
    invoke-virtual {p0, p1}, Ll/ig60;->T(I)V

    .line 206
    .line 207
    .line 208
    :cond_8
    return v0
.end method

.method public final l(Ll/asf;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/sri;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr v0, v1

    .line 5
    invoke-static {p1, v0}, Ll/uri;->d(Ll/asf;Z)Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/sri;->h:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 10
    .line 11
    iput v1, p0, Ll/sri;->g:I

    .line 12
    .line 13
    return-void
.end method

.method public final m(Ll/asf;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/uri$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/sri;->i:Ll/xri;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/uri$a;-><init>(Ll/xri;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/uri;->e(Ll/asf;Ll/uri$a;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object v2, v0, Ll/uri$a;->a:Ll/xri;

    .line 16
    .line 17
    invoke-static {v2}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Ll/xri;

    .line 22
    .line 23
    iput-object v2, p0, Ll/sri;->i:Ll/xri;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p1, p0, Ll/sri;->i:Ll/xri;

    .line 27
    .line 28
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/sri;->i:Ll/xri;

    .line 32
    .line 33
    iget p1, p1, Ll/xri;->c:I

    .line 34
    .line 35
    const/4 v0, 0x6

    .line 36
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iput p1, p0, Ll/sri;->j:I

    .line 41
    .line 42
    iget-object p1, p0, Ll/sri;->f:Ll/qfj0;

    .line 43
    .line 44
    invoke-static {p1}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Ll/qfj0;

    .line 49
    .line 50
    iget-object v0, p0, Ll/sri;->i:Ll/xri;

    .line 51
    .line 52
    iget-object v1, p0, Ll/sri;->a:[B

    .line 53
    .line 54
    iget-object v2, p0, Ll/sri;->h:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Ll/xri;->g([BLcom/google/android/exoplayer2/metadata/Metadata;)Lcom/google/android/exoplayer2/k;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {p1, v0}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 61
    .line 62
    .line 63
    const/4 p1, 0x4

    .line 64
    iput p1, p0, Ll/sri;->g:I

    .line 65
    .line 66
    return-void
.end method

.method public final n(Ll/asf;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/uri;->i(Ll/asf;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x3

    .line 5
    iput p1, p0, Ll/sri;->g:I

    .line 6
    .line 7
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method
