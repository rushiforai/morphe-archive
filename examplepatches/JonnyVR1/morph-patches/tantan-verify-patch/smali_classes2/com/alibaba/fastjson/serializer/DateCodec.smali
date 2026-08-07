.class public Lcom/alibaba/fastjson/serializer/DateCodec;
.super Lcom/alibaba/fastjson/parser/deserializer/AbstractDateDeserializer;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/serializer/DateCodec;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/serializer/DateCodec;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/DateCodec;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/serializer/DateCodec;->instance:Lcom/alibaba/fastjson/serializer/DateCodec;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/alibaba/fastjson/parser/deserializer/AbstractDateDeserializer;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public cast(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p4, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    instance-of p3, p4, Ljava/util/Date;

    .line 6
    .line 7
    if-eqz p3, :cond_1

    .line 8
    .line 9
    return-object p4

    .line 10
    :cond_1
    instance-of p3, p4, Ljava/math/BigDecimal;

    .line 11
    .line 12
    if-eqz p3, :cond_2

    .line 13
    .line 14
    new-instance p0, Ljava/util/Date;

    .line 15
    .line 16
    check-cast p4, Ljava/math/BigDecimal;

    .line 17
    .line 18
    invoke-static {p4}, Lcom/alibaba/fastjson/util/TypeUtils;->longValue(Ljava/math/BigDecimal;)J

    .line 19
    .line 20
    .line 21
    move-result-wide p1

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 23
    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_2
    instance-of p3, p4, Ljava/lang/Number;

    .line 27
    .line 28
    if-eqz p3, :cond_3

    .line 29
    .line 30
    new-instance p0, Ljava/util/Date;

    .line 31
    .line 32
    check-cast p4, Ljava/lang/Number;

    .line 33
    .line 34
    invoke-virtual {p4}, Ljava/lang/Number;->longValue()J

    .line 35
    .line 36
    .line 37
    move-result-wide p1

    .line 38
    invoke-direct {p0, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 39
    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_3
    instance-of p3, p4, Ljava/lang/String;

    .line 43
    .line 44
    if-eqz p3, :cond_f

    .line 45
    .line 46
    check-cast p4, Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    .line 49
    .line 50
    .line 51
    move-result p3

    .line 52
    if-nez p3, :cond_4

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_4
    new-instance p3, Lcom/alibaba/fastjson/parser/JSONScanner;

    .line 56
    .line 57
    invoke-direct {p3, p4}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    :try_start_0
    invoke-virtual {p3, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(Z)Z

    .line 62
    .line 63
    .line 64
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    const-class v2, Ljava/util/Calendar;

    .line 66
    .line 67
    if-eqz v1, :cond_6

    .line 68
    .line 69
    :try_start_1
    invoke-virtual {p3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCalendar()Ljava/util/Calendar;

    .line 70
    .line 71
    .line 72
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    if-ne p2, v2, :cond_5

    .line 74
    .line 75
    invoke-virtual {p3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 76
    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_5
    :try_start_2
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 80
    .line 81
    .line 82
    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 83
    invoke-virtual {p3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 84
    .line 85
    .line 86
    return-object p0

    .line 87
    :catchall_0
    move-exception p0

    .line 88
    goto/16 :goto_3

    .line 89
    .line 90
    :cond_6
    invoke-virtual {p3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    .line 94
    .line 95
    .line 96
    move-result p3

    .line 97
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getDateFomartPattern()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eq p3, v1, :cond_7

    .line 106
    .line 107
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    .line 108
    .line 109
    .line 110
    move-result p3

    .line 111
    const/16 v1, 0x16

    .line 112
    .line 113
    if-ne p3, v1, :cond_8

    .line 114
    .line 115
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getDateFomartPattern()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p3

    .line 119
    const-string v1, "yyyyMMddHHmmssSSSZ"

    .line 120
    .line 121
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result p3

    .line 125
    if-eqz p3, :cond_8

    .line 126
    .line 127
    :cond_7
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getDateFormat()Ljava/text/DateFormat;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    :try_start_3
    invoke-virtual {p1, p4}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 132
    .line 133
    .line 134
    move-result-object p0
    :try_end_3
    .catch Ljava/text/ParseException; {:try_start_3 .. :try_end_3} :catch_0

    .line 135
    return-object p0

    .line 136
    :catch_0
    :cond_8
    const-string p1, "/Date("

    .line 137
    .line 138
    invoke-virtual {p4, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-eqz p1, :cond_9

    .line 143
    .line 144
    const-string p1, ")/"

    .line 145
    .line 146
    invoke-virtual {p4, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    if-eqz p1, :cond_9

    .line 151
    .line 152
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    add-int/lit8 p1, p1, -0x2

    .line 157
    .line 158
    const/4 p3, 0x6

    .line 159
    invoke-virtual {p4, p3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p4

    .line 163
    :cond_9
    const-string p1, "0000-00-00"

    .line 164
    .line 165
    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    if-nez p1, :cond_e

    .line 170
    .line 171
    const-string p1, "0000-00-00T00:00:00"

    .line 172
    .line 173
    invoke-virtual {p1, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-nez p1, :cond_e

    .line 178
    .line 179
    const-string p1, "0001-01-01T00:00:00+08:00"

    .line 180
    .line 181
    invoke-virtual {p1, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-eqz p1, :cond_a

    .line 186
    .line 187
    goto :goto_2

    .line 188
    :cond_a
    const/16 p0, 0x7c

    .line 189
    .line 190
    invoke-virtual {p4, p0}, Ljava/lang/String;->lastIndexOf(I)I

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    const/16 p1, 0x14

    .line 195
    .line 196
    if-le p0, p1, :cond_d

    .line 197
    .line 198
    add-int/lit8 p1, p0, 0x1

    .line 199
    .line 200
    invoke-virtual {p4, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-static {p1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    const-string p3, "GMT"

    .line 209
    .line 210
    invoke-virtual {p1}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result p3

    .line 218
    if-nez p3, :cond_d

    .line 219
    .line 220
    invoke-virtual {p4, v0, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    new-instance p3, Lcom/alibaba/fastjson/parser/JSONScanner;

    .line 225
    .line 226
    invoke-direct {p3, p0}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    :try_start_4
    invoke-virtual {p3, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(Z)Z

    .line 230
    .line 231
    .line 232
    move-result p0

    .line 233
    if-eqz p0, :cond_c

    .line 234
    .line 235
    invoke-virtual {p3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCalendar()Ljava/util/Calendar;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-virtual {p0, p1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 240
    .line 241
    .line 242
    if-ne p2, v2, :cond_b

    .line 243
    .line 244
    invoke-virtual {p3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 245
    .line 246
    .line 247
    return-object p0

    .line 248
    :cond_b
    :try_start_5
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 249
    .line 250
    .line 251
    move-result-object p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 252
    invoke-virtual {p3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 253
    .line 254
    .line 255
    return-object p0

    .line 256
    :catchall_1
    move-exception p0

    .line 257
    goto :goto_0

    .line 258
    :cond_c
    invoke-virtual {p3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 259
    .line 260
    .line 261
    goto :goto_1

    .line 262
    :goto_0
    invoke-virtual {p3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 263
    .line 264
    .line 265
    throw p0

    .line 266
    :cond_d
    :goto_1
    invoke-static {p4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 267
    .line 268
    .line 269
    move-result-wide p0

    .line 270
    new-instance p2, Ljava/util/Date;

    .line 271
    .line 272
    invoke-direct {p2, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 273
    .line 274
    .line 275
    return-object p2

    .line 276
    :cond_e
    :goto_2
    return-object p0

    .line 277
    :goto_3
    invoke-virtual {p3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 278
    .line 279
    .line 280
    throw p0

    .line 281
    :cond_f
    const-string p1, "parse error"

    .line 282
    .line 283
    invoke-static {p1}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    return-object p0
.end method

.method public getFastMatchToken()I
    .locals 0

    const/4 p0, 0x2

    return p0
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget-object v2, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-class v4, Ljava/sql/Date;

    .line 18
    .line 19
    const-wide/32 v5, 0x5265c00

    .line 20
    .line 21
    .line 22
    if-ne v3, v4, :cond_1

    .line 23
    .line 24
    move-object v4, v1

    .line 25
    check-cast v4, Ljava/sql/Date;

    .line 26
    .line 27
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    .line 28
    .line 29
    .line 30
    move-result-wide v7

    .line 31
    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->timeZone:Ljava/util/TimeZone;

    .line 32
    .line 33
    invoke-virtual {v4, v7, v8}, Ljava/util/TimeZone;->getOffset(J)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    int-to-long v9, v4

    .line 38
    add-long/2addr v7, v9

    .line 39
    rem-long/2addr v7, v5

    .line 40
    const-wide/16 v9, 0x0

    .line 41
    .line 42
    cmp-long v4, v7, v9

    .line 43
    .line 44
    if-nez v4, :cond_1

    .line 45
    .line 46
    iget v4, v2, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 47
    .line 48
    sget-object v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 49
    .line 50
    move/from16 v8, p5

    .line 51
    .line 52
    invoke-static {v4, v8, v7}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->isEnabled(IILcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-nez v4, :cond_1

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    const-class v4, Ljava/sql/Time;

    .line 67
    .line 68
    const-string v7, "millis"

    .line 69
    .line 70
    const-wide/16 v8, 0x3e8

    .line 71
    .line 72
    const-string v10, "unixtime"

    .line 73
    .line 74
    if-ne v3, v4, :cond_4

    .line 75
    .line 76
    move-object v4, v1

    .line 77
    check-cast v4, Ljava/sql/Time;

    .line 78
    .line 79
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    .line 80
    .line 81
    .line 82
    move-result-wide v11

    .line 83
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getDateFormatPattern()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-eqz v4, :cond_2

    .line 92
    .line 93
    div-long/2addr v11, v8

    .line 94
    invoke-virtual {v2, v11, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getDateFormatPattern()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-eqz v4, :cond_3

    .line 107
    .line 108
    invoke-virtual {v2, v11, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    cmp-long v4, v11, v5

    .line 113
    .line 114
    if-gez v4, :cond_4

    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_4
    instance-of v4, v1, Ljava/util/Date;

    .line 125
    .line 126
    if-eqz v4, :cond_5

    .line 127
    .line 128
    move-object v4, v1

    .line 129
    check-cast v4, Ljava/util/Date;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_5
    invoke-static {v1}, Lcom/alibaba/fastjson/util/TypeUtils;->castToDate(Ljava/lang/Object;)Ljava/util/Date;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    :goto_0
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getDateFormatPattern()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v5

    .line 140
    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    if-eqz v5, :cond_6

    .line 145
    .line 146
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    .line 147
    .line 148
    .line 149
    move-result-wide v0

    .line 150
    div-long/2addr v0, v8

    .line 151
    invoke-virtual {v2, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_6
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getDateFormatPattern()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v5

    .line 163
    if-eqz v5, :cond_7

    .line 164
    .line 165
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    .line 166
    .line 167
    .line 168
    move-result-wide v0

    .line 169
    invoke-virtual {v2, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_7
    sget-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteDateUseDateFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 174
    .line 175
    invoke-virtual {v2, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 176
    .line 177
    .line 178
    move-result v5

    .line 179
    if-eqz v5, :cond_9

    .line 180
    .line 181
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getDateFormat()Ljava/text/DateFormat;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    if-nez v1, :cond_8

    .line 186
    .line 187
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 188
    .line 189
    sget-object v3, Lcom/alibaba/fastjson/JSON;->DEFFAULT_DATE_FORMAT:Ljava/lang/String;

    .line 190
    .line 191
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->locale:Ljava/util/Locale;

    .line 192
    .line 193
    invoke-direct {v1, v3, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 194
    .line 195
    .line 196
    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->timeZone:Ljava/util/TimeZone;

    .line 197
    .line 198
    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 199
    .line 200
    .line 201
    :cond_8
    invoke-virtual {v1, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_9
    sget-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 210
    .line 211
    invoke-virtual {v2, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 212
    .line 213
    .line 214
    move-result v5

    .line 215
    if-eqz v5, :cond_b

    .line 216
    .line 217
    move-object/from16 v5, p4

    .line 218
    .line 219
    if-eq v3, v5, :cond_b

    .line 220
    .line 221
    const-class v4, Ljava/util/Date;

    .line 222
    .line 223
    if-ne v3, v4, :cond_a

    .line 224
    .line 225
    const-string v0, "new Date("

    .line 226
    .line 227
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    move-object v0, v1

    .line 231
    check-cast v0, Ljava/util/Date;

    .line 232
    .line 233
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 234
    .line 235
    .line 236
    move-result-wide v0

    .line 237
    invoke-virtual {v2, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 238
    .line 239
    .line 240
    const/16 v0, 0x29

    .line 241
    .line 242
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :cond_a
    const/16 v4, 0x7b

    .line 247
    .line 248
    invoke-virtual {v2, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 249
    .line 250
    .line 251
    sget-object v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    .line 252
    .line 253
    invoke-virtual {v2, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    move-object v0, v1

    .line 264
    check-cast v0, Ljava/util/Date;

    .line 265
    .line 266
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 267
    .line 268
    .line 269
    move-result-wide v0

    .line 270
    const/16 v3, 0x2c

    .line 271
    .line 272
    const-string v4, "val"

    .line 273
    .line 274
    invoke-virtual {v2, v3, v4, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;J)V

    .line 275
    .line 276
    .line 277
    const/16 v0, 0x7d

    .line 278
    .line 279
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 280
    .line 281
    .line 282
    return-void

    .line 283
    :cond_b
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    .line 284
    .line 285
    .line 286
    move-result-wide v3

    .line 287
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseISO8601DateFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 288
    .line 289
    invoke-virtual {v2, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    if-eqz v1, :cond_14

    .line 294
    .line 295
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseSingleQuotes:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 296
    .line 297
    invoke-virtual {v2, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    if-eqz v1, :cond_c

    .line 302
    .line 303
    const/16 v1, 0x27

    .line 304
    .line 305
    goto :goto_1

    .line 306
    :cond_c
    const/16 v1, 0x22

    .line 307
    .line 308
    :goto_1
    invoke-virtual {v2, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 309
    .line 310
    .line 311
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->timeZone:Ljava/util/TimeZone;

    .line 312
    .line 313
    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->locale:Ljava/util/Locale;

    .line 314
    .line 315
    invoke-static {v5, v0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 320
    .line 321
    .line 322
    const/4 v3, 0x1

    .line 323
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    .line 324
    .line 325
    .line 326
    move-result v4

    .line 327
    const/4 v5, 0x2

    .line 328
    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    .line 329
    .line 330
    .line 331
    move-result v5

    .line 332
    add-int/2addr v5, v3

    .line 333
    const/4 v3, 0x5

    .line 334
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    .line 335
    .line 336
    .line 337
    move-result v3

    .line 338
    const/16 v6, 0xb

    .line 339
    .line 340
    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    .line 341
    .line 342
    .line 343
    move-result v6

    .line 344
    const/16 v7, 0xc

    .line 345
    .line 346
    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    .line 347
    .line 348
    .line 349
    move-result v7

    .line 350
    const/16 v8, 0xd

    .line 351
    .line 352
    invoke-virtual {v0, v8}, Ljava/util/Calendar;->get(I)I

    .line 353
    .line 354
    .line 355
    move-result v9

    .line 356
    const/16 v10, 0xe

    .line 357
    .line 358
    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    .line 359
    .line 360
    .line 361
    move-result v10

    .line 362
    const/16 v11, 0x10

    .line 363
    .line 364
    const/16 v12, 0x13

    .line 365
    .line 366
    const/16 v15, 0xa

    .line 367
    .line 368
    if-eqz v10, :cond_d

    .line 369
    .line 370
    const-string v16, "0000-00-00T00:00:00.000"

    .line 371
    .line 372
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->toCharArray()[C

    .line 373
    .line 374
    .line 375
    move-result-object v13

    .line 376
    const/16 v14, 0x17

    .line 377
    .line 378
    invoke-static {v10, v14, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 379
    .line 380
    .line 381
    invoke-static {v9, v12, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 382
    .line 383
    .line 384
    invoke-static {v7, v11, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 385
    .line 386
    .line 387
    invoke-static {v6, v8, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 388
    .line 389
    .line 390
    invoke-static {v3, v15, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 391
    .line 392
    .line 393
    const/4 v10, 0x7

    .line 394
    invoke-static {v5, v10, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 395
    .line 396
    .line 397
    const/4 v14, 0x4

    .line 398
    invoke-static {v4, v14, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 399
    .line 400
    .line 401
    goto :goto_2

    .line 402
    :cond_d
    const/4 v10, 0x7

    .line 403
    const/4 v14, 0x4

    .line 404
    if-nez v9, :cond_e

    .line 405
    .line 406
    if-nez v7, :cond_e

    .line 407
    .line 408
    if-nez v6, :cond_e

    .line 409
    .line 410
    const-string v6, "0000-00-00"

    .line 411
    .line 412
    invoke-virtual {v6}, Ljava/lang/String;->toCharArray()[C

    .line 413
    .line 414
    .line 415
    move-result-object v13

    .line 416
    invoke-static {v3, v15, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 417
    .line 418
    .line 419
    invoke-static {v5, v10, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 420
    .line 421
    .line 422
    invoke-static {v4, v14, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 423
    .line 424
    .line 425
    goto :goto_2

    .line 426
    :cond_e
    const-string v10, "0000-00-00T00:00:00"

    .line 427
    .line 428
    invoke-virtual {v10}, Ljava/lang/String;->toCharArray()[C

    .line 429
    .line 430
    .line 431
    move-result-object v13

    .line 432
    invoke-static {v9, v12, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 433
    .line 434
    .line 435
    invoke-static {v7, v11, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 436
    .line 437
    .line 438
    invoke-static {v6, v8, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 439
    .line 440
    .line 441
    invoke-static {v3, v15, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 442
    .line 443
    .line 444
    const/4 v10, 0x7

    .line 445
    invoke-static {v5, v10, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 446
    .line 447
    .line 448
    const/4 v14, 0x4

    .line 449
    invoke-static {v4, v14, v13}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 450
    .line 451
    .line 452
    :goto_2
    invoke-virtual {v2, v13}, Ljava/io/Writer;->write([C)V

    .line 453
    .line 454
    .line 455
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    .line 456
    .line 457
    .line 458
    move-result-object v3

    .line 459
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 460
    .line 461
    .line 462
    move-result-wide v4

    .line 463
    invoke-virtual {v3, v4, v5}, Ljava/util/TimeZone;->getOffset(J)I

    .line 464
    .line 465
    .line 466
    move-result v0

    .line 467
    int-to-float v0, v0

    .line 468
    const v3, 0x4a5bba00    # 3600000.0f

    .line 469
    .line 470
    .line 471
    div-float/2addr v0, v3

    .line 472
    float-to-int v3, v0

    .line 473
    int-to-double v4, v3

    .line 474
    const-wide/16 v6, 0x0

    .line 475
    .line 476
    cmpl-double v4, v4, v6

    .line 477
    .line 478
    if-nez v4, :cond_f

    .line 479
    .line 480
    const/16 v0, 0x5a

    .line 481
    .line 482
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 483
    .line 484
    .line 485
    goto :goto_4

    .line 486
    :cond_f
    const/16 v4, 0x9

    .line 487
    .line 488
    const/16 v5, 0x2b

    .line 489
    .line 490
    if-le v3, v4, :cond_10

    .line 491
    .line 492
    invoke-virtual {v2, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 493
    .line 494
    .line 495
    invoke-virtual {v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 496
    .line 497
    .line 498
    goto :goto_3

    .line 499
    :cond_10
    const/16 v4, 0x30

    .line 500
    .line 501
    if-lez v3, :cond_11

    .line 502
    .line 503
    invoke-virtual {v2, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 504
    .line 505
    .line 506
    invoke-virtual {v2, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 507
    .line 508
    .line 509
    invoke-virtual {v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 510
    .line 511
    .line 512
    goto :goto_3

    .line 513
    :cond_11
    const/16 v5, -0x9

    .line 514
    .line 515
    const/16 v6, 0x2d

    .line 516
    .line 517
    if-ge v3, v5, :cond_12

    .line 518
    .line 519
    invoke-virtual {v2, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 520
    .line 521
    .line 522
    invoke-virtual {v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 523
    .line 524
    .line 525
    goto :goto_3

    .line 526
    :cond_12
    if-gez v3, :cond_13

    .line 527
    .line 528
    invoke-virtual {v2, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 529
    .line 530
    .line 531
    invoke-virtual {v2, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 532
    .line 533
    .line 534
    neg-int v4, v3

    .line 535
    invoke-virtual {v2, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 536
    .line 537
    .line 538
    :cond_13
    :goto_3
    const/16 v4, 0x3a

    .line 539
    .line 540
    invoke-virtual {v2, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 541
    .line 542
    .line 543
    int-to-float v3, v3

    .line 544
    sub-float/2addr v0, v3

    .line 545
    const/high16 v3, 0x42700000    # 60.0f

    .line 546
    .line 547
    mul-float/2addr v0, v3

    .line 548
    float-to-int v0, v0

    .line 549
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 550
    .line 551
    .line 552
    move-result-object v0

    .line 553
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 554
    .line 555
    .line 556
    move-result-object v0

    .line 557
    const-string v3, "%02d"

    .line 558
    .line 559
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 560
    .line 561
    .line 562
    move-result-object v0

    .line 563
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 564
    .line 565
    .line 566
    :goto_4
    invoke-virtual {v2, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 567
    .line 568
    .line 569
    return-void

    .line 570
    :cond_14
    invoke-virtual {v2, v3, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 571
    .line 572
    .line 573
    return-void
.end method
