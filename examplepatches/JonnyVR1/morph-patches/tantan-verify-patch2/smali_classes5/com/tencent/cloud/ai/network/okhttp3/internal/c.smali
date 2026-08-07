.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[B

.field public static final b:Lcom/tencent/cloud/ai/network/okhttp3/o;

.field public static final c:Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

.field public static final d:Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

.field public static final e:Lcom/tencent/cloud/ai/network/okio/p;

.field public static final f:Ljava/nio/charset/Charset;

.field public static final g:Ljava/nio/charset/Charset;

.field public static final h:Ljava/util/TimeZone;

.field public static final i:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final j:Ljava/lang/reflect/Method;

.field public static final k:Ljava/util/regex/Pattern;


# direct methods
.method public static constructor <clinit>()V
    .locals 7

    .line 1
    const-class v0, Ljava/lang/Throwable;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v2, v1, [B

    .line 5
    .line 6
    sput-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a:[B

    .line 7
    .line 8
    new-array v2, v1, [Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v2}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, [Ljava/lang/String;

    .line 15
    .line 16
    move v3, v1

    .line 17
    :goto_0
    array-length v4, v2

    .line 18
    if-ge v3, v4, :cond_1

    .line 19
    .line 20
    aget-object v4, v2, v3

    .line 21
    .line 22
    if-eqz v4, :cond_0

    .line 23
    .line 24
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    aput-object v4, v2, v3

    .line 29
    .line 30
    add-int/lit8 v3, v3, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string v0, "Headers cannot be null"

    .line 34
    .line 35
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    :goto_1
    array-length v3, v2

    .line 40
    if-ge v1, v3, :cond_2

    .line 41
    .line 42
    aget-object v3, v2, v1

    .line 43
    .line 44
    add-int/lit8 v4, v1, 0x1

    .line 45
    .line 46
    aget-object v4, v2, v4

    .line 47
    .line 48
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v4, v3}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    add-int/lit8 v1, v1, 0x2

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/o;

    .line 58
    .line 59
    invoke-direct {v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/o;-><init>([Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sput-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->b:Lcom/tencent/cloud/ai/network/okhttp3/o;

    .line 63
    .line 64
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a:[B

    .line 65
    .line 66
    const/4 v2, 0x0

    .line 67
    invoke-static {v2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;->create(Lcom/tencent/cloud/ai/network/okhttp3/MediaType;[B)Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    sput-object v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 72
    .line 73
    invoke-static {v2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->create(Lcom/tencent/cloud/ai/network/okhttp3/MediaType;[B)Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    sput-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->d:Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 78
    .line 79
    const-string v1, "efbbbf"

    .line 80
    .line 81
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->decodeHex(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const-string v3, "feff"

    .line 86
    .line 87
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okio/ByteString;->decodeHex(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    const-string v4, "fffe"

    .line 92
    .line 93
    invoke-static {v4}, Lcom/tencent/cloud/ai/network/okio/ByteString;->decodeHex(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    const-string v5, "0000ffff"

    .line 98
    .line 99
    invoke-static {v5}, Lcom/tencent/cloud/ai/network/okio/ByteString;->decodeHex(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    const-string v6, "ffff0000"

    .line 104
    .line 105
    invoke-static {v6}, Lcom/tencent/cloud/ai/network/okio/ByteString;->decodeHex(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    filled-new-array {v1, v3, v4, v5, v6}, [Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    new-instance v3, Lcom/tencent/cloud/ai/network/okio/p;

    .line 114
    .line 115
    invoke-virtual {v1}, [Lcom/tencent/cloud/ai/network/okio/ByteString;->clone()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    check-cast v1, [Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 120
    .line 121
    invoke-direct {v3, v1}, Lcom/tencent/cloud/ai/network/okio/p;-><init>([Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 122
    .line 123
    .line 124
    sput-object v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->e:Lcom/tencent/cloud/ai/network/okio/p;

    .line 125
    .line 126
    const-string v1, "UTF-32BE"

    .line 127
    .line 128
    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    sput-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->f:Ljava/nio/charset/Charset;

    .line 133
    .line 134
    const-string v1, "UTF-32LE"

    .line 135
    .line 136
    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    sput-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->g:Ljava/nio/charset/Charset;

    .line 141
    .line 142
    const-string v1, "GMT"

    .line 143
    .line 144
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    sput-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->h:Ljava/util/TimeZone;

    .line 149
    .line 150
    new-instance v1, Ll/zvq0;

    .line 151
    .line 152
    invoke-direct {v1}, Ll/zvq0;-><init>()V

    .line 153
    .line 154
    .line 155
    sput-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->i:Ljava/util/Comparator;

    .line 156
    .line 157
    const-string v1, "addSuppressed"

    .line 158
    .line 159
    :try_start_0
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 164
    .line 165
    .line 166
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    :catch_0
    sput-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->j:Ljava/lang/reflect/Method;

    .line 168
    .line 169
    const-string v0, "([0-9a-fA-F]*:[0-9a-fA-F:.]*)|([\\d.]+)"

    .line 170
    .line 171
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->k:Ljava/util/regex/Pattern;

    .line 176
    .line 177
    return-void
.end method

.method public static a(C)I
    .locals 2

    .line 329
    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v1, 0x39

    if-gt p0, v1, :cond_0

    sub-int/2addr p0, v0

    return p0

    :cond_0
    const/16 v0, 0x61

    if-lt p0, v0, :cond_1

    const/16 v0, 0x66

    if-gt p0, v0, :cond_1

    add-int/lit8 p0, p0, -0x57

    return p0

    :cond_1
    const/16 v0, 0x41

    if-lt p0, v0, :cond_2

    const/16 v0, 0x46

    if-gt p0, v0, :cond_2

    add-int/lit8 p0, p0, -0x37

    return p0

    :cond_2
    const/4 p0, -0x1

    return p0
.end method

.method public static a(Ljava/lang/String;IIC)I
    .locals 1

    :goto_0
    if-ge p1, p2, :cond_1

    .line 273
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, p3, :cond_0

    return p1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    return p2
.end method

.method public static a(Ljava/lang/String;IILjava/lang/String;)I
    .locals 2

    :goto_0
    if-ge p1, p2, :cond_1

    .line 272
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return p1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    return p2
.end method

.method public static a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I
    .locals 6

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    const/4 v3, 0x0

    if-ltz v2, :cond_4

    if-eqz p3, :cond_3

    .line 305
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p1

    const-wide/32 v4, 0x7fffffff

    cmp-long p3, p1, v4

    if-gtz p3, :cond_2

    cmp-long p3, p1, v0

    if-nez p3, :cond_1

    if-gtz v2, :cond_0

    goto :goto_0

    .line 306
    :cond_0
    const-string p1, " too small."

    invoke-static {p0, p1}, Ll/ulk0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    return v3

    :cond_1
    :goto_0
    long-to-int p0, p1

    return p0

    .line 307
    :cond_2
    const-string p1, " too large."

    invoke-static {p0, p1}, Ll/ulk0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    return v3

    .line 308
    :cond_3
    const-string p0, "unit == null"

    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    return v3

    .line 309
    :cond_4
    const-string p1, " < 0"

    invoke-static {p0, p1}, Ll/ulk0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    return v3
.end method

.method public static a(Ljava/util/Comparator;[Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .line 270
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 271
    aget-object v2, p1, v1

    invoke-interface {p0, v2, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-nez v2, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okhttp3/p;Z)Ljava/lang/String;
    .locals 4

    .line 310
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 311
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    .line 312
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 313
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "["

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 314
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_0
    if-nez p1, :cond_2

    .line 315
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    .line 316
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 317
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;)I

    move-result v0

    if-eq p1, v0, :cond_1

    goto :goto_0

    :cond_1
    return-object v2

    .line 318
    :cond_2
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    .line 320
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    const-string v0, ":"

    .line 274
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v0, :cond_b

    const-string v0, "["

    .line 275
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "]"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 276
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v4, 0x1

    sub-int/2addr v0, v4

    invoke-static {p0, v4, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;II)Ljava/net/InetAddress;

    move-result-object v0

    goto :goto_0

    .line 277
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {p0, v3, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;II)Ljava/net/InetAddress;

    move-result-object v0

    :goto_0
    if-nez v0, :cond_1

    return-object v2

    .line 278
    :cond_1
    invoke-virtual {v0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v2

    .line 279
    array-length v4, v2

    const/4 v5, 0x4

    const/16 v6, 0x10

    if-ne v4, v6, :cond_9

    move p0, v3

    move v0, p0

    .line 280
    :goto_1
    array-length v4, v2

    if-ge p0, v4, :cond_4

    move v4, p0

    :goto_2
    if-ge v4, v6, :cond_2

    .line 281
    aget-byte v7, v2, v4

    if-nez v7, :cond_2

    add-int/lit8 v7, v4, 0x1

    aget-byte v7, v2, v7

    if-nez v7, :cond_2

    add-int/lit8 v4, v4, 0x2

    goto :goto_2

    :cond_2
    sub-int v7, v4, p0

    if-le v7, v0, :cond_3

    if-lt v7, v5, :cond_3

    move v1, p0

    move v0, v7

    :cond_3
    add-int/lit8 p0, v4, 0x2

    goto :goto_1

    .line 282
    :cond_4
    new-instance p0, Lcom/tencent/cloud/ai/network/okio/e;

    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 283
    :cond_5
    :goto_3
    array-length v4, v2

    if-ge v3, v4, :cond_8

    const/16 v4, 0x3a

    if-ne v3, v1, :cond_6

    .line 284
    invoke-virtual {p0, v4}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    add-int/2addr v3, v0

    if-ne v3, v6, :cond_5

    .line 285
    invoke-virtual {p0, v4}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    goto :goto_3

    :cond_6
    if-lez v3, :cond_7

    .line 286
    invoke-virtual {p0, v4}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 287
    :cond_7
    aget-byte v4, v2, v3

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    add-int/lit8 v5, v3, 0x1

    aget-byte v5, v2, v5

    and-int/lit16 v5, v5, 0xff

    or-int/2addr v4, v5

    int-to-long v4, v4

    .line 288
    invoke-virtual {p0, v4, v5}, Lcom/tencent/cloud/ai/network/okio/e;->j(J)Lcom/tencent/cloud/ai/network/okio/e;

    add-int/lit8 v3, v3, 0x2

    goto :goto_3

    .line 289
    :cond_8
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->n()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 290
    :cond_9
    array-length v1, v2

    if-ne v1, v5, :cond_a

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 291
    :cond_a
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid IPv6 address: \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\'"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 292
    :cond_b
    :try_start_0
    invoke-static {p0}, Ljava/net/IDN;->toASCII(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 293
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_c

    return-object v2

    .line 294
    :cond_c
    :goto_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v3, v0, :cond_10

    .line 295
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v4, 0x1f

    if-le v0, v4, :cond_f

    const/16 v4, 0x7f

    if-lt v0, v4, :cond_d

    goto :goto_5

    :cond_d
    const-string v4, " #%/:?@[\\]"

    .line 296
    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    if-eq v0, v1, :cond_e

    goto :goto_5

    :cond_e
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_f
    :goto_5
    return-object v2

    :cond_10
    return-object p0

    :catch_0
    return-object v2
.end method

.method public static varargs a(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .line 297
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Ljava/lang/String;ZLjava/lang/Runnable;)Ljava/lang/Thread;
    .locals 1

    .line 260
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 261
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method

.method public static a(Ljava/lang/String;II)Ljava/net/InetAddress;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    const/16 v2, 0x10

    .line 6
    .line 7
    new-array v3, v2, [B

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    const/4 v5, -0x1

    .line 11
    move/from16 v6, p1

    .line 12
    .line 13
    move v7, v4

    .line 14
    move v8, v5

    .line 15
    move v9, v8

    .line 16
    :goto_0
    const/4 v10, 0x0

    .line 17
    if-ge v6, v1, :cond_16

    .line 18
    .line 19
    if-ne v7, v2, :cond_0

    .line 20
    .line 21
    return-object v10

    .line 22
    :cond_0
    add-int/lit8 v11, v6, 0x2

    .line 23
    .line 24
    const/16 v12, 0xff

    .line 25
    .line 26
    const/4 v13, 0x2

    .line 27
    if-gt v11, v1, :cond_3

    .line 28
    .line 29
    const-string v14, "::"

    .line 30
    .line 31
    invoke-virtual {v0, v6, v14, v4, v13}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    .line 32
    .line 33
    .line 34
    move-result v14

    .line 35
    if-eqz v14, :cond_3

    .line 36
    .line 37
    if-eq v8, v5, :cond_1

    .line 38
    .line 39
    return-object v10

    .line 40
    :cond_1
    add-int/lit8 v7, v7, 0x2

    .line 41
    .line 42
    move v8, v7

    .line 43
    move-object/from16 p1, v10

    .line 44
    .line 45
    if-ne v11, v1, :cond_2

    .line 46
    .line 47
    goto/16 :goto_a

    .line 48
    .line 49
    :cond_2
    move v9, v11

    .line 50
    goto/16 :goto_6

    .line 51
    .line 52
    :cond_3
    if-eqz v7, :cond_11

    .line 53
    .line 54
    const-string v11, ":"

    .line 55
    .line 56
    const/4 v14, 0x1

    .line 57
    invoke-virtual {v0, v6, v11, v4, v14}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    .line 58
    .line 59
    .line 60
    move-result v11

    .line 61
    if-eqz v11, :cond_4

    .line 62
    .line 63
    add-int/lit8 v6, v6, 0x1

    .line 64
    .line 65
    move v9, v6

    .line 66
    move-object/from16 p1, v10

    .line 67
    .line 68
    goto/16 :goto_6

    .line 69
    .line 70
    :cond_4
    const-string v11, "."

    .line 71
    .line 72
    invoke-virtual {v0, v6, v11, v4, v14}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-eqz v6, :cond_10

    .line 77
    .line 78
    add-int/lit8 v6, v7, -0x2

    .line 79
    .line 80
    move v11, v6

    .line 81
    :goto_1
    if-ge v9, v1, :cond_e

    .line 82
    .line 83
    if-ne v11, v2, :cond_5

    .line 84
    .line 85
    :goto_2
    move-object/from16 p1, v10

    .line 86
    .line 87
    goto :goto_5

    .line 88
    :cond_5
    if-eq v11, v6, :cond_7

    .line 89
    .line 90
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    .line 91
    .line 92
    .line 93
    move-result v13

    .line 94
    const/16 v14, 0x2e

    .line 95
    .line 96
    if-eq v13, v14, :cond_6

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_6
    add-int/lit8 v9, v9, 0x1

    .line 100
    .line 101
    :cond_7
    move v14, v4

    .line 102
    move v13, v9

    .line 103
    :goto_3
    if-ge v13, v1, :cond_b

    .line 104
    .line 105
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    .line 106
    .line 107
    .line 108
    move-result v15

    .line 109
    move-object/from16 p1, v10

    .line 110
    .line 111
    const/16 v10, 0x30

    .line 112
    .line 113
    if-lt v15, v10, :cond_c

    .line 114
    .line 115
    move/from16 v16, v10

    .line 116
    .line 117
    const/16 v10, 0x39

    .line 118
    .line 119
    if-le v15, v10, :cond_8

    .line 120
    .line 121
    goto :goto_4

    .line 122
    :cond_8
    if-nez v14, :cond_9

    .line 123
    .line 124
    if-eq v9, v13, :cond_9

    .line 125
    .line 126
    goto :goto_5

    .line 127
    :cond_9
    mul-int/lit8 v14, v14, 0xa

    .line 128
    .line 129
    add-int/2addr v14, v15

    .line 130
    add-int/lit8 v14, v14, -0x30

    .line 131
    .line 132
    if-le v14, v12, :cond_a

    .line 133
    .line 134
    goto :goto_5

    .line 135
    :cond_a
    add-int/lit8 v13, v13, 0x1

    .line 136
    .line 137
    move-object/from16 v10, p1

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_b
    move-object/from16 p1, v10

    .line 141
    .line 142
    :cond_c
    :goto_4
    sub-int v9, v13, v9

    .line 143
    .line 144
    if-nez v9, :cond_d

    .line 145
    .line 146
    goto :goto_5

    .line 147
    :cond_d
    add-int/lit8 v9, v11, 0x1

    .line 148
    .line 149
    int-to-byte v10, v14

    .line 150
    aput-byte v10, v3, v11

    .line 151
    .line 152
    move-object/from16 v10, p1

    .line 153
    .line 154
    move v11, v9

    .line 155
    move v9, v13

    .line 156
    goto :goto_1

    .line 157
    :cond_e
    move-object/from16 p1, v10

    .line 158
    .line 159
    add-int/lit8 v0, v7, 0x2

    .line 160
    .line 161
    if-eq v11, v0, :cond_f

    .line 162
    .line 163
    :goto_5
    return-object p1

    .line 164
    :cond_f
    add-int/lit8 v7, v7, 0x2

    .line 165
    .line 166
    goto :goto_a

    .line 167
    :cond_10
    move-object/from16 p1, v10

    .line 168
    .line 169
    return-object p1

    .line 170
    :cond_11
    move-object/from16 p1, v10

    .line 171
    .line 172
    move v9, v6

    .line 173
    :goto_6
    move v10, v4

    .line 174
    move v6, v9

    .line 175
    :goto_7
    if-ge v6, v1, :cond_13

    .line 176
    .line 177
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    .line 178
    .line 179
    .line 180
    move-result v11

    .line 181
    invoke-static {v11}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(C)I

    .line 182
    .line 183
    .line 184
    move-result v11

    .line 185
    if-ne v11, v5, :cond_12

    .line 186
    .line 187
    goto :goto_8

    .line 188
    :cond_12
    shl-int/lit8 v10, v10, 0x4

    .line 189
    .line 190
    add-int/2addr v10, v11

    .line 191
    add-int/lit8 v6, v6, 0x1

    .line 192
    .line 193
    goto :goto_7

    .line 194
    :cond_13
    :goto_8
    sub-int v11, v6, v9

    .line 195
    .line 196
    if-eqz v11, :cond_15

    .line 197
    .line 198
    const/4 v14, 0x4

    .line 199
    if-le v11, v14, :cond_14

    .line 200
    .line 201
    goto :goto_9

    .line 202
    :cond_14
    add-int/lit8 v11, v7, 0x1

    .line 203
    .line 204
    ushr-int/lit8 v14, v10, 0x8

    .line 205
    .line 206
    and-int/2addr v12, v14

    .line 207
    int-to-byte v12, v12

    .line 208
    aput-byte v12, v3, v7

    .line 209
    .line 210
    add-int/2addr v7, v13

    .line 211
    and-int/lit16 v10, v10, 0xff

    .line 212
    .line 213
    int-to-byte v10, v10

    .line 214
    aput-byte v10, v3, v11

    .line 215
    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :cond_15
    :goto_9
    return-object p1

    .line 219
    :cond_16
    move-object/from16 p1, v10

    .line 220
    .line 221
    :goto_a
    if-eq v7, v2, :cond_18

    .line 222
    .line 223
    if-ne v8, v5, :cond_17

    .line 224
    .line 225
    return-object p1

    .line 226
    :cond_17
    sub-int v0, v7, v8

    .line 227
    .line 228
    rsub-int/lit8 v1, v0, 0x10

    .line 229
    .line 230
    invoke-static {v3, v8, v3, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 231
    .line 232
    .line 233
    sub-int/2addr v2, v7

    .line 234
    add-int/2addr v2, v8

    .line 235
    invoke-static {v3, v8, v2, v4}, Ljava/util/Arrays;->fill([BIIB)V

    .line 236
    .line 237
    .line 238
    :cond_18
    :try_start_0
    invoke-static {v3}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    .line 239
    .line 240
    .line 241
    move-result-object v0
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    .line 242
    return-object v0

    .line 243
    :catch_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 244
    .line 245
    .line 246
    return-object p1
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okio/g;Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;
    .locals 1

    .line 298
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->e:Lcom/tencent/cloud/ai/network/okio/p;

    invoke-interface {p0, v0}, Lcom/tencent/cloud/ai/network/okio/g;->a(Lcom/tencent/cloud/ai/network/okio/p;)I

    move-result p0

    const/4 v0, -0x1

    if-eq p0, v0, :cond_5

    if-eqz p0, :cond_4

    const/4 p1, 0x1

    if-eq p0, p1, :cond_3

    const/4 p1, 0x2

    if-eq p0, p1, :cond_2

    const/4 p1, 0x3

    if-eq p0, p1, :cond_1

    const/4 p1, 0x4

    if-ne p0, p1, :cond_0

    .line 299
    sget-object p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->g:Ljava/nio/charset/Charset;

    return-object p0

    .line 300
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    const/4 p0, 0x0

    return-object p0

    .line 301
    :cond_1
    sget-object p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->f:Ljava/nio/charset/Charset;

    return-object p0

    .line 302
    :cond_2
    sget-object p0, Ljava/nio/charset/StandardCharsets;->UTF_16LE:Ljava/nio/charset/Charset;

    return-object p0

    .line 303
    :cond_3
    sget-object p0, Ljava/nio/charset/StandardCharsets;->UTF_16BE:Ljava/nio/charset/Charset;

    return-object p0

    .line 304
    :cond_4
    sget-object p0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    return-object p0

    :cond_5
    return-object p1
.end method

.method public static a(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 254
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static varargs a([Ljava/lang/Object;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .line 258
    invoke-virtual {p0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/util/Map;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;TV;>;)",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    .line 255
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 256
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    return-object p0

    .line 257
    :cond_0
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, p0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;
    .locals 1

    .line 259
    new-instance v0, Ll/awq0;

    invoke-direct {v0, p0, p1}, Ll/awq0;-><init>(Ljava/lang/String;Z)V

    return-object v0
.end method

.method public static a()Ljavax/net/ssl/X509TrustManager;
    .locals 4

    .line 330
    const-string v0, "Unexpected default trust managers:"

    :try_start_0
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v1

    .line 331
    invoke-static {v1}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v1

    const/4 v2, 0x0

    .line 332
    invoke-virtual {v1, v2}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 333
    invoke-virtual {v1}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v1

    .line 334
    array-length v2, v1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    const/4 v2, 0x0

    aget-object v2, v1, v2

    instance-of v3, v2, Ljavax/net/ssl/X509TrustManager;

    if-eqz v3, :cond_0

    .line 335
    check-cast v2, Ljavax/net/ssl/X509TrustManager;

    return-object v2

    .line 336
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 337
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    .line 338
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "No System TLS"

    invoke-direct {v1, v2, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static a(JJJ)V
    .locals 4

    or-long v0, p2, p4

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    cmp-long v0, p2, p0

    if-gtz v0, :cond_0

    sub-long/2addr p0, p2

    cmp-long p0, p0, p4

    if-ltz p0, :cond_0

    return-void

    .line 247
    :cond_0
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {p0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw p0
.end method

.method public static a(Ljava/io/Closeable;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 248
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void

    :catch_1
    move-exception p0

    .line 249
    throw p0

    :cond_0
    return-void
.end method

.method public static a(Ljava/net/Socket;)V
    .locals 1

    if-eqz p0, :cond_1

    .line 250
    :try_start_0
    invoke-virtual {p0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    return-void

    :catch_0
    move-exception p0

    .line 251
    throw p0

    :catch_1
    move-exception p0

    .line 252
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/AssertionError;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    throw p0

    :catch_2
    :cond_1
    :goto_0
    return-void
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okhttp3/p;Lcom/tencent/cloud/ai/network/okhttp3/p;)Z
    .locals 2

    .line 321
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 322
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 323
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 324
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    .line 325
    iget v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    if-ne v0, v1, :cond_0

    .line 326
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 327
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 328
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okio/w;ILjava/util/concurrent/TimeUnit;)Z
    .locals 0

    .line 253
    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->b(Lcom/tencent/cloud/ai/network/okio/w;ILjava/util/concurrent/TimeUnit;)Z

    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method

.method public static a(Ljava/lang/AssertionError;)Z
    .locals 1

    .line 268
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 269
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    const-string v0, "getsockname failed"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static a(Ljava/util/Comparator;[Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 262
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 263
    array-length v1, p1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, p1, v3

    .line 264
    array-length v5, p2

    move v6, v2

    :goto_1
    if-ge v6, v5, :cond_1

    aget-object v7, p2, v6

    .line 265
    invoke-interface {p0, v4, v7}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v7

    if-nez v7, :cond_0

    .line 266
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 267
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array p0, p0, [Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0
.end method

.method public static b(Ljava/lang/String;)I
    .locals 4

    .line 141
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 142
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x1f

    if-le v2, v3, :cond_1

    const/16 v3, 0x7f

    if-lt v2, v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v1

    :cond_2
    const/4 p0, -0x1

    return p0
.end method

.method public static b(Ljava/lang/String;II)I
    .locals 2

    :goto_0
    if-ge p1, p2, :cond_1

    .line 140
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    const/16 v1, 0xc

    if-eq v0, v1, :cond_0

    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_0

    return p1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    return p2
.end method

.method public static b(Ljava/util/List;)Lcom/tencent/cloud/ai/network/okhttp3/o;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;",
            ">;)",
            "Lcom/tencent/cloud/ai/network/okhttp3/o;"
        }
    .end annotation

    .line 143
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/o$a;-><init>()V

    .line 144
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 145
    sget-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    iget-object v3, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->a:Lcom/tencent/cloud/ai/network/okio/ByteString;

    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v3

    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v3, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/o$a;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 146
    :cond_0
    new-instance p0, Lcom/tencent/cloud/ai/network/okhttp3/o;

    invoke-direct {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/o;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/o$a;)V

    return-object p0
.end method

.method public static b(Lcom/tencent/cloud/ai/network/okio/w;ILjava/util/concurrent/TimeUnit;)Z
    .locals 11

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okio/x;->d()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const-wide v3, 0x7fffffffffffffffL

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okio/x;->c()J

    .line 25
    .line 26
    .line 27
    move-result-wide v5

    .line 28
    sub-long/2addr v5, v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move-wide v5, v3

    .line 31
    :goto_0
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    int-to-long v7, p1

    .line 36
    invoke-virtual {p2, v7, v8}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 37
    .line 38
    .line 39
    move-result-wide p1

    .line 40
    invoke-static {v5, v6, p1, p2}, Ljava/lang/Math;->min(JJ)J

    .line 41
    .line 42
    .line 43
    move-result-wide p1

    .line 44
    add-long/2addr p1, v0

    .line 45
    invoke-virtual {v2, p1, p2}, Lcom/tencent/cloud/ai/network/okio/x;->a(J)Lcom/tencent/cloud/ai/network/okio/x;

    .line 46
    .line 47
    .line 48
    :try_start_0
    new-instance p1, Lcom/tencent/cloud/ai/network/okio/e;

    .line 49
    .line 50
    invoke-direct {p1}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 51
    .line 52
    .line 53
    :goto_1
    const-wide/16 v7, 0x2000

    .line 54
    .line 55
    invoke-interface {p0, p1, v7, v8}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 56
    .line 57
    .line 58
    move-result-wide v7

    .line 59
    const-wide/16 v9, -0x1

    .line 60
    .line 61
    cmp-long p2, v7, v9

    .line 62
    .line 63
    if-eqz p2, :cond_1

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/e;->k()V
    :try_end_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :catchall_0
    move-exception p1

    .line 70
    goto :goto_2

    .line 71
    :cond_1
    cmp-long p1, v5, v3

    .line 72
    .line 73
    const/4 p2, 0x1

    .line 74
    if-nez p1, :cond_2

    .line 75
    .line 76
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->a()Lcom/tencent/cloud/ai/network/okio/x;

    .line 81
    .line 82
    .line 83
    return p2

    .line 84
    :cond_2
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    add-long/2addr v0, v5

    .line 89
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/x;->a(J)Lcom/tencent/cloud/ai/network/okio/x;

    .line 90
    .line 91
    .line 92
    return p2

    .line 93
    :goto_2
    cmp-long p2, v5, v3

    .line 94
    .line 95
    if-nez p2, :cond_3

    .line 96
    .line 97
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->a()Lcom/tencent/cloud/ai/network/okio/x;

    .line 102
    .line 103
    .line 104
    goto :goto_3

    .line 105
    :cond_3
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    add-long/2addr v0, v5

    .line 110
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/x;->a(J)Lcom/tencent/cloud/ai/network/okio/x;

    .line 111
    .line 112
    .line 113
    :goto_3
    throw p1

    .line 114
    :catch_0
    cmp-long p1, v5, v3

    .line 115
    .line 116
    if-nez p1, :cond_4

    .line 117
    .line 118
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->a()Lcom/tencent/cloud/ai/network/okio/x;

    .line 123
    .line 124
    .line 125
    goto :goto_4

    .line 126
    :cond_4
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    add-long/2addr v0, v5

    .line 131
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/x;->a(J)Lcom/tencent/cloud/ai/network/okio/x;

    .line 132
    .line 133
    .line 134
    :goto_4
    const/4 p0, 0x0

    .line 135
    return p0
.end method

.method public static b(Ljava/util/Comparator;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    if-eqz p2, :cond_3

    .line 136
    array-length v1, p1

    if-eqz v1, :cond_3

    array-length v1, p2

    if-nez v1, :cond_0

    goto :goto_2

    .line 137
    :cond_0
    array-length v1, p1

    move v2, v0

    :goto_0
    if-ge v2, v1, :cond_3

    aget-object v3, p1, v2

    .line 138
    array-length v4, p2

    move v5, v0

    :goto_1
    if-ge v5, v4, :cond_2

    aget-object v6, p2, v5

    .line 139
    invoke-interface {p0, v3, v6}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v6

    if-nez v6, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_2
    return v0
.end method

.method public static c(Ljava/lang/String;II)I
    .locals 2

    .line 1
    add-int/lit8 p2, p2, -0x1

    .line 2
    .line 3
    :goto_0
    if-lt p2, p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Ljava/lang/String;->charAt(I)C

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x9

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
    const/16 v1, 0xc

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    const/16 v1, 0xd

    .line 22
    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    const/16 v1, 0x20

    .line 26
    .line 27
    if-eq v0, v1, :cond_0

    .line 28
    .line 29
    add-int/lit8 p2, p2, 0x1

    .line 30
    .line 31
    return p2

    .line 32
    :cond_0
    add-int/lit8 p2, p2, -0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return p1
.end method

.method public static d(Ljava/lang/String;II)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->b(Ljava/lang/String;II)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->c(Ljava/lang/String;II)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
