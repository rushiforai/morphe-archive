.class Lcom/alibaba/fastjson/JSONPath$JSONPathParser;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/fastjson/JSONPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "JSONPathParser"
.end annotation


# static fields
.field private static final strArrayPatternx:Ljava/util/regex/Pattern;

.field private static final strArrayRegex:Ljava/lang/String; = "\'\\s*,\\s*\'"


# instance fields
.field private ch:C

.field private hasRefSegment:Z

.field private level:I

.field private final path:Ljava/lang/String;

.field private pos:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "\'\\s*,\\s*\'"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->strArrayPatternx:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic access$000(Lcom/alibaba/fastjson/JSONPath$JSONPathParser;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->hasRefSegment:Z

    .line 2
    .line 3
    return p0
.end method

.method public static isDigitFirst(C)Z
    .locals 1

    const/16 v0, 0x2d

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2b

    if-eq p0, v0, :cond_1

    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public accept(C)V
    .locals 3

    .line 1
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 2
    .line 3
    if-ne v0, p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    new-instance v0, Lcom/alibaba/fastjson/JSONPathException;

    .line 16
    .line 17
    iget-char p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 18
    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v2, "expect \'"

    .line 22
    .line 23
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p1, ", but \'"

    .line 30
    .line 31
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p0, "\'"

    .line 38
    .line 39
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw v0
.end method

.method public buildArraySegement(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONPath$Segment;
    .locals 9

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    sub-int/2addr p0, v2

    .line 12
    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    const/16 v4, 0x2c

    .line 17
    .line 18
    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    const/4 v6, -0x1

    .line 27
    const/4 v7, 0x2

    .line 28
    if-le v5, v7, :cond_2

    .line 29
    .line 30
    const/16 v5, 0x27

    .line 31
    .line 32
    if-ne v1, v5, :cond_2

    .line 33
    .line 34
    if-ne v3, v5, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1, v2, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    if-eq v4, v6, :cond_1

    .line 41
    .line 42
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->strArrayPatternx:Ljava/util/regex/Pattern;

    .line 43
    .line 44
    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const-string p1, "\'\\s*,\\s*\'"

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    new-instance p1, Lcom/alibaba/fastjson/JSONPath$MultiPropertySegment;

    .line 62
    .line 63
    invoke-direct {p1, p0}, Lcom/alibaba/fastjson/JSONPath$MultiPropertySegment;-><init>([Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-object p1

    .line 67
    :cond_1
    :goto_0
    new-instance p1, Lcom/alibaba/fastjson/JSONPath$PropertySegment;

    .line 68
    .line 69
    invoke-direct {p1, p0, v0}, Lcom/alibaba/fastjson/JSONPath$PropertySegment;-><init>(Ljava/lang/String;Z)V

    .line 70
    .line 71
    .line 72
    return-object p1

    .line 73
    :cond_2
    const/16 p0, 0x3a

    .line 74
    .line 75
    invoke-virtual {p1, p0}, Ljava/lang/String;->indexOf(I)I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-ne v4, v6, :cond_5

    .line 80
    .line 81
    if-ne p0, v6, :cond_5

    .line 82
    .line 83
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->isNumber(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_3

    .line 88
    .line 89
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    new-instance v1, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegment;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegment;-><init>(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    .line 98
    return-object v1

    .line 99
    :catch_0
    new-instance p0, Lcom/alibaba/fastjson/JSONPath$PropertySegment;

    .line 100
    .line 101
    invoke-direct {p0, p1, v0}, Lcom/alibaba/fastjson/JSONPath$PropertySegment;-><init>(Ljava/lang/String;Z)V

    .line 102
    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_3
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    const/16 v1, 0x22

    .line 110
    .line 111
    if-ne p0, v1, :cond_4

    .line 112
    .line 113
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    sub-int/2addr p0, v2

    .line 118
    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-ne p0, v1, :cond_4

    .line 123
    .line 124
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    sub-int/2addr p0, v2

    .line 129
    invoke-virtual {p1, v2, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    :cond_4
    new-instance p0, Lcom/alibaba/fastjson/JSONPath$PropertySegment;

    .line 134
    .line 135
    invoke-direct {p0, p1, v0}, Lcom/alibaba/fastjson/JSONPath$PropertySegment;-><init>(Ljava/lang/String;Z)V

    .line 136
    .line 137
    .line 138
    return-object p0

    .line 139
    :cond_5
    if-eq v4, v6, :cond_7

    .line 140
    .line 141
    const-string p0, ","

    .line 142
    .line 143
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    array-length p1, p0

    .line 148
    new-array p1, p1, [I

    .line 149
    .line 150
    :goto_1
    array-length v1, p0

    .line 151
    if-ge v0, v1, :cond_6

    .line 152
    .line 153
    aget-object v1, p0, v0

    .line 154
    .line 155
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    aput v1, p1, v0

    .line 160
    .line 161
    add-int/lit8 v0, v0, 0x1

    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_6
    new-instance p0, Lcom/alibaba/fastjson/JSONPath$MultiIndexSegment;

    .line 165
    .line 166
    invoke-direct {p0, p1}, Lcom/alibaba/fastjson/JSONPath$MultiIndexSegment;-><init>([I)V

    .line 167
    .line 168
    .line 169
    return-object p0

    .line 170
    :cond_7
    const/4 v1, 0x0

    .line 171
    if-eq p0, v6, :cond_10

    .line 172
    .line 173
    const-string p0, ":"

    .line 174
    .line 175
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    array-length p1, p0

    .line 180
    new-array v3, p1, [I

    .line 181
    .line 182
    move v4, v0

    .line 183
    :goto_2
    array-length v5, p0

    .line 184
    if-ge v4, v5, :cond_a

    .line 185
    .line 186
    aget-object v5, p0, v4

    .line 187
    .line 188
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 189
    .line 190
    .line 191
    move-result v8

    .line 192
    if-nez v8, :cond_9

    .line 193
    .line 194
    if-nez v4, :cond_8

    .line 195
    .line 196
    aput v0, v3, v4

    .line 197
    .line 198
    goto :goto_3

    .line 199
    :cond_8
    invoke-static {}, Ll/l710;->a()V

    .line 200
    .line 201
    .line 202
    return-object v1

    .line 203
    :cond_9
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    move-result v5

    .line 207
    aput v5, v3, v4

    .line 208
    .line 209
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 210
    .line 211
    goto :goto_2

    .line 212
    :cond_a
    aget p0, v3, v0

    .line 213
    .line 214
    if-le p1, v2, :cond_b

    .line 215
    .line 216
    aget v6, v3, v2

    .line 217
    .line 218
    :cond_b
    const/4 v0, 0x3

    .line 219
    if-ne p1, v0, :cond_c

    .line 220
    .line 221
    aget v2, v3, v7

    .line 222
    .line 223
    :cond_c
    if-ltz v6, :cond_e

    .line 224
    .line 225
    if-lt v6, p0, :cond_d

    .line 226
    .line 227
    goto :goto_4

    .line 228
    :cond_d
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    .line 229
    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    const-string v1, "end must greater than or equals start. start "

    .line 233
    .line 234
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    const-string p0, ",  end "

    .line 241
    .line 242
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    invoke-direct {p1, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    throw p1

    .line 256
    :cond_e
    :goto_4
    if-lez v2, :cond_f

    .line 257
    .line 258
    new-instance p1, Lcom/alibaba/fastjson/JSONPath$RangeSegment;

    .line 259
    .line 260
    invoke-direct {p1, p0, v6, v2}, Lcom/alibaba/fastjson/JSONPath$RangeSegment;-><init>(III)V

    .line 261
    .line 262
    .line 263
    return-object p1

    .line 264
    :cond_f
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 265
    .line 266
    new-instance p1, Ljava/lang/StringBuilder;

    .line 267
    .line 268
    const-string v0, "step must greater than zero : "

    .line 269
    .line 270
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    throw p0

    .line 284
    :cond_10
    invoke-static {}, Ll/l710;->a()V

    .line 285
    .line 286
    .line 287
    return-object v1
.end method

.method public explain()[Lcom/alibaba/fastjson/JSONPath$Segment;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    new-array v0, v0, [Lcom/alibaba/fastjson/JSONPath$Segment;

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readSegement()Lcom/alibaba/fastjson/JSONPath$Segment;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    iget p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    .line 23
    .line 24
    array-length v1, v0

    .line 25
    if-ne p0, v1, :cond_0

    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_0
    new-array v1, p0, [Lcom/alibaba/fastjson/JSONPath$Segment;

    .line 29
    .line 30
    invoke-static {v0, v2, v1, v2, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 31
    .line 32
    .line 33
    return-object v1

    .line 34
    :cond_1
    instance-of v3, v1, Lcom/alibaba/fastjson/JSONPath$PropertySegment;

    .line 35
    .line 36
    if-eqz v3, :cond_2

    .line 37
    .line 38
    move-object v3, v1

    .line 39
    check-cast v3, Lcom/alibaba/fastjson/JSONPath$PropertySegment;

    .line 40
    .line 41
    invoke-static {v3}, Lcom/alibaba/fastjson/JSONPath$PropertySegment;->access$100(Lcom/alibaba/fastjson/JSONPath$PropertySegment;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-nez v4, :cond_2

    .line 46
    .line 47
    invoke-static {v3}, Lcom/alibaba/fastjson/JSONPath$PropertySegment;->access$400(Lcom/alibaba/fastjson/JSONPath$PropertySegment;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    const-string v4, "*"

    .line 52
    .line 53
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    .line 61
    .line 62
    array-length v4, v0

    .line 63
    if-ne v3, v4, :cond_3

    .line 64
    .line 65
    mul-int/lit8 v4, v3, 0x3

    .line 66
    .line 67
    div-int/lit8 v4, v4, 0x2

    .line 68
    .line 69
    new-array v4, v4, [Lcom/alibaba/fastjson/JSONPath$Segment;

    .line 70
    .line 71
    invoke-static {v0, v2, v4, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 72
    .line 73
    .line 74
    move-object v0, v4

    .line 75
    :cond_3
    iget v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    .line 76
    .line 77
    add-int/lit8 v3, v2, 0x1

    .line 78
    .line 79
    iput v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    .line 80
    .line 81
    aput-object v1, v0, v2

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    invoke-static {}, Ll/fig0;->a()V

    .line 85
    .line 86
    .line 87
    const/4 p0, 0x0

    .line 88
    return-object p0
.end method

.method public filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;
    .locals 5

    .line 1
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const/16 v3, 0x26

    .line 6
    .line 7
    if-ne v0, v3, :cond_0

    .line 8
    .line 9
    move v4, v1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v4, v2

    .line 12
    :goto_0
    if-ne v0, v3, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->getNextChar()C

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eq v0, v3, :cond_2

    .line 19
    .line 20
    :cond_1
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 21
    .line 22
    const/16 v3, 0x7c

    .line 23
    .line 24
    if-ne v0, v3, :cond_6

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->getNextChar()C

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-ne v0, v3, :cond_6

    .line 31
    .line 32
    :cond_2
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 36
    .line 37
    .line 38
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 39
    .line 40
    const/16 v3, 0x28

    .line 41
    .line 42
    if-ne v0, v3, :cond_3

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_3
    move v1, v2

    .line 49
    :goto_1
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 50
    .line 51
    const/16 v3, 0x20

    .line 52
    .line 53
    if-ne v0, v3, :cond_4

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_4
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->parseArrayAccessFilter(Z)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 64
    .line 65
    new-instance v2, Lcom/alibaba/fastjson/JSONPath$FilterGroup;

    .line 66
    .line 67
    invoke-direct {v2, p1, v0, v4}, Lcom/alibaba/fastjson/JSONPath$FilterGroup;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;Lcom/alibaba/fastjson/JSONPath$Filter;Z)V

    .line 68
    .line 69
    .line 70
    if-eqz v1, :cond_5

    .line 71
    .line 72
    iget-char p1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 73
    .line 74
    const/16 v0, 0x29

    .line 75
    .line 76
    if-ne p1, v0, :cond_5

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 79
    .line 80
    .line 81
    :cond_5
    return-object v2

    .line 82
    :cond_6
    return-object p1
.end method

.method public getNextChar()C
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 2
    .line 3
    iget p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->charAt(I)C

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isEOF()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-lt v0, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public next()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 2
    .line 3
    iget v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 14
    .line 15
    return-void
.end method

.method public parseArrayAccess(Z)Lcom/alibaba/fastjson/JSONPath$Segment;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->parseArrayAccessFilter(Z)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, Lcom/alibaba/fastjson/JSONPath$Segment;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/alibaba/fastjson/JSONPath$Segment;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p1, Lcom/alibaba/fastjson/JSONPath$FilterSegment;

    .line 13
    .line 14
    check-cast p0, Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Lcom/alibaba/fastjson/JSONPath$FilterSegment;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    .line 17
    .line 18
    .line 19
    return-object p1
.end method

.method public parseArrayAccessFilter(Z)Ljava/lang/Object;
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/16 v1, 0x5b

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 11
    .line 12
    const/16 v2, 0x3f

    .line 13
    .line 14
    const/16 v3, 0x28

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    const/4 v5, 0x1

    .line 18
    if-ne v1, v2, :cond_2

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 24
    .line 25
    .line 26
    move v1, v5

    .line 27
    :goto_0
    iget-char v2, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 28
    .line 29
    if-ne v2, v3, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 32
    .line 33
    .line 34
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    move v2, v5

    .line 38
    goto :goto_1

    .line 39
    :cond_2
    move v1, v4

    .line 40
    move v2, v1

    .line 41
    :goto_1
    const/16 v6, 0x40

    .line 42
    .line 43
    const/16 v7, 0x27

    .line 44
    .line 45
    const/16 v8, 0x5c

    .line 46
    .line 47
    const/4 v9, -0x1

    .line 48
    const/16 v10, 0x2e

    .line 49
    .line 50
    const/16 v11, 0x2f

    .line 51
    .line 52
    const/4 v12, 0x2

    .line 53
    const/16 v13, 0x5d

    .line 54
    .line 55
    const/16 v14, 0x29

    .line 56
    .line 57
    if-nez v2, :cond_f

    .line 58
    .line 59
    iget-char v15, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 60
    .line 61
    invoke-static {v15}, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifier(C)Z

    .line 62
    .line 63
    .line 64
    move-result v15

    .line 65
    if-nez v15, :cond_f

    .line 66
    .line 67
    iget-char v15, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 68
    .line 69
    if-eq v15, v8, :cond_f

    .line 70
    .line 71
    if-ne v15, v6, :cond_3

    .line 72
    .line 73
    goto/16 :goto_8

    .line 74
    .line 75
    :cond_3
    iget v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 76
    .line 77
    sub-int/2addr v1, v5

    .line 78
    :goto_2
    iget-char v3, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 79
    .line 80
    if-eq v3, v13, :cond_6

    .line 81
    .line 82
    if-eq v3, v11, :cond_6

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    if-nez v3, :cond_6

    .line 89
    .line 90
    iget-char v3, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 91
    .line 92
    if-ne v3, v10, :cond_4

    .line 93
    .line 94
    if-nez v2, :cond_4

    .line 95
    .line 96
    if-nez v2, :cond_4

    .line 97
    .line 98
    if-eq v15, v7, :cond_4

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_4
    if-ne v3, v8, :cond_5

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 104
    .line 105
    .line 106
    :cond_5
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_6
    :goto_3
    if-eqz p1, :cond_7

    .line 111
    .line 112
    iget v3, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 113
    .line 114
    :goto_4
    sub-int/2addr v3, v5

    .line 115
    goto :goto_6

    .line 116
    :cond_7
    iget-char v3, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 117
    .line 118
    if-eq v3, v11, :cond_9

    .line 119
    .line 120
    if-ne v3, v10, :cond_8

    .line 121
    .line 122
    goto :goto_5

    .line 123
    :cond_8
    iget v3, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 124
    .line 125
    goto :goto_6

    .line 126
    :cond_9
    :goto_5
    iget v3, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :goto_6
    iget-object v6, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v6, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    const-string v3, "\\."

    .line 136
    .line 137
    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    move-result v6

    .line 141
    if-eq v6, v9, :cond_d

    .line 142
    .line 143
    if-ne v15, v7, :cond_a

    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    if-le v6, v12, :cond_a

    .line 150
    .line 151
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    sub-int/2addr v6, v5

    .line 156
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    .line 157
    .line 158
    .line 159
    move-result v6

    .line 160
    if-ne v6, v15, :cond_a

    .line 161
    .line 162
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    sub-int/2addr v3, v5

    .line 167
    invoke-virtual {v1, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    goto :goto_7

    .line 172
    :cond_a
    const-string v5, "\\\\\\."

    .line 173
    .line 174
    invoke-virtual {v1, v5, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    const-string v3, "\\-"

    .line 179
    .line 180
    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    if-eq v3, v9, :cond_b

    .line 185
    .line 186
    const-string v3, "\\\\-"

    .line 187
    .line 188
    const-string v5, "-"

    .line 189
    .line 190
    invoke-virtual {v1, v3, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    :cond_b
    :goto_7
    if-eqz v2, :cond_c

    .line 195
    .line 196
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 197
    .line 198
    .line 199
    :cond_c
    new-instance v0, Lcom/alibaba/fastjson/JSONPath$PropertySegment;

    .line 200
    .line 201
    invoke-direct {v0, v1, v4}, Lcom/alibaba/fastjson/JSONPath$PropertySegment;-><init>(Ljava/lang/String;Z)V

    .line 202
    .line 203
    .line 204
    return-object v0

    .line 205
    :cond_d
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->buildArraySegement(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONPath$Segment;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    if-eqz p1, :cond_e

    .line 210
    .line 211
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    if-nez v2, :cond_e

    .line 216
    .line 217
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 218
    .line 219
    .line 220
    :cond_e
    return-object v1

    .line 221
    :cond_f
    :goto_8
    iget-char v15, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 222
    .line 223
    if-ne v15, v6, :cond_10

    .line 224
    .line 225
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 229
    .line 230
    .line 231
    :cond_10
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v6

    .line 235
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 236
    .line 237
    .line 238
    const/16 v15, 0x7c

    .line 239
    .line 240
    const/16 v3, 0x26

    .line 241
    .line 242
    const/16 v12, 0x20

    .line 243
    .line 244
    if-eqz v2, :cond_15

    .line 245
    .line 246
    iget-char v9, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 247
    .line 248
    if-ne v9, v14, :cond_15

    .line 249
    .line 250
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 251
    .line 252
    .line 253
    new-instance v1, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;

    .line 254
    .line 255
    invoke-direct {v1, v6}, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;-><init>(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    :goto_9
    iget-char v2, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 259
    .line 260
    if-ne v2, v12, :cond_11

    .line 261
    .line 262
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 263
    .line 264
    .line 265
    goto :goto_9

    .line 266
    :cond_11
    if-eq v2, v3, :cond_12

    .line 267
    .line 268
    if-ne v2, v15, :cond_13

    .line 269
    .line 270
    :cond_12
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    :cond_13
    if-eqz p1, :cond_14

    .line 275
    .line 276
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 277
    .line 278
    .line 279
    :cond_14
    return-object v1

    .line 280
    :cond_15
    if-eqz p1, :cond_1b

    .line 281
    .line 282
    iget-char v9, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 283
    .line 284
    if-ne v9, v13, :cond_1b

    .line 285
    .line 286
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 287
    .line 288
    .line 289
    new-instance v1, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;

    .line 290
    .line 291
    invoke-direct {v1, v6}, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;-><init>(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    :goto_a
    iget-char v4, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 295
    .line 296
    if-ne v4, v12, :cond_16

    .line 297
    .line 298
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 299
    .line 300
    .line 301
    goto :goto_a

    .line 302
    :cond_16
    if-eq v4, v3, :cond_17

    .line 303
    .line 304
    if-ne v4, v15, :cond_18

    .line 305
    .line 306
    :cond_17
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    :cond_18
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 311
    .line 312
    .line 313
    if-eqz v2, :cond_19

    .line 314
    .line 315
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 316
    .line 317
    .line 318
    :cond_19
    if-eqz p1, :cond_1a

    .line 319
    .line 320
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 321
    .line 322
    .line 323
    :cond_1a
    return-object v1

    .line 324
    :cond_1b
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readOp()Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 325
    .line 326
    .line 327
    move-result-object v9

    .line 328
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 329
    .line 330
    .line 331
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->BETWEEN:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 332
    .line 333
    if-eq v9, v4, :cond_1c

    .line 334
    .line 335
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_BETWEEN:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 336
    .line 337
    if-ne v9, v4, :cond_1d

    .line 338
    .line 339
    :cond_1c
    move-object v1, v6

    .line 340
    const/4 v7, 0x0

    .line 341
    goto/16 :goto_2d

    .line 342
    .line 343
    :cond_1d
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->IN:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 344
    .line 345
    const/16 v20, 0x0

    .line 346
    .line 347
    if-eq v9, v4, :cond_1e

    .line 348
    .line 349
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_IN:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 350
    .line 351
    if-ne v9, v4, :cond_1f

    .line 352
    .line 353
    :cond_1e
    move-object v1, v6

    .line 354
    goto/16 :goto_1e

    .line 355
    .line 356
    :cond_1f
    iget-char v4, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 357
    .line 358
    if-eq v4, v7, :cond_4c

    .line 359
    .line 360
    const/16 v7, 0x22

    .line 361
    .line 362
    if-ne v4, v7, :cond_20

    .line 363
    .line 364
    goto/16 :goto_16

    .line 365
    .line 366
    :cond_20
    invoke-static {v4}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isDigitFirst(C)Z

    .line 367
    .line 368
    .line 369
    move-result v4

    .line 370
    if-eqz v4, :cond_29

    .line 371
    .line 372
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readLongValue()J

    .line 373
    .line 374
    .line 375
    move-result-wide v7

    .line 376
    iget-char v4, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 377
    .line 378
    const-wide/16 v16, 0x0

    .line 379
    .line 380
    if-ne v4, v10, :cond_21

    .line 381
    .line 382
    invoke-virtual {v0, v7, v8}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readDoubleValue(J)D

    .line 383
    .line 384
    .line 385
    move-result-wide v10

    .line 386
    goto :goto_b

    .line 387
    :cond_21
    move-wide/from16 v10, v16

    .line 388
    .line 389
    :goto_b
    cmpl-double v4, v10, v16

    .line 390
    .line 391
    if-nez v4, :cond_22

    .line 392
    .line 393
    new-instance v4, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;

    .line 394
    .line 395
    invoke-direct {v4, v6, v7, v8, v9}, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;-><init>(Ljava/lang/String;JLcom/alibaba/fastjson/JSONPath$Operator;)V

    .line 396
    .line 397
    .line 398
    goto :goto_c

    .line 399
    :cond_22
    new-instance v4, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;

    .line 400
    .line 401
    invoke-direct {v4, v6, v10, v11, v9}, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;-><init>(Ljava/lang/String;DLcom/alibaba/fastjson/JSONPath$Operator;)V

    .line 402
    .line 403
    .line 404
    :goto_c
    iget-char v6, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 405
    .line 406
    if-ne v6, v12, :cond_23

    .line 407
    .line 408
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 409
    .line 410
    .line 411
    goto :goto_c

    .line 412
    :cond_23
    if-le v1, v5, :cond_24

    .line 413
    .line 414
    if-ne v6, v14, :cond_24

    .line 415
    .line 416
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 417
    .line 418
    .line 419
    :cond_24
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 420
    .line 421
    if-eq v1, v3, :cond_25

    .line 422
    .line 423
    if-ne v1, v15, :cond_26

    .line 424
    .line 425
    :cond_25
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 426
    .line 427
    .line 428
    move-result-object v4

    .line 429
    :cond_26
    if-eqz v2, :cond_27

    .line 430
    .line 431
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 432
    .line 433
    .line 434
    :cond_27
    if-eqz p1, :cond_28

    .line 435
    .line 436
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 437
    .line 438
    .line 439
    :cond_28
    return-object v4

    .line 440
    :cond_29
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 441
    .line 442
    const/16 v4, 0x24

    .line 443
    .line 444
    if-ne v1, v4, :cond_2d

    .line 445
    .line 446
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readSegement()Lcom/alibaba/fastjson/JSONPath$Segment;

    .line 447
    .line 448
    .line 449
    move-result-object v1

    .line 450
    new-instance v3, Lcom/alibaba/fastjson/JSONPath$RefOpSegement;

    .line 451
    .line 452
    invoke-direct {v3, v6, v1, v9}, Lcom/alibaba/fastjson/JSONPath$RefOpSegement;-><init>(Ljava/lang/String;Lcom/alibaba/fastjson/JSONPath$Segment;Lcom/alibaba/fastjson/JSONPath$Operator;)V

    .line 453
    .line 454
    .line 455
    iput-boolean v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->hasRefSegment:Z

    .line 456
    .line 457
    :goto_d
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 458
    .line 459
    if-ne v1, v12, :cond_2a

    .line 460
    .line 461
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 462
    .line 463
    .line 464
    goto :goto_d

    .line 465
    :cond_2a
    if-eqz v2, :cond_2b

    .line 466
    .line 467
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 468
    .line 469
    .line 470
    :cond_2b
    if-eqz p1, :cond_2c

    .line 471
    .line 472
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 473
    .line 474
    .line 475
    :cond_2c
    return-object v3

    .line 476
    :cond_2d
    if-ne v1, v11, :cond_33

    .line 477
    .line 478
    new-instance v4, Ljava/lang/StringBuilder;

    .line 479
    .line 480
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 481
    .line 482
    .line 483
    :goto_e
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 484
    .line 485
    .line 486
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 487
    .line 488
    if-ne v1, v11, :cond_31

    .line 489
    .line 490
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 491
    .line 492
    .line 493
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 494
    .line 495
    const/16 v3, 0x69

    .line 496
    .line 497
    if-ne v1, v3, :cond_2e

    .line 498
    .line 499
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 500
    .line 501
    .line 502
    const/4 v1, 0x2

    .line 503
    goto :goto_f

    .line 504
    :cond_2e
    const/4 v1, 0x0

    .line 505
    :goto_f
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object v3

    .line 509
    invoke-static {v3, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 510
    .line 511
    .line 512
    move-result-object v1

    .line 513
    new-instance v3, Lcom/alibaba/fastjson/JSONPath$RegMatchSegement;

    .line 514
    .line 515
    invoke-direct {v3, v6, v1, v9}, Lcom/alibaba/fastjson/JSONPath$RegMatchSegement;-><init>(Ljava/lang/String;Ljava/util/regex/Pattern;Lcom/alibaba/fastjson/JSONPath$Operator;)V

    .line 516
    .line 517
    .line 518
    if-eqz v2, :cond_2f

    .line 519
    .line 520
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 521
    .line 522
    .line 523
    :cond_2f
    if-eqz p1, :cond_30

    .line 524
    .line 525
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 526
    .line 527
    .line 528
    :cond_30
    return-object v3

    .line 529
    :cond_31
    if-ne v1, v8, :cond_32

    .line 530
    .line 531
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 532
    .line 533
    .line 534
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 535
    .line 536
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 537
    .line 538
    .line 539
    goto :goto_e

    .line 540
    :cond_32
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 541
    .line 542
    .line 543
    goto :goto_e

    .line 544
    :cond_33
    const/16 v4, 0x6e

    .line 545
    .line 546
    if-ne v1, v4, :cond_3b

    .line 547
    .line 548
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    .line 549
    .line 550
    .line 551
    move-result-object v1

    .line 552
    const-string v4, "null"

    .line 553
    .line 554
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 555
    .line 556
    .line 557
    move-result v1

    .line 558
    if-eqz v1, :cond_4b

    .line 559
    .line 560
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 561
    .line 562
    if-ne v9, v1, :cond_34

    .line 563
    .line 564
    new-instance v1, Lcom/alibaba/fastjson/JSONPath$NullSegement;

    .line 565
    .line 566
    invoke-direct {v1, v6}, Lcom/alibaba/fastjson/JSONPath$NullSegement;-><init>(Ljava/lang/String;)V

    .line 567
    .line 568
    .line 569
    goto :goto_10

    .line 570
    :cond_34
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 571
    .line 572
    if-ne v9, v1, :cond_35

    .line 573
    .line 574
    new-instance v1, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;

    .line 575
    .line 576
    invoke-direct {v1, v6}, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;-><init>(Ljava/lang/String;)V

    .line 577
    .line 578
    .line 579
    goto :goto_10

    .line 580
    :cond_35
    move-object/from16 v1, v20

    .line 581
    .line 582
    :goto_10
    if-eqz v1, :cond_38

    .line 583
    .line 584
    :goto_11
    iget-char v4, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 585
    .line 586
    if-ne v4, v12, :cond_36

    .line 587
    .line 588
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 589
    .line 590
    .line 591
    goto :goto_11

    .line 592
    :cond_36
    if-eq v4, v3, :cond_37

    .line 593
    .line 594
    if-ne v4, v15, :cond_38

    .line 595
    .line 596
    :cond_37
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 597
    .line 598
    .line 599
    move-result-object v1

    .line 600
    :cond_38
    if-eqz v2, :cond_39

    .line 601
    .line 602
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 603
    .line 604
    .line 605
    :cond_39
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 606
    .line 607
    .line 608
    if-eqz v1, :cond_3a

    .line 609
    .line 610
    return-object v1

    .line 611
    :cond_3a
    invoke-static {}, Ll/l710;->a()V

    .line 612
    .line 613
    .line 614
    return-object v20

    .line 615
    :cond_3b
    const/16 v4, 0x74

    .line 616
    .line 617
    if-ne v1, v4, :cond_43

    .line 618
    .line 619
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    .line 620
    .line 621
    .line 622
    move-result-object v1

    .line 623
    const-string v4, "true"

    .line 624
    .line 625
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 626
    .line 627
    .line 628
    move-result v1

    .line 629
    if-eqz v1, :cond_4b

    .line 630
    .line 631
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 632
    .line 633
    if-ne v9, v1, :cond_3c

    .line 634
    .line 635
    new-instance v1, Lcom/alibaba/fastjson/JSONPath$ValueSegment;

    .line 636
    .line 637
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 638
    .line 639
    invoke-direct {v1, v6, v4, v5}, Lcom/alibaba/fastjson/JSONPath$ValueSegment;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 640
    .line 641
    .line 642
    goto :goto_12

    .line 643
    :cond_3c
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 644
    .line 645
    if-ne v9, v1, :cond_3d

    .line 646
    .line 647
    new-instance v1, Lcom/alibaba/fastjson/JSONPath$ValueSegment;

    .line 648
    .line 649
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 650
    .line 651
    const/4 v5, 0x0

    .line 652
    invoke-direct {v1, v6, v4, v5}, Lcom/alibaba/fastjson/JSONPath$ValueSegment;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 653
    .line 654
    .line 655
    goto :goto_12

    .line 656
    :cond_3d
    move-object/from16 v1, v20

    .line 657
    .line 658
    :goto_12
    if-eqz v1, :cond_40

    .line 659
    .line 660
    :goto_13
    iget-char v4, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 661
    .line 662
    if-ne v4, v12, :cond_3e

    .line 663
    .line 664
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 665
    .line 666
    .line 667
    goto :goto_13

    .line 668
    :cond_3e
    if-eq v4, v3, :cond_3f

    .line 669
    .line 670
    if-ne v4, v15, :cond_40

    .line 671
    .line 672
    :cond_3f
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 673
    .line 674
    .line 675
    move-result-object v1

    .line 676
    :cond_40
    if-eqz v2, :cond_41

    .line 677
    .line 678
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 679
    .line 680
    .line 681
    :cond_41
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 682
    .line 683
    .line 684
    if-eqz v1, :cond_42

    .line 685
    .line 686
    return-object v1

    .line 687
    :cond_42
    invoke-static {}, Ll/l710;->a()V

    .line 688
    .line 689
    .line 690
    return-object v20

    .line 691
    :cond_43
    const/16 v4, 0x66

    .line 692
    .line 693
    if-ne v1, v4, :cond_4b

    .line 694
    .line 695
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    .line 696
    .line 697
    .line 698
    move-result-object v1

    .line 699
    const-string v4, "false"

    .line 700
    .line 701
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 702
    .line 703
    .line 704
    move-result v1

    .line 705
    if-eqz v1, :cond_4b

    .line 706
    .line 707
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 708
    .line 709
    if-ne v9, v1, :cond_44

    .line 710
    .line 711
    new-instance v1, Lcom/alibaba/fastjson/JSONPath$ValueSegment;

    .line 712
    .line 713
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 714
    .line 715
    invoke-direct {v1, v6, v4, v5}, Lcom/alibaba/fastjson/JSONPath$ValueSegment;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 716
    .line 717
    .line 718
    goto :goto_14

    .line 719
    :cond_44
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 720
    .line 721
    if-ne v9, v1, :cond_45

    .line 722
    .line 723
    new-instance v1, Lcom/alibaba/fastjson/JSONPath$ValueSegment;

    .line 724
    .line 725
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 726
    .line 727
    const/4 v5, 0x0

    .line 728
    invoke-direct {v1, v6, v4, v5}, Lcom/alibaba/fastjson/JSONPath$ValueSegment;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 729
    .line 730
    .line 731
    goto :goto_14

    .line 732
    :cond_45
    move-object/from16 v1, v20

    .line 733
    .line 734
    :goto_14
    if-eqz v1, :cond_48

    .line 735
    .line 736
    :goto_15
    iget-char v4, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 737
    .line 738
    if-ne v4, v12, :cond_46

    .line 739
    .line 740
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 741
    .line 742
    .line 743
    goto :goto_15

    .line 744
    :cond_46
    if-eq v4, v3, :cond_47

    .line 745
    .line 746
    if-ne v4, v15, :cond_48

    .line 747
    .line 748
    :cond_47
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 749
    .line 750
    .line 751
    move-result-object v1

    .line 752
    :cond_48
    if-eqz v2, :cond_49

    .line 753
    .line 754
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 755
    .line 756
    .line 757
    :cond_49
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 758
    .line 759
    .line 760
    if-eqz v1, :cond_4a

    .line 761
    .line 762
    return-object v1

    .line 763
    :cond_4a
    invoke-static {}, Ll/l710;->a()V

    .line 764
    .line 765
    .line 766
    return-object v20

    .line 767
    :cond_4b
    invoke-static {}, Ll/l710;->a()V

    .line 768
    .line 769
    .line 770
    return-object v20

    .line 771
    :cond_4c
    :goto_16
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readString()Ljava/lang/String;

    .line 772
    .line 773
    .line 774
    move-result-object v1

    .line 775
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->RLIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 776
    .line 777
    if-ne v9, v4, :cond_4d

    .line 778
    .line 779
    new-instance v4, Lcom/alibaba/fastjson/JSONPath$RlikeSegement;

    .line 780
    .line 781
    const/4 v5, 0x0

    .line 782
    invoke-direct {v4, v6, v1, v5}, Lcom/alibaba/fastjson/JSONPath$RlikeSegement;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 783
    .line 784
    .line 785
    goto/16 :goto_1d

    .line 786
    .line 787
    :cond_4d
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_RLIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 788
    .line 789
    if-ne v9, v4, :cond_4e

    .line 790
    .line 791
    new-instance v4, Lcom/alibaba/fastjson/JSONPath$RlikeSegement;

    .line 792
    .line 793
    invoke-direct {v4, v6, v1, v5}, Lcom/alibaba/fastjson/JSONPath$RlikeSegement;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 794
    .line 795
    .line 796
    goto/16 :goto_1d

    .line 797
    .line 798
    :cond_4e
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->LIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 799
    .line 800
    if-eq v9, v4, :cond_50

    .line 801
    .line 802
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_LIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 803
    .line 804
    if-ne v9, v4, :cond_4f

    .line 805
    .line 806
    goto :goto_17

    .line 807
    :cond_4f
    new-instance v4, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;

    .line 808
    .line 809
    invoke-direct {v4, v6, v1, v9}, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/alibaba/fastjson/JSONPath$Operator;)V

    .line 810
    .line 811
    .line 812
    goto/16 :goto_1d

    .line 813
    .line 814
    :cond_50
    :goto_17
    const-string v4, "%%"

    .line 815
    .line 816
    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 817
    .line 818
    .line 819
    move-result v7

    .line 820
    const-string v8, "%"

    .line 821
    .line 822
    const/4 v10, -0x1

    .line 823
    if-eq v7, v10, :cond_51

    .line 824
    .line 825
    invoke-virtual {v1, v4, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 826
    .line 827
    .line 828
    move-result-object v1

    .line 829
    goto :goto_17

    .line 830
    :cond_51
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_LIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 831
    .line 832
    if-ne v9, v4, :cond_52

    .line 833
    .line 834
    move/from16 v21, v5

    .line 835
    .line 836
    goto :goto_18

    .line 837
    :cond_52
    const/16 v21, 0x0

    .line 838
    .line 839
    :goto_18
    const/16 v4, 0x25

    .line 840
    .line 841
    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(I)I

    .line 842
    .line 843
    .line 844
    move-result v7

    .line 845
    if-ne v7, v10, :cond_54

    .line 846
    .line 847
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->LIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 848
    .line 849
    if-ne v9, v4, :cond_53

    .line 850
    .line 851
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 852
    .line 853
    goto :goto_19

    .line 854
    :cond_53
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 855
    .line 856
    :goto_19
    new-instance v5, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;

    .line 857
    .line 858
    invoke-direct {v5, v6, v1, v4}, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/alibaba/fastjson/JSONPath$Operator;)V

    .line 859
    .line 860
    .line 861
    move-object v4, v5

    .line 862
    goto/16 :goto_1d

    .line 863
    .line 864
    :cond_54
    invoke-virtual {v1, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 865
    .line 866
    .line 867
    move-result-object v8

    .line 868
    if-nez v7, :cond_57

    .line 869
    .line 870
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 871
    .line 872
    .line 873
    move-result v7

    .line 874
    sub-int/2addr v7, v5

    .line 875
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    .line 876
    .line 877
    .line 878
    move-result v1

    .line 879
    if-ne v1, v4, :cond_55

    .line 880
    .line 881
    array-length v1, v8

    .line 882
    sub-int/2addr v1, v5

    .line 883
    new-array v4, v1, [Ljava/lang/String;

    .line 884
    .line 885
    const/4 v7, 0x0

    .line 886
    invoke-static {v8, v5, v4, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 887
    .line 888
    .line 889
    move-object/from16 v18, v20

    .line 890
    .line 891
    move-object/from16 v19, v18

    .line 892
    .line 893
    move-object/from16 v20, v4

    .line 894
    .line 895
    goto :goto_1c

    .line 896
    :cond_55
    const/4 v7, 0x0

    .line 897
    array-length v1, v8

    .line 898
    sub-int/2addr v1, v5

    .line 899
    aget-object v1, v8, v1

    .line 900
    .line 901
    array-length v4, v8

    .line 902
    const/4 v9, 0x2

    .line 903
    if-le v4, v9, :cond_56

    .line 904
    .line 905
    array-length v4, v8

    .line 906
    sub-int/2addr v4, v9

    .line 907
    new-array v9, v4, [Ljava/lang/String;

    .line 908
    .line 909
    invoke-static {v8, v5, v9, v7, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 910
    .line 911
    .line 912
    :goto_1a
    move-object/from16 v19, v1

    .line 913
    .line 914
    move-object/from16 v18, v20

    .line 915
    .line 916
    move-object/from16 v20, v9

    .line 917
    .line 918
    goto :goto_1c

    .line 919
    :cond_56
    move-object/from16 v19, v1

    .line 920
    .line 921
    move-object/from16 v18, v20

    .line 922
    .line 923
    goto :goto_1c

    .line 924
    :cond_57
    const/4 v7, 0x0

    .line 925
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 926
    .line 927
    .line 928
    move-result v9

    .line 929
    sub-int/2addr v9, v5

    .line 930
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    .line 931
    .line 932
    .line 933
    move-result v1

    .line 934
    if-ne v1, v4, :cond_59

    .line 935
    .line 936
    array-length v1, v8

    .line 937
    if-ne v1, v5, :cond_58

    .line 938
    .line 939
    aget-object v1, v8, v7

    .line 940
    .line 941
    :goto_1b
    move-object/from16 v18, v1

    .line 942
    .line 943
    move-object/from16 v19, v20

    .line 944
    .line 945
    goto :goto_1c

    .line 946
    :cond_58
    move-object/from16 v18, v20

    .line 947
    .line 948
    move-object/from16 v19, v18

    .line 949
    .line 950
    move-object/from16 v20, v8

    .line 951
    .line 952
    goto :goto_1c

    .line 953
    :cond_59
    array-length v1, v8

    .line 954
    if-ne v1, v5, :cond_5a

    .line 955
    .line 956
    aget-object v1, v8, v7

    .line 957
    .line 958
    goto :goto_1b

    .line 959
    :cond_5a
    array-length v1, v8

    .line 960
    const/4 v9, 0x2

    .line 961
    if-ne v1, v9, :cond_5b

    .line 962
    .line 963
    aget-object v1, v8, v7

    .line 964
    .line 965
    aget-object v4, v8, v5

    .line 966
    .line 967
    move-object/from16 v18, v1

    .line 968
    .line 969
    move-object/from16 v19, v4

    .line 970
    .line 971
    goto :goto_1c

    .line 972
    :cond_5b
    aget-object v20, v8, v7

    .line 973
    .line 974
    array-length v1, v8

    .line 975
    sub-int/2addr v1, v5

    .line 976
    aget-object v1, v8, v1

    .line 977
    .line 978
    array-length v4, v8

    .line 979
    sub-int/2addr v4, v9

    .line 980
    new-array v9, v4, [Ljava/lang/String;

    .line 981
    .line 982
    invoke-static {v8, v5, v9, v7, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 983
    .line 984
    .line 985
    goto :goto_1a

    .line 986
    :goto_1c
    new-instance v16, Lcom/alibaba/fastjson/JSONPath$MatchSegement;

    .line 987
    .line 988
    move-object/from16 v17, v6

    .line 989
    .line 990
    invoke-direct/range {v16 .. v21}, Lcom/alibaba/fastjson/JSONPath$MatchSegement;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 991
    .line 992
    .line 993
    move-object/from16 v4, v16

    .line 994
    .line 995
    :goto_1d
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 996
    .line 997
    if-ne v1, v12, :cond_5c

    .line 998
    .line 999
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 1000
    .line 1001
    .line 1002
    goto :goto_1d

    .line 1003
    :cond_5c
    if-eq v1, v3, :cond_5d

    .line 1004
    .line 1005
    if-ne v1, v15, :cond_5e

    .line 1006
    .line 1007
    :cond_5d
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 1008
    .line 1009
    .line 1010
    move-result-object v4

    .line 1011
    :cond_5e
    if-eqz v2, :cond_5f

    .line 1012
    .line 1013
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1014
    .line 1015
    .line 1016
    :cond_5f
    if-eqz p1, :cond_60

    .line 1017
    .line 1018
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1019
    .line 1020
    .line 1021
    :cond_60
    return-object v4

    .line 1022
    :goto_1e
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_IN:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 1023
    .line 1024
    if-ne v9, v4, :cond_61

    .line 1025
    .line 1026
    move v4, v5

    .line 1027
    :goto_1f
    const/16 v6, 0x28

    .line 1028
    .line 1029
    goto :goto_20

    .line 1030
    :cond_61
    const/4 v4, 0x0

    .line 1031
    goto :goto_1f

    .line 1032
    :goto_20
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1033
    .line 1034
    .line 1035
    new-instance v6, Lcom/alibaba/fastjson/JSONArray;

    .line 1036
    .line 1037
    invoke-direct {v6}, Lcom/alibaba/fastjson/JSONArray;-><init>()V

    .line 1038
    .line 1039
    .line 1040
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readValue()Ljava/lang/Object;

    .line 1041
    .line 1042
    .line 1043
    move-result-object v7

    .line 1044
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1045
    .line 1046
    .line 1047
    :goto_21
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 1048
    .line 1049
    .line 1050
    iget-char v7, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 1051
    .line 1052
    const/16 v8, 0x2c

    .line 1053
    .line 1054
    if-eq v7, v8, :cond_91

    .line 1055
    .line 1056
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 1057
    .line 1058
    .line 1059
    move-result-object v7

    .line 1060
    move v8, v5

    .line 1061
    move v9, v8

    .line 1062
    move v10, v9

    .line 1063
    :cond_62
    :goto_22
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 1064
    .line 1065
    .line 1066
    move-result v11

    .line 1067
    if-eqz v11, :cond_66

    .line 1068
    .line 1069
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1070
    .line 1071
    .line 1072
    move-result-object v11

    .line 1073
    if-nez v11, :cond_63

    .line 1074
    .line 1075
    if-eqz v8, :cond_62

    .line 1076
    .line 1077
    const/4 v8, 0x0

    .line 1078
    goto :goto_22

    .line 1079
    :cond_63
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1080
    .line 1081
    .line 1082
    move-result-object v11

    .line 1083
    if-eqz v8, :cond_64

    .line 1084
    .line 1085
    const-class v13, Ljava/lang/Byte;

    .line 1086
    .line 1087
    if-eq v11, v13, :cond_64

    .line 1088
    .line 1089
    const-class v13, Ljava/lang/Short;

    .line 1090
    .line 1091
    if-eq v11, v13, :cond_64

    .line 1092
    .line 1093
    const-class v13, Ljava/lang/Integer;

    .line 1094
    .line 1095
    if-eq v11, v13, :cond_64

    .line 1096
    .line 1097
    const-class v13, Ljava/lang/Long;

    .line 1098
    .line 1099
    if-eq v11, v13, :cond_64

    .line 1100
    .line 1101
    const/4 v8, 0x0

    .line 1102
    const/4 v10, 0x0

    .line 1103
    :cond_64
    if-eqz v9, :cond_65

    .line 1104
    .line 1105
    const-class v13, Ljava/lang/String;

    .line 1106
    .line 1107
    if-eq v11, v13, :cond_65

    .line 1108
    .line 1109
    const/4 v9, 0x0

    .line 1110
    :cond_65
    const/16 v13, 0x5d

    .line 1111
    .line 1112
    goto :goto_22

    .line 1113
    :cond_66
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 1114
    .line 1115
    .line 1116
    move-result v7

    .line 1117
    if-ne v7, v5, :cond_6d

    .line 1118
    .line 1119
    const/4 v7, 0x0

    .line 1120
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1121
    .line 1122
    .line 1123
    move-result-object v11

    .line 1124
    if-nez v11, :cond_6d

    .line 1125
    .line 1126
    if-eqz v4, :cond_67

    .line 1127
    .line 1128
    new-instance v4, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;

    .line 1129
    .line 1130
    invoke-direct {v4, v1}, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;-><init>(Ljava/lang/String;)V

    .line 1131
    .line 1132
    .line 1133
    goto :goto_23

    .line 1134
    :cond_67
    new-instance v4, Lcom/alibaba/fastjson/JSONPath$NullSegement;

    .line 1135
    .line 1136
    invoke-direct {v4, v1}, Lcom/alibaba/fastjson/JSONPath$NullSegement;-><init>(Ljava/lang/String;)V

    .line 1137
    .line 1138
    .line 1139
    :goto_23
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 1140
    .line 1141
    if-ne v1, v12, :cond_68

    .line 1142
    .line 1143
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 1144
    .line 1145
    .line 1146
    goto :goto_23

    .line 1147
    :cond_68
    if-eq v1, v3, :cond_69

    .line 1148
    .line 1149
    if-ne v1, v15, :cond_6a

    .line 1150
    .line 1151
    :cond_69
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 1152
    .line 1153
    .line 1154
    move-result-object v4

    .line 1155
    :cond_6a
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1156
    .line 1157
    .line 1158
    if-eqz v2, :cond_6b

    .line 1159
    .line 1160
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1161
    .line 1162
    .line 1163
    :cond_6b
    if-eqz p1, :cond_6c

    .line 1164
    .line 1165
    const/16 v1, 0x5d

    .line 1166
    .line 1167
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1168
    .line 1169
    .line 1170
    :cond_6c
    return-object v4

    .line 1171
    :cond_6d
    if-eqz v8, :cond_7b

    .line 1172
    .line 1173
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 1174
    .line 1175
    .line 1176
    move-result v7

    .line 1177
    if-ne v7, v5, :cond_74

    .line 1178
    .line 1179
    const/4 v5, 0x0

    .line 1180
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1181
    .line 1182
    .line 1183
    move-result-object v5

    .line 1184
    check-cast v5, Ljava/lang/Number;

    .line 1185
    .line 1186
    invoke-static {v5}, Lcom/alibaba/fastjson/util/TypeUtils;->longExtractValue(Ljava/lang/Number;)J

    .line 1187
    .line 1188
    .line 1189
    move-result-wide v5

    .line 1190
    if-eqz v4, :cond_6e

    .line 1191
    .line 1192
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 1193
    .line 1194
    goto :goto_24

    .line 1195
    :cond_6e
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 1196
    .line 1197
    :goto_24
    new-instance v7, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;

    .line 1198
    .line 1199
    invoke-direct {v7, v1, v5, v6, v4}, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;-><init>(Ljava/lang/String;JLcom/alibaba/fastjson/JSONPath$Operator;)V

    .line 1200
    .line 1201
    .line 1202
    :goto_25
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 1203
    .line 1204
    if-ne v1, v12, :cond_6f

    .line 1205
    .line 1206
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 1207
    .line 1208
    .line 1209
    goto :goto_25

    .line 1210
    :cond_6f
    if-eq v1, v3, :cond_70

    .line 1211
    .line 1212
    if-ne v1, v15, :cond_71

    .line 1213
    .line 1214
    :cond_70
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 1215
    .line 1216
    .line 1217
    move-result-object v7

    .line 1218
    :cond_71
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1219
    .line 1220
    .line 1221
    if-eqz v2, :cond_72

    .line 1222
    .line 1223
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1224
    .line 1225
    .line 1226
    :cond_72
    if-eqz p1, :cond_73

    .line 1227
    .line 1228
    const/16 v1, 0x5d

    .line 1229
    .line 1230
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1231
    .line 1232
    .line 1233
    :cond_73
    return-object v7

    .line 1234
    :cond_74
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 1235
    .line 1236
    .line 1237
    move-result v5

    .line 1238
    new-array v7, v5, [J

    .line 1239
    .line 1240
    const/4 v8, 0x0

    .line 1241
    :goto_26
    if-ge v8, v5, :cond_75

    .line 1242
    .line 1243
    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1244
    .line 1245
    .line 1246
    move-result-object v9

    .line 1247
    check-cast v9, Ljava/lang/Number;

    .line 1248
    .line 1249
    invoke-static {v9}, Lcom/alibaba/fastjson/util/TypeUtils;->longExtractValue(Ljava/lang/Number;)J

    .line 1250
    .line 1251
    .line 1252
    move-result-wide v9

    .line 1253
    aput-wide v9, v7, v8

    .line 1254
    .line 1255
    add-int/lit8 v8, v8, 0x1

    .line 1256
    .line 1257
    goto :goto_26

    .line 1258
    :cond_75
    new-instance v5, Lcom/alibaba/fastjson/JSONPath$IntInSegement;

    .line 1259
    .line 1260
    invoke-direct {v5, v1, v7, v4}, Lcom/alibaba/fastjson/JSONPath$IntInSegement;-><init>(Ljava/lang/String;[JZ)V

    .line 1261
    .line 1262
    .line 1263
    :goto_27
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 1264
    .line 1265
    if-ne v1, v12, :cond_76

    .line 1266
    .line 1267
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 1268
    .line 1269
    .line 1270
    goto :goto_27

    .line 1271
    :cond_76
    if-eq v1, v3, :cond_77

    .line 1272
    .line 1273
    if-ne v1, v15, :cond_78

    .line 1274
    .line 1275
    :cond_77
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 1276
    .line 1277
    .line 1278
    move-result-object v5

    .line 1279
    :cond_78
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1280
    .line 1281
    .line 1282
    if-eqz v2, :cond_79

    .line 1283
    .line 1284
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1285
    .line 1286
    .line 1287
    :cond_79
    if-eqz p1, :cond_7a

    .line 1288
    .line 1289
    const/16 v1, 0x5d

    .line 1290
    .line 1291
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1292
    .line 1293
    .line 1294
    :cond_7a
    return-object v5

    .line 1295
    :cond_7b
    if-eqz v9, :cond_88

    .line 1296
    .line 1297
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 1298
    .line 1299
    .line 1300
    move-result v7

    .line 1301
    if-ne v7, v5, :cond_82

    .line 1302
    .line 1303
    const/4 v7, 0x0

    .line 1304
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1305
    .line 1306
    .line 1307
    move-result-object v5

    .line 1308
    check-cast v5, Ljava/lang/String;

    .line 1309
    .line 1310
    if-eqz v4, :cond_7c

    .line 1311
    .line 1312
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 1313
    .line 1314
    goto :goto_28

    .line 1315
    :cond_7c
    sget-object v4, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 1316
    .line 1317
    :goto_28
    new-instance v6, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;

    .line 1318
    .line 1319
    invoke-direct {v6, v1, v5, v4}, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/alibaba/fastjson/JSONPath$Operator;)V

    .line 1320
    .line 1321
    .line 1322
    :goto_29
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 1323
    .line 1324
    if-ne v1, v12, :cond_7d

    .line 1325
    .line 1326
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 1327
    .line 1328
    .line 1329
    goto :goto_29

    .line 1330
    :cond_7d
    if-eq v1, v3, :cond_7e

    .line 1331
    .line 1332
    if-ne v1, v15, :cond_7f

    .line 1333
    .line 1334
    :cond_7e
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 1335
    .line 1336
    .line 1337
    move-result-object v6

    .line 1338
    :cond_7f
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1339
    .line 1340
    .line 1341
    if-eqz v2, :cond_80

    .line 1342
    .line 1343
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1344
    .line 1345
    .line 1346
    :cond_80
    if-eqz p1, :cond_81

    .line 1347
    .line 1348
    const/16 v1, 0x5d

    .line 1349
    .line 1350
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1351
    .line 1352
    .line 1353
    :cond_81
    return-object v6

    .line 1354
    :cond_82
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 1355
    .line 1356
    .line 1357
    move-result v5

    .line 1358
    new-array v5, v5, [Ljava/lang/String;

    .line 1359
    .line 1360
    invoke-interface {v6, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 1361
    .line 1362
    .line 1363
    new-instance v6, Lcom/alibaba/fastjson/JSONPath$StringInSegement;

    .line 1364
    .line 1365
    invoke-direct {v6, v1, v5, v4}, Lcom/alibaba/fastjson/JSONPath$StringInSegement;-><init>(Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1366
    .line 1367
    .line 1368
    :goto_2a
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 1369
    .line 1370
    if-ne v1, v12, :cond_83

    .line 1371
    .line 1372
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 1373
    .line 1374
    .line 1375
    goto :goto_2a

    .line 1376
    :cond_83
    if-eq v1, v3, :cond_84

    .line 1377
    .line 1378
    if-ne v1, v15, :cond_85

    .line 1379
    .line 1380
    :cond_84
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 1381
    .line 1382
    .line 1383
    move-result-object v6

    .line 1384
    :cond_85
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1385
    .line 1386
    .line 1387
    if-eqz v2, :cond_86

    .line 1388
    .line 1389
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1390
    .line 1391
    .line 1392
    :cond_86
    if-eqz p1, :cond_87

    .line 1393
    .line 1394
    const/16 v1, 0x5d

    .line 1395
    .line 1396
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1397
    .line 1398
    .line 1399
    :cond_87
    return-object v6

    .line 1400
    :cond_88
    const/4 v7, 0x0

    .line 1401
    if-eqz v10, :cond_90

    .line 1402
    .line 1403
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 1404
    .line 1405
    .line 1406
    move-result v5

    .line 1407
    new-array v8, v5, [Ljava/lang/Long;

    .line 1408
    .line 1409
    :goto_2b
    if-ge v7, v5, :cond_8a

    .line 1410
    .line 1411
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1412
    .line 1413
    .line 1414
    move-result-object v9

    .line 1415
    check-cast v9, Ljava/lang/Number;

    .line 1416
    .line 1417
    if-eqz v9, :cond_89

    .line 1418
    .line 1419
    invoke-static {v9}, Lcom/alibaba/fastjson/util/TypeUtils;->longExtractValue(Ljava/lang/Number;)J

    .line 1420
    .line 1421
    .line 1422
    move-result-wide v9

    .line 1423
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 1424
    .line 1425
    .line 1426
    move-result-object v9

    .line 1427
    aput-object v9, v8, v7

    .line 1428
    .line 1429
    :cond_89
    add-int/lit8 v7, v7, 0x1

    .line 1430
    .line 1431
    goto :goto_2b

    .line 1432
    :cond_8a
    new-instance v5, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;

    .line 1433
    .line 1434
    invoke-direct {v5, v1, v8, v4}, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;-><init>(Ljava/lang/String;[Ljava/lang/Long;Z)V

    .line 1435
    .line 1436
    .line 1437
    :goto_2c
    iget-char v1, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 1438
    .line 1439
    if-ne v1, v12, :cond_8b

    .line 1440
    .line 1441
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 1442
    .line 1443
    .line 1444
    goto :goto_2c

    .line 1445
    :cond_8b
    if-eq v1, v3, :cond_8c

    .line 1446
    .line 1447
    if-ne v1, v15, :cond_8d

    .line 1448
    .line 1449
    :cond_8c
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->filterRest(Lcom/alibaba/fastjson/JSONPath$Filter;)Lcom/alibaba/fastjson/JSONPath$Filter;

    .line 1450
    .line 1451
    .line 1452
    move-result-object v5

    .line 1453
    :cond_8d
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1454
    .line 1455
    .line 1456
    if-eqz v2, :cond_8e

    .line 1457
    .line 1458
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1459
    .line 1460
    .line 1461
    :cond_8e
    if-eqz p1, :cond_8f

    .line 1462
    .line 1463
    const/16 v8, 0x5d

    .line 1464
    .line 1465
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 1466
    .line 1467
    .line 1468
    :cond_8f
    return-object v5

    .line 1469
    :cond_90
    invoke-static {}, Ll/l710;->a()V

    .line 1470
    .line 1471
    .line 1472
    return-object v20

    .line 1473
    :cond_91
    move v8, v13

    .line 1474
    const/4 v7, 0x0

    .line 1475
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 1476
    .line 1477
    .line 1478
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readValue()Ljava/lang/Object;

    .line 1479
    .line 1480
    .line 1481
    move-result-object v9

    .line 1482
    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1483
    .line 1484
    .line 1485
    goto/16 :goto_21

    .line 1486
    .line 1487
    :goto_2d
    sget-object v2, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_BETWEEN:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 1488
    .line 1489
    if-ne v9, v2, :cond_92

    .line 1490
    .line 1491
    move/from16 v22, v5

    .line 1492
    .line 1493
    goto :goto_2e

    .line 1494
    :cond_92
    move/from16 v22, v7

    .line 1495
    .line 1496
    :goto_2e
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readValue()Ljava/lang/Object;

    .line 1497
    .line 1498
    .line 1499
    move-result-object v2

    .line 1500
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    .line 1501
    .line 1502
    .line 1503
    move-result-object v3

    .line 1504
    const-string v4, "and"

    .line 1505
    .line 1506
    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 1507
    .line 1508
    .line 1509
    move-result v3

    .line 1510
    if-eqz v3, :cond_95

    .line 1511
    .line 1512
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readValue()Ljava/lang/Object;

    .line 1513
    .line 1514
    .line 1515
    move-result-object v3

    .line 1516
    if-eqz v2, :cond_94

    .line 1517
    .line 1518
    if-eqz v3, :cond_94

    .line 1519
    .line 1520
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1521
    .line 1522
    .line 1523
    move-result-object v4

    .line 1524
    invoke-static {v4}, Lcom/alibaba/fastjson/JSONPath;->isInt(Ljava/lang/Class;)Z

    .line 1525
    .line 1526
    .line 1527
    move-result v4

    .line 1528
    if-eqz v4, :cond_93

    .line 1529
    .line 1530
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1531
    .line 1532
    .line 1533
    move-result-object v4

    .line 1534
    invoke-static {v4}, Lcom/alibaba/fastjson/JSONPath;->isInt(Ljava/lang/Class;)Z

    .line 1535
    .line 1536
    .line 1537
    move-result v4

    .line 1538
    if-eqz v4, :cond_93

    .line 1539
    .line 1540
    new-instance v16, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;

    .line 1541
    .line 1542
    check-cast v2, Ljava/lang/Number;

    .line 1543
    .line 1544
    invoke-static {v2}, Lcom/alibaba/fastjson/util/TypeUtils;->longExtractValue(Ljava/lang/Number;)J

    .line 1545
    .line 1546
    .line 1547
    move-result-wide v18

    .line 1548
    check-cast v3, Ljava/lang/Number;

    .line 1549
    .line 1550
    invoke-static {v3}, Lcom/alibaba/fastjson/util/TypeUtils;->longExtractValue(Ljava/lang/Number;)J

    .line 1551
    .line 1552
    .line 1553
    move-result-wide v20

    .line 1554
    move-object/from16 v17, v1

    .line 1555
    .line 1556
    invoke-direct/range {v16 .. v22}, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;-><init>(Ljava/lang/String;JJZ)V

    .line 1557
    .line 1558
    .line 1559
    return-object v16

    .line 1560
    :cond_93
    new-instance v1, Lcom/alibaba/fastjson/JSONPathException;

    .line 1561
    .line 1562
    iget-object v0, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 1563
    .line 1564
    invoke-direct {v1, v0}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    .line 1565
    .line 1566
    .line 1567
    throw v1

    .line 1568
    :cond_94
    new-instance v1, Lcom/alibaba/fastjson/JSONPathException;

    .line 1569
    .line 1570
    iget-object v0, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 1571
    .line 1572
    invoke-direct {v1, v0}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    .line 1573
    .line 1574
    .line 1575
    throw v1

    .line 1576
    :cond_95
    new-instance v1, Lcom/alibaba/fastjson/JSONPathException;

    .line 1577
    .line 1578
    iget-object v0, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 1579
    .line 1580
    invoke-direct {v1, v0}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    .line 1581
    .line 1582
    .line 1583
    throw v1
.end method

.method public readDoubleValue(J)D
    .locals 3

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 6
    .line 7
    .line 8
    :goto_0
    iget-char v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 9
    .line 10
    const/16 v2, 0x30

    .line 11
    .line 12
    if-lt v1, v2, :cond_0

    .line 13
    .line 14
    const/16 v2, 0x39

    .line 15
    .line 16
    if-gt v1, v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 23
    .line 24
    add-int/lit8 v1, v1, -0x1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    long-to-double p0, p1

    .line 37
    add-double/2addr v0, p0

    .line 38
    return-wide v0
.end method

.method public readLongValue()J
    .locals 3

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    iget-char v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 6
    .line 7
    const/16 v2, 0x2b

    .line 8
    .line 9
    if-eq v1, v2, :cond_0

    .line 10
    .line 11
    const/16 v2, 0x2d

    .line 12
    .line 13
    if-ne v1, v2, :cond_1

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    iget-char v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 19
    .line 20
    const/16 v2, 0x30

    .line 21
    .line 22
    if-lt v1, v2, :cond_2

    .line 23
    .line 24
    const/16 v2, 0x39

    .line 25
    .line 26
    if-gt v1, v2, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    iget v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 33
    .line 34
    add-int/lit8 v1, v1, -0x1

    .line 35
    .line 36
    iget-object p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    return-wide v0
.end method

.method public readName()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 2
    .line 3
    .line 4
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 5
    .line 6
    const/16 v1, 0x5c

    .line 7
    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string v0, "illeal jsonpath syntax. "

    .line 18
    .line 19
    iget-object p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/skq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    :goto_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-nez v2, :cond_5

    .line 36
    .line 37
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 38
    .line 39
    if-ne v2, v1, :cond_3

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 42
    .line 43
    .line 44
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_2
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    invoke-static {v2}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-nez v2, :cond_4

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_4
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_5
    :goto_2
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_6

    .line 85
    .line 86
    iget-char v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 87
    .line 88
    invoke-static {v1}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    iget-char p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 95
    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0
.end method

.method public readOp()Lcom/alibaba/fastjson/JSONPath$Operator;
    .locals 7

    .line 1
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0x3d

    .line 5
    .line 6
    if-ne v0, v2, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 9
    .line 10
    .line 11
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 12
    .line 13
    const/16 v3, 0x7e

    .line 14
    .line 15
    if-ne v0, v3, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/alibaba/fastjson/JSONPath$Operator;->REG_MATCH:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    if-ne v0, v2, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    sget-object v0, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const/16 v3, 0x21

    .line 35
    .line 36
    if-ne v0, v3, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 42
    .line 43
    .line 44
    sget-object v0, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    const/16 v3, 0x3c

    .line 48
    .line 49
    if-ne v0, v3, :cond_5

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 52
    .line 53
    .line 54
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 55
    .line 56
    if-ne v0, v2, :cond_4

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 59
    .line 60
    .line 61
    sget-object v0, Lcom/alibaba/fastjson/JSONPath$Operator;->LE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_4
    sget-object v0, Lcom/alibaba/fastjson/JSONPath$Operator;->LT:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_5
    const/16 v3, 0x3e

    .line 68
    .line 69
    if-ne v0, v3, :cond_7

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 72
    .line 73
    .line 74
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 75
    .line 76
    if-ne v0, v2, :cond_6

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 79
    .line 80
    .line 81
    sget-object v0, Lcom/alibaba/fastjson/JSONPath$Operator;->GE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_6
    sget-object v0, Lcom/alibaba/fastjson/JSONPath$Operator;->GT:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_7
    move-object v0, v1

    .line 88
    :goto_0
    if-nez v0, :cond_12

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-string v2, "not"

    .line 95
    .line 96
    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    const-string v3, "between"

    .line 101
    .line 102
    const-string v4, "in"

    .line 103
    .line 104
    const-string v5, "rlike"

    .line 105
    .line 106
    const-string v6, "like"

    .line 107
    .line 108
    if-eqz v2, :cond_c

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {v6, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_8

    .line 122
    .line 123
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_LIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 124
    .line 125
    return-object p0

    .line 126
    :cond_8
    invoke-virtual {v5, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-eqz v0, :cond_9

    .line 131
    .line 132
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_RLIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 133
    .line 134
    return-object p0

    .line 135
    :cond_9
    invoke-virtual {v4, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_a

    .line 140
    .line 141
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_IN:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 142
    .line 143
    return-object p0

    .line 144
    :cond_a
    invoke-virtual {v3, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    if-eqz p0, :cond_b

    .line 149
    .line 150
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_BETWEEN:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 151
    .line 152
    return-object p0

    .line 153
    :cond_b
    invoke-static {}, Ll/l710;->a()V

    .line 154
    .line 155
    .line 156
    return-object v1

    .line 157
    :cond_c
    const-string p0, "nin"

    .line 158
    .line 159
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    if-eqz p0, :cond_d

    .line 164
    .line 165
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_IN:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 166
    .line 167
    return-object p0

    .line 168
    :cond_d
    invoke-virtual {v6, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    if-eqz p0, :cond_e

    .line 173
    .line 174
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$Operator;->LIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 175
    .line 176
    return-object p0

    .line 177
    :cond_e
    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    if-eqz p0, :cond_f

    .line 182
    .line 183
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$Operator;->RLIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 184
    .line 185
    return-object p0

    .line 186
    :cond_f
    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    if-eqz p0, :cond_10

    .line 191
    .line 192
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$Operator;->IN:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 193
    .line 194
    return-object p0

    .line 195
    :cond_10
    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    if-eqz p0, :cond_11

    .line 200
    .line 201
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$Operator;->BETWEEN:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 202
    .line 203
    return-object p0

    .line 204
    :cond_11
    invoke-static {}, Ll/l710;->a()V

    .line 205
    .line 206
    .line 207
    return-object v1

    .line 208
    :cond_12
    return-object v0
.end method

.method public readSegement()Lcom/alibaba/fastjson/JSONPath$Segment;
    .locals 9

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ne v0, v2, :cond_3

    .line 14
    .line 15
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 16
    .line 17
    invoke-static {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isDigitFirst(C)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-char v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    add-int/lit8 v3, v3, -0x30

    .line 26
    .line 27
    new-instance p0, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegment;

    .line 28
    .line 29
    invoke-direct {p0, v3}, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegment;-><init>(I)V

    .line 30
    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_0
    const/16 v0, 0x61

    .line 34
    .line 35
    if-lt v3, v0, :cond_1

    .line 36
    .line 37
    const/16 v0, 0x7a

    .line 38
    .line 39
    if-le v3, v0, :cond_2

    .line 40
    .line 41
    :cond_1
    const/16 v0, 0x41

    .line 42
    .line 43
    if-lt v3, v0, :cond_3

    .line 44
    .line 45
    const/16 v0, 0x5a

    .line 46
    .line 47
    if-gt v3, v0, :cond_3

    .line 48
    .line 49
    :cond_2
    new-instance p0, Lcom/alibaba/fastjson/JSONPath$PropertySegment;

    .line 50
    .line 51
    invoke-static {v3}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-direct {p0, v0, v1}, Lcom/alibaba/fastjson/JSONPath$PropertySegment;-><init>(Ljava/lang/String;Z)V

    .line 56
    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_17

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 66
    .line 67
    .line 68
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 69
    .line 70
    const/16 v3, 0x24

    .line 71
    .line 72
    if-ne v0, v3, :cond_4

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_4
    const/16 v3, 0x5b

    .line 79
    .line 80
    const-string v4, "not support jsonpath : "

    .line 81
    .line 82
    const/16 v5, 0x2e

    .line 83
    .line 84
    if-eq v0, v5, :cond_8

    .line 85
    .line 86
    const/16 v6, 0x2f

    .line 87
    .line 88
    if-ne v0, v6, :cond_5

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_5
    if-ne v0, v3, :cond_6

    .line 92
    .line 93
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->parseArrayAccess(Z)Lcom/alibaba/fastjson/JSONPath$Segment;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0

    .line 98
    :cond_6
    iget v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    .line 99
    .line 100
    if-nez v0, :cond_7

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    new-instance v0, Lcom/alibaba/fastjson/JSONPath$PropertySegment;

    .line 107
    .line 108
    invoke-direct {v0, p0, v1}, Lcom/alibaba/fastjson/JSONPath$PropertySegment;-><init>(Ljava/lang/String;Z)V

    .line 109
    .line 110
    .line 111
    return-object v0

    .line 112
    :cond_7
    iget-object p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {v4, p0}, Ll/skq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    const/4 p0, 0x0

    .line 118
    return-object p0

    .line 119
    :cond_8
    :goto_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 120
    .line 121
    .line 122
    const/16 v6, 0x2a

    .line 123
    .line 124
    if-ne v0, v5, :cond_9

    .line 125
    .line 126
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 127
    .line 128
    if-ne v0, v5, :cond_9

    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    iget v7, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 140
    .line 141
    add-int/lit8 v8, v7, 0x3

    .line 142
    .line 143
    if-le v0, v8, :cond_a

    .line 144
    .line 145
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 146
    .line 147
    if-ne v0, v3, :cond_a

    .line 148
    .line 149
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-ne v0, v6, :cond_a

    .line 156
    .line 157
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 158
    .line 159
    iget v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 160
    .line 161
    add-int/2addr v3, v2

    .line 162
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    const/16 v3, 0x5d

    .line 167
    .line 168
    if-ne v0, v3, :cond_a

    .line 169
    .line 170
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 171
    .line 172
    iget v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 173
    .line 174
    add-int/lit8 v3, v3, 0x2

    .line 175
    .line 176
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-ne v0, v5, :cond_a

    .line 181
    .line 182
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 192
    .line 193
    .line 194
    goto :goto_2

    .line 195
    :cond_9
    move v2, v1

    .line 196
    :cond_a
    :goto_2
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 197
    .line 198
    if-ne v0, v6, :cond_d

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    if-nez v0, :cond_b

    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 207
    .line 208
    .line 209
    :cond_b
    if-eqz v2, :cond_c

    .line 210
    .line 211
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$WildCardSegment;->instance_deep:Lcom/alibaba/fastjson/JSONPath$WildCardSegment;

    .line 212
    .line 213
    return-object p0

    .line 214
    :cond_c
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$WildCardSegment;->instance:Lcom/alibaba/fastjson/JSONPath$WildCardSegment;

    .line 215
    .line 216
    return-object p0

    .line 217
    :cond_d
    invoke-static {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isDigitFirst(C)Z

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    if-eqz v0, :cond_e

    .line 222
    .line 223
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->parseArrayAccess(Z)Lcom/alibaba/fastjson/JSONPath$Segment;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    return-object p0

    .line 228
    :cond_e
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    iget-char v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 233
    .line 234
    const/16 v3, 0x28

    .line 235
    .line 236
    if-ne v1, v3, :cond_16

    .line 237
    .line 238
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 239
    .line 240
    .line 241
    iget-char v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 242
    .line 243
    const/16 v2, 0x29

    .line 244
    .line 245
    if-ne v1, v2, :cond_15

    .line 246
    .line 247
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-nez v1, :cond_f

    .line 252
    .line 253
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 254
    .line 255
    .line 256
    :cond_f
    const-string v1, "size"

    .line 257
    .line 258
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result v1

    .line 262
    if-nez v1, :cond_14

    .line 263
    .line 264
    const-string v1, "length"

    .line 265
    .line 266
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    if-eqz v1, :cond_10

    .line 271
    .line 272
    goto :goto_3

    .line 273
    :cond_10
    const-string v1, "max"

    .line 274
    .line 275
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    if-eqz v1, :cond_11

    .line 280
    .line 281
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$MaxSegment;->instance:Lcom/alibaba/fastjson/JSONPath$MaxSegment;

    .line 282
    .line 283
    return-object p0

    .line 284
    :cond_11
    const-string v1, "min"

    .line 285
    .line 286
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    if-eqz v1, :cond_12

    .line 291
    .line 292
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$MinSegment;->instance:Lcom/alibaba/fastjson/JSONPath$MinSegment;

    .line 293
    .line 294
    return-object p0

    .line 295
    :cond_12
    const-string v1, "keySet"

    .line 296
    .line 297
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    if-eqz v0, :cond_13

    .line 302
    .line 303
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$KeySetSegment;->instance:Lcom/alibaba/fastjson/JSONPath$KeySetSegment;

    .line 304
    .line 305
    return-object p0

    .line 306
    :cond_13
    iget-object p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 307
    .line 308
    invoke-static {v4, p0}, Ll/skq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 309
    .line 310
    .line 311
    const/4 p0, 0x0

    .line 312
    return-object p0

    .line 313
    :cond_14
    :goto_3
    sget-object p0, Lcom/alibaba/fastjson/JSONPath$SizeSegment;->instance:Lcom/alibaba/fastjson/JSONPath$SizeSegment;

    .line 314
    .line 315
    return-object p0

    .line 316
    :cond_15
    iget-object p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 317
    .line 318
    invoke-static {v4, p0}, Ll/skq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 319
    .line 320
    .line 321
    const/4 p0, 0x0

    .line 322
    return-object p0

    .line 323
    :cond_16
    new-instance p0, Lcom/alibaba/fastjson/JSONPath$PropertySegment;

    .line 324
    .line 325
    invoke-direct {p0, v0, v2}, Lcom/alibaba/fastjson/JSONPath$PropertySegment;-><init>(Ljava/lang/String;Z)V

    .line 326
    .line 327
    .line 328
    return-object p0

    .line 329
    :cond_17
    const/4 p0, 0x0

    .line 330
    return-object p0
.end method

.method public readString()Ljava/lang/String;
    .locals 5

    .line 1
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 7
    .line 8
    add-int/lit8 v1, v1, -0x1

    .line 9
    .line 10
    :goto_0
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 11
    .line 12
    if-eq v2, v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    iget v4, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    .line 31
    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    add-int/lit8 v4, v4, -0x1

    .line 36
    .line 37
    :goto_1
    invoke-virtual {v2, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 42
    .line 43
    .line 44
    return-object v1
.end method

.method public readValue()Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 2
    .line 3
    .line 4
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 5
    .line 6
    invoke-static {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isDigitFirst(C)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readLongValue()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 22
    .line 23
    const/16 v1, 0x22

    .line 24
    .line 25
    if-eq v0, v1, :cond_4

    .line 26
    .line 27
    const/16 v1, 0x27

    .line 28
    .line 29
    if-ne v0, v1, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/16 v1, 0x6e

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    if-ne v0, v1, :cond_3

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "null"

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    return-object v2

    .line 50
    :cond_2
    new-instance v0, Lcom/alibaba/fastjson/JSONPathException;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    throw v0

    .line 58
    :cond_3
    invoke-static {}, Ll/l710;->a()V

    .line 59
    .line 60
    .line 61
    return-object v2

    .line 62
    :cond_4
    :goto_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method public final skipWhitespace()V
    .locals 2

    .line 1
    :goto_0
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 2
    .line 3
    const/16 v1, 0x20

    .line 4
    .line 5
    if-gt v0, v1, :cond_1

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    const/16 v1, 0xd

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const/16 v1, 0xa

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    const/16 v1, 0x9

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    const/16 v1, 0xc

    .line 22
    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    const/16 v1, 0x8

    .line 26
    .line 27
    if-ne v0, v1, :cond_1

    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method
