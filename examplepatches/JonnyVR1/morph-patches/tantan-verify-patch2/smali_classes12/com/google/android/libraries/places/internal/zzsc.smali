.class public final Lcom/google/android/libraries/places/internal/zzsc;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic zza:I

.field private static final zzb:Lcom/google/android/libraries/places/internal/zzob;

.field private static final zzc:Lcom/google/android/libraries/places/internal/zzob;

.field private static final zzd:Lcom/google/android/libraries/places/internal/zzob;


# direct methods
.method static constructor <clinit>()V
    .locals 32

    .line 1
    const-string v0, "mailto"

    .line 2
    .line 3
    const-string v1, "ftp"

    .line 4
    .line 5
    const-string v2, "http"

    .line 6
    .line 7
    const-string v3, "https"

    .line 8
    .line 9
    invoke-static {v2, v3, v0, v1}, Lcom/google/android/libraries/places/internal/zzob;->zzn(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzob;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/google/android/libraries/places/internal/zzsc;->zzb:Lcom/google/android/libraries/places/internal/zzob;

    .line 14
    .line 15
    const-string v23, "video/x-matroska"

    .line 16
    .line 17
    const-string v24, "font/ttf"

    .line 18
    .line 19
    const-string v1, "audio/mpeg"

    .line 20
    .line 21
    const-string v2, "audio/oga"

    .line 22
    .line 23
    const-string v3, "audio/ogg"

    .line 24
    .line 25
    const-string v4, "audio/opus"

    .line 26
    .line 27
    const-string v5, "audio/x-m4a"

    .line 28
    .line 29
    const-string v6, "audio/x-matroska"

    .line 30
    .line 31
    const-string v7, "audio/x-wav"

    .line 32
    .line 33
    const-string v8, "audio/wav"

    .line 34
    .line 35
    const-string v9, "audio/webm"

    .line 36
    .line 37
    const-string v10, "image/bmp"

    .line 38
    .line 39
    const-string v11, "image/gif"

    .line 40
    .line 41
    const-string v12, "image/jpeg"

    .line 42
    .line 43
    const-string v13, "image/jpg"

    .line 44
    .line 45
    const-string v14, "image/png"

    .line 46
    .line 47
    const-string v15, "image/svg+xml"

    .line 48
    .line 49
    const-string v16, "image/tiff"

    .line 50
    .line 51
    const-string v17, "image/webp"

    .line 52
    .line 53
    const-string v18, "image/x-icon"

    .line 54
    .line 55
    const-string v19, "video/mpeg"

    .line 56
    .line 57
    const-string v20, "video/mp4"

    .line 58
    .line 59
    const-string v21, "video/ogg"

    .line 60
    .line 61
    const-string v22, "video/webm"

    .line 62
    .line 63
    filled-new-array/range {v1 .. v24}, [Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v31

    .line 67
    const-string v29, "audio/mp3"

    .line 68
    .line 69
    const-string v30, "audio/mp4"

    .line 70
    .line 71
    const-string v25, "audio/3gpp2"

    .line 72
    .line 73
    const-string v26, "audio/3gpp"

    .line 74
    .line 75
    const-string v27, "audio/aac"

    .line 76
    .line 77
    const-string v28, "audio/midi"

    .line 78
    .line 79
    invoke-static/range {v25 .. v31}, Lcom/google/android/libraries/places/internal/zzob;->zzp(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzob;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sput-object v0, Lcom/google/android/libraries/places/internal/zzsc;->zzc:Lcom/google/android/libraries/places/internal/zzob;

    .line 84
    .line 85
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzob;->zzk()Lcom/google/android/libraries/places/internal/zzob;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sput-object v0, Lcom/google/android/libraries/places/internal/zzsc;->zzd:Lcom/google/android/libraries/places/internal/zzob;

    .line 90
    .line 91
    return-void
.end method

.method public static zza(Ljava/lang/String;Lcom/google/android/libraries/places/internal/zzsb;)Lcom/google/android/libraries/places/internal/zzsb;
    .locals 7

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzsc;->zzd:Lcom/google/android/libraries/places/internal/zzob;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzlu;->zza(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget-object v2, Lcom/google/android/libraries/places/internal/zzsc;->zzb:Lcom/google/android/libraries/places/internal/zzob;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzob;->zze()Lcom/google/android/libraries/places/internal/zzox;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const-string v4, ":"

    .line 18
    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    goto/16 :goto_6

    .line 42
    .line 43
    :cond_1
    const-string v2, "data:"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    const/16 v5, 0x2f

    .line 50
    .line 51
    if-eqz v3, :cond_a

    .line 52
    .line 53
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzlu;->zza(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_2

    .line 62
    .line 63
    goto/16 :goto_5

    .line 64
    .line 65
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    const/4 v2, 0x5

    .line 70
    if-le v1, v2, :cond_d

    .line 71
    .line 72
    move v1, v2

    .line 73
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-ge v1, v3, :cond_4

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    const/16 v4, 0x3b

    .line 84
    .line 85
    if-eq v3, v4, :cond_4

    .line 86
    .line 87
    const/16 v4, 0x2c

    .line 88
    .line 89
    if-ne v3, v4, :cond_3

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_4
    :goto_1
    sget-object v3, Lcom/google/android/libraries/places/internal/zzsc;->zzc:Lcom/google/android/libraries/places/internal/zzob;

    .line 96
    .line 97
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v3, v2}, Lcom/google/android/libraries/places/internal/zznt;->contains(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-eqz v2, :cond_d

    .line 106
    .line 107
    const-string v2, ";base64,"

    .line 108
    .line 109
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_d

    .line 114
    .line 115
    add-int/lit8 v1, v1, 0x8

    .line 116
    .line 117
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    if-ge v1, v2, :cond_d

    .line 122
    .line 123
    :goto_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    const/16 v3, 0x3d

    .line 128
    .line 129
    if-ge v1, v2, :cond_9

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    if-ne v2, v3, :cond_5

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_5
    const/16 v3, 0x61

    .line 139
    .line 140
    if-lt v2, v3, :cond_6

    .line 141
    .line 142
    const/16 v3, 0x7a

    .line 143
    .line 144
    if-le v2, v3, :cond_8

    .line 145
    .line 146
    :cond_6
    const/16 v3, 0x30

    .line 147
    .line 148
    if-lt v2, v3, :cond_7

    .line 149
    .line 150
    const/16 v3, 0x39

    .line 151
    .line 152
    if-le v2, v3, :cond_8

    .line 153
    .line 154
    :cond_7
    const/16 v3, 0x2b

    .line 155
    .line 156
    if-eq v2, v3, :cond_8

    .line 157
    .line 158
    if-ne v2, v5, :cond_d

    .line 159
    .line 160
    :cond_8
    add-int/lit8 v1, v1, 0x1

    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_9
    :goto_3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    if-ge v1, v2, :cond_e

    .line 168
    .line 169
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    if-ne v2, v3, :cond_d

    .line 174
    .line 175
    add-int/lit8 v1, v1, 0x1

    .line 176
    .line 177
    goto :goto_3

    .line 178
    :cond_a
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    :cond_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    if-eqz v2, :cond_c

    .line 187
    .line 188
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    check-cast v2, Lcom/google/android/libraries/places/internal/zzry;

    .line 193
    .line 194
    invoke-virtual {v2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzlu;->zza(Ljava/lang/String;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    const/16 v3, 0x5f

    .line 203
    .line 204
    const/16 v6, 0x2d

    .line 205
    .line 206
    invoke-virtual {v2, v3, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-virtual {v2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    if-eqz v2, :cond_b

    .line 223
    .line 224
    goto :goto_6

    .line 225
    :cond_c
    const/4 v0, 0x0

    .line 226
    :goto_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    if-ge v0, v1, :cond_e

    .line 231
    .line 232
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    const/16 v2, 0x23

    .line 237
    .line 238
    if-eq v1, v2, :cond_e

    .line 239
    .line 240
    if-eq v1, v5, :cond_e

    .line 241
    .line 242
    const/16 v2, 0x3a

    .line 243
    .line 244
    if-eq v1, v2, :cond_d

    .line 245
    .line 246
    const/16 v2, 0x3f

    .line 247
    .line 248
    if-eq v1, v2, :cond_e

    .line 249
    .line 250
    add-int/lit8 v0, v0, 0x1

    .line 251
    .line 252
    goto :goto_4

    .line 253
    :cond_d
    :goto_5
    return-object p1

    .line 254
    :cond_e
    :goto_6
    new-instance p1, Lcom/google/android/libraries/places/internal/zzsb;

    .line 255
    .line 256
    invoke-direct {p1, p0}, Lcom/google/android/libraries/places/internal/zzsb;-><init>(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    return-object p1
.end method
