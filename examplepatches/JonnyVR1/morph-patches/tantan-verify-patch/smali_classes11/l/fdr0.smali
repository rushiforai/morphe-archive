.class public final Ll/fdr0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[I

.field public static final b:[I

.field public static final c:[I

.field public static final d:[I

.field public static final e:[I

.field public static final f:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/4 v0, 0x3

    .line 2
    const/4 v1, 0x6

    .line 3
    const/4 v2, 0x1

    .line 4
    const/4 v3, 0x2

    .line 5
    filled-new-array {v2, v3, v0, v1}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/fdr0;->a:[I

    .line 10
    .line 11
    const v0, 0xac44

    .line 12
    .line 13
    .line 14
    const/16 v1, 0x7d00

    .line 15
    .line 16
    const v2, 0xbb80

    .line 17
    .line 18
    .line 19
    filled-new-array {v2, v0, v1}, [I

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/fdr0;->b:[I

    .line 24
    .line 25
    const/16 v0, 0x5622

    .line 26
    .line 27
    const/16 v1, 0x3e80

    .line 28
    .line 29
    const/16 v2, 0x5dc0

    .line 30
    .line 31
    filled-new-array {v2, v0, v1}, [I

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Ll/fdr0;->c:[I

    .line 36
    .line 37
    const/16 v0, 0x8

    .line 38
    .line 39
    new-array v0, v0, [I

    .line 40
    .line 41
    fill-array-data v0, :array_0

    .line 42
    .line 43
    .line 44
    sput-object v0, Ll/fdr0;->d:[I

    .line 45
    .line 46
    const/16 v0, 0x13

    .line 47
    .line 48
    new-array v1, v0, [I

    .line 49
    .line 50
    fill-array-data v1, :array_1

    .line 51
    .line 52
    .line 53
    sput-object v1, Ll/fdr0;->e:[I

    .line 54
    .line 55
    new-array v0, v0, [I

    .line 56
    .line 57
    fill-array-data v0, :array_2

    .line 58
    .line 59
    .line 60
    sput-object v0, Ll/fdr0;->f:[I

    .line 61
    .line 62
    return-void

    .line 63
    :array_0
    .array-data 4
        0x2
        0x1
        0x2
        0x3
        0x3
        0x4
        0x4
        0x5
    .end array-data

    .line 64
    :array_1
    .array-data 4
        0x20
        0x28
        0x30
        0x38
        0x40
        0x50
        0x60
        0x70
        0x80
        0xa0
        0xc0
        0xe0
        0x100
        0x140
        0x180
        0x1c0
        0x200
        0x240
        0x280
    .end array-data

    :array_2
    .array-data 4
        0x45
        0x57
        0x68
        0x79
        0x8b
        0xae
        0xd0
        0xf3
        0x116
        0x15c
        0x1a1
        0x1e7
        0x22d
        0x2b8
        0x343
        0x3cf
        0x45a
        0x4e5
        0x571
    .end array-data
.end method

.method public static a(Ljava/nio/ByteBuffer;)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, 0x5

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    and-int/lit16 v0, v0, 0xf8

    .line 12
    .line 13
    const/4 v1, 0x3

    .line 14
    shr-int/2addr v0, v1

    .line 15
    const/16 v2, 0xa

    .line 16
    .line 17
    if-le v0, v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/lit8 v0, v0, 0x4

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    and-int/lit16 v0, v0, 0xc0

    .line 30
    .line 31
    shr-int/lit8 v0, v0, 0x6

    .line 32
    .line 33
    if-ne v0, v1, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    add-int/lit8 v0, v0, 0x4

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    and-int/lit8 p0, p0, 0x30

    .line 47
    .line 48
    shr-int/lit8 v1, p0, 0x4

    .line 49
    .line 50
    :goto_0
    sget-object p0, Ll/fdr0;->a:[I

    .line 51
    .line 52
    aget p0, p0, v1

    .line 53
    .line 54
    mul-int/lit16 p0, p0, 0x100

    .line 55
    .line 56
    return p0

    .line 57
    :cond_1
    const/16 p0, 0x600

    .line 58
    .line 59
    return p0
.end method

.method public static b([B)I
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x6

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v0, 0x5

    .line 8
    aget-byte v0, p0, v0

    .line 9
    .line 10
    and-int/lit16 v0, v0, 0xf8

    .line 11
    .line 12
    const/4 v2, 0x3

    .line 13
    shr-int/2addr v0, v2

    .line 14
    const/16 v3, 0xa

    .line 15
    .line 16
    if-le v0, v3, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    aget-byte v0, p0, v0

    .line 20
    .line 21
    and-int/lit8 v0, v0, 0x7

    .line 22
    .line 23
    aget-byte p0, p0, v2

    .line 24
    .line 25
    shl-int/lit8 v0, v0, 0x8

    .line 26
    .line 27
    and-int/lit16 p0, p0, 0xff

    .line 28
    .line 29
    or-int/2addr p0, v0

    .line 30
    add-int/lit8 p0, p0, 0x1

    .line 31
    .line 32
    add-int/2addr p0, p0

    .line 33
    return p0

    .line 34
    :cond_1
    const/4 v0, 0x4

    .line 35
    aget-byte p0, p0, v0

    .line 36
    .line 37
    and-int/lit16 v0, p0, 0xc0

    .line 38
    .line 39
    shr-int/2addr v0, v1

    .line 40
    and-int/lit8 p0, p0, 0x3f

    .line 41
    .line 42
    invoke-static {v0, p0}, Ll/fdr0;->f(II)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method

.method public static c(Ll/bgw0;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzae;)Ll/sqr0;
    .locals 5
    .param p3    # Lcom/google/android/gms/internal/ads/zzae;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/dfw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/dfw0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/dfw0;->i(Ll/bgw0;)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-virtual {v0, v1}, Ll/dfw0;->d(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sget-object v2, Ll/fdr0;->b:[I

    .line 15
    .line 16
    aget v1, v2, v1

    .line 17
    .line 18
    const/16 v2, 0x8

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 21
    .line 22
    .line 23
    sget-object v2, Ll/fdr0;->d:[I

    .line 24
    .line 25
    const/4 v3, 0x3

    .line 26
    invoke-virtual {v0, v3}, Ll/dfw0;->d(I)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    aget v2, v2, v3

    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    invoke-virtual {v0, v3}, Ll/dfw0;->d(I)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    :cond_0
    const/4 v3, 0x5

    .line 42
    invoke-virtual {v0, v3}, Ll/dfw0;->d(I)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    sget-object v4, Ll/fdr0;->e:[I

    .line 47
    .line 48
    aget v3, v4, v3

    .line 49
    .line 50
    mul-int/lit16 v3, v3, 0x3e8

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/dfw0;->e()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ll/dfw0;->b()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {p0, v0}, Ll/bgw0;->k(I)V

    .line 60
    .line 61
    .line 62
    new-instance p0, Ll/znr0;

    .line 63
    .line 64
    invoke-direct {p0}, Ll/znr0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 68
    .line 69
    .line 70
    const-string p1, "audio/ac3"

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v2}, Ll/znr0;->k0(I)Ll/znr0;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, v1}, Ll/znr0;->x(I)Ll/znr0;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, p3}, Ll/znr0;->e(Lcom/google/android/gms/internal/ads/zzae;)Ll/znr0;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p2}, Ll/znr0;->n(Ljava/lang/String;)Ll/znr0;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v3}, Ll/znr0;->j0(I)Ll/znr0;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, v3}, Ll/znr0;->r(I)Ll/znr0;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ll/znr0;->D()Ll/sqr0;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0
.end method

.method public static d(Ll/bgw0;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzae;)Ll/sqr0;
    .locals 7
    .param p3    # Lcom/google/android/gms/internal/ads/zzae;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/dfw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/dfw0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/dfw0;->i(Ll/bgw0;)V

    .line 7
    .line 8
    .line 9
    const/16 v1, 0xd

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/dfw0;->d(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    mul-int/lit16 v1, v1, 0x3e8

    .line 16
    .line 17
    const/4 v2, 0x3

    .line 18
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 19
    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    invoke-virtual {v0, v3}, Ll/dfw0;->d(I)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    sget-object v4, Ll/fdr0;->b:[I

    .line 27
    .line 28
    aget v3, v4, v3

    .line 29
    .line 30
    const/16 v4, 0xa

    .line 31
    .line 32
    invoke-virtual {v0, v4}, Ll/dfw0;->m(I)V

    .line 33
    .line 34
    .line 35
    sget-object v4, Ll/fdr0;->d:[I

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ll/dfw0;->d(I)I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    aget v4, v4, v5

    .line 42
    .line 43
    const/4 v5, 0x1

    .line 44
    invoke-virtual {v0, v5}, Ll/dfw0;->d(I)I

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    if-eqz v6, :cond_0

    .line 49
    .line 50
    add-int/lit8 v4, v4, 0x1

    .line 51
    .line 52
    :cond_0
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 53
    .line 54
    .line 55
    const/4 v2, 0x4

    .line 56
    invoke-virtual {v0, v2}, Ll/dfw0;->d(I)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {v0, v5}, Ll/dfw0;->m(I)V

    .line 61
    .line 62
    .line 63
    if-lez v2, :cond_2

    .line 64
    .line 65
    const/4 v2, 0x6

    .line 66
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v5}, Ll/dfw0;->d(I)I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_1

    .line 74
    .line 75
    add-int/lit8 v4, v4, 0x2

    .line 76
    .line 77
    :cond_1
    invoke-virtual {v0, v5}, Ll/dfw0;->m(I)V

    .line 78
    .line 79
    .line 80
    :cond_2
    invoke-virtual {v0}, Ll/dfw0;->a()I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    const/4 v6, 0x7

    .line 85
    if-le v2, v6, :cond_3

    .line 86
    .line 87
    invoke-virtual {v0, v6}, Ll/dfw0;->m(I)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v5}, Ll/dfw0;->d(I)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-eqz v2, :cond_3

    .line 95
    .line 96
    const-string v2, "audio/eac3-joc"

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_3
    const-string v2, "audio/eac3"

    .line 100
    .line 101
    :goto_0
    invoke-virtual {v0}, Ll/dfw0;->e()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Ll/dfw0;->b()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    invoke-virtual {p0, v0}, Ll/bgw0;->k(I)V

    .line 109
    .line 110
    .line 111
    new-instance p0, Ll/znr0;

    .line 112
    .line 113
    invoke-direct {p0}, Ll/znr0;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, p1}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0, v2}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, v4}, Ll/znr0;->k0(I)Ll/znr0;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, v3}, Ll/znr0;->x(I)Ll/znr0;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, p3}, Ll/znr0;->e(Lcom/google/android/gms/internal/ads/zzae;)Ll/znr0;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, p2}, Ll/znr0;->n(Ljava/lang/String;)Ll/znr0;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, v1}, Ll/znr0;->r(I)Ll/znr0;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ll/znr0;->D()Ll/sqr0;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0
.end method

.method public static e(Ll/dfw0;)Ll/edr0;
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dfw0;->c()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/16 v2, 0x28

    .line 8
    .line 9
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x5

    .line 13
    invoke-virtual {v0, v2}, Ll/dfw0;->d(I)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {v0, v1}, Ll/dfw0;->k(I)V

    .line 18
    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    const/16 v4, 0x8

    .line 22
    .line 23
    const/4 v5, 0x6

    .line 24
    const/4 v6, 0x3

    .line 25
    const/4 v7, 0x1

    .line 26
    const/4 v8, 0x2

    .line 27
    const/16 v9, 0xa

    .line 28
    .line 29
    if-le v3, v9, :cond_2c

    .line 30
    .line 31
    const/16 v3, 0x10

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Ll/dfw0;->m(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v8}, Ll/dfw0;->d(I)I

    .line 37
    .line 38
    .line 39
    move-result v10

    .line 40
    if-eqz v10, :cond_2

    .line 41
    .line 42
    if-eq v10, v7, :cond_1

    .line 43
    .line 44
    if-eq v10, v8, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    move v1, v8

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move v1, v7

    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const/4 v1, 0x0

    .line 52
    :goto_0
    invoke-virtual {v0, v6}, Ll/dfw0;->m(I)V

    .line 53
    .line 54
    .line 55
    const/16 v10, 0xb

    .line 56
    .line 57
    invoke-virtual {v0, v10}, Ll/dfw0;->d(I)I

    .line 58
    .line 59
    .line 60
    move-result v10

    .line 61
    add-int/2addr v10, v7

    .line 62
    invoke-virtual {v0, v8}, Ll/dfw0;->d(I)I

    .line 63
    .line 64
    .line 65
    move-result v12

    .line 66
    if-ne v12, v6, :cond_3

    .line 67
    .line 68
    sget-object v13, Ll/fdr0;->c:[I

    .line 69
    .line 70
    invoke-virtual {v0, v8}, Ll/dfw0;->d(I)I

    .line 71
    .line 72
    .line 73
    move-result v14

    .line 74
    aget v13, v13, v14

    .line 75
    .line 76
    move v15, v5

    .line 77
    move v14, v6

    .line 78
    goto :goto_1

    .line 79
    :cond_3
    invoke-virtual {v0, v8}, Ll/dfw0;->d(I)I

    .line 80
    .line 81
    .line 82
    move-result v13

    .line 83
    sget-object v14, Ll/fdr0;->a:[I

    .line 84
    .line 85
    aget v14, v14, v13

    .line 86
    .line 87
    sget-object v15, Ll/fdr0;->b:[I

    .line 88
    .line 89
    aget v15, v15, v12

    .line 90
    .line 91
    move/from16 v29, v14

    .line 92
    .line 93
    move v14, v13

    .line 94
    move v13, v15

    .line 95
    move/from16 v15, v29

    .line 96
    .line 97
    :goto_1
    add-int/2addr v10, v10

    .line 98
    mul-int/lit8 v16, v15, 0x20

    .line 99
    .line 100
    mul-int v17, v10, v13

    .line 101
    .line 102
    div-int v17, v17, v16

    .line 103
    .line 104
    invoke-virtual {v0, v6}, Ll/dfw0;->d(I)I

    .line 105
    .line 106
    .line 107
    move-result v16

    .line 108
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 109
    .line 110
    .line 111
    move-result v18

    .line 112
    sget-object v19, Ll/fdr0;->d:[I

    .line 113
    .line 114
    aget v19, v19, v16

    .line 115
    .line 116
    add-int v19, v19, v18

    .line 117
    .line 118
    invoke-virtual {v0, v9}, Ll/dfw0;->m(I)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 122
    .line 123
    .line 124
    move-result v9

    .line 125
    if-eqz v9, :cond_4

    .line 126
    .line 127
    invoke-virtual {v0, v4}, Ll/dfw0;->m(I)V

    .line 128
    .line 129
    .line 130
    :cond_4
    if-nez v16, :cond_6

    .line 131
    .line 132
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 136
    .line 137
    .line 138
    move-result v9

    .line 139
    if-eqz v9, :cond_5

    .line 140
    .line 141
    invoke-virtual {v0, v4}, Ll/dfw0;->m(I)V

    .line 142
    .line 143
    .line 144
    :cond_5
    const/4 v9, 0x0

    .line 145
    const/16 v16, 0x0

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_6
    move/from16 v9, v16

    .line 149
    .line 150
    :goto_2
    if-ne v1, v7, :cond_8

    .line 151
    .line 152
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 153
    .line 154
    .line 155
    move-result v20

    .line 156
    if-eqz v20, :cond_7

    .line 157
    .line 158
    invoke-virtual {v0, v3}, Ll/dfw0;->m(I)V

    .line 159
    .line 160
    .line 161
    :cond_7
    move v3, v7

    .line 162
    goto :goto_3

    .line 163
    :cond_8
    move v3, v1

    .line 164
    :goto_3
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 165
    .line 166
    .line 167
    move-result v20

    .line 168
    const/4 v11, 0x4

    .line 169
    if-eqz v20, :cond_22

    .line 170
    .line 171
    if-le v9, v8, :cond_9

    .line 172
    .line 173
    invoke-virtual {v0, v8}, Ll/dfw0;->m(I)V

    .line 174
    .line 175
    .line 176
    :cond_9
    and-int/lit8 v20, v9, 0x1

    .line 177
    .line 178
    if-eqz v20, :cond_a

    .line 179
    .line 180
    if-le v9, v8, :cond_a

    .line 181
    .line 182
    invoke-virtual {v0, v5}, Ll/dfw0;->m(I)V

    .line 183
    .line 184
    .line 185
    :cond_a
    and-int/lit8 v20, v9, 0x4

    .line 186
    .line 187
    if-eqz v20, :cond_b

    .line 188
    .line 189
    invoke-virtual {v0, v5}, Ll/dfw0;->m(I)V

    .line 190
    .line 191
    .line 192
    :cond_b
    if-eqz v18, :cond_c

    .line 193
    .line 194
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 195
    .line 196
    .line 197
    move-result v18

    .line 198
    if-eqz v18, :cond_c

    .line 199
    .line 200
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 201
    .line 202
    .line 203
    :cond_c
    if-nez v3, :cond_22

    .line 204
    .line 205
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 206
    .line 207
    .line 208
    move-result v3

    .line 209
    if-eqz v3, :cond_d

    .line 210
    .line 211
    invoke-virtual {v0, v5}, Ll/dfw0;->m(I)V

    .line 212
    .line 213
    .line 214
    :cond_d
    if-nez v9, :cond_e

    .line 215
    .line 216
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 217
    .line 218
    .line 219
    move-result v3

    .line 220
    if-eqz v3, :cond_e

    .line 221
    .line 222
    invoke-virtual {v0, v5}, Ll/dfw0;->m(I)V

    .line 223
    .line 224
    .line 225
    :cond_e
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    if-eqz v3, :cond_f

    .line 230
    .line 231
    invoke-virtual {v0, v5}, Ll/dfw0;->m(I)V

    .line 232
    .line 233
    .line 234
    :cond_f
    invoke-virtual {v0, v8}, Ll/dfw0;->d(I)I

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    if-ne v3, v7, :cond_10

    .line 239
    .line 240
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 241
    .line 242
    .line 243
    goto/16 :goto_4

    .line 244
    .line 245
    :cond_10
    if-ne v3, v8, :cond_11

    .line 246
    .line 247
    const/16 v3, 0xc

    .line 248
    .line 249
    invoke-virtual {v0, v3}, Ll/dfw0;->m(I)V

    .line 250
    .line 251
    .line 252
    goto/16 :goto_4

    .line 253
    .line 254
    :cond_11
    if-ne v3, v6, :cond_1c

    .line 255
    .line 256
    invoke-virtual {v0, v2}, Ll/dfw0;->d(I)I

    .line 257
    .line 258
    .line 259
    move-result v3

    .line 260
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 261
    .line 262
    .line 263
    move-result v18

    .line 264
    if-eqz v18, :cond_1a

    .line 265
    .line 266
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 270
    .line 271
    .line 272
    move-result v18

    .line 273
    if-eqz v18, :cond_12

    .line 274
    .line 275
    invoke-virtual {v0, v11}, Ll/dfw0;->m(I)V

    .line 276
    .line 277
    .line 278
    :cond_12
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 279
    .line 280
    .line 281
    move-result v18

    .line 282
    if-eqz v18, :cond_13

    .line 283
    .line 284
    invoke-virtual {v0, v11}, Ll/dfw0;->m(I)V

    .line 285
    .line 286
    .line 287
    :cond_13
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 288
    .line 289
    .line 290
    move-result v18

    .line 291
    if-eqz v18, :cond_14

    .line 292
    .line 293
    invoke-virtual {v0, v11}, Ll/dfw0;->m(I)V

    .line 294
    .line 295
    .line 296
    :cond_14
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 297
    .line 298
    .line 299
    move-result v18

    .line 300
    if-eqz v18, :cond_15

    .line 301
    .line 302
    invoke-virtual {v0, v11}, Ll/dfw0;->m(I)V

    .line 303
    .line 304
    .line 305
    :cond_15
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 306
    .line 307
    .line 308
    move-result v18

    .line 309
    if-eqz v18, :cond_16

    .line 310
    .line 311
    invoke-virtual {v0, v11}, Ll/dfw0;->m(I)V

    .line 312
    .line 313
    .line 314
    :cond_16
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 315
    .line 316
    .line 317
    move-result v18

    .line 318
    if-eqz v18, :cond_17

    .line 319
    .line 320
    invoke-virtual {v0, v11}, Ll/dfw0;->m(I)V

    .line 321
    .line 322
    .line 323
    :cond_17
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 324
    .line 325
    .line 326
    move-result v18

    .line 327
    if-eqz v18, :cond_18

    .line 328
    .line 329
    invoke-virtual {v0, v11}, Ll/dfw0;->m(I)V

    .line 330
    .line 331
    .line 332
    :cond_18
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 333
    .line 334
    .line 335
    move-result v18

    .line 336
    if-eqz v18, :cond_1a

    .line 337
    .line 338
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 339
    .line 340
    .line 341
    move-result v18

    .line 342
    if-eqz v18, :cond_19

    .line 343
    .line 344
    invoke-virtual {v0, v11}, Ll/dfw0;->m(I)V

    .line 345
    .line 346
    .line 347
    :cond_19
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 348
    .line 349
    .line 350
    move-result v18

    .line 351
    if-eqz v18, :cond_1a

    .line 352
    .line 353
    invoke-virtual {v0, v11}, Ll/dfw0;->m(I)V

    .line 354
    .line 355
    .line 356
    :cond_1a
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 357
    .line 358
    .line 359
    move-result v18

    .line 360
    if-eqz v18, :cond_1b

    .line 361
    .line 362
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 363
    .line 364
    .line 365
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 366
    .line 367
    .line 368
    move-result v18

    .line 369
    if-eqz v18, :cond_1b

    .line 370
    .line 371
    const/4 v7, 0x7

    .line 372
    invoke-virtual {v0, v7}, Ll/dfw0;->m(I)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 376
    .line 377
    .line 378
    move-result v7

    .line 379
    if-eqz v7, :cond_1b

    .line 380
    .line 381
    invoke-virtual {v0, v4}, Ll/dfw0;->m(I)V

    .line 382
    .line 383
    .line 384
    :cond_1b
    add-int/2addr v3, v8

    .line 385
    mul-int/2addr v3, v4

    .line 386
    invoke-virtual {v0, v3}, Ll/dfw0;->m(I)V

    .line 387
    .line 388
    .line 389
    invoke-virtual {v0}, Ll/dfw0;->e()V

    .line 390
    .line 391
    .line 392
    :cond_1c
    :goto_4
    if-ge v9, v8, :cond_1e

    .line 393
    .line 394
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 395
    .line 396
    .line 397
    move-result v3

    .line 398
    const/16 v7, 0xe

    .line 399
    .line 400
    if-eqz v3, :cond_1d

    .line 401
    .line 402
    invoke-virtual {v0, v7}, Ll/dfw0;->m(I)V

    .line 403
    .line 404
    .line 405
    :cond_1d
    if-nez v16, :cond_1e

    .line 406
    .line 407
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 408
    .line 409
    .line 410
    move-result v3

    .line 411
    if-eqz v3, :cond_1e

    .line 412
    .line 413
    invoke-virtual {v0, v7}, Ll/dfw0;->m(I)V

    .line 414
    .line 415
    .line 416
    :cond_1e
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 417
    .line 418
    .line 419
    move-result v3

    .line 420
    if-eqz v3, :cond_21

    .line 421
    .line 422
    if-nez v14, :cond_1f

    .line 423
    .line 424
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 425
    .line 426
    .line 427
    const/4 v3, 0x0

    .line 428
    const/4 v14, 0x0

    .line 429
    goto :goto_6

    .line 430
    :cond_1f
    const/4 v3, 0x0

    .line 431
    :goto_5
    if-ge v3, v15, :cond_21

    .line 432
    .line 433
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 434
    .line 435
    .line 436
    move-result v7

    .line 437
    if-eqz v7, :cond_20

    .line 438
    .line 439
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 440
    .line 441
    .line 442
    :cond_20
    add-int/lit8 v3, v3, 0x1

    .line 443
    .line 444
    goto :goto_5

    .line 445
    :cond_21
    const/4 v3, 0x0

    .line 446
    :cond_22
    :goto_6
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 447
    .line 448
    .line 449
    move-result v7

    .line 450
    if-eqz v7, :cond_27

    .line 451
    .line 452
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 453
    .line 454
    .line 455
    if-ne v9, v8, :cond_23

    .line 456
    .line 457
    invoke-virtual {v0, v11}, Ll/dfw0;->m(I)V

    .line 458
    .line 459
    .line 460
    move v9, v8

    .line 461
    :cond_23
    if-lt v9, v5, :cond_24

    .line 462
    .line 463
    invoke-virtual {v0, v8}, Ll/dfw0;->m(I)V

    .line 464
    .line 465
    .line 466
    :cond_24
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 467
    .line 468
    .line 469
    move-result v2

    .line 470
    if-eqz v2, :cond_25

    .line 471
    .line 472
    invoke-virtual {v0, v4}, Ll/dfw0;->m(I)V

    .line 473
    .line 474
    .line 475
    :cond_25
    if-nez v9, :cond_26

    .line 476
    .line 477
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 478
    .line 479
    .line 480
    move-result v2

    .line 481
    if-eqz v2, :cond_26

    .line 482
    .line 483
    invoke-virtual {v0, v4}, Ll/dfw0;->m(I)V

    .line 484
    .line 485
    .line 486
    :cond_26
    if-ge v12, v6, :cond_27

    .line 487
    .line 488
    invoke-virtual {v0}, Ll/dfw0;->l()V

    .line 489
    .line 490
    .line 491
    :cond_27
    if-nez v3, :cond_28

    .line 492
    .line 493
    if-eq v14, v6, :cond_28

    .line 494
    .line 495
    invoke-virtual {v0}, Ll/dfw0;->l()V

    .line 496
    .line 497
    .line 498
    :cond_28
    if-ne v3, v8, :cond_2a

    .line 499
    .line 500
    if-eq v14, v6, :cond_29

    .line 501
    .line 502
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 503
    .line 504
    .line 505
    move-result v2

    .line 506
    if-eqz v2, :cond_2a

    .line 507
    .line 508
    :cond_29
    invoke-virtual {v0, v5}, Ll/dfw0;->m(I)V

    .line 509
    .line 510
    .line 511
    :cond_2a
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 512
    .line 513
    .line 514
    move-result v2

    .line 515
    if-eqz v2, :cond_2b

    .line 516
    .line 517
    invoke-virtual {v0, v5}, Ll/dfw0;->d(I)I

    .line 518
    .line 519
    .line 520
    move-result v2

    .line 521
    const/4 v3, 0x1

    .line 522
    if-ne v2, v3, :cond_2b

    .line 523
    .line 524
    invoke-virtual {v0, v4}, Ll/dfw0;->d(I)I

    .line 525
    .line 526
    .line 527
    move-result v0

    .line 528
    if-ne v0, v3, :cond_2b

    .line 529
    .line 530
    const-string v0, "audio/eac3-joc"

    .line 531
    .line 532
    goto :goto_7

    .line 533
    :cond_2b
    const-string v0, "audio/eac3"

    .line 534
    .line 535
    :goto_7
    mul-int/lit16 v15, v15, 0x100

    .line 536
    .line 537
    move-object/from16 v21, v0

    .line 538
    .line 539
    move/from16 v27, v17

    .line 540
    .line 541
    :goto_8
    move/from16 v22, v1

    .line 542
    .line 543
    move/from16 v25, v10

    .line 544
    .line 545
    move/from16 v24, v13

    .line 546
    .line 547
    move/from16 v26, v15

    .line 548
    .line 549
    move/from16 v23, v19

    .line 550
    .line 551
    goto :goto_b

    .line 552
    :cond_2c
    const/16 v2, 0x20

    .line 553
    .line 554
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 555
    .line 556
    .line 557
    invoke-virtual {v0, v8}, Ll/dfw0;->d(I)I

    .line 558
    .line 559
    .line 560
    move-result v2

    .line 561
    if-ne v2, v6, :cond_2d

    .line 562
    .line 563
    const/4 v3, 0x0

    .line 564
    goto :goto_9

    .line 565
    :cond_2d
    const-string v3, "audio/ac3"

    .line 566
    .line 567
    :goto_9
    invoke-virtual {v0, v5}, Ll/dfw0;->d(I)I

    .line 568
    .line 569
    .line 570
    move-result v5

    .line 571
    div-int/lit8 v7, v5, 0x2

    .line 572
    .line 573
    sget-object v9, Ll/fdr0;->e:[I

    .line 574
    .line 575
    aget v7, v9, v7

    .line 576
    .line 577
    mul-int/lit16 v7, v7, 0x3e8

    .line 578
    .line 579
    invoke-static {v2, v5}, Ll/fdr0;->f(II)I

    .line 580
    .line 581
    .line 582
    move-result v10

    .line 583
    invoke-virtual {v0, v4}, Ll/dfw0;->m(I)V

    .line 584
    .line 585
    .line 586
    invoke-virtual {v0, v6}, Ll/dfw0;->d(I)I

    .line 587
    .line 588
    .line 589
    move-result v4

    .line 590
    and-int/lit8 v5, v4, 0x1

    .line 591
    .line 592
    if-eqz v5, :cond_2e

    .line 593
    .line 594
    const/4 v5, 0x1

    .line 595
    if-eq v4, v5, :cond_2e

    .line 596
    .line 597
    invoke-virtual {v0, v8}, Ll/dfw0;->m(I)V

    .line 598
    .line 599
    .line 600
    :cond_2e
    and-int/lit8 v5, v4, 0x4

    .line 601
    .line 602
    if-eqz v5, :cond_2f

    .line 603
    .line 604
    invoke-virtual {v0, v8}, Ll/dfw0;->m(I)V

    .line 605
    .line 606
    .line 607
    :cond_2f
    if-ne v4, v8, :cond_30

    .line 608
    .line 609
    invoke-virtual {v0, v8}, Ll/dfw0;->m(I)V

    .line 610
    .line 611
    .line 612
    :cond_30
    if-ge v2, v6, :cond_31

    .line 613
    .line 614
    sget-object v5, Ll/fdr0;->b:[I

    .line 615
    .line 616
    aget v2, v5, v2

    .line 617
    .line 618
    move v13, v2

    .line 619
    goto :goto_a

    .line 620
    :cond_31
    move v13, v1

    .line 621
    :goto_a
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 622
    .line 623
    .line 624
    move-result v0

    .line 625
    sget-object v2, Ll/fdr0;->d:[I

    .line 626
    .line 627
    aget v2, v2, v4

    .line 628
    .line 629
    add-int v19, v2, v0

    .line 630
    .line 631
    const/16 v15, 0x600

    .line 632
    .line 633
    move-object/from16 v21, v3

    .line 634
    .line 635
    move/from16 v27, v7

    .line 636
    .line 637
    goto :goto_8

    .line 638
    :goto_b
    new-instance v20, Ll/edr0;

    .line 639
    .line 640
    const/16 v28, 0x0

    .line 641
    .line 642
    invoke-direct/range {v20 .. v28}, Ll/edr0;-><init>(Ljava/lang/String;IIIIIILl/ddr0;)V

    .line 643
    .line 644
    .line 645
    return-object v20
.end method

.method public static f(II)I
    .locals 2

    .line 1
    if-ltz p0, :cond_3

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ge p0, v0, :cond_3

    .line 5
    .line 6
    if-ltz p1, :cond_3

    .line 7
    .line 8
    shr-int/lit8 v0, p1, 0x1

    .line 9
    .line 10
    const/16 v1, 0x13

    .line 11
    .line 12
    if-lt v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget-object v1, Ll/fdr0;->b:[I

    .line 16
    .line 17
    aget p0, v1, p0

    .line 18
    .line 19
    const v1, 0xac44

    .line 20
    .line 21
    .line 22
    if-ne p0, v1, :cond_1

    .line 23
    .line 24
    sget-object p0, Ll/fdr0;->f:[I

    .line 25
    .line 26
    aget p0, p0, v0

    .line 27
    .line 28
    and-int/lit8 p1, p1, 0x1

    .line 29
    .line 30
    add-int/2addr p0, p1

    .line 31
    add-int/2addr p0, p0

    .line 32
    return p0

    .line 33
    :cond_1
    sget-object p1, Ll/fdr0;->e:[I

    .line 34
    .line 35
    aget p1, p1, v0

    .line 36
    .line 37
    const/16 v0, 0x7d00

    .line 38
    .line 39
    if-ne p0, v0, :cond_2

    .line 40
    .line 41
    mul-int/lit8 p1, p1, 0x6

    .line 42
    .line 43
    return p1

    .line 44
    :cond_2
    mul-int/lit8 p1, p1, 0x4

    .line 45
    .line 46
    return p1

    .line 47
    :cond_3
    :goto_0
    const/4 p0, -0x1

    .line 48
    return p0
.end method
