.class public final Ll/fmx0;
.super Ll/emx0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/emx0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(I[BII)I
    .locals 10

    .line 1
    const/16 p0, -0x13

    .line 2
    .line 3
    const/16 v0, -0x10

    .line 4
    .line 5
    const/16 v1, -0x3e

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/16 v3, -0x60

    .line 9
    .line 10
    const/16 v4, -0x20

    .line 11
    .line 12
    const/16 v5, -0x41

    .line 13
    .line 14
    const/4 v6, -0x1

    .line 15
    if-eqz p1, :cond_e

    .line 16
    .line 17
    if-lt p3, p4, :cond_0

    .line 18
    .line 19
    return p1

    .line 20
    :cond_0
    int-to-byte v7, p1

    .line 21
    if-ge v7, v4, :cond_2

    .line 22
    .line 23
    if-lt v7, v1, :cond_1

    .line 24
    .line 25
    add-int/lit8 p1, p3, 0x1

    .line 26
    .line 27
    aget-byte p3, p2, p3

    .line 28
    .line 29
    if-gt p3, v5, :cond_1

    .line 30
    .line 31
    :goto_0
    move p3, p1

    .line 32
    goto/16 :goto_4

    .line 33
    .line 34
    :cond_1
    return v6

    .line 35
    :cond_2
    shr-int/lit8 v8, p1, 0x8

    .line 36
    .line 37
    not-int v8, v8

    .line 38
    if-ge v7, v0, :cond_8

    .line 39
    .line 40
    int-to-byte p1, v8

    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    add-int/lit8 p1, p3, 0x1

    .line 44
    .line 45
    aget-byte p3, p2, p3

    .line 46
    .line 47
    if-ge p1, p4, :cond_3

    .line 48
    .line 49
    move v9, p3

    .line 50
    move p3, p1

    .line 51
    move p1, v9

    .line 52
    goto :goto_1

    .line 53
    :cond_3
    invoke-static {v7, p3}, Lcom/google/android/gms/internal/ads/y5;->a(II)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0

    .line 58
    :cond_4
    :goto_1
    if-gt p1, v5, :cond_7

    .line 59
    .line 60
    if-ne v7, v4, :cond_5

    .line 61
    .line 62
    if-lt p1, v3, :cond_7

    .line 63
    .line 64
    :cond_5
    if-ne v7, p0, :cond_6

    .line 65
    .line 66
    if-ge p1, v3, :cond_7

    .line 67
    .line 68
    :cond_6
    add-int/lit8 p1, p3, 0x1

    .line 69
    .line 70
    aget-byte p3, p2, p3

    .line 71
    .line 72
    if-gt p3, v5, :cond_7

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_7
    return v6

    .line 76
    :cond_8
    int-to-byte v8, v8

    .line 77
    if-nez v8, :cond_a

    .line 78
    .line 79
    add-int/lit8 p1, p3, 0x1

    .line 80
    .line 81
    aget-byte v8, p2, p3

    .line 82
    .line 83
    if-ge p1, p4, :cond_9

    .line 84
    .line 85
    move p3, p1

    .line 86
    move p1, v2

    .line 87
    goto :goto_2

    .line 88
    :cond_9
    invoke-static {v7, v8}, Lcom/google/android/gms/internal/ads/y5;->a(II)I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    return p0

    .line 93
    :cond_a
    shr-int/lit8 p1, p1, 0x10

    .line 94
    .line 95
    :goto_2
    if-nez p1, :cond_c

    .line 96
    .line 97
    add-int/lit8 p1, p3, 0x1

    .line 98
    .line 99
    aget-byte p3, p2, p3

    .line 100
    .line 101
    if-ge p1, p4, :cond_b

    .line 102
    .line 103
    move v9, p3

    .line 104
    move p3, p1

    .line 105
    move p1, v9

    .line 106
    goto :goto_3

    .line 107
    :cond_b
    invoke-static {v7, v8, p3}, Lcom/google/android/gms/internal/ads/y5;->b(III)I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    return p0

    .line 112
    :cond_c
    :goto_3
    if-gt v8, v5, :cond_d

    .line 113
    .line 114
    shl-int/lit8 v7, v7, 0x1c

    .line 115
    .line 116
    add-int/lit8 v8, v8, 0x70

    .line 117
    .line 118
    add-int/2addr v7, v8

    .line 119
    shr-int/lit8 v7, v7, 0x1e

    .line 120
    .line 121
    if-nez v7, :cond_d

    .line 122
    .line 123
    if-gt p1, v5, :cond_d

    .line 124
    .line 125
    add-int/lit8 p1, p3, 0x1

    .line 126
    .line 127
    aget-byte p3, p2, p3

    .line 128
    .line 129
    if-gt p3, v5, :cond_d

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_d
    return v6

    .line 133
    :cond_e
    :goto_4
    if-ge p3, p4, :cond_f

    .line 134
    .line 135
    aget-byte p1, p2, p3

    .line 136
    .line 137
    if-ltz p1, :cond_f

    .line 138
    .line 139
    add-int/lit8 p3, p3, 0x1

    .line 140
    .line 141
    goto :goto_4

    .line 142
    :cond_f
    if-lt p3, p4, :cond_10

    .line 143
    .line 144
    return v2

    .line 145
    :cond_10
    :goto_5
    if-lt p3, p4, :cond_11

    .line 146
    .line 147
    return v2

    .line 148
    :cond_11
    add-int/lit8 p1, p3, 0x1

    .line 149
    .line 150
    aget-byte v7, p2, p3

    .line 151
    .line 152
    if-gez v7, :cond_1e

    .line 153
    .line 154
    if-ge v7, v4, :cond_14

    .line 155
    .line 156
    if-lt p1, p4, :cond_12

    .line 157
    .line 158
    return v7

    .line 159
    :cond_12
    if-lt v7, v1, :cond_13

    .line 160
    .line 161
    add-int/lit8 p3, p3, 0x2

    .line 162
    .line 163
    aget-byte p1, p2, p1

    .line 164
    .line 165
    if-le p1, v5, :cond_10

    .line 166
    .line 167
    :cond_13
    return v6

    .line 168
    :cond_14
    if-ge v7, v0, :cond_1b

    .line 169
    .line 170
    add-int/lit8 v8, p4, -0x1

    .line 171
    .line 172
    if-lt p1, v8, :cond_15

    .line 173
    .line 174
    invoke-static {p2, p1, p4}, Lcom/google/android/gms/internal/ads/y5;->c([BII)I

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    return p0

    .line 179
    :cond_15
    add-int/lit8 v8, p3, 0x2

    .line 180
    .line 181
    aget-byte p1, p2, p1

    .line 182
    .line 183
    if-gt p1, v5, :cond_1a

    .line 184
    .line 185
    if-ne v7, v4, :cond_17

    .line 186
    .line 187
    if-lt p1, v3, :cond_16

    .line 188
    .line 189
    goto :goto_6

    .line 190
    :cond_16
    return v6

    .line 191
    :cond_17
    :goto_6
    if-ne v7, p0, :cond_19

    .line 192
    .line 193
    if-ge p1, v3, :cond_18

    .line 194
    .line 195
    goto :goto_7

    .line 196
    :cond_18
    return v6

    .line 197
    :cond_19
    :goto_7
    add-int/lit8 p3, p3, 0x3

    .line 198
    .line 199
    aget-byte p1, p2, v8

    .line 200
    .line 201
    if-le p1, v5, :cond_10

    .line 202
    .line 203
    :cond_1a
    return v6

    .line 204
    :cond_1b
    add-int/lit8 v8, p4, -0x2

    .line 205
    .line 206
    if-lt p1, v8, :cond_1c

    .line 207
    .line 208
    invoke-static {p2, p1, p4}, Lcom/google/android/gms/internal/ads/y5;->c([BII)I

    .line 209
    .line 210
    .line 211
    move-result p0

    .line 212
    return p0

    .line 213
    :cond_1c
    add-int/lit8 v8, p3, 0x2

    .line 214
    .line 215
    aget-byte p1, p2, p1

    .line 216
    .line 217
    if-gt p1, v5, :cond_1d

    .line 218
    .line 219
    shl-int/lit8 v7, v7, 0x1c

    .line 220
    .line 221
    add-int/lit8 p1, p1, 0x70

    .line 222
    .line 223
    add-int/2addr v7, p1

    .line 224
    shr-int/lit8 p1, v7, 0x1e

    .line 225
    .line 226
    if-nez p1, :cond_1d

    .line 227
    .line 228
    add-int/lit8 p1, p3, 0x3

    .line 229
    .line 230
    aget-byte v7, p2, v8

    .line 231
    .line 232
    if-gt v7, v5, :cond_1d

    .line 233
    .line 234
    add-int/lit8 p3, p3, 0x4

    .line 235
    .line 236
    aget-byte p1, p2, p1

    .line 237
    .line 238
    if-le p1, v5, :cond_10

    .line 239
    .line 240
    :cond_1d
    return v6

    .line 241
    :cond_1e
    move p3, p1

    .line 242
    goto :goto_5
.end method

.method public final b([BII)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    array-length p0, p1

    .line 2
    sub-int v0, p0, p2

    .line 3
    .line 4
    or-int v1, p2, p3

    .line 5
    .line 6
    sub-int/2addr v0, p3

    .line 7
    or-int/2addr v0, v1

    .line 8
    if-ltz v0, :cond_9

    .line 9
    .line 10
    add-int p0, p2, p3

    .line 11
    .line 12
    new-array v4, p3, [C

    .line 13
    .line 14
    const/4 p3, 0x0

    .line 15
    move v0, p3

    .line 16
    :goto_0
    if-ge p2, p0, :cond_0

    .line 17
    .line 18
    aget-byte v1, p1, p2

    .line 19
    .line 20
    invoke-static {v1}, Ll/dmx0;->d(B)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    add-int/lit8 p2, p2, 0x1

    .line 27
    .line 28
    add-int/lit8 v2, v0, 0x1

    .line 29
    .line 30
    int-to-char v1, v1

    .line 31
    aput-char v1, v4, v0

    .line 32
    .line 33
    move v0, v2

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v5, v0

    .line 36
    :cond_1
    :goto_1
    if-ge p2, p0, :cond_8

    .line 37
    .line 38
    add-int/lit8 v0, p2, 0x1

    .line 39
    .line 40
    move v1, v0

    .line 41
    aget-byte v0, p1, p2

    .line 42
    .line 43
    invoke-static {v0}, Ll/dmx0;->d(B)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    add-int/lit8 p2, v5, 0x1

    .line 50
    .line 51
    int-to-char v0, v0

    .line 52
    aput-char v0, v4, v5

    .line 53
    .line 54
    move v5, p2

    .line 55
    move p2, v1

    .line 56
    :goto_2
    if-ge p2, p0, :cond_1

    .line 57
    .line 58
    aget-byte v0, p1, p2

    .line 59
    .line 60
    invoke-static {v0}, Ll/dmx0;->d(B)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    add-int/lit8 p2, p2, 0x1

    .line 67
    .line 68
    add-int/lit8 v1, v5, 0x1

    .line 69
    .line 70
    int-to-char v0, v0

    .line 71
    aput-char v0, v4, v5

    .line 72
    .line 73
    move v5, v1

    .line 74
    goto :goto_2

    .line 75
    :cond_2
    invoke-static {v0}, Ll/dmx0;->f(B)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_4

    .line 80
    .line 81
    if-ge v1, p0, :cond_3

    .line 82
    .line 83
    add-int/lit8 v2, v5, 0x1

    .line 84
    .line 85
    add-int/lit8 p2, p2, 0x2

    .line 86
    .line 87
    aget-byte v1, p1, v1

    .line 88
    .line 89
    invoke-static {v0, v1, v4, v5}, Ll/dmx0;->c(BB[CI)V

    .line 90
    .line 91
    .line 92
    :goto_3
    move v5, v2

    .line 93
    goto :goto_1

    .line 94
    :cond_3
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zzd()Lcom/google/android/gms/internal/ads/zzhag;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    throw p0

    .line 99
    :cond_4
    invoke-static {v0}, Ll/dmx0;->e(B)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_6

    .line 104
    .line 105
    add-int/lit8 v2, p0, -0x1

    .line 106
    .line 107
    if-ge v1, v2, :cond_5

    .line 108
    .line 109
    add-int/lit8 v2, v5, 0x1

    .line 110
    .line 111
    add-int/lit8 v3, p2, 0x2

    .line 112
    .line 113
    aget-byte v1, p1, v1

    .line 114
    .line 115
    add-int/lit8 p2, p2, 0x3

    .line 116
    .line 117
    aget-byte v3, p1, v3

    .line 118
    .line 119
    invoke-static {v0, v1, v3, v4, v5}, Ll/dmx0;->b(BBB[CI)V

    .line 120
    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zzd()Lcom/google/android/gms/internal/ads/zzhag;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    throw p0

    .line 128
    :cond_6
    add-int/lit8 v2, p0, -0x2

    .line 129
    .line 130
    if-ge v1, v2, :cond_7

    .line 131
    .line 132
    add-int/lit8 v2, p2, 0x2

    .line 133
    .line 134
    aget-byte v1, p1, v1

    .line 135
    .line 136
    add-int/lit8 v3, p2, 0x3

    .line 137
    .line 138
    aget-byte v2, p1, v2

    .line 139
    .line 140
    add-int/lit8 p2, p2, 0x4

    .line 141
    .line 142
    aget-byte v3, p1, v3

    .line 143
    .line 144
    invoke-static/range {v0 .. v5}, Ll/dmx0;->a(BBBB[CI)V

    .line 145
    .line 146
    .line 147
    add-int/lit8 v5, v5, 0x2

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_7
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zzd()Lcom/google/android/gms/internal/ads/zzhag;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    throw p0

    .line 155
    :cond_8
    new-instance p0, Ljava/lang/String;

    .line 156
    .line 157
    invoke-direct {p0, v4, p3, v5}, Ljava/lang/String;-><init>([CII)V

    .line 158
    .line 159
    .line 160
    return-object p0

    .line 161
    :cond_9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    const-string p1, "buffer length=%d, index=%d, size=%d"

    .line 178
    .line 179
    invoke-static {p1, p0}, Ll/zg3;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    const/4 p0, 0x0

    .line 183
    return-object p0
.end method
