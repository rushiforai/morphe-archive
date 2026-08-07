.class public Lorg/eclipse/jetty/server/handler/DefaultHandler;
.super Lorg/eclipse/jetty/server/handler/AbstractHandler;
.source "SourceFile"


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field _favicon:[B

.field final _faviconModified:J

.field _serveIcon:Z

.field _showContexts:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/server/handler/DefaultHandler;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/server/handler/AbstractHandler;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    const-wide/16 v2, 0x3e8

    .line 9
    .line 10
    div-long/2addr v0, v2

    .line 11
    mul-long/2addr v0, v2

    .line 12
    iput-wide v0, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_faviconModified:J

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_serveIcon:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_showContexts:Z

    .line 18
    .line 19
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "org/eclipse/jetty/favicon.ico"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-static {v0}, Lorg/eclipse/jetty/util/resource/Resource;->newResource(Ljava/net/URL;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/resource/Resource;->getInputStream()Ljava/io/InputStream;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Lorg/eclipse/jetty/util/IO;->readBytes(Ljava/io/InputStream;)[B

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_favicon:[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    :cond_0
    return-void

    .line 50
    :catch_0
    move-exception p0

    .line 51
    sget-object v0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 52
    .line 53
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public getServeIcon()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_serveIcon:Z

    .line 2
    .line 3
    return p0
.end method

.method public getShowContexts()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_showContexts:Z

    .line 2
    .line 3
    return p0
.end method

.method public handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-interface {p4}, Ll/lse0;->isCommitted()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_f

    .line 6
    .line 7
    invoke-virtual {p2}, Lorg/eclipse/jetty/server/Request;->isHandled()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto/16 :goto_5

    .line 14
    .line 15
    :cond_0
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p2, p1}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p3}, Ljavax/servlet/http/HttpServletRequest;->getMethod()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_serveIcon:Z

    .line 24
    .line 25
    const-string v1, "GET"

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_favicon:[B

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-interface {p3}, Ljavax/servlet/http/HttpServletRequest;->getRequestURI()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v2, "/favicon.ico"

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    const-string p1, "If-Modified-Since"

    .line 52
    .line 53
    invoke-interface {p3, p1}, Ljavax/servlet/http/HttpServletRequest;->getDateHeader(Ljava/lang/String;)J

    .line 54
    .line 55
    .line 56
    move-result-wide p1

    .line 57
    iget-wide v0, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_faviconModified:J

    .line 58
    .line 59
    cmp-long p1, p1, v0

    .line 60
    .line 61
    if-nez p1, :cond_1

    .line 62
    .line 63
    const/16 p0, 0x130

    .line 64
    .line 65
    invoke-interface {p4, p0}, Ljavax/servlet/http/HttpServletResponse;->setStatus(I)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    const/16 p1, 0xc8

    .line 70
    .line 71
    invoke-interface {p4, p1}, Ljavax/servlet/http/HttpServletResponse;->setStatus(I)V

    .line 72
    .line 73
    .line 74
    const-string p1, "image/x-icon"

    .line 75
    .line 76
    invoke-interface {p4, p1}, Ll/lse0;->setContentType(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_favicon:[B

    .line 80
    .line 81
    array-length p1, p1

    .line 82
    invoke-interface {p4, p1}, Ll/lse0;->setContentLength(I)V

    .line 83
    .line 84
    .line 85
    const-string p1, "Last-Modified"

    .line 86
    .line 87
    iget-wide p2, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_faviconModified:J

    .line 88
    .line 89
    invoke-interface {p4, p1, p2, p3}, Ljavax/servlet/http/HttpServletResponse;->setDateHeader(Ljava/lang/String;J)V

    .line 90
    .line 91
    .line 92
    const-string p1, "Cache-Control"

    .line 93
    .line 94
    const-string p2, "max-age=360000,public"

    .line 95
    .line 96
    invoke-interface {p4, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-interface {p4}, Ll/lse0;->getOutputStream()Ll/ese0;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_favicon:[B

    .line 104
    .line 105
    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    const/16 v0, 0x194

    .line 114
    .line 115
    if-eqz p2, :cond_e

    .line 116
    .line 117
    invoke-interface {p3}, Ljavax/servlet/http/HttpServletRequest;->getRequestURI()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    const-string v1, "/"

    .line 122
    .line 123
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    if-nez p2, :cond_3

    .line 128
    .line 129
    goto/16 :goto_4

    .line 130
    .line 131
    :cond_3
    invoke-interface {p4, v0}, Ljavax/servlet/http/HttpServletResponse;->setStatus(I)V

    .line 132
    .line 133
    .line 134
    const-string p2, "text/html"

    .line 135
    .line 136
    invoke-interface {p4, p2}, Ll/lse0;->setContentType(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    new-instance p2, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;

    .line 140
    .line 141
    const/16 v0, 0x5dc

    .line 142
    .line 143
    invoke-direct {p2, v0}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;-><init>(I)V

    .line 144
    .line 145
    .line 146
    const-string v0, "<HTML>\n<HEAD>\n<TITLE>Error 404 - Not Found"

    .line 147
    .line 148
    invoke-virtual {p2, v0}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    const-string v0, "</TITLE>\n<BODY>\n<H2>Error 404 - Not Found.</H2>\n"

    .line 152
    .line 153
    invoke-virtual {p2, v0}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    const-string v0, "No context on this server matched or handled this request.<BR>"

    .line 157
    .line 158
    invoke-virtual {p2, v0}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_showContexts:Z

    .line 162
    .line 163
    const/4 v2, 0x0

    .line 164
    if-eqz v0, :cond_c

    .line 165
    .line 166
    const-string v0, "Contexts known to this server are: <ul>"

    .line 167
    .line 168
    invoke-virtual {p2, v0}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/AbstractHandler;->getServer()Lorg/eclipse/jetty/server/Server;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    if-nez p0, :cond_4

    .line 176
    .line 177
    const/4 p0, 0x0

    .line 178
    goto :goto_0

    .line 179
    :cond_4
    const-class v0, Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 180
    .line 181
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/server/handler/AbstractHandlerContainer;->getChildHandlersByClass(Ljava/lang/Class;)[Lorg/eclipse/jetty/server/Handler;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    :goto_0
    move v0, v2

    .line 186
    :goto_1
    if-eqz p0, :cond_c

    .line 187
    .line 188
    array-length v3, p0

    .line 189
    if-ge v0, v3, :cond_c

    .line 190
    .line 191
    aget-object v3, p0, v0

    .line 192
    .line 193
    check-cast v3, Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 194
    .line 195
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 196
    .line 197
    .line 198
    move-result v4

    .line 199
    const-string v5, "&nbsp;--->&nbsp;"

    .line 200
    .line 201
    const-string v6, "&nbsp;@&nbsp;"

    .line 202
    .line 203
    const-string v7, ":"

    .line 204
    .line 205
    if-eqz v4, :cond_8

    .line 206
    .line 207
    const-string v4, "<li><a href=\""

    .line 208
    .line 209
    invoke-virtual {p2, v4}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v4

    .line 216
    if-eqz v4, :cond_5

    .line 217
    .line 218
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v4

    .line 222
    array-length v4, v4

    .line 223
    if-lez v4, :cond_5

    .line 224
    .line 225
    new-instance v4, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    const-string v8, "http://"

    .line 228
    .line 229
    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v8

    .line 236
    aget-object v8, v8, v2

    .line 237
    .line 238
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-interface {p3}, Ll/gse0;->getLocalPort()I

    .line 245
    .line 246
    .line 247
    move-result v8

    .line 248
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v4

    .line 255
    invoke-virtual {p2, v4}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    :cond_5
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getContextPath()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    invoke-virtual {p2, v4}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getContextPath()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v4

    .line 269
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 270
    .line 271
    .line 272
    move-result v4

    .line 273
    if-le v4, p1, :cond_6

    .line 274
    .line 275
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getContextPath()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    invoke-virtual {v4, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 280
    .line 281
    .line 282
    move-result v4

    .line 283
    if-eqz v4, :cond_6

    .line 284
    .line 285
    invoke-virtual {p2, v1}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    :cond_6
    const-string v4, "\">"

    .line 289
    .line 290
    invoke-virtual {p2, v4}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getContextPath()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v4

    .line 297
    invoke-virtual {p2, v4}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v4

    .line 304
    if-eqz v4, :cond_7

    .line 305
    .line 306
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v4

    .line 310
    array-length v4, v4

    .line 311
    if-lez v4, :cond_7

    .line 312
    .line 313
    new-instance v4, Ljava/lang/StringBuilder;

    .line 314
    .line 315
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v6

    .line 322
    aget-object v6, v6, v2

    .line 323
    .line 324
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    invoke-interface {p3}, Ll/gse0;->getLocalPort()I

    .line 331
    .line 332
    .line 333
    move-result v6

    .line 334
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v4

    .line 341
    invoke-virtual {p2, v4}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    :cond_7
    invoke-virtual {p2, v5}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->toString()Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v3

    .line 351
    invoke-virtual {p2, v3}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 352
    .line 353
    .line 354
    const-string v3, "</a></li>\n"

    .line 355
    .line 356
    invoke-virtual {p2, v3}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    goto :goto_2

    .line 360
    :cond_8
    const-string v4, "<li>"

    .line 361
    .line 362
    invoke-virtual {p2, v4}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getContextPath()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v4

    .line 369
    invoke-virtual {p2, v4}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v4

    .line 376
    if-eqz v4, :cond_9

    .line 377
    .line 378
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v4

    .line 382
    array-length v4, v4

    .line 383
    if-lez v4, :cond_9

    .line 384
    .line 385
    new-instance v4, Ljava/lang/StringBuilder;

    .line 386
    .line 387
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v6

    .line 394
    aget-object v6, v6, v2

    .line 395
    .line 396
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    .line 401
    .line 402
    invoke-interface {p3}, Ll/gse0;->getLocalPort()I

    .line 403
    .line 404
    .line 405
    move-result v6

    .line 406
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v4

    .line 413
    invoke-virtual {p2, v4}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 414
    .line 415
    .line 416
    :cond_9
    invoke-virtual {p2, v5}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->toString()Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object v4

    .line 423
    invoke-virtual {p2, v4}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 424
    .line 425
    .line 426
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isFailed()Z

    .line 427
    .line 428
    .line 429
    move-result v4

    .line 430
    if-eqz v4, :cond_a

    .line 431
    .line 432
    const-string v4, " [failed]"

    .line 433
    .line 434
    invoke-virtual {p2, v4}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 435
    .line 436
    .line 437
    :cond_a
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isStopped()Z

    .line 438
    .line 439
    .line 440
    move-result v3

    .line 441
    if-eqz v3, :cond_b

    .line 442
    .line 443
    const-string v3, " [stopped]"

    .line 444
    .line 445
    invoke-virtual {p2, v3}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 446
    .line 447
    .line 448
    :cond_b
    const-string v3, "</li>\n"

    .line 449
    .line 450
    invoke-virtual {p2, v3}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 451
    .line 452
    .line 453
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 454
    .line 455
    goto/16 :goto_1

    .line 456
    .line 457
    :cond_c
    :goto_3
    const/16 p0, 0xa

    .line 458
    .line 459
    if-ge v2, p0, :cond_d

    .line 460
    .line 461
    const-string p0, "\n<!-- Padding for IE                  -->"

    .line 462
    .line 463
    invoke-virtual {p2, p0}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 464
    .line 465
    .line 466
    add-int/lit8 v2, v2, 0x1

    .line 467
    .line 468
    goto :goto_3

    .line 469
    :cond_d
    const-string p0, "\n</BODY>\n</HTML>\n"

    .line 470
    .line 471
    invoke-virtual {p2, p0}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;)V

    .line 472
    .line 473
    .line 474
    invoke-virtual {p2}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->flush()V

    .line 475
    .line 476
    .line 477
    invoke-virtual {p2}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->size()I

    .line 478
    .line 479
    .line 480
    move-result p0

    .line 481
    invoke-interface {p4, p0}, Ll/lse0;->setContentLength(I)V

    .line 482
    .line 483
    .line 484
    invoke-interface {p4}, Ll/lse0;->getOutputStream()Ll/ese0;

    .line 485
    .line 486
    .line 487
    move-result-object p0

    .line 488
    invoke-virtual {p2, p0}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->writeTo(Ljava/io/OutputStream;)V

    .line 489
    .line 490
    .line 491
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    .line 492
    .line 493
    .line 494
    return-void

    .line 495
    :cond_e
    :goto_4
    invoke-interface {p4, v0}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 496
    .line 497
    .line 498
    :cond_f
    :goto_5
    return-void
.end method

.method public setServeIcon(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_serveIcon:Z

    .line 2
    .line 3
    return-void
.end method

.method public setShowContexts(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/handler/DefaultHandler;->_showContexts:Z

    .line 2
    .line 3
    return-void
.end method
