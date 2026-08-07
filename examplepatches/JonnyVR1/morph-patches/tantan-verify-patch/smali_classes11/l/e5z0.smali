.class public final Ll/e5z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[Ll/w70;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget-object v0, Ll/zgc0;->a:[I

    .line 9
    .line 10
    invoke-virtual {p1, p2, v0}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget p2, Ll/zgc0;->b:I

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    sget v0, Ll/zgc0;->c:I

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    const/4 v3, 0x0

    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    invoke-static {p2}, Ll/e5z0;->c(Ljava/lang/String;)[Ll/w70;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    iput-object p2, p0, Ll/e5z0;->a:[Ll/w70;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    if-eqz v1, :cond_2

    .line 47
    .line 48
    if-nez v2, :cond_2

    .line 49
    .line 50
    invoke-static {v0}, Ll/e5z0;->c(Ljava/lang/String;)[Ll/w70;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    iput-object p2, p0, Ll/e5z0;->a:[Ll/w70;

    .line 55
    .line 56
    :goto_0
    sget p2, Ll/zgc0;->d:I

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    iput-object p2, p0, Ll/e5z0;->b:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 65
    .line 66
    .line 67
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_1

    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    const-string p0, "Required XML attribute \"adUnitId\" was missing."

    .line 75
    .line 76
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    throw v3

    .line 80
    :cond_2
    if-nez v1, :cond_3

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 83
    .line 84
    .line 85
    const-string p0, "Either XML attribute \"adSize\" or XML attribute \"supportedAdSizes\" should be specified, but not both."

    .line 86
    .line 87
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    throw v3

    .line 91
    :cond_3
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 92
    .line 93
    .line 94
    const-string p0, "Required XML attribute \"adSize\" was missing."

    .line 95
    .line 96
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    throw v3
.end method

.method public static c(Ljava/lang/String;)[Ll/w70;
    .locals 13

    .line 1
    const-string v0, "\\s*,\\s*"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    array-length v1, v0

    .line 8
    new-array v2, v1, [Ll/w70;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    move v4, v3

    .line 12
    :goto_0
    array-length v5, v0

    .line 13
    const/4 v6, 0x0

    .line 14
    const-string v7, "Could not parse XML attribute \"adSize\": "

    .line 15
    .line 16
    if-ge v4, v5, :cond_c

    .line 17
    .line 18
    aget-object v5, v0, v4

    .line 19
    .line 20
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    const-string v8, "^(\\d+|FULL_WIDTH)\\s*[xX]\\s*(\\d+|AUTO_HEIGHT)$"

    .line 25
    .line 26
    invoke-virtual {v5, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v8

    .line 30
    if-eqz v8, :cond_2

    .line 31
    .line 32
    const-string v8, "[xX]"

    .line 33
    .line 34
    invoke-virtual {v5, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v8

    .line 38
    aget-object v9, v8, v3

    .line 39
    .line 40
    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v9

    .line 44
    aput-object v9, v8, v3

    .line 45
    .line 46
    const/4 v9, 0x1

    .line 47
    aget-object v10, v8, v9

    .line 48
    .line 49
    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v10

    .line 53
    aput-object v10, v8, v9

    .line 54
    .line 55
    :try_start_0
    const-string v10, "FULL_WIDTH"

    .line 56
    .line 57
    aget-object v11, v8, v3

    .line 58
    .line 59
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v10

    .line 63
    if-eqz v10, :cond_0

    .line 64
    .line 65
    const/4 v10, -0x1

    .line 66
    goto :goto_1

    .line 67
    :cond_0
    aget-object v10, v8, v3

    .line 68
    .line 69
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v10

    .line 73
    :goto_1
    const-string v11, "AUTO_HEIGHT"

    .line 74
    .line 75
    aget-object v12, v8, v9

    .line 76
    .line 77
    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v11

    .line 81
    if-eqz v11, :cond_1

    .line 82
    .line 83
    const/4 v5, -0x2

    .line 84
    goto :goto_2

    .line 85
    :cond_1
    aget-object v8, v8, v9

    .line 86
    .line 87
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v5
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    :goto_2
    new-instance v6, Ll/w70;

    .line 92
    .line 93
    invoke-direct {v6, v10, v5}, Ll/w70;-><init>(II)V

    .line 94
    .line 95
    .line 96
    aput-object v6, v2, v4

    .line 97
    .line 98
    goto/16 :goto_3

    .line 99
    .line 100
    :catch_0
    invoke-virtual {v7, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-object v6

    .line 108
    :cond_2
    const-string v8, "BANNER"

    .line 109
    .line 110
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v8

    .line 114
    if-eqz v8, :cond_3

    .line 115
    .line 116
    sget-object v5, Ll/w70;->i:Ll/w70;

    .line 117
    .line 118
    aput-object v5, v2, v4

    .line 119
    .line 120
    goto/16 :goto_3

    .line 121
    .line 122
    :cond_3
    const-string v8, "LARGE_BANNER"

    .line 123
    .line 124
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v8

    .line 128
    if-eqz v8, :cond_4

    .line 129
    .line 130
    sget-object v5, Ll/w70;->k:Ll/w70;

    .line 131
    .line 132
    aput-object v5, v2, v4

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_4
    const-string v8, "FULL_BANNER"

    .line 136
    .line 137
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v8

    .line 141
    if-eqz v8, :cond_5

    .line 142
    .line 143
    sget-object v5, Ll/w70;->j:Ll/w70;

    .line 144
    .line 145
    aput-object v5, v2, v4

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :cond_5
    const-string v8, "LEADERBOARD"

    .line 149
    .line 150
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v8

    .line 154
    if-eqz v8, :cond_6

    .line 155
    .line 156
    sget-object v5, Ll/w70;->l:Ll/w70;

    .line 157
    .line 158
    aput-object v5, v2, v4

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_6
    const-string v8, "MEDIUM_RECTANGLE"

    .line 162
    .line 163
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v8

    .line 167
    if-eqz v8, :cond_7

    .line 168
    .line 169
    sget-object v5, Ll/w70;->m:Ll/w70;

    .line 170
    .line 171
    aput-object v5, v2, v4

    .line 172
    .line 173
    goto :goto_3

    .line 174
    :cond_7
    const-string v8, "SMART_BANNER"

    .line 175
    .line 176
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v8

    .line 180
    if-eqz v8, :cond_8

    .line 181
    .line 182
    sget-object v5, Ll/w70;->o:Ll/w70;

    .line 183
    .line 184
    aput-object v5, v2, v4

    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_8
    const-string v8, "WIDE_SKYSCRAPER"

    .line 188
    .line 189
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v8

    .line 193
    if-eqz v8, :cond_9

    .line 194
    .line 195
    sget-object v5, Ll/w70;->n:Ll/w70;

    .line 196
    .line 197
    aput-object v5, v2, v4

    .line 198
    .line 199
    goto :goto_3

    .line 200
    :cond_9
    const-string v8, "FLUID"

    .line 201
    .line 202
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v8

    .line 206
    if-eqz v8, :cond_a

    .line 207
    .line 208
    sget-object v5, Ll/w70;->p:Ll/w70;

    .line 209
    .line 210
    aput-object v5, v2, v4

    .line 211
    .line 212
    goto :goto_3

    .line 213
    :cond_a
    const-string v8, "ICON"

    .line 214
    .line 215
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v8

    .line 219
    if-eqz v8, :cond_b

    .line 220
    .line 221
    sget-object v5, Ll/w70;->s:Ll/w70;

    .line 222
    .line 223
    aput-object v5, v2, v4

    .line 224
    .line 225
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 226
    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :cond_b
    invoke-virtual {v7, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    return-object v6

    .line 237
    :cond_c
    if-eqz v1, :cond_d

    .line 238
    .line 239
    return-object v2

    .line 240
    :cond_d
    invoke-virtual {v7, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    return-object v6
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e5z0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Z)[Ll/w70;
    .locals 1

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Ll/e5z0;->a:[Ll/w70;

    .line 4
    .line 5
    array-length p1, p1

    .line 6
    const/4 v0, 0x1

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "The adSizes XML attribute is only allowed on PublisherAdViews."

    .line 11
    .line 12
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/e5z0;->a:[Ll/w70;

    .line 18
    .line 19
    return-object p0
.end method
