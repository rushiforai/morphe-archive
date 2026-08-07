.class public final Lcom/google/zxing/oned/Code128Writer;
.super Ll/tp50;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/oned/Code128Writer$CType;
    }
.end annotation


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

.method public static f(Ljava/lang/CharSequence;II)I
    .locals 5

    .line 1
    invoke-static {p0, p1}, Lcom/google/zxing/oned/Code128Writer;->g(Ljava/lang/CharSequence;I)Lcom/google/zxing/oned/Code128Writer$CType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/google/zxing/oned/Code128Writer$CType;->ONE_DIGIT:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 6
    .line 7
    const/16 v2, 0x64

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    return v2

    .line 12
    :cond_0
    sget-object v3, Lcom/google/zxing/oned/Code128Writer$CType;->UNCODABLE:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 13
    .line 14
    if-ne v0, v3, :cond_3

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-ge p1, v0, :cond_2

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    const/16 p1, 0x20

    .line 27
    .line 28
    const/16 v0, 0x65

    .line 29
    .line 30
    if-lt p0, p1, :cond_1

    .line 31
    .line 32
    if-ne p2, v0, :cond_2

    .line 33
    .line 34
    const/16 p1, 0x60

    .line 35
    .line 36
    if-ge p0, p1, :cond_2

    .line 37
    .line 38
    :cond_1
    return v0

    .line 39
    :cond_2
    return v2

    .line 40
    :cond_3
    const/16 v4, 0x63

    .line 41
    .line 42
    if-ne p2, v4, :cond_4

    .line 43
    .line 44
    return v4

    .line 45
    :cond_4
    if-ne p2, v2, :cond_c

    .line 46
    .line 47
    sget-object p2, Lcom/google/zxing/oned/Code128Writer$CType;->FNC_1:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 48
    .line 49
    if-ne v0, p2, :cond_5

    .line 50
    .line 51
    return v2

    .line 52
    :cond_5
    add-int/lit8 v0, p1, 0x2

    .line 53
    .line 54
    invoke-static {p0, v0}, Lcom/google/zxing/oned/Code128Writer;->g(Ljava/lang/CharSequence;I)Lcom/google/zxing/oned/Code128Writer$CType;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-eq v0, v3, :cond_b

    .line 59
    .line 60
    if-ne v0, v1, :cond_6

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_6
    if-ne v0, p2, :cond_8

    .line 64
    .line 65
    add-int/lit8 p1, p1, 0x3

    .line 66
    .line 67
    invoke-static {p0, p1}, Lcom/google/zxing/oned/Code128Writer;->g(Ljava/lang/CharSequence;I)Lcom/google/zxing/oned/Code128Writer$CType;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    sget-object p1, Lcom/google/zxing/oned/Code128Writer$CType;->TWO_DIGITS:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 72
    .line 73
    if-ne p0, p1, :cond_7

    .line 74
    .line 75
    return v4

    .line 76
    :cond_7
    return v2

    .line 77
    :cond_8
    add-int/lit8 p1, p1, 0x4

    .line 78
    .line 79
    :goto_0
    invoke-static {p0, p1}, Lcom/google/zxing/oned/Code128Writer;->g(Ljava/lang/CharSequence;I)Lcom/google/zxing/oned/Code128Writer$CType;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    sget-object v0, Lcom/google/zxing/oned/Code128Writer$CType;->TWO_DIGITS:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 84
    .line 85
    if-ne p2, v0, :cond_9

    .line 86
    .line 87
    add-int/lit8 p1, p1, 0x2

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_9
    sget-object p0, Lcom/google/zxing/oned/Code128Writer$CType;->ONE_DIGIT:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 91
    .line 92
    if-ne p2, p0, :cond_a

    .line 93
    .line 94
    return v2

    .line 95
    :cond_a
    return v4

    .line 96
    :cond_b
    :goto_1
    return v2

    .line 97
    :cond_c
    sget-object p2, Lcom/google/zxing/oned/Code128Writer$CType;->FNC_1:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 98
    .line 99
    if-ne v0, p2, :cond_d

    .line 100
    .line 101
    add-int/lit8 p1, p1, 0x1

    .line 102
    .line 103
    invoke-static {p0, p1}, Lcom/google/zxing/oned/Code128Writer;->g(Ljava/lang/CharSequence;I)Lcom/google/zxing/oned/Code128Writer$CType;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    :cond_d
    sget-object p0, Lcom/google/zxing/oned/Code128Writer$CType;->TWO_DIGITS:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 108
    .line 109
    if-ne v0, p0, :cond_e

    .line 110
    .line 111
    return v4

    .line 112
    :cond_e
    return v2
