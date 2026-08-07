.class public Lorg/eclipse/jetty/http/HttpURI;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final ASTERISK:I = 0xa

.field private static final AUTH:I = 0x4

.field private static final AUTH_OR_PATH:I = 0x1

.field private static final IPV6:I = 0x5

.field private static final PARAM:I = 0x8

.field private static final PATH:I = 0x7

.field private static final PORT:I = 0x6

.field private static final QUERY:I = 0x9

.field private static final SCHEME_OR_PATH:I = 0x2

.field private static final START:I

.field private static final __empty:[B


# instance fields
.field _authority:I

.field _encoded:Z

.field _end:I

.field _fragment:I

.field _host:I

.field _param:I

.field _partial:Z

.field _path:I

.field _port:I

.field _portValue:I

.field _query:I

.field _raw:[B

.field _rawString:Ljava/lang/String;

.field _scheme:I

.field final _utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    sput-object v0, Lorg/eclipse/jetty/http/HttpURI;->__empty:[B

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 52
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_partial:Z

    .line 53
    sget-object v1, Lorg/eclipse/jetty/http/HttpURI;->__empty:[B

    iput-object v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 54
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_encoded:Z

    .line 55
    new-instance v0, Lorg/eclipse/jetty/util/Utf8StringBuilder;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Lorg/eclipse/jetty/util/Utf8StringBuilder;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_partial:Z

    .line 6
    .line 7
    sget-object v1, Lorg/eclipse/jetty/http/HttpURI;->__empty:[B

    .line 8
    .line 9
    iput-object v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 10
    .line 11
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_encoded:Z

    .line 12
    .line 13
    new-instance v1, Lorg/eclipse/jetty/util/Utf8StringBuilder;

    .line 14
    .line 15
    const/16 v2, 0x40

    .line 16
    .line 17
    invoke-direct {v1, v2}, Lorg/eclipse/jetty/util/Utf8StringBuilder;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    .line 21
    .line 22
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpURI;->_rawString:Ljava/lang/String;

    .line 23
    .line 24
    :try_start_0
    const-string v1, "UTF-8"

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 27
    .line 28
    .line 29
    move-result-object p1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    array-length v1, p1

    .line 31
    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jetty/http/HttpURI;->parse([BII)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catch_0
    move-exception p0

    .line 36
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    throw p0
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 2

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 63
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_partial:Z

    .line 64
    sget-object v1, Lorg/eclipse/jetty/http/HttpURI;->__empty:[B

    iput-object v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 65
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_encoded:Z

    .line 66
    new-instance v0, Lorg/eclipse/jetty/util/Utf8StringBuilder;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Lorg/eclipse/jetty/util/Utf8StringBuilder;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    .line 67
    invoke-virtual {p1}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpURI;->parse(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 46
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_partial:Z

    .line 47
    sget-object v1, Lorg/eclipse/jetty/http/HttpURI;->__empty:[B

    iput-object v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 48
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_encoded:Z

    .line 49
    new-instance v0, Lorg/eclipse/jetty/util/Utf8StringBuilder;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Lorg/eclipse/jetty/util/Utf8StringBuilder;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    .line 50
    iput-boolean p1, p0, Lorg/eclipse/jetty/http/HttpURI;->_partial:Z

    return-void
.end method

.method public constructor <init>([BII)V
    .locals 2

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 57
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_partial:Z

    .line 58
    sget-object v1, Lorg/eclipse/jetty/http/HttpURI;->__empty:[B

    iput-object v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 59
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_encoded:Z

    .line 60
    new-instance v0, Lorg/eclipse/jetty/util/Utf8StringBuilder;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Lorg/eclipse/jetty/util/Utf8StringBuilder;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    .line 61
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jetty/http/HttpURI;->parse2([BII)V

    return-void
.end method

.method private parse2([BII)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    iput-boolean v3, v0, Lorg/eclipse/jetty/http/HttpURI;->_encoded:Z

    .line 9
    .line 10
    move-object/from16 v4, p1

    .line 11
    .line 12
    iput-object v4, v0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 13
    .line 14
    add-int v4, v1, v2

    .line 15
    .line 16
    iput v4, v0, Lorg/eclipse/jetty/http/HttpURI;->_end:I

    .line 17
    .line 18
    iput v1, v0, Lorg/eclipse/jetty/http/HttpURI;->_scheme:I

    .line 19
    .line 20
    iput v1, v0, Lorg/eclipse/jetty/http/HttpURI;->_authority:I

    .line 21
    .line 22
    iput v1, v0, Lorg/eclipse/jetty/http/HttpURI;->_host:I

    .line 23
    .line 24
    iput v1, v0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 25
    .line 26
    const/4 v5, -0x1

    .line 27
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_portValue:I

    .line 28
    .line 29
    iput v1, v0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 30
    .line 31
    iput v4, v0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 32
    .line 33
    iput v4, v0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 34
    .line 35
    iput v4, v0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 36
    .line 37
    move v5, v1

    .line 38
    move v6, v5

    .line 39
    :goto_0
    const/4 v8, 0x1

    .line 40
    if-ge v5, v4, :cond_20

    .line 41
    .line 42
    iget-object v9, v0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 43
    .line 44
    aget-byte v10, v9, v5

    .line 45
    .line 46
    and-int/lit16 v10, v10, 0xff

    .line 47
    .line 48
    int-to-char v10, v10

    .line 49
    add-int/lit8 v11, v5, 0x1

    .line 50
    .line 51
    const/16 v15, 0x3b

    .line 52
    .line 53
    const/16 v16, 0x9

    .line 54
    .line 55
    const/16 v13, 0x3f

    .line 56
    .line 57
    const/16 v17, 0x7

    .line 58
    .line 59
    const/16 v14, 0x23

    .line 60
    .line 61
    const/16 v7, 0x2f

    .line 62
    .line 63
    const/16 v12, 0x3a

    .line 64
    .line 65
    packed-switch v3, :pswitch_data_0

    .line 66
    .line 67
    .line 68
    :pswitch_0
    goto :goto_2

    .line 69
    :pswitch_1
    const-string v0, "only \'*\'"

    .line 70
    .line 71
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :pswitch_2
    if-ne v10, v14, :cond_1

    .line 76
    .line 77
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :pswitch_3
    if-eq v10, v14, :cond_2

    .line 81
    .line 82
    if-eq v10, v13, :cond_0

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_0
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 86
    .line 87
    :goto_1
    move/from16 v3, v16

    .line 88
    .line 89
    :cond_1
    :goto_2
    move v5, v11

    .line 90
    goto :goto_0

    .line 91
    :cond_2
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 92
    .line 93
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :pswitch_4
    if-eq v10, v14, :cond_6

    .line 97
    .line 98
    const/16 v7, 0x25

    .line 99
    .line 100
    if-eq v10, v7, :cond_5

    .line 101
    .line 102
    if-eq v10, v15, :cond_4

    .line 103
    .line 104
    if-eq v10, v13, :cond_3

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_3
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 108
    .line 109
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_4
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 113
    .line 114
    const/16 v3, 0x8

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_5
    iput-boolean v8, v0, Lorg/eclipse/jetty/http/HttpURI;->_encoded:Z

    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_6
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 121
    .line 122
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 123
    .line 124
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :pswitch_5
    if-ne v10, v7, :cond_1

    .line 128
    .line 129
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 130
    .line 131
    iget v3, v0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 132
    .line 133
    iget v6, v0, Lorg/eclipse/jetty/http/HttpURI;->_authority:I

    .line 134
    .line 135
    if-gt v3, v6, :cond_7

    .line 136
    .line 137
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 138
    .line 139
    :cond_7
    move v6, v5

    .line 140
    :cond_8
    :goto_3
    move v5, v11

    .line 141
    :cond_9
    :goto_4
    move/from16 v3, v17

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :pswitch_6
    if-eq v10, v7, :cond_b

    .line 145
    .line 146
    const/16 v5, 0x5d

    .line 147
    .line 148
    if-eq v10, v5, :cond_a

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_a
    const/4 v3, 0x4

    .line 152
    goto :goto_2

    .line 153
    :cond_b
    iget-object v0, v0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 154
    .line 155
    sget-object v3, Lorg/eclipse/jetty/util/URIUtil;->__CHARSET:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    const-string v1, "No closing \']\' for "

    .line 162
    .line 163
    invoke-static {v1, v0}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :pswitch_7
    if-eq v10, v7, :cond_f

    .line 168
    .line 169
    if-eq v10, v12, :cond_e

    .line 170
    .line 171
    const/16 v5, 0x40

    .line 172
    .line 173
    if-eq v10, v5, :cond_d

    .line 174
    .line 175
    const/16 v5, 0x5b

    .line 176
    .line 177
    if-eq v10, v5, :cond_c

    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_c
    const/4 v3, 0x5

    .line 181
    goto :goto_2

    .line 182
    :cond_d
    iput v11, v0, Lorg/eclipse/jetty/http/HttpURI;->_host:I

    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_e
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 186
    .line 187
    const/4 v3, 0x6

    .line 188
    goto :goto_2

    .line 189
    :cond_f
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 190
    .line 191
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 192
    .line 193
    move v6, v5

    .line 194
    move/from16 v3, v17

    .line 195
    .line 196
    goto :goto_2

    .line 197
    :pswitch_8
    move/from16 v18, v8

    .line 198
    .line 199
    const/4 v8, 0x6

    .line 200
    if-le v2, v8, :cond_12

    .line 201
    .line 202
    const/16 v8, 0x74

    .line 203
    .line 204
    if-ne v10, v8, :cond_12

    .line 205
    .line 206
    add-int/lit8 v8, v1, 0x3

    .line 207
    .line 208
    aget-byte v15, v9, v8

    .line 209
    .line 210
    if-ne v15, v12, :cond_10

    .line 211
    .line 212
    add-int/lit8 v11, v1, 0x4

    .line 213
    .line 214
    :goto_5
    move v5, v8

    .line 215
    move v10, v12

    .line 216
    goto :goto_6

    .line 217
    :cond_10
    add-int/lit8 v8, v1, 0x4

    .line 218
    .line 219
    aget-byte v15, v9, v8

    .line 220
    .line 221
    if-ne v15, v12, :cond_11

    .line 222
    .line 223
    add-int/lit8 v11, v1, 0x5

    .line 224
    .line 225
    goto :goto_5

    .line 226
    :cond_11
    add-int/lit8 v8, v1, 0x5

    .line 227
    .line 228
    aget-byte v15, v9, v8

    .line 229
    .line 230
    if-ne v15, v12, :cond_12

    .line 231
    .line 232
    add-int/lit8 v11, v1, 0x6

    .line 233
    .line 234
    goto :goto_5

    .line 235
    :cond_12
    :goto_6
    if-eq v10, v14, :cond_17

    .line 236
    .line 237
    if-eq v10, v7, :cond_8

    .line 238
    .line 239
    if-eq v10, v13, :cond_16

    .line 240
    .line 241
    if-eq v10, v12, :cond_14

    .line 242
    .line 243
    const/16 v8, 0x3b

    .line 244
    .line 245
    if-eq v10, v8, :cond_13

    .line 246
    .line 247
    goto/16 :goto_2

    .line 248
    .line 249
    :cond_13
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 250
    .line 251
    goto/16 :goto_b

    .line 252
    .line 253
    :cond_14
    add-int/lit8 v3, v11, 0x1

    .line 254
    .line 255
    iput v11, v0, Lorg/eclipse/jetty/http/HttpURI;->_authority:I

    .line 256
    .line 257
    iput v11, v0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 258
    .line 259
    aget-byte v5, v9, v3

    .line 260
    .line 261
    and-int/lit16 v5, v5, 0xff

    .line 262
    .line 263
    int-to-char v5, v5

    .line 264
    if-ne v5, v7, :cond_15

    .line 265
    .line 266
    move v5, v3

    .line 267
    move v6, v11

    .line 268
    goto/16 :goto_c

    .line 269
    .line 270
    :cond_15
    iput v11, v0, Lorg/eclipse/jetty/http/HttpURI;->_host:I

    .line 271
    .line 272
    iput v11, v0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 273
    .line 274
    move v5, v3

    .line 275
    move v6, v11

    .line 276
    goto/16 :goto_4

    .line 277
    .line 278
    :cond_16
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 279
    .line 280
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 281
    .line 282
    goto :goto_a

    .line 283
    :cond_17
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 284
    .line 285
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 286
    .line 287
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 288
    .line 289
    goto/16 :goto_2

    .line 290
    .line 291
    :pswitch_9
    iget-boolean v3, v0, Lorg/eclipse/jetty/http/HttpURI;->_partial:Z

    .line 292
    .line 293
    if-nez v3, :cond_19

    .line 294
    .line 295
    iget v3, v0, Lorg/eclipse/jetty/http/HttpURI;->_scheme:I

    .line 296
    .line 297
    iget v8, v0, Lorg/eclipse/jetty/http/HttpURI;->_authority:I

    .line 298
    .line 299
    if-eq v3, v8, :cond_18

    .line 300
    .line 301
    goto :goto_7

    .line 302
    :cond_18
    const/16 v8, 0x3b

    .line 303
    .line 304
    goto :goto_8

    .line 305
    :cond_19
    :goto_7
    if-ne v10, v7, :cond_18

    .line 306
    .line 307
    iput v11, v0, Lorg/eclipse/jetty/http/HttpURI;->_host:I

    .line 308
    .line 309
    iget v3, v0, Lorg/eclipse/jetty/http/HttpURI;->_end:I

    .line 310
    .line 311
    iput v3, v0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 312
    .line 313
    iput v3, v0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 314
    .line 315
    move v5, v11

    .line 316
    const/4 v3, 0x4

    .line 317
    goto/16 :goto_0

    .line 318
    .line 319
    :goto_8
    if-eq v10, v8, :cond_9

    .line 320
    .line 321
    if-eq v10, v13, :cond_9

    .line 322
    .line 323
    if-ne v10, v14, :cond_1a

    .line 324
    .line 325
    goto/16 :goto_4

    .line 326
    .line 327
    :cond_1a
    iput v6, v0, Lorg/eclipse/jetty/http/HttpURI;->_host:I

    .line 328
    .line 329
    iput v6, v0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 330
    .line 331
    goto/16 :goto_3

    .line 332
    .line 333
    :pswitch_a
    move/from16 v18, v8

    .line 334
    .line 335
    if-eq v10, v14, :cond_1f

    .line 336
    .line 337
    const/16 v3, 0x2a

    .line 338
    .line 339
    if-eq v10, v3, :cond_1e

    .line 340
    .line 341
    if-eq v10, v7, :cond_1d

    .line 342
    .line 343
    const/16 v8, 0x3b

    .line 344
    .line 345
    if-eq v10, v8, :cond_1c

    .line 346
    .line 347
    if-eq v10, v13, :cond_1b

    .line 348
    .line 349
    const/4 v3, 0x2

    .line 350
    :goto_9
    move v6, v5

    .line 351
    goto/16 :goto_2

    .line 352
    .line 353
    :cond_1b
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 354
    .line 355
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 356
    .line 357
    move v6, v5

    .line 358
    :goto_a
    move v5, v11

    .line 359
    move/from16 v3, v16

    .line 360
    .line 361
    goto/16 :goto_0

    .line 362
    .line 363
    :cond_1c
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 364
    .line 365
    move v6, v5

    .line 366
    :goto_b
    move v5, v11

    .line 367
    const/16 v3, 0x8

    .line 368
    .line 369
    goto/16 :goto_0

    .line 370
    .line 371
    :cond_1d
    move v6, v5

    .line 372
    move v5, v11

    .line 373
    :goto_c
    move/from16 v3, v18

    .line 374
    .line 375
    goto/16 :goto_0

    .line 376
    .line 377
    :cond_1e
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 378
    .line 379
    move v6, v5

    .line 380
    move v5, v11

    .line 381
    const/16 v3, 0xa

    .line 382
    .line 383
    goto/16 :goto_0

    .line 384
    .line 385
    :cond_1f
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 386
    .line 387
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 388
    .line 389
    iput v5, v0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 390
    .line 391
    goto :goto_9

    .line 392
    :cond_20
    move/from16 v18, v8

    .line 393
    .line 394
    iget v1, v0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 395
    .line 396
    iget v2, v0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 397
    .line 398
    if-ge v1, v2, :cond_21

    .line 399
    .line 400
    iget-object v3, v0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 401
    .line 402
    add-int/lit8 v4, v1, 0x1

    .line 403
    .line 404
    sub-int/2addr v2, v1

    .line 405
    add-int/lit8 v2, v2, -0x1

    .line 406
    .line 407
    const/16 v1, 0xa

    .line 408
    .line 409
    invoke-static {v3, v4, v2, v1}, Lorg/eclipse/jetty/util/TypeUtil;->parseInt([BIII)I

    .line 410
    .line 411
    .line 412
    move-result v1

    .line 413
    iput v1, v0, Lorg/eclipse/jetty/http/HttpURI;->_portValue:I

    .line 414
    .line 415
    :cond_21
    return-void

    .line 416
    nop

    .line 417
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private toUtf8String(II)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    .line 7
    .line 8
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 9
    .line 10
    invoke-virtual {v0, v1, p1, p2}, Lorg/eclipse/jetty/util/Utf8Appendable;->append([BII)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method


# virtual methods
.method public clear()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_end:I

    .line 3
    .line 4
    iput v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 5
    .line 6
    iput v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 7
    .line 8
    iput v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 9
    .line 10
    iput v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 11
    .line 12
    iput v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 13
    .line 14
    iput v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_host:I

    .line 15
    .line 16
    iput v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_authority:I

    .line 17
    .line 18
    iput v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_scheme:I

    .line 19
    .line 20
    sget-object v1, Lorg/eclipse/jetty/http/HttpURI;->__empty:[B

    .line 21
    .line 22
    iput-object v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 23
    .line 24
    const-string v1, ""

    .line 25
    .line 26
    iput-object v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_rawString:Ljava/lang/String;

    .line 27
    .line 28
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_encoded:Z

    .line 29
    .line 30
    return-void
.end method

.method public decodeQueryTo(Lorg/eclipse/jetty/util/MultiMap;)V
    .locals 4

    .line 51
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    if-ne v0, v1, :cond_0

    return-void

    .line 52
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->reset()V

    .line 53
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    add-int/lit8 v2, v1, 0x1

    iget v3, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    sub-int/2addr v3, v1

    add-int/lit8 v3, v3, -0x1

    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    invoke-static {v0, v2, v3, p1, p0}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeUtf8To([BIILorg/eclipse/jetty/util/MultiMap;Lorg/eclipse/jetty/util/Utf8StringBuilder;)V

    return-void
.end method

.method public decodeQueryTo(Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    if-eqz p2, :cond_2

    .line 9
    .line 10
    invoke-static {p2}, Lorg/eclipse/jetty/util/StringUtil;->isUTF8(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 18
    .line 19
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 20
    .line 21
    add-int/lit8 v2, v1, 0x1

    .line 22
    .line 23
    iget p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 24
    .line 25
    sub-int/2addr p0, v1

    .line 26
    add-int/lit8 p0, p0, -0x1

    .line 27
    .line 28
    invoke-static {v0, v2, p0, p2}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0, p1, p2}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeTo(Ljava/lang/String;Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    :goto_0
    iget-object p2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 37
    .line 38
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 39
    .line 40
    add-int/lit8 v1, v0, 0x1

    .line 41
    .line 42
    iget p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 43
    .line 44
    sub-int/2addr p0, v0

    .line 45
    add-int/lit8 p0, p0, -0x1

    .line 46
    .line 47
    invoke-static {p2, v1, p0, p1}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeUtf8To([BIILorg/eclipse/jetty/util/MultiMap;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public getAuthority()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_authority:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    sub-int/2addr v1, v0

    .line 10
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/http/HttpURI;->toUtf8String(II)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public getCompletePath()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_end:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    sub-int/2addr v1, v0

    .line 10
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/http/HttpURI;->toUtf8String(II)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public getDecodedPath()Ljava/lang/String;
    .locals 11

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    return-object v2

    .line 9
    :cond_0
    sub-int/2addr v1, v0

    .line 10
    const/4 v3, 0x0

    .line 11
    move-object v4, v2

    .line 12
    move v5, v3

    .line 13
    :goto_0
    iget v6, p0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 14
    .line 15
    if-ge v0, v6, :cond_5

    .line 16
    .line 17
    iget-object v7, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 18
    .line 19
    aget-byte v8, v7, v0

    .line 20
    .line 21
    const/16 v9, 0x25

    .line 22
    .line 23
    if-ne v8, v9, :cond_2

    .line 24
    .line 25
    add-int/lit8 v8, v0, 0x2

    .line 26
    .line 27
    if-ge v8, v6, :cond_1

    .line 28
    .line 29
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    const/16 v6, 0x10

    .line 32
    .line 33
    const/4 v9, 0x2

    .line 34
    invoke-static {v7, v0, v9, v6}, Lorg/eclipse/jetty/util/TypeUtil;->parseInt([BIII)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    and-int/lit16 v0, v0, 0xff

    .line 39
    .line 40
    int-to-byte v0, v0

    .line 41
    move v10, v8

    .line 42
    move v8, v0

    .line 43
    move v0, v10

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    const-string v0, "Bad % encoding: "

    .line 46
    .line 47
    invoke-static {v0, p0}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-object v2

    .line 51
    :cond_2
    if-nez v4, :cond_3

    .line 52
    .line 53
    add-int/lit8 v5, v5, 0x1

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_3
    :goto_1
    if-nez v4, :cond_4

    .line 57
    .line 58
    new-array v4, v1, [B

    .line 59
    .line 60
    iget-object v6, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 61
    .line 62
    iget v7, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 63
    .line 64
    invoke-static {v6, v7, v4, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    .line 66
    .line 67
    :cond_4
    add-int/lit8 v6, v5, 0x1

    .line 68
    .line 69
    aput-byte v8, v4, v5

    .line 70
    .line 71
    move v5, v6

    .line 72
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_5
    if-nez v4, :cond_6

    .line 76
    .line 77
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 78
    .line 79
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/http/HttpURI;->toUtf8String(II)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    :cond_6
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    .line 85
    .line 86
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->reset()V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    .line 90
    .line 91
    invoke-virtual {v0, v4, v3, v5}, Lorg/eclipse/jetty/util/Utf8Appendable;->append([BII)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_utf8b:Lorg/eclipse/jetty/util/Utf8StringBuilder;

    .line 95
    .line 96
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0
.end method

.method public getDecodedPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    .line 101
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    return-object v2

    :cond_0
    sub-int/2addr v1, v0

    const/4 v3, 0x0

    move-object v4, v2

    move v5, v3

    .line 102
    :goto_0
    iget v6, p0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    if-ge v0, v6, :cond_5

    .line 103
    iget-object v7, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    aget-byte v8, v7, v0

    const/16 v9, 0x25

    if-ne v8, v9, :cond_2

    add-int/lit8 v8, v0, 0x2

    if-ge v8, v6, :cond_1

    add-int/lit8 v0, v0, 0x1

    const/16 v6, 0x10

    const/4 v9, 0x2

    .line 104
    invoke-static {v7, v0, v9, v6}, Lorg/eclipse/jetty/util/TypeUtil;->parseInt([BIII)I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    move v10, v8

    move v8, v0

    move v0, v10

    goto :goto_1

    .line 105
    :cond_1
    const-string p1, "Bad % encoding: "

    invoke-static {p1, p0}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v2

    :cond_2
    if-nez v4, :cond_3

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_3
    :goto_1
    if-nez v4, :cond_4

    .line 106
    new-array v4, v1, [B

    .line 107
    iget-object v6, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    iget v7, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    invoke-static {v6, v7, v4, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_4
    add-int/lit8 v6, v5, 0x1

    .line 108
    aput-byte v8, v4, v5

    move v5, v6

    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    if-nez v4, :cond_6

    .line 109
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    iget p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    sub-int/2addr v6, p0

    invoke-static {v0, p0, v6, p1}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 110
    :cond_6
    invoke-static {v4, v3, v5, p1}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getFragment()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_end:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    add-int/lit8 v2, v0, 0x1

    .line 10
    .line 11
    sub-int/2addr v1, v0

    .line 12
    add-int/lit8 v1, v1, -0x1

    .line 13
    .line 14
    invoke-direct {p0, v2, v1}, Lorg/eclipse/jetty/http/HttpURI;->toUtf8String(II)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public getHost()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_host:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    sub-int/2addr v1, v0

    .line 10
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/http/HttpURI;->toUtf8String(II)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public getParam()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    add-int/lit8 v2, v0, 0x1

    .line 10
    .line 11
    sub-int/2addr v1, v0

    .line 12
    add-int/lit8 v1, v1, -0x1

    .line 13
    .line 14
    invoke-direct {p0, v2, v1}, Lorg/eclipse/jetty/http/HttpURI;->toUtf8String(II)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public getPath()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    sub-int/2addr v1, v0

    .line 10
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/http/HttpURI;->toUtf8String(II)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public getPathAndParam()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    sub-int/2addr v1, v0

    .line 10
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/http/HttpURI;->toUtf8String(II)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public getPort()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_portValue:I

    .line 2
    .line 3
    return p0
.end method

.method public getQuery()Ljava/lang/String;
    .locals 3

    .line 21
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    if-ne v0, v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    add-int/lit8 v2, v0, 0x1

    sub-int/2addr v1, v0

    add-int/lit8 v1, v1, -0x1

    .line 22
    invoke-direct {p0, v2, v1}, Lorg/eclipse/jetty/http/HttpURI;->toUtf8String(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getQuery(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 10
    .line 11
    add-int/lit8 v2, v0, 0x1

    .line 12
    .line 13
    sub-int/2addr v1, v0

    .line 14
    add-int/lit8 v1, v1, -0x1

    .line 15
    .line 16
    invoke-static {p0, v2, v1, p1}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 8

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_scheme:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_authority:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    sub-int v2, v1, v0

    .line 10
    .line 11
    const/4 v3, 0x5

    .line 12
    const/16 v4, 0x70

    .line 13
    .line 14
    const/16 v5, 0x68

    .line 15
    .line 16
    const/16 v6, 0x74

    .line 17
    .line 18
    if-ne v2, v3, :cond_1

    .line 19
    .line 20
    iget-object v3, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 21
    .line 22
    aget-byte v7, v3, v0

    .line 23
    .line 24
    if-ne v7, v5, :cond_1

    .line 25
    .line 26
    add-int/lit8 v7, v0, 0x1

    .line 27
    .line 28
    aget-byte v7, v3, v7

    .line 29
    .line 30
    if-ne v7, v6, :cond_1

    .line 31
    .line 32
    add-int/lit8 v7, v0, 0x2

    .line 33
    .line 34
    aget-byte v7, v3, v7

    .line 35
    .line 36
    if-ne v7, v6, :cond_1

    .line 37
    .line 38
    add-int/lit8 v7, v0, 0x3

    .line 39
    .line 40
    aget-byte v3, v3, v7

    .line 41
    .line 42
    if-ne v3, v4, :cond_1

    .line 43
    .line 44
    const-string p0, "http"

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_1
    const/4 v3, 0x6

    .line 48
    if-ne v2, v3, :cond_2

    .line 49
    .line 50
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 51
    .line 52
    aget-byte v3, v2, v0

    .line 53
    .line 54
    if-ne v3, v5, :cond_2

    .line 55
    .line 56
    add-int/lit8 v3, v0, 0x1

    .line 57
    .line 58
    aget-byte v3, v2, v3

    .line 59
    .line 60
    if-ne v3, v6, :cond_2

    .line 61
    .line 62
    add-int/lit8 v3, v0, 0x2

    .line 63
    .line 64
    aget-byte v3, v2, v3

    .line 65
    .line 66
    if-ne v3, v6, :cond_2

    .line 67
    .line 68
    add-int/lit8 v3, v0, 0x3

    .line 69
    .line 70
    aget-byte v3, v2, v3

    .line 71
    .line 72
    if-ne v3, v4, :cond_2

    .line 73
    .line 74
    add-int/lit8 v3, v0, 0x4

    .line 75
    .line 76
    aget-byte v2, v2, v3

    .line 77
    .line 78
    const/16 v3, 0x73

    .line 79
    .line 80
    if-ne v2, v3, :cond_2

    .line 81
    .line 82
    const-string p0, "https"

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_2
    sub-int/2addr v1, v0

    .line 86
    add-int/lit8 v1, v1, -0x1

    .line 87
    .line 88
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/http/HttpURI;->toUtf8String(II)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method public hasQuery()Z
    .locals 1

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 2
    .line 3
    iget p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 4
    .line 5
    if-le v0, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public parse(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    array-length v2, v0

    .line 7
    invoke-direct {p0, v0, v1, v2}, Lorg/eclipse/jetty/http/HttpURI;->parse2([BII)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpURI;->_rawString:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public parse([BII)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_rawString:Ljava/lang/String;

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jetty/http/HttpURI;->parse2([BII)V

    return-void
.end method

.method public parseConnect([BII)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_rawString:Ljava/lang/String;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_encoded:Z

    .line 6
    .line 7
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 8
    .line 9
    add-int p1, p2, p3

    .line 10
    .line 11
    iput p1, p0, Lorg/eclipse/jetty/http/HttpURI;->_end:I

    .line 12
    .line 13
    iput p2, p0, Lorg/eclipse/jetty/http/HttpURI;->_scheme:I

    .line 14
    .line 15
    iput p2, p0, Lorg/eclipse/jetty/http/HttpURI;->_authority:I

    .line 16
    .line 17
    iput p2, p0, Lorg/eclipse/jetty/http/HttpURI;->_host:I

    .line 18
    .line 19
    iput p1, p0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    iput v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_portValue:I

    .line 23
    .line 24
    iput p1, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 25
    .line 26
    iput p1, p0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 27
    .line 28
    iput p1, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 29
    .line 30
    iput p1, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 31
    .line 32
    const/4 v0, 0x4

    .line 33
    move v1, p2

    .line 34
    move v2, v0

    .line 35
    :goto_0
    if-ge v1, p1, :cond_6

    .line 36
    .line 37
    iget-object v3, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 38
    .line 39
    aget-byte v3, v3, v1

    .line 40
    .line 41
    and-int/lit16 v3, v3, 0xff

    .line 42
    .line 43
    int-to-char v3, v3

    .line 44
    add-int/lit8 v4, v1, 0x1

    .line 45
    .line 46
    const/4 v5, 0x5

    .line 47
    if-eq v2, v0, :cond_3

    .line 48
    .line 49
    if-eq v2, v5, :cond_0

    .line 50
    .line 51
    :goto_1
    move v1, v4

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    const/16 v1, 0x2f

    .line 54
    .line 55
    if-eq v3, v1, :cond_2

    .line 56
    .line 57
    const/16 v1, 0x5d

    .line 58
    .line 59
    if-eq v3, v1, :cond_1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    move v2, v0

    .line 63
    goto :goto_1

    .line 64
    :cond_2
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 65
    .line 66
    sget-object p1, Lorg/eclipse/jetty/util/URIUtil;->__CHARSET:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p0, p2, p3, p1}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "No closing \']\' for "

    .line 73
    .line 74
    invoke-static {p1, p0}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_3
    const/16 v6, 0x3a

    .line 79
    .line 80
    if-eq v3, v6, :cond_5

    .line 81
    .line 82
    const/16 v1, 0x5b

    .line 83
    .line 84
    if-eq v3, v1, :cond_4

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_4
    move v2, v5

    .line 88
    goto :goto_1

    .line 89
    :cond_5
    iput v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 90
    .line 91
    :cond_6
    iget p1, p0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 92
    .line 93
    iget p3, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 94
    .line 95
    if-ge p1, p3, :cond_7

    .line 96
    .line 97
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 98
    .line 99
    add-int/lit8 v1, p1, 0x1

    .line 100
    .line 101
    sub-int/2addr p3, p1

    .line 102
    add-int/lit8 p3, p3, -0x1

    .line 103
    .line 104
    const/16 p1, 0xa

    .line 105
    .line 106
    invoke-static {v0, v1, p3, p1}, Lorg/eclipse/jetty/util/TypeUtil;->parseInt([BIII)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    iput p1, p0, Lorg/eclipse/jetty/http/HttpURI;->_portValue:I

    .line 111
    .line 112
    iput p2, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 113
    .line 114
    return-void

    .line 115
    :cond_7
    const-string p0, "No port"

    .line 116
    .line 117
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_rawString:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_scheme:I

    .line 6
    .line 7
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_end:I

    .line 8
    .line 9
    sub-int/2addr v1, v0

    .line 10
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/http/HttpURI;->toUtf8String(II)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_rawString:Ljava/lang/String;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_rawString:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0
.end method

.method public writeTo(Lorg/eclipse/jetty/util/Utf8StringBuilder;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_scheme:I

    .line 4
    .line 5
    iget p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_end:I

    .line 6
    .line 7
    sub-int/2addr p0, v1

    .line 8
    invoke-virtual {p1, v0, v1, p0}, Lorg/eclipse/jetty/util/Utf8Appendable;->append([BII)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
