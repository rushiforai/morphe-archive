.class public final Lcom/tencent/cloud/ai/network/okio/d;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[B

.field public static final b:[B


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/tencent/cloud/ai/network/okio/d;->a:[B

    .line 9
    .line 10
    const/16 v0, 0x40

    .line 11
    .line 12
    new-array v0, v0, [B

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/tencent/cloud/ai/network/okio/d;->b:[B

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :array_0
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data

    :array_1
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2dt
        0x5ft
    .end array-data
.end method

.method public static a([B[B)Ljava/lang/String;
    .locals 10

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x2

    .line 3
    add-int/2addr v0, v1

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
    array-length v2, p0

    .line 11
    array-length v3, p0

    .line 12
    rem-int/lit8 v3, v3, 0x3

    .line 13
    .line 14
    sub-int/2addr v2, v3

    .line 15
    const/4 v3, 0x0

    .line 16
    move v4, v3

    .line 17
    :goto_0
    if-ge v3, v2, :cond_0

    .line 18
    .line 19
    add-int/lit8 v5, v4, 0x1

    .line 20
    .line 21
    aget-byte v6, p0, v3

    .line 22
    .line 23
    and-int/lit16 v6, v6, 0xff

    .line 24
    .line 25
    shr-int/2addr v6, v1

    .line 26
    aget-byte v6, p1, v6

    .line 27
    .line 28
    aput-byte v6, v0, v4

    .line 29
    .line 30
    add-int/lit8 v6, v4, 0x2

    .line 31
    .line 32
    aget-byte v7, p0, v3

    .line 33
    .line 34
    and-int/lit8 v7, v7, 0x3

    .line 35
    .line 36
    shl-int/lit8 v7, v7, 0x4

    .line 37
    .line 38
    add-int/lit8 v8, v3, 0x1

    .line 39
    .line 40
    aget-byte v9, p0, v8

    .line 41
    .line 42
    and-int/lit16 v9, v9, 0xff

    .line 43
    .line 44
    shr-int/lit8 v9, v9, 0x4

    .line 45
    .line 46
    or-int/2addr v7, v9

    .line 47
    aget-byte v7, p1, v7

    .line 48
    .line 49
    aput-byte v7, v0, v5

    .line 50
    .line 51
    add-int/lit8 v5, v4, 0x3

    .line 52
    .line 53
    aget-byte v7, p0, v8

    .line 54
    .line 55
    and-int/lit8 v7, v7, 0xf

    .line 56
    .line 57
    shl-int/2addr v7, v1

    .line 58
    add-int/lit8 v8, v3, 0x2

    .line 59
    .line 60
    aget-byte v9, p0, v8

    .line 61
    .line 62
    and-int/lit16 v9, v9, 0xff

    .line 63
    .line 64
    shr-int/lit8 v9, v9, 0x6

    .line 65
    .line 66
    or-int/2addr v7, v9

    .line 67
    aget-byte v7, p1, v7

    .line 68
    .line 69
    aput-byte v7, v0, v6

    .line 70
    .line 71
    add-int/lit8 v4, v4, 0x4

    .line 72
    .line 73
    aget-byte v6, p0, v8

    .line 74
    .line 75
    and-int/lit8 v6, v6, 0x3f

    .line 76
    .line 77
    aget-byte v6, p1, v6

    .line 78
    .line 79
    aput-byte v6, v0, v5

    .line 80
    .line 81
    add-int/lit8 v3, v3, 0x3

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    array-length v3, p0

    .line 85
    rem-int/lit8 v3, v3, 0x3

    .line 86
    .line 87
    const/16 v5, 0x3d

    .line 88
    .line 89
    const/4 v6, 0x1

    .line 90
    if-eq v3, v6, :cond_2

    .line 91
    .line 92
    if-eq v3, v1, :cond_1

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_1
    add-int/lit8 v3, v4, 0x1

    .line 96
    .line 97
    aget-byte v7, p0, v2

    .line 98
    .line 99
    and-int/lit16 v7, v7, 0xff

    .line 100
    .line 101
    shr-int/2addr v7, v1

    .line 102
    aget-byte v7, p1, v7

    .line 103
    .line 104
    aput-byte v7, v0, v4

    .line 105
    .line 106
    add-int/lit8 v7, v4, 0x2

    .line 107
    .line 108
    aget-byte v8, p0, v2

    .line 109
    .line 110
    and-int/lit8 v8, v8, 0x3

    .line 111
    .line 112
    shl-int/lit8 v8, v8, 0x4

    .line 113
    .line 114
    add-int/2addr v2, v6

    .line 115
    aget-byte v6, p0, v2

    .line 116
    .line 117
    and-int/lit16 v6, v6, 0xff

    .line 118
    .line 119
    shr-int/lit8 v6, v6, 0x4

    .line 120
    .line 121
    or-int/2addr v6, v8

    .line 122
    aget-byte v6, p1, v6

    .line 123
    .line 124
    aput-byte v6, v0, v3

    .line 125
    .line 126
    add-int/lit8 v4, v4, 0x3

    .line 127
    .line 128
    aget-byte p0, p0, v2

    .line 129
    .line 130
    and-int/lit8 p0, p0, 0xf

    .line 131
    .line 132
    shl-int/2addr p0, v1

    .line 133
    aget-byte p0, p1, p0

    .line 134
    .line 135
    aput-byte p0, v0, v7

    .line 136
    .line 137
    aput-byte v5, v0, v4

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_2
    add-int/lit8 v3, v4, 0x1

    .line 141
    .line 142
    aget-byte v6, p0, v2

    .line 143
    .line 144
    and-int/lit16 v6, v6, 0xff

    .line 145
    .line 146
    shr-int/lit8 v1, v6, 0x2

    .line 147
    .line 148
    aget-byte v1, p1, v1

    .line 149
    .line 150
    aput-byte v1, v0, v4

    .line 151
    .line 152
    add-int/lit8 v1, v4, 0x2

    .line 153
    .line 154
    aget-byte p0, p0, v2

    .line 155
    .line 156
    and-int/lit8 p0, p0, 0x3

    .line 157
    .line 158
    shl-int/lit8 p0, p0, 0x4

    .line 159
    .line 160
    aget-byte p0, p1, p0

    .line 161
    .line 162
    aput-byte p0, v0, v3

    .line 163
    .line 164
    add-int/lit8 v4, v4, 0x3

    .line 165
    .line 166
    aput-byte v5, v0, v1

    .line 167
    .line 168
    aput-byte v5, v0, v4

    .line 169
    .line 170
    :goto_1
    :try_start_0
    new-instance p0, Ljava/lang/String;

    .line 171
    .line 172
    const-string p1, "US-ASCII"

    .line 173
    .line 174
    invoke-direct {p0, v0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    .line 176
    .line 177
    return-object p0

    .line 178
    :catch_0
    move-exception p0

    .line 179
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    const/4 p0, 0x0

    .line 183
    return-object p0
.end method
