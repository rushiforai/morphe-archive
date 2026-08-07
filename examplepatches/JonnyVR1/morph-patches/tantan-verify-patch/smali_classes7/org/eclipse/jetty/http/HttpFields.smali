.class public Lorg/eclipse/jetty/http/HttpFields;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/http/HttpFields$Field;,
        Lorg/eclipse/jetty/http/HttpFields$DateParser;,
        Lorg/eclipse/jetty/http/HttpFields$DateGenerator;
    }
.end annotation


# static fields
.field private static final DAYS:[Ljava/lang/String;

.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field private static final MONTHS:[Ljava/lang/String;

.field public static final __01Jan1970:Ljava/lang/String;

.field public static final __01Jan1970_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final __01Jan1970_COOKIE:Ljava/lang/String;

.field public static final __COOKIE_DELIM:Ljava/lang/String; = "\"\\\n\r\t\u000c\u0008%+ ;="

.field public static final __GMT:Ljava/util/TimeZone;

.field private static __cache:Ljava/util/concurrent/ConcurrentMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jetty/io/Buffer;",
            ">;"
        }
    .end annotation
.end field

.field private static __cacheSize:I = 0x0

.field public static final __dateCache:Lorg/eclipse/jetty/io/BufferDateCache;

.field private static final __dateGenerator:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Lorg/eclipse/jetty/http/HttpFields$DateGenerator;",
            ">;"
        }
    .end annotation
.end field

.field private static final __dateParser:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Lorg/eclipse/jetty/http/HttpFields$DateParser;",
            ">;"
        }
    .end annotation
.end field

.field private static final __dateReceiveFmt:[Ljava/lang/String;

.field private static final __one:Ljava/lang/Float;

.field private static final __qualities:Lorg/eclipse/jetty/util/StringMap;

.field public static final __separators:Ljava/lang/String; = ", \t"

.field private static final __zero:Ljava/lang/Float;


# instance fields
.field private final _fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/eclipse/jetty/http/HttpFields$Field;",
            ">;"
        }
    .end annotation
.end field

