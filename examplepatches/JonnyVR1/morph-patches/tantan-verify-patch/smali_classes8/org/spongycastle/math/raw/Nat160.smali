.class public abstract Lorg/spongycastle/math/raw/Nat160;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final M:J = 0xffffffffL


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static add([I[I[I)I
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    int-to-long v1, v1

    .line 5
    const-wide v3, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v1, v3

    .line 11
    aget v5, p1, v0

    .line 12
    .line 13
    int-to-long v5, v5

    .line 14
    and-long/2addr v5, v3

    .line 15
    add-long/2addr v1, v5

    .line 16
    long-to-int v5, v1

    .line 17
    aput v5, p2, v0

    .line 18
    .line 19
    const/16 v0, 0x20

    .line 20
    .line 21
    ushr-long/2addr v1, v0

    .line 22
    const/4 v5, 0x1

    .line 23
    aget v6, p0, v5

    .line 24
    .line 25
    int-to-long v6, v6

    .line 26
    and-long/2addr v6, v3

    .line 27
    aget v8, p1, v5

    .line 28
    .line 29
    int-to-long v8, v8

    .line 30
    and-long/2addr v8, v3

    .line 31
    add-long/2addr v6, v8

    .line 32
    add-long/2addr v1, v6

    .line 33
    long-to-int v6, v1

    .line 34
    aput v6, p2, v5

    .line 35
    .line 36
    ushr-long/2addr v1, v0

    .line 37
    const/4 v5, 0x2

    .line 38
    aget v6, p0, v5

    .line 39
    .line 40
    int-to-long v6, v6

    .line 41
    and-long/2addr v6, v3

    .line 42
    aget v8, p1, v5

    .line 43
    .line 44
    int-to-long v8, v8

    .line 45
    and-long/2addr v8, v3

    .line 46
    add-long/2addr v6, v8

    .line 47
    add-long/2addr v1, v6

    .line 48
    long-to-int v6, v1

    .line 49
    aput v6, p2, v5

    .line 50
    .line 51
    ushr-long/2addr v1, v0

    .line 52
    const/4 v5, 0x3

    .line 53
    aget v6, p0, v5

    .line 54
    .line 55
    int-to-long v6, v6

    .line 56
    and-long/2addr v6, v3

    .line 57
    aget v8, p1, v5

    .line 58
    .line 59
    int-to-long v8, v8

    .line 60
    and-long/2addr v8, v3

    .line 61
    add-long/2addr v6, v8

    .line 62
    add-long/2addr v1, v6

    .line 63
    long-to-int v6, v1

    .line 64
    aput v6, p2, v5

    .line 65
    .line 66
    ushr-long/2addr v1, v0

    .line 67
    const/4 v5, 0x4

    .line 68
    aget p0, p0, v5

    .line 69
    .line 70
    int-to-long v6, p0

    .line 71
    and-long/2addr v6, v3

    .line 72
    aget p0, p1, v5

    .line 73
    .line 74
    int-to-long p0, p0

    .line 75
    and-long/2addr p0, v3

    .line 76
    add-long/2addr v6, p0

    .line 77
    add-long/2addr v1, v6

    .line 78
    long-to-int p0, v1

    .line 79
    aput p0, p2, v5

    .line 80
    .line 81
    ushr-long p0, v1, v0

    .line 82
    .line 83
    long-to-int p0, p0

    .line 84
    return p0
.end method

.method public static addBothTo([I[I[I)I
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    int-to-long v1, v1

    .line 5
    const-wide v3, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v1, v3

    .line 11
    aget v5, p1, v0

    .line 12
    .line 13
    int-to-long v5, v5

    .line 14
    and-long/2addr v5, v3

    .line 15
    add-long/2addr v1, v5

    .line 16
    aget v5, p2, v0

    .line 17
    .line 18
    int-to-long v5, v5

    .line 19
    and-long/2addr v5, v3

    .line 20
    add-long/2addr v1, v5

    .line 21
    long-to-int v5, v1

    .line 22
    aput v5, p2, v0

    .line 23
    .line 24
    const/16 v0, 0x20

    .line 25
    .line 26
    ushr-long/2addr v1, v0

    .line 27
    const/4 v5, 0x1

    .line 28
    aget v6, p0, v5

    .line 29
    .line 30
    int-to-long v6, v6

    .line 31
    and-long/2addr v6, v3

    .line 32
    aget v8, p1, v5

    .line 33
    .line 34
    int-to-long v8, v8

    .line 35
    and-long/2addr v8, v3

    .line 36
    add-long/2addr v6, v8

    .line 37
    aget v8, p2, v5

    .line 38
    .line 39
    int-to-long v8, v8

    .line 40
    and-long/2addr v8, v3

    .line 41
    add-long/2addr v6, v8

    .line 42
    add-long/2addr v1, v6

    .line 43
    long-to-int v6, v1

    .line 44
    aput v6, p2, v5

    .line 45
    .line 46
    ushr-long/2addr v1, v0

    .line 47
    const/4 v5, 0x2

    .line 48
    aget v6, p0, v5

    .line 49
    .line 50
    int-to-long v6, v6

    .line 51
    and-long/2addr v6, v3

    .line 52
    aget v8, p1, v5

    .line 53
    .line 54
    int-to-long v8, v8

    .line 55
    and-long/2addr v8, v3

    .line 56
    add-long/2addr v6, v8

    .line 57
    aget v8, p2, v5

    .line 58
    .line 59
    int-to-long v8, v8

    .line 60
    and-long/2addr v8, v3

    .line 61
    add-long/2addr v6, v8

    .line 62
    add-long/2addr v1, v6

    .line 63
    long-to-int v6, v1

    .line 64
    aput v6, p2, v5

    .line 65
    .line 66
    ushr-long/2addr v1, v0

    .line 67
    const/4 v5, 0x3

    .line 68
    aget v6, p0, v5

    .line 69
    .line 70
    int-to-long v6, v6

    .line 71
    and-long/2addr v6, v3

    .line 72
    aget v8, p1, v5

    .line 73
    .line 74
    int-to-long v8, v8

    .line 75
    and-long/2addr v8, v3

    .line 76
    add-long/2addr v6, v8

    .line 77
    aget v8, p2, v5

    .line 78
    .line 79
    int-to-long v8, v8

    .line 80
    and-long/2addr v8, v3

    .line 81
    add-long/2addr v6, v8

    .line 82
    add-long/2addr v1, v6

    .line 83
    long-to-int v6, v1

    .line 84
    aput v6, p2, v5

    .line 85
    .line 86
    ushr-long/2addr v1, v0

    .line 87
    const/4 v5, 0x4

    .line 88
    aget p0, p0, v5

    .line 89
    .line 90
    int-to-long v6, p0

    .line 91
    and-long/2addr v6, v3

    .line 92
    aget p0, p1, v5

    .line 93
    .line 94
    int-to-long p0, p0

    .line 95
    and-long/2addr p0, v3

    .line 96
    add-long/2addr v6, p0

    .line 97
    aget p0, p2, v5

    .line 98
    .line 99
    int-to-long p0, p0

    .line 100
    and-long/2addr p0, v3

    .line 101
    add-long/2addr v6, p0

    .line 102
    add-long/2addr v1, v6

    .line 103
    long-to-int p0, v1

    .line 104
    aput p0, p2, v5

    .line 105
    .line 106
    ushr-long p0, v1, v0

    .line 107
    .line 108
    long-to-int p0, p0

    .line 109
    return p0
.end method

.method public static addTo([II[III)I
    .locals 9

    .line 1
    int-to-long v0, p4

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    aget p4, p0, p1

    .line 9
    .line 10
    int-to-long v4, p4

    .line 11
    and-long/2addr v4, v2

    .line 12
    aget p4, p2, p3

    .line 13
    .line 14
    int-to-long v6, p4

    .line 15
    and-long/2addr v6, v2

    .line 16
    add-long/2addr v4, v6

    .line 17
    add-long/2addr v0, v4

    .line 18
    long-to-int p4, v0

    .line 19
    aput p4, p2, p3

    .line 20
    .line 21
    const/16 p4, 0x20

    .line 22
    .line 23
    ushr-long/2addr v0, p4

    .line 24
    add-int/lit8 v4, p1, 0x1

    .line 25
    .line 26
    aget v4, p0, v4

    .line 27
    .line 28
    int-to-long v4, v4

    .line 29
    and-long/2addr v4, v2

    .line 30
    add-int/lit8 v6, p3, 0x1

    .line 31
    .line 32
    aget v7, p2, v6

    .line 33
    .line 34
    int-to-long v7, v7

    .line 35
    and-long/2addr v7, v2

    .line 36
    add-long/2addr v4, v7

    .line 37
    add-long/2addr v0, v4

    .line 38
    long-to-int v4, v0

    .line 39
    aput v4, p2, v6

    .line 40
    .line 41
    ushr-long/2addr v0, p4

    .line 42
    add-int/lit8 v4, p1, 0x2

    .line 43
    .line 44
    aget v4, p0, v4

    .line 45
    .line 46
    int-to-long v4, v4

    .line 47
    and-long/2addr v4, v2

    .line 48
    add-int/lit8 v6, p3, 0x2

    .line 49
    .line 50
    aget v7, p2, v6

    .line 51
    .line 52
    int-to-long v7, v7

    .line 53
    and-long/2addr v7, v2

    .line 54
    add-long/2addr v4, v7

    .line 55
    add-long/2addr v0, v4

    .line 56
    long-to-int v4, v0

    .line 57
    aput v4, p2, v6

    .line 58
    .line 59
    ushr-long/2addr v0, p4

    .line 60
    add-int/lit8 v4, p1, 0x3

    .line 61
    .line 62
    aget v4, p0, v4

    .line 63
    .line 64
    int-to-long v4, v4

    .line 65
    and-long/2addr v4, v2

    .line 66
    add-int/lit8 v6, p3, 0x3

    .line 67
    .line 68
    aget v7, p2, v6

    .line 69
    .line 70
    int-to-long v7, v7

    .line 71
    and-long/2addr v7, v2

    .line 72
    add-long/2addr v4, v7

    .line 73
    add-long/2addr v0, v4

    .line 74
    long-to-int v4, v0

    .line 75
    aput v4, p2, v6

    .line 76
    .line 77
    ushr-long/2addr v0, p4

    .line 78
    add-int/lit8 p1, p1, 0x4

    .line 79
    .line 80
    aget p0, p0, p1

    .line 81
    .line 82
    int-to-long p0, p0

    .line 83
    and-long/2addr p0, v2

    .line 84
    add-int/lit8 p3, p3, 0x4

    .line 85
    .line 86
    aget v4, p2, p3

    .line 87
    .line 88
    int-to-long v4, v4

    .line 89
    and-long/2addr v2, v4

    .line 90
    add-long/2addr p0, v2

    .line 91
    add-long/2addr v0, p0

    .line 92
    long-to-int p0, v0

    .line 93
    aput p0, p2, p3

    .line 94
    .line 95
    ushr-long p0, v0, p4

    .line 96
    .line 97
    long-to-int p0, p0

    .line 98
    return p0
.end method

.method public static addTo([I[I)I
    .locals 10

    const/4 v0, 0x0

    .line 99
    aget v1, p0, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    aget v5, p1, v0

    int-to-long v5, v5

    and-long/2addr v5, v3

    add-long/2addr v1, v5

    long-to-int v5, v1

    .line 100
    aput v5, p1, v0

    const/16 v0, 0x20

    ushr-long/2addr v1, v0

    const/4 v5, 0x1

    .line 101
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 102
    aput v6, p1, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x2

    .line 103
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 104
    aput v6, p1, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x3

    .line 105
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 106
    aput v6, p1, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x4

    .line 107
    aget p0, p0, v5

    int-to-long v6, p0

    and-long/2addr v6, v3

    aget p0, p1, v5

    int-to-long v8, p0

    and-long/2addr v3, v8

    add-long/2addr v6, v3

    add-long/2addr v1, v6

    long-to-int p0, v1

    .line 108
    aput p0, p1, v5

    ushr-long p0, v1, v0

    long-to-int p0, p0

    return p0
.end method

.method public static addToEachOther([II[II)I
    .locals 11

    .line 1
    aget v0, p0, p1

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    aget v4, p2, p3

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    and-long/2addr v4, v2

    .line 14
    add-long/2addr v0, v4

    .line 15
    long-to-int v4, v0

    .line 16
    aput v4, p0, p1

    .line 17
    .line 18
    aput v4, p2, p3

    .line 19
    .line 20
    const/16 v4, 0x20

    .line 21
    .line 22
    ushr-long/2addr v0, v4

    .line 23
    add-int/lit8 v5, p1, 0x1

    .line 24
    .line 25
    aget v6, p0, v5

    .line 26
    .line 27
    int-to-long v6, v6

    .line 28
    and-long/2addr v6, v2

    .line 29
    add-int/lit8 v8, p3, 0x1

    .line 30
    .line 31
    aget v9, p2, v8

    .line 32
    .line 33
    int-to-long v9, v9

    .line 34
    and-long/2addr v9, v2

    .line 35
    add-long/2addr v6, v9

    .line 36
    add-long/2addr v0, v6

    .line 37
    long-to-int v6, v0

    .line 38
    aput v6, p0, v5

    .line 39
    .line 40
    aput v6, p2, v8

    .line 41
    .line 42
    ushr-long/2addr v0, v4

    .line 43
    add-int/lit8 v5, p1, 0x2

    .line 44
    .line 45
    aget v6, p0, v5

    .line 46
    .line 47
    int-to-long v6, v6

    .line 48
    and-long/2addr v6, v2

    .line 49
    add-int/lit8 v8, p3, 0x2

    .line 50
    .line 51
    aget v9, p2, v8

    .line 52
    .line 53
    int-to-long v9, v9

    .line 54
    and-long/2addr v9, v2

    .line 55
    add-long/2addr v6, v9

    .line 56
    add-long/2addr v0, v6

    .line 57
    long-to-int v6, v0

    .line 58
    aput v6, p0, v5

    .line 59
    .line 60
    aput v6, p2, v8

    .line 61
    .line 62
    ushr-long/2addr v0, v4

    .line 63
    add-int/lit8 v5, p1, 0x3

    .line 64
    .line 65
    aget v6, p0, v5

    .line 66
    .line 67
    int-to-long v6, v6

    .line 68
    and-long/2addr v6, v2

    .line 69
    add-int/lit8 v8, p3, 0x3

    .line 70
    .line 71
    aget v9, p2, v8

    .line 72
    .line 73
    int-to-long v9, v9

    .line 74
    and-long/2addr v9, v2

    .line 75
    add-long/2addr v6, v9

    .line 76
    add-long/2addr v0, v6

    .line 77
    long-to-int v6, v0

    .line 78
    aput v6, p0, v5

    .line 79
    .line 80
    aput v6, p2, v8

    .line 81
    .line 82
    ushr-long/2addr v0, v4

    .line 83
    add-int/lit8 p1, p1, 0x4

    .line 84
    .line 85
    aget v5, p0, p1

    .line 86
    .line 87
    int-to-long v5, v5

    .line 88
    and-long/2addr v5, v2

    .line 89
    add-int/lit8 p3, p3, 0x4

    .line 90
    .line 91
    aget v7, p2, p3

    .line 92
    .line 93
    int-to-long v7, v7

    .line 94
    and-long/2addr v2, v7

    .line 95
    add-long/2addr v5, v2

    .line 96
    add-long/2addr v0, v5

    .line 97
    long-to-int v2, v0

    .line 98
    aput v2, p0, p1

    .line 99
    .line 100
    aput v2, p2, p3

    .line 101
    .line 102
    ushr-long p0, v0, v4

    .line 103
    .line 104
    long-to-int p0, p0

    .line 105
    return p0
.end method

.method public static copy([I[I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    aput v1, p1, v0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    aget v1, p0, v0

    .line 8
    .line 9
    aput v1, p1, v0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    aget v1, p0, v0

    .line 13
    .line 14
    aput v1, p1, v0

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    aget v1, p0, v0

    .line 18
    .line 19
    aput v1, p1, v0

    .line 20
    .line 21
    const/4 v0, 0x4

    .line 22
    aget p0, p0, v0

    .line 23
    .line 24
    aput p0, p1, v0

    .line 25
    .line 26
    return-void
.end method

.method public static create()[I
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    return-object v0
.end method

.method public static createExt()[I
    .locals 1

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    return-object v0
.end method

.method public static diff([II[II[II)Z
    .locals 2

    .line 1
    invoke-static {p0, p1, p2, p3}, Lorg/spongycastle/math/raw/Nat160;->gte([II[II)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static/range {p0 .. p5}, Lorg/spongycastle/math/raw/Nat160;->sub([II[II[II)I

    .line 8
    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    move-object v1, p2

    .line 12
    move-object p2, p0

    .line 13
    move-object p0, v1

    .line 14
    move v1, p3

    .line 15
    move p3, p1

    .line 16
    move p1, v1

    .line 17
    invoke-static/range {p0 .. p5}, Lorg/spongycastle/math/raw/Nat160;->sub([II[II[II)I

    .line 18
    .line 19
    .line 20
    return v0
.end method

.method public static eq([I[I)Z
    .locals 3

    .line 1
    const/4 v0, 0x4

    .line 2
    :goto_0
    if-ltz v0, :cond_1

    .line 3
    .line 4
    aget v1, p0, v0

    .line 5
    .line 6
    aget v2, p1, v0

    .line 7
    .line 8
    if-eq v1, v2, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[I
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0xa0

    .line 12
    .line 13
    if-gt v0, v1, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->create()[I

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x0

    .line 20
    :goto_0
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    add-int/lit8 v2, v1, 0x1

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    aput v3, v0, v1

    .line 33
    .line 34
    const/16 v1, 0x20

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    move v1, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-object v0

    .line 43
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public static getBit([II)I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    :goto_0
    and-int/lit8 p0, p0, 0x1

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    shr-int/lit8 v1, p1, 0x5

    .line 10
    .line 11
    if-ltz v1, :cond_2

    .line 12
    .line 13
    const/4 v2, 0x5

    .line 14
    if-lt v1, v2, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    and-int/lit8 p1, p1, 0x1f

    .line 18
    .line 19
    aget p0, p0, v1

    .line 20
    .line 21
    ushr-int/2addr p0, p1

    .line 22
    goto :goto_0

    .line 23
    :cond_2
    :goto_1
    return v0
.end method

.method public static gte([II[II)Z
    .locals 5

    .line 1
    const/4 v0, 0x4

    .line 2
    :goto_0
    const/4 v1, 0x1

    .line 3
    if-ltz v0, :cond_2

    .line 4
    .line 5
    add-int v2, p1, v0

    .line 6
    .line 7
    aget v2, p0, v2

    .line 8
    .line 9
    const/high16 v3, -0x80000000

    .line 10
    .line 11
    xor-int/2addr v2, v3

    .line 12
    add-int v4, p3, v0

    .line 13
    .line 14
    aget v4, p2, v4

    .line 15
    .line 16
    xor-int/2addr v3, v4

    .line 17
    if-ge v2, v3, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_0
    if-le v2, v3, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    return v1
.end method

.method public static gte([I[I)Z
    .locals 5

    const/4 v0, 0x4

    :goto_0
    const/4 v1, 0x1

    if-ltz v0, :cond_2

    .line 28
    aget v2, p0, v0

    const/high16 v3, -0x80000000

    xor-int/2addr v2, v3

    .line 29
    aget v4, p1, v0

    xor-int/2addr v3, v4

    if-ge v2, v3, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    if-le v2, v3, :cond_1

    return v1

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public static isOne([I)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    if-eq v1, v2, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    move v1, v2

    .line 9
    :goto_0
    const/4 v3, 0x5

    .line 10
    if-ge v1, v3, :cond_2

    .line 11
    .line 12
    aget v3, p0, v1

    .line 13
    .line 14
    if-eqz v3, :cond_1

    .line 15
    .line 16
    return v0

    .line 17
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_2
    return v2
.end method

.method public static isZero([I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/4 v2, 0x5

    .line 4
    if-ge v1, v2, :cond_1

    .line 5
    .line 6
    aget v2, p0, v1

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public static mul([II[II[II)V
    .locals 24

    .line 1
    aget v0, p2, p3

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    add-int/lit8 v4, p3, 0x1

    .line 11
    .line 12
    aget v4, p2, v4

    .line 13
    .line 14
    int-to-long v4, v4

    .line 15
    and-long/2addr v4, v2

    .line 16
    add-int/lit8 v6, p3, 0x2

    .line 17
    .line 18
    aget v6, p2, v6

    .line 19
    .line 20
    int-to-long v6, v6

    .line 21
    and-long/2addr v6, v2

    .line 22
    add-int/lit8 v8, p3, 0x3

    .line 23
    .line 24
    aget v8, p2, v8

    .line 25
    .line 26
    int-to-long v8, v8

    .line 27
    and-long/2addr v8, v2

    .line 28
    add-int/lit8 v10, p3, 0x4

    .line 29
    .line 30
    aget v10, p2, v10

    .line 31
    .line 32
    int-to-long v10, v10

    .line 33
    and-long/2addr v10, v2

    .line 34
    aget v12, p0, p1

    .line 35
    .line 36
    int-to-long v12, v12

    .line 37
    and-long/2addr v12, v2

    .line 38
    mul-long v14, v12, v0

    .line 39
    .line 40
    move-wide/from16 v16, v2

    .line 41
    .line 42
    long-to-int v2, v14

    .line 43
    aput v2, p4, p5

    .line 44
    .line 45
    const/16 v2, 0x20

    .line 46
    .line 47
    ushr-long/2addr v14, v2

    .line 48
    mul-long v18, v12, v4

    .line 49
    .line 50
    add-long v14, v14, v18

    .line 51
    .line 52
    add-int/lit8 v3, p5, 0x1

    .line 53
    .line 54
    move/from16 p2, v2

    .line 55
    .line 56
    long-to-int v2, v14

    .line 57
    aput v2, p4, v3

    .line 58
    .line 59
    ushr-long v2, v14, p2

    .line 60
    .line 61
    mul-long v14, v12, v6

    .line 62
    .line 63
    add-long/2addr v2, v14

    .line 64
    add-int/lit8 v14, p5, 0x2

    .line 65
    .line 66
    long-to-int v15, v2

    .line 67
    aput v15, p4, v14

    .line 68
    .line 69
    ushr-long v2, v2, p2

    .line 70
    .line 71
    mul-long v14, v12, v8

    .line 72
    .line 73
    add-long/2addr v2, v14

    .line 74
    add-int/lit8 v14, p5, 0x3

    .line 75
    .line 76
    long-to-int v15, v2

    .line 77
    aput v15, p4, v14

    .line 78
    .line 79
    ushr-long v2, v2, p2

    .line 80
    .line 81
    mul-long/2addr v12, v10

    .line 82
    add-long/2addr v2, v12

    .line 83
    add-int/lit8 v12, p5, 0x4

    .line 84
    .line 85
    long-to-int v13, v2

    .line 86
    aput v13, p4, v12

    .line 87
    .line 88
    ushr-long v2, v2, p2

    .line 89
    .line 90
    add-int/lit8 v12, p5, 0x5

    .line 91
    .line 92
    long-to-int v2, v2

    .line 93
    aput v2, p4, v12

    .line 94
    .line 95
    const/4 v2, 0x1

    .line 96
    move v3, v2

    .line 97
    move/from16 v2, p5

    .line 98
    .line 99
    :goto_0
    const/4 v12, 0x5

    .line 100
    if-ge v3, v12, :cond_0

    .line 101
    .line 102
    add-int/lit8 v12, v2, 0x1

    .line 103
    .line 104
    add-int v13, p1, v3

    .line 105
    .line 106
    aget v13, p0, v13

    .line 107
    .line 108
    int-to-long v13, v13

    .line 109
    and-long v13, v13, v16

    .line 110
    .line 111
    mul-long v18, v13, v0

    .line 112
    .line 113
    aget v15, p4, v12

    .line 114
    .line 115
    move-wide/from16 v20, v0

    .line 116
    .line 117
    int-to-long v0, v15

    .line 118
    and-long v0, v0, v16

    .line 119
    .line 120
    add-long v0, v18, v0

    .line 121
    .line 122
    long-to-int v15, v0

    .line 123
    aput v15, p4, v12

    .line 124
    .line 125
    ushr-long v0, v0, p2

    .line 126
    .line 127
    mul-long v18, v13, v4

    .line 128
    .line 129
    add-int/lit8 v15, v2, 0x2

    .line 130
    .line 131
    move-wide/from16 v22, v0

    .line 132
    .line 133
    aget v0, p4, v15

    .line 134
    .line 135
    int-to-long v0, v0

    .line 136
    and-long v0, v0, v16

    .line 137
    .line 138
    add-long v18, v18, v0

    .line 139
    .line 140
    add-long v0, v22, v18

    .line 141
    .line 142
    move/from16 p3, v2

    .line 143
    .line 144
    long-to-int v2, v0

    .line 145
    aput v2, p4, v15

    .line 146
    .line 147
    ushr-long v0, v0, p2

    .line 148
    .line 149
    mul-long v18, v13, v6

    .line 150
    .line 151
    add-int/lit8 v2, p3, 0x3

    .line 152
    .line 153
    aget v15, p4, v2

    .line 154
    .line 155
    move-wide/from16 v22, v0

    .line 156
    .line 157
    int-to-long v0, v15

    .line 158
    and-long v0, v0, v16

    .line 159
    .line 160
    add-long v18, v18, v0

    .line 161
    .line 162
    add-long v0, v22, v18

    .line 163
    .line 164
    long-to-int v15, v0

    .line 165
    aput v15, p4, v2

    .line 166
    .line 167
    ushr-long v0, v0, p2

    .line 168
    .line 169
    mul-long v18, v13, v8

    .line 170
    .line 171
    add-int/lit8 v2, p3, 0x4

    .line 172
    .line 173
    aget v15, p4, v2

    .line 174
    .line 175
    move-wide/from16 v22, v0

    .line 176
    .line 177
    int-to-long v0, v15

    .line 178
    and-long v0, v0, v16

    .line 179
    .line 180
    add-long v18, v18, v0

    .line 181
    .line 182
    add-long v0, v22, v18

    .line 183
    .line 184
    long-to-int v15, v0

    .line 185
    aput v15, p4, v2

    .line 186
    .line 187
    ushr-long v0, v0, p2

    .line 188
    .line 189
    mul-long/2addr v13, v10

    .line 190
    add-int/lit8 v2, p3, 0x5

    .line 191
    .line 192
    aget v15, p4, v2

    .line 193
    .line 194
    move-wide/from16 v18, v0

    .line 195
    .line 196
    int-to-long v0, v15

    .line 197
    and-long v0, v0, v16

    .line 198
    .line 199
    add-long/2addr v13, v0

    .line 200
    add-long v0, v18, v13

    .line 201
    .line 202
    long-to-int v13, v0

    .line 203
    aput v13, p4, v2

    .line 204
    .line 205
    ushr-long v0, v0, p2

    .line 206
    .line 207
    add-int/lit8 v2, p3, 0x6

    .line 208
    .line 209
    long-to-int v0, v0

    .line 210
    aput v0, p4, v2

    .line 211
    .line 212
    add-int/lit8 v3, v3, 0x1

    .line 213
    .line 214
    move v2, v12

    .line 215
    move-wide/from16 v0, v20

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_0
    return-void
.end method

.method public static mul([I[I[I)V
    .locals 25

    const/4 v0, 0x0

    .line 219
    aget v1, p1, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    const/4 v5, 0x1

    .line 220
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    const/4 v8, 0x2

    .line 221
    aget v9, p1, v8

    int-to-long v9, v9

    and-long/2addr v9, v3

    const/4 v11, 0x3

    .line 222
    aget v12, p1, v11

    int-to-long v12, v12

    and-long/2addr v12, v3

    const/4 v14, 0x4

    .line 223
    aget v15, p1, v14

    move/from16 v16, v0

    move-wide/from16 v17, v1

    int-to-long v0, v15

    and-long/2addr v0, v3

    .line 224
    aget v2, p0, v16

    move-wide/from16 v19, v3

    int-to-long v3, v2

    and-long v2, v3, v19

    move v4, v5

    move-wide/from16 v21, v6

    mul-long v5, v2, v17

    long-to-int v7, v5

    .line 225
    aput v7, p2, v16

    const/16 v7, 0x20

    ushr-long/2addr v5, v7

    mul-long v15, v2, v21

    add-long/2addr v5, v15

    long-to-int v15, v5

    .line 226
    aput v15, p2, v4

    ushr-long/2addr v5, v7

    mul-long v15, v2, v9

    add-long/2addr v5, v15

    long-to-int v15, v5

    .line 227
    aput v15, p2, v8

    ushr-long/2addr v5, v7

    mul-long v15, v2, v12

    add-long/2addr v5, v15

    long-to-int v8, v5

    .line 228
    aput v8, p2, v11

    ushr-long/2addr v5, v7

    mul-long/2addr v2, v0

    add-long/2addr v5, v2

    long-to-int v2, v5

    .line 229
    aput v2, p2, v14

    ushr-long v2, v5, v7

    long-to-int v2, v2

    const/4 v3, 0x5

    .line 230
    aput v2, p2, v3

    :goto_0
    move v5, v4

    if-ge v5, v3, :cond_0

    .line 231
    aget v2, p0, v5

    int-to-long v14, v2

    and-long v14, v14, v19

    mul-long v23, v14, v17

    .line 232
    aget v2, p2, v5

    int-to-long v3, v2

    and-long v2, v3, v19

    add-long v2, v23, v2

    long-to-int v4, v2

    .line 233
    aput v4, p2, v5

    ushr-long/2addr v2, v7

    mul-long v23, v14, v21

    add-int/lit8 v4, v5, 0x1

    .line 234
    aget v6, p2, v4

    move v11, v7

    int-to-long v7, v6

    and-long v6, v7, v19

    add-long v23, v23, v6

    add-long v2, v2, v23

    long-to-int v6, v2

    .line 235
    aput v6, p2, v4

    ushr-long/2addr v2, v11

    mul-long v6, v14, v9

    add-int/lit8 v8, v5, 0x2

    move/from16 v16, v11

    .line 236
    aget v11, p2, v8

    move-wide/from16 v23, v0

    int-to-long v0, v11

    and-long v0, v0, v19

    add-long/2addr v6, v0

    add-long/2addr v2, v6

    long-to-int v0, v2

    .line 237
    aput v0, p2, v8

    ushr-long v0, v2, v16

    mul-long v2, v14, v12

    add-int/lit8 v6, v5, 0x3

    .line 238
    aget v7, p2, v6

    int-to-long v7, v7

    and-long v7, v7, v19

    add-long/2addr v2, v7

    add-long/2addr v0, v2

    long-to-int v2, v0

    .line 239
    aput v2, p2, v6

    ushr-long v0, v0, v16

    mul-long v14, v14, v23

    add-int/lit8 v2, v5, 0x4

    .line 240
    aget v3, p2, v2

    int-to-long v6, v3

    and-long v6, v6, v19

    add-long/2addr v14, v6

    add-long/2addr v0, v14

    long-to-int v3, v0

    .line 241
    aput v3, p2, v2

    ushr-long v0, v0, v16

    add-int/lit8 v5, v5, 0x5

    long-to-int v0, v0

    .line 242
    aput v0, p2, v5

    move/from16 v7, v16

    move-wide/from16 v0, v23

    const/4 v3, 0x5

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static mul33Add(I[II[II[II)J
    .locals 12

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    aget p0, p1, p2

    .line 9
    .line 10
    int-to-long v4, p0

    .line 11
    and-long/2addr v4, v2

    .line 12
    mul-long v6, v0, v4

    .line 13
    .line 14
    aget p0, p3, p4

    .line 15
    .line 16
    int-to-long v8, p0

    .line 17
    and-long/2addr v8, v2

    .line 18
    add-long/2addr v6, v8

    .line 19
    long-to-int p0, v6

    .line 20
    aput p0, p5, p6

    .line 21
    .line 22
    const/16 p0, 0x20

    .line 23
    .line 24
    ushr-long/2addr v6, p0

    .line 25
    add-int/lit8 v8, p2, 0x1

    .line 26
    .line 27
    aget v8, p1, v8

    .line 28
    .line 29
    int-to-long v8, v8

    .line 30
    and-long/2addr v8, v2

    .line 31
    mul-long v10, v0, v8

    .line 32
    .line 33
    add-long/2addr v10, v4

    .line 34
    add-int/lit8 v4, p4, 0x1

    .line 35
    .line 36
    aget v4, p3, v4

    .line 37
    .line 38
    int-to-long v4, v4

    .line 39
    and-long/2addr v4, v2

    .line 40
    add-long/2addr v10, v4

    .line 41
    add-long/2addr v6, v10

    .line 42
    add-int/lit8 v4, p6, 0x1

    .line 43
    .line 44
    long-to-int v5, v6

    .line 45
    aput v5, p5, v4

    .line 46
    .line 47
    ushr-long v4, v6, p0

    .line 48
    .line 49
    add-int/lit8 v6, p2, 0x2

    .line 50
    .line 51
    aget v6, p1, v6

    .line 52
    .line 53
    int-to-long v6, v6

    .line 54
    and-long/2addr v6, v2

    .line 55
    mul-long v10, v0, v6

    .line 56
    .line 57
    add-long/2addr v10, v8

    .line 58
    add-int/lit8 v8, p4, 0x2

    .line 59
    .line 60
    aget v8, p3, v8

    .line 61
    .line 62
    int-to-long v8, v8

    .line 63
    and-long/2addr v8, v2

    .line 64
    add-long/2addr v10, v8

    .line 65
    add-long/2addr v4, v10

    .line 66
    add-int/lit8 v8, p6, 0x2

    .line 67
    .line 68
    long-to-int v9, v4

    .line 69
    aput v9, p5, v8

    .line 70
    .line 71
    ushr-long/2addr v4, p0

    .line 72
    add-int/lit8 v8, p2, 0x3

    .line 73
    .line 74
    aget v8, p1, v8

    .line 75
    .line 76
    int-to-long v8, v8

    .line 77
    and-long/2addr v8, v2

    .line 78
    mul-long v10, v0, v8

    .line 79
    .line 80
    add-long/2addr v10, v6

    .line 81
    add-int/lit8 v6, p4, 0x3

    .line 82
    .line 83
    aget v6, p3, v6

    .line 84
    .line 85
    int-to-long v6, v6

    .line 86
    and-long/2addr v6, v2

    .line 87
    add-long/2addr v10, v6

    .line 88
    add-long/2addr v4, v10

    .line 89
    add-int/lit8 v6, p6, 0x3

    .line 90
    .line 91
    long-to-int v7, v4

    .line 92
    aput v7, p5, v6

    .line 93
    .line 94
    ushr-long/2addr v4, p0

    .line 95
    add-int/lit8 p2, p2, 0x4

    .line 96
    .line 97
    aget p1, p1, p2

    .line 98
    .line 99
    int-to-long p1, p1

    .line 100
    and-long/2addr p1, v2

    .line 101
    mul-long/2addr v0, p1

    .line 102
    add-long/2addr v0, v8

    .line 103
    add-int/lit8 v6, p4, 0x4

    .line 104
    .line 105
    aget v6, p3, v6

    .line 106
    .line 107
    int-to-long v6, v6

    .line 108
    and-long/2addr v2, v6

    .line 109
    add-long/2addr v0, v2

    .line 110
    add-long/2addr v4, v0

    .line 111
    add-int/lit8 v0, p6, 0x4

    .line 112
    .line 113
    long-to-int v1, v4

    .line 114
    aput v1, p5, v0

    .line 115
    .line 116
    ushr-long v0, v4, p0

    .line 117
    .line 118
    add-long/2addr v0, p1

    .line 119
    return-wide v0
.end method

.method public static mul33DWordAdd(IJ[II)I
    .locals 10

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    and-long v4, p1, v2

    .line 9
    .line 10
    mul-long v6, v0, v4

    .line 11
    .line 12
    aget p0, p3, p4

    .line 13
    .line 14
    int-to-long v8, p0

    .line 15
    and-long/2addr v8, v2

    .line 16
    add-long/2addr v6, v8

    .line 17
    long-to-int p0, v6

    .line 18
    aput p0, p3, p4

    .line 19
    .line 20
    const/16 p0, 0x20

    .line 21
    .line 22
    ushr-long/2addr v6, p0

    .line 23
    ushr-long/2addr p1, p0

    .line 24
    mul-long/2addr v0, p1

    .line 25
    add-long/2addr v0, v4

    .line 26
    add-int/lit8 v4, p4, 0x1

    .line 27
    .line 28
    aget v5, p3, v4

    .line 29
    .line 30
    int-to-long v8, v5

    .line 31
    and-long/2addr v8, v2

    .line 32
    add-long/2addr v0, v8

    .line 33
    add-long/2addr v6, v0

    .line 34
    long-to-int v0, v6

    .line 35
    aput v0, p3, v4

    .line 36
    .line 37
    ushr-long v0, v6, p0

    .line 38
    .line 39
    add-int/lit8 v4, p4, 0x2

    .line 40
    .line 41
    aget v5, p3, v4

    .line 42
    .line 43
    int-to-long v5, v5

    .line 44
    and-long/2addr v5, v2

    .line 45
    add-long/2addr p1, v5

    .line 46
    add-long/2addr v0, p1

    .line 47
    long-to-int p1, v0

    .line 48
    aput p1, p3, v4

    .line 49
    .line 50
    ushr-long p1, v0, p0

    .line 51
    .line 52
    add-int/lit8 v0, p4, 0x3

    .line 53
    .line 54
    aget v1, p3, v0

    .line 55
    .line 56
    int-to-long v4, v1

    .line 57
    and-long v1, v4, v2

    .line 58
    .line 59
    add-long/2addr p1, v1

    .line 60
    long-to-int v1, p1

    .line 61
    aput v1, p3, v0

    .line 62
    .line 63
    ushr-long p0, p1, p0

    .line 64
    .line 65
    const-wide/16 v0, 0x0

    .line 66
    .line 67
    cmp-long p0, p0, v0

    .line 68
    .line 69
    if-nez p0, :cond_0

    .line 70
    .line 71
    const/4 p0, 0x0

    .line 72
    return p0

    .line 73
    :cond_0
    const/4 p0, 0x5

    .line 74
    const/4 p1, 0x4

    .line 75
    invoke-static {p0, p3, p4, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    return p0
.end method

.method public static mul33WordAdd(II[II)I
    .locals 8

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    int-to-long p0, p1

    .line 9
    and-long/2addr p0, v2

    .line 10
    mul-long/2addr v0, p0

    .line 11
    aget v4, p2, p3

    .line 12
    .line 13
    int-to-long v4, v4

    .line 14
    and-long/2addr v4, v2

    .line 15
    add-long/2addr v0, v4

    .line 16
    long-to-int v4, v0

    .line 17
    aput v4, p2, p3

    .line 18
    .line 19
    const/16 v4, 0x20

    .line 20
    .line 21
    ushr-long/2addr v0, v4

    .line 22
    add-int/lit8 v5, p3, 0x1

    .line 23
    .line 24
    aget v6, p2, v5

    .line 25
    .line 26
    int-to-long v6, v6

    .line 27
    and-long/2addr v6, v2

    .line 28
    add-long/2addr p0, v6

    .line 29
    add-long/2addr v0, p0

    .line 30
    long-to-int p0, v0

    .line 31
    aput p0, p2, v5

    .line 32
    .line 33
    ushr-long p0, v0, v4

    .line 34
    .line 35
    add-int/lit8 v0, p3, 0x2

    .line 36
    .line 37
    aget v1, p2, v0

    .line 38
    .line 39
    int-to-long v5, v1

    .line 40
    and-long v1, v5, v2

    .line 41
    .line 42
    add-long/2addr p0, v1

    .line 43
    long-to-int v1, p0

    .line 44
    aput v1, p2, v0

    .line 45
    .line 46
    ushr-long/2addr p0, v4

    .line 47
    const-wide/16 v0, 0x0

    .line 48
    .line 49
    cmp-long p0, p0, v0

    .line 50
    .line 51
    if-nez p0, :cond_0

    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    return p0

    .line 55
    :cond_0
    const/4 p0, 0x5

    .line 56
    const/4 p1, 0x3

    .line 57
    invoke-static {p0, p2, p3, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0
.end method

.method public static mulAddTo([II[II[II)I
    .locals 26

    .line 1
    aget v0, p2, p3

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    add-int/lit8 v4, p3, 0x1

    .line 11
    .line 12
    aget v4, p2, v4

    .line 13
    .line 14
    int-to-long v4, v4

    .line 15
    and-long/2addr v4, v2

    .line 16
    add-int/lit8 v6, p3, 0x2

    .line 17
    .line 18
    aget v6, p2, v6

    .line 19
    .line 20
    int-to-long v6, v6

    .line 21
    and-long/2addr v6, v2

    .line 22
    add-int/lit8 v8, p3, 0x3

    .line 23
    .line 24
    aget v8, p2, v8

    .line 25
    .line 26
    int-to-long v8, v8

    .line 27
    and-long/2addr v8, v2

    .line 28
    add-int/lit8 v10, p3, 0x4

    .line 29
    .line 30
    aget v10, p2, v10

    .line 31
    .line 32
    int-to-long v10, v10

    .line 33
    and-long/2addr v10, v2

    .line 34
    const-wide/16 v12, 0x0

    .line 35
    .line 36
    const/4 v14, 0x0

    .line 37
    move-wide/from16 v16, v2

    .line 38
    .line 39
    move v15, v14

    .line 40
    move-wide v13, v12

    .line 41
    move/from16 v12, p5

    .line 42
    .line 43
    :goto_0
    const/4 v2, 0x5

    .line 44
    if-ge v15, v2, :cond_0

    .line 45
    .line 46
    add-int v3, p1, v15

    .line 47
    .line 48
    aget v3, p0, v3

    .line 49
    .line 50
    move/from16 p2, v2

    .line 51
    .line 52
    int-to-long v2, v3

    .line 53
    and-long v2, v2, v16

    .line 54
    .line 55
    mul-long v18, v2, v0

    .line 56
    .line 57
    move-wide/from16 v20, v0

    .line 58
    .line 59
    aget v0, p4, v12

    .line 60
    .line 61
    int-to-long v0, v0

    .line 62
    and-long v0, v0, v16

    .line 63
    .line 64
    add-long v0, v18, v0

    .line 65
    .line 66
    move-wide/from16 v18, v2

    .line 67
    .line 68
    long-to-int v2, v0

    .line 69
    aput v2, p4, v12

    .line 70
    .line 71
    const/16 v2, 0x20

    .line 72
    .line 73
    ushr-long/2addr v0, v2

    .line 74
    mul-long v22, v18, v4

    .line 75
    .line 76
    add-int/lit8 v3, v12, 0x1

    .line 77
    .line 78
    move/from16 p3, v2

    .line 79
    .line 80
    aget v2, p4, v3

    .line 81
    .line 82
    move-wide/from16 v24, v0

    .line 83
    .line 84
    int-to-long v0, v2

    .line 85
    and-long v0, v0, v16

    .line 86
    .line 87
    add-long v22, v22, v0

    .line 88
    .line 89
    add-long v0, v24, v22

    .line 90
    .line 91
    long-to-int v2, v0

    .line 92
    aput v2, p4, v3

    .line 93
    .line 94
    ushr-long v0, v0, p3

    .line 95
    .line 96
    mul-long v22, v18, v6

    .line 97
    .line 98
    add-int/lit8 v2, v12, 0x2

    .line 99
    .line 100
    move-wide/from16 v24, v0

    .line 101
    .line 102
    aget v0, p4, v2

    .line 103
    .line 104
    int-to-long v0, v0

    .line 105
    and-long v0, v0, v16

    .line 106
    .line 107
    add-long v22, v22, v0

    .line 108
    .line 109
    add-long v0, v24, v22

    .line 110
    .line 111
    move/from16 p5, v2

    .line 112
    .line 113
    long-to-int v2, v0

    .line 114
    aput v2, p4, p5

    .line 115
    .line 116
    ushr-long v0, v0, p3

    .line 117
    .line 118
    mul-long v22, v18, v8

    .line 119
    .line 120
    add-int/lit8 v2, v12, 0x3

    .line 121
    .line 122
    move-wide/from16 v24, v0

    .line 123
    .line 124
    aget v0, p4, v2

    .line 125
    .line 126
    int-to-long v0, v0

    .line 127
    and-long v0, v0, v16

    .line 128
    .line 129
    add-long v22, v22, v0

    .line 130
    .line 131
    add-long v0, v24, v22

    .line 132
    .line 133
    move/from16 p5, v2

    .line 134
    .line 135
    long-to-int v2, v0

    .line 136
    aput v2, p4, p5

    .line 137
    .line 138
    ushr-long v0, v0, p3

    .line 139
    .line 140
    mul-long v18, v18, v10

    .line 141
    .line 142
    add-int/lit8 v2, v12, 0x4

    .line 143
    .line 144
    move-wide/from16 v22, v0

    .line 145
    .line 146
    aget v0, p4, v2

    .line 147
    .line 148
    int-to-long v0, v0

    .line 149
    and-long v0, v0, v16

    .line 150
    .line 151
    add-long v18, v18, v0

    .line 152
    .line 153
    add-long v0, v22, v18

    .line 154
    .line 155
    move/from16 p5, v2

    .line 156
    .line 157
    long-to-int v2, v0

    .line 158
    aput v2, p4, p5

    .line 159
    .line 160
    ushr-long v0, v0, p3

    .line 161
    .line 162
    add-int/lit8 v12, v12, 0x5

    .line 163
    .line 164
    aget v2, p4, v12

    .line 165
    .line 166
    move-wide/from16 v18, v0

    .line 167
    .line 168
    int-to-long v0, v2

    .line 169
    and-long v0, v0, v16

    .line 170
    .line 171
    add-long/2addr v13, v0

    .line 172
    add-long v0, v18, v13

    .line 173
    .line 174
    long-to-int v2, v0

    .line 175
    aput v2, p4, v12

    .line 176
    .line 177
    ushr-long v13, v0, p3

    .line 178
    .line 179
    add-int/lit8 v15, v15, 0x1

    .line 180
    .line 181
    move v12, v3

    .line 182
    move-wide/from16 v0, v20

    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :cond_0
    long-to-int v0, v13

    .line 187
    return v0
.end method

.method public static mulAddTo([I[I[I)I
    .locals 27

    const/4 v0, 0x0

    .line 188
    aget v1, p1, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    const/4 v5, 0x1

    .line 189
    aget v5, p1, v5

    int-to-long v5, v5

    and-long/2addr v5, v3

    const/4 v7, 0x2

    .line 190
    aget v7, p1, v7

    int-to-long v7, v7

    and-long/2addr v7, v3

    const/4 v9, 0x3

    .line 191
    aget v9, p1, v9

    int-to-long v9, v9

    and-long/2addr v9, v3

    const/4 v11, 0x4

    .line 192
    aget v11, p1, v11

    int-to-long v11, v11

    and-long/2addr v11, v3

    const-wide/16 v13, 0x0

    :goto_0
    const/4 v15, 0x5

    if-ge v0, v15, :cond_0

    .line 193
    aget v15, p0, v0

    move-wide/from16 v16, v3

    int-to-long v3, v15

    and-long v3, v3, v16

    mul-long v18, v3, v1

    .line 194
    aget v15, p2, v0

    move-wide/from16 v20, v1

    move v2, v0

    int-to-long v0, v15

    and-long v0, v0, v16

    add-long v0, v18, v0

    long-to-int v15, v0

    .line 195
    aput v15, p2, v2

    const/16 v15, 0x20

    ushr-long/2addr v0, v15

    mul-long v18, v3, v5

    add-int/lit8 v22, v2, 0x1

    move/from16 p1, v15

    .line 196
    aget v15, p2, v22

    move-wide/from16 v23, v0

    int-to-long v0, v15

    and-long v0, v0, v16

    add-long v18, v18, v0

    add-long v0, v23, v18

    long-to-int v15, v0

    .line 197
    aput v15, p2, v22

    ushr-long v0, v0, p1

    mul-long v18, v3, v7

    add-int/lit8 v15, v2, 0x2

    move-wide/from16 v23, v0

    .line 198
    aget v0, p2, v15

    int-to-long v0, v0

    and-long v0, v0, v16

    add-long v18, v18, v0

    add-long v0, v23, v18

    move/from16 v18, v2

    long-to-int v2, v0

    .line 199
    aput v2, p2, v15

    ushr-long v0, v0, p1

    mul-long v23, v3, v9

    add-int/lit8 v2, v18, 0x3

    .line 200
    aget v15, p2, v2

    move-wide/from16 v25, v0

    int-to-long v0, v15

    and-long v0, v0, v16

    add-long v23, v23, v0

    add-long v0, v25, v23

    long-to-int v15, v0

    .line 201
    aput v15, p2, v2

    ushr-long v0, v0, p1

    mul-long/2addr v3, v11

    add-int/lit8 v2, v18, 0x4

    .line 202
    aget v15, p2, v2

    move-wide/from16 v23, v0

    int-to-long v0, v15

    and-long v0, v0, v16

    add-long/2addr v3, v0

    add-long v0, v23, v3

    long-to-int v3, v0

    .line 203
    aput v3, p2, v2

    ushr-long v0, v0, p1

    add-int/lit8 v2, v18, 0x5

    .line 204
    aget v3, p2, v2

    int-to-long v3, v3

    and-long v3, v3, v16

    add-long/2addr v13, v3

    add-long/2addr v0, v13

    long-to-int v3, v0

    .line 205
    aput v3, p2, v2

    ushr-long v13, v0, p1

    move-wide/from16 v3, v16

    move-wide/from16 v1, v20

    move/from16 v0, v22

    goto/16 :goto_0

    :cond_0
    long-to-int v0, v13

    return v0
.end method

.method public static mulWord(I[I[II)I
    .locals 8

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    aget v6, p1, p0

    .line 12
    .line 13
    int-to-long v6, v6

    .line 14
    and-long/2addr v6, v2

    .line 15
    mul-long/2addr v6, v0

    .line 16
    add-long/2addr v4, v6

    .line 17
    add-int v6, p3, p0

    .line 18
    .line 19
    long-to-int v7, v4

    .line 20
    aput v7, p2, v6

    .line 21
    .line 22
    const/16 v6, 0x20

    .line 23
    .line 24
    ushr-long/2addr v4, v6

    .line 25
    add-int/lit8 p0, p0, 0x1

    .line 26
    .line 27
    const/4 v6, 0x5

    .line 28
    if-lt p0, v6, :cond_0

    .line 29
    .line 30
    long-to-int p0, v4

    .line 31
    return p0
.end method

.method public static mulWordAddExt(I[II[II)I
    .locals 11

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    aget p0, p1, p2

    .line 9
    .line 10
    int-to-long v4, p0

    .line 11
    and-long/2addr v4, v2

    .line 12
    mul-long/2addr v4, v0

    .line 13
    aget p0, p3, p4

    .line 14
    .line 15
    int-to-long v6, p0

    .line 16
    and-long/2addr v6, v2

    .line 17
    add-long/2addr v4, v6

    .line 18
    long-to-int p0, v4

    .line 19
    aput p0, p3, p4

    .line 20
    .line 21
    const/16 p0, 0x20

    .line 22
    .line 23
    ushr-long/2addr v4, p0

    .line 24
    add-int/lit8 v6, p2, 0x1

    .line 25
    .line 26
    aget v6, p1, v6

    .line 27
    .line 28
    int-to-long v6, v6

    .line 29
    and-long/2addr v6, v2

    .line 30
    mul-long/2addr v6, v0

    .line 31
    add-int/lit8 v8, p4, 0x1

    .line 32
    .line 33
    aget v9, p3, v8

    .line 34
    .line 35
    int-to-long v9, v9

    .line 36
    and-long/2addr v9, v2

    .line 37
    add-long/2addr v6, v9

    .line 38
    add-long/2addr v4, v6

    .line 39
    long-to-int v6, v4

    .line 40
    aput v6, p3, v8

    .line 41
    .line 42
    ushr-long/2addr v4, p0

    .line 43
    add-int/lit8 v6, p2, 0x2

    .line 44
    .line 45
    aget v6, p1, v6

    .line 46
    .line 47
    int-to-long v6, v6

    .line 48
    and-long/2addr v6, v2

    .line 49
    mul-long/2addr v6, v0

    .line 50
    add-int/lit8 v8, p4, 0x2

    .line 51
    .line 52
    aget v9, p3, v8

    .line 53
    .line 54
    int-to-long v9, v9

    .line 55
    and-long/2addr v9, v2

    .line 56
    add-long/2addr v6, v9

    .line 57
    add-long/2addr v4, v6

    .line 58
    long-to-int v6, v4

    .line 59
    aput v6, p3, v8

    .line 60
    .line 61
    ushr-long/2addr v4, p0

    .line 62
    add-int/lit8 v6, p2, 0x3

    .line 63
    .line 64
    aget v6, p1, v6

    .line 65
    .line 66
    int-to-long v6, v6

    .line 67
    and-long/2addr v6, v2

    .line 68
    mul-long/2addr v6, v0

    .line 69
    add-int/lit8 v8, p4, 0x3

    .line 70
    .line 71
    aget v9, p3, v8

    .line 72
    .line 73
    int-to-long v9, v9

    .line 74
    and-long/2addr v9, v2

    .line 75
    add-long/2addr v6, v9

    .line 76
    add-long/2addr v4, v6

    .line 77
    long-to-int v6, v4

    .line 78
    aput v6, p3, v8

    .line 79
    .line 80
    ushr-long/2addr v4, p0

    .line 81
    add-int/lit8 p2, p2, 0x4

    .line 82
    .line 83
    aget p1, p1, p2

    .line 84
    .line 85
    int-to-long p1, p1

    .line 86
    and-long/2addr p1, v2

    .line 87
    mul-long/2addr v0, p1

    .line 88
    add-int/lit8 p4, p4, 0x4

    .line 89
    .line 90
    aget p1, p3, p4

    .line 91
    .line 92
    int-to-long p1, p1

    .line 93
    and-long/2addr p1, v2

    .line 94
    add-long/2addr v0, p1

    .line 95
    add-long/2addr v4, v0

    .line 96
    long-to-int p1, v4

    .line 97
    aput p1, p3, p4

    .line 98
    .line 99
    ushr-long p0, v4, p0

    .line 100
    .line 101
    long-to-int p0, p0

    .line 102
    return p0
.end method

.method public static mulWordDwordAdd(IJ[II)I
    .locals 8

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    and-long v4, p1, v2

    .line 9
    .line 10
    mul-long/2addr v4, v0

    .line 11
    aget p0, p3, p4

    .line 12
    .line 13
    int-to-long v6, p0

    .line 14
    and-long/2addr v6, v2

    .line 15
    add-long/2addr v4, v6

    .line 16
    long-to-int p0, v4

    .line 17
    aput p0, p3, p4

    .line 18
    .line 19
    const/16 p0, 0x20

    .line 20
    .line 21
    ushr-long/2addr v4, p0

    .line 22
    ushr-long/2addr p1, p0

    .line 23
    mul-long/2addr v0, p1

    .line 24
    add-int/lit8 p1, p4, 0x1

    .line 25
    .line 26
    aget p2, p3, p1

    .line 27
    .line 28
    int-to-long v6, p2

    .line 29
    and-long/2addr v6, v2

    .line 30
    add-long/2addr v0, v6

    .line 31
    add-long/2addr v4, v0

    .line 32
    long-to-int p2, v4

    .line 33
    aput p2, p3, p1

    .line 34
    .line 35
    ushr-long p1, v4, p0

    .line 36
    .line 37
    add-int/lit8 v0, p4, 0x2

    .line 38
    .line 39
    aget v1, p3, v0

    .line 40
    .line 41
    int-to-long v4, v1

    .line 42
    and-long v1, v4, v2

    .line 43
    .line 44
    add-long/2addr p1, v1

    .line 45
    long-to-int v1, p1

    .line 46
    aput v1, p3, v0

    .line 47
    .line 48
    ushr-long p0, p1, p0

    .line 49
    .line 50
    const-wide/16 v0, 0x0

    .line 51
    .line 52
    cmp-long p0, p0, v0

    .line 53
    .line 54
    if-nez p0, :cond_0

    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :cond_0
    const/4 p0, 0x5

    .line 59
    const/4 p1, 0x3

    .line 60
    invoke-static {p0, p3, p4, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0
.end method

.method public static mulWordsAdd(II[II)I
    .locals 6

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    int-to-long p0, p1

    .line 9
    and-long/2addr p0, v2

    .line 10
    mul-long/2addr p0, v0

    .line 11
    aget v0, p2, p3

    .line 12
    .line 13
    int-to-long v0, v0

    .line 14
    and-long/2addr v0, v2

    .line 15
    add-long/2addr p0, v0

    .line 16
    long-to-int v0, p0

    .line 17
    aput v0, p2, p3

    .line 18
    .line 19
    const/16 v0, 0x20

    .line 20
    .line 21
    ushr-long/2addr p0, v0

    .line 22
    add-int/lit8 v1, p3, 0x1

    .line 23
    .line 24
    aget v4, p2, v1

    .line 25
    .line 26
    int-to-long v4, v4

    .line 27
    and-long/2addr v2, v4

    .line 28
    add-long/2addr p0, v2

    .line 29
    long-to-int v2, p0

    .line 30
    aput v2, p2, v1

    .line 31
    .line 32
    ushr-long/2addr p0, v0

    .line 33
    const-wide/16 v0, 0x0

    .line 34
    .line 35
    cmp-long p0, p0, v0

    .line 36
    .line 37
    if-nez p0, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p0, 0x5

    .line 42
    const/4 p1, 0x2

    .line 43
    invoke-static {p0, p2, p3, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0
.end method

.method public static square([II[II)V
    .locals 30

    .line 1
    aget v0, p0, p1

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    const/4 v4, 0x0

    .line 11
    const/16 v6, 0xa

    .line 12
    .line 13
    const/4 v7, 0x4

    .line 14
    :goto_0
    add-int/lit8 v8, v7, -0x1

    .line 15
    .line 16
    add-int v7, p1, v7

    .line 17
    .line 18
    aget v7, p0, v7

    .line 19
    .line 20
    int-to-long v9, v7

    .line 21
    and-long/2addr v9, v2

    .line 22
    mul-long/2addr v9, v9

    .line 23
    add-int/lit8 v7, v6, -0x1

    .line 24
    .line 25
    add-int v7, p3, v7

    .line 26
    .line 27
    shl-int/lit8 v4, v4, 0x1f

    .line 28
    .line 29
    const/16 v11, 0x21

    .line 30
    .line 31
    ushr-long v12, v9, v11

    .line 32
    .line 33
    long-to-int v12, v12

    .line 34
    or-int/2addr v4, v12

    .line 35
    aput v4, p2, v7

    .line 36
    .line 37
    add-int/lit8 v6, v6, -0x2

    .line 38
    .line 39
    add-int v4, p3, v6

    .line 40
    .line 41
    const/4 v7, 0x1

    .line 42
    ushr-long v12, v9, v7

    .line 43
    .line 44
    long-to-int v12, v12

    .line 45
    aput v12, p2, v4

    .line 46
    .line 47
    long-to-int v4, v9

    .line 48
    if-gtz v8, :cond_0

    .line 49
    .line 50
    mul-long v8, v0, v0

    .line 51
    .line 52
    shl-int/lit8 v4, v4, 0x1f

    .line 53
    .line 54
    int-to-long v12, v4

    .line 55
    and-long/2addr v12, v2

    .line 56
    ushr-long v10, v8, v11

    .line 57
    .line 58
    or-long/2addr v10, v12

    .line 59
    long-to-int v4, v8

    .line 60
    aput v4, p2, p3

    .line 61
    .line 62
    const/16 v4, 0x20

    .line 63
    .line 64
    ushr-long/2addr v8, v4

    .line 65
    long-to-int v6, v8

    .line 66
    and-int/2addr v6, v7

    .line 67
    add-int/lit8 v8, p1, 0x1

    .line 68
    .line 69
    aget v8, p0, v8

    .line 70
    .line 71
    int-to-long v8, v8

    .line 72
    and-long/2addr v8, v2

    .line 73
    add-int/lit8 v12, p3, 0x2

    .line 74
    .line 75
    aget v13, p2, v12

    .line 76
    .line 77
    int-to-long v13, v13

    .line 78
    and-long/2addr v13, v2

    .line 79
    mul-long v15, v8, v0

    .line 80
    .line 81
    add-long/2addr v10, v15

    .line 82
    long-to-int v15, v10

    .line 83
    add-int/lit8 v16, p3, 0x1

    .line 84
    .line 85
    shl-int/lit8 v17, v15, 0x1

    .line 86
    .line 87
    or-int v6, v17, v6

    .line 88
    .line 89
    aput v6, p2, v16

    .line 90
    .line 91
    ushr-int/lit8 v6, v15, 0x1f

    .line 92
    .line 93
    ushr-long/2addr v10, v4

    .line 94
    add-long/2addr v13, v10

    .line 95
    add-int/lit8 v10, p1, 0x2

    .line 96
    .line 97
    aget v10, p0, v10

    .line 98
    .line 99
    int-to-long v10, v10

    .line 100
    and-long/2addr v10, v2

    .line 101
    add-int/lit8 v15, p3, 0x3

    .line 102
    .line 103
    move-wide/from16 v16, v2

    .line 104
    .line 105
    aget v2, p2, v15

    .line 106
    .line 107
    int-to-long v2, v2

    .line 108
    and-long v2, v2, v16

    .line 109
    .line 110
    add-int/lit8 v18, p3, 0x4

    .line 111
    .line 112
    move/from16 v19, v4

    .line 113
    .line 114
    aget v4, p2, v18

    .line 115
    .line 116
    move/from16 v21, v6

    .line 117
    .line 118
    const/16 v20, 0x4

    .line 119
    .line 120
    int-to-long v5, v4

    .line 121
    and-long v4, v5, v16

    .line 122
    .line 123
    mul-long v22, v10, v0

    .line 124
    .line 125
    add-long v13, v13, v22

    .line 126
    .line 127
    long-to-int v6, v13

    .line 128
    shl-int/lit8 v22, v6, 0x1

    .line 129
    .line 130
    or-int v21, v22, v21

    .line 131
    .line 132
    aput v21, p2, v12

    .line 133
    .line 134
    ushr-int/lit8 v6, v6, 0x1f

    .line 135
    .line 136
    ushr-long v12, v13, v19

    .line 137
    .line 138
    mul-long v21, v10, v8

    .line 139
    .line 140
    add-long v12, v12, v21

    .line 141
    .line 142
    add-long/2addr v2, v12

    .line 143
    ushr-long v12, v2, v19

    .line 144
    .line 145
    add-long/2addr v4, v12

    .line 146
    and-long v2, v2, v16

    .line 147
    .line 148
    add-int/lit8 v12, p1, 0x3

    .line 149
    .line 150
    aget v12, p0, v12

    .line 151
    .line 152
    int-to-long v12, v12

    .line 153
    and-long v12, v12, v16

    .line 154
    .line 155
    add-int/lit8 v14, p3, 0x5

    .line 156
    .line 157
    move/from16 v21, v7

    .line 158
    .line 159
    aget v7, p2, v14

    .line 160
    .line 161
    move-wide/from16 v22, v0

    .line 162
    .line 163
    int-to-long v0, v7

    .line 164
    and-long v0, v0, v16

    .line 165
    .line 166
    add-int/lit8 v7, p3, 0x6

    .line 167
    .line 168
    move-wide/from16 v24, v0

    .line 169
    .line 170
    aget v0, p2, v7

    .line 171
    .line 172
    int-to-long v0, v0

    .line 173
    and-long v0, v0, v16

    .line 174
    .line 175
    mul-long v26, v12, v22

    .line 176
    .line 177
    add-long v2, v2, v26

    .line 178
    .line 179
    move-wide/from16 v26, v0

    .line 180
    .line 181
    long-to-int v0, v2

    .line 182
    shl-int/lit8 v1, v0, 0x1

    .line 183
    .line 184
    or-int/2addr v1, v6

    .line 185
    aput v1, p2, v15

    .line 186
    .line 187
    ushr-int/lit8 v0, v0, 0x1f

    .line 188
    .line 189
    ushr-long v1, v2, v19

    .line 190
    .line 191
    mul-long v28, v12, v8

    .line 192
    .line 193
    add-long v1, v1, v28

    .line 194
    .line 195
    add-long/2addr v4, v1

    .line 196
    ushr-long v1, v4, v19

    .line 197
    .line 198
    mul-long v28, v12, v10

    .line 199
    .line 200
    add-long v1, v1, v28

    .line 201
    .line 202
    add-long v1, v24, v1

    .line 203
    .line 204
    and-long v3, v4, v16

    .line 205
    .line 206
    ushr-long v5, v1, v19

    .line 207
    .line 208
    add-long v5, v26, v5

    .line 209
    .line 210
    and-long v1, v1, v16

    .line 211
    .line 212
    add-int/lit8 v15, p1, 0x4

    .line 213
    .line 214
    aget v15, p0, v15

    .line 215
    .line 216
    move/from16 v24, v0

    .line 217
    .line 218
    move-wide/from16 v25, v1

    .line 219
    .line 220
    int-to-long v0, v15

    .line 221
    and-long v0, v0, v16

    .line 222
    .line 223
    add-int/lit8 v2, p3, 0x7

    .line 224
    .line 225
    aget v15, p2, v2

    .line 226
    .line 227
    move-wide/from16 p0, v0

    .line 228
    .line 229
    int-to-long v0, v15

    .line 230
    and-long v0, v0, v16

    .line 231
    .line 232
    add-int/lit8 v15, p3, 0x8

    .line 233
    .line 234
    move-wide/from16 v27, v0

    .line 235
    .line 236
    aget v0, p2, v15

    .line 237
    .line 238
    int-to-long v0, v0

    .line 239
    and-long v0, v0, v16

    .line 240
    .line 241
    mul-long v16, p0, v22

    .line 242
    .line 243
    add-long v3, v3, v16

    .line 244
    .line 245
    move-wide/from16 v16, v0

    .line 246
    .line 247
    long-to-int v0, v3

    .line 248
    shl-int/lit8 v1, v0, 0x1

    .line 249
    .line 250
    or-int v1, v1, v24

    .line 251
    .line 252
    aput v1, p2, v18

    .line 253
    .line 254
    ushr-int/lit8 v0, v0, 0x1f

    .line 255
    .line 256
    ushr-long v3, v3, v19

    .line 257
    .line 258
    mul-long v8, v8, p0

    .line 259
    .line 260
    add-long/2addr v3, v8

    .line 261
    add-long v3, v25, v3

    .line 262
    .line 263
    ushr-long v8, v3, v19

    .line 264
    .line 265
    mul-long v10, v10, p0

    .line 266
    .line 267
    add-long/2addr v8, v10

    .line 268
    add-long/2addr v5, v8

    .line 269
    ushr-long v8, v5, v19

    .line 270
    .line 271
    mul-long v10, p0, v12

    .line 272
    .line 273
    add-long/2addr v8, v10

    .line 274
    add-long v8, v27, v8

    .line 275
    .line 276
    ushr-long v10, v8, v19

    .line 277
    .line 278
    add-long v10, v16, v10

    .line 279
    .line 280
    long-to-int v1, v3

    .line 281
    shl-int/lit8 v3, v1, 0x1

    .line 282
    .line 283
    or-int/2addr v0, v3

    .line 284
    aput v0, p2, v14

    .line 285
    .line 286
    ushr-int/lit8 v0, v1, 0x1f

    .line 287
    .line 288
    long-to-int v1, v5

    .line 289
    shl-int/lit8 v3, v1, 0x1

    .line 290
    .line 291
    or-int/2addr v0, v3

    .line 292
    aput v0, p2, v7

    .line 293
    .line 294
    ushr-int/lit8 v0, v1, 0x1f

    .line 295
    .line 296
    long-to-int v1, v8

    .line 297
    shl-int/lit8 v3, v1, 0x1

    .line 298
    .line 299
    or-int/2addr v0, v3

    .line 300
    aput v0, p2, v2

    .line 301
    .line 302
    ushr-int/lit8 v0, v1, 0x1f

    .line 303
    .line 304
    long-to-int v1, v10

    .line 305
    shl-int/lit8 v2, v1, 0x1

    .line 306
    .line 307
    or-int/2addr v0, v2

    .line 308
    aput v0, p2, v15

    .line 309
    .line 310
    ushr-int/lit8 v0, v1, 0x1f

    .line 311
    .line 312
    add-int/lit8 v1, p3, 0x9

    .line 313
    .line 314
    aget v2, p2, v1

    .line 315
    .line 316
    shr-long v3, v10, v19

    .line 317
    .line 318
    long-to-int v3, v3

    .line 319
    add-int/2addr v2, v3

    .line 320
    shl-int/lit8 v2, v2, 0x1

    .line 321
    .line 322
    or-int/2addr v0, v2

    .line 323
    aput v0, p2, v1

    .line 324
    .line 325
    return-void

    .line 326
    :cond_0
    move v7, v8

    .line 327
    goto/16 :goto_0
.end method

.method public static square([I[I)V
    .locals 30

    const/4 v0, 0x0

    .line 328
    aget v1, p0, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    const/4 v5, 0x4

    const/16 v6, 0xa

    move v8, v0

    move v7, v5

    :goto_0
    add-int/lit8 v9, v7, -0x1

    .line 329
    aget v7, p0, v7

    int-to-long v10, v7

    and-long/2addr v10, v3

    mul-long/2addr v10, v10

    add-int/lit8 v7, v6, -0x1

    shl-int/lit8 v8, v8, 0x1f

    const/16 v12, 0x21

    ushr-long v13, v10, v12

    long-to-int v13, v13

    or-int/2addr v8, v13

    .line 330
    aput v8, p1, v7

    add-int/lit8 v6, v6, -0x2

    const/4 v7, 0x1

    ushr-long v13, v10, v7

    long-to-int v8, v13

    .line 331
    aput v8, p1, v6

    long-to-int v8, v10

    if-gtz v9, :cond_0

    mul-long v9, v1, v1

    shl-int/lit8 v6, v8, 0x1f

    int-to-long v13, v6

    and-long/2addr v13, v3

    ushr-long v11, v9, v12

    or-long/2addr v11, v13

    long-to-int v6, v9

    .line 332
    aput v6, p1, v0

    const/16 v0, 0x20

    ushr-long v8, v9, v0

    long-to-int v6, v8

    and-int/2addr v6, v7

    .line 333
    aget v8, p0, v7

    int-to-long v8, v8

    and-long/2addr v8, v3

    const/4 v10, 0x2

    .line 334
    aget v13, p1, v10

    int-to-long v13, v13

    and-long/2addr v13, v3

    mul-long v15, v8, v1

    add-long/2addr v11, v15

    long-to-int v15, v11

    shl-int/lit8 v16, v15, 0x1

    or-int v6, v16, v6

    .line 335
    aput v6, p1, v7

    ushr-int/lit8 v6, v15, 0x1f

    ushr-long/2addr v11, v0

    add-long/2addr v13, v11

    .line 336
    aget v11, p0, v10

    int-to-long v11, v11

    and-long/2addr v11, v3

    const/4 v15, 0x3

    move/from16 v16, v0

    .line 337
    aget v0, p1, v15

    move-wide/from16 v17, v3

    int-to-long v3, v0

    and-long v3, v3, v17

    .line 338
    aget v0, p1, v5

    move/from16 v19, v5

    move/from16 v20, v6

    int-to-long v5, v0

    and-long v5, v5, v17

    mul-long v21, v11, v1

    add-long v13, v13, v21

    long-to-int v0, v13

    shl-int/lit8 v21, v0, 0x1

    or-int v20, v21, v20

    .line 339
    aput v20, p1, v10

    ushr-int/lit8 v0, v0, 0x1f

    ushr-long v13, v13, v16

    mul-long v20, v11, v8

    add-long v13, v13, v20

    add-long/2addr v3, v13

    ushr-long v13, v3, v16

    add-long/2addr v5, v13

    and-long v3, v3, v17

    .line 340
    aget v10, p0, v15

    int-to-long v13, v10

    and-long v13, v13, v17

    const/4 v10, 0x5

    move/from16 v20, v7

    .line 341
    aget v7, p1, v10

    move-wide/from16 v21, v11

    move v12, v10

    int-to-long v10, v7

    and-long v10, v10, v17

    const/16 v23, 0x6

    .line 342
    aget v7, p1, v23

    move-wide/from16 v24, v13

    move v14, v12

    int-to-long v12, v7

    and-long v12, v12, v17

    mul-long v26, v24, v1

    add-long v3, v3, v26

    long-to-int v7, v3

    shl-int/lit8 v26, v7, 0x1

    or-int v0, v26, v0

    .line 343
    aput v0, p1, v15

    ushr-int/lit8 v0, v7, 0x1f

    ushr-long v3, v3, v16

    mul-long v26, v24, v8

    add-long v3, v3, v26

    add-long/2addr v5, v3

    ushr-long v3, v5, v16

    mul-long v26, v24, v21

    add-long v3, v3, v26

    add-long/2addr v10, v3

    and-long v3, v5, v17

    ushr-long v5, v10, v16

    add-long/2addr v12, v5

    and-long v5, v10, v17

    .line 344
    aget v7, p0, v19

    int-to-long v10, v7

    and-long v10, v10, v17

    const/4 v7, 0x7

    .line 345
    aget v15, p1, v7

    move/from16 p0, v7

    move-wide/from16 v26, v8

    int-to-long v7, v15

    and-long v7, v7, v17

    const/16 v9, 0x8

    .line 346
    aget v15, p1, v9

    move-wide/from16 v28, v10

    move v11, v9

    int-to-long v9, v15

    and-long v9, v9, v17

    mul-long v1, v1, v28

    add-long/2addr v3, v1

    long-to-int v1, v3

    shl-int/lit8 v2, v1, 0x1

    or-int/2addr v0, v2

    .line 347
    aput v0, p1, v19

    ushr-int/lit8 v0, v1, 0x1f

    ushr-long v1, v3, v16

    mul-long v3, v28, v26

    add-long/2addr v1, v3

    add-long/2addr v5, v1

    ushr-long v1, v5, v16

    mul-long v3, v28, v21

    add-long/2addr v1, v3

    add-long/2addr v12, v1

    ushr-long v1, v12, v16

    mul-long v3, v28, v24

    add-long/2addr v1, v3

    add-long/2addr v7, v1

    ushr-long v1, v7, v16

    add-long/2addr v9, v1

    long-to-int v1, v5

    shl-int/lit8 v2, v1, 0x1

    or-int/2addr v0, v2

    .line 348
    aput v0, p1, v14

    ushr-int/lit8 v0, v1, 0x1f

    long-to-int v1, v12

    shl-int/lit8 v2, v1, 0x1

    or-int/2addr v0, v2

    .line 349
    aput v0, p1, v23

    ushr-int/lit8 v0, v1, 0x1f

    long-to-int v1, v7

    shl-int/lit8 v2, v1, 0x1

    or-int/2addr v0, v2

    .line 350
    aput v0, p1, p0

    ushr-int/lit8 v0, v1, 0x1f

    long-to-int v1, v9

    shl-int/lit8 v2, v1, 0x1

    or-int/2addr v0, v2

    .line 351
    aput v0, p1, v11

    ushr-int/lit8 v0, v1, 0x1f

    const/16 v1, 0x9

    .line 352
    aget v2, p1, v1

    shr-long v3, v9, v16

    long-to-int v3, v3

    add-int/2addr v2, v3

    shl-int/lit8 v2, v2, 0x1

    or-int/2addr v0, v2

    .line 353
    aput v0, p1, v1

    return-void

    :cond_0
    move v7, v9

    goto/16 :goto_0
.end method

.method public static sub([II[II[II)I
    .locals 9

    .line 1
    aget v0, p0, p1

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    aget v4, p2, p3

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    and-long/2addr v4, v2

    .line 14
    sub-long/2addr v0, v4

    .line 15
    long-to-int v4, v0

    .line 16
    aput v4, p4, p5

    .line 17
    .line 18
    const/16 v4, 0x20

    .line 19
    .line 20
    shr-long/2addr v0, v4

    .line 21
    add-int/lit8 v5, p1, 0x1

    .line 22
    .line 23
    aget v5, p0, v5

    .line 24
    .line 25
    int-to-long v5, v5

    .line 26
    and-long/2addr v5, v2

    .line 27
    add-int/lit8 v7, p3, 0x1

    .line 28
    .line 29
    aget v7, p2, v7

    .line 30
    .line 31
    int-to-long v7, v7

    .line 32
    and-long/2addr v7, v2

    .line 33
    sub-long/2addr v5, v7

    .line 34
    add-long/2addr v0, v5

    .line 35
    add-int/lit8 v5, p5, 0x1

    .line 36
    .line 37
    long-to-int v6, v0

    .line 38
    aput v6, p4, v5

    .line 39
    .line 40
    shr-long/2addr v0, v4

    .line 41
    add-int/lit8 v5, p1, 0x2

    .line 42
    .line 43
    aget v5, p0, v5

    .line 44
    .line 45
    int-to-long v5, v5

    .line 46
    and-long/2addr v5, v2

    .line 47
    add-int/lit8 v7, p3, 0x2

    .line 48
    .line 49
    aget v7, p2, v7

    .line 50
    .line 51
    int-to-long v7, v7

    .line 52
    and-long/2addr v7, v2

    .line 53
    sub-long/2addr v5, v7

    .line 54
    add-long/2addr v0, v5

    .line 55
    add-int/lit8 v5, p5, 0x2

    .line 56
    .line 57
    long-to-int v6, v0

    .line 58
    aput v6, p4, v5

    .line 59
    .line 60
    shr-long/2addr v0, v4

    .line 61
    add-int/lit8 v5, p1, 0x3

    .line 62
    .line 63
    aget v5, p0, v5

    .line 64
    .line 65
    int-to-long v5, v5

    .line 66
    and-long/2addr v5, v2

    .line 67
    add-int/lit8 v7, p3, 0x3

    .line 68
    .line 69
    aget v7, p2, v7

    .line 70
    .line 71
    int-to-long v7, v7

    .line 72
    and-long/2addr v7, v2

    .line 73
    sub-long/2addr v5, v7

    .line 74
    add-long/2addr v0, v5

    .line 75
    add-int/lit8 v5, p5, 0x3

    .line 76
    .line 77
    long-to-int v6, v0

    .line 78
    aput v6, p4, v5

    .line 79
    .line 80
    shr-long/2addr v0, v4

    .line 81
    add-int/lit8 p1, p1, 0x4

    .line 82
    .line 83
    aget p0, p0, p1

    .line 84
    .line 85
    int-to-long p0, p0

    .line 86
    and-long/2addr p0, v2

    .line 87
    add-int/lit8 p3, p3, 0x4

    .line 88
    .line 89
    aget p2, p2, p3

    .line 90
    .line 91
    int-to-long p2, p2

    .line 92
    and-long/2addr p2, v2

    .line 93
    sub-long/2addr p0, p2

    .line 94
    add-long/2addr v0, p0

    .line 95
    add-int/lit8 p5, p5, 0x4

    .line 96
    .line 97
    long-to-int p0, v0

    .line 98
    aput p0, p4, p5

    .line 99
    .line 100
    shr-long p0, v0, v4

    .line 101
    .line 102
    long-to-int p0, p0

    .line 103
    return p0
.end method

.method public static sub([I[I[I)I
    .locals 10

    const/4 v0, 0x0

    .line 104
    aget v1, p0, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    aget v5, p1, v0

    int-to-long v5, v5

    and-long/2addr v5, v3

    sub-long/2addr v1, v5

    long-to-int v5, v1

    .line 105
    aput v5, p2, v0

    const/16 v0, 0x20

    shr-long/2addr v1, v0

    const/4 v5, 0x1

    .line 106
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 107
    aput v6, p2, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x2

    .line 108
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 109
    aput v6, p2, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x3

    .line 110
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 111
    aput v6, p2, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x4

    .line 112
    aget p0, p0, v5

    int-to-long v6, p0

    and-long/2addr v6, v3

    aget p0, p1, v5

    int-to-long p0, p0

    and-long/2addr p0, v3

    sub-long/2addr v6, p0

    add-long/2addr v1, v6

    long-to-int p0, v1

    .line 113
    aput p0, p2, v5

    shr-long p0, v1, v0

    long-to-int p0, p0

    return p0
.end method

.method public static subBothFrom([I[I[I)I
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p2, v0

    .line 3
    .line 4
    int-to-long v1, v1

    .line 5
    const-wide v3, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v1, v3

    .line 11
    aget v5, p0, v0

    .line 12
    .line 13
    int-to-long v5, v5

    .line 14
    and-long/2addr v5, v3

    .line 15
    sub-long/2addr v1, v5

    .line 16
    aget v5, p1, v0

    .line 17
    .line 18
    int-to-long v5, v5

    .line 19
    and-long/2addr v5, v3

    .line 20
    sub-long/2addr v1, v5

    .line 21
    long-to-int v5, v1

    .line 22
    aput v5, p2, v0

    .line 23
    .line 24
    const/16 v0, 0x20

    .line 25
    .line 26
    shr-long/2addr v1, v0

    .line 27
    const/4 v5, 0x1

    .line 28
    aget v6, p2, v5

    .line 29
    .line 30
    int-to-long v6, v6

    .line 31
    and-long/2addr v6, v3

    .line 32
    aget v8, p0, v5

    .line 33
    .line 34
    int-to-long v8, v8

    .line 35
    and-long/2addr v8, v3

    .line 36
    sub-long/2addr v6, v8

    .line 37
    aget v8, p1, v5

    .line 38
    .line 39
    int-to-long v8, v8

    .line 40
    and-long/2addr v8, v3

    .line 41
    sub-long/2addr v6, v8

    .line 42
    add-long/2addr v1, v6

    .line 43
    long-to-int v6, v1

    .line 44
    aput v6, p2, v5

    .line 45
    .line 46
    shr-long/2addr v1, v0

    .line 47
    const/4 v5, 0x2

    .line 48
    aget v6, p2, v5

    .line 49
    .line 50
    int-to-long v6, v6

    .line 51
    and-long/2addr v6, v3

    .line 52
    aget v8, p0, v5

    .line 53
    .line 54
    int-to-long v8, v8

    .line 55
    and-long/2addr v8, v3

    .line 56
    sub-long/2addr v6, v8

    .line 57
    aget v8, p1, v5

    .line 58
    .line 59
    int-to-long v8, v8

    .line 60
    and-long/2addr v8, v3

    .line 61
    sub-long/2addr v6, v8

    .line 62
    add-long/2addr v1, v6

    .line 63
    long-to-int v6, v1

    .line 64
    aput v6, p2, v5

    .line 65
    .line 66
    shr-long/2addr v1, v0

    .line 67
    const/4 v5, 0x3

    .line 68
    aget v6, p2, v5

    .line 69
    .line 70
    int-to-long v6, v6

    .line 71
    and-long/2addr v6, v3

    .line 72
    aget v8, p0, v5

    .line 73
    .line 74
    int-to-long v8, v8

    .line 75
    and-long/2addr v8, v3

    .line 76
    sub-long/2addr v6, v8

    .line 77
    aget v8, p1, v5

    .line 78
    .line 79
    int-to-long v8, v8

    .line 80
    and-long/2addr v8, v3

    .line 81
    sub-long/2addr v6, v8

    .line 82
    add-long/2addr v1, v6

    .line 83
    long-to-int v6, v1

    .line 84
    aput v6, p2, v5

    .line 85
    .line 86
    shr-long/2addr v1, v0

    .line 87
    const/4 v5, 0x4

    .line 88
    aget v6, p2, v5

    .line 89
    .line 90
    int-to-long v6, v6

    .line 91
    and-long/2addr v6, v3

    .line 92
    aget p0, p0, v5

    .line 93
    .line 94
    int-to-long v8, p0

    .line 95
    and-long/2addr v8, v3

    .line 96
    sub-long/2addr v6, v8

    .line 97
    aget p0, p1, v5

    .line 98
    .line 99
    int-to-long p0, p0

    .line 100
    and-long/2addr p0, v3

    .line 101
    sub-long/2addr v6, p0

    .line 102
    add-long/2addr v1, v6

    .line 103
    long-to-int p0, v1

    .line 104
    aput p0, p2, v5

    .line 105
    .line 106
    shr-long p0, v1, v0

    .line 107
    .line 108
    long-to-int p0, p0

    .line 109
    return p0
.end method

.method public static subFrom([II[II)I
    .locals 10

    .line 1
    aget v0, p2, p3

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    aget v4, p0, p1

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    and-long/2addr v4, v2

    .line 14
    sub-long/2addr v0, v4

    .line 15
    long-to-int v4, v0

    .line 16
    aput v4, p2, p3

    .line 17
    .line 18
    const/16 v4, 0x20

    .line 19
    .line 20
    shr-long/2addr v0, v4

    .line 21
    add-int/lit8 v5, p3, 0x1

    .line 22
    .line 23
    aget v6, p2, v5

    .line 24
    .line 25
    int-to-long v6, v6

    .line 26
    and-long/2addr v6, v2

    .line 27
    add-int/lit8 v8, p1, 0x1

    .line 28
    .line 29
    aget v8, p0, v8

    .line 30
    .line 31
    int-to-long v8, v8

    .line 32
    and-long/2addr v8, v2

    .line 33
    sub-long/2addr v6, v8

    .line 34
    add-long/2addr v0, v6

    .line 35
    long-to-int v6, v0

    .line 36
    aput v6, p2, v5

    .line 37
    .line 38
    shr-long/2addr v0, v4

    .line 39
    add-int/lit8 v5, p3, 0x2

    .line 40
    .line 41
    aget v6, p2, v5

    .line 42
    .line 43
    int-to-long v6, v6

    .line 44
    and-long/2addr v6, v2

    .line 45
    add-int/lit8 v8, p1, 0x2

    .line 46
    .line 47
    aget v8, p0, v8

    .line 48
    .line 49
    int-to-long v8, v8

    .line 50
    and-long/2addr v8, v2

    .line 51
    sub-long/2addr v6, v8

    .line 52
    add-long/2addr v0, v6

    .line 53
    long-to-int v6, v0

    .line 54
    aput v6, p2, v5

    .line 55
    .line 56
    shr-long/2addr v0, v4

    .line 57
    add-int/lit8 v5, p3, 0x3

    .line 58
    .line 59
    aget v6, p2, v5

    .line 60
    .line 61
    int-to-long v6, v6

    .line 62
    and-long/2addr v6, v2

    .line 63
    add-int/lit8 v8, p1, 0x3

    .line 64
    .line 65
    aget v8, p0, v8

    .line 66
    .line 67
    int-to-long v8, v8

    .line 68
    and-long/2addr v8, v2

    .line 69
    sub-long/2addr v6, v8

    .line 70
    add-long/2addr v0, v6

    .line 71
    long-to-int v6, v0

    .line 72
    aput v6, p2, v5

    .line 73
    .line 74
    shr-long/2addr v0, v4

    .line 75
    add-int/lit8 p3, p3, 0x4

    .line 76
    .line 77
    aget v5, p2, p3

    .line 78
    .line 79
    int-to-long v5, v5

    .line 80
    and-long/2addr v5, v2

    .line 81
    add-int/lit8 p1, p1, 0x4

    .line 82
    .line 83
    aget p0, p0, p1

    .line 84
    .line 85
    int-to-long p0, p0

    .line 86
    and-long/2addr p0, v2

    .line 87
    sub-long/2addr v5, p0

    .line 88
    add-long/2addr v0, v5

    .line 89
    long-to-int p0, v0

    .line 90
    aput p0, p2, p3

    .line 91
    .line 92
    shr-long p0, v0, v4

    .line 93
    .line 94
    long-to-int p0, p0

    .line 95
    return p0
.end method

.method public static subFrom([I[I)I
    .locals 10

    const/4 v0, 0x0

    .line 96
    aget v1, p1, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    aget v5, p0, v0

    int-to-long v5, v5

    and-long/2addr v5, v3

    sub-long/2addr v1, v5

    long-to-int v5, v1

    .line 97
    aput v5, p1, v0

    const/16 v0, 0x20

    shr-long/2addr v1, v0

    const/4 v5, 0x1

    .line 98
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p0, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 99
    aput v6, p1, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x2

    .line 100
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p0, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 101
    aput v6, p1, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x3

    .line 102
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p0, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 103
    aput v6, p1, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x4

    .line 104
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget p0, p0, v5

    int-to-long v8, p0

    and-long/2addr v3, v8

    sub-long/2addr v6, v3

    add-long/2addr v1, v6

    long-to-int p0, v1

    .line 105
    aput p0, p1, v5

    shr-long p0, v1, v0

    long-to-int p0, p0

    return p0
.end method

.method public static toBigInteger([I)Ljava/math/BigInteger;
    .locals 4

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    const/4 v2, 0x5

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    aget v2, p0, v1

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    rsub-int/lit8 v3, v1, 0x4

    .line 14
    .line 15
    shl-int/lit8 v3, v3, 0x2

    .line 16
    .line 17
    invoke-static {v2, v0, v3}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 18
    .line 19
    .line 20
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    new-instance p0, Ljava/math/BigInteger;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-direct {p0, v1, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public static zero([I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aput v0, p0, v0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    aput v0, p0, v1

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    aput v0, p0, v1

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    aput v0, p0, v1

    .line 12
    .line 13
    const/4 v1, 0x4

    .line 14
    aput v0, p0, v1

    .line 15
    .line 16
    return-void
.end method
