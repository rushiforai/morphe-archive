.class public Lorg/eclipse/jetty/http/HttpHeaderValues;
.super Lorg/eclipse/jetty/io/BufferCache;
.source "SourceFile"


# static fields
.field public static final BYTES:Ljava/lang/String; = "bytes"

.field public static final BYTES_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final BYTES_ORDINAL:I = 0x9

.field public static final CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

.field public static final CHUNKED:Ljava/lang/String; = "chunked"

.field public static final CHUNKED_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final CHUNKED_ORDINAL:I = 0x2

.field public static final CLOSE:Ljava/lang/String; = "close"

.field public static final CLOSE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final CLOSE_ORDINAL:I = 0x1

.field public static final CONTINUE:Ljava/lang/String; = "100-continue"

.field public static final CONTINUE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final CONTINUE_ORDINAL:I = 0x6

.field public static final GZIP:Ljava/lang/String; = "gzip"

.field public static final GZIP_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final GZIP_ORDINAL:I = 0x3

.field public static final IDENTITY:Ljava/lang/String; = "identity"

.field public static final IDENTITY_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final IDENTITY_ORDINAL:I = 0x4

.field public static final KEEP_ALIVE:Ljava/lang/String; = "keep-alive"

.field public static final KEEP_ALIVE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final KEEP_ALIVE_ORDINAL:I = 0x5

.field public static final NO_CACHE:Ljava/lang/String; = "no-cache"

.field public static final NO_CACHE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final NO_CACHE_ORDINAL:I = 0xa

.field public static final PROCESSING:Ljava/lang/String; = "102-processing"

.field public static final PROCESSING_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final PROCESSING_ORDINAL:I = 0x7

.field public static final TE:Ljava/lang/String; = "TE"

.field public static final TE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final TE_ORDINAL:I = 0x8

.field public static final UPGRADE:Ljava/lang/String; = "Upgrade"

.field public static final UPGRADE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final UPGRADE_ORDINAL:I = 0xb


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lorg/eclipse/jetty/http/HttpHeaderValues;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/eclipse/jetty/http/HttpHeaderValues;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    .line 7
    .line 8
    const-string v1, "close"

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sput-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->CLOSE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 16
    .line 17
    const-string v1, "chunked"

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sput-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->CHUNKED_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 25
    .line 26
    const-string v1, "gzip"

    .line 27
    .line 28
    const/4 v2, 0x3

    .line 29
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sput-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->GZIP_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 34
    .line 35
    const-string v1, "identity"

    .line 36
    .line 37
    const/4 v2, 0x4

    .line 38
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sput-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->IDENTITY_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 43
    .line 44
    const-string v1, "keep-alive"

    .line 45
    .line 46
    const/4 v2, 0x5

    .line 47
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    sput-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->KEEP_ALIVE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 52
    .line 53
    const-string v1, "100-continue"

    .line 54
    .line 55
    const/4 v2, 0x6

    .line 56
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    sput-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->CONTINUE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 61
    .line 62
    const-string v1, "102-processing"

    .line 63
    .line 64
    const/4 v2, 0x7

    .line 65
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    sput-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->PROCESSING_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 70
    .line 71
    const-string v1, "TE"

    .line 72
    .line 73
    const/16 v2, 0x8

    .line 74
    .line 75
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    sput-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->TE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 80
    .line 81
    const-string v1, "bytes"

    .line 82
    .line 83
    const/16 v2, 0x9

    .line 84
    .line 85
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    sput-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->BYTES_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 90
    .line 91
    const-string v1, "no-cache"

    .line 92
    .line 93
    const/16 v2, 0xa

    .line 94
    .line 95
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    sput-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->NO_CACHE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 100
    .line 101
    const-string v1, "Upgrade"

    .line 102
    .line 103
    const/16 v2, 0xb

    .line 104
    .line 105
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    sput-object v0, Lorg/eclipse/jetty/http/HttpHeaderValues;->UPGRADE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 110
    .line 111
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/io/BufferCache;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static hasKnownValues(I)Z
    .locals 2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/4 v1, 0x5

    if-eq p0, v1, :cond_0

    const/16 v1, 0xa

    if-eq p0, v1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    return v0
.end method
