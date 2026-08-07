.class public final Lcom/google/common/primitives/UnsignedLongs;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/primitives/UnsignedLongs$a;,
        Lcom/google/common/primitives/UnsignedLongs$LexicographicalComparator;
    }
.end annotation


# direct methods
.method public static a(JJ)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/google/common/primitives/UnsignedLongs;->c(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    invoke-static {p2, p3}, Lcom/google/common/primitives/UnsignedLongs;->c(J)J

    .line 6
    .line 7
    .line 8
    move-result-wide p2

    .line 9
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/primitives/Longs;->c(JJ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static b(JJ)J
    .locals 5

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p2, v0

    .line 4
    .line 5
    if-gez v2, :cond_1

    .line 6
    .line 7
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/primitives/UnsignedLongs;->a(JJ)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-gez p0, :cond_0

    .line 12
    .line 13
    return-wide v0

    .line 14
    :cond_0
    const-wide/16 p0, 0x1

    .line 15
    .line 16
    return-wide p0

    .line 17
    :cond_1
    cmp-long v0, p0, v0

    .line 18
    .line 19
    if-ltz v0, :cond_2

    .line 20
    .line 21
    div-long/2addr p0, p2

    .line 22
    return-wide p0

    .line 23
    :cond_2
    const/4 v0, 0x1

    .line 24
    ushr-long v1, p0, v0

    .line 25
    .line 26
    div-long/2addr v1, p2

    .line 27
    shl-long/2addr v1, v0

    .line 28
    mul-long v3, v1, p2

    .line 29
    .line 30
    sub-long/2addr p0, v3

    .line 31
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/primitives/UnsignedLongs;->a(JJ)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-ltz p0, :cond_3

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_3
    const/4 v0, 0x0

    .line 39
    :goto_0
    int-to-long p0, v0

    .line 40
    add-long/2addr v1, p0

    .line 41
    return-wide v1
.end method

.method public static c(J)J
    .locals 2

    .line 1
    const-wide/high16 v0, -0x8000000000000000L

    xor-long/2addr p0, v0

    return-wide p0
.end method

.method public static d(Ljava/lang/String;I)J
    .locals 7

    .line 1
    invoke-static {p0}, Ll/xn80;->p(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_5

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    if-lt p1, v0, :cond_4

    .line 12
    .line 13
    const/16 v0, 0x24

    .line 14
    .line 15
    if-gt p1, v0, :cond_4

    .line 16
    .line 17
    sget-object v0, Lcom/google/common/primitives/UnsignedLongs$a;->c:[I

    .line 18
    .line 19
    aget v0, v0, p1

    .line 20
    .line 21
    add-int/lit8 v0, v0, -0x1

    .line 22
    .line 23
    const-wide/16 v1, 0x0

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-ge v3, v4, :cond_3

    .line 31
    .line 32
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    invoke-static {v4, p1}, Ljava/lang/Character;->digit(CI)I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    const/4 v5, -0x1

    .line 41
    if-eq v4, v5, :cond_2

    .line 42
    .line 43
    if-le v3, v0, :cond_1

    .line 44
    .line 45
    invoke-static {v1, v2, v4, p1}, Lcom/google/common/primitives/UnsignedLongs$a;->a(JII)Z

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    if-eqz v5, :cond_1

    .line 50
    .line 51
    new-instance p1, Ljava/lang/NumberFormatException;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const-string v1, "Too large for unsigned long: "

    .line 58
    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    goto :goto_1

    .line 66
    :cond_0
    new-instance p0, Ljava/lang/String;

    .line 67
    .line 68
    invoke-direct {p0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :goto_1
    invoke-direct {p1, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    throw p1

    .line 75
    :cond_1
    int-to-long v5, p1

    .line 76
    mul-long/2addr v1, v5

    .line 77
    int-to-long v4, v4

    .line 78
    add-long/2addr v1, v4

    .line 79
    add-int/lit8 v3, v3, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    new-instance p1, Ljava/lang/NumberFormatException;

    .line 83
    .line 84
    invoke-direct {p1, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    throw p1

    .line 88
    :cond_3
    return-wide v1

    .line 89
    :cond_4
    new-instance p0, Ljava/lang/NumberFormatException;

    .line 90
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const/16 v1, 0x1a

    .line 94
    .line 95
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 96
    .line 97
    .line 98
    const-string v1, "illegal radix: "

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-direct {p0, p1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    throw p0

    .line 114
    :cond_5
    new-instance p0, Ljava/lang/NumberFormatException;

    .line 115
    .line 116
    const-string p1, "empty string"

    .line 117
    .line 118
    invoke-direct {p0, p1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    throw p0
.end method

.method public static e(JJ)J
    .locals 5

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p2, v0

    .line 4
    .line 5
    if-gez v2, :cond_1

    .line 6
    .line 7
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/primitives/UnsignedLongs;->a(JJ)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-gez v0, :cond_0

    .line 12
    .line 13
    return-wide p0

    .line 14
    :cond_0
    sub-long/2addr p0, p2

    .line 15
    return-wide p0

    .line 16
    :cond_1
    cmp-long v2, p0, v0

    .line 17
    .line 18
    if-ltz v2, :cond_2

    .line 19
    .line 20
    rem-long/2addr p0, p2

    .line 21
    return-wide p0

    .line 22
    :cond_2
    const/4 v2, 0x1

    .line 23
    ushr-long v3, p0, v2

    .line 24
    .line 25
    div-long/2addr v3, p2

    .line 26
    shl-long v2, v3, v2

    .line 27
    .line 28
    mul-long/2addr v2, p2

    .line 29
    sub-long/2addr p0, v2

    .line 30
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/primitives/UnsignedLongs;->a(JJ)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-ltz v2, :cond_3

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_3
    move-wide p2, v0

    .line 38
    :goto_0
    sub-long/2addr p0, p2

    .line 39
    return-wide p0
.end method

.method public static f(J)Ljava/lang/String;
    .locals 1

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Lcom/google/common/primitives/UnsignedLongs;->g(JI)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static g(JI)Ljava/lang/String;
    .locals 9

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-lt p2, v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x24

    .line 6
    .line 7
    if-gt p2, v0, :cond_0

    .line 8
    .line 9
    move v0, v1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    :goto_0
    const-string v2, "radix (%s) must be between Character.MIN_RADIX and Character.MAX_RADIX"

    .line 13
    .line 14
    invoke-static {v0, v2, p2}, Ll/xn80;->f(ZLjava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v2, 0x0

    .line 18
    .line 19
    cmp-long v0, p0, v2

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    const-string p0, "0"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    if-lez v0, :cond_2

    .line 27
    .line 28
    invoke-static {p0, p1, p2}, Ljava/lang/Long;->toString(JI)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_2
    const/16 v0, 0x40

    .line 34
    .line 35
    new-array v4, v0, [C

    .line 36
    .line 37
    add-int/lit8 v5, p2, -0x1

    .line 38
    .line 39
    and-int v6, p2, v5

    .line 40
    .line 41
    if-nez v6, :cond_4

    .line 42
    .line 43
    invoke-static {p2}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    :cond_3
    add-int/lit8 v0, v0, -0x1

    .line 48
    .line 49
    long-to-int v1, p0

    .line 50
    and-int/2addr v1, v5

    .line 51
    invoke-static {v1, p2}, Ljava/lang/Character;->forDigit(II)C

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    aput-char v1, v4, v0

    .line 56
    .line 57
    ushr-long/2addr p0, v6

    .line 58
    cmp-long v1, p0, v2

    .line 59
    .line 60
    if-nez v1, :cond_3

    .line 61
    .line 62
    goto :goto_3

    .line 63
    :cond_4
    and-int/lit8 v0, p2, 0x1

    .line 64
    .line 65
    if-nez v0, :cond_5

    .line 66
    .line 67
    ushr-long v0, p0, v1

    .line 68
    .line 69
    ushr-int/lit8 v5, p2, 0x1

    .line 70
    .line 71
    int-to-long v5, v5

    .line 72
    div-long/2addr v0, v5

    .line 73
    goto :goto_1

    .line 74
    :cond_5
    int-to-long v0, p2

    .line 75
    invoke-static {p0, p1, v0, v1}, Lcom/google/common/primitives/UnsignedLongs;->b(JJ)J

    .line 76
    .line 77
    .line 78
    move-result-wide v0

    .line 79
    :goto_1
    int-to-long v5, p2

    .line 80
    mul-long v7, v0, v5

    .line 81
    .line 82
    sub-long/2addr p0, v7

    .line 83
    long-to-int p0, p0

    .line 84
    invoke-static {p0, p2}, Ljava/lang/Character;->forDigit(II)C

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    const/16 p1, 0x3f

    .line 89
    .line 90
    aput-char p0, v4, p1

    .line 91
    .line 92
    :goto_2
    cmp-long p0, v0, v2

    .line 93
    .line 94
    if-lez p0, :cond_6

    .line 95
    .line 96
    add-int/lit8 p1, p1, -0x1

    .line 97
    .line 98
    rem-long v7, v0, v5

    .line 99
    .line 100
    long-to-int p0, v7

    .line 101
    invoke-static {p0, p2}, Ljava/lang/Character;->forDigit(II)C

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    aput-char p0, v4, p1

    .line 106
    .line 107
    div-long/2addr v0, v5

    .line 108
    goto :goto_2

    .line 109
    :cond_6
    move v0, p1

    .line 110
    :goto_3
    new-instance p0, Ljava/lang/String;

    .line 111
    .line 112
    rsub-int/lit8 p1, v0, 0x40

    .line 113
    .line 114
    invoke-direct {p0, v4, v0, p1}, Ljava/lang/String;-><init>([CII)V

    .line 115
    .line 116
    .line 117
    return-object p0
.end method
