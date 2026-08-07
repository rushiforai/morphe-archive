.class public final Ll/d13;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:[I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p1}, Ll/d13;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-lez p1, :cond_0

    .line 5
    .line 6
    if-lez p2, :cond_0

    .line 7
    .line 8
    iput p1, p0, Ll/d13;->a:I

    .line 9
    .line 10
    iput p2, p0, Ll/d13;->b:I

    .line 11
    .line 12
    add-int/lit8 p1, p1, 0x1f

    .line 13
    .line 14
    div-int/lit8 p1, p1, 0x20

    .line 15
    .line 16
    iput p1, p0, Ll/d13;->c:I

    .line 17
    .line 18
    mul-int/2addr p1, p2

    .line 19
    new-array p1, p1, [I

    .line 20
    .line 21
    iput-object p1, p0, Ll/d13;->d:[I

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-string p0, "Both dimensions must be greater than 0"

    .line 25
    .line 26
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    throw p0
.end method

.method public constructor <init>(III[I)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput p1, p0, Ll/d13;->a:I

    .line 34
    iput p2, p0, Ll/d13;->b:I

    .line 35
    iput p3, p0, Ll/d13;->c:I

    .line 36
    iput-object p4, p0, Ll/d13;->d:[I

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    iget v1, p0, Ll/d13;->b:I

    .line 4
    .line 5
    iget v2, p0, Ll/d13;->a:I

    .line 6
    .line 7
    add-int/lit8 v2, v2, 0x1

    .line 8
    .line 9
    mul-int/2addr v1, v2

    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    move v2, v1

    .line 15
    :goto_0
    iget v3, p0, Ll/d13;->b:I

    .line 16
    .line 17
    if-ge v2, v3, :cond_2

    .line 18
    .line 19
    move v3, v1

    .line 20
    :goto_1
    iget v4, p0, Ll/d13;->a:I

    .line 21
    .line 22
    if-ge v3, v4, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, v3, v2}, Ll/d13;->d(II)Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-eqz v4, :cond_0

    .line 29
    .line 30
    move-object v4, p1

    .line 31
    goto :goto_2

    .line 32
    :cond_0
    move-object v4, p2

    .line 33
    :goto_2
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    add-int/lit8 v3, v3, 0x1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    add-int/lit8 v2, v2, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public b()Ll/d13;
    .locals 4

    .line 1
    new-instance v0, Ll/d13;

    .line 2
    .line 3
    iget v1, p0, Ll/d13;->a:I

    .line 4
    .line 5
    iget v2, p0, Ll/d13;->b:I

    .line 6
    .line 7
    iget v3, p0, Ll/d13;->c:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/d13;->d:[I

    .line 10
    .line 11
    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, [I

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, v3, p0}, Ll/d13;-><init>(III[I)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public c(II)V
    .locals 2

    .line 1
    iget v0, p0, Ll/d13;->c:I

    .line 2
    .line 3
    mul-int/2addr p2, v0

    .line 4
    div-int/lit8 v0, p1, 0x20

    .line 5
    .line 6
    add-int/2addr p2, v0

    .line 7
    iget-object p0, p0, Ll/d13;->d:[I

    .line 8
    .line 9
    aget v0, p0, p2

    .line 10
    .line 11
    and-int/lit8 p1, p1, 0x1f

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    shl-int p1, v1, p1

    .line 15
    .line 16
    xor-int/2addr p1, v0

    .line 17
    aput p1, p0, p2

    .line 18
    .line 19
    return-void
.end method

.method public clear()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d13;->d:[I

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
    iget-object v3, p0, Ll/d13;->d:[I

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
    invoke-virtual {p0}, Ll/d13;->b()Ll/d13;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(II)Z
    .locals 1

    .line 1
    iget v0, p0, Ll/d13;->c:I

    .line 2
    .line 3
    mul-int/2addr p2, v0

    .line 4
    div-int/lit8 v0, p1, 0x20

    .line 5
    .line 6
    add-int/2addr p2, v0

    .line 7
    iget-object p0, p0, Ll/d13;->d:[I

    .line 8
    .line 9
    aget p0, p0, p2

    .line 10
    .line 11
    and-int/lit8 p1, p1, 0x1f

    .line 12
    .line 13
    ushr-int/2addr p0, p1

    .line 14
    const/4 p1, 0x1

    .line 15
    and-int/2addr p0, p1

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    return p1

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public e()[I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d13;->d:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    add-int/lit8 v0, v0, -0x1

    .line 5
    .line 6
    :goto_0
    if-ltz v0, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Ll/d13;->d:[I

    .line 9
    .line 10
    aget v1, v1, v0

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    add-int/lit8 v0, v0, -0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    if-gez v0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_1
    iget v1, p0, Ll/d13;->c:I

    .line 22
    .line 23
    div-int v2, v0, v1

    .line 24
    .line 25
    rem-int v1, v0, v1

    .line 26
    .line 27
    shl-int/lit8 v1, v1, 0x5

    .line 28
    .line 29
    iget-object p0, p0, Ll/d13;->d:[I

    .line 30
    .line 31
    aget p0, p0, v0

    .line 32
    .line 33
    const/16 v0, 0x1f

    .line 34
    .line 35
    :goto_1
    ushr-int v3, p0, v0

    .line 36
    .line 37
    if-nez v3, :cond_2

    .line 38
    .line 39
    add-int/lit8 v0, v0, -0x1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    add-int/2addr v1, v0

    .line 43
    filled-new-array {v1, v2}, [I

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Ll/d13;

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
    check-cast p1, Ll/d13;

    .line 8
    .line 9
    iget v0, p0, Ll/d13;->a:I

    .line 10
    .line 11
    iget v2, p1, Ll/d13;->a:I

    .line 12
    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    iget v0, p0, Ll/d13;->b:I

    .line 16
    .line 17
    iget v2, p1, Ll/d13;->b:I

    .line 18
    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    iget v0, p0, Ll/d13;->c:I

    .line 22
    .line 23
    iget v2, p1, Ll/d13;->c:I

    .line 24
    .line 25
    if-ne v0, v2, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ll/d13;->d:[I

    .line 28
    .line 29
    iget-object p1, p1, Ll/d13;->d:[I

    .line 30
    .line 31
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([I[I)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    return v1
.end method

.method public f()[I
    .locals 11

    .line 1
    iget v0, p0, Ll/d13;->a:I

    .line 2
    .line 3
    iget v1, p0, Ll/d13;->b:I

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    move v4, v2

    .line 8
    move v5, v3

    .line 9
    :goto_0
    iget v6, p0, Ll/d13;->b:I

    .line 10
    .line 11
    if-ge v5, v6, :cond_7

    .line 12
    .line 13
    move v6, v3

    .line 14
    :goto_1
    iget v7, p0, Ll/d13;->c:I

    .line 15
    .line 16
    if-ge v6, v7, :cond_6

    .line 17
    .line 18
    iget-object v8, p0, Ll/d13;->d:[I

    .line 19
    .line 20
    mul-int/2addr v7, v5

    .line 21
    add-int/2addr v7, v6

    .line 22
    aget v7, v8, v7

    .line 23
    .line 24
    if-eqz v7, :cond_5

    .line 25
    .line 26
    if-ge v5, v1, :cond_0

    .line 27
    .line 28
    move v1, v5

    .line 29
    :cond_0
    if-le v5, v4, :cond_1

    .line 30
    .line 31
    move v4, v5

    .line 32
    :cond_1
    shl-int/lit8 v8, v6, 0x5

    .line 33
    .line 34
    if-ge v8, v0, :cond_3

    .line 35
    .line 36
    move v9, v3

    .line 37
    :goto_2
    rsub-int/lit8 v10, v9, 0x1f

    .line 38
    .line 39
    shl-int v10, v7, v10

    .line 40
    .line 41
    if-nez v10, :cond_2

    .line 42
    .line 43
    add-int/lit8 v9, v9, 0x1

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_2
    add-int/2addr v9, v8

    .line 47
    if-ge v9, v0, :cond_3

    .line 48
    .line 49
    move v0, v9

    .line 50
    :cond_3
    add-int/lit8 v9, v8, 0x1f

    .line 51
    .line 52
    if-le v9, v2, :cond_5

    .line 53
    .line 54
    const/16 v9, 0x1f

    .line 55
    .line 56
    :goto_3
    ushr-int v10, v7, v9

    .line 57
    .line 58
    if-nez v10, :cond_4

    .line 59
    .line 60
    add-int/lit8 v9, v9, -0x1

    .line 61
    .line 62
    goto :goto_3

    .line 63
    :cond_4
    add-int/2addr v8, v9

    .line 64
    if-le v8, v2, :cond_5

    .line 65
    .line 66
    move v2, v8

    .line 67
    :cond_5
    add-int/lit8 v6, v6, 0x1

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_6
    add-int/lit8 v5, v5, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_7
    if-lt v2, v0, :cond_9

    .line 74
    .line 75
    if-ge v4, v1, :cond_8

    .line 76
    .line 77
    goto :goto_4

    .line 78
    :cond_8
    sub-int/2addr v2, v0

    .line 79
    add-int/lit8 v2, v2, 0x1

    .line 80
    .line 81
    sub-int/2addr v4, v1

    .line 82
    add-int/lit8 v4, v4, 0x1

    .line 83
    .line 84
    filled-new-array {v0, v1, v2, v4}, [I

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :cond_9
    :goto_4
    const/4 p0, 0x0

    .line 90
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Ll/d13;->a:I

    .line 2
    .line 3
    mul-int/lit8 v1, v0, 0x1f

    .line 4
    .line 5
    add-int/2addr v1, v0

    .line 6
    mul-int/lit8 v1, v1, 0x1f

    .line 7
    .line 8
    iget v0, p0, Ll/d13;->b:I

    .line 9
    .line 10
    add-int/2addr v1, v0

    .line 11
    mul-int/lit8 v1, v1, 0x1f

    .line 12
    .line 13
    iget v0, p0, Ll/d13;->c:I

    .line 14
    .line 15
    add-int/2addr v1, v0

    .line 16
    mul-int/lit8 v1, v1, 0x1f

    .line 17
    .line 18
    iget-object p0, p0, Ll/d13;->d:[I

    .line 19
    .line 20
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    add-int/2addr v1, p0

    .line 25
    return v1
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Ll/d13;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public k(ILl/b13;)Ll/b13;
    .locals 4

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/b13;->m()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Ll/d13;->a:I

    .line 8
    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p2}, Ll/b13;->clear()V

    .line 13
    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    new-instance p2, Ll/b13;

    .line 17
    .line 18
    iget v0, p0, Ll/d13;->a:I

    .line 19
    .line 20
    invoke-direct {p2, v0}, Ll/b13;-><init>(I)V

    .line 21
    .line 22
    .line 23
    :goto_1
    iget v0, p0, Ll/d13;->c:I

    .line 24
    .line 25
    mul-int/2addr p1, v0

    .line 26
    const/4 v0, 0x0

    .line 27
    :goto_2
    iget v1, p0, Ll/d13;->c:I

    .line 28
    .line 29
    if-ge v0, v1, :cond_2

    .line 30
    .line 31
    shl-int/lit8 v1, v0, 0x5

    .line 32
    .line 33
    iget-object v2, p0, Ll/d13;->d:[I

    .line 34
    .line 35
    add-int v3, p1, v0

    .line 36
    .line 37
    aget v2, v2, v3

    .line 38
    .line 39
    invoke-virtual {p2, v1, v2}, Ll/b13;->s(II)V

    .line 40
    .line 41
    .line 42
    add-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_2
    return-object p2
.end method

.method public l()[I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/d13;->d:[I

    .line 4
    .line 5
    array-length v3, v2

    .line 6
    if-ge v1, v3, :cond_0

    .line 7
    .line 8
    aget v3, v2, v1

    .line 9
    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    array-length v3, v2

    .line 16
    if-ne v1, v3, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0

    .line 20
    :cond_1
    iget p0, p0, Ll/d13;->c:I

    .line 21
    .line 22
    div-int v3, v1, p0

    .line 23
    .line 24
    rem-int p0, v1, p0

    .line 25
    .line 26
    shl-int/lit8 p0, p0, 0x5

    .line 27
    .line 28
    aget v1, v2, v1

    .line 29
    .line 30
    :goto_1
    rsub-int/lit8 v2, v0, 0x1f

    .line 31
    .line 32
    shl-int v2, v1, v2

    .line 33
    .line 34
    if-nez v2, :cond_2

    .line 35
    .line 36
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    add-int/2addr p0, v0

    .line 40
    filled-new-array {p0, v3}, [I

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/d13;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public n()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/d13;->m()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/d13;->j()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    new-instance v2, Ll/b13;

    .line 10
    .line 11
    invoke-direct {v2, v0}, Ll/b13;-><init>(I)V

    .line 12
    .line 13
    .line 14
    new-instance v3, Ll/b13;

    .line 15
    .line 16
    invoke-direct {v3, v0}, Ll/b13;-><init>(I)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    :goto_0
    add-int/lit8 v4, v1, 0x1

    .line 21
    .line 22
    div-int/lit8 v4, v4, 0x2

    .line 23
    .line 24
    if-ge v0, v4, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, v0, v2}, Ll/d13;->k(ILl/b13;)Ll/b13;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    add-int/lit8 v4, v1, -0x1

    .line 31
    .line 32
    sub-int/2addr v4, v0

    .line 33
    invoke-virtual {p0, v4, v3}, Ll/d13;->k(ILl/b13;)Ll/b13;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v2}, Ll/b13;->q()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3}, Ll/b13;->q()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0, v3}, Ll/d13;->q(ILl/b13;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v4, v2}, Ll/d13;->q(ILl/b13;)V

    .line 47
    .line 48
    .line 49
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    return-void
.end method

.method public o(II)V
    .locals 2

    .line 1
    iget v0, p0, Ll/d13;->c:I

    .line 2
    .line 3
    mul-int/2addr p2, v0

    .line 4
    div-int/lit8 v0, p1, 0x20

    .line 5
    .line 6
    add-int/2addr p2, v0

    .line 7
    iget-object p0, p0, Ll/d13;->d:[I

    .line 8
    .line 9
    aget v0, p0, p2

    .line 10
    .line 11
    and-int/lit8 p1, p1, 0x1f

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    shl-int p1, v1, p1

    .line 15
    .line 16
    or-int/2addr p1, v0

    .line 17
    aput p1, p0, p2

    .line 18
    .line 19
    return-void
.end method

.method public p(IIII)V
    .locals 7

    .line 1
    if-ltz p2, :cond_4

    .line 2
    .line 3
    if-ltz p1, :cond_4

    .line 4
    .line 5
    if-lez p4, :cond_3

    .line 6
    .line 7
    if-lez p3, :cond_3

    .line 8
    .line 9
    add-int/2addr p3, p1

    .line 10
    add-int/2addr p4, p2

    .line 11
    iget v0, p0, Ll/d13;->b:I

    .line 12
    .line 13
    if-gt p4, v0, :cond_2

    .line 14
    .line 15
    iget v0, p0, Ll/d13;->a:I

    .line 16
    .line 17
    if-gt p3, v0, :cond_2

    .line 18
    .line 19
    :goto_0
    if-ge p2, p4, :cond_1

    .line 20
    .line 21
    iget v0, p0, Ll/d13;->c:I

    .line 22
    .line 23
    mul-int/2addr v0, p2

    .line 24
    move v1, p1

    .line 25
    :goto_1
    if-ge v1, p3, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Ll/d13;->d:[I

    .line 28
    .line 29
    div-int/lit8 v3, v1, 0x20

    .line 30
    .line 31
    add-int/2addr v3, v0

    .line 32
    aget v4, v2, v3

    .line 33
    .line 34
    and-int/lit8 v5, v1, 0x1f

    .line 35
    .line 36
    const/4 v6, 0x1

    .line 37
    shl-int v5, v6, v5

    .line 38
    .line 39
    or-int/2addr v4, v5

    .line 40
    aput v4, v2, v3

    .line 41
    .line 42
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-void

    .line 49
    :cond_2
    const-string p0, "The region must fit inside the matrix"

    .line 50
    .line 51
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_3
    const-string p0, "Height and width must be at least 1"

    .line 56
    .line 57
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_4
    const-string p0, "Left and top must be nonnegative"

    .line 62
    .line 63
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public q(ILl/b13;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/b13;->j()[I

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p0, Ll/d13;->d:[I

    .line 6
    .line 7
    iget p0, p0, Ll/d13;->c:I

    .line 8
    .line 9
    mul-int/2addr p1, p0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {p2, v1, v0, p1, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public r(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "\n"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ll/d13;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "X "

    .line 2
    .line 3
    const-string v1, "  "

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/d13;->r(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
