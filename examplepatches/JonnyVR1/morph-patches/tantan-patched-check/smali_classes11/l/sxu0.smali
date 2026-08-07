.class public final Ll/sxu0;
.super Ll/fuu0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fuu0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/nio/ByteBuffer;)V
    .locals 11

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int v2, v1, v0

    .line 10
    .line 11
    iget-object v3, p0, Ll/fuu0;->b:Ll/mqu0;

    .line 12
    .line 13
    iget v3, v3, Ll/mqu0;->c:I

    .line 14
    .line 15
    const/high16 v4, 0x60000000

    .line 16
    .line 17
    const/high16 v5, 0x50000000

    .line 18
    .line 19
    const/high16 v6, 0x10000000

    .line 20
    .line 21
    const/16 v7, 0x16

    .line 22
    .line 23
    const/16 v8, 0x15

    .line 24
    .line 25
    const/4 v9, 0x4

    .line 26
    const/4 v10, 0x3

    .line 27
    if-eq v3, v10, :cond_2

    .line 28
    .line 29
    if-eq v3, v9, :cond_3

    .line 30
    .line 31
    if-eq v3, v8, :cond_1

    .line 32
    .line 33
    if-eq v3, v7, :cond_3

    .line 34
    .line 35
    if-eq v3, v6, :cond_4

    .line 36
    .line 37
    if-eq v3, v5, :cond_1

    .line 38
    .line 39
    if-ne v3, v4, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    div-int/lit8 v2, v2, 0x3

    .line 47
    .line 48
    :cond_2
    add-int/2addr v2, v2

    .line 49
    goto :goto_1

    .line 50
    :cond_3
    :goto_0
    div-int/lit8 v2, v2, 0x2

    .line 51
    .line 52
    :cond_4
    :goto_1
    invoke-virtual {p0, v2}, Ll/fuu0;->d(I)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iget-object p0, p0, Ll/fuu0;->b:Ll/mqu0;

    .line 57
    .line 58
    iget p0, p0, Ll/mqu0;->c:I

    .line 59
    .line 60
    if-eq p0, v10, :cond_b

    .line 61
    .line 62
    if-eq p0, v9, :cond_a

    .line 63
    .line 64
    if-eq p0, v8, :cond_9

    .line 65
    .line 66
    if-eq p0, v7, :cond_8

    .line 67
    .line 68
    if-eq p0, v6, :cond_7

    .line 69
    .line 70
    if-eq p0, v5, :cond_6

    .line 71
    .line 72
    if-ne p0, v4, :cond_5

    .line 73
    .line 74
    :goto_2
    if-ge v0, v1, :cond_c

    .line 75
    .line 76
    add-int/lit8 p0, v0, 0x1

    .line 77
    .line 78
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 90
    .line 91
    .line 92
    add-int/lit8 v0, v0, 0x4

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_5
    invoke-static {}, Ll/wpg0;->a()V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_6
    :goto_3
    if-ge v0, v1, :cond_c

    .line 100
    .line 101
    add-int/lit8 p0, v0, 0x1

    .line 102
    .line 103
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    .line 117
    add-int/lit8 v0, v0, 0x3

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :cond_7
    :goto_4
    if-ge v0, v1, :cond_c

    .line 121
    .line 122
    add-int/lit8 p0, v0, 0x1

    .line 123
    .line 124
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 136
    .line 137
    .line 138
    add-int/lit8 v0, v0, 0x2

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_8
    :goto_5
    if-ge v0, v1, :cond_c

    .line 142
    .line 143
    add-int/lit8 p0, v0, 0x2

    .line 144
    .line 145
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 150
    .line 151
    .line 152
    add-int/lit8 p0, v0, 0x3

    .line 153
    .line 154
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 155
    .line 156
    .line 157
    move-result p0

    .line 158
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 159
    .line 160
    .line 161
    add-int/lit8 v0, v0, 0x4

    .line 162
    .line 163
    goto :goto_5

    .line 164
    :cond_9
    :goto_6
    if-ge v0, v1, :cond_c

    .line 165
    .line 166
    add-int/lit8 p0, v0, 0x1

    .line 167
    .line 168
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 173
    .line 174
    .line 175
    add-int/lit8 p0, v0, 0x2

    .line 176
    .line 177
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 182
    .line 183
    .line 184
    add-int/lit8 v0, v0, 0x3

    .line 185
    .line 186
    goto :goto_6

    .line 187
    :cond_a
    :goto_7
    if-ge v0, v1, :cond_c

    .line 188
    .line 189
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->getFloat(I)F

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    const/high16 v3, 0x3f800000    # 1.0f

    .line 194
    .line 195
    invoke-static {p0, v3}, Ljava/lang/Math;->min(FF)F

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    const/high16 v3, -0x40800000    # -1.0f

    .line 200
    .line 201
    invoke-static {v3, p0}, Ljava/lang/Math;->max(FF)F

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    const v3, 0x46fffe00    # 32767.0f

    .line 206
    .line 207
    .line 208
    mul-float/2addr p0, v3

    .line 209
    float-to-int p0, p0

    .line 210
    int-to-short p0, p0

    .line 211
    and-int/lit16 v3, p0, 0xff

    .line 212
    .line 213
    int-to-byte v3, v3

    .line 214
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 215
    .line 216
    .line 217
    shr-int/lit8 p0, p0, 0x8

    .line 218
    .line 219
    and-int/lit16 p0, p0, 0xff

    .line 220
    .line 221
    int-to-byte p0, p0

    .line 222
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 223
    .line 224
    .line 225
    add-int/lit8 v0, v0, 0x4

    .line 226
    .line 227
    goto :goto_7

    .line 228
    :cond_b
    :goto_8
    if-ge v0, v1, :cond_c

    .line 229
    .line 230
    const/4 p0, 0x0

    .line 231
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 232
    .line 233
    .line 234
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 235
    .line 236
    .line 237
    move-result p0

    .line 238
    and-int/lit16 p0, p0, 0xff

    .line 239
    .line 240
    add-int/lit8 p0, p0, -0x80

    .line 241
    .line 242
    int-to-byte p0, p0

    .line 243
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 244
    .line 245
    .line 246
    add-int/lit8 v0, v0, 0x1

    .line 247
    .line 248
    goto :goto_8

    .line 249
    :cond_c
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 250
    .line 251
    .line 252
    move-result p0

    .line 253
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 254
    .line 255
    .line 256
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 257
    .line 258
    .line 259
    return-void
