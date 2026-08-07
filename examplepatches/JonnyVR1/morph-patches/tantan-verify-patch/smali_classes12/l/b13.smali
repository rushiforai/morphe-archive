.class public final Ll/b13;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public a:[I

.field public b:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/b13;->b:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    new-array v0, v0, [I

    .line 9
    .line 10
    iput-object v0, p0, Ll/b13;->a:[I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Ll/b13;->b:I

    .line 15
    invoke-static {p1}, Ll/b13;->p(I)[I

    move-result-object p1

    iput-object p1, p0, Ll/b13;->a:[I

    return-void
.end method

.method public constructor <init>([II)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Ll/b13;->a:[I

    .line 18
    iput p2, p0, Ll/b13;->b:I

    return-void
.end method

.method public static p(I)[I
    .locals 0

    .line 1
    add-int/lit8 p0, p0, 0x1f

    .line 2
    .line 3
    div-int/lit8 p0, p0, 0x20

    .line 4
    .line 5
    new-array p0, p0, [I

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public a(Z)V
    .locals 4

    .line 1
    iget v0, p0, Ll/b13;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    invoke-virtual {p0, v0}, Ll/b13;->e(I)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/b13;->a:[I

    .line 11
    .line 12
    iget v0, p0, Ll/b13;->b:I

    .line 13
    .line 14
    div-int/lit8 v2, v0, 0x20

    .line 15
    .line 16
    aget v3, p1, v2

    .line 17
    .line 18
    and-int/lit8 v0, v0, 0x1f

    .line 19
    .line 20
    shl-int v0, v1, v0

    .line 21
    .line 22
    or-int/2addr v0, v3

    .line 23
    aput v0, p1, v2

    .line 24
    .line 25
    :cond_0
    iget p1, p0, Ll/b13;->b:I

    .line 26
    .line 27
    add-int/2addr p1, v1

    .line 28
    iput p1, p0, Ll/b13;->b:I

    .line 29
    .line 30
    return-void
.end method

.method public b(Ll/b13;)V
    .locals 3

    .line 1
    iget v0, p1, Ll/b13;->b:I

    .line 2
    .line 3
    iget v1, p0, Ll/b13;->b:I

    .line 4
    .line 5
    add-int/2addr v1, v0

    .line 6
    invoke-virtual {p0, v1}, Ll/b13;->e(I)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    if-ge v1, v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1, v1}, Ll/b13;->f(I)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p0, v2}, Ll/b13;->a(Z)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method public c(II)V
    .locals 2

    .line 1
    if-ltz p2, :cond_2

    .line 2
    .line 3
    const/16 v0, 0x20

    .line 4
    .line 5
    if-gt p2, v0, :cond_2

    .line 6
    .line 7
    iget v0, p0, Ll/b13;->b:I

    .line 8
    .line 9
    add-int/2addr v0, p2

    .line 10
    invoke-virtual {p0, v0}, Ll/b13;->e(I)V

    .line 11
    .line 12
    .line 13
    :goto_0
    if-lez p2, :cond_1

    .line 14
    .line 15
    add-int/lit8 v0, p2, -0x1

    .line 16
    .line 17
    shr-int v0, p1, v0

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    and-int/2addr v0, v1

    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    const/4 v1, 0x0

    .line 25
    :goto_1
    invoke-virtual {p0, v1}, Ll/b13;->a(Z)V

    .line 26
    .line 27
    .line 28
    add-int/lit8 p2, p2, -0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void

    .line 32
    :cond_2
    const-string p0, "Num bits must be between 0 and 32"

    .line 33
    .line 34
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public clear()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/b13;->a:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v2, v0, :cond_0

    .line 7
    .line 8
    iget-object v3, p0, Ll/b13;->a:[I

    .line 9
    .line 10
    aput v1, v3, v2

    .line 11
    .line 12
    add-int/lit8 v2, v2, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/b13;->d()Ll/b13;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Ll/b13;
    .locals 2

    .line 1
    new-instance v0, Ll/b13;

    .line 2
    .line 3
    iget-object v1, p0, Ll/b13;->a:[I

    .line 4
    .line 5
    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, [I

    .line 10
    .line 11
    iget p0, p0, Ll/b13;->b:I

    .line 12
    .line 13
    invoke-direct {v0, v1, p0}, Ll/b13;-><init>([II)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public final e(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b13;->a:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    shl-int/lit8 v0, v0, 0x5

    .line 5
    .line 6
    if-le p1, v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Ll/b13;->p(I)[I

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Ll/b13;->a:[I

    .line 13
    .line 14
    array-length v1, v0

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/b13;->a:[I

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Ll/b13;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Ll/b13;

    .line 8
    .line 9
    iget v0, p0, Ll/b13;->b:I

    .line 10
    .line 11
    iget v2, p1, Ll/b13;->b:I

    .line 12
    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Ll/b13;->a:[I

    .line 16
    .line 17
    iget-object p1, p1, Ll/b13;->a:[I

    .line 18
    .line 19
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([I[I)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    return v1
.end method

.method public f(I)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/b13;->a:[I

    .line 2
    .line 3
    div-int/lit8 v0, p1, 0x20

    .line 4
    .line 5
    aget p0, p0, v0

    .line 6
    .line 7
    and-int/lit8 p1, p1, 0x1f

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    shl-int p1, v0, p1

    .line 11
    .line 12
    and-int/2addr p0, p1

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget v0, p0, Ll/b13;->b:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget-object p0, p0, Ll/b13;->a:[I

    .line 6
    .line 7
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/2addr v0, p0

    .line 12
    return v0
.end method

.method public j()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b13;->a:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public k(I)I
    .locals 3

    .line 1
    iget v0, p0, Ll/b13;->b:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    div-int/lit8 v0, p1, 0x20

    .line 7
    .line 8
    iget-object v1, p0, Ll/b13;->a:[I

    .line 9
    .line 10
    aget v1, v1, v0

    .line 11
    .line 12
    and-int/lit8 p1, p1, 0x1f

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    shl-int p1, v2, p1

    .line 16
    .line 17
    sub-int/2addr p1, v2

    .line 18
    not-int p1, p1

    .line 19
    and-int/2addr p1, v1

    .line 20
    :goto_0
    if-nez p1, :cond_2

    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    iget-object p1, p0, Ll/b13;->a:[I

    .line 25
    .line 26
    array-length v1, p1

    .line 27
    if-ne v0, v1, :cond_1

    .line 28
    .line 29
    iget p0, p0, Ll/b13;->b:I

    .line 30
    .line 31
    return p0

    .line 32
    :cond_1
    aget p1, p1, v0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    shl-int/lit8 v0, v0, 0x5

    .line 36
    .line 37
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    add-int/2addr v0, p1

    .line 42
    iget p0, p0, Ll/b13;->b:I

    .line 43
    .line 44
    if-le v0, p0, :cond_3

    .line 45
    .line 46
    return p0

    .line 47
    :cond_3
    return v0
.end method

.method public l(I)I
    .locals 3

    .line 1
    iget v0, p0, Ll/b13;->b:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    div-int/lit8 v0, p1, 0x20

    .line 7
    .line 8
    iget-object v1, p0, Ll/b13;->a:[I

    .line 9
    .line 10
    aget v1, v1, v0

    .line 11
    .line 12
    not-int v1, v1

    .line 13
    and-int/lit8 p1, p1, 0x1f

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    shl-int p1, v2, p1

    .line 17
    .line 18
    sub-int/2addr p1, v2

    .line 19
    not-int p1, p1

    .line 20
    and-int/2addr p1, v1

    .line 21
    :goto_0
    if-nez p1, :cond_2

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    iget-object p1, p0, Ll/b13;->a:[I

    .line 26
    .line 27
    array-length v1, p1

    .line 28
    if-ne v0, v1, :cond_1

    .line 29
    .line 30
    iget p0, p0, Ll/b13;->b:I

    .line 31
    .line 32
    return p0

    .line 33
    :cond_1
    aget p1, p1, v0

    .line 34
    .line 35
    not-int p1, p1

    .line 36
    goto :goto_0

    .line 37
    :cond_2
    shl-int/lit8 v0, v0, 0x5

    .line 38
    .line 39
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    add-int/2addr v0, p1

    .line 44
    iget p0, p0, Ll/b13;->b:I

    .line 45
    .line 46
    if-le v0, p0, :cond_3

    .line 47
    .line 48
    return p0

    .line 49
    :cond_3
    return v0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/b13;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public n()I
    .locals 0

    .line 1
    iget p0, p0, Ll/b13;->b:I

    .line 2
    .line 3
    add-int/lit8 p0, p0, 0x7

    .line 4
    .line 5
    div-int/lit8 p0, p0, 0x8

    .line 6
    .line 7
    return p0
.end method

.method public o(IIZ)Z
    .locals 8

    .line 1
    if-lt p2, p1, :cond_6

    .line 2
    .line 3
    if-ltz p1, :cond_6

    .line 4
    .line 5
    iget v0, p0, Ll/b13;->b:I

    .line 6
    .line 7
    if-gt p2, v0, :cond_6

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-ne p2, p1, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    add-int/lit8 p2, p2, -0x1

    .line 14
    .line 15
    div-int/lit8 v1, p1, 0x20

    .line 16
    .line 17
    div-int/lit8 v2, p2, 0x20

    .line 18
    .line 19
    move v3, v1

    .line 20
    :goto_0
    if-gt v3, v2, :cond_5

    .line 21
    .line 22
    const/16 v4, 0x1f

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    if-le v3, v1, :cond_1

    .line 26
    .line 27
    move v6, v5

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    and-int/lit8 v6, p1, 0x1f

    .line 30
    .line 31
    :goto_1
    if-ge v3, v2, :cond_2

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_2
    and-int/2addr v4, p2

    .line 35
    :goto_2
    const/4 v7, 0x2

    .line 36
    shl-int v4, v7, v4

    .line 37
    .line 38
    shl-int v6, v0, v6

    .line 39
    .line 40
    sub-int/2addr v4, v6

    .line 41
    iget-object v6, p0, Ll/b13;->a:[I

    .line 42
    .line 43
    aget v6, v6, v3

    .line 44
    .line 45
    and-int/2addr v6, v4

    .line 46
    if-eqz p3, :cond_3

    .line 47
    .line 48
    goto :goto_3

    .line 49
    :cond_3
    move v4, v5

    .line 50
    :goto_3
    if-eq v6, v4, :cond_4

    .line 51
    .line 52
    return v5

    .line 53
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_5
    return v0

    .line 57
    :cond_6
    invoke-static {}, Ll/fig0;->a()V

    .line 58
    .line 59
    .line 60
    const/4 p0, 0x0

    .line 61
    return p0
.end method

.method public q()V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/b13;->a:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    new-array v0, v0, [I

    .line 5
    .line 6
    iget v1, p0, Ll/b13;->b:I

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    sub-int/2addr v1, v2

    .line 10
    div-int/lit8 v1, v1, 0x20

    .line 11
    .line 12
    add-int/lit8 v3, v1, 0x1

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    move v5, v4

    .line 16
    :goto_0
    if-ge v5, v3, :cond_0

    .line 17
    .line 18
    iget-object v6, p0, Ll/b13;->a:[I

    .line 19
    .line 20
    aget v6, v6, v5

    .line 21
    .line 22
    int-to-long v6, v6

    .line 23
    shr-long v8, v6, v2

    .line 24
    .line 25
    const-wide/32 v10, 0x55555555

    .line 26
    .line 27
    .line 28
    and-long/2addr v8, v10

    .line 29
    and-long/2addr v6, v10

    .line 30
    shl-long/2addr v6, v2

    .line 31
    or-long/2addr v6, v8

    .line 32
    const/4 v8, 0x2

    .line 33
    shr-long v9, v6, v8

    .line 34
    .line 35
    const-wide/32 v11, 0x33333333

    .line 36
    .line 37
    .line 38
    and-long/2addr v9, v11

    .line 39
    and-long/2addr v6, v11

    .line 40
    shl-long/2addr v6, v8

    .line 41
    or-long/2addr v6, v9

    .line 42
    const/4 v8, 0x4

    .line 43
    shr-long v9, v6, v8

    .line 44
    .line 45
    const-wide/32 v11, 0xf0f0f0f

    .line 46
    .line 47
    .line 48
    and-long/2addr v9, v11

    .line 49
    and-long/2addr v6, v11

    .line 50
    shl-long/2addr v6, v8

    .line 51
    or-long/2addr v6, v9

    .line 52
    const/16 v8, 0x8

    .line 53
    .line 54
    shr-long v9, v6, v8

    .line 55
    .line 56
    const-wide/32 v11, 0xff00ff

    .line 57
    .line 58
    .line 59
    and-long/2addr v9, v11

    .line 60
    and-long/2addr v6, v11

    .line 61
    shl-long/2addr v6, v8

    .line 62
    or-long/2addr v6, v9

    .line 63
    const/16 v8, 0x10

    .line 64
    .line 65
    shr-long v9, v6, v8

    .line 66
    .line 67
    const-wide/32 v11, 0xffff

    .line 68
    .line 69
    .line 70
    and-long/2addr v9, v11

    .line 71
    and-long/2addr v6, v11

    .line 72
    shl-long/2addr v6, v8

    .line 73
    or-long/2addr v6, v9

    .line 74
    sub-int v8, v1, v5

    .line 75
    .line 76
    long-to-int v6, v6

    .line 77
    aput v6, v0, v8

    .line 78
    .line 79
    add-int/lit8 v5, v5, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    iget v5, p0, Ll/b13;->b:I

    .line 83
    .line 84
    shl-int/lit8 v6, v3, 0x5

    .line 85
    .line 86
    if-eq v5, v6, :cond_2

    .line 87
    .line 88
    sub-int/2addr v6, v5

    .line 89
    aget v4, v0, v4

    .line 90
    .line 91
    ushr-int/2addr v4, v6

    .line 92
    :goto_1
    if-ge v2, v3, :cond_1

    .line 93
    .line 94
    aget v5, v0, v2

    .line 95
    .line 96
    rsub-int/lit8 v7, v6, 0x20

    .line 97
    .line 98
    shl-int v7, v5, v7

    .line 99
    .line 100
    or-int/2addr v4, v7

    .line 101
    add-int/lit8 v7, v2, -0x1

    .line 102
    .line 103
    aput v4, v0, v7

    .line 104
    .line 105
    ushr-int v4, v5, v6

    .line 106
    .line 107
    add-int/lit8 v2, v2, 0x1

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_1
    aput v4, v0, v1

    .line 111
    .line 112
    :cond_2
    iput-object v0, p0, Ll/b13;->a:[I

    .line 113
    .line 114
    return-void
.end method

.method public r(I)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/b13;->a:[I

    .line 2
    .line 3
    div-int/lit8 v0, p1, 0x20

    .line 4
    .line 5
    aget v1, p0, v0

    .line 6
    .line 7
    and-int/lit8 p1, p1, 0x1f

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    shl-int p1, v2, p1

    .line 11
    .line 12
    or-int/2addr p1, v1

    .line 13
    aput p1, p0, v0

    .line 14
    .line 15
    return-void
.end method

.method public s(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b13;->a:[I

    .line 2
    .line 3
    div-int/lit8 p1, p1, 0x20

    .line 4
    .line 5
    aput p2, p0, p1

    .line 6
    .line 7
    return-void
.end method

.method public t(I[BII)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-ge v1, p4, :cond_2

    .line 4
    .line 5
    move v2, v0

    .line 6
    move v3, v2

    .line 7
    :goto_1
    const/16 v4, 0x8

    .line 8
    .line 9
    if-ge v2, v4, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/b13;->f(I)Z

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-eqz v4, :cond_0

    .line 16
    .line 17
    rsub-int/lit8 v4, v2, 0x7

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    shl-int v4, v5, v4

    .line 21
    .line 22
    or-int/2addr v3, v4

    .line 23
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 24
    .line 25
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    add-int v2, p3, v1

    .line 29
    .line 30
    int-to-byte v3, v3

    .line 31
    aput-byte v3, p2, v2

    .line 32
    .line 33
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    iget v1, p0, Ll/b13;->b:I

    .line 4
    .line 5
    div-int/lit8 v2, v1, 0x8

    .line 6
    .line 7
    add-int/2addr v1, v2

    .line 8
    add-int/lit8 v1, v1, 0x1

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    :goto_0
    iget v2, p0, Ll/b13;->b:I

    .line 15
    .line 16
    if-ge v1, v2, :cond_2

    .line 17
    .line 18
    and-int/lit8 v2, v1, 0x7

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    const/16 v2, 0x20

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0, v1}, Ll/b13;->f(I)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    const/16 v2, 0x58

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    const/16 v2, 0x2e

    .line 37
    .line 38
    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public u(Ll/b13;)V
    .locals 4

    .line 1
    iget v0, p0, Ll/b13;->b:I

    .line 2
    .line 3
    iget v1, p1, Ll/b13;->b:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v1, p0, Ll/b13;->a:[I

    .line 9
    .line 10
    array-length v2, v1

    .line 11
    if-ge v0, v2, :cond_0

    .line 12
    .line 13
    aget v2, v1, v0

    .line 14
    .line 15
    iget-object v3, p1, Ll/b13;->a:[I

    .line 16
    .line 17
    aget v3, v3, v0

    .line 18
    .line 19
    xor-int/2addr v2, v3

    .line 20
    aput v2, v1, v0

    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void

    .line 26
    :cond_1
    const-string p0, "Sizes don\'t match"

    .line 27
    .line 28
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
