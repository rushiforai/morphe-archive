.class public final Ll/myd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/je2;

.field public final b:[Ll/nyd;

.field public c:Ll/cf3;

.field public final d:I


# direct methods
.method public constructor <init>(Ll/je2;Ll/cf3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/myd;->a:Ll/je2;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/je2;->a()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/myd;->d:I

    .line 11
    .line 12
    iput-object p2, p0, Ll/myd;->c:Ll/cf3;

    .line 13
    .line 14
    add-int/lit8 p1, p1, 0x2

    .line 15
    .line 16
    new-array p1, p1, [Ll/nyd;

    .line 17
    .line 18
    iput-object p1, p0, Ll/myd;->b:[Ll/nyd;

    .line 19
    .line 20
    return-void
.end method

.method public static b(Ll/wc5;Ll/wc5;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ll/wc5;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/wc5;->a()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, Ll/wc5;->a()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-ne v1, v2, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/wc5;->c()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {p0, p1}, Ll/wc5;->i(I)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_1
    return v0
.end method

.method public static c(IILl/wc5;)I
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p2}, Ll/wc5;->g()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    invoke-virtual {p2, p0}, Ll/wc5;->h(I)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p2, p0}, Ll/wc5;->i(I)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 22
    .line 23
    :cond_2
    :goto_0
    return p1
.end method


# virtual methods
.method public final a(Ll/nyd;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    check-cast p1, Ll/oyd;

    .line 4
    .line 5
    iget-object p0, p0, Ll/myd;->a:Ll/je2;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/oyd;->g(Ll/je2;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final d()I
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/myd;->f()I

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
    const/4 v2, 0x1

    .line 10
    move v3, v2

    .line 11
    :goto_0
    iget v4, p0, Ll/myd;->d:I

    .line 12
    .line 13
    add-int/2addr v4, v2

    .line 14
    if-ge v3, v4, :cond_3

    .line 15
    .line 16
    iget-object v4, p0, Ll/myd;->b:[Ll/nyd;

    .line 17
    .line 18
    aget-object v4, v4, v3

    .line 19
    .line 20
    invoke-virtual {v4}, Ll/nyd;->d()[Ll/wc5;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    move v5, v1

    .line 25
    :goto_1
    array-length v6, v4

    .line 26
    if-ge v5, v6, :cond_2

    .line 27
    .line 28
    aget-object v6, v4, v5

    .line 29
    .line 30
    if-eqz v6, :cond_1

    .line 31
    .line 32
    invoke-virtual {v6}, Ll/wc5;->g()Z

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    if-nez v6, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, v3, v5, v4}, Ll/myd;->e(II[Ll/wc5;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    return v0
.end method

.method public final e(II[Ll/wc5;)V
    .locals 9

    .line 1
    aget-object v0, p3, p2

    .line 2
    .line 3
    iget-object v1, p0, Ll/myd;->b:[Ll/nyd;

    .line 4
    .line 5
    add-int/lit8 v2, p1, -0x1

    .line 6
    .line 7
    aget-object v1, v1, v2

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/nyd;->d()[Ll/wc5;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Ll/myd;->b:[Ll/nyd;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    add-int/2addr p1, v2

    .line 17
    aget-object p0, p0, p1

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/nyd;->d()[Ll/wc5;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object p0, v1

    .line 27
    :goto_0
    const/16 p1, 0xe

    .line 28
    .line 29
    new-array v3, p1, [Ll/wc5;

    .line 30
    .line 31
    aget-object v4, v1, p2

    .line 32
    .line 33
    const/4 v5, 0x2

    .line 34
    aput-object v4, v3, v5

    .line 35
    .line 36
    const/4 v4, 0x3

    .line 37
    aget-object v6, p0, p2

    .line 38
    .line 39
    aput-object v6, v3, v4

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    if-lez p2, :cond_1

    .line 43
    .line 44
    add-int/lit8 v6, p2, -0x1

    .line 45
    .line 46
    aget-object v7, p3, v6

    .line 47
    .line 48
    aput-object v7, v3, v4

    .line 49
    .line 50
    const/4 v7, 0x4

    .line 51
    aget-object v8, v1, v6

    .line 52
    .line 53
    aput-object v8, v3, v7

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    aget-object v6, p0, v6

    .line 57
    .line 58
    aput-object v6, v3, v7

    .line 59
    .line 60
    :cond_1
    if-le p2, v2, :cond_2

    .line 61
    .line 62
    add-int/lit8 v6, p2, -0x2

    .line 63
    .line 64
    aget-object v7, p3, v6

    .line 65
    .line 66
    const/16 v8, 0x8

    .line 67
    .line 68
    aput-object v7, v3, v8

    .line 69
    .line 70
    const/16 v7, 0xa

    .line 71
    .line 72
    aget-object v8, v1, v6

    .line 73
    .line 74
    aput-object v8, v3, v7

    .line 75
    .line 76
    const/16 v7, 0xb

    .line 77
    .line 78
    aget-object v6, p0, v6

    .line 79
    .line 80
    aput-object v6, v3, v7

    .line 81
    .line 82
    :cond_2
    array-length v6, p3

    .line 83
    sub-int/2addr v6, v2

    .line 84
    if-ge p2, v6, :cond_3

    .line 85
    .line 86
    add-int/lit8 v6, p2, 0x1

    .line 87
    .line 88
    aget-object v7, p3, v6

    .line 89
    .line 90
    aput-object v7, v3, v2

    .line 91
    .line 92
    const/4 v2, 0x6

    .line 93
    aget-object v7, v1, v6

    .line 94
    .line 95
    aput-object v7, v3, v2

    .line 96
    .line 97
    const/4 v2, 0x7

    .line 98
    aget-object v6, p0, v6

    .line 99
    .line 100
    aput-object v6, v3, v2

    .line 101
    .line 102
    :cond_3
    array-length v2, p3

    .line 103
    sub-int/2addr v2, v5

    .line 104
    if-ge p2, v2, :cond_4

    .line 105
    .line 106
    add-int/2addr p2, v5

    .line 107
    aget-object p3, p3, p2

    .line 108
    .line 109
    const/16 v2, 0x9

    .line 110
    .line 111
    aput-object p3, v3, v2

    .line 112
    .line 113
    const/16 p3, 0xc

    .line 114
    .line 115
    aget-object v1, v1, p2

    .line 116
    .line 117
    aput-object v1, v3, p3

    .line 118
    .line 119
    const/16 p3, 0xd

    .line 120
    .line 121
    aget-object p0, p0, p2

    .line 122
    .line 123
    aput-object p0, v3, p3

    .line 124
    .line 125
    :cond_4
    :goto_1
    if-ge v4, p1, :cond_6

    .line 126
    .line 127
    aget-object p0, v3, v4

    .line 128
    .line 129
    invoke-static {v0, p0}, Ll/myd;->b(Ll/wc5;Ll/wc5;)Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-eqz p0, :cond_5

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_5
    add-int/lit8 v4, v4, 0x1

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_6
    :goto_2
    return-void
.end method

.method public final f()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/myd;->g()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/myd;->h()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Ll/myd;->i()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    add-int/2addr v0, p0

    .line 13
    return v0
.end method

.method public final g()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/myd;->b:[Ll/nyd;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v2, v0, v1

    .line 5
    .line 6
    if-eqz v2, :cond_3

    .line 7
    .line 8
    iget v3, p0, Ll/myd;->d:I

    .line 9
    .line 10
    const/4 v4, 0x1

    .line 11
    add-int/2addr v3, v4

    .line 12
    aget-object v0, v0, v3

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    invoke-virtual {v2}, Ll/nyd;->d()[Ll/wc5;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v2, p0, Ll/myd;->b:[Ll/nyd;

    .line 22
    .line 23
    iget v3, p0, Ll/myd;->d:I

    .line 24
    .line 25
    add-int/2addr v3, v4

    .line 26
    aget-object v2, v2, v3

    .line 27
    .line 28
    invoke-virtual {v2}, Ll/nyd;->d()[Ll/wc5;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    :goto_0
    array-length v3, v0

    .line 33
    if-ge v1, v3, :cond_3

    .line 34
    .line 35
    aget-object v3, v0, v1

    .line 36
    .line 37
    if-eqz v3, :cond_2

    .line 38
    .line 39
    aget-object v5, v2, v1

    .line 40
    .line 41
    if-eqz v5, :cond_2

    .line 42
    .line 43
    invoke-virtual {v3}, Ll/wc5;->c()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    aget-object v5, v2, v1

    .line 48
    .line 49
    invoke-virtual {v5}, Ll/wc5;->c()I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    if-ne v3, v5, :cond_2

    .line 54
    .line 55
    move v3, v4

    .line 56
    :goto_1
    iget v5, p0, Ll/myd;->d:I

    .line 57
    .line 58
    if-gt v3, v5, :cond_2

    .line 59
    .line 60
    iget-object v5, p0, Ll/myd;->b:[Ll/nyd;

    .line 61
    .line 62
    aget-object v5, v5, v3

    .line 63
    .line 64
    invoke-virtual {v5}, Ll/nyd;->d()[Ll/wc5;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    aget-object v5, v5, v1

    .line 69
    .line 70
    if-eqz v5, :cond_1

    .line 71
    .line 72
    aget-object v6, v0, v1

    .line 73
    .line 74
    invoke-virtual {v6}, Ll/wc5;->c()I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    invoke-virtual {v5, v6}, Ll/wc5;->i(I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v5}, Ll/wc5;->g()Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-nez v5, :cond_1

    .line 86
    .line 87
    iget-object v5, p0, Ll/myd;->b:[Ll/nyd;

    .line 88
    .line 89
    aget-object v5, v5, v3

    .line 90
    .line 91
    invoke-virtual {v5}, Ll/nyd;->d()[Ll/wc5;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    const/4 v6, 0x0

    .line 96
    aput-object v6, v5, v1

    .line 97
    .line 98
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_3
    :goto_2
    return-void
.end method

.method public final h()I
    .locals 9

    .line 1
    iget-object v0, p0, Ll/myd;->b:[Ll/nyd;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {v0}, Ll/nyd;->d()[Ll/wc5;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    move v2, v1

    .line 14
    move v3, v2

    .line 15
    :goto_0
    array-length v4, v0

    .line 16
    if-ge v2, v4, :cond_3

    .line 17
    .line 18
    aget-object v4, v0, v2

    .line 19
    .line 20
    if-eqz v4, :cond_2

    .line 21
    .line 22
    invoke-virtual {v4}, Ll/wc5;->c()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const/4 v5, 0x1

    .line 27
    move v7, v1

    .line 28
    move v6, v5

    .line 29
    :goto_1
    iget v8, p0, Ll/myd;->d:I

    .line 30
    .line 31
    add-int/2addr v8, v5

    .line 32
    if-ge v6, v8, :cond_2

    .line 33
    .line 34
    const/4 v8, 0x2

    .line 35
    if-ge v7, v8, :cond_2

    .line 36
    .line 37
    iget-object v8, p0, Ll/myd;->b:[Ll/nyd;

    .line 38
    .line 39
    aget-object v8, v8, v6

    .line 40
    .line 41
    invoke-virtual {v8}, Ll/nyd;->d()[Ll/wc5;

    .line 42
    .line 43
    .line 44
    move-result-object v8

    .line 45
    aget-object v8, v8, v2

    .line 46
    .line 47
    if-eqz v8, :cond_1

    .line 48
    .line 49
    invoke-static {v4, v7, v8}, Ll/myd;->c(IILl/wc5;)I

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    invoke-virtual {v8}, Ll/wc5;->g()Z

    .line 54
    .line 55
    .line 56
    move-result v8

    .line 57
    if-nez v8, :cond_1

    .line 58
    .line 59
    add-int/lit8 v3, v3, 0x1

    .line 60
    .line 61
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    return v3
.end method

.method public final i()I
    .locals 8

    .line 1
    iget-object v0, p0, Ll/myd;->b:[Ll/nyd;

    .line 2
    .line 3
    iget v1, p0, Ll/myd;->d:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    aget-object v2, v0, v2

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    return v3

    .line 13
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    aget-object v0, v0, v1

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/nyd;->d()[Ll/wc5;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    move v1, v3

    .line 22
    move v2, v1

    .line 23
    :goto_0
    array-length v4, v0

    .line 24
    if-ge v1, v4, :cond_3

    .line 25
    .line 26
    aget-object v4, v0, v1

    .line 27
    .line 28
    if-eqz v4, :cond_2

    .line 29
    .line 30
    invoke-virtual {v4}, Ll/wc5;->c()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    iget v5, p0, Ll/myd;->d:I

    .line 35
    .line 36
    add-int/lit8 v5, v5, 0x1

    .line 37
    .line 38
    move v6, v3

    .line 39
    :goto_1
    if-lez v5, :cond_2

    .line 40
    .line 41
    const/4 v7, 0x2

    .line 42
    if-ge v6, v7, :cond_2

    .line 43
    .line 44
    iget-object v7, p0, Ll/myd;->b:[Ll/nyd;

    .line 45
    .line 46
    aget-object v7, v7, v5

    .line 47
    .line 48
    invoke-virtual {v7}, Ll/nyd;->d()[Ll/wc5;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    aget-object v7, v7, v1

    .line 53
    .line 54
    if-eqz v7, :cond_1

    .line 55
    .line 56
    invoke-static {v4, v6, v7}, Ll/myd;->c(IILl/wc5;)I

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    invoke-virtual {v7}, Ll/wc5;->g()Z

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    if-nez v7, :cond_1

    .line 65
    .line 66
    add-int/lit8 v2, v2, 0x1

    .line 67
    .line 68
    :cond_1
    add-int/lit8 v5, v5, -0x1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    return v2
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Ll/myd;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/myd;->a:Ll/je2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/je2;->b()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/myd;->a:Ll/je2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/je2;->c()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m()Ll/cf3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/myd;->c:Ll/cf3;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(I)Ll/nyd;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/myd;->b:[Ll/nyd;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public o()[Ll/nyd;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/myd;->b:[Ll/nyd;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/myd;->a(Ll/nyd;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/myd;->b:[Ll/nyd;

    .line 10
    .line 11
    iget v1, p0, Ll/myd;->d:I

    .line 12
    .line 13
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    aget-object v0, v0, v1

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/myd;->a(Ll/nyd;)V

    .line 18
    .line 19
    .line 20
    const/16 v0, 0x3a0

    .line 21
    .line 22
    :goto_0
    invoke-virtual {p0}, Ll/myd;->d()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-lez v1, :cond_1

    .line 27
    .line 28
    if-lt v1, v0, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    move v0, v1

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    :goto_1
    iget-object p0, p0, Ll/myd;->b:[Ll/nyd;

    .line 34
    .line 35
    return-object p0
.end method

.method public p(Ll/cf3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/myd;->c:Ll/cf3;

    .line 2
    .line 3
    return-void
.end method

.method public q(ILl/nyd;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/myd;->b:[Ll/nyd;

    .line 2
    .line 3
    aput-object p2, p0, p1

    .line 4
    .line 5
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/myd;->b:[Ll/nyd;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v2, v0, v1

    .line 5
    .line 6
    if-nez v2, :cond_0

    .line 7
    .line 8
    iget v2, p0, Ll/myd;->d:I

    .line 9
    .line 10
    add-int/lit8 v2, v2, 0x1

    .line 11
    .line 12
    aget-object v2, v0, v2

    .line 13
    .line 14
    :cond_0
    new-instance v0, Ljava/util/Formatter;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/Formatter;-><init>()V

    .line 17
    .line 18
    .line 19
    move v3, v1

    .line 20
    :goto_0
    :try_start_0
    invoke-virtual {v2}, Ll/nyd;->d()[Ll/wc5;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    array-length v4, v4

    .line 25
    if-ge v3, v4, :cond_4

    .line 26
    .line 27
    const-string v4, "CW %3d:"

    .line 28
    .line 29
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-virtual {v0, v4, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 38
    .line 39
    .line 40
    move v4, v1

    .line 41
    :goto_1
    iget v5, p0, Ll/myd;->d:I

    .line 42
    .line 43
    add-int/lit8 v5, v5, 0x2

    .line 44
    .line 45
    if-ge v4, v5, :cond_3

    .line 46
    .line 47
    iget-object v5, p0, Ll/myd;->b:[Ll/nyd;

    .line 48
    .line 49
    aget-object v5, v5, v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    const-string v6, "    |   "

    .line 52
    .line 53
    if-nez v5, :cond_1

    .line 54
    .line 55
    :try_start_1
    new-array v5, v1, [Ljava/lang/Object;

    .line 56
    .line 57
    invoke-virtual {v0, v6, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 58
    .line 59
    .line 60
    goto :goto_2

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    goto :goto_3

    .line 63
    :cond_1
    invoke-virtual {v5}, Ll/nyd;->d()[Ll/wc5;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    aget-object v5, v5, v3

    .line 68
    .line 69
    if-nez v5, :cond_2

    .line 70
    .line 71
    new-array v5, v1, [Ljava/lang/Object;

    .line 72
    .line 73
    invoke-virtual {v0, v6, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 74
    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_2
    const-string v6, " %3d|%3d"

    .line 78
    .line 79
    invoke-virtual {v5}, Ll/wc5;->c()I

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    invoke-virtual {v5}, Ll/wc5;->e()I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    filled-new-array {v7, v5}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-virtual {v0, v6, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 100
    .line 101
    .line 102
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_3
    const-string v4, "%n"

    .line 106
    .line 107
    new-array v5, v1, [Ljava/lang/Object;

    .line 108
    .line 109
    invoke-virtual {v0, v4, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 110
    .line 111
    .line 112
    add-int/lit8 v3, v3, 0x1

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_4
    invoke-virtual {v0}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 119
    invoke-virtual {v0}, Ljava/util/Formatter;->close()V

    .line 120
    .line 121
    .line 122
    return-object p0

    .line 123
    :goto_3
    :try_start_2
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 124
    :catchall_1
    move-exception v1

    .line 125
    :try_start_3
    invoke-virtual {v0}, Ljava/util/Formatter;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 126
    .line 127
    .line 128
    goto :goto_4

    .line 129
    :catchall_2
    move-exception v0

    .line 130
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 131
    .line 132
    .line 133
    :goto_4
    throw v1
.end method
