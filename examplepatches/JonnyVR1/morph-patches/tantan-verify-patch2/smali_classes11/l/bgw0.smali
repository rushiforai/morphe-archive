.class public final Ll/bgw0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:[C

.field public static final e:[C

.field public static final f:Lcom/google/android/gms/internal/ads/zzgaf;


# instance fields
.field public a:[B

.field public b:I

.field public c:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [C

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/bgw0;->d:[C

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    new-array v0, v0, [C

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    aput-char v1, v0, v2

    .line 16
    .line 17
    sput-object v0, Ll/bgw0;->e:[C

    .line 18
    .line 19
    sget-object v0, Ll/cow0;->a:Ljava/nio/charset/Charset;

    .line 20
    .line 21
    sget-object v1, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 22
    .line 23
    sget-object v2, Ll/cow0;->f:Ljava/nio/charset/Charset;

    .line 24
    .line 25
    sget-object v3, Ll/cow0;->d:Ljava/nio/charset/Charset;

    .line 26
    .line 27
    sget-object v4, Ll/cow0;->e:Ljava/nio/charset/Charset;

    .line 28
    .line 29
    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/gms/internal/ads/zzgaf;->zzr(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaf;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Ll/bgw0;->f:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 34
    .line 35
    return-void

    .line 36
    nop

    .line 37
    :array_0
    .array-data 2
        0xds
        0xas
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Ll/mpw0;->f:[B

    iput-object v0, p0, Ll/bgw0;->a:[B

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-array v0, p1, [B

    .line 5
    .line 6
    iput-object v0, p0, Ll/bgw0;->a:[B

    .line 7
    .line 8
    iput p1, p0, Ll/bgw0;->c:I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>([B)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bgw0;->a:[B

    array-length p1, p1

    iput p1, p0, Ll/bgw0;->c:I

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bgw0;->a:[B

    iput p2, p0, Ll/bgw0;->c:I

    return-void
.end method


# virtual methods
.method public final A()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    shl-int/lit8 v0, v0, 0x15

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    shl-int/lit8 v1, v1, 0xe

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    shl-int/lit8 v2, v2, 0x7

    .line 18
    .line 19
    or-int/2addr v0, v1

    .line 20
    or-int/2addr v0, v2

    .line 21
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    or-int/2addr p0, v0

    .line 26
    return p0
.end method

.method public final B()I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ll/bgw0;->b:I

    .line 8
    .line 9
    aget-byte p0, v0, v1

    .line 10
    .line 11
    and-int/lit16 p0, p0, 0xff

    .line 12
    .line 13
    return p0
.end method

.method public final C()I
    .locals 5

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ll/bgw0;->b:I

    .line 8
    .line 9
    aget-byte v3, v0, v1

    .line 10
    .line 11
    and-int/lit16 v3, v3, 0xff

    .line 12
    .line 13
    add-int/lit8 v4, v1, 0x2

    .line 14
    .line 15
    iput v4, p0, Ll/bgw0;->b:I

    .line 16
    .line 17
    aget-byte v0, v0, v2

    .line 18
    .line 19
    and-int/lit16 v0, v0, 0xff

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x4

    .line 22
    .line 23
    iput v1, p0, Ll/bgw0;->b:I

    .line 24
    .line 25
    shl-int/lit8 p0, v3, 0x8

    .line 26
    .line 27
    or-int/2addr p0, v0

    .line 28
    return p0
.end method

.method public final D()I
    .locals 5

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ll/bgw0;->b:I

    .line 8
    .line 9
    aget-byte v3, v0, v1

    .line 10
    .line 11
    and-int/lit16 v3, v3, 0xff

    .line 12
    .line 13
    add-int/lit8 v4, v1, 0x2

    .line 14
    .line 15
    iput v4, p0, Ll/bgw0;->b:I

    .line 16
    .line 17
    aget-byte v2, v0, v2

    .line 18
    .line 19
    and-int/lit16 v2, v2, 0xff

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x3

    .line 22
    .line 23
    iput v1, p0, Ll/bgw0;->b:I

    .line 24
    .line 25
    aget-byte p0, v0, v4

    .line 26
    .line 27
    and-int/lit16 p0, p0, 0xff

    .line 28
    .line 29
    shl-int/lit8 v0, v3, 0x10

    .line 30
    .line 31
    shl-int/lit8 v1, v2, 0x8

    .line 32
    .line 33
    or-int/2addr v0, v1

    .line 34
    or-int/2addr p0, v0

    .line 35
    return p0
.end method

.method public final E()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ltz p0, :cond_0

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const-string v0, "Top bit not zero: "

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final F()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ll/bgw0;->b:I

    .line 8
    .line 9
    aget-byte v3, v0, v1

    .line 10
    .line 11
    and-int/lit16 v3, v3, 0xff

    .line 12
    .line 13
    add-int/lit8 v1, v1, 0x2

    .line 14
    .line 15
    iput v1, p0, Ll/bgw0;->b:I

    .line 16
    .line 17
    aget-byte p0, v0, v2

    .line 18
    .line 19
    and-int/lit16 p0, p0, 0xff

    .line 20
    .line 21
    shl-int/lit8 v0, v3, 0x8

    .line 22
    .line 23
    or-int/2addr p0, v0

    .line 24
    return p0
.end method

.method public final G()J
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/bgw0;->a:[B

    .line 4
    .line 5
    iget v2, v0, Ll/bgw0;->b:I

    .line 6
    .line 7
    add-int/lit8 v3, v2, 0x1

    .line 8
    .line 9
    iput v3, v0, Ll/bgw0;->b:I

    .line 10
    .line 11
    aget-byte v4, v1, v2

    .line 12
    .line 13
    int-to-long v4, v4

    .line 14
    add-int/lit8 v6, v2, 0x2

    .line 15
    .line 16
    iput v6, v0, Ll/bgw0;->b:I

    .line 17
    .line 18
    aget-byte v3, v1, v3

    .line 19
    .line 20
    int-to-long v7, v3

    .line 21
    add-int/lit8 v3, v2, 0x3

    .line 22
    .line 23
    iput v3, v0, Ll/bgw0;->b:I

    .line 24
    .line 25
    aget-byte v6, v1, v6

    .line 26
    .line 27
    int-to-long v9, v6

    .line 28
    add-int/lit8 v6, v2, 0x4

    .line 29
    .line 30
    iput v6, v0, Ll/bgw0;->b:I

    .line 31
    .line 32
    aget-byte v3, v1, v3

    .line 33
    .line 34
    int-to-long v11, v3

    .line 35
    add-int/lit8 v3, v2, 0x5

    .line 36
    .line 37
    iput v3, v0, Ll/bgw0;->b:I

    .line 38
    .line 39
    aget-byte v6, v1, v6

    .line 40
    .line 41
    int-to-long v13, v6

    .line 42
    add-int/lit8 v6, v2, 0x6

    .line 43
    .line 44
    iput v6, v0, Ll/bgw0;->b:I

    .line 45
    .line 46
    aget-byte v3, v1, v3

    .line 47
    .line 48
    move-object v15, v1

    .line 49
    move/from16 v16, v2

    .line 50
    .line 51
    int-to-long v1, v3

    .line 52
    add-int/lit8 v3, v16, 0x7

    .line 53
    .line 54
    iput v3, v0, Ll/bgw0;->b:I

    .line 55
    .line 56
    aget-byte v6, v15, v6

    .line 57
    .line 58
    move-wide/from16 v17, v1

    .line 59
    .line 60
    int-to-long v1, v6

    .line 61
    const/16 v19, 0x8

    .line 62
    .line 63
    add-int/lit8 v6, v16, 0x8

    .line 64
    .line 65
    iput v6, v0, Ll/bgw0;->b:I

    .line 66
    .line 67
    aget-byte v0, v15, v3

    .line 68
    .line 69
    move-wide v15, v1

    .line 70
    int-to-long v0, v0

    .line 71
    const-wide/16 v2, 0xff

    .line 72
    .line 73
    and-long v6, v7, v2

    .line 74
    .line 75
    and-long v8, v9, v2

    .line 76
    .line 77
    and-long v10, v11, v2

    .line 78
    .line 79
    and-long v12, v13, v2

    .line 80
    .line 81
    and-long v17, v17, v2

    .line 82
    .line 83
    and-long v14, v15, v2

    .line 84
    .line 85
    and-long/2addr v0, v2

    .line 86
    and-long/2addr v2, v4

    .line 87
    shl-long v4, v6, v19

    .line 88
    .line 89
    or-long/2addr v2, v4

    .line 90
    const/16 v4, 0x10

    .line 91
    .line 92
    shl-long v4, v8, v4

    .line 93
    .line 94
    or-long/2addr v2, v4

    .line 95
    const/16 v4, 0x18

    .line 96
    .line 97
    shl-long v4, v10, v4

    .line 98
    .line 99
    or-long/2addr v2, v4

    .line 100
    const/16 v4, 0x20

    .line 101
    .line 102
    shl-long v4, v12, v4

    .line 103
    .line 104
    or-long/2addr v2, v4

    .line 105
    const/16 v4, 0x28

    .line 106
    .line 107
    shl-long v4, v17, v4

    .line 108
    .line 109
    or-long/2addr v2, v4

    .line 110
    const/16 v4, 0x30

    .line 111
    .line 112
    shl-long v4, v14, v4

    .line 113
    .line 114
    or-long/2addr v2, v4

    .line 115
    const/16 v4, 0x38

    .line 116
    .line 117
    shl-long/2addr v0, v4

    .line 118
    or-long/2addr v0, v2

    .line 119
    return-wide v0
.end method

.method public final H()J
    .locals 12

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ll/bgw0;->b:I

    .line 8
    .line 9
    aget-byte v3, v0, v1

    .line 10
    .line 11
    int-to-long v3, v3

    .line 12
    add-int/lit8 v5, v1, 0x2

    .line 13
    .line 14
    iput v5, p0, Ll/bgw0;->b:I

    .line 15
    .line 16
    aget-byte v2, v0, v2

    .line 17
    .line 18
    int-to-long v6, v2

    .line 19
    add-int/lit8 v2, v1, 0x3

    .line 20
    .line 21
    iput v2, p0, Ll/bgw0;->b:I

    .line 22
    .line 23
    aget-byte v5, v0, v5

    .line 24
    .line 25
    int-to-long v8, v5

    .line 26
    add-int/lit8 v1, v1, 0x4

    .line 27
    .line 28
    iput v1, p0, Ll/bgw0;->b:I

    .line 29
    .line 30
    aget-byte p0, v0, v2

    .line 31
    .line 32
    int-to-long v0, p0

    .line 33
    const-wide/16 v10, 0xff

    .line 34
    .line 35
    and-long v5, v6, v10

    .line 36
    .line 37
    and-long v7, v8, v10

    .line 38
    .line 39
    and-long/2addr v0, v10

    .line 40
    and-long v2, v3, v10

    .line 41
    .line 42
    const/16 p0, 0x8

    .line 43
    .line 44
    shl-long v4, v5, p0

    .line 45
    .line 46
    or-long/2addr v2, v4

    .line 47
    const/16 p0, 0x10

    .line 48
    .line 49
    shl-long v4, v7, p0

    .line 50
    .line 51
    or-long/2addr v2, v4

    .line 52
    const/16 p0, 0x18

    .line 53
    .line 54
    shl-long/2addr v0, p0

    .line 55
    or-long/2addr v0, v2

    .line 56
    return-wide v0
.end method

.method public final I()J
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/bgw0;->a:[B

    .line 4
    .line 5
    iget v2, v0, Ll/bgw0;->b:I

    .line 6
    .line 7
    add-int/lit8 v3, v2, 0x1

    .line 8
    .line 9
    iput v3, v0, Ll/bgw0;->b:I

    .line 10
    .line 11
    aget-byte v4, v1, v2

    .line 12
    .line 13
    int-to-long v4, v4

    .line 14
    add-int/lit8 v6, v2, 0x2

    .line 15
    .line 16
    iput v6, v0, Ll/bgw0;->b:I

    .line 17
    .line 18
    aget-byte v3, v1, v3

    .line 19
    .line 20
    int-to-long v7, v3

    .line 21
    add-int/lit8 v3, v2, 0x3

    .line 22
    .line 23
    iput v3, v0, Ll/bgw0;->b:I

    .line 24
    .line 25
    aget-byte v6, v1, v6

    .line 26
    .line 27
    int-to-long v9, v6

    .line 28
    add-int/lit8 v6, v2, 0x4

    .line 29
    .line 30
    iput v6, v0, Ll/bgw0;->b:I

    .line 31
    .line 32
    aget-byte v3, v1, v3

    .line 33
    .line 34
    int-to-long v11, v3

    .line 35
    add-int/lit8 v3, v2, 0x5

    .line 36
    .line 37
    iput v3, v0, Ll/bgw0;->b:I

    .line 38
    .line 39
    aget-byte v6, v1, v6

    .line 40
    .line 41
    int-to-long v13, v6

    .line 42
    add-int/lit8 v6, v2, 0x6

    .line 43
    .line 44
    iput v6, v0, Ll/bgw0;->b:I

    .line 45
    .line 46
    aget-byte v3, v1, v3

    .line 47
    .line 48
    move-object v15, v1

    .line 49
    move/from16 v16, v2

    .line 50
    .line 51
    int-to-long v1, v3

    .line 52
    add-int/lit8 v3, v16, 0x7

    .line 53
    .line 54
    iput v3, v0, Ll/bgw0;->b:I

    .line 55
    .line 56
    aget-byte v6, v15, v6

    .line 57
    .line 58
    move-wide/from16 v17, v1

    .line 59
    .line 60
    int-to-long v1, v6

    .line 61
    const/16 v19, 0x8

    .line 62
    .line 63
    add-int/lit8 v6, v16, 0x8

    .line 64
    .line 65
    iput v6, v0, Ll/bgw0;->b:I

    .line 66
    .line 67
    aget-byte v0, v15, v3

    .line 68
    .line 69
    move-wide v15, v1

    .line 70
    int-to-long v0, v0

    .line 71
    const-wide/16 v2, 0xff

    .line 72
    .line 73
    and-long/2addr v4, v2

    .line 74
    and-long v6, v7, v2

    .line 75
    .line 76
    and-long v8, v9, v2

    .line 77
    .line 78
    and-long v10, v11, v2

    .line 79
    .line 80
    and-long v12, v13, v2

    .line 81
    .line 82
    and-long v17, v17, v2

    .line 83
    .line 84
    and-long v14, v15, v2

    .line 85
    .line 86
    const/16 v16, 0x38

    .line 87
    .line 88
    shl-long v4, v4, v16

    .line 89
    .line 90
    const/16 v16, 0x30

    .line 91
    .line 92
    shl-long v6, v6, v16

    .line 93
    .line 94
    or-long/2addr v4, v6

    .line 95
    const/16 v6, 0x28

    .line 96
    .line 97
    shl-long v6, v8, v6

    .line 98
    .line 99
    or-long/2addr v4, v6

    .line 100
    const/16 v6, 0x20

    .line 101
    .line 102
    shl-long v6, v10, v6

    .line 103
    .line 104
    or-long/2addr v4, v6

    .line 105
    const/16 v6, 0x18

    .line 106
    .line 107
    shl-long v6, v12, v6

    .line 108
    .line 109
    or-long/2addr v4, v6

    .line 110
    const/16 v6, 0x10

    .line 111
    .line 112
    shl-long v6, v17, v6

    .line 113
    .line 114
    or-long/2addr v4, v6

    .line 115
    shl-long v6, v14, v19

    .line 116
    .line 117
    or-long/2addr v4, v6

    .line 118
    and-long/2addr v0, v2

    .line 119
    or-long/2addr v0, v4

    .line 120
    return-wide v0
.end method

.method public final J()J
    .locals 12

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ll/bgw0;->b:I

    .line 8
    .line 9
    aget-byte v3, v0, v1

    .line 10
    .line 11
    int-to-long v3, v3

    .line 12
    add-int/lit8 v5, v1, 0x2

    .line 13
    .line 14
    iput v5, p0, Ll/bgw0;->b:I

    .line 15
    .line 16
    aget-byte v2, v0, v2

    .line 17
    .line 18
    int-to-long v6, v2

    .line 19
    add-int/lit8 v2, v1, 0x3

    .line 20
    .line 21
    iput v2, p0, Ll/bgw0;->b:I

    .line 22
    .line 23
    aget-byte v5, v0, v5

    .line 24
    .line 25
    int-to-long v8, v5

    .line 26
    add-int/lit8 v1, v1, 0x4

    .line 27
    .line 28
    iput v1, p0, Ll/bgw0;->b:I

    .line 29
    .line 30
    aget-byte p0, v0, v2

    .line 31
    .line 32
    int-to-long v0, p0

    .line 33
    const-wide/16 v10, 0xff

    .line 34
    .line 35
    and-long v2, v3, v10

    .line 36
    .line 37
    and-long v4, v6, v10

    .line 38
    .line 39
    and-long v6, v8, v10

    .line 40
    .line 41
    const/16 p0, 0x18

    .line 42
    .line 43
    shl-long/2addr v2, p0

    .line 44
    const/16 p0, 0x10

    .line 45
    .line 46
    shl-long/2addr v4, p0

    .line 47
    or-long/2addr v2, v4

    .line 48
    const/16 p0, 0x8

    .line 49
    .line 50
    shl-long v4, v6, p0

    .line 51
    .line 52
    or-long/2addr v2, v4

    .line 53
    and-long/2addr v0, v10

    .line 54
    or-long/2addr v0, v2

    .line 55
    return-wide v0
.end method

.method public final K()J
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/bgw0;->I()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-ltz p0, :cond_0

    .line 10
    .line 11
    return-wide v0

    .line 12
    :cond_0
    const-string p0, "Top bit not zero: "

    .line 13
    .line 14
    invoke-static {p0, v0, v1}, Ll/qc2;->a(Ljava/lang/String;J)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    return-wide v0
.end method

.method public final L()J
    .locals 12

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    aget-byte v0, v0, v1

    .line 6
    .line 7
    int-to-long v0, v0

    .line 8
    const/4 v2, 0x7

    .line 9
    move v3, v2

    .line 10
    :goto_0
    const/4 v4, 0x0

    .line 11
    const/4 v5, 0x6

    .line 12
    const/4 v6, 0x1

    .line 13
    if-ltz v3, :cond_2

    .line 14
    .line 15
    shl-int v7, v6, v3

    .line 16
    .line 17
    int-to-long v8, v7

    .line 18
    and-long/2addr v8, v0

    .line 19
    const-wide/16 v10, 0x0

    .line 20
    .line 21
    cmp-long v8, v8, v10

    .line 22
    .line 23
    if-nez v8, :cond_1

    .line 24
    .line 25
    if-ge v3, v5, :cond_0

    .line 26
    .line 27
    add-int/lit8 v7, v7, -0x1

    .line 28
    .line 29
    int-to-long v7, v7

    .line 30
    and-long/2addr v0, v7

    .line 31
    rsub-int/lit8 v4, v3, 0x7

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    if-ne v3, v2, :cond_2

    .line 35
    .line 36
    move v4, v6

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    add-int/lit8 v3, v3, -0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    :goto_1
    if-eqz v4, :cond_5

    .line 42
    .line 43
    :goto_2
    if-ge v6, v4, :cond_4

    .line 44
    .line 45
    iget-object v2, p0, Ll/bgw0;->a:[B

    .line 46
    .line 47
    iget v3, p0, Ll/bgw0;->b:I

    .line 48
    .line 49
    add-int/2addr v3, v6

    .line 50
    aget-byte v2, v2, v3

    .line 51
    .line 52
    and-int/lit16 v3, v2, 0xc0

    .line 53
    .line 54
    const/16 v7, 0x80

    .line 55
    .line 56
    if-ne v3, v7, :cond_3

    .line 57
    .line 58
    shl-long/2addr v0, v5

    .line 59
    and-int/lit8 v2, v2, 0x3f

    .line 60
    .line 61
    int-to-long v2, v2

    .line 62
    or-long/2addr v0, v2

    .line 63
    add-int/lit8 v6, v6, 0x1

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_3
    new-instance p0, Ljava/lang/NumberFormatException;

    .line 67
    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v3, "Invalid UTF-8 sequence continuation byte: "

    .line 71
    .line 72
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-direct {p0, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    throw p0

    .line 86
    :cond_4
    iget v2, p0, Ll/bgw0;->b:I

    .line 87
    .line 88
    add-int/2addr v2, v4

    .line 89
    iput v2, p0, Ll/bgw0;->b:I

    .line 90
    .line 91
    return-wide v0

    .line 92
    :cond_5
    new-instance p0, Ljava/lang/NumberFormatException;

    .line 93
    .line 94
    new-instance v2, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v3, "Invalid UTF-8 sequence first byte: "

    .line 97
    .line 98
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-direct {p0, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    throw p0
.end method

.method public final M(C)Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget p1, p0, Ll/bgw0;->c:I

    .line 2
    .line 3
    iget v0, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    sub-int/2addr p1, v0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    :goto_0
    iget p1, p0, Ll/bgw0;->c:I

    .line 9
    .line 10
    if-ge v0, p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/bgw0;->a:[B

    .line 13
    .line 14
    aget-byte p1, p1, v0

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p1, p0, Ll/bgw0;->a:[B

    .line 22
    .line 23
    iget v1, p0, Ll/bgw0;->b:I

    .line 24
    .line 25
    sub-int v2, v0, v1

    .line 26
    .line 27
    invoke-static {p1, v1, v2}, Ll/mpw0;->a([BII)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput v0, p0, Ll/bgw0;->b:I

    .line 32
    .line 33
    iget v1, p0, Ll/bgw0;->c:I

    .line 34
    .line 35
    if-ge v0, v1, :cond_1

    .line 36
    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    iput v0, p0, Ll/bgw0;->b:I

    .line 40
    .line 41
    :cond_1
    return-object p1

    .line 42
    :cond_2
    const/4 p0, 0x0

    .line 43
    return-object p0
.end method

.method public final N(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 5
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/bgw0;->f:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzfzv;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "Unsupported charset: "

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/lev0;->e(ZLjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/bgw0;->c:I

    .line 21
    .line 22
    iget v1, p0, Ll/bgw0;->b:I

    .line 23
    .line 24
    sub-int/2addr v0, v1

    .line 25
    const/4 v1, 0x0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_0
    sget-object v0, Ll/cow0;->a:Ljava/nio/charset/Charset;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-nez v3, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/bgw0;->b()Ljava/nio/charset/Charset;

    .line 38
    .line 39
    .line 40
    :cond_1
    sget-object v3, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 41
    .line 42
    invoke-virtual {p1, v3}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    const/4 v4, 0x1

    .line 47
    if-nez v3, :cond_4

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    sget-object v0, Ll/cow0;->f:Ljava/nio/charset/Charset;

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    const/4 v4, 0x2

    .line 63
    if-nez v0, :cond_4

    .line 64
    .line 65
    sget-object v0, Ll/cow0;->e:Ljava/nio/charset/Charset;

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    sget-object v0, Ll/cow0;->d:Ljava/nio/charset/Charset;

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-object v1

    .line 94
    :cond_4
    :goto_0
    iget v0, p0, Ll/bgw0;->b:I

    .line 95
    .line 96
    :goto_1
    iget v1, p0, Ll/bgw0;->c:I

    .line 97
    .line 98
    add-int/lit8 v2, v4, -0x1

    .line 99
    .line 100
    sub-int v2, v1, v2

    .line 101
    .line 102
    if-ge v0, v2, :cond_a

    .line 103
    .line 104
    sget-object v1, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 105
    .line 106
    invoke-virtual {p1, v1}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-nez v1, :cond_5

    .line 111
    .line 112
    sget-object v1, Ll/cow0;->a:Ljava/nio/charset/Charset;

    .line 113
    .line 114
    invoke-virtual {p1, v1}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_6

    .line 119
    .line 120
    :cond_5
    iget-object v1, p0, Ll/bgw0;->a:[B

    .line 121
    .line 122
    aget-byte v1, v1, v0

    .line 123
    .line 124
    invoke-static {v1}, Ll/mpw0;->i(I)Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-nez v1, :cond_b

    .line 129
    .line 130
    :cond_6
    sget-object v1, Ll/cow0;->f:Ljava/nio/charset/Charset;

    .line 131
    .line 132
    invoke-virtual {p1, v1}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-nez v1, :cond_7

    .line 137
    .line 138
    sget-object v1, Ll/cow0;->d:Ljava/nio/charset/Charset;

    .line 139
    .line 140
    invoke-virtual {p1, v1}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-eqz v1, :cond_8

    .line 145
    .line 146
    :cond_7
    iget-object v1, p0, Ll/bgw0;->a:[B

    .line 147
    .line 148
    aget-byte v2, v1, v0

    .line 149
    .line 150
    if-nez v2, :cond_8

    .line 151
    .line 152
    add-int/lit8 v2, v0, 0x1

    .line 153
    .line 154
    aget-byte v1, v1, v2

    .line 155
    .line 156
    invoke-static {v1}, Ll/mpw0;->i(I)Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-nez v1, :cond_b

    .line 161
    .line 162
    :cond_8
    sget-object v1, Ll/cow0;->e:Ljava/nio/charset/Charset;

    .line 163
    .line 164
    invoke-virtual {p1, v1}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-eqz v1, :cond_9

    .line 169
    .line 170
    add-int/lit8 v1, v0, 0x1

    .line 171
    .line 172
    iget-object v2, p0, Ll/bgw0;->a:[B

    .line 173
    .line 174
    aget-byte v1, v2, v1

    .line 175
    .line 176
    if-nez v1, :cond_9

    .line 177
    .line 178
    aget-byte v1, v2, v0

    .line 179
    .line 180
    invoke-static {v1}, Ll/mpw0;->i(I)Z

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    if-eqz v1, :cond_9

    .line 185
    .line 186
    goto :goto_2

    .line 187
    :cond_9
    add-int/2addr v0, v4

    .line 188
    goto :goto_1

    .line 189
    :cond_a
    move v0, v1

    .line 190
    :cond_b
    :goto_2
    iget v1, p0, Ll/bgw0;->b:I

    .line 191
    .line 192
    sub-int/2addr v0, v1

    .line 193
    invoke-virtual {p0, v0, p1}, Ll/bgw0;->a(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    iget v1, p0, Ll/bgw0;->b:I

    .line 198
    .line 199
    iget v2, p0, Ll/bgw0;->c:I

    .line 200
    .line 201
    if-eq v1, v2, :cond_c

    .line 202
    .line 203
    sget-object v1, Ll/bgw0;->d:[C

    .line 204
    .line 205
    invoke-virtual {p0, p1, v1}, Ll/bgw0;->n(Ljava/nio/charset/Charset;[C)C

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    const/16 v2, 0xd

    .line 210
    .line 211
    if-ne v1, v2, :cond_c

    .line 212
    .line 213
    sget-object v1, Ll/bgw0;->e:[C

    .line 214
    .line 215
    invoke-virtual {p0, p1, v1}, Ll/bgw0;->n(Ljava/nio/charset/Charset;[C)C

    .line 216
    .line 217
    .line 218
    :cond_c
    return-object v0
.end method

.method public final O(I)Ljava/lang/String;
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget v0, p0, Ll/bgw0;->b:I

    .line 7
    .line 8
    add-int v1, v0, p1

    .line 9
    .line 10
    add-int/lit8 v1, v1, -0x1

    .line 11
    .line 12
    iget v2, p0, Ll/bgw0;->c:I

    .line 13
    .line 14
    if-ge v1, v2, :cond_1

    .line 15
    .line 16
    iget-object v2, p0, Ll/bgw0;->a:[B

    .line 17
    .line 18
    aget-byte v1, v2, v1

    .line 19
    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    add-int/lit8 v1, p1, -0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move v1, p1

    .line 26
    :goto_0
    iget-object v2, p0, Ll/bgw0;->a:[B

    .line 27
    .line 28
    invoke-static {v2, v0, v1}, Ll/mpw0;->a([BII)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget v1, p0, Ll/bgw0;->b:I

    .line 33
    .line 34
    add-int/2addr v1, p1

    .line 35
    iput v1, p0, Ll/bgw0;->b:I

    .line 36
    .line 37
    return-object v0
.end method

.method public final a(ILjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bgw0;->a:[B

    .line 4
    .line 5
    iget v2, p0, Ll/bgw0;->b:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, p1, p2}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 8
    .line 9
    .line 10
    add-int/2addr v2, p1

    .line 11
    iput v2, p0, Ll/bgw0;->b:I

    .line 12
    .line 13
    return-object v0
.end method

.method public final b()Ljava/nio/charset/Charset;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget v0, p0, Ll/bgw0;->c:I

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    const/4 v2, 0x3

    .line 7
    if-lt v0, v2, :cond_1

    .line 8
    .line 9
    iget-object v3, p0, Ll/bgw0;->a:[B

    .line 10
    .line 11
    aget-byte v4, v3, v1

    .line 12
    .line 13
    const/16 v5, -0x11

    .line 14
    .line 15
    if-ne v4, v5, :cond_1

    .line 16
    .line 17
    add-int/lit8 v4, v1, 0x1

    .line 18
    .line 19
    aget-byte v4, v3, v4

    .line 20
    .line 21
    const/16 v5, -0x45

    .line 22
    .line 23
    if-ne v4, v5, :cond_1

    .line 24
    .line 25
    add-int/lit8 v4, v1, 0x2

    .line 26
    .line 27
    aget-byte v3, v3, v4

    .line 28
    .line 29
    const/16 v4, -0x41

    .line 30
    .line 31
    if-eq v3, v4, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    add-int/2addr v1, v2

    .line 35
    iput v1, p0, Ll/bgw0;->b:I

    .line 36
    .line 37
    sget-object p0, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_1
    :goto_0
    const/4 v2, 0x2

    .line 41
    if-lt v0, v2, :cond_3

    .line 42
    .line 43
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 44
    .line 45
    aget-byte v3, v0, v1

    .line 46
    .line 47
    const/4 v4, -0x1

    .line 48
    const/4 v5, -0x2

    .line 49
    if-ne v3, v5, :cond_2

    .line 50
    .line 51
    add-int/lit8 v3, v1, 0x1

    .line 52
    .line 53
    aget-byte v0, v0, v3

    .line 54
    .line 55
    if-ne v0, v4, :cond_3

    .line 56
    .line 57
    add-int/2addr v1, v2

    .line 58
    iput v1, p0, Ll/bgw0;->b:I

    .line 59
    .line 60
    sget-object p0, Ll/cow0;->d:Ljava/nio/charset/Charset;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_2
    if-ne v3, v4, :cond_3

    .line 64
    .line 65
    add-int/lit8 v3, v1, 0x1

    .line 66
    .line 67
    aget-byte v0, v0, v3

    .line 68
    .line 69
    if-ne v0, v5, :cond_3

    .line 70
    .line 71
    add-int/2addr v1, v2

    .line 72
    iput v1, p0, Ll/bgw0;->b:I

    .line 73
    .line 74
    sget-object p0, Ll/cow0;->e:Ljava/nio/charset/Charset;

    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_3
    const/4 p0, 0x0

    .line 78
    return-object p0
.end method

.method public final c()S
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ll/bgw0;->b:I

    .line 8
    .line 9
    aget-byte v3, v0, v1

    .line 10
    .line 11
    and-int/lit16 v3, v3, 0xff

    .line 12
    .line 13
    add-int/lit8 v1, v1, 0x2

    .line 14
    .line 15
    iput v1, p0, Ll/bgw0;->b:I

    .line 16
    .line 17
    aget-byte p0, v0, v2

    .line 18
    .line 19
    and-int/lit16 p0, p0, 0xff

    .line 20
    .line 21
    shl-int/lit8 p0, p0, 0x8

    .line 22
    .line 23
    or-int/2addr p0, v3

    .line 24
    int-to-short p0, p0

    .line 25
    return p0
.end method

.method public final d()S
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ll/bgw0;->b:I

    .line 8
    .line 9
    aget-byte v3, v0, v1

    .line 10
    .line 11
    and-int/lit16 v3, v3, 0xff

    .line 12
    .line 13
    add-int/lit8 v1, v1, 0x2

    .line 14
    .line 15
    iput v1, p0, Ll/bgw0;->b:I

    .line 16
    .line 17
    aget-byte p0, v0, v2

    .line 18
    .line 19
    and-int/lit16 p0, p0, 0xff

    .line 20
    .line 21
    shl-int/lit8 v0, v3, 0x8

    .line 22
    .line 23
    or-int/2addr p0, v0

    .line 24
    int-to-short p0, p0

    .line 25
    return p0
.end method

.method public final e(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-le p1, v1, :cond_0

    .line 5
    .line 6
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/bgw0;->a:[B

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final f(Ll/dfw0;I)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/dfw0;->a:[B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1, p2}, Ll/bgw0;->g([BII)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, v1}, Ll/dfw0;->k(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final g([BII)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 6
    .line 7
    .line 8
    iget p1, p0, Ll/bgw0;->b:I

    .line 9
    .line 10
    add-int/2addr p1, p3

    .line 11
    iput p1, p0, Ll/bgw0;->b:I

    .line 12
    .line 13
    return-void
.end method

.method public final h(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-ge v1, p1, :cond_0

    .line 5
    .line 6
    new-array v0, p1, [B

    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0, v0, p1}, Ll/bgw0;->i([BI)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final i([BI)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iput p2, p0, Ll/bgw0;->c:I

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput p1, p0, Ll/bgw0;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public final j(I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p1, :cond_0

    .line 3
    .line 4
    iget-object v1, p0, Ll/bgw0;->a:[B

    .line 5
    .line 6
    array-length v1, v1

    .line 7
    if-gt p1, v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    :cond_0
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 11
    .line 12
    .line 13
    iput p1, p0, Ll/bgw0;->c:I

    .line 14
    .line 15
    return-void
.end method

.method public final k(I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p1, :cond_0

    .line 3
    .line 4
    iget v1, p0, Ll/bgw0;->c:I

    .line 5
    .line 6
    if-gt p1, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    :cond_0
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 10
    .line 11
    .line 12
    iput p1, p0, Ll/bgw0;->b:I

    .line 13
    .line 14
    return-void
.end method

.method public final l(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/bgw0;->b:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    invoke-virtual {p0, v0}, Ll/bgw0;->k(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final m()[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public final n(Ljava/nio/charset/Charset;[C)C
    .locals 6

    .line 1
    invoke-virtual {p0, p1}, Ll/bgw0;->o(Ljava/nio/charset/Charset;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    shr-int/lit8 v1, p1, 0x10

    .line 9
    .line 10
    array-length v2, p2

    .line 11
    move v3, v0

    .line 12
    :goto_0
    if-ge v3, v2, :cond_1

    .line 13
    .line 14
    int-to-char v4, v1

    .line 15
    aget-char v5, p2, v3

    .line 16
    .line 17
    if-ne v5, v4, :cond_0

    .line 18
    .line 19
    iget p2, p0, Ll/bgw0;->b:I

    .line 20
    .line 21
    int-to-char p1, p1

    .line 22
    add-int/2addr p2, p1

    .line 23
    iput p2, p0, Ll/bgw0;->b:I

    .line 24
    .line 25
    return v4

    .line 26
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return v0
.end method

.method public final o(Ljava/nio/charset/Charset;)I
    .locals 4

    .line 1
    sget-object v0, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Ll/cow0;->a:Ljava/nio/charset/Charset;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    :cond_0
    iget v0, p0, Ll/bgw0;->c:I

    .line 19
    .line 20
    iget v2, p0, Ll/bgw0;->b:I

    .line 21
    .line 22
    sub-int/2addr v0, v2

    .line 23
    if-lez v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/bgw0;->a:[B

    .line 26
    .line 27
    aget-byte p0, p0, v2

    .line 28
    .line 29
    and-int/lit16 p0, p0, 0xff

    .line 30
    .line 31
    int-to-long p0, p0

    .line 32
    invoke-static {p0, p1}, Ll/ttw0;->a(J)C

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    int-to-byte p0, p0

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    sget-object v0, Ll/cow0;->f:Ljava/nio/charset/Charset;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v2, 0x2

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    sget-object v0, Ll/cow0;->d:Ljava/nio/charset/Charset;

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    :cond_2
    iget v0, p0, Ll/bgw0;->c:I

    .line 56
    .line 57
    iget v3, p0, Ll/bgw0;->b:I

    .line 58
    .line 59
    sub-int/2addr v0, v3

    .line 60
    if-lt v0, v2, :cond_3

    .line 61
    .line 62
    iget-object p0, p0, Ll/bgw0;->a:[B

    .line 63
    .line 64
    aget-byte p1, p0, v3

    .line 65
    .line 66
    add-int/2addr v3, v1

    .line 67
    aget-byte p0, p0, v3

    .line 68
    .line 69
    invoke-static {p1, p0}, Ll/ttw0;->b(BB)C

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    :goto_0
    int-to-byte p0, p0

    .line 74
    move v1, v2

    .line 75
    goto :goto_1

    .line 76
    :cond_3
    sget-object v0, Ll/cow0;->e:Ljava/nio/charset/Charset;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_4

    .line 83
    .line 84
    iget p1, p0, Ll/bgw0;->c:I

    .line 85
    .line 86
    iget v0, p0, Ll/bgw0;->b:I

    .line 87
    .line 88
    sub-int/2addr p1, v0

    .line 89
    if-lt p1, v2, :cond_4

    .line 90
    .line 91
    iget-object p0, p0, Ll/bgw0;->a:[B

    .line 92
    .line 93
    add-int/lit8 p1, v0, 0x1

    .line 94
    .line 95
    aget-byte p1, p0, p1

    .line 96
    .line 97
    aget-byte p0, p0, v0

    .line 98
    .line 99
    invoke-static {p1, p0}, Ll/ttw0;->b(BB)C

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    goto :goto_0

    .line 104
    :goto_1
    int-to-long p0, p0

    .line 105
    invoke-static {p0, p1}, Ll/ttw0;->a(J)C

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    shl-int/lit8 p0, p0, 0x10

    .line 110
    .line 111
    add-int/2addr p0, v1

    .line 112
    return p0

    .line 113
    :cond_4
    const/4 p0, 0x0

    .line 114
    return p0
.end method

.method public final p(Ljava/nio/charset/Charset;)C
    .locals 3

    .line 1
    sget-object v0, Ll/bgw0;->f:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ads/zzfzv;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "Unsupported charset: "

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/lev0;->e(ZLjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/bgw0;->o(Ljava/nio/charset/Charset;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    shr-int/lit8 p0, p0, 0x10

    .line 25
    .line 26
    int-to-char p0, p0

    .line 27
    return p0
.end method

.method public final q()I
    .locals 1

    .line 1
    iget v0, p0, Ll/bgw0;->c:I

    .line 2
    .line 3
    iget p0, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public final r()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public final s()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bgw0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final t()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bgw0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public final u()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget p0, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    aget-byte p0, v0, p0

    .line 6
    .line 7
    and-int/lit16 p0, p0, 0xff

    .line 8
    .line 9
    return p0
.end method

.method public final v()I
    .locals 6

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ll/bgw0;->b:I

    .line 8
    .line 9
    aget-byte v3, v0, v1

    .line 10
    .line 11
    and-int/lit16 v3, v3, 0xff

    .line 12
    .line 13
    add-int/lit8 v4, v1, 0x2

    .line 14
    .line 15
    iput v4, p0, Ll/bgw0;->b:I

    .line 16
    .line 17
    aget-byte v2, v0, v2

    .line 18
    .line 19
    and-int/lit16 v2, v2, 0xff

    .line 20
    .line 21
    add-int/lit8 v5, v1, 0x3

    .line 22
    .line 23
    iput v5, p0, Ll/bgw0;->b:I

    .line 24
    .line 25
    aget-byte v4, v0, v4

    .line 26
    .line 27
    and-int/lit16 v4, v4, 0xff

    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x4

    .line 30
    .line 31
    iput v1, p0, Ll/bgw0;->b:I

    .line 32
    .line 33
    aget-byte p0, v0, v5

    .line 34
    .line 35
    and-int/lit16 p0, p0, 0xff

    .line 36
    .line 37
    shl-int/lit8 v0, v3, 0x18

    .line 38
    .line 39
    shl-int/lit8 v1, v2, 0x10

    .line 40
    .line 41
    or-int/2addr v0, v1

    .line 42
    shl-int/lit8 v1, v4, 0x8

    .line 43
    .line 44
    or-int/2addr v0, v1

    .line 45
    or-int/2addr p0, v0

    .line 46
    return p0
.end method

.method public final w()I
    .locals 5

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ll/bgw0;->b:I

    .line 8
    .line 9
    aget-byte v3, v0, v1

    .line 10
    .line 11
    and-int/lit16 v3, v3, 0xff

    .line 12
    .line 13
    add-int/lit8 v4, v1, 0x2

    .line 14
    .line 15
    iput v4, p0, Ll/bgw0;->b:I

    .line 16
    .line 17
    aget-byte v2, v0, v2

    .line 18
    .line 19
    and-int/lit16 v2, v2, 0xff

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x3

    .line 22
    .line 23
    iput v1, p0, Ll/bgw0;->b:I

    .line 24
    .line 25
    aget-byte p0, v0, v4

    .line 26
    .line 27
    and-int/lit16 p0, p0, 0xff

    .line 28
    .line 29
    shl-int/lit8 v0, v3, 0x18

    .line 30
    .line 31
    shr-int/lit8 v0, v0, 0x8

    .line 32
    .line 33
    shl-int/lit8 v1, v2, 0x8

    .line 34
    .line 35
    or-int/2addr v0, v1

    .line 36
    or-int/2addr p0, v0

    .line 37
    return p0
.end method

.method public final x()I
    .locals 6

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ll/bgw0;->b:I

    .line 8
    .line 9
    aget-byte v3, v0, v1

    .line 10
    .line 11
    and-int/lit16 v3, v3, 0xff

    .line 12
    .line 13
    add-int/lit8 v4, v1, 0x2

    .line 14
    .line 15
    iput v4, p0, Ll/bgw0;->b:I

    .line 16
    .line 17
    aget-byte v2, v0, v2

    .line 18
    .line 19
    and-int/lit16 v2, v2, 0xff

    .line 20
    .line 21
    add-int/lit8 v5, v1, 0x3

    .line 22
    .line 23
    iput v5, p0, Ll/bgw0;->b:I

    .line 24
    .line 25
    aget-byte v4, v0, v4

    .line 26
    .line 27
    and-int/lit16 v4, v4, 0xff

    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x4

    .line 30
    .line 31
    iput v1, p0, Ll/bgw0;->b:I

    .line 32
    .line 33
    aget-byte p0, v0, v5

    .line 34
    .line 35
    and-int/lit16 p0, p0, 0xff

    .line 36
    .line 37
    shl-int/lit8 v0, v2, 0x8

    .line 38
    .line 39
    or-int/2addr v0, v3

    .line 40
    shl-int/lit8 v1, v4, 0x10

    .line 41
    .line 42
    or-int/2addr v0, v1

    .line 43
    shl-int/lit8 p0, p0, 0x18

    .line 44
    .line 45
    or-int/2addr p0, v0

    .line 46
    return p0
.end method

.method public final y()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bgw0;->x()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ltz p0, :cond_0

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const-string v0, "Top bit not zero: "

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final z()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bgw0;->a:[B

    .line 2
    .line 3
    iget v1, p0, Ll/bgw0;->b:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ll/bgw0;->b:I

    .line 8
    .line 9
    aget-byte v3, v0, v1

    .line 10
    .line 11
    and-int/lit16 v3, v3, 0xff

    .line 12
    .line 13
    add-int/lit8 v1, v1, 0x2

    .line 14
    .line 15
    iput v1, p0, Ll/bgw0;->b:I

    .line 16
    .line 17
    aget-byte p0, v0, v2

    .line 18
    .line 19
    and-int/lit16 p0, p0, 0xff

    .line 20
    .line 21
    shl-int/lit8 p0, p0, 0x8

    .line 22
    .line 23
    or-int/2addr p0, v3

    .line 24
    return p0
.end method
