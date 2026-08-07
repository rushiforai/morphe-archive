.class public Lorg/eclipse/jetty/http/HttpVersions;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CACHE:Lorg/eclipse/jetty/io/BufferCache;

.field public static final HTTP_0_9:Ljava/lang/String; = ""

.field public static final HTTP_0_9_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final HTTP_0_9_ORDINAL:I = 0x9

.field public static final HTTP_1_0:Ljava/lang/String; = "HTTP/1.0"

.field public static final HTTP_1_0_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final HTTP_1_0_ORDINAL:I = 0xa

.field public static final HTTP_1_1:Ljava/lang/String; = "HTTP/1.1"

.field public static final HTTP_1_1_BUFFER:Lorg/eclipse/jetty/io/Buffer;

.field public static final HTTP_1_1_ORDINAL:I = 0xb


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
    sput-object v0, Lorg/eclipse/jetty/http/HttpVersions;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    const/16 v2, 0x9

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sput-object v1, Lorg/eclipse/jetty/http/HttpVersions;->HTTP_0_9_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 17
    .line 18
    const-string v1, "HTTP/1.0"

    .line 19
    .line 20
    const/16 v2, 0xa

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sput-object v1, Lorg/eclipse/jetty/http/HttpVersions;->HTTP_1_0_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 27
    .line 28
    const-string v1, "HTTP/1.1"

    .line 29
    .line 30
    const/16 v2, 0xb

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/BufferCache;->add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Lorg/eclipse/jetty/http/HttpVersions;->HTTP_1_1_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 37
    .line 38
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
