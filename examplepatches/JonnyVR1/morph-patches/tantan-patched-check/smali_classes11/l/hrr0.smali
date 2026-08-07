.class public final Ll/hrr0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/regex/Pattern;

.field public static final b:Ljava/util/regex/Pattern;

.field public static final c:Ljava/util/Map;

.field public static final d:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-string v0, "^(\\S+)\\s+-->\\s+(\\S+)(.*)?$"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/hrr0;->a:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    const-string v0, "(\\S+?):(\\S+)"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/hrr0;->b:Ljava/util/regex/Pattern;

    .line 16
    .line 17
    new-instance v0, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    const/16 v1, 0xff

    .line 23
    .line 24
    invoke-static {v1, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const-string v3, "white"

    .line 33
    .line 34
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-static {v2, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    const-string v4, "lime"

    .line 47
    .line 48
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    invoke-static {v2, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    const-string v4, "cyan"

    .line 60
    .line 61
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    invoke-static {v1, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    const-string v4, "red"

    .line 73
    .line 74
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    invoke-static {v1, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    const-string v4, "yellow"

    .line 86
    .line 87
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    invoke-static {v1, v2, v1}, Landroid/graphics/Color;->rgb(III)I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    const-string v4, "magenta"

    .line 99
    .line 100
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    invoke-static {v2, v2, v1}, Landroid/graphics/Color;->rgb(III)I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    const-string v4, "blue"

    .line 112
    .line 113
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    const-string v4, "black"

    .line 125
    .line 126
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    sput-object v0, Ll/hrr0;->c:Ljava/util/Map;

    .line 134
    .line 135
    new-instance v0, Ljava/util/HashMap;

    .line 136
    .line 137
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-static {v1, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    const-string v4, "bg_white"

    .line 149
    .line 150
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    invoke-static {v2, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    const-string v4, "bg_lime"

    .line 162
    .line 163
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    invoke-static {v2, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    const-string v4, "bg_cyan"

    .line 175
    .line 176
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    invoke-static {v1, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    const-string v4, "bg_red"

    .line 188
    .line 189
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    invoke-static {v1, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    const-string v4, "bg_yellow"

    .line 201
    .line 202
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    invoke-static {v1, v2, v1}, Landroid/graphics/Color;->rgb(III)I

    .line 206
    .line 207
    .line 208
    move-result v3

    .line 209
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    const-string v4, "bg_magenta"

    .line 214
    .line 215
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    invoke-static {v2, v2, v1}, Landroid/graphics/Color;->rgb(III)I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    const-string v3, "bg_blue"

    .line 227
    .line 228
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    const-string v2, "bg_black"

    .line 240
    .line 241
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    sput-object v0, Ll/hrr0;->d:Ljava/util/Map;

    .line 249
    .line 250
    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Landroid/text/SpannedString;
    .locals 13
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayDeque;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    move v4, v3

    .line 18
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    if-lt v4, v5, :cond_1

    .line 23
    .line 24
    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Ll/err0;

    .line 35
    .line 36
    invoke-static {p0, p1, v2, v0, p2}, Ll/hrr0;->g(Ljava/lang/String;Ll/err0;Ljava/util/List;Landroid/text/SpannableStringBuilder;Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    invoke-static {}, Ll/err0;->b()Ll/err0;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 45
    .line 46
    invoke-static {p0, p1, v1, v0, p2}, Ll/hrr0;->g(Ljava/lang/String;Ll/err0;Ljava/util/List;Landroid/text/SpannableStringBuilder;Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0}, Landroid/text/SpannedString;->valueOf(Ljava/lang/CharSequence;)Landroid/text/SpannedString;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_1
    add-int/lit8 v5, v4, 0x1

    .line 55
    .line 56
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    const/16 v7, 0x3e

    .line 61
    .line 62
    const/16 v8, 0x3c

    .line 63
    .line 64
    const/16 v9, 0x26

    .line 65
    .line 66
    const/4 v10, -0x1

    .line 67
    if-eq v6, v9, :cond_16

    .line 68
    .line 69
    if-eq v6, v8, :cond_2

    .line 70
    .line 71
    invoke-virtual {v0, v6}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 72
    .line 73
    .line 74
    goto/16 :goto_8

    .line 75
    .line 76
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    if-lt v5, v6, :cond_3

    .line 81
    .line 82
    goto/16 :goto_8

    .line 83
    .line 84
    :cond_3
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    invoke-virtual {p1, v7, v5}, Ljava/lang/String;->indexOf(II)I

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    if-ne v5, v10, :cond_4

    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    goto :goto_2

    .line 99
    :cond_4
    add-int/lit8 v5, v5, 0x1

    .line 100
    .line 101
    :goto_2
    add-int/lit8 v7, v5, -0x2

    .line 102
    .line 103
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    .line 104
    .line 105
    .line 106
    move-result v8

    .line 107
    const/16 v9, 0x2f

    .line 108
    .line 109
    const/4 v10, 0x1

    .line 110
    if-ne v8, v9, :cond_5

    .line 111
    .line 112
    move v8, v10

    .line 113
    goto :goto_3

    .line 114
    :cond_5
    move v8, v3

    .line 115
    :goto_3
    const/4 v11, 0x2

    .line 116
    if-ne v6, v9, :cond_6

    .line 117
    .line 118
    move v12, v11

    .line 119
    goto :goto_4

    .line 120
    :cond_6
    move v12, v10

    .line 121
    :goto_4
    add-int/2addr v4, v12

    .line 122
    if-eqz v8, :cond_7

    .line 123
    .line 124
    goto :goto_5

    .line 125
    :cond_7
    add-int/lit8 v7, v5, -0x1

    .line 126
    .line 127
    :goto_5
    invoke-virtual {p1, v4, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v7

    .line 135
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    .line 136
    .line 137
    .line 138
    move-result v7

    .line 139
    if-eqz v7, :cond_8

    .line 140
    .line 141
    goto/16 :goto_8

    .line 142
    .line 143
    :cond_8
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    .line 148
    .line 149
    .line 150
    move-result v12

    .line 151
    xor-int/2addr v10, v12

    .line 152
    invoke-static {v10}, Ll/lev0;->d(Z)V

    .line 153
    .line 154
    .line 155
    sget v10, Ll/mpw0;->a:I

    .line 156
    .line 157
    const-string v10, "[ \\.]"

    .line 158
    .line 159
    invoke-virtual {v7, v10, v11}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v7

    .line 163
    aget-object v7, v7, v3

    .line 164
    .line 165
    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    .line 166
    .line 167
    .line 168
    move-result v10

    .line 169
    const/16 v11, 0x62

    .line 170
    .line 171
    if-eq v10, v11, :cond_10

    .line 172
    .line 173
    const/16 v11, 0x63

    .line 174
    .line 175
    if-eq v10, v11, :cond_f

    .line 176
    .line 177
    const/16 v11, 0x69

    .line 178
    .line 179
    if-eq v10, v11, :cond_e

    .line 180
    .line 181
    const/16 v11, 0xe42

    .line 182
    .line 183
    if-eq v10, v11, :cond_d

    .line 184
    .line 185
    const v11, 0x3291ee

    .line 186
    .line 187
    .line 188
    if-eq v10, v11, :cond_c

    .line 189
    .line 190
    const v11, 0x3595da

    .line 191
    .line 192
    .line 193
    if-eq v10, v11, :cond_b

    .line 194
    .line 195
    const/16 v11, 0x75

    .line 196
    .line 197
    if-eq v10, v11, :cond_a

    .line 198
    .line 199
    const/16 v11, 0x76

    .line 200
    .line 201
    if-eq v10, v11, :cond_9

    .line 202
    .line 203
    goto/16 :goto_8

    .line 204
    .line 205
    :cond_9
    const-string v10, "v"

    .line 206
    .line 207
    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v10

    .line 211
    if-eqz v10, :cond_15

    .line 212
    .line 213
    goto :goto_6

    .line 214
    :cond_a
    const-string v10, "u"

    .line 215
    .line 216
    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v10

    .line 220
    if-eqz v10, :cond_15

    .line 221
    .line 222
    goto :goto_6

    .line 223
    :cond_b
    const-string v10, "ruby"

    .line 224
    .line 225
    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result v10

    .line 229
    if-eqz v10, :cond_15

    .line 230
    .line 231
    goto :goto_6

    .line 232
    :cond_c
    const-string v10, "lang"

    .line 233
    .line 234
    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result v10

    .line 238
    if-eqz v10, :cond_15

    .line 239
    .line 240
    goto :goto_6

    .line 241
    :cond_d
    const-string v10, "rt"

    .line 242
    .line 243
    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v10

    .line 247
    if-eqz v10, :cond_15

    .line 248
    .line 249
    goto :goto_6

    .line 250
    :cond_e
    const-string v10, "i"

    .line 251
    .line 252
    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result v10

    .line 256
    if-eqz v10, :cond_15

    .line 257
    .line 258
    goto :goto_6

    .line 259
    :cond_f
    const-string v10, "c"

    .line 260
    .line 261
    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result v10

    .line 265
    if-eqz v10, :cond_15

    .line 266
    .line 267
    goto :goto_6

    .line 268
    :cond_10
    const-string v10, "b"

    .line 269
    .line 270
    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result v10

    .line 274
    if-eqz v10, :cond_15

    .line 275
    .line 276
    :goto_6
    if-ne v6, v9, :cond_14

    .line 277
    .line 278
    :cond_11
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 279
    .line 280
    .line 281
    move-result v4

    .line 282
    if-eqz v4, :cond_12

    .line 283
    .line 284
    goto :goto_8

    .line 285
    :cond_12
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object v4

    .line 289
    check-cast v4, Ll/err0;

    .line 290
    .line 291
    invoke-static {p0, v4, v2, v0, p2}, Ll/hrr0;->g(Ljava/lang/String;Ll/err0;Ljava/util/List;Landroid/text/SpannableStringBuilder;Ljava/util/List;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 295
    .line 296
    .line 297
    move-result v6

    .line 298
    if-nez v6, :cond_13

    .line 299
    .line 300
    new-instance v6, Ll/drr0;

    .line 301
    .line 302
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 303
    .line 304
    .line 305
    move-result v8

    .line 306
    const/4 v9, 0x0

    .line 307
    invoke-direct {v6, v4, v8, v9}, Ll/drr0;-><init>(Ll/err0;ILl/crr0;)V

    .line 308
    .line 309
    .line 310
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 311
    .line 312
    .line 313
    goto :goto_7

    .line 314
    :cond_13
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 315
    .line 316
    .line 317
    :goto_7
    iget-object v4, v4, Ll/err0;->a:Ljava/lang/String;

    .line 318
    .line 319
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result v4

    .line 323
    if-eqz v4, :cond_11

    .line 324
    .line 325
    goto :goto_8

    .line 326
    :cond_14
    if-nez v8, :cond_15

    .line 327
    .line 328
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 329
    .line 330
    .line 331
    move-result v6

    .line 332
    invoke-static {v4, v6}, Ll/err0;->a(Ljava/lang/String;I)Ll/err0;

    .line 333
    .line 334
    .line 335
    move-result-object v4

    .line 336
    invoke-virtual {v1, v4}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 337
    .line 338
    .line 339
    :cond_15
    :goto_8
    move v4, v5

    .line 340
    goto/16 :goto_0

    .line 341
    .line 342
    :cond_16
    const/16 v4, 0x3b

    .line 343
    .line 344
    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->indexOf(II)I

    .line 345
    .line 346
    .line 347
    move-result v4

    .line 348
    const/16 v11, 0x20

    .line 349
    .line 350
    invoke-virtual {p1, v11, v5}, Ljava/lang/String;->indexOf(II)I

    .line 351
    .line 352
    .line 353
    move-result v12

    .line 354
    if-ne v4, v10, :cond_17

    .line 355
    .line 356
    move v4, v12

    .line 357
    goto :goto_9

    .line 358
    :cond_17
    if-eq v12, v10, :cond_18

    .line 359
    .line 360
    invoke-static {v4, v12}, Ljava/lang/Math;->min(II)I

    .line 361
    .line 362
    .line 363
    move-result v4

    .line 364
    :cond_18
    :goto_9
    if-eq v4, v10, :cond_1f

    .line 365
    .line 366
    invoke-virtual {p1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v5

    .line 370
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 371
    .line 372
    .line 373
    move-result v6

    .line 374
    const/16 v10, 0xced

    .line 375
    .line 376
    if-eq v6, v10, :cond_1c

    .line 377
    .line 378
    const/16 v7, 0xd88

    .line 379
    .line 380
    if-eq v6, v7, :cond_1b

    .line 381
    .line 382
    const v7, 0x179c4

    .line 383
    .line 384
    .line 385
    if-eq v6, v7, :cond_1a

    .line 386
    .line 387
    const v7, 0x337f11

    .line 388
    .line 389
    .line 390
    if-eq v6, v7, :cond_19

    .line 391
    .line 392
    goto :goto_a

    .line 393
    :cond_19
    const-string v6, "nbsp"

    .line 394
    .line 395
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 396
    .line 397
    .line 398
    move-result v6

    .line 399
    if-eqz v6, :cond_1d

    .line 400
    .line 401
    invoke-virtual {v0, v11}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 402
    .line 403
    .line 404
    goto :goto_b

    .line 405
    :cond_1a
    const-string v6, "amp"

    .line 406
    .line 407
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    move-result v6

    .line 411
    if-eqz v6, :cond_1d

    .line 412
    .line 413
    invoke-virtual {v0, v9}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 414
    .line 415
    .line 416
    goto :goto_b

    .line 417
    :cond_1b
    const-string v6, "lt"

    .line 418
    .line 419
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 420
    .line 421
    .line 422
    move-result v6

    .line 423
    if-eqz v6, :cond_1d

    .line 424
    .line 425
    invoke-virtual {v0, v8}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 426
    .line 427
    .line 428
    goto :goto_b

    .line 429
    :cond_1c
    const-string v6, "gt"

    .line 430
    .line 431
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 432
    .line 433
    .line 434
    move-result v6

    .line 435
    if-eqz v6, :cond_1d

    .line 436
    .line 437
    invoke-virtual {v0, v7}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 438
    .line 439
    .line 440
    goto :goto_b

    .line 441
    :cond_1d
    :goto_a
    new-instance v6, Ljava/lang/StringBuilder;

    .line 442
    .line 443
    const-string v7, "ignoring unsupported entity: \'&"

    .line 444
    .line 445
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 446
    .line 447
    .line 448
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    const-string v5, ";\'"

    .line 452
    .line 453
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 454
    .line 455
    .line 456
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 457
    .line 458
    .line 459
    move-result-object v5

    .line 460
    const-string v6, "WebvttCueParser"

    .line 461
    .line 462
    invoke-static {v6, v5}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    .line 464
    .line 465
    :goto_b
    if-ne v4, v12, :cond_1e

    .line 466
    .line 467
    const-string v5, " "

    .line 468
    .line 469
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 470
    .line 471
    .line 472
    :cond_1e
    add-int/lit8 v4, v4, 0x1

    .line 473
    .line 474
    goto/16 :goto_0

    .line 475
    .line 476
    :cond_1f
    invoke-virtual {v0, v6}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 477
    .line 478
    .line 479
    goto/16 :goto_8
.end method

.method public static b(Ljava/lang/String;)Ll/j2v0;
    .locals 1

    .line 1
    new-instance v0, Ll/grr0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/grr0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/hrr0;->h(Ljava/lang/String;Ll/grr0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Ll/grr0;->a()Ll/j2v0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static c(Ll/bgw0;Ljava/util/List;)Ll/arr0;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget-object v3, Ll/hrr0;->a:Ljava/util/regex/Pattern;

    .line 12
    .line 13
    invoke-virtual {v3, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    if-nez v5, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {v3, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v1, v0, p0, p1}, Ll/hrr0;->e(Ljava/lang/String;Ljava/util/regex/Matcher;Ll/bgw0;Ljava/util/List;)Ll/arr0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_1
    :goto_0
    return-object v2

    .line 49
    :cond_2
    invoke-static {v2, v4, p0, p1}, Ll/hrr0;->e(Ljava/lang/String;Ljava/util/regex/Matcher;Ll/bgw0;Ljava/util/List;)Ll/arr0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public static d(Ljava/util/List;Ljava/lang/String;Ll/err0;)I
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p0, p1, p2}, Ll/hrr0;->f(Ljava/util/List;Ljava/lang/String;Ll/err0;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    const/4 v0, -0x1

    .line 11
    if-ge p1, p2, :cond_1

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Ll/frr0;

    .line 18
    .line 19
    iget-object p2, p2, Ll/frr0;->b:Ll/pqr0;

    .line 20
    .line 21
    invoke-virtual {p2}, Ll/pqr0;->f()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eq v1, v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p2}, Ll/pqr0;->f()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return v0
.end method

.method public static e(Ljava/lang/String;Ljava/util/regex/Matcher;Ll/bgw0;Ljava/util/List;)Ll/arr0;
    .locals 7
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ll/grr0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/grr0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    :try_start_0
    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    invoke-static {v1}, Ll/jrr0;->b(Ljava/lang/String;)J

    .line 15
    .line 16
    .line 17
    move-result-wide v3

    .line 18
    iput-wide v3, v0, Ll/grr0;->a:J

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    invoke-static {v1}, Ll/jrr0;->b(Ljava/lang/String;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    iput-wide v3, v0, Ll/grr0;->b:J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    const/4 v1, 0x3

    .line 34
    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    invoke-static {p1, v0}, Ll/hrr0;->h(Ljava/lang/String;Ll/grr0;)V

    .line 42
    .line 43
    .line 44
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    sget-object v1, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 50
    .line 51
    invoke-virtual {p2, v1}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-nez v2, :cond_1

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-lez v2, :cond_0

    .line 66
    .line 67
    const-string v2, "\n"

    .line 68
    .line 69
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    sget-object v1, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 80
    .line 81
    invoke-virtual {p2, v1}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    goto :goto_0

    .line 86
    :cond_1
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {p0, p1, p3}, Ll/hrr0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Landroid/text/SpannedString;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iput-object p0, v0, Ll/grr0;->c:Ljava/lang/CharSequence;

    .line 95
    .line 96
    new-instance v1, Ll/arr0;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/grr0;->a()Ll/j2v0;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Ll/j2v0;->p()Ll/u4v0;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    iget-wide v3, v0, Ll/grr0;->a:J

    .line 107
    .line 108
    iget-wide v5, v0, Ll/grr0;->b:J

    .line 109
    .line 110
    invoke-direct/range {v1 .. v6}, Ll/arr0;-><init>(Ll/u4v0;JJ)V

    .line 111
    .line 112
    .line 113
    return-object v1

    .line 114
    :cond_2
    :try_start_1
    throw v2

    .line 115
    :cond_3
    throw v2
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 116
    :catch_0
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    const-string p1, "WebvttCueParser"

    .line 125
    .line 126
    const-string p2, "Skipping cue with bad header: "

    .line 127
    .line 128
    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {p1, p0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-object v2
.end method

.method public static f(Ljava/util/List;Ljava/lang/String;Ll/err0;)Ljava/util/List;
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_1

    .line 12
    .line 13
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Ll/pqr0;

    .line 18
    .line 19
    iget-object v3, p2, Ll/err0;->a:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v4, p2, Ll/err0;->d:Ljava/util/Set;

    .line 22
    .line 23
    iget-object v5, p2, Ll/err0;->c:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v2, p1, v3, v4, v5}, Ll/pqr0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-lez v3, :cond_0

    .line 30
    .line 31
    new-instance v4, Ll/frr0;

    .line 32
    .line 33
    invoke-direct {v4, v3, v2}, Ll/frr0;-><init>(ILl/pqr0;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    return-object v0
.end method

.method public static g(Ljava/lang/String;Ll/err0;Ljava/util/List;Landroid/text/SpannableStringBuilder;Ljava/util/List;)V
    .locals 17
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p4

    .line 8
    .line 9
    iget v4, v1, Ll/err0;->b:I

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    iget-object v6, v1, Ll/err0;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v7

    .line 21
    const/4 v9, -0x1

    .line 22
    const/4 v11, 0x1

    .line 23
    const/16 v12, 0x21

    .line 24
    .line 25
    if-eqz v7, :cond_c

    .line 26
    .line 27
    const/16 v13, 0x69

    .line 28
    .line 29
    if-eq v7, v13, :cond_b

    .line 30
    .line 31
    const v13, 0x3291ee

    .line 32
    .line 33
    .line 34
    if-eq v7, v13, :cond_a

    .line 35
    .line 36
    const v13, 0x3595da

    .line 37
    .line 38
    .line 39
    if-eq v7, v13, :cond_6

    .line 40
    .line 41
    const/16 v13, 0x62

    .line 42
    .line 43
    if-eq v7, v13, :cond_5

    .line 44
    .line 45
    const/16 v13, 0x63

    .line 46
    .line 47
    if-eq v7, v13, :cond_2

    .line 48
    .line 49
    const/16 v13, 0x75

    .line 50
    .line 51
    if-eq v7, v13, :cond_1

    .line 52
    .line 53
    const/16 v13, 0x76

    .line 54
    .line 55
    if-eq v7, v13, :cond_0

    .line 56
    .line 57
    goto/16 :goto_8

    .line 58
    .line 59
    :cond_0
    const-string v7, "v"

    .line 60
    .line 61
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-eqz v6, :cond_18

    .line 66
    .line 67
    goto/16 :goto_3

    .line 68
    .line 69
    :cond_1
    const-string v7, "u"

    .line 70
    .line 71
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    if-eqz v6, :cond_18

    .line 76
    .line 77
    new-instance v6, Landroid/text/style/UnderlineSpan;

    .line 78
    .line 79
    invoke-direct {v6}, Landroid/text/style/UnderlineSpan;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2, v6, v4, v5, v12}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 83
    .line 84
    .line 85
    goto/16 :goto_3

    .line 86
    .line 87
    :cond_2
    const-string v7, "c"

    .line 88
    .line 89
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v6

    .line 93
    if-eqz v6, :cond_18

    .line 94
    .line 95
    iget-object v6, v1, Ll/err0;->d:Ljava/util/Set;

    .line 96
    .line 97
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    :cond_3
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 102
    .line 103
    .line 104
    move-result v7

    .line 105
    if-eqz v7, :cond_d

    .line 106
    .line 107
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v7

    .line 111
    check-cast v7, Ljava/lang/String;

    .line 112
    .line 113
    sget-object v13, Ll/hrr0;->c:Ljava/util/Map;

    .line 114
    .line 115
    invoke-interface {v13, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v14

    .line 119
    if-eqz v14, :cond_4

    .line 120
    .line 121
    invoke-interface {v13, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    check-cast v7, Ljava/lang/Integer;

    .line 126
    .line 127
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 128
    .line 129
    .line 130
    move-result v7

    .line 131
    new-instance v13, Landroid/text/style/ForegroundColorSpan;

    .line 132
    .line 133
    invoke-direct {v13, v7}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2, v13, v4, v5, v12}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_4
    sget-object v13, Ll/hrr0;->d:Ljava/util/Map;

    .line 141
    .line 142
    invoke-interface {v13, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v14

    .line 146
    if-eqz v14, :cond_3

    .line 147
    .line 148
    invoke-interface {v13, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v7

    .line 152
    check-cast v7, Ljava/lang/Integer;

    .line 153
    .line 154
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 155
    .line 156
    .line 157
    move-result v7

    .line 158
    new-instance v13, Landroid/text/style/BackgroundColorSpan;

    .line 159
    .line 160
    invoke-direct {v13, v7}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v2, v13, v4, v5, v12}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 164
    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_5
    const-string v7, "b"

    .line 168
    .line 169
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v6

    .line 173
    if-eqz v6, :cond_18

    .line 174
    .line 175
    new-instance v6, Landroid/text/style/StyleSpan;

    .line 176
    .line 177
    invoke-direct {v6, v11}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v2, v6, v4, v5, v12}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 181
    .line 182
    .line 183
    goto/16 :goto_3

    .line 184
    .line 185
    :cond_6
    const-string v7, "ruby"

    .line 186
    .line 187
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    if-eqz v6, :cond_18

    .line 192
    .line 193
    invoke-static {v3, v0, v1}, Ll/hrr0;->d(Ljava/util/List;Ljava/lang/String;Ll/err0;)I

    .line 194
    .line 195
    .line 196
    move-result v6

    .line 197
    new-instance v7, Ljava/util/ArrayList;

    .line 198
    .line 199
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    .line 200
    .line 201
    .line 202
    move-result v13

    .line 203
    invoke-direct {v7, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 204
    .line 205
    .line 206
    move-object/from16 v13, p2

    .line 207
    .line 208
    invoke-interface {v7, v13}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 209
    .line 210
    .line 211
    invoke-static {}, Ll/drr0;->d()Ljava/util/Comparator;

    .line 212
    .line 213
    .line 214
    move-result-object v13

    .line 215
    invoke-static {v7, v13}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 216
    .line 217
    .line 218
    iget v13, v1, Ll/err0;->b:I

    .line 219
    .line 220
    const/4 v14, 0x0

    .line 221
    const/4 v15, 0x0

    .line 222
    :goto_1
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 223
    .line 224
    .line 225
    move-result v10

    .line 226
    if-ge v14, v10, :cond_d

    .line 227
    .line 228
    invoke-interface {v7, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v10

    .line 232
    check-cast v10, Ll/drr0;

    .line 233
    .line 234
    invoke-static {v10}, Ll/drr0;->c(Ll/drr0;)Ll/err0;

    .line 235
    .line 236
    .line 237
    move-result-object v10

    .line 238
    iget-object v10, v10, Ll/err0;->a:Ljava/lang/String;

    .line 239
    .line 240
    const-string v11, "rt"

    .line 241
    .line 242
    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v10

    .line 246
    if-eqz v10, :cond_9

    .line 247
    .line 248
    invoke-interface {v7, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v10

    .line 252
    check-cast v10, Ll/drr0;

    .line 253
    .line 254
    invoke-static {v10}, Ll/drr0;->c(Ll/drr0;)Ll/err0;

    .line 255
    .line 256
    .line 257
    move-result-object v11

    .line 258
    invoke-static {v3, v0, v11}, Ll/hrr0;->d(Ljava/util/List;Ljava/lang/String;Ll/err0;)I

    .line 259
    .line 260
    .line 261
    move-result v11

    .line 262
    if-eq v11, v9, :cond_7

    .line 263
    .line 264
    goto :goto_2

    .line 265
    :cond_7
    if-eq v6, v9, :cond_8

    .line 266
    .line 267
    move v11, v6

    .line 268
    goto :goto_2

    .line 269
    :cond_8
    const/4 v11, 0x1

    .line 270
    :goto_2
    invoke-static {v10}, Ll/drr0;->c(Ll/drr0;)Ll/err0;

    .line 271
    .line 272
    .line 273
    move-result-object v9

    .line 274
    iget v9, v9, Ll/err0;->b:I

    .line 275
    .line 276
    sub-int/2addr v9, v15

    .line 277
    invoke-static {v10}, Ll/drr0;->a(Ll/drr0;)I

    .line 278
    .line 279
    .line 280
    move-result v10

    .line 281
    sub-int/2addr v10, v15

    .line 282
    invoke-virtual {v2, v9, v10}, Landroid/text/SpannableStringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    .line 283
    .line 284
    .line 285
    move-result-object v16

    .line 286
    invoke-virtual {v2, v9, v10}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 287
    .line 288
    .line 289
    new-instance v10, Ll/sav0;

    .line 290
    .line 291
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v8

    .line 295
    invoke-direct {v10, v8, v11}, Ll/sav0;-><init>(Ljava/lang/String;I)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v2, v10, v13, v9, v12}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 299
    .line 300
    .line 301
    invoke-interface/range {v16 .. v16}, Ljava/lang/CharSequence;->length()I

    .line 302
    .line 303
    .line 304
    move-result v8

    .line 305
    add-int/2addr v15, v8

    .line 306
    move v13, v9

    .line 307
    :cond_9
    add-int/lit8 v14, v14, 0x1

    .line 308
    .line 309
    const/4 v9, -0x1

    .line 310
    const/4 v11, 0x1

    .line 311
    goto :goto_1

    .line 312
    :cond_a
    const-string v7, "lang"

    .line 313
    .line 314
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 315
    .line 316
    .line 317
    move-result v6

    .line 318
    if-eqz v6, :cond_18

    .line 319
    .line 320
    goto :goto_3

    .line 321
    :cond_b
    const-string v7, "i"

    .line 322
    .line 323
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result v6

    .line 327
    if-eqz v6, :cond_18

    .line 328
    .line 329
    new-instance v6, Landroid/text/style/StyleSpan;

    .line 330
    .line 331
    const/4 v7, 0x2

    .line 332
    invoke-direct {v6, v7}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 333
    .line 334
    .line 335
    invoke-virtual {v2, v6, v4, v5, v12}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 336
    .line 337
    .line 338
    goto :goto_3

    .line 339
    :cond_c
    const-string v7, ""

    .line 340
    .line 341
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 342
    .line 343
    .line 344
    move-result v6

    .line 345
    if-eqz v6, :cond_18

    .line 346
    .line 347
    :cond_d
    :goto_3
    invoke-static {v3, v0, v1}, Ll/hrr0;->f(Ljava/util/List;Ljava/lang/String;Ll/err0;)Ljava/util/List;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    const/4 v10, 0x0

    .line 352
    :goto_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 353
    .line 354
    .line 355
    move-result v1

    .line 356
    if-ge v10, v1, :cond_18

    .line 357
    .line 358
    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object v1

    .line 362
    check-cast v1, Ll/frr0;

    .line 363
    .line 364
    iget-object v1, v1, Ll/frr0;->b:Ll/pqr0;

    .line 365
    .line 366
    if-nez v1, :cond_e

    .line 367
    .line 368
    const/4 v6, -0x1

    .line 369
    const/4 v7, 0x2

    .line 370
    const/4 v9, 0x1

    .line 371
    goto/16 :goto_7

    .line 372
    .line 373
    :cond_e
    invoke-virtual {v1}, Ll/pqr0;->h()I

    .line 374
    .line 375
    .line 376
    move-result v3

    .line 377
    const/4 v6, -0x1

    .line 378
    if-eq v3, v6, :cond_f

    .line 379
    .line 380
    new-instance v3, Landroid/text/style/StyleSpan;

    .line 381
    .line 382
    invoke-virtual {v1}, Ll/pqr0;->h()I

    .line 383
    .line 384
    .line 385
    move-result v7

    .line 386
    invoke-direct {v3, v7}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 387
    .line 388
    .line 389
    invoke-static {v2, v3, v4, v5, v12}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 390
    .line 391
    .line 392
    :cond_f
    invoke-virtual {v1}, Ll/pqr0;->A()Z

    .line 393
    .line 394
    .line 395
    move-result v3

    .line 396
    if-eqz v3, :cond_10

    .line 397
    .line 398
    new-instance v3, Landroid/text/style/UnderlineSpan;

    .line 399
    .line 400
    invoke-direct {v3}, Landroid/text/style/UnderlineSpan;-><init>()V

    .line 401
    .line 402
    .line 403
    invoke-virtual {v2, v3, v4, v5, v12}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 404
    .line 405
    .line 406
    :cond_10
    invoke-virtual {v1}, Ll/pqr0;->z()Z

    .line 407
    .line 408
    .line 409
    move-result v3

    .line 410
    if-eqz v3, :cond_11

    .line 411
    .line 412
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    .line 413
    .line 414
    invoke-virtual {v1}, Ll/pqr0;->d()I

    .line 415
    .line 416
    .line 417
    move-result v7

    .line 418
    invoke-direct {v3, v7}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 419
    .line 420
    .line 421
    invoke-static {v2, v3, v4, v5, v12}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 422
    .line 423
    .line 424
    :cond_11
    invoke-virtual {v1}, Ll/pqr0;->y()Z

    .line 425
    .line 426
    .line 427
    move-result v3

    .line 428
    if-eqz v3, :cond_12

    .line 429
    .line 430
    new-instance v3, Landroid/text/style/BackgroundColorSpan;

    .line 431
    .line 432
    invoke-virtual {v1}, Ll/pqr0;->c()I

    .line 433
    .line 434
    .line 435
    move-result v7

    .line 436
    invoke-direct {v3, v7}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    .line 437
    .line 438
    .line 439
    invoke-static {v2, v3, v4, v5, v12}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 440
    .line 441
    .line 442
    :cond_12
    invoke-virtual {v1}, Ll/pqr0;->s()Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object v3

    .line 446
    if-eqz v3, :cond_13

    .line 447
    .line 448
    new-instance v3, Landroid/text/style/TypefaceSpan;

    .line 449
    .line 450
    invoke-virtual {v1}, Ll/pqr0;->s()Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object v7

    .line 454
    invoke-direct {v3, v7}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 455
    .line 456
    .line 457
    invoke-static {v2, v3, v4, v5, v12}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 458
    .line 459
    .line 460
    :cond_13
    invoke-virtual {v1}, Ll/pqr0;->e()I

    .line 461
    .line 462
    .line 463
    move-result v3

    .line 464
    const/4 v7, 0x1

    .line 465
    if-eq v3, v7, :cond_16

    .line 466
    .line 467
    const/4 v7, 0x2

    .line 468
    if-eq v3, v7, :cond_15

    .line 469
    .line 470
    const/4 v8, 0x3

    .line 471
    if-eq v3, v8, :cond_14

    .line 472
    .line 473
    :goto_5
    const/4 v9, 0x1

    .line 474
    goto :goto_6

    .line 475
    :cond_14
    new-instance v3, Landroid/text/style/RelativeSizeSpan;

    .line 476
    .line 477
    invoke-virtual {v1}, Ll/pqr0;->b()F

    .line 478
    .line 479
    .line 480
    move-result v8

    .line 481
    const/high16 v9, 0x42c80000    # 100.0f

    .line 482
    .line 483
    div-float/2addr v8, v9

    .line 484
    invoke-direct {v3, v8}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 485
    .line 486
    .line 487
    invoke-static {v2, v3, v4, v5, v12}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 488
    .line 489
    .line 490
    goto :goto_5

    .line 491
    :cond_15
    new-instance v3, Landroid/text/style/RelativeSizeSpan;

    .line 492
    .line 493
    invoke-virtual {v1}, Ll/pqr0;->b()F

    .line 494
    .line 495
    .line 496
    move-result v8

    .line 497
    invoke-direct {v3, v8}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 498
    .line 499
    .line 500
    invoke-static {v2, v3, v4, v5, v12}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 501
    .line 502
    .line 503
    goto :goto_5

    .line 504
    :cond_16
    const/4 v7, 0x2

    .line 505
    new-instance v3, Landroid/text/style/AbsoluteSizeSpan;

    .line 506
    .line 507
    invoke-virtual {v1}, Ll/pqr0;->b()F

    .line 508
    .line 509
    .line 510
    move-result v8

    .line 511
    float-to-int v8, v8

    .line 512
    const/4 v9, 0x1

    .line 513
    invoke-direct {v3, v8, v9}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 514
    .line 515
    .line 516
    invoke-static {v2, v3, v4, v5, v12}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 517
    .line 518
    .line 519
    :goto_6
    invoke-virtual {v1}, Ll/pqr0;->x()Z

    .line 520
    .line 521
    .line 522
    move-result v1

    .line 523
    if-eqz v1, :cond_17

    .line 524
    .line 525
    new-instance v1, Ll/r9v0;

    .line 526
    .line 527
    invoke-direct {v1}, Ll/r9v0;-><init>()V

    .line 528
    .line 529
    .line 530
    invoke-virtual {v2, v1, v4, v5, v12}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 531
    .line 532
    .line 533
    :cond_17
    :goto_7
    add-int/lit8 v10, v10, 0x1

    .line 534
    .line 535
    goto/16 :goto_4

    .line 536
    .line 537
    :cond_18
    :goto_8
    return-void
.end method

.method public static h(Ljava/lang/String;Ll/grr0;)V
    .locals 16

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const-string v1, "WebvttCueParser"

    .line 4
    .line 5
    sget-object v2, Ll/hrr0;->b:Ljava/util/regex/Pattern;

    .line 6
    .line 7
    move-object/from16 v3, p0

    .line 8
    .line 9
    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    :goto_0
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_e

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    invoke-virtual {v2, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    const/4 v5, 0x2

    .line 28
    invoke-virtual {v2, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    :try_start_0
    const-string v7, "line"

    .line 36
    .line 37
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v7
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    const-string v8, "Invalid anchor value: "

    .line 42
    .line 43
    const/4 v9, -0x1

    .line 44
    const/16 v10, 0x2c

    .line 45
    .line 46
    const-string v11, "center"

    .line 47
    .line 48
    const-string v12, "middle"

    .line 49
    .line 50
    const-string v13, "end"

    .line 51
    .line 52
    const-string v14, "start"

    .line 53
    .line 54
    const/high16 v15, -0x80000000

    .line 55
    .line 56
    const/4 v5, 0x0

    .line 57
    if-nez v7, :cond_a

    .line 58
    .line 59
    :try_start_1
    const-string v7, "align"

    .line 60
    .line 61
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    if-nez v7, :cond_8

    .line 66
    .line 67
    const-string v7, "position"

    .line 68
    .line 69
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    if-nez v7, :cond_5

    .line 74
    .line 75
    const-string v5, "size"

    .line 76
    .line 77
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    if-eqz v5, :cond_0

    .line 82
    .line 83
    invoke-static {v6}, Ll/jrr0;->a(Ljava/lang/String;)F

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    iput v3, v0, Ll/grr0;->j:F

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    const-string v5, "vertical"

    .line 91
    .line 92
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    if-nez v5, :cond_1

    .line 97
    .line 98
    new-instance v3, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string v5, "Unknown cue setting "

    .line 104
    .line 105
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v4, ":"

    .line 112
    .line 113
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-static {v1, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_1
    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    .line 128
    .line 129
    .line 130
    move-result v4
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 131
    const/16 v5, 0xd86

    .line 132
    .line 133
    if-eq v4, v5, :cond_3

    .line 134
    .line 135
    const/16 v5, 0xe3a

    .line 136
    .line 137
    if-eq v4, v5, :cond_2

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_2
    const-string v4, "rl"

    .line 141
    .line 142
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    if-eqz v4, :cond_4

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_3
    const-string v3, "lr"

    .line 150
    .line 151
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    if-eqz v3, :cond_4

    .line 156
    .line 157
    const/4 v3, 0x2

    .line 158
    goto :goto_2

    .line 159
    :cond_4
    :goto_1
    :try_start_2
    const-string v3, "Invalid \'vertical\' value: "

    .line 160
    .line 161
    invoke-virtual {v3, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    invoke-static {v1, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    move v3, v15

    .line 169
    :goto_2
    iput v3, v0, Ll/grr0;->k:I

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :cond_5
    invoke-virtual {v6, v10}, Ljava/lang/String;->indexOf(I)I

    .line 174
    .line 175
    .line 176
    move-result v4

    .line 177
    if-eq v4, v9, :cond_7

    .line 178
    .line 179
    add-int/lit8 v7, v4, 0x1

    .line 180
    .line 181
    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v7

    .line 185
    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    .line 186
    .line 187
    .line 188
    move-result v9
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 189
    sparse-switch v9, :sswitch_data_0

    .line 190
    .line 191
    .line 192
    goto :goto_5

    .line 193
    :sswitch_0
    invoke-virtual {v7, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v3

    .line 197
    if-eqz v3, :cond_6

    .line 198
    .line 199
    goto :goto_4

    .line 200
    :sswitch_1
    invoke-virtual {v7, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    if-eqz v3, :cond_6

    .line 205
    .line 206
    goto :goto_3

    .line 207
    :sswitch_2
    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v9

    .line 211
    if-eqz v9, :cond_6

    .line 212
    .line 213
    goto :goto_6

    .line 214
    :sswitch_3
    const-string v3, "line-right"

    .line 215
    .line 216
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v3

    .line 220
    if-eqz v3, :cond_6

    .line 221
    .line 222
    :goto_3
    const/4 v3, 0x2

    .line 223
    goto :goto_6

    .line 224
    :sswitch_4
    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v9

    .line 228
    if-eqz v9, :cond_6

    .line 229
    .line 230
    goto :goto_6

    .line 231
    :sswitch_5
    const-string v3, "line-left"

    .line 232
    .line 233
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v3

    .line 237
    if-eqz v3, :cond_6

    .line 238
    .line 239
    :goto_4
    move v3, v5

    .line 240
    goto :goto_6

    .line 241
    :cond_6
    :goto_5
    :try_start_3
    invoke-virtual {v8, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    invoke-static {v1, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    move v3, v15

    .line 249
    :goto_6
    iput v3, v0, Ll/grr0;->i:I

    .line 250
    .line 251
    invoke-virtual {v6, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v6

    .line 255
    :cond_7
    invoke-static {v6}, Ll/jrr0;->a(Ljava/lang/String;)F

    .line 256
    .line 257
    .line 258
    move-result v3

    .line 259
    iput v3, v0, Ll/grr0;->h:F

    .line 260
    .line 261
    goto/16 :goto_0

    .line 262
    .line 263
    :cond_8
    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    .line 264
    .line 265
    .line 266
    move-result v4
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0

    .line 267
    sparse-switch v4, :sswitch_data_1

    .line 268
    .line 269
    .line 270
    goto :goto_8

    .line 271
    :sswitch_6
    invoke-virtual {v6, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result v4

    .line 275
    if-eqz v4, :cond_9

    .line 276
    .line 277
    goto :goto_9

    .line 278
    :sswitch_7
    const-string v3, "right"

    .line 279
    .line 280
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result v3

    .line 284
    if-eqz v3, :cond_9

    .line 285
    .line 286
    const/4 v3, 0x5

    .line 287
    goto :goto_9

    .line 288
    :sswitch_8
    const-string v3, "left"

    .line 289
    .line 290
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    if-eqz v3, :cond_9

    .line 295
    .line 296
    const/4 v3, 0x4

    .line 297
    goto :goto_9

    .line 298
    :sswitch_9
    invoke-virtual {v6, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result v3

    .line 302
    if-eqz v3, :cond_9

    .line 303
    .line 304
    const/4 v3, 0x3

    .line 305
    goto :goto_9

    .line 306
    :sswitch_a
    invoke-virtual {v6, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    move-result v3

    .line 310
    if-eqz v3, :cond_9

    .line 311
    .line 312
    goto :goto_7

    .line 313
    :sswitch_b
    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 314
    .line 315
    .line 316
    move-result v3

    .line 317
    if-eqz v3, :cond_9

    .line 318
    .line 319
    :goto_7
    const/4 v3, 0x2

    .line 320
    goto :goto_9

    .line 321
    :cond_9
    :goto_8
    :try_start_4
    const-string v3, "Invalid alignment value: "

    .line 322
    .line 323
    invoke-virtual {v3, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v3

    .line 327
    invoke-static {v1, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    goto :goto_7

    .line 331
    :goto_9
    iput v3, v0, Ll/grr0;->d:I

    .line 332
    .line 333
    goto/16 :goto_0

    .line 334
    .line 335
    :cond_a
    invoke-virtual {v6, v10}, Ljava/lang/String;->indexOf(I)I

    .line 336
    .line 337
    .line 338
    move-result v4

    .line 339
    if-eq v4, v9, :cond_c

    .line 340
    .line 341
    add-int/lit8 v7, v4, 0x1

    .line 342
    .line 343
    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v7

    .line 347
    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    .line 348
    .line 349
    .line 350
    move-result v9
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_0

    .line 351
    sparse-switch v9, :sswitch_data_2

    .line 352
    .line 353
    .line 354
    goto :goto_b

    .line 355
    :sswitch_c
    invoke-virtual {v7, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    move-result v9

    .line 359
    if-eqz v9, :cond_b

    .line 360
    .line 361
    move v15, v5

    .line 362
    goto :goto_c

    .line 363
    :sswitch_d
    invoke-virtual {v7, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 364
    .line 365
    .line 366
    move-result v9

    .line 367
    if-eqz v9, :cond_b

    .line 368
    .line 369
    const/4 v15, 0x2

    .line 370
    goto :goto_c

    .line 371
    :sswitch_e
    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    move-result v9

    .line 375
    if-eqz v9, :cond_b

    .line 376
    .line 377
    goto :goto_a

    .line 378
    :sswitch_f
    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    move-result v9

    .line 382
    if-eqz v9, :cond_b

    .line 383
    .line 384
    :goto_a
    move v15, v3

    .line 385
    goto :goto_c

    .line 386
    :cond_b
    :goto_b
    :try_start_5
    invoke-virtual {v8, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v7

    .line 390
    invoke-static {v1, v7}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    :goto_c
    iput v15, v0, Ll/grr0;->g:I

    .line 394
    .line 395
    invoke-virtual {v6, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v6

    .line 399
    :cond_c
    const-string v4, "%"

    .line 400
    .line 401
    invoke-virtual {v6, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 402
    .line 403
    .line 404
    move-result v4

    .line 405
    if-eqz v4, :cond_d

    .line 406
    .line 407
    invoke-static {v6}, Ll/jrr0;->a(Ljava/lang/String;)F

    .line 408
    .line 409
    .line 410
    move-result v3

    .line 411
    iput v3, v0, Ll/grr0;->e:F

    .line 412
    .line 413
    iput v5, v0, Ll/grr0;->f:I

    .line 414
    .line 415
    goto/16 :goto_0

    .line 416
    .line 417
    :cond_d
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 418
    .line 419
    .line 420
    move-result v4

    .line 421
    int-to-float v4, v4

    .line 422
    iput v4, v0, Ll/grr0;->e:F

    .line 423
    .line 424
    iput v3, v0, Ll/grr0;->f:I
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_0

    .line 425
    .line 426
    goto/16 :goto_0

    .line 427
    .line 428
    :catch_0
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    .line 429
    .line 430
    .line 431
    move-result-object v3

    .line 432
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v3

    .line 436
    const-string v4, "Skipping bad cue setting: "

    .line 437
    .line 438
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v3

    .line 442
    invoke-static {v1, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    .line 444
    .line 445
    goto/16 :goto_0

    .line 446
    .line 447
    :cond_e
    return-void

    .line 448
    nop

    .line 449
    :sswitch_data_0
    .sparse-switch
        -0x6dd215c0 -> :sswitch_5
        -0x514d33ab -> :sswitch_4
        -0x4c1a40fd -> :sswitch_3
        -0x4009266b -> :sswitch_2
        0x188db -> :sswitch_1
        0x68ac462 -> :sswitch_0
    .end sparse-switch

    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    :sswitch_data_1
    .sparse-switch
        -0x514d33ab -> :sswitch_b
        -0x4009266b -> :sswitch_a
        0x188db -> :sswitch_9
        0x32a007 -> :sswitch_8
        0x677c21c -> :sswitch_7
        0x68ac462 -> :sswitch_6
    .end sparse-switch

    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    .line 499
    .line 500
    .line 501
    :sswitch_data_2
    .sparse-switch
        -0x514d33ab -> :sswitch_f
        -0x4009266b -> :sswitch_e
        0x188db -> :sswitch_d
        0x68ac462 -> :sswitch_c
    .end sparse-switch
.end method
