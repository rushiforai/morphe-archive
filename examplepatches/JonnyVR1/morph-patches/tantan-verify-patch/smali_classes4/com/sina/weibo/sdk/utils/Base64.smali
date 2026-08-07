.class public final Lcom/sina/weibo/sdk/utils/Base64;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static alphabet:[C

.field private static codes:[B


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/sina/weibo/sdk/utils/Base64;->alphabet:[C

    .line 8
    .line 9
    const/16 v0, 0x100

    .line 10
    .line 11
    new-array v1, v0, [B

    .line 12
    .line 13
    sput-object v1, Lcom/sina/weibo/sdk/utils/Base64;->codes:[B

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_0
    if-ge v1, v0, :cond_0

    .line 17
    .line 18
    sget-object v2, Lcom/sina/weibo/sdk/utils/Base64;->codes:[B

    .line 19
    .line 20
    const/4 v3, -0x1

    .line 21
    aput-byte v3, v2, v1

    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/16 v0, 0x41

    .line 27
    .line 28
    :goto_1
    const/16 v1, 0x5a

    .line 29
    .line 30
    if-gt v0, v1, :cond_1

    .line 31
    .line 32
    sget-object v1, Lcom/sina/weibo/sdk/utils/Base64;->codes:[B

    .line 33
    .line 34
    add-int/lit8 v2, v0, -0x41

    .line 35
    .line 36
    int-to-byte v2, v2

    .line 37
    aput-byte v2, v1, v0

    .line 38
    .line 39
    add-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const/16 v0, 0x61

    .line 43
    .line 44
    :goto_2
    const/16 v1, 0x7a

    .line 45
    .line 46
    if-gt v0, v1, :cond_2

    .line 47
    .line 48
    sget-object v1, Lcom/sina/weibo/sdk/utils/Base64;->codes:[B

    .line 49
    .line 50
    add-int/lit8 v2, v0, -0x47

    .line 51
    .line 52
    int-to-byte v2, v2

    .line 53
    aput-byte v2, v1, v0

    .line 54
    .line 55
    add-int/lit8 v0, v0, 0x1

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_2
    const/16 v0, 0x30

    .line 59
    .line 60
    :goto_3
    const/16 v1, 0x39

    .line 61
    .line 62
    if-gt v0, v1, :cond_3

    .line 63
    .line 64
    sget-object v1, Lcom/sina/weibo/sdk/utils/Base64;->codes:[B

    .line 65
    .line 66
    add-int/lit8 v2, v0, 0x4

    .line 67
    .line 68
    int-to-byte v2, v2

    .line 69
    aput-byte v2, v1, v0

    .line 70
    .line 71
    add-int/lit8 v0, v0, 0x1

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_3
    sget-object v0, Lcom/sina/weibo/sdk/utils/Base64;->codes:[B

    .line 75
    .line 76
    const/16 v1, 0x2b

    .line 77
    .line 78
    const/16 v2, 0x3e

    .line 79
    .line 80
    aput-byte v2, v0, v1

    .line 81
    .line 82
    const/16 v1, 0x2f

    .line 83
    .line 84
    const/16 v2, 0x3f

    .line 85
    .line 86
    aput-byte v2, v0, v1

    .line 87
    .line 88
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

.method public static decode([B)[B
    .locals 8

    .line 1
    array-length v0, p0

    .line 2
    add-int/lit8 v0, v0, 0x3

    .line 3
    .line 4
    div-int/lit8 v0, v0, 0x4

    .line 5
    .line 6
    mul-int/lit8 v0, v0, 0x3

    .line 7
    .line 8
    array-length v1, p0

    .line 9
    const/16 v2, 0x3d

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    if-lez v1, :cond_0

    .line 13
    .line 14
    array-length v1, p0

    .line 15
    sub-int/2addr v1, v3

    .line 16
    aget-byte v1, p0, v1

    .line 17
    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    add-int/lit8 v0, v0, -0x1

    .line 21
    .line 22
    :cond_0
    array-length v1, p0

    .line 23
    if-le v1, v3, :cond_1

    .line 24
    .line 25
    array-length v1, p0

    .line 26
    add-int/lit8 v1, v1, -0x2

    .line 27
    .line 28
    aget-byte v1, p0, v1

    .line 29
    .line 30
    if-ne v1, v2, :cond_1

    .line 31
    .line 32
    add-int/lit8 v0, v0, -0x1

    .line 33
    .line 34
    :cond_1
    new-array v1, v0, [B

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    move v3, v2

    .line 38
    move v4, v3

    .line 39
    move v5, v4

    .line 40
    :goto_0
    array-length v6, p0

    .line 41
    if-ge v2, v6, :cond_4

    .line 42
    .line 43
    sget-object v6, Lcom/sina/weibo/sdk/utils/Base64;->codes:[B

    .line 44
    .line 45
    aget-byte v7, p0, v2

    .line 46
    .line 47
    and-int/lit16 v7, v7, 0xff

    .line 48
    .line 49
    aget-byte v6, v6, v7

    .line 50
    .line 51
    if-ltz v6, :cond_3

    .line 52
    .line 53
    shl-int/lit8 v4, v4, 0x6

    .line 54
    .line 55
    add-int/lit8 v7, v5, 0x6

    .line 56
    .line 57
    or-int/2addr v4, v6

    .line 58
    const/16 v6, 0x8

    .line 59
    .line 60
    if-lt v7, v6, :cond_2

    .line 61
    .line 62
    add-int/lit8 v5, v5, -0x2

    .line 63
    .line 64
    add-int/lit8 v6, v3, 0x1

    .line 65
    .line 66
    shr-int v7, v4, v5

    .line 67
    .line 68
    and-int/lit16 v7, v7, 0xff

    .line 69
    .line 70
    int-to-byte v7, v7

    .line 71
    aput-byte v7, v1, v3

    .line 72
    .line 73
    move v3, v6

    .line 74
    goto :goto_1

    .line 75
    :cond_2
    move v5, v7

    .line 76
    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_4
    if-ne v3, v0, :cond_5

    .line 80
    .line 81
    return-object v1

    .line 82
    :cond_5
    const-string p0, "miscalculated data length!"

    .line 83
    .line 84
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    const/4 p0, 0x0

    .line 88
    return-object p0
.end method

.method public static encode([B)[C
    .locals 10

    .line 1
    array-length v0, p0

    .line 2
    add-int/lit8 v0, v0, 0x2

    .line 3
    .line 4
    div-int/lit8 v0, v0, 0x3

    .line 5
    .line 6
    mul-int/lit8 v0, v0, 0x4

    .line 7
    .line 8
    new-array v0, v0, [C

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    move v2, v1

    .line 12
    move v3, v2

    .line 13
    :goto_0
    array-length v4, p0

    .line 14
    if-ge v2, v4, :cond_4

    .line 15
    .line 16
    aget-byte v4, p0, v2

    .line 17
    .line 18
    and-int/lit16 v4, v4, 0xff

    .line 19
    .line 20
    shl-int/lit8 v4, v4, 0x8

    .line 21
    .line 22
    add-int/lit8 v5, v2, 0x1

    .line 23
    .line 24
    array-length v6, p0

    .line 25
    const/4 v7, 0x1

    .line 26
    if-ge v5, v6, :cond_0

    .line 27
    .line 28
    aget-byte v5, p0, v5

    .line 29
    .line 30
    and-int/lit16 v5, v5, 0xff

    .line 31
    .line 32
    or-int/2addr v4, v5

    .line 33
    move v5, v7

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    move v5, v1

    .line 36
    :goto_1
    shl-int/lit8 v4, v4, 0x8

    .line 37
    .line 38
    add-int/lit8 v6, v2, 0x2

    .line 39
    .line 40
    array-length v8, p0

    .line 41
    if-ge v6, v8, :cond_1

    .line 42
    .line 43
    aget-byte v6, p0, v6

    .line 44
    .line 45
    and-int/lit16 v6, v6, 0xff

    .line 46
    .line 47
    or-int/2addr v4, v6

    .line 48
    goto :goto_2

    .line 49
    :cond_1
    move v7, v1

    .line 50
    :goto_2
    add-int/lit8 v6, v3, 0x3

    .line 51
    .line 52
    sget-object v8, Lcom/sina/weibo/sdk/utils/Base64;->alphabet:[C

    .line 53
    .line 54
    const/16 v9, 0x40

    .line 55
    .line 56
    if-eqz v7, :cond_2

    .line 57
    .line 58
    and-int/lit8 v7, v4, 0x3f

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_2
    move v7, v9

    .line 62
    :goto_3
    aget-char v7, v8, v7

    .line 63
    .line 64
    aput-char v7, v0, v6

    .line 65
    .line 66
    shr-int/lit8 v6, v4, 0x6

    .line 67
    .line 68
    add-int/lit8 v7, v3, 0x2

    .line 69
    .line 70
    if-eqz v5, :cond_3

    .line 71
    .line 72
    and-int/lit8 v9, v6, 0x3f

    .line 73
    .line 74
    :cond_3
    aget-char v5, v8, v9

    .line 75
    .line 76
    aput-char v5, v0, v7

    .line 77
    .line 78
    shr-int/lit8 v5, v4, 0xc

    .line 79
    .line 80
    add-int/lit8 v6, v3, 0x1

    .line 81
    .line 82
    and-int/lit8 v5, v5, 0x3f

    .line 83
    .line 84
    aget-char v5, v8, v5

    .line 85
    .line 86
    aput-char v5, v0, v6

    .line 87
    .line 88
    shr-int/lit8 v4, v4, 0x12

    .line 89
    .line 90
    and-int/lit8 v4, v4, 0x3f

    .line 91
    .line 92
    aget-char v4, v8, v4

    .line 93
    .line 94
    aput-char v4, v0, v3

    .line 95
    .line 96
    add-int/lit8 v2, v2, 0x3

    .line 97
    .line 98
    add-int/lit8 v3, v3, 0x4

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_4
    return-object v0
.end method

.method public static encodebyte([B)[B
    .locals 10

    .line 1
    array-length v0, p0

    .line 2
    add-int/lit8 v0, v0, 0x2

    .line 3
    .line 4
    div-int/lit8 v0, v0, 0x3

    .line 5
    .line 6
    mul-int/lit8 v0, v0, 0x4

    .line 7
    .line 8
    new-array v0, v0, [B

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    move v2, v1

    .line 12
    move v3, v2

    .line 13
    :goto_0
    array-length v4, p0

    .line 14
    if-ge v2, v4, :cond_4

    .line 15
    .line 16
    aget-byte v4, p0, v2

    .line 17
    .line 18
    and-int/lit16 v4, v4, 0xff

    .line 19
    .line 20
    shl-int/lit8 v4, v4, 0x8

    .line 21
    .line 22
    add-int/lit8 v5, v2, 0x1

    .line 23
    .line 24
    array-length v6, p0

    .line 25
    const/4 v7, 0x1

    .line 26
    if-ge v5, v6, :cond_0

    .line 27
    .line 28
    aget-byte v5, p0, v5

    .line 29
    .line 30
    and-int/lit16 v5, v5, 0xff

    .line 31
    .line 32
    or-int/2addr v4, v5

    .line 33
    move v5, v7

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    move v5, v1

    .line 36
    :goto_1
    shl-int/lit8 v4, v4, 0x8

    .line 37
    .line 38
    add-int/lit8 v6, v2, 0x2

    .line 39
    .line 40
    array-length v8, p0

    .line 41
    if-ge v6, v8, :cond_1

    .line 42
    .line 43
    aget-byte v6, p0, v6

    .line 44
    .line 45
    and-int/lit16 v6, v6, 0xff

    .line 46
    .line 47
    or-int/2addr v4, v6

    .line 48
    goto :goto_2

    .line 49
    :cond_1
    move v7, v1

    .line 50
    :goto_2
    add-int/lit8 v6, v3, 0x3

    .line 51
    .line 52
    sget-object v8, Lcom/sina/weibo/sdk/utils/Base64;->alphabet:[C

    .line 53
    .line 54
    const/16 v9, 0x40

    .line 55
    .line 56
    if-eqz v7, :cond_2

    .line 57
    .line 58
    and-int/lit8 v7, v4, 0x3f

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_2
    move v7, v9

    .line 62
    :goto_3
    aget-char v7, v8, v7

    .line 63
    .line 64
    int-to-byte v7, v7

    .line 65
    aput-byte v7, v0, v6

    .line 66
    .line 67
    shr-int/lit8 v6, v4, 0x6

    .line 68
    .line 69
    add-int/lit8 v7, v3, 0x2

    .line 70
    .line 71
    if-eqz v5, :cond_3

    .line 72
    .line 73
    and-int/lit8 v9, v6, 0x3f

    .line 74
    .line 75
    :cond_3
    aget-char v5, v8, v9

    .line 76
    .line 77
    int-to-byte v5, v5

    .line 78
    aput-byte v5, v0, v7

    .line 79
    .line 80
    shr-int/lit8 v5, v4, 0xc

    .line 81
    .line 82
    add-int/lit8 v6, v3, 0x1

    .line 83
    .line 84
    and-int/lit8 v5, v5, 0x3f

    .line 85
    .line 86
    aget-char v5, v8, v5

    .line 87
    .line 88
    int-to-byte v5, v5

    .line 89
    aput-byte v5, v0, v6

    .line 90
    .line 91
    shr-int/lit8 v4, v4, 0x12

    .line 92
    .line 93
    and-int/lit8 v4, v4, 0x3f

    .line 94
    .line 95
    aget-char v4, v8, v4

    .line 96
    .line 97
    int-to-byte v4, v4

    .line 98
    aput-byte v4, v0, v3

    .line 99
    .line 100
    add-int/lit8 v2, v2, 0x3

    .line 101
    .line 102
    add-int/lit8 v3, v3, 0x4

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_4
    return-object v0
.end method
