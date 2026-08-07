.class public final Ll/oqr0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ljava/util/regex/Pattern;

.field public static final d:Ljava/util/regex/Pattern;


# instance fields
.field public final a:Ll/bgw0;

.field public final b:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "\\[voice=\"([^\"]*)\"\\]"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/oqr0;->c:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    const-string v0, "^((?:[0-9]*\\.)?[0-9]+)(px|em|%)$"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/oqr0;->d:Ljava/util/regex/Pattern;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bgw0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/oqr0;->a:Ll/bgw0;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/oqr0;->b:Ljava/lang/StringBuilder;

    .line 17
    .line 18
    return-void
.end method

.method public static a(Ll/bgw0;Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/oqr0;->c(Ll/bgw0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/bgw0;->q()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {p0, p1}, Ll/oqr0;->d(Ll/bgw0;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, ""

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_1
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    int-to-char p0, p0

    .line 30
    new-instance p1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static c(Ll/bgw0;)V
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    :goto_0
    move v1, v0

    .line 3
    :goto_1
    invoke-virtual {p0}, Ll/bgw0;->q()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-lez v2, :cond_4

    .line 8
    .line 9
    if-eqz v1, :cond_4

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, Ll/bgw0;->m()[B

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    aget-byte v1, v2, v1

    .line 20
    .line 21
    int-to-char v1, v1

    .line 22
    const/16 v2, 0x9

    .line 23
    .line 24
    if-eq v1, v2, :cond_3

    .line 25
    .line 26
    const/16 v2, 0xa

    .line 27
    .line 28
    if-eq v1, v2, :cond_3

    .line 29
    .line 30
    const/16 v2, 0xc

    .line 31
    .line 32
    if-eq v1, v2, :cond_3

    .line 33
    .line 34
    const/16 v2, 0xd

    .line 35
    .line 36
    if-eq v1, v2, :cond_3

    .line 37
    .line 38
    const/16 v2, 0x20

    .line 39
    .line 40
    if-eq v1, v2, :cond_3

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p0}, Ll/bgw0;->t()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {p0}, Ll/bgw0;->m()[B

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    add-int/lit8 v4, v1, 0x2

    .line 55
    .line 56
    const/4 v5, 0x0

    .line 57
    if-gt v4, v2, :cond_2

    .line 58
    .line 59
    add-int/lit8 v4, v1, 0x1

    .line 60
    .line 61
    aget-byte v6, v3, v1

    .line 62
    .line 63
    const/16 v7, 0x2f

    .line 64
    .line 65
    if-ne v6, v7, :cond_2

    .line 66
    .line 67
    add-int/lit8 v1, v1, 0x2

    .line 68
    .line 69
    aget-byte v4, v3, v4

    .line 70
    .line 71
    const/16 v6, 0x2a

    .line 72
    .line 73
    if-ne v4, v6, :cond_2

    .line 74
    .line 75
    :goto_2
    add-int/lit8 v4, v1, 0x1

    .line 76
    .line 77
    if-ge v4, v2, :cond_1

    .line 78
    .line 79
    aget-byte v5, v3, v1

    .line 80
    .line 81
    int-to-char v5, v5

    .line 82
    if-ne v5, v6, :cond_0

    .line 83
    .line 84
    aget-byte v5, v3, v4

    .line 85
    .line 86
    int-to-char v5, v5

    .line 87
    if-ne v5, v7, :cond_0

    .line 88
    .line 89
    add-int/lit8 v2, v1, 0x2

    .line 90
    .line 91
    move v1, v2

    .line 92
    goto :goto_2

    .line 93
    :cond_0
    move v1, v4

    .line 94
    goto :goto_2

    .line 95
    :cond_1
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    sub-int/2addr v2, v1

    .line 100
    invoke-virtual {p0, v2}, Ll/bgw0;->l(I)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_2
    move v1, v5

    .line 105
    goto :goto_1

    .line 106
    :cond_3
    invoke-virtual {p0, v0}, Ll/bgw0;->l(I)V

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_4
    return-void
.end method

.method public static d(Ll/bgw0;Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Ll/bgw0;->t()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    :goto_0
    move v3, v0

    .line 14
    :goto_1
    if-ge v1, v2, :cond_5

    .line 15
    .line 16
    if-nez v3, :cond_5

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/bgw0;->m()[B

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    aget-byte v3, v3, v1

    .line 23
    .line 24
    int-to-char v3, v3

    .line 25
    const/16 v4, 0x41

    .line 26
    .line 27
    if-lt v3, v4, :cond_0

    .line 28
    .line 29
    const/16 v4, 0x5a

    .line 30
    .line 31
    if-le v3, v4, :cond_4

    .line 32
    .line 33
    :cond_0
    const/16 v4, 0x61

    .line 34
    .line 35
    if-lt v3, v4, :cond_1

    .line 36
    .line 37
    const/16 v4, 0x7a

    .line 38
    .line 39
    if-le v3, v4, :cond_4

    .line 40
    .line 41
    :cond_1
    const/16 v4, 0x30

    .line 42
    .line 43
    if-lt v3, v4, :cond_2

    .line 44
    .line 45
    const/16 v4, 0x39

    .line 46
    .line 47
    if-le v3, v4, :cond_4

    .line 48
    .line 49
    :cond_2
    const/16 v4, 0x23

    .line 50
    .line 51
    if-eq v3, v4, :cond_4

    .line 52
    .line 53
    const/16 v4, 0x2d

    .line 54
    .line 55
    if-eq v3, v4, :cond_4

    .line 56
    .line 57
    const/16 v4, 0x2e

    .line 58
    .line 59
    if-eq v3, v4, :cond_4

    .line 60
    .line 61
    const/16 v4, 0x5f

    .line 62
    .line 63
    if-ne v3, v4, :cond_3

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_3
    const/4 v3, 0x1

    .line 67
    goto :goto_1

    .line 68
    :cond_4
    :goto_2
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_5
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    sub-int/2addr v1, v0

    .line 79
    invoke-virtual {p0, v1}, Ll/bgw0;->l(I)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method


# virtual methods
.method public final b(Ll/bgw0;)Ljava/util/List;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/oqr0;->b:Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->s()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    :cond_0
    sget-object v3, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 14
    .line 15
    move-object/from16 v4, p1

    .line 16
    .line 17
    invoke-virtual {v4, v3}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    iget-object v3, v0, Ll/oqr0;->a:Ll/bgw0;

    .line 28
    .line 29
    invoke-virtual {v4}, Ll/bgw0;->m()[B

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    invoke-virtual {v4}, Ll/bgw0;->s()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    invoke-virtual {v3, v5, v4}, Ll/bgw0;->i([BI)V

    .line 38
    .line 39
    .line 40
    iget-object v3, v0, Ll/oqr0;->a:Ll/bgw0;

    .line 41
    .line 42
    invoke-virtual {v3, v1}, Ll/bgw0;->k(I)V

    .line 43
    .line 44
    .line 45
    new-instance v1, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object v3, v0, Ll/oqr0;->a:Ll/bgw0;

    .line 51
    .line 52
    iget-object v4, v0, Ll/oqr0;->b:Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-static {v3}, Ll/oqr0;->c(Ll/bgw0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3}, Ll/bgw0;->q()I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    const-string v6, "{"

    .line 62
    .line 63
    const/4 v7, 0x5

    .line 64
    const-string v8, ""

    .line 65
    .line 66
    const/4 v10, 0x1

    .line 67
    if-ge v5, v7, :cond_1

    .line 68
    .line 69
    :goto_1
    const/4 v5, 0x0

    .line 70
    goto/16 :goto_5

    .line 71
    .line 72
    :cond_1
    sget-object v5, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 73
    .line 74
    invoke-virtual {v3, v7, v5}, Ll/bgw0;->a(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    const-string v7, "::cue"

    .line 79
    .line 80
    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    if-nez v5, :cond_2

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_2
    invoke-virtual {v3}, Ll/bgw0;->s()I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    invoke-static {v3, v4}, Ll/oqr0;->a(Ll/bgw0;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v7

    .line 95
    if-nez v7, :cond_3

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_3
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v11

    .line 102
    if-eqz v11, :cond_4

    .line 103
    .line 104
    invoke-virtual {v3, v5}, Ll/bgw0;->k(I)V

    .line 105
    .line 106
    .line 107
    move-object v5, v8

    .line 108
    goto :goto_5

    .line 109
    :cond_4
    const-string v5, "("

    .line 110
    .line 111
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    if-eqz v5, :cond_7

    .line 116
    .line 117
    invoke-virtual {v3}, Ll/bgw0;->s()I

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    invoke-virtual {v3}, Ll/bgw0;->t()I

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    move v11, v2

    .line 126
    :goto_2
    if-ge v5, v7, :cond_6

    .line 127
    .line 128
    if-nez v11, :cond_6

    .line 129
    .line 130
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 131
    .line 132
    .line 133
    move-result-object v11

    .line 134
    add-int/lit8 v12, v5, 0x1

    .line 135
    .line 136
    aget-byte v5, v11, v5

    .line 137
    .line 138
    int-to-char v5, v5

    .line 139
    const/16 v11, 0x29

    .line 140
    .line 141
    if-ne v5, v11, :cond_5

    .line 142
    .line 143
    move v11, v10

    .line 144
    goto :goto_3

    .line 145
    :cond_5
    move v11, v2

    .line 146
    :goto_3
    move v5, v12

    .line 147
    goto :goto_2

    .line 148
    :cond_6
    add-int/lit8 v5, v5, -0x1

    .line 149
    .line 150
    invoke-virtual {v3}, Ll/bgw0;->s()I

    .line 151
    .line 152
    .line 153
    move-result v7

    .line 154
    sub-int/2addr v5, v7

    .line 155
    sget-object v7, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 156
    .line 157
    invoke-virtual {v3, v5, v7}, Ll/bgw0;->a(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v5

    .line 165
    goto :goto_4

    .line 166
    :cond_7
    const/4 v5, 0x0

    .line 167
    :goto_4
    invoke-static {v3, v4}, Ll/oqr0;->a(Ll/bgw0;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    const-string v4, ")"

    .line 172
    .line 173
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    if-nez v3, :cond_8

    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_8
    :goto_5
    if-eqz v5, :cond_2c

    .line 181
    .line 182
    iget-object v3, v0, Ll/oqr0;->a:Ll/bgw0;

    .line 183
    .line 184
    iget-object v4, v0, Ll/oqr0;->b:Ljava/lang/StringBuilder;

    .line 185
    .line 186
    invoke-static {v3, v4}, Ll/oqr0;->a(Ll/bgw0;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result v3

    .line 194
    if-nez v3, :cond_9

    .line 195
    .line 196
    goto/16 :goto_13

    .line 197
    .line 198
    :cond_9
    new-instance v3, Ll/pqr0;

    .line 199
    .line 200
    invoke-direct {v3}, Ll/pqr0;-><init>()V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v4

    .line 207
    if-eqz v4, :cond_b

    .line 208
    .line 209
    :cond_a
    :goto_6
    move v4, v2

    .line 210
    const/4 v5, 0x0

    .line 211
    goto :goto_8

    .line 212
    :cond_b
    const/16 v4, 0x5b

    .line 213
    .line 214
    invoke-virtual {v5, v4}, Ljava/lang/String;->indexOf(I)I

    .line 215
    .line 216
    .line 217
    move-result v4

    .line 218
    const/4 v6, -0x1

    .line 219
    if-eq v4, v6, :cond_d

    .line 220
    .line 221
    sget-object v7, Ll/oqr0;->c:Ljava/util/regex/Pattern;

    .line 222
    .line 223
    invoke-virtual {v5, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v11

    .line 227
    invoke-virtual {v7, v11}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 228
    .line 229
    .line 230
    move-result-object v7

    .line 231
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    .line 232
    .line 233
    .line 234
    move-result v11

    .line 235
    if-eqz v11, :cond_c

    .line 236
    .line 237
    invoke-virtual {v7, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v7

    .line 241
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v3, v7}, Ll/pqr0;->w(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    :cond_c
    invoke-virtual {v5, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v5

    .line 251
    :cond_d
    sget v4, Ll/mpw0;->a:I

    .line 252
    .line 253
    const-string v4, "\\."

    .line 254
    .line 255
    invoke-virtual {v5, v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v4

    .line 259
    aget-object v5, v4, v2

    .line 260
    .line 261
    const/16 v7, 0x23

    .line 262
    .line 263
    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(I)I

    .line 264
    .line 265
    .line 266
    move-result v7

    .line 267
    if-eq v7, v6, :cond_e

    .line 268
    .line 269
    invoke-virtual {v5, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v6

    .line 273
    invoke-virtual {v3, v6}, Ll/pqr0;->v(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    add-int/lit8 v7, v7, 0x1

    .line 277
    .line 278
    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v5

    .line 282
    invoke-virtual {v3, v5}, Ll/pqr0;->u(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    goto :goto_7

    .line 286
    :cond_e
    invoke-virtual {v3, v5}, Ll/pqr0;->v(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    :goto_7
    array-length v5, v4

    .line 290
    if-le v5, v10, :cond_a

    .line 291
    .line 292
    invoke-static {v4, v10, v5}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v4

    .line 296
    check-cast v4, [Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {v3, v4}, Ll/pqr0;->t([Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    goto :goto_6

    .line 302
    :goto_8
    const-string v6, "}"

    .line 303
    .line 304
    if-nez v4, :cond_2a

    .line 305
    .line 306
    iget-object v4, v0, Ll/oqr0;->a:Ll/bgw0;

    .line 307
    .line 308
    iget-object v5, v0, Ll/oqr0;->b:Ljava/lang/StringBuilder;

    .line 309
    .line 310
    invoke-virtual {v4}, Ll/bgw0;->s()I

    .line 311
    .line 312
    .line 313
    move-result v7

    .line 314
    invoke-static {v4, v5}, Ll/oqr0;->a(Ll/bgw0;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v5

    .line 318
    if-eqz v5, :cond_f

    .line 319
    .line 320
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 321
    .line 322
    .line 323
    move-result v4

    .line 324
    if-eqz v4, :cond_10

    .line 325
    .line 326
    :cond_f
    move v4, v10

    .line 327
    goto :goto_9

    .line 328
    :cond_10
    move v4, v2

    .line 329
    :goto_9
    if-nez v4, :cond_11

    .line 330
    .line 331
    iget-object v11, v0, Ll/oqr0;->a:Ll/bgw0;

    .line 332
    .line 333
    invoke-virtual {v11, v7}, Ll/bgw0;->k(I)V

    .line 334
    .line 335
    .line 336
    iget-object v7, v0, Ll/oqr0;->a:Ll/bgw0;

    .line 337
    .line 338
    iget-object v11, v0, Ll/oqr0;->b:Ljava/lang/StringBuilder;

    .line 339
    .line 340
    invoke-static {v7}, Ll/oqr0;->c(Ll/bgw0;)V

    .line 341
    .line 342
    .line 343
    invoke-static {v7, v11}, Ll/oqr0;->d(Ll/bgw0;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v12

    .line 347
    invoke-virtual {v8, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    move-result v13

    .line 351
    if-eqz v13, :cond_12

    .line 352
    .line 353
    :cond_11
    :goto_a
    const/16 p1, 0x0

    .line 354
    .line 355
    goto/16 :goto_12

    .line 356
    .line 357
    :cond_12
    invoke-static {v7, v11}, Ll/oqr0;->a(Ll/bgw0;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v13

    .line 361
    const-string v14, ":"

    .line 362
    .line 363
    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 364
    .line 365
    .line 366
    move-result v13

    .line 367
    if-nez v13, :cond_13

    .line 368
    .line 369
    goto :goto_a

    .line 370
    :cond_13
    invoke-static {v7}, Ll/oqr0;->c(Ll/bgw0;)V

    .line 371
    .line 372
    .line 373
    new-instance v13, Ljava/lang/StringBuilder;

    .line 374
    .line 375
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 376
    .line 377
    .line 378
    move v14, v2

    .line 379
    :goto_b
    const-string v15, ";"

    .line 380
    .line 381
    if-nez v14, :cond_17

    .line 382
    .line 383
    invoke-virtual {v7}, Ll/bgw0;->s()I

    .line 384
    .line 385
    .line 386
    move-result v2

    .line 387
    const/16 p1, 0x0

    .line 388
    .line 389
    invoke-static {v7, v11}, Ll/oqr0;->a(Ll/bgw0;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object v9

    .line 393
    if-nez v9, :cond_14

    .line 394
    .line 395
    move-object/from16 v2, p1

    .line 396
    .line 397
    goto :goto_e

    .line 398
    :cond_14
    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 399
    .line 400
    .line 401
    move-result v16

    .line 402
    if-nez v16, :cond_16

    .line 403
    .line 404
    invoke-virtual {v15, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 405
    .line 406
    .line 407
    move-result v15

    .line 408
    if-eqz v15, :cond_15

    .line 409
    .line 410
    goto :goto_d

    .line 411
    :cond_15
    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    :goto_c
    const/4 v2, 0x0

    .line 415
    goto :goto_b

    .line 416
    :cond_16
    :goto_d
    invoke-virtual {v7, v2}, Ll/bgw0;->k(I)V

    .line 417
    .line 418
    .line 419
    move v14, v10

    .line 420
    goto :goto_c

    .line 421
    :cond_17
    const/16 p1, 0x0

    .line 422
    .line 423
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    :goto_e
    if-eqz v2, :cond_29

    .line 428
    .line 429
    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 430
    .line 431
    .line 432
    move-result v9

    .line 433
    if-eqz v9, :cond_18

    .line 434
    .line 435
    goto/16 :goto_12

    .line 436
    .line 437
    :cond_18
    invoke-virtual {v7}, Ll/bgw0;->s()I

    .line 438
    .line 439
    .line 440
    move-result v9

    .line 441
    invoke-static {v7, v11}, Ll/oqr0;->a(Ll/bgw0;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 442
    .line 443
    .line 444
    move-result-object v11

    .line 445
    invoke-virtual {v15, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 446
    .line 447
    .line 448
    move-result v13

    .line 449
    if-eqz v13, :cond_19

    .line 450
    .line 451
    goto :goto_f

    .line 452
    :cond_19
    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 453
    .line 454
    .line 455
    move-result v6

    .line 456
    if-eqz v6, :cond_29

    .line 457
    .line 458
    invoke-virtual {v7, v9}, Ll/bgw0;->k(I)V

    .line 459
    .line 460
    .line 461
    :goto_f
    const-string v6, "color"

    .line 462
    .line 463
    invoke-virtual {v6, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 464
    .line 465
    .line 466
    move-result v6

    .line 467
    if-eqz v6, :cond_1a

    .line 468
    .line 469
    invoke-static {v2}, Ll/aiv0;->a(Ljava/lang/String;)I

    .line 470
    .line 471
    .line 472
    move-result v2

    .line 473
    invoke-virtual {v3, v2}, Ll/pqr0;->l(I)Ll/pqr0;

    .line 474
    .line 475
    .line 476
    goto/16 :goto_12

    .line 477
    .line 478
    :cond_1a
    const-string v6, "background-color"

    .line 479
    .line 480
    invoke-virtual {v6, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 481
    .line 482
    .line 483
    move-result v6

    .line 484
    if-eqz v6, :cond_1b

    .line 485
    .line 486
    invoke-static {v2}, Ll/aiv0;->a(Ljava/lang/String;)I

    .line 487
    .line 488
    .line 489
    move-result v2

    .line 490
    invoke-virtual {v3, v2}, Ll/pqr0;->i(I)Ll/pqr0;

    .line 491
    .line 492
    .line 493
    goto/16 :goto_12

    .line 494
    .line 495
    :cond_1b
    const-string v6, "ruby-position"

    .line 496
    .line 497
    invoke-virtual {v6, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 498
    .line 499
    .line 500
    move-result v6

    .line 501
    const/4 v7, 0x2

    .line 502
    if-eqz v6, :cond_1d

    .line 503
    .line 504
    const-string v6, "over"

    .line 505
    .line 506
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 507
    .line 508
    .line 509
    move-result v6

    .line 510
    if-eqz v6, :cond_1c

    .line 511
    .line 512
    invoke-virtual {v3, v10}, Ll/pqr0;->q(I)Ll/pqr0;

    .line 513
    .line 514
    .line 515
    goto/16 :goto_12

    .line 516
    .line 517
    :cond_1c
    const-string v6, "under"

    .line 518
    .line 519
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 520
    .line 521
    .line 522
    move-result v2

    .line 523
    if-eqz v2, :cond_29

    .line 524
    .line 525
    invoke-virtual {v3, v7}, Ll/pqr0;->q(I)Ll/pqr0;

    .line 526
    .line 527
    .line 528
    goto/16 :goto_12

    .line 529
    .line 530
    :cond_1d
    const-string v6, "text-combine-upright"

    .line 531
    .line 532
    invoke-virtual {v6, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 533
    .line 534
    .line 535
    move-result v6

    .line 536
    if-eqz v6, :cond_20

    .line 537
    .line 538
    const-string v6, "all"

    .line 539
    .line 540
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 541
    .line 542
    .line 543
    move-result v6

    .line 544
    if-nez v6, :cond_1e

    .line 545
    .line 546
    const-string v6, "digits"

    .line 547
    .line 548
    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 549
    .line 550
    .line 551
    move-result v2

    .line 552
    if-eqz v2, :cond_1f

    .line 553
    .line 554
    :cond_1e
    move v2, v10

    .line 555
    goto :goto_10

    .line 556
    :cond_1f
    const/4 v2, 0x0

    .line 557
    :goto_10
    invoke-virtual {v3, v2}, Ll/pqr0;->k(Z)Ll/pqr0;

    .line 558
    .line 559
    .line 560
    goto/16 :goto_12

    .line 561
    .line 562
    :cond_20
    const-string v6, "text-decoration"

    .line 563
    .line 564
    invoke-virtual {v6, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 565
    .line 566
    .line 567
    move-result v6

    .line 568
    if-eqz v6, :cond_21

    .line 569
    .line 570
    const-string v6, "underline"

    .line 571
    .line 572
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 573
    .line 574
    .line 575
    move-result v2

    .line 576
    if-eqz v2, :cond_29

    .line 577
    .line 578
    invoke-virtual {v3, v10}, Ll/pqr0;->r(Z)Ll/pqr0;

    .line 579
    .line 580
    .line 581
    goto/16 :goto_12

    .line 582
    .line 583
    :cond_21
    const-string v6, "font-family"

    .line 584
    .line 585
    invoke-virtual {v6, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 586
    .line 587
    .line 588
    move-result v6

    .line 589
    if-eqz v6, :cond_22

    .line 590
    .line 591
    invoke-virtual {v3, v2}, Ll/pqr0;->m(Ljava/lang/String;)Ll/pqr0;

    .line 592
    .line 593
    .line 594
    goto/16 :goto_12

    .line 595
    .line 596
    :cond_22
    const-string v6, "font-weight"

    .line 597
    .line 598
    invoke-virtual {v6, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 599
    .line 600
    .line 601
    move-result v6

    .line 602
    if-eqz v6, :cond_23

    .line 603
    .line 604
    const-string v6, "bold"

    .line 605
    .line 606
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 607
    .line 608
    .line 609
    move-result v2

    .line 610
    if-eqz v2, :cond_29

    .line 611
    .line 612
    invoke-virtual {v3, v10}, Ll/pqr0;->j(Z)Ll/pqr0;

    .line 613
    .line 614
    .line 615
    goto/16 :goto_12

    .line 616
    .line 617
    :cond_23
    const-string v6, "font-style"

    .line 618
    .line 619
    invoke-virtual {v6, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 620
    .line 621
    .line 622
    move-result v6

    .line 623
    if-eqz v6, :cond_24

    .line 624
    .line 625
    const-string v6, "italic"

    .line 626
    .line 627
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 628
    .line 629
    .line 630
    move-result v2

    .line 631
    if-eqz v2, :cond_29

    .line 632
    .line 633
    invoke-virtual {v3, v10}, Ll/pqr0;->p(Z)Ll/pqr0;

    .line 634
    .line 635
    .line 636
    goto/16 :goto_12

    .line 637
    .line 638
    :cond_24
    const-string v6, "font-size"

    .line 639
    .line 640
    invoke-virtual {v6, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 641
    .line 642
    .line 643
    move-result v6

    .line 644
    if-eqz v6, :cond_29

    .line 645
    .line 646
    sget-object v6, Ll/oqr0;->d:Ljava/util/regex/Pattern;

    .line 647
    .line 648
    invoke-static {v2}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 649
    .line 650
    .line 651
    move-result-object v9

    .line 652
    invoke-virtual {v6, v9}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 653
    .line 654
    .line 655
    move-result-object v6

    .line 656
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    .line 657
    .line 658
    .line 659
    move-result v9

    .line 660
    if-nez v9, :cond_25

    .line 661
    .line 662
    new-instance v6, Ljava/lang/StringBuilder;

    .line 663
    .line 664
    const-string v7, "Invalid font-size: \'"

    .line 665
    .line 666
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 667
    .line 668
    .line 669
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 670
    .line 671
    .line 672
    const-string v2, "\'."

    .line 673
    .line 674
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 675
    .line 676
    .line 677
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 678
    .line 679
    .line 680
    move-result-object v2

    .line 681
    const-string v6, "WebvttCssParser"

    .line 682
    .line 683
    invoke-static {v6, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 684
    .line 685
    .line 686
    goto :goto_12

    .line 687
    :cond_25
    invoke-virtual {v6, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 688
    .line 689
    .line 690
    move-result-object v2

    .line 691
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 692
    .line 693
    .line 694
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 695
    .line 696
    .line 697
    move-result v9

    .line 698
    const/16 v11, 0x25

    .line 699
    .line 700
    if-eq v9, v11, :cond_27

    .line 701
    .line 702
    const/16 v11, 0xca8

    .line 703
    .line 704
    if-eq v9, v11, :cond_26

    .line 705
    .line 706
    const/16 v7, 0xe08

    .line 707
    .line 708
    if-ne v9, v7, :cond_28

    .line 709
    .line 710
    const-string v7, "px"

    .line 711
    .line 712
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 713
    .line 714
    .line 715
    move-result v2

    .line 716
    if-eqz v2, :cond_28

    .line 717
    .line 718
    invoke-virtual {v3, v10}, Ll/pqr0;->o(I)Ll/pqr0;

    .line 719
    .line 720
    .line 721
    goto :goto_11

    .line 722
    :cond_26
    const-string v9, "em"

    .line 723
    .line 724
    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 725
    .line 726
    .line 727
    move-result v2

    .line 728
    if-eqz v2, :cond_28

    .line 729
    .line 730
    invoke-virtual {v3, v7}, Ll/pqr0;->o(I)Ll/pqr0;

    .line 731
    .line 732
    .line 733
    goto :goto_11

    .line 734
    :cond_27
    const-string v7, "%"

    .line 735
    .line 736
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 737
    .line 738
    .line 739
    move-result v2

    .line 740
    if-eqz v2, :cond_28

    .line 741
    .line 742
    const/4 v2, 0x3

    .line 743
    invoke-virtual {v3, v2}, Ll/pqr0;->o(I)Ll/pqr0;

    .line 744
    .line 745
    .line 746
    :goto_11
    invoke-virtual {v6, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 747
    .line 748
    .line 749
    move-result-object v2

    .line 750
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 751
    .line 752
    .line 753
    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 754
    .line 755
    .line 756
    move-result v2

    .line 757
    invoke-virtual {v3, v2}, Ll/pqr0;->n(F)Ll/pqr0;

    .line 758
    .line 759
    .line 760
    goto :goto_12

    .line 761
    :cond_28
    invoke-static {}, Ll/wpg0;->a()V

    .line 762
    .line 763
    .line 764
    return-object p1

    .line 765
    :cond_29
    :goto_12
    const/4 v2, 0x0

    .line 766
    goto/16 :goto_8

    .line 767
    .line 768
    :cond_2a
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 769
    .line 770
    .line 771
    move-result v2

    .line 772
    if-eqz v2, :cond_2b

    .line 773
    .line 774
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 775
    .line 776
    .line 777
    :cond_2b
    const/4 v2, 0x0

    .line 778
    goto/16 :goto_0

    .line 779
    .line 780
    :cond_2c
    :goto_13
    return-object v1
.end method
