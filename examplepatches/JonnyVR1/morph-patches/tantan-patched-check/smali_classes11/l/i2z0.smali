.class public final Ll/i2z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/Random;

.field public final b:[I

.field public final c:[I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 29
    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Ll/i2z0;-><init>(ILjava/util/Random;)V

    return-void
.end method

.method public constructor <init>(ILjava/util/Random;)V
    .locals 0

    const/4 p1, 0x0

    .line 27
    new-array p1, p1, [I

    .line 28
    invoke-direct {p0, p1, p2}, Ll/i2z0;-><init>([ILjava/util/Random;)V

    return-void
.end method

.method public constructor <init>([ILjava/util/Random;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/i2z0;->b:[I

    .line 5
    .line 6
    iput-object p2, p0, Ll/i2z0;->a:Ljava/util/Random;

    .line 7
    .line 8
    array-length p2, p1

    .line 9
    new-array p2, p2, [I

    .line 10
    .line 11
    iput-object p2, p0, Ll/i2z0;->c:[I

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    :goto_0
    array-length v0, p1

    .line 15
    if-ge p2, v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/i2z0;->c:[I

    .line 18
    .line 19
    aget v1, p1, p2

    .line 20
    .line 21
    aput p2, v0, v1

    .line 22
    .line 23
    add-int/lit8 p2, p2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/i2z0;->b:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    aget p0, p0, v0

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public final b()I
    .locals 2

    .line 1
    iget-object p0, p0, Ll/i2z0;->b:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, -0x1

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    aget p0, p0, v0

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    return v1
.end method

.method public final c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i2z0;->b:[I

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public final d(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i2z0;->c:[I

    .line 2
    .line 3
    aget p1, v0, p1

    .line 4
    .line 5
    add-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    iget-object p0, p0, Ll/i2z0;->b:[I

    .line 8
    .line 9
    array-length v0, p0

    .line 10
    if-ge p1, v0, :cond_0

    .line 11
    .line 12
    aget p0, p0, p1

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, -0x1

    .line 16
    return p0
.end method

.method public final e(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i2z0;->c:[I

    .line 2
    .line 3
    aget p1, v0, p1

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    add-int/2addr p1, v0

    .line 7
    if-ltz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/i2z0;->b:[I

    .line 10
    .line 11
    aget p0, p0, p1

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    return v0
.end method

.method public final f()Ll/i2z0;
    .locals 4

    .line 1
    new-instance v0, Ll/i2z0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/i2z0;->a:Ljava/util/Random;

    .line 4
    .line 5
    new-instance v1, Ljava/util/Random;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/Random;->nextLong()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    invoke-direct {v1, v2, v3}, Ljava/util/Random;-><init>(J)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    invoke-direct {v0, p0, v1}, Ll/i2z0;-><init>(ILjava/util/Random;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public final g(II)Ll/i2z0;
    .locals 7

    .line 1
    new-array p1, p2, [I

    .line 2
    .line 3
    new-array v0, p2, [I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, p2, :cond_0

    .line 8
    .line 9
    iget-object v3, p0, Ll/i2z0;->a:Ljava/util/Random;

    .line 10
    .line 11
    iget-object v4, p0, Ll/i2z0;->b:[I

    .line 12
    .line 13
    array-length v4, v4

    .line 14
    add-int/lit8 v4, v4, 0x1

    .line 15
    .line 16
    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    aput v3, p1, v2

    .line 21
    .line 22
    iget-object v3, p0, Ll/i2z0;->a:Ljava/util/Random;

    .line 23
    .line 24
    add-int/lit8 v4, v2, 0x1

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    aget v5, v0, v3

    .line 31
    .line 32
    aput v5, v0, v2

    .line 33
    .line 34
    aput v2, v0, v3

    .line 35
    .line 36
    move v2, v4

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-static {p1}, Ljava/util/Arrays;->sort([I)V

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Ll/i2z0;->b:[I

    .line 42
    .line 43
    array-length v2, v2

    .line 44
    add-int/2addr v2, p2

    .line 45
    new-array v2, v2, [I

    .line 46
    .line 47
    move v3, v1

    .line 48
    move v4, v3

    .line 49
    :goto_1
    iget-object v5, p0, Ll/i2z0;->b:[I

    .line 50
    .line 51
    array-length v6, v5

    .line 52
    add-int/2addr v6, p2

    .line 53
    if-ge v1, v6, :cond_3

    .line 54
    .line 55
    if-ge v3, p2, :cond_1

    .line 56
    .line 57
    aget v6, p1, v3

    .line 58
    .line 59
    if-ne v4, v6, :cond_1

    .line 60
    .line 61
    add-int/lit8 v5, v3, 0x1

    .line 62
    .line 63
    aget v3, v0, v3

    .line 64
    .line 65
    aput v3, v2, v1

    .line 66
    .line 67
    move v3, v5

    .line 68
    goto :goto_2

    .line 69
    :cond_1
    add-int/lit8 v6, v4, 0x1

    .line 70
    .line 71
    aget v4, v5, v4

    .line 72
    .line 73
    aput v4, v2, v1

    .line 74
    .line 75
    if-ltz v4, :cond_2

    .line 76
    .line 77
    add-int/2addr v4, p2

    .line 78
    aput v4, v2, v1

    .line 79
    .line 80
    :cond_2
    move v4, v6

    .line 81
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    iget-object p0, p0, Ll/i2z0;->a:Ljava/util/Random;

    .line 85
    .line 86
    new-instance p1, Ll/i2z0;

    .line 87
    .line 88
    new-instance p2, Ljava/util/Random;

    .line 89
    .line 90
    invoke-virtual {p0}, Ljava/util/Random;->nextLong()J

    .line 91
    .line 92
    .line 93
    move-result-wide v0

    .line 94
    invoke-direct {p2, v0, v1}, Ljava/util/Random;-><init>(J)V

    .line 95
    .line 96
    .line 97
    invoke-direct {p1, v2, p2}, Ll/i2z0;-><init>([ILjava/util/Random;)V

    .line 98
    .line 99
    .line 100
    return-object p1
.end method

.method public final h(II)Ll/i2z0;
    .locals 4

    .line 1
    iget-object p1, p0, Ll/i2z0;->b:[I

    .line 2
    .line 3
    array-length p1, p1

    .line 4
    sub-int/2addr p1, p2

    .line 5
    new-array p1, p1, [I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    move v1, v0

    .line 9
    :goto_0
    iget-object v2, p0, Ll/i2z0;->b:[I

    .line 10
    .line 11
    array-length v3, v2

    .line 12
    if-ge v0, v3, :cond_2

    .line 13
    .line 14
    aget v2, v2, v0

    .line 15
    .line 16
    if-ltz v2, :cond_0

    .line 17
    .line 18
    if-ge v2, p2, :cond_0

    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    sub-int v3, v0, v1

    .line 24
    .line 25
    if-ltz v2, :cond_1

    .line 26
    .line 27
    sub-int/2addr v2, p2

    .line 28
    :cond_1
    aput v2, p1, v3

    .line 29
    .line 30
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    iget-object p0, p0, Ll/i2z0;->a:Ljava/util/Random;

    .line 34
    .line 35
    new-instance p2, Ll/i2z0;

    .line 36
    .line 37
    new-instance v0, Ljava/util/Random;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/util/Random;->nextLong()J

    .line 40
    .line 41
    .line 42
    move-result-wide v1

    .line 43
    invoke-direct {v0, v1, v2}, Ljava/util/Random;-><init>(J)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p2, p1, v0}, Ll/i2z0;-><init>([ILjava/util/Random;)V

    .line 47
    .line 48
    .line 49
    return-object p2
.end method
