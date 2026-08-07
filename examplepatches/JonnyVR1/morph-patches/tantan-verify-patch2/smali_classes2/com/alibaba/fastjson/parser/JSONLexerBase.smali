.class public abstract Lcom/alibaba/fastjson/parser/JSONLexerBase;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/parser/JSONLexer;
.implements Ljava/io/Closeable;


# static fields
.field protected static final INT_MULTMIN_RADIX_TEN:I = -0xccccccc

.field protected static final MULTMIN_RADIX_TEN:J = -0xcccccccccccccccL

.field private static final SBUF_LOCAL:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "[C>;"
        }
    .end annotation
.end field

.field protected static final digits:[I

.field protected static final typeFieldName:[C


# instance fields
.field protected bp:I

.field protected calendar:Ljava/util/Calendar;

.field protected ch:C

.field protected eofPos:I

.field protected features:I

.field protected hasSpecial:Z

.field protected locale:Ljava/util/Locale;

.field public matchStat:I

.field protected np:I

.field protected pos:I

.field protected sbuf:[C

.field protected sp:I

.field protected stringDefaultValue:Ljava/lang/String;

.field protected timeZone:Ljava/util/TimeZone;

.field protected token:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->SBUF_LOCAL:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "\""

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v1, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, "\":\""

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->typeFieldName:[C

    .line 34
    .line 35
    const/16 v0, 0x67

    .line 36
    .line 37
    new-array v0, v0, [I

    .line 38
    .line 39
    sput-object v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    .line 40
    .line 41
    const/16 v0, 0x30

    .line 42
    .line 43
    :goto_0
    const/16 v1, 0x39

    .line 44
    .line 45
    if-gt v0, v1, :cond_0

    .line 46
    .line 47
    sget-object v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    .line 48
    .line 49
    add-int/lit8 v2, v0, -0x30

    .line 50
    .line 51
    aput v2, v1, v0

    .line 52
    .line 53
    add-int/lit8 v0, v0, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const/16 v0, 0x61

    .line 57
    .line 58
    :goto_1
    const/16 v1, 0x66

    .line 59
    .line 60
    if-gt v0, v1, :cond_1

    .line 61
    .line 62
    sget-object v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    .line 63
    .line 64
    add-int/lit8 v2, v0, -0x57

    .line 65
    .line 66
    aput v2, v1, v0

    .line 67
    .line 68
    add-int/lit8 v0, v0, 0x1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    const/16 v0, 0x41

    .line 72
    .line 73
    :goto_2
    const/16 v1, 0x46

    .line 74
    .line 75
    if-gt v0, v1, :cond_2

    .line 76
    .line 77
    sget-object v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    .line 78
    .line 79
    add-int/lit8 v2, v0, -0x37

    .line 80
    .line 81
    aput v2, v1, v0

    .line 82
    .line 83
    add-int/lit8 v0, v0, 0x1

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_2
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 6
    .line 7
    sget-object v1, Lcom/alibaba/fastjson/JSON;->defaultTimeZone:Ljava/util/TimeZone;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->timeZone:Ljava/util/TimeZone;

    .line 10
    .line 11
    sget-object v1, Lcom/alibaba/fastjson/JSON;->defaultLocale:Ljava/util/Locale;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->locale:Ljava/util/Locale;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 17
    .line 18
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue:Ljava/lang/String;

    .line 19
    .line 20
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->features:I

    .line 21
    .line 22
    sget-object v0, Lcom/alibaba/fastjson/parser/Feature;->InitStringFieldAsEmpty:Lcom/alibaba/fastjson/parser/Feature;

    .line 23
    .line 24
    iget v0, v0, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    .line 25
    .line 26
    and-int/2addr p1, v0

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const-string p1, ""

    .line 30
    .line 31
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue:Ljava/lang/String;

    .line 32
    .line 33
    :cond_0
    sget-object p1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->SBUF_LOCAL:Ljava/lang/ThreadLocal;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, [C

    .line 40
    .line 41
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 42
    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    const/16 p1, 0x200

    .line 46
    .line 47
    new-array p1, p1, [C

    .line 48
    .line 49
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public static isWhitespace(C)Z
    .locals 1

    const/16 v0, 0x20

    if-gt p0, v0, :cond_1

    if-eq p0, v0, :cond_0

    const/16 v0, 0xa

    if-eq p0, v0, :cond_0

    const/16 v0, 0xd

    if-eq p0, v0, :cond_0

    const/16 v0, 0x9

    if-eq p0, v0, :cond_0

    const/16 v0, 0xc

    if-eq p0, v0, :cond_0

    const/16 v0, 0x8

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static readString([CI)Ljava/lang/String;
    .locals 16

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    new-array v1, v0, [C

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    move v3, v2

    .line 7
    move v4, v3

    .line 8
    :goto_0
    if-ge v3, v0, :cond_9

    .line 9
    .line 10
    aget-char v5, p0, v3

    .line 11
    .line 12
    const/16 v6, 0x5c

    .line 13
    .line 14
    const/4 v7, 0x1

    .line 15
    if-eq v5, v6, :cond_0

    .line 16
    .line 17
    add-int/lit8 v6, v4, 0x1

    .line 18
    .line 19
    aput-char v5, v1, v4

    .line 20
    .line 21
    move v4, v6

    .line 22
    goto/16 :goto_3

    .line 23
    .line 24
    :cond_0
    add-int/lit8 v5, v3, 0x1

    .line 25
    .line 26
    aget-char v8, p0, v5

    .line 27
    .line 28
    const/16 v9, 0x22

    .line 29
    .line 30
    if-eq v8, v9, :cond_8

    .line 31
    .line 32
    const/16 v9, 0x27

    .line 33
    .line 34
    if-eq v8, v9, :cond_7

    .line 35
    .line 36
    const/16 v9, 0x46

    .line 37
    .line 38
    if-eq v8, v9, :cond_6

    .line 39
    .line 40
    if-eq v8, v6, :cond_5

    .line 41
    .line 42
    const/16 v6, 0x62

    .line 43
    .line 44
    if-eq v8, v6, :cond_4

    .line 45
    .line 46
    const/16 v6, 0x66

    .line 47
    .line 48
    if-eq v8, v6, :cond_6

    .line 49
    .line 50
    const/16 v6, 0x6e

    .line 51
    .line 52
    if-eq v8, v6, :cond_3

    .line 53
    .line 54
    const/16 v6, 0x72

    .line 55
    .line 56
    if-eq v8, v6, :cond_2

    .line 57
    .line 58
    const/16 v6, 0x78

    .line 59
    .line 60
    const/16 v9, 0x10

    .line 61
    .line 62
    if-eq v8, v6, :cond_1

    .line 63
    .line 64
    const/4 v6, 0x4

    .line 65
    const/4 v10, 0x3

    .line 66
    const/4 v11, 0x2

    .line 67
    packed-switch v8, :pswitch_data_0

    .line 68
    .line 69
    .line 70
    packed-switch v8, :pswitch_data_1

    .line 71
    .line 72
    .line 73
    const-string v0, "unclosed.str.lit"

    .line 74
    .line 75
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    const/4 v0, 0x0

    .line 79
    return-object v0

    .line 80
    :pswitch_0
    add-int/lit8 v3, v4, 0x1

    .line 81
    .line 82
    const/16 v6, 0xb

    .line 83
    .line 84
    aput-char v6, v1, v4

    .line 85
    .line 86
    :goto_1
    move v4, v3

    .line 87
    move v3, v5

    .line 88
    goto/16 :goto_3

    .line 89
    .line 90
    :pswitch_1
    add-int/lit8 v5, v4, 0x1

    .line 91
    .line 92
    new-instance v8, Ljava/lang/String;

    .line 93
    .line 94
    add-int/lit8 v12, v3, 0x2

    .line 95
    .line 96
    aget-char v12, p0, v12

    .line 97
    .line 98
    add-int/lit8 v13, v3, 0x3

    .line 99
    .line 100
    aget-char v13, p0, v13

    .line 101
    .line 102
    add-int/lit8 v14, v3, 0x4

    .line 103
    .line 104
    aget-char v14, p0, v14

    .line 105
    .line 106
    add-int/lit8 v3, v3, 0x5

    .line 107
    .line 108
    aget-char v15, p0, v3

    .line 109
    .line 110
    new-array v6, v6, [C

    .line 111
    .line 112
    aput-char v12, v6, v2

    .line 113
    .line 114
    aput-char v13, v6, v7

    .line 115
    .line 116
    aput-char v14, v6, v11

    .line 117
    .line 118
    aput-char v15, v6, v10

    .line 119
    .line 120
    invoke-direct {v8, v6}, Ljava/lang/String;-><init>([C)V

    .line 121
    .line 122
    .line 123
    invoke-static {v8, v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    int-to-char v6, v6

    .line 128
    aput-char v6, v1, v4

    .line 129
    .line 130
    :goto_2
    move v4, v5

    .line 131
    goto/16 :goto_3

    .line 132
    .line 133
    :pswitch_2
    add-int/lit8 v3, v4, 0x1

    .line 134
    .line 135
    const/16 v6, 0x9

    .line 136
    .line 137
    aput-char v6, v1, v4

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :pswitch_3
    add-int/lit8 v3, v4, 0x1

    .line 141
    .line 142
    const/4 v6, 0x7

    .line 143
    aput-char v6, v1, v4

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :pswitch_4
    add-int/lit8 v3, v4, 0x1

    .line 147
    .line 148
    const/4 v6, 0x6

    .line 149
    aput-char v6, v1, v4

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :pswitch_5
    add-int/lit8 v3, v4, 0x1

    .line 153
    .line 154
    const/4 v6, 0x5

    .line 155
    aput-char v6, v1, v4

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :pswitch_6
    add-int/lit8 v3, v4, 0x1

    .line 159
    .line 160
    aput-char v6, v1, v4

    .line 161
    .line 162
    goto :goto_1

    .line 163
    :pswitch_7
    add-int/lit8 v3, v4, 0x1

    .line 164
    .line 165
    aput-char v10, v1, v4

    .line 166
    .line 167
    goto :goto_1

    .line 168
    :pswitch_8
    add-int/lit8 v3, v4, 0x1

    .line 169
    .line 170
    aput-char v11, v1, v4

    .line 171
    .line 172
    goto :goto_1

    .line 173
    :pswitch_9
    add-int/lit8 v3, v4, 0x1

    .line 174
    .line 175
    aput-char v7, v1, v4

    .line 176
    .line 177
    goto :goto_1

    .line 178
    :pswitch_a
    add-int/lit8 v3, v4, 0x1

    .line 179
    .line 180
    aput-char v2, v1, v4

    .line 181
    .line 182
    goto :goto_1

    .line 183
    :pswitch_b
    add-int/lit8 v3, v4, 0x1

    .line 184
    .line 185
    const/16 v6, 0x2f

    .line 186
    .line 187
    aput-char v6, v1, v4

    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_1
    add-int/lit8 v5, v4, 0x1

    .line 191
    .line 192
    sget-object v6, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    .line 193
    .line 194
    add-int/lit8 v8, v3, 0x2

    .line 195
    .line 196
    aget-char v8, p0, v8

    .line 197
    .line 198
    aget v8, v6, v8

    .line 199
    .line 200
    mul-int/2addr v8, v9

    .line 201
    add-int/lit8 v3, v3, 0x3

    .line 202
    .line 203
    aget-char v9, p0, v3

    .line 204
    .line 205
    aget v6, v6, v9

    .line 206
    .line 207
    add-int/2addr v8, v6

    .line 208
    int-to-char v6, v8

    .line 209
    aput-char v6, v1, v4

    .line 210
    .line 211
    goto :goto_2

    .line 212
    :cond_2
    add-int/lit8 v3, v4, 0x1

    .line 213
    .line 214
    const/16 v6, 0xd

    .line 215
    .line 216
    aput-char v6, v1, v4

    .line 217
    .line 218
    goto/16 :goto_1

    .line 219
    .line 220
    :cond_3
    add-int/lit8 v3, v4, 0x1

    .line 221
    .line 222
    const/16 v6, 0xa

    .line 223
    .line 224
    aput-char v6, v1, v4

    .line 225
    .line 226
    goto/16 :goto_1

    .line 227
    .line 228
    :cond_4
    add-int/lit8 v3, v4, 0x1

    .line 229
    .line 230
    const/16 v6, 0x8

    .line 231
    .line 232
    aput-char v6, v1, v4

    .line 233
    .line 234
    goto/16 :goto_1

    .line 235
    .line 236
    :cond_5
    add-int/lit8 v3, v4, 0x1

    .line 237
    .line 238
    aput-char v6, v1, v4

    .line 239
    .line 240
    goto/16 :goto_1

    .line 241
    .line 242
    :cond_6
    add-int/lit8 v3, v4, 0x1

    .line 243
    .line 244
    const/16 v6, 0xc

    .line 245
    .line 246
    aput-char v6, v1, v4

    .line 247
    .line 248
    goto/16 :goto_1

    .line 249
    .line 250
    :cond_7
    add-int/lit8 v3, v4, 0x1

    .line 251
    .line 252
    aput-char v9, v1, v4

    .line 253
    .line 254
    goto/16 :goto_1

    .line 255
    .line 256
    :cond_8
    add-int/lit8 v3, v4, 0x1

    .line 257
    .line 258
    aput-char v9, v1, v4

    .line 259
    .line 260
    goto/16 :goto_1

    .line 261
    .line 262
    :goto_3
    add-int/2addr v3, v7

    .line 263
    goto/16 :goto_0

    .line 264
    .line 265
    :cond_9
    new-instance v0, Ljava/lang/String;

    .line 266
    .line 267
    invoke-direct {v0, v1, v2, v4}, Ljava/lang/String;-><init>([CII)V

    .line 268
    .line 269
    .line 270
    return-object v0

    .line 271
    :pswitch_data_0
    .packed-switch 0x2f
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    :pswitch_data_1
    .packed-switch 0x74
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private scanStringSingleQuote()V
    .locals 12

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2
    .line 3
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 7
    .line 8
    :goto_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x4

    .line 13
    const/16 v3, 0x27

    .line 14
    .line 15
    if-ne v1, v3, :cond_0

    .line 16
    .line 17
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string v4, "unclosed single-quote string"

    .line 24
    .line 25
    const/16 v5, 0x1a

    .line 26
    .line 27
    if-ne v1, v5, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEOF()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-static {v4}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    iget-boolean v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 44
    .line 45
    const/16 v6, 0x5c

    .line 46
    .line 47
    if-ne v1, v6, :cond_16

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    if-nez v5, :cond_4

    .line 51
    .line 52
    iput-boolean v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 53
    .line 54
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 55
    .line 56
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 57
    .line 58
    array-length v8, v7

    .line 59
    if-le v5, v8, :cond_3

    .line 60
    .line 61
    mul-int/lit8 v5, v5, 0x2

    .line 62
    .line 63
    new-array v5, v5, [C

    .line 64
    .line 65
    array-length v8, v7

    .line 66
    invoke-static {v7, v0, v5, v0, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 67
    .line 68
    .line 69
    iput-object v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 70
    .line 71
    :cond_3
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 72
    .line 73
    add-int/2addr v5, v1

    .line 74
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 75
    .line 76
    iget-object v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 77
    .line 78
    invoke-virtual {p0, v5, v7, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->copyTo(II[C)V

    .line 79
    .line 80
    .line 81
    :cond_4
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    const/16 v7, 0x22

    .line 86
    .line 87
    if-eq v5, v7, :cond_15

    .line 88
    .line 89
    if-eq v5, v3, :cond_14

    .line 90
    .line 91
    const/16 v3, 0x46

    .line 92
    .line 93
    if-eq v5, v3, :cond_13

    .line 94
    .line 95
    if-eq v5, v6, :cond_12

    .line 96
    .line 97
    const/16 v6, 0x62

    .line 98
    .line 99
    if-eq v5, v6, :cond_11

    .line 100
    .line 101
    const/16 v6, 0x66

    .line 102
    .line 103
    if-eq v5, v6, :cond_13

    .line 104
    .line 105
    const/16 v7, 0x6e

    .line 106
    .line 107
    if-eq v5, v7, :cond_10

    .line 108
    .line 109
    const/16 v7, 0x72

    .line 110
    .line 111
    if-eq v5, v7, :cond_f

    .line 112
    .line 113
    const/16 v7, 0x78

    .line 114
    .line 115
    const/16 v8, 0x10

    .line 116
    .line 117
    if-eq v5, v7, :cond_5

    .line 118
    .line 119
    const/4 v3, 0x3

    .line 120
    const/4 v6, 0x2

    .line 121
    packed-switch v5, :pswitch_data_0

    .line 122
    .line 123
    .line 124
    packed-switch v5, :pswitch_data_1

    .line 125
    .line 126
    .line 127
    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 128
    .line 129
    invoke-static {v4}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :pswitch_0
    const/16 v1, 0xb

    .line 134
    .line 135
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 136
    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :pswitch_1
    new-instance v4, Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 143
    .line 144
    .line 145
    move-result v5

    .line 146
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 147
    .line 148
    .line 149
    move-result v7

    .line 150
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 151
    .line 152
    .line 153
    move-result v9

    .line 154
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 155
    .line 156
    .line 157
    move-result v10

    .line 158
    new-array v2, v2, [C

    .line 159
    .line 160
    aput-char v5, v2, v0

    .line 161
    .line 162
    aput-char v7, v2, v1

    .line 163
    .line 164
    aput-char v9, v2, v6

    .line 165
    .line 166
    aput-char v10, v2, v3

    .line 167
    .line 168
    invoke-direct {v4, v2}, Ljava/lang/String;-><init>([C)V

    .line 169
    .line 170
    .line 171
    invoke-static {v4, v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    int-to-char v1, v1

    .line 176
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 177
    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :pswitch_2
    const/16 v1, 0x9

    .line 182
    .line 183
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 184
    .line 185
    .line 186
    goto/16 :goto_0

    .line 187
    .line 188
    :pswitch_3
    const/4 v1, 0x7

    .line 189
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 190
    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :pswitch_4
    const/4 v1, 0x6

    .line 195
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 196
    .line 197
    .line 198
    goto/16 :goto_0

    .line 199
    .line 200
    :pswitch_5
    const/4 v1, 0x5

    .line 201
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 202
    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :pswitch_6
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 207
    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :pswitch_7
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 212
    .line 213
    .line 214
    goto/16 :goto_0

    .line 215
    .line 216
    :pswitch_8
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 217
    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :pswitch_9
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 222
    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :pswitch_a
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 227
    .line 228
    .line 229
    goto/16 :goto_0

    .line 230
    .line 231
    :pswitch_b
    const/16 v1, 0x2f

    .line 232
    .line 233
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 234
    .line 235
    .line 236
    goto/16 :goto_0

    .line 237
    .line 238
    :cond_5
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 243
    .line 244
    .line 245
    move-result v4

    .line 246
    const/16 v5, 0x41

    .line 247
    .line 248
    const/16 v7, 0x61

    .line 249
    .line 250
    const/16 v9, 0x39

    .line 251
    .line 252
    const/16 v10, 0x30

    .line 253
    .line 254
    if-lt v2, v10, :cond_6

    .line 255
    .line 256
    if-le v2, v9, :cond_8

    .line 257
    .line 258
    :cond_6
    if-lt v2, v7, :cond_7

    .line 259
    .line 260
    if-le v2, v6, :cond_8

    .line 261
    .line 262
    :cond_7
    if-lt v2, v5, :cond_9

    .line 263
    .line 264
    if-gt v2, v3, :cond_9

    .line 265
    .line 266
    :cond_8
    move v11, v1

    .line 267
    goto :goto_1

    .line 268
    :cond_9
    move v11, v0

    .line 269
    :goto_1
    if-lt v4, v10, :cond_a

    .line 270
    .line 271
    if-le v4, v9, :cond_d

    .line 272
    .line 273
    :cond_a
    if-lt v4, v7, :cond_b

    .line 274
    .line 275
    if-le v4, v6, :cond_d

    .line 276
    .line 277
    :cond_b
    if-lt v4, v5, :cond_c

    .line 278
    .line 279
    if-gt v4, v3, :cond_c

    .line 280
    .line 281
    goto :goto_2

    .line 282
    :cond_c
    move v1, v0

    .line 283
    :cond_d
    :goto_2
    if-eqz v11, :cond_e

    .line 284
    .line 285
    if-eqz v1, :cond_e

    .line 286
    .line 287
    sget-object v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    .line 288
    .line 289
    aget v2, v1, v2

    .line 290
    .line 291
    mul-int/2addr v2, v8

    .line 292
    aget v1, v1, v4

    .line 293
    .line 294
    add-int/2addr v2, v1

    .line 295
    int-to-char v1, v2

    .line 296
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 297
    .line 298
    .line 299
    goto/16 :goto_0

    .line 300
    .line 301
    :cond_e
    new-instance p0, Lcom/alibaba/fastjson/JSONException;

    .line 302
    .line 303
    new-instance v0, Ljava/lang/StringBuilder;

    .line 304
    .line 305
    const-string v1, "invalid escape character \\x"

    .line 306
    .line 307
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    throw p0

    .line 324
    :cond_f
    const/16 v1, 0xd

    .line 325
    .line 326
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 327
    .line 328
    .line 329
    goto/16 :goto_0

    .line 330
    .line 331
    :cond_10
    const/16 v1, 0xa

    .line 332
    .line 333
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 334
    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :cond_11
    const/16 v1, 0x8

    .line 339
    .line 340
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 341
    .line 342
    .line 343
    goto/16 :goto_0

    .line 344
    .line 345
    :cond_12
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 346
    .line 347
    .line 348
    goto/16 :goto_0

    .line 349
    .line 350
    :cond_13
    const/16 v1, 0xc

    .line 351
    .line 352
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 353
    .line 354
    .line 355
    goto/16 :goto_0

    .line 356
    .line 357
    :cond_14
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 358
    .line 359
    .line 360
    goto/16 :goto_0

    .line 361
    .line 362
    :cond_15
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 363
    .line 364
    .line 365
    goto/16 :goto_0

    .line 366
    .line 367
    :cond_16
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 368
    .line 369
    if-nez v5, :cond_17

    .line 370
    .line 371
    add-int/lit8 v2, v2, 0x1

    .line 372
    .line 373
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 374
    .line 375
    goto/16 :goto_0

    .line 376
    .line 377
    :cond_17
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 378
    .line 379
    array-length v4, v3

    .line 380
    if-ne v2, v4, :cond_18

    .line 381
    .line 382
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 383
    .line 384
    .line 385
    goto/16 :goto_0

    .line 386
    .line 387
    :cond_18
    add-int/lit8 v4, v2, 0x1

    .line 388
    .line 389
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 390
    .line 391
    aput-char v1, v3, v2

    .line 392
    .line 393
    goto/16 :goto_0

    .line 394
    .line 395
    :pswitch_data_0
    .packed-switch 0x2f
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    :pswitch_data_1
    .packed-switch 0x74
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public abstract addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
.end method

.method public abstract arrayCopy(I[CII)V
.end method

.method public abstract bytesValue()[B
.end method

.method public abstract charArrayCompare([C)Z
.end method

.method public abstract charAt(I)C
.end method

.method public close()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/16 v2, 0x2000

    .line 5
    .line 6
    if-gt v1, v2, :cond_0

    .line 7
    .line 8
    sget-object v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->SBUF_LOCAL:Ljava/lang/ThreadLocal;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 15
    .line 16
    return-void
.end method

.method public config(Lcom/alibaba/fastjson/parser/Feature;Z)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->features:I

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Lcom/alibaba/fastjson/parser/Feature;->config(ILcom/alibaba/fastjson/parser/Feature;Z)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->features:I

    .line 8
    .line 9
    sget-object p2, Lcom/alibaba/fastjson/parser/Feature;->InitStringFieldAsEmpty:Lcom/alibaba/fastjson/parser/Feature;

    .line 10
    .line 11
    iget p2, p2, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    .line 12
    .line 13
    and-int/2addr p1, p2

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    const-string p1, ""

    .line 17
    .line 18
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public abstract copyTo(II[C)V
.end method

.method public final decimalValue(Z)Ljava/lang/Number;
    .locals 2

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 2
    .line 3
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    add-int/lit8 v0, v0, -0x1

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/16 v1, 0x46

    .line 13
    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    :try_start_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :catch_0
    move-exception p1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/16 v1, 0x44

    .line 32
    .line 33
    if-ne v0, v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_1
    if-eqz p1, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->decimalValue()Ljava/math/BigDecimal;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_2
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->doubleValue()D

    .line 56
    .line 57
    .line 58
    move-result-wide v0

    .line 59
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 60
    .line 61
    .line 62
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    return-object p0

    .line 64
    :goto_0
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->info()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string p1, ", "

    .line 83
    .line 84
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    throw v0
.end method

.method public abstract decimalValue()Ljava/math/BigDecimal;
.end method

.method public doubleValue()D
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public floatValue()F
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    cmpl-float v2, v0, v1

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    const/high16 v2, 0x7f800000    # Float.POSITIVE_INFINITY

    .line 15
    .line 16
    cmpl-float v2, v0, v2

    .line 17
    .line 18
    if-nez v2, :cond_2

    .line 19
    .line 20
    :cond_0
    const/4 v2, 0x0

    .line 21
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/16 v3, 0x30

    .line 26
    .line 27
    if-le v2, v3, :cond_2

    .line 28
    .line 29
    const/16 v3, 0x39

    .line 30
    .line 31
    if-le v2, v3, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const-string v0, "float overflow : "

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return v1

    .line 44
    :cond_2
    :goto_0
    return v0
.end method

.method public getCalendar()Ljava/util/Calendar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getCurrent()C
    .locals 0

    .line 1
    iget-char p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2
    .line 3
    return p0
.end method

.method public getFeatures()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->features:I

    .line 2
    .line 3
    return p0
.end method

.method public getLocale()Ljava/util/Locale;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->locale:Ljava/util/Locale;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimeZone()Ljava/util/TimeZone;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->timeZone:Ljava/util/TimeZone;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract indexOf(CI)I
.end method

.method public info()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public final intValue()I
    .locals 12

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 8
    .line 9
    :cond_0
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 10
    .line 11
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 12
    .line 13
    add-int/2addr v1, v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    const/16 v4, 0x2d

    .line 19
    .line 20
    const/4 v5, 0x1

    .line 21
    if-ne v3, v4, :cond_1

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    const/high16 v3, -0x80000000

    .line 26
    .line 27
    move v4, v5

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const v3, -0x7fffffff

    .line 30
    .line 31
    .line 32
    move v4, v2

    .line 33
    :goto_0
    if-ge v0, v1, :cond_2

    .line 34
    .line 35
    add-int/lit8 v2, v0, 0x1

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/lit8 v0, v0, -0x30

    .line 42
    .line 43
    neg-int v0, v0

    .line 44
    move v11, v2

    .line 45
    move v2, v0

    .line 46
    move v0, v11

    .line 47
    :cond_2
    :goto_1
    if-ge v0, v1, :cond_7

    .line 48
    .line 49
    add-int/lit8 v6, v0, 0x1

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/16 v7, 0x4c

    .line 56
    .line 57
    if-eq v0, v7, :cond_6

    .line 58
    .line 59
    const/16 v7, 0x53

    .line 60
    .line 61
    if-eq v0, v7, :cond_6

    .line 62
    .line 63
    const/16 v7, 0x42

    .line 64
    .line 65
    if-ne v0, v7, :cond_3

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_3
    add-int/lit8 v0, v0, -0x30

    .line 69
    .line 70
    int-to-long v7, v2

    .line 71
    const-wide/32 v9, -0xccccccc

    .line 72
    .line 73
    .line 74
    cmp-long v7, v7, v9

    .line 75
    .line 76
    if-ltz v7, :cond_5

    .line 77
    .line 78
    mul-int/lit8 v2, v2, 0xa

    .line 79
    .line 80
    add-int v7, v3, v0

    .line 81
    .line 82
    if-lt v2, v7, :cond_4

    .line 83
    .line 84
    sub-int/2addr v2, v0

    .line 85
    move v0, v6

    .line 86
    goto :goto_1

    .line 87
    :cond_4
    new-instance v0, Ljava/lang/NumberFormatException;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-direct {v0, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw v0

    .line 97
    :cond_5
    new-instance v0, Ljava/lang/NumberFormatException;

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-direct {v0, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    throw v0

    .line 107
    :cond_6
    :goto_2
    move v0, v6

    .line 108
    :cond_7
    if-eqz v4, :cond_9

    .line 109
    .line 110
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 111
    .line 112
    add-int/2addr v1, v5

    .line 113
    if-le v0, v1, :cond_8

    .line 114
    .line 115
    return v2

    .line 116
    :cond_8
    new-instance v0, Ljava/lang/NumberFormatException;

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-direct {v0, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    throw v0

    .line 126
    :cond_9
    neg-int p0, v2

    .line 127
    return p0
.end method

.method public final integerValue()Ljava/lang/Number;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-ne v1, v2, :cond_0

    .line 8
    .line 9
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 10
    .line 11
    :cond_0
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 12
    .line 13
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 14
    .line 15
    add-int/2addr v2, v1

    .line 16
    add-int/lit8 v4, v2, -0x1

    .line 17
    .line 18
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    const/16 v5, 0x53

    .line 23
    .line 24
    const/16 v6, 0x4c

    .line 25
    .line 26
    const/16 v7, 0x42

    .line 27
    .line 28
    if-eq v4, v7, :cond_3

    .line 29
    .line 30
    if-eq v4, v6, :cond_2

    .line 31
    .line 32
    if-eq v4, v5, :cond_1

    .line 33
    .line 34
    const/16 v4, 0x20

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    add-int/lit8 v2, v2, -0x1

    .line 38
    .line 39
    move v4, v5

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    add-int/lit8 v2, v2, -0x1

    .line 42
    .line 43
    move v4, v6

    .line 44
    goto :goto_0

    .line 45
    :cond_3
    add-int/lit8 v2, v2, -0x1

    .line 46
    .line 47
    move v4, v7

    .line 48
    :goto_0
    iget v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 49
    .line 50
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    const/16 v9, 0x2d

    .line 55
    .line 56
    const/4 v10, 0x1

    .line 57
    if-ne v8, v9, :cond_4

    .line 58
    .line 59
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    const-wide/high16 v8, -0x8000000000000000L

    .line 62
    .line 63
    move v3, v10

    .line 64
    goto :goto_1

    .line 65
    :cond_4
    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    :goto_1
    if-ge v1, v2, :cond_5

    .line 71
    .line 72
    add-int/lit8 v11, v1, 0x1

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    add-int/lit8 v1, v1, -0x30

    .line 79
    .line 80
    neg-int v1, v1

    .line 81
    int-to-long v12, v1

    .line 82
    :goto_2
    move v1, v11

    .line 83
    goto :goto_3

    .line 84
    :cond_5
    const-wide/16 v12, 0x0

    .line 85
    .line 86
    :goto_3
    if-ge v1, v2, :cond_8

    .line 87
    .line 88
    add-int/lit8 v11, v1, 0x1

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    add-int/lit8 v1, v1, -0x30

    .line 95
    .line 96
    const-wide v14, -0xcccccccccccccccL

    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    cmp-long v14, v12, v14

    .line 102
    .line 103
    if-gez v14, :cond_6

    .line 104
    .line 105
    new-instance v1, Ljava/math/BigInteger;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-direct {v1, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-object v1

    .line 115
    :cond_6
    const-wide/16 v14, 0xa

    .line 116
    .line 117
    mul-long/2addr v12, v14

    .line 118
    int-to-long v14, v1

    .line 119
    add-long v16, v8, v14

    .line 120
    .line 121
    cmp-long v1, v12, v16

    .line 122
    .line 123
    if-gez v1, :cond_7

    .line 124
    .line 125
    new-instance v1, Ljava/math/BigInteger;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-direct {v1, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    return-object v1

    .line 135
    :cond_7
    sub-long/2addr v12, v14

    .line 136
    goto :goto_2

    .line 137
    :cond_8
    if-eqz v3, :cond_d

    .line 138
    .line 139
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 140
    .line 141
    add-int/2addr v2, v10

    .line 142
    if-le v1, v2, :cond_c

    .line 143
    .line 144
    const-wide/32 v0, -0x80000000

    .line 145
    .line 146
    .line 147
    cmp-long v0, v12, v0

    .line 148
    .line 149
    if-ltz v0, :cond_b

    .line 150
    .line 151
    if-eq v4, v6, :cond_b

    .line 152
    .line 153
    if-ne v4, v5, :cond_9

    .line 154
    .line 155
    long-to-int v0, v12

    .line 156
    int-to-short v0, v0

    .line 157
    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    return-object v0

    .line 162
    :cond_9
    if-ne v4, v7, :cond_a

    .line 163
    .line 164
    long-to-int v0, v12

    .line 165
    int-to-byte v0, v0

    .line 166
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    return-object v0

    .line 171
    :cond_a
    long-to-int v0, v12

    .line 172
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    return-object v0

    .line 177
    :cond_b
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    return-object v0

    .line 182
    :cond_c
    new-instance v1, Ljava/lang/NumberFormatException;

    .line 183
    .line 184
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-direct {v1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    throw v1

    .line 192
    :cond_d
    neg-long v0, v12

    .line 193
    const-wide/32 v2, 0x7fffffff

    .line 194
    .line 195
    .line 196
    cmp-long v2, v0, v2

    .line 197
    .line 198
    if-gtz v2, :cond_10

    .line 199
    .line 200
    if-eq v4, v6, :cond_10

    .line 201
    .line 202
    if-ne v4, v5, :cond_e

    .line 203
    .line 204
    long-to-int v0, v0

    .line 205
    int-to-short v0, v0

    .line 206
    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    return-object v0

    .line 211
    :cond_e
    if-ne v4, v7, :cond_f

    .line 212
    .line 213
    long-to-int v0, v0

    .line 214
    int-to-byte v0, v0

    .line 215
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    return-object v0

    .line 220
    :cond_f
    long-to-int v0, v0

    .line 221
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    return-object v0

    .line 226
    :cond_10
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    return-object v0
.end method

.method public isBlankInput()Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    const/16 v3, 0x1a

    .line 8
    .line 9
    if-ne v2, v3, :cond_0

    .line 10
    .line 11
    const/16 v0, 0x14

    .line 12
    .line 13
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    return v0

    .line 24
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0
.end method

.method public abstract isEOF()Z
.end method

.method public final isEnabled(I)Z
    .locals 0

    .line 15
    iget p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->features:I

    and-int/2addr p0, p1

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final isEnabled(II)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->features:I

    .line 2
    .line 3
    and-int/2addr p0, p2

    .line 4
    if-nez p0, :cond_1

    .line 5
    .line 6
    and-int p0, p1, p2

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public final isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z
    .locals 0

    .line 16
    iget p1, p1, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(I)Z

    move-result p0

    return p0
.end method

.method public final isRef()Z
    .locals 5

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x4

    .line 5
    if-eq v0, v2, :cond_0

    .line 6
    .line 7
    return v1

    .line 8
    :cond_0
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    add-int/2addr v0, v3

    .line 12
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/16 v4, 0x24

    .line 17
    .line 18
    if-ne v0, v4, :cond_1

    .line 19
    .line 20
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x2

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/16 v4, 0x72

    .line 29
    .line 30
    if-ne v0, v4, :cond_1

    .line 31
    .line 32
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 33
    .line 34
    add-int/lit8 v0, v0, 0x3

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const/16 v4, 0x65

    .line 41
    .line 42
    if-ne v0, v4, :cond_1

    .line 43
    .line 44
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 45
    .line 46
    add-int/2addr v0, v2

    .line 47
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    const/16 v0, 0x66

    .line 52
    .line 53
    if-ne p0, v0, :cond_1

    .line 54
    .line 55
    return v3

    .line 56
    :cond_1
    return v1
.end method

.method public varargs lexError(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 3
    .line 4
    return-void
.end method

.method public final longValue()J
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 8
    .line 9
    :cond_0
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 10
    .line 11
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 12
    .line 13
    add-int/2addr v1, v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    const/16 v4, 0x2d

    .line 19
    .line 20
    const/4 v5, 0x1

    .line 21
    if-ne v3, v4, :cond_1

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    const-wide/high16 v2, -0x8000000000000000L

    .line 26
    .line 27
    move-wide v3, v2

    .line 28
    move v2, v5

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    :goto_0
    if-ge v0, v1, :cond_2

    .line 36
    .line 37
    add-int/lit8 v6, v0, 0x1

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/lit8 v0, v0, -0x30

    .line 44
    .line 45
    neg-int v0, v0

    .line 46
    int-to-long v7, v0

    .line 47
    :goto_1
    move v0, v6

    .line 48
    goto :goto_2

    .line 49
    :cond_2
    const-wide/16 v7, 0x0

    .line 50
    .line 51
    :goto_2
    if-ge v0, v1, :cond_7

    .line 52
    .line 53
    add-int/lit8 v6, v0, 0x1

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/16 v9, 0x4c

    .line 60
    .line 61
    if-eq v0, v9, :cond_6

    .line 62
    .line 63
    const/16 v9, 0x53

    .line 64
    .line 65
    if-eq v0, v9, :cond_6

    .line 66
    .line 67
    const/16 v9, 0x42

    .line 68
    .line 69
    if-ne v0, v9, :cond_3

    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_3
    add-int/lit8 v0, v0, -0x30

    .line 73
    .line 74
    const-wide v9, -0xcccccccccccccccL

    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    cmp-long v9, v7, v9

    .line 80
    .line 81
    if-ltz v9, :cond_5

    .line 82
    .line 83
    const-wide/16 v9, 0xa

    .line 84
    .line 85
    mul-long/2addr v7, v9

    .line 86
    int-to-long v9, v0

    .line 87
    add-long v11, v3, v9

    .line 88
    .line 89
    cmp-long v0, v7, v11

    .line 90
    .line 91
    if-ltz v0, :cond_4

    .line 92
    .line 93
    sub-long/2addr v7, v9

    .line 94
    goto :goto_1

    .line 95
    :cond_4
    new-instance v0, Ljava/lang/NumberFormatException;

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-direct {v0, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    throw v0

    .line 105
    :cond_5
    new-instance v0, Ljava/lang/NumberFormatException;

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-direct {v0, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    throw v0

    .line 115
    :cond_6
    :goto_3
    move v0, v6

    .line 116
    :cond_7
    if-eqz v2, :cond_9

    .line 117
    .line 118
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 119
    .line 120
    add-int/2addr v1, v5

    .line 121
    if-le v0, v1, :cond_8

    .line 122
    .line 123
    return-wide v7

    .line 124
    :cond_8
    new-instance v0, Ljava/lang/NumberFormatException;

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-direct {v0, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    throw v0

    .line 134
    :cond_9
    neg-long v0, v7

    .line 135
    return-wide v0
.end method

.method public matchField(J)I
    .locals 0

    .line 116
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final matchField([C)Z
    .locals 3

    .line 1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 8
    .line 9
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 22
    .line 23
    array-length p1, p1

    .line 24
    add-int/2addr v0, p1

    .line 25
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 32
    .line 33
    const/16 v0, 0x7b

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    if-ne p1, v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 39
    .line 40
    .line 41
    const/16 p1, 0xc

    .line 42
    .line 43
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    const/16 v0, 0x5b

    .line 47
    .line 48
    if-ne p1, v0, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 51
    .line 52
    .line 53
    const/16 p1, 0xe

    .line 54
    .line 55
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    const/16 v2, 0x53

    .line 59
    .line 60
    if-ne p1, v2, :cond_4

    .line 61
    .line 62
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 63
    .line 64
    add-int/2addr p1, v1

    .line 65
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    const/16 v2, 0x65

    .line 70
    .line 71
    if-ne p1, v2, :cond_4

    .line 72
    .line 73
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 74
    .line 75
    add-int/lit8 p1, p1, 0x2

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    const/16 v2, 0x74

    .line 82
    .line 83
    if-ne p1, v2, :cond_4

    .line 84
    .line 85
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 86
    .line 87
    add-int/lit8 p1, p1, 0x3

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-ne p1, v0, :cond_4

    .line 94
    .line 95
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 96
    .line 97
    add-int/lit8 p1, p1, 0x3

    .line 98
    .line 99
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 106
    .line 107
    const/16 p1, 0x15

    .line 108
    .line 109
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_4
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    .line 113
    .line 114
    .line 115
    :goto_1
    return v1
.end method

.method public matchField2([C)Z
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public final matchStat()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2
    .line 3
    return p0
.end method

.method public newCollectionByType(Ljava/lang/Class;)Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-class p0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    new-instance p0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    return-object p0

    .line 36
    :catch_0
    move-exception p0

    .line 37
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1, p0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    return-object p0
.end method

.method public abstract next()C
.end method

.method public final nextIdent()V
    .locals 2

    .line 1
    :goto_0
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2
    .line 3
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 14
    .line 15
    const/16 v1, 0x5f

    .line 16
    .line 17
    if-eq v0, v1, :cond_2

    .line 18
    .line 19
    const/16 v1, 0x24

    .line 20
    .line 21
    if-eq v0, v1, :cond_2

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanIdent()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final nextToken()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 3
    .line 4
    :goto_0
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 5
    .line 6
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 7
    .line 8
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 9
    .line 10
    const/16 v1, 0x2f

    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipComment()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/16 v1, 0x22

    .line 19
    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanString()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    const/16 v1, 0x2c

    .line 27
    .line 28
    if-ne v0, v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 31
    .line 32
    .line 33
    const/16 v0, 0x10

    .line 34
    .line 35
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    const/16 v1, 0x30

    .line 39
    .line 40
    if-lt v0, v1, :cond_3

    .line 41
    .line 42
    const/16 v1, 0x39

    .line 43
    .line 44
    if-gt v0, v1, :cond_3

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNumber()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    const/16 v1, 0x2d

    .line 51
    .line 52
    if-ne v0, v1, :cond_4

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNumber()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_4
    sparse-switch v0, :sswitch_data_0

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEOF()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_6

    .line 66
    .line 67
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 68
    .line 69
    const/16 v1, 0x14

    .line 70
    .line 71
    if-eq v0, v1, :cond_5

    .line 72
    .line 73
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 74
    .line 75
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 76
    .line 77
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 78
    .line 79
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->eofPos:I

    .line 80
    .line 81
    return-void

    .line 82
    :cond_5
    const-string p0, "EOF error"

    .line 83
    .line 84
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_6
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 89
    .line 90
    const/16 v1, 0x1f

    .line 91
    .line 92
    if-le v0, v1, :cond_8

    .line 93
    .line 94
    const/16 v1, 0x7f

    .line 95
    .line 96
    if-ne v0, v1, :cond_7

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_7
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v1, "illegal.char"

    .line 108
    .line 109
    invoke-virtual {p0, v1, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->lexError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_8
    :goto_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :sswitch_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 121
    .line 122
    .line 123
    const/16 v0, 0xd

    .line 124
    .line 125
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 126
    .line 127
    return-void

    .line 128
    :sswitch_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 129
    .line 130
    .line 131
    const/16 v0, 0xc

    .line 132
    .line 133
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 134
    .line 135
    return-void

    .line 136
    :sswitch_2
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanHex()V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :sswitch_3
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanTrue()V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :sswitch_4
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNullOrNew()V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :sswitch_5
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFalse()V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :sswitch_6
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 153
    .line 154
    .line 155
    const/16 v0, 0xf

    .line 156
    .line 157
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 158
    .line 159
    return-void

    .line 160
    :sswitch_7
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 161
    .line 162
    .line 163
    const/16 v0, 0xe

    .line 164
    .line 165
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 166
    .line 167
    return-void

    .line 168
    :sswitch_8
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanIdent()V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :sswitch_9
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 173
    .line 174
    .line 175
    const/16 v0, 0x18

    .line 176
    .line 177
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 178
    .line 179
    return-void

    .line 180
    :sswitch_a
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 181
    .line 182
    .line 183
    const/16 v0, 0x11

    .line 184
    .line 185
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 186
    .line 187
    return-void

    .line 188
    :sswitch_b
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 189
    .line 190
    .line 191
    const/16 v0, 0x19

    .line 192
    .line 193
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 194
    .line 195
    return-void

    .line 196
    :sswitch_c
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 197
    .line 198
    .line 199
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNumber()V

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :sswitch_d
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 204
    .line 205
    .line 206
    const/16 v0, 0xb

    .line 207
    .line 208
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 209
    .line 210
    return-void

    .line 211
    :sswitch_e
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 212
    .line 213
    .line 214
    const/16 v0, 0xa

    .line 215
    .line 216
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 217
    .line 218
    return-void

    .line 219
    :sswitch_f
    sget-object v0, Lcom/alibaba/fastjson/parser/Feature;->AllowSingleQuotes:Lcom/alibaba/fastjson/parser/Feature;

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-eqz v0, :cond_9

    .line 226
    .line 227
    invoke-direct {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanStringSingleQuote()V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_9
    const-string p0, "Feature.AllowSingleQuotes is false"

    .line 232
    .line 233
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :sswitch_10
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 238
    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    nop

    .line 243
    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_10
        0x9 -> :sswitch_10
        0xa -> :sswitch_10
        0xc -> :sswitch_10
        0xd -> :sswitch_10
        0x20 -> :sswitch_10
        0x27 -> :sswitch_f
        0x28 -> :sswitch_e
        0x29 -> :sswitch_d
        0x2b -> :sswitch_c
        0x2e -> :sswitch_b
        0x3a -> :sswitch_a
        0x3b -> :sswitch_9
        0x4e -> :sswitch_8
        0x53 -> :sswitch_8
        0x54 -> :sswitch_8
        0x5b -> :sswitch_7
        0x5d -> :sswitch_6
        0x66 -> :sswitch_5
        0x6e -> :sswitch_4
        0x74 -> :sswitch_3
        0x75 -> :sswitch_8
        0x78 -> :sswitch_2
        0x7b -> :sswitch_1
        0x7d -> :sswitch_0
    .end sparse-switch
.end method

.method public final nextToken(I)V
    .locals 10

    const/4 v0, 0x0

    .line 243
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    :goto_0
    const/4 v1, 0x2

    const/16 v2, 0x39

    const/16 v3, 0x30

    const/16 v4, 0x22

    const/16 v5, 0xd

    const/16 v6, 0x7b

    const/16 v7, 0xe

    const/16 v8, 0x5b

    const/16 v9, 0xc

    if-eq p1, v1, :cond_d

    const/4 v1, 0x4

    if-eq p1, v1, :cond_9

    if-eq p1, v9, :cond_7

    const/16 v1, 0x12

    if-eq p1, v1, :cond_6

    const/16 v1, 0x1a

    const/16 v2, 0x14

    if-eq p1, v2, :cond_5

    const/16 v3, 0xf

    const/16 v4, 0x5d

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_1

    .line 244
    :pswitch_0
    iget-char v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v7, 0x2c

    if-ne v6, v7, :cond_0

    const/16 p1, 0x10

    .line 245
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 246
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    return-void

    :cond_0
    const/16 v7, 0x7d

    if-ne v6, v7, :cond_1

    .line 247
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 248
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    return-void

    :cond_1
    if-ne v6, v4, :cond_2

    .line 249
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 250
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    return-void

    :cond_2
    if-ne v6, v1, :cond_3

    .line 251
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    return-void

    :cond_3
    const/16 v1, 0x6e

    if-ne v6, v1, :cond_11

    .line 252
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNullOrNew(Z)V

    return-void

    .line 253
    :pswitch_1
    iget-char v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v6, v4, :cond_5

    .line 254
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 255
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    return-void

    .line 256
    :pswitch_2
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v1, v8, :cond_4

    .line 257
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 258
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    return-void

    :cond_4
    if-ne v1, v6, :cond_11

    .line 259
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 260
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    return-void

    .line 261
    :cond_5
    iget-char v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v3, v1, :cond_11

    .line 262
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    return-void

    .line 263
    :cond_6
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextIdent()V

    return-void

    .line 264
    :cond_7
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v1, v6, :cond_8

    .line 265
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 266
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    return-void

    :cond_8
    if-ne v1, v8, :cond_11

    .line 267
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 268
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    return-void

    .line 269
    :cond_9
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v1, v4, :cond_a

    .line 270
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 271
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanString()V

    return-void

    :cond_a
    if-lt v1, v3, :cond_b

    if-gt v1, v2, :cond_b

    .line 272
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 273
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNumber()V

    return-void

    :cond_b
    if-ne v1, v8, :cond_c

    .line 274
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 275
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    return-void

    :cond_c
    if-ne v1, v6, :cond_11

    .line 276
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 277
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    return-void

    .line 278
    :cond_d
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-lt v1, v3, :cond_e

    if-gt v1, v2, :cond_e

    .line 279
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 280
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNumber()V

    return-void

    :cond_e
    if-ne v1, v4, :cond_f

    .line 281
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 282
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanString()V

    return-void

    :cond_f
    if-ne v1, v8, :cond_10

    .line 283
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 284
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    return-void

    :cond_10
    if-ne v1, v6, :cond_11

    .line 285
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 286
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    return-void

    .line 287
    :cond_11
    :goto_1
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v2, 0x20

    if-eq v1, v2, :cond_13

    const/16 v2, 0xa

    if-eq v1, v2, :cond_13

    if-eq v1, v5, :cond_13

    const/16 v2, 0x9

    if-eq v1, v2, :cond_13

    if-eq v1, v9, :cond_13

    const/16 v2, 0x8

    if-ne v1, v2, :cond_12

    goto :goto_2

    .line 288
    :cond_12
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    return-void

    .line 289
    :cond_13
    :goto_2
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final nextTokenWithChar(C)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 3
    .line 4
    :goto_0
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 5
    .line 6
    if-ne v0, p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/16 v1, 0x20

    .line 16
    .line 17
    if-eq v0, v1, :cond_2

    .line 18
    .line 19
    const/16 v1, 0xa

    .line 20
    .line 21
    if-eq v0, v1, :cond_2

    .line 22
    .line 23
    const/16 v1, 0xd

    .line 24
    .line 25
    if-eq v0, v1, :cond_2

    .line 26
    .line 27
    const/16 v1, 0x9

    .line 28
    .line 29
    if-eq v0, v1, :cond_2

    .line 30
    .line 31
    const/16 v1, 0xc

    .line 32
    .line 33
    if-eq v0, v1, :cond_2

    .line 34
    .line 35
    const/16 v1, 0x8

    .line 36
    .line 37
    if-ne v0, v1, :cond_1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    .line 41
    .line 42
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->info()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance v2, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v3, "not match "

    .line 51
    .line 52
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p1, " - "

    .line 59
    .line 60
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p1, ", info : "

    .line 67
    .line 68
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    throw v0

    .line 82
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 83
    .line 84
    .line 85
    goto :goto_0
.end method

.method public final nextTokenWithColon()V
    .locals 1

    .line 1
    const/16 v0, 0x3a

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextTokenWithChar(C)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final nextTokenWithColon(I)V
    .locals 0

    const/16 p1, 0x3a

    .line 7
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextTokenWithChar(C)V

    return-void
.end method

.method public abstract numberString()Ljava/lang/String;
.end method

.method public final pos()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 2
    .line 3
    return p0
.end method

.method public final putChar(C)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    if-ne v0, v2, :cond_0

    .line 7
    .line 8
    array-length v0, v1

    .line 9
    mul-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    new-array v0, v0, [C

    .line 12
    .line 13
    array-length v2, v1

    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 21
    .line 22
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 23
    .line 24
    add-int/lit8 v2, v1, 0x1

    .line 25
    .line 26
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 27
    .line 28
    aput-char p1, v0, v1

    .line 29
    .line 30
    return-void
.end method

.method public final resetStringPosition()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 3
    .line 4
    return-void
.end method

.method public scanBoolean(C)Z
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/16 v2, 0x74

    .line 11
    .line 12
    const/4 v3, 0x5

    .line 13
    const/16 v4, 0x65

    .line 14
    .line 15
    const/4 v5, -0x1

    .line 16
    const/4 v6, 0x3

    .line 17
    const/4 v7, 0x2

    .line 18
    const/4 v8, 0x1

    .line 19
    if-ne v1, v2, :cond_1

    .line 20
    .line 21
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 22
    .line 23
    add-int/2addr v1, v8

    .line 24
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/16 v2, 0x72

    .line 29
    .line 30
    if-ne v1, v2, :cond_0

    .line 31
    .line 32
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 33
    .line 34
    add-int/2addr v1, v7

    .line 35
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/16 v2, 0x75

    .line 40
    .line 41
    if-ne v1, v2, :cond_0

    .line 42
    .line 43
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 44
    .line 45
    add-int/2addr v1, v6

    .line 46
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-ne v1, v4, :cond_0

    .line 51
    .line 52
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 53
    .line 54
    add-int/lit8 v0, v0, 0x4

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    :goto_0
    move v0, v8

    .line 61
    goto :goto_1

    .line 62
    :cond_0
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 63
    .line 64
    return v0

    .line 65
    :cond_1
    const/16 v2, 0x66

    .line 66
    .line 67
    if-ne v1, v2, :cond_3

    .line 68
    .line 69
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 70
    .line 71
    add-int/2addr v1, v8

    .line 72
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    const/16 v2, 0x61

    .line 77
    .line 78
    if-ne v1, v2, :cond_2

    .line 79
    .line 80
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 81
    .line 82
    add-int/2addr v1, v7

    .line 83
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    const/16 v2, 0x6c

    .line 88
    .line 89
    if-ne v1, v2, :cond_2

    .line 90
    .line 91
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 92
    .line 93
    add-int/2addr v1, v6

    .line 94
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    const/16 v2, 0x73

    .line 99
    .line 100
    if-ne v1, v2, :cond_2

    .line 101
    .line 102
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 103
    .line 104
    add-int/lit8 v1, v1, 0x4

    .line 105
    .line 106
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-ne v1, v4, :cond_2

    .line 111
    .line 112
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 113
    .line 114
    add-int/2addr v1, v3

    .line 115
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    const/4 v3, 0x6

    .line 120
    goto :goto_1

    .line 121
    :cond_2
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 122
    .line 123
    return v0

    .line 124
    :cond_3
    const/16 v2, 0x31

    .line 125
    .line 126
    if-ne v1, v2, :cond_4

    .line 127
    .line 128
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 129
    .line 130
    add-int/2addr v0, v8

    .line 131
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    move v3, v7

    .line 136
    goto :goto_0

    .line 137
    :cond_4
    const/16 v2, 0x30

    .line 138
    .line 139
    if-ne v1, v2, :cond_5

    .line 140
    .line 141
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 142
    .line 143
    add-int/2addr v1, v8

    .line 144
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    move v3, v7

    .line 149
    goto :goto_1

    .line 150
    :cond_5
    move v3, v8

    .line 151
    :goto_1
    if-ne v1, p1, :cond_6

    .line 152
    .line 153
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 154
    .line 155
    add-int/2addr p1, v3

    .line 156
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 157
    .line 158
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 163
    .line 164
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 165
    .line 166
    return v0

    .line 167
    :cond_6
    invoke-static {v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_7

    .line 172
    .line 173
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 174
    .line 175
    add-int/lit8 v2, v3, 0x1

    .line 176
    .line 177
    add-int/2addr v1, v3

    .line 178
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    move v3, v2

    .line 183
    goto :goto_1

    .line 184
    :cond_7
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 185
    .line 186
    return v0
.end method

.method public scanDate(C)Ljava/util/Date;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 7
    .line 8
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x4

    .line 13
    const/4 v4, 0x3

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v6, -0x1

    .line 16
    const/4 v7, 0x1

    .line 17
    const/16 v8, 0x22

    .line 18
    .line 19
    if-ne v2, v8, :cond_5

    .line 20
    .line 21
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 22
    .line 23
    add-int/2addr v2, v7

    .line 24
    invoke-virtual {v0, v8, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eq v2, v6, :cond_4

    .line 29
    .line 30
    iget v9, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 31
    .line 32
    add-int/2addr v9, v7

    .line 33
    sub-int v10, v2, v9

    .line 34
    .line 35
    invoke-virtual {v0, v9, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v9

    .line 39
    const/16 v10, 0x5c

    .line 40
    .line 41
    invoke-virtual {v9, v10}, Ljava/lang/String;->indexOf(I)I

    .line 42
    .line 43
    .line 44
    move-result v11

    .line 45
    if-eq v11, v6, :cond_2

    .line 46
    .line 47
    :goto_0
    add-int/lit8 v9, v2, -0x1

    .line 48
    .line 49
    move v11, v1

    .line 50
    :goto_1
    if-ltz v9, :cond_0

    .line 51
    .line 52
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 53
    .line 54
    .line 55
    move-result v12

    .line 56
    if-ne v12, v10, :cond_0

    .line 57
    .line 58
    add-int/lit8 v11, v11, 0x1

    .line 59
    .line 60
    add-int/lit8 v9, v9, -0x1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_0
    rem-int/lit8 v11, v11, 0x2

    .line 64
    .line 65
    if-nez v11, :cond_1

    .line 66
    .line 67
    iget v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 68
    .line 69
    add-int/lit8 v9, v8, 0x1

    .line 70
    .line 71
    sub-int v9, v2, v9

    .line 72
    .line 73
    add-int/2addr v8, v7

    .line 74
    invoke-virtual {v0, v8, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sub_chars(II)[C

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    invoke-static {v7, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->readString([CI)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v9

    .line 82
    goto :goto_2

    .line 83
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 84
    .line 85
    invoke-virtual {v0, v8, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    goto :goto_0

    .line 90
    :cond_2
    :goto_2
    iget v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 91
    .line 92
    add-int/lit8 v8, v7, 0x1

    .line 93
    .line 94
    sub-int/2addr v2, v8

    .line 95
    add-int/lit8 v8, v2, 0x2

    .line 96
    .line 97
    add-int/2addr v2, v4

    .line 98
    add-int/2addr v7, v8

    .line 99
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    new-instance v8, Lcom/alibaba/fastjson/parser/JSONScanner;

    .line 104
    .line 105
    invoke-direct {v8, v9}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :try_start_0
    invoke-virtual {v8, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(Z)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_3

    .line 113
    .line 114
    invoke-virtual {v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCalendar()Ljava/util/Calendar;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 119
    .line 120
    .line 121
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 122
    invoke-virtual {v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 123
    .line 124
    .line 125
    goto/16 :goto_7

    .line 126
    .line 127
    :catchall_0
    move-exception v0

    .line 128
    goto :goto_3

    .line 129
    :cond_3
    :try_start_1
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 130
    .line 131
    invoke-virtual {v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 132
    .line 133
    .line 134
    return-object v5

    .line 135
    :goto_3
    invoke-virtual {v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 136
    .line 137
    .line 138
    throw v0

    .line 139
    :cond_4
    const-string v0, "unclosed str"

    .line 140
    .line 141
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-object v5

    .line 145
    :cond_5
    const/16 v8, 0x2d

    .line 146
    .line 147
    const/16 v9, 0x39

    .line 148
    .line 149
    const/4 v10, 0x2

    .line 150
    const/16 v11, 0x30

    .line 151
    .line 152
    if-eq v2, v8, :cond_8

    .line 153
    .line 154
    if-lt v2, v11, :cond_6

    .line 155
    .line 156
    if-gt v2, v9, :cond_6

    .line 157
    .line 158
    goto :goto_4

    .line 159
    :cond_6
    const/16 v1, 0x6e

    .line 160
    .line 161
    if-ne v2, v1, :cond_7

    .line 162
    .line 163
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 164
    .line 165
    add-int/2addr v1, v7

    .line 166
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    const/16 v2, 0x75

    .line 171
    .line 172
    if-ne v1, v2, :cond_7

    .line 173
    .line 174
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 175
    .line 176
    add-int/2addr v1, v10

    .line 177
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    const/16 v2, 0x6c

    .line 182
    .line 183
    if-ne v1, v2, :cond_7

    .line 184
    .line 185
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 186
    .line 187
    add-int/2addr v1, v4

    .line 188
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    if-ne v1, v2, :cond_7

    .line 193
    .line 194
    const/4 v2, 0x5

    .line 195
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 196
    .line 197
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 198
    .line 199
    add-int/2addr v1, v3

    .line 200
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 201
    .line 202
    .line 203
    move-result v7

    .line 204
    move-object v1, v5

    .line 205
    goto :goto_7

    .line 206
    :cond_7
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 207
    .line 208
    return-object v5

    .line 209
    :cond_8
    :goto_4
    if-ne v2, v8, :cond_9

    .line 210
    .line 211
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 212
    .line 213
    add-int/2addr v1, v7

    .line 214
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    move v1, v7

    .line 219
    move v7, v10

    .line 220
    :cond_9
    const-wide/16 v12, 0x0

    .line 221
    .line 222
    if-lt v2, v11, :cond_b

    .line 223
    .line 224
    if-gt v2, v9, :cond_b

    .line 225
    .line 226
    add-int/lit8 v2, v2, -0x30

    .line 227
    .line 228
    int-to-long v14, v2

    .line 229
    :goto_5
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 230
    .line 231
    add-int/lit8 v8, v7, 0x1

    .line 232
    .line 233
    add-int/2addr v2, v7

    .line 234
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    if-lt v2, v11, :cond_a

    .line 239
    .line 240
    if-gt v2, v9, :cond_a

    .line 241
    .line 242
    const-wide/16 v16, 0xa

    .line 243
    .line 244
    mul-long v14, v14, v16

    .line 245
    .line 246
    add-int/lit8 v2, v2, -0x30

    .line 247
    .line 248
    int-to-long v9, v2

    .line 249
    add-long/2addr v14, v9

    .line 250
    move v7, v8

    .line 251
    const/16 v9, 0x39

    .line 252
    .line 253
    goto :goto_5

    .line 254
    :cond_a
    move v7, v2

    .line 255
    move v2, v8

    .line 256
    goto :goto_6

    .line 257
    :cond_b
    move v14, v7

    .line 258
    move v7, v2

    .line 259
    move v2, v14

    .line 260
    move-wide v14, v12

    .line 261
    :goto_6
    cmp-long v8, v14, v12

    .line 262
    .line 263
    if-gez v8, :cond_c

    .line 264
    .line 265
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 266
    .line 267
    return-object v5

    .line 268
    :cond_c
    if-eqz v1, :cond_d

    .line 269
    .line 270
    neg-long v14, v14

    .line 271
    :cond_d
    new-instance v1, Ljava/util/Date;

    .line 272
    .line 273
    invoke-direct {v1, v14, v15}, Ljava/util/Date;-><init>(J)V

    .line 274
    .line 275
    .line 276
    :goto_7
    const/16 v8, 0x10

    .line 277
    .line 278
    const/16 v9, 0x2c

    .line 279
    .line 280
    if-ne v7, v9, :cond_e

    .line 281
    .line 282
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 283
    .line 284
    add-int/2addr v3, v2

    .line 285
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 286
    .line 287
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 288
    .line 289
    .line 290
    move-result v2

    .line 291
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 292
    .line 293
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 294
    .line 295
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 296
    .line 297
    return-object v1

    .line 298
    :cond_e
    const/16 v4, 0x5d

    .line 299
    .line 300
    if-ne v7, v4, :cond_13

    .line 301
    .line 302
    iget v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 303
    .line 304
    add-int/lit8 v10, v2, 0x1

    .line 305
    .line 306
    add-int/2addr v7, v2

    .line 307
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 308
    .line 309
    .line 310
    move-result v7

    .line 311
    if-ne v7, v9, :cond_f

    .line 312
    .line 313
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 314
    .line 315
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 316
    .line 317
    add-int/2addr v2, v10

    .line 318
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 319
    .line 320
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 321
    .line 322
    .line 323
    move-result v2

    .line 324
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 325
    .line 326
    goto :goto_8

    .line 327
    :cond_f
    if-ne v7, v4, :cond_10

    .line 328
    .line 329
    const/16 v2, 0xf

    .line 330
    .line 331
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 332
    .line 333
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 334
    .line 335
    add-int/2addr v2, v10

    .line 336
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 337
    .line 338
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 339
    .line 340
    .line 341
    move-result v2

    .line 342
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 343
    .line 344
    goto :goto_8

    .line 345
    :cond_10
    const/16 v4, 0x7d

    .line 346
    .line 347
    if-ne v7, v4, :cond_11

    .line 348
    .line 349
    const/16 v2, 0xd

    .line 350
    .line 351
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 352
    .line 353
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 354
    .line 355
    add-int/2addr v2, v10

    .line 356
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 357
    .line 358
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 359
    .line 360
    .line 361
    move-result v2

    .line 362
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 363
    .line 364
    goto :goto_8

    .line 365
    :cond_11
    const/16 v4, 0x1a

    .line 366
    .line 367
    if-ne v7, v4, :cond_12

    .line 368
    .line 369
    const/16 v5, 0x14

    .line 370
    .line 371
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 372
    .line 373
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 374
    .line 375
    add-int/2addr v5, v2

    .line 376
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 377
    .line 378
    iput-char v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 379
    .line 380
    :goto_8
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 381
    .line 382
    return-object v1

    .line 383
    :cond_12
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 384
    .line 385
    return-object v5

    .line 386
    :cond_13
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 387
    .line 388
    return-object v5
.end method

.method public scanDecimal(C)Ljava/math/BigDecimal;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 7
    .line 8
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x1

    .line 13
    const/16 v4, 0x22

    .line 14
    .line 15
    if-ne v2, v4, :cond_0

    .line 16
    .line 17
    move v1, v3

    .line 18
    :cond_0
    const/4 v5, 0x2

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 22
    .line 23
    add-int/2addr v2, v3

    .line 24
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    move v6, v5

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move v6, v3

    .line 31
    :goto_0
    const/16 v7, 0x2d

    .line 32
    .line 33
    if-ne v2, v7, :cond_2

    .line 34
    .line 35
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 36
    .line 37
    add-int/lit8 v8, v6, 0x1

    .line 38
    .line 39
    add-int/2addr v2, v6

    .line 40
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    move v6, v8

    .line 45
    :cond_2
    const/16 v8, 0xd

    .line 46
    .line 47
    const/16 v9, 0x7d

    .line 48
    .line 49
    const/16 v10, 0x10

    .line 50
    .line 51
    const/16 v11, 0x2c

    .line 52
    .line 53
    const/16 v12, 0x30

    .line 54
    .line 55
    const/4 v13, -0x1

    .line 56
    const/4 v14, 0x0

    .line 57
    if-lt v2, v12, :cond_12

    .line 58
    .line 59
    const/16 v15, 0x39

    .line 60
    .line 61
    if-gt v2, v15, :cond_12

    .line 62
    .line 63
    :goto_1
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 64
    .line 65
    add-int/lit8 v16, v6, 0x1

    .line 66
    .line 67
    add-int/2addr v2, v6

    .line 68
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-lt v2, v12, :cond_3

    .line 73
    .line 74
    if-gt v2, v15, :cond_3

    .line 75
    .line 76
    move/from16 v6, v16

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_3
    move/from16 p1, v3

    .line 80
    .line 81
    const/16 v3, 0x2e

    .line 82
    .line 83
    if-ne v2, v3, :cond_5

    .line 84
    .line 85
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 86
    .line 87
    add-int/2addr v6, v5

    .line 88
    add-int v2, v2, v16

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-lt v2, v12, :cond_4

    .line 95
    .line 96
    if-gt v2, v15, :cond_4

    .line 97
    .line 98
    :goto_2
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 99
    .line 100
    add-int/lit8 v16, v6, 0x1

    .line 101
    .line 102
    add-int/2addr v2, v6

    .line 103
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-lt v2, v12, :cond_5

    .line 108
    .line 109
    if-gt v2, v15, :cond_5

    .line 110
    .line 111
    move/from16 v6, v16

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_4
    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 115
    .line 116
    return-object v14

    .line 117
    :cond_5
    const/16 v3, 0x65

    .line 118
    .line 119
    if-eq v2, v3, :cond_6

    .line 120
    .line 121
    const/16 v3, 0x45

    .line 122
    .line 123
    if-ne v2, v3, :cond_9

    .line 124
    .line 125
    :cond_6
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 126
    .line 127
    add-int/lit8 v3, v16, 0x1

    .line 128
    .line 129
    add-int v2, v2, v16

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    const/16 v6, 0x2b

    .line 136
    .line 137
    if-eq v2, v6, :cond_8

    .line 138
    .line 139
    if-ne v2, v7, :cond_7

    .line 140
    .line 141
    goto :goto_4

    .line 142
    :cond_7
    :goto_3
    move/from16 v16, v3

    .line 143
    .line 144
    goto :goto_5

    .line 145
    :cond_8
    :goto_4
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 146
    .line 147
    add-int/lit8 v16, v16, 0x2

    .line 148
    .line 149
    add-int/2addr v2, v3

    .line 150
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    :goto_5
    if-lt v2, v12, :cond_9

    .line 155
    .line 156
    if-gt v2, v15, :cond_9

    .line 157
    .line 158
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 159
    .line 160
    add-int/lit8 v3, v16, 0x1

    .line 161
    .line 162
    add-int v2, v2, v16

    .line 163
    .line 164
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    goto :goto_3

    .line 169
    :cond_9
    if-eqz v1, :cond_b

    .line 170
    .line 171
    if-eq v2, v4, :cond_a

    .line 172
    .line 173
    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 174
    .line 175
    return-object v14

    .line 176
    :cond_a
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 177
    .line 178
    add-int/lit8 v2, v16, 0x1

    .line 179
    .line 180
    add-int v1, v1, v16

    .line 181
    .line 182
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 187
    .line 188
    add-int/lit8 v4, v3, 0x1

    .line 189
    .line 190
    add-int/2addr v3, v2

    .line 191
    sub-int/2addr v3, v4

    .line 192
    sub-int/2addr v3, v5

    .line 193
    move/from16 v16, v2

    .line 194
    .line 195
    move v2, v1

    .line 196
    goto :goto_6

    .line 197
    :cond_b
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 198
    .line 199
    add-int v1, v4, v16

    .line 200
    .line 201
    sub-int/2addr v1, v4

    .line 202
    add-int/lit8 v3, v1, -0x1

    .line 203
    .line 204
    :goto_6
    invoke-virtual {v0, v4, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sub_chars(II)[C

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    new-instance v3, Ljava/math/BigDecimal;

    .line 209
    .line 210
    invoke-direct {v3, v1}, Ljava/math/BigDecimal;-><init>([C)V

    .line 211
    .line 212
    .line 213
    if-ne v2, v11, :cond_c

    .line 214
    .line 215
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 216
    .line 217
    add-int v1, v1, v16

    .line 218
    .line 219
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 220
    .line 221
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 226
    .line 227
    const/4 v1, 0x3

    .line 228
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 229
    .line 230
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 231
    .line 232
    return-object v3

    .line 233
    :cond_c
    const/16 v1, 0x5d

    .line 234
    .line 235
    if-ne v2, v1, :cond_11

    .line 236
    .line 237
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 238
    .line 239
    add-int/lit8 v4, v16, 0x1

    .line 240
    .line 241
    add-int v2, v2, v16

    .line 242
    .line 243
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    if-ne v2, v11, :cond_d

    .line 248
    .line 249
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 250
    .line 251
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 252
    .line 253
    add-int/2addr v1, v4

    .line 254
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 255
    .line 256
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 261
    .line 262
    goto :goto_7

    .line 263
    :cond_d
    if-ne v2, v1, :cond_e

    .line 264
    .line 265
    const/16 v1, 0xf

    .line 266
    .line 267
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 268
    .line 269
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 270
    .line 271
    add-int/2addr v1, v4

    .line 272
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 273
    .line 274
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 275
    .line 276
    .line 277
    move-result v1

    .line 278
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 279
    .line 280
    goto :goto_7

    .line 281
    :cond_e
    if-ne v2, v9, :cond_f

    .line 282
    .line 283
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 284
    .line 285
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 286
    .line 287
    add-int/2addr v1, v4

    .line 288
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 289
    .line 290
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 295
    .line 296
    goto :goto_7

    .line 297
    :cond_f
    const/16 v1, 0x1a

    .line 298
    .line 299
    if-ne v2, v1, :cond_10

    .line 300
    .line 301
    const/16 v2, 0x14

    .line 302
    .line 303
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 304
    .line 305
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 306
    .line 307
    add-int v2, v2, v16

    .line 308
    .line 309
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 310
    .line 311
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 312
    .line 313
    :goto_7
    const/4 v1, 0x4

    .line 314
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 315
    .line 316
    return-object v3

    .line 317
    :cond_10
    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 318
    .line 319
    return-object v14

    .line 320
    :cond_11
    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 321
    .line 322
    return-object v14

    .line 323
    :cond_12
    move/from16 p1, v3

    .line 324
    .line 325
    const/16 v3, 0x6e

    .line 326
    .line 327
    if-ne v2, v3, :cond_17

    .line 328
    .line 329
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 330
    .line 331
    add-int/2addr v2, v6

    .line 332
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 333
    .line 334
    .line 335
    move-result v2

    .line 336
    const/16 v3, 0x75

    .line 337
    .line 338
    if-ne v2, v3, :cond_17

    .line 339
    .line 340
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 341
    .line 342
    add-int/2addr v2, v6

    .line 343
    add-int/lit8 v2, v2, 0x1

    .line 344
    .line 345
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 346
    .line 347
    .line 348
    move-result v2

    .line 349
    const/16 v3, 0x6c

    .line 350
    .line 351
    if-ne v2, v3, :cond_17

    .line 352
    .line 353
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 354
    .line 355
    add-int/2addr v2, v6

    .line 356
    add-int/2addr v2, v5

    .line 357
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 358
    .line 359
    .line 360
    move-result v2

    .line 361
    if-ne v2, v3, :cond_17

    .line 362
    .line 363
    const/4 v2, 0x5

    .line 364
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 365
    .line 366
    add-int/lit8 v3, v6, 0x3

    .line 367
    .line 368
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 369
    .line 370
    add-int/lit8 v7, v6, 0x4

    .line 371
    .line 372
    add-int/2addr v5, v3

    .line 373
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 374
    .line 375
    .line 376
    move-result v3

    .line 377
    if-eqz v1, :cond_13

    .line 378
    .line 379
    if-ne v3, v4, :cond_13

    .line 380
    .line 381
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 382
    .line 383
    add-int/2addr v6, v2

    .line 384
    add-int/2addr v1, v7

    .line 385
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 386
    .line 387
    .line 388
    move-result v3

    .line 389
    move v7, v6

    .line 390
    :cond_13
    :goto_8
    if-ne v3, v11, :cond_14

    .line 391
    .line 392
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 393
    .line 394
    add-int/2addr v1, v7

    .line 395
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 396
    .line 397
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 398
    .line 399
    .line 400
    move-result v1

    .line 401
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 402
    .line 403
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 404
    .line 405
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 406
    .line 407
    return-object v14

    .line 408
    :cond_14
    if-ne v3, v9, :cond_15

    .line 409
    .line 410
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 411
    .line 412
    add-int/2addr v1, v7

    .line 413
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 414
    .line 415
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 416
    .line 417
    .line 418
    move-result v1

    .line 419
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 420
    .line 421
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 422
    .line 423
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 424
    .line 425
    return-object v14

    .line 426
    :cond_15
    invoke-static {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 427
    .line 428
    .line 429
    move-result v1

    .line 430
    if-eqz v1, :cond_16

    .line 431
    .line 432
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 433
    .line 434
    add-int/lit8 v3, v7, 0x1

    .line 435
    .line 436
    add-int/2addr v1, v7

    .line 437
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 438
    .line 439
    .line 440
    move-result v1

    .line 441
    move v7, v3

    .line 442
    move v3, v1

    .line 443
    goto :goto_8

    .line 444
    :cond_16
    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 445
    .line 446
    return-object v14

    .line 447
    :cond_17
    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 448
    .line 449
    return-object v14
.end method

.method public scanDouble(C)D
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 7
    .line 8
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x1

    .line 13
    const/16 v4, 0x22

    .line 14
    .line 15
    if-ne v2, v4, :cond_0

    .line 16
    .line 17
    move v5, v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v5, v1

    .line 20
    :goto_0
    if-eqz v5, :cond_1

    .line 21
    .line 22
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 23
    .line 24
    add-int/2addr v2, v3

    .line 25
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v7, 0x2

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v7, v3

    .line 32
    :goto_1
    const/16 v8, 0x2d

    .line 33
    .line 34
    if-ne v2, v8, :cond_2

    .line 35
    .line 36
    move v9, v3

    .line 37
    goto :goto_2

    .line 38
    :cond_2
    move v9, v1

    .line 39
    :goto_2
    if-eqz v9, :cond_3

    .line 40
    .line 41
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 42
    .line 43
    add-int/lit8 v10, v7, 0x1

    .line 44
    .line 45
    add-int/2addr v2, v7

    .line 46
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    move v7, v10

    .line 51
    :cond_3
    const/16 v10, 0x10

    .line 52
    .line 53
    const/4 v13, -0x1

    .line 54
    const/16 v14, 0x30

    .line 55
    .line 56
    if-lt v2, v14, :cond_12

    .line 57
    .line 58
    const/16 v15, 0x39

    .line 59
    .line 60
    if-gt v2, v15, :cond_12

    .line 61
    .line 62
    sub-int/2addr v2, v14

    .line 63
    int-to-long v1, v2

    .line 64
    move/from16 v17, v3

    .line 65
    .line 66
    :goto_3
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 67
    .line 68
    add-int/lit8 v18, v7, 0x1

    .line 69
    .line 70
    add-int/2addr v3, v7

    .line 71
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    const-wide/16 v19, 0xa

    .line 76
    .line 77
    if-lt v3, v14, :cond_4

    .line 78
    .line 79
    if-gt v3, v15, :cond_4

    .line 80
    .line 81
    mul-long v1, v1, v19

    .line 82
    .line 83
    add-int/lit8 v3, v3, -0x30

    .line 84
    .line 85
    const/16 v21, 0x2

    .line 86
    .line 87
    int-to-long v6, v3

    .line 88
    add-long/2addr v1, v6

    .line 89
    move/from16 v7, v18

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_4
    const/16 v21, 0x2

    .line 93
    .line 94
    const/16 v6, 0x2e

    .line 95
    .line 96
    if-ne v3, v6, :cond_6

    .line 97
    .line 98
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 99
    .line 100
    add-int/lit8 v7, v7, 0x2

    .line 101
    .line 102
    add-int v3, v3, v18

    .line 103
    .line 104
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-lt v3, v14, :cond_5

    .line 109
    .line 110
    if-gt v3, v15, :cond_5

    .line 111
    .line 112
    mul-long v1, v1, v19

    .line 113
    .line 114
    sub-int/2addr v3, v14

    .line 115
    const-wide/16 v22, 0x0

    .line 116
    .line 117
    int-to-long v11, v3

    .line 118
    add-long/2addr v1, v11

    .line 119
    move-wide/from16 v11, v19

    .line 120
    .line 121
    :goto_4
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 122
    .line 123
    add-int/lit8 v18, v7, 0x1

    .line 124
    .line 125
    add-int/2addr v3, v7

    .line 126
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    if-lt v3, v14, :cond_7

    .line 131
    .line 132
    if-gt v3, v15, :cond_7

    .line 133
    .line 134
    mul-long v1, v1, v19

    .line 135
    .line 136
    add-int/lit8 v3, v3, -0x30

    .line 137
    .line 138
    int-to-long v6, v3

    .line 139
    add-long/2addr v1, v6

    .line 140
    mul-long v11, v11, v19

    .line 141
    .line 142
    move/from16 v7, v18

    .line 143
    .line 144
    goto :goto_4

    .line 145
    :cond_5
    const-wide/16 v22, 0x0

    .line 146
    .line 147
    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 148
    .line 149
    return-wide v22

    .line 150
    :cond_6
    const-wide/16 v22, 0x0

    .line 151
    .line 152
    const-wide/16 v11, 0x1

    .line 153
    .line 154
    :cond_7
    const/16 v6, 0x65

    .line 155
    .line 156
    if-eq v3, v6, :cond_9

    .line 157
    .line 158
    const/16 v6, 0x45

    .line 159
    .line 160
    if-ne v3, v6, :cond_8

    .line 161
    .line 162
    goto :goto_5

    .line 163
    :cond_8
    const/16 v16, 0x0

    .line 164
    .line 165
    goto :goto_6

    .line 166
    :cond_9
    :goto_5
    move/from16 v16, v17

    .line 167
    .line 168
    :goto_6
    if-eqz v16, :cond_c

    .line 169
    .line 170
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 171
    .line 172
    add-int/lit8 v6, v18, 0x1

    .line 173
    .line 174
    add-int v3, v3, v18

    .line 175
    .line 176
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    const/16 v7, 0x2b

    .line 181
    .line 182
    if-eq v3, v7, :cond_b

    .line 183
    .line 184
    if-ne v3, v8, :cond_a

    .line 185
    .line 186
    goto :goto_8

    .line 187
    :cond_a
    :goto_7
    move/from16 v18, v6

    .line 188
    .line 189
    goto :goto_9

    .line 190
    :cond_b
    :goto_8
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 191
    .line 192
    add-int/lit8 v18, v18, 0x2

    .line 193
    .line 194
    add-int/2addr v3, v6

    .line 195
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    :goto_9
    if-lt v3, v14, :cond_c

    .line 200
    .line 201
    if-gt v3, v15, :cond_c

    .line 202
    .line 203
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 204
    .line 205
    add-int/lit8 v6, v18, 0x1

    .line 206
    .line 207
    add-int v3, v3, v18

    .line 208
    .line 209
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 210
    .line 211
    .line 212
    move-result v3

    .line 213
    goto :goto_7

    .line 214
    :cond_c
    if-eqz v5, :cond_e

    .line 215
    .line 216
    if-eq v3, v4, :cond_d

    .line 217
    .line 218
    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 219
    .line 220
    return-wide v22

    .line 221
    :cond_d
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 222
    .line 223
    add-int/lit8 v4, v18, 0x1

    .line 224
    .line 225
    add-int v3, v3, v18

    .line 226
    .line 227
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 228
    .line 229
    .line 230
    move-result v3

    .line 231
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 232
    .line 233
    add-int/lit8 v6, v5, 0x1

    .line 234
    .line 235
    add-int/2addr v5, v4

    .line 236
    sub-int/2addr v5, v6

    .line 237
    add-int/lit8 v5, v5, -0x2

    .line 238
    .line 239
    move/from16 v18, v4

    .line 240
    .line 241
    goto :goto_a

    .line 242
    :cond_e
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 243
    .line 244
    add-int v4, v6, v18

    .line 245
    .line 246
    sub-int/2addr v4, v6

    .line 247
    add-int/lit8 v5, v4, -0x1

    .line 248
    .line 249
    :goto_a
    if-nez v16, :cond_10

    .line 250
    .line 251
    const/16 v4, 0x11

    .line 252
    .line 253
    if-ge v5, v4, :cond_10

    .line 254
    .line 255
    long-to-double v1, v1

    .line 256
    long-to-double v4, v11

    .line 257
    div-double/2addr v1, v4

    .line 258
    if-eqz v9, :cond_f

    .line 259
    .line 260
    neg-double v1, v1

    .line 261
    :cond_f
    :goto_b
    move/from16 v4, p1

    .line 262
    .line 263
    goto :goto_c

    .line 264
    :cond_10
    invoke-virtual {v0, v6, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 269
    .line 270
    .line 271
    move-result-wide v1

    .line 272
    goto :goto_b

    .line 273
    :goto_c
    if-ne v3, v4, :cond_11

    .line 274
    .line 275
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 276
    .line 277
    add-int v3, v3, v18

    .line 278
    .line 279
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 280
    .line 281
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 282
    .line 283
    .line 284
    move-result v3

    .line 285
    iput-char v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 286
    .line 287
    const/4 v3, 0x3

    .line 288
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 289
    .line 290
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 291
    .line 292
    return-wide v1

    .line 293
    :cond_11
    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 294
    .line 295
    return-wide v1

    .line 296
    :cond_12
    move/from16 v17, v3

    .line 297
    .line 298
    const/16 v21, 0x2

    .line 299
    .line 300
    const-wide/16 v22, 0x0

    .line 301
    .line 302
    const/16 v1, 0x6e

    .line 303
    .line 304
    if-ne v2, v1, :cond_17

    .line 305
    .line 306
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 307
    .line 308
    add-int/2addr v1, v7

    .line 309
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 310
    .line 311
    .line 312
    move-result v1

    .line 313
    const/16 v2, 0x75

    .line 314
    .line 315
    if-ne v1, v2, :cond_17

    .line 316
    .line 317
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 318
    .line 319
    add-int/2addr v1, v7

    .line 320
    add-int/lit8 v1, v1, 0x1

    .line 321
    .line 322
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 323
    .line 324
    .line 325
    move-result v1

    .line 326
    const/16 v2, 0x6c

    .line 327
    .line 328
    if-ne v1, v2, :cond_17

    .line 329
    .line 330
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 331
    .line 332
    add-int/2addr v1, v7

    .line 333
    add-int/lit8 v1, v1, 0x2

    .line 334
    .line 335
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 336
    .line 337
    .line 338
    move-result v1

    .line 339
    if-ne v1, v2, :cond_17

    .line 340
    .line 341
    const/4 v1, 0x5

    .line 342
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 343
    .line 344
    add-int/lit8 v2, v7, 0x3

    .line 345
    .line 346
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 347
    .line 348
    add-int/lit8 v6, v7, 0x4

    .line 349
    .line 350
    add-int/2addr v3, v2

    .line 351
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 352
    .line 353
    .line 354
    move-result v2

    .line 355
    if-eqz v5, :cond_13

    .line 356
    .line 357
    if-ne v2, v4, :cond_13

    .line 358
    .line 359
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 360
    .line 361
    add-int/2addr v7, v1

    .line 362
    add-int/2addr v2, v6

    .line 363
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 364
    .line 365
    .line 366
    move-result v2

    .line 367
    move v6, v7

    .line 368
    :cond_13
    :goto_d
    const/16 v3, 0x2c

    .line 369
    .line 370
    if-ne v2, v3, :cond_14

    .line 371
    .line 372
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 373
    .line 374
    add-int/2addr v2, v6

    .line 375
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 376
    .line 377
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 378
    .line 379
    .line 380
    move-result v2

    .line 381
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 382
    .line 383
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 384
    .line 385
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 386
    .line 387
    return-wide v22

    .line 388
    :cond_14
    const/16 v3, 0x5d

    .line 389
    .line 390
    if-ne v2, v3, :cond_15

    .line 391
    .line 392
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 393
    .line 394
    add-int/2addr v2, v6

    .line 395
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 396
    .line 397
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 398
    .line 399
    .line 400
    move-result v2

    .line 401
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 402
    .line 403
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 404
    .line 405
    const/16 v1, 0xf

    .line 406
    .line 407
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 408
    .line 409
    return-wide v22

    .line 410
    :cond_15
    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 411
    .line 412
    .line 413
    move-result v2

    .line 414
    if-eqz v2, :cond_16

    .line 415
    .line 416
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 417
    .line 418
    add-int/lit8 v3, v6, 0x1

    .line 419
    .line 420
    add-int/2addr v2, v6

    .line 421
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 422
    .line 423
    .line 424
    move-result v2

    .line 425
    move v6, v3

    .line 426
    goto :goto_d

    .line 427
    :cond_16
    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 428
    .line 429
    return-wide v22

    .line 430
    :cond_17
    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 431
    .line 432
    return-wide v22
.end method

.method public scanEnum(Ljava/lang/Class;Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/Enum;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/alibaba/fastjson/parser/SymbolTable;",
            "C)",
            "Ljava/lang/Enum<",
            "*>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2, p3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanSymbolWithSeperator(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {p1, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public scanEnumSymbol([C)J
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const-wide/16 v1, 0x0

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/4 p1, -0x2

    .line 13
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 14
    .line 15
    return-wide v1

    .line 16
    :cond_0
    array-length p1, p1

    .line 17
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 18
    .line 19
    add-int/lit8 v3, p1, 0x1

    .line 20
    .line 21
    add-int/2addr v0, p1

    .line 22
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/16 v0, 0x22

    .line 27
    .line 28
    const/4 v4, -0x1

    .line 29
    if-eq p1, v0, :cond_1

    .line 30
    .line 31
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 32
    .line 33
    return-wide v1

    .line 34
    :cond_1
    const-wide v5, -0x340d631b7bdddcdbL    # -7.302176725335867E57

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    :goto_0
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 40
    .line 41
    add-int/lit8 v7, v3, 0x1

    .line 42
    .line 43
    add-int/2addr p1, v3

    .line 44
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-ne p1, v0, :cond_8

    .line 49
    .line 50
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 51
    .line 52
    add-int/lit8 v0, v3, 0x2

    .line 53
    .line 54
    add-int/2addr p1, v7

    .line 55
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    const/16 v7, 0x2c

    .line 60
    .line 61
    if-ne p1, v7, :cond_2

    .line 62
    .line 63
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 64
    .line 65
    add-int/2addr p1, v0

    .line 66
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 73
    .line 74
    const/4 p1, 0x3

    .line 75
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 76
    .line 77
    return-wide v5

    .line 78
    :cond_2
    const/16 v8, 0x7d

    .line 79
    .line 80
    if-ne p1, v8, :cond_7

    .line 81
    .line 82
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 83
    .line 84
    add-int/lit8 v9, v3, 0x3

    .line 85
    .line 86
    add-int/2addr p1, v0

    .line 87
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-ne p1, v7, :cond_3

    .line 92
    .line 93
    const/16 p1, 0x10

    .line 94
    .line 95
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 96
    .line 97
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 98
    .line 99
    add-int/2addr p1, v9

    .line 100
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_3
    const/16 v0, 0x5d

    .line 110
    .line 111
    if-ne p1, v0, :cond_4

    .line 112
    .line 113
    const/16 p1, 0xf

    .line 114
    .line 115
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 116
    .line 117
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 118
    .line 119
    add-int/2addr p1, v9

    .line 120
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_4
    if-ne p1, v8, :cond_5

    .line 130
    .line 131
    const/16 p1, 0xd

    .line 132
    .line 133
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 134
    .line 135
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 136
    .line 137
    add-int/2addr p1, v9

    .line 138
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 139
    .line 140
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_5
    const/16 v0, 0x1a

    .line 148
    .line 149
    if-ne p1, v0, :cond_6

    .line 150
    .line 151
    const/16 p1, 0x14

    .line 152
    .line 153
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 154
    .line 155
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 156
    .line 157
    add-int/lit8 v3, v3, 0x2

    .line 158
    .line 159
    add-int/2addr p1, v3

    .line 160
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 161
    .line 162
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 163
    .line 164
    :goto_1
    const/4 p1, 0x4

    .line 165
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 166
    .line 167
    return-wide v5

    .line 168
    :cond_6
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 169
    .line 170
    return-wide v1

    .line 171
    :cond_7
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 172
    .line 173
    return-wide v1

    .line 174
    :cond_8
    const/16 v3, 0x41

    .line 175
    .line 176
    if-lt p1, v3, :cond_9

    .line 177
    .line 178
    const/16 v3, 0x5a

    .line 179
    .line 180
    if-gt p1, v3, :cond_9

    .line 181
    .line 182
    add-int/lit8 v3, p1, 0x20

    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_9
    move v3, p1

    .line 186
    :goto_2
    int-to-long v8, v3

    .line 187
    xor-long/2addr v5, v8

    .line 188
    const-wide v8, 0x100000001b3L

    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    mul-long/2addr v5, v8

    .line 194
    const/16 v3, 0x5c

    .line 195
    .line 196
    if-ne p1, v3, :cond_a

    .line 197
    .line 198
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 199
    .line 200
    return-wide v1

    .line 201
    :cond_a
    move v3, v7

    .line 202
    goto/16 :goto_0
.end method

.method public final scanFalse()V
    .locals 3

    .line 1
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2
    .line 3
    const/16 v1, 0x66

    .line 4
    .line 5
    const-string v2, "error parse false"

    .line 6
    .line 7
    if-ne v0, v1, :cond_6

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 10
    .line 11
    .line 12
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 13
    .line 14
    const/16 v1, 0x61

    .line 15
    .line 16
    if-ne v0, v1, :cond_5

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 19
    .line 20
    .line 21
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 22
    .line 23
    const/16 v1, 0x6c

    .line 24
    .line 25
    if-ne v0, v1, :cond_4

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 28
    .line 29
    .line 30
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 31
    .line 32
    const/16 v1, 0x73

    .line 33
    .line 34
    if-ne v0, v1, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 37
    .line 38
    .line 39
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 40
    .line 41
    const/16 v1, 0x65

    .line 42
    .line 43
    if-ne v0, v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 46
    .line 47
    .line 48
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 49
    .line 50
    const/16 v1, 0x20

    .line 51
    .line 52
    if-eq v0, v1, :cond_1

    .line 53
    .line 54
    const/16 v1, 0x2c

    .line 55
    .line 56
    if-eq v0, v1, :cond_1

    .line 57
    .line 58
    const/16 v1, 0x7d

    .line 59
    .line 60
    if-eq v0, v1, :cond_1

    .line 61
    .line 62
    const/16 v1, 0x5d

    .line 63
    .line 64
    if-eq v0, v1, :cond_1

    .line 65
    .line 66
    const/16 v1, 0xa

    .line 67
    .line 68
    if-eq v0, v1, :cond_1

    .line 69
    .line 70
    const/16 v1, 0xd

    .line 71
    .line 72
    if-eq v0, v1, :cond_1

    .line 73
    .line 74
    const/16 v1, 0x9

    .line 75
    .line 76
    if-eq v0, v1, :cond_1

    .line 77
    .line 78
    const/16 v1, 0x1a

    .line 79
    .line 80
    if-eq v0, v1, :cond_1

    .line 81
    .line 82
    const/16 v1, 0xc

    .line 83
    .line 84
    if-eq v0, v1, :cond_1

    .line 85
    .line 86
    const/16 v1, 0x8

    .line 87
    .line 88
    if-eq v0, v1, :cond_1

    .line 89
    .line 90
    const/16 v1, 0x3a

    .line 91
    .line 92
    if-eq v0, v1, :cond_1

    .line 93
    .line 94
    const/16 v1, 0x2f

    .line 95
    .line 96
    if-ne v0, v1, :cond_0

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_0
    const-string p0, "scan false error"

    .line 100
    .line 101
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_1
    :goto_0
    const/4 v0, 0x7

    .line 106
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    invoke-static {v2}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_3
    invoke-static {v2}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_4
    invoke-static {v2}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_5
    invoke-static {v2}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_6
    invoke-static {v2}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public scanFieldBigInteger([C)Ljava/math/BigInteger;
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 7
    .line 8
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    const/4 v4, 0x0

    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    const/4 v1, -0x2

    .line 16
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 17
    .line 18
    return-object v4

    .line 19
    :cond_0
    array-length v3, v1

    .line 20
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 21
    .line 22
    add-int/lit8 v6, v3, 0x1

    .line 23
    .line 24
    add-int/2addr v5, v3

    .line 25
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    const/16 v7, 0x22

    .line 30
    .line 31
    if-ne v5, v7, :cond_1

    .line 32
    .line 33
    const/4 v9, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move v9, v2

    .line 36
    :goto_0
    if-eqz v9, :cond_2

    .line 37
    .line 38
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 39
    .line 40
    add-int/lit8 v3, v3, 0x2

    .line 41
    .line 42
    add-int/2addr v5, v6

    .line 43
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    move v6, v3

    .line 48
    :cond_2
    const/16 v3, 0x2d

    .line 49
    .line 50
    if-ne v5, v3, :cond_3

    .line 51
    .line 52
    const/4 v3, 0x1

    .line 53
    goto :goto_1

    .line 54
    :cond_3
    move v3, v2

    .line 55
    :goto_1
    if-eqz v3, :cond_4

    .line 56
    .line 57
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 58
    .line 59
    add-int/lit8 v10, v6, 0x1

    .line 60
    .line 61
    add-int/2addr v5, v6

    .line 62
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    move v6, v10

    .line 67
    :cond_4
    const/16 v12, 0x10

    .line 68
    .line 69
    const/16 v13, 0x2c

    .line 70
    .line 71
    const/16 v14, 0x30

    .line 72
    .line 73
    const/4 v15, -0x1

    .line 74
    if-lt v5, v14, :cond_12

    .line 75
    .line 76
    const/16 v2, 0x39

    .line 77
    .line 78
    if-gt v5, v2, :cond_12

    .line 79
    .line 80
    sub-int/2addr v5, v14

    .line 81
    move-object/from16 v16, v4

    .line 82
    .line 83
    int-to-long v4, v5

    .line 84
    const/16 v17, 0x1

    .line 85
    .line 86
    :goto_2
    iget v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 87
    .line 88
    add-int/lit8 v18, v6, 0x1

    .line 89
    .line 90
    add-int/2addr v8, v6

    .line 91
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 92
    .line 93
    .line 94
    move-result v8

    .line 95
    if-lt v8, v14, :cond_6

    .line 96
    .line 97
    if-gt v8, v2, :cond_6

    .line 98
    .line 99
    const-wide/16 v19, 0xa

    .line 100
    .line 101
    mul-long v19, v19, v4

    .line 102
    .line 103
    add-int/lit8 v2, v8, -0x30

    .line 104
    .line 105
    int-to-long v10, v2

    .line 106
    add-long v10, v19, v10

    .line 107
    .line 108
    cmp-long v2, v10, v4

    .line 109
    .line 110
    if-gez v2, :cond_5

    .line 111
    .line 112
    move/from16 v2, v17

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_5
    move-wide v4, v10

    .line 116
    move/from16 v6, v18

    .line 117
    .line 118
    const/16 v2, 0x39

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_6
    const/4 v2, 0x0

    .line 122
    :goto_3
    if-eqz v9, :cond_8

    .line 123
    .line 124
    if-eq v8, v7, :cond_7

    .line 125
    .line 126
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 127
    .line 128
    return-object v16

    .line 129
    :cond_7
    iget v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 130
    .line 131
    add-int/lit8 v6, v6, 0x2

    .line 132
    .line 133
    add-int v7, v7, v18

    .line 134
    .line 135
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 136
    .line 137
    .line 138
    move-result v8

    .line 139
    iget v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 140
    .line 141
    array-length v1, v1

    .line 142
    add-int/2addr v1, v7

    .line 143
    add-int/lit8 v1, v1, 0x1

    .line 144
    .line 145
    add-int/2addr v7, v6

    .line 146
    sub-int/2addr v7, v1

    .line 147
    add-int/lit8 v7, v7, -0x2

    .line 148
    .line 149
    move/from16 v18, v6

    .line 150
    .line 151
    goto :goto_4

    .line 152
    :cond_8
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 153
    .line 154
    array-length v1, v1

    .line 155
    add-int/2addr v1, v6

    .line 156
    add-int v6, v6, v18

    .line 157
    .line 158
    sub-int/2addr v6, v1

    .line 159
    add-int/lit8 v7, v6, -0x1

    .line 160
    .line 161
    :goto_4
    const/16 v6, 0x14

    .line 162
    .line 163
    if-nez v2, :cond_b

    .line 164
    .line 165
    if-lt v7, v6, :cond_9

    .line 166
    .line 167
    if-eqz v3, :cond_b

    .line 168
    .line 169
    const/16 v2, 0x15

    .line 170
    .line 171
    if-ge v7, v2, :cond_b

    .line 172
    .line 173
    :cond_9
    if-eqz v3, :cond_a

    .line 174
    .line 175
    neg-long v4, v4

    .line 176
    :cond_a
    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    goto :goto_5

    .line 181
    :cond_b
    invoke-virtual {v0, v1, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    new-instance v2, Ljava/math/BigInteger;

    .line 186
    .line 187
    invoke-direct {v2, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    move-object v1, v2

    .line 191
    :goto_5
    if-ne v8, v13, :cond_c

    .line 192
    .line 193
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 194
    .line 195
    add-int v2, v2, v18

    .line 196
    .line 197
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 198
    .line 199
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 204
    .line 205
    const/4 v2, 0x3

    .line 206
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 207
    .line 208
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 209
    .line 210
    return-object v1

    .line 211
    :cond_c
    const/16 v2, 0x7d

    .line 212
    .line 213
    if-ne v8, v2, :cond_11

    .line 214
    .line 215
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 216
    .line 217
    add-int/lit8 v3, v18, 0x1

    .line 218
    .line 219
    add-int v2, v2, v18

    .line 220
    .line 221
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 222
    .line 223
    .line 224
    move-result v2

    .line 225
    if-ne v2, v13, :cond_d

    .line 226
    .line 227
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 228
    .line 229
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 230
    .line 231
    add-int/2addr v2, v3

    .line 232
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 233
    .line 234
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 239
    .line 240
    goto :goto_6

    .line 241
    :cond_d
    const/16 v4, 0x5d

    .line 242
    .line 243
    if-ne v2, v4, :cond_e

    .line 244
    .line 245
    const/16 v2, 0xf

    .line 246
    .line 247
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 248
    .line 249
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 250
    .line 251
    add-int/2addr v2, v3

    .line 252
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 253
    .line 254
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 255
    .line 256
    .line 257
    move-result v2

    .line 258
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 259
    .line 260
    goto :goto_6

    .line 261
    :cond_e
    const/16 v4, 0x7d

    .line 262
    .line 263
    if-ne v2, v4, :cond_f

    .line 264
    .line 265
    const/16 v4, 0xd

    .line 266
    .line 267
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 268
    .line 269
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 270
    .line 271
    add-int/2addr v2, v3

    .line 272
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 273
    .line 274
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 275
    .line 276
    .line 277
    move-result v2

    .line 278
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 279
    .line 280
    goto :goto_6

    .line 281
    :cond_f
    const/16 v3, 0x1a

    .line 282
    .line 283
    if-ne v2, v3, :cond_10

    .line 284
    .line 285
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 286
    .line 287
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 288
    .line 289
    add-int v2, v2, v18

    .line 290
    .line 291
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 292
    .line 293
    iput-char v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 294
    .line 295
    :goto_6
    const/4 v2, 0x4

    .line 296
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 297
    .line 298
    return-object v1

    .line 299
    :cond_10
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 300
    .line 301
    return-object v16

    .line 302
    :cond_11
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 303
    .line 304
    return-object v16

    .line 305
    :cond_12
    move-object/from16 v16, v4

    .line 306
    .line 307
    const/16 v17, 0x1

    .line 308
    .line 309
    const/16 v1, 0x6e

    .line 310
    .line 311
    if-ne v5, v1, :cond_17

    .line 312
    .line 313
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 314
    .line 315
    add-int/2addr v1, v6

    .line 316
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 317
    .line 318
    .line 319
    move-result v1

    .line 320
    const/16 v2, 0x75

    .line 321
    .line 322
    if-ne v1, v2, :cond_17

    .line 323
    .line 324
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 325
    .line 326
    add-int/2addr v1, v6

    .line 327
    add-int/lit8 v1, v1, 0x1

    .line 328
    .line 329
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 330
    .line 331
    .line 332
    move-result v1

    .line 333
    const/16 v2, 0x6c

    .line 334
    .line 335
    if-ne v1, v2, :cond_17

    .line 336
    .line 337
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 338
    .line 339
    add-int/2addr v1, v6

    .line 340
    add-int/lit8 v1, v1, 0x2

    .line 341
    .line 342
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 343
    .line 344
    .line 345
    move-result v1

    .line 346
    if-ne v1, v2, :cond_17

    .line 347
    .line 348
    const/4 v1, 0x5

    .line 349
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 350
    .line 351
    add-int/lit8 v2, v6, 0x3

    .line 352
    .line 353
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 354
    .line 355
    add-int/lit8 v4, v6, 0x4

    .line 356
    .line 357
    add-int/2addr v3, v2

    .line 358
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 359
    .line 360
    .line 361
    move-result v2

    .line 362
    if-eqz v9, :cond_13

    .line 363
    .line 364
    if-ne v2, v7, :cond_13

    .line 365
    .line 366
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 367
    .line 368
    add-int/2addr v6, v1

    .line 369
    add-int/2addr v2, v4

    .line 370
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 371
    .line 372
    .line 373
    move-result v2

    .line 374
    :goto_7
    move v4, v6

    .line 375
    :cond_13
    if-ne v2, v13, :cond_14

    .line 376
    .line 377
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 378
    .line 379
    add-int/2addr v2, v4

    .line 380
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 381
    .line 382
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 383
    .line 384
    .line 385
    move-result v2

    .line 386
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 387
    .line 388
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 389
    .line 390
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 391
    .line 392
    return-object v16

    .line 393
    :cond_14
    const/16 v3, 0x7d

    .line 394
    .line 395
    if-ne v2, v3, :cond_15

    .line 396
    .line 397
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 398
    .line 399
    add-int/2addr v2, v4

    .line 400
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 401
    .line 402
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 403
    .line 404
    .line 405
    move-result v2

    .line 406
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 407
    .line 408
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 409
    .line 410
    const/16 v5, 0xd

    .line 411
    .line 412
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 413
    .line 414
    return-object v16

    .line 415
    :cond_15
    const/16 v5, 0xd

    .line 416
    .line 417
    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 418
    .line 419
    .line 420
    move-result v2

    .line 421
    if-eqz v2, :cond_16

    .line 422
    .line 423
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 424
    .line 425
    add-int/lit8 v6, v4, 0x1

    .line 426
    .line 427
    add-int/2addr v2, v4

    .line 428
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 429
    .line 430
    .line 431
    move-result v2

    .line 432
    goto :goto_7

    .line 433
    :cond_16
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 434
    .line 435
    return-object v16

    .line 436
    :cond_17
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 437
    .line 438
    return-object v16
.end method

.method public scanFieldBoolean([C)Z
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const/4 p1, -0x2

    .line 11
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    array-length p1, p1

    .line 15
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 16
    .line 17
    add-int/lit8 v2, p1, 0x1

    .line 18
    .line 19
    add-int/2addr v1, p1

    .line 20
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/16 v3, 0x74

    .line 25
    .line 26
    const/16 v4, 0x65

    .line 27
    .line 28
    const/4 v5, 0x4

    .line 29
    const/4 v6, 0x1

    .line 30
    const/4 v7, -0x1

    .line 31
    if-ne v1, v3, :cond_4

    .line 32
    .line 33
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 34
    .line 35
    add-int/lit8 v3, p1, 0x2

    .line 36
    .line 37
    add-int/2addr v1, v2

    .line 38
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/16 v2, 0x72

    .line 43
    .line 44
    if-eq v1, v2, :cond_1

    .line 45
    .line 46
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 47
    .line 48
    return v0

    .line 49
    :cond_1
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 50
    .line 51
    add-int/lit8 v2, p1, 0x3

    .line 52
    .line 53
    add-int/2addr v1, v3

    .line 54
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const/16 v3, 0x75

    .line 59
    .line 60
    if-eq v1, v3, :cond_2

    .line 61
    .line 62
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 63
    .line 64
    return v0

    .line 65
    :cond_2
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 66
    .line 67
    add-int/2addr p1, v5

    .line 68
    add-int/2addr v1, v2

    .line 69
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eq v1, v4, :cond_3

    .line 74
    .line 75
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 76
    .line 77
    return v0

    .line 78
    :cond_3
    move v1, v6

    .line 79
    goto :goto_0

    .line 80
    :cond_4
    const/16 v3, 0x66

    .line 81
    .line 82
    if-ne v1, v3, :cond_f

    .line 83
    .line 84
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 85
    .line 86
    add-int/lit8 v3, p1, 0x2

    .line 87
    .line 88
    add-int/2addr v1, v2

    .line 89
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    const/16 v2, 0x61

    .line 94
    .line 95
    if-eq v1, v2, :cond_5

    .line 96
    .line 97
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 98
    .line 99
    return v0

    .line 100
    :cond_5
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 101
    .line 102
    add-int/lit8 v2, p1, 0x3

    .line 103
    .line 104
    add-int/2addr v1, v3

    .line 105
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    const/16 v3, 0x6c

    .line 110
    .line 111
    if-eq v1, v3, :cond_6

    .line 112
    .line 113
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 114
    .line 115
    return v0

    .line 116
    :cond_6
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 117
    .line 118
    add-int/lit8 v3, p1, 0x4

    .line 119
    .line 120
    add-int/2addr v1, v2

    .line 121
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    const/16 v2, 0x73

    .line 126
    .line 127
    if-eq v1, v2, :cond_7

    .line 128
    .line 129
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 130
    .line 131
    return v0

    .line 132
    :cond_7
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 133
    .line 134
    add-int/lit8 p1, p1, 0x5

    .line 135
    .line 136
    add-int/2addr v1, v3

    .line 137
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eq v1, v4, :cond_8

    .line 142
    .line 143
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 144
    .line 145
    return v0

    .line 146
    :cond_8
    move v1, v0

    .line 147
    :goto_0
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 148
    .line 149
    add-int/lit8 v3, p1, 0x1

    .line 150
    .line 151
    add-int/2addr v2, p1

    .line 152
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    const/16 v4, 0x10

    .line 157
    .line 158
    const/16 v8, 0x2c

    .line 159
    .line 160
    if-ne v2, v8, :cond_9

    .line 161
    .line 162
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 163
    .line 164
    add-int/2addr p1, v3

    .line 165
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 166
    .line 167
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 172
    .line 173
    const/4 p1, 0x3

    .line 174
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 175
    .line 176
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 177
    .line 178
    return v1

    .line 179
    :cond_9
    const/16 v9, 0x7d

    .line 180
    .line 181
    if-ne v2, v9, :cond_e

    .line 182
    .line 183
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 184
    .line 185
    add-int/lit8 v10, p1, 0x2

    .line 186
    .line 187
    add-int/2addr v2, v3

    .line 188
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    if-ne v2, v8, :cond_a

    .line 193
    .line 194
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 195
    .line 196
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 197
    .line 198
    add-int/2addr p1, v10

    .line 199
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 200
    .line 201
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 206
    .line 207
    goto :goto_1

    .line 208
    :cond_a
    const/16 v3, 0x5d

    .line 209
    .line 210
    if-ne v2, v3, :cond_b

    .line 211
    .line 212
    const/16 p1, 0xf

    .line 213
    .line 214
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 215
    .line 216
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 217
    .line 218
    add-int/2addr p1, v10

    .line 219
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 220
    .line 221
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 226
    .line 227
    goto :goto_1

    .line 228
    :cond_b
    if-ne v2, v9, :cond_c

    .line 229
    .line 230
    const/16 p1, 0xd

    .line 231
    .line 232
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 233
    .line 234
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 235
    .line 236
    add-int/2addr p1, v10

    .line 237
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 238
    .line 239
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 244
    .line 245
    goto :goto_1

    .line 246
    :cond_c
    const/16 v3, 0x1a

    .line 247
    .line 248
    if-ne v2, v3, :cond_d

    .line 249
    .line 250
    const/16 v0, 0x14

    .line 251
    .line 252
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 253
    .line 254
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 255
    .line 256
    add-int/2addr p1, v6

    .line 257
    add-int/2addr v0, p1

    .line 258
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 259
    .line 260
    iput-char v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 261
    .line 262
    :goto_1
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 263
    .line 264
    return v1

    .line 265
    :cond_d
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 266
    .line 267
    return v0

    .line 268
    :cond_e
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 269
    .line 270
    return v0

    .line 271
    :cond_f
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 272
    .line 273
    return v0
.end method

.method public scanFieldDate([C)Ljava/util/Date;
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 p1, -0x2

    .line 12
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 13
    .line 14
    return-object v2

    .line 15
    :cond_0
    array-length v1, p1

    .line 16
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 17
    .line 18
    add-int/lit8 v4, v1, 0x1

    .line 19
    .line 20
    add-int/2addr v3, v1

    .line 21
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    const/16 v5, 0x22

    .line 26
    .line 27
    const/4 v6, -0x1

    .line 28
    const/4 v7, 0x1

    .line 29
    if-ne v3, v5, :cond_6

    .line 30
    .line 31
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 32
    .line 33
    array-length v3, p1

    .line 34
    add-int/2addr v1, v3

    .line 35
    add-int/2addr v1, v7

    .line 36
    invoke-virtual {p0, v5, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eq v1, v6, :cond_5

    .line 41
    .line 42
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 43
    .line 44
    array-length v8, p1

    .line 45
    add-int/2addr v3, v8

    .line 46
    add-int/2addr v3, v7

    .line 47
    sub-int v8, v1, v3

    .line 48
    .line 49
    invoke-virtual {p0, v3, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const/16 v8, 0x5c

    .line 54
    .line 55
    invoke-virtual {v3, v8}, Ljava/lang/String;->indexOf(I)I

    .line 56
    .line 57
    .line 58
    move-result v9

    .line 59
    if-eq v9, v6, :cond_3

    .line 60
    .line 61
    :goto_0
    add-int/lit8 v3, v1, -0x1

    .line 62
    .line 63
    move v9, v0

    .line 64
    :goto_1
    if-ltz v3, :cond_1

    .line 65
    .line 66
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 67
    .line 68
    .line 69
    move-result v10

    .line 70
    if-ne v10, v8, :cond_1

    .line 71
    .line 72
    add-int/lit8 v9, v9, 0x1

    .line 73
    .line 74
    add-int/lit8 v3, v3, -0x1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    rem-int/lit8 v9, v9, 0x2

    .line 78
    .line 79
    if-nez v9, :cond_2

    .line 80
    .line 81
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 82
    .line 83
    array-length v5, p1

    .line 84
    add-int/2addr v5, v3

    .line 85
    add-int/2addr v5, v7

    .line 86
    sub-int v5, v1, v5

    .line 87
    .line 88
    array-length v8, p1

    .line 89
    add-int/2addr v3, v8

    .line 90
    add-int/2addr v3, v7

    .line 91
    invoke-virtual {p0, v3, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sub_chars(II)[C

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-static {v3, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->readString([CI)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    goto :goto_2

    .line 100
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 101
    .line 102
    invoke-virtual {p0, v5, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    goto :goto_0

    .line 107
    :cond_3
    :goto_2
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 108
    .line 109
    array-length p1, p1

    .line 110
    add-int/2addr p1, v5

    .line 111
    add-int/2addr p1, v7

    .line 112
    sub-int/2addr v1, p1

    .line 113
    add-int/2addr v1, v7

    .line 114
    add-int/2addr v4, v1

    .line 115
    add-int/lit8 p1, v4, 0x1

    .line 116
    .line 117
    add-int/2addr v5, v4

    .line 118
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    new-instance v4, Lcom/alibaba/fastjson/parser/JSONScanner;

    .line 123
    .line 124
    invoke-direct {v4, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :try_start_0
    invoke-virtual {v4, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(Z)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_4

    .line 132
    .line 133
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCalendar()Ljava/util/Calendar;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 138
    .line 139
    .line 140
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 142
    .line 143
    .line 144
    goto/16 :goto_7

    .line 145
    .line 146
    :catchall_0
    move-exception p0

    .line 147
    goto :goto_3

    .line 148
    :cond_4
    :try_start_1
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 149
    .line 150
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 151
    .line 152
    .line 153
    return-object v2

    .line 154
    :goto_3
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 155
    .line 156
    .line 157
    throw p0

    .line 158
    :cond_5
    const-string p0, "unclosed str"

    .line 159
    .line 160
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    return-object v2

    .line 164
    :cond_6
    const/16 p1, 0x2d

    .line 165
    .line 166
    const/16 v5, 0x39

    .line 167
    .line 168
    const/16 v8, 0x30

    .line 169
    .line 170
    if-eq v3, p1, :cond_8

    .line 171
    .line 172
    if-lt v3, v8, :cond_7

    .line 173
    .line 174
    if-gt v3, v5, :cond_7

    .line 175
    .line 176
    goto :goto_4

    .line 177
    :cond_7
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 178
    .line 179
    return-object v2

    .line 180
    :cond_8
    :goto_4
    if-ne v3, p1, :cond_9

    .line 181
    .line 182
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 183
    .line 184
    add-int/lit8 v1, v1, 0x2

    .line 185
    .line 186
    add-int/2addr p1, v4

    .line 187
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    move v4, v1

    .line 192
    move v0, v7

    .line 193
    :cond_9
    const-wide/16 v9, 0x0

    .line 194
    .line 195
    if-lt v3, v8, :cond_b

    .line 196
    .line 197
    if-gt v3, v5, :cond_b

    .line 198
    .line 199
    add-int/lit8 v3, v3, -0x30

    .line 200
    .line 201
    int-to-long v11, v3

    .line 202
    :goto_5
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 203
    .line 204
    add-int/lit8 v1, v4, 0x1

    .line 205
    .line 206
    add-int/2addr p1, v4

    .line 207
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    if-lt p1, v8, :cond_a

    .line 212
    .line 213
    if-gt p1, v5, :cond_a

    .line 214
    .line 215
    const-wide/16 v3, 0xa

    .line 216
    .line 217
    mul-long/2addr v11, v3

    .line 218
    add-int/lit8 p1, p1, -0x30

    .line 219
    .line 220
    int-to-long v3, p1

    .line 221
    add-long/2addr v11, v3

    .line 222
    move v4, v1

    .line 223
    goto :goto_5

    .line 224
    :cond_a
    move v13, v1

    .line 225
    move v1, p1

    .line 226
    move p1, v13

    .line 227
    goto :goto_6

    .line 228
    :cond_b
    move v1, v3

    .line 229
    move p1, v4

    .line 230
    move-wide v11, v9

    .line 231
    :goto_6
    cmp-long v3, v11, v9

    .line 232
    .line 233
    if-gez v3, :cond_c

    .line 234
    .line 235
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 236
    .line 237
    return-object v2

    .line 238
    :cond_c
    if-eqz v0, :cond_d

    .line 239
    .line 240
    neg-long v11, v11

    .line 241
    :cond_d
    new-instance v0, Ljava/util/Date;

    .line 242
    .line 243
    invoke-direct {v0, v11, v12}, Ljava/util/Date;-><init>(J)V

    .line 244
    .line 245
    .line 246
    :goto_7
    const/16 v3, 0x2c

    .line 247
    .line 248
    if-ne v1, v3, :cond_e

    .line 249
    .line 250
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 251
    .line 252
    add-int/2addr v1, p1

    .line 253
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 254
    .line 255
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 260
    .line 261
    const/4 p1, 0x3

    .line 262
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 263
    .line 264
    return-object v0

    .line 265
    :cond_e
    const/16 v4, 0x7d

    .line 266
    .line 267
    if-ne v1, v4, :cond_13

    .line 268
    .line 269
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 270
    .line 271
    add-int/lit8 v5, p1, 0x1

    .line 272
    .line 273
    add-int/2addr v1, p1

    .line 274
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 275
    .line 276
    .line 277
    move-result v1

    .line 278
    if-ne v1, v3, :cond_f

    .line 279
    .line 280
    const/16 p1, 0x10

    .line 281
    .line 282
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 283
    .line 284
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 285
    .line 286
    add-int/2addr p1, v5

    .line 287
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 288
    .line 289
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 290
    .line 291
    .line 292
    move-result p1

    .line 293
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 294
    .line 295
    goto :goto_8

    .line 296
    :cond_f
    const/16 v3, 0x5d

    .line 297
    .line 298
    if-ne v1, v3, :cond_10

    .line 299
    .line 300
    const/16 p1, 0xf

    .line 301
    .line 302
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 303
    .line 304
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 305
    .line 306
    add-int/2addr p1, v5

    .line 307
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 308
    .line 309
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 314
    .line 315
    goto :goto_8

    .line 316
    :cond_10
    if-ne v1, v4, :cond_11

    .line 317
    .line 318
    const/16 p1, 0xd

    .line 319
    .line 320
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 321
    .line 322
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 323
    .line 324
    add-int/2addr p1, v5

    .line 325
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 326
    .line 327
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 332
    .line 333
    goto :goto_8

    .line 334
    :cond_11
    const/16 v3, 0x1a

    .line 335
    .line 336
    if-ne v1, v3, :cond_12

    .line 337
    .line 338
    const/16 v1, 0x14

    .line 339
    .line 340
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 341
    .line 342
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 343
    .line 344
    add-int/2addr v1, p1

    .line 345
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 346
    .line 347
    iput-char v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 348
    .line 349
    :goto_8
    const/4 p1, 0x4

    .line 350
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 351
    .line 352
    return-object v0

    .line 353
    :cond_12
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 354
    .line 355
    return-object v2

    .line 356
    :cond_13
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 357
    .line 358
    return-object v2
.end method

.method public scanFieldDecimal([C)Ljava/math/BigDecimal;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 7
    .line 8
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    const/4 v4, 0x0

    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    const/4 v1, -0x2

    .line 16
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 17
    .line 18
    return-object v4

    .line 19
    :cond_0
    array-length v3, v1

    .line 20
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 21
    .line 22
    add-int/lit8 v6, v3, 0x1

    .line 23
    .line 24
    add-int/2addr v5, v3

    .line 25
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    const/16 v7, 0x22

    .line 30
    .line 31
    const/4 v8, 0x1

    .line 32
    if-ne v5, v7, :cond_1

    .line 33
    .line 34
    move v2, v8

    .line 35
    :cond_1
    if-eqz v2, :cond_2

    .line 36
    .line 37
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 38
    .line 39
    add-int/lit8 v3, v3, 0x2

    .line 40
    .line 41
    add-int/2addr v5, v6

    .line 42
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    move v6, v3

    .line 47
    :cond_2
    const/16 v3, 0x2d

    .line 48
    .line 49
    if-ne v5, v3, :cond_3

    .line 50
    .line 51
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 52
    .line 53
    add-int/lit8 v9, v6, 0x1

    .line 54
    .line 55
    add-int/2addr v5, v6

    .line 56
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    move v6, v9

    .line 61
    :cond_3
    const/16 v9, 0xd

    .line 62
    .line 63
    const/16 v10, 0x7d

    .line 64
    .line 65
    const/16 v11, 0x10

    .line 66
    .line 67
    const/16 v12, 0x2c

    .line 68
    .line 69
    const/16 v13, 0x30

    .line 70
    .line 71
    const/4 v14, -0x1

    .line 72
    if-lt v5, v13, :cond_13

    .line 73
    .line 74
    const/16 v15, 0x39

    .line 75
    .line 76
    if-gt v5, v15, :cond_13

    .line 77
    .line 78
    :goto_0
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 79
    .line 80
    add-int/lit8 v16, v6, 0x1

    .line 81
    .line 82
    add-int/2addr v5, v6

    .line 83
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    if-lt v5, v13, :cond_4

    .line 88
    .line 89
    if-gt v5, v15, :cond_4

    .line 90
    .line 91
    move/from16 v6, v16

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_4
    move-object/from16 v17, v4

    .line 95
    .line 96
    const/16 v4, 0x2e

    .line 97
    .line 98
    if-ne v5, v4, :cond_6

    .line 99
    .line 100
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 101
    .line 102
    add-int/lit8 v6, v6, 0x2

    .line 103
    .line 104
    add-int v4, v4, v16

    .line 105
    .line 106
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-lt v4, v13, :cond_5

    .line 111
    .line 112
    if-gt v4, v15, :cond_5

    .line 113
    .line 114
    :goto_1
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 115
    .line 116
    add-int/lit8 v16, v6, 0x1

    .line 117
    .line 118
    add-int/2addr v4, v6

    .line 119
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-lt v5, v13, :cond_6

    .line 124
    .line 125
    if-gt v5, v15, :cond_6

    .line 126
    .line 127
    move/from16 v6, v16

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_5
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 131
    .line 132
    return-object v17

    .line 133
    :cond_6
    const/16 v4, 0x65

    .line 134
    .line 135
    if-eq v5, v4, :cond_7

    .line 136
    .line 137
    const/16 v4, 0x45

    .line 138
    .line 139
    if-ne v5, v4, :cond_a

    .line 140
    .line 141
    :cond_7
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 142
    .line 143
    add-int/lit8 v5, v16, 0x1

    .line 144
    .line 145
    add-int v4, v4, v16

    .line 146
    .line 147
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    const/16 v6, 0x2b

    .line 152
    .line 153
    if-eq v4, v6, :cond_9

    .line 154
    .line 155
    if-ne v4, v3, :cond_8

    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_8
    move/from16 v16, v5

    .line 159
    .line 160
    move v5, v4

    .line 161
    goto :goto_3

    .line 162
    :cond_9
    :goto_2
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 163
    .line 164
    add-int/lit8 v16, v16, 0x2

    .line 165
    .line 166
    add-int/2addr v3, v5

    .line 167
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    move v5, v3

    .line 172
    :goto_3
    if-lt v5, v13, :cond_a

    .line 173
    .line 174
    if-gt v5, v15, :cond_a

    .line 175
    .line 176
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 177
    .line 178
    add-int/lit8 v4, v16, 0x1

    .line 179
    .line 180
    add-int v3, v3, v16

    .line 181
    .line 182
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 183
    .line 184
    .line 185
    move-result v5

    .line 186
    move/from16 v16, v4

    .line 187
    .line 188
    goto :goto_3

    .line 189
    :cond_a
    if-eqz v2, :cond_c

    .line 190
    .line 191
    if-eq v5, v7, :cond_b

    .line 192
    .line 193
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 194
    .line 195
    return-object v17

    .line 196
    :cond_b
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 197
    .line 198
    add-int/lit8 v3, v16, 0x1

    .line 199
    .line 200
    add-int v2, v2, v16

    .line 201
    .line 202
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 203
    .line 204
    .line 205
    move-result v5

    .line 206
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 207
    .line 208
    array-length v1, v1

    .line 209
    add-int/2addr v1, v2

    .line 210
    add-int/2addr v1, v8

    .line 211
    add-int/2addr v2, v3

    .line 212
    sub-int/2addr v2, v1

    .line 213
    add-int/lit8 v2, v2, -0x2

    .line 214
    .line 215
    move/from16 v16, v3

    .line 216
    .line 217
    goto :goto_4

    .line 218
    :cond_c
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 219
    .line 220
    array-length v1, v1

    .line 221
    add-int/2addr v1, v2

    .line 222
    add-int v2, v2, v16

    .line 223
    .line 224
    sub-int/2addr v2, v1

    .line 225
    sub-int/2addr v2, v8

    .line 226
    :goto_4
    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sub_chars(II)[C

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    new-instance v2, Ljava/math/BigDecimal;

    .line 231
    .line 232
    invoke-direct {v2, v1}, Ljava/math/BigDecimal;-><init>([C)V

    .line 233
    .line 234
    .line 235
    if-ne v5, v12, :cond_d

    .line 236
    .line 237
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 238
    .line 239
    add-int v1, v1, v16

    .line 240
    .line 241
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 242
    .line 243
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 248
    .line 249
    const/4 v1, 0x3

    .line 250
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 251
    .line 252
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 253
    .line 254
    return-object v2

    .line 255
    :cond_d
    if-ne v5, v10, :cond_12

    .line 256
    .line 257
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 258
    .line 259
    add-int/lit8 v3, v16, 0x1

    .line 260
    .line 261
    add-int v1, v1, v16

    .line 262
    .line 263
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    if-ne v1, v12, :cond_e

    .line 268
    .line 269
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 270
    .line 271
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 272
    .line 273
    add-int/2addr v1, v3

    .line 274
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 275
    .line 276
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 281
    .line 282
    goto :goto_5

    .line 283
    :cond_e
    const/16 v4, 0x5d

    .line 284
    .line 285
    if-ne v1, v4, :cond_f

    .line 286
    .line 287
    const/16 v1, 0xf

    .line 288
    .line 289
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 290
    .line 291
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 292
    .line 293
    add-int/2addr v1, v3

    .line 294
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 295
    .line 296
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 297
    .line 298
    .line 299
    move-result v1

    .line 300
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 301
    .line 302
    goto :goto_5

    .line 303
    :cond_f
    if-ne v1, v10, :cond_10

    .line 304
    .line 305
    iput v9, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 306
    .line 307
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 308
    .line 309
    add-int/2addr v1, v3

    .line 310
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 311
    .line 312
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 317
    .line 318
    goto :goto_5

    .line 319
    :cond_10
    const/16 v3, 0x1a

    .line 320
    .line 321
    if-ne v1, v3, :cond_11

    .line 322
    .line 323
    const/16 v1, 0x14

    .line 324
    .line 325
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 326
    .line 327
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 328
    .line 329
    add-int v1, v1, v16

    .line 330
    .line 331
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 332
    .line 333
    iput-char v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 334
    .line 335
    :goto_5
    const/4 v1, 0x4

    .line 336
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 337
    .line 338
    return-object v2

    .line 339
    :cond_11
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 340
    .line 341
    return-object v17

    .line 342
    :cond_12
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 343
    .line 344
    return-object v17

    .line 345
    :cond_13
    move-object/from16 v17, v4

    .line 346
    .line 347
    const/16 v1, 0x6e

    .line 348
    .line 349
    if-ne v5, v1, :cond_18

    .line 350
    .line 351
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 352
    .line 353
    add-int/2addr v1, v6

    .line 354
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 355
    .line 356
    .line 357
    move-result v1

    .line 358
    const/16 v3, 0x75

    .line 359
    .line 360
    if-ne v1, v3, :cond_18

    .line 361
    .line 362
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 363
    .line 364
    add-int/2addr v1, v6

    .line 365
    add-int/2addr v1, v8

    .line 366
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 367
    .line 368
    .line 369
    move-result v1

    .line 370
    const/16 v3, 0x6c

    .line 371
    .line 372
    if-ne v1, v3, :cond_18

    .line 373
    .line 374
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 375
    .line 376
    add-int/2addr v1, v6

    .line 377
    add-int/lit8 v1, v1, 0x2

    .line 378
    .line 379
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 380
    .line 381
    .line 382
    move-result v1

    .line 383
    if-ne v1, v3, :cond_18

    .line 384
    .line 385
    const/4 v1, 0x5

    .line 386
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 387
    .line 388
    add-int/lit8 v3, v6, 0x3

    .line 389
    .line 390
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 391
    .line 392
    add-int/lit8 v5, v6, 0x4

    .line 393
    .line 394
    add-int/2addr v4, v3

    .line 395
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 396
    .line 397
    .line 398
    move-result v3

    .line 399
    if-eqz v2, :cond_14

    .line 400
    .line 401
    if-ne v3, v7, :cond_14

    .line 402
    .line 403
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 404
    .line 405
    add-int/2addr v6, v1

    .line 406
    add-int/2addr v2, v5

    .line 407
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 408
    .line 409
    .line 410
    move-result v3

    .line 411
    move v5, v6

    .line 412
    :cond_14
    :goto_6
    if-ne v3, v12, :cond_15

    .line 413
    .line 414
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 415
    .line 416
    add-int/2addr v2, v5

    .line 417
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 418
    .line 419
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 420
    .line 421
    .line 422
    move-result v2

    .line 423
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 424
    .line 425
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 426
    .line 427
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 428
    .line 429
    return-object v17

    .line 430
    :cond_15
    if-ne v3, v10, :cond_16

    .line 431
    .line 432
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 433
    .line 434
    add-int/2addr v2, v5

    .line 435
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 436
    .line 437
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 438
    .line 439
    .line 440
    move-result v2

    .line 441
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 442
    .line 443
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 444
    .line 445
    iput v9, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 446
    .line 447
    return-object v17

    .line 448
    :cond_16
    invoke-static {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 449
    .line 450
    .line 451
    move-result v2

    .line 452
    if-eqz v2, :cond_17

    .line 453
    .line 454
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 455
    .line 456
    add-int/lit8 v3, v5, 0x1

    .line 457
    .line 458
    add-int/2addr v2, v5

    .line 459
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 460
    .line 461
    .line 462
    move-result v2

    .line 463
    move v5, v3

    .line 464
    move v3, v2

    .line 465
    goto :goto_6

    .line 466
    :cond_17
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 467
    .line 468
    return-object v17

    .line 469
    :cond_18
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 470
    .line 471
    return-object v17
.end method

.method public final scanFieldDouble([C)D
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 7
    .line 8
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    const-wide/16 v4, 0x0

    .line 13
    .line 14
    if-nez v3, :cond_0

    .line 15
    .line 16
    const/4 v1, -0x2

    .line 17
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 18
    .line 19
    return-wide v4

    .line 20
    :cond_0
    array-length v3, v1

    .line 21
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 22
    .line 23
    add-int/lit8 v7, v3, 0x1

    .line 24
    .line 25
    add-int/2addr v6, v3

    .line 26
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    const/16 v8, 0x22

    .line 31
    .line 32
    if-ne v6, v8, :cond_1

    .line 33
    .line 34
    const/4 v10, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v10, v2

    .line 37
    :goto_0
    if-eqz v10, :cond_2

    .line 38
    .line 39
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 40
    .line 41
    add-int/lit8 v3, v3, 0x2

    .line 42
    .line 43
    add-int/2addr v6, v7

    .line 44
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    move v7, v3

    .line 49
    :cond_2
    const/16 v3, 0x2d

    .line 50
    .line 51
    if-ne v6, v3, :cond_3

    .line 52
    .line 53
    const/4 v11, 0x1

    .line 54
    goto :goto_1

    .line 55
    :cond_3
    move v11, v2

    .line 56
    :goto_1
    if-eqz v11, :cond_4

    .line 57
    .line 58
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 59
    .line 60
    add-int/lit8 v12, v7, 0x1

    .line 61
    .line 62
    add-int/2addr v6, v7

    .line 63
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    move v7, v12

    .line 68
    :cond_4
    const/16 v15, 0x2c

    .line 69
    .line 70
    const/4 v2, -0x1

    .line 71
    move-wide/from16 v17, v4

    .line 72
    .line 73
    const/16 v4, 0x30

    .line 74
    .line 75
    if-lt v6, v4, :cond_18

    .line 76
    .line 77
    const/16 v5, 0x39

    .line 78
    .line 79
    if-gt v6, v5, :cond_18

    .line 80
    .line 81
    sub-int/2addr v6, v4

    .line 82
    move/from16 v20, v10

    .line 83
    .line 84
    const/16 v19, 0x1

    .line 85
    .line 86
    int-to-long v9, v6

    .line 87
    :goto_2
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 88
    .line 89
    add-int/lit8 v21, v7, 0x1

    .line 90
    .line 91
    add-int/2addr v6, v7

    .line 92
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    const-wide/16 v22, 0xa

    .line 97
    .line 98
    if-lt v6, v4, :cond_5

    .line 99
    .line 100
    if-gt v6, v5, :cond_5

    .line 101
    .line 102
    mul-long v9, v9, v22

    .line 103
    .line 104
    add-int/lit8 v6, v6, -0x30

    .line 105
    .line 106
    int-to-long v6, v6

    .line 107
    add-long/2addr v9, v6

    .line 108
    move/from16 v7, v21

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_5
    const/16 v12, 0x2e

    .line 112
    .line 113
    if-ne v6, v12, :cond_7

    .line 114
    .line 115
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 116
    .line 117
    add-int/lit8 v7, v7, 0x2

    .line 118
    .line 119
    add-int v6, v6, v21

    .line 120
    .line 121
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    if-lt v6, v4, :cond_6

    .line 126
    .line 127
    if-gt v6, v5, :cond_6

    .line 128
    .line 129
    mul-long v9, v9, v22

    .line 130
    .line 131
    sub-int/2addr v6, v4

    .line 132
    int-to-long v13, v6

    .line 133
    add-long/2addr v9, v13

    .line 134
    move-wide/from16 v13, v22

    .line 135
    .line 136
    :goto_3
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 137
    .line 138
    add-int/lit8 v21, v7, 0x1

    .line 139
    .line 140
    add-int/2addr v6, v7

    .line 141
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    if-lt v6, v4, :cond_8

    .line 146
    .line 147
    if-gt v6, v5, :cond_8

    .line 148
    .line 149
    mul-long v9, v9, v22

    .line 150
    .line 151
    add-int/lit8 v6, v6, -0x30

    .line 152
    .line 153
    int-to-long v6, v6

    .line 154
    add-long/2addr v9, v6

    .line 155
    mul-long v13, v13, v22

    .line 156
    .line 157
    move/from16 v7, v21

    .line 158
    .line 159
    goto :goto_3

    .line 160
    :cond_6
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 161
    .line 162
    return-wide v17

    .line 163
    :cond_7
    const-wide/16 v13, 0x1

    .line 164
    .line 165
    :cond_8
    const/16 v7, 0x65

    .line 166
    .line 167
    if-eq v6, v7, :cond_a

    .line 168
    .line 169
    const/16 v7, 0x45

    .line 170
    .line 171
    if-ne v6, v7, :cond_9

    .line 172
    .line 173
    goto :goto_4

    .line 174
    :cond_9
    const/16 v16, 0x0

    .line 175
    .line 176
    goto :goto_5

    .line 177
    :cond_a
    :goto_4
    move/from16 v16, v19

    .line 178
    .line 179
    :goto_5
    if-eqz v16, :cond_d

    .line 180
    .line 181
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 182
    .line 183
    add-int/lit8 v7, v21, 0x1

    .line 184
    .line 185
    add-int v6, v6, v21

    .line 186
    .line 187
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    const/16 v12, 0x2b

    .line 192
    .line 193
    if-eq v6, v12, :cond_c

    .line 194
    .line 195
    if-ne v6, v3, :cond_b

    .line 196
    .line 197
    goto :goto_6

    .line 198
    :cond_b
    move/from16 v21, v7

    .line 199
    .line 200
    goto :goto_8

    .line 201
    :cond_c
    :goto_6
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 202
    .line 203
    add-int/lit8 v21, v21, 0x2

    .line 204
    .line 205
    add-int/2addr v3, v7

    .line 206
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    :goto_7
    move v6, v3

    .line 211
    :goto_8
    if-lt v6, v4, :cond_d

    .line 212
    .line 213
    if-gt v6, v5, :cond_d

    .line 214
    .line 215
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 216
    .line 217
    add-int/lit8 v6, v21, 0x1

    .line 218
    .line 219
    add-int v3, v3, v21

    .line 220
    .line 221
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 222
    .line 223
    .line 224
    move-result v3

    .line 225
    move/from16 v21, v6

    .line 226
    .line 227
    goto :goto_7

    .line 228
    :cond_d
    if-eqz v20, :cond_f

    .line 229
    .line 230
    if-eq v6, v8, :cond_e

    .line 231
    .line 232
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 233
    .line 234
    return-wide v17

    .line 235
    :cond_e
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 236
    .line 237
    add-int/lit8 v4, v21, 0x1

    .line 238
    .line 239
    add-int v3, v3, v21

    .line 240
    .line 241
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 242
    .line 243
    .line 244
    move-result v6

    .line 245
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 246
    .line 247
    array-length v1, v1

    .line 248
    add-int/2addr v1, v3

    .line 249
    add-int/lit8 v1, v1, 0x1

    .line 250
    .line 251
    add-int/2addr v3, v4

    .line 252
    sub-int/2addr v3, v1

    .line 253
    add-int/lit8 v3, v3, -0x2

    .line 254
    .line 255
    move/from16 v21, v4

    .line 256
    .line 257
    goto :goto_9

    .line 258
    :cond_f
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 259
    .line 260
    array-length v1, v1

    .line 261
    add-int/2addr v1, v3

    .line 262
    add-int v3, v3, v21

    .line 263
    .line 264
    sub-int/2addr v3, v1

    .line 265
    add-int/lit8 v3, v3, -0x1

    .line 266
    .line 267
    :goto_9
    if-nez v16, :cond_10

    .line 268
    .line 269
    const/16 v4, 0x11

    .line 270
    .line 271
    if-ge v3, v4, :cond_10

    .line 272
    .line 273
    long-to-double v3, v9

    .line 274
    long-to-double v7, v13

    .line 275
    div-double/2addr v3, v7

    .line 276
    if-eqz v11, :cond_11

    .line 277
    .line 278
    neg-double v3, v3

    .line 279
    goto :goto_a

    .line 280
    :cond_10
    invoke-virtual {v0, v1, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 285
    .line 286
    .line 287
    move-result-wide v3

    .line 288
    :cond_11
    :goto_a
    if-ne v6, v15, :cond_12

    .line 289
    .line 290
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 291
    .line 292
    add-int v1, v1, v21

    .line 293
    .line 294
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 295
    .line 296
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 297
    .line 298
    .line 299
    move-result v1

    .line 300
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 301
    .line 302
    const/4 v1, 0x3

    .line 303
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 304
    .line 305
    const/16 v1, 0x10

    .line 306
    .line 307
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 308
    .line 309
    return-wide v3

    .line 310
    :cond_12
    const/16 v1, 0x10

    .line 311
    .line 312
    const/16 v12, 0x7d

    .line 313
    .line 314
    if-ne v6, v12, :cond_17

    .line 315
    .line 316
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 317
    .line 318
    add-int/lit8 v6, v21, 0x1

    .line 319
    .line 320
    add-int v5, v5, v21

    .line 321
    .line 322
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 323
    .line 324
    .line 325
    move-result v5

    .line 326
    if-ne v5, v15, :cond_13

    .line 327
    .line 328
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 329
    .line 330
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 331
    .line 332
    add-int/2addr v1, v6

    .line 333
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 334
    .line 335
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 336
    .line 337
    .line 338
    move-result v1

    .line 339
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 340
    .line 341
    goto :goto_b

    .line 342
    :cond_13
    const/16 v1, 0x5d

    .line 343
    .line 344
    if-ne v5, v1, :cond_14

    .line 345
    .line 346
    const/16 v1, 0xf

    .line 347
    .line 348
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 349
    .line 350
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 351
    .line 352
    add-int/2addr v1, v6

    .line 353
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 354
    .line 355
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 356
    .line 357
    .line 358
    move-result v1

    .line 359
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 360
    .line 361
    goto :goto_b

    .line 362
    :cond_14
    const/16 v12, 0x7d

    .line 363
    .line 364
    if-ne v5, v12, :cond_15

    .line 365
    .line 366
    const/16 v1, 0xd

    .line 367
    .line 368
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 369
    .line 370
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 371
    .line 372
    add-int/2addr v1, v6

    .line 373
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 374
    .line 375
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 380
    .line 381
    goto :goto_b

    .line 382
    :cond_15
    const/16 v1, 0x1a

    .line 383
    .line 384
    if-ne v5, v1, :cond_16

    .line 385
    .line 386
    const/16 v2, 0x14

    .line 387
    .line 388
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 389
    .line 390
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 391
    .line 392
    add-int v2, v2, v21

    .line 393
    .line 394
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 395
    .line 396
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 397
    .line 398
    :goto_b
    const/4 v1, 0x4

    .line 399
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 400
    .line 401
    return-wide v3

    .line 402
    :cond_16
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 403
    .line 404
    return-wide v17

    .line 405
    :cond_17
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 406
    .line 407
    return-wide v17

    .line 408
    :cond_18
    move/from16 v20, v10

    .line 409
    .line 410
    const/16 v19, 0x1

    .line 411
    .line 412
    const/16 v1, 0x6e

    .line 413
    .line 414
    if-ne v6, v1, :cond_1d

    .line 415
    .line 416
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 417
    .line 418
    add-int/2addr v1, v7

    .line 419
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 420
    .line 421
    .line 422
    move-result v1

    .line 423
    const/16 v3, 0x75

    .line 424
    .line 425
    if-ne v1, v3, :cond_1d

    .line 426
    .line 427
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 428
    .line 429
    add-int/2addr v1, v7

    .line 430
    add-int/lit8 v1, v1, 0x1

    .line 431
    .line 432
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 433
    .line 434
    .line 435
    move-result v1

    .line 436
    const/16 v3, 0x6c

    .line 437
    .line 438
    if-ne v1, v3, :cond_1d

    .line 439
    .line 440
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 441
    .line 442
    add-int/2addr v1, v7

    .line 443
    add-int/lit8 v1, v1, 0x2

    .line 444
    .line 445
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 446
    .line 447
    .line 448
    move-result v1

    .line 449
    if-ne v1, v3, :cond_1d

    .line 450
    .line 451
    const/4 v1, 0x5

    .line 452
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 453
    .line 454
    add-int/lit8 v3, v7, 0x3

    .line 455
    .line 456
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 457
    .line 458
    add-int/lit8 v5, v7, 0x4

    .line 459
    .line 460
    add-int/2addr v4, v3

    .line 461
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 462
    .line 463
    .line 464
    move-result v3

    .line 465
    if-eqz v20, :cond_19

    .line 466
    .line 467
    if-ne v3, v8, :cond_19

    .line 468
    .line 469
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 470
    .line 471
    add-int/2addr v7, v1

    .line 472
    add-int/2addr v3, v5

    .line 473
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 474
    .line 475
    .line 476
    move-result v3

    .line 477
    :goto_c
    move v5, v7

    .line 478
    :cond_19
    if-ne v3, v15, :cond_1a

    .line 479
    .line 480
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 481
    .line 482
    add-int/2addr v2, v5

    .line 483
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 484
    .line 485
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 486
    .line 487
    .line 488
    move-result v2

    .line 489
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 490
    .line 491
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 492
    .line 493
    const/16 v4, 0x10

    .line 494
    .line 495
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 496
    .line 497
    return-wide v17

    .line 498
    :cond_1a
    const/16 v4, 0x10

    .line 499
    .line 500
    const/16 v12, 0x7d

    .line 501
    .line 502
    if-ne v3, v12, :cond_1b

    .line 503
    .line 504
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 505
    .line 506
    add-int/2addr v2, v5

    .line 507
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 508
    .line 509
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 510
    .line 511
    .line 512
    move-result v2

    .line 513
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 514
    .line 515
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 516
    .line 517
    const/16 v6, 0xd

    .line 518
    .line 519
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 520
    .line 521
    return-wide v17

    .line 522
    :cond_1b
    const/16 v6, 0xd

    .line 523
    .line 524
    invoke-static {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 525
    .line 526
    .line 527
    move-result v3

    .line 528
    if-eqz v3, :cond_1c

    .line 529
    .line 530
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 531
    .line 532
    add-int/lit8 v7, v5, 0x1

    .line 533
    .line 534
    add-int/2addr v3, v5

    .line 535
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 536
    .line 537
    .line 538
    move-result v3

    .line 539
    goto :goto_c

    .line 540
    :cond_1c
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 541
    .line 542
    return-wide v17

    .line 543
    :cond_1d
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 544
    .line 545
    return-wide v17
.end method

.method public final scanFieldFloat([C)F
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 7
    .line 8
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    const/4 v4, 0x0

    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    const/4 v1, -0x2

    .line 16
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 17
    .line 18
    return v4

    .line 19
    :cond_0
    array-length v3, v1

    .line 20
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 21
    .line 22
    add-int/lit8 v6, v3, 0x1

    .line 23
    .line 24
    add-int/2addr v5, v3

    .line 25
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    const/16 v7, 0x22

    .line 30
    .line 31
    if-ne v5, v7, :cond_1

    .line 32
    .line 33
    const/4 v9, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move v9, v2

    .line 36
    :goto_0
    if-eqz v9, :cond_2

    .line 37
    .line 38
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 39
    .line 40
    add-int/lit8 v3, v3, 0x2

    .line 41
    .line 42
    add-int/2addr v5, v6

    .line 43
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    move v6, v3

    .line 48
    :cond_2
    const/16 v3, 0x2d

    .line 49
    .line 50
    if-ne v5, v3, :cond_3

    .line 51
    .line 52
    const/4 v10, 0x1

    .line 53
    goto :goto_1

    .line 54
    :cond_3
    move v10, v2

    .line 55
    :goto_1
    if-eqz v10, :cond_4

    .line 56
    .line 57
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 58
    .line 59
    add-int/lit8 v11, v6, 0x1

    .line 60
    .line 61
    add-int/2addr v5, v6

    .line 62
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    move v6, v11

    .line 67
    :cond_4
    const/16 v14, 0x2c

    .line 68
    .line 69
    const/4 v15, -0x1

    .line 70
    const/16 v2, 0x30

    .line 71
    .line 72
    move/from16 v17, v4

    .line 73
    .line 74
    if-lt v5, v2, :cond_18

    .line 75
    .line 76
    const/16 v4, 0x39

    .line 77
    .line 78
    if-gt v5, v4, :cond_18

    .line 79
    .line 80
    sub-int/2addr v5, v2

    .line 81
    move/from16 v19, v9

    .line 82
    .line 83
    const/16 v18, 0x1

    .line 84
    .line 85
    int-to-long v8, v5

    .line 86
    :goto_2
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 87
    .line 88
    add-int/lit8 v20, v6, 0x1

    .line 89
    .line 90
    add-int/2addr v5, v6

    .line 91
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    const-wide/16 v21, 0xa

    .line 96
    .line 97
    if-lt v5, v2, :cond_5

    .line 98
    .line 99
    if-gt v5, v4, :cond_5

    .line 100
    .line 101
    mul-long v8, v8, v21

    .line 102
    .line 103
    add-int/lit8 v5, v5, -0x30

    .line 104
    .line 105
    int-to-long v5, v5

    .line 106
    add-long/2addr v8, v5

    .line 107
    move/from16 v6, v20

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_5
    const/16 v11, 0x2e

    .line 111
    .line 112
    if-ne v5, v11, :cond_7

    .line 113
    .line 114
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 115
    .line 116
    add-int/lit8 v6, v6, 0x2

    .line 117
    .line 118
    add-int v5, v5, v20

    .line 119
    .line 120
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    if-lt v5, v2, :cond_6

    .line 125
    .line 126
    if-gt v5, v4, :cond_6

    .line 127
    .line 128
    mul-long v8, v8, v21

    .line 129
    .line 130
    sub-int/2addr v5, v2

    .line 131
    int-to-long v12, v5

    .line 132
    add-long/2addr v8, v12

    .line 133
    move-wide/from16 v12, v21

    .line 134
    .line 135
    :goto_3
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 136
    .line 137
    add-int/lit8 v20, v6, 0x1

    .line 138
    .line 139
    add-int/2addr v5, v6

    .line 140
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    if-lt v5, v2, :cond_8

    .line 145
    .line 146
    if-gt v5, v4, :cond_8

    .line 147
    .line 148
    mul-long v8, v8, v21

    .line 149
    .line 150
    add-int/lit8 v5, v5, -0x30

    .line 151
    .line 152
    int-to-long v5, v5

    .line 153
    add-long/2addr v8, v5

    .line 154
    mul-long v12, v12, v21

    .line 155
    .line 156
    move/from16 v6, v20

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_6
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 160
    .line 161
    return v17

    .line 162
    :cond_7
    const-wide/16 v12, 0x1

    .line 163
    .line 164
    :cond_8
    const/16 v6, 0x65

    .line 165
    .line 166
    if-eq v5, v6, :cond_a

    .line 167
    .line 168
    const/16 v6, 0x45

    .line 169
    .line 170
    if-ne v5, v6, :cond_9

    .line 171
    .line 172
    goto :goto_4

    .line 173
    :cond_9
    const/16 v16, 0x0

    .line 174
    .line 175
    goto :goto_5

    .line 176
    :cond_a
    :goto_4
    move/from16 v16, v18

    .line 177
    .line 178
    :goto_5
    if-eqz v16, :cond_d

    .line 179
    .line 180
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 181
    .line 182
    add-int/lit8 v6, v20, 0x1

    .line 183
    .line 184
    add-int v5, v5, v20

    .line 185
    .line 186
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 187
    .line 188
    .line 189
    move-result v5

    .line 190
    const/16 v11, 0x2b

    .line 191
    .line 192
    if-eq v5, v11, :cond_c

    .line 193
    .line 194
    if-ne v5, v3, :cond_b

    .line 195
    .line 196
    goto :goto_6

    .line 197
    :cond_b
    move/from16 v20, v6

    .line 198
    .line 199
    goto :goto_8

    .line 200
    :cond_c
    :goto_6
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 201
    .line 202
    add-int/lit8 v20, v20, 0x2

    .line 203
    .line 204
    add-int/2addr v3, v6

    .line 205
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 206
    .line 207
    .line 208
    move-result v3

    .line 209
    :goto_7
    move v5, v3

    .line 210
    :goto_8
    if-lt v5, v2, :cond_d

    .line 211
    .line 212
    if-gt v5, v4, :cond_d

    .line 213
    .line 214
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 215
    .line 216
    add-int/lit8 v5, v20, 0x1

    .line 217
    .line 218
    add-int v3, v3, v20

    .line 219
    .line 220
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 221
    .line 222
    .line 223
    move-result v3

    .line 224
    move/from16 v20, v5

    .line 225
    .line 226
    goto :goto_7

    .line 227
    :cond_d
    if-eqz v19, :cond_f

    .line 228
    .line 229
    if-eq v5, v7, :cond_e

    .line 230
    .line 231
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 232
    .line 233
    return v17

    .line 234
    :cond_e
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 235
    .line 236
    add-int/lit8 v3, v20, 0x1

    .line 237
    .line 238
    add-int v2, v2, v20

    .line 239
    .line 240
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 241
    .line 242
    .line 243
    move-result v5

    .line 244
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 245
    .line 246
    array-length v1, v1

    .line 247
    add-int/2addr v1, v2

    .line 248
    add-int/lit8 v1, v1, 0x1

    .line 249
    .line 250
    add-int/2addr v2, v3

    .line 251
    sub-int/2addr v2, v1

    .line 252
    add-int/lit8 v2, v2, -0x2

    .line 253
    .line 254
    move/from16 v20, v3

    .line 255
    .line 256
    goto :goto_9

    .line 257
    :cond_f
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 258
    .line 259
    array-length v1, v1

    .line 260
    add-int/2addr v1, v2

    .line 261
    add-int v2, v2, v20

    .line 262
    .line 263
    sub-int/2addr v2, v1

    .line 264
    add-int/lit8 v2, v2, -0x1

    .line 265
    .line 266
    :goto_9
    if-nez v16, :cond_10

    .line 267
    .line 268
    const/16 v3, 0x11

    .line 269
    .line 270
    if-ge v2, v3, :cond_10

    .line 271
    .line 272
    long-to-double v1, v8

    .line 273
    long-to-double v3, v12

    .line 274
    div-double/2addr v1, v3

    .line 275
    double-to-float v1, v1

    .line 276
    if-eqz v10, :cond_11

    .line 277
    .line 278
    neg-float v1, v1

    .line 279
    goto :goto_a

    .line 280
    :cond_10
    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    :cond_11
    :goto_a
    if-ne v5, v14, :cond_12

    .line 289
    .line 290
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 291
    .line 292
    add-int v2, v2, v20

    .line 293
    .line 294
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 295
    .line 296
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 297
    .line 298
    .line 299
    move-result v2

    .line 300
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 301
    .line 302
    const/4 v2, 0x3

    .line 303
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 304
    .line 305
    const/16 v2, 0x10

    .line 306
    .line 307
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 308
    .line 309
    return v1

    .line 310
    :cond_12
    const/16 v2, 0x10

    .line 311
    .line 312
    const/16 v11, 0x7d

    .line 313
    .line 314
    if-ne v5, v11, :cond_17

    .line 315
    .line 316
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 317
    .line 318
    add-int/lit8 v4, v20, 0x1

    .line 319
    .line 320
    add-int v3, v3, v20

    .line 321
    .line 322
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 323
    .line 324
    .line 325
    move-result v3

    .line 326
    if-ne v3, v14, :cond_13

    .line 327
    .line 328
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 329
    .line 330
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 331
    .line 332
    add-int/2addr v2, v4

    .line 333
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 334
    .line 335
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 336
    .line 337
    .line 338
    move-result v2

    .line 339
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 340
    .line 341
    goto :goto_b

    .line 342
    :cond_13
    const/16 v2, 0x5d

    .line 343
    .line 344
    if-ne v3, v2, :cond_14

    .line 345
    .line 346
    const/16 v2, 0xf

    .line 347
    .line 348
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 349
    .line 350
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 351
    .line 352
    add-int/2addr v2, v4

    .line 353
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 354
    .line 355
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 356
    .line 357
    .line 358
    move-result v2

    .line 359
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 360
    .line 361
    goto :goto_b

    .line 362
    :cond_14
    const/16 v11, 0x7d

    .line 363
    .line 364
    if-ne v3, v11, :cond_15

    .line 365
    .line 366
    const/16 v2, 0xd

    .line 367
    .line 368
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 369
    .line 370
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 371
    .line 372
    add-int/2addr v2, v4

    .line 373
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 374
    .line 375
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 376
    .line 377
    .line 378
    move-result v2

    .line 379
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 380
    .line 381
    goto :goto_b

    .line 382
    :cond_15
    const/16 v2, 0x1a

    .line 383
    .line 384
    if-ne v3, v2, :cond_16

    .line 385
    .line 386
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 387
    .line 388
    add-int v3, v3, v20

    .line 389
    .line 390
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 391
    .line 392
    const/16 v3, 0x14

    .line 393
    .line 394
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 395
    .line 396
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 397
    .line 398
    :goto_b
    const/4 v2, 0x4

    .line 399
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 400
    .line 401
    return v1

    .line 402
    :cond_16
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 403
    .line 404
    return v17

    .line 405
    :cond_17
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 406
    .line 407
    return v17

    .line 408
    :cond_18
    move/from16 v19, v9

    .line 409
    .line 410
    const/16 v18, 0x1

    .line 411
    .line 412
    const/16 v1, 0x6e

    .line 413
    .line 414
    if-ne v5, v1, :cond_1d

    .line 415
    .line 416
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 417
    .line 418
    add-int/2addr v1, v6

    .line 419
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 420
    .line 421
    .line 422
    move-result v1

    .line 423
    const/16 v2, 0x75

    .line 424
    .line 425
    if-ne v1, v2, :cond_1d

    .line 426
    .line 427
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 428
    .line 429
    add-int/2addr v1, v6

    .line 430
    add-int/lit8 v1, v1, 0x1

    .line 431
    .line 432
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 433
    .line 434
    .line 435
    move-result v1

    .line 436
    const/16 v2, 0x6c

    .line 437
    .line 438
    if-ne v1, v2, :cond_1d

    .line 439
    .line 440
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 441
    .line 442
    add-int/2addr v1, v6

    .line 443
    add-int/lit8 v1, v1, 0x2

    .line 444
    .line 445
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 446
    .line 447
    .line 448
    move-result v1

    .line 449
    if-ne v1, v2, :cond_1d

    .line 450
    .line 451
    const/4 v1, 0x5

    .line 452
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 453
    .line 454
    add-int/lit8 v2, v6, 0x3

    .line 455
    .line 456
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 457
    .line 458
    add-int/lit8 v4, v6, 0x4

    .line 459
    .line 460
    add-int/2addr v3, v2

    .line 461
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 462
    .line 463
    .line 464
    move-result v2

    .line 465
    if-eqz v19, :cond_19

    .line 466
    .line 467
    if-ne v2, v7, :cond_19

    .line 468
    .line 469
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 470
    .line 471
    add-int/2addr v6, v1

    .line 472
    add-int/2addr v2, v4

    .line 473
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 474
    .line 475
    .line 476
    move-result v2

    .line 477
    :goto_c
    move v4, v6

    .line 478
    :cond_19
    if-ne v2, v14, :cond_1a

    .line 479
    .line 480
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 481
    .line 482
    add-int/2addr v2, v4

    .line 483
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 484
    .line 485
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 486
    .line 487
    .line 488
    move-result v2

    .line 489
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 490
    .line 491
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 492
    .line 493
    const/16 v3, 0x10

    .line 494
    .line 495
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 496
    .line 497
    return v17

    .line 498
    :cond_1a
    const/16 v3, 0x10

    .line 499
    .line 500
    const/16 v11, 0x7d

    .line 501
    .line 502
    if-ne v2, v11, :cond_1b

    .line 503
    .line 504
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 505
    .line 506
    add-int/2addr v2, v4

    .line 507
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 508
    .line 509
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 510
    .line 511
    .line 512
    move-result v2

    .line 513
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 514
    .line 515
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 516
    .line 517
    const/16 v5, 0xd

    .line 518
    .line 519
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 520
    .line 521
    return v17

    .line 522
    :cond_1b
    const/16 v5, 0xd

    .line 523
    .line 524
    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 525
    .line 526
    .line 527
    move-result v2

    .line 528
    if-eqz v2, :cond_1c

    .line 529
    .line 530
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 531
    .line 532
    add-int/lit8 v6, v4, 0x1

    .line 533
    .line 534
    add-int/2addr v2, v4

    .line 535
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 536
    .line 537
    .line 538
    move-result v2

    .line 539
    goto :goto_c

    .line 540
    :cond_1c
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 541
    .line 542
    return v17

    .line 543
    :cond_1d
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 544
    .line 545
    return v17
.end method

.method public final scanFieldFloatArray([C)[F
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    const/4 v3, -0x2

    .line 11
    const/4 v4, 0x0

    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 15
    .line 16
    return-object v4

    .line 17
    :cond_0
    move-object/from16 v2, p1

    .line 18
    .line 19
    array-length v2, v2

    .line 20
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 21
    .line 22
    add-int/lit8 v6, v2, 0x1

    .line 23
    .line 24
    add-int/2addr v5, v2

    .line 25
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    const/16 v7, 0x5b

    .line 30
    .line 31
    if-eq v5, v7, :cond_1

    .line 32
    .line 33
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 34
    .line 35
    return-object v4

    .line 36
    :cond_1
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 37
    .line 38
    add-int/lit8 v2, v2, 0x2

    .line 39
    .line 40
    add-int/2addr v3, v6

    .line 41
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    const/16 v5, 0x10

    .line 46
    .line 47
    new-array v6, v5, [F

    .line 48
    .line 49
    move v7, v1

    .line 50
    :goto_0
    iget v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 51
    .line 52
    add-int v9, v8, v2

    .line 53
    .line 54
    const/4 v10, 0x1

    .line 55
    sub-int/2addr v9, v10

    .line 56
    const/16 v11, 0x2d

    .line 57
    .line 58
    if-ne v3, v11, :cond_2

    .line 59
    .line 60
    move v12, v10

    .line 61
    goto :goto_1

    .line 62
    :cond_2
    move v12, v1

    .line 63
    :goto_1
    if-eqz v12, :cond_3

    .line 64
    .line 65
    add-int/lit8 v3, v2, 0x1

    .line 66
    .line 67
    add-int/2addr v8, v2

    .line 68
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    move/from16 v19, v3

    .line 73
    .line 74
    move v3, v2

    .line 75
    move/from16 v2, v19

    .line 76
    .line 77
    :cond_3
    const/4 v8, -0x1

    .line 78
    const/16 v13, 0x30

    .line 79
    .line 80
    if-lt v3, v13, :cond_19

    .line 81
    .line 82
    const/16 v14, 0x39

    .line 83
    .line 84
    if-gt v3, v14, :cond_19

    .line 85
    .line 86
    add-int/lit8 v3, v3, -0x30

    .line 87
    .line 88
    :goto_2
    iget v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 89
    .line 90
    add-int/lit8 v16, v2, 0x1

    .line 91
    .line 92
    add-int/2addr v15, v2

    .line 93
    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 94
    .line 95
    .line 96
    move-result v15

    .line 97
    if-lt v15, v13, :cond_4

    .line 98
    .line 99
    if-gt v15, v14, :cond_4

    .line 100
    .line 101
    mul-int/lit8 v3, v3, 0xa

    .line 102
    .line 103
    add-int/lit8 v15, v15, -0x30

    .line 104
    .line 105
    add-int/2addr v3, v15

    .line 106
    move/from16 v2, v16

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_4
    move-object/from16 v17, v4

    .line 110
    .line 111
    const/16 v4, 0x2e

    .line 112
    .line 113
    move/from16 p1, v10

    .line 114
    .line 115
    const/16 v10, 0xa

    .line 116
    .line 117
    if-ne v15, v4, :cond_6

    .line 118
    .line 119
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 120
    .line 121
    add-int/lit8 v2, v2, 0x2

    .line 122
    .line 123
    add-int v4, v4, v16

    .line 124
    .line 125
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 126
    .line 127
    .line 128
    move-result v4

    .line 129
    if-lt v4, v13, :cond_5

    .line 130
    .line 131
    if-gt v4, v14, :cond_5

    .line 132
    .line 133
    mul-int/lit8 v3, v3, 0xa

    .line 134
    .line 135
    add-int/lit8 v4, v4, -0x30

    .line 136
    .line 137
    add-int/2addr v3, v4

    .line 138
    move v4, v10

    .line 139
    :goto_3
    iget v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 140
    .line 141
    add-int/lit8 v16, v2, 0x1

    .line 142
    .line 143
    add-int/2addr v15, v2

    .line 144
    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 145
    .line 146
    .line 147
    move-result v15

    .line 148
    if-lt v15, v13, :cond_7

    .line 149
    .line 150
    if-gt v15, v14, :cond_7

    .line 151
    .line 152
    mul-int/lit8 v3, v3, 0xa

    .line 153
    .line 154
    add-int/lit8 v15, v15, -0x30

    .line 155
    .line 156
    add-int/2addr v3, v15

    .line 157
    mul-int/lit8 v4, v4, 0xa

    .line 158
    .line 159
    move/from16 v2, v16

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_5
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 163
    .line 164
    return-object v17

    .line 165
    :cond_6
    move/from16 v4, p1

    .line 166
    .line 167
    :cond_7
    const/16 v2, 0x65

    .line 168
    .line 169
    if-eq v15, v2, :cond_9

    .line 170
    .line 171
    const/16 v2, 0x45

    .line 172
    .line 173
    if-ne v15, v2, :cond_8

    .line 174
    .line 175
    goto :goto_4

    .line 176
    :cond_8
    move v2, v1

    .line 177
    goto :goto_5

    .line 178
    :cond_9
    :goto_4
    move/from16 v2, p1

    .line 179
    .line 180
    :goto_5
    if-eqz v2, :cond_c

    .line 181
    .line 182
    iget v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 183
    .line 184
    add-int/lit8 v18, v16, 0x1

    .line 185
    .line 186
    add-int v15, v15, v16

    .line 187
    .line 188
    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 189
    .line 190
    .line 191
    move-result v15

    .line 192
    const/16 v8, 0x2b

    .line 193
    .line 194
    if-eq v15, v8, :cond_b

    .line 195
    .line 196
    if-ne v15, v11, :cond_a

    .line 197
    .line 198
    goto :goto_6

    .line 199
    :cond_a
    move/from16 v16, v18

    .line 200
    .line 201
    goto :goto_7

    .line 202
    :cond_b
    :goto_6
    iget v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 203
    .line 204
    add-int/lit8 v16, v16, 0x2

    .line 205
    .line 206
    add-int v8, v8, v18

    .line 207
    .line 208
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 209
    .line 210
    .line 211
    move-result v8

    .line 212
    move v15, v8

    .line 213
    :goto_7
    if-lt v15, v13, :cond_c

    .line 214
    .line 215
    if-gt v15, v14, :cond_c

    .line 216
    .line 217
    iget v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 218
    .line 219
    add-int/lit8 v11, v16, 0x1

    .line 220
    .line 221
    add-int v8, v8, v16

    .line 222
    .line 223
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 224
    .line 225
    .line 226
    move-result v15

    .line 227
    move/from16 v16, v11

    .line 228
    .line 229
    goto :goto_7

    .line 230
    :cond_c
    iget v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 231
    .line 232
    add-int v8, v8, v16

    .line 233
    .line 234
    sub-int/2addr v8, v9

    .line 235
    add-int/lit8 v8, v8, -0x1

    .line 236
    .line 237
    if-nez v2, :cond_d

    .line 238
    .line 239
    if-ge v8, v10, :cond_d

    .line 240
    .line 241
    int-to-float v2, v3

    .line 242
    int-to-float v3, v4

    .line 243
    div-float/2addr v2, v3

    .line 244
    if-eqz v12, :cond_e

    .line 245
    .line 246
    neg-float v2, v2

    .line 247
    goto :goto_8

    .line 248
    :cond_d
    invoke-virtual {v0, v9, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    :cond_e
    :goto_8
    array-length v3, v6

    .line 257
    const/4 v4, 0x3

    .line 258
    if-lt v7, v3, :cond_f

    .line 259
    .line 260
    array-length v3, v6

    .line 261
    mul-int/2addr v3, v4

    .line 262
    div-int/lit8 v3, v3, 0x2

    .line 263
    .line 264
    new-array v3, v3, [F

    .line 265
    .line 266
    invoke-static {v6, v1, v3, v1, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 267
    .line 268
    .line 269
    move-object v6, v3

    .line 270
    :cond_f
    add-int/lit8 v3, v7, 0x1

    .line 271
    .line 272
    aput v2, v6, v7

    .line 273
    .line 274
    const/16 v2, 0x2c

    .line 275
    .line 276
    if-ne v15, v2, :cond_10

    .line 277
    .line 278
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 279
    .line 280
    add-int/lit8 v4, v16, 0x1

    .line 281
    .line 282
    add-int v2, v2, v16

    .line 283
    .line 284
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 285
    .line 286
    .line 287
    move-result v2

    .line 288
    move v15, v2

    .line 289
    move v2, v4

    .line 290
    goto/16 :goto_a

    .line 291
    .line 292
    :cond_10
    const/16 v7, 0x5d

    .line 293
    .line 294
    if-ne v15, v7, :cond_18

    .line 295
    .line 296
    iget v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 297
    .line 298
    add-int/lit8 v9, v16, 0x1

    .line 299
    .line 300
    add-int v8, v8, v16

    .line 301
    .line 302
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 303
    .line 304
    .line 305
    move-result v8

    .line 306
    array-length v10, v6

    .line 307
    if-eq v3, v10, :cond_11

    .line 308
    .line 309
    new-array v10, v3, [F

    .line 310
    .line 311
    invoke-static {v6, v1, v10, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 312
    .line 313
    .line 314
    move-object v6, v10

    .line 315
    :cond_11
    if-ne v8, v2, :cond_12

    .line 316
    .line 317
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 318
    .line 319
    add-int v1, v1, v16

    .line 320
    .line 321
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 322
    .line 323
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 324
    .line 325
    .line 326
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 327
    .line 328
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 329
    .line 330
    return-object v6

    .line 331
    :cond_12
    const/16 v1, 0x7d

    .line 332
    .line 333
    if-ne v8, v1, :cond_17

    .line 334
    .line 335
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 336
    .line 337
    add-int/2addr v3, v9

    .line 338
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 339
    .line 340
    .line 341
    move-result v3

    .line 342
    if-ne v3, v2, :cond_13

    .line 343
    .line 344
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 345
    .line 346
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 347
    .line 348
    add-int/lit8 v16, v16, 0x1

    .line 349
    .line 350
    add-int v1, v1, v16

    .line 351
    .line 352
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 353
    .line 354
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 355
    .line 356
    .line 357
    goto :goto_9

    .line 358
    :cond_13
    if-ne v3, v7, :cond_14

    .line 359
    .line 360
    const/16 v1, 0xf

    .line 361
    .line 362
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 363
    .line 364
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 365
    .line 366
    add-int/lit8 v16, v16, 0x1

    .line 367
    .line 368
    add-int v1, v1, v16

    .line 369
    .line 370
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 371
    .line 372
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 373
    .line 374
    .line 375
    goto :goto_9

    .line 376
    :cond_14
    if-ne v3, v1, :cond_15

    .line 377
    .line 378
    const/16 v1, 0xd

    .line 379
    .line 380
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 381
    .line 382
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 383
    .line 384
    add-int/lit8 v16, v16, 0x1

    .line 385
    .line 386
    add-int v1, v1, v16

    .line 387
    .line 388
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 389
    .line 390
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 391
    .line 392
    .line 393
    goto :goto_9

    .line 394
    :cond_15
    const/16 v1, 0x1a

    .line 395
    .line 396
    if-ne v3, v1, :cond_16

    .line 397
    .line 398
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 399
    .line 400
    add-int/lit8 v16, v16, 0x1

    .line 401
    .line 402
    add-int v2, v2, v16

    .line 403
    .line 404
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 405
    .line 406
    const/16 v2, 0x14

    .line 407
    .line 408
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 409
    .line 410
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 411
    .line 412
    :goto_9
    const/4 v1, 0x4

    .line 413
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 414
    .line 415
    return-object v6

    .line 416
    :cond_16
    const/4 v2, -0x1

    .line 417
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 418
    .line 419
    return-object v17

    .line 420
    :cond_17
    const/4 v2, -0x1

    .line 421
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 422
    .line 423
    return-object v17

    .line 424
    :cond_18
    move/from16 v2, v16

    .line 425
    .line 426
    :goto_a
    move v7, v3

    .line 427
    move v3, v15

    .line 428
    move-object/from16 v4, v17

    .line 429
    .line 430
    goto/16 :goto_0

    .line 431
    .line 432
    :cond_19
    move-object/from16 v17, v4

    .line 433
    .line 434
    move v2, v8

    .line 435
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 436
    .line 437
    return-object v17
.end method

.method public final scanFieldFloatArray2([C)[[F
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    const/4 v3, -0x2

    .line 11
    const/4 v4, 0x0

    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 15
    .line 16
    return-object v4

    .line 17
    :cond_0
    move-object/from16 v2, p1

    .line 18
    .line 19
    array-length v2, v2

    .line 20
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 21
    .line 22
    add-int/lit8 v6, v2, 0x1

    .line 23
    .line 24
    add-int/2addr v5, v2

    .line 25
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    const/16 v7, 0x5b

    .line 30
    .line 31
    if-eq v5, v7, :cond_1

    .line 32
    .line 33
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 34
    .line 35
    return-object v4

    .line 36
    :cond_1
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 37
    .line 38
    add-int/lit8 v2, v2, 0x2

    .line 39
    .line 40
    add-int/2addr v3, v6

    .line 41
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    const/16 v5, 0x10

    .line 46
    .line 47
    new-array v6, v5, [[F

    .line 48
    .line 49
    move v8, v1

    .line 50
    :goto_0
    const/4 v12, -0x1

    .line 51
    const/4 v13, 0x1

    .line 52
    if-ne v3, v7, :cond_17

    .line 53
    .line 54
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 55
    .line 56
    add-int/lit8 v14, v2, 0x1

    .line 57
    .line 58
    add-int/2addr v3, v2

    .line 59
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    new-array v3, v5, [F

    .line 64
    .line 65
    move v15, v1

    .line 66
    move-object/from16 v16, v4

    .line 67
    .line 68
    :goto_1
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 69
    .line 70
    add-int v17, v4, v14

    .line 71
    .line 72
    add-int/lit8 v7, v17, -0x1

    .line 73
    .line 74
    move/from16 v17, v13

    .line 75
    .line 76
    const/16 v13, 0x2d

    .line 77
    .line 78
    if-ne v2, v13, :cond_2

    .line 79
    .line 80
    move/from16 v18, v17

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_2
    move/from16 v18, v1

    .line 84
    .line 85
    :goto_2
    if-eqz v18, :cond_3

    .line 86
    .line 87
    add-int/lit8 v2, v14, 0x1

    .line 88
    .line 89
    add-int/2addr v4, v14

    .line 90
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    move v14, v2

    .line 95
    move v2, v4

    .line 96
    :cond_3
    const/16 v4, 0x30

    .line 97
    .line 98
    if-lt v2, v4, :cond_16

    .line 99
    .line 100
    const/16 v5, 0x39

    .line 101
    .line 102
    if-gt v2, v5, :cond_16

    .line 103
    .line 104
    add-int/lit8 v2, v2, -0x30

    .line 105
    .line 106
    const/16 v19, 0x3

    .line 107
    .line 108
    :goto_3
    iget v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 109
    .line 110
    add-int/lit8 v20, v14, 0x1

    .line 111
    .line 112
    add-int/2addr v10, v14

    .line 113
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 114
    .line 115
    .line 116
    move-result v10

    .line 117
    if-lt v10, v4, :cond_4

    .line 118
    .line 119
    if-gt v10, v5, :cond_4

    .line 120
    .line 121
    mul-int/lit8 v2, v2, 0xa

    .line 122
    .line 123
    add-int/lit8 v10, v10, -0x30

    .line 124
    .line 125
    add-int/2addr v2, v10

    .line 126
    move/from16 v14, v20

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_4
    const/16 v9, 0x2e

    .line 130
    .line 131
    const/16 v11, 0xa

    .line 132
    .line 133
    if-ne v10, v9, :cond_6

    .line 134
    .line 135
    iget v9, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 136
    .line 137
    add-int/lit8 v14, v14, 0x2

    .line 138
    .line 139
    add-int v9, v9, v20

    .line 140
    .line 141
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 142
    .line 143
    .line 144
    move-result v9

    .line 145
    if-lt v9, v4, :cond_5

    .line 146
    .line 147
    if-gt v9, v5, :cond_5

    .line 148
    .line 149
    mul-int/lit8 v2, v2, 0xa

    .line 150
    .line 151
    add-int/lit8 v9, v9, -0x30

    .line 152
    .line 153
    add-int/2addr v2, v9

    .line 154
    move v9, v11

    .line 155
    :goto_4
    iget v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 156
    .line 157
    add-int/lit8 v20, v14, 0x1

    .line 158
    .line 159
    add-int/2addr v10, v14

    .line 160
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 161
    .line 162
    .line 163
    move-result v10

    .line 164
    if-lt v10, v4, :cond_7

    .line 165
    .line 166
    if-gt v10, v5, :cond_7

    .line 167
    .line 168
    mul-int/lit8 v2, v2, 0xa

    .line 169
    .line 170
    add-int/lit8 v10, v10, -0x30

    .line 171
    .line 172
    add-int/2addr v2, v10

    .line 173
    mul-int/lit8 v9, v9, 0xa

    .line 174
    .line 175
    move/from16 v14, v20

    .line 176
    .line 177
    goto :goto_4

    .line 178
    :cond_5
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 179
    .line 180
    return-object v16

    .line 181
    :cond_6
    move/from16 v9, v17

    .line 182
    .line 183
    :cond_7
    const/16 v14, 0x65

    .line 184
    .line 185
    if-eq v10, v14, :cond_9

    .line 186
    .line 187
    const/16 v14, 0x45

    .line 188
    .line 189
    if-ne v10, v14, :cond_8

    .line 190
    .line 191
    goto :goto_5

    .line 192
    :cond_8
    move v14, v1

    .line 193
    goto :goto_6

    .line 194
    :cond_9
    :goto_5
    move/from16 v14, v17

    .line 195
    .line 196
    :goto_6
    if-eqz v14, :cond_c

    .line 197
    .line 198
    iget v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 199
    .line 200
    add-int/lit8 v21, v20, 0x1

    .line 201
    .line 202
    add-int v10, v10, v20

    .line 203
    .line 204
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 205
    .line 206
    .line 207
    move-result v10

    .line 208
    const/16 v12, 0x2b

    .line 209
    .line 210
    if-eq v10, v12, :cond_b

    .line 211
    .line 212
    if-ne v10, v13, :cond_a

    .line 213
    .line 214
    goto :goto_7

    .line 215
    :cond_a
    move/from16 v20, v21

    .line 216
    .line 217
    goto :goto_8

    .line 218
    :cond_b
    :goto_7
    iget v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 219
    .line 220
    add-int/lit8 v20, v20, 0x2

    .line 221
    .line 222
    add-int v10, v10, v21

    .line 223
    .line 224
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 225
    .line 226
    .line 227
    move-result v10

    .line 228
    :goto_8
    if-lt v10, v4, :cond_c

    .line 229
    .line 230
    if-gt v10, v5, :cond_c

    .line 231
    .line 232
    iget v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 233
    .line 234
    add-int/lit8 v12, v20, 0x1

    .line 235
    .line 236
    add-int v10, v10, v20

    .line 237
    .line 238
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 239
    .line 240
    .line 241
    move-result v10

    .line 242
    move/from16 v20, v12

    .line 243
    .line 244
    goto :goto_8

    .line 245
    :cond_c
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 246
    .line 247
    add-int v4, v4, v20

    .line 248
    .line 249
    sub-int/2addr v4, v7

    .line 250
    add-int/lit8 v4, v4, -0x1

    .line 251
    .line 252
    if-nez v14, :cond_d

    .line 253
    .line 254
    if-ge v4, v11, :cond_d

    .line 255
    .line 256
    int-to-float v2, v2

    .line 257
    int-to-float v4, v9

    .line 258
    div-float/2addr v2, v4

    .line 259
    if-eqz v18, :cond_e

    .line 260
    .line 261
    neg-float v2, v2

    .line 262
    goto :goto_9

    .line 263
    :cond_d
    invoke-virtual {v0, v7, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 268
    .line 269
    .line 270
    move-result v2

    .line 271
    :cond_e
    :goto_9
    array-length v4, v3

    .line 272
    if-lt v15, v4, :cond_f

    .line 273
    .line 274
    array-length v4, v3

    .line 275
    mul-int/lit8 v4, v4, 0x3

    .line 276
    .line 277
    div-int/lit8 v4, v4, 0x2

    .line 278
    .line 279
    new-array v4, v4, [F

    .line 280
    .line 281
    invoke-static {v3, v1, v4, v1, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 282
    .line 283
    .line 284
    move-object v3, v4

    .line 285
    :cond_f
    add-int/lit8 v4, v15, 0x1

    .line 286
    .line 287
    aput v2, v3, v15

    .line 288
    .line 289
    const/16 v2, 0x2c

    .line 290
    .line 291
    if-ne v10, v2, :cond_10

    .line 292
    .line 293
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 294
    .line 295
    add-int/lit8 v5, v20, 0x1

    .line 296
    .line 297
    add-int v2, v2, v20

    .line 298
    .line 299
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 300
    .line 301
    .line 302
    move-result v2

    .line 303
    move v14, v5

    .line 304
    goto :goto_b

    .line 305
    :cond_10
    const/16 v2, 0x5d

    .line 306
    .line 307
    if-ne v10, v2, :cond_15

    .line 308
    .line 309
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 310
    .line 311
    add-int/lit8 v5, v20, 0x1

    .line 312
    .line 313
    add-int v2, v2, v20

    .line 314
    .line 315
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 316
    .line 317
    .line 318
    move-result v2

    .line 319
    array-length v7, v3

    .line 320
    if-eq v4, v7, :cond_11

    .line 321
    .line 322
    new-array v7, v4, [F

    .line 323
    .line 324
    invoke-static {v3, v1, v7, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 325
    .line 326
    .line 327
    move-object v3, v7

    .line 328
    :cond_11
    array-length v7, v6

    .line 329
    if-lt v8, v7, :cond_12

    .line 330
    .line 331
    array-length v6, v6

    .line 332
    mul-int/lit8 v6, v6, 0x3

    .line 333
    .line 334
    div-int/lit8 v6, v6, 0x2

    .line 335
    .line 336
    new-array v6, v6, [[F

    .line 337
    .line 338
    invoke-static {v3, v1, v6, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 339
    .line 340
    .line 341
    :cond_12
    add-int/lit8 v4, v8, 0x1

    .line 342
    .line 343
    aput-object v3, v6, v8

    .line 344
    .line 345
    const/16 v3, 0x2c

    .line 346
    .line 347
    if-ne v2, v3, :cond_13

    .line 348
    .line 349
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 350
    .line 351
    add-int/lit8 v20, v20, 0x2

    .line 352
    .line 353
    add-int/2addr v2, v5

    .line 354
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 355
    .line 356
    .line 357
    move-result v2

    .line 358
    move v3, v2

    .line 359
    move/from16 v2, v20

    .line 360
    .line 361
    goto :goto_a

    .line 362
    :cond_13
    const/16 v3, 0x5d

    .line 363
    .line 364
    if-ne v2, v3, :cond_14

    .line 365
    .line 366
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 367
    .line 368
    add-int/lit8 v3, v20, 0x2

    .line 369
    .line 370
    add-int/2addr v2, v5

    .line 371
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 372
    .line 373
    .line 374
    move-result v2

    .line 375
    move v8, v3

    .line 376
    move v3, v2

    .line 377
    move v2, v8

    .line 378
    move v8, v4

    .line 379
    goto :goto_c

    .line 380
    :cond_14
    move v3, v2

    .line 381
    move v2, v5

    .line 382
    :goto_a
    move v8, v4

    .line 383
    move-object/from16 v4, v16

    .line 384
    .line 385
    const/16 v5, 0x10

    .line 386
    .line 387
    const/16 v7, 0x5b

    .line 388
    .line 389
    goto/16 :goto_0

    .line 390
    .line 391
    :cond_15
    move v2, v10

    .line 392
    move/from16 v14, v20

    .line 393
    .line 394
    :goto_b
    move v15, v4

    .line 395
    move/from16 v13, v17

    .line 396
    .line 397
    const/16 v5, 0x10

    .line 398
    .line 399
    const/16 v7, 0x5b

    .line 400
    .line 401
    const/4 v12, -0x1

    .line 402
    goto/16 :goto_1

    .line 403
    .line 404
    :cond_16
    move v1, v12

    .line 405
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 406
    .line 407
    return-object v16

    .line 408
    :cond_17
    move-object/from16 v16, v4

    .line 409
    .line 410
    move/from16 v17, v13

    .line 411
    .line 412
    const/16 v19, 0x3

    .line 413
    .line 414
    :goto_c
    array-length v4, v6

    .line 415
    if-eq v8, v4, :cond_18

    .line 416
    .line 417
    new-array v4, v8, [[F

    .line 418
    .line 419
    invoke-static {v6, v1, v4, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 420
    .line 421
    .line 422
    move-object v6, v4

    .line 423
    :cond_18
    const/16 v1, 0x2c

    .line 424
    .line 425
    if-ne v3, v1, :cond_19

    .line 426
    .line 427
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 428
    .line 429
    add-int/lit8 v2, v2, -0x1

    .line 430
    .line 431
    add-int/2addr v1, v2

    .line 432
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 433
    .line 434
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 435
    .line 436
    .line 437
    move/from16 v1, v19

    .line 438
    .line 439
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 440
    .line 441
    const/16 v1, 0x10

    .line 442
    .line 443
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 444
    .line 445
    return-object v6

    .line 446
    :cond_19
    const/16 v1, 0x10

    .line 447
    .line 448
    const/16 v4, 0x7d

    .line 449
    .line 450
    if-ne v3, v4, :cond_1e

    .line 451
    .line 452
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 453
    .line 454
    add-int/2addr v3, v2

    .line 455
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 456
    .line 457
    .line 458
    move-result v3

    .line 459
    const/16 v5, 0x2c

    .line 460
    .line 461
    if-ne v3, v5, :cond_1a

    .line 462
    .line 463
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 464
    .line 465
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 466
    .line 467
    add-int/2addr v1, v2

    .line 468
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 469
    .line 470
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 471
    .line 472
    .line 473
    goto :goto_d

    .line 474
    :cond_1a
    const/16 v1, 0x5d

    .line 475
    .line 476
    if-ne v3, v1, :cond_1b

    .line 477
    .line 478
    const/16 v1, 0xf

    .line 479
    .line 480
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 481
    .line 482
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 483
    .line 484
    add-int/2addr v1, v2

    .line 485
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 486
    .line 487
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 488
    .line 489
    .line 490
    goto :goto_d

    .line 491
    :cond_1b
    if-ne v3, v4, :cond_1c

    .line 492
    .line 493
    const/16 v1, 0xd

    .line 494
    .line 495
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 496
    .line 497
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 498
    .line 499
    add-int/2addr v1, v2

    .line 500
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 501
    .line 502
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 503
    .line 504
    .line 505
    goto :goto_d

    .line 506
    :cond_1c
    const/16 v1, 0x1a

    .line 507
    .line 508
    if-ne v3, v1, :cond_1d

    .line 509
    .line 510
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 511
    .line 512
    add-int/2addr v3, v2

    .line 513
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 514
    .line 515
    const/16 v2, 0x14

    .line 516
    .line 517
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 518
    .line 519
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 520
    .line 521
    :goto_d
    const/4 v1, 0x4

    .line 522
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 523
    .line 524
    return-object v6

    .line 525
    :cond_1d
    const/4 v1, -0x1

    .line 526
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 527
    .line 528
    return-object v16

    .line 529
    :cond_1e
    const/4 v1, -0x1

    .line 530
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 531
    .line 532
    return-object v16
.end method

.method public scanFieldInt([C)I
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const/4 p1, -0x2

    .line 11
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    array-length v1, p1

    .line 15
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 16
    .line 17
    add-int/lit8 v3, v1, 0x1

    .line 18
    .line 19
    add-int/2addr v2, v1

    .line 20
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/16 v4, 0x2d

    .line 25
    .line 26
    const/4 v5, 0x1

    .line 27
    if-ne v2, v4, :cond_1

    .line 28
    .line 29
    move v4, v5

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move v4, v0

    .line 32
    :goto_0
    if-eqz v4, :cond_2

    .line 33
    .line 34
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 35
    .line 36
    add-int/lit8 v1, v1, 0x2

    .line 37
    .line 38
    add-int/2addr v2, v3

    .line 39
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    move v3, v1

    .line 44
    :cond_2
    const/16 v1, 0x30

    .line 45
    .line 46
    const/4 v6, -0x1

    .line 47
    if-lt v2, v1, :cond_f

    .line 48
    .line 49
    const/16 v7, 0x39

    .line 50
    .line 51
    if-gt v2, v7, :cond_f

    .line 52
    .line 53
    sub-int/2addr v2, v1

    .line 54
    :goto_1
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 55
    .line 56
    add-int/lit8 v9, v3, 0x1

    .line 57
    .line 58
    add-int/2addr v8, v3

    .line 59
    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    if-lt v8, v1, :cond_3

    .line 64
    .line 65
    if-gt v8, v7, :cond_3

    .line 66
    .line 67
    mul-int/lit8 v2, v2, 0xa

    .line 68
    .line 69
    add-int/lit8 v8, v8, -0x30

    .line 70
    .line 71
    add-int/2addr v2, v8

    .line 72
    move v3, v9

    .line 73
    goto :goto_1

    .line 74
    :cond_3
    const/16 v1, 0x2e

    .line 75
    .line 76
    if-ne v8, v1, :cond_4

    .line 77
    .line 78
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 79
    .line 80
    return v0

    .line 81
    :cond_4
    if-ltz v2, :cond_5

    .line 82
    .line 83
    array-length p1, p1

    .line 84
    add-int/lit8 p1, p1, 0xe

    .line 85
    .line 86
    if-le v9, p1, :cond_6

    .line 87
    .line 88
    :cond_5
    const/high16 p1, -0x80000000

    .line 89
    .line 90
    if-ne v2, p1, :cond_e

    .line 91
    .line 92
    const/16 p1, 0x11

    .line 93
    .line 94
    if-ne v9, p1, :cond_e

    .line 95
    .line 96
    if-nez v4, :cond_6

    .line 97
    .line 98
    goto/16 :goto_3

    .line 99
    .line 100
    :cond_6
    const/16 p1, 0x10

    .line 101
    .line 102
    const/16 v1, 0x2c

    .line 103
    .line 104
    if-ne v8, v1, :cond_7

    .line 105
    .line 106
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 107
    .line 108
    add-int/2addr v0, v9

    .line 109
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 116
    .line 117
    const/4 v0, 0x3

    .line 118
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 119
    .line 120
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 121
    .line 122
    if-eqz v4, :cond_b

    .line 123
    .line 124
    neg-int p0, v2

    .line 125
    return p0

    .line 126
    :cond_7
    const/16 v7, 0x7d

    .line 127
    .line 128
    if-ne v8, v7, :cond_d

    .line 129
    .line 130
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 131
    .line 132
    add-int/lit8 v10, v3, 0x2

    .line 133
    .line 134
    add-int/2addr v8, v9

    .line 135
    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 136
    .line 137
    .line 138
    move-result v8

    .line 139
    if-ne v8, v1, :cond_8

    .line 140
    .line 141
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 142
    .line 143
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 144
    .line 145
    add-int/2addr p1, v10

    .line 146
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 147
    .line 148
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_8
    const/16 p1, 0x5d

    .line 156
    .line 157
    if-ne v8, p1, :cond_9

    .line 158
    .line 159
    const/16 p1, 0xf

    .line 160
    .line 161
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 162
    .line 163
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 164
    .line 165
    add-int/2addr p1, v10

    .line 166
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 167
    .line 168
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 173
    .line 174
    goto :goto_2

    .line 175
    :cond_9
    if-ne v8, v7, :cond_a

    .line 176
    .line 177
    const/16 p1, 0xd

    .line 178
    .line 179
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 180
    .line 181
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 182
    .line 183
    add-int/2addr p1, v10

    .line 184
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 185
    .line 186
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_a
    const/16 p1, 0x1a

    .line 194
    .line 195
    if-ne v8, p1, :cond_c

    .line 196
    .line 197
    const/16 v0, 0x14

    .line 198
    .line 199
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 200
    .line 201
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 202
    .line 203
    add-int/2addr v3, v5

    .line 204
    add-int/2addr v0, v3

    .line 205
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 206
    .line 207
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 208
    .line 209
    :goto_2
    const/4 p1, 0x4

    .line 210
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 211
    .line 212
    if-eqz v4, :cond_b

    .line 213
    .line 214
    neg-int p0, v2

    .line 215
    return p0

    .line 216
    :cond_b
    return v2

    .line 217
    :cond_c
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 218
    .line 219
    return v0

    .line 220
    :cond_d
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 221
    .line 222
    return v0

    .line 223
    :cond_e
    :goto_3
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 224
    .line 225
    return v0

    .line 226
    :cond_f
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 227
    .line 228
    return v0
.end method

.method public final scanFieldIntArray([C)[I
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    const/4 v3, -0x2

    .line 11
    const/4 v4, 0x0

    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 15
    .line 16
    return-object v4

    .line 17
    :cond_0
    move-object/from16 v2, p1

    .line 18
    .line 19
    array-length v2, v2

    .line 20
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 21
    .line 22
    add-int/lit8 v6, v2, 0x1

    .line 23
    .line 24
    add-int/2addr v5, v2

    .line 25
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    const/16 v7, 0x5b

    .line 30
    .line 31
    if-eq v5, v7, :cond_1

    .line 32
    .line 33
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 34
    .line 35
    return-object v4

    .line 36
    :cond_1
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 37
    .line 38
    add-int/lit8 v5, v2, 0x2

    .line 39
    .line 40
    add-int/2addr v3, v6

    .line 41
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    const/16 v6, 0x10

    .line 46
    .line 47
    new-array v7, v6, [I

    .line 48
    .line 49
    const/4 v8, -0x1

    .line 50
    const/16 v9, 0x2c

    .line 51
    .line 52
    const/4 v10, 0x3

    .line 53
    const/16 v11, 0x5d

    .line 54
    .line 55
    const/4 v12, 0x1

    .line 56
    if-ne v3, v11, :cond_2

    .line 57
    .line 58
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 59
    .line 60
    add-int/2addr v2, v10

    .line 61
    add-int/2addr v3, v5

    .line 62
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    move v14, v1

    .line 67
    move-object/from16 v16, v4

    .line 68
    .line 69
    goto/16 :goto_3

    .line 70
    .line 71
    :cond_2
    move v2, v1

    .line 72
    :goto_0
    const/16 v13, 0x2d

    .line 73
    .line 74
    if-ne v3, v13, :cond_3

    .line 75
    .line 76
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 77
    .line 78
    add-int/lit8 v13, v5, 0x1

    .line 79
    .line 80
    add-int/2addr v3, v5

    .line 81
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    move v5, v13

    .line 86
    move v13, v12

    .line 87
    goto :goto_1

    .line 88
    :cond_3
    move v13, v1

    .line 89
    :goto_1
    const/16 v14, 0x30

    .line 90
    .line 91
    if-lt v3, v14, :cond_10

    .line 92
    .line 93
    const/16 v15, 0x39

    .line 94
    .line 95
    if-gt v3, v15, :cond_10

    .line 96
    .line 97
    add-int/lit8 v3, v3, -0x30

    .line 98
    .line 99
    move-object/from16 v16, v4

    .line 100
    .line 101
    :goto_2
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 102
    .line 103
    add-int/lit8 v17, v5, 0x1

    .line 104
    .line 105
    add-int/2addr v4, v5

    .line 106
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-lt v4, v14, :cond_4

    .line 111
    .line 112
    if-gt v4, v15, :cond_4

    .line 113
    .line 114
    mul-int/lit8 v3, v3, 0xa

    .line 115
    .line 116
    add-int/lit8 v4, v4, -0x30

    .line 117
    .line 118
    add-int/2addr v3, v4

    .line 119
    move/from16 v5, v17

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_4
    array-length v14, v7

    .line 123
    if-lt v2, v14, :cond_5

    .line 124
    .line 125
    array-length v14, v7

    .line 126
    mul-int/2addr v14, v10

    .line 127
    div-int/lit8 v14, v14, 0x2

    .line 128
    .line 129
    new-array v14, v14, [I

    .line 130
    .line 131
    invoke-static {v7, v1, v14, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 132
    .line 133
    .line 134
    move-object v7, v14

    .line 135
    :cond_5
    add-int/lit8 v14, v2, 0x1

    .line 136
    .line 137
    if-eqz v13, :cond_6

    .line 138
    .line 139
    neg-int v3, v3

    .line 140
    :cond_6
    aput v3, v7, v2

    .line 141
    .line 142
    if-ne v4, v9, :cond_7

    .line 143
    .line 144
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 145
    .line 146
    add-int/lit8 v5, v5, 0x2

    .line 147
    .line 148
    add-int v2, v2, v17

    .line 149
    .line 150
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    move v3, v2

    .line 155
    goto/16 :goto_5

    .line 156
    .line 157
    :cond_7
    if-ne v4, v11, :cond_f

    .line 158
    .line 159
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 160
    .line 161
    add-int/lit8 v3, v5, 0x2

    .line 162
    .line 163
    add-int v2, v2, v17

    .line 164
    .line 165
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    move/from16 v18, v3

    .line 170
    .line 171
    move v3, v2

    .line 172
    move/from16 v2, v18

    .line 173
    .line 174
    :goto_3
    array-length v4, v7

    .line 175
    if-eq v14, v4, :cond_8

    .line 176
    .line 177
    new-array v4, v14, [I

    .line 178
    .line 179
    invoke-static {v7, v1, v4, v1, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 180
    .line 181
    .line 182
    move-object v7, v4

    .line 183
    :cond_8
    if-ne v3, v9, :cond_9

    .line 184
    .line 185
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 186
    .line 187
    sub-int/2addr v2, v12

    .line 188
    add-int/2addr v1, v2

    .line 189
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 190
    .line 191
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 192
    .line 193
    .line 194
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 195
    .line 196
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 197
    .line 198
    return-object v7

    .line 199
    :cond_9
    const/16 v1, 0x7d

    .line 200
    .line 201
    if-ne v3, v1, :cond_e

    .line 202
    .line 203
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 204
    .line 205
    add-int/2addr v3, v2

    .line 206
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    if-ne v3, v9, :cond_a

    .line 211
    .line 212
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 213
    .line 214
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 215
    .line 216
    add-int/2addr v1, v2

    .line 217
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 218
    .line 219
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 220
    .line 221
    .line 222
    goto :goto_4

    .line 223
    :cond_a
    if-ne v3, v11, :cond_b

    .line 224
    .line 225
    const/16 v1, 0xf

    .line 226
    .line 227
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 228
    .line 229
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 230
    .line 231
    add-int/2addr v1, v2

    .line 232
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 233
    .line 234
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 235
    .line 236
    .line 237
    goto :goto_4

    .line 238
    :cond_b
    if-ne v3, v1, :cond_c

    .line 239
    .line 240
    const/16 v1, 0xd

    .line 241
    .line 242
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 243
    .line 244
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 245
    .line 246
    add-int/2addr v1, v2

    .line 247
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 248
    .line 249
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 250
    .line 251
    .line 252
    goto :goto_4

    .line 253
    :cond_c
    const/16 v1, 0x1a

    .line 254
    .line 255
    if-ne v3, v1, :cond_d

    .line 256
    .line 257
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 258
    .line 259
    add-int/2addr v3, v2

    .line 260
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 261
    .line 262
    const/16 v2, 0x14

    .line 263
    .line 264
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 265
    .line 266
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 267
    .line 268
    :goto_4
    const/4 v1, 0x4

    .line 269
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 270
    .line 271
    return-object v7

    .line 272
    :cond_d
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 273
    .line 274
    return-object v16

    .line 275
    :cond_e
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 276
    .line 277
    return-object v16

    .line 278
    :cond_f
    move v3, v4

    .line 279
    move/from16 v5, v17

    .line 280
    .line 281
    :goto_5
    move v2, v14

    .line 282
    move-object/from16 v4, v16

    .line 283
    .line 284
    goto/16 :goto_0

    .line 285
    .line 286
    :cond_10
    move-object/from16 v16, v4

    .line 287
    .line 288
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 289
    .line 290
    return-object v16
.end method

.method public scanFieldLong([C)J
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const/4 p1, -0x2

    .line 13
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 14
    .line 15
    return-wide v2

    .line 16
    :cond_0
    array-length v1, p1

    .line 17
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 18
    .line 19
    add-int/lit8 v5, v1, 0x1

    .line 20
    .line 21
    add-int/2addr v4, v1

    .line 22
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const/16 v6, 0x2d

    .line 27
    .line 28
    const/4 v7, 0x1

    .line 29
    if-ne v4, v6, :cond_1

    .line 30
    .line 31
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 32
    .line 33
    add-int/lit8 v1, v1, 0x2

    .line 34
    .line 35
    add-int/2addr v0, v5

    .line 36
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    move v5, v1

    .line 41
    move v0, v7

    .line 42
    :cond_1
    const/16 v1, 0x30

    .line 43
    .line 44
    const/4 v6, -0x1

    .line 45
    if-lt v4, v1, :cond_d

    .line 46
    .line 47
    const/16 v8, 0x39

    .line 48
    .line 49
    if-gt v4, v8, :cond_d

    .line 50
    .line 51
    sub-int/2addr v4, v1

    .line 52
    int-to-long v9, v4

    .line 53
    :goto_0
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 54
    .line 55
    add-int/lit8 v11, v5, 0x1

    .line 56
    .line 57
    add-int/2addr v4, v5

    .line 58
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-lt v4, v1, :cond_2

    .line 63
    .line 64
    if-gt v4, v8, :cond_2

    .line 65
    .line 66
    const-wide/16 v12, 0xa

    .line 67
    .line 68
    mul-long/2addr v9, v12

    .line 69
    add-int/lit8 v4, v4, -0x30

    .line 70
    .line 71
    int-to-long v4, v4

    .line 72
    add-long/2addr v9, v4

    .line 73
    move v5, v11

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    const/16 v1, 0x2e

    .line 76
    .line 77
    if-ne v4, v1, :cond_3

    .line 78
    .line 79
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 80
    .line 81
    return-wide v2

    .line 82
    :cond_3
    array-length p1, p1

    .line 83
    sub-int p1, v11, p1

    .line 84
    .line 85
    const/16 v1, 0x15

    .line 86
    .line 87
    if-ge p1, v1, :cond_c

    .line 88
    .line 89
    cmp-long p1, v9, v2

    .line 90
    .line 91
    if-gez p1, :cond_4

    .line 92
    .line 93
    const-wide/high16 v12, -0x8000000000000000L

    .line 94
    .line 95
    cmp-long p1, v9, v12

    .line 96
    .line 97
    if-nez p1, :cond_c

    .line 98
    .line 99
    if-eqz v0, :cond_c

    .line 100
    .line 101
    :cond_4
    const/16 p1, 0x10

    .line 102
    .line 103
    const/16 v1, 0x2c

    .line 104
    .line 105
    if-ne v4, v1, :cond_5

    .line 106
    .line 107
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 108
    .line 109
    add-int/2addr v1, v11

    .line 110
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 111
    .line 112
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    iput-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 117
    .line 118
    const/4 v1, 0x3

    .line 119
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 120
    .line 121
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 122
    .line 123
    if-eqz v0, :cond_9

    .line 124
    .line 125
    neg-long p0, v9

    .line 126
    return-wide p0

    .line 127
    :cond_5
    const/16 v8, 0x7d

    .line 128
    .line 129
    if-ne v4, v8, :cond_b

    .line 130
    .line 131
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 132
    .line 133
    add-int/lit8 v12, v5, 0x2

    .line 134
    .line 135
    add-int/2addr v4, v11

    .line 136
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 137
    .line 138
    .line 139
    move-result v4

    .line 140
    if-ne v4, v1, :cond_6

    .line 141
    .line 142
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 143
    .line 144
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 145
    .line 146
    add-int/2addr p1, v12

    .line 147
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 148
    .line 149
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_6
    const/16 p1, 0x5d

    .line 157
    .line 158
    if-ne v4, p1, :cond_7

    .line 159
    .line 160
    const/16 p1, 0xf

    .line 161
    .line 162
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 163
    .line 164
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 165
    .line 166
    add-int/2addr p1, v12

    .line 167
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 168
    .line 169
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_7
    if-ne v4, v8, :cond_8

    .line 177
    .line 178
    const/16 p1, 0xd

    .line 179
    .line 180
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 181
    .line 182
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 183
    .line 184
    add-int/2addr p1, v12

    .line 185
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 186
    .line 187
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_8
    const/16 p1, 0x1a

    .line 195
    .line 196
    if-ne v4, p1, :cond_a

    .line 197
    .line 198
    const/16 v1, 0x14

    .line 199
    .line 200
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 201
    .line 202
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 203
    .line 204
    add-int/2addr v5, v7

    .line 205
    add-int/2addr v1, v5

    .line 206
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 207
    .line 208
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 209
    .line 210
    :goto_1
    const/4 p1, 0x4

    .line 211
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 212
    .line 213
    if-eqz v0, :cond_9

    .line 214
    .line 215
    neg-long p0, v9

    .line 216
    return-wide p0

    .line 217
    :cond_9
    return-wide v9

    .line 218
    :cond_a
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 219
    .line 220
    return-wide v2

    .line 221
    :cond_b
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 222
    .line 223
    return-wide v2

    .line 224
    :cond_c
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 225
    .line 226
    return-wide v2

    .line 227
    :cond_d
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 228
    .line 229
    return-wide v2
.end method

.method public scanFieldString([C)Ljava/lang/String;
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const/4 p1, -0x2

    .line 11
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    array-length v1, p1

    .line 19
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 20
    .line 21
    add-int/lit8 v3, v1, 0x1

    .line 22
    .line 23
    add-int/2addr v2, v1

    .line 24
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/16 v2, 0x22

    .line 29
    .line 30
    const/4 v4, -0x1

    .line 31
    if-eq v1, v2, :cond_1

    .line 32
    .line 33
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 41
    .line 42
    array-length v5, p1

    .line 43
    add-int/2addr v1, v5

    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    invoke-virtual {p0, v2, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eq v1, v4, :cond_b

    .line 51
    .line 52
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 53
    .line 54
    array-length v6, p1

    .line 55
    add-int/2addr v5, v6

    .line 56
    add-int/lit8 v5, v5, 0x1

    .line 57
    .line 58
    sub-int v6, v1, v5

    .line 59
    .line 60
    invoke-virtual {p0, v5, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    const/16 v6, 0x5c

    .line 65
    .line 66
    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    if-eq v7, v4, :cond_4

    .line 71
    .line 72
    :goto_0
    add-int/lit8 v5, v1, -0x1

    .line 73
    .line 74
    move v7, v0

    .line 75
    :goto_1
    if-ltz v5, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 78
    .line 79
    .line 80
    move-result v8

    .line 81
    if-ne v8, v6, :cond_2

    .line 82
    .line 83
    add-int/lit8 v7, v7, 0x1

    .line 84
    .line 85
    add-int/lit8 v5, v5, -0x1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_2
    rem-int/lit8 v7, v7, 0x2

    .line 89
    .line 90
    if-nez v7, :cond_3

    .line 91
    .line 92
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 93
    .line 94
    array-length v2, p1

    .line 95
    add-int/2addr v2, v0

    .line 96
    add-int/lit8 v2, v2, 0x1

    .line 97
    .line 98
    sub-int v2, v1, v2

    .line 99
    .line 100
    array-length v5, p1

    .line 101
    add-int/2addr v0, v5

    .line 102
    add-int/lit8 v0, v0, 0x1

    .line 103
    .line 104
    invoke-virtual {p0, v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sub_chars(II)[C

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->readString([CI)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    goto :goto_2

    .line 113
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 114
    .line 115
    invoke-virtual {p0, v2, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    goto :goto_0

    .line 120
    :cond_4
    :goto_2
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 121
    .line 122
    array-length p1, p1

    .line 123
    add-int/2addr p1, v0

    .line 124
    add-int/lit8 p1, p1, 0x1

    .line 125
    .line 126
    sub-int/2addr v1, p1

    .line 127
    add-int/lit8 v1, v1, 0x1

    .line 128
    .line 129
    add-int/2addr v3, v1

    .line 130
    add-int/lit8 p1, v3, 0x1

    .line 131
    .line 132
    add-int/2addr v0, v3

    .line 133
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    const/16 v1, 0x2c

    .line 138
    .line 139
    if-ne v0, v1, :cond_5

    .line 140
    .line 141
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 142
    .line 143
    add-int/2addr v0, p1

    .line 144
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 145
    .line 146
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 151
    .line 152
    const/4 p1, 0x3

    .line 153
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 154
    .line 155
    return-object v5

    .line 156
    :cond_5
    const/16 v2, 0x7d

    .line 157
    .line 158
    if-ne v0, v2, :cond_a

    .line 159
    .line 160
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 161
    .line 162
    add-int/lit8 v6, v3, 0x2

    .line 163
    .line 164
    add-int/2addr v0, p1

    .line 165
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    if-ne p1, v1, :cond_6

    .line 170
    .line 171
    const/16 p1, 0x10

    .line 172
    .line 173
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 174
    .line 175
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 176
    .line 177
    add-int/2addr p1, v6

    .line 178
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 179
    .line 180
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_6
    const/16 v0, 0x5d

    .line 188
    .line 189
    if-ne p1, v0, :cond_7

    .line 190
    .line 191
    const/16 p1, 0xf

    .line 192
    .line 193
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 194
    .line 195
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 196
    .line 197
    add-int/2addr p1, v6

    .line 198
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 199
    .line 200
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 205
    .line 206
    goto :goto_3

    .line 207
    :cond_7
    if-ne p1, v2, :cond_8

    .line 208
    .line 209
    const/16 p1, 0xd

    .line 210
    .line 211
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 212
    .line 213
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 214
    .line 215
    add-int/2addr p1, v6

    .line 216
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 217
    .line 218
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 223
    .line 224
    goto :goto_3

    .line 225
    :cond_8
    const/16 v0, 0x1a

    .line 226
    .line 227
    if-ne p1, v0, :cond_9

    .line 228
    .line 229
    const/16 p1, 0x14

    .line 230
    .line 231
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 232
    .line 233
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 234
    .line 235
    add-int/lit8 v3, v3, 0x1

    .line 236
    .line 237
    add-int/2addr p1, v3

    .line 238
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 239
    .line 240
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 241
    .line 242
    :goto_3
    const/4 p1, 0x4

    .line 243
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 244
    .line 245
    return-object v5

    .line 246
    :cond_9
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 247
    .line 248
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    return-object p0

    .line 253
    :cond_a
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 254
    .line 255
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    return-object p0

    .line 260
    :cond_b
    const-string p0, "unclosed str"

    .line 261
    .line 262
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    const/4 p0, 0x0

    .line 266
    return-object p0
.end method

.method public scanFieldStringArray([CLjava/lang/Class;)Ljava/util/Collection;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([C",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 p1, -0x2

    .line 12
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 13
    .line 14
    return-object v2

    .line 15
    :cond_0
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->newCollectionByType(Ljava/lang/Class;)Ljava/util/Collection;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    array-length p1, p1

    .line 20
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 21
    .line 22
    add-int/lit8 v3, p1, 0x1

    .line 23
    .line 24
    add-int/2addr v1, p1

    .line 25
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/16 v4, 0x5b

    .line 30
    .line 31
    const/4 v5, -0x1

    .line 32
    if-eq v1, v4, :cond_1

    .line 33
    .line 34
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 35
    .line 36
    return-object v2

    .line 37
    :cond_1
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 38
    .line 39
    add-int/lit8 p1, p1, 0x2

    .line 40
    .line 41
    add-int/2addr v1, v3

    .line 42
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    :goto_0
    const/16 v3, 0x5d

    .line 47
    .line 48
    const/16 v4, 0x2c

    .line 49
    .line 50
    const/16 v6, 0x22

    .line 51
    .line 52
    if-ne v1, v6, :cond_6

    .line 53
    .line 54
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 55
    .line 56
    add-int/2addr v1, p1

    .line 57
    invoke-virtual {p0, v6, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eq v1, v5, :cond_5

    .line 62
    .line 63
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 64
    .line 65
    add-int/2addr v7, p1

    .line 66
    sub-int v8, v1, v7

    .line 67
    .line 68
    invoke-virtual {p0, v7, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    const/16 v8, 0x5c

    .line 73
    .line 74
    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    .line 75
    .line 76
    .line 77
    move-result v9

    .line 78
    if-eq v9, v5, :cond_4

    .line 79
    .line 80
    :goto_1
    add-int/lit8 v7, v1, -0x1

    .line 81
    .line 82
    move v9, v0

    .line 83
    :goto_2
    if-ltz v7, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 86
    .line 87
    .line 88
    move-result v10

    .line 89
    if-ne v10, v8, :cond_2

    .line 90
    .line 91
    add-int/lit8 v9, v9, 0x1

    .line 92
    .line 93
    add-int/lit8 v7, v7, -0x1

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_2
    rem-int/lit8 v9, v9, 0x2

    .line 97
    .line 98
    if-nez v9, :cond_3

    .line 99
    .line 100
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 101
    .line 102
    add-int v7, v6, p1

    .line 103
    .line 104
    sub-int v7, v1, v7

    .line 105
    .line 106
    add-int/2addr v6, p1

    .line 107
    invoke-virtual {p0, v6, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sub_chars(II)[C

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    invoke-static {v6, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->readString([CI)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    goto :goto_3

    .line 116
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 117
    .line 118
    invoke-virtual {p0, v6, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    goto :goto_1

    .line 123
    :cond_4
    :goto_3
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 124
    .line 125
    add-int v8, v6, p1

    .line 126
    .line 127
    sub-int/2addr v1, v8

    .line 128
    add-int/lit8 v1, v1, 0x1

    .line 129
    .line 130
    add-int/2addr p1, v1

    .line 131
    add-int/lit8 v1, p1, 0x1

    .line 132
    .line 133
    add-int/2addr v6, p1

    .line 134
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    invoke-interface {p2, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    goto :goto_4

    .line 142
    :cond_5
    const-string p0, "unclosed str"

    .line 143
    .line 144
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    return-object v2

    .line 148
    :cond_6
    const/16 v6, 0x6e

    .line 149
    .line 150
    if-ne v1, v6, :cond_9

    .line 151
    .line 152
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 153
    .line 154
    add-int/2addr v6, p1

    .line 155
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 156
    .line 157
    .line 158
    move-result v6

    .line 159
    const/16 v7, 0x75

    .line 160
    .line 161
    if-ne v6, v7, :cond_9

    .line 162
    .line 163
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 164
    .line 165
    add-int/2addr v6, p1

    .line 166
    add-int/lit8 v6, v6, 0x1

    .line 167
    .line 168
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 169
    .line 170
    .line 171
    move-result v6

    .line 172
    const/16 v7, 0x6c

    .line 173
    .line 174
    if-ne v6, v7, :cond_9

    .line 175
    .line 176
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 177
    .line 178
    add-int/2addr v6, p1

    .line 179
    add-int/lit8 v6, v6, 0x2

    .line 180
    .line 181
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 182
    .line 183
    .line 184
    move-result v6

    .line 185
    if-ne v6, v7, :cond_9

    .line 186
    .line 187
    add-int/lit8 v1, p1, 0x3

    .line 188
    .line 189
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 190
    .line 191
    add-int/lit8 p1, p1, 0x4

    .line 192
    .line 193
    add-int/2addr v6, v1

    .line 194
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    invoke-interface {p2, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move v11, v1

    .line 202
    move v1, p1

    .line 203
    move p1, v11

    .line 204
    :goto_4
    if-ne p1, v4, :cond_7

    .line 205
    .line 206
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 207
    .line 208
    add-int/lit8 v3, v1, 0x1

    .line 209
    .line 210
    add-int/2addr p1, v1

    .line 211
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    move p1, v3

    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :cond_7
    if-ne p1, v3, :cond_8

    .line 219
    .line 220
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 221
    .line 222
    add-int/lit8 v0, v1, 0x1

    .line 223
    .line 224
    add-int/2addr p1, v1

    .line 225
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    goto :goto_5

    .line 230
    :cond_8
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 231
    .line 232
    return-object v2

    .line 233
    :cond_9
    if-ne v1, v3, :cond_10

    .line 234
    .line 235
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    if-nez v0, :cond_10

    .line 240
    .line 241
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 242
    .line 243
    add-int/lit8 v1, p1, 0x1

    .line 244
    .line 245
    add-int/2addr v0, p1

    .line 246
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    move v0, v1

    .line 251
    :goto_5
    if-ne p1, v4, :cond_a

    .line 252
    .line 253
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 254
    .line 255
    add-int/2addr p1, v0

    .line 256
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 257
    .line 258
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 259
    .line 260
    .line 261
    move-result p1

    .line 262
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 263
    .line 264
    const/4 p1, 0x3

    .line 265
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 266
    .line 267
    return-object p2

    .line 268
    :cond_a
    const/16 v1, 0x7d

    .line 269
    .line 270
    if-ne p1, v1, :cond_f

    .line 271
    .line 272
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 273
    .line 274
    add-int/lit8 v6, v0, 0x1

    .line 275
    .line 276
    add-int/2addr p1, v0

    .line 277
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 278
    .line 279
    .line 280
    move-result p1

    .line 281
    if-ne p1, v4, :cond_b

    .line 282
    .line 283
    const/16 p1, 0x10

    .line 284
    .line 285
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 286
    .line 287
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 288
    .line 289
    add-int/2addr p1, v6

    .line 290
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 291
    .line 292
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 293
    .line 294
    .line 295
    move-result p1

    .line 296
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 297
    .line 298
    goto :goto_6

    .line 299
    :cond_b
    if-ne p1, v3, :cond_c

    .line 300
    .line 301
    const/16 p1, 0xf

    .line 302
    .line 303
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 304
    .line 305
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 306
    .line 307
    add-int/2addr p1, v6

    .line 308
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 309
    .line 310
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 311
    .line 312
    .line 313
    move-result p1

    .line 314
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 315
    .line 316
    goto :goto_6

    .line 317
    :cond_c
    if-ne p1, v1, :cond_d

    .line 318
    .line 319
    const/16 p1, 0xd

    .line 320
    .line 321
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 322
    .line 323
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 324
    .line 325
    add-int/2addr p1, v6

    .line 326
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 327
    .line 328
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 329
    .line 330
    .line 331
    move-result p1

    .line 332
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 333
    .line 334
    goto :goto_6

    .line 335
    :cond_d
    const/16 v1, 0x1a

    .line 336
    .line 337
    if-ne p1, v1, :cond_e

    .line 338
    .line 339
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 340
    .line 341
    add-int/2addr p1, v0

    .line 342
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 343
    .line 344
    const/16 p1, 0x14

    .line 345
    .line 346
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 347
    .line 348
    iput-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 349
    .line 350
    :goto_6
    const/4 p1, 0x4

    .line 351
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 352
    .line 353
    return-object p2

    .line 354
    :cond_e
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 355
    .line 356
    return-object v2

    .line 357
    :cond_f
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 358
    .line 359
    return-object v2

    .line 360
    :cond_10
    const-string p0, "illega str"

    .line 361
    .line 362
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    return-object v2
.end method

.method public scanFieldStringArray([CILcom/alibaba/fastjson/parser/SymbolTable;)[Ljava/lang/String;
    .locals 0

    .line 366
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public scanFieldSymbol([C)J
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const-wide/16 v1, 0x0

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/4 p1, -0x2

    .line 13
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 14
    .line 15
    return-wide v1

    .line 16
    :cond_0
    array-length p1, p1

    .line 17
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 18
    .line 19
    add-int/lit8 v3, p1, 0x1

    .line 20
    .line 21
    add-int/2addr v0, p1

    .line 22
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/16 v0, 0x22

    .line 27
    .line 28
    const/4 v4, -0x1

    .line 29
    if-eq p1, v0, :cond_1

    .line 30
    .line 31
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 32
    .line 33
    return-wide v1

    .line 34
    :cond_1
    const-wide v5, -0x340d631b7bdddcdbL    # -7.302176725335867E57

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    :goto_0
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 40
    .line 41
    add-int/lit8 v7, v3, 0x1

    .line 42
    .line 43
    add-int/2addr p1, v3

    .line 44
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-ne p1, v0, :cond_8

    .line 49
    .line 50
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 51
    .line 52
    add-int/lit8 v0, v3, 0x2

    .line 53
    .line 54
    add-int/2addr p1, v7

    .line 55
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    const/16 v7, 0x2c

    .line 60
    .line 61
    if-ne p1, v7, :cond_2

    .line 62
    .line 63
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 64
    .line 65
    add-int/2addr p1, v0

    .line 66
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 73
    .line 74
    const/4 p1, 0x3

    .line 75
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 76
    .line 77
    return-wide v5

    .line 78
    :cond_2
    const/16 v8, 0x7d

    .line 79
    .line 80
    if-ne p1, v8, :cond_7

    .line 81
    .line 82
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 83
    .line 84
    add-int/lit8 v9, v3, 0x3

    .line 85
    .line 86
    add-int/2addr p1, v0

    .line 87
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-ne p1, v7, :cond_3

    .line 92
    .line 93
    const/16 p1, 0x10

    .line 94
    .line 95
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 96
    .line 97
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 98
    .line 99
    add-int/2addr p1, v9

    .line 100
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_3
    const/16 v0, 0x5d

    .line 110
    .line 111
    if-ne p1, v0, :cond_4

    .line 112
    .line 113
    const/16 p1, 0xf

    .line 114
    .line 115
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 116
    .line 117
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 118
    .line 119
    add-int/2addr p1, v9

    .line 120
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_4
    if-ne p1, v8, :cond_5

    .line 130
    .line 131
    const/16 p1, 0xd

    .line 132
    .line 133
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 134
    .line 135
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 136
    .line 137
    add-int/2addr p1, v9

    .line 138
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 139
    .line 140
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_5
    const/16 v0, 0x1a

    .line 148
    .line 149
    if-ne p1, v0, :cond_6

    .line 150
    .line 151
    const/16 p1, 0x14

    .line 152
    .line 153
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 154
    .line 155
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 156
    .line 157
    add-int/lit8 v3, v3, 0x2

    .line 158
    .line 159
    add-int/2addr p1, v3

    .line 160
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 161
    .line 162
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 163
    .line 164
    :goto_1
    const/4 p1, 0x4

    .line 165
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 166
    .line 167
    return-wide v5

    .line 168
    :cond_6
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 169
    .line 170
    return-wide v1

    .line 171
    :cond_7
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 172
    .line 173
    return-wide v1

    .line 174
    :cond_8
    int-to-long v8, p1

    .line 175
    xor-long/2addr v5, v8

    .line 176
    const-wide v8, 0x100000001b3L

    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    mul-long/2addr v5, v8

    .line 182
    const/16 v3, 0x5c

    .line 183
    .line 184
    if-ne p1, v3, :cond_9

    .line 185
    .line 186
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 187
    .line 188
    return-wide v1

    .line 189
    :cond_9
    move v3, v7

    .line 190
    goto/16 :goto_0
.end method

.method public scanFieldUUID([C)Ljava/util/UUID;
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 7
    .line 8
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    const/4 v4, -0x2

    .line 13
    const/4 v5, 0x0

    .line 14
    if-nez v3, :cond_0

    .line 15
    .line 16
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 17
    .line 18
    return-object v5

    .line 19
    :cond_0
    array-length v3, v1

    .line 20
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 21
    .line 22
    add-int/lit8 v7, v3, 0x1

    .line 23
    .line 24
    add-int/2addr v6, v3

    .line 25
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    const/16 v8, 0xd

    .line 30
    .line 31
    const/16 v9, 0x22

    .line 32
    .line 33
    const/4 v11, -0x1

    .line 34
    if-ne v6, v9, :cond_20

    .line 35
    .line 36
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 37
    .line 38
    array-length v6, v1

    .line 39
    add-int/2addr v3, v6

    .line 40
    add-int/lit8 v3, v3, 0x1

    .line 41
    .line 42
    invoke-virtual {v0, v9, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eq v3, v11, :cond_1f

    .line 47
    .line 48
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 49
    .line 50
    array-length v9, v1

    .line 51
    add-int/2addr v6, v9

    .line 52
    add-int/lit8 v6, v6, 0x1

    .line 53
    .line 54
    sub-int v9, v3, v6

    .line 55
    .line 56
    const/16 v13, 0x24

    .line 57
    .line 58
    const/16 v2, 0x46

    .line 59
    .line 60
    move-object/from16 v16, v5

    .line 61
    .line 62
    const/16 v5, 0x41

    .line 63
    .line 64
    const/16 v14, 0x66

    .line 65
    .line 66
    const/16 v15, 0x61

    .line 67
    .line 68
    const/16 v19, 0x4

    .line 69
    .line 70
    const/16 v12, 0x39

    .line 71
    .line 72
    const/16 v11, 0x30

    .line 73
    .line 74
    if-ne v9, v13, :cond_15

    .line 75
    .line 76
    const/4 v9, 0x0

    .line 77
    const-wide/16 v20, 0x0

    .line 78
    .line 79
    :goto_0
    const/16 v10, 0x8

    .line 80
    .line 81
    if-ge v9, v10, :cond_4

    .line 82
    .line 83
    add-int v10, v6, v9

    .line 84
    .line 85
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 86
    .line 87
    .line 88
    move-result v10

    .line 89
    if-lt v10, v11, :cond_1

    .line 90
    .line 91
    if-gt v10, v12, :cond_1

    .line 92
    .line 93
    add-int/lit8 v10, v10, -0x30

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_1
    if-lt v10, v15, :cond_2

    .line 97
    .line 98
    if-gt v10, v14, :cond_2

    .line 99
    .line 100
    add-int/lit8 v10, v10, -0x57

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_2
    if-lt v10, v5, :cond_3

    .line 104
    .line 105
    if-gt v10, v2, :cond_3

    .line 106
    .line 107
    add-int/lit8 v10, v10, -0x37

    .line 108
    .line 109
    :goto_1
    shl-long v20, v20, v19

    .line 110
    .line 111
    move/from16 v22, v3

    .line 112
    .line 113
    int-to-long v2, v10

    .line 114
    or-long v20, v20, v2

    .line 115
    .line 116
    add-int/lit8 v9, v9, 0x1

    .line 117
    .line 118
    move/from16 v3, v22

    .line 119
    .line 120
    const/16 v2, 0x46

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_3
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 124
    .line 125
    return-object v16

    .line 126
    :cond_4
    move/from16 v22, v3

    .line 127
    .line 128
    const/16 v2, 0x9

    .line 129
    .line 130
    :goto_2
    if-ge v2, v8, :cond_8

    .line 131
    .line 132
    add-int v3, v6, v2

    .line 133
    .line 134
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-lt v3, v11, :cond_5

    .line 139
    .line 140
    if-gt v3, v12, :cond_5

    .line 141
    .line 142
    add-int/lit8 v3, v3, -0x30

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_5
    if-lt v3, v15, :cond_6

    .line 146
    .line 147
    if-gt v3, v14, :cond_6

    .line 148
    .line 149
    add-int/lit8 v3, v3, -0x57

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_6
    if-lt v3, v5, :cond_7

    .line 153
    .line 154
    const/16 v9, 0x46

    .line 155
    .line 156
    if-gt v3, v9, :cond_7

    .line 157
    .line 158
    add-int/lit8 v3, v3, -0x37

    .line 159
    .line 160
    :goto_3
    shl-long v9, v20, v19

    .line 161
    .line 162
    move-wide/from16 v20, v9

    .line 163
    .line 164
    int-to-long v8, v3

    .line 165
    or-long v20, v20, v8

    .line 166
    .line 167
    add-int/lit8 v2, v2, 0x1

    .line 168
    .line 169
    const/16 v8, 0xd

    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_7
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 173
    .line 174
    return-object v16

    .line 175
    :cond_8
    const/16 v2, 0xe

    .line 176
    .line 177
    move-wide/from16 v8, v20

    .line 178
    .line 179
    :goto_4
    const/16 v3, 0x12

    .line 180
    .line 181
    if-ge v2, v3, :cond_c

    .line 182
    .line 183
    add-int v3, v6, v2

    .line 184
    .line 185
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    if-lt v3, v11, :cond_9

    .line 190
    .line 191
    if-gt v3, v12, :cond_9

    .line 192
    .line 193
    add-int/lit8 v3, v3, -0x30

    .line 194
    .line 195
    goto :goto_5

    .line 196
    :cond_9
    if-lt v3, v15, :cond_a

    .line 197
    .line 198
    if-gt v3, v14, :cond_a

    .line 199
    .line 200
    add-int/lit8 v3, v3, -0x57

    .line 201
    .line 202
    goto :goto_5

    .line 203
    :cond_a
    if-lt v3, v5, :cond_b

    .line 204
    .line 205
    const/16 v10, 0x46

    .line 206
    .line 207
    if-gt v3, v10, :cond_b

    .line 208
    .line 209
    add-int/lit8 v3, v3, -0x37

    .line 210
    .line 211
    :goto_5
    shl-long v8, v8, v19

    .line 212
    .line 213
    move v10, v6

    .line 214
    int-to-long v5, v3

    .line 215
    or-long/2addr v8, v5

    .line 216
    add-int/lit8 v2, v2, 0x1

    .line 217
    .line 218
    move v6, v10

    .line 219
    const/16 v5, 0x41

    .line 220
    .line 221
    goto :goto_4

    .line 222
    :cond_b
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 223
    .line 224
    return-object v16

    .line 225
    :cond_c
    move v10, v6

    .line 226
    const/16 v2, 0x13

    .line 227
    .line 228
    const-wide/16 v17, 0x0

    .line 229
    .line 230
    :goto_6
    const/16 v3, 0x17

    .line 231
    .line 232
    if-ge v2, v3, :cond_10

    .line 233
    .line 234
    add-int v6, v10, v2

    .line 235
    .line 236
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    if-lt v3, v11, :cond_d

    .line 241
    .line 242
    if-gt v3, v12, :cond_d

    .line 243
    .line 244
    add-int/lit8 v3, v3, -0x30

    .line 245
    .line 246
    goto :goto_7

    .line 247
    :cond_d
    if-lt v3, v15, :cond_e

    .line 248
    .line 249
    if-gt v3, v14, :cond_e

    .line 250
    .line 251
    add-int/lit8 v3, v3, -0x57

    .line 252
    .line 253
    goto :goto_7

    .line 254
    :cond_e
    const/16 v5, 0x41

    .line 255
    .line 256
    if-lt v3, v5, :cond_f

    .line 257
    .line 258
    const/16 v5, 0x46

    .line 259
    .line 260
    if-gt v3, v5, :cond_f

    .line 261
    .line 262
    add-int/lit8 v3, v3, -0x37

    .line 263
    .line 264
    :goto_7
    shl-long v5, v17, v19

    .line 265
    .line 266
    int-to-long v14, v3

    .line 267
    or-long v17, v5, v14

    .line 268
    .line 269
    add-int/lit8 v2, v2, 0x1

    .line 270
    .line 271
    const/16 v14, 0x66

    .line 272
    .line 273
    const/16 v15, 0x61

    .line 274
    .line 275
    goto :goto_6

    .line 276
    :cond_f
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 277
    .line 278
    return-object v16

    .line 279
    :cond_10
    const/16 v2, 0x18

    .line 280
    .line 281
    move-wide/from16 v5, v17

    .line 282
    .line 283
    :goto_8
    if-ge v2, v13, :cond_14

    .line 284
    .line 285
    add-int v3, v10, v2

    .line 286
    .line 287
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 288
    .line 289
    .line 290
    move-result v3

    .line 291
    if-lt v3, v11, :cond_11

    .line 292
    .line 293
    if-gt v3, v12, :cond_11

    .line 294
    .line 295
    add-int/lit8 v3, v3, -0x30

    .line 296
    .line 297
    goto :goto_9

    .line 298
    :cond_11
    const/16 v14, 0x61

    .line 299
    .line 300
    if-lt v3, v14, :cond_12

    .line 301
    .line 302
    const/16 v14, 0x66

    .line 303
    .line 304
    if-gt v3, v14, :cond_12

    .line 305
    .line 306
    add-int/lit8 v3, v3, -0x57

    .line 307
    .line 308
    goto :goto_9

    .line 309
    :cond_12
    const/16 v14, 0x41

    .line 310
    .line 311
    if-lt v3, v14, :cond_13

    .line 312
    .line 313
    const/16 v14, 0x46

    .line 314
    .line 315
    if-gt v3, v14, :cond_13

    .line 316
    .line 317
    add-int/lit8 v3, v3, -0x37

    .line 318
    .line 319
    :goto_9
    shl-long v5, v5, v19

    .line 320
    .line 321
    int-to-long v14, v3

    .line 322
    or-long/2addr v5, v14

    .line 323
    add-int/lit8 v2, v2, 0x1

    .line 324
    .line 325
    goto :goto_8

    .line 326
    :cond_13
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 327
    .line 328
    return-object v16

    .line 329
    :cond_14
    new-instance v2, Ljava/util/UUID;

    .line 330
    .line 331
    invoke-direct {v2, v8, v9, v5, v6}, Ljava/util/UUID;-><init>(JJ)V

    .line 332
    .line 333
    .line 334
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 335
    .line 336
    array-length v1, v1

    .line 337
    add-int/2addr v1, v3

    .line 338
    add-int/lit8 v1, v1, 0x1

    .line 339
    .line 340
    sub-int v1, v22, v1

    .line 341
    .line 342
    add-int/lit8 v1, v1, 0x1

    .line 343
    .line 344
    add-int/2addr v7, v1

    .line 345
    add-int/lit8 v1, v7, 0x1

    .line 346
    .line 347
    add-int/2addr v3, v7

    .line 348
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 349
    .line 350
    .line 351
    move-result v3

    .line 352
    goto/16 :goto_e

    .line 353
    .line 354
    :cond_15
    move/from16 v22, v3

    .line 355
    .line 356
    move v10, v6

    .line 357
    const/16 v2, 0x20

    .line 358
    .line 359
    if-ne v9, v2, :cond_1e

    .line 360
    .line 361
    const/4 v3, 0x0

    .line 362
    const-wide/16 v5, 0x0

    .line 363
    .line 364
    :goto_a
    const/16 v8, 0x10

    .line 365
    .line 366
    if-ge v3, v8, :cond_19

    .line 367
    .line 368
    add-int v8, v10, v3

    .line 369
    .line 370
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 371
    .line 372
    .line 373
    move-result v8

    .line 374
    if-lt v8, v11, :cond_16

    .line 375
    .line 376
    if-gt v8, v12, :cond_16

    .line 377
    .line 378
    add-int/lit8 v8, v8, -0x30

    .line 379
    .line 380
    goto :goto_b

    .line 381
    :cond_16
    const/16 v14, 0x61

    .line 382
    .line 383
    if-lt v8, v14, :cond_17

    .line 384
    .line 385
    const/16 v14, 0x66

    .line 386
    .line 387
    if-gt v8, v14, :cond_17

    .line 388
    .line 389
    add-int/lit8 v8, v8, -0x57

    .line 390
    .line 391
    goto :goto_b

    .line 392
    :cond_17
    const/16 v14, 0x41

    .line 393
    .line 394
    if-lt v8, v14, :cond_18

    .line 395
    .line 396
    const/16 v14, 0x46

    .line 397
    .line 398
    if-gt v8, v14, :cond_18

    .line 399
    .line 400
    add-int/lit8 v8, v8, -0x37

    .line 401
    .line 402
    :goto_b
    shl-long v5, v5, v19

    .line 403
    .line 404
    int-to-long v8, v8

    .line 405
    or-long/2addr v5, v8

    .line 406
    add-int/lit8 v3, v3, 0x1

    .line 407
    .line 408
    goto :goto_a

    .line 409
    :cond_18
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 410
    .line 411
    return-object v16

    .line 412
    :cond_19
    const/16 v8, 0x10

    .line 413
    .line 414
    const-wide/16 v14, 0x0

    .line 415
    .line 416
    :goto_c
    if-ge v8, v2, :cond_1d

    .line 417
    .line 418
    add-int v3, v10, v8

    .line 419
    .line 420
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 421
    .line 422
    .line 423
    move-result v3

    .line 424
    if-lt v3, v11, :cond_1a

    .line 425
    .line 426
    if-gt v3, v12, :cond_1a

    .line 427
    .line 428
    add-int/lit8 v3, v3, -0x30

    .line 429
    .line 430
    const/16 v2, 0x46

    .line 431
    .line 432
    const/16 v9, 0x61

    .line 433
    .line 434
    const/16 v13, 0x66

    .line 435
    .line 436
    goto :goto_d

    .line 437
    :cond_1a
    const/16 v9, 0x61

    .line 438
    .line 439
    const/16 v13, 0x66

    .line 440
    .line 441
    if-lt v3, v9, :cond_1b

    .line 442
    .line 443
    if-gt v3, v13, :cond_1b

    .line 444
    .line 445
    add-int/lit8 v3, v3, -0x57

    .line 446
    .line 447
    const/16 v2, 0x46

    .line 448
    .line 449
    goto :goto_d

    .line 450
    :cond_1b
    const/16 v2, 0x41

    .line 451
    .line 452
    if-lt v3, v2, :cond_1c

    .line 453
    .line 454
    const/16 v2, 0x46

    .line 455
    .line 456
    if-gt v3, v2, :cond_1c

    .line 457
    .line 458
    add-int/lit8 v3, v3, -0x37

    .line 459
    .line 460
    :goto_d
    shl-long v14, v14, v19

    .line 461
    .line 462
    int-to-long v2, v3

    .line 463
    or-long/2addr v14, v2

    .line 464
    add-int/lit8 v8, v8, 0x1

    .line 465
    .line 466
    const/16 v2, 0x20

    .line 467
    .line 468
    goto :goto_c

    .line 469
    :cond_1c
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 470
    .line 471
    return-object v16

    .line 472
    :cond_1d
    new-instance v2, Ljava/util/UUID;

    .line 473
    .line 474
    invoke-direct {v2, v5, v6, v14, v15}, Ljava/util/UUID;-><init>(JJ)V

    .line 475
    .line 476
    .line 477
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 478
    .line 479
    array-length v1, v1

    .line 480
    add-int/2addr v1, v3

    .line 481
    add-int/lit8 v1, v1, 0x1

    .line 482
    .line 483
    sub-int v1, v22, v1

    .line 484
    .line 485
    add-int/lit8 v1, v1, 0x1

    .line 486
    .line 487
    add-int/2addr v7, v1

    .line 488
    add-int/lit8 v1, v7, 0x1

    .line 489
    .line 490
    add-int/2addr v3, v7

    .line 491
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 492
    .line 493
    .line 494
    move-result v3

    .line 495
    goto :goto_e

    .line 496
    :cond_1e
    const/4 v1, -0x1

    .line 497
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 498
    .line 499
    return-object v16

    .line 500
    :cond_1f
    move-object/from16 v16, v5

    .line 501
    .line 502
    const-string v0, "unclosed str"

    .line 503
    .line 504
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 505
    .line 506
    .line 507
    return-object v16

    .line 508
    :cond_20
    move-object/from16 v16, v5

    .line 509
    .line 510
    const/16 v19, 0x4

    .line 511
    .line 512
    const/16 v1, 0x6e

    .line 513
    .line 514
    if-ne v6, v1, :cond_27

    .line 515
    .line 516
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 517
    .line 518
    add-int/lit8 v2, v3, 0x2

    .line 519
    .line 520
    add-int/2addr v1, v7

    .line 521
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 522
    .line 523
    .line 524
    move-result v1

    .line 525
    const/16 v4, 0x75

    .line 526
    .line 527
    if-ne v1, v4, :cond_27

    .line 528
    .line 529
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 530
    .line 531
    add-int/lit8 v4, v3, 0x3

    .line 532
    .line 533
    add-int/2addr v1, v2

    .line 534
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 535
    .line 536
    .line 537
    move-result v1

    .line 538
    const/16 v2, 0x6c

    .line 539
    .line 540
    if-ne v1, v2, :cond_27

    .line 541
    .line 542
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 543
    .line 544
    add-int/lit8 v5, v3, 0x4

    .line 545
    .line 546
    add-int/2addr v1, v4

    .line 547
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 548
    .line 549
    .line 550
    move-result v1

    .line 551
    if-ne v1, v2, :cond_27

    .line 552
    .line 553
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 554
    .line 555
    add-int/lit8 v2, v3, 0x5

    .line 556
    .line 557
    add-int/2addr v1, v5

    .line 558
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 559
    .line 560
    .line 561
    move-result v3

    .line 562
    move v1, v2

    .line 563
    move-object/from16 v2, v16

    .line 564
    .line 565
    :goto_e
    const/16 v4, 0x2c

    .line 566
    .line 567
    if-ne v3, v4, :cond_21

    .line 568
    .line 569
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 570
    .line 571
    add-int/2addr v3, v1

    .line 572
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 573
    .line 574
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 575
    .line 576
    .line 577
    move-result v1

    .line 578
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 579
    .line 580
    const/4 v1, 0x3

    .line 581
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 582
    .line 583
    return-object v2

    .line 584
    :cond_21
    const/16 v5, 0x7d

    .line 585
    .line 586
    if-ne v3, v5, :cond_26

    .line 587
    .line 588
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 589
    .line 590
    add-int/lit8 v6, v1, 0x1

    .line 591
    .line 592
    add-int/2addr v3, v1

    .line 593
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 594
    .line 595
    .line 596
    move-result v3

    .line 597
    if-ne v3, v4, :cond_22

    .line 598
    .line 599
    const/16 v8, 0x10

    .line 600
    .line 601
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 602
    .line 603
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 604
    .line 605
    add-int/2addr v1, v6

    .line 606
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 607
    .line 608
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 609
    .line 610
    .line 611
    move-result v1

    .line 612
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 613
    .line 614
    :goto_f
    move/from16 v1, v19

    .line 615
    .line 616
    goto :goto_10

    .line 617
    :cond_22
    const/16 v4, 0x5d

    .line 618
    .line 619
    if-ne v3, v4, :cond_23

    .line 620
    .line 621
    const/16 v1, 0xf

    .line 622
    .line 623
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 624
    .line 625
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 626
    .line 627
    add-int/2addr v1, v6

    .line 628
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 629
    .line 630
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 631
    .line 632
    .line 633
    move-result v1

    .line 634
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 635
    .line 636
    goto :goto_f

    .line 637
    :cond_23
    if-ne v3, v5, :cond_24

    .line 638
    .line 639
    const/16 v4, 0xd

    .line 640
    .line 641
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 642
    .line 643
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 644
    .line 645
    add-int/2addr v1, v6

    .line 646
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 647
    .line 648
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 649
    .line 650
    .line 651
    move-result v1

    .line 652
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 653
    .line 654
    goto :goto_f

    .line 655
    :cond_24
    const/16 v4, 0x1a

    .line 656
    .line 657
    if-ne v3, v4, :cond_25

    .line 658
    .line 659
    const/16 v3, 0x14

    .line 660
    .line 661
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 662
    .line 663
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 664
    .line 665
    add-int/2addr v3, v1

    .line 666
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 667
    .line 668
    iput-char v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 669
    .line 670
    goto :goto_f

    .line 671
    :goto_10
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 672
    .line 673
    return-object v2

    .line 674
    :cond_25
    const/4 v1, -0x1

    .line 675
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 676
    .line 677
    return-object v16

    .line 678
    :cond_26
    const/4 v1, -0x1

    .line 679
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 680
    .line 681
    return-object v16

    .line 682
    :cond_27
    const/4 v1, -0x1

    .line 683
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 684
    .line 685
    return-object v16
.end method

.method public final scanFloat(C)F
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 7
    .line 8
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x1

    .line 13
    const/16 v4, 0x22

    .line 14
    .line 15
    if-ne v2, v4, :cond_0

    .line 16
    .line 17
    move v5, v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v5, v1

    .line 20
    :goto_0
    if-eqz v5, :cond_1

    .line 21
    .line 22
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 23
    .line 24
    add-int/2addr v2, v3

    .line 25
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v7, 0x2

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v7, v3

    .line 32
    :goto_1
    const/16 v8, 0x2d

    .line 33
    .line 34
    if-ne v2, v8, :cond_2

    .line 35
    .line 36
    move v9, v3

    .line 37
    goto :goto_2

    .line 38
    :cond_2
    move v9, v1

    .line 39
    :goto_2
    if-eqz v9, :cond_3

    .line 40
    .line 41
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 42
    .line 43
    add-int/lit8 v10, v7, 0x1

    .line 44
    .line 45
    add-int/2addr v2, v7

    .line 46
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    move v7, v10

    .line 51
    :cond_3
    const/4 v12, -0x1

    .line 52
    const/16 v13, 0x30

    .line 53
    .line 54
    if-lt v2, v13, :cond_12

    .line 55
    .line 56
    const/16 v14, 0x39

    .line 57
    .line 58
    if-gt v2, v14, :cond_12

    .line 59
    .line 60
    sub-int/2addr v2, v13

    .line 61
    int-to-long v1, v2

    .line 62
    move/from16 v16, v3

    .line 63
    .line 64
    :goto_3
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 65
    .line 66
    add-int/lit8 v17, v7, 0x1

    .line 67
    .line 68
    add-int/2addr v3, v7

    .line 69
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    const-wide/16 v18, 0xa

    .line 74
    .line 75
    if-lt v3, v13, :cond_4

    .line 76
    .line 77
    if-gt v3, v14, :cond_4

    .line 78
    .line 79
    mul-long v1, v1, v18

    .line 80
    .line 81
    add-int/lit8 v3, v3, -0x30

    .line 82
    .line 83
    const/16 v20, 0x2

    .line 84
    .line 85
    int-to-long v6, v3

    .line 86
    add-long/2addr v1, v6

    .line 87
    move/from16 v7, v17

    .line 88
    .line 89
    goto :goto_3

    .line 90
    :cond_4
    const/16 v20, 0x2

    .line 91
    .line 92
    const/16 v6, 0x2e

    .line 93
    .line 94
    if-ne v3, v6, :cond_6

    .line 95
    .line 96
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 97
    .line 98
    add-int/lit8 v7, v7, 0x2

    .line 99
    .line 100
    add-int v3, v3, v17

    .line 101
    .line 102
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-lt v3, v13, :cond_5

    .line 107
    .line 108
    if-gt v3, v14, :cond_5

    .line 109
    .line 110
    mul-long v1, v1, v18

    .line 111
    .line 112
    sub-int/2addr v3, v13

    .line 113
    const/16 v21, 0x0

    .line 114
    .line 115
    int-to-long v10, v3

    .line 116
    add-long/2addr v1, v10

    .line 117
    move-wide/from16 v10, v18

    .line 118
    .line 119
    :goto_4
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 120
    .line 121
    add-int/lit8 v17, v7, 0x1

    .line 122
    .line 123
    add-int/2addr v3, v7

    .line 124
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    if-lt v3, v13, :cond_7

    .line 129
    .line 130
    if-gt v3, v14, :cond_7

    .line 131
    .line 132
    mul-long v1, v1, v18

    .line 133
    .line 134
    add-int/lit8 v3, v3, -0x30

    .line 135
    .line 136
    int-to-long v6, v3

    .line 137
    add-long/2addr v1, v6

    .line 138
    mul-long v10, v10, v18

    .line 139
    .line 140
    move/from16 v7, v17

    .line 141
    .line 142
    goto :goto_4

    .line 143
    :cond_5
    const/16 v21, 0x0

    .line 144
    .line 145
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 146
    .line 147
    return v21

    .line 148
    :cond_6
    const/16 v21, 0x0

    .line 149
    .line 150
    const-wide/16 v10, 0x1

    .line 151
    .line 152
    :cond_7
    const/16 v6, 0x65

    .line 153
    .line 154
    if-eq v3, v6, :cond_9

    .line 155
    .line 156
    const/16 v6, 0x45

    .line 157
    .line 158
    if-ne v3, v6, :cond_8

    .line 159
    .line 160
    goto :goto_5

    .line 161
    :cond_8
    const/4 v15, 0x0

    .line 162
    goto :goto_6

    .line 163
    :cond_9
    :goto_5
    move/from16 v15, v16

    .line 164
    .line 165
    :goto_6
    if-eqz v15, :cond_c

    .line 166
    .line 167
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 168
    .line 169
    add-int/lit8 v6, v17, 0x1

    .line 170
    .line 171
    add-int v3, v3, v17

    .line 172
    .line 173
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    const/16 v7, 0x2b

    .line 178
    .line 179
    if-eq v3, v7, :cond_b

    .line 180
    .line 181
    if-ne v3, v8, :cond_a

    .line 182
    .line 183
    goto :goto_8

    .line 184
    :cond_a
    :goto_7
    move/from16 v17, v6

    .line 185
    .line 186
    goto :goto_9

    .line 187
    :cond_b
    :goto_8
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 188
    .line 189
    add-int/lit8 v17, v17, 0x2

    .line 190
    .line 191
    add-int/2addr v3, v6

    .line 192
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    :goto_9
    if-lt v3, v13, :cond_c

    .line 197
    .line 198
    if-gt v3, v14, :cond_c

    .line 199
    .line 200
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 201
    .line 202
    add-int/lit8 v6, v17, 0x1

    .line 203
    .line 204
    add-int v3, v3, v17

    .line 205
    .line 206
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    goto :goto_7

    .line 211
    :cond_c
    if-eqz v5, :cond_e

    .line 212
    .line 213
    if-eq v3, v4, :cond_d

    .line 214
    .line 215
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 216
    .line 217
    return v21

    .line 218
    :cond_d
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 219
    .line 220
    add-int/lit8 v4, v17, 0x1

    .line 221
    .line 222
    add-int v3, v3, v17

    .line 223
    .line 224
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 225
    .line 226
    .line 227
    move-result v3

    .line 228
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 229
    .line 230
    add-int/lit8 v6, v5, 0x1

    .line 231
    .line 232
    add-int/2addr v5, v4

    .line 233
    sub-int/2addr v5, v6

    .line 234
    add-int/lit8 v5, v5, -0x2

    .line 235
    .line 236
    move/from16 v17, v4

    .line 237
    .line 238
    goto :goto_a

    .line 239
    :cond_e
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 240
    .line 241
    add-int v4, v6, v17

    .line 242
    .line 243
    sub-int/2addr v4, v6

    .line 244
    add-int/lit8 v5, v4, -0x1

    .line 245
    .line 246
    :goto_a
    if-nez v15, :cond_10

    .line 247
    .line 248
    const/16 v4, 0x11

    .line 249
    .line 250
    if-ge v5, v4, :cond_10

    .line 251
    .line 252
    long-to-double v1, v1

    .line 253
    long-to-double v4, v10

    .line 254
    div-double/2addr v1, v4

    .line 255
    double-to-float v1, v1

    .line 256
    if-eqz v9, :cond_f

    .line 257
    .line 258
    neg-float v1, v1

    .line 259
    :cond_f
    :goto_b
    move/from16 v2, p1

    .line 260
    .line 261
    goto :goto_c

    .line 262
    :cond_10
    invoke-virtual {v0, v6, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    goto :goto_b

    .line 271
    :goto_c
    if-ne v3, v2, :cond_11

    .line 272
    .line 273
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 274
    .line 275
    add-int v2, v2, v17

    .line 276
    .line 277
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 278
    .line 279
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 280
    .line 281
    .line 282
    move-result v2

    .line 283
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 284
    .line 285
    const/4 v2, 0x3

    .line 286
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 287
    .line 288
    const/16 v6, 0x10

    .line 289
    .line 290
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 291
    .line 292
    return v1

    .line 293
    :cond_11
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 294
    .line 295
    return v1

    .line 296
    :cond_12
    move/from16 v16, v3

    .line 297
    .line 298
    const/16 v20, 0x2

    .line 299
    .line 300
    const/16 v21, 0x0

    .line 301
    .line 302
    const/16 v1, 0x6e

    .line 303
    .line 304
    if-ne v2, v1, :cond_17

    .line 305
    .line 306
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 307
    .line 308
    add-int/2addr v1, v7

    .line 309
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 310
    .line 311
    .line 312
    move-result v1

    .line 313
    const/16 v2, 0x75

    .line 314
    .line 315
    if-ne v1, v2, :cond_17

    .line 316
    .line 317
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 318
    .line 319
    add-int/2addr v1, v7

    .line 320
    add-int/lit8 v1, v1, 0x1

    .line 321
    .line 322
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 323
    .line 324
    .line 325
    move-result v1

    .line 326
    const/16 v2, 0x6c

    .line 327
    .line 328
    if-ne v1, v2, :cond_17

    .line 329
    .line 330
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 331
    .line 332
    add-int/2addr v1, v7

    .line 333
    add-int/lit8 v1, v1, 0x2

    .line 334
    .line 335
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 336
    .line 337
    .line 338
    move-result v1

    .line 339
    if-ne v1, v2, :cond_17

    .line 340
    .line 341
    const/4 v1, 0x5

    .line 342
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 343
    .line 344
    add-int/lit8 v2, v7, 0x3

    .line 345
    .line 346
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 347
    .line 348
    add-int/lit8 v8, v7, 0x4

    .line 349
    .line 350
    add-int/2addr v3, v2

    .line 351
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 352
    .line 353
    .line 354
    move-result v2

    .line 355
    if-eqz v5, :cond_13

    .line 356
    .line 357
    if-ne v2, v4, :cond_13

    .line 358
    .line 359
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 360
    .line 361
    add-int/2addr v7, v1

    .line 362
    add-int/2addr v2, v8

    .line 363
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 364
    .line 365
    .line 366
    move-result v2

    .line 367
    move v8, v7

    .line 368
    :cond_13
    :goto_d
    const/16 v3, 0x2c

    .line 369
    .line 370
    if-ne v2, v3, :cond_14

    .line 371
    .line 372
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 373
    .line 374
    add-int/2addr v2, v8

    .line 375
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 376
    .line 377
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 378
    .line 379
    .line 380
    move-result v2

    .line 381
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 382
    .line 383
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 384
    .line 385
    const/16 v6, 0x10

    .line 386
    .line 387
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 388
    .line 389
    return v21

    .line 390
    :cond_14
    const/16 v6, 0x10

    .line 391
    .line 392
    const/16 v3, 0x5d

    .line 393
    .line 394
    if-ne v2, v3, :cond_15

    .line 395
    .line 396
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 397
    .line 398
    add-int/2addr v2, v8

    .line 399
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 400
    .line 401
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 402
    .line 403
    .line 404
    move-result v2

    .line 405
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 406
    .line 407
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 408
    .line 409
    const/16 v1, 0xf

    .line 410
    .line 411
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 412
    .line 413
    return v21

    .line 414
    :cond_15
    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 415
    .line 416
    .line 417
    move-result v2

    .line 418
    if-eqz v2, :cond_16

    .line 419
    .line 420
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 421
    .line 422
    add-int/lit8 v3, v8, 0x1

    .line 423
    .line 424
    add-int/2addr v2, v8

    .line 425
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 426
    .line 427
    .line 428
    move-result v2

    .line 429
    move v8, v3

    .line 430
    goto :goto_d

    .line 431
    :cond_16
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 432
    .line 433
    return v21

    .line 434
    :cond_17
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 435
    .line 436
    return v21
.end method

.method public final scanHex()V
    .locals 5

    .line 1
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2
    .line 3
    const/16 v1, 0x78

    .line 4
    .line 5
    const-string v2, "illegal state. "

    .line 6
    .line 7
    if-ne v0, v1, :cond_6

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 10
    .line 11
    .line 12
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 13
    .line 14
    const/16 v1, 0x27

    .line 15
    .line 16
    if-ne v0, v1, :cond_5

    .line 17
    .line 18
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 19
    .line 20
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 23
    .line 24
    .line 25
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 26
    .line 27
    const/16 v3, 0x1a

    .line 28
    .line 29
    if-ne v0, v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 32
    .line 33
    .line 34
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/16 v4, 0x30

    .line 42
    .line 43
    if-lt v0, v4, :cond_1

    .line 44
    .line 45
    const/16 v4, 0x39

    .line 46
    .line 47
    if-le v0, v4, :cond_2

    .line 48
    .line 49
    :cond_1
    const/16 v4, 0x41

    .line 50
    .line 51
    if-lt v0, v4, :cond_3

    .line 52
    .line 53
    const/16 v4, 0x46

    .line 54
    .line 55
    if-gt v0, v4, :cond_3

    .line 56
    .line 57
    :cond_2
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 58
    .line 59
    add-int/lit8 v0, v0, 0x1

    .line 60
    .line 61
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    if-ne v0, v1, :cond_4

    .line 65
    .line 66
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 67
    .line 68
    add-int/lit8 v0, v0, 0x1

    .line 69
    .line 70
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 73
    .line 74
    .line 75
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 76
    .line 77
    return-void

    .line 78
    :cond_4
    new-instance p0, Lcom/alibaba/fastjson/JSONException;

    .line 79
    .line 80
    new-instance v1, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    throw p0

    .line 96
    :cond_5
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    .line 97
    .line 98
    iget-char p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 99
    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    throw v0

    .line 116
    :cond_6
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    .line 117
    .line 118
    iget-char p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 119
    .line 120
    new-instance v1, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    throw v0
.end method

.method public final scanIdent()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 9
    .line 10
    :goto_0
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 11
    .line 12
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 17
    .line 18
    .line 19
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringVal()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "null"

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    const/16 v0, 0x8

    .line 41
    .line 42
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    const-string v1, "new"

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    const/16 v0, 0x9

    .line 54
    .line 55
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    const-string v1, "true"

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    const/4 v0, 0x6

    .line 67
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    const-string v1, "false"

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_4

    .line 77
    .line 78
    const/4 v0, 0x7

    .line 79
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 80
    .line 81
    return-void

    .line 82
    :cond_4
    const-string v1, "undefined"

    .line 83
    .line 84
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_5

    .line 89
    .line 90
    const/16 v0, 0x17

    .line 91
    .line 92
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 93
    .line 94
    return-void

    .line 95
    :cond_5
    const-string v1, "Set"

    .line 96
    .line 97
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_6

    .line 102
    .line 103
    const/16 v0, 0x15

    .line 104
    .line 105
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 106
    .line 107
    return-void

    .line 108
    :cond_6
    const-string v1, "TreeSet"

    .line 109
    .line 110
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_7

    .line 115
    .line 116
    const/16 v0, 0x16

    .line 117
    .line 118
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 119
    .line 120
    return-void

    .line 121
    :cond_7
    const/16 v0, 0x12

    .line 122
    .line 123
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 124
    .line 125
    return-void
.end method

.method public scanInt(C)I
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    const/16 v3, 0x22

    .line 12
    .line 13
    if-ne v1, v3, :cond_0

    .line 14
    .line 15
    move v4, v2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v4, v0

    .line 18
    :goto_0
    const/4 v5, 0x2

    .line 19
    if-eqz v4, :cond_1

    .line 20
    .line 21
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 22
    .line 23
    add-int/2addr v1, v2

    .line 24
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    move v6, v5

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v6, v2

    .line 31
    :goto_1
    const/16 v7, 0x2d

    .line 32
    .line 33
    if-ne v1, v7, :cond_2

    .line 34
    .line 35
    move v7, v2

    .line 36
    goto :goto_2

    .line 37
    :cond_2
    move v7, v0

    .line 38
    :goto_2
    if-eqz v7, :cond_3

    .line 39
    .line 40
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 41
    .line 42
    add-int/lit8 v8, v6, 0x1

    .line 43
    .line 44
    add-int/2addr v1, v6

    .line 45
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    move v6, v8

    .line 50
    :cond_3
    const/16 v8, 0x10

    .line 51
    .line 52
    const/16 v9, 0x30

    .line 53
    .line 54
    const/4 v10, -0x1

    .line 55
    if-lt v1, v9, :cond_a

    .line 56
    .line 57
    const/16 v11, 0x39

    .line 58
    .line 59
    if-gt v1, v11, :cond_a

    .line 60
    .line 61
    sub-int/2addr v1, v9

    .line 62
    :goto_3
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 63
    .line 64
    add-int/lit8 v3, v6, 0x1

    .line 65
    .line 66
    add-int/2addr v2, v6

    .line 67
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-lt v2, v9, :cond_4

    .line 72
    .line 73
    if-gt v2, v11, :cond_4

    .line 74
    .line 75
    mul-int/lit8 v1, v1, 0xa

    .line 76
    .line 77
    add-int/lit8 v2, v2, -0x30

    .line 78
    .line 79
    add-int/2addr v1, v2

    .line 80
    move v6, v3

    .line 81
    goto :goto_3

    .line 82
    :cond_4
    const/16 v4, 0x2e

    .line 83
    .line 84
    if-ne v2, v4, :cond_5

    .line 85
    .line 86
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 87
    .line 88
    return v0

    .line 89
    :cond_5
    if-gez v1, :cond_6

    .line 90
    .line 91
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 92
    .line 93
    return v0

    .line 94
    :cond_6
    :goto_4
    if-ne v2, p1, :cond_7

    .line 95
    .line 96
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 97
    .line 98
    add-int/2addr p1, v3

    .line 99
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 106
    .line 107
    const/4 p1, 0x3

    .line 108
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 109
    .line 110
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 111
    .line 112
    if-eqz v7, :cond_9

    .line 113
    .line 114
    neg-int p0, v1

    .line 115
    return p0

    .line 116
    :cond_7
    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_8

    .line 121
    .line 122
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 123
    .line 124
    add-int/lit8 v2, v3, 0x1

    .line 125
    .line 126
    add-int/2addr v0, v3

    .line 127
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    move v3, v2

    .line 132
    move v2, v0

    .line 133
    goto :goto_4

    .line 134
    :cond_8
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 135
    .line 136
    if-eqz v7, :cond_9

    .line 137
    .line 138
    neg-int p0, v1

    .line 139
    return p0

    .line 140
    :cond_9
    return v1

    .line 141
    :cond_a
    const/16 p1, 0x6e

    .line 142
    .line 143
    if-ne v1, p1, :cond_f

    .line 144
    .line 145
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 146
    .line 147
    add-int/2addr p1, v6

    .line 148
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    const/16 v1, 0x75

    .line 153
    .line 154
    if-ne p1, v1, :cond_f

    .line 155
    .line 156
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 157
    .line 158
    add-int/2addr p1, v6

    .line 159
    add-int/2addr p1, v2

    .line 160
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    const/16 v1, 0x6c

    .line 165
    .line 166
    if-ne p1, v1, :cond_f

    .line 167
    .line 168
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 169
    .line 170
    add-int/2addr p1, v6

    .line 171
    add-int/2addr p1, v5

    .line 172
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-ne p1, v1, :cond_f

    .line 177
    .line 178
    const/4 p1, 0x5

    .line 179
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 180
    .line 181
    add-int/lit8 v1, v6, 0x3

    .line 182
    .line 183
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 184
    .line 185
    add-int/lit8 v5, v6, 0x4

    .line 186
    .line 187
    add-int/2addr v2, v1

    .line 188
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    if-eqz v4, :cond_b

    .line 193
    .line 194
    if-ne v1, v3, :cond_b

    .line 195
    .line 196
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 197
    .line 198
    add-int/2addr v6, p1

    .line 199
    add-int/2addr v1, v5

    .line 200
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    move v5, v6

    .line 205
    :cond_b
    :goto_5
    const/16 v2, 0x2c

    .line 206
    .line 207
    if-ne v1, v2, :cond_c

    .line 208
    .line 209
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 210
    .line 211
    add-int/2addr v1, v5

    .line 212
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 213
    .line 214
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    iput-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 219
    .line 220
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 221
    .line 222
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 223
    .line 224
    return v0

    .line 225
    :cond_c
    const/16 v2, 0x5d

    .line 226
    .line 227
    if-ne v1, v2, :cond_d

    .line 228
    .line 229
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 230
    .line 231
    add-int/2addr v1, v5

    .line 232
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 233
    .line 234
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    iput-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 239
    .line 240
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 241
    .line 242
    const/16 p1, 0xf

    .line 243
    .line 244
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 245
    .line 246
    return v0

    .line 247
    :cond_d
    invoke-static {v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-eqz v1, :cond_e

    .line 252
    .line 253
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 254
    .line 255
    add-int/lit8 v2, v5, 0x1

    .line 256
    .line 257
    add-int/2addr v1, v5

    .line 258
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 259
    .line 260
    .line 261
    move-result v1

    .line 262
    move v5, v2

    .line 263
    goto :goto_5

    .line 264
    :cond_e
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 265
    .line 266
    return v0

    .line 267
    :cond_f
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 268
    .line 269
    return v0
.end method

.method public scanLong(C)J
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 7
    .line 8
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x1

    .line 13
    const/16 v4, 0x22

    .line 14
    .line 15
    if-ne v2, v4, :cond_0

    .line 16
    .line 17
    move v5, v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v5, v1

    .line 20
    :goto_0
    if-eqz v5, :cond_1

    .line 21
    .line 22
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 23
    .line 24
    add-int/2addr v2, v3

    .line 25
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v7, 0x2

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v7, v3

    .line 32
    :goto_1
    const/16 v8, 0x2d

    .line 33
    .line 34
    if-ne v2, v8, :cond_2

    .line 35
    .line 36
    move v1, v3

    .line 37
    :cond_2
    if-eqz v1, :cond_3

    .line 38
    .line 39
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 40
    .line 41
    add-int/lit8 v8, v7, 0x1

    .line 42
    .line 43
    add-int/2addr v2, v7

    .line 44
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    move v7, v8

    .line 49
    :cond_3
    const/16 v8, 0x10

    .line 50
    .line 51
    const/16 v9, 0x30

    .line 52
    .line 53
    const/4 v10, -0x1

    .line 54
    const-wide/16 v11, 0x0

    .line 55
    .line 56
    if-lt v2, v9, :cond_d

    .line 57
    .line 58
    const/16 v13, 0x39

    .line 59
    .line 60
    if-gt v2, v13, :cond_d

    .line 61
    .line 62
    sub-int/2addr v2, v9

    .line 63
    int-to-long v2, v2

    .line 64
    :goto_2
    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 65
    .line 66
    add-int/lit8 v15, v7, 0x1

    .line 67
    .line 68
    add-int/2addr v14, v7

    .line 69
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 70
    .line 71
    .line 72
    move-result v14

    .line 73
    if-lt v14, v9, :cond_4

    .line 74
    .line 75
    if-gt v14, v13, :cond_4

    .line 76
    .line 77
    const-wide/16 v16, 0xa

    .line 78
    .line 79
    mul-long v2, v2, v16

    .line 80
    .line 81
    add-int/lit8 v14, v14, -0x30

    .line 82
    .line 83
    const/16 v16, 0x2

    .line 84
    .line 85
    int-to-long v6, v14

    .line 86
    add-long/2addr v2, v6

    .line 87
    move v7, v15

    .line 88
    goto :goto_2

    .line 89
    :cond_4
    const/16 v16, 0x2

    .line 90
    .line 91
    const/16 v6, 0x2e

    .line 92
    .line 93
    if-ne v14, v6, :cond_5

    .line 94
    .line 95
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 96
    .line 97
    return-wide v11

    .line 98
    :cond_5
    cmp-long v6, v2, v11

    .line 99
    .line 100
    if-gez v6, :cond_7

    .line 101
    .line 102
    const-wide/high16 v17, -0x8000000000000000L

    .line 103
    .line 104
    cmp-long v6, v2, v17

    .line 105
    .line 106
    if-nez v6, :cond_6

    .line 107
    .line 108
    if-eqz v1, :cond_6

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_6
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 112
    .line 113
    invoke-virtual {v0, v1, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    new-instance v1, Ljava/lang/NumberFormatException;

    .line 118
    .line 119
    invoke-direct {v1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    throw v1

    .line 123
    :cond_7
    :goto_3
    if-eqz v5, :cond_9

    .line 124
    .line 125
    if-eq v14, v4, :cond_8

    .line 126
    .line 127
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 128
    .line 129
    return-wide v11

    .line 130
    :cond_8
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 131
    .line 132
    add-int/lit8 v7, v7, 0x2

    .line 133
    .line 134
    add-int/2addr v4, v15

    .line 135
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 136
    .line 137
    .line 138
    move-result v14

    .line 139
    move/from16 v4, p1

    .line 140
    .line 141
    move v15, v7

    .line 142
    goto :goto_4

    .line 143
    :cond_9
    move/from16 v4, p1

    .line 144
    .line 145
    :goto_4
    if-ne v14, v4, :cond_b

    .line 146
    .line 147
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 148
    .line 149
    add-int/2addr v4, v15

    .line 150
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 151
    .line 152
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 153
    .line 154
    .line 155
    move-result v4

    .line 156
    iput-char v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 157
    .line 158
    const/4 v4, 0x3

    .line 159
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 160
    .line 161
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 162
    .line 163
    if-eqz v1, :cond_a

    .line 164
    .line 165
    neg-long v0, v2

    .line 166
    return-wide v0

    .line 167
    :cond_a
    return-wide v2

    .line 168
    :cond_b
    invoke-static {v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    if-eqz v5, :cond_c

    .line 173
    .line 174
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 175
    .line 176
    add-int/lit8 v6, v15, 0x1

    .line 177
    .line 178
    add-int/2addr v5, v15

    .line 179
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 180
    .line 181
    .line 182
    move-result v14

    .line 183
    move v15, v6

    .line 184
    goto :goto_4

    .line 185
    :cond_c
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 186
    .line 187
    return-wide v2

    .line 188
    :cond_d
    const/16 v16, 0x2

    .line 189
    .line 190
    const/16 v1, 0x6e

    .line 191
    .line 192
    if-ne v2, v1, :cond_12

    .line 193
    .line 194
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 195
    .line 196
    add-int/2addr v1, v7

    .line 197
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    const/16 v2, 0x75

    .line 202
    .line 203
    if-ne v1, v2, :cond_12

    .line 204
    .line 205
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 206
    .line 207
    add-int/2addr v1, v7

    .line 208
    add-int/2addr v1, v3

    .line 209
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    const/16 v2, 0x6c

    .line 214
    .line 215
    if-ne v1, v2, :cond_12

    .line 216
    .line 217
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 218
    .line 219
    add-int/2addr v1, v7

    .line 220
    add-int/lit8 v1, v1, 0x2

    .line 221
    .line 222
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    if-ne v1, v2, :cond_12

    .line 227
    .line 228
    const/4 v1, 0x5

    .line 229
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 230
    .line 231
    add-int/lit8 v2, v7, 0x3

    .line 232
    .line 233
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 234
    .line 235
    add-int/lit8 v6, v7, 0x4

    .line 236
    .line 237
    add-int/2addr v3, v2

    .line 238
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    if-eqz v5, :cond_e

    .line 243
    .line 244
    if-ne v2, v4, :cond_e

    .line 245
    .line 246
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 247
    .line 248
    add-int/2addr v7, v1

    .line 249
    add-int/2addr v2, v6

    .line 250
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 251
    .line 252
    .line 253
    move-result v2

    .line 254
    move v6, v7

    .line 255
    :cond_e
    :goto_5
    const/16 v3, 0x2c

    .line 256
    .line 257
    if-ne v2, v3, :cond_f

    .line 258
    .line 259
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 260
    .line 261
    add-int/2addr v2, v6

    .line 262
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 263
    .line 264
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 265
    .line 266
    .line 267
    move-result v2

    .line 268
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 269
    .line 270
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 271
    .line 272
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 273
    .line 274
    return-wide v11

    .line 275
    :cond_f
    const/16 v3, 0x5d

    .line 276
    .line 277
    if-ne v2, v3, :cond_10

    .line 278
    .line 279
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 280
    .line 281
    add-int/2addr v2, v6

    .line 282
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 283
    .line 284
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 285
    .line 286
    .line 287
    move-result v2

    .line 288
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 289
    .line 290
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 291
    .line 292
    const/16 v1, 0xf

    .line 293
    .line 294
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 295
    .line 296
    return-wide v11

    .line 297
    :cond_10
    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 298
    .line 299
    .line 300
    move-result v2

    .line 301
    if-eqz v2, :cond_11

    .line 302
    .line 303
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 304
    .line 305
    add-int/lit8 v3, v6, 0x1

    .line 306
    .line 307
    add-int/2addr v2, v6

    .line 308
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 309
    .line 310
    .line 311
    move-result v2

    .line 312
    move v6, v3

    .line 313
    goto :goto_5

    .line 314
    :cond_11
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 315
    .line 316
    return-wide v11

    .line 317
    :cond_12
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 318
    .line 319
    return-wide v11
.end method

.method public final scanNullOrNew()V
    .locals 1

    const/4 v0, 0x1

    .line 167
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNullOrNew(Z)V

    return-void
.end method

.method public final scanNullOrNew(Z)V
    .locals 13

    .line 1
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2
    .line 3
    const/16 v1, 0x6e

    .line 4
    .line 5
    if-ne v0, v1, :cond_a

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 8
    .line 9
    .line 10
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 11
    .line 12
    const/16 v1, 0x75

    .line 13
    .line 14
    const/16 v2, 0xc

    .line 15
    .line 16
    const/16 v3, 0x1a

    .line 17
    .line 18
    const/16 v4, 0xd

    .line 19
    .line 20
    const/16 v5, 0xa

    .line 21
    .line 22
    const/16 v6, 0x5d

    .line 23
    .line 24
    const/16 v7, 0x7d

    .line 25
    .line 26
    const/16 v8, 0x2c

    .line 27
    .line 28
    const/16 v9, 0x20

    .line 29
    .line 30
    const/16 v10, 0x8

    .line 31
    .line 32
    const/16 v11, 0x9

    .line 33
    .line 34
    if-ne v0, v1, :cond_5

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 37
    .line 38
    .line 39
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 40
    .line 41
    const-string v1, "error parse null"

    .line 42
    .line 43
    const/16 v12, 0x6c

    .line 44
    .line 45
    if-ne v0, v12, :cond_4

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 48
    .line 49
    .line 50
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 51
    .line 52
    if-ne v0, v12, :cond_3

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 55
    .line 56
    .line 57
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 58
    .line 59
    if-eq v0, v9, :cond_2

    .line 60
    .line 61
    if-eq v0, v8, :cond_2

    .line 62
    .line 63
    if-eq v0, v7, :cond_2

    .line 64
    .line 65
    if-eq v0, v6, :cond_2

    .line 66
    .line 67
    if-eq v0, v5, :cond_2

    .line 68
    .line 69
    if-eq v0, v4, :cond_2

    .line 70
    .line 71
    if-eq v0, v11, :cond_2

    .line 72
    .line 73
    if-eq v0, v3, :cond_2

    .line 74
    .line 75
    const/16 v1, 0x3a

    .line 76
    .line 77
    if-ne v0, v1, :cond_0

    .line 78
    .line 79
    if-nez p1, :cond_2

    .line 80
    .line 81
    :cond_0
    if-eq v0, v2, :cond_2

    .line 82
    .line 83
    if-ne v0, v10, :cond_1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    const-string p0, "scan null error"

    .line 87
    .line 88
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    :goto_0
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    invoke-static {v1}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_4
    invoke-static {v1}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    const/16 p1, 0x65

    .line 104
    .line 105
    const-string v1, "error parse new"

    .line 106
    .line 107
    if-ne v0, p1, :cond_9

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 110
    .line 111
    .line 112
    iget-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 113
    .line 114
    const/16 v0, 0x77

    .line 115
    .line 116
    if-ne p1, v0, :cond_8

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 119
    .line 120
    .line 121
    iget-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 122
    .line 123
    if-eq p1, v9, :cond_7

    .line 124
    .line 125
    if-eq p1, v8, :cond_7

    .line 126
    .line 127
    if-eq p1, v7, :cond_7

    .line 128
    .line 129
    if-eq p1, v6, :cond_7

    .line 130
    .line 131
    if-eq p1, v5, :cond_7

    .line 132
    .line 133
    if-eq p1, v4, :cond_7

    .line 134
    .line 135
    if-eq p1, v11, :cond_7

    .line 136
    .line 137
    if-eq p1, v3, :cond_7

    .line 138
    .line 139
    if-eq p1, v2, :cond_7

    .line 140
    .line 141
    if-ne p1, v10, :cond_6

    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_6
    const-string p0, "scan new error"

    .line 145
    .line 146
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_7
    :goto_1
    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 151
    .line 152
    return-void

    .line 153
    :cond_8
    invoke-static {v1}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_9
    invoke-static {v1}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_a
    const-string p0, "error parse null or new"

    .line 162
    .line 163
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public final scanNumber()V
    .locals 9

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2
    .line 3
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 4
    .line 5
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/16 v2, 0x2d

    .line 9
    .line 10
    if-ne v0, v2, :cond_0

    .line 11
    .line 12
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 18
    .line 19
    .line 20
    :cond_0
    :goto_0
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 21
    .line 22
    const/16 v3, 0x39

    .line 23
    .line 24
    const/16 v4, 0x30

    .line 25
    .line 26
    if-lt v0, v4, :cond_1

    .line 27
    .line 28
    if-gt v0, v3, :cond_1

    .line 29
    .line 30
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 31
    .line 32
    add-int/2addr v0, v1

    .line 33
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/16 v5, 0x2e

    .line 40
    .line 41
    if-ne v0, v5, :cond_3

    .line 42
    .line 43
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 44
    .line 45
    add-int/2addr v0, v1

    .line 46
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 49
    .line 50
    .line 51
    :goto_1
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 52
    .line 53
    if-lt v0, v4, :cond_2

    .line 54
    .line 55
    if-gt v0, v3, :cond_2

    .line 56
    .line 57
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 58
    .line 59
    add-int/2addr v0, v1

    .line 60
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    move v0, v1

    .line 67
    goto :goto_2

    .line 68
    :cond_3
    const/4 v0, 0x0

    .line 69
    :goto_2
    iget-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 70
    .line 71
    const/16 v6, 0x4c

    .line 72
    .line 73
    if-ne v5, v6, :cond_4

    .line 74
    .line 75
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 76
    .line 77
    add-int/2addr v2, v1

    .line 78
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 81
    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_4
    const/16 v6, 0x53

    .line 85
    .line 86
    if-ne v5, v6, :cond_5

    .line 87
    .line 88
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 89
    .line 90
    add-int/2addr v2, v1

    .line 91
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 94
    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_5
    const/16 v6, 0x42

    .line 98
    .line 99
    if-ne v5, v6, :cond_6

    .line 100
    .line 101
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 102
    .line 103
    add-int/2addr v2, v1

    .line 104
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 107
    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_6
    const/16 v6, 0x46

    .line 111
    .line 112
    if-ne v5, v6, :cond_7

    .line 113
    .line 114
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 115
    .line 116
    add-int/2addr v0, v1

    .line 117
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 120
    .line 121
    .line 122
    goto :goto_6

    .line 123
    :cond_7
    const/16 v7, 0x44

    .line 124
    .line 125
    if-ne v5, v7, :cond_8

    .line 126
    .line 127
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 128
    .line 129
    add-int/2addr v0, v1

    .line 130
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 133
    .line 134
    .line 135
    goto :goto_6

    .line 136
    :cond_8
    const/16 v8, 0x65

    .line 137
    .line 138
    if-eq v5, v8, :cond_a

    .line 139
    .line 140
    const/16 v8, 0x45

    .line 141
    .line 142
    if-ne v5, v8, :cond_9

    .line 143
    .line 144
    goto :goto_4

    .line 145
    :cond_9
    :goto_3
    move v1, v0

    .line 146
    goto :goto_6

    .line 147
    :cond_a
    :goto_4
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 148
    .line 149
    add-int/2addr v0, v1

    .line 150
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 151
    .line 152
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 153
    .line 154
    .line 155
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 156
    .line 157
    const/16 v5, 0x2b

    .line 158
    .line 159
    if-eq v0, v5, :cond_b

    .line 160
    .line 161
    if-ne v0, v2, :cond_c

    .line 162
    .line 163
    :cond_b
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 164
    .line 165
    add-int/2addr v0, v1

    .line 166
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 167
    .line 168
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 169
    .line 170
    .line 171
    :cond_c
    :goto_5
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 172
    .line 173
    if-lt v0, v4, :cond_d

    .line 174
    .line 175
    if-gt v0, v3, :cond_d

    .line 176
    .line 177
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 178
    .line 179
    add-int/2addr v0, v1

    .line 180
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 181
    .line 182
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 183
    .line 184
    .line 185
    goto :goto_5

    .line 186
    :cond_d
    if-eq v0, v7, :cond_e

    .line 187
    .line 188
    if-ne v0, v6, :cond_f

    .line 189
    .line 190
    :cond_e
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 191
    .line 192
    add-int/2addr v0, v1

    .line 193
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 194
    .line 195
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 196
    .line 197
    .line 198
    :cond_f
    :goto_6
    if-eqz v1, :cond_10

    .line 199
    .line 200
    const/4 v0, 0x3

    .line 201
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 202
    .line 203
    return-void

    .line 204
    :cond_10
    const/4 v0, 0x2

    .line 205
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 206
    .line 207
    return-void
.end method

.method public scanString(C)Ljava/lang/String;
    .locals 12

    const/4 v0, 0x0

    .line 431
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 432
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    const/16 v2, 0x6e

    const/4 v3, 0x0

    const/4 v4, 0x3

    const/4 v5, -0x1

    const/4 v6, 0x1

    if-ne v1, v2, :cond_2

    .line 433
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v0, v6

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    const/16 v1, 0x75

    if-ne v0, v1, :cond_1

    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    const/16 v1, 0x6c

    if-ne v0, v1, :cond_1

    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v0, v4

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    if-ne v0, v1, :cond_1

    .line 434
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v0, v0, 0x4

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    if-ne v0, p1, :cond_0

    .line 435
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 p1, p1, 0x5

    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 436
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result p1

    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 437
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return-object v3

    .line 438
    :cond_0
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return-object v3

    .line 439
    :cond_1
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return-object v3

    :cond_2
    move v2, v6

    :goto_0
    const/16 v7, 0x22

    if-ne v1, v7, :cond_9

    .line 440
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v1, v2

    .line 441
    invoke-virtual {p0, v7, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    move-result v8

    if-eq v8, v5, :cond_8

    .line 442
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v3, v2

    sub-int v9, v8, v1

    invoke-virtual {p0, v3, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    move-result-object v3

    const/16 v9, 0x5c

    .line 443
    invoke-virtual {v3, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    if-eq v10, v5, :cond_5

    :goto_1
    add-int/lit8 v3, v8, -0x1

    move v10, v0

    :goto_2
    if-ltz v3, :cond_3

    .line 444
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v11

    if-ne v11, v9, :cond_3

    add-int/lit8 v10, v10, 0x1

    add-int/lit8 v3, v3, -0x1

    goto :goto_2

    .line 445
    :cond_3
    rem-int/lit8 v10, v10, 0x2

    if-nez v10, :cond_4

    sub-int v0, v8, v1

    .line 446
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v3, v6

    invoke-virtual {p0, v3, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sub_chars(II)[C

    move-result-object v3

    .line 447
    invoke-static {v3, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->readString([CI)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    :cond_4
    add-int/lit8 v8, v8, 0x1

    .line 448
    invoke-virtual {p0, v7, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    move-result v8

    goto :goto_1

    :cond_5
    :goto_3
    sub-int/2addr v8, v1

    add-int/2addr v8, v6

    add-int/2addr v2, v8

    .line 449
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v1, v2, 0x1

    add-int/2addr v0, v2

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    :goto_4
    if-ne v0, p1, :cond_6

    .line 450
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 451
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result p1

    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 452
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/16 p1, 0x10

    .line 453
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    return-object v3

    .line 454
    :cond_6
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 455
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v1, 0x1

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    move v1, v2

    goto :goto_4

    .line 456
    :cond_7
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return-object v3

    .line 457
    :cond_8
    const-string p0, "unclosed str"

    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    return-object v3

    .line 458
    :cond_9
    invoke-static {v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 459
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v7, v2, 0x1

    add-int/2addr v1, v2

    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    move v2, v7

    goto/16 :goto_0

    .line 460
    :cond_a
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 461
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final scanString()V
    .locals 12

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2
    .line 3
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 7
    .line 8
    :goto_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x4

    .line 13
    const/16 v3, 0x22

    .line 14
    .line 15
    if-ne v1, v3, :cond_0

    .line 16
    .line 17
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string v4, "unclosed string : "

    .line 27
    .line 28
    const/16 v5, 0x1a

    .line 29
    .line 30
    if-ne v1, v5, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEOF()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    new-instance p0, Lcom/alibaba/fastjson/JSONException;

    .line 43
    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    throw p0

    .line 60
    :cond_2
    iget-boolean v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 61
    .line 62
    const/16 v6, 0x5c

    .line 63
    .line 64
    if-ne v1, v6, :cond_17

    .line 65
    .line 66
    const/4 v1, 0x2

    .line 67
    const/4 v7, 0x1

    .line 68
    if-nez v5, :cond_5

    .line 69
    .line 70
    iput-boolean v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 71
    .line 72
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 73
    .line 74
    iget-object v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 75
    .line 76
    array-length v9, v8

    .line 77
    if-lt v5, v9, :cond_4

    .line 78
    .line 79
    array-length v9, v8

    .line 80
    mul-int/2addr v9, v1

    .line 81
    if-le v5, v9, :cond_3

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    move v5, v9

    .line 85
    :goto_1
    new-array v5, v5, [C

    .line 86
    .line 87
    array-length v9, v8

    .line 88
    invoke-static {v8, v0, v5, v0, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 89
    .line 90
    .line 91
    iput-object v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 92
    .line 93
    :cond_4
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 94
    .line 95
    add-int/2addr v5, v7

    .line 96
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 97
    .line 98
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 99
    .line 100
    invoke-virtual {p0, v5, v8, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->copyTo(II[C)V

    .line 101
    .line 102
    .line 103
    :cond_5
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    if-eq v5, v3, :cond_16

    .line 108
    .line 109
    const/16 v3, 0x27

    .line 110
    .line 111
    if-eq v5, v3, :cond_15

    .line 112
    .line 113
    const/16 v3, 0x46

    .line 114
    .line 115
    if-eq v5, v3, :cond_14

    .line 116
    .line 117
    if-eq v5, v6, :cond_13

    .line 118
    .line 119
    const/16 v6, 0x62

    .line 120
    .line 121
    if-eq v5, v6, :cond_12

    .line 122
    .line 123
    const/16 v6, 0x66

    .line 124
    .line 125
    if-eq v5, v6, :cond_14

    .line 126
    .line 127
    const/16 v8, 0x6e

    .line 128
    .line 129
    if-eq v5, v8, :cond_11

    .line 130
    .line 131
    const/16 v8, 0x72

    .line 132
    .line 133
    if-eq v5, v8, :cond_10

    .line 134
    .line 135
    const/16 v8, 0x78

    .line 136
    .line 137
    const/16 v9, 0x10

    .line 138
    .line 139
    if-eq v5, v8, :cond_6

    .line 140
    .line 141
    const/4 v3, 0x3

    .line 142
    packed-switch v5, :pswitch_data_0

    .line 143
    .line 144
    .line 145
    packed-switch v5, :pswitch_data_1

    .line 146
    .line 147
    .line 148
    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 149
    .line 150
    new-instance p0, Lcom/alibaba/fastjson/JSONException;

    .line 151
    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    throw p0

    .line 168
    :pswitch_0
    const/16 v1, 0xb

    .line 169
    .line 170
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 171
    .line 172
    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :pswitch_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 184
    .line 185
    .line 186
    move-result v6

    .line 187
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 188
    .line 189
    .line 190
    move-result v8

    .line 191
    new-instance v10, Ljava/lang/String;

    .line 192
    .line 193
    new-array v2, v2, [C

    .line 194
    .line 195
    aput-char v4, v2, v0

    .line 196
    .line 197
    aput-char v5, v2, v7

    .line 198
    .line 199
    aput-char v6, v2, v1

    .line 200
    .line 201
    aput-char v8, v2, v3

    .line 202
    .line 203
    invoke-direct {v10, v2}, Ljava/lang/String;-><init>([C)V

    .line 204
    .line 205
    .line 206
    invoke-static {v10, v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    int-to-char v1, v1

    .line 211
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 212
    .line 213
    .line 214
    goto/16 :goto_0

    .line 215
    .line 216
    :pswitch_2
    const/16 v1, 0x9

    .line 217
    .line 218
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 219
    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :pswitch_3
    const/4 v1, 0x7

    .line 224
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 225
    .line 226
    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :pswitch_4
    const/4 v1, 0x6

    .line 230
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 231
    .line 232
    .line 233
    goto/16 :goto_0

    .line 234
    .line 235
    :pswitch_5
    const/4 v1, 0x5

    .line 236
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 237
    .line 238
    .line 239
    goto/16 :goto_0

    .line 240
    .line 241
    :pswitch_6
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 242
    .line 243
    .line 244
    goto/16 :goto_0

    .line 245
    .line 246
    :pswitch_7
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 247
    .line 248
    .line 249
    goto/16 :goto_0

    .line 250
    .line 251
    :pswitch_8
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 252
    .line 253
    .line 254
    goto/16 :goto_0

    .line 255
    .line 256
    :pswitch_9
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 257
    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :pswitch_a
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 262
    .line 263
    .line 264
    goto/16 :goto_0

    .line 265
    .line 266
    :pswitch_b
    const/16 v1, 0x2f

    .line 267
    .line 268
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 269
    .line 270
    .line 271
    goto/16 :goto_0

    .line 272
    .line 273
    :cond_6
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 278
    .line 279
    .line 280
    move-result v2

    .line 281
    const/16 v4, 0x41

    .line 282
    .line 283
    const/16 v5, 0x61

    .line 284
    .line 285
    const/16 v8, 0x39

    .line 286
    .line 287
    const/16 v10, 0x30

    .line 288
    .line 289
    if-lt v1, v10, :cond_7

    .line 290
    .line 291
    if-le v1, v8, :cond_9

    .line 292
    .line 293
    :cond_7
    if-lt v1, v5, :cond_8

    .line 294
    .line 295
    if-le v1, v6, :cond_9

    .line 296
    .line 297
    :cond_8
    if-lt v1, v4, :cond_a

    .line 298
    .line 299
    if-gt v1, v3, :cond_a

    .line 300
    .line 301
    :cond_9
    move v11, v7

    .line 302
    goto :goto_2

    .line 303
    :cond_a
    move v11, v0

    .line 304
    :goto_2
    if-lt v2, v10, :cond_b

    .line 305
    .line 306
    if-le v2, v8, :cond_e

    .line 307
    .line 308
    :cond_b
    if-lt v2, v5, :cond_c

    .line 309
    .line 310
    if-le v2, v6, :cond_e

    .line 311
    .line 312
    :cond_c
    if-lt v2, v4, :cond_d

    .line 313
    .line 314
    if-gt v2, v3, :cond_d

    .line 315
    .line 316
    goto :goto_3

    .line 317
    :cond_d
    move v7, v0

    .line 318
    :cond_e
    :goto_3
    if-eqz v11, :cond_f

    .line 319
    .line 320
    if-eqz v7, :cond_f

    .line 321
    .line 322
    sget-object v3, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    .line 323
    .line 324
    aget v1, v3, v1

    .line 325
    .line 326
    mul-int/2addr v1, v9

    .line 327
    aget v2, v3, v2

    .line 328
    .line 329
    add-int/2addr v1, v2

    .line 330
    int-to-char v1, v1

    .line 331
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 332
    .line 333
    .line 334
    goto/16 :goto_0

    .line 335
    .line 336
    :cond_f
    new-instance p0, Lcom/alibaba/fastjson/JSONException;

    .line 337
    .line 338
    new-instance v0, Ljava/lang/StringBuilder;

    .line 339
    .line 340
    const-string v3, "invalid escape character \\x"

    .line 341
    .line 342
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    throw p0

    .line 359
    :cond_10
    const/16 v1, 0xd

    .line 360
    .line 361
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 362
    .line 363
    .line 364
    goto/16 :goto_0

    .line 365
    .line 366
    :cond_11
    const/16 v1, 0xa

    .line 367
    .line 368
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 369
    .line 370
    .line 371
    goto/16 :goto_0

    .line 372
    .line 373
    :cond_12
    const/16 v1, 0x8

    .line 374
    .line 375
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 376
    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :cond_13
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 381
    .line 382
    .line 383
    goto/16 :goto_0

    .line 384
    .line 385
    :cond_14
    const/16 v1, 0xc

    .line 386
    .line 387
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 388
    .line 389
    .line 390
    goto/16 :goto_0

    .line 391
    .line 392
    :cond_15
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 393
    .line 394
    .line 395
    goto/16 :goto_0

    .line 396
    .line 397
    :cond_16
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 398
    .line 399
    .line 400
    goto/16 :goto_0

    .line 401
    .line 402
    :cond_17
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 403
    .line 404
    if-nez v5, :cond_18

    .line 405
    .line 406
    add-int/lit8 v2, v2, 0x1

    .line 407
    .line 408
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 409
    .line 410
    goto/16 :goto_0

    .line 411
    .line 412
    :cond_18
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 413
    .line 414
    array-length v4, v3

    .line 415
    if-ne v2, v4, :cond_19

    .line 416
    .line 417
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 418
    .line 419
    .line 420
    goto/16 :goto_0

    .line 421
    .line 422
    :cond_19
    add-int/lit8 v4, v2, 0x1

    .line 423
    .line 424
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 425
    .line 426
    aput-char v1, v3, v2

    .line 427
    .line 428
    goto/16 :goto_0

    .line 429
    .line 430
    nop

    .line 431
    :pswitch_data_0
    .packed-switch 0x2f
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    :pswitch_data_1
    .packed-switch 0x74
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public scanStringArray(Ljava/util/Collection;C)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;C)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 9
    .line 10
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 11
    .line 12
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    const/16 v5, 0x75

    .line 17
    .line 18
    const/4 v6, 0x3

    .line 19
    const/16 v7, 0x6c

    .line 20
    .line 21
    const/4 v8, 0x2

    .line 22
    const/16 v9, 0x6e

    .line 23
    .line 24
    if-ne v4, v9, :cond_0

    .line 25
    .line 26
    iget v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 27
    .line 28
    add-int/lit8 v10, v10, 0x1

    .line 29
    .line 30
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 31
    .line 32
    .line 33
    move-result v10

    .line 34
    if-ne v10, v5, :cond_0

    .line 35
    .line 36
    iget v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 37
    .line 38
    add-int/2addr v10, v8

    .line 39
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 40
    .line 41
    .line 42
    move-result v10

    .line 43
    if-ne v10, v7, :cond_0

    .line 44
    .line 45
    iget v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 46
    .line 47
    add-int/2addr v10, v6

    .line 48
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 49
    .line 50
    .line 51
    move-result v10

    .line 52
    if-ne v10, v7, :cond_0

    .line 53
    .line 54
    iget v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 55
    .line 56
    add-int/lit8 v10, v10, 0x4

    .line 57
    .line 58
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 59
    .line 60
    .line 61
    move-result v10

    .line 62
    if-ne v10, v2, :cond_0

    .line 63
    .line 64
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 65
    .line 66
    const/4 v2, 0x5

    .line 67
    add-int/2addr v1, v2

    .line 68
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 75
    .line 76
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    const/16 v10, 0x5b

    .line 80
    .line 81
    const/4 v11, -0x1

    .line 82
    if-eq v4, v10, :cond_1

    .line 83
    .line 84
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 88
    .line 89
    add-int/lit8 v4, v4, 0x1

    .line 90
    .line 91
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    move v10, v8

    .line 96
    :goto_0
    const/16 v12, 0x5d

    .line 97
    .line 98
    if-ne v4, v9, :cond_2

    .line 99
    .line 100
    iget v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 101
    .line 102
    add-int/2addr v13, v10

    .line 103
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 104
    .line 105
    .line 106
    move-result v13

    .line 107
    if-ne v13, v5, :cond_2

    .line 108
    .line 109
    iget v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 110
    .line 111
    add-int/2addr v13, v10

    .line 112
    add-int/lit8 v13, v13, 0x1

    .line 113
    .line 114
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 115
    .line 116
    .line 117
    move-result v13

    .line 118
    if-ne v13, v7, :cond_2

    .line 119
    .line 120
    iget v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 121
    .line 122
    add-int/2addr v13, v10

    .line 123
    add-int/2addr v13, v8

    .line 124
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 125
    .line 126
    .line 127
    move-result v13

    .line 128
    if-ne v13, v7, :cond_2

    .line 129
    .line 130
    add-int/lit8 v4, v10, 0x3

    .line 131
    .line 132
    iget v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 133
    .line 134
    add-int/lit8 v10, v10, 0x4

    .line 135
    .line 136
    add-int/2addr v13, v4

    .line 137
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    const/4 v13, 0x0

    .line 142
    invoke-interface {v1, v13}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    goto/16 :goto_4

    .line 146
    .line 147
    :cond_2
    if-ne v4, v12, :cond_3

    .line 148
    .line 149
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    .line 150
    .line 151
    .line 152
    move-result v13

    .line 153
    if-nez v13, :cond_3

    .line 154
    .line 155
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 156
    .line 157
    add-int/lit8 v3, v10, 0x1

    .line 158
    .line 159
    add-int/2addr v1, v10

    .line 160
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    goto/16 :goto_5

    .line 165
    .line 166
    :cond_3
    const/16 v13, 0x22

    .line 167
    .line 168
    if-eq v4, v13, :cond_4

    .line 169
    .line 170
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 171
    .line 172
    return-void

    .line 173
    :cond_4
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 174
    .line 175
    add-int/2addr v4, v10

    .line 176
    invoke-virtual {v0, v13, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    .line 177
    .line 178
    .line 179
    move-result v14

    .line 180
    if-eq v14, v11, :cond_b

    .line 181
    .line 182
    iget v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 183
    .line 184
    add-int/2addr v15, v10

    .line 185
    sub-int v3, v14, v4

    .line 186
    .line 187
    invoke-virtual {v0, v15, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    const/16 v15, 0x5c

    .line 192
    .line 193
    invoke-virtual {v3, v15}, Ljava/lang/String;->indexOf(I)I

    .line 194
    .line 195
    .line 196
    move-result v5

    .line 197
    if-eq v5, v11, :cond_7

    .line 198
    .line 199
    :goto_1
    add-int/lit8 v3, v14, -0x1

    .line 200
    .line 201
    const/4 v5, 0x0

    .line 202
    :goto_2
    if-ltz v3, :cond_5

    .line 203
    .line 204
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 205
    .line 206
    .line 207
    move-result v7

    .line 208
    if-ne v7, v15, :cond_5

    .line 209
    .line 210
    add-int/lit8 v5, v5, 0x1

    .line 211
    .line 212
    add-int/lit8 v3, v3, -0x1

    .line 213
    .line 214
    const/16 v7, 0x6c

    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_5
    rem-int/lit8 v5, v5, 0x2

    .line 218
    .line 219
    if-nez v5, :cond_6

    .line 220
    .line 221
    sub-int v3, v14, v4

    .line 222
    .line 223
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 224
    .line 225
    add-int/2addr v4, v10

    .line 226
    invoke-virtual {v0, v4, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sub_chars(II)[C

    .line 227
    .line 228
    .line 229
    move-result-object v4

    .line 230
    invoke-static {v4, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->readString([CI)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    goto :goto_3

    .line 235
    :cond_6
    add-int/lit8 v14, v14, 0x1

    .line 236
    .line 237
    invoke-virtual {v0, v13, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    .line 238
    .line 239
    .line 240
    move-result v14

    .line 241
    const/16 v7, 0x6c

    .line 242
    .line 243
    goto :goto_1

    .line 244
    :cond_7
    :goto_3
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 245
    .line 246
    add-int v5, v4, v10

    .line 247
    .line 248
    sub-int/2addr v14, v5

    .line 249
    add-int/lit8 v14, v14, 0x1

    .line 250
    .line 251
    add-int/2addr v10, v14

    .line 252
    add-int/lit8 v5, v10, 0x1

    .line 253
    .line 254
    add-int/2addr v4, v10

    .line 255
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 256
    .line 257
    .line 258
    move-result v4

    .line 259
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move v10, v5

    .line 263
    :goto_4
    const/16 v3, 0x2c

    .line 264
    .line 265
    if-ne v4, v3, :cond_8

    .line 266
    .line 267
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 268
    .line 269
    add-int/lit8 v4, v10, 0x1

    .line 270
    .line 271
    add-int/2addr v3, v10

    .line 272
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 273
    .line 274
    .line 275
    move-result v3

    .line 276
    move v10, v4

    .line 277
    const/16 v5, 0x75

    .line 278
    .line 279
    const/16 v7, 0x6c

    .line 280
    .line 281
    move v4, v3

    .line 282
    const/4 v3, 0x0

    .line 283
    goto/16 :goto_0

    .line 284
    .line 285
    :cond_8
    if-ne v4, v12, :cond_a

    .line 286
    .line 287
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 288
    .line 289
    add-int/lit8 v3, v10, 0x1

    .line 290
    .line 291
    add-int/2addr v1, v10

    .line 292
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 293
    .line 294
    .line 295
    move-result v1

    .line 296
    :goto_5
    if-ne v1, v2, :cond_9

    .line 297
    .line 298
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 299
    .line 300
    add-int/2addr v1, v3

    .line 301
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 302
    .line 303
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 304
    .line 305
    .line 306
    move-result v1

    .line 307
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 308
    .line 309
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 310
    .line 311
    return-void

    .line 312
    :cond_9
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 313
    .line 314
    return-void

    .line 315
    :cond_a
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 316
    .line 317
    return-void

    .line 318
    :cond_b
    const-string v0, "unclosed str"

    .line 319
    .line 320
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    return-void
.end method

.method public final scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
    .locals 4

    .line 421
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 422
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x22

    if-ne v0, v1, :cond_0

    .line 423
    invoke-virtual {p0, p1, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 424
    :cond_0
    const-string v1, "syntax error"

    const/16 v2, 0x27

    if-ne v0, v2, :cond_2

    .line 425
    sget-object v0, Lcom/alibaba/fastjson/parser/Feature;->AllowSingleQuotes:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 426
    invoke-virtual {p0, p1, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 427
    :cond_1
    invoke-static {v1}, Ll/qkq;->a(Ljava/lang/String;)V

    :goto_0
    const/4 p0, 0x0

    return-object p0

    :cond_2
    const/16 v2, 0x7d

    const/4 v3, 0x0

    if-ne v0, v2, :cond_3

    .line 428
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    const/16 p1, 0xd

    .line 429
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    return-object v3

    :cond_3
    const/16 v2, 0x2c

    if-ne v0, v2, :cond_4

    .line 430
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    const/16 p1, 0x10

    .line 431
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    return-object v3

    :cond_4
    const/16 v2, 0x1a

    if-ne v0, v2, :cond_5

    const/16 p1, 0x14

    .line 432
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    return-object v3

    .line 433
    :cond_5
    sget-object v0, Lcom/alibaba/fastjson/parser/Feature;->AllowUnQuotedFieldNames:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 434
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanSymbolUnQuoted(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 435
    :cond_6
    invoke-static {v1}, Ll/qkq;->a(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;
    .locals 13

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2
    .line 3
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 7
    .line 8
    move v1, v0

    .line 9
    move v2, v1

    .line 10
    :goto_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    const/4 v4, 0x4

    .line 15
    const/4 v5, 0x1

    .line 16
    if-ne v3, p2, :cond_2

    .line 17
    .line 18
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 19
    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    iget p2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 23
    .line 24
    const/4 v1, -0x1

    .line 25
    if-ne p2, v1, :cond_0

    .line 26
    .line 27
    move p2, v0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    add-int/2addr p2, v5

    .line 30
    :goto_1
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 31
    .line 32
    invoke-virtual {p0, p2, v1, v2, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    iget-object p2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 38
    .line 39
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 40
    .line 41
    invoke-virtual {p1, p2, v0, v1, v2}, Lcom/alibaba/fastjson/parser/SymbolTable;->addSymbol([CIII)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :goto_2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 48
    .line 49
    .line 50
    return-object p1

    .line 51
    :cond_2
    const/16 v6, 0x1a

    .line 52
    .line 53
    const/4 v7, 0x0

    .line 54
    if-eq v3, v6, :cond_11

    .line 55
    .line 56
    const/16 v6, 0x5c

    .line 57
    .line 58
    if-ne v3, v6, :cond_e

    .line 59
    .line 60
    const/4 v3, 0x2

    .line 61
    if-nez v1, :cond_5

    .line 62
    .line 63
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 64
    .line 65
    iget-object v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 66
    .line 67
    array-length v9, v8

    .line 68
    if-lt v1, v9, :cond_4

    .line 69
    .line 70
    array-length v9, v8

    .line 71
    mul-int/2addr v9, v3

    .line 72
    if-le v1, v9, :cond_3

    .line 73
    .line 74
    goto :goto_3

    .line 75
    :cond_3
    move v1, v9

    .line 76
    :goto_3
    new-array v1, v1, [C

    .line 77
    .line 78
    array-length v9, v8

    .line 79
    invoke-static {v8, v0, v1, v0, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 83
    .line 84
    :cond_4
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 85
    .line 86
    add-int/2addr v1, v5

    .line 87
    iget-object v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 88
    .line 89
    iget v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 90
    .line 91
    invoke-virtual {p0, v1, v8, v0, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->arrayCopy(I[CII)V

    .line 92
    .line 93
    .line 94
    move v1, v5

    .line 95
    :cond_5
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 96
    .line 97
    .line 98
    move-result v8

    .line 99
    const/16 v9, 0x22

    .line 100
    .line 101
    if-eq v8, v9, :cond_d

    .line 102
    .line 103
    const/16 v9, 0x27

    .line 104
    .line 105
    if-eq v8, v9, :cond_c

    .line 106
    .line 107
    const/16 v9, 0x46

    .line 108
    .line 109
    if-eq v8, v9, :cond_b

    .line 110
    .line 111
    if-eq v8, v6, :cond_a

    .line 112
    .line 113
    const/16 v6, 0x62

    .line 114
    .line 115
    if-eq v8, v6, :cond_9

    .line 116
    .line 117
    const/16 v6, 0x66

    .line 118
    .line 119
    if-eq v8, v6, :cond_b

    .line 120
    .line 121
    const/16 v6, 0x6e

    .line 122
    .line 123
    if-eq v8, v6, :cond_8

    .line 124
    .line 125
    const/16 v6, 0x72

    .line 126
    .line 127
    if-eq v8, v6, :cond_7

    .line 128
    .line 129
    const/16 v6, 0x78

    .line 130
    .line 131
    const/16 v9, 0x10

    .line 132
    .line 133
    if-eq v8, v6, :cond_6

    .line 134
    .line 135
    const/4 v6, 0x3

    .line 136
    packed-switch v8, :pswitch_data_0

    .line 137
    .line 138
    .line 139
    packed-switch v8, :pswitch_data_1

    .line 140
    .line 141
    .line 142
    iput-char v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 143
    .line 144
    const-string p0, "unclosed.str.lit"

    .line 145
    .line 146
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    return-object v7

    .line 150
    :pswitch_0
    mul-int/lit8 v2, v2, 0x1f

    .line 151
    .line 152
    const/16 v3, 0xb

    .line 153
    .line 154
    add-int/2addr v2, v3

    .line 155
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 156
    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :pswitch_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 161
    .line 162
    .line 163
    move-result v7

    .line 164
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 165
    .line 166
    .line 167
    move-result v8

    .line 168
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 169
    .line 170
    .line 171
    move-result v10

    .line 172
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 173
    .line 174
    .line 175
    move-result v11

    .line 176
    new-instance v12, Ljava/lang/String;

    .line 177
    .line 178
    new-array v4, v4, [C

    .line 179
    .line 180
    aput-char v7, v4, v0

    .line 181
    .line 182
    aput-char v8, v4, v5

    .line 183
    .line 184
    aput-char v10, v4, v3

    .line 185
    .line 186
    aput-char v11, v4, v6

    .line 187
    .line 188
    invoke-direct {v12, v4}, Ljava/lang/String;-><init>([C)V

    .line 189
    .line 190
    .line 191
    invoke-static {v12, v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    mul-int/lit8 v2, v2, 0x1f

    .line 196
    .line 197
    add-int/2addr v2, v3

    .line 198
    int-to-char v3, v3

    .line 199
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 200
    .line 201
    .line 202
    goto/16 :goto_0

    .line 203
    .line 204
    :pswitch_2
    mul-int/lit8 v2, v2, 0x1f

    .line 205
    .line 206
    const/16 v3, 0x9

    .line 207
    .line 208
    add-int/2addr v2, v3

    .line 209
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 210
    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :pswitch_3
    mul-int/lit8 v2, v2, 0x1f

    .line 215
    .line 216
    add-int/2addr v2, v8

    .line 217
    const/4 v3, 0x7

    .line 218
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 219
    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :pswitch_4
    mul-int/lit8 v2, v2, 0x1f

    .line 224
    .line 225
    add-int/2addr v2, v8

    .line 226
    const/4 v3, 0x6

    .line 227
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 228
    .line 229
    .line 230
    goto/16 :goto_0

    .line 231
    .line 232
    :pswitch_5
    mul-int/lit8 v2, v2, 0x1f

    .line 233
    .line 234
    add-int/2addr v2, v8

    .line 235
    const/4 v3, 0x5

    .line 236
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 237
    .line 238
    .line 239
    goto/16 :goto_0

    .line 240
    .line 241
    :pswitch_6
    mul-int/lit8 v2, v2, 0x1f

    .line 242
    .line 243
    add-int/2addr v2, v8

    .line 244
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 245
    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :pswitch_7
    mul-int/lit8 v2, v2, 0x1f

    .line 250
    .line 251
    add-int/2addr v2, v8

    .line 252
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 253
    .line 254
    .line 255
    goto/16 :goto_0

    .line 256
    .line 257
    :pswitch_8
    mul-int/lit8 v2, v2, 0x1f

    .line 258
    .line 259
    add-int/2addr v2, v8

    .line 260
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 261
    .line 262
    .line 263
    goto/16 :goto_0

    .line 264
    .line 265
    :pswitch_9
    mul-int/lit8 v2, v2, 0x1f

    .line 266
    .line 267
    add-int/2addr v2, v8

    .line 268
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 269
    .line 270
    .line 271
    goto/16 :goto_0

    .line 272
    .line 273
    :pswitch_a
    mul-int/lit8 v2, v2, 0x1f

    .line 274
    .line 275
    add-int/2addr v2, v8

    .line 276
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 277
    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :pswitch_b
    mul-int/lit8 v2, v2, 0x1f

    .line 282
    .line 283
    const/16 v3, 0x2f

    .line 284
    .line 285
    add-int/2addr v2, v3

    .line 286
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 287
    .line 288
    .line 289
    goto/16 :goto_0

    .line 290
    .line 291
    :cond_6
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 292
    .line 293
    .line 294
    move-result v3

    .line 295
    iput-char v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 296
    .line 297
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 298
    .line 299
    .line 300
    move-result v4

    .line 301
    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 302
    .line 303
    sget-object v5, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    .line 304
    .line 305
    aget v3, v5, v3

    .line 306
    .line 307
    mul-int/2addr v3, v9

    .line 308
    aget v4, v5, v4

    .line 309
    .line 310
    add-int/2addr v3, v4

    .line 311
    int-to-char v3, v3

    .line 312
    mul-int/lit8 v2, v2, 0x1f

    .line 313
    .line 314
    add-int/2addr v2, v3

    .line 315
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 316
    .line 317
    .line 318
    goto/16 :goto_0

    .line 319
    .line 320
    :cond_7
    mul-int/lit8 v2, v2, 0x1f

    .line 321
    .line 322
    const/16 v3, 0xd

    .line 323
    .line 324
    add-int/2addr v2, v3

    .line 325
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 326
    .line 327
    .line 328
    goto/16 :goto_0

    .line 329
    .line 330
    :cond_8
    mul-int/lit8 v2, v2, 0x1f

    .line 331
    .line 332
    const/16 v3, 0xa

    .line 333
    .line 334
    add-int/2addr v2, v3

    .line 335
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 336
    .line 337
    .line 338
    goto/16 :goto_0

    .line 339
    .line 340
    :cond_9
    mul-int/lit8 v2, v2, 0x1f

    .line 341
    .line 342
    const/16 v3, 0x8

    .line 343
    .line 344
    add-int/2addr v2, v3

    .line 345
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 346
    .line 347
    .line 348
    goto/16 :goto_0

    .line 349
    .line 350
    :cond_a
    mul-int/lit8 v2, v2, 0x1f

    .line 351
    .line 352
    add-int/2addr v2, v6

    .line 353
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 354
    .line 355
    .line 356
    goto/16 :goto_0

    .line 357
    .line 358
    :cond_b
    mul-int/lit8 v2, v2, 0x1f

    .line 359
    .line 360
    const/16 v3, 0xc

    .line 361
    .line 362
    add-int/2addr v2, v3

    .line 363
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 364
    .line 365
    .line 366
    goto/16 :goto_0

    .line 367
    .line 368
    :cond_c
    mul-int/lit8 v2, v2, 0x1f

    .line 369
    .line 370
    add-int/2addr v2, v9

    .line 371
    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 372
    .line 373
    .line 374
    goto/16 :goto_0

    .line 375
    .line 376
    :cond_d
    mul-int/lit8 v2, v2, 0x1f

    .line 377
    .line 378
    add-int/2addr v2, v9

    .line 379
    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 380
    .line 381
    .line 382
    goto/16 :goto_0

    .line 383
    .line 384
    :cond_e
    mul-int/lit8 v2, v2, 0x1f

    .line 385
    .line 386
    add-int/2addr v2, v3

    .line 387
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 388
    .line 389
    if-nez v1, :cond_f

    .line 390
    .line 391
    add-int/lit8 v4, v4, 0x1

    .line 392
    .line 393
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 394
    .line 395
    goto/16 :goto_0

    .line 396
    .line 397
    :cond_f
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 398
    .line 399
    array-length v6, v5

    .line 400
    if-ne v4, v6, :cond_10

    .line 401
    .line 402
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    .line 403
    .line 404
    .line 405
    goto/16 :goto_0

    .line 406
    .line 407
    :cond_10
    add-int/lit8 v6, v4, 0x1

    .line 408
    .line 409
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 410
    .line 411
    aput-char v3, v5, v4

    .line 412
    .line 413
    goto/16 :goto_0

    .line 414
    .line 415
    :cond_11
    const-string p0, "unclosed.str"

    .line 416
    .line 417
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    return-object v7

    .line 421
    :pswitch_data_0
    .packed-switch 0x2f
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    :pswitch_data_1
    .packed-switch 0x74
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final scanSymbolUnQuoted(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
    .locals 5

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 16
    .line 17
    :cond_0
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifierFlags:[Z

    .line 18
    .line 19
    iget-char v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 20
    .line 21
    array-length v3, v0

    .line 22
    if-ge v2, v3, :cond_2

    .line 23
    .line 24
    aget-boolean v0, v0, v2

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    new-instance p1, Lcom/alibaba/fastjson/JSONException;

    .line 30
    .line 31
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->info()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v2, "illegal identifier : "

    .line 40
    .line 41
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-direct {p1, p0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    throw p1

    .line 58
    :cond_2
    :goto_0
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    .line 59
    .line 60
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 61
    .line 62
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 63
    .line 64
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 65
    .line 66
    :goto_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    array-length v4, v0

    .line 71
    if-ge v3, v4, :cond_5

    .line 72
    .line 73
    aget-boolean v4, v0, v3

    .line 74
    .line 75
    if-nez v4, :cond_5

    .line 76
    .line 77
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 84
    .line 85
    const/16 v0, 0x12

    .line 86
    .line 87
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 88
    .line 89
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 90
    .line 91
    const/4 v3, 0x4

    .line 92
    if-ne v0, v3, :cond_3

    .line 93
    .line 94
    const v0, 0x33c587

    .line 95
    .line 96
    .line 97
    if-ne v2, v0, :cond_3

    .line 98
    .line 99
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    const/16 v3, 0x6e

    .line 106
    .line 107
    if-ne v0, v3, :cond_3

    .line 108
    .line 109
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 110
    .line 111
    add-int/2addr v0, v1

    .line 112
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    const/16 v1, 0x75

    .line 117
    .line 118
    if-ne v0, v1, :cond_3

    .line 119
    .line 120
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 121
    .line 122
    add-int/lit8 v0, v0, 0x2

    .line 123
    .line 124
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    const/16 v1, 0x6c

    .line 129
    .line 130
    if-ne v0, v1, :cond_3

    .line 131
    .line 132
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 133
    .line 134
    add-int/lit8 v0, v0, 0x3

    .line 135
    .line 136
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-ne v0, v1, :cond_3

    .line 141
    .line 142
    const/4 p0, 0x0

    .line 143
    return-object p0

    .line 144
    :cond_3
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 145
    .line 146
    if-nez p1, :cond_4

    .line 147
    .line 148
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 149
    .line 150
    invoke-virtual {p0, v0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    return-object p0

    .line 155
    :cond_4
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 156
    .line 157
    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    return-object p0

    .line 162
    :cond_5
    mul-int/lit8 v2, v2, 0x1f

    .line 163
    .line 164
    add-int/2addr v2, v3

    .line 165
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 166
    .line 167
    add-int/2addr v3, v1

    .line 168
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 169
    .line 170
    goto :goto_1
.end method

.method public scanSymbolWithSeperator(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/16 v2, 0x6e

    .line 11
    .line 12
    const/4 v3, 0x3

    .line 13
    const/4 v4, -0x1

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v6, 0x1

    .line 16
    if-ne v1, v2, :cond_2

    .line 17
    .line 18
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 19
    .line 20
    add-int/2addr p1, v6

    .line 21
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/16 v0, 0x75

    .line 26
    .line 27
    if-ne p1, v0, :cond_1

    .line 28
    .line 29
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 30
    .line 31
    add-int/lit8 p1, p1, 0x2

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/16 v0, 0x6c

    .line 38
    .line 39
    if-ne p1, v0, :cond_1

    .line 40
    .line 41
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 42
    .line 43
    add-int/2addr p1, v3

    .line 44
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-ne p1, v0, :cond_1

    .line 49
    .line 50
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 51
    .line 52
    add-int/lit8 p1, p1, 0x4

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-ne p1, p2, :cond_0

    .line 59
    .line 60
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 61
    .line 62
    add-int/lit8 p1, p1, 0x5

    .line 63
    .line 64
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 71
    .line 72
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 73
    .line 74
    return-object v5

    .line 75
    :cond_0
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 76
    .line 77
    return-object v5

    .line 78
    :cond_1
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 79
    .line 80
    return-object v5

    .line 81
    :cond_2
    const/16 v2, 0x22

    .line 82
    .line 83
    if-eq v1, v2, :cond_3

    .line 84
    .line 85
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 86
    .line 87
    return-object v5

    .line 88
    :cond_3
    move v1, v6

    .line 89
    :goto_0
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 90
    .line 91
    add-int/lit8 v8, v1, 0x1

    .line 92
    .line 93
    add-int/2addr v7, v1

    .line 94
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    if-ne v7, v2, :cond_6

    .line 99
    .line 100
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 101
    .line 102
    add-int/lit8 v5, v2, 0x1

    .line 103
    .line 104
    add-int/2addr v2, v8

    .line 105
    sub-int/2addr v2, v5

    .line 106
    sub-int/2addr v2, v6

    .line 107
    invoke-virtual {p0, v5, v2, v0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 112
    .line 113
    add-int/lit8 v1, v1, 0x2

    .line 114
    .line 115
    add-int/2addr v0, v8

    .line 116
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    :goto_1
    if-ne v0, p2, :cond_4

    .line 121
    .line 122
    iget p2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 123
    .line 124
    add-int/2addr p2, v1

    .line 125
    iput p2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 126
    .line 127
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    iput-char p2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 132
    .line 133
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 134
    .line 135
    return-object p1

    .line 136
    :cond_4
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_5

    .line 141
    .line 142
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 143
    .line 144
    add-int/lit8 v2, v1, 0x1

    .line 145
    .line 146
    add-int/2addr v0, v1

    .line 147
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    move v1, v2

    .line 152
    goto :goto_1

    .line 153
    :cond_5
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 154
    .line 155
    return-object p1

    .line 156
    :cond_6
    mul-int/lit8 v0, v0, 0x1f

    .line 157
    .line 158
    add-int/2addr v0, v7

    .line 159
    const/16 v1, 0x5c

    .line 160
    .line 161
    if-ne v7, v1, :cond_7

    .line 162
    .line 163
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 164
    .line 165
    return-object v5

    .line 166
    :cond_7
    move v1, v8

    .line 167
    goto :goto_0
.end method

.method public final scanTrue()V
    .locals 3

    .line 1
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2
    .line 3
    const/16 v1, 0x74

    .line 4
    .line 5
    const-string v2, "error parse true"

    .line 6
    .line 7
    if-ne v0, v1, :cond_5

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 10
    .line 11
    .line 12
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 13
    .line 14
    const/16 v1, 0x72

    .line 15
    .line 16
    if-ne v0, v1, :cond_4

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 19
    .line 20
    .line 21
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 22
    .line 23
    const/16 v1, 0x75

    .line 24
    .line 25
    if-ne v0, v1, :cond_3

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 28
    .line 29
    .line 30
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 31
    .line 32
    const/16 v1, 0x65

    .line 33
    .line 34
    if-ne v0, v1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 37
    .line 38
    .line 39
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 40
    .line 41
    const/16 v1, 0x20

    .line 42
    .line 43
    if-eq v0, v1, :cond_1

    .line 44
    .line 45
    const/16 v1, 0x2c

    .line 46
    .line 47
    if-eq v0, v1, :cond_1

    .line 48
    .line 49
    const/16 v1, 0x7d

    .line 50
    .line 51
    if-eq v0, v1, :cond_1

    .line 52
    .line 53
    const/16 v1, 0x5d

    .line 54
    .line 55
    if-eq v0, v1, :cond_1

    .line 56
    .line 57
    const/16 v1, 0xa

    .line 58
    .line 59
    if-eq v0, v1, :cond_1

    .line 60
    .line 61
    const/16 v1, 0xd

    .line 62
    .line 63
    if-eq v0, v1, :cond_1

    .line 64
    .line 65
    const/16 v1, 0x9

    .line 66
    .line 67
    if-eq v0, v1, :cond_1

    .line 68
    .line 69
    const/16 v1, 0x1a

    .line 70
    .line 71
    if-eq v0, v1, :cond_1

    .line 72
    .line 73
    const/16 v1, 0xc

    .line 74
    .line 75
    if-eq v0, v1, :cond_1

    .line 76
    .line 77
    const/16 v1, 0x8

    .line 78
    .line 79
    if-eq v0, v1, :cond_1

    .line 80
    .line 81
    const/16 v1, 0x3a

    .line 82
    .line 83
    if-eq v0, v1, :cond_1

    .line 84
    .line 85
    const/16 v1, 0x2f

    .line 86
    .line 87
    if-ne v0, v1, :cond_0

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    const-string p0, "scan true error"

    .line 91
    .line 92
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_1
    :goto_0
    const/4 v0, 0x6

    .line 97
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    invoke-static {v2}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_3
    invoke-static {v2}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_4
    invoke-static {v2}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_5
    invoke-static {v2}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public final scanType(Ljava/lang/String;)I
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    sget-object v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->typeFieldName:[C

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    const/4 p0, -0x2

    .line 13
    return p0

    .line 14
    :cond_0
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 15
    .line 16
    array-length v1, v1

    .line 17
    add-int/2addr v2, v1

    .line 18
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    :goto_0
    const/4 v3, -0x1

    .line 23
    if-ge v0, v1, :cond_2

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    add-int v5, v2, v0

    .line 30
    .line 31
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-eq v4, v5, :cond_1

    .line 36
    .line 37
    return v3

    .line 38
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    add-int/2addr v2, v1

    .line 42
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    const/16 v0, 0x22

    .line 47
    .line 48
    if-eq p1, v0, :cond_3

    .line 49
    .line 50
    return v3

    .line 51
    :cond_3
    add-int/lit8 p1, v2, 0x1

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 58
    .line 59
    const/16 v1, 0x10

    .line 60
    .line 61
    const/16 v4, 0x2c

    .line 62
    .line 63
    const/4 v5, 0x3

    .line 64
    if-ne v0, v4, :cond_4

    .line 65
    .line 66
    add-int/lit8 v2, v2, 0x2

    .line 67
    .line 68
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 73
    .line 74
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 75
    .line 76
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 77
    .line 78
    return v5

    .line 79
    :cond_4
    const/16 v6, 0x7d

    .line 80
    .line 81
    if-ne v0, v6, :cond_9

    .line 82
    .line 83
    add-int/lit8 p1, v2, 0x2

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 90
    .line 91
    if-ne v0, v4, :cond_5

    .line 92
    .line 93
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 94
    .line 95
    add-int/2addr v2, v5

    .line 96
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 101
    .line 102
    :goto_1
    move p1, v2

    .line 103
    goto :goto_2

    .line 104
    :cond_5
    const/16 v1, 0x5d

    .line 105
    .line 106
    if-ne v0, v1, :cond_6

    .line 107
    .line 108
    const/16 p1, 0xf

    .line 109
    .line 110
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 111
    .line 112
    add-int/2addr v2, v5

    .line 113
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_6
    if-ne v0, v6, :cond_7

    .line 121
    .line 122
    const/16 p1, 0xd

    .line 123
    .line 124
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 125
    .line 126
    add-int/2addr v2, v5

    .line 127
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_7
    const/16 v1, 0x1a

    .line 135
    .line 136
    if-ne v0, v1, :cond_8

    .line 137
    .line 138
    const/16 v0, 0x14

    .line 139
    .line 140
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 141
    .line 142
    :goto_2
    const/4 v0, 0x4

    .line 143
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_8
    return v3

    .line 147
    :cond_9
    :goto_3
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 148
    .line 149
    iget p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 150
    .line 151
    return p0
.end method

.method public scanTypeName(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public scanUUID(C)Ljava/util/UUID;
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 7
    .line 8
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/16 v3, 0xd

    .line 13
    .line 14
    const/4 v6, -0x1

    .line 15
    const/16 v9, 0x22

    .line 16
    .line 17
    if-ne v2, v9, :cond_1f

    .line 18
    .line 19
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 20
    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    invoke-virtual {v0, v9, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eq v2, v6, :cond_1e

    .line 28
    .line 29
    iget v9, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 30
    .line 31
    add-int/lit8 v9, v9, 0x1

    .line 32
    .line 33
    sub-int v10, v2, v9

    .line 34
    .line 35
    const/16 v11, 0x24

    .line 36
    .line 37
    const/4 v14, -0x2

    .line 38
    const/16 v15, 0x46

    .line 39
    .line 40
    const/16 v1, 0x41

    .line 41
    .line 42
    const/16 v16, 0x0

    .line 43
    .line 44
    const/16 v8, 0x66

    .line 45
    .line 46
    const/16 v12, 0x61

    .line 47
    .line 48
    const/16 v13, 0x39

    .line 49
    .line 50
    const/16 v19, 0x4

    .line 51
    .line 52
    const/16 v7, 0x30

    .line 53
    .line 54
    if-ne v10, v11, :cond_14

    .line 55
    .line 56
    const/4 v10, 0x0

    .line 57
    const-wide/16 v20, 0x0

    .line 58
    .line 59
    const/16 v22, 0x3

    .line 60
    .line 61
    :goto_0
    const/16 v5, 0x8

    .line 62
    .line 63
    if-ge v10, v5, :cond_3

    .line 64
    .line 65
    add-int v5, v9, v10

    .line 66
    .line 67
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    if-lt v5, v7, :cond_0

    .line 72
    .line 73
    if-gt v5, v13, :cond_0

    .line 74
    .line 75
    add-int/lit8 v5, v5, -0x30

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_0
    if-lt v5, v12, :cond_1

    .line 79
    .line 80
    if-gt v5, v8, :cond_1

    .line 81
    .line 82
    add-int/lit8 v5, v5, -0x57

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    if-lt v5, v1, :cond_2

    .line 86
    .line 87
    if-gt v5, v15, :cond_2

    .line 88
    .line 89
    add-int/lit8 v5, v5, -0x37

    .line 90
    .line 91
    :goto_1
    shl-long v20, v20, v19

    .line 92
    .line 93
    int-to-long v4, v5

    .line 94
    or-long v20, v20, v4

    .line 95
    .line 96
    add-int/lit8 v10, v10, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_2
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 100
    .line 101
    return-object v16

    .line 102
    :cond_3
    const/16 v4, 0x9

    .line 103
    .line 104
    :goto_2
    if-ge v4, v3, :cond_7

    .line 105
    .line 106
    add-int v5, v9, v4

    .line 107
    .line 108
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    if-lt v5, v7, :cond_4

    .line 113
    .line 114
    if-gt v5, v13, :cond_4

    .line 115
    .line 116
    add-int/lit8 v5, v5, -0x30

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_4
    if-lt v5, v12, :cond_5

    .line 120
    .line 121
    if-gt v5, v8, :cond_5

    .line 122
    .line 123
    add-int/lit8 v5, v5, -0x57

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_5
    if-lt v5, v1, :cond_6

    .line 127
    .line 128
    if-gt v5, v15, :cond_6

    .line 129
    .line 130
    add-int/lit8 v5, v5, -0x37

    .line 131
    .line 132
    :goto_3
    shl-long v20, v20, v19

    .line 133
    .line 134
    move v10, v4

    .line 135
    int-to-long v3, v5

    .line 136
    or-long v20, v20, v3

    .line 137
    .line 138
    add-int/lit8 v4, v10, 0x1

    .line 139
    .line 140
    const/16 v3, 0xd

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_6
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 144
    .line 145
    return-object v16

    .line 146
    :cond_7
    const/16 v3, 0xe

    .line 147
    .line 148
    move-wide/from16 v4, v20

    .line 149
    .line 150
    :goto_4
    const/16 v10, 0x12

    .line 151
    .line 152
    if-ge v3, v10, :cond_b

    .line 153
    .line 154
    add-int v10, v9, v3

    .line 155
    .line 156
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 157
    .line 158
    .line 159
    move-result v10

    .line 160
    if-lt v10, v7, :cond_8

    .line 161
    .line 162
    if-gt v10, v13, :cond_8

    .line 163
    .line 164
    add-int/lit8 v10, v10, -0x30

    .line 165
    .line 166
    goto :goto_5

    .line 167
    :cond_8
    if-lt v10, v12, :cond_9

    .line 168
    .line 169
    if-gt v10, v8, :cond_9

    .line 170
    .line 171
    add-int/lit8 v10, v10, -0x57

    .line 172
    .line 173
    goto :goto_5

    .line 174
    :cond_9
    if-lt v10, v1, :cond_a

    .line 175
    .line 176
    if-gt v10, v15, :cond_a

    .line 177
    .line 178
    add-int/lit8 v10, v10, -0x37

    .line 179
    .line 180
    :goto_5
    shl-long v4, v4, v19

    .line 181
    .line 182
    move/from16 v20, v2

    .line 183
    .line 184
    int-to-long v1, v10

    .line 185
    or-long/2addr v4, v1

    .line 186
    add-int/lit8 v3, v3, 0x1

    .line 187
    .line 188
    move/from16 v2, v20

    .line 189
    .line 190
    const/16 v1, 0x41

    .line 191
    .line 192
    goto :goto_4

    .line 193
    :cond_a
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 194
    .line 195
    return-object v16

    .line 196
    :cond_b
    move/from16 v20, v2

    .line 197
    .line 198
    const/16 v1, 0x13

    .line 199
    .line 200
    const-wide/16 v17, 0x0

    .line 201
    .line 202
    :goto_6
    const/16 v2, 0x17

    .line 203
    .line 204
    if-ge v1, v2, :cond_f

    .line 205
    .line 206
    add-int v2, v9, v1

    .line 207
    .line 208
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    if-lt v2, v7, :cond_c

    .line 213
    .line 214
    if-gt v2, v13, :cond_c

    .line 215
    .line 216
    add-int/lit8 v2, v2, -0x30

    .line 217
    .line 218
    goto :goto_7

    .line 219
    :cond_c
    if-lt v2, v12, :cond_d

    .line 220
    .line 221
    if-gt v2, v8, :cond_d

    .line 222
    .line 223
    add-int/lit8 v2, v2, -0x57

    .line 224
    .line 225
    goto :goto_7

    .line 226
    :cond_d
    const/16 v3, 0x41

    .line 227
    .line 228
    if-lt v2, v3, :cond_e

    .line 229
    .line 230
    if-gt v2, v15, :cond_e

    .line 231
    .line 232
    add-int/lit8 v2, v2, -0x37

    .line 233
    .line 234
    :goto_7
    shl-long v17, v17, v19

    .line 235
    .line 236
    int-to-long v2, v2

    .line 237
    or-long v17, v17, v2

    .line 238
    .line 239
    add-int/lit8 v1, v1, 0x1

    .line 240
    .line 241
    goto :goto_6

    .line 242
    :cond_e
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 243
    .line 244
    return-object v16

    .line 245
    :cond_f
    const/16 v1, 0x18

    .line 246
    .line 247
    move-wide/from16 v2, v17

    .line 248
    .line 249
    :goto_8
    if-ge v1, v11, :cond_13

    .line 250
    .line 251
    add-int v10, v9, v1

    .line 252
    .line 253
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 254
    .line 255
    .line 256
    move-result v10

    .line 257
    if-lt v10, v7, :cond_10

    .line 258
    .line 259
    if-gt v10, v13, :cond_10

    .line 260
    .line 261
    add-int/lit8 v10, v10, -0x30

    .line 262
    .line 263
    goto :goto_9

    .line 264
    :cond_10
    if-lt v10, v12, :cond_11

    .line 265
    .line 266
    if-gt v10, v8, :cond_11

    .line 267
    .line 268
    add-int/lit8 v10, v10, -0x57

    .line 269
    .line 270
    goto :goto_9

    .line 271
    :cond_11
    const/16 v11, 0x41

    .line 272
    .line 273
    if-lt v10, v11, :cond_12

    .line 274
    .line 275
    if-gt v10, v15, :cond_12

    .line 276
    .line 277
    add-int/lit8 v10, v10, -0x37

    .line 278
    .line 279
    :goto_9
    shl-long v2, v2, v19

    .line 280
    .line 281
    int-to-long v10, v10

    .line 282
    or-long/2addr v2, v10

    .line 283
    add-int/lit8 v1, v1, 0x1

    .line 284
    .line 285
    const/16 v11, 0x24

    .line 286
    .line 287
    goto :goto_8

    .line 288
    :cond_12
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 289
    .line 290
    return-object v16

    .line 291
    :cond_13
    new-instance v1, Ljava/util/UUID;

    .line 292
    .line 293
    invoke-direct {v1, v4, v5, v2, v3}, Ljava/util/UUID;-><init>(JJ)V

    .line 294
    .line 295
    .line 296
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 297
    .line 298
    add-int/lit8 v3, v2, 0x1

    .line 299
    .line 300
    sub-int v3, v20, v3

    .line 301
    .line 302
    add-int/lit8 v4, v3, 0x2

    .line 303
    .line 304
    add-int/lit8 v3, v3, 0x3

    .line 305
    .line 306
    add-int/2addr v2, v4

    .line 307
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 308
    .line 309
    .line 310
    move-result v2

    .line 311
    goto/16 :goto_f

    .line 312
    .line 313
    :cond_14
    move/from16 v20, v2

    .line 314
    .line 315
    const/16 v22, 0x3

    .line 316
    .line 317
    const/16 v1, 0x20

    .line 318
    .line 319
    if-ne v10, v1, :cond_1d

    .line 320
    .line 321
    const/4 v2, 0x0

    .line 322
    const-wide/16 v3, 0x0

    .line 323
    .line 324
    :goto_a
    const/16 v5, 0x10

    .line 325
    .line 326
    if-ge v2, v5, :cond_18

    .line 327
    .line 328
    add-int v5, v9, v2

    .line 329
    .line 330
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 331
    .line 332
    .line 333
    move-result v5

    .line 334
    if-lt v5, v7, :cond_15

    .line 335
    .line 336
    if-gt v5, v13, :cond_15

    .line 337
    .line 338
    add-int/lit8 v5, v5, -0x30

    .line 339
    .line 340
    goto :goto_b

    .line 341
    :cond_15
    if-lt v5, v12, :cond_16

    .line 342
    .line 343
    if-gt v5, v8, :cond_16

    .line 344
    .line 345
    add-int/lit8 v5, v5, -0x57

    .line 346
    .line 347
    goto :goto_b

    .line 348
    :cond_16
    const/16 v11, 0x41

    .line 349
    .line 350
    if-lt v5, v11, :cond_17

    .line 351
    .line 352
    if-gt v5, v15, :cond_17

    .line 353
    .line 354
    add-int/lit8 v5, v5, -0x37

    .line 355
    .line 356
    :goto_b
    shl-long v3, v3, v19

    .line 357
    .line 358
    int-to-long v10, v5

    .line 359
    or-long/2addr v3, v10

    .line 360
    add-int/lit8 v2, v2, 0x1

    .line 361
    .line 362
    goto :goto_a

    .line 363
    :cond_17
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 364
    .line 365
    return-object v16

    .line 366
    :cond_18
    const/16 v5, 0x10

    .line 367
    .line 368
    const-wide/16 v10, 0x0

    .line 369
    .line 370
    :goto_c
    if-ge v5, v1, :cond_1c

    .line 371
    .line 372
    add-int v2, v9, v5

    .line 373
    .line 374
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 375
    .line 376
    .line 377
    move-result v2

    .line 378
    if-lt v2, v7, :cond_19

    .line 379
    .line 380
    if-gt v2, v13, :cond_19

    .line 381
    .line 382
    add-int/lit8 v2, v2, -0x30

    .line 383
    .line 384
    :goto_d
    const/16 v1, 0x41

    .line 385
    .line 386
    goto :goto_e

    .line 387
    :cond_19
    if-lt v2, v12, :cond_1a

    .line 388
    .line 389
    if-gt v2, v8, :cond_1a

    .line 390
    .line 391
    add-int/lit8 v2, v2, -0x57

    .line 392
    .line 393
    goto :goto_d

    .line 394
    :cond_1a
    const/16 v1, 0x41

    .line 395
    .line 396
    if-lt v2, v1, :cond_1b

    .line 397
    .line 398
    if-gt v2, v15, :cond_1b

    .line 399
    .line 400
    add-int/lit8 v2, v2, -0x37

    .line 401
    .line 402
    :goto_e
    shl-long v10, v10, v19

    .line 403
    .line 404
    int-to-long v1, v2

    .line 405
    or-long/2addr v10, v1

    .line 406
    add-int/lit8 v5, v5, 0x1

    .line 407
    .line 408
    const/16 v1, 0x20

    .line 409
    .line 410
    goto :goto_c

    .line 411
    :cond_1b
    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 412
    .line 413
    return-object v16

    .line 414
    :cond_1c
    new-instance v1, Ljava/util/UUID;

    .line 415
    .line 416
    invoke-direct {v1, v3, v4, v10, v11}, Ljava/util/UUID;-><init>(JJ)V

    .line 417
    .line 418
    .line 419
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 420
    .line 421
    add-int/lit8 v3, v2, 0x1

    .line 422
    .line 423
    sub-int v3, v20, v3

    .line 424
    .line 425
    add-int/lit8 v4, v3, 0x2

    .line 426
    .line 427
    add-int/lit8 v3, v3, 0x3

    .line 428
    .line 429
    add-int/2addr v2, v4

    .line 430
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 431
    .line 432
    .line 433
    move-result v2

    .line 434
    goto :goto_f

    .line 435
    :cond_1d
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 436
    .line 437
    return-object v16

    .line 438
    :cond_1e
    const-string v0, "unclosed str"

    .line 439
    .line 440
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 441
    .line 442
    .line 443
    const/4 v0, 0x0

    .line 444
    return-object v0

    .line 445
    :cond_1f
    const/16 v16, 0x0

    .line 446
    .line 447
    const/16 v19, 0x4

    .line 448
    .line 449
    const/16 v22, 0x3

    .line 450
    .line 451
    const/16 v1, 0x6e

    .line 452
    .line 453
    if-ne v2, v1, :cond_26

    .line 454
    .line 455
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 456
    .line 457
    add-int/lit8 v1, v1, 0x1

    .line 458
    .line 459
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 460
    .line 461
    .line 462
    move-result v1

    .line 463
    const/16 v2, 0x75

    .line 464
    .line 465
    if-ne v1, v2, :cond_26

    .line 466
    .line 467
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 468
    .line 469
    add-int/lit8 v1, v1, 0x2

    .line 470
    .line 471
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 472
    .line 473
    .line 474
    move-result v1

    .line 475
    const/16 v2, 0x6c

    .line 476
    .line 477
    if-ne v1, v2, :cond_26

    .line 478
    .line 479
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 480
    .line 481
    add-int/lit8 v1, v1, 0x3

    .line 482
    .line 483
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 484
    .line 485
    .line 486
    move-result v1

    .line 487
    const/16 v2, 0x6c

    .line 488
    .line 489
    if-ne v1, v2, :cond_26

    .line 490
    .line 491
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 492
    .line 493
    add-int/lit8 v1, v1, 0x4

    .line 494
    .line 495
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 496
    .line 497
    .line 498
    move-result v2

    .line 499
    const/4 v3, 0x5

    .line 500
    move-object/from16 v1, v16

    .line 501
    .line 502
    :goto_f
    const/16 v4, 0x2c

    .line 503
    .line 504
    if-ne v2, v4, :cond_20

    .line 505
    .line 506
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 507
    .line 508
    add-int/2addr v2, v3

    .line 509
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 510
    .line 511
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 512
    .line 513
    .line 514
    move-result v2

    .line 515
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 516
    .line 517
    move/from16 v2, v22

    .line 518
    .line 519
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 520
    .line 521
    return-object v1

    .line 522
    :cond_20
    const/16 v4, 0x5d

    .line 523
    .line 524
    if-ne v2, v4, :cond_25

    .line 525
    .line 526
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 527
    .line 528
    add-int/lit8 v4, v3, 0x1

    .line 529
    .line 530
    add-int/2addr v2, v3

    .line 531
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 532
    .line 533
    .line 534
    move-result v2

    .line 535
    const/16 v5, 0x2c

    .line 536
    .line 537
    if-ne v2, v5, :cond_21

    .line 538
    .line 539
    const/16 v5, 0x10

    .line 540
    .line 541
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 542
    .line 543
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 544
    .line 545
    add-int/2addr v2, v4

    .line 546
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 547
    .line 548
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 549
    .line 550
    .line 551
    move-result v2

    .line 552
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 553
    .line 554
    :goto_10
    move/from16 v2, v19

    .line 555
    .line 556
    goto :goto_11

    .line 557
    :cond_21
    const/16 v5, 0x5d

    .line 558
    .line 559
    if-ne v2, v5, :cond_22

    .line 560
    .line 561
    const/16 v2, 0xf

    .line 562
    .line 563
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 564
    .line 565
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 566
    .line 567
    add-int/2addr v2, v4

    .line 568
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 569
    .line 570
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 571
    .line 572
    .line 573
    move-result v2

    .line 574
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 575
    .line 576
    goto :goto_10

    .line 577
    :cond_22
    const/16 v5, 0x7d

    .line 578
    .line 579
    if-ne v2, v5, :cond_23

    .line 580
    .line 581
    const/16 v5, 0xd

    .line 582
    .line 583
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 584
    .line 585
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 586
    .line 587
    add-int/2addr v2, v4

    .line 588
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 589
    .line 590
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    .line 591
    .line 592
    .line 593
    move-result v2

    .line 594
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 595
    .line 596
    goto :goto_10

    .line 597
    :cond_23
    const/16 v4, 0x1a

    .line 598
    .line 599
    if-ne v2, v4, :cond_24

    .line 600
    .line 601
    const/16 v2, 0x14

    .line 602
    .line 603
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 604
    .line 605
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 606
    .line 607
    add-int/2addr v2, v3

    .line 608
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 609
    .line 610
    const/16 v2, 0x1a

    .line 611
    .line 612
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 613
    .line 614
    goto :goto_10

    .line 615
    :goto_11
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 616
    .line 617
    return-object v1

    .line 618
    :cond_24
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 619
    .line 620
    return-object v16

    .line 621
    :cond_25
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 622
    .line 623
    return-object v16

    .line 624
    :cond_26
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 625
    .line 626
    return-object v16
.end method

.method public seekArrayToItem(I)Z
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public seekObjectToField(JZ)I
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public seekObjectToField([J)I
    .locals 0

    .line 7
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public seekObjectToFieldDeepScan(J)I
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public setLocale(Ljava/util/Locale;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->locale:Ljava/util/Locale;

    .line 2
    .line 3
    return-void
.end method

.method public setTimeZone(Ljava/util/TimeZone;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->timeZone:Ljava/util/TimeZone;

    .line 2
    .line 3
    return-void
.end method

.method public setToken(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2
    .line 3
    return-void
.end method

.method public skipArray()V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public skipComment()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2
    .line 3
    .line 4
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 5
    .line 6
    const/16 v1, 0x1a

    .line 7
    .line 8
    const/16 v2, 0x2f

    .line 9
    .line 10
    if-ne v0, v2, :cond_2

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 13
    .line 14
    .line 15
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 16
    .line 17
    const/16 v2, 0xa

    .line 18
    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    if-ne v0, v1, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    const/16 v3, 0x2a

    .line 29
    .line 30
    if-ne v0, v3, :cond_6

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 33
    .line 34
    .line 35
    :cond_3
    :goto_0
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 36
    .line 37
    if-eq v0, v1, :cond_5

    .line 38
    .line 39
    if-ne v0, v3, :cond_4

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 42
    .line 43
    .line 44
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 45
    .line 46
    if-ne v0, v2, :cond_3

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_4
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_5
    :goto_1
    return-void

    .line 57
    :cond_6
    const-string p0, "invalid comment"

    .line 58
    .line 59
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public skipObject()V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public skipObject(Z)V
    .locals 0

    .line 7
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final skipWhitespace()V
    .locals 3

    .line 1
    :goto_0
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2
    .line 3
    const/16 v1, 0x2f

    .line 4
    .line 5
    if-gt v0, v1, :cond_2

    .line 6
    .line 7
    const/16 v2, 0x20

    .line 8
    .line 9
    if-eq v0, v2, :cond_1

    .line 10
    .line 11
    const/16 v2, 0xd

    .line 12
    .line 13
    if-eq v0, v2, :cond_1

    .line 14
    .line 15
    const/16 v2, 0xa

    .line 16
    .line 17
    if-eq v0, v2, :cond_1

    .line 18
    .line 19
    const/16 v2, 0x9

    .line 20
    .line 21
    if-eq v0, v2, :cond_1

    .line 22
    .line 23
    const/16 v2, 0xc

    .line 24
    .line 25
    if-eq v0, v2, :cond_1

    .line 26
    .line 27
    const/16 v2, 0x8

    .line 28
    .line 29
    if-ne v0, v2, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    if-ne v0, v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipComment()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    return-void
.end method

.method public final stringDefaultValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract stringVal()Ljava/lang/String;
.end method

.method public abstract subString(II)Ljava/lang/String;
.end method

.method public abstract sub_chars(II)[C
.end method

.method public final token()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2
    .line 3
    return p0
.end method

.method public final tokenName()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
