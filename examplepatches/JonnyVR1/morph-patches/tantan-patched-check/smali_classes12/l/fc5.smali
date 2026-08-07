.class public final Ll/fc5;
.super Ll/tp50;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tp50;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f(I[I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/16 v1, 0x9

    .line 3
    .line 4
    if-ge v0, v1, :cond_1

    .line 5
    .line 6
    rsub-int/lit8 v1, v0, 0x8

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    shl-int v1, v2, v1

    .line 10
    .line 11
    and-int/2addr v1, p0

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const/4 v2, 0x2

    .line 16
    :goto_1
    aput v2, p1, v0

    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    return-void
.end method

.method public static g(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    if-ge v2, v0, :cond_e

    .line 12
    .line 13
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_d

    .line 18
    .line 19
    const/16 v4, 0x20

    .line 20
    .line 21
    if-eq v3, v4, :cond_c

    .line 22
    .line 23
    const/16 v5, 0x40

    .line 24
    .line 25
    if-eq v3, v5, :cond_b

    .line 26
    .line 27
    const/16 v5, 0x60

    .line 28
    .line 29
    if-eq v3, v5, :cond_a

    .line 30
    .line 31
    const/16 v5, 0x2d

    .line 32
    .line 33
    if-eq v3, v5, :cond_c

    .line 34
    .line 35
    const/16 v5, 0x2e

    .line 36
    .line 37
    if-eq v3, v5, :cond_c

    .line 38
    .line 39
    const/16 v5, 0x1a

    .line 40
    .line 41
    if-gt v3, v5, :cond_0

    .line 42
    .line 43
    const/16 v4, 0x24

    .line 44
    .line 45
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    add-int/lit8 v3, v3, 0x40

    .line 49
    .line 50
    int-to-char v3, v3

    .line 51
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    goto/16 :goto_2

    .line 55
    .line 56
    :cond_0
    const/16 v5, 0x25

    .line 57
    .line 58
    if-ge v3, v4, :cond_1

    .line 59
    .line 60
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    add-int/lit8 v3, v3, 0x26

    .line 64
    .line 65
    int-to-char v3, v3

    .line 66
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    goto/16 :goto_2

    .line 70
    .line 71
    :cond_1
    const/16 v4, 0x2c

    .line 72
    .line 73
    const/16 v6, 0x2f

    .line 74
    .line 75
    if-le v3, v4, :cond_9

    .line 76
    .line 77
    if-eq v3, v6, :cond_9

    .line 78
    .line 79
    const/16 v4, 0x3a

    .line 80
    .line 81
    if-ne v3, v4, :cond_2

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    const/16 v4, 0x39

    .line 85
    .line 86
    if-gt v3, v4, :cond_3

    .line 87
    .line 88
    int-to-char v3, v3

    .line 89
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    goto/16 :goto_2

    .line 93
    .line 94
    :cond_3
    const/16 v4, 0x3f

    .line 95
    .line 96
    if-gt v3, v4, :cond_4

    .line 97
    .line 98
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    add-int/lit8 v3, v3, 0xb

    .line 102
    .line 103
    int-to-char v3, v3

    .line 104
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    goto/16 :goto_2

    .line 108
    .line 109
    :cond_4
    const/16 v4, 0x5a

    .line 110
    .line 111
    if-gt v3, v4, :cond_5

    .line 112
    .line 113
    int-to-char v3, v3

    .line 114
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_5
    const/16 v4, 0x5f

    .line 119
    .line 120
    if-gt v3, v4, :cond_6

    .line 121
    .line 122
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    add-int/lit8 v3, v3, -0x10

    .line 126
    .line 127
    int-to-char v3, v3

    .line 128
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_6
    const/16 v4, 0x7a

    .line 133
    .line 134
    if-gt v3, v4, :cond_7

    .line 135
    .line 136
    const/16 v4, 0x2b

    .line 137
    .line 138
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    add-int/lit8 v3, v3, -0x20

    .line 142
    .line 143
    int-to-char v3, v3

    .line 144
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_7
    const/16 v4, 0x7f

    .line 149
    .line 150
    if-gt v3, v4, :cond_8

    .line 151
    .line 152
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    add-int/lit8 v3, v3, -0x2b

    .line 156
    .line 157
    int-to-char v3, v3

    .line 158
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 163
    .line 164
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    new-instance v1, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    const-string v2, "Requested content contains a non-encodable character: \'"

    .line 171
    .line 172
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string p0, "\'"

    .line 179
    .line 180
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    throw v0

    .line 191
    :cond_9
    :goto_1
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    add-int/lit8 v3, v3, 0x20

    .line 195
    .line 196
    int-to-char v3, v3

    .line 197
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    goto :goto_2

    .line 201
    :cond_a
    const-string v3, "%W"

    .line 202
    .line 203
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    goto :goto_2

    .line 207
    :cond_b
    const-string v3, "%V"

    .line 208
    .line 209
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_c
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_d
    const-string v3, "%U"

    .line 218
    .line 219
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :cond_e
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Ll/d13;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Ll/d13;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->CODE_39:Lcom/google/zxing/BarcodeFormat;

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    invoke-super/range {p0 .. p5}, Ll/tp50;->a(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Ll/d13;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "Can only encode CODE_39, but got "

    .line 11
    .line 12
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public c(Ljava/lang/String;)[Z
    .locals 11

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const-string v1, "Requested contents should be less than 80 digits long, but got "

    .line 7
    .line 8
    const/16 v2, 0x50

    .line 9
    .line 10
    if-gt p0, v2, :cond_6

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    move v4, v3

    .line 14
    :goto_0
    const-string v5, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%"

    .line 15
    .line 16
    if-ge v4, p0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 19
    .line 20
    .line 21
    move-result v6

    .line 22
    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    if-gez v6, :cond_1

    .line 27
    .line 28
    invoke-static {p1}, Ll/fc5;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-gt p0, v2, :cond_0

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    const-string p1, " (extended full ASCII mode)"

    .line 40
    .line 41
    invoke-static {v1, p0, p1}, Ll/i2r0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    :goto_1
    const/16 v0, 0x9

    .line 49
    .line 50
    new-array v1, v0, [I

    .line 51
    .line 52
    add-int/lit8 v2, p0, 0x19

    .line 53
    .line 54
    move v4, v3

    .line 55
    :goto_2
    if-ge v4, p0, :cond_4

    .line 56
    .line 57
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    sget-object v7, Ll/ec5;->e:[I

    .line 66
    .line 67
    aget v6, v7, v6

    .line 68
    .line 69
    invoke-static {v6, v1}, Ll/fc5;->f(I[I)V

    .line 70
    .line 71
    .line 72
    move v6, v3

    .line 73
    :goto_3
    if-ge v6, v0, :cond_3

    .line 74
    .line 75
    aget v7, v1, v6

    .line 76
    .line 77
    add-int/2addr v2, v7

    .line 78
    add-int/lit8 v6, v6, 0x1

    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_4
    new-array v0, v2, [Z

    .line 85
    .line 86
    const/16 v2, 0x94

    .line 87
    .line 88
    invoke-static {v2, v1}, Ll/fc5;->f(I[I)V

    .line 89
    .line 90
    .line 91
    const/4 v4, 0x1

    .line 92
    invoke-static {v0, v3, v1, v4}, Ll/tp50;->b([ZI[IZ)I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    filled-new-array {v4}, [I

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    invoke-static {v0, v6, v7, v3}, Ll/tp50;->b([ZI[IZ)I

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    add-int/2addr v6, v8

    .line 105
    move v8, v3

    .line 106
    :goto_4
    if-ge v8, p0, :cond_5

    .line 107
    .line 108
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    .line 109
    .line 110
    .line 111
    move-result v9

    .line 112
    invoke-virtual {v5, v9}, Ljava/lang/String;->indexOf(I)I

    .line 113
    .line 114
    .line 115
    move-result v9

    .line 116
    sget-object v10, Ll/ec5;->e:[I

    .line 117
    .line 118
    aget v9, v10, v9

    .line 119
    .line 120
    invoke-static {v9, v1}, Ll/fc5;->f(I[I)V

    .line 121
    .line 122
    .line 123
    invoke-static {v0, v6, v1, v4}, Ll/tp50;->b([ZI[IZ)I

    .line 124
    .line 125
    .line 126
    move-result v9

    .line 127
    add-int/2addr v6, v9

    .line 128
    invoke-static {v0, v6, v7, v3}, Ll/tp50;->b([ZI[IZ)I

    .line 129
    .line 130
    .line 131
    move-result v9

    .line 132
    add-int/2addr v6, v9

    .line 133
    add-int/lit8 v8, v8, 0x1

    .line 134
    .line 135
    goto :goto_4

    .line 136
    :cond_5
    invoke-static {v2, v1}, Ll/fc5;->f(I[I)V

    .line 137
    .line 138
    .line 139
    invoke-static {v0, v6, v1, v4}, Ll/tp50;->b([ZI[IZ)I

    .line 140
    .line 141
    .line 142
    return-object v0

    .line 143
    :cond_6
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    return-object v0
.end method
