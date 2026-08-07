.class public final Lcom/google/protobuf/Utf8$c;
.super Lcom/google/protobuf/Utf8$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/Utf8;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/Utf8$a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static i()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/kyj0;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/kyj0;->l()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    return v0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    return v0
.end method

.method public static j(JI)I
    .locals 10

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/Utf8$c;->l(JI)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-long v1, v0

    .line 6
    add-long/2addr p0, v1

    .line 7
    sub-int/2addr p2, v0

    .line 8
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 9
    move v1, v0

    .line 10
    :goto_1
    const-wide/16 v2, 0x1

    .line 11
    .line 12
    if-lez p2, :cond_2

    .line 13
    .line 14
    add-long v4, p0, v2

    .line 15
    .line 16
    invoke-static {p0, p1}, Ll/kyj0;->f(J)B

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-ltz v1, :cond_1

    .line 21
    .line 22
    add-int/lit8 p2, p2, -0x1

    .line 23
    .line 24
    move-wide p0, v4

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move-wide p0, v4

    .line 27
    :cond_2
    if-nez p2, :cond_3

    .line 28
    .line 29
    return v0

    .line 30
    :cond_3
    add-int/lit8 v0, p2, -0x1

    .line 31
    .line 32
    const/16 v4, -0x20

    .line 33
    .line 34
    const/4 v5, -0x1

    .line 35
    const/16 v6, -0x41

    .line 36
    .line 37
    if-ge v1, v4, :cond_7

    .line 38
    .line 39
    if-nez v0, :cond_4

    .line 40
    .line 41
    return v1

    .line 42
    :cond_4
    add-int/lit8 p2, p2, -0x2

    .line 43
    .line 44
    const/16 v0, -0x3e

    .line 45
    .line 46
    if-lt v1, v0, :cond_6

    .line 47
    .line 48
    add-long/2addr v2, p0

    .line 49
    invoke-static {p0, p1}, Ll/kyj0;->f(J)B

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-le p0, v6, :cond_5

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_5
    move-wide p0, v2

    .line 57
    goto :goto_0

    .line 58
    :cond_6
    :goto_2
    return v5

    .line 59
    :cond_7
    const/16 v7, -0x10

    .line 60
    .line 61
    const-wide/16 v8, 0x2

    .line 62
    .line 63
    if-ge v1, v7, :cond_c

    .line 64
    .line 65
    const/4 v7, 0x2

    .line 66
    if-ge v0, v7, :cond_8

    .line 67
    .line 68
    invoke-static {p0, p1, v1, v0}, Lcom/google/protobuf/Utf8$c;->n(JII)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    return p0

    .line 73
    :cond_8
    add-int/lit8 p2, p2, -0x3

    .line 74
    .line 75
    add-long/2addr v2, p0

    .line 76
    invoke-static {p0, p1}, Ll/kyj0;->f(J)B

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-gt v0, v6, :cond_b

    .line 81
    .line 82
    const/16 v7, -0x60

    .line 83
    .line 84
    if-ne v1, v4, :cond_9

    .line 85
    .line 86
    if-lt v0, v7, :cond_b

    .line 87
    .line 88
    :cond_9
    const/16 v4, -0x13

    .line 89
    .line 90
    if-ne v1, v4, :cond_a

    .line 91
    .line 92
    if-ge v0, v7, :cond_b

    .line 93
    .line 94
    :cond_a
    add-long/2addr p0, v8

    .line 95
    invoke-static {v2, v3}, Ll/kyj0;->f(J)B

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-le v0, v6, :cond_0

    .line 100
    .line 101
    :cond_b
    return v5

    .line 102
    :cond_c
    const/4 v4, 0x3

    .line 103
    if-ge v0, v4, :cond_d

    .line 104
    .line 105
    invoke-static {p0, p1, v1, v0}, Lcom/google/protobuf/Utf8$c;->n(JII)I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    return p0

    .line 110
    :cond_d
    add-int/lit8 p2, p2, -0x4

    .line 111
    .line 112
    add-long/2addr v2, p0

    .line 113
    invoke-static {p0, p1}, Ll/kyj0;->f(J)B

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-gt v0, v6, :cond_e

    .line 118
    .line 119
    shl-int/lit8 v1, v1, 0x1c

    .line 120
    .line 121
    add-int/lit8 v0, v0, 0x70

    .line 122
    .line 123
    add-int/2addr v1, v0

    .line 124
    shr-int/lit8 v0, v1, 0x1e

    .line 125
    .line 126
    if-nez v0, :cond_e

    .line 127
    .line 128
    add-long/2addr v8, p0

    .line 129
    invoke-static {v2, v3}, Ll/kyj0;->f(J)B

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-gt v0, v6, :cond_e

    .line 134
    .line 135
    const-wide/16 v0, 0x3

    .line 136
    .line 137
    add-long/2addr p0, v0

    .line 138
    invoke-static {v8, v9}, Ll/kyj0;->f(J)B

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-le v0, v6, :cond_0

    .line 143
    .line 144
    :cond_e
    return v5
