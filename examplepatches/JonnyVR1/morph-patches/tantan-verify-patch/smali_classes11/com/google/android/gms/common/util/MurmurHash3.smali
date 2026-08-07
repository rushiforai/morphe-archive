.class public Lcom/google/android/gms/common/util/MurmurHash3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static murmurhash3_x86_32([BIII)I
    .locals 7
    .param p0    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation

    .line 1
    move v0, p1

    .line 2
    :goto_0
    and-int/lit8 v1, p2, -0x4

    .line 3
    .line 4
    add-int/2addr v1, p1

    .line 5
    const v2, 0x1b873593

    .line 6
    .line 7
    .line 8
    const v3, -0x3361d2af    # -8.293031E7f

    .line 9
    .line 10
    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    aget-byte v1, p0, v0

    .line 14
    .line 15
    and-int/lit16 v1, v1, 0xff

    .line 16
    .line 17
    add-int/lit8 v4, v0, 0x1

    .line 18
    .line 19
    aget-byte v4, p0, v4

    .line 20
    .line 21
    and-int/lit16 v4, v4, 0xff

    .line 22
    .line 23
    shl-int/lit8 v4, v4, 0x8

    .line 24
    .line 25
    add-int/lit8 v5, v0, 0x2

    .line 26
    .line 27
    aget-byte v5, p0, v5

    .line 28
    .line 29
    and-int/lit16 v5, v5, 0xff

    .line 30
    .line 31
    shl-int/lit8 v5, v5, 0x10

    .line 32
    .line 33
    add-int/lit8 v6, v0, 0x3

    .line 34
    .line 35
    aget-byte v6, p0, v6

    .line 36
    .line 37
    shl-int/lit8 v6, v6, 0x18

    .line 38
    .line 39
    or-int/2addr v1, v4

    .line 40
    or-int/2addr v1, v5

    .line 41
    or-int/2addr v1, v6

    .line 42
    mul-int/2addr v1, v3

    .line 43
    shl-int/lit8 v3, v1, 0xf

    .line 44
    .line 45
    ushr-int/lit8 v1, v1, 0x11

    .line 46
    .line 47
    or-int/2addr v1, v3

    .line 48
    mul-int/2addr v1, v2

    .line 49
    xor-int/2addr p3, v1

    .line 50
    shl-int/lit8 v1, p3, 0xd

    .line 51
    .line 52
    ushr-int/lit8 p3, p3, 0x13

    .line 53
    .line 54
    or-int/2addr p3, v1

    .line 55
    mul-int/lit8 p3, p3, 0x5

    .line 56
    .line 57
    const v1, -0x19ab949c

    .line 58
    .line 59
    .line 60
    add-int/2addr p3, v1

    .line 61
    add-int/lit8 v0, v0, 0x4

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    and-int/lit8 p1, p2, 0x3

    .line 65
    .line 66
    const/4 v0, 0x0

    .line 67
    const/4 v4, 0x1

    .line 68
    if-eq p1, v4, :cond_3

    .line 69
    .line 70
    const/4 v4, 0x2

    .line 71
    if-eq p1, v4, :cond_2

    .line 72
    .line 73
    const/4 v0, 0x3

    .line 74
    if-eq p1, v0, :cond_1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    add-int/lit8 p1, v1, 0x2

    .line 78
    .line 79
    aget-byte p1, p0, p1

    .line 80
    .line 81
    and-int/lit16 p1, p1, 0xff

    .line 82
    .line 83
    shl-int/lit8 v0, p1, 0x10

    .line 84
    .line 85
    :cond_2
    add-int/lit8 p1, v1, 0x1

    .line 86
    .line 87
    aget-byte p1, p0, p1

    .line 88
    .line 89
    and-int/lit16 p1, p1, 0xff

    .line 90
    .line 91
    shl-int/lit8 p1, p1, 0x8

    .line 92
    .line 93
    or-int/2addr v0, p1

    .line 94
    :cond_3
    aget-byte p0, p0, v1

    .line 95
    .line 96
    and-int/lit16 p0, p0, 0xff

    .line 97
    .line 98
    or-int/2addr p0, v0

    .line 99
    mul-int/2addr p0, v3

    .line 100
    shl-int/lit8 p1, p0, 0xf

    .line 101
    .line 102
    ushr-int/lit8 p0, p0, 0x11

    .line 103
    .line 104
    or-int/2addr p0, p1

    .line 105
    mul-int/2addr p0, v2

    .line 106
    xor-int/2addr p3, p0

    .line 107
    :goto_1
    xor-int p0, p3, p2

    .line 108
    .line 109
    ushr-int/lit8 p1, p0, 0x10

    .line 110
    .line 111
    xor-int/2addr p0, p1

    .line 112
    const p1, -0x7a143595

    .line 113
    .line 114
    .line 115
    mul-int/2addr p0, p1

    .line 116
    ushr-int/lit8 p1, p0, 0xd

    .line 117
    .line 118
    xor-int/2addr p0, p1

    .line 119
    const p1, -0x3d4d51cb

    .line 120
    .line 121
    .line 122
    mul-int/2addr p0, p1

    .line 123
    ushr-int/lit8 p1, p0, 0x10

    .line 124
    .line 125
    xor-int/2addr p0, p1

    .line 126
    return p0
.end method
