.class public final Ll/eqr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Z

.field public final d:J

.field public final e:J

.field public final f:Ll/kqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final g:[Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final j:Ll/eqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final k:Ljava/util/HashMap;

.field public final l:Ljava/util/HashMap;

.field public m:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJLl/kqr0;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/eqr0;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ll/kqr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p11    # Ll/eqr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eqr0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/eqr0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p10, p0, Ll/eqr0;->i:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p7, p0, Ll/eqr0;->f:Ll/kqr0;

    .line 11
    .line 12
    iput-object p8, p0, Ll/eqr0;->g:[Ljava/lang/String;

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    :goto_0
    iput-boolean p1, p0, Ll/eqr0;->c:Z

    .line 20
    .line 21
    iput-wide p3, p0, Ll/eqr0;->d:J

    .line 22
    .line 23
    iput-wide p5, p0, Ll/eqr0;->e:J

    .line 24
    .line 25
    invoke-virtual {p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    iput-object p9, p0, Ll/eqr0;->h:Ljava/lang/String;

    .line 29
    .line 30
    iput-object p11, p0, Ll/eqr0;->j:Ll/eqr0;

    .line 31
    .line 32
    new-instance p1, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Ll/eqr0;->k:Ljava/util/HashMap;

    .line 38
    .line 39
    new-instance p1, Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Ll/eqr0;->l:Ljava/util/HashMap;

    .line 45
    .line 46
    return-void
.end method

.method public static b(Ljava/lang/String;JJLl/kqr0;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/eqr0;)Ll/eqr0;
    .locals 12
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ll/kqr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ll/eqr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/eqr0;

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    move-object v1, p0

    .line 5
    move-wide v3, p1

    .line 6
    move-wide v5, p3

    .line 7
    move-object/from16 v7, p5

    .line 8
    .line 9
    move-object/from16 v8, p6

    .line 10
    .line 11
    move-object/from16 v9, p7

    .line 12
    .line 13
    move-object/from16 v10, p8

    .line 14
    .line 15
    move-object/from16 v11, p9

    .line 16
    .line 17
    invoke-direct/range {v0 .. v11}, Ll/eqr0;-><init>(Ljava/lang/String;Ljava/lang/String;JJLl/kqr0;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/eqr0;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public static c(Ljava/lang/String;)Ll/eqr0;
    .locals 12

    .line 1
    new-instance v0, Ll/eqr0;

    .line 2
    .line 3
    const-string v1, "\r\n"

    .line 4
    .line 5
    const-string v2, "\n"

    .line 6
    .line 7
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v1, " *\n *"

    .line 12
    .line 13
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v1, " "

    .line 18
    .line 19
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v2, "[ \t\\x0B\u000c\r]+"

    .line 24
    .line 25
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const/4 v10, 0x0

    .line 30
    const/4 v11, 0x0

    .line 31
    const/4 v1, 0x0

    .line 32
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    const/4 v7, 0x0

    .line 38
    const/4 v8, 0x0

    .line 39
    const-string v9, ""

    .line 40
    .line 41
    move-wide v5, v3

    .line 42
    invoke-direct/range {v0 .. v11}, Ll/eqr0;-><init>(Ljava/lang/String;Ljava/lang/String;JJLl/kqr0;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/eqr0;)V

    .line 43
    .line 44
    .line 45
    return-object v0
.end method

.method public static i(Ljava/lang/String;Ljava/util/Map;)Landroid/text/SpannableStringBuilder;
    .locals 2

    .line 1
    invoke-interface {p1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/j2v0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/j2v0;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 13
    .line 14
    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/j2v0;->l(Ljava/lang/CharSequence;)Ll/j2v0;

    .line 18
    .line 19
    .line 20
    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/j2v0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/j2v0;->q()Ljava/lang/CharSequence;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    check-cast p0, Landroid/text/SpannableStringBuilder;

    .line 37
    .line 38
    return-object p0
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eqr0;->m:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final d(I)Ll/eqr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eqr0;->m:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/eqr0;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Ll/onl;->a()V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public final e(JLjava/util/Map;Ljava/util/Map;Ljava/util/Map;)Ljava/util/List;
    .locals 9

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/eqr0;->h:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, v1, v0}, Ll/eqr0;->k(JLjava/lang/String;Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    new-instance v7, Ljava/util/TreeMap;

    .line 12
    .line 13
    invoke-direct {v7}, Ljava/util/TreeMap;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    iget-object v6, p0, Ll/eqr0;->h:Ljava/lang/String;

    .line 18
    .line 19
    move-object v2, p0

    .line 20
    move-wide v3, p1

    .line 21
    invoke-virtual/range {v2 .. v7}, Ll/eqr0;->m(JZLjava/lang/String;Ljava/util/Map;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, v2, Ll/eqr0;->h:Ljava/lang/String;

    .line 25
    .line 26
    move-object v5, p3

    .line 27
    move-object v6, p4

    .line 28
    move-object v8, v7

    .line 29
    move-object v7, p0

    .line 30
    invoke-virtual/range {v2 .. v8}, Ll/eqr0;->l(JLjava/util/Map;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V

    .line 31
    .line 32
    .line 33
    move-object v7, v8

    .line 34
    new-instance p0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    const/4 p2, 0x0

    .line 44
    move p3, p2

    .line 45
    :goto_0
    if-ge p3, p1, :cond_1

    .line 46
    .line 47
    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p4

    .line 51
    check-cast p4, Landroid/util/Pair;

    .line 52
    .line 53
    iget-object v1, p4, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 54
    .line 55
    invoke-interface {p5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Ljava/lang/String;

    .line 60
    .line 61
    if-nez v1, :cond_0

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_0
    invoke-static {v1, p2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    array-length v2, v1

    .line 69
    invoke-static {v1, p2, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object p4, p4, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 74
    .line 75
    invoke-interface {v6, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p4

    .line 79
    check-cast p4, Ll/iqr0;

    .line 80
    .line 81
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 82
    .line 83
    .line 84
    new-instance v2, Ll/j2v0;

    .line 85
    .line 86
    invoke-direct {v2}, Ll/j2v0;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2, v1}, Ll/j2v0;->c(Landroid/graphics/Bitmap;)Ll/j2v0;

    .line 90
    .line 91
    .line 92
    iget v1, p4, Ll/iqr0;->b:F

    .line 93
    .line 94
    invoke-virtual {v2, v1}, Ll/j2v0;->h(F)Ll/j2v0;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2, p2}, Ll/j2v0;->i(I)Ll/j2v0;

    .line 98
    .line 99
    .line 100
    iget v1, p4, Ll/iqr0;->c:F

    .line 101
    .line 102
    invoke-virtual {v2, v1, p2}, Ll/j2v0;->e(FI)Ll/j2v0;

    .line 103
    .line 104
    .line 105
    iget v1, p4, Ll/iqr0;->e:I

    .line 106
    .line 107
    invoke-virtual {v2, v1}, Ll/j2v0;->f(I)Ll/j2v0;

    .line 108
    .line 109
    .line 110
    iget v1, p4, Ll/iqr0;->f:F

    .line 111
    .line 112
    invoke-virtual {v2, v1}, Ll/j2v0;->k(F)Ll/j2v0;

    .line 113
    .line 114
    .line 115
    iget v1, p4, Ll/iqr0;->g:F

    .line 116
    .line 117
    invoke-virtual {v2, v1}, Ll/j2v0;->d(F)Ll/j2v0;

    .line 118
    .line 119
    .line 120
    iget p4, p4, Ll/iqr0;->j:I

    .line 121
    .line 122
    invoke-virtual {v2, p4}, Ll/j2v0;->o(I)Ll/j2v0;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v2}, Ll/j2v0;->p()Ll/u4v0;

    .line 126
    .line 127
    .line 128
    move-result-object p4

    .line 129
    invoke-interface {p0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    :goto_1
    add-int/lit8 p3, p3, 0x1

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_1
    invoke-virtual {v7}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 144
    .line 145
    .line 146
    move-result p3

    .line 147
    if-eqz p3, :cond_d

    .line 148
    .line 149
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p3

    .line 153
    check-cast p3, Ljava/util/Map$Entry;

    .line 154
    .line 155
    invoke-interface {p3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object p4

    .line 159
    invoke-interface {v6, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object p4

    .line 163
    check-cast p4, Ll/iqr0;

    .line 164
    .line 165
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 166
    .line 167
    .line 168
    invoke-interface {p3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p3

    .line 172
    check-cast p3, Ll/j2v0;

    .line 173
    .line 174
    invoke-virtual {p3}, Ll/j2v0;->q()Ljava/lang/CharSequence;

    .line 175
    .line 176
    .line 177
    move-result-object p5

    .line 178
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 179
    .line 180
    .line 181
    check-cast p5, Landroid/text/SpannableStringBuilder;

    .line 182
    .line 183
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    const-class v1, Ll/cqr0;

    .line 188
    .line 189
    invoke-virtual {p5, p2, v0, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, [Ll/cqr0;

    .line 194
    .line 195
    array-length v1, v0

    .line 196
    move v2, p2

    .line 197
    :goto_3
    if-ge v2, v1, :cond_2

    .line 198
    .line 199
    aget-object v3, v0, v2

    .line 200
    .line 201
    invoke-virtual {p5, v3}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    .line 202
    .line 203
    .line 204
    move-result v4

    .line 205
    invoke-virtual {p5, v3}, Landroid/text/SpannableStringBuilder;->getSpanEnd(Ljava/lang/Object;)I

    .line 206
    .line 207
    .line 208
    move-result v3

    .line 209
    const-string v5, ""

    .line 210
    .line 211
    invoke-virtual {p5, v4, v3, v5}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 212
    .line 213
    .line 214
    add-int/lit8 v2, v2, 0x1

    .line 215
    .line 216
    goto :goto_3

    .line 217
    :cond_2
    move v0, p2

    .line 218
    :goto_4
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    const/16 v2, 0x20

    .line 223
    .line 224
    if-ge v0, v1, :cond_5

    .line 225
    .line 226
    add-int/lit8 v1, v0, 0x1

    .line 227
    .line 228
    invoke-virtual {p5, v0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 229
    .line 230
    .line 231
    move-result v3

    .line 232
    if-ne v3, v2, :cond_4

    .line 233
    .line 234
    move v3, v1

    .line 235
    :goto_5
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 236
    .line 237
    .line 238
    move-result v4

    .line 239
    if-ge v3, v4, :cond_3

    .line 240
    .line 241
    invoke-virtual {p5, v3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 242
    .line 243
    .line 244
    move-result v4

    .line 245
    if-ne v4, v2, :cond_3

    .line 246
    .line 247
    add-int/lit8 v3, v3, 0x1

    .line 248
    .line 249
    goto :goto_5

    .line 250
    :cond_3
    sub-int/2addr v3, v1

    .line 251
    if-lez v3, :cond_4

    .line 252
    .line 253
    add-int/2addr v3, v0

    .line 254
    invoke-virtual {p5, v0, v3}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 255
    .line 256
    .line 257
    :cond_4
    move v0, v1

    .line 258
    goto :goto_4

    .line 259
    :cond_5
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-lez v0, :cond_6

    .line 264
    .line 265
    invoke-virtual {p5, p2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    if-ne v0, v2, :cond_6

    .line 270
    .line 271
    const/4 v0, 0x1

    .line 272
    invoke-virtual {p5, p2, v0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 273
    .line 274
    .line 275
    :cond_6
    move v0, p2

    .line 276
    :goto_6
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    add-int/lit8 v1, v1, -0x1

    .line 281
    .line 282
    const/16 v3, 0xa

    .line 283
    .line 284
    if-ge v0, v1, :cond_8

    .line 285
    .line 286
    add-int/lit8 v1, v0, 0x1

    .line 287
    .line 288
    invoke-virtual {p5, v0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 289
    .line 290
    .line 291
    move-result v4

    .line 292
    if-ne v4, v3, :cond_7

    .line 293
    .line 294
    invoke-virtual {p5, v1}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 295
    .line 296
    .line 297
    move-result v3

    .line 298
    if-ne v3, v2, :cond_7

    .line 299
    .line 300
    add-int/lit8 v0, v0, 0x2

    .line 301
    .line 302
    invoke-virtual {p5, v1, v0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 303
    .line 304
    .line 305
    :cond_7
    move v0, v1

    .line 306
    goto :goto_6

    .line 307
    :cond_8
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-lez v0, :cond_9

    .line 312
    .line 313
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 314
    .line 315
    .line 316
    move-result v0

    .line 317
    add-int/lit8 v0, v0, -0x1

    .line 318
    .line 319
    invoke-virtual {p5, v0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    if-ne v0, v2, :cond_9

    .line 324
    .line 325
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 326
    .line 327
    .line 328
    move-result v0

    .line 329
    add-int/lit8 v0, v0, -0x1

    .line 330
    .line 331
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 332
    .line 333
    .line 334
    move-result v1

    .line 335
    invoke-virtual {p5, v0, v1}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 336
    .line 337
    .line 338
    :cond_9
    move v0, p2

    .line 339
    :goto_7
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 340
    .line 341
    .line 342
    move-result v1

    .line 343
    add-int/lit8 v1, v1, -0x1

    .line 344
    .line 345
    if-ge v0, v1, :cond_b

    .line 346
    .line 347
    add-int/lit8 v1, v0, 0x1

    .line 348
    .line 349
    invoke-virtual {p5, v0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 350
    .line 351
    .line 352
    move-result v4

    .line 353
    if-ne v4, v2, :cond_a

    .line 354
    .line 355
    invoke-virtual {p5, v1}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 356
    .line 357
    .line 358
    move-result v4

    .line 359
    if-ne v4, v3, :cond_a

    .line 360
    .line 361
    invoke-virtual {p5, v0, v1}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 362
    .line 363
    .line 364
    :cond_a
    move v0, v1

    .line 365
    goto :goto_7

    .line 366
    :cond_b
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    if-lez v0, :cond_c

    .line 371
    .line 372
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    add-int/lit8 v0, v0, -0x1

    .line 377
    .line 378
    invoke-virtual {p5, v0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-ne v0, v3, :cond_c

    .line 383
    .line 384
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 385
    .line 386
    .line 387
    move-result v0

    .line 388
    add-int/lit8 v0, v0, -0x1

    .line 389
    .line 390
    invoke-virtual {p5}, Landroid/text/SpannableStringBuilder;->length()I

    .line 391
    .line 392
    .line 393
    move-result v1

    .line 394
    invoke-virtual {p5, v0, v1}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 395
    .line 396
    .line 397
    :cond_c
    iget p5, p4, Ll/iqr0;->c:F

    .line 398
    .line 399
    iget v0, p4, Ll/iqr0;->d:I

    .line 400
    .line 401
    invoke-virtual {p3, p5, v0}, Ll/j2v0;->e(FI)Ll/j2v0;

    .line 402
    .line 403
    .line 404
    iget p5, p4, Ll/iqr0;->e:I

    .line 405
    .line 406
    invoke-virtual {p3, p5}, Ll/j2v0;->f(I)Ll/j2v0;

    .line 407
    .line 408
    .line 409
    iget p5, p4, Ll/iqr0;->b:F

    .line 410
    .line 411
    invoke-virtual {p3, p5}, Ll/j2v0;->h(F)Ll/j2v0;

    .line 412
    .line 413
    .line 414
    iget p5, p4, Ll/iqr0;->f:F

    .line 415
    .line 416
    invoke-virtual {p3, p5}, Ll/j2v0;->k(F)Ll/j2v0;

    .line 417
    .line 418
    .line 419
    iget p5, p4, Ll/iqr0;->i:F

    .line 420
    .line 421
    iget v0, p4, Ll/iqr0;->h:I

    .line 422
    .line 423
    invoke-virtual {p3, p5, v0}, Ll/j2v0;->n(FI)Ll/j2v0;

    .line 424
    .line 425
    .line 426
    iget p4, p4, Ll/iqr0;->j:I

    .line 427
    .line 428
    invoke-virtual {p3, p4}, Ll/j2v0;->o(I)Ll/j2v0;

    .line 429
    .line 430
    .line 431
    invoke-virtual {p3}, Ll/j2v0;->p()Ll/u4v0;

    .line 432
    .line 433
    .line 434
    move-result-object p3

    .line 435
    invoke-interface {p0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    goto/16 :goto_2

    .line 439
    .line 440
    :cond_d
    return-object p0
.end method

.method public final f(Ll/eqr0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eqr0;->m:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/eqr0;->m:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/eqr0;->m:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final g(J)Z
    .locals 8

    .line 1
    iget-wide v0, p0, Ll/eqr0;->d:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v4, v0, v2

    .line 9
    .line 10
    const/4 v5, 0x1

    .line 11
    if-nez v4, :cond_1

    .line 12
    .line 13
    iget-wide v0, p0, Ll/eqr0;->e:J

    .line 14
    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    move-wide v0, v2

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return v5

    .line 22
    :cond_1
    :goto_0
    cmp-long v4, v0, p1

    .line 23
    .line 24
    if-gtz v4, :cond_3

    .line 25
    .line 26
    iget-wide v6, p0, Ll/eqr0;->e:J

    .line 27
    .line 28
    cmp-long v6, v6, v2

    .line 29
    .line 30
    if-eqz v6, :cond_2

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    return v5

    .line 34
    :cond_3
    :goto_1
    cmp-long v0, v0, v2

    .line 35
    .line 36
    if-nez v0, :cond_5

    .line 37
    .line 38
    iget-wide v0, p0, Ll/eqr0;->e:J

    .line 39
    .line 40
    cmp-long v0, p1, v0

    .line 41
    .line 42
    if-ltz v0, :cond_4

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_4
    return v5

    .line 46
    :cond_5
    :goto_2
    const/4 v0, 0x0

    .line 47
    if-gtz v4, :cond_6

    .line 48
    .line 49
    iget-wide v1, p0, Ll/eqr0;->e:J

    .line 50
    .line 51
    cmp-long p0, p1, v1

    .line 52
    .line 53
    if-gez p0, :cond_6

    .line 54
    .line 55
    return v5

    .line 56
    :cond_6
    return v0
.end method

.method public final h()[J
    .locals 5

    .line 1
    new-instance v0, Ljava/util/TreeSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/eqr0;->j(Ljava/util/TreeSet;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/TreeSet;->size()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    new-array p0, p0, [J

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ljava/lang/Long;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    add-int/lit8 v4, v1, 0x1

    .line 37
    .line 38
    aput-wide v2, p0, v1

    .line 39
    .line 40
    move v1, v4

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-object p0
.end method

.method public final j(Ljava/util/TreeSet;Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/eqr0;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "p"

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, "div"

    .line 10
    .line 11
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Ll/eqr0;->i:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    :cond_0
    iget-wide v2, p0, Ll/eqr0;->d:J

    .line 26
    .line 27
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    cmp-long v0, v2, v4

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-wide v2, p0, Ll/eqr0;->e:J

    .line 44
    .line 45
    cmp-long v0, v2, v4

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, v0}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-object v0, p0, Ll/eqr0;->m:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    move v2, v0

    .line 62
    :goto_0
    iget-object v3, p0, Ll/eqr0;->m:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-ge v2, v3, :cond_5

    .line 69
    .line 70
    iget-object v3, p0, Ll/eqr0;->m:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Ll/eqr0;

    .line 77
    .line 78
    const/4 v4, 0x1

    .line 79
    if-nez p2, :cond_4

    .line 80
    .line 81
    if-eqz v1, :cond_3

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    move v4, v0

    .line 85
    :cond_4
    :goto_1
    invoke-virtual {v3, p1, v4}, Ll/eqr0;->j(Ljava/util/TreeSet;Z)V

    .line 86
    .line 87
    .line 88
    add-int/lit8 v2, v2, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_5
    return-void
.end method

.method public final k(JLjava/lang/String;Ljava/util/List;)V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iget-object v1, p0, Ll/eqr0;->h:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p3, p0, Ll/eqr0;->h:Ljava/lang/String;

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/eqr0;->g(J)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Ll/eqr0;->a:Ljava/lang/String;

    .line 21
    .line 22
    const-string v2, "div"

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Ll/eqr0;->i:Ljava/lang/String;

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-instance p0, Landroid/util/Pair;

    .line 36
    .line 37
    invoke-direct {p0, p3, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p4, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/eqr0;->a()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-ge v1, v0, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Ll/eqr0;->d(I)Ll/eqr0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/eqr0;->k(JLjava/lang/String;Ljava/util/List;)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 v1, v1, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    return-void
.end method

.method public final l(JLjava/util/Map;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v4, p3

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p2}, Ll/eqr0;->g(J)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_d

    .line 12
    .line 13
    :cond_0
    iget-object v1, v0, Ll/eqr0;->h:Ljava/lang/String;

    .line 14
    .line 15
    const-string v2, ""

    .line 16
    .line 17
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    iget-object v1, v0, Ll/eqr0;->h:Ljava/lang/String;

    .line 24
    .line 25
    move-object v6, v1

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move-object/from16 v6, p5

    .line 28
    .line 29
    :goto_0
    iget-object v1, v0, Ll/eqr0;->l:Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_23

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ljava/util/Map$Entry;

    .line 50
    .line 51
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    check-cast v5, Ljava/lang/String;

    .line 56
    .line 57
    iget-object v7, v0, Ll/eqr0;->k:Ljava/util/HashMap;

    .line 58
    .line 59
    invoke-virtual {v7, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    if-eqz v7, :cond_3

    .line 64
    .line 65
    iget-object v7, v0, Ll/eqr0;->k:Ljava/util/HashMap;

    .line 66
    .line 67
    invoke-virtual {v7, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    check-cast v7, Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    goto :goto_2

    .line 78
    :cond_3
    const/4 v7, 0x0

    .line 79
    :goto_2
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Ljava/lang/Integer;

    .line 84
    .line 85
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eq v7, v2, :cond_22

    .line 90
    .line 91
    move-object/from16 v8, p6

    .line 92
    .line 93
    invoke-interface {v8, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    check-cast v5, Ll/j2v0;

    .line 98
    .line 99
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 100
    .line 101
    .line 102
    move-object/from16 v9, p4

    .line 103
    .line 104
    invoke-interface {v9, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v10

    .line 108
    check-cast v10, Ll/iqr0;

    .line 109
    .line 110
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    .line 112
    .line 113
    iget-object v11, v0, Ll/eqr0;->f:Ll/kqr0;

    .line 114
    .line 115
    iget-object v12, v0, Ll/eqr0;->g:[Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v11, v12, v4}, Ll/jqr0;->a(Ll/kqr0;[Ljava/lang/String;Ljava/util/Map;)Ll/kqr0;

    .line 118
    .line 119
    .line 120
    move-result-object v11

    .line 121
    invoke-virtual {v5}, Ll/j2v0;->q()Ljava/lang/CharSequence;

    .line 122
    .line 123
    .line 124
    move-result-object v12

    .line 125
    check-cast v12, Landroid/text/SpannableStringBuilder;

    .line 126
    .line 127
    if-nez v12, :cond_4

    .line 128
    .line 129
    new-instance v12, Landroid/text/SpannableStringBuilder;

    .line 130
    .line 131
    invoke-direct {v12}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v5, v12}, Ll/j2v0;->l(Ljava/lang/CharSequence;)Ll/j2v0;

    .line 135
    .line 136
    .line 137
    :cond_4
    if-eqz v11, :cond_2

    .line 138
    .line 139
    iget-object v13, v0, Ll/eqr0;->j:Ll/eqr0;

    .line 140
    .line 141
    invoke-virtual {v11}, Ll/kqr0;->r()I

    .line 142
    .line 143
    .line 144
    move-result v14

    .line 145
    const/4 v15, -0x1

    .line 146
    const/16 v3, 0x21

    .line 147
    .line 148
    if-eq v14, v15, :cond_5

    .line 149
    .line 150
    new-instance v14, Landroid/text/style/StyleSpan;

    .line 151
    .line 152
    invoke-virtual {v11}, Ll/kqr0;->r()I

    .line 153
    .line 154
    .line 155
    move-result v15

    .line 156
    invoke-direct {v14, v15}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 157
    .line 158
    .line 159
    invoke-interface {v12, v14, v7, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 160
    .line 161
    .line 162
    :cond_5
    invoke-virtual {v11}, Ll/kqr0;->i()Z

    .line 163
    .line 164
    .line 165
    move-result v14

    .line 166
    if-eqz v14, :cond_6

    .line 167
    .line 168
    new-instance v14, Landroid/text/style/StrikethroughSpan;

    .line 169
    .line 170
    invoke-direct {v14}, Landroid/text/style/StrikethroughSpan;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-interface {v12, v14, v7, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 174
    .line 175
    .line 176
    :cond_6
    invoke-virtual {v11}, Ll/kqr0;->j()Z

    .line 177
    .line 178
    .line 179
    move-result v14

    .line 180
    if-eqz v14, :cond_7

    .line 181
    .line 182
    new-instance v14, Landroid/text/style/UnderlineSpan;

    .line 183
    .line 184
    invoke-direct {v14}, Landroid/text/style/UnderlineSpan;-><init>()V

    .line 185
    .line 186
    .line 187
    invoke-interface {v12, v14, v7, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 188
    .line 189
    .line 190
    :cond_7
    invoke-virtual {v11}, Ll/kqr0;->h()Z

    .line 191
    .line 192
    .line 193
    move-result v14

    .line 194
    if-eqz v14, :cond_8

    .line 195
    .line 196
    new-instance v14, Landroid/text/style/ForegroundColorSpan;

    .line 197
    .line 198
    invoke-virtual {v11}, Ll/kqr0;->n()I

    .line 199
    .line 200
    .line 201
    move-result v15

    .line 202
    invoke-direct {v14, v15}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 203
    .line 204
    .line 205
    invoke-static {v12, v14, v7, v2, v3}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 206
    .line 207
    .line 208
    :cond_8
    invoke-virtual {v11}, Ll/kqr0;->g()Z

    .line 209
    .line 210
    .line 211
    move-result v14

    .line 212
    if-eqz v14, :cond_9

    .line 213
    .line 214
    new-instance v14, Landroid/text/style/BackgroundColorSpan;

    .line 215
    .line 216
    invoke-virtual {v11}, Ll/kqr0;->m()I

    .line 217
    .line 218
    .line 219
    move-result v15

    .line 220
    invoke-direct {v14, v15}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    .line 221
    .line 222
    .line 223
    invoke-static {v12, v14, v7, v2, v3}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 224
    .line 225
    .line 226
    :cond_9
    invoke-virtual {v11}, Ll/kqr0;->d()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v14

    .line 230
    if-eqz v14, :cond_a

    .line 231
    .line 232
    new-instance v14, Landroid/text/style/TypefaceSpan;

    .line 233
    .line 234
    invoke-virtual {v11}, Ll/kqr0;->d()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v15

    .line 238
    invoke-direct {v14, v15}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-static {v12, v14, v7, v2, v3}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 242
    .line 243
    .line 244
    :cond_a
    invoke-virtual {v11}, Ll/kqr0;->u()Ll/dqr0;

    .line 245
    .line 246
    .line 247
    move-result-object v14

    .line 248
    if-eqz v14, :cond_f

    .line 249
    .line 250
    invoke-virtual {v11}, Ll/kqr0;->u()Ll/dqr0;

    .line 251
    .line 252
    .line 253
    move-result-object v14

    .line 254
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 255
    .line 256
    .line 257
    iget v3, v14, Ll/dqr0;->a:I

    .line 258
    .line 259
    const/4 v15, -0x1

    .line 260
    if-ne v3, v15, :cond_d

    .line 261
    .line 262
    iget v3, v10, Ll/iqr0;->j:I

    .line 263
    .line 264
    const/4 v10, 0x2

    .line 265
    if-eq v3, v10, :cond_b

    .line 266
    .line 267
    const/4 v10, 0x1

    .line 268
    if-ne v3, v10, :cond_c

    .line 269
    .line 270
    :cond_b
    const/4 v3, 0x3

    .line 271
    goto :goto_3

    .line 272
    :cond_c
    const/4 v3, 0x1

    .line 273
    :goto_3
    const/4 v10, 0x1

    .line 274
    goto :goto_4

    .line 275
    :cond_d
    iget v10, v14, Ll/dqr0;->b:I

    .line 276
    .line 277
    :goto_4
    iget v14, v14, Ll/dqr0;->c:I

    .line 278
    .line 279
    const/4 v15, -0x2

    .line 280
    if-ne v14, v15, :cond_e

    .line 281
    .line 282
    const/4 v14, 0x1

    .line 283
    :cond_e
    new-instance v15, Ll/bdv0;

    .line 284
    .line 285
    invoke-direct {v15, v3, v10, v14}, Ll/bdv0;-><init>(III)V

    .line 286
    .line 287
    .line 288
    const/16 v3, 0x21

    .line 289
    .line 290
    invoke-static {v12, v15, v7, v2, v3}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 291
    .line 292
    .line 293
    :cond_f
    invoke-virtual {v11}, Ll/kqr0;->q()I

    .line 294
    .line 295
    .line 296
    move-result v3

    .line 297
    const/4 v10, 0x2

    .line 298
    if-eq v3, v10, :cond_11

    .line 299
    .line 300
    const/4 v10, 0x3

    .line 301
    if-eq v3, v10, :cond_10

    .line 302
    .line 303
    const/4 v10, 0x4

    .line 304
    if-eq v3, v10, :cond_10

    .line 305
    .line 306
    goto/16 :goto_a

    .line 307
    .line 308
    :cond_10
    new-instance v3, Ll/cqr0;

    .line 309
    .line 310
    invoke-direct {v3}, Ll/cqr0;-><init>()V

    .line 311
    .line 312
    .line 313
    const/16 v10, 0x21

    .line 314
    .line 315
    invoke-interface {v12, v3, v7, v2, v10}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 316
    .line 317
    .line 318
    goto/16 :goto_a

    .line 319
    .line 320
    :cond_11
    :goto_5
    if-eqz v13, :cond_13

    .line 321
    .line 322
    iget-object v10, v13, Ll/eqr0;->f:Ll/kqr0;

    .line 323
    .line 324
    iget-object v14, v13, Ll/eqr0;->g:[Ljava/lang/String;

    .line 325
    .line 326
    invoke-static {v10, v14, v4}, Ll/jqr0;->a(Ll/kqr0;[Ljava/lang/String;Ljava/util/Map;)Ll/kqr0;

    .line 327
    .line 328
    .line 329
    move-result-object v10

    .line 330
    if-eqz v10, :cond_12

    .line 331
    .line 332
    invoke-virtual {v10}, Ll/kqr0;->q()I

    .line 333
    .line 334
    .line 335
    move-result v10

    .line 336
    const/4 v14, 0x1

    .line 337
    if-eq v10, v14, :cond_14

    .line 338
    .line 339
    :cond_12
    iget-object v13, v13, Ll/eqr0;->j:Ll/eqr0;

    .line 340
    .line 341
    goto :goto_5

    .line 342
    :cond_13
    const/4 v13, 0x0

    .line 343
    :cond_14
    if-eqz v13, :cond_1b

    .line 344
    .line 345
    new-instance v10, Ljava/util/ArrayDeque;

    .line 346
    .line 347
    invoke-direct {v10}, Ljava/util/ArrayDeque;-><init>()V

    .line 348
    .line 349
    .line 350
    invoke-interface {v10, v13}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    .line 351
    .line 352
    .line 353
    :cond_15
    invoke-interface {v10}, Ljava/util/Collection;->isEmpty()Z

    .line 354
    .line 355
    .line 356
    move-result v14

    .line 357
    if-nez v14, :cond_17

    .line 358
    .line 359
    invoke-interface {v10}, Ljava/util/Deque;->pop()Ljava/lang/Object;

    .line 360
    .line 361
    .line 362
    move-result-object v14

    .line 363
    check-cast v14, Ll/eqr0;

    .line 364
    .line 365
    iget-object v15, v14, Ll/eqr0;->f:Ll/kqr0;

    .line 366
    .line 367
    iget-object v3, v14, Ll/eqr0;->g:[Ljava/lang/String;

    .line 368
    .line 369
    invoke-static {v15, v3, v4}, Ll/jqr0;->a(Ll/kqr0;[Ljava/lang/String;Ljava/util/Map;)Ll/kqr0;

    .line 370
    .line 371
    .line 372
    move-result-object v3

    .line 373
    if-eqz v3, :cond_16

    .line 374
    .line 375
    invoke-virtual {v3}, Ll/kqr0;->q()I

    .line 376
    .line 377
    .line 378
    move-result v3

    .line 379
    const/4 v15, 0x3

    .line 380
    if-ne v3, v15, :cond_16

    .line 381
    .line 382
    move-object v3, v14

    .line 383
    goto :goto_7

    .line 384
    :cond_16
    invoke-virtual {v14}, Ll/eqr0;->a()I

    .line 385
    .line 386
    .line 387
    move-result v3

    .line 388
    const/16 v16, -0x1

    .line 389
    .line 390
    add-int/lit8 v3, v3, -0x1

    .line 391
    .line 392
    :goto_6
    if-ltz v3, :cond_15

    .line 393
    .line 394
    invoke-virtual {v14, v3}, Ll/eqr0;->d(I)Ll/eqr0;

    .line 395
    .line 396
    .line 397
    move-result-object v15

    .line 398
    invoke-interface {v10, v15}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    .line 399
    .line 400
    .line 401
    add-int/lit8 v3, v3, -0x1

    .line 402
    .line 403
    goto :goto_6

    .line 404
    :cond_17
    const/4 v3, 0x0

    .line 405
    :goto_7
    if-eqz v3, :cond_1b

    .line 406
    .line 407
    invoke-virtual {v3}, Ll/eqr0;->a()I

    .line 408
    .line 409
    .line 410
    move-result v10

    .line 411
    const/4 v14, 0x1

    .line 412
    if-ne v10, v14, :cond_1a

    .line 413
    .line 414
    const/4 v10, 0x0

    .line 415
    invoke-virtual {v3, v10}, Ll/eqr0;->d(I)Ll/eqr0;

    .line 416
    .line 417
    .line 418
    move-result-object v14

    .line 419
    iget-object v14, v14, Ll/eqr0;->b:Ljava/lang/String;

    .line 420
    .line 421
    if-eqz v14, :cond_1a

    .line 422
    .line 423
    invoke-virtual {v3, v10}, Ll/eqr0;->d(I)Ll/eqr0;

    .line 424
    .line 425
    .line 426
    move-result-object v10

    .line 427
    iget-object v10, v10, Ll/eqr0;->b:Ljava/lang/String;

    .line 428
    .line 429
    sget v14, Ll/mpw0;->a:I

    .line 430
    .line 431
    iget-object v14, v3, Ll/eqr0;->f:Ll/kqr0;

    .line 432
    .line 433
    iget-object v3, v3, Ll/eqr0;->g:[Ljava/lang/String;

    .line 434
    .line 435
    invoke-static {v14, v3, v4}, Ll/jqr0;->a(Ll/kqr0;[Ljava/lang/String;Ljava/util/Map;)Ll/kqr0;

    .line 436
    .line 437
    .line 438
    move-result-object v3

    .line 439
    if-eqz v3, :cond_18

    .line 440
    .line 441
    invoke-virtual {v3}, Ll/kqr0;->p()I

    .line 442
    .line 443
    .line 444
    move-result v15

    .line 445
    :goto_8
    const/4 v3, -0x1

    .line 446
    goto :goto_9

    .line 447
    :cond_18
    const/4 v15, -0x1

    .line 448
    goto :goto_8

    .line 449
    :goto_9
    if-ne v15, v3, :cond_19

    .line 450
    .line 451
    iget-object v3, v13, Ll/eqr0;->f:Ll/kqr0;

    .line 452
    .line 453
    iget-object v13, v13, Ll/eqr0;->g:[Ljava/lang/String;

    .line 454
    .line 455
    invoke-static {v3, v13, v4}, Ll/jqr0;->a(Ll/kqr0;[Ljava/lang/String;Ljava/util/Map;)Ll/kqr0;

    .line 456
    .line 457
    .line 458
    move-result-object v3

    .line 459
    if-eqz v3, :cond_19

    .line 460
    .line 461
    invoke-virtual {v3}, Ll/kqr0;->p()I

    .line 462
    .line 463
    .line 464
    move-result v15

    .line 465
    :cond_19
    new-instance v3, Ll/sav0;

    .line 466
    .line 467
    invoke-direct {v3, v10, v15}, Ll/sav0;-><init>(Ljava/lang/String;I)V

    .line 468
    .line 469
    .line 470
    const/16 v10, 0x21

    .line 471
    .line 472
    invoke-interface {v12, v3, v7, v2, v10}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 473
    .line 474
    .line 475
    goto :goto_a

    .line 476
    :cond_1a
    const-string v3, "TtmlRenderUtil"

    .line 477
    .line 478
    const-string v10, "Skipping rubyText node without exactly one text child."

    .line 479
    .line 480
    invoke-static {v3, v10}, Ll/y4w0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 481
    .line 482
    .line 483
    :cond_1b
    :goto_a
    invoke-virtual {v11}, Ll/kqr0;->f()Z

    .line 484
    .line 485
    .line 486
    move-result v3

    .line 487
    if-eqz v3, :cond_1c

    .line 488
    .line 489
    new-instance v3, Ll/r9v0;

    .line 490
    .line 491
    invoke-direct {v3}, Ll/r9v0;-><init>()V

    .line 492
    .line 493
    .line 494
    const/16 v10, 0x21

    .line 495
    .line 496
    invoke-static {v12, v3, v7, v2, v10}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 497
    .line 498
    .line 499
    :cond_1c
    invoke-virtual {v11}, Ll/kqr0;->o()I

    .line 500
    .line 501
    .line 502
    move-result v3

    .line 503
    const/high16 v10, 0x42c80000    # 100.0f

    .line 504
    .line 505
    const/4 v14, 0x1

    .line 506
    if-eq v3, v14, :cond_1f

    .line 507
    .line 508
    const/4 v13, 0x2

    .line 509
    if-eq v3, v13, :cond_1e

    .line 510
    .line 511
    const/4 v15, 0x3

    .line 512
    if-eq v3, v15, :cond_1d

    .line 513
    .line 514
    goto :goto_b

    .line 515
    :cond_1d
    new-instance v3, Landroid/text/style/RelativeSizeSpan;

    .line 516
    .line 517
    invoke-virtual {v11}, Ll/kqr0;->k()F

    .line 518
    .line 519
    .line 520
    move-result v13

    .line 521
    div-float/2addr v13, v10

    .line 522
    invoke-direct {v3, v13}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 523
    .line 524
    .line 525
    const/16 v13, 0x21

    .line 526
    .line 527
    invoke-static {v12, v3, v7, v2, v13}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 528
    .line 529
    .line 530
    goto :goto_b

    .line 531
    :cond_1e
    const/16 v13, 0x21

    .line 532
    .line 533
    new-instance v3, Landroid/text/style/RelativeSizeSpan;

    .line 534
    .line 535
    invoke-virtual {v11}, Ll/kqr0;->k()F

    .line 536
    .line 537
    .line 538
    move-result v14

    .line 539
    invoke-direct {v3, v14}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 540
    .line 541
    .line 542
    invoke-static {v12, v3, v7, v2, v13}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 543
    .line 544
    .line 545
    goto :goto_b

    .line 546
    :cond_1f
    const/16 v13, 0x21

    .line 547
    .line 548
    new-instance v3, Landroid/text/style/AbsoluteSizeSpan;

    .line 549
    .line 550
    invoke-virtual {v11}, Ll/kqr0;->k()F

    .line 551
    .line 552
    .line 553
    move-result v14

    .line 554
    float-to-int v14, v14

    .line 555
    const/4 v15, 0x1

    .line 556
    invoke-direct {v3, v14, v15}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 557
    .line 558
    .line 559
    invoke-static {v12, v3, v7, v2, v13}, Ll/ybv0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 560
    .line 561
    .line 562
    :goto_b
    iget-object v2, v0, Ll/eqr0;->a:Ljava/lang/String;

    .line 563
    .line 564
    const-string v3, "p"

    .line 565
    .line 566
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 567
    .line 568
    .line 569
    move-result v2

    .line 570
    if-eqz v2, :cond_2

    .line 571
    .line 572
    invoke-virtual {v11}, Ll/kqr0;->l()F

    .line 573
    .line 574
    .line 575
    move-result v2

    .line 576
    const v3, 0x7f7fffff    # Float.MAX_VALUE

    .line 577
    .line 578
    .line 579
    cmpl-float v2, v2, v3

    .line 580
    .line 581
    if-eqz v2, :cond_20

    .line 582
    .line 583
    invoke-virtual {v11}, Ll/kqr0;->l()F

    .line 584
    .line 585
    .line 586
    move-result v2

    .line 587
    const/high16 v3, -0x3d4c0000    # -90.0f

    .line 588
    .line 589
    mul-float/2addr v2, v3

    .line 590
    div-float/2addr v2, v10

    .line 591
    invoke-virtual {v5, v2}, Ll/j2v0;->j(F)Ll/j2v0;

    .line 592
    .line 593
    .line 594
    :cond_20
    invoke-virtual {v11}, Ll/kqr0;->t()Landroid/text/Layout$Alignment;

    .line 595
    .line 596
    .line 597
    move-result-object v2

    .line 598
    if-eqz v2, :cond_21

    .line 599
    .line 600
    invoke-virtual {v11}, Ll/kqr0;->t()Landroid/text/Layout$Alignment;

    .line 601
    .line 602
    .line 603
    move-result-object v2

    .line 604
    invoke-virtual {v5, v2}, Ll/j2v0;->m(Landroid/text/Layout$Alignment;)Ll/j2v0;

    .line 605
    .line 606
    .line 607
    :cond_21
    invoke-virtual {v11}, Ll/kqr0;->s()Landroid/text/Layout$Alignment;

    .line 608
    .line 609
    .line 610
    move-result-object v2

    .line 611
    if-eqz v2, :cond_2

    .line 612
    .line 613
    invoke-virtual {v11}, Ll/kqr0;->s()Landroid/text/Layout$Alignment;

    .line 614
    .line 615
    .line 616
    move-result-object v2

    .line 617
    invoke-virtual {v5, v2}, Ll/j2v0;->g(Landroid/text/Layout$Alignment;)Ll/j2v0;

    .line 618
    .line 619
    .line 620
    goto/16 :goto_1

    .line 621
    .line 622
    :cond_22
    move-object/from16 v9, p4

    .line 623
    .line 624
    move-object/from16 v8, p6

    .line 625
    .line 626
    goto/16 :goto_1

    .line 627
    .line 628
    :cond_23
    const/4 v10, 0x0

    .line 629
    :goto_c
    move-object/from16 v9, p4

    .line 630
    .line 631
    move-object/from16 v8, p6

    .line 632
    .line 633
    invoke-virtual {v0}, Ll/eqr0;->a()I

    .line 634
    .line 635
    .line 636
    move-result v1

    .line 637
    if-ge v10, v1, :cond_24

    .line 638
    .line 639
    invoke-virtual {v0, v10}, Ll/eqr0;->d(I)Ll/eqr0;

    .line 640
    .line 641
    .line 642
    move-result-object v1

    .line 643
    move-wide/from16 v2, p1

    .line 644
    .line 645
    move-object v7, v8

    .line 646
    move-object v5, v9

    .line 647
    invoke-virtual/range {v1 .. v7}, Ll/eqr0;->l(JLjava/util/Map;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V

    .line 648
    .line 649
    .line 650
    add-int/lit8 v10, v10, 0x1

    .line 651
    .line 652
    move-object/from16 v4, p3

    .line 653
    .line 654
    goto :goto_c

    .line 655
    :cond_24
    :goto_d
    return-void
.end method

.method public final m(JZLjava/lang/String;Ljava/util/Map;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/eqr0;->k:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/eqr0;->l:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 9
    .line 10
    .line 11
    const-string v0, "metadata"

    .line 12
    .line 13
    iget-object v1, p0, Ll/eqr0;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto/16 :goto_6

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/eqr0;->h:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, ""

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object p4, p0, Ll/eqr0;->h:Ljava/lang/String;

    .line 34
    .line 35
    :cond_1
    move-object v4, p4

    .line 36
    iget-boolean p4, p0, Ll/eqr0;->c:Z

    .line 37
    .line 38
    if-eqz p4, :cond_2

    .line 39
    .line 40
    if-eqz p3, :cond_2

    .line 41
    .line 42
    invoke-static {v4, p5}, Ll/eqr0;->i(Ljava/lang/String;Ljava/util/Map;)Landroid/text/SpannableStringBuilder;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p0, p0, Ll/eqr0;->b:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    iget-object p4, p0, Ll/eqr0;->a:Ljava/lang/String;

    .line 56
    .line 57
    const-string v0, "br"

    .line 58
    .line 59
    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p4

    .line 63
    const/16 v6, 0xa

    .line 64
    .line 65
    if-eqz p4, :cond_4

    .line 66
    .line 67
    if-nez p3, :cond_3

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    invoke-static {v4, p5}, Ll/eqr0;->i(Ljava/lang/String;Ljava/util/Map;)Landroid/text/SpannableStringBuilder;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0, v6}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_4
    :goto_0
    invoke-virtual {p0, p1, p2}, Ll/eqr0;->g(J)Z

    .line 79
    .line 80
    .line 81
    move-result p4

    .line 82
    if-eqz p4, :cond_b

    .line 83
    .line 84
    invoke-interface {p5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 85
    .line 86
    .line 87
    move-result-object p4

    .line 88
    invoke-interface {p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 89
    .line 90
    .line 91
    move-result-object p4

    .line 92
    :goto_1
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_5

    .line 97
    .line 98
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    check-cast v0, Ljava/util/Map$Entry;

    .line 103
    .line 104
    iget-object v1, p0, Ll/eqr0;->k:Ljava/util/HashMap;

    .line 105
    .line 106
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    check-cast v2, Ljava/lang/String;

    .line 111
    .line 112
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Ll/j2v0;

    .line 117
    .line 118
    invoke-virtual {v0}, Ll/j2v0;->q()Ljava/lang/CharSequence;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 123
    .line 124
    .line 125
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_5
    iget-object p4, p0, Ll/eqr0;->a:Ljava/lang/String;

    .line 138
    .line 139
    const-string v0, "p"

    .line 140
    .line 141
    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p4

    .line 145
    const/4 v7, 0x0

    .line 146
    move v8, v7

    .line 147
    :goto_2
    invoke-virtual {p0}, Ll/eqr0;->a()I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-ge v8, v0, :cond_8

    .line 152
    .line 153
    invoke-virtual {p0, v8}, Ll/eqr0;->d(I)Ll/eqr0;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    const/4 v1, 0x1

    .line 158
    if-nez p3, :cond_6

    .line 159
    .line 160
    if-eqz p4, :cond_7

    .line 161
    .line 162
    :cond_6
    move-object v5, p5

    .line 163
    move v3, v1

    .line 164
    move-wide v1, p1

    .line 165
    goto :goto_3

    .line 166
    :cond_7
    move-wide v1, p1

    .line 167
    move-object v5, p5

    .line 168
    move v3, v7

    .line 169
    :goto_3
    invoke-virtual/range {v0 .. v5}, Ll/eqr0;->m(JZLjava/lang/String;Ljava/util/Map;)V

    .line 170
    .line 171
    .line 172
    add-int/lit8 v8, v8, 0x1

    .line 173
    .line 174
    move-wide p1, v1

    .line 175
    move-object p5, v5

    .line 176
    goto :goto_2

    .line 177
    :cond_8
    move-object v5, p5

    .line 178
    if-eqz p4, :cond_a

    .line 179
    .line 180
    invoke-static {v4, v5}, Ll/eqr0;->i(Ljava/lang/String;Ljava/util/Map;)Landroid/text/SpannableStringBuilder;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    :goto_4
    add-int/lit8 p2, p2, -0x1

    .line 189
    .line 190
    if-ltz p2, :cond_9

    .line 191
    .line 192
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 193
    .line 194
    .line 195
    move-result p3

    .line 196
    const/16 p4, 0x20

    .line 197
    .line 198
    if-ne p3, p4, :cond_9

    .line 199
    .line 200
    goto :goto_4

    .line 201
    :cond_9
    if-ltz p2, :cond_a

    .line 202
    .line 203
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 204
    .line 205
    .line 206
    move-result p2

    .line 207
    if-eq p2, v6, :cond_a

    .line 208
    .line 209
    invoke-virtual {p1, v6}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 210
    .line 211
    .line 212
    :cond_a
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 221
    .line 222
    .line 223
    move-result p2

    .line 224
    if-eqz p2, :cond_b

    .line 225
    .line 226
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    check-cast p2, Ljava/util/Map$Entry;

    .line 231
    .line 232
    iget-object p3, p0, Ll/eqr0;->l:Ljava/util/HashMap;

    .line 233
    .line 234
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object p4

    .line 238
    check-cast p4, Ljava/lang/String;

    .line 239
    .line 240
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object p2

    .line 244
    check-cast p2, Ll/j2v0;

    .line 245
    .line 246
    invoke-virtual {p2}, Ll/j2v0;->q()Ljava/lang/CharSequence;

    .line 247
    .line 248
    .line 249
    move-result-object p2

    .line 250
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 251
    .line 252
    .line 253
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 254
    .line 255
    .line 256
    move-result p2

    .line 257
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 258
    .line 259
    .line 260
    move-result-object p2

    .line 261
    invoke-virtual {p3, p4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    goto :goto_5

    .line 265
    :cond_b
    :goto_6
    return-void
.end method
