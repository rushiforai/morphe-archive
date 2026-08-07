.class public final Lcom/google/android/libraries/places/internal/zzbug;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field zza:Ljava/lang/String;

.field zzb:Ljava/lang/String;

.field zzc:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbug;->zzc:I

    return-void
.end method

.method private static zzf(Ljava/lang/String;II)Ljava/net/InetAddress;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    const/16 v2, 0x10

    .line 6
    .line 7
    new-array v3, v2, [B

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    const/4 v5, -0x1

    .line 11
    const/4 v6, 0x0

    .line 12
    move v7, v4

    .line 13
    move v9, v5

    .line 14
    move v10, v9

    .line 15
    move v8, v6

    .line 16
    :goto_0
    const/4 v11, 0x0

    .line 17
    if-ge v7, v1, :cond_2

    .line 18
    .line 19
    if-ne v8, v2, :cond_0

    .line 20
    .line 21
    return-object v11

    .line 22
    :cond_0
    add-int/lit8 v12, v7, 0x2

    .line 23
    .line 24
    const/16 v13, 0xff

    .line 25
    .line 26
    const/4 v14, 0x2

    .line 27
    if-gt v12, v1, :cond_4

    .line 28
    .line 29
    const-string v15, "::"

    .line 30
    .line 31
    invoke-virtual {v0, v7, v15, v6, v14}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    .line 32
    .line 33
    .line 34
    move-result v15

    .line 35
    if-eqz v15, :cond_4

    .line 36
    .line 37
    if-eq v9, v5, :cond_1

    .line 38
    .line 39
    return-object v11

    .line 40
    :cond_1
    add-int/lit8 v8, v8, 0x2

    .line 41
    .line 42
    if-ne v12, v1, :cond_3

    .line 43
    .line 44
    move v9, v8

    .line 45
    :cond_2
    move-object/from16 p1, v11

    .line 46
    .line 47
    goto/16 :goto_9

    .line 48
    .line 49
    :cond_3
    move v9, v8

    .line 50
    move-object/from16 p1, v11

    .line 51
    .line 52
    move v10, v12

    .line 53
    goto/16 :goto_5

    .line 54
    .line 55
    :cond_4
    if-eqz v8, :cond_10

    .line 56
    .line 57
    const-string v12, ":"

    .line 58
    .line 59
    invoke-virtual {v0, v7, v12, v6, v4}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    .line 60
    .line 61
    .line 62
    move-result v12

    .line 63
    if-eqz v12, :cond_5

    .line 64
    .line 65
    add-int/lit8 v7, v7, 0x1

    .line 66
    .line 67
    move v10, v7

    .line 68
    move-object/from16 p1, v11

    .line 69
    .line 70
    goto/16 :goto_5

    .line 71
    .line 72
    :cond_5
    const-string v12, "."

    .line 73
    .line 74
    invoke-virtual {v0, v7, v12, v6, v4}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-eqz v4, :cond_f

    .line 79
    .line 80
    add-int/lit8 v4, v8, -0x2

    .line 81
    .line 82
    move v7, v4

    .line 83
    :goto_1
    if-ge v10, v1, :cond_d

    .line 84
    .line 85
    if-ne v7, v2, :cond_7

    .line 86
    .line 87
    :cond_6
    move-object/from16 p1, v11

    .line 88
    .line 89
    goto :goto_4

    .line 90
    :cond_7
    if-eq v7, v4, :cond_8

    .line 91
    .line 92
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    .line 93
    .line 94
    .line 95
    move-result v12

    .line 96
    const/16 v14, 0x2e

    .line 97
    .line 98
    if-ne v12, v14, :cond_6

    .line 99
    .line 100
    add-int/lit8 v10, v10, 0x1

    .line 101
    .line 102
    :cond_8
    move v14, v6

    .line 103
    move v12, v10

    .line 104
    :goto_2
    if-ge v12, v1, :cond_b

    .line 105
    .line 106
    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    .line 107
    .line 108
    .line 109
    move-result v15

    .line 110
    move-object/from16 p1, v11

    .line 111
    .line 112
    const/16 v11, 0x30

    .line 113
    .line 114
    if-lt v15, v11, :cond_c

    .line 115
    .line 116
    const/16 v11, 0x39

    .line 117
    .line 118
    if-le v15, v11, :cond_9

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_9
    if-nez v14, :cond_a

    .line 122
    .line 123
    if-ne v10, v12, :cond_e

    .line 124
    .line 125
    move v14, v6

    .line 126
    :cond_a
    mul-int/lit8 v14, v14, 0xa

    .line 127
    .line 128
    add-int/2addr v14, v15

    .line 129
    add-int/lit8 v14, v14, -0x30

    .line 130
    .line 131
    if-gt v14, v13, :cond_e

    .line 132
    .line 133
    add-int/lit8 v12, v12, 0x1

    .line 134
    .line 135
    move-object/from16 v11, p1

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_b
    move-object/from16 p1, v11

    .line 139
    .line 140
    :cond_c
    :goto_3
    sub-int v10, v12, v10

    .line 141
    .line 142
    if-eqz v10, :cond_e

    .line 143
    .line 144
    add-int/lit8 v10, v7, 0x1

    .line 145
    .line 146
    int-to-byte v11, v14

    .line 147
    aput-byte v11, v3, v7

    .line 148
    .line 149
    move-object/from16 v11, p1

    .line 150
    .line 151
    move v7, v10

    .line 152
    move v10, v12

    .line 153
    goto :goto_1

    .line 154
    :cond_d
    move-object/from16 p1, v11

    .line 155
    .line 156
    add-int/lit8 v0, v8, 0x2

    .line 157
    .line 158
    if-ne v7, v0, :cond_e

    .line 159
    .line 160
    add-int/lit8 v8, v8, 0x2

    .line 161
    .line 162
    goto :goto_9

    .line 163
    :cond_e
    :goto_4
    return-object p1

    .line 164
    :cond_f
    move-object/from16 p1, v11

    .line 165
    .line 166
    return-object p1

    .line 167
    :cond_10
    move-object/from16 p1, v11

    .line 168
    .line 169
    move v10, v7

    .line 170
    :goto_5
    move v11, v6

    .line 171
    move v7, v10

    .line 172
    :goto_6
    if-ge v7, v1, :cond_12

    .line 173
    .line 174
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    .line 175
    .line 176
    .line 177
    move-result v12

    .line 178
    invoke-static {v12}, Lcom/google/android/libraries/places/internal/zzbui;->zza(C)I

    .line 179
    .line 180
    .line 181
    move-result v12

    .line 182
    if-ne v12, v5, :cond_11

    .line 183
    .line 184
    goto :goto_7

    .line 185
    :cond_11
    shl-int/lit8 v11, v11, 0x4

    .line 186
    .line 187
    add-int/lit8 v7, v7, 0x1

    .line 188
    .line 189
    add-int/2addr v11, v12

    .line 190
    goto :goto_6

    .line 191
    :cond_12
    :goto_7
    sub-int v12, v7, v10

    .line 192
    .line 193
    if-eqz v12, :cond_14

    .line 194
    .line 195
    const/4 v15, 0x4

    .line 196
    if-le v12, v15, :cond_13

    .line 197
    .line 198
    goto :goto_8

    .line 199
    :cond_13
    add-int/lit8 v12, v8, 0x1

    .line 200
    .line 201
    ushr-int/lit8 v15, v11, 0x8

    .line 202
    .line 203
    and-int/2addr v13, v15

    .line 204
    int-to-byte v13, v13

    .line 205
    aput-byte v13, v3, v8

    .line 206
    .line 207
    add-int/2addr v8, v14

    .line 208
    and-int/lit16 v11, v11, 0xff

    .line 209
    .line 210
    int-to-byte v11, v11

    .line 211
    aput-byte v11, v3, v12

    .line 212
    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :cond_14
    :goto_8
    return-object p1

    .line 216
    :goto_9
    if-eq v8, v2, :cond_16

    .line 217
    .line 218
    if-ne v9, v5, :cond_15

    .line 219
    .line 220
    return-object p1

    .line 221
    :cond_15
    sub-int v0, v8, v9

    .line 222
    .line 223
    rsub-int/lit8 v1, v0, 0x10

    .line 224
    .line 225
    invoke-static {v3, v9, v3, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 226
    .line 227
    .line 228
    sub-int/2addr v2, v8

    .line 229
    add-int/2addr v2, v9

    .line 230
    invoke-static {v3, v9, v2, v6}, Ljava/util/Arrays;->fill([BIIB)V

    .line 231
    .line 232
    .line 233
    :cond_16
    :try_start_0
    invoke-static {v3}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    .line 234
    .line 235
    .line 236
    move-result-object v0
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    .line 237
    return-object v0

    .line 238
    :catch_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 239
    .line 240
    .line 241
    return-object p1
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbug;->zza:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "://"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbug;->zzb:Ljava/lang/String;

    .line 17
    .line 18
    const/16 v2, 0x3a

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v3, -0x1

    .line 25
    if-eq v1, v3, :cond_0

    .line 26
    .line 27
    const/16 v1, 0x5b

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbug;->zzb:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const/16 v1, 0x5d

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbug;->zzb:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbug;->zza()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbug;->zza:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbui;->zzb(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eq v1, p0, :cond_1

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public final zza()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbug;->zzc:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbug;->zza:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbui;->zzb(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbug;
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_16

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    const/4 v4, -0x1

    .line 11
    if-ge v2, v3, :cond_4

    .line 12
    .line 13
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    const/16 v6, 0x25

    .line 18
    .line 19
    if-eq v5, v6, :cond_0

    .line 20
    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v5, Lcom/google/android/libraries/places/internal/zzbwb;

    .line 25
    .line 26
    invoke-direct {v5}, Lcom/google/android/libraries/places/internal/zzbwb;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v5, p1, v1, v2}, Lcom/google/android/libraries/places/internal/zzbwb;->zzt(Ljava/lang/String;II)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 30
    .line 31
    .line 32
    :goto_1
    if-ge v2, v3, :cond_3

    .line 33
    .line 34
    invoke-virtual {p1, v2}, Ljava/lang/String;->codePointAt(I)I

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    if-ne v7, v6, :cond_2

    .line 39
    .line 40
    add-int/lit8 v7, v2, 0x2

    .line 41
    .line 42
    if-ge v7, v3, :cond_1

    .line 43
    .line 44
    add-int/lit8 v8, v2, 0x1

    .line 45
    .line 46
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzbui;->zza(C)I

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    .line 55
    .line 56
    .line 57
    move-result v9

    .line 58
    invoke-static {v9}, Lcom/google/android/libraries/places/internal/zzbui;->zza(C)I

    .line 59
    .line 60
    .line 61
    move-result v9

    .line 62
    if-eq v8, v4, :cond_1

    .line 63
    .line 64
    if-eq v9, v4, :cond_1

    .line 65
    .line 66
    shl-int/lit8 v2, v8, 0x4

    .line 67
    .line 68
    add-int/2addr v2, v9

    .line 69
    invoke-virtual {v5, v2}, Lcom/google/android/libraries/places/internal/zzbwb;->zzm(I)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 70
    .line 71
    .line 72
    move v2, v7

    .line 73
    move v7, v6

    .line 74
    goto :goto_2

    .line 75
    :cond_1
    move v7, v6

    .line 76
    :cond_2
    invoke-virtual {v5, v7}, Lcom/google/android/libraries/places/internal/zzbwb;->zzu(I)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 77
    .line 78
    .line 79
    :goto_2
    invoke-static {v7}, Ljava/lang/Character;->charCount(I)I

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    add-int/2addr v2, v7

    .line 84
    goto :goto_1

    .line 85
    :cond_3
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzbwb;->zzi()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    goto :goto_3

    .line 90
    :cond_4
    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    :goto_3
    const-string v3, "["

    .line 95
    .line 96
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    if-eqz v3, :cond_10

    .line 101
    .line 102
    const-string v3, "]"

    .line 103
    .line 104
    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_10

    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    add-int/2addr v3, v4

    .line 115
    const/4 v5, 0x1

    .line 116
    invoke-static {v2, v5, v3}, Lcom/google/android/libraries/places/internal/zzbug;->zzf(Ljava/lang/String;II)Ljava/net/InetAddress;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    if-nez v2, :cond_6

    .line 121
    .line 122
    :catch_0
    :cond_5
    :goto_4
    move-object v1, v0

    .line 123
    goto/16 :goto_a

    .line 124
    .line 125
    :cond_6
    invoke-virtual {v2}, Ljava/net/InetAddress;->getAddress()[B

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    array-length v3, v2

    .line 130
    const/16 v5, 0x10

    .line 131
    .line 132
    if-ne v3, v5, :cond_f

    .line 133
    .line 134
    move v3, v1

    .line 135
    move v6, v3

    .line 136
    :goto_5
    array-length v7, v2

    .line 137
    if-ge v3, v7, :cond_a

    .line 138
    .line 139
    move v7, v3

    .line 140
    :goto_6
    if-ge v7, v5, :cond_7

    .line 141
    .line 142
    aget-byte v8, v2, v7

    .line 143
    .line 144
    if-nez v8, :cond_7

    .line 145
    .line 146
    add-int/lit8 v8, v7, 0x1

    .line 147
    .line 148
    aget-byte v8, v2, v8

    .line 149
    .line 150
    if-nez v8, :cond_7

    .line 151
    .line 152
    add-int/lit8 v7, v7, 0x2

    .line 153
    .line 154
    goto :goto_6

    .line 155
    :cond_7
    sub-int v8, v7, v3

    .line 156
    .line 157
    if-le v8, v6, :cond_8

    .line 158
    .line 159
    move v9, v8

    .line 160
    goto :goto_7

    .line 161
    :cond_8
    move v9, v6

    .line 162
    :goto_7
    if-le v8, v6, :cond_9

    .line 163
    .line 164
    move v4, v3

    .line 165
    :cond_9
    add-int/lit8 v3, v7, 0x2

    .line 166
    .line 167
    move v6, v9

    .line 168
    goto :goto_5

    .line 169
    :cond_a
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbwb;

    .line 170
    .line 171
    invoke-direct {v3}, Lcom/google/android/libraries/places/internal/zzbwb;-><init>()V

    .line 172
    .line 173
    .line 174
    :cond_b
    :goto_8
    array-length v7, v2

    .line 175
    if-ge v1, v7, :cond_e

    .line 176
    .line 177
    const/16 v7, 0x3a

    .line 178
    .line 179
    if-ne v1, v4, :cond_c

    .line 180
    .line 181
    invoke-virtual {v3, v7}, Lcom/google/android/libraries/places/internal/zzbwb;->zzm(I)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 182
    .line 183
    .line 184
    add-int/2addr v1, v6

    .line 185
    if-ne v1, v5, :cond_b

    .line 186
    .line 187
    invoke-virtual {v3, v7}, Lcom/google/android/libraries/places/internal/zzbwb;->zzm(I)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 188
    .line 189
    .line 190
    goto :goto_8

    .line 191
    :cond_c
    if-lez v1, :cond_d

    .line 192
    .line 193
    invoke-virtual {v3, v7}, Lcom/google/android/libraries/places/internal/zzbwb;->zzm(I)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 194
    .line 195
    .line 196
    :cond_d
    aget-byte v7, v2, v1

    .line 197
    .line 198
    and-int/lit16 v7, v7, 0xff

    .line 199
    .line 200
    add-int/lit8 v8, v1, 0x1

    .line 201
    .line 202
    aget-byte v8, v2, v8

    .line 203
    .line 204
    shl-int/lit8 v7, v7, 0x8

    .line 205
    .line 206
    and-int/lit16 v8, v8, 0xff

    .line 207
    .line 208
    or-int/2addr v7, v8

    .line 209
    int-to-long v7, v7

    .line 210
    invoke-virtual {v3, v7, v8}, Lcom/google/android/libraries/places/internal/zzbwb;->zzo(J)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 211
    .line 212
    .line 213
    add-int/lit8 v1, v1, 0x2

    .line 214
    .line 215
    goto :goto_8

    .line 216
    :cond_e
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbwb;->zzi()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    goto :goto_a

    .line 221
    :cond_f
    invoke-static {}, Ll/aqg0;->a()V

    .line 222
    .line 223
    .line 224
    return-object v0

    .line 225
    :cond_10
    :try_start_0
    invoke-static {v2}, Ljava/net/IDN;->toASCII(Ljava/lang/String;)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 230
    .line 231
    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    if-eqz v3, :cond_11

    .line 240
    .line 241
    goto :goto_4

    .line 242
    :cond_11
    :goto_9
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 243
    .line 244
    .line 245
    move-result v3

    .line 246
    if-ge v1, v3, :cond_14

    .line 247
    .line 248
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    .line 249
    .line 250
    .line 251
    move-result v3

    .line 252
    const/16 v5, 0x1f

    .line 253
    .line 254
    if-le v3, v5, :cond_5

    .line 255
    .line 256
    const/16 v5, 0x7f

    .line 257
    .line 258
    if-lt v3, v5, :cond_12

    .line 259
    .line 260
    goto/16 :goto_4

    .line 261
    .line 262
    :cond_12
    const-string v5, " #%/:?@[\\]"

    .line 263
    .line 264
    invoke-virtual {v5, v3}, Ljava/lang/String;->indexOf(I)I

    .line 265
    .line 266
    .line 267
    move-result v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 268
    if-eq v3, v4, :cond_13

    .line 269
    .line 270
    goto/16 :goto_4

    .line 271
    .line 272
    :cond_13
    add-int/lit8 v1, v1, 0x1

    .line 273
    .line 274
    goto :goto_9

    .line 275
    :cond_14
    move-object v1, v2

    .line 276
    :goto_a
    if-eqz v1, :cond_15

    .line 277
    .line 278
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbug;->zzb:Ljava/lang/String;

    .line 279
    .line 280
    return-object p0

    .line 281
    :cond_15
    const-string p0, "unexpected host: "

    .line 282
    .line 283
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object p0

    .line 287
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    return-object v0

    .line 291
    :cond_16
    const-string p0, "host == null"

    .line 292
    .line 293
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    return-object v0
.end method

.method public final zzc(I)Lcom/google/android/libraries/places/internal/zzbug;
    .locals 1

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    const v0, 0xffff

    .line 4
    .line 5
    .line 6
    if-gt p1, v0, :cond_0

    .line 7
    .line 8
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbug;->zzc:I

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "unexpected port: "

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public final zzd(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbug;
    .locals 0

    .line 1
    const-string p1, "https"

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbug;->zza:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public final zze()Lcom/google/android/libraries/places/internal/zzbui;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbug;->zza:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbug;->zzb:Ljava/lang/String;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbui;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {v0, p0, v1}, Lcom/google/android/libraries/places/internal/zzbui;-><init>(Lcom/google/android/libraries/places/internal/zzbug;Lcom/google/android/libraries/places/internal/zzbuh;)V

    .line 13
    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    const-string p0, "host == null"

    .line 17
    .line 18
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    const/4 p0, 0x0

    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "scheme == null"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0
.end method
