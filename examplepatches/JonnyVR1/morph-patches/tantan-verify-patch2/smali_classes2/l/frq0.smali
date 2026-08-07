.class public Ll/frq0;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# static fields
.field private static l:Ll/frq0;

.field private static volatile m:Z

.field private static volatile n:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static o:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/wuq0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private a:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private b:Ll/iwq0;

.field private c:Ll/iwq0;

.field private volatile d:I

.field private volatile e:I

.field private f:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private g:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private h:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Ljava/lang/Thread$UncaughtExceptionHandler;",
            ">;"
        }
    .end annotation
.end field

.field private i:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Thread;",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private volatile j:I

.field private k:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/frq0;->n:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/frq0;->o:Ljava/util/ArrayList;

    .line 14
    .line 15
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/frq0;->d:I

    .line 6
    .line 7
    iput v0, p0, Ll/frq0;->e:I

    .line 8
    .line 9
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/frq0;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 15
    .line 16
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/frq0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 22
    .line 23
    new-instance v1, Ljava/util/Stack;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/util/Stack;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Ll/frq0;->h:Ljava/util/Stack;

    .line 29
    .line 30
    new-instance v1, Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Ll/frq0;->i:Ljava/util/HashMap;

    .line 36
    .line 37
    iput v0, p0, Ll/frq0;->j:I

    .line 38
    .line 39
    new-instance v0, Ll/frq0$b;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/frq0$b;-><init>(Ll/frq0;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/frq0;->k:Ljava/lang/Runnable;

    .line 45
    .line 46
    invoke-direct {p0}, Ll/frq0;->v()V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ll/b350;->a()Ll/ow5;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/ow5;->o()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    const-wide/16 v0, 0x1388

    .line 60
    .line 61
    invoke-virtual {p0, v0, v1}, Ll/frq0;->f(J)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method private static a(Ljava/lang/Throwable;Ljava/lang/Thread;)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    sget-object v2, Ll/frq0;->o:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v0, v2, :cond_0

    .line 10
    .line 11
    :try_start_0
    sget-object v2, Ll/frq0;->o:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Ll/wuq0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 18
    .line 19
    :try_start_1
    invoke-virtual {v2, p0, p1}, Ll/wuq0;->a(Ljava/lang/Throwable;Ljava/lang/Thread;)I

    .line 20
    .line 21
    .line 22
    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    or-int/2addr v1, v2

    .line 24
    goto :goto_1

    .line 25
    :catchall_0
    move-exception v2

    .line 26
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 27
    .line 28
    .line 29
    const-string v3, "NPTH_CATCH"

    .line 30
    .line 31
    invoke-static {v3, v2}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_1
    :cond_0
    return v1
.end method

.method public static synthetic b(Ll/frq0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/frq0;->j:I

    .line 2
    .line 3
    return p0
.end method

.method private c(Ljava/io/File;ZLjava/lang/Throwable;Ljava/lang/String;Ljava/lang/Thread;Z)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p4, p0, Ll/frq0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p4, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 15
    .line 16
    .line 17
    move-result-object p4

    .line 18
    invoke-virtual {p4}, Ljava/io/File;->mkdirs()Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Lcom/apm/lite/nativecrash/NativeImpl;->e(Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    :catchall_0
    const-string p4, "\n"

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    if-eqz p6, :cond_1

    .line 31
    .line 32
    invoke-static {p2}, Lcom/apm/lite/nativecrash/NativeImpl;->q(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-lez p0, :cond_6

    .line 37
    .line 38
    :try_start_1
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1}, Ll/lrq0;->l(Landroid/content/Context;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p0, p1}, Lcom/apm/lite/nativecrash/NativeImpl;->z(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0, p4}, Lcom/apm/lite/nativecrash/NativeImpl;->z(ILjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p0, p1}, Lcom/apm/lite/nativecrash/NativeImpl;->z(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-static {p0, p4}, Lcom/apm/lite/nativecrash/NativeImpl;->z(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {p0, p1}, Lcom/apm/lite/nativecrash/NativeImpl;->z(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    if-eqz p1, :cond_0

    .line 78
    .line 79
    const-string p1, ": "

    .line 80
    .line 81
    invoke-static {p0, p1}, Lcom/apm/lite/nativecrash/NativeImpl;->z(ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {p0, p1}, Lcom/apm/lite/nativecrash/NativeImpl;->z(ILjava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_0
    invoke-static {p0, p4}, Lcom/apm/lite/nativecrash/NativeImpl;->z(ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p5}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {p0, p1}, Lcom/apm/lite/nativecrash/NativeImpl;->z(ILjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-static {p0, p4}, Lcom/apm/lite/nativecrash/NativeImpl;->z(ILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 102
    .line 103
    .line 104
    :catchall_1
    :try_start_2
    const-string p1, "stack:"

    .line 105
    .line 106
    invoke-static {p0, p1}, Lcom/apm/lite/nativecrash/NativeImpl;->z(ILjava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-static {p0, p4}, Lcom/apm/lite/nativecrash/NativeImpl;->z(ILjava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 110
    .line 111
    .line 112
    :catchall_2
    invoke-static {p3, p0}, Ll/d6r0;->k(Ljava/lang/Throwable;I)V

    .line 113
    .line 114
    .line 115
    invoke-static {p0}, Lcom/apm/lite/nativecrash/NativeImpl;->b(I)V

    .line 116
    .line 117
    .line 118
    goto/16 :goto_5

    .line 119
    .line 120
    :cond_1
    :try_start_3
    new-instance p2, Ljava/io/FileOutputStream;

    .line 121
    .line 122
    const/4 p6, 0x1

    .line 123
    invoke-direct {p2, p1, p6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_8

    .line 124
    .line 125
    .line 126
    const p1, 0x8000

    .line 127
    .line 128
    .line 129
    :try_start_4
    invoke-static {p1}, Ll/u5r0;->c(I)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-nez p1, :cond_2

    .line 134
    .line 135
    new-instance p1, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 141
    .line 142
    .line 143
    move-result-object p6

    .line 144
    invoke-static {p6}, Ll/lrq0;->l(Landroid/content/Context;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p6

    .line 148
    invoke-virtual {p1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p2, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 163
    .line 164
    .line 165
    new-instance p1, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p6

    .line 174
    invoke-virtual {p1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-virtual {p2, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 189
    .line 190
    .line 191
    new-instance p1, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-virtual {p2, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 211
    .line 212
    .line 213
    new-instance p1, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p5}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object p6

    .line 222
    invoke-virtual {p1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    invoke-virtual {p2, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 237
    .line 238
    .line 239
    goto :goto_0

    .line 240
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    .line 241
    .line 242
    const-string p6, "test exception before write stack"

    .line 243
    .line 244
    invoke-direct {p1, p6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 248
    :catchall_3
    :goto_0
    :try_start_5
    const-string p1, "stack:\n"

    .line 249
    .line 250
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    invoke-virtual {p2, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 255
    .line 256
    .line 257
    :catchall_4
    const/16 p1, 0x2000

    .line 258
    .line 259
    :try_start_6
    invoke-static {p1}, Ll/u5r0;->c(I)Z

    .line 260
    .line 261
    .line 262
    move-result p1

    .line 263
    if-nez p1, :cond_4

    .line 264
    .line 265
    new-instance p1, Ljava/io/PrintStream;

    .line 266
    .line 267
    invoke-direct {p1, p2}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    .line 268
    .line 269
    .line 270
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 271
    .line 272
    .line 273
    move-result-object p6

    .line 274
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    if-ne p6, v1, :cond_3

    .line 279
    .line 280
    new-instance p6, Ll/frq0$a;

    .line 281
    .line 282
    invoke-direct {p6, p0}, Ll/frq0$a;-><init>(Ll/frq0;)V

    .line 283
    .line 284
    .line 285
    goto :goto_1

    .line 286
    :catchall_5
    move-exception p0

    .line 287
    goto :goto_3

    .line 288
    :cond_3
    new-instance p6, Ll/h0r0$a;

    .line 289
    .line 290
    invoke-direct {p6}, Ll/h0r0$a;-><init>()V

    .line 291
    .line 292
    .line 293
    :goto_1
    invoke-static {p3, p5, p1, p6}, Ll/d6r0;->c(Ljava/lang/Throwable;Ljava/lang/Thread;Ljava/io/PrintStream;Ll/h0r0$a;)Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    invoke-static {p2}, Ll/m4r0;->a(Ljava/io/Closeable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    .line 298
    .line 299
    .line 300
    :catchall_6
    :goto_2
    invoke-static {p2}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 301
    .line 302
    .line 303
    goto :goto_5

    .line 304
    :cond_4
    :try_start_7
    new-instance p0, Ljava/lang/RuntimeException;

    .line 305
    .line 306
    const-string p1, "test exception npth write stack"

    .line 307
    .line 308
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    throw p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 312
    :goto_3
    const/16 p1, 0x4000

    .line 313
    .line 314
    :try_start_8
    invoke-static {p1}, Ll/u5r0;->c(I)Z

    .line 315
    .line 316
    .line 317
    move-result p1

    .line 318
    if-nez p1, :cond_5

    .line 319
    .line 320
    new-instance p1, Ljava/io/PrintStream;

    .line 321
    .line 322
    invoke-direct {p1, p2}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {p3, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 326
    .line 327
    .line 328
    goto :goto_2

    .line 329
    :catchall_7
    move-exception p1

    .line 330
    goto :goto_4

    .line 331
    :cond_5
    new-instance p1, Ljava/lang/RuntimeException;

    .line 332
    .line 333
    const-string p3, "test exception system write stack"

    .line 334
    .line 335
    invoke-direct {p1, p3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_7

    .line 339
    :goto_4
    :try_start_9
    const-string p3, "err:\n"

    .line 340
    .line 341
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    .line 342
    .line 343
    .line 344
    move-result-object p3

    .line 345
    invoke-virtual {p2, p3}, Ljava/io/FileOutputStream;->write([B)V

    .line 346
    .line 347
    .line 348
    new-instance p3, Ljava/lang/StringBuilder;

    .line 349
    .line 350
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 351
    .line 352
    .line 353
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p0

    .line 363
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 364
    .line 365
    .line 366
    move-result-object p0

    .line 367
    invoke-virtual {p2, p0}, Ljava/io/FileOutputStream;->write([B)V

    .line 368
    .line 369
    .line 370
    new-instance p0, Ljava/lang/StringBuilder;

    .line 371
    .line 372
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 373
    .line 374
    .line 375
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 386
    .line 387
    .line 388
    move-result-object p0

    .line 389
    invoke-virtual {p2, p0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    .line 390
    .line 391
    .line 392
    goto :goto_2

    .line 393
    :catchall_8
    :cond_6
    :goto_5
    return-object v0
.end method

.method private d(Ljava/lang/Thread;Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    const-string v9, "[uncaughtException] mLaunchCrashDisposer "

    .line 8
    .line 9
    const-string v10, "[uncaughtException] mLaunchCrashDisposer "

    .line 10
    .line 11
    const-string v0, "[uncaughtException] isLaunchCrash="

    .line 12
    .line 13
    iget v4, v1, Ll/frq0;->d:I

    .line 14
    .line 15
    const/4 v5, 0x3

    .line 16
    const/4 v11, 0x0

    .line 17
    if-lt v4, v5, :cond_0

    .line 18
    .line 19
    const/high16 v4, 0x10000

    .line 20
    .line 21
    invoke-static {v4}, Ll/u5r0;->c(I)Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-nez v4, :cond_0

    .line 26
    .line 27
    return-object v11

    .line 28
    :cond_0
    iget-object v4, v1, Ll/frq0;->i:Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    if-ne v4, v3, :cond_1

    .line 35
    .line 36
    const-string v0, "Jump this uncaught exception."

    .line 37
    .line 38
    invoke-static {v0}, Ll/q5r0;->a(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    invoke-direct/range {p0 .. p2}, Ll/frq0;->w(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    return-object v11

    .line 45
    :cond_1
    iget-object v4, v1, Ll/frq0;->i:Ljava/util/HashMap;

    .line 46
    .line 47
    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    iget v4, v1, Ll/frq0;->d:I

    .line 51
    .line 52
    const/4 v12, 0x1

    .line 53
    add-int/2addr v4, v12

    .line 54
    iput v4, v1, Ll/frq0;->d:I

    .line 55
    .line 56
    iget v4, v1, Ll/frq0;->e:I

    .line 57
    .line 58
    add-int/2addr v4, v12

    .line 59
    iput v4, v1, Ll/frq0;->e:I

    .line 60
    .line 61
    sget-boolean v4, Ll/frq0;->m:Z

    .line 62
    .line 63
    if-eqz v4, :cond_2

    .line 64
    .line 65
    sget-object v4, Ll/frq0;->n:Ljava/lang/ThreadLocal;

    .line 66
    .line 67
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 68
    .line 69
    invoke-virtual {v4, v5}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    sput-boolean v12, Ll/frq0;->m:Z

    .line 73
    .line 74
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 75
    .line 76
    .line 77
    move-result-wide v13

    .line 78
    invoke-static {v13, v14}, Ll/frq0;->o(J)Z

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    const/4 v15, 0x0

    .line 83
    :try_start_0
    invoke-static {v3}, Ll/d6r0;->w(Ljava/lang/Throwable;)Z

    .line 84
    .line 85
    .line 86
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    if-eqz v4, :cond_3

    .line 88
    .line 89
    :try_start_1
    invoke-static {v3}, Ll/d6r0;->x(Ljava/lang/Throwable;)Z

    .line 90
    .line 91
    .line 92
    move-result v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 93
    if-eqz v5, :cond_3

    .line 94
    .line 95
    move v5, v12

    .line 96
    goto :goto_0

    .line 97
    :cond_3
    move v5, v15

    .line 98
    :goto_0
    move v7, v5

    .line 99
    goto :goto_1

    .line 100
    :catchall_0
    move v4, v15

    .line 101
    :catchall_1
    move v7, v15

    .line 102
    :goto_1
    if-eqz v8, :cond_4

    .line 103
    .line 104
    :try_start_2
    sget-object v5, Lcom/apm/lite/CrashType;->LAUNCH:Lcom/apm/lite/CrashType;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :catchall_2
    move-exception v0

    .line 108
    move/from16 v18, v7

    .line 109
    .line 110
    move v4, v8

    .line 111
    move-object/from16 v17, v11

    .line 112
    .line 113
    move-wide v5, v13

    .line 114
    move/from16 v16, v15

    .line 115
    .line 116
    goto/16 :goto_16

    .line 117
    .line 118
    :cond_4
    :try_start_3
    sget-object v5, Lcom/apm/lite/CrashType;->JAVA:Lcom/apm/lite/CrashType;

    .line 119
    .line 120
    :goto_2
    invoke-static {v13, v14, v5, v4, v15}, Ll/n0r0;->a(JLcom/apm/lite/CrashType;ZZ)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    new-instance v6, Ljava/io/File;

    .line 125
    .line 126
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 127
    .line 128
    .line 129
    move-result-object v16
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_11

    .line 130
    move-object/from16 v17, v11

    .line 131
    .line 132
    :try_start_4
    invoke-static/range {v16 .. v16}, Ll/j5r0;->b(Landroid/content/Context;)Ljava/io/File;

    .line 133
    .line 134
    .line 135
    move-result-object v11

    .line 136
    invoke-direct {v6, v11, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_10

    .line 137
    .line 138
    .line 139
    :try_start_5
    new-instance v2, Ljava/io/File;

    .line 140
    .line 141
    const-string v11, "logEventStack"

    .line 142
    .line 143
    invoke-direct {v2, v6, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_f

    .line 144
    .line 145
    .line 146
    move v11, v4

    .line 147
    move-object v4, v3

    .line 148
    move v3, v11

    .line 149
    move-object v11, v6

    .line 150
    move-object/from16 v6, p1

    .line 151
    .line 152
    :try_start_6
    invoke-direct/range {v1 .. v7}, Ll/frq0;->c(Ljava/io/File;ZLjava/lang/Throwable;Ljava/lang/String;Ljava/lang/Thread;Z)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v15
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_e

    .line 156
    move v1, v3

    .line 157
    move-object v3, v6

    .line 158
    move/from16 v18, v7

    .line 159
    .line 160
    :try_start_7
    invoke-static {v4, v3}, Ll/frq0;->a(Ljava/lang/Throwable;Ljava/lang/Thread;)I

    .line 161
    .line 162
    .line 163
    move-result v6

    .line 164
    and-int/2addr v6, v12

    .line 165
    if-nez v6, :cond_6

    .line 166
    .line 167
    if-eqz v15, :cond_5

    .line 168
    .line 169
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    invoke-virtual {v6, v15}, Ll/ow5;->k(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v6
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 177
    if-eqz v6, :cond_5

    .line 178
    .line 179
    goto :goto_6

    .line 180
    :catchall_3
    move-exception v0

    .line 181
    move-object/from16 v1, p0

    .line 182
    .line 183
    move-object v2, v3

    .line 184
    move-object v3, v4

    .line 185
    :goto_3
    move v4, v8

    .line 186
    :goto_4
    move-wide v5, v13

    .line 187
    const/4 v15, 0x0

    .line 188
    :goto_5
    const/16 v16, 0x0

    .line 189
    .line 190
    goto/16 :goto_16

    .line 191
    .line 192
    :cond_5
    move v6, v8

    .line 193
    const/4 v8, 0x0

    .line 194
    goto :goto_7

    .line 195
    :cond_6
    :goto_6
    move v6, v8

    .line 196
    move v8, v12

    .line 197
    :goto_7
    :try_start_8
    invoke-static {v4, v3, v11}, Ll/vuq0;->f(Ljava/lang/Throwable;Ljava/lang/Thread;Ljava/io/File;)Lorg/json/JSONArray;

    .line 198
    .line 199
    .line 200
    move-result-object v7
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_d

    .line 201
    if-nez v7, :cond_7

    .line 202
    .line 203
    goto :goto_8

    .line 204
    :cond_7
    if-eqz v8, :cond_9

    .line 205
    .line 206
    :goto_8
    if-eqz v6, :cond_8

    .line 207
    .line 208
    :try_start_9
    sget-object v2, Lcom/apm/lite/CrashType;->LAUNCH:Lcom/apm/lite/CrashType;

    .line 209
    .line 210
    goto :goto_9

    .line 211
    :catchall_4
    move-exception v0

    .line 212
    move-object/from16 v1, p0

    .line 213
    .line 214
    move-object v2, v3

    .line 215
    move-object v3, v4

    .line 216
    move v4, v6

    .line 217
    move v15, v8

    .line 218
    move-wide v5, v13

    .line 219
    goto :goto_5

    .line 220
    :cond_8
    sget-object v2, Lcom/apm/lite/CrashType;->JAVA:Lcom/apm/lite/CrashType;

    .line 221
    .line 222
    :goto_9
    invoke-static {v13, v14, v2, v1, v12}, Ll/n0r0;->a(JLcom/apm/lite/CrashType;ZZ)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v5

    .line 226
    new-instance v1, Ljava/io/File;

    .line 227
    .line 228
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    invoke-static {v2}, Ll/j5r0;->b(Landroid/content/Context;)Ljava/io/File;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    invoke-direct {v1, v2, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v11, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 240
    .line 241
    .line 242
    new-instance v2, Ljava/io/File;

    .line 243
    .line 244
    const-string v7, "logEventStack"

    .line 245
    .line 246
    invoke-direct {v2, v1, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 247
    .line 248
    .line 249
    :cond_9
    move-object v7, v2

    .line 250
    move-object v11, v5

    .line 251
    :try_start_a
    invoke-static {}, Ll/p1r0;->b()V

    .line 252
    .line 253
    .line 254
    invoke-static {}, Ll/guq0;->a()Ll/guq0;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    invoke-virtual {v1}, Ll/guq0;->m()V

    .line 259
    .line 260
    .line 261
    invoke-direct/range {p0 .. p0}, Ll/frq0;->z()Z

    .line 262
    .line 263
    .line 264
    move-result v16
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_d

    .line 265
    if-eqz v18, :cond_a

    .line 266
    .line 267
    if-eqz v16, :cond_a

    .line 268
    .line 269
    move-object/from16 v1, p0

    .line 270
    .line 271
    move-object v2, v3

    .line 272
    move-object v3, v4

    .line 273
    move v4, v6

    .line 274
    move-wide v5, v13

    .line 275
    :try_start_b
    invoke-direct/range {v1 .. v6}, Ll/frq0;->h(Ljava/lang/Thread;Ljava/lang/Throwable;ZJ)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 276
    .line 277
    .line 278
    move-object v13, v1

    .line 279
    move v14, v4

    .line 280
    goto :goto_b

    .line 281
    :catchall_5
    move-exception v0

    .line 282
    move-object v13, v1

    .line 283
    move v14, v4

    .line 284
    move-object/from16 v2, p1

    .line 285
    .line 286
    :goto_a
    move v15, v8

    .line 287
    goto/16 :goto_16

    .line 288
    .line 289
    :cond_a
    move-wide/from16 v19, v13

    .line 290
    .line 291
    move v14, v6

    .line 292
    move-wide/from16 v5, v19

    .line 293
    .line 294
    move-object/from16 v13, p0

    .line 295
    .line 296
    move-object v3, v4

    .line 297
    :goto_b
    :try_start_c
    invoke-static {v12}, Ll/u5r0;->c(I)Z

    .line 298
    .line 299
    .line 300
    move-result v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_c

    .line 301
    if-eqz v1, :cond_b

    .line 302
    .line 303
    :try_start_d
    iget-object v1, v13, Ll/frq0;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 304
    .line 305
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 306
    .line 307
    .line 308
    goto :goto_e

    .line 309
    :catchall_6
    move-exception v0

    .line 310
    :goto_c
    move-object/from16 v2, p1

    .line 311
    .line 312
    :goto_d
    move v15, v8

    .line 313
    move-object v1, v13

    .line 314
    move v4, v14

    .line 315
    goto/16 :goto_16

    .line 316
    .line 317
    :cond_b
    :goto_e
    if-eqz v14, :cond_c

    .line 318
    .line 319
    sget-object v1, Lcom/apm/lite/CrashType;->LAUNCH:Lcom/apm/lite/CrashType;
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    .line 320
    .line 321
    goto :goto_f

    .line 322
    :cond_c
    :try_start_e
    sget-object v1, Lcom/apm/lite/CrashType;->JAVA:Lcom/apm/lite/CrashType;

    .line 323
    .line 324
    :goto_f
    new-instance v2, Ljava/lang/StringBuilder;

    .line 325
    .line 326
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    invoke-static {v0}, Ll/q5r0;->a(Ljava/lang/Object;)V

    .line 337
    .line 338
    .line 339
    invoke-static {}, Ll/bsq0;->a()Ll/bsq0;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    invoke-virtual {v0, v1, v5, v6, v11}, Ll/bsq0;->b(Lcom/apm/lite/CrashType;JLjava/lang/String;)V

    .line 344
    .line 345
    .line 346
    invoke-direct/range {p0 .. p2}, Ll/frq0;->q(Ljava/lang/Thread;Ljava/lang/Throwable;)Z

    .line 347
    .line 348
    .line 349
    move-result v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_c

    .line 350
    if-eqz v0, :cond_d

    .line 351
    .line 352
    :try_start_f
    iget-object v1, v13, Ll/frq0;->b:Ll/iwq0;

    .line 353
    .line 354
    if-eqz v1, :cond_d

    .line 355
    .line 356
    if-eqz v14, :cond_d

    .line 357
    .line 358
    invoke-interface {v1, v3}, Ll/iwq0;->a(Ljava/lang/Throwable;)Z

    .line 359
    .line 360
    .line 361
    move-result v1
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_8

    .line 362
    if-eqz v1, :cond_d

    .line 363
    .line 364
    :try_start_10
    iget-object v0, v13, Ll/frq0;->b:Ll/iwq0;
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 365
    .line 366
    move-object v4, v3

    .line 367
    move-wide v1, v5

    .line 368
    move-object v6, v7

    .line 369
    move-object v5, v11

    .line 370
    move-object v7, v15

    .line 371
    move-object/from16 v3, p1

    .line 372
    .line 373
    :try_start_11
    invoke-interface/range {v0 .. v8}, Ll/iwq0;->a(JLjava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Z)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_7

    .line 374
    .line 375
    .line 376
    move-wide v5, v1

    .line 377
    move-object v3, v4

    .line 378
    :try_start_12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 379
    .line 380
    invoke-direct {v0, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    invoke-virtual {v3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v1

    .line 387
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    .line 389
    .line 390
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v0

    .line 394
    invoke-static {v0}, Ll/q5r0;->a(Ljava/lang/Object;)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_6

    .line 395
    .line 396
    .line 397
    goto :goto_12

    .line 398
    :catchall_7
    move-exception v0

    .line 399
    move-wide v5, v1

    .line 400
    move-object v3, v4

    .line 401
    goto :goto_c

    .line 402
    :cond_d
    move-wide v1, v5

    .line 403
    move-object v6, v7

    .line 404
    move-object v5, v11

    .line 405
    move-object v7, v15

    .line 406
    goto :goto_10

    .line 407
    :catchall_8
    move-exception v0

    .line 408
    move-wide v1, v5

    .line 409
    move v15, v8

    .line 410
    move-object v1, v13

    .line 411
    move v4, v14

    .line 412
    move-object/from16 v2, p1

    .line 413
    .line 414
    goto/16 :goto_16

    .line 415
    .line 416
    :goto_10
    if-eqz v0, :cond_e

    .line 417
    .line 418
    :try_start_13
    iget-object v0, v13, Ll/frq0;->c:Ll/iwq0;

    .line 419
    .line 420
    if-eqz v0, :cond_e

    .line 421
    .line 422
    invoke-interface {v0, v3}, Ll/iwq0;->a(Ljava/lang/Throwable;)Z

    .line 423
    .line 424
    .line 425
    move-result v0

    .line 426
    if-eqz v0, :cond_e

    .line 427
    .line 428
    iget-object v0, v13, Ll/frq0;->c:Ll/iwq0;

    .line 429
    .line 430
    move-object v4, v3

    .line 431
    move-object/from16 v3, p1

    .line 432
    .line 433
    invoke-interface/range {v0 .. v8}, Ll/iwq0;->a(JLjava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Z)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_a

    .line 434
    .line 435
    .line 436
    move-wide v5, v1

    .line 437
    :try_start_14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 438
    .line 439
    invoke-direct {v0, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 440
    .line 441
    .line 442
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object v1

    .line 446
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 447
    .line 448
    .line 449
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    invoke-static {v0}, Ll/q5r0;->a(Ljava/lang/Object;)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_9

    .line 454
    .line 455
    .line 456
    goto :goto_12

    .line 457
    :catchall_9
    move-exception v0

    .line 458
    :goto_11
    move-object/from16 v2, p1

    .line 459
    .line 460
    move-object/from16 v3, p2

    .line 461
    .line 462
    goto/16 :goto_d

    .line 463
    .line 464
    :catchall_a
    move-exception v0

    .line 465
    move-wide v5, v1

    .line 466
    goto :goto_11

    .line 467
    :cond_e
    move-wide v5, v1

    .line 468
    :goto_12
    if-nez v8, :cond_10

    .line 469
    .line 470
    if-eqz v18, :cond_f

    .line 471
    .line 472
    if-nez v16, :cond_f

    .line 473
    .line 474
    move-object/from16 v2, p1

    .line 475
    .line 476
    move-object/from16 v3, p2

    .line 477
    .line 478
    move-object v1, v13

    .line 479
    move v4, v14

    .line 480
    :try_start_15
    invoke-direct/range {v1 .. v6}, Ll/frq0;->h(Ljava/lang/Thread;Ljava/lang/Throwable;ZJ)V

    .line 481
    .line 482
    .line 483
    goto :goto_13

    .line 484
    :cond_f
    move-object/from16 v2, p1

    .line 485
    .line 486
    move-object/from16 v3, p2

    .line 487
    .line 488
    move-object v1, v13

    .line 489
    :goto_13
    invoke-direct {v1}, Ll/frq0;->y()V

    .line 490
    .line 491
    .line 492
    :goto_14
    invoke-direct {v1}, Ll/frq0;->x()V

    .line 493
    .line 494
    .line 495
    invoke-direct/range {p0 .. p2}, Ll/frq0;->r(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_13

    .line 496
    .line 497
    .line 498
    goto/16 :goto_18

    .line 499
    .line 500
    :cond_10
    move-object/from16 v2, p1

    .line 501
    .line 502
    move-object/from16 v3, p2

    .line 503
    .line 504
    move-object v1, v13

    .line 505
    monitor-enter p0

    .line 506
    :try_start_16
    iget v0, v1, Ll/frq0;->e:I

    .line 507
    .line 508
    sub-int/2addr v0, v12

    .line 509
    iput v0, v1, Ll/frq0;->e:I

    .line 510
    .line 511
    iget v0, v1, Ll/frq0;->d:I

    .line 512
    .line 513
    sub-int/2addr v0, v12

    .line 514
    iput v0, v1, Ll/frq0;->d:I

    .line 515
    .line 516
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_b

    .line 517
    invoke-static {v3, v2}, Ll/frq0;->l(Ljava/lang/Throwable;Ljava/lang/Thread;)Ljava/lang/Throwable;

    .line 518
    .line 519
    .line 520
    move-result-object v0

    .line 521
    return-object v0

    .line 522
    :catchall_b
    move-exception v0

    .line 523
    :try_start_17
    monitor-exit p0
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_b

    .line 524
    throw v0

    .line 525
    :catchall_c
    move-exception v0

    .line 526
    move-object/from16 v2, p1

    .line 527
    .line 528
    move-object v1, v13

    .line 529
    move v4, v14

    .line 530
    goto/16 :goto_a

    .line 531
    .line 532
    :catchall_d
    move-exception v0

    .line 533
    move-object/from16 v1, p0

    .line 534
    .line 535
    move-object v2, v3

    .line 536
    move-object v3, v4

    .line 537
    move v4, v6

    .line 538
    move-wide v5, v13

    .line 539
    move v15, v8

    .line 540
    goto/16 :goto_5

    .line 541
    .line 542
    :catchall_e
    move-exception v0

    .line 543
    move-object v3, v4

    .line 544
    move-object v2, v6

    .line 545
    :goto_15
    move/from16 v18, v7

    .line 546
    .line 547
    goto/16 :goto_3

    .line 548
    .line 549
    :catchall_f
    move-exception v0

    .line 550
    move-object/from16 v2, p1

    .line 551
    .line 552
    goto :goto_15

    .line 553
    :catchall_10
    move-exception v0

    .line 554
    goto :goto_15

    .line 555
    :catchall_11
    move-exception v0

    .line 556
    move/from16 v18, v7

    .line 557
    .line 558
    move v4, v8

    .line 559
    move-object/from16 v17, v11

    .line 560
    .line 561
    goto/16 :goto_4

    .line 562
    .line 563
    :goto_16
    :try_start_18
    invoke-static {v0}, Ll/d6r0;->w(Ljava/lang/Throwable;)Z

    .line 564
    .line 565
    .line 566
    move-result v7

    .line 567
    if-nez v7, :cond_11

    .line 568
    .line 569
    invoke-static {v0}, Ll/q5r0;->f(Ljava/lang/Throwable;)V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_12

    .line 570
    .line 571
    .line 572
    goto :goto_17

    .line 573
    :catchall_12
    move-exception v0

    .line 574
    goto :goto_19

    .line 575
    :cond_11
    :goto_17
    if-nez v15, :cond_13

    .line 576
    .line 577
    if-eqz v18, :cond_12

    .line 578
    .line 579
    if-nez v16, :cond_12

    .line 580
    .line 581
    :try_start_19
    invoke-direct/range {v1 .. v6}, Ll/frq0;->h(Ljava/lang/Thread;Ljava/lang/Throwable;ZJ)V

    .line 582
    .line 583
    .line 584
    :cond_12
    invoke-direct {v1}, Ll/frq0;->y()V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_13

    .line 585
    .line 586
    .line 587
    goto :goto_14

    .line 588
    :catchall_13
    :goto_18
    return-object v17

    .line 589
    :cond_13
    monitor-enter p0

    .line 590
    :try_start_1a
    iget v0, v1, Ll/frq0;->e:I

    .line 591
    .line 592
    sub-int/2addr v0, v12

    .line 593
    iput v0, v1, Ll/frq0;->e:I

    .line 594
    .line 595
    iget v0, v1, Ll/frq0;->d:I

    .line 596
    .line 597
    sub-int/2addr v0, v12

    .line 598
    iput v0, v1, Ll/frq0;->d:I

    .line 599
    .line 600
    monitor-exit p0
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_14

    .line 601
    invoke-static {v3, v2}, Ll/frq0;->l(Ljava/lang/Throwable;Ljava/lang/Thread;)Ljava/lang/Throwable;

    .line 602
    .line 603
    .line 604
    move-result-object v0

    .line 605
    return-object v0

    .line 606
    :catchall_14
    move-exception v0

    .line 607
    :try_start_1b
    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_14

    .line 608
    throw v0

    .line 609
    :goto_19
    if-nez v15, :cond_15

    .line 610
    .line 611
    if-eqz v18, :cond_14

    .line 612
    .line 613
    if-nez v16, :cond_14

    .line 614
    .line 615
    :try_start_1c
    invoke-direct/range {v1 .. v6}, Ll/frq0;->h(Ljava/lang/Thread;Ljava/lang/Throwable;ZJ)V

    .line 616
    .line 617
    .line 618
    :cond_14
    invoke-direct {v1}, Ll/frq0;->y()V

    .line 619
    .line 620
    .line 621
    invoke-direct {v1}, Ll/frq0;->x()V

    .line 622
    .line 623
    .line 624
    invoke-direct/range {p0 .. p2}, Ll/frq0;->r(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_15

    .line 625
    .line 626
    .line 627
    :catchall_15
    throw v0

    .line 628
    :cond_15
    monitor-enter p0

    .line 629
    :try_start_1d
    iget v0, v1, Ll/frq0;->e:I

    .line 630
    .line 631
    sub-int/2addr v0, v12

    .line 632
    iput v0, v1, Ll/frq0;->e:I

    .line 633
    .line 634
    iget v0, v1, Ll/frq0;->d:I

    .line 635
    .line 636
    sub-int/2addr v0, v12

    .line 637
    iput v0, v1, Ll/frq0;->d:I

    .line 638
    .line 639
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_16

    .line 640
    invoke-static {v3, v2}, Ll/frq0;->l(Ljava/lang/Throwable;Ljava/lang/Thread;)Ljava/lang/Throwable;

    .line 641
    .line 642
    .line 643
    move-result-object v0

    .line 644
    return-object v0

    .line 645
    :catchall_16
    move-exception v0

    .line 646
    :try_start_1e
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_16

    .line 647
    throw v0
.end method

.method public static e()Ll/frq0;
    .locals 1

    .line 1
    sget-object v0, Ll/frq0;->l:Ll/frq0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/frq0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/frq0;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/frq0;->l:Ll/frq0;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/frq0;->l:Ll/frq0;

    .line 13
    .line 14
    return-object v0
.end method

.method private h(Ljava/lang/Thread;Ljava/lang/Throwable;ZJ)V
    .locals 6

    .line 1
    invoke-static {}, Ll/s4r0;->a()Ll/owq0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/owq0;->a()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    sget-object p3, Lcom/apm/lite/CrashType;->LAUNCH:Lcom/apm/lite/CrashType;

    .line 12
    .line 13
    :goto_0
    move-object v1, p3

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    sget-object p3, Lcom/apm/lite/CrashType;->JAVA:Lcom/apm/lite/CrashType;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    if-eqz p3, :cond_1

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    move-object v0, p3

    .line 33
    check-cast v0, Ll/f1m;

    .line 34
    .line 35
    move-object v3, p1

    .line 36
    move-object v2, p2

    .line 37
    move-wide v4, p4

    .line 38
    :try_start_0
    invoke-interface/range {v0 .. v5}, Ll/f1m;->a(Lcom/apm/lite/CrashType;Ljava/lang/Throwable;Ljava/lang/Thread;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    .line 41
    goto :goto_3

    .line 42
    :catchall_0
    move-exception v0

    .line 43
    move-object p1, v0

    .line 44
    invoke-static {p1}, Ll/q5r0;->g(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    :goto_3
    move-object p2, v2

    .line 48
    move-object p1, v3

    .line 49
    move-wide p4, v4

    .line 50
    goto :goto_2

    .line 51
    :cond_1
    return-void
.end method

.method public static synthetic k(Ll/frq0;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/frq0;->j:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Ll/frq0;->j:I

    .line 6
    .line 7
    return v0
.end method

.method private static l(Ljava/lang/Throwable;Ljava/lang/Thread;)Ljava/lang/Throwable;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    sget-object v1, Ll/frq0;->o:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    :try_start_0
    sget-object v1, Ll/frq0;->o:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/wuq0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    :try_start_1
    invoke-virtual {v1, p0, p1}, Ll/wuq0;->b(Ljava/lang/Throwable;Ljava/lang/Thread;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-ne p0, p1, :cond_1

    .line 33
    .line 34
    :try_start_2
    invoke-static {}, Landroid/os/Looper;->loop()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :catchall_1
    move-exception p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    :goto_1
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method

.method public static n()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/frq0;->m:Z

    .line 2
    .line 3
    return v0
.end method

.method public static o(J)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/g0r0;->a(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private q(Ljava/lang/Thread;Ljava/lang/Throwable;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/n0r0;->d()Ll/rrq0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/rrq0;->d()Ll/trl;

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0
.end method

.method private r(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/16 v0, 0x200

    .line 2
    .line 3
    invoke-static {v0}, Ll/u5r0;->c(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-direct {p0, p1, p2}, Ll/frq0;->w(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic s(Ll/frq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/frq0;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static t()Z
    .locals 1

    .line 1
    sget-object v0, Ll/frq0;->n:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    return v0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    return v0
.end method

.method public static synthetic u(Ll/frq0;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/frq0;->k:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method private v()V
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eq v0, p0, :cond_1

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "Put this uncaught exception handler to stack. "

    .line 18
    .line 19
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v1}, Ll/q5r0;->a(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/frq0;->h:Ljava/util/Stack;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    :cond_0
    iput-object v0, p0, Ll/frq0;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 32
    .line 33
    invoke-static {p0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method private w(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/frq0;->h:Ljava/util/Stack;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/frq0;->h:Ljava/util/Stack;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iput-object v0, p0, Ll/frq0;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/frq0;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    if-eq v0, p0, :cond_1

    .line 26
    .line 27
    const-string v0, "mDefaultHandler != null, call mDefaultHandler."

    .line 28
    .line 29
    invoke-static {v0}, Ll/q5r0;->a(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/frq0;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 33
    .line 34
    invoke-interface {p0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :catchall_0
    :cond_1
    const-string p0, "Uncaught exception handler null, kill process."

    .line 39
    .line 40
    invoke-static {p0}, Ll/q5r0;->a(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-static {p0}, Landroid/os/Process;->killProcess(I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private x()V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Ll/frq0;->e:I

    .line 3
    .line 4
    add-int/lit8 v0, v0, -0x1

    .line 5
    .line 6
    iput v0, p0, Ll/frq0;->e:I

    .line 7
    .line 8
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    :goto_0
    iget v2, p0, Ll/frq0;->e:I

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    sub-long/2addr v2, v0

    .line 22
    const-wide/16 v4, 0x2710

    .line 23
    .line 24
    cmp-long v2, v2, v4

    .line 25
    .line 26
    if-gez v2, :cond_0

    .line 27
    .line 28
    const-wide/16 v2, 0x32

    .line 29
    .line 30
    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw v0
.end method

.method private y()V
    .locals 6

    .line 1
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/j5r0;->b(Landroid/content/Context;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ll/j5r0;->a()Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0}, Ll/r3r0;->x(Ljava/io/File;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-static {v0}, Ll/r3r0;->x(Ljava/io/File;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    :catchall_0
    :goto_0
    invoke-static {}, Ll/h3r0;->c()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    sub-long/2addr v2, v0

    .line 41
    const-wide/16 v4, 0x2710

    .line 42
    .line 43
    cmp-long p0, v2, v4

    .line 44
    .line 45
    if-gez p0, :cond_1

    .line 46
    .line 47
    const-wide/16 v2, 0x1f4

    .line 48
    .line 49
    :try_start_0
    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    :goto_1
    return-void
.end method

.method private z()Z
    .locals 1

    .line 1
    const-string p0, "exception_modules"

    .line 2
    .line 3
    const-string v0, "oom_callback"

    .line 4
    .line 5
    filled-new-array {p0, v0}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/nrq0;->b([Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x1

    .line 14
    if-ne p0, v0, :cond_0

    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method


# virtual methods
.method public f(J)V
    .locals 2

    .line 1
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/frq0;->k:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/r5r0;->j(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object p0, p0, Ll/frq0;->k:Ljava/lang/Runnable;

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1, p2}, Ll/r5r0;->f(Ljava/lang/Runnable;J)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/frq0;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i(Ljava/lang/Thread;Ljava/lang/Throwable;ZLl/gsq0;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/s4r0;->a()Ll/owq0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/owq0;->b()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object p3, Lcom/apm/lite/CrashType;->LAUNCH:Lcom/apm/lite/CrashType;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/owq0;->c()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-object p3, Lcom/apm/lite/CrashType;->JAVA:Lcom/apm/lite/CrashType;

    .line 19
    .line 20
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/srl;

    .line 35
    .line 36
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 37
    .line 38
    .line 39
    move-result-wide v1

    .line 40
    :try_start_0
    invoke-static {p2}, Ll/d6r0;->b(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-interface {v0, p3, v3, p1}, Ll/srl;->a(Lcom/apm/lite/CrashType;Ljava/lang/String;Ljava/lang/Thread;)V

    .line 45
    .line 46
    .line 47
    new-instance v3, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v4, "callback_cost_"

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 73
    .line 74
    .line 75
    move-result-wide v4

    .line 76
    sub-long/2addr v4, v1

    .line 77
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {p4, v3, v4}, Ll/gsq0;->q(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :catchall_0
    move-exception v3

    .line 86
    invoke-static {v3}, Ll/q5r0;->g(Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const-string v3, "callback_err_"

    .line 98
    .line 99
    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 104
    .line 105
    .line 106
    move-result-wide v3

    .line 107
    sub-long/2addr v3, v1

    .line 108
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {p4, v0, v1}, Ll/gsq0;->q(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;

    .line 113
    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_1
    return-void
.end method

.method public j(Ll/iwq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/frq0;->b:Ll/iwq0;

    .line 2
    .line 3
    return-void
.end method

.method public m(Ll/iwq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/frq0;->c:Ll/iwq0;

    .line 2
    .line 3
    return-void
.end method

.method public p(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/frq0;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    :goto_0
    invoke-direct {p0, p1, p2}, Ll/frq0;->d(Ljava/lang/Thread;Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    return-void
.end method
