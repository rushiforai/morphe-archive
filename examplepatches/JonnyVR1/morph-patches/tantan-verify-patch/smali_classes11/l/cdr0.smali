.class public final Ll/cdr0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[I

.field public static final b:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0xd

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/cdr0;->a:[I

    .line 9
    .line 10
    const/16 v0, 0x10

    .line 11
    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/cdr0;->b:[I

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :array_0
    .array-data 4
        0x17700
        0x15888
        0xfa00
        0xbb80
        0xac44
        0x7d00
        0x5dc0
        0x5622
        0x3e80
        0x2ee0
        0x2b11
        0x1f40
        0x1cb6
    .end array-data

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    :array_1
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x8
        -0x1
        -0x1
        -0x1
        0x7
        0x8
        -0x1
        0x8
        -0x1
    .end array-data
.end method

.method public static a([B)Ll/bdr0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/dfw0;

    .line 2
    .line 3
    array-length v1, p0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/dfw0;-><init>([BI)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-static {v0, p0}, Ll/cdr0;->b(Ll/dfw0;Z)Ll/bdr0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static b(Ll/dfw0;Z)Ll/bdr0;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/cdr0;->c(Ll/dfw0;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0}, Ll/cdr0;->d(Ll/dfw0;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x4

    .line 10
    invoke-virtual {p0, v2}, Ll/dfw0;->d(I)I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    new-instance v4, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v5, "mp4a.40."

    .line 17
    .line 18
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    const/4 v5, 0x5

    .line 29
    const/16 v6, 0x16

    .line 30
    .line 31
    if-eq v0, v5, :cond_0

    .line 32
    .line 33
    const/16 v5, 0x1d

    .line 34
    .line 35
    if-ne v0, v5, :cond_1

    .line 36
    .line 37
    :cond_0
    invoke-static {p0}, Ll/cdr0;->d(Ll/dfw0;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-static {p0}, Ll/cdr0;->c(Ll/dfw0;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-ne v0, v6, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0, v2}, Ll/dfw0;->d(I)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    :cond_1
    const/4 v5, 0x0

    .line 52
    if-eqz p1, :cond_e

    .line 53
    .line 54
    const/16 p1, 0x11

    .line 55
    .line 56
    const/4 v7, 0x6

    .line 57
    const/4 v8, 0x1

    .line 58
    const/4 v9, 0x2

    .line 59
    const/4 v10, 0x3

    .line 60
    if-eq v0, v8, :cond_2

    .line 61
    .line 62
    if-eq v0, v9, :cond_2

    .line 63
    .line 64
    if-eq v0, v10, :cond_2

    .line 65
    .line 66
    if-eq v0, v2, :cond_2

    .line 67
    .line 68
    if-eq v0, v7, :cond_2

    .line 69
    .line 70
    const/4 v2, 0x7

    .line 71
    if-eq v0, v2, :cond_2

    .line 72
    .line 73
    if-eq v0, p1, :cond_2

    .line 74
    .line 75
    packed-switch v0, :pswitch_data_0

    .line 76
    .line 77
    .line 78
    new-instance p0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string p1, "Unsupported audio object type: "

    .line 81
    .line 82
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    throw p0

    .line 97
    :cond_2
    :pswitch_0
    invoke-virtual {p0}, Ll/dfw0;->o()Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-eqz v2, :cond_3

    .line 102
    .line 103
    const-string v2, "AacUtil"

    .line 104
    .line 105
    const-string v11, "Unexpected frameLengthFlag = 1"

    .line 106
    .line 107
    invoke-static {v2, v11}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :cond_3
    invoke-virtual {p0}, Ll/dfw0;->o()Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_4

    .line 115
    .line 116
    const/16 v2, 0xe

    .line 117
    .line 118
    invoke-virtual {p0, v2}, Ll/dfw0;->m(I)V

    .line 119
    .line 120
    .line 121
    :cond_4
    invoke-virtual {p0}, Ll/dfw0;->o()Z

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    if-eqz v3, :cond_d

    .line 126
    .line 127
    const/16 v11, 0x14

    .line 128
    .line 129
    if-eq v0, v7, :cond_5

    .line 130
    .line 131
    if-ne v0, v11, :cond_6

    .line 132
    .line 133
    move v0, v11

    .line 134
    :cond_5
    invoke-virtual {p0, v10}, Ll/dfw0;->m(I)V

    .line 135
    .line 136
    .line 137
    :cond_6
    if-eqz v2, :cond_a

    .line 138
    .line 139
    if-ne v0, v6, :cond_7

    .line 140
    .line 141
    const/16 v2, 0x10

    .line 142
    .line 143
    invoke-virtual {p0, v2}, Ll/dfw0;->m(I)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_7
    move v6, v0

    .line 148
    :goto_0
    if-eq v6, p1, :cond_8

    .line 149
    .line 150
    const/16 p1, 0x13

    .line 151
    .line 152
    if-eq v6, p1, :cond_8

    .line 153
    .line 154
    if-eq v6, v11, :cond_8

    .line 155
    .line 156
    const/16 p1, 0x17

    .line 157
    .line 158
    if-ne v6, p1, :cond_9

    .line 159
    .line 160
    :cond_8
    invoke-virtual {p0, v10}, Ll/dfw0;->m(I)V

    .line 161
    .line 162
    .line 163
    :cond_9
    invoke-virtual {p0, v8}, Ll/dfw0;->m(I)V

    .line 164
    .line 165
    .line 166
    :cond_a
    packed-switch v0, :pswitch_data_1

    .line 167
    .line 168
    .line 169
    :pswitch_1
    goto :goto_1

    .line 170
    :pswitch_2
    invoke-virtual {p0, v9}, Ll/dfw0;->d(I)I

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    if-eq p0, v9, :cond_b

    .line 175
    .line 176
    if-eq p0, v10, :cond_c

    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_b
    move v10, p0

    .line 180
    :cond_c
    new-instance p0, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    const-string p1, "Unsupported epConfig: "

    .line 183
    .line 184
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    throw p0

    .line 199
    :cond_d
    invoke-static {}, Ll/l710;->a()V

    .line 200
    .line 201
    .line 202
    return-object v5

    .line 203
    :cond_e
    :goto_1
    sget-object p0, Ll/cdr0;->b:[I

    .line 204
    .line 205
    aget p0, p0, v3

    .line 206
    .line 207
    const/4 p1, -0x1

    .line 208
    if-eq p0, p1, :cond_f

    .line 209
    .line 210
    new-instance p1, Ll/bdr0;

    .line 211
    .line 212
    invoke-direct {p1, v1, p0, v4, v5}, Ll/bdr0;-><init>(IILjava/lang/String;Ll/adr0;)V

    .line 213
    .line 214
    .line 215
    return-object p1

    .line 216
    :cond_f
    invoke-static {v5, v5}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    throw p0

    .line 221
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    :pswitch_data_1
    .packed-switch 0x11
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public static c(Ll/dfw0;)I
    .locals 2

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-virtual {p0, v0}, Ll/dfw0;->d(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/16 v1, 0x1f

    .line 7
    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x6

    .line 11
    invoke-virtual {p0, v0}, Ll/dfw0;->d(I)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/lit8 p0, p0, 0x20

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    return v0
.end method

.method public static d(Ll/dfw0;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Ll/dfw0;->d(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/16 v1, 0xf

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dfw0;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/16 v1, 0x18

    .line 16
    .line 17
    if-lt v0, v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ll/dfw0;->d(I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    const-string p0, "AAC header insufficient data"

    .line 25
    .line 26
    invoke-static {p0, v2}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    throw p0

    .line 31
    :cond_1
    const/16 p0, 0xd

    .line 32
    .line 33
    if-ge v0, p0, :cond_2

    .line 34
    .line 35
    sget-object p0, Ll/cdr0;->a:[I

    .line 36
    .line 37
    aget p0, p0, v0

    .line 38
    .line 39
    return p0

    .line 40
    :cond_2
    const-string p0, "AAC header wrong Sampling Frequency Index"

    .line 41
    .line 42
    invoke-static {p0, v2}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    throw p0
.end method
