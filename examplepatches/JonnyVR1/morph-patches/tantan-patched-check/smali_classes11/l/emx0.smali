.class public abstract Ll/emx0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final d(Ljava/nio/ByteBuffer;II)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/nio/Buffer;->limit()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int/2addr v0, p1

    .line 6
    or-int v1, p1, p2

    .line 7
    .line 8
    sub-int/2addr v0, p2

    .line 9
    or-int/2addr v0, v1

    .line 10
    if-ltz v0, :cond_9

    .line 11
    .line 12
    add-int v0, p1, p2

    .line 13
    .line 14
    new-array v5, p2, [C

    .line 15
    .line 16
    const/4 p2, 0x0

    .line 17
    move v1, p2

    .line 18
    :goto_0
    if-ge p1, v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-static {v2}, Ll/dmx0;->d(B)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_0

    .line 29
    .line 30
    add-int/lit8 p1, p1, 0x1

    .line 31
    .line 32
    add-int/lit8 v3, v1, 0x1

    .line 33
    .line 34
    int-to-char v2, v2

    .line 35
    aput-char v2, v5, v1

    .line 36
    .line 37
    move v1, v3

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move v6, v1

    .line 40
    :cond_1
    :goto_1
    if-ge p1, v0, :cond_8

    .line 41
    .line 42
    add-int/lit8 v1, p1, 0x1

    .line 43
    .line 44
    move v2, v1

    .line 45
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-static {v1}, Ll/dmx0;->d(B)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_2

    .line 54
    .line 55
    add-int/lit8 p1, v6, 0x1

    .line 56
    .line 57
    int-to-char v1, v1

    .line 58
    aput-char v1, v5, v6

    .line 59
    .line 60
    move v6, p1

    .line 61
    move p1, v2

    .line 62
    :goto_2
    if-ge p1, v0, :cond_1

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-static {v1}, Ll/dmx0;->d(B)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_1

    .line 73
    .line 74
    add-int/lit8 p1, p1, 0x1

    .line 75
    .line 76
    add-int/lit8 v2, v6, 0x1

    .line 77
    .line 78
    int-to-char v1, v1

    .line 79
    aput-char v1, v5, v6

    .line 80
    .line 81
    move v6, v2

    .line 82
    goto :goto_2

    .line 83
    :cond_2
    invoke-static {v1}, Ll/dmx0;->f(B)Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-eqz v3, :cond_4

    .line 88
    .line 89
    if-ge v2, v0, :cond_3

    .line 90
    .line 91
    add-int/lit8 v3, v6, 0x1

    .line 92
    .line 93
    add-int/lit8 p1, p1, 0x2

    .line 94
    .line 95
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-static {v1, v2, v5, v6}, Ll/dmx0;->c(BB[CI)V

    .line 100
    .line 101
    .line 102
    :goto_3
    move v6, v3

    .line 103
    goto :goto_1

    .line 104
    :cond_3
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zzd()Lcom/google/android/gms/internal/ads/zzhag;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    throw p0

    .line 109
    :cond_4
    invoke-static {v1}, Ll/dmx0;->e(B)Z

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    if-eqz v3, :cond_6

    .line 114
    .line 115
    add-int/lit8 v3, v0, -0x1

    .line 116
    .line 117
    if-ge v2, v3, :cond_5

    .line 118
    .line 119
    add-int/lit8 v3, v6, 0x1

    .line 120
    .line 121
    add-int/lit8 v4, p1, 0x2

    .line 122
    .line 123
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    add-int/lit8 p1, p1, 0x3

    .line 128
    .line 129
    invoke-virtual {p0, v4}, Ljava/nio/ByteBuffer;->get(I)B

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    invoke-static {v1, v2, v4, v5, v6}, Ll/dmx0;->b(BBB[CI)V

    .line 134
    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zzd()Lcom/google/android/gms/internal/ads/zzhag;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    throw p0

    .line 142
    :cond_6
    add-int/lit8 v3, v0, -0x2

    .line 143
    .line 144
    if-ge v2, v3, :cond_7

    .line 145
    .line 146
    add-int/lit8 v3, p1, 0x2

    .line 147
    .line 148
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    add-int/lit8 v4, p1, 0x3

    .line 153
    .line 154
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    add-int/lit8 p1, p1, 0x4

    .line 159
    .line 160
    invoke-virtual {p0, v4}, Ljava/nio/ByteBuffer;->get(I)B

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    invoke-static/range {v1 .. v6}, Ll/dmx0;->a(BBBB[CI)V

    .line 165
    .line 166
    .line 167
    add-int/lit8 v6, v6, 0x2

    .line 168
    .line 169
    goto/16 :goto_1

    .line 170
    .line 171
    :cond_7
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zzd()Lcom/google/android/gms/internal/ads/zzhag;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    throw p0

    .line 176
    :cond_8
    new-instance p0, Ljava/lang/String;

    .line 177
    .line 178
    invoke-direct {p0, v5, p2, v6}, Ljava/lang/String;-><init>([CII)V

    .line 179
    .line 180
    .line 181
    return-object p0

    .line 182
    :cond_9
    invoke-virtual {p0}, Ljava/nio/Buffer;->limit()I

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 195
    .line 196
    .line 197
    move-result-object p2

    .line 198
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    const-string p1, "buffer limit=%d, index=%d, limit=%d"

    .line 203
    .line 204
    invoke-static {p1, p0}, Ll/zg3;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 205
    .line 206
    .line 207
    const/4 p0, 0x0

    .line 208
    return-object p0
.end method


# virtual methods
.method public abstract a(I[BII)I
.end method

.method public abstract b([BII)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation
.end method

.method public final c([BII)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1, p2, p3}, Ll/emx0;->a(I[BII)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    return v0
.end method
