.class public final Ll/hg00;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/gg00;

.field public final b:[I


# direct methods
.method public constructor <init>(Ll/gg00;[I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    array-length v0, p2

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iput-object p1, p0, Ll/hg00;->a:Ll/gg00;

    .line 8
    .line 9
    array-length p1, p2

    .line 10
    const/4 v0, 0x1

    .line 11
    if-le p1, v0, :cond_2

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    aget v2, p2, v1

    .line 15
    .line 16
    if-nez v2, :cond_2

    .line 17
    .line 18
    :goto_0
    if-ge v0, p1, :cond_0

    .line 19
    .line 20
    aget v2, p2, v0

    .line 21
    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    if-ne v0, p1, :cond_1

    .line 28
    .line 29
    filled-new-array {v1}, [I

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Ll/hg00;->b:[I

    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    sub-int/2addr p1, v0

    .line 37
    new-array p1, p1, [I

    .line 38
    .line 39
    iput-object p1, p0, Ll/hg00;->b:[I

    .line 40
    .line 41
    array-length p0, p1

    .line 42
    invoke-static {p2, v0, p1, v1, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    iput-object p2, p0, Ll/hg00;->b:[I

    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    invoke-static {}, Ll/fig0;->a()V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    throw p0
.end method


# virtual methods
.method public a(Ll/hg00;)Ll/hg00;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/hg00;->a:Ll/gg00;

    .line 2
    .line 3
    iget-object v1, p1, Ll/hg00;->a:Ll/gg00;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hg00;->e()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-object p1

    .line 18
    :cond_0
    invoke-virtual {p1}, Ll/hg00;->e()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    iget-object v0, p0, Ll/hg00;->b:[I

    .line 26
    .line 27
    iget-object p1, p1, Ll/hg00;->b:[I

    .line 28
    .line 29
    array-length v1, v0

    .line 30
    array-length v2, p1

    .line 31
    if-le v1, v2, :cond_2

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    move-object v7, v0

    .line 35
    move-object v0, p1

    .line 36
    move-object p1, v7

    .line 37
    :goto_0
    array-length v1, v0

    .line 38
    new-array v1, v1, [I

    .line 39
    .line 40
    array-length v2, v0

    .line 41
    array-length v3, p1

    .line 42
    sub-int/2addr v2, v3

    .line 43
    const/4 v3, 0x0

    .line 44
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 45
    .line 46
    .line 47
    move v3, v2

    .line 48
    :goto_1
    array-length v4, v0

    .line 49
    iget-object v5, p0, Ll/hg00;->a:Ll/gg00;

    .line 50
    .line 51
    if-ge v3, v4, :cond_3

    .line 52
    .line 53
    sub-int v4, v3, v2

    .line 54
    .line 55
    aget v4, p1, v4

    .line 56
    .line 57
    aget v6, v0, v3

    .line 58
    .line 59
    invoke-virtual {v5, v4, v6}, Ll/gg00;->a(II)I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    aput v4, v1, v3

    .line 64
    .line 65
    add-int/lit8 v3, v3, 0x1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_3
    new-instance p0, Ll/hg00;

    .line 69
    .line 70
    invoke-direct {p0, v5, v1}, Ll/hg00;-><init>(Ll/gg00;[I)V

    .line 71
    .line 72
    .line 73
    return-object p0

    .line 74
    :cond_4
    const-string p0, "ModulusPolys do not have same ModulusGF field"

    .line 75
    .line 76
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    const/4 p0, 0x0

    .line 80
    return-object p0
.end method

.method public b(I)I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Ll/hg00;->c(I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object v1, p0, Ll/hg00;->b:[I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-ne p1, v2, :cond_2

    .line 13
    .line 14
    array-length p1, v1

    .line 15
    move v2, v0

    .line 16
    :goto_0
    if-ge v0, p1, :cond_1

    .line 17
    .line 18
    aget v3, v1, v0

    .line 19
    .line 20
    iget-object v4, p0, Ll/hg00;->a:Ll/gg00;

    .line 21
    .line 22
    invoke-virtual {v4, v2, v3}, Ll/gg00;->a(II)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return v2

    .line 30
    :cond_2
    aget v0, v1, v0

    .line 31
    .line 32
    array-length v1, v1

    .line 33
    :goto_1
    if-ge v2, v1, :cond_3

    .line 34
    .line 35
    iget-object v3, p0, Ll/hg00;->a:Ll/gg00;

    .line 36
    .line 37
    invoke-virtual {v3, p1, v0}, Ll/gg00;->i(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object v4, p0, Ll/hg00;->b:[I

    .line 42
    .line 43
    aget v4, v4, v2

    .line 44
    .line 45
    invoke-virtual {v3, v0, v4}, Ll/gg00;->a(II)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/lit8 v2, v2, 0x1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_3
    return v0
.end method

.method public c(I)I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hg00;->b:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    add-int/lit8 v0, v0, -0x1

    .line 5
    .line 6
    sub-int/2addr v0, p1

    .line 7
    aget p0, p0, v0

    .line 8
    .line 9
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hg00;->b:[I

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    add-int/lit8 p0, p0, -0x1

    .line 5
    .line 6
    return p0
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hg00;->b:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    return v0
.end method

.method public f(I)Ll/hg00;
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/hg00;->a:Ll/gg00;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gg00;->f()Ll/hg00;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_1
    iget-object v0, p0, Ll/hg00;->b:[I

    .line 15
    .line 16
    array-length v0, v0

    .line 17
    new-array v1, v0, [I

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    iget-object v3, p0, Ll/hg00;->a:Ll/gg00;

    .line 21
    .line 22
    if-ge v2, v0, :cond_2

    .line 23
    .line 24
    iget-object v4, p0, Ll/hg00;->b:[I

    .line 25
    .line 26
    aget v4, v4, v2

    .line 27
    .line 28
    invoke-virtual {v3, v4, p1}, Ll/gg00;->i(II)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    aput v3, v1, v2

    .line 33
    .line 34
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    new-instance p0, Ll/hg00;

    .line 38
    .line 39
    invoke-direct {p0, v3, v1}, Ll/hg00;-><init>(Ll/gg00;[I)V

    .line 40
    .line 41
    .line 42
    return-object p0
.end method

.method public g(Ll/hg00;)Ll/hg00;
    .locals 12

    .line 1
    iget-object v0, p0, Ll/hg00;->a:Ll/gg00;

    .line 2
    .line 3
    iget-object v1, p1, Ll/hg00;->a:Ll/gg00;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hg00;->e()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_3

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/hg00;->e()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_0
    iget-object v0, p0, Ll/hg00;->b:[I

    .line 25
    .line 26
    array-length v1, v0

    .line 27
    iget-object p1, p1, Ll/hg00;->b:[I

    .line 28
    .line 29
    array-length v2, p1

    .line 30
    add-int v3, v1, v2

    .line 31
    .line 32
    add-int/lit8 v3, v3, -0x1

    .line 33
    .line 34
    new-array v3, v3, [I

    .line 35
    .line 36
    const/4 v4, 0x0

    .line 37
    move v5, v4

    .line 38
    :goto_0
    if-ge v5, v1, :cond_2

    .line 39
    .line 40
    aget v6, v0, v5

    .line 41
    .line 42
    move v7, v4

    .line 43
    :goto_1
    if-ge v7, v2, :cond_1

    .line 44
    .line 45
    add-int v8, v5, v7

    .line 46
    .line 47
    iget-object v9, p0, Ll/hg00;->a:Ll/gg00;

    .line 48
    .line 49
    aget v10, v3, v8

    .line 50
    .line 51
    aget v11, p1, v7

    .line 52
    .line 53
    invoke-virtual {v9, v6, v11}, Ll/gg00;->i(II)I

    .line 54
    .line 55
    .line 56
    move-result v11

    .line 57
    invoke-virtual {v9, v10, v11}, Ll/gg00;->a(II)I

    .line 58
    .line 59
    .line 60
    move-result v9

    .line 61
    aput v9, v3, v8

    .line 62
    .line 63
    add-int/lit8 v7, v7, 0x1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    new-instance p1, Ll/hg00;

    .line 70
    .line 71
    iget-object p0, p0, Ll/hg00;->a:Ll/gg00;

    .line 72
    .line 73
    invoke-direct {p1, p0, v3}, Ll/hg00;-><init>(Ll/gg00;[I)V

    .line 74
    .line 75
    .line 76
    return-object p1

    .line 77
    :cond_3
    :goto_2
    iget-object p0, p0, Ll/hg00;->a:Ll/gg00;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/gg00;->f()Ll/hg00;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    :cond_4
    const-string p0, "ModulusPolys do not have same ModulusGF field"

    .line 85
    .line 86
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const/4 p0, 0x0

    .line 90
    return-object p0
.end method

.method public h(II)Ll/hg00;
    .locals 4

    .line 1
    if-ltz p1, :cond_2

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/hg00;->a:Ll/gg00;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/gg00;->f()Ll/hg00;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/hg00;->b:[I

    .line 13
    .line 14
    array-length v0, v0

    .line 15
    add-int/2addr p1, v0

    .line 16
    new-array p1, p1, [I

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    :goto_0
    iget-object v2, p0, Ll/hg00;->a:Ll/gg00;

    .line 20
    .line 21
    if-ge v1, v0, :cond_1

    .line 22
    .line 23
    iget-object v3, p0, Ll/hg00;->b:[I

    .line 24
    .line 25
    aget v3, v3, v1

    .line 26
    .line 27
    invoke-virtual {v2, v3, p2}, Ll/gg00;->i(II)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    aput v2, p1, v1

    .line 32
    .line 33
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    new-instance p0, Ll/hg00;

    .line 37
    .line 38
    invoke-direct {p0, v2, p1}, Ll/hg00;-><init>(Ll/gg00;[I)V

    .line 39
    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_2
    invoke-static {}, Ll/fig0;->a()V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return-object p0
.end method

.method public i()Ll/hg00;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/hg00;->b:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    new-array v1, v0, [I

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    move v3, v2

    .line 8
    :goto_0
    iget-object v4, p0, Ll/hg00;->a:Ll/gg00;

    .line 9
    .line 10
    if-ge v3, v0, :cond_0

    .line 11
    .line 12
    iget-object v5, p0, Ll/hg00;->b:[I

    .line 13
    .line 14
    aget v5, v5, v3

    .line 15
    .line 16
    invoke-virtual {v4, v2, v5}, Ll/gg00;->j(II)I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    aput v4, v1, v3

    .line 21
    .line 22
    add-int/lit8 v3, v3, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance p0, Ll/hg00;

    .line 26
    .line 27
    invoke-direct {p0, v4, v1}, Ll/hg00;-><init>(Ll/gg00;[I)V

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method public j(Ll/hg00;)Ll/hg00;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hg00;->a:Ll/gg00;

    .line 2
    .line 3
    iget-object v1, p1, Ll/hg00;->a:Ll/gg00;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/hg00;->e()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p1}, Ll/hg00;->i()Ll/hg00;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/hg00;->a(Ll/hg00;)Ll/hg00;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string p0, "ModulusPolys do not have same ModulusGF field"

    .line 28
    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hg00;->d()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    mul-int/lit8 v1, v1, 0x8

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/hg00;->d()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    :goto_0
    if-ltz v1, :cond_6

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ll/hg00;->c(I)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_5

    .line 23
    .line 24
    if-gez v2, :cond_0

    .line 25
    .line 26
    const-string v3, " - "

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    neg-int v2, v2

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-lez v3, :cond_1

    .line 38
    .line 39
    const-string v3, " + "

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_1
    const/4 v3, 0x1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    if-eq v2, v3, :cond_3

    .line 48
    .line 49
    :cond_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    :cond_3
    if-eqz v1, :cond_5

    .line 53
    .line 54
    if-ne v1, v3, :cond_4

    .line 55
    .line 56
    const/16 v2, 0x78

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_4
    const-string v2, "x^"

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    :cond_5
    :goto_2
    add-int/lit8 v1, v1, -0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method
