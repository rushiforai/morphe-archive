.class public Lorg/eclipse/jetty/http/MimeTypes;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CACHE:Lorg/eclipse/jetty/io/BufferCache;

.field public static final FORM_ENCODED:Ljava/lang/String; = "application/x-www-form-urlencoded"

.field public static final FORM_ENCODED_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final FORM_ENCODED_ORDINAL:I = 0x1

.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field public static final MESSAGE_HTTP:Ljava/lang/String; = "message/http"

.field public static final MESSAGE_HTTP_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final MESSAGE_HTTP_ORDINAL:I = 0x2

.field public static final MULTIPART_BYTERANGES:Ljava/lang/String; = "multipart/byteranges"

.field public static final MULTIPART_BYTERANGES_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final MULTIPART_BYTERANGES_ORDINAL:I = 0x3

.field public static final TEXT_HTML:Ljava/lang/String; = "text/html"

.field public static final TEXT_HTML_8859_1:Ljava/lang/String; = "text/html;charset=ISO-8859-1"

.field public static final TEXT_HTML_8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_HTML_8859_1_ORDINAL:I = 0x8

.field public static final TEXT_HTML_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_HTML_ORDINAL:I = 0x4

.field public static final TEXT_HTML_UTF_8:Ljava/lang/String; = "text/html;charset=UTF-8"

.field public static final TEXT_HTML_UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_HTML_UTF_8_ORDINAL:I = 0xb

.field private static final TEXT_HTML__8859_1:Ljava/lang/String; = "text/html; charset=ISO-8859-1"

.field public static final TEXT_HTML__8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_HTML__UTF_8:Ljava/lang/String; = "text/html; charset=UTF-8"

.field public static final TEXT_HTML__UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field public static final TEXT_JSON:Ljava/lang/String; = "text/json"

.field public static final TEXT_JSON_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_JSON_ORDINAL:I = 0x7

.field public static final TEXT_JSON_UTF_8:Ljava/lang/String; = "text/json;charset=UTF-8"

.field public static final TEXT_JSON_UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_JSON_UTF_8_ORDINAL:I = 0xe

.field private static final TEXT_JSON__UTF_8:Ljava/lang/String; = "text/json; charset=UTF-8"

.field public static final TEXT_JSON__UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field public static final TEXT_PLAIN:Ljava/lang/String; = "text/plain"

.field public static final TEXT_PLAIN_8859_1:Ljava/lang/String; = "text/plain;charset=ISO-8859-1"

.field public static final TEXT_PLAIN_8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_PLAIN_8859_1_ORDINAL:I = 0x9

.field public static final TEXT_PLAIN_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_PLAIN_ORDINAL:I = 0x5

.field public static final TEXT_PLAIN_UTF_8:Ljava/lang/String; = "text/plain;charset=UTF-8"

.field public static final TEXT_PLAIN_UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_PLAIN_UTF_8_ORDINAL:I = 0xc

.field private static final TEXT_PLAIN__8859_1:Ljava/lang/String; = "text/plain; charset=ISO-8859-1"

.field public static final TEXT_PLAIN__8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_PLAIN__UTF_8:Ljava/lang/String; = "text/plain; charset=UTF-8"

.field public static final TEXT_PLAIN__UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field public static final TEXT_XML:Ljava/lang/String; = "text/xml"

.field public static final TEXT_XML_8859_1:Ljava/lang/String; = "text/xml;charset=ISO-8859-1"

.field public static final TEXT_XML_8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_XML_8859_1_ORDINAL:I = 0xa

.field public static final TEXT_XML_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_XML_ORDINAL:I = 0x6

.field public static final TEXT_XML_UTF_8:Ljava/lang/String; = "text/xml;charset=UTF-8"

.field public static final TEXT_XML_UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_XML_UTF_8_ORDINAL:I = 0xd

.field private static final TEXT_XML__8859_1:Ljava/lang/String; = "text/xml; charset=ISO-8859-1"

.field public static final TEXT_XML__8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final TEXT_XML__UTF_8:Ljava/lang/String; = "text/xml; charset=UTF-8"

.field public static final TEXT_XML__UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field private static final __dftMimeMap:Ljava/util/Map;

.field private static final __encodings:Ljava/util/Map;

.field private static __index:I


