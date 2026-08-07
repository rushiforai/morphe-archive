.class public final Ll/xrr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yrr0;


# instance fields
.field public final a:Ljava/util/List;

.field public final b:[Ll/sgr0;

.field public c:Z

.field public d:I

.field public e:I

.field public f:J


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xrr0;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    new-array p1, p1, [Ll/sgr0;

    .line 11
    .line 12
    iput-object p1, p0, Ll/xrr0;->b:[Ll/sgr0;

    .line 13
    .line 14
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    iput-wide v0, p0, Ll/xrr0;->f:J

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 10

    .line 1
    iget-boolean p1, p0, Ll/xrr0;->c:Z

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    iget-wide v0, p0, Ll/xrr0;->f:J

    .line 6
    .line 7
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmp-long p1, v0, v2

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move p1, v0

    .line 20
    :goto_0
    invoke-static {p1}, Ll/lev0;->f(Z)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/xrr0;->b:[Ll/sgr0;

    .line 24
    .line 25
    move v1, v0

    .line 26
    :goto_1
    array-length v2, p1

    .line 27
    if-ge v1, v2, :cond_1

    .line 28
    .line 29
    aget-object v3, p1, v1

    .line 30
    .line 31
    iget-wide v4, p0, Ll/xrr0;->f:J

    .line 32
    .line 33
    iget v7, p0, Ll/xrr0;->e:I

    .line 34
    .line 35
    const/4 v8, 0x0

    .line 36
    const/4 v9, 0x0

    .line 37
    const/4 v6, 0x1

    .line 38
    invoke-interface/range {v3 .. v9}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 39
    .line 40
    .line 41
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    iput-boolean v0, p0, Ll/xrr0;->c:Z

    .line 45
    .line 46
    :cond_2
    return-void
.end method

.method public final b(Ll/bgw0;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/xrr0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget v0, p0, Ll/xrr0;->d:I

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const/16 v0, 0x20

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Ll/xrr0;->e(Ll/bgw0;I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_3

    .line 17
    .line 18
    :cond_0
    iget v0, p0, Ll/xrr0;->d:I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    const/4 v2, 0x1

    .line 22
    if-ne v0, v2, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p1, v1}, Ll/xrr0;->e(Ll/bgw0;I)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    :cond_1
    invoke-virtual {p1}, Ll/bgw0;->s()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    iget-object v3, p0, Ll/xrr0;->b:[Ll/sgr0;

    .line 39
    .line 40
    :goto_0
    array-length v4, v3

    .line 41
    if-ge v1, v4, :cond_2

    .line 42
    .line 43
    aget-object v4, v3, v1

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ll/bgw0;->k(I)V

    .line 46
    .line 47
    .line 48
    invoke-interface {v4, p1, v2}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 49
    .line 50
    .line 51
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget p1, p0, Ll/xrr0;->e:I

    .line 55
    .line 56
    add-int/2addr p1, v2

    .line 57
    iput p1, p0, Ll/xrr0;->e:I

    .line 58
    .line 59
    :cond_3
    return-void
.end method

.method public final c(JI)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x4

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 p3, 0x1

    .line 7
    iput-boolean p3, p0, Ll/xrr0;->c:Z

    .line 8
    .line 9
    iput-wide p1, p0, Ll/xrr0;->f:J

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Ll/xrr0;->e:I

    .line 13
    .line 14
    const/4 p1, 0x2

    .line 15
    iput p1, p0, Ll/xrr0;->d:I

    .line 16
    .line 17
    return-void
.end method

.method public final d(Ll/ser0;Ll/gur0;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/xrr0;->b:[Ll/sgr0;

    .line 3
    .line 4
    array-length v1, v1

    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/xrr0;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ll/dur0;

    .line 14
    .line 15
    invoke-virtual {p2}, Ll/gur0;->c()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2}, Ll/gur0;->a()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x3

    .line 23
    invoke-interface {p1, v2, v3}, Ll/ser0;->i(II)Ll/sgr0;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    new-instance v3, Ll/znr0;

    .line 28
    .line 29
    invoke-direct {v3}, Ll/znr0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Ll/gur0;->b()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v3, v4}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 37
    .line 38
    .line 39
    const-string v4, "application/dvbsubs"

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 42
    .line 43
    .line 44
    iget-object v4, v1, Ll/dur0;->b:[B

    .line 45
    .line 46
    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v3, v4}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 51
    .line 52
    .line 53
    iget-object v1, v1, Ll/dur0;->a:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v3, v1}, Ll/znr0;->n(Ljava/lang/String;)Ll/znr0;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ll/znr0;->D()Ll/sqr0;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-interface {v2, v1}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/xrr0;->b:[Ll/sgr0;

    .line 66
    .line 67
    aput-object v2, v1, v0

    .line 68
    .line 69
    add-int/lit8 v0, v0, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    return-void
.end method

.method public final e(Ll/bgw0;I)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->q()I

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
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eq p1, p2, :cond_1

    .line 14
    .line 15
    iput-boolean v1, p0, Ll/xrr0;->c:Z

    .line 16
    .line 17
    :cond_1
    iget p1, p0, Ll/xrr0;->d:I

    .line 18
    .line 19
    add-int/lit8 p1, p1, -0x1

    .line 20
    .line 21
    iput p1, p0, Ll/xrr0;->d:I

    .line 22
    .line 23
    iget-boolean p0, p0, Ll/xrr0;->c:Z

    .line 24
    .line 25
    return p0
.end method

.method public final zze()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/xrr0;->c:Z

    .line 3
    .line 4
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    iput-wide v0, p0, Ll/xrr0;->f:J

    .line 10
    .line 11
    return-void
.end method