.end method

.method public static k([BJI)I
    .locals 10

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/google/protobuf/Utf8$c;->m([BJI)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int/2addr p3, v0

    .line 6
    int-to-long v0, v0

    .line 7
    add-long/2addr p1, v0

    .line 8
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 9
    move v1, v0

    .line 10
    :goto_1
    const-wide/16 v2, 0x1

    .line 11
    .line 12
    if-lez p3, :cond_2

    .line 13
    .line 14
    add-long v4, p1, v2

    .line 15
    .line 16
    invoke-static {p0, p1, p2}, Ll/kyj0;->g([BJ)B

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-ltz v1, :cond_1

    .line 21
    .line 22
    add-int/lit8 p3, p3, -0x1

    .line 23
    .line 24
    move-wide p1, v4

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move-wide p1, v4

    .line 27
    :cond_2
    if-nez p3, :cond_3

    .line 28
    .line 29
    return v0

    .line 30
    :cond_3
    add-int/lit8 v0, p3, -0x1

    .line 31
    .line 32
    const/16 v4, -0x20

    .line 33
    .line 34
    const/4 v5, -0x1

    .line 35
    const/16 v6, -0x41

    .line 36
    .line 37
    if-ge v1, v4, :cond_7

    .line 38
    .line 39
    if-nez v0, :cond_4

    .line 40
    .line 41
    return v1

    .line 42
    :cond_4
    add-int/lit8 p3, p3, -0x2

    .line 43
    .line 44
    const/16 v0, -0x3e

    .line 45
    .line 46
    if-lt v1, v0, :cond_6

    .line 47
    .line 48
    add-long/2addr v2, p1

    .line 49
    invoke-static {p0, p1, p2}, Ll/kyj0;->g([BJ)B

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-le p1, v6, :cond_5

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_5
    move-wide p1, v2

    .line 57
    goto :goto_0

    .line 58
    :cond_6
    :goto_2
    return v5

    .line 59
    :cond_7
    const/16 v7, -0x10

    .line 60
    .line 61
    const-wide/16 v8, 0x2

    .line 62
    .line 63
    if-ge v1, v7, :cond_c

    .line 64
    .line 65
    const/4 v7, 0x2

    .line 66
    if-ge v0, v7, :cond_8

    .line 67
    .line 68
    invoke-static {p0, v1, p1, p2, v0}, Lcom/google/protobuf/Utf8$c;->o([BIJI)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    return p0

    .line 73
    :cond_8
    add-int/lit8 p3, p3, -0x3

    .line 74
    .line 75
    add-long/2addr v2, p1

    .line 76
    invoke-static {p0, p1, p2}, Ll/kyj0;->g([BJ)B

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-gt v0, v6, :cond_b

    .line 81
    .line 82
    const/16 v7, -0x60

    .line 83
    .line 84
    if-ne v1, v4, :cond_9

    .line 85
    .line 86
    if-lt v0, v7, :cond_b

    .line 87
    .line 88
    :cond_9
    const/16 v4, -0x13

    .line 89
    .line 90
    if-ne v1, v4, :cond_a

    .line 91
    .line 92
    if-ge v0, v7, :cond_b

    .line 93
    .line 94
    :cond_a
    add-long/2addr p1, v8

    .line 95
    invoke-static {p0, v2, v3}, Ll/kyj0;->g([BJ)B

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-le v0, v6, :cond_0

    .line 100
    .line 101
    :cond_b
    return v5

    .line 102
    :cond_c
    const/4 v4, 0x3

    .line 103
    if-ge v0, v4, :cond_d

    .line 104
    .line 105
    invoke-static {p0, v1, p1, p2, v0}, Lcom/google/protobuf/Utf8$c;->o([BIJI)I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    return p0

    .line 110
    :cond_d
    add-int/lit8 p3, p3, -0x4

    .line 111
    .line 112
    add-long/2addr v2, p1

    .line 113
    invoke-static {p0, p1, p2}, Ll/kyj0;->g([BJ)B

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-gt v0, v6, :cond_e

    .line 118
    .line 119
    shl-int/lit8 v1, v1, 0x1c

    .line 120
    .line 121
    add-int/lit8 v0, v0, 0x70

    .line 122
    .line 123
    add-int/2addr v1, v0

    .line 124
    shr-int/lit8 v0, v1, 0x1e

    .line 125
    .line 126
    if-nez v0, :cond_e

    .line 127
    .line 128
    add-long/2addr v8, p1

    .line 129
    invoke-static {p0, v2, v3}, Ll/kyj0;->g([BJ)B

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-gt v0, v6, :cond_e

    .line 134
    .line 135
    const-wide/16 v0, 0x3

    .line 136
    .line 137
    add-long/2addr p1, v0

    .line 138
    invoke-static {p0, v8, v9}, Ll/kyj0;->g([BJ)B

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-le v0, v6, :cond_0

    .line 143
    .line 144
    :cond_e
    return v5
.end method

.method public static l(JI)I
    .locals 5

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    if-ge p2, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    long-to-int v0, p0

    .line 8
    and-int/lit8 v0, v0, 0x7

    .line 9
    .line 10
    move v1, v0

    .line 11
    :goto_0
    if-lez v1, :cond_2

    .line 12
    .line 13
    const-wide/16 v2, 0x1

    .line 14
    .line 15
    add-long/2addr v2, p0

    .line 16
    invoke-static {p0, p1}, Ll/kyj0;->f(J)B

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-gez p0, :cond_1

    .line 21
    .line 22
    sub-int/2addr v0, v1

    .line 23
    return v0

    .line 24
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 25
    .line 26
    move-wide p0, v2

    .line 27
    goto :goto_0

    .line 28
    :cond_2
    sub-int v0, p2, v0

    .line 29
    .line 30
    :goto_1
    const/16 v1, 0x8

    .line 31
    .line 32
    if-lt v0, v1, :cond_3

    .line 33
    .line 34
    invoke-static {p0, p1}, Ll/kyj0;->h(J)J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    const-wide v3, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    and-long/2addr v1, v3

    .line 44
    const-wide/16 v3, 0x0

    .line 45
    .line 46
    cmp-long v1, v1, v3

    .line 47
    .line 48
    if-nez v1, :cond_3

    .line 49
    .line 50
    const-wide/16 v1, 0x8

    .line 51
    .line 52
    add-long/2addr p0, v1

    .line 53
    add-int/lit8 v0, v0, -0x8

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_3
    sub-int/2addr p2, v0

    .line 57
    return p2
.end method

.method public static m([BJI)I
    .locals 5

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    if-ge p3, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    long-to-int v0, p1

    .line 8
    and-int/lit8 v0, v0, 0x7

    .line 9
    .line 10
    move v1, v0

    .line 11
    :goto_0
    if-lez v1, :cond_2

    .line 12
    .line 13
    const-wide/16 v2, 0x1

    .line 14
    .line 15
    add-long/2addr v2, p1

    .line 16
    invoke-static {p0, p1, p2}, Ll/kyj0;->g([BJ)B

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-gez p1, :cond_1

    .line 21
    .line 22
    sub-int/2addr v0, v1

    .line 23
    return v0

    .line 24
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 25
    .line 26
    move-wide p1, v2

    .line 27
    goto :goto_0

    .line 28
    :cond_2
    sub-int v0, p3, v0

    .line 29
    .line 30
    :goto_1
    const/16 v1, 0x8

    .line 31
    .line 32
    if-lt v0, v1, :cond_3

    .line 33
    .line 34
    invoke-static {p0, p1, p2}, Ll/kyj0;->i([BJ)J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    const-wide v3, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    and-long/2addr v1, v3

    .line 44
    const-wide/16 v3, 0x0

    .line 45
    .line 46
    cmp-long v1, v1, v3

    .line 47
    .line 48
    if-nez v1, :cond_3

    .line 49
    .line 50
    const-wide/16 v1, 0x8

    .line 51
    .line 52
    add-long/2addr p1, v1

    .line 53
    add-int/lit8 v0, v0, -0x8

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_3
    sub-int/2addr p3, v0

    .line 57
    return p3
.end method

.method public static n(JII)I
    .locals 2

    .line 1
    if-eqz p3, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p3, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-ne p3, v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/kyj0;->f(J)B

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    const-wide/16 v0, 0x1

    .line 14
    .line 15
    add-long/2addr p0, v0

    .line 16
    invoke-static {p0, p1}, Ll/kyj0;->f(J)B

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p2, p3, p0}, Lcom/google/protobuf/Utf8;->b(III)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    invoke-static {p0, p1}, Ll/kyj0;->f(J)B

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-static {p2, p0}, Lcom/google/protobuf/Utf8;->a(II)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_2
    invoke-static {p2}, Lcom/google/protobuf/Utf8;->f(I)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0
.end method

.method public static o([BIJI)I
    .locals 2

    .line 1
    if-eqz p4, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p4, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-ne p4, v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0, p2, p3}, Ll/kyj0;->g([BJ)B

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    const-wide/16 v0, 0x1

    .line 14
    .line 15
    add-long/2addr p2, v0

    .line 16
    invoke-static {p0, p2, p3}, Ll/kyj0;->g([BJ)B

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p1, p4, p0}, Lcom/google/protobuf/Utf8;->b(III)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    invoke-static {p0, p2, p3}, Ll/kyj0;->g([BJ)B

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-static {p1, p0}, Lcom/google/protobuf/Utf8;->a(II)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_2
    invoke-static {p1}, Lcom/google/protobuf/Utf8;->f(I)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0
.end method


# virtual methods
.method public a(Ljava/lang/CharSequence;[BII)I
    .locals 23

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    invoke-static {}, Ll/kyj0;->e()J

    .line 10
    .line 11
    .line 12
    move-result-wide v4

    .line 13
    int-to-long v6, v2

    .line 14
    add-long/2addr v4, v6

    .line 15
    int-to-long v6, v3

    .line 16
    add-long/2addr v6, v4

    .line 17
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 18
    .line 19
    .line 20
    move-result v8

    .line 21
    const-string v9, " at index "

    .line 22
    .line 23
    const-string v10, "Failed writing "

    .line 24
    .line 25
    if-gt v8, v3, :cond_c

    .line 26
    .line 27
    array-length v11, v1

    .line 28
    sub-int/2addr v11, v3

    .line 29
    if-lt v11, v2, :cond_c

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    :goto_0
    const-wide/16 v11, 0x1

    .line 33
    .line 34
    const/16 v3, 0x80

    .line 35
    .line 36
    if-ge v2, v8, :cond_0

    .line 37
    .line 38
    invoke-interface {v0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 39
    .line 40
    .line 41
    move-result v13

    .line 42
    if-ge v13, v3, :cond_0

    .line 43
    .line 44
    add-long/2addr v11, v4

    .line 45
    int-to-byte v3, v13

    .line 46
    invoke-static {v1, v4, v5, v3}, Ll/kyj0;->m([BJB)V

    .line 47
    .line 48
    .line 49
    add-int/lit8 v2, v2, 0x1

    .line 50
    .line 51
    move-wide v4, v11

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    if-ne v2, v8, :cond_1

    .line 54
    .line 55
    invoke-static {}, Ll/kyj0;->e()J

    .line 56
    .line 57
    .line 58
    move-result-wide v0

    .line 59
    :goto_1
    sub-long/2addr v4, v0

    .line 60
    long-to-int v0, v4

    .line 61
    return v0

    .line 62
    :cond_1
    :goto_2
    if-ge v2, v8, :cond_b

    .line 63
    .line 64
    invoke-interface {v0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 65
    .line 66
    .line 67
    move-result v13

    .line 68
    if-ge v13, v3, :cond_2

    .line 69
    .line 70
    cmp-long v14, v4, v6

    .line 71
    .line 72
    if-gez v14, :cond_2

    .line 73
    .line 74
    add-long v14, v4, v11

    .line 75
    .line 76
    int-to-byte v13, v13

    .line 77
    invoke-static {v1, v4, v5, v13}, Ll/kyj0;->m([BJB)V

    .line 78
    .line 79
    .line 80
    move-wide/from16 v19, v6

    .line 81
    .line 82
    move-wide/from16 p3, v11

    .line 83
    .line 84
    move-wide v4, v14

    .line 85
    goto/16 :goto_5

    .line 86
    .line 87
    :cond_2
    const/16 v14, 0x800

    .line 88
    .line 89
    const-wide/16 v15, 0x2

    .line 90
    .line 91
    if-ge v13, v14, :cond_3

    .line 92
    .line 93
    sub-long v17, v6, v15

    .line 94
    .line 95
    cmp-long v14, v4, v17

    .line 96
    .line 97
    if-gtz v14, :cond_3

    .line 98
    .line 99
    move-wide/from16 p3, v11

    .line 100
    .line 101
    add-long v11, v4, p3

    .line 102
    .line 103
    ushr-int/lit8 v14, v13, 0x6

    .line 104
    .line 105
    or-int/lit16 v14, v14, 0x3c0

    .line 106
    .line 107
    int-to-byte v14, v14

    .line 108
    invoke-static {v1, v4, v5, v14}, Ll/kyj0;->m([BJB)V

    .line 109
    .line 110
    .line 111
    add-long/2addr v4, v15

    .line 112
    and-int/lit8 v13, v13, 0x3f

    .line 113
    .line 114
    or-int/2addr v13, v3

    .line 115
    int-to-byte v13, v13

    .line 116
    invoke-static {v1, v11, v12, v13}, Ll/kyj0;->m([BJB)V

    .line 117
    .line 118
    .line 119
    move-wide/from16 v19, v6

    .line 120
    .line 121
    goto/16 :goto_5

    .line 122
    .line 123
    :cond_3
    move-wide/from16 p3, v11

    .line 124
    .line 125
    const v11, 0xdfff

    .line 126
    .line 127
    .line 128
    const v12, 0xd800

    .line 129
    .line 130
    .line 131
    const-wide/16 v17, 0x3

    .line 132
    .line 133
    if-lt v13, v12, :cond_5

    .line 134
    .line 135
    if-ge v11, v13, :cond_4

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_4
    move-wide/from16 v19, v6

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_5
    :goto_3
    sub-long v19, v6, v17

    .line 142
    .line 143
    cmp-long v14, v4, v19

    .line 144
    .line 145
    if-gtz v14, :cond_4

    .line 146
    .line 147
    add-long v11, v4, p3

    .line 148
    .line 149
    ushr-int/lit8 v14, v13, 0xc

    .line 150
    .line 151
    or-int/lit16 v14, v14, 0x1e0

    .line 152
    .line 153
    int-to-byte v14, v14

    .line 154
    invoke-static {v1, v4, v5, v14}, Ll/kyj0;->m([BJB)V

    .line 155
    .line 156
    .line 157
    add-long v14, v4, v15

    .line 158
    .line 159
    ushr-int/lit8 v16, v13, 0x6

    .line 160
    .line 161
    move-wide/from16 v19, v6

    .line 162
    .line 163
    and-int/lit8 v6, v16, 0x3f

    .line 164
    .line 165
    or-int/2addr v6, v3

    .line 166
    int-to-byte v6, v6

    .line 167
    invoke-static {v1, v11, v12, v6}, Ll/kyj0;->m([BJB)V

    .line 168
    .line 169
    .line 170
    add-long v4, v4, v17

    .line 171
    .line 172
    and-int/lit8 v6, v13, 0x3f

    .line 173
    .line 174
    or-int/2addr v6, v3

    .line 175
    int-to-byte v6, v6

    .line 176
    invoke-static {v1, v14, v15, v6}, Ll/kyj0;->m([BJB)V

    .line 177
    .line 178
    .line 179
    goto :goto_5

    .line 180
    :goto_4
    const-wide/16 v6, 0x4

    .line 181
    .line 182
    sub-long v21, v19, v6

    .line 183
    .line 184
    cmp-long v14, v4, v21

    .line 185
    .line 186
    if-gtz v14, :cond_8

    .line 187
    .line 188
    add-int/lit8 v11, v2, 0x1

    .line 189
    .line 190
    if-eq v11, v8, :cond_7

    .line 191
    .line 192
    invoke-interface {v0, v11}, Ljava/lang/CharSequence;->charAt(I)C

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    invoke-static {v13, v2}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 197
    .line 198
    .line 199
    move-result v12

    .line 200
    if-eqz v12, :cond_6

    .line 201
    .line 202
    invoke-static {v13, v2}, Ljava/lang/Character;->toCodePoint(CC)I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    add-long v12, v4, p3

    .line 207
    .line 208
    ushr-int/lit8 v14, v2, 0x12

    .line 209
    .line 210
    or-int/lit16 v14, v14, 0xf0

    .line 211
    .line 212
    int-to-byte v14, v14

    .line 213
    invoke-static {v1, v4, v5, v14}, Ll/kyj0;->m([BJB)V

    .line 214
    .line 215
    .line 216
    add-long v14, v4, v15

    .line 217
    .line 218
    ushr-int/lit8 v16, v2, 0xc

    .line 219
    .line 220
    move-wide/from16 v21, v6

    .line 221
    .line 222
    and-int/lit8 v6, v16, 0x3f

    .line 223
    .line 224
    or-int/2addr v6, v3

    .line 225
    int-to-byte v6, v6

    .line 226
    invoke-static {v1, v12, v13, v6}, Ll/kyj0;->m([BJB)V

    .line 227
    .line 228
    .line 229
    add-long v6, v4, v17

    .line 230
    .line 231
    ushr-int/lit8 v12, v2, 0x6

    .line 232
    .line 233
    and-int/lit8 v12, v12, 0x3f

    .line 234
    .line 235
    or-int/2addr v12, v3

    .line 236
    int-to-byte v12, v12

    .line 237
    invoke-static {v1, v14, v15, v12}, Ll/kyj0;->m([BJB)V

    .line 238
    .line 239
    .line 240
    add-long v4, v4, v21

    .line 241
    .line 242
    and-int/lit8 v2, v2, 0x3f

    .line 243
    .line 244
    or-int/2addr v2, v3

    .line 245
    int-to-byte v2, v2

    .line 246
    invoke-static {v1, v6, v7, v2}, Ll/kyj0;->m([BJB)V

    .line 247
    .line 248
    .line 249
    move v2, v11

    .line 250
    :goto_5
    add-int/lit8 v2, v2, 0x1

    .line 251
    .line 252
    move-wide/from16 v11, p3

    .line 253
    .line 254
    move-wide/from16 v6, v19

    .line 255
    .line 256
    goto/16 :goto_2

    .line 257
    .line 258
    :cond_6
    move v2, v11

    .line 259
    :cond_7
    new-instance v0, Lcom/google/protobuf/Utf8$UnpairedSurrogateException;

    .line 260
    .line 261
    add-int/lit8 v2, v2, -0x1

    .line 262
    .line 263
    invoke-direct {v0, v2, v8}, Lcom/google/protobuf/Utf8$UnpairedSurrogateException;-><init>(II)V

    .line 264
    .line 265
    .line 266
    throw v0

    .line 267
    :cond_8
    if-gt v12, v13, :cond_a

    .line 268
    .line 269
    if-gt v13, v11, :cond_a

    .line 270
    .line 271
    add-int/lit8 v1, v2, 0x1

    .line 272
    .line 273
    if-eq v1, v8, :cond_9

    .line 274
    .line 275
    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    invoke-static {v13, v0}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    if-nez v0, :cond_a

    .line 284
    .line 285
    :cond_9
    new-instance v0, Lcom/google/protobuf/Utf8$UnpairedSurrogateException;

    .line 286
    .line 287
    invoke-direct {v0, v2, v8}, Lcom/google/protobuf/Utf8$UnpairedSurrogateException;-><init>(II)V

    .line 288
    .line 289
    .line 290
    throw v0

    .line 291
    :cond_a
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 292
    .line 293
    new-instance v1, Ljava/lang/StringBuilder;

    .line 294
    .line 295
    invoke-direct {v1, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    throw v0

    .line 315
    :cond_b
    invoke-static {}, Ll/kyj0;->e()J

    .line 316
    .line 317
    .line 318
    move-result-wide v0

    .line 319
    goto/16 :goto_1

    .line 320
    .line 321
    :cond_c
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 322
    .line 323
    add-int/lit8 v8, v8, -0x1

    .line 324
    .line 325
    invoke-interface {v0, v8}, Ljava/lang/CharSequence;->charAt(I)C

    .line 326
    .line 327
    .line 328
    move-result v0

    .line 329
    add-int/2addr v2, v3

    .line 330
    new-instance v3, Ljava/lang/StringBuilder;

    .line 331
    .line 332
    invoke-direct {v3, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 333
    .line 334
    .line 335
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    invoke-direct {v1, v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    throw v1
.end method

.method public e(I[BII)I
    .locals 10

    .line 1
    or-int p0, p3, p4

    .line 2
    .line 3
    array-length v0, p2

    .line 4
    sub-int/2addr v0, p4

    .line 5
    or-int/2addr p0, v0

    .line 6
    const/4 v0, 0x0

    .line 7
    if-ltz p0, :cond_11

    .line 8
    .line 9
    invoke-static {}, Ll/kyj0;->e()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    int-to-long v3, p3

    .line 14
    add-long/2addr v1, v3

    .line 15
    invoke-static {}, Ll/kyj0;->e()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    int-to-long p3, p4

    .line 20
    add-long/2addr v3, p3

    .line 21
    if-eqz p1, :cond_10

    .line 22
    .line 23
    cmp-long p0, v1, v3

    .line 24
    .line 25
    if-ltz p0, :cond_0

    .line 26
    .line 27
    return p1

    .line 28
    :cond_0
    int-to-byte p0, p1

    .line 29
    const/16 p3, -0x20

    .line 30
    .line 31
    const/4 p4, -0x1

    .line 32
    const/16 v5, -0x41

    .line 33
    .line 34
    const-wide/16 v6, 0x1

    .line 35
    .line 36
    if-ge p0, p3, :cond_3

    .line 37
    .line 38
    const/16 p1, -0x3e

    .line 39
    .line 40
    if-lt p0, p1, :cond_2

    .line 41
    .line 42
    add-long/2addr v6, v1

    .line 43
    invoke-static {p2, v1, v2}, Ll/kyj0;->g([BJ)B

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-le p0, v5, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    move-wide v1, v6

    .line 51
    goto/16 :goto_3

    .line 52
    .line 53
    :cond_2
    :goto_0
    return p4

    .line 54
    :cond_3
    const/16 v8, -0x10

    .line 55
    .line 56
    if-ge p0, v8, :cond_a

    .line 57
    .line 58
    shr-int/lit8 p1, p1, 0x8

    .line 59
    .line 60
    not-int p1, p1

    .line 61
    int-to-byte p1, p1

    .line 62
    if-nez p1, :cond_5

    .line 63
    .line 64
    add-long v8, v1, v6

    .line 65
    .line 66
    invoke-static {p2, v1, v2}, Ll/kyj0;->g([BJ)B

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    cmp-long v0, v8, v3

    .line 71
    .line 72
    if-ltz v0, :cond_4

    .line 73
    .line 74
    invoke-static {p0, p1}, Lcom/google/protobuf/Utf8;->a(II)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    return p0

    .line 79
    :cond_4
    move-wide v1, v8

    .line 80
    :cond_5
    if-gt p1, v5, :cond_9

    .line 81
    .line 82
    const/16 v0, -0x60

    .line 83
    .line 84
    if-ne p0, p3, :cond_6

    .line 85
    .line 86
    if-lt p1, v0, :cond_9

    .line 87
    .line 88
    :cond_6
    const/16 p3, -0x13

    .line 89
    .line 90
    if-ne p0, p3, :cond_7

    .line 91
    .line 92
    if-ge p1, v0, :cond_9

    .line 93
    .line 94
    :cond_7
    add-long p0, v1, v6

    .line 95
    .line 96
    invoke-static {p2, v1, v2}, Ll/kyj0;->g([BJ)B

    .line 97
    .line 98
    .line 99
    move-result p3

    .line 100
    if-le p3, v5, :cond_8

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_8
    move-wide v1, p0

    .line 104
    goto :goto_3

    .line 105
    :cond_9
    :goto_1
    return p4

    .line 106
    :cond_a
    shr-int/lit8 p3, p1, 0x8

    .line 107
    .line 108
    not-int p3, p3

    .line 109
    int-to-byte p3, p3

    .line 110
    if-nez p3, :cond_c

    .line 111
    .line 112
    add-long v8, v1, v6

    .line 113
    .line 114
    invoke-static {p2, v1, v2}, Ll/kyj0;->g([BJ)B

    .line 115
    .line 116
    .line 117
    move-result p3

    .line 118
    cmp-long p1, v8, v3

    .line 119
    .line 120
    if-ltz p1, :cond_b

    .line 121
    .line 122
    invoke-static {p0, p3}, Lcom/google/protobuf/Utf8;->a(II)I

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    return p0

    .line 127
    :cond_b
    move-wide v1, v8

    .line 128
    goto :goto_2

    .line 129
    :cond_c
    shr-int/lit8 p1, p1, 0x10

    .line 130
    .line 131
    int-to-byte v0, p1

    .line 132
    :goto_2
    if-nez v0, :cond_e

    .line 133
    .line 134
    add-long v8, v1, v6

    .line 135
    .line 136
    invoke-static {p2, v1, v2}, Ll/kyj0;->g([BJ)B

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    cmp-long p1, v8, v3

    .line 141
    .line 142
    if-ltz p1, :cond_d

    .line 143
    .line 144
    invoke-static {p0, p3, v0}, Lcom/google/protobuf/Utf8;->b(III)I

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    return p0

    .line 149
    :cond_d
    move-wide v1, v8

    .line 150
    :cond_e
    if-gt p3, v5, :cond_f

    .line 151
    .line 152
    shl-int/lit8 p0, p0, 0x1c

    .line 153
    .line 154
    add-int/lit8 p3, p3, 0x70

    .line 155
    .line 156
    add-int/2addr p0, p3

    .line 157
    shr-int/lit8 p0, p0, 0x1e

    .line 158
    .line 159
    if-nez p0, :cond_f

    .line 160
    .line 161
    if-gt v0, v5, :cond_f

    .line 162
    .line 163
    add-long p0, v1, v6

    .line 164
    .line 165
    invoke-static {p2, v1, v2}, Ll/kyj0;->g([BJ)B

    .line 166
    .line 167
    .line 168
    move-result p3

    .line 169
    if-le p3, v5, :cond_8

    .line 170
    .line 171
    :cond_f
    return p4

    .line 172
    :cond_10
    :goto_3
    sub-long/2addr v3, v1

    .line 173
    long-to-int p0, v3

    .line 174
    invoke-static {p2, v1, v2, p0}, Lcom/google/protobuf/Utf8$c;->k([BJI)I

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    return p0

    .line 179
    :cond_11
    array-length p0, p2

    .line 180
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    const-string p1, "Array length=%d, index=%d, limit=%d"

    .line 197
    .line 198
    invoke-static {p1, p0}, Ll/zg3;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 199
    .line 200
    .line 201
    return v0
.end method

.method public h(ILjava/nio/ByteBuffer;II)I
    .locals 9

    .line 1
    or-int p0, p3, p4

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/nio/Buffer;->limit()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sub-int/2addr v0, p4

    .line 8
    or-int/2addr p0, v0

    .line 9
    const/4 v0, 0x0

    .line 10
    if-ltz p0, :cond_11

    .line 11
    .line 12
    invoke-static {p2}, Ll/kyj0;->a(Ljava/nio/ByteBuffer;)J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    int-to-long v3, p3

    .line 17
    add-long/2addr v1, v3

    .line 18
    sub-int/2addr p4, p3

    .line 19
    int-to-long p2, p4

    .line 20
    add-long/2addr p2, v1

    .line 21
    if-eqz p1, :cond_10

    .line 22
    .line 23
    cmp-long p0, v1, p2

    .line 24
    .line 25
    if-ltz p0, :cond_0

    .line 26
    .line 27
    return p1

    .line 28
    :cond_0
    int-to-byte p0, p1

    .line 29
    const/16 p4, -0x20

    .line 30
    .line 31
    const/4 v3, -0x1

    .line 32
    const/16 v4, -0x41

    .line 33
    .line 34
    const-wide/16 v5, 0x1

    .line 35
    .line 36
    if-ge p0, p4, :cond_3

    .line 37
    .line 38
    const/16 p1, -0x3e

    .line 39
    .line 40
    if-lt p0, p1, :cond_2

    .line 41
    .line 42
    add-long/2addr v5, v1

    .line 43
    invoke-static {v1, v2}, Ll/kyj0;->f(J)B

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-le p0, v4, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    move-wide v1, v5

    .line 51
    goto/16 :goto_3

    .line 52
    .line 53
    :cond_2
    :goto_0
    return v3

    .line 54
    :cond_3
    const/16 v7, -0x10

    .line 55
    .line 56
    if-ge p0, v7, :cond_a

    .line 57
    .line 58
    shr-int/lit8 p1, p1, 0x8

    .line 59
    .line 60
    not-int p1, p1

    .line 61
    int-to-byte p1, p1

    .line 62
    if-nez p1, :cond_5

    .line 63
    .line 64
    add-long v7, v1, v5

    .line 65
    .line 66
    invoke-static {v1, v2}, Ll/kyj0;->f(J)B

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    cmp-long v0, v7, p2

    .line 71
    .line 72
    if-ltz v0, :cond_4

    .line 73
    .line 74
    invoke-static {p0, p1}, Lcom/google/protobuf/Utf8;->a(II)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    return p0

    .line 79
    :cond_4
    move-wide v1, v7

    .line 80
    :cond_5
    if-gt p1, v4, :cond_9

    .line 81
    .line 82
    const/16 v0, -0x60

    .line 83
    .line 84
    if-ne p0, p4, :cond_6

    .line 85
    .line 86
    if-lt p1, v0, :cond_9

    .line 87
    .line 88
    :cond_6
    const/16 p4, -0x13

    .line 89
    .line 90
    if-ne p0, p4, :cond_7

    .line 91
    .line 92
    if-ge p1, v0, :cond_9

    .line 93
    .line 94
    :cond_7
    add-long p0, v1, v5

    .line 95
    .line 96
    invoke-static {v1, v2}, Ll/kyj0;->f(J)B

    .line 97
    .line 98
    .line 99
    move-result p4

    .line 100
    if-le p4, v4, :cond_8

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_8
    move-wide v1, p0

    .line 104
    goto :goto_3

    .line 105
    :cond_9
    :goto_1
    return v3

    .line 106
    :cond_a
    shr-int/lit8 p4, p1, 0x8

    .line 107
    .line 108
    not-int p4, p4

    .line 109
    int-to-byte p4, p4

    .line 110
    if-nez p4, :cond_c

    .line 111
    .line 112
    add-long v7, v1, v5

    .line 113
    .line 114
    invoke-static {v1, v2}, Ll/kyj0;->f(J)B

    .line 115
    .line 116
    .line 117
    move-result p4

    .line 118
    cmp-long p1, v7, p2

    .line 119
    .line 120
    if-ltz p1, :cond_b

    .line 121
    .line 122
    invoke-static {p0, p4}, Lcom/google/protobuf/Utf8;->a(II)I

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    return p0

    .line 127
    :cond_b
    move-wide v1, v7

    .line 128
    goto :goto_2

    .line 129
    :cond_c
    shr-int/lit8 p1, p1, 0x10

    .line 130
    .line 131
    int-to-byte v0, p1

    .line 132
    :goto_2
    if-nez v0, :cond_e

    .line 133
    .line 134
    add-long v7, v1, v5

    .line 135
    .line 136
    invoke-static {v1, v2}, Ll/kyj0;->f(J)B

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    cmp-long p1, v7, p2

    .line 141
    .line 142
    if-ltz p1, :cond_d

    .line 143
    .line 144
    invoke-static {p0, p4, v0}, Lcom/google/protobuf/Utf8;->b(III)I

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    return p0

    .line 149
    :cond_d
    move-wide v1, v7

    .line 150
    :cond_e
    if-gt p4, v4, :cond_f

    .line 151
    .line 152
    shl-int/lit8 p0, p0, 0x1c

    .line 153
    .line 154
    add-int/lit8 p4, p4, 0x70

    .line 155
    .line 156
    add-int/2addr p0, p4

    .line 157
    shr-int/lit8 p0, p0, 0x1e

    .line 158
    .line 159
    if-nez p0, :cond_f

    .line 160
    .line 161
    if-gt v0, v4, :cond_f

    .line 162
    .line 163
    add-long p0, v1, v5

    .line 164
    .line 165
    invoke-static {v1, v2}, Ll/kyj0;->f(J)B

    .line 166
    .line 167
    .line 168
    move-result p4

    .line 169
    if-le p4, v4, :cond_8

    .line 170
    .line 171
    :cond_f
    return v3

    .line 172
    :cond_10
    :goto_3
    sub-long/2addr p2, v1

    .line 173
    long-to-int p0, p2

    .line 174
    invoke-static {v1, v2, p0}, Lcom/google/protobuf/Utf8$c;->j(JI)I

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    return p0

    .line 179
    :cond_11
    invoke-virtual {p2}, Ljava/nio/Buffer;->limit()I

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 192
    .line 193
    .line 194
    move-result-object p2

    .line 195
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    const-string p1, "buffer limit=%d, index=%d, limit=%d"

    .line 200
    .line 201
    invoke-static {p1, p0}, Ll/zg3;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 202
    .line 203
    .line 204
    return v0
.end method