# instance fields
.field private _mimeMap:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    const-class v0, Lorg/eclipse/jetty/http/MimeTypes;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/http/MimeTypes;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    const/16 v0, 0xf

    .line 10
    .line 11
    sput v0, Lorg/eclipse/jetty/http/MimeTypes;->__index:I

    .line 12
    .line 13
    new-instance v0, Lorg/eclipse/jetty/io/BufferCache;

    .line 14
    .line 15
    invoke-direct {v0}, Lorg/eclipse/jetty/io/BufferCache;-><init>()V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lorg/eclipse/jetty/http/MimeTypes;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    .line 19
    .line 20
    const-string v1, "application/x-www-form-urlencoded"

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->FORM_ENCODED_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 28
    .line 29
    const-string v1, "message/http"

    .line 30
    .line 31
    const/4 v2, 0x2

    .line 32
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->MESSAGE_HTTP_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 37
    .line 38
    const-string v1, "multipart/byteranges"

    .line 39
    .line 40
    const/4 v2, 0x3

    .line 41
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->MULTIPART_BYTERANGES_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 46
    .line 47
    const-string v1, "text/html"

    .line 48
    .line 49
    const/4 v2, 0x4

    .line 50
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_HTML_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 55
    .line 56
    const-string v1, "text/plain"

    .line 57
    .line 58
    const/4 v2, 0x5

    .line 59
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_PLAIN_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 64
    .line 65
    const-string v1, "text/xml"

    .line 66
    .line 67
    const/4 v2, 0x6

    .line 68
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_XML_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 73
    .line 74
    const-string v1, "text/json"

    .line 75
    .line 76
    const/4 v2, 0x7

    .line 77
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_JSON_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 82
    .line 83
    const-string v1, "text/html;charset=ISO-8859-1"

    .line 84
    .line 85
    const/16 v2, 0x8

    .line 86
    .line 87
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_HTML_8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 92
    .line 93
    const-string v1, "text/plain;charset=ISO-8859-1"

    .line 94
    .line 95
    const/16 v3, 0x9

    .line 96
    .line 97
    invoke-virtual {v0, v1, v3}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_PLAIN_8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 102
    .line 103
    const-string v1, "text/xml;charset=ISO-8859-1"

    .line 104
    .line 105
    const/16 v4, 0xa

    .line 106
    .line 107
    invoke-virtual {v0, v1, v4}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_XML_8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 112
    .line 113
    const-string v1, "text/html;charset=UTF-8"

    .line 114
    .line 115
    const/16 v5, 0xb

    .line 116
    .line 117
    invoke-virtual {v0, v1, v5}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_HTML_UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 122
    .line 123
    const-string v1, "text/plain;charset=UTF-8"

    .line 124
    .line 125
    const/16 v6, 0xc

    .line 126
    .line 127
    invoke-virtual {v0, v1, v6}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_PLAIN_UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 132
    .line 133
    const-string v1, "text/xml;charset=UTF-8"

    .line 134
    .line 135
    const/16 v7, 0xd

    .line 136
    .line 137
    invoke-virtual {v0, v1, v7}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_XML_UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 142
    .line 143
    const-string v1, "text/json;charset=UTF-8"

    .line 144
    .line 145
    const/16 v8, 0xe

    .line 146
    .line 147
    invoke-virtual {v0, v1, v8}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_JSON_UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 152
    .line 153
    const-string v1, "text/html; charset=ISO-8859-1"

    .line 154
    .line 155
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_HTML__8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 160
    .line 161
    const-string v1, "text/plain; charset=ISO-8859-1"

    .line 162
    .line 163
    invoke-virtual {v0, v1, v3}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_PLAIN__8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 168
    .line 169
    const-string v1, "text/xml; charset=ISO-8859-1"

    .line 170
    .line 171
    invoke-virtual {v0, v1, v4}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_XML__8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 176
    .line 177
    const-string v1, "text/html; charset=UTF-8"

    .line 178
    .line 179
    invoke-virtual {v0, v1, v5}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_HTML__UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 184
    .line 185
    const-string v1, "text/plain; charset=UTF-8"

    .line 186
    .line 187
    invoke-virtual {v0, v1, v6}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_PLAIN__UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 192
    .line 193
    const-string v1, "text/xml; charset=UTF-8"

    .line 194
    .line 195
    invoke-virtual {v0, v1, v7}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    sput-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_XML__UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 200
    .line 201
    const-string v1, "text/json; charset=UTF-8"

    .line 202
    .line 203
    invoke-virtual {v0, v1, v8}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    sput-object v0, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_JSON__UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 208
    .line 209
    new-instance v0, Ljava/util/HashMap;

    .line 210
    .line 211
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 212
    .line 213
    .line 214
    sput-object v0, Lorg/eclipse/jetty/http/MimeTypes;->__dftMimeMap:Ljava/util/Map;

    .line 215
    .line 216
    new-instance v0, Ljava/util/HashMap;

    .line 217
    .line 218
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 219
    .line 220
    .line 221
    sput-object v0, Lorg/eclipse/jetty/http/MimeTypes;->__encodings:Ljava/util/Map;

    .line 222
    .line 223
    const/4 v0, 0x0

    .line 224
    :try_start_0
    const-string v1, "org/eclipse/jetty/http/mime"

    .line 225
    .line 226
    invoke-static {v1}, Ljava/util/ResourceBundle;->getBundle(Ljava/lang/String;)Ljava/util/ResourceBundle;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-virtual {v1}, Ljava/util/ResourceBundle;->getKeys()Ljava/util/Enumeration;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    if-eqz v3, :cond_0

    .line 239
    .line 240
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v3

    .line 244
    check-cast v3, Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v1, v3}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v4

    .line 250
    sget-object v5, Lorg/eclipse/jetty/http/MimeTypes;->__dftMimeMap:Ljava/util/Map;

    .line 251
    .line 252
    invoke-static {v3}, Lorg/eclipse/jetty/util/StringUtil;->asciiToLowerCase(Ljava/lang/String;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v3

    .line 256
    invoke-static {v4}, Lorg/eclipse/jetty/http/MimeTypes;->normalizeMimeType(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 257
    .line 258
    .line 259
    move-result-object v4

    .line 260
    invoke-interface {v5, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/MissingResourceException; {:try_start_0 .. :try_end_0} :catch_0

    .line 261
    .line 262
    .line 263
    goto :goto_0

    .line 264
    :catch_0
    move-exception v1

    .line 265
    sget-object v2, Lorg/eclipse/jetty/http/MimeTypes;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 266
    .line 267
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    new-array v4, v0, [Ljava/lang/Object;

    .line 272
    .line 273
    invoke-interface {v2, v3, v4}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 274
    .line 275
    .line 276
    invoke-interface {v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 277
    .line 278
    .line 279
    :cond_0
    :try_start_1
    const-string v1, "org/eclipse/jetty/http/encoding"

    .line 280
    .line 281
    invoke-static {v1}, Ljava/util/ResourceBundle;->getBundle(Ljava/lang/String;)Ljava/util/ResourceBundle;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    invoke-virtual {v1}, Ljava/util/ResourceBundle;->getKeys()Ljava/util/Enumeration;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    :goto_1
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 290
    .line 291
    .line 292
    move-result v3

    .line 293
    if-eqz v3, :cond_1

    .line 294
    .line 295
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object v3

    .line 299
    check-cast v3, Ljava/lang/String;

    .line 300
    .line 301
    invoke-static {v3}, Lorg/eclipse/jetty/http/MimeTypes;->normalizeMimeType(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 302
    .line 303
    .line 304
    move-result-object v3

    .line 305
    sget-object v4, Lorg/eclipse/jetty/http/MimeTypes;->__encodings:Ljava/util/Map;

    .line 306
    .line 307
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v5

    .line 311
    invoke-virtual {v1, v5}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v5

    .line 315
    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/util/MissingResourceException; {:try_start_1 .. :try_end_1} :catch_1

    .line 316
    .line 317
    .line 318
    goto :goto_1

    .line 319
    :catch_1
    move-exception v1

    .line 320
    sget-object v2, Lorg/eclipse/jetty/http/MimeTypes;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 321
    .line 322
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v3

    .line 326
    new-array v0, v0, [Ljava/lang/Object;

    .line 327
    .line 328
    invoke-interface {v2, v3, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 329
    .line 330
    .line 331
    invoke-interface {v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 332
    .line 333
    .line 334
    :cond_1
    sget-object v0, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_HTML_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 335
    .line 336
    sget-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_HTML_8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 337
    .line 338
    const-string v2, "ISO-8859-1"

    .line 339
    .line 340
    invoke-virtual {v0, v2, v1}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 341
    .line 342
    .line 343
    const-string v3, "ISO_8859_1"

    .line 344
    .line 345
    invoke-virtual {v0, v3, v1}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 346
    .line 347
    .line 348
    const-string v4, "iso-8859-1"

    .line 349
    .line 350
    invoke-virtual {v0, v4, v1}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 351
    .line 352
    .line 353
    sget-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_PLAIN_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 354
    .line 355
    sget-object v5, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_PLAIN_8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 356
    .line 357
    invoke-virtual {v1, v2, v5}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 358
    .line 359
    .line 360
    invoke-virtual {v1, v3, v5}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 361
    .line 362
    .line 363
    invoke-virtual {v1, v4, v5}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 364
    .line 365
    .line 366
    sget-object v5, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_XML_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 367
    .line 368
    sget-object v6, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_XML_8859_1_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 369
    .line 370
    invoke-virtual {v5, v2, v6}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {v5, v3, v6}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v5, v4, v6}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 377
    .line 378
    .line 379
    sget-object v2, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_HTML_UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 380
    .line 381
    const-string v3, "UTF-8"

    .line 382
    .line 383
    invoke-virtual {v0, v3, v2}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 384
    .line 385
    .line 386
    const-string v4, "UTF8"

    .line 387
    .line 388
    invoke-virtual {v0, v4, v2}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 389
    .line 390
    .line 391
    const-string v6, "utf8"

    .line 392
    .line 393
    invoke-virtual {v0, v6, v2}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 394
    .line 395
    .line 396
    const-string v7, "utf-8"

    .line 397
    .line 398
    invoke-virtual {v0, v7, v2}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 399
    .line 400
    .line 401
    sget-object v0, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_PLAIN_UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 402
    .line 403
    invoke-virtual {v1, v3, v0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v1, v4, v0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 407
    .line 408
    .line 409
    invoke-virtual {v1, v6, v0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 410
    .line 411
    .line 412
    invoke-virtual {v1, v7, v0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 413
    .line 414
    .line 415
    sget-object v0, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_XML_UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 416
    .line 417
    invoke-virtual {v5, v3, v0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 418
    .line 419
    .line 420
    invoke-virtual {v5, v4, v0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 421
    .line 422
    .line 423
    invoke-virtual {v5, v6, v0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 424
    .line 425
    .line 426
    invoke-virtual {v5, v7, v0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 427
    .line 428
    .line 429
    sget-object v0, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_JSON_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 430
    .line 431
    sget-object v1, Lorg/eclipse/jetty/http/MimeTypes;->TEXT_JSON_UTF_8_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 432
    .line 433
    invoke-virtual {v0, v3, v1}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 434
    .line 435
    .line 436
    invoke-virtual {v0, v4, v1}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 437
    .line 438
    .line 439
    invoke-virtual {v0, v6, v1}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {v0, v7, v1}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V

    .line 443
    .line 444
    .line 445
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getCharsetFromContentType(Lorg/eclipse/jetty/io/Buffer;)Ljava/lang/String;
    .locals 13

    .line 1
    instance-of v0, p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 2
    .line 3
    const-string v1, "UTF-8"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move-object v0, p0

    .line 8
    check-cast v0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 9
    .line 10
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->getOrdinal()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    packed-switch v0, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :pswitch_0
    return-object v1

    .line 19
    :pswitch_1
    const-string p0, "ISO-8859-1"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    :goto_0
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, 0x0

    .line 31
    move v4, v3

    .line 32
    move v5, v4

    .line 33
    move v6, v5

    .line 34
    :goto_1
    const/16 v7, 0xa

    .line 35
    .line 36
    if-ge v0, v2, :cond_b

    .line 37
    .line 38
    invoke-interface {p0, v0}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 39
    .line 40
    .line 41
    move-result v8

    .line 42
    const/16 v9, 0x22

    .line 43
    .line 44
    if-eqz v5, :cond_1

    .line 45
    .line 46
    if-eq v4, v7, :cond_1

    .line 47
    .line 48
    if-ne v9, v8, :cond_a

    .line 49
    .line 50
    move v5, v3

    .line 51
    goto/16 :goto_4

    .line 52
    .line 53
    :cond_1
    const/16 v10, 0x3b

    .line 54
    .line 55
    const/16 v11, 0x20

    .line 56
    .line 57
    const/4 v12, 0x1

    .line 58
    packed-switch v4, :pswitch_data_1

    .line 59
    .line 60
    .line 61
    goto/16 :goto_4

    .line 62
    .line 63
    :pswitch_2
    if-nez v5, :cond_2

    .line 64
    .line 65
    if-eq v10, v8, :cond_3

    .line 66
    .line 67
    if-eq v11, v8, :cond_3

    .line 68
    .line 69
    :cond_2
    if-eqz v5, :cond_a

    .line 70
    .line 71
    if-ne v9, v8, :cond_a

    .line 72
    .line 73
    :cond_3
    sget-object v2, Lorg/eclipse/jetty/http/MimeTypes;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    .line 74
    .line 75
    sub-int/2addr v0, v6

    .line 76
    invoke-interface {p0, v6, v0}, Lorg/eclipse/jetty/io/Buffer;->peek(II)Lorg/eclipse/jetty/io/Buffer;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v2, p0}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-interface {p0, v1}, Lorg/eclipse/jetty/io/Buffer;->toString(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :pswitch_3
    if-ne v11, v8, :cond_4

    .line 90
    .line 91
    goto :goto_4

    .line 92
    :cond_4
    if-ne v9, v8, :cond_5

    .line 93
    .line 94
    add-int/lit8 v6, v0, 0x1

    .line 95
    .line 96
    move v4, v7

    .line 97
    :goto_2
    move v5, v12

    .line 98
    goto :goto_4

    .line 99
    :cond_5
    move v6, v0

    .line 100
    move v4, v7

    .line 101
    goto :goto_4

    .line 102
    :pswitch_4
    const/16 v7, 0x3d

    .line 103
    .line 104
    if-ne v7, v8, :cond_6

    .line 105
    .line 106
    const/16 v4, 0x9

    .line 107
    .line 108
    goto :goto_4

    .line 109
    :cond_6
    if-eq v11, v8, :cond_a

    .line 110
    .line 111
    :cond_7
    :goto_3
    move v4, v3

    .line 112
    goto :goto_4

    .line 113
    :pswitch_5
    const/16 v4, 0x74

    .line 114
    .line 115
    if-ne v4, v8, :cond_7

    .line 116
    .line 117
    const/16 v4, 0x8

    .line 118
    .line 119
    goto :goto_4

    .line 120
    :pswitch_6
    const/16 v4, 0x65

    .line 121
    .line 122
    if-ne v4, v8, :cond_7

    .line 123
    .line 124
    const/4 v4, 0x7

    .line 125
    goto :goto_4

    .line 126
    :pswitch_7
    const/16 v4, 0x73

    .line 127
    .line 128
    if-ne v4, v8, :cond_7

    .line 129
    .line 130
    const/4 v4, 0x6

    .line 131
    goto :goto_4

    .line 132
    :pswitch_8
    const/16 v4, 0x72

    .line 133
    .line 134
    if-ne v4, v8, :cond_7

    .line 135
    .line 136
    const/4 v4, 0x5

    .line 137
    goto :goto_4

    .line 138
    :pswitch_9
    const/16 v4, 0x61

    .line 139
    .line 140
    if-ne v4, v8, :cond_7

    .line 141
    .line 142
    const/4 v4, 0x4

    .line 143
    goto :goto_4

    .line 144
    :pswitch_a
    const/16 v4, 0x68

    .line 145
    .line 146
    if-ne v4, v8, :cond_7

    .line 147
    .line 148
    const/4 v4, 0x3

    .line 149
    goto :goto_4

    .line 150
    :pswitch_b
    const/16 v7, 0x63

    .line 151
    .line 152
    if-ne v7, v8, :cond_8

    .line 153
    .line 154
    const/4 v4, 0x2

    .line 155
    goto :goto_4

    .line 156
    :cond_8
    if-eq v11, v8, :cond_a

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :pswitch_c
    if-ne v9, v8, :cond_9

    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_9
    if-ne v10, v8, :cond_a

    .line 163
    .line 164
    move v4, v12

    .line 165
    :cond_a
    :goto_4
    add-int/lit8 v0, v0, 0x1

    .line 166
    .line 167
    goto/16 :goto_1

    .line 168
    .line 169
    :cond_b
    if-ne v4, v7, :cond_c

    .line 170
    .line 171
    sget-object v2, Lorg/eclipse/jetty/http/MimeTypes;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    .line 172
    .line 173
    sub-int/2addr v0, v6

    .line 174
    invoke-interface {p0, v6, v0}, Lorg/eclipse/jetty/io/Buffer;->peek(II)Lorg/eclipse/jetty/io/Buffer;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-virtual {v2, p0}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-interface {p0, v1}, Lorg/eclipse/jetty/io/Buffer;->toString(Ljava/lang/String;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    return-object p0

    .line 187
    :cond_c
    sget-object v0, Lorg/eclipse/jetty/http/MimeTypes;->__encodings:Ljava/util/Map;

    .line 188
    .line 189
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    check-cast p0, Ljava/lang/String;

    .line 194
    .line 195
    return-object p0

    .line 196
    nop

    .line 197
    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private static declared-synchronized normalizeMimeType(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;
    .locals 4

    .line 1
    const-class v0, Lorg/eclipse/jetty/http/MimeTypes;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lorg/eclipse/jetty/http/MimeTypes;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    .line 5
    .line 6
    invoke-virtual {v1, p0}, Lorg/eclipse/jetty/io/BufferCache;->get(Ljava/lang/String;)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    sget v2, Lorg/eclipse/jetty/http/MimeTypes;->__index:I

    .line 13
    .line 14
    add-int/lit8 v3, v2, 0x1

    .line 15
    .line 16
    sput v3, Lorg/eclipse/jetty/http/MimeTypes;->__index:I

    .line 17
    .line 18
    invoke-virtual {v1, p0, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    monitor-exit v0

    .line 26
    return-object v2

    .line 27
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p0
.end method


# virtual methods
.method public addMimeMapping(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/MimeTypes;->_mimeMap:Ljava/util/Map;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lorg/eclipse/jetty/http/MimeTypes;->_mimeMap:Ljava/util/Map;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/http/MimeTypes;->_mimeMap:Ljava/util/Map;

    .line 13
    .line 14
    invoke-static {p1}, Lorg/eclipse/jetty/util/StringUtil;->asciiToLowerCase(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p2}, Lorg/eclipse/jetty/http/MimeTypes;->normalizeMimeType(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public getMimeByExtension(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    const/4 v1, -0x1

    .line 5
    :cond_0
    :goto_0
    if-nez v0, :cond_3

    .line 6
    .line 7
    const-string v2, "."

    .line 8
    .line 9
    add-int/lit8 v1, v1, 0x1

    .line 10
    .line 11
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ltz v1, :cond_3

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-lt v1, v2, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    add-int/lit8 v2, v1, 0x1

    .line 25
    .line 26
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {v2}, Lorg/eclipse/jetty/util/StringUtil;->asciiToLowerCase(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget-object v3, p0, Lorg/eclipse/jetty/http/MimeTypes;->_mimeMap:Ljava/util/Map;

    .line 35
    .line 36
    if-eqz v3, :cond_2

    .line 37
    .line 38
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lorg/eclipse/jetty/io/Buffer;

    .line 43
    .line 44
    :cond_2
    if-nez v0, :cond_0

    .line 45
    .line 46
    sget-object v0, Lorg/eclipse/jetty/http/MimeTypes;->__dftMimeMap:Ljava/util/Map;

    .line 47
    .line 48
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lorg/eclipse/jetty/io/Buffer;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    :goto_1
    if-nez v0, :cond_5

    .line 56
    .line 57
    iget-object p0, p0, Lorg/eclipse/jetty/http/MimeTypes;->_mimeMap:Ljava/util/Map;

    .line 58
    .line 59
    const-string p1, "*"

    .line 60
    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    move-object v0, p0

    .line 68
    check-cast v0, Lorg/eclipse/jetty/io/Buffer;

    .line 69
    .line 70
    :cond_4
    if-nez v0, :cond_5

    .line 71
    .line 72
    sget-object p0, Lorg/eclipse/jetty/http/MimeTypes;->__dftMimeMap:Ljava/util/Map;

    .line 73
    .line 74
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Lorg/eclipse/jetty/io/Buffer;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_5
    return-object v0
.end method

.method public declared-synchronized getMimeMap()Ljava/util/Map;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/MimeTypes;->_mimeMap:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-object v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public setMimeMap(Ljava/util/Map;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/http/MimeTypes;->_mimeMap:Ljava/util/Map;

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ljava/util/Map$Entry;

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1}, Lorg/eclipse/jetty/http/MimeTypes;->normalizeMimeType(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iput-object v0, p0, Lorg/eclipse/jetty/http/MimeTypes;->_mimeMap:Ljava/util/Map;

    .line 53
    .line 54
    return-void
.end method
