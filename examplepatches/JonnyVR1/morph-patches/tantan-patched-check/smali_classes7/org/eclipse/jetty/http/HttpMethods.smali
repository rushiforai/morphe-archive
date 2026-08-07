.class public Lorg/eclipse/jetty/http/HttpMethods;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CACHE:Lorg/eclipse/jetty/io/BufferCache;

.field public static final CONNECT:Ljava/lang/String; = "CONNECT"

.field public static final CONNECT_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final CONNECT_ORDINAL:I = 0x8

.field public static final DELETE:Ljava/lang/String; = "DELETE"

.field public static final DELETE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final DELETE_ORDINAL:I = 0x6

.field public static final GET:Ljava/lang/String; = "GET"

.field public static final GET_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final GET_ORDINAL:I = 0x1

.field public static final HEAD:Ljava/lang/String; = "HEAD"

.field public static final HEAD_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final HEAD_ORDINAL:I = 0x3

.field public static final MOVE:Ljava/lang/String; = "MOVE"

.field public static final MOVE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final MOVE_ORDINAL:I = 0x9

.field public static final OPTIONS:Ljava/lang/String; = "OPTIONS"

.field public static final OPTIONS_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final OPTIONS_ORDINAL:I = 0x5

.field public static final POST:Ljava/lang/String; = "POST"

.field public static final POST_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final POST_ORDINAL:I = 0x2

.field public static final PUT:Ljava/lang/String; = "PUT"

.field public static final PUT_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final PUT_ORDINAL:I = 0x4

.field public static final TRACE:Ljava/lang/String; = "TRACE"

.field public static final TRACE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final TRACE_ORDINAL:I = 0x7


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lorg/eclipse/jetty/io/BufferCache;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/eclipse/jetty/io/BufferCache;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lorg/eclipse/jetty/http/HttpMethods;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    .line 7
    .line 8
    const-string v1, "GET"

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
    sput-object v1, Lorg/eclipse/jetty/http/HttpMethods;->GET_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 16
    .line 17
    const-string v1, "POST"

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
    sput-object v1, Lorg/eclipse/jetty/http/HttpMethods;->POST_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 25
    .line 26
    const-string v1, "HEAD"

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
    sput-object v1, Lorg/eclipse/jetty/http/HttpMethods;->HEAD_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 34
    .line 35
    const-string v1, "PUT"

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
    sput-object v1, Lorg/eclipse/jetty/http/HttpMethods;->PUT_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 43
    .line 44
    const-string v1, "OPTIONS"

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
    sput-object v1, Lorg/eclipse/jetty/http/HttpMethods;->OPTIONS_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 52
    .line 53
    const-string v1, "DELETE"

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
    sput-object v1, Lorg/eclipse/jetty/http/HttpMethods;->DELETE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 61
    .line 62
    const-string v1, "TRACE"

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
    sput-object v1, Lorg/eclipse/jetty/http/HttpMethods;->TRACE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 70
    .line 71
    const-string v1, "CONNECT"

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
    sput-object v1, Lorg/eclipse/jetty/http/HttpMethods;->CONNECT_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 80
    .line 81
    const-string v1, "MOVE"

    .line 82
    .line 83
    const/16 v2, 0x9

    .line 84
    .line 85
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sput-object v0, Lorg/eclipse/jetty/http/HttpMethods;->MOVE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 90
    .line 91
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
