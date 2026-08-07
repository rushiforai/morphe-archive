.class final Lcom/google/android/libraries/places/internal/zzbty;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final zza:[Ljava/lang/String;

.field private static final zzb:[Ljava/lang/String;

.field private static final zzc:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    const-string v8, "WINDOW_UPDATE"

    .line 2
    .line 3
    const-string v9, "CONTINUATION"

    .line 4
    .line 5
    const-string v0, "DATA"

    .line 6
    .line 7
    const-string v1, "HEADERS"

    .line 8
    .line 9
    const-string v2, "PRIORITY"

    .line 10
    .line 11
    const-string v3, "RST_STREAM"

    .line 12
    .line 13
    const-string v4, "SETTINGS"

    .line 14
    .line 15
    const-string v5, "PUSH_PROMISE"

    .line 16
    .line 17
    const-string v6, "PING"

    .line 18
    .line 19
    const-string v7, "GOAWAY"

    .line 20
    .line 21
    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbty;->zza:[Ljava/lang/String;

    .line 26
    .line 27
    const/16 v0, 0x40

    .line 28
    .line 29
    new-array v1, v0, [Ljava/lang/String;

    .line 30
    .line 31
    sput-object v1, Lcom/google/android/libraries/places/internal/zzbty;->zzb:[Ljava/lang/String;

    .line 32
    .line 33
    const/16 v1, 0x100

    .line 34
    .line 35
    new-array v2, v1, [Ljava/lang/String;

    .line 36
    .line 37
    sput-object v2, Lcom/google/android/libraries/places/internal/zzbty;->zzc:[Ljava/lang/String;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    move v3, v2

    .line 41
    :goto_0
    const/16 v4, 0x20

    .line 42
    .line 43
    if-ge v3, v1, :cond_0

    .line 44
    .line 45
    invoke-static {v3}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    const-string v6, "%8s"

    .line 54
    .line 55
    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    const/16 v6, 0x30

    .line 60
    .line 61
    invoke-virtual {v5, v4, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    sget-object v5, Lcom/google/android/libraries/places/internal/zzbty;->zzc:[Ljava/lang/String;

    .line 66
    .line 67
    aput-object v4, v5, v3

    .line 68
    .line 69
    add-int/lit8 v3, v3, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbty;->zzb:[Ljava/lang/String;

    .line 73
    .line 74
    const-string v3, ""

    .line 75
    .line 76
    aput-object v3, v1, v2

    .line 77
    .line 78
    const-string v3, "END_STREAM"

    .line 79
    .line 80
    const/4 v5, 0x1

    .line 81
    aput-object v3, v1, v5

    .line 82
    .line 83
    filled-new-array {v5}, [I

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    const-string v5, "PADDED"

    .line 88
    .line 89
    const/16 v6, 0x8

    .line 90
    .line 91
    aput-object v5, v1, v6

    .line 92
    .line 93
    move v1, v2

    .line 94
    :goto_1
    const-string v5, "|PADDED"

    .line 95
    .line 96
    if-gtz v1, :cond_1

    .line 97
    .line 98
    aget v7, v3, v1

    .line 99
    .line 100
    or-int/lit8 v8, v7, 0x8

    .line 101
    .line 102
    sget-object v9, Lcom/google/android/libraries/places/internal/zzbty;->zzb:[Ljava/lang/String;

    .line 103
    .line 104
    aget-object v7, v9, v7

    .line 105
    .line 106
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v7

    .line 110
    invoke-virtual {v7, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    aput-object v5, v9, v8

    .line 115
    .line 116
    add-int/lit8 v1, v1, 0x1

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_1
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbty;->zzb:[Ljava/lang/String;

    .line 120
    .line 121
    const/4 v7, 0x4

    .line 122
    const-string v8, "END_HEADERS"

    .line 123
    .line 124
    aput-object v8, v1, v7

    .line 125
    .line 126
    const-string v8, "PRIORITY"

    .line 127
    .line 128
    aput-object v8, v1, v4

    .line 129
    .line 130
    const-string v8, "END_HEADERS|PRIORITY"

    .line 131
    .line 132
    const/16 v9, 0x24

    .line 133
    .line 134
    aput-object v8, v1, v9

    .line 135
    .line 136
    filled-new-array {v7, v4, v9}, [I

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    move v4, v2

    .line 141
    :goto_2
    const/4 v7, 0x3

    .line 142
    if-ge v4, v7, :cond_3

    .line 143
    .line 144
    aget v7, v1, v4

    .line 145
    .line 146
    move v8, v2

    .line 147
    :goto_3
    if-gtz v8, :cond_2

    .line 148
    .line 149
    aget v9, v3, v8

    .line 150
    .line 151
    or-int v10, v9, v7

    .line 152
    .line 153
    sget-object v11, Lcom/google/android/libraries/places/internal/zzbty;->zzb:[Ljava/lang/String;

    .line 154
    .line 155
    aget-object v12, v11, v9

    .line 156
    .line 157
    aget-object v13, v11, v7

    .line 158
    .line 159
    new-instance v14, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v12, "|"

    .line 168
    .line 169
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v13

    .line 179
    aput-object v13, v11, v10

    .line 180
    .line 181
    or-int/2addr v10, v6

    .line 182
    aget-object v9, v11, v9

    .line 183
    .line 184
    aget-object v13, v11, v7

    .line 185
    .line 186
    new-instance v14, Ljava/lang/StringBuilder;

    .line 187
    .line 188
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v9

    .line 207
    aput-object v9, v11, v10

    .line 208
    .line 209
    add-int/lit8 v8, v8, 0x1

    .line 210
    .line 211
    goto :goto_3

    .line 212
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 213
    .line 214
    goto :goto_2

    .line 215
    :cond_3
    :goto_4
    if-ge v2, v0, :cond_5

    .line 216
    .line 217
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbty;->zzb:[Ljava/lang/String;

    .line 218
    .line 219
    aget-object v3, v1, v2

    .line 220
    .line 221
    if-nez v3, :cond_4

    .line 222
    .line 223
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbty;->zzc:[Ljava/lang/String;

    .line 224
    .line 225
    aget-object v3, v3, v2

    .line 226
    .line 227
    aput-object v3, v1, v2

    .line 228
    .line 229
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 230
    .line 231
    goto :goto_4

    .line 232
    :cond_5
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static zza(ZIIBB)Ljava/lang/String;
    .locals 5

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    if-ge p3, v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbty;->zza:[Ljava/lang/String;

    .line 6
    .line 7
    aget-object v0, v0, p3

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {p3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "0x%02x"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    const/4 v1, 0x1

    .line 25
    if-nez p4, :cond_1

    .line 26
    .line 27
    const-string p3, ""

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_1
    const/4 v2, 0x2

    .line 31
    if-eq p3, v2, :cond_7

    .line 32
    .line 33
    const/4 v2, 0x3

    .line 34
    if-eq p3, v2, :cond_7

    .line 35
    .line 36
    const/4 v2, 0x4

    .line 37
    if-eq p3, v2, :cond_5

    .line 38
    .line 39
    const/4 v3, 0x6

    .line 40
    if-eq p3, v3, :cond_5

    .line 41
    .line 42
    const/4 v3, 0x7

    .line 43
    if-eq p3, v3, :cond_7

    .line 44
    .line 45
    const/16 v3, 0x8

    .line 46
    .line 47
    if-eq p3, v3, :cond_7

    .line 48
    .line 49
    const/16 v3, 0x40

    .line 50
    .line 51
    if-ge p4, v3, :cond_2

    .line 52
    .line 53
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbty;->zzb:[Ljava/lang/String;

    .line 54
    .line 55
    aget-object v3, v3, p4

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbty;->zzc:[Ljava/lang/String;

    .line 59
    .line 60
    aget-object v3, v3, p4

    .line 61
    .line 62
    :goto_1
    const/4 v4, 0x5

    .line 63
    if-ne p3, v4, :cond_3

    .line 64
    .line 65
    and-int/lit8 p3, p4, 0x4

    .line 66
    .line 67
    if-eqz p3, :cond_4

    .line 68
    .line 69
    const-string p3, "HEADERS"

    .line 70
    .line 71
    const-string p4, "PUSH_PROMISE"

    .line 72
    .line 73
    invoke-virtual {v3, p3, p4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    goto :goto_2

    .line 78
    :cond_3
    if-nez p3, :cond_4

    .line 79
    .line 80
    and-int/lit8 p3, p4, 0x20

    .line 81
    .line 82
    if-eqz p3, :cond_4

    .line 83
    .line 84
    const-string p3, "PRIORITY"

    .line 85
    .line 86
    const-string p4, "COMPRESSED"

    .line 87
    .line 88
    invoke-virtual {v3, p3, p4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    goto :goto_2

    .line 93
    :cond_4
    move-object p3, v3

    .line 94
    goto :goto_2

    .line 95
    :cond_5
    if-ne p4, v1, :cond_6

    .line 96
    .line 97
    const-string p3, "ACK"

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_6
    sget-object p3, Lcom/google/android/libraries/places/internal/zzbty;->zzc:[Ljava/lang/String;

    .line 101
    .line 102
    aget-object p3, p3, p4

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_7
    sget-object p3, Lcom/google/android/libraries/places/internal/zzbty;->zzc:[Ljava/lang/String;

    .line 106
    .line 107
    aget-object p3, p3, p4

    .line 108
    .line 109
    :goto_2
    sget-object p4, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 110
    .line 111
    if-eq v1, p0, :cond_8

    .line 112
    .line 113
    const-string p0, ">>"

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_8
    const-string p0, "<<"

    .line 117
    .line 118
    :goto_3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    filled-new-array {p0, p1, p2, v0, p3}, [Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const-string p1, "%s 0x%08x %5d %-13s %s"

    .line 131
    .line 132
    invoke-static {p4, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    return-object p0
.end method