.field private final _names:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lorg/eclipse/jetty/io/Buffer;",
            "Lorg/eclipse/jetty/http/HttpFields$Field;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 1
    const-class v0, Lorg/eclipse/jetty/http/HttpFields;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/http/HttpFields;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    const-string v0, "GMT"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sput-object v1, Lorg/eclipse/jetty/http/HttpFields;->__GMT:Ljava/util/TimeZone;

    .line 16
    .line 17
    new-instance v2, Lorg/eclipse/jetty/io/BufferDateCache;

    .line 18
    .line 19
    const-string v3, "EEE, dd MMM yyyy HH:mm:ss \'GMT\'"

    .line 20
    .line 21
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 22
    .line 23
    invoke-direct {v2, v3, v4}, Lorg/eclipse/jetty/io/BufferDateCache;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 24
    .line 25
    .line 26
    sput-object v2, Lorg/eclipse/jetty/http/HttpFields;->__dateCache:Lorg/eclipse/jetty/io/BufferDateCache;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/util/TimeZone;->setID(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, v1}, Lorg/eclipse/jetty/util/DateCache;->setTimeZone(Ljava/util/TimeZone;)V

    .line 32
    .line 33
    .line 34
    const-string v11, "Fri"

    .line 35
    .line 36
    const-string v12, "Sat"

    .line 37
    .line 38
    const-string v5, "Sat"

    .line 39
    .line 40
    const-string v6, "Sun"

    .line 41
    .line 42
    const-string v7, "Mon"

    .line 43
    .line 44
    const-string v8, "Tue"

    .line 45
    .line 46
    const-string v9, "Wed"

    .line 47
    .line 48
    const-string v10, "Thu"

    .line 49
    .line 50
    filled-new-array/range {v5 .. v12}, [Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Lorg/eclipse/jetty/http/HttpFields;->DAYS:[Ljava/lang/String;

    .line 55
    .line 56
    const-string v12, "Dec"

    .line 57
    .line 58
    const-string v13, "Jan"

    .line 59
    .line 60
    const-string v1, "Jan"

    .line 61
    .line 62
    const-string v2, "Feb"

    .line 63
    .line 64
    const-string v3, "Mar"

    .line 65
    .line 66
    const-string v4, "Apr"

    .line 67
    .line 68
    const-string v5, "May"

    .line 69
    .line 70
    const-string v6, "Jun"

    .line 71
    .line 72
    const-string v7, "Jul"

    .line 73
    .line 74
    const-string v8, "Aug"

    .line 75
    .line 76
    const-string v9, "Sep"

    .line 77
    .line 78
    const-string v10, "Oct"

    .line 79
    .line 80
    const-string v11, "Nov"

    .line 81
    .line 82
    filled-new-array/range {v1 .. v13}, [Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sput-object v0, Lorg/eclipse/jetty/http/HttpFields;->MONTHS:[Ljava/lang/String;

    .line 87
    .line 88
    new-instance v0, Lorg/eclipse/jetty/http/HttpFields$1;

    .line 89
    .line 90
    invoke-direct {v0}, Lorg/eclipse/jetty/http/HttpFields$1;-><init>()V

    .line 91
    .line 92
    .line 93
    sput-object v0, Lorg/eclipse/jetty/http/HttpFields;->__dateGenerator:Ljava/lang/ThreadLocal;

    .line 94
    .line 95
    const-string v21, "EEE dd-MMM-yy HH:mm:ss zzz"

    .line 96
    .line 97
    const-string v22, "EEE dd-MMM-yy HH:mm:ss"

    .line 98
    .line 99
    const-string v1, "EEE, dd MMM yyyy HH:mm:ss zzz"

    .line 100
    .line 101
    const-string v2, "EEE, dd-MMM-yy HH:mm:ss"

    .line 102
    .line 103
    const-string v3, "EEE MMM dd HH:mm:ss yyyy"

    .line 104
    .line 105
    const-string v4, "EEE, dd MMM yyyy HH:mm:ss"

    .line 106
    .line 107
    const-string v5, "EEE dd MMM yyyy HH:mm:ss zzz"

    .line 108
    .line 109
    const-string v6, "EEE dd MMM yyyy HH:mm:ss"

    .line 110
    .line 111
    const-string v7, "EEE MMM dd yyyy HH:mm:ss zzz"

    .line 112
    .line 113
    const-string v8, "EEE MMM dd yyyy HH:mm:ss"

    .line 114
    .line 115
    const-string v9, "EEE MMM-dd-yyyy HH:mm:ss zzz"

    .line 116
    .line 117
    const-string v10, "EEE MMM-dd-yyyy HH:mm:ss"

    .line 118
    .line 119
    const-string v11, "dd MMM yyyy HH:mm:ss zzz"

    .line 120
    .line 121
    const-string v12, "dd MMM yyyy HH:mm:ss"

    .line 122
    .line 123
    const-string v13, "dd-MMM-yy HH:mm:ss zzz"

    .line 124
    .line 125
    const-string v14, "dd-MMM-yy HH:mm:ss"

    .line 126
    .line 127
    const-string v15, "MMM dd HH:mm:ss yyyy zzz"

    .line 128
    .line 129
    const-string v16, "MMM dd HH:mm:ss yyyy"

    .line 130
    .line 131
    const-string v17, "EEE MMM dd HH:mm:ss yyyy zzz"

    .line 132
    .line 133
    const-string v18, "EEE, MMM dd HH:mm:ss yyyy zzz"

    .line 134
    .line 135
    const-string v19, "EEE, MMM dd HH:mm:ss yyyy"

    .line 136
    .line 137
    const-string v20, "EEE, dd-MMM-yy HH:mm:ss zzz"

    .line 138
    .line 139
    filled-new-array/range {v1 .. v22}, [Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    sput-object v0, Lorg/eclipse/jetty/http/HttpFields;->__dateReceiveFmt:[Ljava/lang/String;

    .line 144
    .line 145
    new-instance v0, Lorg/eclipse/jetty/http/HttpFields$2;

    .line 146
    .line 147
    invoke-direct {v0}, Lorg/eclipse/jetty/http/HttpFields$2;-><init>()V

    .line 148
    .line 149
    .line 150
    sput-object v0, Lorg/eclipse/jetty/http/HttpFields;->__dateParser:Ljava/lang/ThreadLocal;

    .line 151
    .line 152
    const-wide/16 v0, 0x0

    .line 153
    .line 154
    invoke-static {v0, v1}, Lorg/eclipse/jetty/http/HttpFields;->formatDate(J)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    sput-object v2, Lorg/eclipse/jetty/http/HttpFields;->__01Jan1970:Ljava/lang/String;

    .line 159
    .line 160
    new-instance v3, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 161
    .line 162
    invoke-direct {v3, v2}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    sput-object v3, Lorg/eclipse/jetty/http/HttpFields;->__01Jan1970_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 166
    .line 167
    invoke-static {v0, v1}, Lorg/eclipse/jetty/http/HttpFields;->formatCookieDate(J)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    sput-object v0, Lorg/eclipse/jetty/http/HttpFields;->__01Jan1970_COOKIE:Ljava/lang/String;

    .line 176
    .line 177
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 178
    .line 179
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 180
    .line 181
    .line 182
    sput-object v0, Lorg/eclipse/jetty/http/HttpFields;->__cache:Ljava/util/concurrent/ConcurrentMap;

    .line 183
    .line 184
    const-string v0, "org.eclipse.jetty.http.HttpFields.CACHE"

    .line 185
    .line 186
    const/16 v1, 0x7d0

    .line 187
    .line 188
    invoke-static {v0, v1}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    sput v0, Lorg/eclipse/jetty/http/HttpFields;->__cacheSize:I

    .line 197
    .line 198
    new-instance v0, Ljava/lang/Float;

    .line 199
    .line 200
    const-string v1, "1.0"

    .line 201
    .line 202
    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    sput-object v0, Lorg/eclipse/jetty/http/HttpFields;->__one:Ljava/lang/Float;

    .line 206
    .line 207
    new-instance v2, Ljava/lang/Float;

    .line 208
    .line 209
    const-string v3, "0.0"

    .line 210
    .line 211
    invoke-direct {v2, v3}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    sput-object v2, Lorg/eclipse/jetty/http/HttpFields;->__zero:Ljava/lang/Float;

    .line 215
    .line 216
    new-instance v4, Lorg/eclipse/jetty/util/StringMap;

    .line 217
    .line 218
    invoke-direct {v4}, Lorg/eclipse/jetty/util/StringMap;-><init>()V

    .line 219
    .line 220
    .line 221
    sput-object v4, Lorg/eclipse/jetty/http/HttpFields;->__qualities:Lorg/eclipse/jetty/util/StringMap;

    .line 222
    .line 223
    const/4 v5, 0x0

    .line 224
    invoke-virtual {v4, v5, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    const-string v1, "1"

    .line 231
    .line 232
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    new-instance v0, Ljava/lang/Float;

    .line 236
    .line 237
    const-string v1, "0.9"

    .line 238
    .line 239
    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    new-instance v0, Ljava/lang/Float;

    .line 246
    .line 247
    const-string v1, "0.8"

    .line 248
    .line 249
    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    new-instance v0, Ljava/lang/Float;

    .line 256
    .line 257
    const-string v1, "0.7"

    .line 258
    .line 259
    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    new-instance v0, Ljava/lang/Float;

    .line 266
    .line 267
    const-string v1, "0.66"

    .line 268
    .line 269
    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    new-instance v0, Ljava/lang/Float;

    .line 276
    .line 277
    const-string v1, "0.6"

    .line 278
    .line 279
    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    new-instance v0, Ljava/lang/Float;

    .line 286
    .line 287
    const-string v1, "0.5"

    .line 288
    .line 289
    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    new-instance v0, Ljava/lang/Float;

    .line 296
    .line 297
    const-string v1, "0.4"

    .line 298
    .line 299
    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    new-instance v0, Ljava/lang/Float;

    .line 306
    .line 307
    const-string v1, "0.33"

    .line 308
    .line 309
    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    new-instance v0, Ljava/lang/Float;

    .line 316
    .line 317
    const-string v1, "0.3"

    .line 318
    .line 319
    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    new-instance v0, Ljava/lang/Float;

    .line 326
    .line 327
    const-string v1, "0.2"

    .line 328
    .line 329
    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    new-instance v0, Ljava/lang/Float;

    .line 336
    .line 337
    const-string v1, "0.1"

    .line 338
    .line 339
    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v4, v1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    const-string v0, "0"

    .line 346
    .line 347
    invoke-virtual {v4, v0, v2}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v4, v3, v2}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    .line 352
    .line 353
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    const/16 v1, 0x14

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    .line 12
    .line 13
    new-instance v0, Ljava/util/HashMap;

    .line 14
    .line 15
    const/16 v1, 0x20

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpFields;->_names:Ljava/util/HashMap;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic access$000()[Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpFields;->DAYS:[Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$100()[Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpFields;->MONTHS:[Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$300()[Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpFields;->__dateReceiveFmt:[Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method private convertValue(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;
    .locals 2

    .line 1
    sget-object p0, Lorg/eclipse/jetty/http/HttpFields;->__cache:Ljava/util/concurrent/ConcurrentMap;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/eclipse/jetty/io/Buffer;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    :try_start_0
    new-instance p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 13
    .line 14
    const-string v0, "ISO-8859-1"

    .line 15
    .line 16
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget v0, Lorg/eclipse/jetty/http/HttpFields;->__cacheSize:I

    .line 20
    .line 21
    if-lez v0, :cond_2

    .line 22
    .line 23
    sget-object v0, Lorg/eclipse/jetty/http/HttpFields;->__cache:Ljava/util/concurrent/ConcurrentMap;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sget v1, Lorg/eclipse/jetty/http/HttpFields;->__cacheSize:I

    .line 30
    .line 31
    if-le v0, v1, :cond_1

    .line 32
    .line 33
    sget-object v0, Lorg/eclipse/jetty/http/HttpFields;->__cache:Ljava/util/concurrent/ConcurrentMap;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 36
    .line 37
    .line 38
    :cond_1
    sget-object v0, Lorg/eclipse/jetty/http/HttpFields;->__cache:Ljava/util/concurrent/ConcurrentMap;

    .line 39
    .line 40
    invoke-interface {v0, p1, p0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lorg/eclipse/jetty/io/Buffer;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    return-object p1

    .line 49
    :cond_2
    return-object p0

    .line 50
    :catch_0
    move-exception p0

    .line 51
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    return-object p0
.end method

.method public static formatCookieDate(J)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->formatCookieDate(Ljava/lang/StringBuilder;J)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static formatCookieDate(Ljava/lang/StringBuilder;J)V
    .locals 1

    .line 16
    sget-object v0, Lorg/eclipse/jetty/http/HttpFields;->__dateGenerator:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;

    invoke-virtual {v0, p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->formatCookieDate(Ljava/lang/StringBuilder;J)V

    return-void
.end method

.method public static formatDate(J)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpFields;->__dateGenerator:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;

    .line 8
    .line 9
    invoke-virtual {v0, p0, p1}, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->formatDate(J)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private getField(Ljava/lang/String;)Lorg/eclipse/jetty/http/HttpFields$Field;
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields;->_names:Ljava/util/HashMap;

    .line 2
    .line 3
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 14
    .line 15
    return-object p0
.end method

.method private getField(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/http/HttpFields$Field;
    .locals 1

    .line 17
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields;->_names:Ljava/util/HashMap;

    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/eclipse/jetty/http/HttpFields$Field;

    return-object p0
.end method

.method public static getQuality(Ljava/lang/String;)Ljava/lang/Float;
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lorg/eclipse/jetty/http/HttpFields;->__zero:Ljava/lang/Float;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string v0, ";"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    add-int/lit8 v1, v0, 0x1

    .line 13
    .line 14
    if-ltz v0, :cond_4

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-ne v1, v2, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/16 v2, 0x71

    .line 28
    .line 29
    const/4 v3, 0x3

    .line 30
    if-ne v1, v2, :cond_2

    .line 31
    .line 32
    add-int/2addr v0, v3

    .line 33
    sget-object v1, Lorg/eclipse/jetty/http/HttpFields;->__qualities:Lorg/eclipse/jetty/util/StringMap;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    sub-int/2addr v2, v0

    .line 40
    invoke-virtual {v1, p0, v0, v2}, Lorg/eclipse/jetty/util/StringMap;->getEntry(Ljava/lang/String;II)Ljava/util/Map$Entry;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Ljava/lang/Float;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_2
    new-instance v0, Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-direct {v0, v3}, Ljava/util/HashMap;-><init>(I)V

    .line 56
    .line 57
    .line 58
    invoke-static {p0, v0}, Lorg/eclipse/jetty/http/HttpFields;->valueParameters(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    const-string p0, "q"

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Ljava/lang/String;

    .line 68
    .line 69
    sget-object v0, Lorg/eclipse/jetty/http/HttpFields;->__qualities:Lorg/eclipse/jetty/util/StringMap;

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/util/StringMap;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Ljava/lang/Float;

    .line 76
    .line 77
    if-nez v0, :cond_3

    .line 78
    .line 79
    :try_start_0
    new-instance v0, Ljava/lang/Float;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    .line 84
    return-object v0

    .line 85
    :catch_0
    sget-object p0, Lorg/eclipse/jetty/http/HttpFields;->__one:Ljava/lang/Float;

    .line 86
    .line 87
    return-object p0

    .line 88
    :cond_3
    return-object v0

    .line 89
    :cond_4
    :goto_0
    sget-object p0, Lorg/eclipse/jetty/http/HttpFields;->__one:Ljava/lang/Float;

    .line 90
    .line 91
    return-object p0
.end method

.method public static parseDate(Ljava/lang/String;)J
    .locals 2

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpFields;->__dateParser:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/eclipse/jetty/http/HttpFields$DateParser;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/http/HttpFields$DateParser;->parse(Ljava/lang/String;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public static qualityList(Ljava/util/Enumeration;)Ljava/util/List;
    .locals 8

    .line 1
    if-eqz p0, :cond_6

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    move-object v1, v0

    .line 13
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_2

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v2}, Lorg/eclipse/jetty/http/HttpFields;->getQuality(Ljava/lang/String;)Ljava/lang/Float;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    float-to-double v4, v4

    .line 36
    const-wide v6, 0x3f50624dd2f1a9fcL    # 0.001

    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    cmpl-double v4, v4, v6

    .line 42
    .line 43
    if-ltz v4, :cond_1

    .line 44
    .line 45
    invoke-static {v0, v2}, Lorg/eclipse/jetty/util/LazyList;->add(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v1, v3}, Lorg/eclipse/jetty/util/LazyList;->add(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    goto :goto_0

    .line 54
    :cond_2
    const/4 p0, 0x0

    .line 55
    invoke-static {v0, p0}, Lorg/eclipse/jetty/util/LazyList;->getList(Ljava/lang/Object;Z)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    const/4 v3, 0x2

    .line 64
    if-ge v2, v3, :cond_3

    .line 65
    .line 66
    return-object v0

    .line 67
    :cond_3
    invoke-static {v1, p0}, Lorg/eclipse/jetty/util/LazyList;->getList(Ljava/lang/Object;Z)Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    sget-object v1, Lorg/eclipse/jetty/http/HttpFields;->__zero:Ljava/lang/Float;

    .line 72
    .line 73
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    :goto_1
    add-int/lit8 v3, v2, -0x1

    .line 78
    .line 79
    if-lez v2, :cond_5

    .line 80
    .line 81
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Ljava/lang/Float;

    .line 86
    .line 87
    invoke-virtual {v1, v4}, Ljava/lang/Float;->compareTo(Ljava/lang/Float;)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-lez v1, :cond_4

    .line 92
    .line 93
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    invoke-interface {v0, v3, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    invoke-interface {v0, v2, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-interface {p0, v3, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    invoke-interface {p0, v2, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    sget-object v1, Lorg/eclipse/jetty/http/HttpFields;->__zero:Ljava/lang/Float;

    .line 118
    .line 119
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    goto :goto_1

    .line 124
    :cond_4
    move v2, v3

    .line 125
    move-object v1, v4

    .line 126
    goto :goto_1

    .line 127
    :cond_5
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 128
    .line 129
    .line 130
    return-object v0

    .line 131
    :cond_6
    :goto_2
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 132
    .line 133
    return-object p0
.end method

.method public static valueParameters(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    const/16 v1, 0x3b

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-gez v1, :cond_1

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_1
    const/4 v2, 0x0

    .line 15
    if-nez p1, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_2
    new-instance v3, Lorg/eclipse/jetty/util/QuotedStringTokenizer;

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    const-string v5, ";"

    .line 33
    .line 34
    const/4 v6, 0x1

    .line 35
    invoke-direct {v3, v4, v5, v2, v6}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 36
    .line 37
    .line 38
    :cond_3
    :goto_0
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-eqz v4, :cond_5

    .line 43
    .line 44
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    new-instance v5, Lorg/eclipse/jetty/util/QuotedStringTokenizer;

    .line 49
    .line 50
    const-string v6, "= "

    .line 51
    .line 52
    invoke-direct {v5, v4, v6}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eqz v4, :cond_3

    .line 60
    .line 61
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    if-eqz v6, :cond_4

    .line 70
    .line 71
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    goto :goto_1

    .line 76
    :cond_4
    move-object v5, v0

    .line 77
    :goto_1
    invoke-interface {p1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    if-nez p2, :cond_0

    return-void

    .line 91
    :cond_0
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p1

    .line 92
    invoke-direct {p0, p2}, Lorg/eclipse/jetty/http/HttpFields;->convertValue(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p2

    .line 93
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->add(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    return-void
.end method

.method public add(Lorg/eclipse/jetty/http/HttpFields;)V
    .locals 4

    if-nez p1, :cond_0

    goto :goto_1

    .line 94
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jetty/http/HttpFields;->getFieldNames()Ljava/util/Enumeration;

    move-result-object v0

    .line 95
    :cond_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 96
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 97
    invoke-virtual {p1, v1}, Lorg/eclipse/jetty/http/HttpFields;->getValues(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v2

    .line 98
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 99
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v1, v3}, Lorg/eclipse/jetty/http/HttpFields;->add(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public add(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_4

    .line 2
    .line 3
    instance-of v0, p1, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    :cond_0
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->asImmutableBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    instance-of v0, p2, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-static {v0}, Lorg/eclipse/jetty/http/HttpHeaderValues;->hasKnownValues(I)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    .line 34
    .line 35
    invoke-virtual {v0, p2}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    :cond_1
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->asImmutableBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields;->_names:Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    move-object v2, v1

    .line 53
    :goto_0
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-static {v0}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$700(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    move-object v3, v2

    .line 60
    move-object v2, v0

    .line 61
    move-object v0, v3

    .line 62
    goto :goto_0

    .line 63
    :cond_2
    new-instance v0, Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 64
    .line 65
    invoke-direct {v0, p1, p2, v1}, Lorg/eclipse/jetty/http/HttpFields$Field;-><init>(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/http/HttpFields$1;)V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    if-eqz v2, :cond_3

    .line 74
    .line 75
    invoke-static {v2, v0}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$702(Lorg/eclipse/jetty/http/HttpFields$Field;Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields;->_names:Ljava/util/HashMap;

    .line 80
    .line 81
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    const-string p0, "null value"

    .line 86
    .line 87
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public addDateField(Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-static {p2, p3}, Lorg/eclipse/jetty/http/HttpFields;->formatDate(J)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    sget-object p3, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 6
    .line 7
    invoke-virtual {p3, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance p3, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 12
    .line 13
    invoke-direct {p3, p2}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, p3}, Lorg/eclipse/jetty/http/HttpFields;->add(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public addLongField(Ljava/lang/String;J)V
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p2, p3}, Lorg/eclipse/jetty/io/BufferUtil;->toBuffer(J)Lorg/eclipse/jetty/io/Buffer;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->add(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public addLongField(Lorg/eclipse/jetty/io/Buffer;J)V
    .locals 0

    .line 15
    invoke-static {p2, p3}, Lorg/eclipse/jetty/io/BufferUtil;->toBuffer(J)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p2

    .line 16
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->add(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    return-void
.end method

.method public addSetCookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;ZZI)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    move-object/from16 v4, p4

    .line 10
    .line 11
    move-wide/from16 v5, p5

    .line 12
    .line 13
    move-object/from16 v7, p7

    .line 14
    .line 15
    if-eqz v1, :cond_11

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 18
    .line 19
    .line 20
    move-result v8

    .line 21
    if-eqz v8, :cond_11

    .line 22
    .line 23
    new-instance v8, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const/16 v9, 0x80

    .line 26
    .line 27
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 28
    .line 29
    .line 30
    const-string v9, "\"\\\n\r\t\u000c\u0008%+ ;="

    .line 31
    .line 32
    invoke-static {v8, v1, v9}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->quoteIfNeeded(Ljava/lang/Appendable;Ljava/lang/String;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    const/16 v1, 0x3d

    .line 36
    .line 37
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 47
    .line 48
    .line 49
    move-result v10

    .line 50
    if-lez v10, :cond_0

    .line 51
    .line 52
    invoke-static {v8, v2, v9}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->quoteIfNeeded(Ljava/lang/Appendable;Ljava/lang/String;Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    :cond_0
    if-eqz v7, :cond_1

    .line 56
    .line 57
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-lez v2, :cond_1

    .line 62
    .line 63
    const-string v2, ";Comment="

    .line 64
    .line 65
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-static {v8, v7, v9}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->quoteIfNeeded(Ljava/lang/Appendable;Ljava/lang/String;Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    :cond_1
    const/4 v2, 0x1

    .line 72
    const/4 v7, 0x0

    .line 73
    if-eqz v4, :cond_3

    .line 74
    .line 75
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 76
    .line 77
    .line 78
    move-result v10

    .line 79
    if-lez v10, :cond_3

    .line 80
    .line 81
    const-string v10, ";Path="

    .line 82
    .line 83
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v10

    .line 90
    const-string v11, "\""

    .line 91
    .line 92
    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v10

    .line 96
    if-eqz v10, :cond_2

    .line 97
    .line 98
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    invoke-static {v8, v4, v9}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->quoteIfNeeded(Ljava/lang/Appendable;Ljava/lang/String;Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    :goto_0
    move v10, v2

    .line 106
    goto :goto_1

    .line 107
    :cond_3
    move v10, v7

    .line 108
    :goto_1
    if-eqz v3, :cond_4

    .line 109
    .line 110
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 111
    .line 112
    .line 113
    move-result v11

    .line 114
    if-lez v11, :cond_4

    .line 115
    .line 116
    const-string v7, ";Domain="

    .line 117
    .line 118
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 122
    .line 123
    invoke-virtual {v3, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v7

    .line 127
    invoke-static {v8, v7, v9}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->quoteIfNeeded(Ljava/lang/Appendable;Ljava/lang/String;Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_4
    move v2, v7

    .line 132
    :goto_2
    const-wide/16 v11, 0x0

    .line 133
    .line 134
    cmp-long v7, v5, v11

    .line 135
    .line 136
    if-ltz v7, :cond_6

    .line 137
    .line 138
    const-string v9, ";Expires="

    .line 139
    .line 140
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    if-nez v7, :cond_5

    .line 144
    .line 145
    sget-object v7, Lorg/eclipse/jetty/http/HttpFields;->__01Jan1970_COOKIE:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 152
    .line 153
    .line 154
    move-result-wide v11

    .line 155
    const-wide/16 v13, 0x3e8

    .line 156
    .line 157
    mul-long/2addr v13, v5

    .line 158
    add-long/2addr v11, v13

    .line 159
    invoke-static {v8, v11, v12}, Lorg/eclipse/jetty/http/HttpFields;->formatCookieDate(Ljava/lang/StringBuilder;J)V

    .line 160
    .line 161
    .line 162
    :goto_3
    if-lez p10, :cond_6

    .line 163
    .line 164
    const-string v7, ";Max-Age="

    .line 165
    .line 166
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v8, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    :cond_6
    if-eqz p8, :cond_7

    .line 173
    .line 174
    const-string v5, ";Secure"

    .line 175
    .line 176
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    :cond_7
    if-eqz p9, :cond_8

    .line 180
    .line 181
    const-string v5, ";HttpOnly"

    .line 182
    .line 183
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    :cond_8
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v5

    .line 190
    const-string v6, "Set-Cookie"

    .line 191
    .line 192
    invoke-direct {v0, v6}, Lorg/eclipse/jetty/http/HttpFields;->getField(Ljava/lang/String;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 193
    .line 194
    .line 195
    move-result-object v6

    .line 196
    const/4 v7, 0x0

    .line 197
    move-object v8, v7

    .line 198
    :goto_4
    if-eqz v6, :cond_10

    .line 199
    .line 200
    invoke-static {v6}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$600(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/io/Buffer;

    .line 201
    .line 202
    .line 203
    move-result-object v9

    .line 204
    if-nez v9, :cond_9

    .line 205
    .line 206
    move-object v9, v7

    .line 207
    goto :goto_5

    .line 208
    :cond_9
    invoke-static {v6}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$600(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/io/Buffer;

    .line 209
    .line 210
    .line 211
    move-result-object v9

    .line 212
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v9

    .line 216
    :goto_5
    if-eqz v9, :cond_f

    .line 217
    .line 218
    invoke-virtual {v9, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 219
    .line 220
    .line 221
    move-result v11

    .line 222
    if-eqz v11, :cond_f

    .line 223
    .line 224
    if-nez v2, :cond_a

    .line 225
    .line 226
    const-string v11, "Domain"

    .line 227
    .line 228
    invoke-virtual {v9, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 229
    .line 230
    .line 231
    move-result v11

    .line 232
    if-eqz v11, :cond_b

    .line 233
    .line 234
    :cond_a
    if-eqz v2, :cond_f

    .line 235
    .line 236
    new-instance v11, Ljava/lang/StringBuilder;

    .line 237
    .line 238
    const-string v12, "Domain="

    .line 239
    .line 240
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v11

    .line 250
    invoke-virtual {v9, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 251
    .line 252
    .line 253
    move-result v11

    .line 254
    if-eqz v11, :cond_f

    .line 255
    .line 256
    :cond_b
    if-nez v10, :cond_c

    .line 257
    .line 258
    const-string v11, "Path"

    .line 259
    .line 260
    invoke-virtual {v9, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 261
    .line 262
    .line 263
    move-result v11

    .line 264
    if-eqz v11, :cond_d

    .line 265
    .line 266
    :cond_c
    if-eqz v10, :cond_f

    .line 267
    .line 268
    new-instance v11, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    const-string v12, "Path="

    .line 271
    .line 272
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v11

    .line 282
    invoke-virtual {v9, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 283
    .line 284
    .line 285
    move-result v9

    .line 286
    if-eqz v9, :cond_f

    .line 287
    .line 288
    :cond_d
    iget-object v1, v0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    .line 289
    .line 290
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    if-nez v8, :cond_e

    .line 294
    .line 295
    iget-object v1, v0, Lorg/eclipse/jetty/http/HttpFields;->_names:Ljava/util/HashMap;

    .line 296
    .line 297
    sget-object v2, Lorg/eclipse/jetty/http/HttpHeaders;->SET_COOKIE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 298
    .line 299
    invoke-static {v6}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$700(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 300
    .line 301
    .line 302
    move-result-object v3

    .line 303
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    goto :goto_6

    .line 307
    :cond_e
    invoke-static {v6}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$700(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    invoke-static {v8, v1}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$702(Lorg/eclipse/jetty/http/HttpFields$Field;Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 312
    .line 313
    .line 314
    goto :goto_6

    .line 315
    :cond_f
    invoke-static {v6}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$700(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 316
    .line 317
    .line 318
    move-result-object v8

    .line 319
    move-object v15, v8

    .line 320
    move-object v8, v6

    .line 321
    move-object v6, v15

    .line 322
    goto :goto_4

    .line 323
    :cond_10
    :goto_6
    sget-object v1, Lorg/eclipse/jetty/http/HttpHeaders;->SET_COOKIE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 324
    .line 325
    new-instance v2, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 326
    .line 327
    invoke-direct {v2, v5}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/http/HttpFields;->add(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 331
    .line 332
    .line 333
    sget-object v1, Lorg/eclipse/jetty/http/HttpHeaders;->EXPIRES_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 334
    .line 335
    sget-object v2, Lorg/eclipse/jetty/http/HttpFields;->__01Jan1970_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 336
    .line 337
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 338
    .line 339
    .line 340
    return-void

    .line 341
    :cond_11
    const-string v0, "Bad cookie name"

    .line 342
    .line 343
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    return-void
.end method

.method public addSetCookie(Lorg/eclipse/jetty/http/HttpCookie;)V
    .locals 11

    .line 347
    invoke-virtual {p1}, Lorg/eclipse/jetty/http/HttpCookie;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/jetty/http/HttpCookie;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jetty/http/HttpCookie;->getDomain()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lorg/eclipse/jetty/http/HttpCookie;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lorg/eclipse/jetty/http/HttpCookie;->getMaxAge()I

    move-result v0

    int-to-long v5, v0

    invoke-virtual {p1}, Lorg/eclipse/jetty/http/HttpCookie;->getComment()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Lorg/eclipse/jetty/http/HttpCookie;->isSecure()Z

    move-result v8

    invoke-virtual {p1}, Lorg/eclipse/jetty/http/HttpCookie;->isHttpOnly()Z

    move-result v9

    invoke-virtual {p1}, Lorg/eclipse/jetty/http/HttpCookie;->getVersion()I

    move-result v10

    move-object v0, p0

    invoke-virtual/range {v0 .. v10}, Lorg/eclipse/jetty/http/HttpFields;->addSetCookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;ZZI)V

    return-void
.end method

.method public clear()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields;->_names:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public containsKey(Ljava/lang/String;)Z
    .locals 1

    .line 14
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields;->_names:Ljava/util/HashMap;

    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public containsKey(Lorg/eclipse/jetty/io/Buffer;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields;->_names:Ljava/util/HashMap;

    .line 2
    .line 3
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public get(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->getField(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/http/HttpFields$Field;

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
    invoke-static {p0}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$600(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/io/Buffer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getDateField(Ljava/lang/String;)J
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->getField(Ljava/lang/String;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-wide/16 v0, -0x1

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    invoke-static {p0}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$600(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/io/Buffer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Lorg/eclipse/jetty/io/BufferUtil;->to8859_1_String(Lorg/eclipse/jetty/io/Buffer;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->valueParameters(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    return-wide v0

    .line 26
    :cond_1
    sget-object p1, Lorg/eclipse/jetty/http/HttpFields;->__dateParser:Ljava/lang/ThreadLocal;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lorg/eclipse/jetty/http/HttpFields$DateParser;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Lorg/eclipse/jetty/http/HttpFields$DateParser;->parse(Ljava/lang/String;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    cmp-long p1, v2, v0

    .line 39
    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    return-wide v2

    .line 43
    :cond_2
    const-string p1, "Cannot convert date: "

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const-wide/16 p0, 0x0

    .line 53
    .line 54
    return-wide p0
.end method

.method public getField(I)Lorg/eclipse/jetty/http/HttpFields$Field;
    .locals 0

    .line 16
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/eclipse/jetty/http/HttpFields$Field;

    return-object p0
.end method

.method public getFieldNames()Ljava/util/Enumeration;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields;->_names:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lorg/eclipse/jetty/http/HttpFields$3;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0}, Lorg/eclipse/jetty/http/HttpFields$3;-><init>(Lorg/eclipse/jetty/http/HttpFields;Ljava/util/Enumeration;)V

    .line 14
    .line 15
    .line 16
    return-object v1
.end method

.method public getFieldNamesCollection()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-static {v1}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$500(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/io/Buffer;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Lorg/eclipse/jetty/io/BufferUtil;->to8859_1_String(Lorg/eclipse/jetty/io/Buffer;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    return-object v0
.end method

.method public getLongField(Ljava/lang/String;)J
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->getField(Ljava/lang/String;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-wide/16 p0, -0x1

    .line 8
    .line 9
    return-wide p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpFields$Field;->getLongValue()J

    .line 11
    .line 12
    .line 13
    move-result-wide p0

    .line 14
    return-wide p0
.end method

.method public getLongField(Lorg/eclipse/jetty/io/Buffer;)J
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 15
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->getField(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/http/HttpFields$Field;

    move-result-object p0

    if-nez p0, :cond_0

    const-wide/16 p0, -0x1

    return-wide p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpFields$Field;->getLongValue()J

    move-result-wide p0

    return-wide p0
.end method

.method public getStringField(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->getField(Ljava/lang/String;)Lorg/eclipse/jetty/http/HttpFields$Field;

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
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpFields$Field;->getValue()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getStringField(Lorg/eclipse/jetty/io/Buffer;)Ljava/lang/String;
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->getField(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/http/HttpFields$Field;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpFields$Field;->getValue()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getValues(Ljava/lang/String;)Ljava/util/Enumeration;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Enumeration<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->getField(Ljava/lang/String;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance v0, Lorg/eclipse/jetty/http/HttpFields$4;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Lorg/eclipse/jetty/http/HttpFields$4;-><init>(Lorg/eclipse/jetty/http/HttpFields;Lorg/eclipse/jetty/http/HttpFields$Field;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public getValues(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Enumeration;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Enumeration<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 24
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->getValues(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 25
    :cond_0
    new-instance v0, Lorg/eclipse/jetty/http/HttpFields$6;

    invoke-direct {v0, p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields$6;-><init>(Lorg/eclipse/jetty/http/HttpFields;Ljava/util/Enumeration;Ljava/lang/String;)V

    return-object v0
.end method

.method public getValues(Lorg/eclipse/jetty/io/Buffer;)Ljava/util/Enumeration;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jetty/io/Buffer;",
            ")",
            "Ljava/util/Enumeration<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 20
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->getField(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/http/HttpFields$Field;

    move-result-object p1

    if-nez p1, :cond_0

    .line 21
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 22
    invoke-static {p0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object p0

    return-object p0

    .line 23
    :cond_0
    new-instance v0, Lorg/eclipse/jetty/http/HttpFields$5;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jetty/http/HttpFields$5;-><init>(Lorg/eclipse/jetty/http/HttpFields;Lorg/eclipse/jetty/http/HttpFields$Field;)V

    return-object v0
.end method

.method public getValuesCollection(Ljava/lang/String;)Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->getField(Ljava/lang/String;)Lorg/eclipse/jetty/http/HttpFields$Field;

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
    new-instance p1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    :goto_0
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpFields$Field;->getValue()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    invoke-static {p0}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$700(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-object p1
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    if-nez p2, :cond_0

    .line 96
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->remove(Ljava/lang/String;)V

    return-void

    .line 97
    :cond_0
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p1

    .line 98
    invoke-direct {p0, p2}, Lorg/eclipse/jetty/http/HttpFields;->convertValue(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p2

    .line 99
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    return-void
.end method

.method public put(Ljava/lang/String;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "*>;)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_4

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    sget-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->remove(Lorg/eclipse/jetty/io/Buffer;)V

    .line 38
    .line 39
    .line 40
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v1, 0x1

    .line 45
    if-le v0, v1, :cond_3

    .line 46
    .line 47
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    sget-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    return-void

    .line 81
    :cond_4
    :goto_2
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->remove(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public put(Lorg/eclipse/jetty/io/Buffer;Ljava/lang/String;)V
    .locals 1

    .line 85
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p1

    .line 86
    invoke-direct {p0, p2}, Lorg/eclipse/jetty/http/HttpFields;->convertValue(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p2

    .line 87
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    return-void
.end method

.method public put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 2

    .line 88
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->remove(Lorg/eclipse/jetty/io/Buffer;)V

    if-nez p2, :cond_0

    return-void

    .line 89
    :cond_0
    instance-of v0, p1, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    if-nez v0, :cond_1

    .line 90
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p1

    .line 91
    :cond_1
    instance-of v0, p2, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    if-nez v0, :cond_2

    .line 92
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    invoke-virtual {v0, p2}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p2

    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->asImmutableBuffer()Lorg/eclipse/jetty/io/Buffer;

    move-result-object p2

    .line 93
    :cond_2
    new-instance v0, Lorg/eclipse/jetty/http/HttpFields$Field;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lorg/eclipse/jetty/http/HttpFields$Field;-><init>(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/http/HttpFields$1;)V

    .line 94
    iget-object p2, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields;->_names:Ljava/util/HashMap;

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public putDateField(Ljava/lang/String;J)V
    .locals 1

    .line 14
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p1

    .line 15
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jetty/http/HttpFields;->putDateField(Lorg/eclipse/jetty/io/Buffer;J)V

    return-void
.end method

.method public putDateField(Lorg/eclipse/jetty/io/Buffer;J)V
    .locals 0

    .line 1
    invoke-static {p2, p3}, Lorg/eclipse/jetty/http/HttpFields;->formatDate(J)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance p3, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 6
    .line 7
    invoke-direct {p3, p2}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1, p3}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public putLongField(Ljava/lang/String;J)V
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p2, p3}, Lorg/eclipse/jetty/io/BufferUtil;->toBuffer(J)Lorg/eclipse/jetty/io/Buffer;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public putLongField(Lorg/eclipse/jetty/io/Buffer;J)V
    .locals 0

    .line 15
    invoke-static {p2, p3}, Lorg/eclipse/jetty/io/BufferUtil;->toBuffer(J)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p2

    .line 16
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    return-void
.end method

.method public putTo(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Lorg/eclipse/jetty/http/HttpFields$Field;->putTo(Lorg/eclipse/jetty/io/Buffer;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-static {p1}, Lorg/eclipse/jetty/io/BufferUtil;->putCRLF(Lorg/eclipse/jetty/io/Buffer;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .locals 1

    .line 32
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpFields;->remove(Lorg/eclipse/jetty/io/Buffer;)V

    return-void
.end method

.method public remove(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields;->_names:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 18
    .line 19
    :goto_0
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Lorg/eclipse/jetty/http/HttpFields$Field;->access$700(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method public size()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    :try_start_0
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    const-string v3, "\r\n"

    .line 14
    .line 15
    if-ge v1, v2, :cond_3

    .line 16
    .line 17
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpFields;->_fields:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 24
    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    invoke-virtual {v2}, Lorg/eclipse/jetty/http/HttpFields$Field;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    if-eqz v4, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 34
    .line 35
    .line 36
    :cond_0
    const-string v4, ": "

    .line 37
    .line 38
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Lorg/eclipse/jetty/http/HttpFields$Field;->getValue()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 48
    .line 49
    .line 50
    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 51
    .line 52
    .line 53
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 63
    return-object p0

    .line 64
    :catch_0
    move-exception p0

    .line 65
    sget-object v0, Lorg/eclipse/jetty/http/HttpFields;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 66
    .line 67
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method
