.class public final Lnicoid/network238/okio/-DeprecatedOkio;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u0005H\u0007J\u0010\u0010\u0008\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rH\u0007J\u0010\u0010\n\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007J\u0010\u0010\n\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u000fH\u0007J)\u0010\n\u001a\u00020\u00052\u0006\u0010\u0010\u001a\u00020\u00112\u0012\u0010\u0012\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00140\u0013\"\u00020\u0014H\u0007\u00a2\u0006\u0002\u0010\u0015J\u0010\u0010\n\u001a\u00020\u00052\u0006\u0010\u0016\u001a\u00020\u0017H\u0007J\u0010\u0010\u000c\u001a\u00020\r2\u0006\u0010\u0006\u001a\u00020\u0007H\u0007J\u0010\u0010\u000c\u001a\u00020\r2\u0006\u0010\u0018\u001a\u00020\u0019H\u0007J)\u0010\u000c\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u00112\u0012\u0010\u0012\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00140\u0013\"\u00020\u0014H\u0007\u00a2\u0006\u0002\u0010\u001aJ\u0010\u0010\u000c\u001a\u00020\r2\u0006\u0010\u0016\u001a\u00020\u0017H\u0007J\u0008\u0010\u001b\u001a\u00020\u0005H\u0007\u00a8\u0006\u001c"
    }
    d2 = {
        "Lnicoid/network238/okio/-DeprecatedOkio;",
        "",
        "<init>",
        "()V",
        "appendingSink",
        "Lnicoid/network238/okio/Sink;",
        "file",
        "Ljava/io/File;",
        "buffer",
        "Lnicoid/network238/okio/BufferedSink;",
        "sink",
        "Lnicoid/network238/okio/BufferedSource;",
        "source",
        "Lnicoid/network238/okio/Source;",
        "outputStream",
        "Ljava/io/OutputStream;",
        "path",
        "Ljava/nio/file/Path;",
        "options",
        "",
        "Ljava/nio/file/OpenOption;",
        "(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Lnicoid/network238/okio/Sink;",
        "socket",
        "Ljava/net/Socket;",
        "inputStream",
        "Ljava/io/InputStream;",
        "(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Lnicoid/network238/okio/Source;",
        "blackhole",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lnicoid/network238/okio/-DeprecatedOkio;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okio/-DeprecatedOkio;

    invoke-direct {v0}, Lnicoid/network238/okio/-DeprecatedOkio;-><init>()V

    sput-object v0, Lnicoid/network238/okio/-DeprecatedOkio;->INSTANCE:Lnicoid/network238/okio/-DeprecatedOkio;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final appendingSink(Ljava/io/File;)Lnicoid/network238/okio/Sink;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->appendingSink(Ljava/io/File;)Lnicoid/network238/okio/Sink;

    move-result-object p1

    return-object p1
.end method

.method public final blackhole()Lnicoid/network238/okio/Sink;
    .registers 2

    .line 146
    invoke-static {}, Lnicoid/network238/okio/Okio;->blackhole()Lnicoid/network238/okio/Sink;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1
.end method

.method public final buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object p1

    return-object p1
.end method

.method public final sink(Ljava/io/File;)Lnicoid/network238/okio/Sink;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v2}, Lnicoid/network238/okio/Okio;->sink$default(Ljava/io/File;ZILjava/lang/Object;)Lnicoid/network238/okio/Sink;

    move-result-object p1

    return-object p1
.end method

.method public final sink(Ljava/io/OutputStream;)Lnicoid/network238/okio/Sink;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 76
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->sink(Ljava/io/OutputStream;)Lnicoid/network238/okio/Sink;

    move-result-object p1

    return-object p1
.end method

.method public final sink(Ljava/net/Socket;)Lnicoid/network238/okio/Sink;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->sink(Ljava/net/Socket;)Lnicoid/network238/okio/Sink;

    move-result-object p1

    return-object p1
.end method

.method public final varargs sink(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Lnicoid/network238/okio/Sink;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 86
    array-length v0, p2

    invoke-static {p2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/nio/file/OpenOption;

    invoke-static {p1, p2}, Lnicoid/network238/okio/Okio;->sink(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Lnicoid/network238/okio/Sink;

    move-result-object p1

    return-object p1
.end method

.method public final source(Ljava/io/File;)Lnicoid/network238/okio/Source;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 106
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->source(Ljava/io/File;)Lnicoid/network238/okio/Source;

    move-result-object p1

    return-object p1
.end method

.method public final source(Ljava/io/InputStream;)Lnicoid/network238/okio/Source;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 116
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->source(Ljava/io/InputStream;)Lnicoid/network238/okio/Source;

    move-result-object p1

    return-object p1
.end method

.method public final source(Ljava/net/Socket;)Lnicoid/network238/okio/Source;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 136
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->source(Ljava/net/Socket;)Lnicoid/network238/okio/Source;

    move-result-object p1

    return-object p1
.end method

.method public final varargs source(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Lnicoid/network238/okio/Source;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 126
    array-length v0, p2

    invoke-static {p2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/nio/file/OpenOption;

    invoke-static {p1, p2}, Lnicoid/network238/okio/Okio;->source(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Lnicoid/network238/okio/Source;

    move-result-object p1

    return-object p1
.end method