.end method

.method public static g(Ljava/lang/CharSequence;I)Lcom/google/zxing/oned/Code128Writer$CType;
    .locals 4

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lt p1, v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/google/zxing/oned/Code128Writer$CType;->UNCODABLE:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/16 v2, 0xf1

    .line 15
    .line 16
    if-ne v1, v2, :cond_1

    .line 17
    .line 18
    sget-object p0, Lcom/google/zxing/oned/Code128Writer$CType;->FNC_1:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const/16 v2, 0x30

    .line 22
    .line 23
    if-lt v1, v2, :cond_6

    .line 24
    .line 25
    const/16 v3, 0x39

    .line 26
    .line 27
    if-le v1, v3, :cond_2

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    add-int/lit8 p1, p1, 0x1

    .line 31
    .line 32
    if-lt p1, v0, :cond_3

    .line 33
    .line 34
    sget-object p0, Lcom/google/zxing/oned/Code128Writer$CType;->ONE_DIGIT:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_3
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-lt p0, v2, :cond_5

    .line 42
    .line 43
    if-le p0, v3, :cond_4

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_4
    sget-object p0, Lcom/google/zxing/oned/Code128Writer$CType;->TWO_DIGITS:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_5
    :goto_0
    sget-object p0, Lcom/google/zxing/oned/Code128Writer$CType;->ONE_DIGIT:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_6
    :goto_1
    sget-object p0, Lcom/google/zxing/oned/Code128Writer$CType;->UNCODABLE:Lcom/google/zxing/oned/Code128Writer$CType;

    .line 53
    .line 54
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
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->CODE_128:Lcom/google/zxing/BarcodeFormat;

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
    const-string p0, "Can only encode CODE_128, but got "

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
    if-lez p0, :cond_e

    .line 7
    .line 8
    const/16 v1, 0x50

    .line 9
    .line 10
    if-gt p0, v1, :cond_e

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    move v2, v1

    .line 14
    :goto_0
    if-ge v2, p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    packed-switch v3, :pswitch_data_0

    .line 21
    .line 22
    .line 23
    const/16 v4, 0x7f

    .line 24
    .line 25
    if-gt v3, v4, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const-string p0, "Bad character in input: "

    .line 29
    .line 30
    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-object v0

    .line 42
    :goto_1
    :pswitch_0
    add-int/lit8 v2, v2, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    move v3, v1

    .line 52
    move v4, v3

    .line 53
    move v5, v4

    .line 54
    move v6, v2

    .line 55
    :cond_2
    :goto_2
    const/16 v7, 0x67

    .line 56
    .line 57
    if-ge v3, p0, :cond_a

    .line 58
    .line 59
    invoke-static {p1, v3, v5}, Lcom/google/zxing/oned/Code128Writer;->f(Ljava/lang/CharSequence;II)I

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    const/16 v9, 0x64

    .line 64
    .line 65
    const/16 v10, 0x65

    .line 66
    .line 67
    if-ne v8, v5, :cond_6

    .line 68
    .line 69
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    packed-switch v7, :pswitch_data_1

    .line 74
    .line 75
    .line 76
    if-eq v5, v9, :cond_4

    .line 77
    .line 78
    if-eq v5, v10, :cond_3

    .line 79
    .line 80
    add-int/lit8 v7, v3, 0x2

    .line 81
    .line 82
    invoke-virtual {p1, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v9

    .line 90
    add-int/lit8 v3, v3, 0x1

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_3
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    .line 94
    .line 95
    .line 96
    move-result v7

    .line 97
    add-int/lit8 v9, v7, -0x20

    .line 98
    .line 99
    if-gez v9, :cond_5

    .line 100
    .line 101
    add-int/lit8 v9, v7, 0x40

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_4
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    .line 105
    .line 106
    .line 107
    move-result v7

    .line 108
    add-int/lit8 v9, v7, -0x20

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :pswitch_1
    if-ne v5, v10, :cond_5

    .line 112
    .line 113
    move v9, v10

    .line 114
    goto :goto_3

    .line 115
    :pswitch_2
    const/16 v9, 0x60

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :pswitch_3
    const/16 v9, 0x61

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :pswitch_4
    const/16 v9, 0x66

    .line 122
    .line 123
    :cond_5
    :goto_3
    add-int/2addr v3, v2

    .line 124
    goto :goto_5

    .line 125
    :cond_6
    if-nez v5, :cond_8

    .line 126
    .line 127
    if-eq v8, v9, :cond_7

    .line 128
    .line 129
    if-eq v8, v10, :cond_9

    .line 130
    .line 131
    const/16 v7, 0x69

    .line 132
    .line 133
    goto :goto_4

    .line 134
    :cond_7
    const/16 v7, 0x68

    .line 135
    .line 136
    goto :goto_4

    .line 137
    :cond_8
    move v7, v8

    .line 138
    :cond_9
    :goto_4
    move v9, v7

    .line 139
    move v5, v8

    .line 140
    :goto_5
    sget-object v7, Ll/dc5;->a:[[I

    .line 141
    .line 142
    aget-object v7, v7, v9

    .line 143
    .line 144
    invoke-interface {v0, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    mul-int/2addr v9, v6

    .line 148
    add-int/2addr v4, v9

    .line 149
    if-eqz v3, :cond_2

    .line 150
    .line 151
    add-int/lit8 v6, v6, 0x1

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_a
    rem-int/2addr v4, v7

    .line 155
    sget-object p0, Ll/dc5;->a:[[I

    .line 156
    .line 157
    aget-object p1, p0, v4

    .line 158
    .line 159
    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    const/16 p1, 0x6a

    .line 163
    .line 164
    aget-object p0, p0, p1

    .line 165
    .line 166
    invoke-interface {v0, p0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    move p1, v1

    .line 174
    :cond_b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    if-eqz v3, :cond_c

    .line 179
    .line 180
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    check-cast v3, [I

    .line 185
    .line 186
    array-length v4, v3

    .line 187
    move v5, v1

    .line 188
    :goto_6
    if-ge v5, v4, :cond_b

    .line 189
    .line 190
    aget v6, v3, v5

    .line 191
    .line 192
    add-int/2addr p1, v6

    .line 193
    add-int/lit8 v5, v5, 0x1

    .line 194
    .line 195
    goto :goto_6

    .line 196
    :cond_c
    new-array p0, p1, [Z

    .line 197
    .line 198
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    :goto_7
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_d

    .line 207
    .line 208
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    check-cast v0, [I

    .line 213
    .line 214
    invoke-static {p0, v1, v0, v2}, Ll/tp50;->b([ZI[IZ)I

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    add-int/2addr v1, v0

    .line 219
    goto :goto_7

    .line 220
    :cond_d
    return-object p0

    .line 221
    :cond_e
    const-string p1, "Contents length should be between 1 and 80 characters, but got "

    .line 222
    .line 223
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    return-object v0

    .line 235
    :pswitch_data_0
    .packed-switch 0xf1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    :pswitch_data_1
    .packed-switch 0xf1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
