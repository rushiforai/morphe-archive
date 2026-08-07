.class public final Lcom/fasterxml/jackson/core/io/NumberOutput;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static BILLION:I = 0x3b9aca00

.field static final FULL_3:[C

.field static final FULL_TRIPLETS_B:[B

.field static final LEAD_3:[C

.field private static MAX_INT_AS_LONG:J = 0x7fffffffL

.field private static MILLION:I = 0xf4240

.field private static MIN_INT_AS_LONG:J = -0x80000000L

.field private static final NC:C = '\u0000'

.field static final SMALLEST_LONG:Ljava/lang/String;

.field private static TEN_BILLION_L:J = 0x2540be400L

.field private static THOUSAND_L:J = 0x3e8L

.field static final sSmallIntStrs:[Ljava/lang/String;

.field static final sSmallIntStrs2:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    const-wide/high16 v0, -0x8000000000000000L

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->SMALLEST_LONG:Ljava/lang/String;

    .line 8
    .line 9
    const/16 v0, 0xfa0

    .line 10
    .line 11
    new-array v1, v0, [C

    .line 12
    .line 13
    sput-object v1, Lcom/fasterxml/jackson/core/io/NumberOutput;->LEAD_3:[C

    .line 14
    .line 15
    new-array v1, v0, [C

    .line 16
    .line 17
    sput-object v1, Lcom/fasterxml/jackson/core/io/NumberOutput;->FULL_3:[C

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    move v2, v1

    .line 21
    move v3, v2

    .line 22
    :goto_0
    const/16 v4, 0xa

    .line 23
    .line 24
    if-ge v2, v4, :cond_4

    .line 25
    .line 26
    add-int/lit8 v5, v2, 0x30

    .line 27
    .line 28
    int-to-char v5, v5

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    move v6, v1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    move v6, v5

    .line 34
    :goto_1
    move v7, v1

    .line 35
    :goto_2
    if-ge v7, v4, :cond_3

    .line 36
    .line 37
    add-int/lit8 v8, v7, 0x30

    .line 38
    .line 39
    int-to-char v8, v8

    .line 40
    if-nez v2, :cond_1

    .line 41
    .line 42
    if-nez v7, :cond_1

    .line 43
    .line 44
    move v9, v1

    .line 45
    goto :goto_3

    .line 46
    :cond_1
    move v9, v8

    .line 47
    :goto_3
    move v10, v1

    .line 48
    :goto_4
    if-ge v10, v4, :cond_2

    .line 49
    .line 50
    add-int/lit8 v11, v10, 0x30

    .line 51
    .line 52
    int-to-char v11, v11

    .line 53
    sget-object v12, Lcom/fasterxml/jackson/core/io/NumberOutput;->LEAD_3:[C

    .line 54
    .line 55
    aput-char v6, v12, v3

    .line 56
    .line 57
    add-int/lit8 v13, v3, 0x1

    .line 58
    .line 59
    aput-char v9, v12, v13

    .line 60
    .line 61
    add-int/lit8 v14, v3, 0x2

    .line 62
    .line 63
    aput-char v11, v12, v14

    .line 64
    .line 65
    sget-object v12, Lcom/fasterxml/jackson/core/io/NumberOutput;->FULL_3:[C

    .line 66
    .line 67
    aput-char v5, v12, v3

    .line 68
    .line 69
    aput-char v8, v12, v13

    .line 70
    .line 71
    aput-char v11, v12, v14

    .line 72
    .line 73
    add-int/lit8 v3, v3, 0x4

    .line 74
    .line 75
    add-int/lit8 v10, v10, 0x1

    .line 76
    .line 77
    goto :goto_4

    .line 78
    :cond_2
    add-int/lit8 v7, v7, 0x1

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    new-array v2, v0, [B

    .line 85
    .line 86
    sput-object v2, Lcom/fasterxml/jackson/core/io/NumberOutput;->FULL_TRIPLETS_B:[B

    .line 87
    .line 88
    :goto_5
    if-ge v1, v0, :cond_5

    .line 89
    .line 90
    sget-object v2, Lcom/fasterxml/jackson/core/io/NumberOutput;->FULL_TRIPLETS_B:[B

    .line 91
    .line 92
    sget-object v3, Lcom/fasterxml/jackson/core/io/NumberOutput;->FULL_3:[C

    .line 93
    .line 94
    aget-char v3, v3, v1

    .line 95
    .line 96
    int-to-byte v3, v3

    .line 97
    aput-byte v3, v2, v1

    .line 98
    .line 99
    add-int/lit8 v1, v1, 0x1

    .line 100
    .line 101
    goto :goto_5

    .line 102
    :cond_5
    const-string v11, "9"

    .line 103
    .line 104
    const-string v12, "10"

    .line 105
    .line 106
    const-string v2, "0"

    .line 107
    .line 108
    const-string v3, "1"

    .line 109
    .line 110
    const-string v4, "2"

    .line 111
    .line 112
    const-string v5, "3"

    .line 113
    .line 114
    const-string v6, "4"

    .line 115
    .line 116
    const-string v7, "5"

    .line 117
    .line 118
    const-string v8, "6"

    .line 119
    .line 120
    const-string v9, "7"

    .line 121
    .line 122
    const-string v10, "8"

    .line 123
    .line 124
    filled-new-array/range {v2 .. v12}, [Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    sput-object v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->sSmallIntStrs:[Ljava/lang/String;

    .line 129
    .line 130
    const-string v9, "-9"

    .line 131
    .line 132
    const-string v10, "-10"

    .line 133
    .line 134
    const-string v1, "-1"

    .line 135
    .line 136
    const-string v2, "-2"

    .line 137
    .line 138
    const-string v3, "-3"

    .line 139
    .line 140
    const-string v4, "-4"

    .line 141
    .line 142
    const-string v5, "-5"

    .line 143
    .line 144
    const-string v6, "-6"

    .line 145
    .line 146
    const-string v7, "-7"

    .line 147
    .line 148
    const-string v8, "-8"

    .line 149
    .line 150
    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    sput-object v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->sSmallIntStrs2:[Ljava/lang/String;

    .line 155
    .line 156
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static calcLongStrLength(J)I
    .locals 6

    .line 1
    sget-wide v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->TEN_BILLION_L:J

    .line 2
    .line 3
    const/16 v2, 0xa

    .line 4
    .line 5
    :goto_0
    cmp-long v3, p0, v0

    .line 6
    .line 7
    if-ltz v3, :cond_1

    .line 8
    .line 9
    const/16 v3, 0x13

    .line 10
    .line 11
    if-ne v2, v3, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 15
    .line 16
    const/4 v3, 0x3

    .line 17
    shl-long v3, v0, v3

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    shl-long/2addr v0, v5

    .line 21
    add-long/2addr v0, v3

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    :goto_1
    return v2
.end method

.method private static full3(I[BI)I
    .locals 4

    shl-int/lit8 p0, p0, 0x2

    add-int/lit8 v0, p2, 0x1

    .line 28
    sget-object v1, Lcom/fasterxml/jackson/core/io/NumberOutput;->FULL_TRIPLETS_B:[B

    add-int/lit8 v2, p0, 0x1

    aget-byte v3, v1, p0

    aput-byte v3, p1, p2

    add-int/lit8 v3, p2, 0x2

    add-int/lit8 p0, p0, 0x2

    .line 29
    aget-byte v2, v1, v2

    aput-byte v2, p1, v0

    add-int/lit8 p2, p2, 0x3

    .line 30
    aget-byte p0, v1, p0

    aput-byte p0, p1, v3

    return p2
.end method

.method private static full3(I[CI)I
    .locals 4

    .line 1
    shl-int/lit8 p0, p0, 0x2

    .line 2
    .line 3
    add-int/lit8 v0, p2, 0x1

    .line 4
    .line 5
    sget-object v1, Lcom/fasterxml/jackson/core/io/NumberOutput;->FULL_3:[C

    .line 6
    .line 7
    add-int/lit8 v2, p0, 0x1

    .line 8
    .line 9
    aget-char v3, v1, p0

    .line 10
    .line 11
    aput-char v3, p1, p2

    .line 12
    .line 13
    add-int/lit8 v3, p2, 0x2

    .line 14
    .line 15
    add-int/lit8 p0, p0, 0x2

    .line 16
    .line 17
    aget-char v2, v1, v2

    .line 18
    .line 19
    aput-char v2, p1, v0

    .line 20
    .line 21
    add-int/lit8 p2, p2, 0x3

    .line 22
    .line 23
    aget-char p0, v1, p0

    .line 24
    .line 25
    aput-char p0, p1, v3

    .line 26
    .line 27
    return p2
.end method

.method private static leading3(I[BI)I
    .locals 4

    .line 1
    shl-int/lit8 p0, p0, 0x2

    .line 2
    .line 3
    sget-object v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->LEAD_3:[C

    .line 4
    .line 5
    add-int/lit8 v1, p0, 0x1

    .line 6
    .line 7
    aget-char v2, v0, p0

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    add-int/lit8 v3, p2, 0x1

    .line 12
    .line 13
    int-to-byte v2, v2

    .line 14
    aput-byte v2, p1, p2

    .line 15
    .line 16
    move p2, v3

    .line 17
    :cond_0
    add-int/lit8 p0, p0, 0x2

    .line 18
    .line 19
    aget-char v1, v0, v1

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    add-int/lit8 v2, p2, 0x1

    .line 24
    .line 25
    int-to-byte v1, v1

    .line 26
    aput-byte v1, p1, p2

    .line 27
    .line 28
    move p2, v2

    .line 29
    :cond_1
    add-int/lit8 v1, p2, 0x1

    .line 30
    .line 31
    aget-char p0, v0, p0

    .line 32
    .line 33
    int-to-byte p0, p0

    .line 34
    aput-byte p0, p1, p2

    .line 35
    .line 36
    return v1
.end method

.method private static leading3(I[CI)I
    .locals 4

    shl-int/lit8 p0, p0, 0x2

    .line 37
    sget-object v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->LEAD_3:[C

    add-int/lit8 v1, p0, 0x1

    aget-char v2, v0, p0

    if-eqz v2, :cond_0

    add-int/lit8 v3, p2, 0x1

    .line 38
    aput-char v2, p1, p2

    move p2, v3

    :cond_0
    add-int/lit8 p0, p0, 0x2

    .line 39
    aget-char v1, v0, v1

    if-eqz v1, :cond_1

    add-int/lit8 v2, p2, 0x1

    .line 40
    aput-char v1, p1, p2

    move p2, v2

    :cond_1
    add-int/lit8 v1, p2, 0x1

    .line 41
    aget-char p0, v0, p0

    aput-char p0, p1, p2

    return v1
.end method

.method public static outputInt(I[BI)I
    .locals 4

    if-gez p0, :cond_1

    const/high16 v0, -0x80000000

    if-ne p0, v0, :cond_0

    int-to-long v0, p0

    .line 118
    invoke-static {v0, v1, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputLong(J[BI)I

    move-result p0

    return p0

    :cond_0
    add-int/lit8 v0, p2, 0x1

    const/16 v1, 0x2d

    .line 119
    aput-byte v1, p1, p2

    neg-int p0, p0

    move p2, v0

    .line 120
    :cond_1
    sget v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->MILLION:I

    if-ge p0, v0, :cond_4

    const/16 v0, 0x3e8

    if-ge p0, v0, :cond_3

    const/16 v0, 0xa

    if-ge p0, v0, :cond_2

    add-int/lit8 v0, p2, 0x1

    add-int/lit8 p0, p0, 0x30

    int-to-byte p0, p0

    .line 121
    aput-byte p0, p1, p2

    return v0

    .line 122
    :cond_2
    invoke-static {p0, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->leading3(I[BI)I

    move-result p0

    return p0

    .line 123
    :cond_3
    div-int/lit16 v0, p0, 0x3e8

    mul-int/lit16 v1, v0, 0x3e8

    sub-int/2addr p0, v1

    .line 124
    invoke-static {v0, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->leading3(I[BI)I

    move-result p2

    .line 125
    invoke-static {p0, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->full3(I[BI)I

    move-result p0

    return p0

    .line 126
    :cond_4
    sget v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->BILLION:I

    if-lt p0, v0, :cond_5

    const/4 v1, 0x1

    goto :goto_0

    :cond_5
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_7

    sub-int/2addr p0, v0

    if-lt p0, v0, :cond_6

    sub-int/2addr p0, v0

    add-int/lit8 v0, p2, 0x1

    const/16 v2, 0x32

    .line 127
    aput-byte v2, p1, p2

    :goto_1
    move p2, v0

    goto :goto_2

    :cond_6
    add-int/lit8 v0, p2, 0x1

    const/16 v2, 0x31

    .line 128
    aput-byte v2, p1, p2

    goto :goto_1

    .line 129
    :cond_7
    :goto_2
    div-int/lit16 v0, p0, 0x3e8

    mul-int/lit16 v2, v0, 0x3e8

    sub-int/2addr p0, v2

    .line 130
    div-int/lit16 v2, v0, 0x3e8

    mul-int/lit16 v3, v2, 0x3e8

    sub-int/2addr v0, v3

    if-eqz v1, :cond_8

    .line 131
    invoke-static {v2, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->full3(I[BI)I

    move-result p2

    goto :goto_3

    .line 132
    :cond_8
    invoke-static {v2, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->leading3(I[BI)I

    move-result p2

    .line 133
    :goto_3
    invoke-static {v0, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->full3(I[BI)I

    move-result p2

    .line 134
    invoke-static {p0, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->full3(I[BI)I

    move-result p0

    return p0
.end method

.method public static outputInt(I[CI)I
    .locals 4

    .line 1
    if-gez p0, :cond_1

    .line 2
    .line 3
    const/high16 v0, -0x80000000

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    int-to-long v0, p0

    .line 8
    invoke-static {v0, v1, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputLong(J[CI)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    add-int/lit8 v0, p2, 0x1

    .line 14
    .line 15
    const/16 v1, 0x2d

    .line 16
    .line 17
    aput-char v1, p1, p2

    .line 18
    .line 19
    neg-int p0, p0

    .line 20
    move p2, v0

    .line 21
    :cond_1
    sget v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->MILLION:I

    .line 22
    .line 23
    if-ge p0, v0, :cond_4

    .line 24
    .line 25
    const/16 v0, 0x3e8

    .line 26
    .line 27
    if-ge p0, v0, :cond_3

    .line 28
    .line 29
    const/16 v0, 0xa

    .line 30
    .line 31
    if-ge p0, v0, :cond_2

    .line 32
    .line 33
    add-int/lit8 v0, p2, 0x1

    .line 34
    .line 35
    add-int/lit8 p0, p0, 0x30

    .line 36
    .line 37
    int-to-char p0, p0

    .line 38
    aput-char p0, p1, p2

    .line 39
    .line 40
    return v0

    .line 41
    :cond_2
    invoke-static {p0, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->leading3(I[CI)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_3
    div-int/lit16 v0, p0, 0x3e8

    .line 47
    .line 48
    mul-int/lit16 v1, v0, 0x3e8

    .line 49
    .line 50
    sub-int/2addr p0, v1

    .line 51
    invoke-static {v0, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->leading3(I[CI)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    invoke-static {p0, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->full3(I[CI)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0

    .line 60
    :cond_4
    sget v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->BILLION:I

    .line 61
    .line 62
    if-lt p0, v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x1

    .line 65
    goto :goto_0

    .line 66
    :cond_5
    const/4 v1, 0x0

    .line 67
    :goto_0
    if-eqz v1, :cond_7

    .line 68
    .line 69
    sub-int/2addr p0, v0

    .line 70
    if-lt p0, v0, :cond_6

    .line 71
    .line 72
    sub-int/2addr p0, v0

    .line 73
    add-int/lit8 v0, p2, 0x1

    .line 74
    .line 75
    const/16 v2, 0x32

    .line 76
    .line 77
    aput-char v2, p1, p2

    .line 78
    .line 79
    :goto_1
    move p2, v0

    .line 80
    goto :goto_2

    .line 81
    :cond_6
    add-int/lit8 v0, p2, 0x1

    .line 82
    .line 83
    const/16 v2, 0x31

    .line 84
    .line 85
    aput-char v2, p1, p2

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_7
    :goto_2
    div-int/lit16 v0, p0, 0x3e8

    .line 89
    .line 90
    mul-int/lit16 v2, v0, 0x3e8

    .line 91
    .line 92
    sub-int/2addr p0, v2

    .line 93
    div-int/lit16 v2, v0, 0x3e8

    .line 94
    .line 95
    mul-int/lit16 v3, v2, 0x3e8

    .line 96
    .line 97
    sub-int/2addr v0, v3

    .line 98
    if-eqz v1, :cond_8

    .line 99
    .line 100
    invoke-static {v2, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->full3(I[CI)I

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    goto :goto_3

    .line 105
    :cond_8
    invoke-static {v2, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->leading3(I[CI)I

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    :goto_3
    invoke-static {v0, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->full3(I[CI)I

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    invoke-static {p0, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberOutput;->full3(I[CI)I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    return p0
.end method

.method public static outputLong(J[BI)I
    .locals 6

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-gez v0, :cond_3

    .line 6
    .line 7
    sget-wide v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->MIN_INT_AS_LONG:J

    .line 8
    .line 9
    cmp-long v0, p0, v0

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    long-to-int p0, p0

    .line 14
    invoke-static {p0, p2, p3}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[BI)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    const-wide/high16 v0, -0x8000000000000000L

    .line 20
    .line 21
    cmp-long v0, p0, v0

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    sget-object p0, Lcom/fasterxml/jackson/core/io/NumberOutput;->SMALLEST_LONG:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/4 p1, 0x0

    .line 32
    :goto_0
    if-ge p1, p0, :cond_1

    .line 33
    .line 34
    add-int/lit8 v0, p3, 0x1

    .line 35
    .line 36
    sget-object v1, Lcom/fasterxml/jackson/core/io/NumberOutput;->SMALLEST_LONG:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/String;->charAt(I)C

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    int-to-byte v1, v1

    .line 43
    aput-byte v1, p2, p3

    .line 44
    .line 45
    add-int/lit8 p1, p1, 0x1

    .line 46
    .line 47
    move p3, v0

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    return p3

    .line 50
    :cond_2
    add-int/lit8 v0, p3, 0x1

    .line 51
    .line 52
    const/16 v1, 0x2d

    .line 53
    .line 54
    aput-byte v1, p2, p3

    .line 55
    .line 56
    neg-long p0, p0

    .line 57
    move p3, v0

    .line 58
    goto :goto_1

    .line 59
    :cond_3
    sget-wide v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->MAX_INT_AS_LONG:J

    .line 60
    .line 61
    cmp-long v0, p0, v0

    .line 62
    .line 63
    if-gtz v0, :cond_4

    .line 64
    .line 65
    long-to-int p0, p0

    .line 66
    invoke-static {p0, p2, p3}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[BI)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0

    .line 71
    :cond_4
    :goto_1
    invoke-static {p0, p1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->calcLongStrLength(J)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr v0, p3

    .line 76
    move v1, v0

    .line 77
    :goto_2
    sget-wide v2, Lcom/fasterxml/jackson/core/io/NumberOutput;->MAX_INT_AS_LONG:J

    .line 78
    .line 79
    cmp-long v2, p0, v2

    .line 80
    .line 81
    if-lez v2, :cond_5

    .line 82
    .line 83
    add-int/lit8 v1, v1, -0x3

    .line 84
    .line 85
    sget-wide v2, Lcom/fasterxml/jackson/core/io/NumberOutput;->THOUSAND_L:J

    .line 86
    .line 87
    div-long v4, p0, v2

    .line 88
    .line 89
    mul-long/2addr v2, v4

    .line 90
    sub-long/2addr p0, v2

    .line 91
    long-to-int p0, p0

    .line 92
    invoke-static {p0, p2, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->full3(I[BI)I

    .line 93
    .line 94
    .line 95
    move-wide p0, v4

    .line 96
    goto :goto_2

    .line 97
    :cond_5
    long-to-int p0, p0

    .line 98
    :goto_3
    const/16 p1, 0x3e8

    .line 99
    .line 100
    if-lt p0, p1, :cond_6

    .line 101
    .line 102
    add-int/lit8 v1, v1, -0x3

    .line 103
    .line 104
    div-int/lit16 p1, p0, 0x3e8

    .line 105
    .line 106
    mul-int/lit16 v2, p1, 0x3e8

    .line 107
    .line 108
    sub-int/2addr p0, v2

    .line 109
    invoke-static {p0, p2, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->full3(I[BI)I

    .line 110
    .line 111
    .line 112
    move p0, p1

    .line 113
    goto :goto_3

    .line 114
    :cond_6
    invoke-static {p0, p2, p3}, Lcom/fasterxml/jackson/core/io/NumberOutput;->leading3(I[BI)I

    .line 115
    .line 116
    .line 117
    return v0
.end method

.method public static outputLong(J[CI)I
    .locals 6

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gez v0, :cond_2

    .line 118
    sget-wide v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->MIN_INT_AS_LONG:J

    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    long-to-int p0, p0

    .line 119
    invoke-static {p0, p2, p3}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[CI)I

    move-result p0

    return p0

    :cond_0
    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v0, p0, v0

    if-nez v0, :cond_1

    .line 120
    sget-object p0, Lcom/fasterxml/jackson/core/io/NumberOutput;->SMALLEST_LONG:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    const/4 v0, 0x0

    .line 121
    invoke-virtual {p0, v0, p1, p2, p3}, Ljava/lang/String;->getChars(II[CI)V

    add-int/2addr p3, p1

    return p3

    :cond_1
    add-int/lit8 v0, p3, 0x1

    const/16 v1, 0x2d

    .line 122
    aput-char v1, p2, p3

    neg-long p0, p0

    move p3, v0

    goto :goto_0

    .line 123
    :cond_2
    sget-wide v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->MAX_INT_AS_LONG:J

    cmp-long v0, p0, v0

    if-gtz v0, :cond_3

    long-to-int p0, p0

    .line 124
    invoke-static {p0, p2, p3}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[CI)I

    move-result p0

    return p0

    .line 125
    :cond_3
    :goto_0
    invoke-static {p0, p1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->calcLongStrLength(J)I

    move-result v0

    add-int/2addr v0, p3

    move v1, v0

    .line 126
    :goto_1
    sget-wide v2, Lcom/fasterxml/jackson/core/io/NumberOutput;->MAX_INT_AS_LONG:J

    cmp-long v2, p0, v2

    if-lez v2, :cond_4

    add-int/lit8 v1, v1, -0x3

    .line 127
    sget-wide v2, Lcom/fasterxml/jackson/core/io/NumberOutput;->THOUSAND_L:J

    div-long v4, p0, v2

    mul-long/2addr v2, v4

    sub-long/2addr p0, v2

    long-to-int p0, p0

    .line 128
    invoke-static {p0, p2, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->full3(I[CI)I

    move-wide p0, v4

    goto :goto_1

    :cond_4
    long-to-int p0, p0

    :goto_2
    const/16 p1, 0x3e8

    if-lt p0, p1, :cond_5

    add-int/lit8 v1, v1, -0x3

    .line 129
    div-int/lit16 p1, p0, 0x3e8

    mul-int/lit16 v2, p1, 0x3e8

    sub-int/2addr p0, v2

    .line 130
    invoke-static {p0, p2, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->full3(I[CI)I

    move p0, p1

    goto :goto_2

    .line 131
    :cond_5
    invoke-static {p0, p2, p3}, Lcom/fasterxml/jackson/core/io/NumberOutput;->leading3(I[CI)I

    return v0
.end method

.method public static toString(D)Ljava/lang/String;
    .locals 0

    .line 29
    invoke-static {p0, p1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static toString(I)Ljava/lang/String;
    .locals 3

    .line 1
    sget-object v0, Lcom/fasterxml/jackson/core/io/NumberOutput;->sSmallIntStrs:[Ljava/lang/String;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-ge p0, v1, :cond_1

    .line 5
    .line 6
    if-ltz p0, :cond_0

    .line 7
    .line 8
    aget-object p0, v0, p0

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    neg-int v0, p0

    .line 12
    add-int/lit8 v0, v0, -0x1

    .line 13
    .line 14
    sget-object v1, Lcom/fasterxml/jackson/core/io/NumberOutput;->sSmallIntStrs2:[Ljava/lang/String;

    .line 15
    .line 16
    array-length v2, v1

    .line 17
    if-ge v0, v2, :cond_1

    .line 18
    .line 19
    aget-object p0, v1, v0

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static toString(J)Ljava/lang/String;
    .locals 2

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p0, v0

    if-gtz v0, :cond_0

    const-wide/32 v0, -0x80000000

    cmp-long v0, p0, v0

    if-ltz v0, :cond_0

    long-to-int p0, p0

    .line 27
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/NumberOutput;->toString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 28
    :cond_0
    invoke-static {p0, p1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