.end method

.method public final c(Ll/mqu0;)Ll/mqu0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzds;
        }
    .end annotation

    .line 1
    iget p0, p1, Ll/mqu0;->c:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq p0, v0, :cond_2

    .line 6
    .line 7
    if-eq p0, v1, :cond_1

    .line 8
    .line 9
    const/high16 v0, 0x10000000

    .line 10
    .line 11
    if-eq p0, v0, :cond_2

    .line 12
    .line 13
    const/16 v0, 0x15

    .line 14
    .line 15
    if-eq p0, v0, :cond_2

    .line 16
    .line 17
    const/high16 v0, 0x50000000

    .line 18
    .line 19
    if-eq p0, v0, :cond_2

    .line 20
    .line 21
    const/16 v0, 0x16

    .line 22
    .line 23
    if-eq p0, v0, :cond_2

    .line 24
    .line 25
    const/high16 v0, 0x60000000

    .line 26
    .line 27
    if-eq p0, v0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    if-ne p0, v0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/ads/zzds;

    .line 34
    .line 35
    const-string v0, "Unhandled input format:"

    .line 36
    .line 37
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/internal/ads/zzds;-><init>(Ljava/lang/String;Ll/mqu0;)V

    .line 38
    .line 39
    .line 40
    throw p0

    .line 41
    :cond_1
    sget-object p0, Ll/mqu0;->e:Ll/mqu0;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_2
    :goto_0
    new-instance p0, Ll/mqu0;

    .line 45
    .line 46
    iget v0, p1, Ll/mqu0;->a:I

    .line 47
    .line 48
    iget p1, p1, Ll/mqu0;->b:I

    .line 49
    .line 50
    invoke-direct {p0, v0, p1, v1}, Ll/mqu0;-><init>(III)V

    .line 51
    .line 52
    .line 53
    return-object p0
.end method
