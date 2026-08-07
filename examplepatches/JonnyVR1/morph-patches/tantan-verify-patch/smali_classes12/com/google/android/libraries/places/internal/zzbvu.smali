.class public final Lcom/google/android/libraries/places/internal/zzbvu;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lkotlin/jvm/JvmName;
.end annotation


# static fields
.field private static final zza:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final zzb:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbwf;->zza:Lcom/google/android/libraries/places/internal/zzbwe;

    .line 2
    .line 3
    const-string v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    .line 4
    .line 5
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzn()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbvu;->zza:[B

    .line 14
    .line 15
    const-string v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"

    .line 16
    .line 17
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzn()[B

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbvu;->zzb:[B

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic zza([B[BILjava/lang/Object;)Ljava/lang/String;
    .locals 10

    .line 1
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbvu;->zza:[B

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    array-length p2, p0

    .line 10
    add-int/lit8 p3, p2, 0x2

    .line 11
    .line 12
    rem-int/lit8 v0, p2, 0x3

    .line 13
    .line 14
    sub-int/2addr p2, v0

    .line 15
    div-int/lit8 p3, p3, 0x3

    .line 16
    .line 17
    mul-int/lit8 p3, p3, 0x4

    .line 18
    .line 19
    new-array p3, p3, [B

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    move v1, v0

    .line 23
    :goto_0
    const/4 v2, 0x2

    .line 24
    if-ge v0, p2, :cond_0

    .line 25
    .line 26
    add-int/lit8 v3, v1, 0x1

    .line 27
    .line 28
    add-int/lit8 v4, v1, 0x2

    .line 29
    .line 30
    add-int/lit8 v5, v1, 0x3

    .line 31
    .line 32
    add-int/lit8 v6, v0, 0x1

    .line 33
    .line 34
    aget-byte v7, p0, v0

    .line 35
    .line 36
    add-int/lit8 v8, v0, 0x2

    .line 37
    .line 38
    aget-byte v6, p0, v6

    .line 39
    .line 40
    add-int/lit8 v0, v0, 0x3

    .line 41
    .line 42
    aget-byte v8, p0, v8

    .line 43
    .line 44
    and-int/lit16 v9, v7, 0xff

    .line 45
    .line 46
    shr-int/2addr v9, v2

    .line 47
    aget-byte v9, p1, v9

    .line 48
    .line 49
    aput-byte v9, p3, v1

    .line 50
    .line 51
    and-int/lit8 v7, v7, 0x3

    .line 52
    .line 53
    shl-int/lit8 v7, v7, 0x4

    .line 54
    .line 55
    and-int/lit16 v9, v6, 0xff

    .line 56
    .line 57
    shr-int/lit8 v9, v9, 0x4

    .line 58
    .line 59
    or-int/2addr v7, v9

    .line 60
    aget-byte v7, p1, v7

    .line 61
    .line 62
    aput-byte v7, p3, v3

    .line 63
    .line 64
    and-int/lit8 v3, v6, 0xf

    .line 65
    .line 66
    shl-int/lit8 v2, v3, 0x2

    .line 67
    .line 68
    and-int/lit16 v3, v8, 0xff

    .line 69
    .line 70
    shr-int/lit8 v3, v3, 0x6

    .line 71
    .line 72
    or-int/2addr v2, v3

    .line 73
    aget-byte v2, p1, v2

    .line 74
    .line 75
    aput-byte v2, p3, v4

    .line 76
    .line 77
    add-int/lit8 v1, v1, 0x4

    .line 78
    .line 79
    and-int/lit8 v2, v8, 0x3f

    .line 80
    .line 81
    aget-byte v2, p1, v2

    .line 82
    .line 83
    aput-byte v2, p3, v5

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    array-length v3, p0

    .line 87
    sub-int/2addr v3, p2

    .line 88
    const/16 p2, 0x3d

    .line 89
    .line 90
    const/4 v4, 0x1

    .line 91
    if-eq v3, v4, :cond_2

    .line 92
    .line 93
    if-eq v3, v2, :cond_1

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_1
    add-int/lit8 v3, v1, 0x1

    .line 97
    .line 98
    add-int/lit8 v4, v1, 0x2

    .line 99
    .line 100
    add-int/lit8 v5, v1, 0x3

    .line 101
    .line 102
    add-int/lit8 v6, v0, 0x1

    .line 103
    .line 104
    aget-byte v0, p0, v0

    .line 105
    .line 106
    aget-byte p0, p0, v6

    .line 107
    .line 108
    and-int/lit16 v6, v0, 0xff

    .line 109
    .line 110
    shr-int/2addr v6, v2

    .line 111
    aget-byte v6, p1, v6

    .line 112
    .line 113
    aput-byte v6, p3, v1

    .line 114
    .line 115
    and-int/lit8 v0, v0, 0x3

    .line 116
    .line 117
    shl-int/lit8 v0, v0, 0x4

    .line 118
    .line 119
    and-int/lit16 v1, p0, 0xff

    .line 120
    .line 121
    shr-int/lit8 v1, v1, 0x4

    .line 122
    .line 123
    or-int/2addr v0, v1

    .line 124
    aget-byte v0, p1, v0

    .line 125
    .line 126
    aput-byte v0, p3, v3

    .line 127
    .line 128
    and-int/lit8 p0, p0, 0xf

    .line 129
    .line 130
    shl-int/2addr p0, v2

    .line 131
    aget-byte p0, p1, p0

    .line 132
    .line 133
    aput-byte p0, p3, v4

    .line 134
    .line 135
    aput-byte p2, p3, v5

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_2
    add-int/lit8 v3, v1, 0x1

    .line 139
    .line 140
    add-int/lit8 v4, v1, 0x2

    .line 141
    .line 142
    add-int/lit8 v5, v1, 0x3

    .line 143
    .line 144
    aget-byte p0, p0, v0

    .line 145
    .line 146
    and-int/lit16 v0, p0, 0xff

    .line 147
    .line 148
    shr-int/2addr v0, v2

    .line 149
    aget-byte v0, p1, v0

    .line 150
    .line 151
    aput-byte v0, p3, v1

    .line 152
    .line 153
    and-int/lit8 p0, p0, 0x3

    .line 154
    .line 155
    shl-int/lit8 p0, p0, 0x4

    .line 156
    .line 157
    aget-byte p0, p1, p0

    .line 158
    .line 159
    aput-byte p0, p3, v3

    .line 160
    .line 161
    aput-byte p2, p3, v4

    .line 162
    .line 163
    aput-byte p2, p3, v5

    .line 164
    .line 165
    :goto_1
    invoke-static {p3}, Lcom/google/android/libraries/places/internal/zzbww;->zza([B)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0
.end method
